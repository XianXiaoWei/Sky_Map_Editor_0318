import fs from 'node:fs';import path from 'node:path';import crypto from 'node:crypto';
import {ObjectsDocument} from '../src/core/objects';import {constructOriginalLevelMesh} from '../src/core/level-mesh-runtime';import {nativeIdentityMatrix} from '../src/core/marker-transform-runtime';
const O=0x240000000n;
export interface LevelMeshCase {name:string;op:number;value?:number;adjust?:number;argCount?:number;memory:string;source?:{level:string;node:number;sha256:string};}
export function preparedLevelMesh(address:bigint,matrix:Uint8Array,enabled=1):Buffer {const b=Buffer.alloc(0xa60);constructOriginalLevelMesh(b,address,16,17);b.writeBigUInt64LE(0n,0x228);b[208]=enabled;Buffer.from(matrix).copy(b,16);return b;}
const matrix=(x:number)=>{const b=Buffer.from(nativeIdentityMatrix());b.writeFloatLE(x,48);b.writeFloatLE(-2,52);b.writeFloatLE(3,56);return b;};
export function levelMeshCases():LevelMeshCase[]{
 const cases:LevelMeshCase[]=[];const base=(name:string,op:number,model:number|null=0):LevelMeshCase=>{const b=Buffer.alloc(0x2000,0xa5);preparedLevelMesh(O,matrix(3)).copy(b);matrix(7).copy(b,0x1800);if(model!==null){b.writeBigUInt64LE(O+0x1000n,0x228);b[0x132e]=model;matrix(20).copy(b,0x1160);matrix(30).copy(b,0x1240);matrix(0).copy(b,0x1120);b[0x1227]=1;b[0x1228]=1;b[0x13c0]=1;}return {name,op,memory:b.toString('hex')};};
 for(const fill of [0,0xa5]){const c=base(`constructor-${fill}`,0);c.memory=Buffer.alloc(0x2000,fill).toString('hex');cases.push(c);}
 for(const model of [null,0,1,255])for(const op of [1,2,3,4,6,8,9,11]){const c=base(`model-${model}-${op}`,op,model);c.value=0;cases.push(c);if(op===6)for(const value of [1,2,255])cases.push({...c,name:`enabled-${model}-${value}`,value});}
 for(const model of [null,0,1])for(const op of [5,7])for(const count of [0,1,2])for(const adjust of [0,16]){const c=base(`wrapper-${model}-${op}-${count}-${adjust}`,op,model);c.argCount=count;c.adjust=adjust;cases.push(c);}
 for(const at of [0,16,32,48,0x1160,0x1170,0x1240])for(const model of [null,0,1]){const c=base(`alias-${model}-${at}`,10,model);c.value=at;cases.push(c);}
 for(let lane=0;lane<16;lane++)for(const bits of [0x7fc00001,0x7fa00001,0x7f800000,0x80000000]){const c=base(`raw-special-${lane}-${bits}`,2);const b=Buffer.from(c.memory,'hex');b.writeUInt32LE(bits,lane*4+0x1800);c.memory=b.toString('hex');cases.push(c);}
 if(process.env.SKY_LEVEL_MESH_SYNTHETIC)return cases;
 const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus';
 for(const level of fs.readdirSync(path.join(data,'Levels')).sort()){
  const file=path.join(data,'Levels',level,'Objects.level.bin');if(!fs.existsSync(file))continue;const raw=fs.readFileSync(file),doc=new ObjectsDocument(raw),sha256=crypto.createHash('sha256').update(raw).digest('hex');
  for(const node of doc.nodes.filter(n=>n.className==='LevelMesh')){const transform=node.fields.find(f=>f.name==='transform');if(!transform)throw new Error(`Unrestored LevelMesh transform default ${level}:${node.id}`);for(const op of [1,2,3,11]){const c=base(`corpus-${level}-${node.id}-${op}`,op,null),b=Buffer.from(c.memory,'hex');Buffer.from(transform.raw,'hex').copy(b,16);Buffer.from(transform.raw,'hex').copy(b,0x1800);const guid=node.fields.find(f=>f.name==='bstGuid');if(guid)Buffer.from(guid.raw,'hex').copy(b,80);const enabled=node.fields.find(f=>f.name==='enabled');if(enabled)Buffer.from(enabled.raw,'hex').copy(b,208);c.memory=b.toString('hex');c.source={level,node:node.id,sha256};cases.push(c);}}
 }
 return cases;
}
export function levelMeshInput(c:LevelMeshCase):Buffer{const h=Buffer.alloc(16);[c.op,c.value??0,c.adjust??0,c.argCount??0].forEach((n,i)=>h.writeUInt32LE(n>>>0,i*4));return Buffer.concat([h,Buffer.from(c.memory,'hex')]);}
