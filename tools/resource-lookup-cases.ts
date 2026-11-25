import fs from 'node:fs';import path from 'node:path';import crypto from 'node:crypto';
export const LOOKUP_BASE=0x2c0000000n,LOOKUP_MANAGER=0x100,LOOKUP_REGISTRY=0x1000,LOOKUP_META=0x4000,LOOKUP_VTABLE=0x5000,LOOKUP_CODE=0x100000;
export interface LookupRow {name:string;classId:number;null?:boolean;}
export interface LookupQuery {name:string;typeId:number;}
export interface ResourceLookupCase {name:string;memory:string;rows:LookupRow[];queries:LookupQuery[];nodeOffsets:number[];resourceOffsets:number[];queryOffsets:number[];nullClasses:number;mutation?:{query:number;classId:number;node:number;value:number};sources?:{file:string;sha256:string}[];}
export function makeResourceLookupCase(name:string,rows:LookupRow[],queries:LookupQuery[],nullClasses=0):ResourceLookupCase {
 const p=(n:number)=>LOOKUP_BASE+BigInt(n),nodeOffsets=rows.map((_,i)=>0x6000+i*48),names=new Map<string,number>();let cursor=Math.ceil((0x6000+rows.length*48)/256)*256;
 for(const r of [...rows,...queries])if(!names.has(r.name)){names.set(r.name,cursor);cursor+=Buffer.byteLength(r.name)+1;}
 cursor=Math.ceil(cursor/256)*256;const resourceOffsets=rows.map((r,i)=>r.null?0:cursor+i*64);cursor+=rows.length*64;
 const b=Buffer.alloc(Math.ceil(cursor/4096)*4096,0xa5),sentinel=LOOKUP_MANAGER+0x430;
 b.fill(0,LOOKUP_REGISTRY,LOOKUP_REGISTRY+0x98+1280*8);
 for(let i=0;i<5;i++){b.writeBigUInt64LE(p(LOOKUP_META+i*128),LOOKUP_REGISTRY+0x98+i*8);b.writeBigUInt64LE(p(LOOKUP_VTABLE),LOOKUP_META+i*128);}b.writeBigUInt64LE(p(LOOKUP_CODE),LOOKUP_VTABLE+0x68);
 for(const [s,at] of names)b.write(s+'\0',at);
 rows.forEach((r,i)=>{b.writeBigUInt64LE(p(names.get(r.name)!),nodeOffsets[i]+32);b.writeBigUInt64LE(resourceOffsets[i]?p(resourceOffsets[i]):0n,nodeOffsets[i]+40);if(resourceOffsets[i])b.writeUInt32LE(r.classId>>>0,resourceOffsets[i]+8);});
 const sorted=rows.map((r,i)=>({r,i})).sort((a,d)=>Buffer.compare(Buffer.from(a.r.name),Buffer.from(d.r.name))||a.i-d.i);
 const build=(start:number,end:number,parent:number):number=>{if(start===end)return 0;const mid=(start+end)>>>1,at=nodeOffsets[sorted[mid].i],left=build(start,mid,at),right=build(mid+1,end,at);b.writeBigUInt64LE(left?p(left):0n,at);b.writeBigUInt64LE(right?p(right):0n,at+8);b.writeBigUInt64LE(p(parent),at+16);return at;};
 const root=build(0,rows.length,sentinel);b.writeBigUInt64LE(root?p(root):0n,sentinel);return {name,memory:b.toString('hex'),rows,queries,nodeOffsets,resourceOffsets,queryOffsets:queries.map(q=>names.get(q.name)!),nullClasses};
}
export function resourceLookupCases():ResourceLookupCase[]{
 const cases:ResourceLookupCase[]=[];
 const groups:LookupRow[][]=[[],[{name:'same',classId:1},{name:'same',classId:2},{name:'same',classId:1}],[{name:'same',classId:0,null:true},{name:'same',classId:4}],[{name:'',classId:1},{name:'A',classId:2},{name:'a',classId:3},{name:'prefix',classId:2},{name:'prefix-long',classId:1},{name:'é',classId:3},{name:'中文',classId:1}]];
 for(let i=0;i<groups.length;i++)for(const nullClasses of [0,1,2,4,6,15]){const rows=groups[i],queries=[...new Set([...rows.map(r=>r.name),'missing','Same','prefix-lo'])].flatMap(name=>[0,1,2,3,4,5].map(typeId=>({name,typeId})));cases.push(makeResourceLookupCase(`range-${i}-${nullClasses}`,rows,queries,nullClasses));}
 for(const classId of [1279,1280,0xffffffff]){const rows=[{name:'invalid',classId}];if(classId===1279){const c=makeResourceLookupCase('missing-metadata-unqueried',rows,[{name:'missing',typeId:1}]);cases.push(c);}else cases.push(makeResourceLookupCase(`class-assert-${classId}`,rows,[{name:'invalid',typeId:1},{name:'missing',typeId:1}]));}
 const mutation=makeResourceLookupCase('resource-value-reloaded-after-metadata',[{name:'same',classId:2},{name:'same',classId:1}],[{name:'same',typeId:2},{name:'same',typeId:1}]);mutation.mutation={query:0,classId:2,node:0,value:1};cases.push(mutation);
 if(process.env.SKY_RESOURCE_LOOKUP_SYNTHETIC)return cases;
 const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',rows:LookupRow[]=[],sources:{file:string;sha256:string}[]=[];
 for(const file of fs.readdirSync(path.join(data,'Meshes/Bin')).filter(f=>f.endsWith('.mesh')).sort()){const bytes=fs.readFileSync(path.join(data,'Meshes/Bin',file));rows.push({name:file.slice(0,-5),classId:1});sources.push({file:`Meshes/Bin/${file}`,sha256:crypto.createHash('sha256').update(bytes).digest('hex')});}
 for(const level of fs.readdirSync(path.join(data,'Levels')).sort()){const file=`Levels/${level}/BstBaked.meshes`,bytes=fs.readFileSync(path.join(data,file));rows.push({name:level,classId:2});sources.push({file,sha256:crypto.createHash('sha256').update(bytes).digest('hex')});}
 const queries=[...new Set([...rows.map(r=>r.name),'__missing_resource__','DayEnd','dayend'])].flatMap(name=>[0,1,2,3,4,5].map(typeId=>({name,typeId})));const corpus=makeResourceLookupCase('corpus-prepared-name-registry',rows,queries);corpus.sources=sources;cases.push(corpus);return cases;
}
export function resourceLookupInput(c:ResourceLookupCase):Buffer {const b=Buffer.from(c.memory,'hex'),h=Buffer.alloc(28);[b.length,c.queries.length,c.nullClasses,c.mutation?.query??0xffffffff,c.mutation?.classId??0,c.mutation?c.nodeOffsets[c.mutation.node]:0,c.mutation?c.resourceOffsets[c.mutation.value]:0].forEach((n,i)=>h.writeUInt32LE(n>>>0,i*4));const q=Buffer.alloc(c.queries.length*8);c.queries.forEach((r,i)=>{q.writeUInt32LE(c.queryOffsets[i],i*8);q.writeUInt32LE(r.typeId,i*8+4);});return Buffer.concat([h,b,q]);}
