import * as THREE from 'three';
import type { CloudTexture, CloudVolume } from '../core/cloud-volume';

export interface CloudTextureData { textures: CloudTexture[]; bindings: CloudVolume['bindings']; }
const uniforms = { CloudSparseGrid: 'u_cloudSparse', CloudPackedDistGrid: 'u_cloudDist', CloudPackedAmb0Grid: 'u_cloudAmb0', CloudPackedAmb1Grid: 'u_cloudAmb1', CloudPackedAmb2Grid: 'u_cloudAmb2' } as const;

// CloudBarn::Initialize uses nearest/clamp for sparse, linear/clamp for the
// four packed fields, and linear/repeat for procedural noise. No mipmaps.
// Native sampler enums are decoded by 0x100a6aa30; address table 0x100b066a0.
export function createCloudTextures(input: CloudTextureData) {
  const textures: Record<string, THREE.Data3DTexture> = {};
  if (input.textures.length !== 5 || new Set(input.textures.map(t => t.name)).size !== 5) throw new Error('实体云需要完整的五张纹理');
  try {
    for (const field of input.textures) {
      const name = uniforms[field.name], [w, h, d] = field.dimensions;
      if (!name || ![w, h, d].every(n => Number.isInteger(n) && n > 0) || ![1, 4].includes(field.channels) || field.data.length !== w * h * d * field.channels) throw new Error('云纹理尺寸或数据无效');
      const texture = new THREE.Data3DTexture(field.data, w, h, d);
      texture.name = field.name; texture.type = THREE.UnsignedByteType;
      texture.format = field.channels === 1 ? THREE.RedFormat : THREE.RGBAFormat;
      texture.internalFormat = field.channels === 1 ? 'R8' : 'RGBA8';
      texture.minFilter = texture.magFilter = field.name === 'CloudSparseGrid' ? THREE.NearestFilter : THREE.LinearFilter;
      texture.wrapS = texture.wrapT = texture.wrapR = THREE.ClampToEdgeWrapping;
      texture.generateMipmaps = false; texture.unpackAlignment = 1;
      texture.colorSpace = THREE.NoColorSpace; texture.flipY = false; texture.needsUpdate = true;
      textures[name] = texture;
    }
    return { textures, bindings: { ...input.bindings, ...textures }, dispose: () => Object.values(textures).forEach(t => t.dispose()) };
  } catch (e) { Object.values(textures).forEach(t => t.dispose()); throw e; }
}
