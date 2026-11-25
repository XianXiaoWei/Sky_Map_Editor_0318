import type { ModelBakeMemory } from './model-baked-runtime';
import { originalForceVectors } from './creature-force-runtime';
import type { NatureArithmeticServices } from './nature-event-runtime';
import { numericFloatBits as bits, numericFloatValue as value } from './object-numeric-runtime';
import evidence from '../../docs/dark-creature-spotlight-native.json';

export interface DarkCreatureSpotlightServices {
  arithmetic?: NatureArithmeticServices;
  rayQueryScratch: Uint8Array;
  colorScratch: Uint8Array;
  /** Live rotation phase at 0x100d2b470, in radians. */
  phaseBits(): number;
  /** Original sincosf_stret XMM0: sin, cos, and caller-clobbered upper lanes. */
  sinCos(inputBits: number): Uint8Array;
  exp(inputBits: number): number;
  castRay(world: bigint, origin: Uint8Array, direction: Uint8Array, lengthBits: number, query: Uint8Array): Uint8Array | null;
  findAvatar(barn: bigint, id: number): bigint;
  birdPosition(bird: bigint): Uint8Array;
  environmentColor(owner: bigint, output: Uint8Array, position: bigint | Uint8Array, gainBits: number, rangeBits: number, ambientBits: number): void;
  setDiffuseColor(model: bigint, color: Uint8Array): void;
  worldPosition(transform: bigint): Uint8Array;
  setMarkerTransform(marker: bigint, matrix: Uint8Array): void;
}

/** Original DarkCreature.Update spotlight slice 0x10026eda3..0x10026f41e.
 * The preceding look/smoothing phase must already have written +0x110.
 * Carries the head world position, packed delta and absolute time from that
 * same frame. Projection, target selection, color, radius, marker transform
 * and old effect expiration retain their native order and live rereads.
 * Later interactions/audio and visible scene ownership remain separate. */
export function updateOriginalDarkCreatureSpotlightPhase(m: ModelBakeMemory, p: bigint, headPosition: Uint8Array, delta: Uint8Array, absoluteTimeBits: number, owners: { world: bigint; avatars: bigint; birds: bigint; environment: bigint }, s: DarkCreatureSpotlightServices): void {
  const { a, read, bytes, normalize, squared, sqrt, sum } = originalForceVectors(s.arithmetic), c = evidence.constants, one = bits(1);
  const at = (offset: bigint) => read(m.bytes(p + offset, 16)), put = (offset: bigint, v: number[]) => m.bytes(p + offset, 16).set(bytes(v));
  const add = (x: number[], y: number[]) => x.map((n, i) => a.add(n, y[i])), sub = (x: number[], y: number[]) => x.map((n, i) => a.sub(n, y[i])), mul = (x: number[], y: number[]) => x.map((n, i) => a.mul(n, y[i]));
  const perm = (x: number[]) => [x[2], x[0], x[1], x[3]], negate = (x: number[]) => x.map(n => (n ^ 0x80000000) >>> 0);
  const normalizeCross = (cross: number[]) => {
    const q = squared(cross), length = sqrt(a.add(q[1], a.add(q[2], q[0]))), v = perm(cross);
    return value(length) > value(0x3727c5ac) ? v.map((n, i) => a.div(n, i === 3 ? q[3] : length)) : v;
  };
  const head = read(headPosition), oldPosition = at(0x1b0n);
  let side: number[], forward: number[];
  if (m.read32(p + 0x2e0n) === 1) {
    const direction = normalize(sub(at(0x130n), head)); forward = negate(direction);
    let up = evidence.vectors.up;
    if (value(sum(mul(direction, up)) & 0x7fffffff) > value(0x3f7fbe77)) up = evidence.vectors.fallbackUp;
    side = normalizeCross(sub(mul(perm(up), forward), mul(perm(forward), up)));
  } else {
    const pair = read(s.sinCos(a.mul(a.add(s.phaseBits(), c.pi), c.half))), q = at(0x110n), rotation = [pair[0], 0, 0, pair[1]];
    const cross = perm(sub(mul(perm(q), rotation), mul(q, perm(rotation))));
    const combined = add(add(mul([q[3], q[3], q[3], q[3]], rotation), mul(q, [pair[1], pair[1], pair[1], pair[3]])), cross);
    const forwardW = combined[3];
    combined[3] = a.sub(a.mul(pair[1], q[3]), sum(mul(q, rotation)));
    const [x, y, z, w] = combined, xx = a.mul(x, a.add(x, x)), yy = a.mul(y, a.add(y, y)), zz = a.mul(z, a.add(z, z));
    const xy = a.mul(x, a.add(y, y)), xz = a.mul(x, a.add(z, z)), yz = a.mul(y, a.add(z, z)), wx = a.mul(w, a.add(x, x)), wy = a.mul(w, a.add(y, y)), wz = a.mul(w, a.add(z, z));
    side = [a.sub(a.sub(one, yy), zz), a.add(xy, wz), a.sub(xz, wy), 0];
    forward = [a.add(xz, wy), a.sub(yz, wx), a.sub(a.sub(one, xx), yy), forwardW];
  }
  const ray = negate(forward), wave = read(s.sinCos(absoluteTimeBits));
  const sine = a.mul(wave[0], c.five), cosine = a.mul(wave[1], c.five);
  const offsetSide = mul(side, [sine, sine, sine, wave[3]]), cosineVector = [cosine, cosine, cosine, wave[3]];
  const fallback = sub(add(add(mul(forward, evidence.vectors.verticalOffset), head), offsetSide), mul(cosineVector, forward));
  const kind = m.bytes(p + 0x2c7n, 1)[0];
  let projected = oldPosition;
  if (kind === 0) {
    const query = new Uint8Array(s.rayQueryScratch), view = new DataView(query.buffer, query.byteOffset, 32);
    view.setBigUint64(0, 0x2a00000001n, true); query[8] = 1; query.fill(0, 16, 32);
    const hit = s.castRay(owners.world, bytes(head), bytes(ray), c.rayLength, query);
    const point = hit ? read(hit) : fallback;
    const desired = add(add(offsetSide, mul(cosineVector, ray)), point);
    const weight = a.min(one, a.max(0, a.sub(one, s.exp(a.mul(read(delta)[0], c.groundSmooth))))), left = a.sub(one, weight);
    projected = add(mul(desired, [weight, weight, weight, 0]), mul(at(0x1b0n), [left, left, left, 0]));
    put(0x1b0n, projected);
  } else if (kind === 1) {
    const avatar = s.findAvatar(owners.avatars, m.read32(p + 0x2c8n));
    projected = avatar ? read(m.bytes(m.read64(avatar + 24n) + 0x130n, 16)) : fallback;
    put(0x1b0n, projected);
  } else if (kind === 2) {
    const index = m.read32(p + 0x2ccn), bird = index < 64 ? m.read64(owners.birds + 16n + BigInt(index) * 8n) : 0n;
    projected = bird ? read(s.birdPosition(bird)) : fallback;
    put(0x1b0n, projected);
  }
  put(0x1c0n, sub(projected, oldPosition));
  const progress = a.min(one, a.max(0, a.div(m.read32(p + 0x140n), c.five)));
  const currentRadius = a.add(a.mul(progress, c.radiusLocked), a.mul(a.sub(one, progress), c.radiusRange));
  m.write32(p + 0x1d0n, currentRadius);
  const color = new Uint8Array(s.colorScratch);
  s.environmentColor(owners.environment, color, p + 0x1b0n, currentRadius, c.colorAmbient, one);
  s.environmentColor(owners.environment, color, bytes(head), c.colorGain, c.colorRange, one);
  s.setDiffuseColor(m.read64(p + 0x1e8n), color);
  if (value(progress) > value(c.eyeReadThreshold)) s.worldPosition(m.read64(p + 0x228n));
  const marker = m.read64(p + 0x1d8n), position = at(0x1b0n), radius = m.read32(p + 0x1d0n);
  const identity = [[one, 0, 0, 0], [0, one, 0, 0], [0, 0, one, 0], [position[0], position[1], position[2], one]];
  const scale = [[radius, 0, 0, 0], [0, radius, 0, 0], [0, 0, radius, 0], [0, 0, 0, one]];
  const matrix = scale.flatMap(column => [0, 1, 2, 3].map(i => a.add(a.mul(identity[3][i], column[3]), a.add(a.mul(identity[2][i], column[2]), a.add(a.mul(identity[0][i], column[0]), a.mul(identity[1][i], column[1]))))));
  s.setMarkerTransform(marker, bytes(matrix));
  const effect = m.read64(p + 0x1f8n);
  if (effect) {
    const remaining = a.sub(m.read32(p + 0x200n), read(delta)[0]); m.write32(p + 0x200n, remaining);
    if (value(remaining) < 0) { m.write8(effect + 0xb1n, 1); m.write64(p + 0x1f8n, 0n); }
  }
}
