export interface OriginalEventConstructionMetadata {
  eventClassId: number;
  eventVptr: bigint;
}
/** Whole Event constructor 0x10032eea0 with the registered metadata/vptr
 * supplied explicitly. Fields not written by the original remain intact;
 * Barn registration and unique-ID initialization are separate operations. */
export function constructOriginalEvent(storage: Uint8Array, metadata: OriginalEventConstructionMetadata): void {
  if (storage.byteLength < 0x38) throw new Error('Original Event storage truncated');
  const v = new DataView(storage.buffer, storage.byteOffset, storage.byteLength);
  v.setUint32(8, metadata.eventClassId >>> 0, true);
  v.setBigUint64(0, metadata.eventVptr, true);
  v.setUint8(0xc, 0);
  v.setBigUint64(0x18, 0n, true);
  v.setUint32(0x21, 0x01000000, true);
  v.setUint8(0x25, 0);
  v.setUint32(0x28, 0, true);
  v.setUint16(0x2c, 0xffff, true);
  v.setUint8(0x2e, 0xff);
}
/** Whole FloatMult placement constructor 0x100719090, including its Event
 * base constructor. Object* is storage+8; field offsets use storage itself.
 * The three Float pointer fields are retained until TGCL assigns them. */
export function constructOriginalFloatMult(storage: Uint8Array, classId: number, vptr: bigint, metadata: OriginalEventConstructionMetadata): void {
  if (storage.byteLength < 0x50) throw new Error('Original FloatMult storage truncated');
  constructOriginalEvent(storage, metadata);
  const v = new DataView(storage.buffer, storage.byteOffset, storage.byteLength);
  v.setUint32(8, classId >>> 0, true);
  v.setBigUint64(0, vptr, true);
}

/** Whole FloatAdd placement 0x100719390. All numeric/pointer fields retain
 * their allocation contents until ReadFields/default-cache application. */
export function constructOriginalFloatAdd(storage: Uint8Array, classId: number, metadata: OriginalEventConstructionMetadata): void {
  if (storage.byteLength < 0x60) throw new Error('Original FloatAdd storage truncated');
  constructOriginalEvent(storage, metadata);
  const v = new DataView(storage.buffer, storage.byteOffset, storage.byteLength);
  v.setUint32(8, classId >>> 0, true); v.setBigUint64(0, 0x100d0cdd8n, true);
}

/** Whole SetFloat placement 0x1007175d0. Load, enable and resume perform the
 * separate original progress/initial-value initialization. */
export function constructOriginalSetFloat(storage: Uint8Array, classId: number, metadata: OriginalEventConstructionMetadata): void {
  if (storage.byteLength < 0x58) throw new Error('Original SetFloat storage truncated');
  constructOriginalEvent(storage, metadata);
  const v = new DataView(storage.buffer, storage.byteOffset, storage.byteLength);
  v.setUint32(8, classId >>> 0, true); v.setBigUint64(0, 0x100d0c0b8n, true);
}
