import type { ModelBakeMemory } from './model-baked-runtime';
import { NativeObjectFoundationFailure } from './object-foundation-runtime';
import { constructOriginalResourceRef, destroyOriginalResourceRef, observeOriginalResource, type ResourceRefServices } from './resource-ref-runtime';
import { registerOriginalAnimationPack, type ResourceAnimationRegistrationServices } from './resource-animation-control';

export interface ResourceAnimationLoadServices {
  /** Actual temporary ABI storage (32 bytes), retaining its unwritten padding. */
  temporaryRef(): bigint;
  refs: ResourceRefServices;
  meshType(): bigint;
  animationPackType(): bigint;
  lookup(manager: bigint, type: bigint, name: bigint): bigint;
  registration: ResourceAnimationRegistrationServices;
}
/** Complete normal Animation.LoadPack 0x1000942e0. Both resource classes are
 * looked up independently, Mesh first, external AnimationPack second. Existing
 * resources are observed through original ResourceRef list/callback bodies;
 * registration initializes/finalizes them directly. A missing lookup does not
 * request a substitute load. Exceptions/unwind remain an owner dependency. */
export function loadOriginalResourceAnimationPack(m: ModelBakeMemory, controller: bigint, manager: bigint, name: bigint, s: ResourceAnimationLoadServices) {
  const meshRef = s.temporaryRef(); constructOriginalResourceRef(m, meshRef);
  const mesh = s.lookup(manager, s.meshType(), name);
  if (mesh) {
    observeOriginalResource(m, mesh, meshRef, s.refs);
    const handle = m.read64(meshRef), data = handle ? m.read64(handle + 16n) : 0n;
    if (!data) throw new NativeObjectFoundationFailure('./Mesh.h', 109, 3, 'Observed()');
    const pack = m.read64(data + 0x100n);
    if (pack) registerOriginalAnimationPack(m, controller, pack, s.registration);
  }
  const packRef = s.temporaryRef(); constructOriginalResourceRef(m, packRef);
  const external = s.lookup(manager, s.animationPackType(), name);
  if (external) {
    observeOriginalResource(m, external, packRef, s.refs);
    const handle = m.read64(packRef), data = handle ? m.read64(handle + 16n) : 0n;
    if (!data) throw new NativeObjectFoundationFailure('./AnimationPack.h', 265, 3, 'Observed()');
    registerOriginalAnimationPack(m, controller, data + 0x70n, s.registration);
  }
  destroyOriginalResourceRef(m, packRef, s.refs);
  destroyOriginalResourceRef(m, meshRef, s.refs);
}
function equalName(m: ModelBakeMemory, a: bigint, b: bigint) {
  for (let i = 0; ; i++) { const x = m.bytes(a + BigInt(i), 1)[0], y = m.bytes(b + BigInt(i), 1)[0]; if (x !== y) return false; if (!x) return true; }
}
/** Whole Animation.Load 0x100095170. Model constructor supplies the saved
 * animation group name. Uses the actual owner's registry array, first exact
 * case-sensitive match and live pack-name count after each child call. Returns
 * names processed, including missing resources, rather than packs registered. */
export function loadOriginalResourceAnimation(m: ModelBakeMemory, controller: bigint, manager: bigint, name: bigint, registry: bigint, s: ResourceAnimationLoadServices) {
  const count = m.read32(registry);
  for (let i = 0; i < count; i++) {
    const group = m.read64(registry + 8n + BigInt(i * 8));
    if (!equalName(m, m.read64(group), name)) continue;
    if (!m.read32(group + 8n)) return 0;
    let loaded = 0;
    do {
      loadOriginalResourceAnimationPack(m, controller, manager, m.read64(group + 16n + BigInt(loaded * 8)), s);
      loaded = (loaded + 1) >>> 0;
    } while (loaded < m.read32(group + 8n));
    return loaded;
  }
  return 0;
}
