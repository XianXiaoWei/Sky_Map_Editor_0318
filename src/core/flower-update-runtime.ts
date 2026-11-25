import type {ModelBakeMemory} from './model-baked-runtime';
import {itemFloats,itemView} from './item-effect-arithmetic';
import {originalFlowerTarget} from './flower-distribution';
export interface FlowerUpdateServices {
 enabled():boolean;height():number;size():number;defaultUserByte():number;debugEnabled():boolean;
 uniform(render:bigint,name:'u_flowerHeight'|'u_flowerSize',value:number):void;
 cameraPosition(camera:bigint):number[];cameraForward(camera:bigint):number[];
 mapVertices(data:bigint):bigint;
 visibility(owner:bigint,spheres:bigint,count:number,results:bigint,mode:number):void;
 allocator():bigint;heap():bigint;allocate(owner:bigint,bytes:number,heap:bigint,alignment:number):bigint;free(owner:bigint,p:bigint):void;
 generate(barn:bigint,collision:bigint,cluster:bigint,sphere:bigint,points:bigint,success:bigint,count:number,seed:number,instant:boolean):void;
 statistics(barn:bigint,camera:bigint,statistics:bigint,extra:number,base:number,total:number,generated:number):void;
}
/** Whole normal FlowerBarn.Update 0x10034e530. GPU mapping, camera,
 * Visibility, allocation and verified vertex generation are owner services. */
export function updateOriginalFlowerBarn(m:ModelBakeMemory,barn:bigint,collision:bigint,camera:bigint,visibility:bigint,statistics:bigint,s:FlowerUpdateServices){
 const count=m.read32(barn+0x35dd0n);if(!s.enabled()||!count)return {drawCount:0,updated:false};
 const word=(p:bigint)=>itemView(m.bytes(p,2)).getUint16(0,true),putWord=(p:bigint,n:number)=>itemView(m.bytes(p,2)).setUint16(0,n,true),byte=(p:bigint)=>m.bytes(p,1)[0],readFloat=(p:bigint)=>itemView(m.bytes(p,4)).getFloat32(0,true);
 const set=(render:bigint,name:'u_flowerHeight'|'u_flowerSize',value:number)=>{if(!byte(render+0x2c8n))throw new Error('Original flower VertexRender is not initialized');s.uniform(render,name,value);};
 set(barn+0x6c0n,'u_flowerHeight',s.height());set(barn+0x6c0n,'u_flowerSize',s.size());set(barn+0xc00n,'u_flowerSize',s.size());
 const eye=s.cameraPosition(camera),forward=s.cameraForward(camera);
 if(m.read32(barn+0x160n)!==2||m.read32(barn+0x110n)!==32)throw new Error('Original flower dynamic vertex format is not connected');
 const output=s.mapVertices(barn+0x158n);s.visibility(visibility,barn+0x11dd0n,count,barn+0x31dd0n,1);
 let drawCount=0,initialOffset=0,generated=0;
 const append=(p:bigint)=>{if(drawCount>0xfffe)return false;m.bytes(output+BigInt(drawCount++)*32n,32).set(m.bytes(p,32));return true;};
 const release=(p:bigint)=>{m.write64(p,m.read64(barn+0x455dd8n));m.write64(barn+0x455dd8n,p);};
 for(let index=0;index<count;index++){
  const cluster=barn+0x21dd0n+BigInt(index)*16n,sphere=barn+0x11dd0n+BigInt(index)*16n,old=word(cluster+4n),filled=word(cluster+6n),reserve=word(cluster+8n);let target=0;
  const visible=m.read32(barn+0x31dd0n+BigInt(index)*4n);
  if(visible){
   const previous=Math.max(old,reserve),wanted=originalFlowerTarget({sphere:itemFloats(m.bytes(sphere,16)),density:readFloat(cluster),patches:[],reserve},readFloat(barn+0x35dd4n),eye,forward);
   target=Math.min((300-generated+previous)>>>0,wanted)>>>0;putWord(cluster+4n,target);
   const extra=target-previous;
   if(extra>0){
    const owner=s.allocator(),points=s.allocate(owner,extra*8,s.heap(),8);let allocated=0;
    for(;allocated<extra;allocated++){const p=m.read64(barn+0x455dd8n);if(!p)break;m.write64(barn+0x455dd8n,m.read64(p));m.bytes(p,32).fill(0);m.write64(points+BigInt(allocated)*8n,p);}
    if(allocated){
     const success=s.allocate(s.allocator(),allocated,s.heap(),1);s.generate(barn,collision,cluster,sphere,points,success,allocated,(index<<12)+previous,old===0);
     let accepted=0;
     for(let j=0;j<allocated;j++){const p=m.read64(points+BigInt(j)*8n);if(byte(success+BigInt(j))){const slot=Number(p-(barn+0x335dd8n))/32;m.write32(barn+0x435dd8n+BigInt(slot)*4n,(index<<12)+previous+accepted);accepted++;}else if(p)release(p);}
     s.free(s.allocator(),success);generated+=accepted;
    }
    s.free(s.allocator(),points);
   }
  }else putWord(cluster+4n,0);
  if(visible)for(let j=0;j<filled;j++){
   const p=barn+0x35dd8n+BigInt(initialOffset+j)*32n;let alpha=byte(p+19n);
   if(j<word(cluster+4n)){if(alpha!==255){alpha=old?Math.min(255,alpha+15):255;m.write8(p+19n,alpha);}}
   else if(alpha){alpha=Math.max(0,alpha-15);m.write8(p+19n,alpha);if(!alpha){m.write8(p+20n,s.defaultUserByte());m.write8(p+23n,0);}}
   if(alpha)append(p);
  }
  initialOffset+=filled;
 }
 const base=drawCount;
 if(byte(barn+0x455de0n))for(let slot=0;slot<32768;slot++){
  const mapping=barn+0x435dd8n+BigInt(slot)*4n,id=m.read32(mapping);if(id===0xffffffff)continue;
  const p=barn+0x335dd8n+BigInt(slot)*32n,target=word(barn+0x21dd4n+BigInt(id>>>12)*16n);let alpha=byte(p+19n);
  if(!target)alpha=0;
  else if(alpha===(((Math.imul(alpha,205)&0xfc00)>>>10)*5))alpha=(id&0xfff)<target?Math.min(255,alpha+15):(alpha-1)&255;
  else alpha=Math.max(0,alpha-15);
  m.write8(p+19n,alpha);
  if(!alpha||!append(p)){m.write32(mapping,0xffffffff);release(p);}
 }
 if(byte(barn+0x97an)||byte(barn+0xeban))throw new Error('Original flower VertexRender has already been queued');
 m.write32(barn+0x95cn,drawCount);m.write32(barn+0xe9cn,drawCount);
 if(s.debugEnabled())s.statistics(barn,camera,statistics,drawCount-base,base,drawCount,generated);
 return {drawCount,updated:true,generated,base};
}
