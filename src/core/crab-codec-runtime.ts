import type {ModelBakeMemory} from './model-baked-runtime';
import type {NatureArithmeticServices} from './nature-event-runtime';
import {serializeOriginalBinaryBytes,serializeOriginalBinaryByte,serializeOriginalBinaryFloat,serializeOriginalBinaryVector,serializeOriginalBinaryBool,serializeOriginalBinaryPlayerId,serializeOriginalBinaryUInt} from './binary-stream-runtime';
import {originalCrabNetworkBarnServices,type CrabNetStateServices,type CrabNetworkServices} from './crab-network-runtime';
import type {CrabBarnUpdateServices} from './crab-barn-runtime';
import evidence from '../../docs/crab-codec-native.json';
/** Needed only when a context-2 PlayerId read is skipped or runs out of
 * buffer without asserting: its original private byte was never written. */
export interface CrabCodecPrivateScratch {targetPlayerIdByte:number;ownerPlayerIdByte:number;}
/** Whole Crab state codec 0x1002582b0 operating on the real caller-owned
 * stream buffer. Range limits and branch bytes are reread in original order. */
export function serializeOriginalCrabState(m:ModelBakeMemory,state:bigint,stream:bigint,arithmetic?:NatureArithmeticServices,privateScratch?:CrabCodecPrivateScratch){
 serializeOriginalBinaryBytes(m,stream,state,4);
 const remaining=(m.read32(state+8n)-1)|0,maximum=(remaining>0?remaining:1)&255;
 serializeOriginalBinaryByte(m,stream,state+4n,0,maximum);
 serializeOriginalBinaryByte(m,stream,state+12n,0,11);serializeOriginalBinaryByte(m,stream,state+13n,0,3);
 const kind=m.bytes(state+13n,1)[0];
 if(kind===0)serializeOriginalBinaryPlayerId(m,stream,state+16n,privateScratch?.targetPlayerIdByte);
 else if(kind===3)for(let i=0;i<3;i++)serializeOriginalBinaryFloat(m,stream,state+32n+BigInt(i*4),evidence.vectors.targetMinimum[i],evidence.vectors.targetMaximum[i],0,8,arithmetic);
 else serializeOriginalBinaryBytes(m,stream,state+20n,2);
 for(let i=0;i<12;i++)serializeOriginalBinaryFloat(m,stream,state+48n+BigInt(i*4),0,evidence.constants.one,evidence.constants.half,4,arithmetic);
 serializeOriginalBinaryVector(m,stream,state+96n);serializeOriginalBinaryBool(m,stream,state+112n);
 if(m.bytes(state+112n,1)[0])serializeOriginalBinaryPlayerId(m,stream,state+116n,privateScratch?.ownerPlayerIdByte);
}
/** Connect actual codec, snapshot, receive/send and Barn.Update. Private state
 * and count storage belong to the caller; transport lookup stays explicit. */
export function originalCrabBinaryNetworkServices(m:ModelBakeMemory,state:bigint,countScratch:bigint,arithmetic?:NatureArithmeticServices,privateScratch?:CrabCodecPrivateScratch):Omit<CrabNetworkServices,'snapshot'> {
 return {
  count:(stream,cell,minimum,maximum)=>{if(cell.value!==undefined)m.write32(countScratch,cell.value);serializeOriginalBinaryUInt(m,stream,countScratch,minimum,maximum);cell.value=m.read32(countScratch);},
  serialize:(_packet,stream)=>serializeOriginalCrabState(m,state,stream,arithmetic,privateScratch),
 };
}
export function originalCrabBinaryBarnServices(m:ModelBakeMemory,findStream:CrabBarnUpdateServices['findStream'],state:bigint,countScratch:bigint,snapshot:CrabNetStateServices,privateScratch?:CrabCodecPrivateScratch):CrabBarnUpdateServices {
 return originalCrabNetworkBarnServices(m,findStream,m.bytes(state,120),originalCrabBinaryNetworkServices(m,state,countScratch,snapshot.arithmetic,privateScratch),snapshot);
}
