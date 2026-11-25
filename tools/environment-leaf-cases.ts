import fs from 'node:fs';import path from 'node:path';
import {ObjectsDocument} from '../src/core/objects';
import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
import {initializeOriginalPointLightBarn,createOriginalPointLight,releaseOriginalPointLight,releaseAllOriginalPointLights,gatherOriginalPointLights,enableOriginalEmitterFlowRail,updateOriginalEmitterFlowRail} from '../src/core/environment-leaf-runtime';
import {constructOriginalRail,allocateOriginalRailPoints} from '../src/core/rail-storage-runtime';
import {loadOriginalDropOcclusion,unloadOriginalDropOcclusion,updateOriginalDropOcclusion,enableOriginalDropOcclusion} from '../src/core/drop-occlusion-runtime';
import {gameScaledDelta} from '../src/core/material-dynamics';
import {writeOriginalPointLightUniform,originalPointLightAttenuation} from '../src/core/point-light-runtime';
import {startOriginalEvent} from '../src/core/event-start-runtime';
import {addOriginalCloudDrop,routeOriginalCloudDrop} from '../src/core/cloud-drop-runtime';
import {getOriginalSpawnMotesTransform,setOriginalSpawnMotesTransform} from '../src/core/spawn-motes-runtime';
export const LEAF_BASE=0x430000000n;
export interface LeafCase {label:string;mode:number;fill:number;count?:number;active?:number[];release?:number|null;capacity?:number;first?:number;mutationAt?:number;mutationKind?:number;reject?:number;fields?:Record<string,string>;intensityFloat?:number|null;color?:number[];intensity?:number;axis?:number[];dotA?:number[];dotB?:number[];distance?:number;mathCalls?:{op:string;input:number;result:number}[];source?:string;}
export function leafCases(){
 const rows:LeafCase[]=[];for(const fill of [0,0xa5,255]){
  rows.push({label:`initialize/${fill}`,mode:0,fill});
  for(const count of [0,1,2,255,256,257])rows.push({label:`create/${count}/${fill}`,mode:1,fill,count});
  for(const active of [[],[0,1,255],Array.from({length:256},(_,i)=>i)]){
   for(const release of [null,0,1,254,255])rows.push({label:`release/${active.length}/${release}/${fill}`,mode:2,fill,active,release});
   rows.push({label:`releaseAll/${active.length}/${fill}`,mode:3,fill,active});
   for(const capacity of [255,256,512])rows.push({label:`gather/${active.length}/${capacity}/${fill}`,mode:4,fill,active,capacity});
  }
  for(const mode of [5,6])for(const count of [0,1,3])for(const first of [0,1])rows.push({label:`emitter/${mode}/${count}/${first}/${fill}`,mode,fill,count,first});
  for(const mutationKind of [1,2,3])rows.push({label:`liveReload/${mutationKind}/${fill}`,mode:5,fill,count:3,mutationAt:3,mutationKind});
  rows.push({label:`failedCast/${fill}`,mode:5,fill,count:3,reject:1});
  for(const mode of [11,12,13,14])for(const count of [0,1,3])for(const first of [0,1])rows.push({label:`drop/${mode}/${count}/${first}/${fill}`,mode,fill,count,first});
  for(const snap of [0,.75,1,15,30,60])rows.push({label:`dropFade/${snap}/${fill}`,mode:13,fill,count:3,first:1,fields:{fadeInSnappiness:Buffer.from(Float32Array.of(snap).buffer).toString('hex'),fadeOutSnappiness:Buffer.from(Float32Array.of(snap).buffer).toString('hex')}});
  for(const mutationKind of [1,2,3])rows.push({label:`dropLiveReload/${mutationKind}/${fill}`,mode:13,fill,count:3,first:1,mutationAt:3,mutationKind});
  for(const mode of [13,14])rows.push({label:`dropFailedCast/${mode}/${fill}`,mode,fill,count:3,reject:1});
  for(const mode of [15,16])for(const count of [0,1,511,512])for(const intensity of [-2,0,1])rows.push({label:`cloudDrop/${mode}/${count}/${intensity}/${fill}`,mode,fill,count,intensity,color:[1,.48,.2825,1]});
  for(const color of [[0,0,0,1],[-1,-1,-1,1],[1,-1,0,0]])rows.push({label:`cloudDropColor/${color}/${fill}`,mode:15,fill,count:0,color});
  for(const intensity of [2**-126,2**-125])rows.push({label:`cloudDropThreshold/${intensity}/${fill}`,mode:15,fill,count:0,intensity});
  for(const intensity of [0,.1,1,100,1000])rows.push({label:`pointUniform/${intensity}/${fill}`,mode:9,fill,intensity,color:[1,.48,.2825,1]});
  for(const distance of [0,1,100,999,1000])for(const dotB of [[0,1,0,0],[1,0,0,0],[-1,0,0,0]])rows.push({label:`pointAttenuation/${distance}/${dotB}/${fill}`,mode:10,fill,axis:[2,0,0,0],dotA:[1,0,0,0],dotB,distance});
  rows.push({label:`railConstruct/${fill}`,mode:7,fill,mutationAt:1,mutationKind:4});
  for(const count of [0,1,2,7,128])rows.push({label:`railAllocate/${count}/${fill}`,mode:8,fill,count});
  for(const mode of [17,18])rows.push({label:`spawnTransform/${mode}/${fill}`,mode,fill});
 }
 const root=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus';
 for(const level of fs.readdirSync(path.join(root,'Levels')).sort()){
  const doc=new ObjectsDocument(fs.readFileSync(path.join(root,'Levels',level,'Objects.level.bin')));
  for(const node of doc.nodes.filter(n=>n.className==='SpawnMotes'))for(const mode of [17,18])rows.push({label:`${level}/#${node.id}/spawnTransform/${mode}`,source:`${level}/#${node.id}`,mode,fill:0xa5,fields:{transform:node.fields.find(f=>f.name==='transform')!.raw}});
  for(const event of doc.nodes.filter(n=>n.className==='SetEmitterFlowRail')){
   const clump=doc.nodes.find(n=>n.id===Number(event.fields.find(f=>f.name==='emitters')!.value))!,count=Number(clump.fields.find(f=>f.name==='data')!.value);
   for(const mode of [5,6])rows.push({label:`${level}/#${event.id}/${mode}`,source:`${level}/#${event.id}`,mode,fill:0xa5,count,first:Number(event.fields.find(f=>f.name==='firstFrameOnly')!.value)});
  }
  for(const event of doc.nodes.filter(n=>n.className==='DropOcclusion')){
   const clump=doc.nodes.find(n=>n.id===Number(event.fields.find(f=>f.name==='transforms')!.value))!,count=Number(clump.fields.find(f=>f.name==='data')!.value),floatId=Number(event.fields.find(f=>f.name==='intensityFloat')!.value),float=doc.nodes.find(n=>n.id===floatId),intensityFloat=float?Buffer.from(float.fields.find(f=>f.name==='value')!.raw,'hex').readFloatLE():null;
   if(count>16)throw new Error('Real DropOcclusion input exceeds native case arena capacity');
   for(const mode of [11,12,13])rows.push({label:`${level}/#${event.id}/drop/${mode}`,source:`${level}/#${event.id}`,mode,fill:0xa5,count,first:Number(event.fields.find(f=>f.name==='fadeEnable')!.value),fields:Object.fromEntries(event.fields.map(f=>[f.name,f.raw])),intensityFloat});
  }
 }
 return rows;
}
export function prepareLeaf(c:LeafCase){
 const b=Buffer.alloc(65536,c.fill),base=LEAF_BASE,at=(p:bigint)=>Number(p-base),bytes=(p:bigint,n:number)=>{const offset=at(p);if(offset<0||offset+n>b.length)throw new Error('Leaf arena incomplete');return b.subarray(offset,offset+n);};
 const m={bytes,read32:(p:bigint)=>b.readUInt32LE(at(p)),read64:(p:bigint)=>b.readBigUInt64LE(at(p)),write32:(p:bigint,n:number)=>b.writeUInt32LE(n>>>0,at(p)),write64:(p:bigint,n:bigint)=>b.writeBigUInt64LE(n,at(p)),write8:(p:bigint,n:number)=>{b[at(p)]=n;}};
 b.writeUInt32LE(c.mode,0xff00);b.writeUInt32LE(c.count??0,0xff04);b.writeUInt32LE(c.mutationAt??0,0xff08);b.writeUInt32LE(c.mutationKind??0,0xff0c);b.writeBigUInt64LE(c.reject===undefined?0n:base+0x7400n+BigInt(c.reject*512),0xff10);b.writeBigUInt64LE(c.release===null||c.release===undefined?0n:base+16n+BigInt(c.release*96),0xff18);b.writeBigUInt64LE(BigInt(c.capacity??256),0xff20);
 b.writeBigUInt64LE(0x102300000n,0xc000);b.writeUInt32LE(77,0xc038);
 for(let i=0;i<256;i++){b[16+i*96+80]=Number(c.active?.includes(i)??false);b.writeBigUInt64LE(i===255?0n:base+16n+BigInt((i+1)*96),16+i*96);}b.writeBigUInt64LE(base+16n,0x6010);
 b.writeBigUInt64LE(base+0x6200n,0x7018);b[0x7022]=0;b[0x7023]=1;b[0x7024]=1;b[0x7025]=0;
 b.writeBigUInt64LE(base+0x7200n,0x7038);b.writeBigUInt64LE(base+0x9000n,0x7040);b[0x7048]=c.first??0;
 b.writeBigUInt64LE(base+0x7300n,0x7208);b.writeUInt32LE(c.count??0,0x7210);
 for(let i=0;i<Math.max(8,c.count??0);i++){b.writeBigUInt64LE(base+0x7400n+BigInt(i*512),0x7300+i*8);if(i<8)b.writeBigUInt64LE(base+0x7400n+BigInt((7-i)*512),0x7380+i*8);}
 // Rail old owned table, heap and global Color inputs are independent services.
 b.writeBigUInt64LE(base+0xa000n,0x9020);b.writeBigUInt64LE(base+0xe000n,0x90f0);
 for(const [values,offset] of [[c.color??[1,1,1,1],0x9270],[c.axis??[2,0,0,0],0x9010],[c.dotA??[1,0,0,0],0xf000],[c.dotB??[1,0,0,0],0xf010]] as const)values.forEach((x,i)=>b.writeFloatLE(x,offset+i*4));b.writeFloatLE(c.intensity??100,0x9280);b.writeFloatLE(c.distance??1,0xfe04);
 if(c.mode>=11&&c.mode<=14){
  b.writeBigUInt64LE(base+0xb000n,0x7078);b.writeBigUInt64LE(c.intensityFloat===null?0n:base+0xf100n,0x7058);b.writeFloatLE(c.intensityFloat??.7,0xf110);
  b.writeFloatLE(10,0x7050);b.writeFloatLE(1,0x7054);b.writeFloatLE(1,0x7060);b.writeUInt32LE(2,0x7064);b.writeFloatLE(.75,0x7068);b.writeFloatLE(1,0x706c);b[0x7070]=c.first??0;b.writeFloatLE(1,0x7074);
  [1,.5,.2,1].forEach((x,i)=>b.writeFloatLE(x,0x7040+i*4));
  for(let i=0;i<(c.count??0);i++){[2,0,0,0,0,2,0,0,0,0,2,0,i,10,20,1].forEach((x,j)=>b.writeFloatLE(x,0x7410+i*512+j*4));b[0x7450+i*512]=i%2===0?1:0;b.writeFloatLE(i*.25,0xb000+i*4);}
  b.writeBigUInt64LE(base+0xfc00n,0xf960);b.writeFloatLE(.1,0xfc14);b.writeFloatLE(1,0xfc20);
  const offsets:Record<string,number>={tint:64,fadeInSnappiness:104,fadeOutSnappiness:108,maxSize:80,intensity:84,sharpness:96,occlusionType:100,fadeEnable:112};for(const [name,hex] of Object.entries(c.fields??{}))if(offsets[name]!==undefined)b.set(Buffer.from(hex,'hex'),0x7000+offsets[name]);
 }
 if(c.mode===15||c.mode===16){b.writeUInt32LE(c.count??0,0x6010);[1,.48,.2825,1].forEach((x,i)=>b.writeFloatLE((c.color??[1,.48,.2825,1])[i],0xf000+i*4));[5,10,15,1].forEach((x,i)=>b.writeFloatLE(x,0xf010+i*4));b.writeFloatLE(2,0xfe04);b.writeFloatLE(c.intensity??1,0xfe08);b.writeFloatLE(.7,0xfe0c);b.writeUInt32LE(2,0xfe10);b.writeBigUInt64LE(base,0xf810);}
 if(c.mode===17||c.mode===18){const matrix=c.fields?.transform?Buffer.from(c.fields.transform,'hex'):Buffer.from(Array.from({length:64},(_,i)=>(i*37+c.fill)&255));if(matrix.length!==64)throw new Error('SpawnMotes source transform length differs');b.set(matrix,c.mode===17?0xf000:0x9040);}
 return {b,m,base};
}
export function evaluateLeaf(c:LeafCase){
 const {b,m,base}=prepareLeaf(c),trace:bigint[][]=[];let result=0n,line=0,severity=0,records=0,mathAt=0;
 const log=(kind:number,x=0n,y=0n)=>{trace.push([BigInt(kind),x,y]);if(trace.length!==c.mutationAt)return;switch(c.mutationKind){case 1:m.write64(base+0x7040n,base+0x9100n);break;case 2:m.write32(base+0x7210n,1);break;case 3:m.write64(base+0x7208n,base+0x7380n);break;case 4:m.write32(base+0xc038n,177);break;}};
 const metadata=()=>{log(2);return m.read32(base+0xc038n);};
 const s={castEmitter:(p:bigint)=>{log(2);log(2);log(3,p);return p===m.read64(base+0xff10n)?0n:p;},start:(p:bigint)=>startOriginalEvent(m.bytes(p,80),b.subarray(0x6200,0x6300),()=>{throw new Error('Unexpected null barn');})};
 const drop={castObject:s.castEmitter,getTransform:(p:bigint)=>{log(6,p);return new Uint8Array(m.bytes(p+16n,64));},getEnabled:(p:bigint)=>{const on=m.bytes(p+80n,1)[0];log(10,p,BigInt(on));return !!on;},delta:()=>gameScaledDelta(b.readFloatLE(0xfc14),b.readFloatLE(0xfc20)),math:(op:'logf'|'expf',input:number)=>{const call=c.mathCalls?.[mathAt++];if(!call||call.op!==op||call.input!==input)throw new Error('Independent Drop math input differs');log(op==='logf'?7:8,BigInt(input),BigInt(call.result));return call.result;},oversized:()=>{throw new Error('Verbose oversize diagnostic excluded from these prepared native cases');},emit:(r:any)=>{const off=0xf400+records*64;b.writeUInt32LE(r.type,off);[r.maxSize,r.radius,r.intensity,r.sharpness].forEach((x,i)=>b.writeFloatLE(x,off+4+i*4));b.set(r.position,off+32);b.set(r.tint,off+48);log(9,BigInt(r.type),BigInt(records++));}};
 try{switch(c.mode){
  case 0:initializeOriginalPointLightBarn(m,base,()=>log(1));break;
  case 1:for(let i=0;i<(c.count??0);i++)result=createOriginalPointLight(m,base,metadata);break;
  case 2:releaseOriginalPointLight(m,base,m.read64(base+0xff18n));break;
  case 3:releaseAllOriginalPointLights(m,base);break;
  case 4:result=BigInt(gatherOriginalPointLights(m,base,base+0x6800n,c.capacity??256));break;
  case 5:enableOriginalEmitterFlowRail(m,base+0x7000n,s);break;
  case 6:updateOriginalEmitterFlowRail(m,base+0x7000n,s);break;
  case 7:constructOriginalRail(b.subarray(0x9000,0x9100),metadata(),b.subarray(0xfd00,0xfd10));result=base+0x9000n;break;
  case 11:loadOriginalDropOcclusion(m,base+0x7000n,base+0xe000n,(heap,size,alignment)=>{log(5,heap,(BigInt(size)<<32n)|BigInt(alignment));return base+0xb000n;});break;
  case 12:unloadOriginalDropOcclusion(m,base+0x7000n,base+0xe000n,(heap,p)=>log(4,heap,p));break;
  case 13:updateOriginalDropOcclusion(m,base+0x7000n,drop);break;
  case 14:enableOriginalDropOcclusion(m,base+0x7000n,drop);break;
  case 15:result=BigInt(Number(addOriginalCloudDrop(b,b.subarray(0xf000,0xf010),b.subarray(0xf010,0xf020),b.readFloatLE(0xfe04),b.readFloatLE(0xfe08),b.readFloatLE(0xfe0c))));break;
  case 16:routeOriginalCloudDrop(b,b.readUInt32LE(0xfe10),b.subarray(0xf000,0xf010),b.subarray(0xf010,0xf020),b.readFloatLE(0xfe04),b.readFloatLE(0xfe08),b.readFloatLE(0xfe0c));break;
  case 9:writeOriginalPointLightUniform(b.subarray(0x9000,0x9400),1);break;
  case 10:{const out=originalPointLightAttenuation(c.axis??[2,0,0,0],c.dotA??[1,0,0,0],c.dotB??[1,0,0,0],c.distance??1);b.writeFloatLE(out.value,0xfe00);result=BigInt(b.readUInt32LE(0xfe00));b.fill(c.fill,0xfe00,0xfe04);if(out.dot!==undefined)b.writeFloatLE(out.dot,0xfe08);break;}
  case 8:allocateOriginalRailPoints(m,base+0x9000n,c.count??0,{release:(heap,p)=>log(4,heap,p),allocate:(heap,n,alignment)=>{log(5,heap,(BigInt(n)<<32n)|BigInt(alignment));return base+0xb000n;}});break;
  case 17:setOriginalSpawnMotesTransform(b.subarray(0x9000,0x90a0),b.subarray(0xf000,0xf040));break;
  case 18:b.set(getOriginalSpawnMotesTransform(b.subarray(0x9000,0x90a0)),0xf000);result=base+0xf000n;break;
 }}catch(e){if(!(e instanceof NativeObjectFoundationFailure))throw e;line=e.line;severity=e.severity;}
 const header=Buffer.alloc(20+trace.length*24);header.writeUInt32LE(line);header.writeUInt32LE(severity,4);header.writeUInt32LE(trace.length,8);header.writeBigUInt64LE(result,12);trace.forEach((row,i)=>row.forEach((x,j)=>header.writeBigUInt64LE(x,20+i*24+j*8)));return Buffer.concat([header,b]);
}
