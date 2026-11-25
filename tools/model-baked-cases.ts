import fs from 'node:fs';import path from 'node:path';import crypto from 'node:crypto';
import {readResourceMesh} from '../src/core/resources';import {MeshesDocument} from '../src/core/meshes';
export const MODEL_BAKE_BASE=0x2a0000000n,MODEL_BAKE_BYTES=8192;
interface MeshInput {lods:{bounds:number[];secondaryBounds:number[];vertices:number}[];}
export interface ModelBakeCase {name:string;op:number;flags:number;index:number;out:number;bakePointer?:number;memory:string;arithmetic?:number[][];source?:{kind:'mesh'|'bake';file:string;sha256:string;lod?:number;record?:number;guid?:number};}
export function modelBakeCases():ModelBakeCase[]{
 const cases:ModelBakeCase[]=[],p=(n:number)=>MODEL_BAKE_BASE+BigInt(n);
 const mesh:MeshInput={lods:[{bounds:[-2,-4,-6,8,10,12],secondaryBounds:[-1,-3,-5,3,7,9],vertices:128},{bounds:[-3,-2,-1,4,5,6],secondaryBounds:[-8,-7,-6,1,2,3],vertices:64}]};
 const base=(name:string,op=1,resource=mesh):ModelBakeCase=>{
  if(resource.lods.length>16)throw new Error('Mesh oracle LOD table capacity');
  const b=Buffer.alloc(MODEL_BAKE_BYTES,0xa5);b.write('synthetic-mesh\0',0x80);b.write('synthetic-level\0',0x100);b.write('Mesh\0',0x180);b.write('LevelData\0',0x190);
  b.writeBigUInt64LE(p(0x180),0x248);b.writeBigUInt64LE(p(0x190),0x268);
  b.writeUInt32LE(resource.lods.length,0x4e8);b.writeBigUInt64LE(p(0x1000),0x4f0);b.writeBigUInt64LE(p(0x400),0xc10);b.writeBigUInt64LE(p(0x800),0xc50);
  b.writeUInt32LE(1,0x8d0);b.writeBigUInt64LE(p(0x1d00),0x8e8);b.writeInt32LE(0,0xa64);
  resource.lods.forEach((lod,i)=>{const at=0x1000+i*0xb8;[...lod.bounds,...lod.secondaryBounds].forEach((x,j)=>b.writeFloatLE(x,at+4+j*4));b.writeUInt32LE(lod.vertices,at+52);});
  b.writeUInt32LE(0x80000001,0x1d18);b.writeBigUInt64LE(p(0x1e80),0x1d28);b.writeUInt32LE(resource.lods[0].vertices,0x1e80);
  return {name,op,flags:3,index:0,out:0,memory:b.toString('hex')};
 };
 const change=(c:ModelBakeCase,edit:(b:Buffer)=>void)=>{const b=Buffer.from(c.memory,'hex');edit(b);c.memory=b.toString('hex');return c;};
 for(const op of [0,1])for(const index of [-0x80000000,-1,0,1,2,0x7fffffff])cases.push({...base(`index-${op}-${index}`,op),index});
 for(const bakePointer of [0,0x1d00,0x1d30])cases.push({...base(`bake-pointer-${bakePointer}`,0),bakePointer});
 for(const flags of [0,1,2,3,7,11,19,35])cases.push({...base(`resources-${flags}`),flags});
 for(const loadIndex of [-0x80000000,-1,0,0x7fffffff])cases.push(change(base(`load-index-${loadIndex}`),b=>b.writeInt32LE(loadIndex,0xa64)));
 for(const count of [0,1,127,128,129,0xffffffff])cases.push(change(base(`vertex-count-${count}`),b=>b.writeUInt32LE(count,0x1e80)));
 for(const guid of [0,0xffffffff,0x80000000,0x80000001])cases.push(change(base(`guid-${guid}`),b=>b.writeUInt32LE(guid,0x1d18)));
 const duplicate=change(base('duplicate-guid-first-mismatch'),b=>{b.writeUInt32LE(2,0x8d0);b.writeUInt32LE(1,0x1e80);b.writeUInt32LE(0x80000001,0x1d48);b.writeBigUInt64LE(p(0x1e90),0x1d58);b.writeUInt32LE(128,0x1e90);});cases.push(duplicate);
 cases.push(change(base('compatible-nonzero-lod'),b=>b.writeUInt32LE(128,0x1e80)));cases[cases.length-1].index=1;
 for(const op of [0,1])for(const out of [0x1000,0x1010,0x1030,0x1070,0x1900])cases.push({...base(`alias-${op}-${out}`,op),out});
 for(const lane of Array.from({length:12},(_,i)=>i))for(const bits of [0,0x80000000,1,0x80000001,0x7f7fffff,0x7f800000,0xff800000,0x7fc00001,0x7fa00001,0xffc01234])cases.push(change(base(`special-${lane}-${bits}`,0),b=>b.writeUInt32LE(bits,0x1004+lane*4)));
 for(const bits of [0x7fc00001,0x7fa00001,0xffc01234,0xffa01234])for(const other of [0x7fc00002,0x7fa00002,0xffc04321,0xffa04321])cases.push(change(base(`dual-nan-${bits}-${other}`,0),b=>{b.writeUInt32LE(bits,0x1004);b.writeUInt32LE(other,0x1010);}));
 if(process.env.SKY_MODEL_BAKED_SYNTHETIC)return cases;
 const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',cache=new Map<string,MeshInput>();
 for(const file of fs.readdirSync(path.join(data,'Meshes/Bin')).filter(f=>f.endsWith('.mesh')).sort()){
  const raw=fs.readFileSync(path.join(data,'Meshes/Bin',file)),m=readResourceMesh(raw),snapshot={lods:m.levels.map(l=>({bounds:l.bounds!,secondaryBounds:l.secondaryBounds!,vertices:l.positions.length/3}))};cache.set(file.slice(0,-5),snapshot);
  for(let lod=0;lod<m.lods;lod++){const c=base(`mesh-${file}-${lod}`,0,snapshot);c.index=lod;c.source={kind:'mesh',file:`Meshes/Bin/${file}`,sha256:crypto.createHash('sha256').update(raw).digest('hex'),lod};cases.push(c);}
 }
 const audit=JSON.parse(fs.readFileSync('docs/bake-audit.json','utf8'));
 for(const level of fs.readdirSync(path.join(data,'Levels')).sort()){
  const file=`Levels/${level}/BstBaked.meshes`,raw=fs.readFileSync(path.join(data,file)),doc=new MeshesDocument(raw),sha256=crypto.createHash('sha256').update(raw).digest('hex');
  doc.bakes.forEach((r,record)=>{
   const snapshot=cache.get(r.name),c=base(`bake-${level}-${record}`,1,snapshot??mesh),row=audit.levels.find((l:any)=>l.level===level).records.find((l:any)=>l.guid===r.guid&&l.name===r.name&&l.lod===0);
   change(c,b=>{b.fill(0,0x80,0x100);b.write(r.name+'\0',0x80);b.fill(0,0x100,0x180);b.write(level+'\0',0x100);b.writeUInt32LE(r.guid,0x1d18);b.writeUInt32LE(row?.bound?row.renderVertices:0,0x1e80);});
   if(!snapshot)c.flags=2;c.source={kind:'bake',file,sha256,record,guid:r.guid};cases.push(c);
  });
 }
 return cases;
}
export function modelBakeInput(c:ModelBakeCase):Buffer {const h=Buffer.alloc(20);const b=Buffer.from(c.memory,'hex');[c.op,c.flags,c.index,c.out,c.op===0?c.bakePointer??0x1d00:c.source?.guid??0x80000001].forEach((n,i)=>h.writeUInt32LE(n>>>0,i*4));return Buffer.concat([h,b]);}
export function prepareModelBakeRefs(c:ModelBakeCase):ModelBakeCase {const b=Buffer.from(c.memory,'hex');for(const at of [0x400,0x800]){b.writeBigUInt64LE(MODEL_BAKE_BASE+0x30000n,at);b.writeBigUInt64LE(0n,at+64);b.writeBigUInt64LE(0n,at+72);b.writeBigUInt64LE(MODEL_BAKE_BASE+BigInt(at),at+80);}return {...c,memory:b.toString('hex')};}
export function prepareModelBakeLookup(c:ModelBakeCase):ModelBakeCase {
 const r=prepareModelBakeRefs(c),b=Buffer.from(r.memory,'hex'),p=(n:number)=>MODEL_BAKE_BASE+BigInt(n),rows=[{flag:1,node:0x1b80,key:0x80,value:0x400},{flag:2,node:0x1bb0,key:0x100,value:0x800}].filter(row=>c.flags&row.flag).sort((a,d)=>Buffer.compare(b.subarray(a.key,b.indexOf(0,a.key)),b.subarray(d.key,b.indexOf(0,d.key))));
 for(const [at,id] of [[0x400,16],[0x800,17]])b.writeUInt32LE(id,at+8);for(const at of [0x240,0x260,0x2c0,0x2e0])b.writeBigUInt64LE(p(0x30000),at);
 for(const row of rows){b.writeBigUInt64LE(0n,row.node);b.writeBigUInt64LE(0n,row.node+8);b.writeBigUInt64LE(p(0x650),row.node+16);b.writeBigUInt64LE(p(row.key),row.node+32);b.writeBigUInt64LE(p(row.value),row.node+40);}
 const root=rows.at(-1);b.writeBigUInt64LE(root?p(root.node):0n,0x650);if(rows.length===2){b.writeBigUInt64LE(p(rows[0].node),root!.node);b.writeBigUInt64LE(p(root!.node),rows[0].node+16);}return {...r,memory:b.toString('hex')};
}
