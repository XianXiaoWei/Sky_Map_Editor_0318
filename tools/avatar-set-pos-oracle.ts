import fs from 'node:fs';import os from 'node:os';import path from 'node:path';import crypto from 'node:crypto';import {spawnSync} from 'node:child_process';import {gzipSync} from 'node:zlib';import {Matrix4,Quaternion,Vector3} from 'three';
import {ObjectsDocument} from '../src/core/objects';import {railMarkerTransform,RAIL_MARKER_OBB} from '../src/core/rail';import {evaluateAvatarCase,type AvatarOracleCase,type AvatarOracleExpected} from './avatar-set-pos-evaluate';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky',sha=crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');if(sha!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Requires original executable');
const f=Math.fround,cases:AvatarOracleCase[]=[],identity=new Matrix4().toArray();
function add(name:string,flags:number[]=[],changes:Partial<AvatarOracleCase>={}){
 const event=Buffer.alloc(80,0xa5);event.fill(0,0x18,0x20);event.fill(0,0x38,0x50);flags.forEach((v,i)=>event[0x48+i]=v);event[0x22]=0;event.writeUInt32LE(0x12345678,0x10);
 const states=Buffer.alloc(640,0x96);for(let s=0;s<2;s++)for(const [offset,value] of [[0x10,[2+s,4+s,6+s,1]],[0x50,[7,8,9,10]],[0x60,[.3,.4,.5,0]]] as [number,number[]][])value.forEach((n,i)=>states.writeFloatLE(n,s*320+offset+i*4));
 cases.push({name,h:[0,0,0,0,1,0,0,0,4,1,0,0],eventHex:event.toString('hex'),statesHex:states.toString('hex'),input:[10,20,30,1,0,0,0,1,...identity,...identity,...identity,...identity,...identity],hit:[11,12,13,1,0,1,0,0,.5],...changes});
}
for(let slot=0;slot<16;slot++)add(`local-slot-${slot}`,[0,0,1,1,0],{h:[0,slot,0,0,1,0,0,0,4,1,0,0]});
for(const slot of [16,17])add(`absent-${slot}`,[1,1,1,1,1],{h:[0,slot,15,1,1,0,0,0,4,1,0,0]});
for(let mask=1;mask<16;mask++)for(const flag of [0,1])add(`overrides-${mask}-${flag}`,[flag,0,1,1,1],{h:[0,0,mask,0,1,0,0,0,4,1,0,0]});
for(const rel of [0,1])for(const can of [0,1])for(const member of [0,1])for(const swap of [0,1]){
 const world=new Matrix4().compose(new Vector3(10,20,-30),new Quaternion().setFromAxisAngle(new Vector3(0,1,0),.8),new Vector3(2,1,3)),relative=new Matrix4().compose(new Vector3(-3,4,5),new Quaternion().setFromAxisAngle(new Vector3(1,0,0),-.4),new Vector3(1,2,1)),inv=relative.clone().invert(),product=rel?world.clone().multiply(inv):world.clone();
 add(`relative-${rel}-can-${can}-member-${member}-swap-${swap}`,[1,0,1,1,1],{h:[0,0,0,rel,can,member,swap,0,4,1,0,member],input:[10,20,-30,1,.15,.25,.35,.9,...world.toArray(),...identity,...relative.toArray(),...inv.toArray(),...product.toArray()].map(f)});
}
for(const distance of [.98999995,.99,.99000007,1])for(const mode of [1,4])add(`ground-${distance}-${mode}`,[0,0,0,0,1],{h:[0,0,0,0,1,0,0,0,mode,1,0,0],hit:[11,12,13,1,0,1,0,0,f(distance)]});
for(const mode of [0,1,2,3,4])for(const fail of [0,2,999,1000])add(`random-${mode}-${fail}`,[0,1,1,1,1],{h:[0,0,0,0,1,0,0,fail,mode,1,0,0],hit:[11,12,13,1,...(mode===3?[1,0,0,0]:[0,1,0,0]),mode===2?1:.5]});
for(const immediate of [0,1])for(const can of [0,1])for(const member of [0,1])for(const peers of [0,1])add(`set-position-${immediate}-${can}-${member}-${peers}`,[],{h:[1,0,0,0,can,member,0,0,4,1,immediate,peers]});
const corpus:{level:string;id:number;flags:(number|null)[]}[]=[];const root=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus';
for(const level of fs.readdirSync(path.join(root,'Levels')).sort()){
 const file=path.join(root,'Levels',level,'Objects.level.bin');if(!fs.existsSync(file))continue;const doc=new ObjectsDocument(fs.readFileSync(file));
 for(const node of doc.nodes.filter(n=>n.className==='AvatarSetPos')){
  const flags=['setLevelStartPosition','randomGroundInMarker','breakHandHold','killMomentum','onGround'].map(name=>{const field=node.fields.find(v=>v.name===name);return field?Number(field.value):null;});corpus.push({level,id:node.id,flags});
  // Missing fields remain unknown in the inventory. Prepared zero allocation
  // is an explicit test input, not a recovered constructor default.
  const h=[0,0,0,0,1,0,0,0,4,1,0,0],rel=node.fields.find(v=>v.name==='relMarker');h[3]=+(!!rel&&rel.value!==0xffffffff);
  const markerField=node.fields.find(v=>v.name==='marker');
  const decodeMarker=(id:number)=>{const n=doc.nodes[id],get=(name:string)=>n.fields.find(v=>v.name===name)?.value as number[];return {position:get('pos'),quaternion:get('quat'),scale:get('scale')};};
  const marker=decodeMarker(Number(markerField!.value)),world=railMarkerTransform(marker),relative=h[3]?railMarkerTransform(decodeMarker(Number(rel!.value))):identity,inv=new Matrix4().fromArray(relative).invert().toArray().map(f),product=new Matrix4().fromArray(world).multiply(new Matrix4().fromArray(h[3]?inv:RAIL_MARKER_OBB)).toArray().map(f);
  add(`corpus-${level}-${node.id}`,flags.map(v=>v??0),{h,input:[...marker.position.slice(0,3),marker.position[3]??1,...marker.quaternion,...world,...RAIL_MARKER_OBB,...relative,...inv,...product]});
 }
}
const u32=(v:number[])=>{const b=Buffer.alloc(v.length*4);v.forEach((n,i)=>b.writeUInt32LE(n>>>0,i*4));return b;},floats=(v:number[])=>{const b=Buffer.alloc(v.length*4);v.forEach((n,i)=>b.writeFloatLE(n,i*4));return b;};cases.forEach(c=>{c.input=c.input.map(f);c.hit=c.hit.map(f);});
cases.forEach(c=>{c.inputHex=floats(c.input).toString('hex');c.hitHex=floats(c.hit).toString('hex');});
const input=Buffer.concat([u32([cases.length]),...cases.flatMap(c=>[u32(c.h),Buffer.from(c.eventHex,'hex'),Buffer.from(c.statesHex,'hex'),Buffer.from(c.inputHex!,'hex'),Buffer.from(c.hitHex!,'hex')])]);
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-avatar-set-pos-'));let raw:Buffer;
try{const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','tools/native-avatar-set-pos-oracle.c','-lm','-o',runner]);if(build.status!==0)throw new Error(String(build.stderr));const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input,maxBuffer:128*1024*1024,timeout:60000});if(run.status!==0)throw new Error(`Avatar runner ${run.status}/${run.signal}: ${run.stderr}`);raw=run.stdout;}finally{fs.rmSync(temp,{recursive:true,force:true});}
let at=4,compared=0,failedBytes=0;const failures:unknown[]=[],saved:unknown[]=[];if(raw.readUInt32LE()!==cases.length)throw new Error('Count mismatch');
for(const c of cases){const result=Array.from({length:5},(_,i)=>raw.readUInt32LE(at+i*4));at+=20;const eventHex=raw.subarray(at,at+80).toString('hex');at+=80;const statesHex=raw.subarray(at,at+640).toString('hex');at+=640;const traceHex=raw.subarray(at,at+result[0]*136).toString('hex');at+=result[0]*136;const expected:AvatarOracleExpected={result,eventHex,statesHex,traceHex};
 try{const actual=evaluateAvatarCase(c,expected),a=Buffer.concat([u32(actual.result),Buffer.from(actual.eventHex+actual.statesHex+actual.traceHex,'hex')]),b=Buffer.concat([u32(result),Buffer.from(eventHex+statesHex+traceHex,'hex')]);compared+=Math.max(a.length,b.length);for(let i=0;i<Math.max(a.length,b.length);i++)if(a[i]!==b[i]){failedBytes++;if(failures.length<20)failures.push({name:c.name,offset:i,native:b[i],actual:a[i]});}}catch(e){failedBytes++;if(failures.length<20)failures.push({name:c.name,error:String(e)});}saved.push({...c,expected});
}
if(at!==raw.length)throw new Error('Trailing output');
const scope='Unmodified whole AvatarSetPos::Update 0x100149c40, AvatarBarn local selection/getter 0x1000ff210/0x1000fc260, Avatar::SetPosition 0x100100fb0, Marker forward XYZ 0x10043d900, Euler 0x100146d00 and Event::Start 0x10032ef60. Explicit Marker virtual matrices, inverse/product results, collision/segment/material channel 0x50/filter, rand, handhold group/member/peers and low-level state setters, libc++ logging/stack guard services. Linux libm returns captured and replayed; macOS libm not verified. All nonpointer Event bytes, two full state buffers, Barn moved flag/sequence and dependency arguments/order compared. Prepared allocations/selection flags and 59 serialized flag/Marker transform snapshots do not prove startup selection, actual Marker lifecycle, physics/handhold services, animations or full class/game runtime. Unused Marker-forward SIMD W excluded; copied Euler destination W retained.';
const report={passed:failedBytes===0,executableSha256:sha,cases:cases.length,comparedBytes:compared,failedBytes,corpusConfigurations:corpus.length,corpus,scope,completeClassRuntime:false,failures};fs.writeFileSync('docs/avatar-set-pos-oracle.json',JSON.stringify(report,null,2)+'\n');if(report.passed)fs.writeFileSync('tests/fixtures/avatar-set-pos-native.json.gz',gzipSync(JSON.stringify({scope,cases:saved})));console.log(JSON.stringify({...report,corpus:undefined,failures:failures.slice(0,8)}));if(!report.passed)process.exitCode=1;
