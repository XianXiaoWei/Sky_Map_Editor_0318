import {createHash} from 'node:crypto';

export const CREATURE_OCCLUSION_VERTEX_SHA256='5afc6d435f82c46a538239344fafcaa8ff82512e61016a686023e5d11efbcc1c';
/** The saved UNORM occlusion stream can contain zero. GLES log2(0) becomes
 * infinity, then raster interpolation produces NaN. Bound only that zero
 * endpoint to the smallest positive half value for this Vulkan adapter.
 * Every positive UNORM8 value is larger and retains the original expression.
 * This is a numerical preview guard, not claimed original Metal log2 parity;
 * original resource bytes and shader files remain unchanged. */
export function finiteCreatureOcclusionVertex(source:string){
 if(createHash('sha256').update(source).digest('hex')!==CREATURE_OCCLUSION_VERTEX_SHA256)return source;
 return source.replace('log2(a_color.xzy)','log2(max(a_color.xzy, vec3(5.960464477539063e-8)))');
}
