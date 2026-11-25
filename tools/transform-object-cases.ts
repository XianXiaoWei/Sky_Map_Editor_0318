import fs from 'node:fs';import path from 'node:path';import crypto from 'node:crypto';
import {nativeIdentityMatrix,getNativeMarkerTransform} from '../src/core/marker-transform-runtime';
import {preparedLevelMesh} from './level-mesh-cases';
import {ObjectsDocument} from '../src/core/objects';import properties from '../docs/native-properties.json';
import {constructOriginalTransformObject} from '../src/core/transform-object-runtime';import {constructNativeMarker} from '../src/core/marker-runtime';import {constructOriginalEnable} from '../src/core/logic-event-runtime';
export type TransformAction=[number,number,number,number];
export interface TransformCase {name:string;placement?:boolean;allocationFill?:number;timelinePrepared?:boolean;fields:{offset:number;raw:string}[];nodes:{kind:string;bytes:string;model?:string}[];target:number|null;targets:number[]|null;objects:number[];finish:number[]|null;controlBits?:number;timeline?:{clock:number;start:number;found?:boolean};actions:TransformAction[];time?:{delta:number;scale:number;override?:number};longString?:string;source?:{level:string;node:number;sha256:string;nodes:number[]};}
export const O=0x240000000n,R=0x230000000n,E=0x260000000n;
export const markerAddress=(i:number)=>O+0x1000n+BigInt(i*80);
export const restoredLevelMesh=(n:TransformCase['nodes'][number])=>n.kind==='LevelMesh'&&n.bytes.length>=0xa60*2;
export function transformEndpointAddress(c:TransformCase,i:number):bigint{return restoredLevelMesh(c.nodes[i])?O+0x10000n+BigInt(c.nodes.slice(0,i).filter(restoredLevelMesh).length*0xe60):markerAddress(i);}
export const floatBits=(n:number)=>{const b=Buffer.alloc(4);b.writeFloatLE(n);return b.readUInt32LE();};
const pod=(offset:number,n:number,size=1)=>{const b=Buffer.alloc(size);if(size===4)b.writeFloatLE(n);else b[0]=n;return {offset,raw:b.toString('hex')};};
const marker=(p:number[],q=[0,0,0,1],sc=[1,1,1])=>{const b=Buffer.alloc(80);constructNativeMarker(b,12);[p,q,sc].forEach((ns,i)=>ns.forEach((n,j)=>b.writeFloatLE(n,16+i*16+j*4)));b[64]=1;return {kind:'Marker',bytes:b.toString('hex')};};
const event=()=>{const b=Buffer.alloc(80);constructOriginalEnable(b,3,{eventClassId:7,eventVptr:0x100c14ea0n});b.writeBigUInt64LE(E,24);return {kind:'Enable',bytes:b.toString('hex')};};
export function transformCaseMemory(c:TransformCase):Buffer{
 const b=Buffer.alloc(0x10000+c.nodes.filter(restoredLevelMesh).length*0xe60,c.allocationFill??0xa5);if(c.placement)return b;constructOriginalTransformObject(b,14,{eventClassId:7,eventVptr:0x100c14ea0n});
 for(const at of [64,80,88,96])b.writeBigUInt64LE(0n,at);for(const at of [104,108,112])b.writeFloatLE(0,at);b.fill(0,117,128);b[123]=1;b[117]=1;b[118]=1;b.writeBigUInt64LE(E,24);b.writeUInt32LE(1,40);b[32]=0;b[152]=0;
 if(c.longString!==undefined)b.write(c.longString+'\0',0xe000);
 c.fields.forEach(f=>Buffer.from(f.raw,'hex').copy(b,f.offset));c.nodes.forEach((n,i)=>{const at=Number(transformEndpointAddress(c,i)-O);Buffer.from(n.bytes,'hex').copy(b,at);if(restoredLevelMesh(n)){b.writeBigUInt64LE(n.model?O+BigInt(at+0xa60):0n,at+0x228);if(n.model)Buffer.from(n.model,'hex').copy(b,at+0xa60);}});
 const groups=[c.objects,c.targets,c.finish];groups.forEach((ns,i)=>{if(ns===null)return;const at=0x8000+i*32,arr=0x8100+i*256;b.fill(0,at,at+24);b.writeBigUInt64LE(O+BigInt(arr),at+8);b.writeUInt32LE(ns.length,at+16);ns.forEach((id,j)=>b.writeBigUInt64LE(id<0?0n:transformEndpointAddress(c,id)+(c.nodes[id].kind==='Marker'||c.nodes[id].kind==='Enable'||restoredLevelMesh(c.nodes[id])?8n:0n),arr+j*8));});
 b.writeBigUInt64LE(c.target===null?0n:transformEndpointAddress(c,c.target)+(c.nodes[c.target].kind==='Marker'||c.nodes[c.target].kind==='Enable'||restoredLevelMesh(c.nodes[c.target])?8n:0n),56);
 b.writeBigUInt64LE(c.targets===null?0n:O+0x8020n,64);b.writeBigUInt64LE(O+0x8000n,72);b.writeBigUInt64LE(c.finish===null?0n:O+0x8040n,80);
 if(c.controlBits!==undefined){b.writeBigUInt64LE(O+0x9000n,96);b.writeUInt32LE(c.controlBits,0x9010);}
 b.writeBigUInt64LE(O+0xa200n,0xa160);b.writeFloatLE(c.time?.delta??.25,0xa214);b.writeFloatLE(c.time?.scale??1,0xa220);b[0xa040]=Number(c.time?.override!==undefined);b.writeFloatLE(c.time?.override??1,0xa044);
 if(c.timeline){b.writeBigUInt64LE(O+0xb000n,88);b.writeUInt32LE(c.timeline.found===false?0:1,0xb480);b.writeBigUInt64LE(O+0xc100n,0xb080);b.writeBigUInt64LE(O+8n,0xc108);b.writeFloatLE(c.timeline.start,0xc110);b.writeFloatLE(c.timeline.clock,0xc08c);}
 return b;
}
export function transformObjectCases():TransformCase[]{
 const cases:TransformCase[]=[];const base=(name:string,fields:TransformCase['fields']=[],actions:TransformAction[]=[[8,0,0,0],...Array.from({length:8},()=>[9,0,0,0] as TransformAction)],nodes:TransformCase['nodes']=[marker([10,20,-3],[0,.6,0,.8],[2,3,4]),marker([0,2,3]),event()]):TransformCase=>({name,fields,nodes,target:0,targets:null,objects:[1],finish:[2],actions});
 for(const fill of [false,true]){const c=base(`placement-${fill}`);c.placement=true;c.allocationFill=fill?0xa5:0;c.actions=[];cases.push(c);}
 for(const continuous of [0,1])for(const smooth of [0,1])for(const reverse of [0,1])for(let mask=0;mask<8;mask++){
  const c=base(`flags-${continuous}-${smooth}-${reverse}-${mask}`,[pod(104,1,4),pod(120,continuous),pod(121,smooth),pod(116,reverse),pod(117,mask&1),pod(118,(mask>>1)&1),pod(119,(mask>>2)&1)]);cases.push(c);
 }
 for(const time of [0,.25,.75,2,-1])for(const delay of [0,.3])for(const reverse of [0,1]){
  const c=base(`stagger-${time}-${delay}-${reverse}`,[pod(104,time,4),pod(108,delay,4),pod(116,reverse)]);c.nodes.push(marker([-5,-3,8],[.6,0,0,.8],[3,2,1]),marker([2,3,4]));c.targets=[0,3];c.objects=[1,4];cases.push(c);
 }
 for(const value of [-1,-0,0,.25,.75,1,2]){const c=base(`float-control-${value}`, [pod(104,3,4)]);c.controlBits=floatBits(value);cases.push(c);}
 for(const [delta,scale,override] of [[0,1,undefined],[2,1,undefined],[.2,0,undefined],[.2,1,.5]]){const c=base(`time-${delta}-${scale}-${override}`,[pod(104,1,4)]);c.time={delta:delta!,scale:scale!,override};cases.push(c);}
 const live=base('live-target',[pod(104,2,4)]);live.actions.splice(4,0,[7,0x1010,floatBits(50),0]);cases.push(live);
 const captured=base('captured-target',[pod(104,2,4),pod(124,1)]);captured.actions.splice(4,0,[7,0x1010,floatBits(50),0]);cases.push(captured);
 const resume=base('resume-completes-normal',[pod(104,2,4)]);resume.actions.splice(4,0,[4,0,0,0],[10,0,0,0]);cases.push(resume);
 const again=base('disable-reenable-captures-start',[pod(104,1,4)]);again.actions.splice(4,0,[7,0x21,0x100,0],[9,0,0,0],[8,0,0,0]);cases.push(again);
 for(const auto of [0,1]){const c=base(`resume-two-phase-${auto}`,[pod(12,auto),pod(104,1,4),pod(125,1)]);c.actions.splice(3,0,[4,0,0,0]);cases.push(c);}
 for(const found of [true,false]){const c=base(`timeline-${found}`,[pod(104,2,4)]);c.timeline={clock:.75,start:.25,found};c.timelinePrepared=true;c.actions.splice(4,0,[7,0xc08c,floatBits(2.25),0]);cases.push(c);}
 const empty=base('empty-objects',[pod(104,0,4)]);empty.objects=[];cases.push(empty);
 const missing=base('missing-target');missing.target=null;cases.push(missing);
 const mismatch=base('target-count-mismatch');mismatch.targets=[];cases.push(mismatch);
 const negative=base('negative-stagger',[pod(108,-1,4)]);cases.push(negative);
 const nullMember=base('null-object-member');nullMember.objects=[-1];cases.push(nullMember);
 const unsupported=base('unsupported-sound-prefix',[pod(152,1)]);cases.push(unsupported);
 const stepped=base('stepped-prefix',[pod(122,1)]);cases.push(stepped);
 let seed=0x318;const random=()=>{seed=(Math.imul(seed,1664525)+1013904223)>>>0;return seed/4294967296;};
 for(let i=0;i<256;i++){
  const vector=()=>Array.from({length:3},()=>Math.fround((random()-.5)*100)),quat=()=>{const q=Array.from({length:4},()=>random()-.5),length=Math.hypot(...q);return q.map(n=>Math.fround(n/length));},scale=()=>Array.from({length:3},()=>Math.fround(.1+random()*4));
  const c=base(`rotation-random-${i}`,[pod(104,[.25,1,2,3][i%4],4),pod(120,i%2),pod(121,(i>>1)%2),pod(116,(i>>2)%2),pod(119,1)],undefined,[marker(vector(),quat(),scale()),marker(vector(),quat(),scale()),event()]);cases.push(c);
 }
 for(const axis of [[1,0,0,0],[0,1,0,0],[0,0,1,0],[0,0,0,-1]])for(const continuous of [0,1]){
  const c=base(`rotation-axis-${axis.join('-')}-${continuous}`,[pod(104,1,4),pod(120,continuous)],undefined,[marker([4,5,6],axis),marker([0,0,0],axis.map(n=>-n)),event()]);cases.push(c);
 }
 const destructor=base('destructor-short',[],[[6,0,0,0]]);cases.push(destructor);
 const long=Buffer.alloc(24);long.writeBigUInt64LE(33n);long.writeBigUInt64LE(25n,8);long.writeBigUInt64LE(O+0xe000n,16);cases.push(base('destructor-long',[{offset:128,raw:long.toString('hex')}],[[6,0,0,0]]));
 if(process.env.SKY_TRANSFORM_LEVEL_MESH){
  for(const deferred of [null,0,1])for(const continuous of [0,1])for(const smooth of [0,1])for(const reverse of [0,1])for(let mask=0;mask<8;mask++){
   const target=marker([10,20,-3],[0,.6,0,.8],[2,3,4]),initial=marker([0,2,3]);
   const model=deferred===null?undefined:(()=>{const b=Buffer.alloc(0x400);b[0x32e]=deferred;const tf=Buffer.from(nativeIdentityMatrix());tf.writeFloatLE(2,52);tf.writeFloatLE(3,56);tf.copy(b,0x160);tf.copy(b,0x240);b[0x227]=1;b[0x228]=1;return b.toString('hex');})();
   const a=preparedLevelMesh(O+0x10000n,Buffer.from(getNativeMarkerTransform(Buffer.from(target.bytes,'hex')))),b=preparedLevelMesh(O+0x10e60n,Buffer.from(getNativeMarkerTransform(Buffer.from(initial.bytes,'hex'))));
   const c=base(`level-mesh-flags-${deferred}-${continuous}-${smooth}-${reverse}-${mask}`,[pod(104,1,4),pod(120,continuous),pod(121,smooth),pod(116,reverse),pod(117,mask&1),pod(118,(mask>>1)&1),pod(119,(mask>>2)&1)],undefined,[{kind:'LevelMesh',bytes:a.toString('hex')},{kind:'LevelMesh',bytes:b.toString('hex'),model},event()]);cases.push(c);
  }
 }
 if(process.env.SKY_TRANSFORM_SYNTHETIC)return cases;
 const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus';
 for(const level of fs.readdirSync(path.join(data,'Levels')).sort()){
  const filename=path.join(data,'Levels',level,'Objects.level.bin');if(!fs.existsSync(filename))continue;const bytes=fs.readFileSync(filename),doc=new ObjectsDocument(bytes),sha256=crypto.createHash('sha256').update(bytes).digest('hex');
  for(const node of doc.nodes.filter(n=>n.className==='TransformObject')){
   const c=base(`corpus-${level}-${node.id}`);c.nodes=[];c.fields=[];const ids:number[]=[];
   const endpoint=(id:number)=>{if(id===0xffffffff)return -1;let i=ids.indexOf(id);if(i>=0)return i;i=ids.length;ids.push(id);const n=doc.nodes[id];if(n.className==='Marker'){const b=Buffer.alloc(80);constructNativeMarker(b,12);b[64]=1;for(const [name,at] of [['pos',16],['quat',32],['scale',48],['enabled',64]] as const){const f=n.fields.find(f=>f.name===name);if(f)Buffer.from(f.raw,'hex').copy(b,at);}c.nodes.push({kind:'Marker',bytes:b.toString('hex')});}else if(n.className==='LevelMesh'&&process.env.SKY_TRANSFORM_LEVEL_MESH){const tf=n.fields.find(f=>f.name==='transform');if(!tf)throw new Error(`LevelMesh transform requires original defaults ${level}:${id}`);const b=preparedLevelMesh(O+0x10000n+BigInt(c.nodes.filter(restoredLevelMesh).length*0xe60),Buffer.from(tf.raw,'hex'));for(const [name,at] of [['enabled',208],['bstGuid',80]] as const){const f=n.fields.find(f=>f.name===name);if(f)Buffer.from(f.raw,'hex').copy(b,at);}c.nodes.push({kind:'LevelMesh',bytes:b.toString('hex')});}else if(n.className==='Enable')c.nodes.push(event());else{const b=Buffer.alloc(80);b.writeUInt32LE(15);c.nodes.push({kind:n.className,bytes:b.toString('hex')});}return i;};
   const ref=(name:string)=>{const f=node.fields.find(f=>f.name===name);return f?Number(f.value):0xffffffff;};
   const group=(name:string)=>{const id=ref(name);if(id===0xffffffff)return null;const n=doc.nodes[id];if(n.className!=='Clump')throw new Error('Transform group is not Clump');return n.fields.flatMap(f=>(f.children??[]).map(f=>endpoint(Number(f.value))));};
   c.target=ref('target')===0xffffffff?null:endpoint(ref('target'));c.targets=group('targets');c.objects=group('objects')??[];c.finish=group('finishEvents');
   for(const f of node.fields){const p=(properties.TransformObject as Record<string,{nativeOffset:number}>)[f.name];if(p&&f.kind!=='reference'&&f.kind!=='string')c.fields.push({offset:p.nativeOffset,raw:f.raw});else if(f.name==='autoStart')c.fields.push({offset:12,raw:f.raw});}
   const sound=node.fields.find(f=>f.name==='dragSound');if(sound){const s=String(sound.value),str=Buffer.alloc(24);if(Buffer.byteLength(s)<=22){str[0]=Buffer.byteLength(s)*2;str.write(s,1);}else {str.writeBigUInt64LE(BigInt(Buffer.byteLength(s)+1)|1n);str.writeBigUInt64LE(BigInt(Buffer.byteLength(s)),8);str.writeBigUInt64LE(O+0xe000n,16);c.longString=s;}c.fields.push({offset:128,raw:str.toString('hex')});}
   const control=node.fields.find(f=>f.name==='progress01');if(control&&control.value!==0xffffffff){const f=doc.nodes[Number(control.value)].fields.find(f=>f.name==='value');if(!f)throw new Error('Missing control Float');c.controlBits=Buffer.from(f.raw,'hex').readUInt32LE();}
   if(ref('timeline')!==0xffffffff)c.timeline={clock:0,start:0};c.source={level,node:node.id,sha256,nodes:ids};cases.push(c);
  }
 }
 return cases;
}
export function transformInput(c:TransformCase):Buffer{const h=Buffer.alloc(16);[c.actions.length,Number(!!c.placement),Number(!!c.timelinePrepared),transformCaseMemory(c).length].forEach((n,i)=>h.writeUInt32LE(n,i*4));const a=Buffer.alloc(c.actions.length*16);c.actions.forEach((ns,i)=>ns.forEach((n,j)=>a.writeUInt32LE(n>>>0,i*16+j*4)));return Buffer.concat([h,transformCaseMemory(c),a]);}
