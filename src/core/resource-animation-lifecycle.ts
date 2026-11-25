import type { ModelBakeMemory } from './model-baked-runtime';
import { RESOURCE_ANIMATION_REQUEST_POOLS } from './resource-animation-request';
import { numericFloatValue } from './object-numeric-runtime';

export interface ResourceAnimationConstructionServices {
  constructSounds(out: bigint, controller: bigint, audio: bigint, human: bigint): void;
  constructEmitters(out: bigint, controller: bigint, emitters: bigint): void;
  soundVolumeBits(sounds: bigint): number;
}
/** Original Animation constructor 0x1000941f0. The containing owner supplies
 * real audio, emitter and allocator dependencies; padding remains untouched. */
export function constructOriginalResourceAnimation(m: ModelBakeMemory, out: bigint, audio: bigint, emitters: bigint, allocator: bigint, human: bigint, s: ResourceAnimationConstructionServices) {
  m.write64(out + 0x5608n, 0n); m.write32(out + 0x6220n, 0); m.write32(out + 0x5860n, 0);
  m.write64(out + 13n, 0n); m.write64(out + 8n, 0n);
  for (const at of [0x5818, 0x5820, 0x5838, 0x5840, 0x5848]) m.write64(out + BigInt(at), 0n);
  m.write64(out + 0x5864n, 0x100000001n);
  m.write32(out + 0x5850n, 0); m.write32(out + 0x5828n, 0); m.write8(out + 0x5830n, +!!human);
  m.write32(out + 0x5834n, 0); m.write64(out, allocator);
  s.constructSounds(out + 0x5870n, out, audio, human);
  s.constructEmitters(out + 0x5bd0n, out, emitters);
  if (audio) m.write32(out + 0x6010n, s.soundVolumeBits(out + 0x5870n));
}

export interface ResourceAnimationFlushServices {
  worldMatrix(node: bigint): Uint8Array;
  multiplyMatrices(left: Uint8Array, right: Uint8Array): Uint8Array;
  processRequest(controller: bigint, request: bigint, secondary: boolean): void;
  updateSounds(sounds: bigint, delta: number): void;
  updateEmitters(emitters: bigint, delta: number): void;
  scene(): bigint;
  debugBonesEnabled(): boolean;
  debugBoundsEnabled(): boolean;
  drawBones(controller: bigint): void;
  drawBounds(controller: bigint): void;
}
/** Complete normal Animation.FlushMatricesAndEvents 0x10009a980. Writes
 * the shared palette, dispatches sound/emitter consumers in native order and
 * compacts all three pools, retaining the surviving mask pointers and sequence
 * IDs. Consumers own effects and may mutate the live counts during iteration. */
export function flushOriginalResourceAnimation(m: ModelBakeMemory, controller: bigint, delta: number, clockOnly: number, s: ResourceAnimationFlushServices) {
  if (!(clockOnly & 255)) {
    const nodes = m.read64(controller + 0x5838n), palette = m.read64(controller + 0x5840n);
    m.bytes(palette, 64).set(s.worldMatrix(nodes));
    for (let bone = 0; bone < (m.read32(m.read64(controller + 0x6018n) + 0x54n) | 0); bone++) {
      const world = s.worldMatrix(m.read64(controller + 0x5838n) + BigInt((bone + 1) * 0xf0));
      const link = m.read64(m.read64(controller + 0x6018n) + 0x68n) + BigInt(bone * 64);
      m.bytes(m.read64(controller + 0x5840n) + BigInt((bone + 1) * 64), 64).set(s.multiplyMatrices(world, m.bytes(link, 64)));
    }
  }
  m.write32(controller + 0x5860n, 0);
  for (let i = 0; i < (m.read32(controller + 12n) | 0); i++) {
    const p = controller + 0x4298n + BigInt(i * 0x70);
    if ((m.read32(p + 4n) | 0) !== -1 && (m.read32(p + 8n) | 0) !== -1 && numericFloatValue(m.read32(p + 0x54n)) <= 0) s.processRequest(controller, p, true);
  }
  for (let i = 0; i < (m.read32(controller + 8n) | 0); i++) {
    const p = controller + 0x18n + BigInt(i * 0x70);
    if ((m.read32(p + 4n) | 0) !== -1 && (m.read32(p + 8n) | 0) !== -1 && numericFloatValue(m.read32(p + 20n)) >= Math.fround(0.01) && (m.read32(p + 0x34n) | 0) !== -1) s.processRequest(controller, p, false);
  }
  if (m.read32(controller + 0x5a10n) !== 0 || (m.read32(controller + 0x5860n) | 0) > 0) s.updateSounds(controller + 0x5870n, delta);
  if (m.read32(controller + 0x6000n) !== 0) s.updateEmitters(controller + 0x5bd0n, delta);
  for (const pool of RESOURCE_ANIMATION_REQUEST_POOLS) {
    let kept = 0;
    for (let i = 0; i < (m.read32(controller + BigInt(pool.count)) | 0); i++) {
      const p = controller + BigInt(pool.first + i * 0x70);
      if (m.bytes(p + 0x60n, 1)[0]) {
        const saved = new Uint8Array(m.bytes(p, 0x70));
        m.bytes(controller + BigInt(pool.first + kept * 0x70), 0x70).set(saved); kept++;
      }
    }
    m.write32(controller + BigInt(pool.count), kept);
  }
  if (s.scene()) {
    if (s.debugBonesEnabled()) s.drawBones(controller);
    if (s.debugBoundsEnabled()) s.drawBounds(controller);
  }
}
