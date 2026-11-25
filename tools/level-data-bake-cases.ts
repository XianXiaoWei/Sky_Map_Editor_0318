import { loadLevelDataBakeLod, loadedLevelDataBakeGuid } from '../src/core/level-data-bake-runtime';
import type { ResourceMeshLOD } from '../src/core/resources';

export interface LevelDataBakeCase {
  label: string; guid: number; exists: boolean; usable: boolean; uniform: boolean; lod: number;
  samples: number; meshSamples: number; render: number; remap: number[]; light: number[]; extra: number[];
}
export function evaluateLevelDataBakeCase(c: LevelDataBakeCase): Buffer {
  const trace: number[][] = [], allocations = new Map<Uint8Array, number>();
  const input = Buffer.alloc(8 + c.light.length + c.extra.length);
  input.writeUInt32LE(c.samples); input.writeUInt32LE(c.extra.length, 4); input.set(c.light, 8); input.set(c.extra, 8 + c.light.length);
  let cursor = 0;
  const mesh: ResourceMeshLOD = { positions: new Float32Array(c.render * 3), bakeVertexCount: c.meshSamples,
    bakeRemap: Uint32Array.from(c.remap), normals: new Float32Array(), uvs: new Float32Array(), colors: new Float32Array(), indices: new Uint32Array() };
  const loaded = loadLevelDataBakeLod(c.uniform, c.usable ? mesh : null, {
    readUint32: () => { const value = input.readUInt32LE(cursor); cursor += 4; trace.push([3, 0, value, 4]); return value; },
    readBytes: (out, n) => { if (cursor + n > input.length || n > out.length) throw new Error('read overflow'); out.set(input.subarray(cursor, cursor + n)); cursor += n; trace.push([4, 0, n, 0]); },
    allocate: (heap, n, alignment) => { trace.push([1, heap === 'level' ? 1 : 0, n, alignment]); const bytes = new Uint8Array(n); allocations.set(bytes, n); return bytes; },
    freeTemporary: bytes => { trace.push([2, 0, allocations.get(bytes)!, 0]); allocations.delete(bytes); },
  });
  const numbers = [loadedLevelDataBakeGuid(c.guid, c.exists), loaded.renderVertexCount, loaded.extraByteCount,
    Number(loaded.lighting !== null), Number(loaded.extra !== null), cursor, trace.length, ...trace.flat()];
  const header = Buffer.alloc(numbers.length * 4); numbers.forEach((v, i) => header.writeUInt32LE(v >>> 0, i * 4));
  return Buffer.concat([header, loaded.lighting?.packed ?? new Uint8Array(), loaded.extra ?? new Uint8Array()]);
}
