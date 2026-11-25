import { ResourceScriptRuntime, type ResourceConstructor, type ResourceScriptServices } from '../src/core/resource-script-runtime';
export interface ResourceScriptCase {
  name: string; locale: string | null; definition: boolean; references: number; filter: boolean;
  ignoreRefs: boolean; array: boolean; publish: boolean; loads: number; unloads: number; changeSource: boolean;
}
export function resourceScriptCases(): ResourceScriptCase[] {
  const cases: ResourceScriptCase[] = [];
  const add = (name: string, changes: Partial<ResourceScriptCase>) => cases.push({ name, locale: 'en', definition: true,
    references: 2, filter: true, ignoreRefs: false, array: false, publish: true, loads: 2, unloads: 2, changeSource: false, ...changes });
  for (const locale of [null, 'en', 'fr', 'unknown']) for (const definition of [false, true]) for (const filter of [false, true]) for (const ignoreRefs of [false, true])
    add(`declarations-${locale}-${definition}-${filter}-${ignoreRefs}`, { locale, definition, filter, ignoreRefs });
  for (const array of [false, true]) for (const publish of [false, true]) for (const references of [1, 2, 4]) for (const changeSource of [false, true])
    add(`queue-${array}-${publish}-${references}-${changeSource}`, { array, publish, references, changeSource, unloads: 5 });
  add('definition-not-reference', { references: 0 });
  return cases;
}
interface TestResource { id: number; fields: Record<string, unknown>; sources: unknown[]; heap: string | null; loadCount: number; }
export function evaluateResourceScript(c: ResourceScriptCase) {
  const runtime = new ResourceScriptRuntime(); runtime.locale = c.locale ?? undefined; runtime.ignoreResourceRefs = c.ignoreRefs;
  runtime.filter = () => c.filter;
  const warnings: string[] = []; runtime.warning = warning => warnings.push(warning);
  const resources: TestResource[] = [], registered = new Map<string, TestResource>(), pending: TestResource[] = [], unloaded: number[] = [], errors: string[] = [], events: unknown[][] = [];
  const services: ResourceScriptServices<TestResource, string> = {
    getResource: (type, name) => { events.push(['get', type, name]); return registered.get(type + '_' + name) ?? null; },
    create: type => { const res: TestResource = { id: resources.length, fields: {}, sources: [], heap: null, loadCount: 0 }; resources.push(res); events.push(['new', type, res.id]); return res; },
    accessor: (res, name) => {
      if (name === 'heap') return { get: r => r.heap, set: (r, v) => { r.heap = v as string; } };
      if (name === 'sources') return { get: r => r.sources, set: () => { throw new Error('array scalar setter'); }, array: {
        allocate: (r, count) => { events.push(['allocate', r.id, count]); r.sources = Array(count).fill(null); },
        length: r => r.sources.length, setElement: (r, index, value) => { events.push(['element', r.id, index, value]); r.sources[index] = value; },
      } };
      if (!['class', 'name', 'source', 'enabled', 'count'].includes(name)) return undefined;
      return { get: r => r.fields[name], set: (r, v) => { r.fields[name] = v; } };
    },
    incLoadCount: res => { events.push(['inc', res.id]); res.loadCount++; },
    decLoadCount: res => { events.push(['dec', res.id]); res.loadCount--; },
    getLoadCount: res => res.loadCount,
    addToLoadList: res => { events.push(['queue', res.id]); pending.push(res); },
    addToUnloadList: res => { events.push(['unload', res.id]); unloaded.push(res.id); },
  };
  const variants = ['en', 'fr', undefined].map(locale => ({ locale, parameters: {
    source: locale ?? 'default', enabled: false, count: 3, ignored: 'not reflected', ...(c.array ? { sources: ['a.level', 'b.level'] } : {}),
  } }));
  runtime.register('DemoData', 'Level', c.definition, variants);
  for (let i = 0; i < c.references; i++) runtime.reference('DemoData', 'Level');
  runtime.reference('DemoData', 'Missing');
  const planned = runtime.resources.map(cons => ({ source: cons.source, class: cons.class, name: cons.name }));
  const uniqueTables = new Set(runtime.resources).size;
  for (let i = 0; i < c.loads; i++) {
    if (i === 1 && c.changeSource) for (const cons of new Set(runtime.resources)) cons.source = 'changed';
    try { runtime.queueForLoad('levelHeap', services); } catch { errors.push('configuration'); }
    if (c.publish) for (const res of pending.splice(0)) registered.set(res.fields.class + '_' + res.fields.name, res);
  }
  for (let i = 0; i < c.unloads; i++) runtime.queueForUnload(services);
  runtime.clearResources();
  return { planned, uniqueTables, warnings, errors, errorCode: runtime.errorCode, definitionSources: [...runtime.definitions.values()].map(cons => cons.source),
    allocated: resources, pending: pending.map(res => res.id), unloaded, events, remainingResources: runtime.resources.length };
}
