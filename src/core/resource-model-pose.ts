import type { ResourceMesh, ResourceMeshLOD } from './resources';
import { resourceAnimationBoneMatrices } from './resource-animation-matrices';
import { skinResourcePositionsAndNormals } from './resource-skinning';
import { originalBeamoRsqrtCapability } from './beamo-draw';
import evidence from '../../docs/resource-skinning-rsqrt.json';

let capability: ReturnType<typeof originalBeamoRsqrtCapability> | undefined;
function arithmetic() {
  if (!capability) capability = originalBeamoRsqrtCapability(Uint8Array.from(atob(evidence.data), c => c.charCodeAt(0)));
  return capability;
}
/** Editor default-pose projection. Uses the original embedded pose and bind
 * matrices; it never supplies guessed playback/AI or fills stripped packs.
 * The object transform is applied by the existing model draw consumer. */
export function defaultResourceModelPose(mesh: ResourceMesh, lodIndex = 0): ResourceMeshLOD {
  const lod = mesh.levels[lodIndex]; if (!lod) throw new Error('原模型 LOD 不存在');
  if (!mesh.animated) return lod;
  const pack = mesh.animation;
  if (!pack?.frameCount || !pack.defaultPose.length) throw new Error('原模型需要外部骨骼与动画资源');
  return resourceModelPose(mesh,pack.defaultPose,lodIndex);
}
/** Projects a caller-selected original pose into the actual packed draw
 * streams. No playback policy or creature AI is inferred here. */
export function resourceModelPose(mesh:ResourceMesh,pose:Float32Array,lodIndex=0,rsqrt=arithmetic()):ResourceMeshLOD {
  const lod=mesh.levels[lodIndex],pack=mesh.animation;
  if(!lod||!mesh.animated||!pack?.frameCount)throw new Error('原动态模型缺少 LOD 或骨骼资源');
  const skin = skinResourcePositionsAndNormals(lod, resourceAnimationBoneMatrices(pack, pose), { rsqrt });
  const count = lod.positions.length / 3, positions = new Float32Array(count * 3), normals = new Float32Array(count * 3), view = new DataView(skin.positions.buffer);
  for (let i = 0; i < count; i++) for (let lane = 0; lane < 3; lane++) {
    positions[i * 3 + lane] = view.getFloat32(i * 16 + lane * 4, true);
    if (!Number.isFinite(positions[i * 3 + lane])) throw new Error('原蒙皮结果包含非有限坐标');
    normals[i * 3 + lane] = Math.max(-1, skin.normals[i * 4 + lane] / 127);
  }
  return { ...lod, positions, normals, packedPositions: skin.positions, packedNormals: skin.normals };
}
