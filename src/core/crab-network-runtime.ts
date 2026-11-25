import type {ModelBakeMemory} from './model-baked-runtime';
import type {NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatValue as value} from './object-numeric-runtime';
import {originalForceVectors} from './creature-force-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import type {CrabBarnUpdateServices} from './crab-barn-runtime';
export interface CrabNetStateServices {
 arithmetic?:NatureArithmeticServices;
 invalidId:number;
 cast(reference:Uint8Array,type:'Crab'|'Avatar'):bigint;
}
/** Whole Crab.NetState 0x10025ead0. Capture the original behavior record,
 * retain repeated casts on its live temporary reference and copy actual
 * motion/action/owner fields into the original 120-byte payload layout. */
export function snapshotOriginalCrabNetState(m:ModelBakeMemory,crab:bigint,state:Uint8Array,s:CrabNetStateServices){
 if(state.length!==120)throw new Error('Crab network state requires 120 bytes');
 const out=new DataView(state.buffer,state.byteOffset,state.byteLength),{a,read,bytes}=originalForceVectors(s.arithmetic);
 out.setUint32(0,m.read32(crab+0x130n),true);state[4]=m.bytes(crab+0x594n,1)[0];
 const record=new Uint8Array(m.bytes(crab+0x140n,16)),d=new DataView(record.buffer,record.byteOffset,16),id=m.read32(crab+0x150n),target=new Uint8Array(m.bytes(crab+0x160n,16));
 state[12]=d.getUint32(0,true)&255;
 if(d.getUint32(0,true)===9){state[13]=2;out.setUint16(20,id&65535,true);}
 else{
  const reference=record.slice(8,16);
  if(!new DataView(reference.buffer,reference.byteOffset,8).getBigUint64(0,true)){
   state[13]=3;state.set(bytes(read(target).map((x,i)=>a.sub(x,m.read32(crab+0x120n+BigInt(i*4))))),32);
  }else if(s.cast(reference,'Crab')){
   state[13]=1;const target=s.cast(reference,'Crab');out.setUint16(20,m.bytes(target+0x594n,1)[0],true);
  }else{
   const avatar=s.cast(reference,'Avatar');state[13]=0;
   if(avatar){const target=s.cast(reference,'Avatar');out.setUint32(16,m.read32(target+0xe0n),true);}else out.setUint16(20,65535,true);
  }
 }
 state.set(m.bytes(crab+0x184n,48).slice(),48);
 const position=read(m.bytes(crab+16n,16)),velocity=read(m.bytes(crab+80n,16));state.set(bytes(position.map((x,i)=>a.add(x,velocity[i]))),96);
 const owner=m.read32(crab+0x500n);state[112]=Number(owner!==(s.invalidId>>>0));out.setUint32(116,owner,true);
}
/** Receive has no initialized count input. The codec must write its decoded
 * count; send supplies the size of its captured due-object list. */
export interface CrabNetworkCountCell {value:number|undefined;}
export interface CrabNetworkServices {
 count(stream:bigint,cell:CrabNetworkCountCell,minimum:0,maximum:number):void;
 serialize(state:Uint8Array,stream:bigint):void;
 snapshot(crab:bigint,state:Uint8Array):void;
}
const initializeState=(state:Uint8Array,count:number)=>{if(state.length!==120)throw new Error('Crab network state requires 120 bytes');const d=new DataView(state.buffer,state.byteOffset,120);d.setUint32(16,0,true);d.setUint32(116,0,true);d.setUint32(8,count,true);};
const packetCount=(cell:CrabNetworkCountCell)=>{if(cell.value===undefined)throw new Error('Crab count codec must supply the decoded count');return cell.value>>>0;};
/** Whole 0x10025ee60. The initial Barn count/local ID stay captured while
 * live object pointers and service-mutated packet count are reread. */
export function receiveOriginalCrabBarn(m:ModelBakeMemory,barn:bigint,stream:bigint,game:bigint,state:Uint8Array,s:CrabNetworkServices){
 const total=m.read32(barn+0x410n);if(!total)return;
 const player=m.read32(m.read64(m.read64(game+0x178n)+32n)+0x7d18n),count:CrabNetworkCountCell={value:undefined};s.count(stream,count,0,total);
 for(let index=0;index<packetCount(count);index++){
  initializeState(state,total);s.serialize(state,stream);const selected=state[4];
  if(selected>=total)throw new NativeObjectFoundationFailure('./CritterV2.h',152,3,'netState.critterIdx < numCritters');
  const crab=m.read64(barn+16n+BigInt(selected*8));if(m.read32(crab+0x598n)===player)continue;
  // Capture all SIMD source bytes before their overlapping stores.
  const header=state.slice(0,16),target=state.slice(32,48),motion=state.slice(48,96),position=state.slice(96,112),owner=state.slice(112,120),extra=state.slice(14,22);
  m.bytes(crab+0x51en,8).set(extra);m.bytes(crab+0x510n,16).set(header);m.bytes(crab+0x530n,16).set(target);
  m.bytes(crab+0x550n,32).set(motion.subarray(16));m.bytes(crab+0x540n,32).set(motion.subarray(0,32));m.bytes(crab+0x570n,16).set(position);m.bytes(crab+0x580n,8).set(owner);m.write32(crab+0x590n,0);
 }
}
/** Whole 0x10025f0d0. Select the caller's owned due objects before stream
 * callbacks; serializing a snapshot sets that captured object's timer. */
export function sendOriginalCrabBarn(m:ModelBakeMemory,stream:bigint,crabs:bigint,total:number,player:number,delta:number,state:Uint8Array,s:CrabNetworkServices){
 if(!(total>>>0))return;const selected:bigint[]=[];
 for(let index=0;index<(total>>>0);index++){
  const crab=m.read64(crabs+BigInt(index*8));if(m.read32(crab+0x598n)===(player>>>0)&&value(m.read32(crab+0xdcn))<=0)selected.push(crab);
 }
 const count={value:selected.length};s.count(stream,count,0,total>>>0);
 for(let index=0;index<packetCount(count);index++){
  const crab=selected[index];if(crab===undefined)throw new Error('Crab stream count exceeds the captured due-object list');
  initializeState(state,total>>>0);s.snapshot(crab,state);s.serialize(state,stream);m.write32(crab+0xdcn,delta);
 }
}
export function originalCrabNetworkBarnServices(m:ModelBakeMemory,findStream:CrabBarnUpdateServices['findStream'],state:Uint8Array,network:Omit<CrabNetworkServices,'snapshot'>,snapshot:CrabNetStateServices):CrabBarnUpdateServices {
 const s:CrabNetworkServices={...network,snapshot:(crab,state)=>snapshotOriginalCrabNetState(m,crab,state,snapshot)};
 return {findStream,receive:(barn,stream,game)=>receiveOriginalCrabBarn(m,barn,stream,game,state,s),send:(stream,_game,crabs,count,player,delta)=>sendOriginalCrabBarn(m,stream,crabs,count,player,delta,state,s)};
}
