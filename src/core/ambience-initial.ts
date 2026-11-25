import evidence from '../../docs/ambience-initial-fields.json';
import type { EnvValue } from './environment';

// Original Ambience.Initialize prefix, before GPU resource creation. Static
// Color globals and the settings quality branch must be initialized explicitly.
// This recovers six environment groups; it does not dispatch map start events.
export function initialAmbienceFields(sunColor: number[], qualityFlag: number) {
  if (sunColor.length !== 4 || !sunColor.every(Number.isFinite) || !Number.isInteger(qualityFlag) || qualityFlag < 0 || qualityFlag > 0xffffffff)
    throw new Error('缺少原始太阳颜色全局或有效画质标志');
  const storage = new Uint8Array(0x290), known = new Uint8Array(storage.length);
  const put = (offset: number, bytes: Uint8Array) => { storage.set(bytes,offset);known.fill(1,offset,offset+bytes.length); };
  const decode = (hex: string) => Uint8Array.from(hex.match(/../g)!,byte=>parseInt(byte,16));
  for (const write of evidence.writes) put(write.offset,decode(write.hex));
  const color = new Float32Array(sunColor.map(Math.fround));
  put(evidence.sunColor.offset,new Uint8Array(color.buffer));
  if (!qualityFlag) put(evidence.qualityBranch.zeroWrites.offset,decode(evidence.qualityBranch.zeroWrites.hex));
  const view = new DataView(storage.buffer);
  const outputs:Record<string,Record<string,EnvValue>>={};
  for (const group of evidence.groups) {
    const values:Record<string,EnvValue>={};
    for (const field of group.fields) {
      const offset=group.offset+field.nativeOffset;
      if(!known.subarray(offset,offset+field.bytes).every(value=>value===1)) throw new Error(`未恢复的原环境初值 ${group.className}.${field.name}`);
      values[field.name]=field.tag===11 ? view.getUint8(offset) : field.bytes===16
        ? Array.from({length:4},(_,lane)=>view.getFloat32(offset+lane*4,true)) : view.getFloat32(offset,true);
    }
    outputs[group.className]=values;
  }
  return {storage,known,outputs};
}
