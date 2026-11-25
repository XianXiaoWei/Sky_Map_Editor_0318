import type { ResourceManifestEntry } from './resource-manifest';

export interface ResourceConstructor extends Record<string, unknown> { class: string; name: string; }
export interface ResourceAccessor<R> {
  get(resource: R): unknown;
  set(resource: R, value: unknown): void;
  array?: {
    allocate(resource: R, count: number): void;
    length(resource: R): number;
    setElement(resource: R, index: number, value: unknown): void;
  };
}
/** These are the original reflected/native dependencies, not fake loaders.
 * In particular GetResource need not find a resource still on the load list. */
export interface ResourceScriptServices<R, A> {
  getResource(className: string, name: string): R | null;
  create(className: string, allocator: A): R;
  accessor(resource: R, name: string): ResourceAccessor<R> | undefined;
  incLoadCount(resource: R): void;
  decLoadCount(resource: R): void;
  getLoadCount(resource: R): number;
  addToLoadList(resource: R): void;
  addToUnloadList(resource: R): void;
}
export interface ResourceLocaleConstructor { locale?: string; parameters: Record<string, unknown>; }

/** Lua 5.1 ~= on the supported scalar/table projection: tables compare by
 * identity, not their contents. Native userdata/metamethod equality must be
 * provided separately when those reflected values are restored. */
export function resourceLuaEqual(left: unknown, right: unknown): boolean {
  return left === right || left == null && right == null;
}

/** Embedded resource DSL at 0x100adb9c0..0x100ae089a. This class implements
 * constructor aggregation, reference identity, configured-field assignment,
 * load counting and unload queueing; Lua execution, metadata, allocators and
 * resource virtual loaders remain separate services. pairs() field ordering
 * is deliberately not part of the API contract. */
export class ResourceScriptRuntime {
  readonly definitions = new Map<string, ResourceConstructor>();
  readonly resources: ResourceConstructor[] = [];
  errorCode = 0;
  ignoreResourceRefs = false;
  locale?: string;
  filter: (constructor: ResourceConstructor) => boolean = () => true;
  warning: (message: string) => void = () => {};

  clearResources(): void { this.resources.length = 0; }

  register(className: string, name: string, isDefinition: boolean, constructors: readonly ResourceLocaleConstructor[]): void {
    for (let i = 0; i < constructors.length; i++) {
      const { locale, parameters } = constructors[i];
      if (locale === undefined && i !== constructors.length - 1) throw new Error('Default constructor table must be the final argument.');
      if (locale === undefined || this.locale === undefined || this.locale === locale) {
        // The original mutates the caller's table and appends the SAME table.
        const cons = parameters as ResourceConstructor;
        cons.class = className; cons.name = name;
        if (isDefinition) this.definitions.set(className + '_' + name, cons);
        else if (this.filter(cons)) this.resources.push(cons);
        if (locale === undefined || this.locale === locale) break;
      }
    }
  }

  reference(className: string, name: string): void {
    if (this.ignoreResourceRefs) return;
    const cons = this.definitions.get(className + '_' + name);
    if (!cons) {
      this.warning(`resourceref warning: Unable to find resource definition for ${className} "${name}"`);
      this.errorCode = 1;
    } else if (this.filter(cons)) this.resources.push(cons);
  }

  /** Only fully read literal declarations may be applied; unresolved Lua
   * expressions cannot silently produce partially configured resources. */
  apply(entries: readonly ResourceManifestEntry[]): void {
    for (const entry of entries) {
      if (entry.unresolvedFields.length) throw new Error(`${entry.type} ${entry.name}:${entry.line}: unresolved Lua fields ${entry.unresolvedFields.join(', ')}`);
      if (entry.directive === 'resourceref') this.reference(entry.type, entry.name);
      else this.register(entry.type, entry.name, entry.directive === 'resourcedef', [{ parameters: entry.parameters }]);
    }
  }

  setConstructorVars<R, A>(resource: R, cons: ResourceConstructor, services: ResourceScriptServices<R, A>): void {
    for (const [name, value] of Object.entries(cons)) {
      const accessor = services.accessor(resource, name);
      if (!accessor) continue;
      if (!accessor.array) accessor.set(resource, value);
      else {
        if (!Array.isArray(value)) throw new Error(`${cons.class}.${name}: array field requires a literal sequence table`);
        accessor.array.allocate(resource, value.length);
        if (accessor.array.length(resource) !== value.length) throw new Error('varAccessor.__len( res ) == count');
        value.forEach((element, index) => accessor.array!.setElement(resource, index, element));
      }
    }
  }

  queueForLoad<R, A>(allocator: A, services: ResourceScriptServices<R, A>, equal = resourceLuaEqual): void {
    for (const cons of this.resources) {
      let resource = services.getResource(cons.class, cons.name);
      if (resource !== null) {
        for (const [name, value] of Object.entries(cons)) {
          const accessor = services.accessor(resource, name);
          if (accessor && !equal(accessor.get(resource), value)) {
            this.errorCode = 1;
            throw new Error(`Resource of type ${cons.class} named '${cons.name}' already loaded, but with a different configuration`);
          }
        }
        services.incLoadCount(resource);
      } else {
        resource = services.create(cons.class, allocator);
        this.setConstructorVars(resource, cons, services);
        const heap = services.accessor(resource, 'heap');
        if (!heap) throw new Error(`${cons.class}: missing reflected heap accessor`);
        heap.set(resource, allocator);
        services.addToLoadList(resource);
        services.incLoadCount(resource);
      }
    }
  }

  queueForUnload<R, A>(services: ResourceScriptServices<R, A>): void {
    for (const cons of this.resources) {
      const resource = services.getResource(cons.class, cons.name);
      if (resource === null) continue;
      services.decLoadCount(resource);
      if (services.getLoadCount(resource) === 0) services.addToUnloadList(resource);
    }
  }
}
