import {findOriginalBirdAnimationSequence,isOriginalBirdAnimationSequenceValid,updateOriginalBirdTakeoffAnimation} from '../src/core/bird-natural-animation-runtime';
import {resourceAnimationNameHash} from '../src/core/resource-animation-list';
import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
export const BIRD_NATURAL_ARENA_BYTES=0x20000,BIRD_NATURAL_TRACE_BYTES=2048;
export interface BirdNaturalCase {mode:number;seed:number;disabled?:number;takingOff?:number;prior?:number;weight?:number;speed?:number;secondary?:number;steps?:number;restriction?:number;heapString?:boolean;pack?:string;callback?:number;index?:number;name?:string;required?:number;nullPack?:boolean;label?:string;}
const BASE=0x440000000n;
export function prepareBirdNatural(c:BirdNaturalCase){
 const b=Buffer.alloc(BIRD_NATURAL_ARENA_BYTES);let seed=c.seed>>>0;for(let i=0;i<b.length;i++){seed=(Math.imul(seed,1664525)+1013904223)>>>0;b[i]=seed>>>24;}
 const p=(at:number,n:number)=>b.writeBigUInt64LE(n?BASE+BigInt(n):0n,at),w=(at:number,n:number)=>b.writeUInt32LE(n>>>0,at),str=(at:number,s:string)=>{b.set(Buffer.from(s+'\0'),at);};
 p(0x1078,0x3000);p(0x3010,0x4000);b[0x4058]=c.heapString?1:0;const pack=c.pack??'CharSkyBird';str(c.heapString?0x4800:0x4059,pack);p(0x4068,0x4800);
 b[0x13c8]=c.prior??0;b[0x2084]=c.disabled??0;b[0x2021]=c.takingOff??1;b.writeFloatLE(c.weight??0,0x2024);b.writeFloatLE(c.speed??1,0x2028);w(0x600c,c.secondary??0);
 w(0x5000,2);p(0x5008,0x5200);p(0x5010,0x5400);
 for(const [sequence,name] of [[0x5200,'Takeoff'],[0x5400,'TakeoffShort']] as const){b.writeBigUInt64LE(BigInt('0x'+resourceAnimationNameHash(name)),sequence+8);b.writeBigUInt64LE(c.restriction===1?BigInt('0x'+resourceAnimationNameHash(pack)):c.restriction===2?1n:0n,sequence+16);w(sequence+24,c.steps??2);for(let i=0;i<3;i++)p(sequence+32+i*8,0x5600+i*0x40);}
 for(let i=0;i<3;i++){p(0x5608+i*0x40,0x5800+i*0x40);str(0x5800+i*0x40,['critterMove','critterIdle','Struggle'][i]);}
 str(0x5900,c.name??'Takeoff');str(0x5980,pack);w(0x1f000,c.callback??0);w(0x1f004,c.index??0);w(0x1f008,c.required??0);w(0x1f00c,Number(!!c.nullPack));
 const at=(p:bigint,n:number)=>{const ix=Number(p-BASE);if(!Number.isSafeInteger(ix)||ix<0||ix+n>b.length)throw new Error('Unmapped bird natural animation address');return ix;};
 const m={bytes:(p:bigint,n:number)=>b.subarray(at(p,n),at(p,n)+n),read32:(p:bigint)=>b.readUInt32LE(at(p,4)),read64:(p:bigint)=>b.readBigUInt64LE(at(p,8)),write8:(p:bigint,n:number)=>{b[at(p,1)]=n;},write32:(p:bigint,n:number)=>{b.writeUInt32LE(n>>>0,at(p,4));},write64:(p:bigint,n:bigint)=>{b.writeBigUInt64LE(n,at(p,8));},string:(p:bigint)=>{const start=at(p,1),end=b.indexOf(0,start);if(end<0)throw new Error('Unterminated bird animation string');return b.toString('utf8',start,end);}};
 return {b,m,base:BASE};
}
export function evaluateBirdNatural(c:BirdNaturalCase){
 const {b,m,base}=prepareBirdNatural(c),trace=Buffer.alloc(BIRD_NATURAL_TRACE_BYTES);let used=0,line=0,severity=0,result=0,finds=0;
 const log=(op:number,p:bigint,a:number,b=0,c=0,d=0)=>{for(const n of [op,Number(p-base),a,b,c,d]){trace.writeUInt32LE(n>>>0,used*4);used++;}};
 const s={registry:base+0x5000n,findAction:(p:bigint,name:string,_required:false)=>{const hash=BigInt('0x'+resourceAnimationNameHash(name));log(1,p,Number(hash&0xffffffffn),Number(hash>>32n));finds++;if(c.callback===3)m.write32(base+0x5218n,0);return c.callback===1||c.callback===2&&finds===2?0n:base+0x7000n;},playSequence:(p:bigint,index:number,flags:0,weight:1,speed:1)=>{log(2,p,index,flags,0x3f800000,0x3f800000);m.write32(p+0x20n,index);if(c.callback===4)m.write8(base+0x13c8n,254);if(c.callback===5)m.write64(base+0x1078n,0n);}};
 try{if(c.mode===0)updateOriginalBirdTakeoffAnimation(m,base+0x1000n,base+0x2000n,base+0x6000n,s);else if(c.mode===1)result=findOriginalBirdAnimationSequence(m,s.registry,c.name??'Takeoff',c.required??0,c.nullPack?undefined:c.pack??'CharSkyBird');else if(c.mode===2)result=Number(isOriginalBirdAnimationSequenceValid(m,base+0x6000n,c.index??0,s));else throw new Error('Unknown bird natural mode');}catch(e){if(!(e instanceof NativeObjectFoundationFailure))throw e;line=e.line;severity=e.severity;}
 const header=Buffer.alloc(16);header.writeUInt32LE(line);header.writeUInt32LE(severity,4);header.writeUInt32LE(used,8);header.writeInt32LE(result,12);return Buffer.concat([header,trace,b]);
}
export function birdNaturalCases(){const cases:BirdNaturalCase[]=[],add=(mode:number,rest:Omit<BirdNaturalCase,'mode'|'seed'>={})=>cases.push({mode,seed:100+cases.length,...rest});
 for(const takingOff of [0,1])for(const prior of [0,1])for(const weight of [0,.49999997,.5,1,NaN])add(0,{takingOff,prior,weight});
 for(const disabled of [1,2,255])add(0,{disabled});
 for(const secondary of [-1,0,1])for(const prior of [0,1])add(0,{secondary,prior,weight:.25});
 for(const speed of [0,.9999899,.99999,1,1.00001,1.0000101,Infinity,NaN])add(0,{takingOff:0,speed});
 for(const restriction of [0,1,2])for(const heapString of [false,true])for(const pack of ['CharSkyBird','','Bird_ß'])add(0,{restriction,heapString,pack});
 for(const callback of [1,2,3,4,5])for(const takingOff of [0,1])add(0,{callback,takingOff});
 for(const steps of [0,1,2,3])add(0,{steps});
 for(const name of ['Takeoff','TakeoffShort','missing'])for(const restriction of [0,1,2])for(const nullPack of [false,true])add(1,{name,restriction,nullPack});
 for(const required of [0,1,256,257])add(1,{name:'missing',required});
 for(const index of [-1,0,1,2,0x7fffffff])for(const steps of [0,1,2])add(2,{index,steps});
 for(const callback of [1,2,3])add(2,{callback});return cases;
}
