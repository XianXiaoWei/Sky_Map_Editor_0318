import fs from 'node:fs';
import path from 'node:path';
import { readResourceMesh, type ResourceMeshLOD } from '../src/core/resources';
import { resourceAnimationBoneMatrices, identityResourceSkeletonRoot } from '../src/core/resource-animation-matrices';
import { resourceAnimationSample, sampleResourceAnimation } from '../src/core/resource-animation-sample';
import { skinResourcePositions, skinResourcePositionsAndNormals } from '../src/core/resource-skinning';
import { u32 } from '../src/core/binary';
export interface ResourceSkinCase { id: string; source: Buffer; lod: ResourceMeshLOD; palette: Float32Array; }
export function resourceSkinningCases(data: string): ResourceSkinCase[] {
  const cases: ResourceSkinCase[] = [], dir = path.join(data, 'Meshes/Bin');
  for (const file of fs.readdirSync(dir).filter(n => n.endsWith('.mesh')).sort()) {
    const source = fs.readFileSync(path.join(dir, file)); if (!source[72]) continue;
    const mesh = readResourceMesh(source), pack = mesh.animation!;
    const palettes: [string, Float32Array][] = [];
    if (pack.frameCount && pack.defaultPose.length) {
      palettes.push(['default', resourceAnimationBoneMatrices(pack, pack.defaultPose)]);
      const clip = pack.tracks!.clips[0], start = clip.startFrame, end = clip.endFrame, span = end - start + 1;
      const pose = sampleResourceAnimation(pack, resourceAnimationSample(pack, [0, 1, 2, 3].map(i => start + i % span) as [number, number, number, number], 0.375));
      palettes.push(['sample', resourceAnimationBoneMatrices(pack, pose)]);
      const root = identityResourceSkeletonRoot(); root.pose.set([2, 0.5, -1]); root.pose.set([0.1, 0.2, -0.3, 0.9], 4); root.pose.set([12, -4, 6], 8); root.axisScale = [0.75, 2, 1.25];
      palettes.push(['sample-scaled-root', resourceAnimationBoneMatrices(pack, pose, root)]);
    } else {
      // A caller-supplied identity palette exercises stripped streams only;
      // it is never registered as a restored controller or drawable asset.
      const identity = new Float32Array((pack.bones.length + 1) * 16); for (let i = 0; i <= pack.bones.length; i++) identity.set([1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1], i * 16);
      palettes.push(['prepared-identity-stripped', identity]);
    }
    mesh.levels.forEach((lod, index) => palettes.forEach(([label, palette]) => cases.push({ id: `${file}:${index}:${label}`, source, lod, palette })));
  }
  return cases;
}
export function resourceSkinRequest(c: ResourceSkinCase): Buffer {
  return Buffer.concat([u32(c.lod.positions.length / 3), u32(c.palette.length / 16), ...c.lod.skinCounts!.map(u32), Buffer.from(c.lod.packedPositions!), Buffer.from(c.lod.packedNormals!.buffer, c.lod.packedNormals!.byteOffset, c.lod.packedNormals!.byteLength), Buffer.from(c.lod.packedSkin!), Buffer.from(c.palette.buffer)]);
}
export function resourceSkinExpected(c: ResourceSkinCase, pairs: Buffer) {
  let at = 0; const rsqrt = (bits: number) => { if (pairs.readUInt32LE(at) !== bits) throw new Error(`${c.id}: native normal RSQRT input ${at / 8} differs`); const output = pairs.readUInt32LE(at + 4); at += 8; return output; };
  const pos = skinResourcePositions(c.lod, c.palette), both = skinResourcePositionsAndNormals(c.lod, c.palette, { rsqrt }, new Int8Array(c.lod.positions.length / 3 * 4).fill(-91)), guard = Buffer.alloc(16, 0xa5);
  if (at !== pairs.length) throw new Error('Unused RSQRT inputs');
  return Buffer.concat([Buffer.from(pos), guard, Buffer.from(both.positions), guard, Buffer.from(both.normals.buffer), guard, Buffer.from(both.scratchNormals.buffer), guard]);
}
