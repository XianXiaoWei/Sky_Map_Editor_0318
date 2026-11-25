import evidence from '../../docs/meshes-evidence.json';
import { nativeDefaultMaterialParameters } from './level-material-runtime';

export interface MaterialDef {
  index: number; materialId: number; shaderName: string; color: number[];
  metalness: number; roughness: number; uvScale: number; minimumWeight: number; stopWeight: number;
  textures: { name: string; texture: string }[]; parameters: { name: string; vector: number[] }[];
  uniformOrder?: { name: string; nativeType: number; components: number }[];
}
export interface SurfaceBatch { surface: number; materialIndex: number; materialId: number; pass: 'opaque' | 'decal' | 'skirt'; start: number; count: number; shaderName: string; }
export interface SurfacePlan { indices: Uint32Array; counts: Uint32Array; batches: SurfaceBatch[]; omittedTriangles: number; }
export interface MaterialVertices { vertexCount: number; indices: Uint32Array; materialIds: Uint8Array; weights: Uint8Array; }

// Exact default and five level-specific tables, executed from MaterialDefBarn
// Initialize 0x10043fb70. Return independent values for each editor instance.
export function nativeMaterialDefs(level: string): MaterialDef[] {
  const levels = evidence.levels as Record<string, MaterialDef[]>;
  return structuredClone(levels[level] ?? evidence.default).map(def => ({ ...def, uniformOrder: nativeDefaultMaterialParameters(level, def.materialId).slice(5).map(p => ({ name: p.name, nativeType: p.nativeType, components: p.vector.length })) }));
}
export function nativeMaterialParameters(def: MaterialDef) {
  const extra = def.uniformOrder ? def.uniformOrder.map(p => p.nativeType === 1
    ? { ...def.textures.find(t => t.name === p.name)!, vector: [] as number[] }
    : def.parameters.find(v => v.name === p.name && v.vector.length === p.components)!)
    : [...def.parameters, ...def.textures.map(t => ({ ...t, vector: [] as number[] }))];
  return [{ name: 'u_materialId', vector: [def.materialId] },
    { name: 'u_matUvScale', vector: [def.uvScale] },
    { name: 'u_matRoughness', vector: [def.roughness] },
    { name: 'u_matMetalness', vector: [def.metalness] },
    { name: 'u_matColor', vector: def.color.slice(0, 3) }, ...extra];
}
function validate(v: MaterialVertices, defs: MaterialDef[]) {
  if (!defs.length || defs.length > 32 || defs.some((d,i) => d.index !== i || d.materialId < 1 || d.materialId > 255 || !Number.isInteger(d.materialId) || !Number.isInteger(d.minimumWeight) || !Number.isInteger(d.stopWeight) || d.minimumWeight < 0 || d.stopWeight > 255 || d.minimumWeight > d.stopWeight)) throw new Error('原版材质定义无效');
  if (!Number.isInteger(v.vertexCount) || v.vertexCount < 0 || v.indices.length % 3 || v.materialIds.length !== v.vertexCount * 4 || v.weights.length !== v.vertexCount * 4 || v.indices.some(i => i >= v.vertexCount)) throw new Error('材质顶点或三角形流无效');
  const lookup = new Int32Array(256).fill(-1);
  for (const d of defs) lookup[d.materialId] = d.index;
  return lookup;
}
function batch(defs: MaterialDef[], surface: number, pass: SurfaceBatch['pass'], start: number, count: number): SurfaceBatch {
  const index = pass === 'decal' ? surface - defs.length + 1 : surface, def = defs[index];
  return { surface, materialIndex: index, materialId: def.materialId, pass, start, count, shaderName: def.shaderName + (pass === 'decal' ? 'Alpha' : pass === 'skirt' ? 'AlphaSkirt' : '') };
}

// TerrainBarn scatter 0x1006a7280: each vertex stops at ID 0 or at the
// first weight >= stopWeight. Include only weight > minimumWeight. The lowest
// material ordinal of the triangle is opaque; every other ordinal is a decal.
// The 30 material bits fit uint32; output has 59 surfaces, without truncation.
function terrainTriangleMasks(v: MaterialVertices, defs: MaterialDef[]):Uint32Array {
  const lookup = validate(v, defs), masks = new Uint32Array(v.vertexCount), triangles = new Uint32Array(v.indices.length / 3);
  const referenced = new Uint8Array(v.vertexCount); for (const index of v.indices) referenced[index] = 1;
  for (let i = 0; i < v.vertexCount; i++) {
    if (!referenced[i]) continue;
    let mask = 0;
    for (let slot = 0; slot < 4; slot++) {
      const at = i * 4 + slot, id = v.materialIds[at]; if (!id) break;
      const index = lookup[id]; if (index < 0) throw new Error(`顶点 ${i} 的材质 ${id} 没有原版定义`);
      const def = defs[index], weight = v.weights[at]; if (weight > def.minimumWeight) mask |= 1 << index;
      if (weight >= def.stopWeight) break;
    }
    masks[i] = mask;
  }
  for(let t=0;t<triangles.length;t++)triangles[t]=(masks[v.indices[t*3]]|masks[v.indices[t*3+1]]|masks[v.indices[t*3+2]])>>>0;
  return triangles;
}
/** Same original material classification for contiguous native bin ranges,
 * avoiding repeated scans of every vertex for each loaded terrain bin. */
export function terrainPartitionSurfaceCounts(v:MaterialVertices,defs:MaterialDef[],indexCounts:readonly number[]):Uint32Array[] {
  if(indexCounts.some(n=>!Number.isSafeInteger(n)||n<0||n%3)||indexCounts.reduce((a,b)=>a+b,0)!==v.indices.length)throw new Error('Terrain surface index partition');
  const triangles=terrainTriangleMasks(v,defs),n=defs.length;let at=0;
  return indexCounts.map(count=>{
    const result=new Uint32Array(n*2-1),end=at+count/3;
    for(;at<end;at++) {
      let mask=triangles[at];if(!mask)continue;
      const first=31-Math.clz32(mask&-mask);result[first]+=3;mask=(mask&(mask-1))>>>0;
      while(mask){const index=31-Math.clz32(mask&-mask);result[n+index-1]+=3;mask=(mask&(mask-1))>>>0;}
    }
    return result;
  });
}
export function terrainSurfaces(v: MaterialVertices, defs: MaterialDef[]): SurfacePlan {
  const n=defs.length,triangles=terrainTriangleMasks(v,defs),counts=new Uint32Array(n*2-1);
  let total = 0, omittedTriangles = 0;
  for (let t = 0; t < triangles.length; t++) {
    let mask = triangles[t];
    if (!mask) { omittedTriangles++; continue; }
    const first = 31 - Math.clz32(mask & -mask); counts[first] += 3; total += 3; mask = (mask & (mask - 1)) >>> 0;
    while (mask) { const index = 31 - Math.clz32(mask & -mask); counts[n + index - 1] += 3; total += 3; mask = (mask & (mask - 1)) >>> 0; }
  }
  const indices = new Uint32Array(total), cursor = new Uint32Array(counts.length), batches: SurfaceBatch[] = [];
  let start = 0; for (let s = 0; s < counts.length; s++) { cursor[s] = start; if (counts[s]) batches.push(batch(defs, s, s < n ? 'opaque' : 'decal', start, counts[s])); start += counts[s]; }
  for (let t = 0; t < triangles.length; t++) {
    let mask = triangles[t], first = true;
    while (mask) {
      const index = 31 - Math.clz32(mask & -mask), surface = first ? index : n + index - 1, at = cursor[surface];
      indices[at] = v.indices[t*3]; indices[at+1] = v.indices[t*3+1]; indices[at+2] = v.indices[t*3+2]; cursor[surface] += 3;
      first = false; mask = (mask & (mask - 1)) >>> 0;
    }
  }
  return { indices, counts, batches, omittedTriangles };
}

// SkirtBarn 0x1005ac7ad..0x1005ac88c: presence tests all four nonzero
// IDs, including slots behind a zero ID and slots with zero weight. Draw the
// complete original skirt index range for each present material, in def order.
export function skirtSurfaces(v: MaterialVertices, defs: MaterialDef[]): SurfacePlan {
  const lookup = validate(v, defs), present = new Uint8Array(defs.length);
  for (const id of v.materialIds) { if (!id) continue; const i = lookup[id]; if (i >= 0) present[i] = 1; }
  const batches: SurfaceBatch[] = [], counts = new Uint32Array(defs.length);
  for (let i = 0; i < present.length; i++) if (present[i] && v.indices.length) { counts[i] = v.indices.length; batches.push(batch(defs, i, 'skirt', 0, v.indices.length)); }
  return { indices: v.indices, counts, batches, omittedTriangles: batches.length ? 0 : v.indices.length / 3 };
}

// Match Terrain.vert exactly: bytes enter as UNORM8, then ivec4(value*256).
// Weights stay byte/255, even when their sum differs from 255.
export function materialAlpha(ids: ArrayLike<number>, weights: ArrayLike<number>, materialId: number) {
  if (ids.length !== 4 || weights.length !== 4) throw new Error('材质属性需要四个分量');
  let alpha = 0; for (let i = 0; i < 4; i++) if (Math.trunc(ids[i] / 255 * 256) === materialId) alpha += weights[i] / 255;
  return alpha;
}
