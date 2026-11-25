import {cloudParticleDepthOrder} from './cloud-card-sort';
const f = Math.fround;
const add = (a: number, b: number) => f(f(a) + f(b));
const sub = (a: number, b: number) => f(f(a) - f(b));
const mul = (a: number, b: number) => f(f(a) * f(b));
const div = (a: number, b: number) => f(f(a) / f(b));
// Native min(1,x) explicitly replaces unordered x with 1 in this path.
const upperOne = (x: number) => Number.isNaN(x) ? 1 : Math.min(1, x);
const cvtt = (x: number) => !Number.isFinite(x) || x >= 2147483648 || x < -2147483648 ? -2147483648 : Math.trunc(x);
export const CLOUD_PARTICLE_INSTANCE_STRIDE = 32;
export interface CloudParticleLifeRing { life: Float32Array; head: number; count: number; }
// 0x10022660f..0x1002266f5, including the original vectorized branch.
// Counts ALL negative entries, then advances the ring head by that count;
// it does not filter/compact individual slots. Delta is already scaled.
export function stepCloudParticleLife(state: CloudParticleLifeRing, scaledDelta: number): CloudParticleLifeRing {
  if (!(state.life instanceof Float32Array) || state.life.length !== 1024 || !state.life.every(Number.isFinite)
    || !Number.isInteger(state.head) || state.head < 0 || state.head >= 1024
    || !Number.isInteger(state.count) || state.count < 0 || state.count > 1024 || !Number.isFinite(f(scaledDelta))) {
    throw new Error('原云粒子寿命环输入无效');
  }
  const life = state.life.slice(), decrement = mul(scaledDelta, f(2 / 3));
  let expired = 0;
  for (let i = 0; i < state.count; i++) {
    const slot = (state.head + i) & 1023;
    life[slot] = sub(life[slot], decrement);
    if (life[slot] < 0) expired++;
  }
  return { life, head: (state.head + expired) & 1023, count: state.count - expired };
}
export interface CloudParticlePackSource {
  position: number[];
  previousPosition: number[];
  // Explicit output of the preceding interaction/physics block, not a
  // fabricated wind or lighting sample. Original temporary xyz arrays.
  vector: number[];
  size: number;
  life: number;
  // Three original floats at Barn +0x9018 + ringIndex*12. Names describe
  // their use in packing; their emission/default source remains unresolved.
  sizeReference: number;
  opacityMult: number;
  phaseOffset: number;
}
export interface CloudParticlePackCamera { eye: number[]; depthAxis: number[]; }
// CloudParticleBarn::Update 0x1002279f2..0x100227dd7, after native physics.
// Produces ONE instance record per particle. The original vertex shader
// expands the quad; this function does not generate particles or sort them.
export function cloudParticlePackedInstances(particles: CloudParticlePackSource[], camera: CloudParticlePackCamera,
  time: number, target?: Uint8Array) {
  const valid3 = (v: number[]) => v.length === 3 && v.every(n => Number.isFinite(n) && Number.isFinite(f(n)));
  if (particles.length > 1024 || !valid3(camera.eye) || !valid3(camera.depthAxis) || !Number.isFinite(f(time))
    || target !== undefined && (!(target instanceof Uint8Array) || target.length !== particles.length * CLOUD_PARTICLE_INSTANCE_STRIDE)
    || particles.some(p => !valid3(p.position) || !valid3(p.previousPosition) || !valid3(p.vector)
      || ![p.size, p.life, p.sizeReference, p.opacityMult, p.phaseOffset].every(n => Number.isFinite(n) && Number.isFinite(f(n))))) {
    throw new Error('原云粒子打包输入、容量或目标流无效');
  }
  target ??= new Uint8Array(particles.length * CLOUD_PARTICLE_INSTANCE_STRIDE);
  const view = new DataView(target.buffer, target.byteOffset, target.byteLength), depths = new Float32Array(particles.length);
  particles.forEach((p, index) => {
    const at = index * 32, position = p.position.map(f), size = f(p.size), life = f(p.life);
    const sizeWeight = upperOne(div(add(p.sizeReference, p.sizeReference), size));
    const fadeOut = upperOne(div(mul(sub(1, life), 1.5), f(.1)));
    const fadeIn = upperOne(div(mul(life, 1.5), f(.35)));
    let alpha = mul(sizeWeight, mul(sizeWeight, p.opacityMult));
    alpha = mul(alpha, mul(fadeOut, fadeIn));
    alpha = mul(Math.min(1, Math.max(0, div(add(size, -.25), f(.3999999761581421)))), alpha);
    alpha = mul(alpha, .5);
    const phase = f(add(div(time, 5), p.phaseOffset) % 1);
    const values = [div(size, 12), mul(mul(phase, 64), .015625), alpha, 0];
    for (let lane = 0; lane < 3; lane++) {
      view.setFloat32(at + lane * 4, position[lane], true);
      const vector = div(p.vector[lane], 6), vectorInt = cvtt(Math.min(32767, Math.max(-32768, mul(vector, vector >= 0 ? 32767 : 32768))));
      view.setInt16(at + 12 + lane * 2, vectorInt, true);
      const displacement = div(sub(position[lane], p.previousPosition[lane]), 6);
      const displacementInt = cvtt(Math.min(127, Math.max(-128, mul(displacement, displacement >= 0 ? 127 : 128))));
      view.setInt8(at + 28 + lane, displacementInt);
    }
    view.setUint16(at + 18, 0, true);
    values.forEach((v, lane) => view.setUint16(at + 20 + lane * 2, cvtt(Math.min(65535, Math.max(0, mul(v, 65535)))), true));
    depths[index] = add(mul(sub(position[2], camera.eye[2]), camera.depthAxis[2]),
      add(mul(sub(position[0], camera.eye[0]), camera.depthAxis[0]), mul(sub(position[1], camera.eye[1]), camera.depthAxis[1])));
    // +31 is not written by the original instructions. Preserve caller's
    // byte; newly allocated JS storage uses deterministic zero padding.
  });
  return { instances: target, stride: CLOUD_PARTICLE_INSTANCE_STRIDE, depths };
}

// The original copies whole instance records through the sorted uint16
// indices at 0x1002281b0..0x1002281d5. All payload/padding bytes travel together.
export function cloudParticleDrawInstances(particles: CloudParticlePackSource[], camera: CloudParticlePackCamera, time: number) {
  const packed = cloudParticlePackedInstances(particles, camera, time), order = cloudParticleDepthOrder(packed.depths);
  const instances = new Uint8Array(packed.instances.length);
  order.forEach((source, destination) => instances.set(packed.instances.subarray(source * 32, source * 32 + 32), destination * 32));
  return {instances, order, depths: packed.depths, stride: packed.stride};
}
