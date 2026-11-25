import { findNativeMetaClassById, NativeObjectFoundationFailure, type NativeObjectMemory } from './object-foundation-runtime';
import { findNativeObjectMethod, type NativeObjectEnabledServices } from './object-enabled-runtime';

export interface NativeObjectResumeServices extends NativeObjectEnabledServices {
  gameType(): bigint;
  invokeResume(method: bigint, receiver: bigint, game: bigint, gameType: bigint): void;
}
/** Whole ObjectFactory TryResume 0x1004d2440 normal path. Missing method
 * returns false for Clump fallback; required missing methods retain assertion. */
export function tryResumeNativeObject(m: NativeObjectMemory, object: bigint, game: bigint, required: boolean, s: NativeObjectResumeServices): boolean {
  if (!object) throw new NativeObjectFoundationFailure('ObjectManip.cpp', 88, 3, 'obj');
  const meta = s.asClass(findNativeMetaClassById(m, s.registry, m.read32(object))) || s.fallbackClass();
  const method = findNativeObjectMethod(m, meta, new TextEncoder().encode('OnResumeEnabled'), s.cacheEnabled(), s);
  if (!method) {
    if (required) throw new NativeObjectFoundationFailure('ObjectManip.cpp', 103, 4, 'false');
    return false;
  }
  s.voidType(); const gameType = s.gameType(), source = s.objectPointerType(); s.voidType();
  const receiver = s.castReceiver(s.receiverType(method), object, source);
  if (!receiver) throw new NativeObjectFoundationFailure('../../../Code/Base/Meta.h', 1091, 3, 'c');
  s.invokeResume(method, receiver, game, gameType); return true;
}
/** Whole Clump OnResumeEnabled 0x10022bba0 normal path. Re-read each
 * member before fallback, and re-read count/data after every dispatch. */
export function resumeNativeClump(m: NativeObjectMemory, clump: bigint, game: bigint, s: {
  debugResume(kind: 'Clump' | 'Enable', object: bigint): void;
  tryResume(object: bigint, game: bigint): boolean;
  setEnabled(object: bigint, enabled: boolean): void;
}): void {
  s.debugResume('Clump', clump);
  for (let i = 0; i < m.read32(clump + 0x10n); i++) {
    const member = () => m.read64(m.read64(clump + 8n) + BigInt(i * 8));
    if (!s.tryResume(member(), game)) s.setEnabled(member(), true);
  }
}
