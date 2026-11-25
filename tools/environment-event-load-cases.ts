import fs from 'node:fs';import path from 'node:path';import crypto from 'node:crypto';
import {ObjectsDocument} from '../src/core/objects';
import {convertEnvironmentStorage,readEnvironmentStorage} from '../src/core/environment-storage';
import {updateOriginalSetEnvDefault,updateOriginalSetEnvHull,type EnvironmentEventServices} from '../src/core/environment-event-runtime';
import {loadOriginalLevelMesh,loadOriginalLevelMeshBarn} from '../src/core/level-mesh-load-runtime';
import {startOriginalEvent} from '../src/core/event-start-runtime';
import {initializeOriginalFogVolume} from '../src/core/fog-volume-runtime';
import properties from '../docs/native-properties.json';
import {originalPointInObb,updateOriginalRainParameters} from '../src/core/weather-event-runtime';
import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
export const EVENT_LOAD_BASE=0x3c0000000n;
export interface EventLoadCase {label:string;mode:0|1|2|3|4|5|6|7|8|9;rainEnabled?:boolean;rainState?:{offset:number;hex:string}[];delta?:number;timeScale?:number;sinfCalls?:{input:number;result:number}[];nativeFields?:{offset:number;hex:string}[];point?:number[];obb?:number[];windMode?:number;direction?:number[];force?:number;fireOnce?:boolean;invalidRegion?:boolean;rainOsc?:number;rainTransition?:number;found?:boolean;handle?:boolean;data?:boolean;member?:number;predicate?:number;flag?:number;ready?:boolean;polls?:number;refChange?:number;longName?:boolean;count?:number;mutationAt?:number;mutationKind?:number;storageHex?:string;source?:{file:string;sha256:string;nodeId:number};}
export function prepareEventLoad(c:EventLoadCase){
 const b=Buffer.alloc(0x190000,0xa5),base=EVENT_LOAD_BASE,at=(p:bigint)=>Number(p-base);
 const m={bytes:(p:bigint,n:number)=>b.subarray(at(p),at(p)+n),read32:(p:bigint)=>b.readUInt32LE(at(p)),write32:(p:bigint,v:number)=>{b.writeUInt32LE(v>>>0,at(p));},read64:(p:bigint)=>b.readBigUInt64LE(at(p)),write64:(p:bigint,v:bigint)=>{b.writeBigUInt64LE(v,at(p));},write8:(p:bigint,v:number)=>{b[at(p)]=v&255;},string:()=>{throw new Error('Unused string service');}};
 const p=(off:number,dest:number)=>b.writeBigUInt64LE(dest?base+BigInt(dest):0n,off),u=(off:number,v:number)=>b.writeUInt32LE(v>>>0,off);
 if(c.storageHex)b.set(Buffer.from(c.storageHex,'hex'),0x1000);
 u(0xf000,c.mode);u(0xf004,Number(c.found!==false));u(0xf008,Number(c.handle!==false));u(0xf010,c.predicate??0);u(0xf014,c.flag??0x173);u(0xf018,c.polls??1);u(0xf01c,c.mutationAt??0);u(0xf020,c.mutationKind??0);u(0xf024,c.refChange??0);
 p(0x6140,0xb000);p(0x62a8,0x8000);p(0x6310,0xb100);p(0x1018,0x9000);u(0x9010,0xffffffff);u(0x9110,17);b[0x1022]=0;
 p(0xa010,c.data===false?0:c.mode===2?0xc800:0xa800);p(0xa110,0xc900);p(0xaba8,0xac00);u(0xabb8,(c.member??1)<0?0:3);
 for(let i=0;i<3;i++)p(0xac00+i*8,(c.member??1)===i?0x1008:0xbd00+i*8);
 p(0x1040,0xaa00);u(0x1048,0x3f800000);u(0x104c,1);u(0x1050,0x3e800000);u(0x1054,0x3f000000);u(0x1058,0x40000000);
 b[0xca08]=0;b[0xc908]=Number(c.ready!==false);b[0x600d]=0x73;u(0x185110,c.count??3);
 if(c.mode===2){b[0x1058]=c.longName?1:8;b.write('Rock\0',0x1059);p(0x1068,0xd100);b.write('LongResourceName\0',0xd100);}
 if(c.mode===5||c.mode===6||c.mode===7){
  p(0x6280,0xb400);p(0x62c8,0x8000);p(0x63e0,0xe000);p(0x63d8,0xd000);p(0xb518,0xb600);
  [10,20,30,1].forEach((v,i)=>b.writeFloatLE(v,0xb610+i*4));b.fill(0,0x8010,0x8020);b.fill(0,0x8110,0x8120);b[0x8050]=0;b[0x8150]=0;
  if(c.mode===5){b.writeFloatLE(c.force??2,0x1038);(c.direction??[1,2,3,0]).forEach((v,i)=>b.writeFloatLE(v,0x1040+i*4));b[0x1050]=Number(c.windMode===1);b[0x1068]=Number(c.windMode===2);b[0x1069]=Number(c.fireOnce!==false);p(0x1058,0xb700);p(0x1060,0xb000);[14,25,30,1].forEach((v,i)=>b.writeFloatLE(v,0xb710+i*4));p(0xb008,0xb100);u(0xb010,c.count??3);p(0xb200,0xc300);
   p(0xf400,0);b.writeBigUInt64LE(0x102300200n,0xf400);for(let k=0;k<4;k++){p(0xb100+k*8,c.invalidRegion&&k===0?0:0xc000+k*0x100);const offset=0xc000+k*0x100;b.writeBigUInt64LE(0x102300100n,offset);for(let j=0;j<16;j++){b.writeFloatLE(j%5===0?1:0,offset+16+j*4);b.writeFloatLE(j%5===0?100:0,offset+80+j*4);}b.writeFloatLE(10,offset+64);b.writeFloatLE(20,offset+68);b.writeFloatLE(k===2?1030:30,offset+72);b.writeFloatLE(1,offset+76);b.writeFloatLE(1,offset+140);}
  }
  if(c.mode===6){b.writeFloatLE(4,0x1038);b.writeFloatLE(.8,0x103c);b.writeFloatLE(c.rainOsc??2,0x1040);b.writeFloatLE(.6,0x1044);b.writeFloatLE(c.rainTransition??3,0x1048);b.writeFloatLE(1,0xe014);b.writeFloatLE(.1,0xe03c);b.writeFloatLE(.2,0xe044);}
 }
 if(c.mode===9){b[0xe038]=Number(c.rainEnabled!==false);b.writeFloatLE(c.delta??1/60,0xb414);b.writeFloatLE(c.timeScale??1,0xb420);for(const [offset,v] of [[12,.3],[16,.3],[20,5],[60,.8],[64,.4],[68,.6],[72,.5],[76,.1],[80,-.1],[84,2],[88,.3]])b.writeFloatLE(v,0xe000+offset);for(const field of c.rainState??[])b.set(Buffer.from(field.hex,'hex'),0xe000+field.offset);}
 if(c.mode===8){(c.point??[0,0,0,1]).forEach((v,i)=>b.writeFloatLE(v,0xb100+i*4));(c.obb??[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]).forEach((v,i)=>b.writeFloatLE(v,0xc000+i*4));}
 for(const field of c.nativeFields??[])b.set(Buffer.from(field.hex,'hex'),0x1000+field.offset);
 return {b,m,base,packed:()=>Buffer.concat([b.subarray(0,0x10000),b.subarray(0x185110,0x185114)])};
}
export function evaluateEventLoad(c:EventLoadCase){
 const {b,m,base,packed}=prepareEventLoad(c),calls:bigint[][]=[];let line=0,severity=0,polls=0,ref={handle:0n};
 const log=(kind:number,...v:(bigint|number)[])=>{const r=[BigInt(kind),...v.map(BigInt)];calls.push(r);return r;};
 const mutate=()=>{if(calls.length!==c.mutationAt)return;
  if(c.mutationKind===1)m.write64(base+0x62a8n,base+0x8100n);
  if(c.mutationKind===2){m.write64(base+0x1040n,base+0xb000n);for(const [o,v] of [[0x1048,0x3f000000],[0x104c,3],[0x1050,0x40000000],[0x1054,0x40400000],[0x1058,0x40800000]])b.writeUInt32LE(v,o);}
  if(c.mutationKind===3)b.writeUInt32LE(1,0x185110);if(c.mutationKind===4)b.writeUInt32LE(4,0x185110);if(c.mutationKind===5)b[0x600d]=0xff;
  if(c.mutationKind===7){m.write64(base+0xb008n,base+0xb200n);b.writeUInt32LE(1,0xb010);}
  if(c.mutationKind===8)b.writeUInt32LE(0x40800000,0x1038);if(c.mutationKind===9)m.write64(base+0x62c8n,base+0x8100n);
  if(c.mutationKind===6){m.write64(base+0x1018n,base+0x9100n);b[0x1022]=1;}
 };
 const type=()=>{log(3);mutate();return base+0xb800n;};
 const common:EnvironmentEventServices={createRef:()=>{log(1);mutate();return ref;},destroyRef:()=>{log(2);mutate();},levelObjectsType:type,lookup:(manager,type,name)=>{log(4,manager,type,name);mutate();return c.found===false?0n:base+0xb900n;},observe:(p,r)=>{log(5,p);r.handle=c.handle===false?0n:base+0xa000n;mutate();},cameraPredicate:p=>{log(6,p);mutate();return c.predicate??0;},convert:(kind,p)=>{const recipe=readSize(kind),src=m.bytes(p,recipe);src.set(convertEnvironmentStorage(kind,src));},registerDefault:(e,v)=>{log(7,e,v);mutate();},registerClump:(e,v,clump,falloff,layer,fi,fo,d)=>{log(8,e,v,clump,falloff,layer,fi,fo,d);mutate();return base+0xc000n+BigInt(calls.length)*16n;},start:p=>startOriginalEvent(m.bytes(p,976),m.bytes(m.read64(p+24n),32),()=>{throw new Error('Null barn boundary');})};
 try{if(c.mode===0)updateOriginalSetEnvDefault(m,base+0x1000n,base+0x6000n,common);
 else if(c.mode===1)updateOriginalSetEnvHull(m,base+0x1000n,base+0x6000n,common);
 else if(c.mode===2)loadOriginalLevelMesh(m,base+0x1000n,base+0x8000n,base+0xb000n,c.flag??0x173,base+0xd000n,{...common,meshType:type,poll:p=>{log(9,p);polls++;if(polls>=(c.polls??1)){b[0xc908]=1;b[0xca08]=1;}if(c.refChange===1)m.write64(base+0xa010n,base+0xc900n);if(c.refChange===2)m.write64(base+0xa010n,0n);if(c.refChange===3)ref.handle=base+0xa100n;mutate();},sleep:ms=>{log(10,ms);mutate();},create:(p,barn,r,flag,n)=>{log(11,p,barn,r,flag,n);m.write64(p+0x228n,base+0xe000n);mutate();},update:(p,r,dt)=>{log(12,p,r,dt);mutate();}});
 else if(c.mode===4)initializeOriginalFogVolume(m,base);
 else if(c.mode===5)updateOriginalSetWind(m,base+0x1000n,base+0x6000n,{avatar:p=>{log(14,p);mutate();return base+0xb500n;},castRegion:p=>{log(15);mutate();log(16,p);mutate();return p;},getRegionTransform:p=>{log(17,p);const out=new Uint8Array(m.bytes(p+16n,64));mutate();return out;},getRegionObb:p=>{log(18,p);const out=new Uint8Array(m.bytes(p+80n,64));mutate();return out;},start:common.start});
 else if(c.mode===6)enableOriginalSetRainParams(m,base+0x1000n,base+0x6000n,common.start);
 else if(c.mode===9){let mathIndex=0;updateOriginalRainParameters(m,base+0xe000n,base+0xb400n,base+0xbb00n,undefined,{existingEmitter:p=>{log(20,p);return base+0xbd00n;},avatar:p=>{log(14,p);return base+0xb500n;},sinf:input=>{const call=c.sinfCalls?.[mathIndex++];if(!call||call.input!==input)throw new Error('Original sinf replay/input mismatch');log(21,input,call.result);return call.result;}});if(c.rainEnabled!==false)log(19,base+0xb000n);}
 else if(c.mode===8)b[0x1100]=Number(originalPointInObb(m.bytes(base+0xb100n,16),m.bytes(base+0xc000n,64)));
 else if(c.mode===7)updateOriginalSetOceanRender(m,base+0x1000n,base+0x6000n,common.start);
 else loadOriginalLevelMeshBarn(m,base,base+0x8000n,base+0x6000n,base+0xb000n,base+0xd000n,(p,barn,r,flag,n)=>{log(13,p,barn,r,flag,n);mutate();});
 }catch(e){if(!(e instanceof NativeObjectFoundationFailure))throw e;line=e.line;severity=e.severity;}
 const trace=Buffer.alloc(12+calls.length*96);trace.writeUInt32LE(line);trace.writeUInt32LE(severity,4);trace.writeUInt32LE(calls.length,8);calls.forEach((r,i)=>r.forEach((v,j)=>trace.writeBigUInt64LE(v,12+i*96+j*8)));return Buffer.concat([trace,packed()]);
}
import layouts from '../docs/environment-layouts.json';
import {updateOriginalSetWind,enableOriginalSetRainParams,updateOriginalSetOceanRender} from '../src/core/weather-event-runtime';
const readSize=(kind:'SetEnvDefault'|'SetEnvHull')=>layouts.layouts[kind].storageBytes;
export function eventLoadCases():EventLoadCase[]{
 const cases:EventLoadCase[]=[{label:'FogVolume.Initialize',mode:4}];
 for(const found of [false,true])for(const handle of [false,true])for(const data of [false,true])for(const member of [-1,0,1,2,3])for(const predicate of [0,1,2,3,255])cases.push({label:`default/${found}/${handle}/${data}/${member}/${predicate}`,mode:0,found,handle,data,member,predicate});
 for(const mode of [0,1] as const)for(const mutationKind of [1,2,6])for(const mutationAt of [1,3,4,5,6,7,8])cases.push({label:`env-live/${mode}/${mutationKind}/${mutationAt}`,mode,mutationKind,mutationAt});
 for(const found of [false,true])for(const handle of [false,true])for(const data of [false,true])for(const longName of [false,true])cases.push({label:`load/${found}/${handle}/${data}/${longName}`,mode:2,found,handle,data,longName});
 for(const refChange of [1,2,3])for(const polls of [1,2,5])cases.push({label:`waiting/${refChange}/${polls}`,mode:2,ready:false,refChange,polls});
 for(const count of [0,1,3,8])for(const mutationKind of [0,3,4,5])for(const mutationAt of [1,2])cases.push({label:`barn/${count}/${mutationKind}/${mutationAt}`,mode:3,count,mutationKind,mutationAt});
 for(const windMode of [0,1,2])for(const count of [0,1,3])for(const fireOnce of [false,true])cases.push({label:`SetWind/${windMode}/${count}/${fireOnce}`,mode:5,windMode,count,fireOnce});
 for(const direction of [[0,0,0,0],[1e-6,0,0,0],[1e-4,0,0,1],[-3,4,12,0]])for(const force of [-1,0,5])cases.push({label:`SetWind-vector/${direction}/${force}`,mode:5,direction,force});
 cases.push({label:'SetWind-null-region',mode:5,windMode:2,invalidRegion:true});
 for(const mutationKind of [7,8,9])for(const mutationAt of [1,2,3,4,5,6,9])cases.push({label:`SetWind-live/${mutationKind}/${mutationAt}`,mode:5,windMode:2,mutationKind,mutationAt});
 for(const rainOsc of [0,.0001,.0002,1,2])for(const rainTransition of [0,.0001,.0002,1,3])cases.push({label:`SetRain/${rainOsc}/${rainTransition}`,mode:6,rainOsc,rainTransition});
 for(const render of [0,1,2,255])cases.push({label:`SetOceanRender/${render}`,mode:7,nativeFields:[{offset:56,hex:render.toString(16).padStart(2,'0')}]});
 for(const scale of [0,1e-6,.00001,.000011,1,-1,100])for(const x of [-100,-1.00001,-1,0,1,1.00001,100])for(const axis of [0,1,2]){const obb=[scale,0,0,0,0,scale,0,0,0,0,scale,0,10,20,30,1],point=[10,20,30,1];point[axis]+=x*scale;cases.push({label:`OBB/${scale}/${x}/${axis}`,mode:8,point,obb});}
 for(const direction of [[1,2,3,4],[-0,-0,-0,-0],[1,0,0,1],[0,1,0,1],[0,0,1,1],[1e30,0,1,0]])for(const force of [-1,0,1])cases.push({label:`Wind-SIMD/${direction}/${force}`,mode:5,direction,force});
 for(const rainEnabled of [false,true])for(const delta of [0,.0001,1/60,.266,1])for(const remaining of [-1,0,.0001,.05,.3,1])for(const phase of [-.5,0,.4,1,1.0001,100]){const fields=[[88,remaining],[64,phase]].map(([offset,v])=>{const raw=Buffer.alloc(4);raw.writeFloatLE(v);return {offset,hex:raw.toString('hex')};});cases.push({label:`Rain-parameters/${rainEnabled}/${delta}/${remaining}/${phase}`,mode:9,rainEnabled,delta,rainState:fields});}
 const dataRoot=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus';
 for(const level of fs.readdirSync(path.join(dataRoot,'Levels')).sort()){
  const file=`Levels/${level}/Objects.level.bin`,bytes=fs.readFileSync(path.join(dataRoot,file)),sha256=crypto.createHash('sha256').update(bytes).digest('hex');
  for(const node of new ObjectsDocument(bytes).nodes){
   const source={file,sha256,nodeId:node.id},label=`${level}/#${node.id}`;
   if(node.className==='SetEnvDefault'||node.className==='SetEnvHull')cases.push({label,mode:node.className==='SetEnvDefault'?0:1,storageHex:Buffer.from(readEnvironmentStorage(node).storage).toString('hex'),source});
   if(['SetWind','SetRainParams','SetOceanRender'].includes(node.className)){
    const registered=(properties as Record<string,Record<string,{nativeOffset:number}>>)[node.className];
    if(Object.keys(registered).some(name=>!node.fields.some(f=>f.name===name)))throw new Error(`Missing original default ${label}`);
    const nativeFields=node.fields.filter(f=>registered[f.name]).map(f=>({offset:registered[f.name].nativeOffset,hex:f.kind==='reference'?f.value===0xffffffff?'0000000000000000':(()=>{throw new Error('Real non-null weather dependency needs original owner');})():f.raw}));
    cases.push({label,mode:node.className==='SetWind'?5:node.className==='SetRainParams'?6:7,nativeFields,source});
   }
  }
 }
 // JSON fixtures cannot retain -0 in number arrays. Keep its original vector
 // storage explicitly, rather than changing native signed-zero inputs.
 for(const c of cases)if(c.direction){const raw=Buffer.alloc(16);c.direction.forEach((n,i)=>raw.writeFloatLE(n,i*4));c.nativeFields=[...(c.nativeFields??[]),{offset:64,hex:raw.toString('hex')}];}
 return cases;
}
