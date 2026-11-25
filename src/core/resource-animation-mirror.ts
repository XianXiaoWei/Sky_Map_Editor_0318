import type { ModelBakeMemory } from './model-baked-runtime';
import { numericFloatBits as bits, numericFloatValue as value } from './object-numeric-runtime';

const f = Math.fround, add = (a: number, b: number) => f(a + b), sub = (a: number, b: number) => f(a - b), mul = (a: number, b: number) => f(a * b);
function multiply(a: Float32Array, b: Float32Array) {
  const out = new Float32Array(4);
  for (let i = 0; i < 3; i++) {
    const j = (i + 1) % 3, k = (i + 2) % 3;
    out[i] = add(add(mul(a[3], b[i]), mul(a[i], b[3])), sub(mul(a[j], b[k]), mul(a[k], b[j])));
  }
  out[3] = sub(mul(a[3], b[3]), add(mul(a[2], b[2]), add(mul(a[0], b[0]), mul(a[1], b[1]))));
  return out;
}

/** Numeric adapter for the inline Clip.Sample mirror path. It always applies
 * the normal basis correction, even when Finalize used additive reference
 * metadata. The actual retained owner map supplies every correction. */
export function mirrorOriginalAnimationRotationValue(m: ModelBakeMemory, pack: bigint, bone: number, input: Float32Array) {
  if (input.length !== 4) throw new Error('原动画镜像旋转必须有四个分量');
  const record = m.read64(pack + 0xe0n) + BigInt((bone | 0) * 0x90);
  const read = (p: bigint) => Float32Array.from([0, 1, 2, 3], i => value(m.read32(p + BigInt(i * 4))));
  const reflect = (q: Float32Array) => { for (const lane of [1, 2]) q[lane] = value(bits(q[lane]) ^ 0x80000000); return q; };
  let q = multiply(input, read(record + 0x40n));
  if (m.bytes(record + 0x88n, 1)[0]) q = multiply(read(record + 0x60n), reflect(multiply(read(record + 0x50n), q)));
  else reflect(q);
  return multiply(q, read(record + 0x70n));
}

/** Complete AnimationPack.MirrorRotation 0x1000e5ac0. Consumes the owner's
 * actual 0x90-byte mirror records. Nonadditive rotations apply the source and
 * target basis corrections; additive rotations only reflect Y/Z signs. This
 * consumer does not synthesize or claim ownership of the mirror map. */
export function mirrorOriginalAnimationRotation(m: ModelBakeMemory, out: bigint, pack: bigint, source: bigint, bone: number, additive: number) {
  const map = m.read64(pack + 0xe0n), record = map + BigInt((bone | 0) * 0x90);
  m.bytes(out, 16).set(new Uint8Array(m.bytes(source, 16)));
  const read = (p: bigint) => Float32Array.from([0, 1, 2, 3], i => value(m.read32(p + BigInt(i * 4))));
  const write = (q: Float32Array) => { for (let i = 0; i < 4; i++) m.write32(out + BigInt(i * 4), bits(q[i])); };
  const reflect = () => { for (const lane of [1, 2]) m.write32(out + BigInt(lane * 4), m.read32(out + BigInt(lane * 4)) ^ 0x80000000); };
  if (!(additive & 255)) write(multiply(read(out), read(record + 0x40n)));
  if (m.bytes(record + 0x88n, 1)[0] && !(additive & 255)) {
    write(multiply(read(record + 0x50n), read(out))); reflect();
    write(multiply(read(record + 0x60n), read(out)));
  } else reflect();
  if (!(additive & 255)) write(multiply(read(out), read(record + 0x70n)));
  return out;
}
