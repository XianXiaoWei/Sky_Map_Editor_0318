import { findNativeMetaClassById, NativeObjectFoundationFailure, type NativeObjectMemory } from './object-foundation-runtime';
import { findNativeObjectMethod, type NativeMethodLookupServices } from './object-enabled-runtime';
import { getNativeMarkerLocalObb, getNativeMarkerTransform, getNativeMarkerWorldObb, getNativeObbExtents, nativeIdentityMatrix, setNativeMarkerTransform, transformNativeObb, type NativeMarkerArithmeticServices } from './marker-transform-runtime';

export interface NativeObjectTransformServices extends NativeMethodLookupServices {
  registry: bigint;
  cacheEnabled(): boolean;
  asClass(type: bigint): bigint;
  fallbackClass(): bigint;
  objectPointerType(): bigint;
  matrixType(): bigint;
  voidType(): bigint;
  receiverType(method: bigint): bigint;
  castReceiver(type: bigint, object: bigint, source: bigint): bigint;
  invokeMatrix(method: bigint, receiver: bigint, out: Uint8Array | null, resultType: bigint, argument: Uint8Array | null, argumentType: bigint): void;
}
const failure = () => new NativeObjectFoundationFailure('../../../Code/Base/Meta.h', 1091, 3, 'c');
function methodFor(m: NativeObjectMemory, object: bigint, name: string, s: NativeObjectTransformServices): bigint {
  const meta = s.asClass(findNativeMetaClassById(m, s.registry, m.read32(object))) || s.fallbackClass();
  return findNativeObjectMethod(m, meta, new TextEncoder().encode(name), s.cacheEnabled(), s);
}
/** Whole 0x1004d1d50. Null and missing methods leave the object intact. */
export function setNativeObjectTransform(m: NativeObjectMemory, object: bigint, matrix: Uint8Array, s: NativeObjectTransformServices): void {
  if (!object) return; const method = methodFor(m, object, 'SetTransform', s); if (!method) return;
  const argumentType = s.matrixType(), source = s.objectPointerType(), resultType = s.voidType();
  const receiver = s.castReceiver(s.receiverType(method), object, source); if (!receiver) throw failure();
  s.invokeMatrix(method, receiver, null, resultType, matrix, argumentType);
}
function getMatrix(m: NativeObjectMemory, object: bigint, name: 'GetTransform' | 'GetObb', out: Uint8Array, s: NativeObjectTransformServices): Uint8Array {
  nativeIdentityMatrix(out); if (!object) return out; const method = methodFor(m, object, name, s); if (!method) return out;
  const source = s.objectPointerType(), resultType = s.matrixType();
  const receiver = s.castReceiver(s.receiverType(method), object, source); if (!receiver) throw failure();
  s.invokeMatrix(method, receiver, out, resultType, null, 0n); return out;
}
/** 0x1004d1e40 / 0x1004d2140 write identity before metadata lookup. */
export function getNativeObjectTransform(m: NativeObjectMemory, object: bigint, out: Uint8Array, s: NativeObjectTransformServices): Uint8Array { return getMatrix(m, object, 'GetTransform', out, s); }
export function getNativeObjectLocalObb(m: NativeObjectMemory, object: bigint, out: Uint8Array, s: NativeObjectTransformServices): Uint8Array { return getMatrix(m, object, 'GetObb', out, s); }
/** 0x1004d2260 combines the two reflected matrices and writes only 12 bytes. */
export function getNativeObjectExtents(m: NativeObjectMemory, object: bigint, out: Uint8Array, s: NativeObjectTransformServices, arithmetic?: NativeMarkerArithmeticServices): Uint8Array {
  const matrix = getNativeObjectTransform(m, object, new Uint8Array(64), s), local = getNativeObjectLocalObb(m, object, new Uint8Array(64), s);
  return getNativeObbExtents(transformNativeObb(matrix, local, undefined, arithmetic), out, arithmetic);
}

export interface NativeMarkerMatrixWrapperServices {
  memory(address: bigint, length: number): Uint8Array;
  matrixType(): bigint;
  voidType(): bigint;
  convertMatrix(out: Uint8Array, input: Uint8Array, targetType: bigint, sourceType: bigint): void;
  arithmetic?: NativeMarkerArithmeticServices;
}
/** Original member-pointer resolution, including this-adjustment and virtual
 * low-bit encoding. Unsupported derived methods remain explicit boundaries. */
function memberAddress(m: NativeObjectMemory, member: bigint, receiver: bigint): bigint {
  return member & 1n ? m.read64(m.read64(receiver) + member - 1n) : member;
}
export function applyNativeMarkerSetTransform(m: NativeObjectMemory, member: bigint, adjustment: bigint, receiver: bigint, args: { bytes: Uint8Array; type: bigint }[], s: NativeMarkerMatrixWrapperServices): void {
  if (args.length !== 1) throw new NativeObjectFoundationFailure('../../../Code/Base/Meta.h', 573, 3, '1 == argCount');
  s.voidType(); receiver = BigInt.asUintN(64, receiver + adjustment); const address = memberAddress(m, member, receiver);
  const converted = new Uint8Array(64), type = s.matrixType(); s.convertMatrix(converted, args[0].bytes, type, args[0].type);
  if (address !== 0x10043ccd0n) throw new Error(`Unrestored Marker SetTransform member ${address.toString(16)}`);
  setNativeMarkerTransform(s.memory(receiver, 80), converted, s.arithmetic);
}
export function applyNativeMarkerGetMatrix(m: NativeObjectMemory, member: bigint, adjustment: bigint, receiver: bigint, out: Uint8Array, resultType: bigint, argCount: number, s: NativeMarkerMatrixWrapperServices): void {
  if (argCount !== 0) throw new NativeObjectFoundationFailure('../../../Code/Base/Meta.h', 573, 3, '0 == argCount');
  receiver = BigInt.asUintN(64, receiver + adjustment); const address = memberAddress(m, member, receiver), result = new Uint8Array(64);
  if (address === 0x10043e2d0n) getNativeMarkerTransform(s.memory(receiver, 80), result, s.arithmetic);
  else if (address === 0x10043e470n) getNativeMarkerLocalObb(result);
  else if (address === 0x10043e4b0n) getNativeMarkerWorldObb(s.memory(receiver, 80), result, s.arithmetic);
  else throw new Error(`Unrestored Marker matrix member ${address.toString(16)}`);
  s.convertMatrix(out, result, resultType, s.matrixType());
}
