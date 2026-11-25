import type { ModelBakeMemory } from './model-baked-runtime';
import { numericFloatValue } from './object-numeric-runtime';

/** Original BeamoBarn.Load resolved-resource subchain 0x100195427..678.
 * The preceding pass sets runtime+0x10 to a Beamo or null for BeamoDecal.
 * ResourceRef lookup/observation, the <5 Mesh LOD assertion and the runtime
 * record already exist. They are caller dependencies, not allocated here.
 * This preserves default-distance writes, first/two-LOD pointer/count checks,
 * and the final accepted-record pointer. It does not create GPU draw data.
 */
export function selectOriginalBeamoBake(m: ModelBakeMemory, runtime: bigint, lookupSucceeded: boolean, record: bigint): boolean {
  const data = () => m.read64(runtime + 0x18n);
  const count = () => m.read32(data() + 0x40n);
  const lods = () => m.read64(data() + 0x48n);
  const normal = m.read64(runtime + 0x10n);
  let accepted = lookupSucceeded && m.read32(record + 0x1cn) === count();
  m.write32(runtime + 0xb8n, 0);
  let selected = 0;
  // Beamo checks the opaque/extra pointer at +16, not the ordinary 12-byte
  // light pointer at +8. The following geometry upload consumes them separately.
  const extraMatches = (lod: number) => {
    if (!accepted || !record) return false;
    const loaded = m.read64(record + 0x28n) + BigInt(lod) * 24n;
    return m.read64(loaded + 16n) !== 0n && m.read32(loaded) === m.read32(lods() + BigInt(lod) * 0xb8n + 0x34n);
  };
  if (normal) {
    if (numericFloatValue(m.read32(normal + 0xa0n)) !== 0 && count() !== 0) {
      if (numericFloatValue(m.read32(normal + 0x90n)) <= 0) {
        m.write32(normal + 0x90n, m.read32(lods()));
        selected = m.read32(runtime + 0xb8n);
      }
      if (selected === 0) selected = 1;
      m.write32(runtime + 0xb8n, selected);
      accepted = extraMatches(0);
    }
    if (numericFloatValue(m.read32(normal + 0xa4n)) !== 0 && count() >= 2) {
      if (numericFloatValue(m.read32(normal + 0x94n)) <= 0) {
        m.write32(normal + 0x94n, m.read32(lods() + 0xb8n));
        selected = m.read32(runtime + 0xb8n);
      }
      if (selected <= 2) selected = 2;
      m.write32(runtime + 0xb8n, selected);
      accepted = extraMatches(1);
    }
  } else if (count() !== 0) {
    m.write32(runtime + 0xb8n, 1);
    accepted = extraMatches(0);
    if (count() > 1) {
      m.write32(runtime + 0xb8n, 2);
      accepted = extraMatches(1);
    }
  }
  m.write64(runtime + 0x20n, accepted ? record : 0n);
  return accepted;
}
