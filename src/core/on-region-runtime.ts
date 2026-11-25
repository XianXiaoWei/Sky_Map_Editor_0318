import type { ModelBakeMemory } from './model-baked-runtime';
import { constructOriginalEvent, type OriginalEventConstructionMetadata } from './event-foundation-runtime';
import { NativeObjectFoundationFailure } from './object-foundation-runtime';
import { transformNativeObb } from './marker-transform-runtime';
import { numericFloatBits, numericFloatValue } from './object-numeric-runtime';

export function constructOriginalOnRegion(storage: Uint8Array, classId: number, metadata: OriginalEventConstructionMetadata): void {
  if (storage.length < 0x70) throw new Error('Original OnRegion storage truncated');
  constructOriginalEvent(storage, metadata);
  const v = new DataView(storage.buffer, storage.byteOffset, storage.byteLength);
  v.setUint32(8, classId >>> 0, true); v.setBigUint64(0, 0x100cd77d0n, true);
  storage[0x5e] = 0; v.setUint32(0x60, 0, true); storage[0x68] = 0;
}
/** Whole OnRegion.Enable 0x1004dfa90. Resume is the base no-op. */
export function enableOriginalOnRegion(m: ModelBakeMemory, event: bigint): void {
  m.write8(event + 0x5en, 0); m.write8(event + 0x68n, 0); m.write64(event + 0x60n, 0n);
}
export type OnRegionMetadataKind = 'Object' | 'Marker' | 'LevelMesh';
export interface OnRegionServices {
  avatarBarnReady(barn: bigint): number;
  activeAvatarCount(barn: bigint, localOnly: number): number;
  avatarAt(barn: bigint, index: number): bigint;
  cameraPosition(camera: bigint): Uint8Array;
  avatarEnabled(avatar: bigint): number;
  metadata(kind: OnRegionMetadataKind): bigint;
  cast(metadata: bigint, object: bigint, source: bigint): { object: bigint; cast: bigint };
  transform(object: bigint): Uint8Array;
  localObb(object: bigint): Uint8Array;
  pointInObb(point: Uint8Array, worldObb: Uint8Array, tolerance: number): number;
  setClumpEnabled(clump: bigint, enabled: number): void;
  start(event: bigint): void;
  /** W of the initial caller/private XMM2 value. XYZ is cleared before the
   * fallback position is used; it is not an implicit homogeneous 1. */
  initialPositionWBits(): number;
}
const f = Math.fround, add = (a: number, b: number) => f(a + b), mul = (a: number, b: number) => f(a * b);
const fail = (line: number, expression: string): never => { throw new NativeObjectFoundationFailure('./Clump.h', line, 3, expression); };
/** Complete OnRegion.Update 0x1004dfab0. Counts are avatar/region pairs;
 * all-regions uses a separate distinct-region count. Origin and unordered
 * positions are skipped by the original ordered squared-length comparison.
 * Callback-visible fields, Clumps and casts retain native read ordering. */
export function updateOriginalOnRegion(m: ModelBakeMemory, event: bigint, game: bigint, s: OnRegionServices): void {
  const byte = (at: number) => m.bytes(event + BigInt(at), 1)[0], group = (at: number) => m.read64(event + BigInt(at));
  const size = (clump: bigint) => m.read32(clump + 16n);
  const member = (clump: bigint, index: number) => {
    if (index >= size(clump)) fail(54, 'idx < size');
    return m.read64(m.read64(clump + 8n) + BigInt(index * 8));
  };
  if (!(s.avatarBarnReady(m.read64(game + 0x280n)) & 255)) return;
  const active = s.activeAvatarCount(m.read64(game + 0x280n), 1) | 0;
  const hits = new Uint8Array(size(group(56))); let total = 0, any = 0, distinct = 0;
  let position = new Uint8Array(16); new DataView(position.buffer).setUint32(12, s.initialPositionWBits(), true);
  const cast = (kind: OnRegionMetadataKind, object: bigint) => {
    const source = s.metadata('Object'), meta = s.metadata(kind);
    return s.cast(meta, object, source);
  };
  for (let i = 0; i < (byte(83) ? 1 : group(72) ? size(group(72)) : 16); i++) {
    const avatar = s.avatarAt(m.read64(game + 0x280n), i);
    if (byte(83)) position = new Uint8Array(s.cameraPosition(m.read64(game + 0x70n)));
    else {
      position.fill(0, 0, 12);
      if (group(72)) {
        const object = cast('Object', member(group(72), i)).cast; if (!object) fail(71, 'ret');
        const marker = cast('Marker', object);
        if (marker.cast) position = new Uint8Array(m.bytes(marker.cast + 16n, 16));
        const mesh = cast('LevelMesh', marker.object).cast;
        if (mesh) {
          const matrix = s.transform(mesh), local = s.localObb(mesh);
          position = new Uint8Array(transformNativeObb(matrix, local).subarray(48, 64));
        }
      } else if (byte(84) && m.bytes(avatar + 0x1ef8n, 1)[0]) position = new Uint8Array(m.bytes(m.read64(avatar + 24n) + 16n, 16));
      else if (byte(85) && !m.bytes(avatar + 0x1ef8n, 1)[0]) {
        if ((s.avatarEnabled(avatar) & 255) || m.bytes(avatar + 0x21b3n, 1)[0]) position = new Uint8Array(m.bytes(m.read64(avatar + 24n) + 16n, 16));
      }
    }
    const p = new DataView(position.buffer, position.byteOffset, position.byteLength), xyz = [0, 4, 8].map(at => p.getFloat32(at, true));
    if (!(add(mul(xyz[2], xyz[2]), add(mul(xyz[0], xyz[0]), mul(xyz[1], xyz[1]))) > 0)) continue;
    const count = size(group(56));
    for (let j = 0; j < count; j++) {
      const marker = cast('Marker', member(group(56), j)).cast; if (!marker) fail(71, 'ret');
      if (!m.bytes(marker + 64n, 1)[0]) continue;
      const matrix = s.transform(marker), local = s.localObb(marker);
      if (s.pointInObb(new Uint8Array(position), transformNativeObb(matrix, local), f(0.01)) & 255) {
        total = (total + 1) | 0;
        if (j >= hits.length) throw new Error('Original OnRegion region growth exceeds its private allocation');
        hits[j] = 1; any = 1;
      }
    }
  }
  let edge = false;
  if (byte(93)) {
    const count = size(group(56)); if (count > hits.length) throw new Error('Original OnRegion region growth reads uninitialized private storage');
    for (let i = 0; i < count; i++) distinct = (distinct + hits[i]) >>> 0;
    edge = byte(80) ? distinct === count && m.read32(event + 100n) < distinct : distinct === 0 && (m.read32(event + 100n) | 0) > 0;
  } else if (byte(86)) edge = total >= active && (m.read32(event + 96n) | 0) < active;
  else if (byte(92)) { const minimum = m.read32(event + 88n) | 0; edge = total >= minimum && (m.read32(event + 96n) | 0) < minimum; }
  else edge = byte(80) === any && byte(80) !== byte(94);
  if (edge) m.write8(event + 104n, byte(82));
  if (edge || byte(104)) {
    s.setClumpEnabled(group(64), 1);
    if (byte(104)) {
      const clear = byte(93) ? byte(80) ? (total >>> 0) < size(group(56)) : total > 0 : byte(80) !== any;
      if (clear) m.write8(event + 104n, 0);
    }
    if (byte(81)) s.start(event);
  }
  m.write8(event + 94n, any); m.write32(event + 96n, total); m.write32(event + 100n, distinct);
}
/** Whole boolean wrapper 0x10078d450 and its containment result from
 * 0x10078d250. The latter also writes a closest point to private storage that
 * this wrapper discards. Tolerance only applies outside the original extent. */
export function originalRegionPointInObb(point: Uint8Array, obb: Uint8Array, tolerance: number): boolean {
  const p = new DataView(point.buffer, point.byteOffset, point.byteLength), b = new DataView(obb.buffer, obb.byteOffset, obb.byteLength);
  const delta = [0, 1, 2].map(i => f(p.getFloat32(i * 4, true) - b.getFloat32(48 + i * 4, true)));
  let inside = true;
  for (let i = 0; i < 3; i++) {
    let axis = [0, 1, 2].map(j => b.getFloat32(i * 16 + j * 4, true));
    const n = f(Math.sqrt(add(mul(axis[2], axis[2]), add(mul(axis[0], axis[0]), mul(axis[1], axis[1])))));
    if (n > f(0.00001)) axis = axis.map(x => f(x / n));
    const dot = add(mul(axis[2], delta[2]), add(mul(axis[0], delta[0]), mul(axis[1], delta[1])));
    const magnitude = numericFloatValue(numericFloatBits(dot) ^ 0x80000000);
    if (dot > n) inside = inside && !(dot > add(n, f(tolerance)));
    else if (magnitude > n) inside = inside && !(magnitude > add(n, f(tolerance)));
  }
  return inside;
}
