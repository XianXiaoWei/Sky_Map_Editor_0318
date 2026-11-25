import fs from 'node:fs';import path from 'node:path';
import {ObjectsDocument} from '../src/core/objects';
import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
import {enableOriginalDetachFromBirdGuides,enableOriginalReleaseBirds,type BirdReleaseServices} from '../src/core/bird-guide-runtime';
export const BIRD_GUIDE_ARENA_BYTES=0x70000,BIRD_GUIDE_TRACE_BYTES=4096;
export interface BirdGuideCase {id:string;mode:0|1;seed:number;count?:number;threshold?:number;position?:number[];avatarPosition?:number[];active?:number;enabled?:number;guideActive?:number;nullTarget?:boolean;badCast?:boolean;stale?:boolean;noGuide?:boolean;nullAvatar?:boolean;mutation?:number;revision?:number;}
export function prepareBirdGuide(c:BirdGuideCase){
 const base=0x440000000n,b=Buffer.alloc(BIRD_GUIDE_ARENA_BYTES);let seed=c.seed>>>0;
 for(let i=0;i<b.length;i++){seed=(Math.imul(seed,1664525)+1013904223)>>>0;b[i]=seed>>>24;}
 const offset=(p:bigint,n:number)=>{const at=Number(p-base);if(at<0||at+n>b.length)throw new Error('Unmapped bird guide storage');return at;};
 const m={bytes:(p:bigint,n:number)=>b.subarray(offset(p,n),offset(p,n)+n),read32:(p:bigint)=>b.readUInt32LE(offset(p,4)),read64:(p:bigint)=>b.readBigUInt64LE(offset(p,8)),write8:(p:bigint,n:number)=>{b[offset(p,1)]=n&255;},write32:(p:bigint,n:number)=>{b.writeUInt32LE(n>>>0,offset(p,4));},write64:(p:bigint,n:bigint)=>{b.writeBigUInt64LE(n,offset(p,8));},string:()=>''};
 const ptr=(at:number,to:number)=>b.writeBigUInt64LE(to?base+BigInt(to):0n,at),word=(at:number,n:number)=>b.writeUInt32LE(n>>>0,at),vec=(at:number,v:number[])=>v.forEach((n,i)=>b.writeUInt32LE(n>>>0,at+i*4));
 ptr(0x240,0x56000);ptr(0x280,0x10000);ptr(0x1038,c.nullTarget?0:c.mode===0?0x3000:0x2000);word(0x1040,c.threshold??0x41c80000);
 ptr(0x2008,0x2100);word(0x2010,c.count??4);ptr(0x2208,0x2300);word(0x2210,c.count??4);
 ptr(0x57000,0x57100);b.writeBigUInt64LE(0x102200000n,0x57140);b.writeBigUInt64LE(0x102200020n,0x57258);b.writeBigUInt64LE(0x102200040n,0x57310);
 for(let i=0;i<4;i++){
  const bird=0x3000+i*0x500,model=0x60000+i*0x400;ptr(0x2100+i*8,bird);ptr(0x2300+i*8,bird);ptr(bird,0x57200);ptr(bird+0x3a0,model);ptr(model+104,0x64000+i*0x100);
  vec(bird+16,c.position??[0,0,0,0x3f800000]);b[bird+0x440]=c.guideActive??1;
  for(let guide=0;guide<4;guide++)ptr(bird+0x420+guide*8,guide===3?0:0x50000+guide*0x100);
 }
 for(let i=0;i<16;i++){
  const avatar=0x10020+i*0x2230,reference=0x40000+i*0x40,guide=c.noGuide?0:0x50000+(i%4)*0x100;
  ptr(avatar,0x57300);ptr(avatar+0x88,reference);b[avatar+0x21b2]=c.active??(i%3?1:0);b[avatar+0x21b3]=c.enabled??(i%5?1:0);
  ptr(reference+16,guide);word(reference+24,c.stale?19:17);word(reference+44,c.revision??0xffffffff);
 }
 for(let i=0;i<4;i++)word(0x500c4+i*0x100,17);
 ptr(0x55018,0x55100);vec(0x55110,c.avatarPosition??[0,0,0,0x3f800000]);word(0x56000,0x3f000000);
 word(0x5f000,c.badCast?1:0);word(0x5f004,c.nullAvatar?1:0);word(0x5f008,c.mutation??0);
 return {base,b,m,event:base+0x1000n,game:base};
}
export function evaluateBirdGuide(c:BirdGuideCase){
 const {base,b,m,event,game}=prepareBirdGuide(c),trace:number[]=[];let casts=0,line=0,severity=0;
 const log=(op:number,p:bigint,...args:number[])=>{trace.push(op,Number(p-base),...Array.from({length:4},(_,i)=>args[i]??0));};
 const s:BirdReleaseServices={
  castCreature:p=>{log(1,p);if(++casts===1){if(c.mutation===1){m.write64(event+56n,base+0x2200n);m.write64(base+0x2308n,base+0x3f00n);}if(c.mutation===2)m.write32(base+0x2010n,0);}return c.badCast?0n:p;},
  fadeSequence:(p,kind,forced,duration,delay)=>{log(2,p,kind,forced,duration,delay);if(c.mutation===3)m.write64(base+0x33a0n,base+0x60c00n);},
  requireAvatar:p=>{log(3,p);if(c.nullAvatar)throw new NativeObjectFoundationFailure('AvatarBarn.cpp',1526,3,'avatar');return base+0x55000n;},
  birdPosition:p=>{log(4,p);if(c.mutation===4)m.write32(event+64n,0);return Uint8Array.from(m.bytes(p+16n,16));},
  getStatistic:(p,i)=>{log(5,p,i);return m.read32(p);},setStatistic:(p,i,n)=>{log(6,p,i,n);m.write32(p,n);},
  start:p=>log(8,p),setObjectEnabled:()=>{throw new Error('Unused Bird release service');},
 };
 try{
  if(c.mode===1)enableOriginalReleaseBirds(m,event,game,s);
  else enableOriginalDetachFromBirdGuides(m,event,game,{start:s.start,avatarEnabled:p=>{log(7,p);if(c.mutation===5)m.write64(base+0x3420n,base+0x50300n);return m.bytes(p+0x21b3n,1)[0];}});
 }catch(e){if(!(e instanceof NativeObjectFoundationFailure))throw e;line=e.line;severity=e.severity;}
 if(trace.length*4>BIRD_GUIDE_TRACE_BYTES)throw new Error('Guide trace capacity');
 const out=Buffer.alloc(12+BIRD_GUIDE_TRACE_BYTES);out.writeUInt32LE(line);out.writeUInt32LE(severity,4);out.writeUInt32LE(trace.length,8);trace.forEach((n,i)=>out.writeUInt32LE(n>>>0,12+i*4));return Buffer.concat([out,b]);
}
export function birdGuideCases(root='/root/sky-research/original-runtime-corpus'){
 const out:BirdGuideCase[]=[],add=(c:Omit<BirdGuideCase,'seed'|'id'>,id=`case-${out.length}`)=>out.push({...c,id,seed:out.length+83});
 for(const guideActive of [0,1,255])for(const active of [0,1,255])for(const enabled of [0,1,256])for(const stale of [false,true])add({mode:0,guideActive,active,enabled,stale});
 for(const c of [{nullTarget:true},{noGuide:true},{mutation:5},{revision:0},{revision:0x7fffffff}])add({mode:0,...c});
 for(const count of [0,1,4])for(const threshold of [0,0x80000000,0xbf800000,0x41c80000,0x7fc12345])for(const position of [[0,0,0,0],[0x40a00000,0,0,0],[0x40800000,0x40400000,0,0],[0x7fc12345,0,0,0]])add({mode:1,count,threshold,position});
 for(const c of [{nullTarget:true},{badCast:true},{nullAvatar:true},{mutation:1},{mutation:2},{mutation:3},{mutation:4}])add({mode:1,...c});
 for(const level of fs.readdirSync(path.join(root,'Levels')).sort()){
  const doc=new ObjectsDocument(fs.readFileSync(path.join(root,'Levels',level,'Objects.level.bin')));
  for(const node of doc.nodes.filter(n=>['ReleaseBirds','DetachFromBirdGuides'].includes(n.className))){
   if(node.className==='DetachFromBirdGuides')add({mode:0,guideActive:0},`${level}/#${node.id}`);
   else{const clump=doc.nodes[Number(node.fields.find(f=>f.name==='birds')!.value)],count=clump.fields.find(f=>f.name==='data')!.children!.length;if(count>4)throw new Error('Extend real bird guide capacity');add({mode:1,count},`${level}/#${node.id}`);}
  }
 }
 return out;
}
