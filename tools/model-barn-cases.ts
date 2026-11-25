import fs from 'node:fs';import path from 'node:path';import crypto from 'node:crypto';
export const MODEL_BARN_BASE=0x2d0000000n,MODEL_BARN_BYTES=0x110000;
export interface ModelBarnCase {name:string;baked:boolean;count:number;guid:number;options:boolean;constructorBoundary:boolean;fill:number;stackFill:number;level:string;mesh:string;source?:{file:string;sha256:string};}
export function modelBarnCases():ModelBarnCase[]{
 const cases:ModelBarnCase[]=[],base=(name:string,baked:boolean):ModelBarnCase=>({name,baked,count:0,guid:0x80000001,options:true,constructorBoundary:false,fill:0xa5,stackFill:0x5a,level:'synthetic-level',mesh:'synthetic-mesh'});
 for(const baked of [false,true]){
  for(const count of [0,1,2,511,1023,1024,1025,0x7fffffff,0x80000000,0xffffffff])cases.push({...base(`pool-${baked}-${count}`,baked),count});
  for(const guid of [0,1,0x7fffffff,0xffffffff])cases.push({...base(`guid-${baked}-${guid}`,baked),guid});
  for(const fill of [0,0xcd,255])for(const stackFill of [0,0xcd,255])cases.push({...base(`fill-${baked}-${fill}-${stackFill}`,baked),fill,stackFill});
  for(const options of [false,true])for(const name of ['', 'x'.repeat(63),'x'.repeat(64),'x'.repeat(65),'资源'.repeat(10)+'abc','资源'.repeat(11),'abc\0trailing'])for(const which of ['level','mesh'] as const)cases.push({...base(`name-${baked}-${options}-${which}-${JSON.stringify(name)}`,baked),options,[which]:name});
  for(const count of [0,1023])cases.push({...base(`constructor-boundary-${baked}-${count}`,baked),count,constructorBoundary:true});
 }
 if(process.env.SKY_MODEL_BARN_SYNTHETIC)return cases;
 const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus';
 for(const file of fs.readdirSync(path.join(data,'Meshes/Bin')).filter(f=>f.endsWith('.mesh')).sort()){
  const raw=fs.readFileSync(path.join(data,'Meshes/Bin',file)),source={file:`Meshes/Bin/${file}`,sha256:crypto.createHash('sha256').update(raw).digest('hex')};
  for(const baked of [false,true])cases.push({...base(`mesh-${baked}-${file}`,baked),mesh:file.slice(0,-5),count:cases.length%1024,guid:cases.length>>>0,source});
 }
 return cases;
}
export function prepareModelBarn(c:ModelBarnCase):Buffer {
 const b=Buffer.alloc(MODEL_BARN_BYTES,c.fill),p=(at:number)=>MODEL_BARN_BASE+BigInt(at);
 for(const [s,at] of [[c.level,0x102000],[c.mesh,0x102100]] as const){const raw=Buffer.from(s);raw.copy(b,at);b[at+raw.length]=0;}
 b.writeUInt32LE(c.count>>>0,0xf8010);for(const [at,ptr] of [[0xfd250,0x102300],[0xfd260,0x102400],[0xfd258,0x102500]])b.writeBigUInt64LE(p(ptr),at);
 for(let i=0;i<16;i++){b[0xfd270+i]=(i*17+c.fill)&255;b[0xfd290+i]=(i*29+c.fill)&255;}return b;
}
export function modelBarnInput(c:ModelBarnCase):Buffer {const h=Buffer.alloc(36),level=Buffer.from(c.level),mesh=Buffer.from(c.mesh);[+c.baked,c.count,c.guid,+c.options,+c.constructorBoundary,c.fill,c.stackFill,level.length,mesh.length].forEach((n,i)=>h.writeUInt32LE(n>>>0,i*4));return Buffer.concat([h,level,mesh]);}
