export const ORIGINAL_ENV_NODE_BYTES = 0x410;
export const ENV_NODE_GROUPS = [
  ['AmbienceSun',0x200],['AmbienceSky',0x240],['AmbienceFog',0x310],['AmbienceBloom',0x340],
  ['AmbienceToneMap',0x370],['AmbiencePointLight',0x380],['CloudEnvParams',0x3b0],['FogVolumeParams',0x3b8],
] as const;
export interface EnvNodeConstructorServices {
  ensureBaseMetaType(): void;
  envNodeClassId(): number;
  genericValueClassId(): number;
  groupClassId(name: typeof ENV_NODE_GROUPS[number][0]): number;
  zeroColor(): Uint8Array;
  vptr: bigint;
}
/** Whole original EnvNode constructor 0x10031c830. Registry/type getters and
 * initialized Color globals are explicit services. It does NOT initialize the
 * enabled byte or transform; TGCL missing-property defaults follow separately.
 * Storage must already exist, just as original preconstructed Barn slots do. */
export function constructOriginalEnvNode(storage: Uint8Array, services: EnvNodeConstructorServices) {
  if (storage.length < ORIGINAL_ENV_NODE_BYTES) throw new Error('EnvNode 原存储截断');
  const d = new DataView(storage.buffer,storage.byteOffset,storage.byteLength);
  services.ensureBaseMetaType(); d.setUint32(8,services.envNodeClassId(),true); d.setBigUint64(0,services.vptr,true);
  const color = Uint8Array.from(services.zeroColor());
  for (const offset of [0xb0,0xe0,0xf0,0x100,0x110,0x120,0x160,0x170,0x180,0x190,0x1a0]) storage.set(color,offset);
  const colors = [[0x210],[0x250,0x260,0x270,0x280,0x290,0x2b0,0x2c0,0x2d0,0x2e0,0x2f0],[],[],[],[],[],[]];
  for (const [i,[name,offset]] of ENV_NODE_GROUPS.entries()) {
    services.ensureBaseMetaType(); d.setUint32(offset,services.genericValueClassId(),true); d.setUint32(offset,services.groupClassId(name),true);
    // The first two groups reload the original global after their type getter.
    if (colors[i].length) { const value = Uint8Array.from(services.zeroColor()); for (const at of colors[i]) storage.set(value,at); }
  }
}
/** Shared public enabled field used by Object metadata reflection. These
 * field accessors do not substitute for the ObjectFactory dispatch itself. */
export function readOriginalEnvNodeEnabled(storage: Uint8Array): number { return storage[0x50]; }
export function writeOriginalEnvNodeEnabled(storage: Uint8Array, enabled: number) { storage[0x50] = enabled & 255; }
