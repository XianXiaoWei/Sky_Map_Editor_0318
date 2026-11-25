import type { ModelBakeMemory } from './model-baked-runtime';
import { natureArithmetic, type NatureArithmeticServices } from './nature-event-runtime';
import type { MoveObjectAlongRailEnableServices } from './move-object-along-rail-runtime';
import { NativeObjectFoundationFailure } from './object-foundation-runtime';
import { numericFloatBits as bits, numericFloatValue as value } from './object-numeric-runtime';

export interface MoveObjectAlongRailUpdateControlServices extends Pick<MoveObjectAlongRailEnableServices, 'objectMetadata' | 'castObject' | 'transform' | 'nearest' | 'distanceAtParameter'> {
  arithmetic?: NatureArithmeticServices;
  /** Live Debug toggle/float at 0x101ffb0d0 and 0x100cb8540. */
  debugScaleBits(): number | undefined;
  writableNetworkState(manager: bigint): bigint;
  readableNetworkState(manager: bigint): bigint;
  hasSessionAuthority(session: bigint): number;
  objectiveEnabled(objective: bigint): number;
  localAvatar(barn: bigint): bigint;
  exp(inputBits: number): number;
  fmod(numeratorBits: number, denominatorBits: number): number;
  setObjectEnabled(object: bigint, enabled: number): void;
  finishEvent(event: bigint): void;
}

/** Original MoveObjectAlongRail.Update control flow, from 0x100484a90 to
 * the object loop at 0x100484fc0, including the out-of-line clock/assertion
 * branches and complete empty-list/disabled return paths. A ready result
 * deliberately leaves object movement, pose and Update counter unfinished;
 * the caller must not expose this phase as a complete playback runtime. */
export function beginOriginalMoveObjectAlongRailUpdate(m: ModelBakeMemory, event: bigint, game: bigint, s: MoveObjectAlongRailUpdateControlServices): { objectPhaseReady: boolean; deltaBits: number | null } {
  const a = natureArithmetic(s.arithmetic), one = bits(1), threshold = 0x3f7fbe77;
  const byte = (p: bigint) => m.bytes(p, 1)[0], word = (at: number) => m.read32(event + BigInt(at)), pointer = (at: number) => m.read64(event + BigInt(at));
  const float64 = (p: bigint) => { const raw = m.bytes(p, 8); return new DataView(raw.buffer, raw.byteOffset, 8).getFloat64(0, true); };
  const fail = (file: string, line: number, expression: string): never => { throw new NativeObjectFoundationFailure(file, line, 3, expression); };
  if (byte(event + 160n)) {
    const manager = m.read64(game + 0x5d0n), index = word(240), initial = s.writableNetworkState(manager);
    if (index < byte(initial + 0x168n)) {
      if (s.hasSessionAuthority(m.read64(m.read64(game + 0x178n) + 0x40n)) & 255) {
        const state = s.writableNetworkState(manager), slot = state + 0x68n + BigInt(word(240)) * 16n;
        const disableIfNeeded = () => {
          const objective = pointer(168);
          if (objective && !(s.objectiveEnabled(objective) & 255)) m.write8(slot, 0);
        };
        if (byte(slot)) disableIfNeeded();
        else {
          const objective = pointer(168);
          if (objective && !(s.objectiveEnabled(objective) & 255)) {
            // Native out-of-line branch rechecks the live slot after the
            // objective callback before returning to the active-slot path.
            if (byte(slot)) disableIfNeeded();
          } else {
            m.write8(slot, 1);
            const clock = m.read64(game + 0x160n), scale = value(m.read32(clock + 32n));
            m.write64(slot + 8n, m.read64(clock + (scale === 0 ? 0xc8n : 0xb8n)));
          }
        }
      }
      const state = s.readableNetworkState(manager), slot = state + 0x68n + BigInt(word(240)) * 16n;
      m.bytes(event + 224n, 16).set(new Uint8Array(m.bytes(slot, 16)));
    }
  }
  if (!byte(event + 224n)) { m.write32(event + 212n, 0); return { objectPhaseReady: false, deltaBits: null }; }
  const clock = m.read64(game + 0x160n), clockScale = m.read32(clock + 32n), scaledTime = a.mul(clockScale, s.debugScaleBits() ?? one);
  const delta = a.min(0x3e883127, a.max(0x38d1b717, a.mul(scaledTime, m.read32(clock + 20n))));
  if (byte(event + 100n)) {
    const maxStep = a.mul(delta, word(108)), minStep = a.mul(delta, word(112));
    const avatar = s.localAvatar(m.read64(game + 0x280n)), position = new Uint8Array(m.bytes(m.read64(avatar + 24n) + 16n, 16));
    let rail = pointer(56);
    const nearest = s.nearest(rail, position), desiredDistance = s.distanceAtParameter(rail, nearest);
    const objects = pointer(64);
    if (!m.read32(objects + 16n)) fail('./Clump.h', 54, 'idx < size');
    const originalLength = m.read32(pointer(56) + 24n), object = m.read64(m.read64(objects + 8n));
    const source = s.objectMetadata(), metadata = s.objectMetadata(), cast = s.castObject(metadata, object, source);
    if (!cast) fail('./Clump.h', 71, 'ret');
    const transform = s.transform(cast), currentPosition = new Uint8Array(transform.subarray(48, 64));
    rail = pointer(56);
    const currentNearest = s.nearest(rail, currentPosition), currentDistance = s.distanceAtParameter(rail, currentNearest);
    rail = pointer(56);
    const length = m.read32(rail + 24n), current = a.div(currentDistance, length);
    let progress = a.add(a.div(desiredDistance, originalLength), a.div(word(104), length));
    const distance = a.mul(length, a.sub(progress, current));
    if (value(distance) > value(maxStep)) progress = a.add(current, a.div(maxStep, length));
    else if (value(minStep) > value(distance)) progress = a.add(current, a.div(minStep, length));
    progress = byte(rail + 44n) ? s.fmod(progress, one) : a.min(one, a.max(0, progress));
    m.write32(event + 200n, progress);
  } else {
    let elapsed: number;
    if (byte(event + 160n)) elapsed = a.mul(scaledTime, bits(float64(clock + (value(clockScale) === 0 ? 0xc8n : 0xb8n)) - float64(event + 232n)));
    else elapsed = bits(value(m.read32(clock + 36n)) - float64(event + 232n));
    const time = word(80);
    if (!(value(time) > value(0x3a83126f))) fail('MoveObjectAlongRail.cpp', 353, 'time > 0.001f');
    let progress = a.div(elapsed, time);
    const clamp = (v: number) => a.min(one, a.max(0, v));
    const smooth = (v: number) => a.mul(a.mul(v, a.mul(v, v)), a.add(a.mul(v, a.add(a.mul(v, bits(6)), bits(-15))), bits(10)));
    const easeIn = word(72);
    if (value(easeIn) > 0) {
      const blend = smooth(clamp(a.div(clamp(progress), a.div(easeIn, time))));
      progress = a.add(a.mul(progress, blend), a.mul(a.sub(one, blend), 0));
    }
    const easeOut = word(76);
    if (value(easeOut) > 0 && !byte(pointer(56) + 44n)) {
      const blend = smooth(clamp(a.div(clamp(a.div(a.add(elapsed, a.sub(easeOut, time)), time)), a.div(easeOut, time))));
      progress = a.add(blend, a.mul(a.sub(one, blend), progress));
    }
    if (!(value(a.sub(elapsed, word(204))) > value(a.mul(time, bits(0.5))))) {
      const exp = s.exp(a.mul(delta, 0xbfa36dd3)), weight = a.sub(one, exp), remaining = a.sub(one, weight);
      progress = a.add(a.mul(weight, progress), a.mul(remaining, word(200)));
    }
    const reset = !!byte(event + 216n) && value(threshold) > value(progress);
    m.write32(event + 200n, reset ? threshold : progress); m.write32(event + 204n, reset ? 0 : elapsed);
  }
  if (m.read32(pointer(64) + 16n)) return { objectPhaseReady: true, deltaBits: delta };
  const terminal = !byte(pointer(56) + 44n) && !byte(event + 89n) && !byte(event + 208n) &&
    value(a.add(word(200), byte(event + 100n) ? 0 : word(184))) > value(threshold);
  if (terminal || (byte(event + 216n) && word(212) >= 2)) {
    m.write8(event + 208n, 1); s.setObjectEnabled(pointer(152), 1);
    if (!byte(event + 160n)) s.finishEvent(event);
  }
  m.write32(event + 212n, word(212) + 1);
  if (!byte(event + 224n)) m.write32(event + 212n, 0);
  return { objectPhaseReady: false, deltaBits: delta };
}
