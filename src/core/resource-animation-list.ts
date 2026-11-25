import { Reader } from './binary';
export interface ResourceAnimationSound {
  frame: number; effect: string; boneName: string; minDist: number; maxDist: number; player: number; volume: number;
  is3D: boolean; isEmote: boolean; isLowerBody: boolean; attached: boolean; conditionalFlags: number;
}
export interface ResourceAnimationEmitter {
  frame: number; endFrame: number; emitterDef: string; boneName: string; offset: [number, number, number];
  attached: boolean; conditionalFlags: number; maxDist: number;
}
export interface ResourceAnimationMetadata {
  name: string; hashedName: string; start: number; stop: number; animType: number; speedMult: number;
  mirrored: boolean; easingFunction: number; easingPower: number; rootMotionY: boolean; rootMotionXZ: boolean;
  sounds: ResourceAnimationSound[]; emitters: ResourceAnimationEmitter[];
}
export interface ResourceAnimationFile { name: string; metaDataStart: number; metaDatas: ResourceAnimationMetadata[]; }
export interface ResourceAnimationList { version: number; files: ResourceAnimationFile[]; metaDataCount: number; }
function name(r: Reader) { const raw = r.take(64), end = raw.indexOf(0); if (end < 0) throw new Error('原动画名称未终止'); return raw.subarray(0, end).toString('utf8'); }
function number(r: Reader) { const n = r.f32(); if (!Number.isFinite(n)) throw new Error('原动画配置包含非有限值'); return n; }
const boolean = (r: Reader) => !!r.u8();
/** Native FNV-1a sign-extends each C char before XOR. Return hex to preserve
 * all 64 bits through both Electron structured clone and Android JSON. */
export function resourceAnimationNameHash(name: string) {
  let hash = 0xcbf29ce484222325n;
  for (const byte of new TextEncoder().encode(name.split('\0')[0])) hash = BigInt.asUintN(64, (hash ^ BigInt(byte < 128 ? byte : byte - 256)) * 0x100000001b3n);
  return hash.toString(16).padStart(16, '0');
}
/** Complete compiled AnimationList v1..3 read consumer 0x1000dd370.
 * Names/ranges remain as stored; resource postprocessing owns one-based
 * range conversion and clip binding. Sound v1/2 retain constructor defaults
 * for isLowerBody/attached. No audio or emitter runtime is synthesized. */
export function readResourceAnimationList(data: Buffer): ResourceAnimationList {
  const r = new Reader(data, 'AnimationList'), version = r.u32(); if (version < 1 || version > 3) throw new Error(`未经核验的 AnimationList 版本 ${version}`);
  const count = r.count(511), files: ResourceAnimationFile[] = []; let metaDataCount = 0;
  for (let i = 0; i < count; i++) {
    const fileName = name(r), metaCount = r.count(4095); if (metaDataCount + metaCount >= 4096) throw new Error('原动画配置总数超限');
    const file: ResourceAnimationFile = { name: fileName, metaDataStart: metaDataCount, metaDatas: [] }; metaDataCount += metaCount;
    for (let j = 0; j < metaCount; j++) {
      const animationName = name(r), start = r.i32(), stop = r.i32(), animType = r.i32(), speedMult = number(r), mirrored = boolean(r), easingFunction = r.i32(), easingPower = number(r), rootMotionY = boolean(r), rootMotionXZ = boolean(r), soundCount = r.count(16), emitterCount = r.count(6);
      const sounds: ResourceAnimationSound[] = [], emitters: ResourceAnimationEmitter[] = [];
      for (let k = 0; k < soundCount; k++) {
        const frame = r.i32(), effect = name(r), boneName = name(r), minDist = number(r), maxDist = number(r), player = r.i32(), volume = number(r), is3D = boolean(r), isEmote = boolean(r), isLowerBody = version >= 3 ? boolean(r) : false, attached = version >= 3 ? boolean(r) : true, conditionalFlags = r.u32();
        sounds.push({ frame, effect, boneName, minDist, maxDist, player, volume, is3D, isEmote, isLowerBody, attached, conditionalFlags });
      }
      for (let k = 0; k < emitterCount; k++) {
        const frame = r.i32(), endFrame = r.i32(), emitterDef = name(r), boneName = name(r), offset = [number(r), number(r), number(r)] as [number, number, number], attached = boolean(r), conditionalFlags = r.u32(), maxDist = number(r);
        emitters.push({ frame, endFrame, emitterDef, boneName, offset, attached, conditionalFlags, maxDist });
      }
      file.metaDatas.push({ name: animationName, hashedName: resourceAnimationNameHash(animationName), start, stop, animType, speedMult, mirrored, easingFunction, easingPower, rootMotionY, rootMotionXZ, sounds, emitters });
    }
    files.push(file);
  }
  if (r.p !== data.length) throw new Error(`原动画配置剩余未解释字节 ${data.length - r.p}`);
  return { version, files, metaDataCount };
}
/** Original FindFile 0x1000dd230 compares equal-length names after C-locale
 * tolower. Preserve first-match order rather than overwrite duplicates. */
export function findResourceAnimationFile(list: ResourceAnimationList, requested: string) {
  const lower = (s: string) => s.split('\0')[0].replace(/[A-Z]/g, c => c.toLowerCase());
  return list.files.find(file => lower(file.name) === lower(requested)) ?? null;
}
