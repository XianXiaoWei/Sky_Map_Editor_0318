import type { ResourceMeshLOD } from './resources';
import { numericFloatBits as bits, numericFloatValue as value, truncateOriginalFloatToInt } from './object-numeric-runtime';

const f = Math.fround, add = (a: number, b: number) => f(a + b), mul = (a: number, b: number) => f(a * b);
const min = (a: number, b: number) => a < b ? a : b, max = (a: number, b: number) => a > b ? a : b;
const inverse255 = value(0x3b808081);
export interface ResourceSkinNormalServices {
  /** Original RSQRTSS is hardware-specific. Unknown inputs must stay an
   * explicit dependency rather than silently use JavaScript 1/sqrt. */
  rsqrt(inputBits: number): number;
}
function validate(lod: ResourceMeshLOD, palette: Float32Array, requireNormals: boolean) {
  const count = lod.positions.length / 3, groups = lod.skinCounts;
  if (!Number.isInteger(count) || !groups || groups.length !== 4 || groups.some(n => !Number.isInteger(n) || n < 0) || groups.reduce((a, b) => a + b, 0) !== count) throw new Error('原蒙皮顶点分组无效');
  if (lod.packedPositions?.length !== count * 16 || lod.packedSkin?.length !== count * 8 || requireNormals && lod.packedNormals?.length !== count * 4) throw new Error('原蒙皮顶点流缺失');
  if (!palette.length || palette.length % 16 || palette.length > 257 * 16 || !palette.every(Number.isFinite)) throw new Error('原蒙皮骨骼矩阵无效');
  let vertex = 0;
  for (let group = 0; group < 4; group++) for (let j = 0; j < groups[group]; j++, vertex++) for (let influence = 0; influence <= group; influence++) {
    if (lod.packedSkin[vertex * 8 + influence] >= palette.length / 16) throw new Error('原蒙皮骨骼索引越界');
  }
  return count;
}
/** Entire position consumer 0x100457f50 / 0x100457f70 with a present skin
 * stream. 1..4 influences are contiguous groups from LOD+0x50. Color bytes
 * are copied unchanged. Weights are not renormalized: the native branch
 * sums transformed positions times integer weights, then multiplies by 1/255. */
export function skinResourcePositions(lod: ResourceMeshLOD, palette: Float32Array): Uint8Array {
  const count = validate(lod, palette, false), out = lod.packedPositions!.slice(), input = new DataView(lod.packedPositions!.buffer, lod.packedPositions!.byteOffset, count * 16), dest = new DataView(out.buffer);
  let vertex = 0;
  for (let group = 0; group < 4; group++) for (let j = 0; j < lod.skinCounts![group]; j++, vertex++) {
    const p = [0, 1, 2].map(lane => input.getFloat32(vertex * 16 + lane * 4, true));
    for (let lane = 0; lane < 3; lane++) {
      let sum = 0;
      for (let influence = 0; influence <= group; influence++) {
        const at = lod.packedSkin![vertex * 8 + influence] * 16, w = lod.packedSkin![vertex * 8 + 4 + influence];
        const transformed = add(add(add(mul(p[0], palette[at + lane]), mul(p[1], palette[at + 4 + lane])), mul(p[2], palette[at + 8 + lane])), palette[at + 12 + lane]);
        const weighted = mul(transformed, w); sum = influence ? add(sum, weighted) : weighted;
      }
      dest.setFloat32(vertex * 16 + lane * 4, mul(sum, inverse255), true);
    }
  }
  return out;
}
/** Entire position+normal consumer 0x100458540 / 0x100458570 / 0x100458bd0.
 * This branch converts weights before transforming; that rounding differs
 * from the position-only branch. Normals use the palette basis (not an
 * inverse transpose), normalize via RSQRTSS and truncate at 127.999.
 * The fourth normal byte is caller-owned and remains untouched. */
export function skinResourcePositionsAndNormals(lod: ResourceMeshLOD, palette: Float32Array, services: ResourceSkinNormalServices, initialNormals?: Int8Array) {
  const count = validate(lod, palette, true);
  if (initialNormals && initialNormals.length !== count * 4) throw new Error('原蒙皮输出法线长度不符');
  const positions = lod.packedPositions!.slice(), normals = initialNormals?.slice() ?? new Int8Array(count * 4), input = new DataView(lod.packedPositions!.buffer, lod.packedPositions!.byteOffset, count * 16), output = new DataView(positions.buffer), scratchNormals = new Float32Array(count * 4);
  let vertex = 0;
  for (let group = 0; group < 4; group++) for (let j = 0; j < lod.skinCounts![group]; j++, vertex++) {
    const positionAt=vertex*16,normalAt=vertex*4,skinAt=vertex*8;
    const px=input.getFloat32(positionAt,true),py=input.getFloat32(positionAt+4,true),pz=input.getFloat32(positionAt+8,true);
    const nx=lod.packedNormals![normalAt],ny=lod.packedNormals![normalAt+1],nz=lod.packedNormals![normalAt+2];
    let sx=0,sy=0,sz=0,tx=0,ty=0,tz=0;
    // Keep the original per-lane multiply/add order and first-influence
    // assignment, including signed zero. Read each weight and source once.
    for(let influence=0;influence<=group;influence++){
      const at=lod.packedSkin![skinAt+influence]*16,w=mul(lod.packedSkin![skinAt+4+influence],inverse255);
      const x=mul(add(add(add(mul(px,palette[at]),mul(py,palette[at+4])),mul(pz,palette[at+8])),palette[at+12]),w);
      const y=mul(add(add(add(mul(px,palette[at+1]),mul(py,palette[at+5])),mul(pz,palette[at+9])),palette[at+13]),w);
      const z=mul(add(add(add(mul(px,palette[at+2]),mul(py,palette[at+6])),mul(pz,palette[at+10])),palette[at+14]),w);
      const normalX=mul(add(add(mul(nx,palette[at]),mul(ny,palette[at+4])),mul(nz,palette[at+8])),w);
      const normalY=mul(add(add(mul(nx,palette[at+1]),mul(ny,palette[at+5])),mul(nz,palette[at+9])),w);
      const normalZ=mul(add(add(mul(nx,palette[at+2]),mul(ny,palette[at+6])),mul(nz,palette[at+10])),w);
      if(influence){sx=add(sx,x);sy=add(sy,y);sz=add(sz,z);tx=add(tx,normalX);ty=add(ty,normalY);tz=add(tz,normalZ);}
      else{sx=x;sy=y;sz=z;tx=normalX;ty=normalY;tz=normalZ;}
    }
    output.setFloat32(positionAt,sx,true);output.setFloat32(positionAt+4,sy,true);output.setFloat32(positionAt+8,sz,true);
    scratchNormals[normalAt]=tx;scratchNormals[normalAt+1]=ty;scratchNormals[normalAt+2]=tz;
  }
  for (let i = 0; i < count; i++) {
    const at=i*4,nx=scratchNormals[at],ny=scratchNormals[at+1],nz=scratchNormals[at+2],square=add(mul(nz,nz),add(mul(nx,nx),mul(ny,ny))),reciprocal=value(services.rsqrt(bits(square)));
    for(let lane=0;lane<3;lane++)normals[at+lane]=truncateOriginalFloatToInt(bits(min(max(mul(mul(scratchNormals[at+lane],reciprocal),value(0x42ffff7d)),-128),127)));
  }
  return { positions, normals, scratchNormals };
}
