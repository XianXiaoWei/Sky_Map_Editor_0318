import evidence from '../../docs/model-parameter-native.json';
/** Original Scene 0x100059a50 observes Image Caustics and binds u_caustics at
 * 0x10005a71e..0x10005a796, with null sampler pointer. These resource identities
 * are disassembly-backed; full Scene registry/ref lifetime remains pending. */
export const MODEL_NATIVE_TEXTURE_GLOBALS:Readonly<Record<string,string>>=Object.freeze(Object.fromEntries(Object.entries(evidence.sceneTextureGlobals).map(([name,source])=>[name,source.resource])));
