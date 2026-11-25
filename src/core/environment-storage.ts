import evidence from '../../docs/environment-layouts.json';
import properties from '../../docs/native-properties.json';
import runtimeEvidence from '../../docs/environment-runtime.json';
import defaultEvidence from '../../docs/environment-defaults.json';
import loadEvidence from '../../docs/environment-load.json';
import { initializeEnvFade } from './environment-runtime';
import { describeEnvironmentRegion } from './environment-regions';
import type { ObjectNode } from './objects';
export type EnvironmentClass = keyof typeof evidence.layouts;

// Native EnvNode/SetEnvDefault/SetEnvHull public-field -> EnvVars conversion.
// Input must already contain initialized native storage. Unwritten bytes are
// retained; this function does not invent constructor defaults or class IDs.
export function convertEnvironmentStorage(className: EnvironmentClass, storage: Uint8Array) {
  const recipe = evidence.layouts[className];
  if (!recipe || storage.length !== recipe.storageBytes) throw new Error('环境原生存储长度或类无效');
  const out = new Uint8Array(storage), source = new DataView(storage.buffer, storage.byteOffset, storage.byteLength), target = new DataView(out.buffer);
  for (const copy of recipe.copies) out.set(storage.subarray(copy.from, copy.from + copy.bytes), copy.to);
  for (const constant of recipe.constants) {
    if (constant.bytes === 1) target.setUint8(constant.to, constant.value);
    else if (constant.bytes === 4) target.setUint32(constant.to, constant.value, true);
    else throw new Error('未支持的原生环境常量宽度');
  }
  const f = Math.fround, density = recipe.density, inverse = recipe.fogInverse, volume = recipe.volume;
  target.setFloat32(density.to, f(source.getFloat32(density.from, true) * density.scale), true);
  target.setFloat32(inverse.to, f(1 / f(source.getFloat32(inverse.far, true) - source.getFloat32(inverse.near, true))), true);
  // Preserve payload bits when removing the float sign; +0 and -0 both set
  // positiveFlag in the original unordered-aware >= comparison.
  target.setUint32(volume.to, source.getUint32(volume.from, true) & 0x7fffffff, true);
  target.setUint8(volume.positiveFlag, Number(source.getFloat32(volume.from, true) >= 0));
  target.setUint8(volume.enabledFlag, Number(target.getFloat32(volume.to, true) > Math.fround(.0001)));
  return out;
}

// The mask distinguishes recovered bytes from unknown constructor storage.
// Missing properties use actual TGCL default tags; saved objects stay unchanged.
export function readEnvironmentStorage(node: ObjectNode) {
  const className = node.className as EnvironmentClass, recipe = evidence.layouts[className];
  if (!recipe) throw new Error('此类的环境转换尚未逆向');
  const registered = properties[className], storage = new Uint8Array(recipe.storageBytes), known = new Uint8Array(recipe.storageBytes);
  const ranges: { name: string; start: number; end: number }[] = [];
  const defaultsApplied: { name: string; text: string; nativeOffset: number; rawHex: string }[] = [];
  const savedNames = new Set(node.fields.map(field => field.name));
  for (const [name, property] of Object.entries(defaultEvidence.classes[className])) {
    if (savedNames.has(name)) continue;
    const bytes = Uint8Array.from(property.encodedHex.match(/../g)!, h => Number.parseInt(h, 16)), offset = property.nativeOffset;
    if (offset + bytes.length > storage.length) throw new Error('原版默认字段超出已确认存储');
    storage.set(bytes, offset); known.fill(1, offset, offset + bytes.length); ranges.push({ name, start: offset, end: offset + bytes.length });
    defaultsApplied.push({ name, text: property.text, nativeOffset: offset, rawHex: property.encodedHex });
  }
  for (const field of node.fields) {
    const property = registered[field.name as keyof typeof registered];
    if (!property || !field.raw || !/^[0-9a-f]+$/i.test(field.raw) || field.children?.length) continue;
    const bytes = Uint8Array.from(field.raw.match(/../g)!, h => Number.parseInt(h, 16));
    const offset = property.nativeOffset;
    if (offset + bytes.length > storage.length) throw new Error('环境字段超出已确认存储');
    storage.set(bytes, offset); known.fill(1, offset, offset + bytes.length); ranges.push({ name: field.name, start: offset, end: offset + bytes.length });
  }
  return { className, recipe, storage, known, ranges, defaultsApplied };
}

export function describeEnvironment(node: ObjectNode, nodes?: ObjectNode[]) {
  const { className, recipe, storage, known, ranges, defaultsApplied } = readEnvironmentStorage(node);
  const available = (start: number, bytes: number) => known.subarray(start, start + bytes).every(b => b === 1);
  const converted = convertEnvironmentStorage(className, storage), view = new DataView(converted.buffer), convertedKnown = new Uint8Array(known);
  for (const copy of recipe.copies) convertedKnown.set(known.subarray(copy.from, copy.from + copy.bytes), copy.to);
  for (const constant of recipe.constants) convertedKnown.fill(1, constant.to, constant.to + constant.bytes);
  const density = recipe.density, inverse = recipe.fogInverse, volume = recipe.volume;
  const derived = [
    { name: '原版雾密度', offset: density.to, value: available(density.from, 4) ? view.getFloat32(density.to, true) : null },
    { name: '雾距离倒数', offset: inverse.to, value: available(inverse.near, 4) && available(inverse.far, 4) ? view.getFloat32(inverse.to, true) : null },
    { name: '体积雾强度绝对值', offset: volume.to, value: available(volume.from, 4) ? view.getFloat32(volume.to, true) : null },
    { name: '体积雾正向标志', offset: volume.positiveFlag, value: available(volume.from, 4) ? view.getUint8(volume.positiveFlag) : null },
    { name: '体积雾启用标志', offset: volume.enabledFlag, value: available(volume.from, 4) ? view.getUint8(volume.enabledFlag) : null },
  ];
  const transfers = recipe.copies.map(copy => ({ ...copy, fields: ranges.filter(range => range.start < copy.from + copy.bytes && copy.from < range.end).map(range => range.name), complete: available(copy.from, copy.bytes) }));
  if (available(density.from, 4)) convertedKnown.fill(1, density.to, density.to + 4);
  if (available(inverse.near, 4) && available(inverse.far, 4)) convertedKnown.fill(1, inverse.to, inverse.to + 4);
  if (available(volume.from, 4)) { convertedKnown.fill(1, volume.to, volume.to + 4); convertedKnown[volume.positiveFlag] = 1; convertedKnown[volume.enabledFlag] = 1; }
  const groups = runtimeEvidence.groups.map(group => {
    const base = group.offsets[className];
    const fields = group.fields.map(field => {
      const offset = base + field.nativeOffset, complete = convertedKnown.subarray(offset, offset + field.bytes).every(b => b === 1);
      const value = !complete ? null : field.tag === 11 ? view.getUint8(offset) : field.tag === 5 ? view.getUint32(offset, true) : field.bytes === 16 ? Array.from({ length: 4 }, (_, i) => view.getFloat32(offset + i*4, true)) : view.getFloat32(offset, true);
      return { ...field, offset, complete, value, rawHex: complete ? Array.from(converted.subarray(offset, offset + field.bytes), b => b.toString(16).padStart(2, '0')).join('') : null };
    });
    return { className: group.className, registrationIndex: group.nodeRegistrationIndex,
      globalRegistrationIndex: loadEvidence.groups.find(entry => entry.className === group.className)!.globalRegistrationIndex,
      nativeOffset: base, complete: fields.every(field => field.complete), fields };
  });
  let registration = null;
  if (className === 'EnvNode') {
    const input = new DataView(storage.buffer);
    const offsets = [properties.EnvNode.enabled.nativeOffset, properties.EnvNode.layer.nativeOffset, properties.EnvNode.duration.nativeOffset, properties.EnvNode.fadeInTime.nativeOffset, properties.EnvNode.fadeOutTime.nativeOffset, properties.EnvNode.falloff.nativeOffset];
    if (offsets.every((offset, i) => available(offset, i === 0 ? 1 : 4))) {
      const [enabledAt, layerAt, durationAt, fadeInAt, fadeOutAt, falloffAt] = offsets;
      registration = { layer: input.getUint32(layerAt, true), falloff: input.getFloat32(falloffAt, true), fadeIn: input.getFloat32(fadeInAt, true), fadeOut: input.getFloat32(fadeOutAt, true), duration: input.getFloat32(durationAt, true), state: initializeEnvFade(!!input.getUint8(enabledAt), input.getFloat32(durationAt, true)) };
    }
  }
  const region = nodes ? describeEnvironmentRegion(node, nodes) : null;
  if (region?.kind === 'clump') registration = region.registration;
  const queue = nodes?.filter(entry => entry.className === 'EnvNode'), queueIndex = queue?.findIndex(entry => entry.id === node.id);
  const creation = className === 'EnvNode' && queueIndex !== undefined && queueIndex >= 0 ? {
    queueIndex, queueSize: queue!.length, limit: loadEvidence.queue.limit,
    nativeOffset: loadEvidence.queue.environmentOffset + queueIndex * loadEvidence.queue.stride,
    complete: queue!.length <= loadEvidence.queue.limit,
  } : null;
  return { nodeId: node.id, className, function: recipe.function, derived, transfers, groups, registration, region, creation, defaultsApplied,
    limitation: '已恢复全局八组顺序、EnvNode 文件创建队列与加载注册；初始全局输出、自动事件、完整相机环境和渲染仍待还原。' };
}
