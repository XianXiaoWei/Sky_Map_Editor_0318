import type { ResourceAnimationPack } from './resource-animation';
import { transformNativeObb } from './marker-transform-runtime';

export interface ResourceSkeletonRoot { pose: Float32Array; axisScale: [number, number, number]; }
export function identityResourceSkeletonRoot(): ResourceSkeletonRoot {
  return { pose: Float32Array.of(1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0), axisScale: [1, 1, 1] };
}
const f = Math.fround, mul = (a: number, b: number) => f(a * b), add = (a: number, b: number) => f(a + b), sub = (a: number, b: number) => f(a - b);
const bytes = (a: Float32Array) => new Uint8Array(a.buffer, a.byteOffset, a.byteLength);
function multiply(a: Float32Array, b: Float32Array): Float32Array {
  const out = new Float32Array(16); transformNativeObb(bytes(a), bytes(b), bytes(out)); return out;
}
export function resourceAnimationLocalMatrix(pose: Float32Array, at: number, parentScale: ArrayLike<number>, axisScale: ArrayLike<number>): Float32Array {
  const x = pose[at + 4], y = pose[at + 5], z = pose[at + 6], w = pose[at + 7], x2 = add(x, x), y2 = add(y, y), z2 = add(z, z);
  const xx = mul(x, x2), xy = mul(x, y2), xz = mul(x, z2), wx = mul(w, x2), yy = mul(y, y2), yz = mul(y, z2), wy = mul(w, y2), zz = mul(z, z2), wz = mul(w, z2);
  const matrix = Float32Array.of(sub(sub(1, yy), zz), add(xy, wz), sub(xz, wy), 0,
    sub(xy, wz), sub(sub(1, xx), zz), add(yz, wx), 0,
    add(xz, wy), sub(yz, wx), sub(sub(1, xx), yy), 0,
    mul(parentScale[0], pose[at + 8]), mul(parentScale[1], pose[at + 9]), mul(parentScale[2], pose[at + 10]), 1);
  for (let column = 0; column < 3; column++) for (let row = 0; row < 4; row++) matrix[column * 4 + row] = mul(matrix[column * 4 + row], axisScale[column]);
  return matrix;
}
/** Transform world matrices 0x1007f2c20 and Animation palette consumer
 * 0x10009a9a5..0x10009aa8b. Native skeleton has an extra root node;
 * parentLink is its direct node index, not a zero-based bone index.
 * The unscaled parent basis and parent local scale have distinct consumers.
 * Link matrices stay the original matrices read from the AnimationPack. */
export function resourceAnimationSkeletonMatrices(pack: ResourceAnimationPack, pose: Float32Array, root: ResourceSkeletonRoot = identityResourceSkeletonRoot()) {
  const count = pack.bones.length;
  if (!count || count > 256 || pose.length !== count * 12 || !pack.frameCount || pack.bones.some(b => !b.linkMatrix || b.linkMatrix.length !== 16)) throw new Error('骨骼矩阵缺少原姿态或链接矩阵');
  if (root.pose.length !== 12 || root.axisScale.length !== 3 || ![...pose, ...root.pose, ...root.axisScale].every(Number.isFinite)) throw new Error('骨骼矩阵姿态无效');
  const parents = pack.bones.map(b => b.parentLink);
  if (parents.some(parent => !Number.isInteger(parent) || parent < 0 || parent > count)) throw new Error('原骨骼父节点索引越界');
  const states = new Uint8Array(count + 1), unscaled: Float32Array[] = [], scaled: Float32Array[] = [];
  const identity = Float32Array.of(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
  const visit = (node: number) => {
    if (states[node] === 2) return;
    if (states[node] === 1) throw new Error('原骨骼父节点形成循环');
    states[node] = 1;
    const parent = node ? parents[node - 1] : -1;
    if (parent >= 0) visit(parent);
    const source = node ? pose : root.pose, at = node ? (node - 1) * 12 : 0;
    const parentScale = parent > 0 ? pose.subarray((parent - 1) * 12, (parent - 1) * 12 + 3) : parent === 0 ? root.pose.subarray(0, 3) : [1, 1, 1];
    const local = resourceAnimationLocalMatrix(source, at, parentScale, node ? [1, 1, 1] : root.axisScale);
    unscaled[node] = multiply(parent >= 0 ? unscaled[parent] : identity, local);
    scaled[node] = unscaled[node].slice();
    for (let column = 0; column < 3; column++) for (let row = 0; row < 4; row++) scaled[node][column * 4 + row] = mul(scaled[node][column * 4 + row], source[at + column]);
    states[node] = 2;
  };
  for (let node = 0; node <= count; node++) visit(node);
  return {scaled,unscaled};
}
export function resourceAnimationBoneMatrices(pack: ResourceAnimationPack, pose: Float32Array, root: ResourceSkeletonRoot = identityResourceSkeletonRoot()): Float32Array {
  const count=pack.bones.length,{scaled}=resourceAnimationSkeletonMatrices(pack,pose,root);
  const palette = new Float32Array((count + 1) * 16); palette.set(scaled[0]);
  for (let bone = 0; bone < count; bone++) palette.set(multiply(scaled[bone + 1], pack.bones[bone].linkMatrix!), (bone + 1) * 16);
  return palette;
}
