import fs from 'node:fs';
import path from 'node:path';
import {ObjectsDocument} from '../src/core/objects';
import {OBJECT_EFFECT_POOLS,createOriginalObjectEffect,ObjectEffectCapacityError,setOriginalCandleTransform,getOriginalCandleTransform,setOriginalCandleEnabled,getOriginalCandleEnabled,unloadOriginalFlowerBarn} from '../src/core/object-effects-runtime';
export interface EffectCase {mode:number;seed:number;index?:number;repeat?:number;offset?:number;enabled?:number;renderOffset?:number;transformHex?:string;label?:string;}
const base=0x440000000n;
export function prepareEffectCase(c:EffectCase){
 const b=Buffer.alloc(0x20000);let seed=c.seed>>>0;
 for(let i=0;i<b.length;i++){seed=(Math.imul(seed,1664525)+1013904223)>>>0;b[i]=seed>>>24;}
 const pools=Object.values(OBJECT_EFFECT_POOLS);
 if(c.mode<3)b.writeUInt32LE(c.index??0,pools[c.mode].count);
 b.writeUInt32LE(c.offset??0x1800,0x1ffe0);b.writeUInt32LE(c.enabled??1,0x1ffe4);
 b.writeBigUInt64LE(base+BigInt(c.renderOffset??0x1400),0x1090);
 if(c.transformHex){const bytes=Buffer.from(c.transformHex,'hex');if(bytes.length!==64)throw new Error('Effect transform must have 64 bytes');bytes.copy(b,c.mode===3?c.offset??0x1800:0x1010);}
 const locate=(p:bigint,n:number)=>{const at=Number(p-base);if(at<0||at+n>b.length)throw new Error('Effect address unavailable');return at;};
 const m={bytes:(p:bigint,n:number)=>b.subarray(locate(p,n),locate(p,n)+n),read8:(p:bigint)=>b[locate(p,1)],read32:(p:bigint)=>b.readUInt32LE(locate(p,4)),read64:(p:bigint)=>b.readBigUInt64LE(locate(p,8)),write8:(p:bigint,n:number)=>{b[locate(p,1)]=n;},write32:(p:bigint,n:number)=>{b.writeUInt32LE(n,locate(p,4));},write64:(p:bigint,n:bigint)=>{b.writeBigUInt64LE(n,locate(p,8));},string:()=>''};
 return {b,m};
}
export function evaluateEffectCase(c:EffectCase){
 const {b,m}=prepareEffectCase(c),trace:bigint[][]=[];let result=0n,line=0,severity=0;
 try{
  if(c.mode<3)for(let i=0;i<(c.repeat??1);i++)result=createOriginalObjectEffect(m,base,Object.keys(OBJECT_EFFECT_POOLS)[c.mode] as keyof typeof OBJECT_EFFECT_POOLS);
  else if(c.mode===3)setOriginalCandleTransform(m,base+0x1000n,base+BigInt(c.offset??0x1800));
  else if(c.mode===4)result=getOriginalCandleTransform(m,base+BigInt(c.offset??0x1800),base+0x1000n);
  else if(c.mode===5)setOriginalCandleEnabled(m,base+0x1000n,c.enabled??1);
  else if(c.mode===6)result=BigInt(getOriginalCandleEnabled(m,base+0x1000n));
  else if(c.mode===7)unloadOriginalFlowerBarn(m,base,{releaseVertexData:p=>{trace.push([1n,p]);},releaseRenderData:p=>{trace.push([2n,p]);}});
  else throw new Error('Unknown effect mode');
 }catch(e){if(!(e instanceof ObjectEffectCapacityError))throw e;line=e.line;severity=e.severity;}
 const header=Buffer.alloc(20+trace.length*16);header.writeUInt32LE(line);header.writeUInt32LE(severity,4);header.writeUInt32LE(trace.length,8);header.writeBigUInt64LE(result,12);trace.forEach((row,i)=>row.forEach((n,j)=>header.writeBigUInt64LE(n,20+i*16+j*8)));
 return Buffer.concat([header,b]);
}
export function effectCases():EffectCase[]{
 const cases:EffectCase[]=[];
 Object.values(OBJECT_EFFECT_POOLS).forEach((pool,mode)=>{
  for(const index of [0,1,pool.capacity-1,pool.capacity,pool.capacity+1,0xffffffff])for(const repeat of [0,1,2])cases.push({mode,seed:71+cases.length,index,repeat});
  cases.push({mode,seed:91,index:0,repeat:pool.capacity+1,label:'full pool followed by exhaustion'});
 });
 for(const mode of [3,4])for(const offset of [0x1800,0x1000,0x1010,0x1020,0x1030])cases.push({mode,seed:88+cases.length,offset,label:'matrix copy with exact column alias order'});
 for(const enabled of [0,1,2,127,255])for(const renderOffset of [0x1400,0x103c])cases.push({mode:5,seed:5,enabled,renderOffset});
 for(const seed of [0,1,222,999])cases.push({mode:6,seed});
 for(const seed of [11,97])cases.push({mode:7,seed});
 const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus';
 for(const level of fs.readdirSync(path.join(data,'Levels')).sort()){
  const doc=new ObjectsDocument(fs.readFileSync(path.join(data,'Levels',level,'Objects.level.bin')));
  Object.keys(OBJECT_EFFECT_POOLS).forEach((className,mode)=>{const count=doc.nodes.filter(n=>n.className===className).length;if(count)cases.push({mode,seed:cases.length,index:0,repeat:count,label:`${level}: ${count} ${className} saved instances`});});
  for(const node of doc.nodes.filter(n=>n.className==='CandleObject')){
   const transform=node.fields.find(f=>f.name==='transform');if(!transform)throw new Error(`${level} #${node.id} Candle transform missing`);
   cases.push({mode:3,seed:node.id,transformHex:transform.raw,label:`${level} #${node.id} saved Candle transform`});
  }
 }
 return cases;
}
