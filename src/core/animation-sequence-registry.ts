import snapshot from './original-animation-sequence-registry.json';
import type { ModelBakeMemory } from './model-baked-runtime';

export const ORIGINAL_ANIMATION_SEQUENCE_REGISTRY_SOURCE = {
  executableSha256: snapshot.executableSha256,
  initializer: snapshot.initializer,
  nativeOutputSha256: snapshot.nativeOutputSha256,
  count: snapshot.records.length,
};
const decode = (hex: string) => Uint8Array.from(hex.match(/../g)!, n => parseInt(n, 16));
/** Load the complete registry captured by executing 0x10009fe60..0x1000dd000
 * from the SHA-gated original. Preserve all record bytes, order, shared step
 * identity, restrictions and flags, relocating only its embedded pointers.
 * This is a portable data owner, not a reimplementation of the initializer. */
export function loadOriginalAnimationSequenceRegistry(m: ModelBakeMemory, allocate: (length: number, alignment: number) => bigint): bigint {
  const objects = new Map<string, bigint>(), strings = new Map<bigint, bigint>();
  const block = (address: string, hex: string) => {
    let p = objects.get(address);
    if (p === undefined) { const bytes = decode(hex); p = allocate(bytes.length, 8); m.bytes(p, bytes.length).set(bytes); objects.set(address, p); }
    return p;
  };
  const text = (original: bigint, name: string) => {
    let p = strings.get(original);
    if (p === undefined) { const bytes = new TextEncoder().encode(name + '\0'); p = allocate(bytes.length, 1); m.bytes(p, bytes.length).set(bytes); strings.set(original, p); }
    return p;
  };
  const registry = allocate(8 + snapshot.records.length * 8, 8);
  m.bytes(registry, 8 + snapshot.records.length * 8).fill(0); m.write32(registry, snapshot.records.length);
  for (let i = 0; i < snapshot.records.length; i++) {
    const row = snapshot.records[i], sequence = block(row.address, row.imageHex);
    m.write64(registry + 8n + BigInt(i * 8), sequence);
    // Shared sequence entries must not interpret an already relocated name
    // pointer as an original address. Obtain pointer keys from the snapshot.
    const image = new DataView(decode(row.imageHex).buffer);
    m.write64(sequence, text(image.getBigUint64(0, true), row.name));
    for (let j = 0; j < row.steps.length; j++) {
      const stepRow = row.steps[j], step = block(stepRow.address, stepRow.imageHex);
      const stepImage = new DataView(decode(stepRow.imageHex).buffer);
      m.write64(step + 8n, text(stepImage.getBigUint64(8, true), stepRow.name));
      m.write64(sequence + 0x20n + BigInt(j * 8), step);
    }
  }
  return registry;
}
