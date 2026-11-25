import {updateOriginalWhiskerShake,type WhiskerShakeServices} from '../src/core/avatar-camera-shake';
export interface WhiskerShakeOracleCase {name:string;frames:number;cameraHex:string;physicalHex:string;hitsHex:string;windHex:string;deltaHex:string;}
export interface WhiskerShakeOracleFrame {header:number[];cameraHex:string;offsetHex:string;basisHex:string;windPositionHex:string;mathHex:string;rayHex:string;soundHex:string;}
const floats=(values:number[])=>{const b=Buffer.alloc(values.length*4);values.forEach((v,i)=>{if(Number.isNaN(v))b.writeUInt32LE(0xffc00000,i*4);else b.writeFloatLE(v,i*4);});return b;};
export function evaluateWhiskerShakeCase(c:WhiskerShakeOracleCase,expected:WhiskerShakeOracleFrame[]):WhiskerShakeOracleFrame[]{
 const camera=Buffer.from(c.cameraHex,'hex'),physical=Buffer.from(c.physicalHex,'hex'),hits=Buffer.from(c.hitsHex,'hex'),wind=Buffer.from(c.windHex,'hex'),deltas=Buffer.from(c.deltaHex,'hex'),frames:WhiskerShakeOracleFrame[]=[];
 for(let i=0;i<c.frames;i++){
  const math=Buffer.from(expected[i].mathHex,'hex'),rays:Buffer[]=[],sounds:Uint8Array[]=[];let at=0,windPositionHex='';
  const call=(kind:number,a:number,b=0)=>{if(math.readUInt32LE(at)!==kind||!floats([a,b]).equals(math.subarray(at+4,at+12)))throw new Error(`${c.name} frame ${i} math call ${at/28} differs`);const values=Array.from({length:4},(_,j)=>math.readFloatLE(at+12+j*4));at+=28;return values;};
  const services:WhiskerShakeServices={exp:a=>call(1,a)[0],pow:(a,b)=>call(2,a,b)[0],cos:a=>call(3,a)[0],sincos:a=>call(4,a),wind:position=>{windPositionHex=floats(position).toString('hex');return Array.from({length:4},(_,j)=>wind.readFloatLE(j*4));},ray:query=>{const n=rays.length,hit=hits.readUInt32LE(n*20),bytes=Buffer.concat([floats([...query.origin,...query.direction,query.radius]),Buffer.alloc(4)]);bytes.writeUInt32LE(hit,36);rays.push(bytes);return hit?Array.from({length:4},(_,j)=>hits.readFloatLE(n*20+4+j*4)):null;},sound:bytes=>sounds.push(bytes)};
  const result=updateOriginalWhiskerShake(camera,physical,deltas.readFloatLE(i*4),services);if(at!==math.length)throw new Error('Unconsumed native math calls');
  frames.push({header:[at/28,rays.length,sounds.length],cameraHex:camera.toString('hex'),offsetHex:floats([...result.offset,0]).toString('hex'),basisHex:floats(result.basis.flat()).toString('hex'),windPositionHex,mathHex:math.toString('hex'),rayHex:Buffer.concat(rays).toString('hex'),soundHex:Buffer.concat(sounds.map(v=>Buffer.from(v))).toString('hex')});
 }
 return frames;
}
