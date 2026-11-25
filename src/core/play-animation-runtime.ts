import type { ModelBakeMemory } from './model-baked-runtime';
import { NativeObjectFoundationFailure } from './object-foundation-runtime';
import { natureArithmetic, type NatureArithmeticServices } from './nature-event-runtime';
import { numericFloatBits as bits } from './object-numeric-runtime';
import { constructOriginalEvent, type OriginalEventConstructionMetadata } from './event-foundation-runtime';
/** Whole placement constructor 0x1005311f0; two empty libc++ strings share
 * the native overlapping 32-byte zero stores. Speed/play flags are fields. */
export function constructOriginalPlayAnimation(storage: Uint8Array, classId: number, metadata: OriginalEventConstructionMetadata): void {
  if (storage.length < 0x88) throw new Error('Original PlayAnimation storage truncated');
  constructOriginalEvent(storage, metadata);
  const v = new DataView(storage.buffer, storage.byteOffset, storage.byteLength);
  v.setUint32(8, classId >>> 0, true); v.setBigUint64(0, 0x100ce6aa0n, true);
  storage[0x82] = 0; storage.fill(0, 0x50, 0x70); storage.fill(0, 0x38, 0x58);
}
export interface PlayAnimationServices {
  castLevelMesh(object: bigint): bigint;
  defaultAnimation(animation: bigint): number;
  currentAnimation(animation: bigint, kind: number): number;
  setSpeed(animation: bigint, index: number, speedBits: number): void;
  playNamed(animation: bigint, name: bigint, weightBits: number): void;
  playSequence(animation: bigint, name: bigint, weightBits: number, speedBits: number, flags: number): void;
  start(event: bigint): void;
  arithmetic?: NatureArithmeticServices;
}
const failure = (file: string, line: number, expression: string): never => { throw new NativeObjectFoundationFailure(file, line, 3, expression); };
/** Complete PlayAnimation.Update 0x1005313d0. Reads the shared LevelMesh
 * model/animation chain, live Clump size, Float speed and libc++ short/long
 * strings in native order. Its controller services own default/named/sequence
 * creation; this event never invents an animation for a missing Model owner. */
export function updateOriginalPlayAnimation(m: ModelBakeMemory, event: bigint, s: PlayAnimationServices) {
  const a = natureArithmetic(s.arithmetic), byte = (p: bigint) => m.bytes(p, 1)[0];
  const data = (p: bigint) => byte(p) & 1 ? m.read64(p + 16n) : p + 1n;
  const length = (p: bigint) => byte(p) & 1 ? m.read64(p + 8n) : BigInt(byte(p) >>> 1);
  let clump = m.read64(event + 56n), i = 0;
  while (i < m.read32(clump + 16n)) {
    const object = m.read64(m.read64(clump + 8n) + BigInt(i * 8)), mesh = s.castLevelMesh(object);
    if (!mesh) failure('./Clump.h', 71, 'ret');
    let model = m.read64(mesh + 0x228n);
    clump = m.read64(event + 56n);
    let speed = a.add(a.div(bits(i), bits(m.read32(clump + 16n))), 0x3f800000);
    const speedFloat = m.read64(event + 120n);
    const multiplier = speedFloat ? a.mul(m.read32(speedFloat + 16n), m.read32(event + 116n)) : m.read32(event + 116n);
    speed = a.mul(speed, multiplier);
    if (!byte(event + 129n)) {
      if (byte(event + 128n)) {
        let index = s.currentAnimation(m.read64(model + 104n), 1) | 0;
        if (index < 0) index = m.read32(mesh + 0xa34n) | 0;
        if (index >= 0) s.setSpeed(m.read64(model + 104n), index, speed);
      }
    } else {
      const animation = m.read64(model + 104n);
      if (!animation) failure('PlayAnimation.cpp', 50, 'animInst != nullptr');
      if (byte(event + 112n)) {
        const index = s.defaultAnimation(animation);
        if (byte(event + 128n)) s.setSpeed(animation, index, speed);
      } else {
        const sequence = event + 64n, name = event + 88n;
        if (!length(sequence)) s.playNamed(animation, data(name), 0x3f800000);
        else {
          if (length(name)) failure('PlayAnimation.cpp', 59, 'animName.empty()');
          s.playSequence(animation, data(sequence), 0x3f800000, byte(event + 128n) ? speed : 0x3f800000, 0);
        }
      }
    }
    i++; clump = m.read64(event + 56n);
  }
  m.write8(event + 130n, 1); s.start(event);
}
