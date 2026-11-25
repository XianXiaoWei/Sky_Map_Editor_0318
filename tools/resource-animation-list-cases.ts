import fs from 'node:fs';
import { floats, u32 } from '../src/core/binary';
import { readResourceAnimationList, type ResourceAnimationMetadata } from '../src/core/resource-animation-list';
const name = (s: string) => { const b = Buffer.alloc(64); b.write(s); return b; };
export function animationListCases(data: string) {
  const prepared = (version: number) => Buffer.concat([u32(version), u32(1), name('prepared-UTF8-animation-file'), u32(1), name('动作:test:LongNativeAnimationName'), ...[4, 10, 1].map(u32), floats([0.3]), Buffer.from([1]), u32(3), floats([2.25]), Buffer.from([1, 0]), u32(1), u32(1),
    u32(2), name('flap'), name('boneLongName'), floats([-1, 30]), u32(1), floats([0.5]), Buffer.from([1, 0]), ...(version >= 3 ? [Buffer.from([1, 0])] : []), u32(7),
    u32(2), u32(8), name('originalEmitterFixture'), name('bone'), floats([1, -2, 3]), Buffer.from([0]), u32(3), floats([100])]);
  return [{ id: 'AnimationList.dat', bytes: fs.readFileSync(`${data}/Meshes/Bin/AnimationList.dat`) }, ...[1, 2, 3].map(v => ({ id: `prepared-v${v}-sound-emitter-UTF8`, bytes: prepared(v) }))];
}
export function animationListExpected(bytes: Buffer) {
  const list = readResourceAnimationList(bytes), meta = (m: ResourceAnimationMetadata) => {
    const hash = Buffer.alloc(8); hash.writeBigUInt64LE(BigInt('0x' + m.hashedName));
    return Buffer.concat([name(m.name), hash, u32(m.start), u32(m.stop), u32(m.animType), floats([m.speedMult]), u32(m.easingFunction), floats([m.easingPower]), Buffer.from([+m.mirrored, +m.rootMotionY, +m.rootMotionXZ]), u32(m.sounds.length), u32(m.emitters.length),
      ...m.sounds.map(s => Buffer.concat([u32(s.frame), name(s.effect), name(s.boneName), floats([s.minDist, s.maxDist]), u32(s.player), floats([s.volume]), Buffer.from([+s.is3D, +s.isEmote, +s.isLowerBody, +s.attached]), u32(s.conditionalFlags)])),
      ...m.emitters.map(e => Buffer.concat([u32(e.frame), u32(e.endFrame), name(e.emitterDef), name(e.boneName), floats(e.offset), Buffer.from([+e.attached]), u32(e.conditionalFlags), floats([e.maxDist])]))]);
  };
  return Buffer.concat([...[0, 0, bytes.length, list.version, list.files.length, list.metaDataCount].map(u32), ...list.files.map(file => Buffer.concat([name(file.name), u32(file.metaDatas.length), u32(file.metaDataStart), ...file.metaDatas.map(meta)]))]);
}
