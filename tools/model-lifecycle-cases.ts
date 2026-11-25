import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import {destroyOriginalModel,recreateOriginalModel,type ModelLifecycleServices} from '../src/core/model-lifecycle-runtime';
import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
export const MODEL_LIFECYCLE_BASE=0x3b0000000n;
export interface ModelLifecycleCase {label:string;mode:0|1|2;lods:number;extras?:number;nullItems?:boolean;guid?:number;options?:boolean;stackFill?:number;mutationAt?:number;mutationKind?:number;meshName?:string;levelName?:string;source?:{file:string;sha256:string;nodeId:number};}
const blocks:[[number,number],...Array<[number,number]>]=[[0,0x10000],[0xf8010,4],[0xfd250,80],[0x185110,4]];
export function prepareModelLifecycle(c:ModelLifecycleCase){
  const b=Buffer.alloc(0x190000,0xa5),base=MODEL_LIFECYCLE_BASE,at=(p:bigint)=>Number(p-base);
  const m={bytes:(p:bigint,n:number)=>b.subarray(at(p),at(p)+n),read32:(p:bigint)=>b.readUInt32LE(at(p)),write32:(p:bigint,v:number)=>{b.writeUInt32LE(v>>>0,at(p));},read64:(p:bigint)=>b.readBigUInt64LE(at(p)),write64:(p:bigint,v:bigint)=>{b.writeBigUInt64LE(v,at(p));},write8:(p:bigint,v:number)=>{b[at(p)]=v&255;},string:(p:bigint)=>{const start=at(p),end=b.indexOf(0,start);if(end<start)throw new Error('Prepared string missing');return b.subarray(start,end);}};
  const p=(offset:number,target:number)=>m.write64(base+BigInt(offset),target?base+BigInt(target):0n),u=(offset:number,v:number)=>m.write32(base+BigInt(offset),v);
  u(0xf000,c.mode);u(0xf004,c.guid??73);u(0xf008,c.options===false?0:1);u(0xf00c,c.stackFill??0x5a);u(0xf014,c.mutationAt??0);u(0xf018,c.mutationKind??0);
  u(0x108c,c.lods);p(0x13a8,0xea00);b[0x1226]=1;
  const offsets=[8,16,0x28,0x30,0x38,0x40,0x18,0x20,0x48];
  for(const [group,offset] of offsets.entries()){
    p(0x1000+offset,0x3000+group*0x100);
    for(let i=0;i<8;i++)p(0x3000+group*0x100+i*8,c.nullItems&&i%2===0?0:0x5000+group*0x500+i*0x80);
  }
  b.copy(b,0x4000,0x3000,0x3100);
  for(const [i,off] of [0x50,0x68,0x70,0x78,0x80].entries())p(0x1000+off,(c.extras??31)&(1<<i)?0xa000+i*0x100:0);
  if(c.extras!==undefined){if(!(c.extras&32))p(0x1018,0);if(!(c.extras&64))p(0x1020,0);if(!(c.extras&128))p(0x1048,0);}
  p(0xfd250,0xea00);p(0xfd260,0xeb00);p(0xfd258,0xeb00);u(0xf8010,42);u(0x185110,0);
  for(let i=0;i<16;i++){b[0xfd270+i]=(17*i+3)&255;b[0xfd290+i]=(29*i+5)&255;}
  b.write((c.levelName??'Storm')+'\0',0xd000);b.write((c.meshName??'Rock')+'\0',0xd100);
  return {b,m,base,packed:()=>Buffer.concat(blocks.map(([offset,length])=>b.subarray(offset,offset+length)))};
}
export function evaluateModelLifecycle(c:ModelLifecycleCase){
  const {b,m,base,packed}=prepareModelLifecycle(c),calls:bigint[][]=[];let line=0,severity=0;
  const log=(kind:number,p:bigint,other=0n)=>{
    const t=[BigInt(kind),p,other];calls.push(t);
    if(calls.length===c.mutationAt){
      const model=base+0x1000n;
      if(c.mutationKind===1)m.write64(model+0x3a8n,base+0xec00n);
      if(c.mutationKind===2)m.write32(model+0x8cn,0);
      if(c.mutationKind===3)m.write64(model+0x68n,0n);
      if(c.mutationKind===4)m.write64(model+0x70n,0n);
      if(c.mutationKind===5)m.write64(model+8n,base+0x4000n);
      if(c.mutationKind===6){m.write64(base+0xfd250n,base+0xec00n);m.write64(base+0xfd260n,base+0xed00n);m.write64(base+0xfd258n,base+0xee00n);b.fill(0x72,0xfd270,0xfd280);b.fill(0x91,0xfd290,0xfd2a0);}
    }
    return t;
  };
  const s:ModelLifecycleServices={resetMeshInstance:p=>{log(1,p);},resetVertexData:p=>{log(2,p);},destroyVertexData:p=>{log(3,p);},destroyVertexRender:p=>{log(4,p);},free:(h,p)=>{log(5,h,p);},releaseAnimation:p=>{log(6,p);},destroyAnimationState:p=>{log(7,p);},removeCollision:(r,p)=>{log(8,r,p);},destroyAuxiliary:(kind,p,h)=>{log(kind===0x70?9:kind===0x78?10:11,p,h??0n);}};
  try{
    if(c.mode===0)destroyOriginalModel(m,base+0x1000n,base+0xeb00n,s);
    else recreateOriginalModel(m,base,{model:base+0x1000n,levelName:c.mode===2?base+0xd000n:undefined,meshName:base+0xd100n,guid:c.guid??73,shader:base+0xd200n,transform:base+0xd300n,options:c.options===false?0n:base+0x2000n},{
      parameterStorage:()=>new Uint8Array(152).fill(c.stackFill??0x5a),destroy:(p,r)=>destroyOriginalModel(m,p,r,s),construct:input=>{const t=log(12,input.model,input.options);t.push(input.heap,input.resources,input.renderer);b.set(input.parameters,0xe000);}
    });
  }catch(e){if(!(e instanceof NativeObjectFoundationFailure))throw e;line=e.line;severity=e.severity;}
  const trace=Buffer.alloc(12+calls.length*64);trace.writeUInt32LE(line);trace.writeUInt32LE(severity,4);trace.writeUInt32LE(calls.length,8);calls.forEach((t,i)=>t.forEach((v,j)=>trace.writeBigUInt64LE(v,12+i*64+j*8)));
  return Buffer.concat([trace,packed()]);
}
export function modelLifecycleCases():ModelLifecycleCase[]{
  const cases:ModelLifecycleCase[]=[];
  for(const lods of [0,1,2,3,7])for(const extras of [0,31,255])for(const mode of [0,1,2] as const)cases.push({label:`ownership/${mode}/${lods}/${extras}`,mode,lods,extras});
  for(const mode of [1,2] as const)for(const guid of [0,73,0x7fffffff,0x80000000,0xffffffff])for(const stackFill of [0,0xa5,0xff])cases.push({label:`recreate/${mode}/${guid}/${stackFill}`,mode,lods:2,guid,stackFill});
  for(const mode of [1,2] as const)for(const options of [false,true])for(const length of [0,63,64])cases.push({label:`names/${mode}/${options}/${length}`,mode,lods:1,options,meshName:'m'.repeat(length)});
  for(const mutationKind of [1,2,3,4,5,6])for(const mutationAt of [1,2,3,4,5,16,24,40,48,52,58,64,68,72])cases.push({label:`live/${mutationKind}/${mutationAt}`,mode:2,lods:3,extras:255,mutationKind,mutationAt});
  for(const lods of [1,3])cases.push({label:`null-owner/${lods}`,mode:0,lods,nullItems:true});
  if(process.env.SKY_MODEL_LIFECYCLE_SYNTHETIC)return cases;
  const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus';
  // Real map names / mesh names / GUIDs are independently prepared ABI inputs.
  // Geometry, renderer and full Model construction remain explicit services.
  const inventory=JSON.parse(fs.readFileSync('docs/Objects类清单/LevelMesh.json','utf8'));
  const hashes=new Map<string,string>();
  for(const instance of inventory.instances){
    const file=`Levels/${instance.level}/Objects.level.bin`,state=instance.serializedState;
    const meshName=state.resourceName?.value;if(typeof meshName!=='string')throw new Error(`Missing real mesh name ${instance.key}`);
    const guid=state.bstGuid?.value?.uint??state.bstGuid?.value??0xffffffff;
    if(!hashes.has(file))hashes.set(file,crypto.createHash('sha256').update(fs.readFileSync(path.join(data,file))).digest('hex'));
    cases.push({label:`${instance.level}/#${instance.nodeId}`,mode:2,lods:1,extras:0,meshName,levelName:instance.level,guid,source:{file,sha256:hashes.get(file)!,nodeId:instance.nodeId}});
  }
  return cases;
}
