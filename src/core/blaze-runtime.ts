import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {copyOriginalMatrix} from './level-mesh-runtime';

export const BLAZE_POOL={first:0x10,stride:0x120,capacity:256,freeHead:0x12010,bytes:0x12020} as const;
export interface BlazeReleaseServices {soundIdentity(handle:bigint):bigint;stopSound(handle:bigint,fade:number):void;}
/** Whole Blaze.Reset 0x1001af340. Guid and resource pointers are not public
 * fields here; the native body retains everything it does not explicitly write. */
export function resetOriginalBlaze(m:ModelBakeMemory,p:bigint,frame:number){
 m.write8(p+0x99n,0);m.write64(p+0xccn,0n);m.write64(p+0xa8n,0n);m.write32(p+0xb0n,0);m.write8(p+0x56n,0);m.bytes(p+0xc8n,2).fill(0);m.write32(p+0x9cn,0);m.write8(p+0xa0n,0);m.write32(p+0xa2n,0);m.write32(p+0x50n,frame);m.write64(p+0xe0n,0n);m.write32(p+0xd4n,0);m.write32(p+0xd8n,m.read32(p+0x94n));m.write64(p+0xb4n,0x3f80000000000000n);m.write64(p+0xc0n,0n);m.write8(p+0xcan,0);
 m.bytes(p+0xf0n,16).set(new Uint8Array(Float32Array.of(1,1,1,0).buffer));
}
export function setOriginalBlazeEnabled(m:ModelBakeMemory,p:bigint,value:number){m.write8(p+0x54n,value);}
export function getOriginalBlazeEnabled(m:ModelBakeMemory,p:bigint){return m.bytes(p+0x54n,1)[0];}
export function setOriginalBlazeTransform(m:ModelBakeMemory,p:bigint,matrix:Uint8Array){copyOriginalMatrix(m.bytes(p+16n,64),matrix);}
export function getOriginalBlazeTransform(m:ModelBakeMemory,p:bigint,out=new Uint8Array(64)){return copyOriginalMatrix(out,m.bytes(p+16n,64));}
/** Whole BlazeBarn.Initialize 0x1001ad5a0. Thread-local initialization is an
 * explicit service; it occurs after active flags clear and before free links. */
export function initializeOriginalBlazeBarn(m:ModelBakeMemory,barn:bigint,initializeThread:()=>void){
 for(let i=0;i<256;i++)m.write8(barn+BigInt(0x10+i*0x120+0xa1),0);
 initializeThread();let next=0n;for(let i=255;i>=0;i--){const p=barn+BigInt(0x10+i*0x120);m.write64(p,next);next=p;}m.write64(barn+0x12010n,next);
}
/** Whole original factory 0x1001add30. Metadata lookup remains a service and
 * runs after the native free-list head changes, including assertion writes. */
export function createOriginalBlaze(m:ModelBakeMemory,barn:bigint,classId:()=>number,frame:()=>number){
 const p=m.read64(barn+0x12010n);if(!p)throw new NativeObjectFoundationFailure('Blaze.cpp',1049,3,'b');
 m.write64(barn+0x12010n,m.read64(p));m.write32(p,classId());m.write32(p+0x78n,0);m.write8(p+0x7cn,0);m.bytes(p+0x80n,16).fill(0);m.bytes(p+0x90n,2).fill(0);m.write32(p+0x94n,0x3dcccccd);m.write8(p+0x98n,1);m.write8(p+0x99n,0);m.write64(p+0x100n,0n);
 for(let i=0;i<16;i++)m.write32(p+16n+BigInt(i)*4n,i%5===0?0x3f800000:0);
 m.write32(p+0x68n,0xffffffff);m.write64(p+0xccn,0n);m.write64(p+0xa8n,0n);m.write32(p+0xb0n,0);m.write8(p+0x56n,0);m.bytes(p+0xc8n,2).fill(0);m.bytes(p+0xa4n,2).fill(0);m.write64(p+0x9cn,0n);m.write32(p+0x50n,frame());m.write64(p+0xe0n,0n);m.write64(p+0xd4n,0x3dcccccd00000000n);m.write64(p+0xb4n,0x3f80000000000000n);m.write64(p+0xc0n,0n);m.write8(p+0xcan,0);m.bytes(p+0xf0n,16).set(new Uint8Array(Float32Array.of(1,1,1,0).buffer));m.write8(p+0xa1n,1);return p;
}
/** Whole GetByGuid 0x1001ae000 scans all slots, including inactive ones. */
export function findOriginalBlaze(m:ModelBakeMemory,barn:bigint,guid:number){for(let i=0;i<256;i++){const p=barn+BigInt(0x10+i*0x120);if(m.read32(p+0x68n)===(guid>>>0))return p;}return 0n;}
export function countOriginalBlazes(m:ModelBakeMemory,barn:bigint){let n=0;for(let i=0;i<256;i++)n+=m.bytes(barn+BigInt(0x10+i*0x120+0xa1),1)[0];return n>>>0;}
function clearOriginalBlaze(m:ModelBakeMemory,p:bigint,s:BlazeReleaseServices){m.write8(p+0xa1n,0);m.write8(p+0x56n,0);const handle=m.read64(p+0x100n),id=m.read64(p+0x108n);if(handle&&id&&s.soundIdentity(handle)===id)s.stopSound(m.read64(p+0x100n),0);}
/** Whole Release 0x1001adeb0 and OnLevelUnload 0x1001ad6d0. */
export function releaseOriginalBlaze(m:ModelBakeMemory,barn:bigint,p:bigint,s:BlazeReleaseServices){if(!p||!m.bytes(p+0xa1n,1)[0])return;clearOriginalBlaze(m,p,s);m.write64(p,m.read64(barn+0x12010n));m.write64(barn+0x12010n,p);}
export function unloadOriginalBlazeBarn(m:ModelBakeMemory,barn:bigint,s:BlazeReleaseServices){for(let i=0;i<256;i++)releaseOriginalBlaze(m,barn,barn+BigInt(0x10+i*0x120),s);m.write8(barn+12n,0);}
export function loadOriginalBlazeBarn(m:ModelBakeMemory,barn:bigint,game:bigint,load:(blaze:bigint,game:bigint)=>void){for(let i=0;i<256;i++){const p=barn+BigInt(0x10+i*0x120);if(m.bytes(p+0xa1n,1)[0])load(p,game);}}
export function enableOriginalOnBlaze(m:ModelBakeMemory,event:bigint){m.write8(event+0x4an,0);}
export interface OnBlazeServices {setObjectEnabled(object:bigint,value:number):void;start(event:bigint):void;}
/** Whole OnBlaze.Update 0x1001b1b00. Edge latch handles activation and
 * deactivation; +0xa4/+0xa5 are alternative native completion states. */
export function updateOriginalOnBlaze(m:ModelBakeMemory,event:bigint,s:OnBlazeServices){
 const blaze=m.read64(event+0x38n),active=m.bytes(blaze+0x98n,1)[0]?m.bytes(m.read64(blaze+0x110n)+0xb6n,1)[0]:m.bytes(blaze+0x56n,1)[0];
 const state=active||m.bytes(blaze+0xa4n,1)[0]?1:m.bytes(blaze+0xa5n,1)[0];
 if(state!==m.bytes(event+0x49n,1)[0]){m.write8(event+0x4an,0);return;}
 if(m.bytes(event+0x4an,1)[0])return;
 s.setObjectEnabled(m.read64(event+0x40n),1);m.write8(event+0x4an,1);if(m.bytes(event+0x48n,1)[0])s.start(event);
}

export interface BlazeActiveServices {
 /** Native sound request body and 128-byte parameter record. */
 playSound(owner:bigint,name:'blazearrive'|'blazedepart',parameters:Uint8Array):void;
 ticks():number;
 castBlaze(object:bigint):bigint;
 allocate(size:number):bigint;release(pointer:bigint):void;
 setObjectEnabled(object:bigint,value:number):void;
 rpcClassId():number;
 sendRpc(owner:bigint,record:Uint8Array):void;
}
const u32=(n:number)=>n>>>0;
const square=(n:number)=>Math.imul(n,n)>>>0;
const hash=(n:number)=>Number((BigInt(u32(square(n)^0x5bf03635))**2n)%0xfffffffbn);
function requestBlazeSound(m:ModelBakeMemory,p:bigint,owner:bigint,name:'blazearrive'|'blazedepart',s:BlazeActiveServices){const b=new Uint8Array(128),v=new DataView(b.buffer);v.setUint32(0,0x3f800000,true);b[13]=1;b.set(m.bytes(p+0x40n,16),16);v.setUint32(72,0x3f800000,true);v.setUint32(76,0x41200000,true);v.setUint32(112,0xc31,true);s.playSound(owner,name,b);}
/** Whole Blaze.SetActive 0x1001ae070, normal return / assertion paths. Sound,
 * reflection, clock, temporary allocation and network are explicit services.
 * Random-child order is the original integer permutation, not Math.random. */
export function setOriginalBlazeActive(m:ModelBakeMemory,p:bigint,framePointer:bigint,network:bigint,sound:bigint,broadcast:number,active:number,s:BlazeActiveServices){
 const previous=m.bytes(p+0x56n,1)[0];
 if(active&255){
  if(!previous){
   requestBlazeSound(m,p,sound,'blazearrive',s);m.write32(p+0xb4n,m.read32(p+0x78n));m.write64(p+0xc0n,0n);
   const first=m.read64(p+0x70n);if(m.bytes(p+0x7cn,1)[0]&&first){
    const count=m.read32(first+16n);if(count){
     const ticks=BigInt(s.ticks()>>>0),q=Number((0x91a2b3c5n*ticks)>>43n),h=BigInt(u32(square(q)^0x5bf03635))**2n;
     const quotient=(h*0x800000028000000dn)>>95n;let salt=u32(Number(BigInt.asUintN(32,h))+Math.imul(Number(BigInt.asUintN(32,quotient)),5));
     const member=(index:number)=>{const clump=m.read64(p+0x70n);if(index>=m.read32(clump+16n))throw new NativeObjectFoundationFailure('./Clump.h',54,3,'idx < size');const target=s.castBlaze(m.read64(m.read64(clump+8n)+BigInt(index)*8n));if(!target)throw new NativeObjectFoundationFailure('./Clump.h',71,3,'ret');return target;};
     for(let i=0;i<count;i++)salt=u32(salt+hash(m.read32(member(i)+0x68n)));
     const original=s.allocate(count*8),ordered=s.allocate(count*8);
     for(let i=0;i<count;i++)m.write64(original+BigInt(i)*8n,member(i));
     for(let i=0;i<count;i++){
      const n=hash(u32(hash(i)+salt)),v=u32(n^(n<<13));let cursor=u32(Math.imul(u32(Math.imul(square(v),0x3d73)+0xc0ae5),v)+0x5208dd0d),candidate:bigint,index:number;
      do{index=cursor%count;candidate=m.read64(original+BigInt(index)*8n);cursor=u32(index+1);}while(!candidate);
      m.write64(ordered+BigInt(i)*8n,candidate);m.write64(original+BigInt(index)*8n,0n);
     }
     let index=0;while(index<count&&m.read64(ordered+BigInt(index)*8n)!==p)index++;
     const next=index===count?0:(index+1)%count;m.write64(p+0xc0n,m.read64(ordered+BigInt(next)*8n));
     s.release(ordered);s.release(original);
    }
   }
  }
 }else if(previous&&m.bytes(p+0xa0n,1)[0]){
  requestBlazeSound(m,p,sound,'blazedepart',s);if(!m.bytes(p+0xa4n,1)[0])s.setObjectEnabled(m.read64(p+0x88n),1);
 }
 m.write8(p+0x56n,active);m.write32(p+0x50n,m.read32(framePointer));
 if(broadcast&255){const classId=s.rpcClassId(),record=new Uint8Array(32),v=new DataView(record.buffer);v.setBigUint64(0,0x100c12890n,true);v.setUint32(8,classId,true);v.setUint32(20,m.read32(p+0x68n),true);record[24]=m.bytes(p+0x56n,1)[0];v.setUint32(28,m.read32(p+0x50n),true);s.sendRpc(m.read64(network+56n),record);}
}
