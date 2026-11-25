import { NativeObjectFoundationFailure, type NativeObjectMemory } from './object-foundation-runtime';
export interface NativeStringMemory extends NativeObjectMemory {
  read8(address: bigint): number;
  write8(address: bigint, value: number): void;
  write32(address: bigint, value: number): void;
  copy(destination: bigint, source: bigint, count: number): void;
  move(destination: bigint, source: bigint, count: number): void;
}
export interface NativeStringGrowthServices {
  growAndReplace(destination: bigint, capacity: bigint, delta: bigint, oldLength: bigint, position: bigint, eraseLength: bigint, insertLength: bigint, source: bigint): void;
}
export interface NativeStringPoolServices {
  getPool(): bigint;
  allocate(pool: bigint, bytes: bigint): bigint;
  release(pool: bigint, data: bigint): void;
}
export class NativeStringLengthError extends Error {
  constructor() { super('Original libc++ string length_error'); this.name = 'NativeStringLengthError'; }
}
const uint64 = (value: bigint) => BigInt.asUintN(64, value);
/** Whole original libc++ grow-and-replace body 0x1000198c0. The game's
 * pool allocator/free remain explicit services. Copy/free order precedes
 * descriptor writes, including when source aliases the old string. */
export function growNativeStringAndReplace(memory: NativeStringMemory, destination: bigint, capacity: bigint, delta: bigint, oldLength: bigint, position: bigint, eraseLength: bigint, insertLength: bigint, source: bigint, services: NativeStringPoolServices): void {
  capacity = uint64(capacity); delta = uint64(delta);
  oldLength = uint64(oldLength); position = uint64(position);
  eraseLength = uint64(eraseLength); insertLength = uint64(insertLength);
  if (uint64(0xfefn - capacity) < delta) throw new NativeStringLengthError();
  const oldData = memory.read8(destination) & 1 ? memory.read64(destination + 16n) : uint64(destination + 1n);
  let allocationSize: bigint;
  if (capacity > 0x7e7n) allocationSize = 0xff0n;
  else {
    const requested = uint64(capacity + delta), doubled = uint64(capacity * 2n);
    const candidate = requested < doubled ? doubled : requested;
    allocationSize = candidate < 23n ? 23n : uint64(candidate + 16n) & ~15n;
  }
  const data = services.allocate(services.getPool(), allocationSize);
  if (position) memory.copy(data, oldData, Number(position));
  if (insertLength) memory.copy(uint64(data + position), source, Number(insertLength));
  const keptLength = uint64(oldLength - eraseLength), tailLength = uint64(keptLength - position);
  if (tailLength) memory.copy(uint64(data + position + insertLength), uint64(oldData + position + eraseLength), Number(tailLength));
  if (capacity !== 22n) services.release(services.getPool(), oldData);
  memory.write64(destination + 16n, data);
  memory.write64(destination, allocationSize | 1n);
  const length = uint64(keptLength + insertLength);
  memory.write64(destination + 8n, length);
  memory.write8(uint64(data + length), 0);
}
/** The inlined libc++ 24-byte string assignment in the TGCL reader. Growth
 * is the original 0x1000198c0 dependency; short/long capacity, overlap-safe
 * copying, NUL and length writes are preserved here. */
export function assignNativeCString(memory: NativeStringMemory, destination: bigint, source: bigint, services: NativeStringGrowthServices): void {
  const length = BigInt(memory.string(source).length), tag = memory.read8(destination);
  const long = (tag & 1) !== 0;
  const capacity = long ? (memory.read64(destination) & ~1n) - 1n : 22n;
  if (length > capacity) {
    const oldLength = long ? memory.read64(destination + 8n) : BigInt(tag >>> 1);
    services.growAndReplace(destination, capacity, length - capacity, oldLength, 0n, oldLength, length, source);
    return;
  }
  const data = long ? memory.read64(destination + 16n) : destination + 1n;
  if (length) memory.move(data, source, Number(length));
  memory.write8(data + length, 0);
  if (memory.read8(destination) & 1) memory.write64(destination + 8n, length);
  else memory.write8(destination, Number(length) * 2);
}
/** Whole LevelObjects string reader 0x10040b1d0. The second strlen happens
 * AFTER assignment and may observe aliasing. Cursor update precedes the
 * bounds assertion, including when destination is null (skip string). */
export function readNativeTgclString(memory: NativeStringMemory, context: bigint, destination: bigint, services: NativeStringGrowthServices): void {
  const source = memory.read64(context + 0x1470n) + BigInt(memory.read32(context + 0x147cn));
  if (destination) assignNativeCString(memory, destination, source, services);
  const next = (memory.read32(context + 0x147cn) + memory.string(source).length + 1) >>> 0;
  memory.write32(context + 0x147cn, next);
  if (next > memory.read32(context + 0x1478n)) throw new NativeObjectFoundationFailure('LevelObjects.cpp', 167, 3, 'ctx->dataHead <= ctx->dataMax');
}
