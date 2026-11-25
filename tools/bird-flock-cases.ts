import {freeOriginalBirdFlockAllocation,resetOriginalBirdFlockHeap,setOriginalBirdFlockInstanceCount,unloadOriginalBirdFlock,unloadOriginalBirdFlocks,updateOriginalBirdFlocks} from '../src/core/bird-flock-runtime';
import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
export const BIRD_FLOCK_ARENA_BYTES=0x200000,BIRD_FLOCK_TRACE_BYTES=8192;
export interface BirdFlockCase {mode:number;seed:number;count?:number;flags?:number;callback?:number;camera?:number[];points?:number[][];candidates?:number;label?:string;}
const BASE=0x440000000n,FLOCK=0x82000,MODEL=0x84000;
export function prepareBirdFlock(c:BirdFlockCase){
 const b=Buffer.alloc(BIRD_FLOCK_ARENA_BYTES);let seed=c.seed>>>0;for(let i=0;i<b.length;i++){seed=(Math.imul(seed,1664525)+1013904223)>>>0;b[i]=seed>>>24;}
 const p=(at:number,n:number)=>b.writeBigUInt64LE(n?BASE+BigInt(n):0n,at),w=(at:number,n:number)=>b.writeUInt32LE(n>>>0,at),flags=c.flags??0,count=c.count??1;
 p(0x70,0x87000);p(0x80068,flags&1?0:MODEL);w(0x80cf0,count);
 // Original embedded Heap and a second heap for callback re-reads.
 for(const heap of [0x10,0x89000]){p(heap+8,0x8a000);b.writeBigUInt64LE(64n,heap+16);p(heap+0x20,0x8b000);b[heap+0x47]=Number(!!(flags&2));b[heap+0x48]=Number(!!(flags&4));w(heap+0x4c,2);p(heap+0x50,0x8c000);}
 if(flags&8)p(0x30,0);p(0x8c000,0x90100);p(0x8c010,flags&16?0x90200:0);
 for(const model of [MODEL,0x84800]){w(model+0x158,flags&32?0:0x2800);w(model+0x190,flags&64?1:2);w(model+0x120,flags&128?16:20);p(model+0x188,flags&256?0:0x150000);w(model+0x458,2);p(model+0x450,0x85000);}
 for(let i=0;i<2;i++){b[0x85000+i*0x540+0x52a]=(flags&512)&&i===1?1:0;w(0x85000+i*0x540+0x510,77);}
 for(const object of [0x88000,0x88100]){p(object,0x88200);p(object+8,0x8d000);b[object+16]=flags&1024?0:1;}
 b.writeBigUInt64LE(0x102220000n,0x88200);b.writeBigUInt64LE(0x102220020n,0x88210);b.writeBigUInt64LE(0x102220040n,0x88230);
 const configure=(flock:number,i:number)=>{
  p(flock+0xa0,flags&2048?0:0x10);p(flock+0x88,flags&4096?0:0xb0000+i*0x800);p(flock+0x68,flags&8192?0:0x90000+i*0x400);
  p(flock+0xa8,flags&16384?0:0x88000);p(flock+0xb0,flags&32768?0:flags&65536?0x8d010:0x8d000);
  w(flock+0x94,c.candidates??c.points?.length??3);
  const candidates=Math.min(c.candidates??c.points?.length??3,0x2801);
  for(let j=0;j<candidates;j++){const at=0xb0000+i*0x800+j*0x30,point=c.points?.[j%c.points.length]??[j%3-1,0,0,1];for(let k=0;k<4;k++)b.writeFloatLE(point[k]??0,at+k*4);b.writeUInt16LE(j%3,at+0x24);}
  for(let j=0;j<3;j++)w(0x90000+i*0x400+j*64+0x30,0x10203040+i*16+j);
 };
 configure(FLOCK,0);for(let i=0;i<Math.min(count,16);i++)configure(0x80070+i*0xc8,i);
 const camera=c.camera??Array.from({length:16},(_,i)=>Number(i%5===0));for(let i=0;i<16;i++)b.writeFloatLE(camera[i],0x871c0+i*4);
 w(0x1f0100,c.callback??0);w(0x1f0104,c.mode);w(0x1f0108,c.candidates??3);
 const at=(p:bigint,n:number)=>{const ix=Number(p-BASE);if(!Number.isSafeInteger(ix)||ix<0||ix+n>b.length)throw new Error(`Unmapped bird flock memory: ${p.toString(16)} + ${n}`);return ix;};
 const m={bytes:(p:bigint,n:number)=>b.subarray(at(p,n),at(p,n)+n),read32:(p:bigint)=>b.readUInt32LE(at(p,4)),read64:(p:bigint)=>b.readBigUInt64LE(at(p,8)),write8:(p:bigint,n:number)=>{b[at(p,1)]=n;},write32:(p:bigint,n:number)=>{b.writeUInt32LE(n>>>0,at(p,4));},write64:(p:bigint,n:bigint)=>{b.writeBigUInt64LE(n,at(p,8));},string:()=>''};
 return {b,m,base:BASE};
}
export function evaluateBirdFlock(c:BirdFlockCase){
 const {b,m,base}=prepareBirdFlock(c),trace=Buffer.alloc(BIRD_FLOCK_TRACE_BYTES);let used=0,line=0,severity=0,frees=0,gets=0;
 const off=(p:bigint)=>p?Number(p-base)>>>0:0xffffffff,log=(op:number,p:bigint,a=0,b=0,d=0)=>{for(const n of [op,off(p),a,b,d]){trace.writeUInt32LE(n>>>0,used*4);used++;}};
 const callback=c.callback??0,flock=base+BigInt(c.mode===0?FLOCK:0x80070);
 const s={
  freeAllocation:(allocator:bigint,p:bigint)=>{log(1,allocator,off(p));if(++frees===1&&callback===1){m.write64(flock+0xa0n,base+0x89000n);m.write64(flock+0x68n,base+0x90200n);}if(callback===11){m.write32(base+0x5cn,1);m.write64(base+0x8c000n,0n);}},
  releaseAllocator:(p:bigint)=>{log(2,p);if(callback===9){m.write64(base+0x18n,base+0x8a100n);m.write64(base+0x20n,32n);}},
  createAllocator:(start:bigint,size:bigint,flags:0)=>{log(3,start,Number(size),flags);if(callback===10)m.write64(base+0x20n,16n);return base+0x8b100n;},
  initializeAllocator:(p:bigint,size:bigint)=>{log(4,p,Number(size));m.write32(p,Number(size));},
  generation:(object:bigint)=>{log(5,object);const gen=m.read64(object+8n);gets++;if(callback===2&&gets===1)m.write64(flock+0xa8n,base+0x88100n);if(callback===5&&gets===2)return gen+16n;return gen;},
  enabled:(object:bigint)=>{log(6,object);const n=m.bytes(object+16n,1)[0];if(callback===3)m.write64(flock+0xa8n,0n);if(callback===4)m.write64(flock+0xb0n,base+0x8d010n);return n;},
  setEnabled:(object:bigint,n:0)=>{log(7,object,n);m.write8(object+16n,n);},
  updateFlock:(p:bigint,game:bigint)=>{log(8,p,off(game));if(callback===7)m.write32(base+0x80cf0n,1);if(callback===8)m.write64(base+0x80068n,base+0x84800n);if(callback===12){m.write64(p+0x88n,base+0xb0000n);m.write32(p+0x94n,1);}},
 };
 try{
  if(c.mode===0)unloadOriginalBirdFlock(m,base+BigInt(FLOCK),s);else if(c.mode===1)unloadOriginalBirdFlocks(m,base,s);else if(c.mode===2)updateOriginalBirdFlocks(m,base,base,s);else if(c.mode===3)freeOriginalBirdFlockAllocation(m,base+0x10n,c.flags&&c.flags&4096?0n:base+0x90100n,s);else if(c.mode===4)resetOriginalBirdFlockHeap(m,base+0x10n,s);else if(c.mode===5)setOriginalBirdFlockInstanceCount(m,base+BigInt(MODEL),c.candidates??3);else throw new Error('Unknown bird flock mode');
 }catch(e){if(!(e instanceof NativeObjectFoundationFailure))throw e;line=e.line;severity=e.severity;}
 const header=Buffer.alloc(12);header.writeUInt32LE(line);header.writeUInt32LE(severity,4);header.writeUInt32LE(used,8);return Buffer.concat([header,trace,b]);
}
export function birdFlockCases(){const cases:BirdFlockCase[]=[],add=(mode:number,rest:Omit<BirdFlockCase,'mode'|'seed'>={})=>cases.push({mode,seed:31+cases.length,...rest});
 for(const flags of [0,2,4,4|16,8,1024,2048,4096,8192,16384,32768,65536,4096|8192])add(0,{flags});
 for(const callback of [1,2,3,4,5,11])add(0,{callback,flags:callback===11?4:0});
 for(const count of [0,1,3,16])for(const flags of [0,2,4,512,2048])add(1,{count,flags});
 for(const callback of [1,2,3,4,5,9,10,11])add(1,{count:3,callback,flags:callback===11?4:0});
 for(const count of [0,1,3,16])for(const flags of [0,1,64,128,256,512,32])add(2,{count,flags});
 for(const points of [[[0,0,0,1],[2,0,0,2],[2.0001,0,0,3],[-2,0,0,4],[-2.0001,0,0,5]],[[0,2,0,1],[0,-2,0,2],[0,0,2,3],[0,0,-2,4]],[[NaN,0,0,1],[Infinity,0,0,2],[-Infinity,0,0,3],[0,0,0,NaN]]])add(2,{points,label:'plane margin, unordered and raw packed fields'});
 add(2,{camera:new Array(16).fill(0),points:[[200,300,400,9]],label:'zero plane length'});
 add(2,{camera:[1,.2,.3,.1,.4,2,.6,.2,.7,.8,3,.3,.5,.6,.7,1],points:[[0,0,0,1],[1,2,3,4],[-5,0,0,2],[0,5,0,3]],label:'non-symmetric normalized planes'});
 for(const candidates of [0,1,0x2800,0x2801])add(2,{candidates,points:[[0,0,0,1]],label:'candidate cap and untouched output tail'});
 add(2,{count:2,candidates:0x2801,points:[[0,0,0,1]],label:'total instance cap'});
 for(const callback of [7,8,12])add(2,{count:3,callback});
 for(const flags of [0,4,4|16,4096])add(3,{flags});add(3,{flags:4,callback:11});
 for(const flags of [0,2,8])add(4,{flags});for(const callback of [9,10])add(4,{flags:2,callback});
 for(const candidates of [0,1,0x2800,0x2801,0xffffffff])for(const flags of [0,512])add(5,{candidates,flags});
 return cases;
}
