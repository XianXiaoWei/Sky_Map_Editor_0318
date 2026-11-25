import {updateOriginalFishV2,turnOriginalCreatureDirection,updateOriginalCreatureBank,getOriginalCreatureMotionTransform,originalFishMovementServices,type FishMathServices,type FishUpdateServices} from '../src/core/fish-update-runtime';
import {setOriginalModelEnabled,setOriginalModelTransform} from '../src/core/level-mesh-runtime';
import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
import {numericFloatBits as bits} from '../src/core/object-numeric-runtime';
export interface FishUpdateCase {
 label:string;mode:0|1|2|3|4;steps?:number;mutation?:number;enabled?:number;enableCallback?:number;
 delta?:number;timeScale?:number;debugScale?:number;position?:number[];velocity?:number[];force?:number[];
 radius?:number;maximumSpeed?:number;drag?:number;nativeTurn?:boolean;nativeBank?:boolean;
 collisionCount?:number;collisionVelocities?:number[][];turnOutput?:number[];before?:number[];desired?:number[];
 maximumAngle?:number;bankStrength?:number;bankSmoothing?:number;bankLimit?:number;bankAngle?:number;bankHistory?:number[][];
 state?:number;weights?:number[];scale?:number[];deferred?:number;light?:number;rayHit?:number;rayFlags?:number;rayPosition?:number[];
 timer?:number;interactionTimer?:number;emitCount?:number;interactionResult?:number;avatarPosition?:number[];random?:number[];
 packedSincos?:number[];transformFaultCall?:number;transformFaultBits?:number;transformFaultOffset?:number;callbackBits?:number;callbackState?:number;
}
export interface FishNativeMath {kind:number;x:number;result:number[];}
export const FISH_UPDATE_ARENA=0x20000,FISH_UPDATE_ROW=192;
const base=0x440000000n,p=base+0x1000n,game=base+0x3000n;
export function fishUpdateCases(){
 const cases:FishUpdateCase[]=[],add=(label:string,c:Partial<FishUpdateCase>={})=>cases.push({label,mode:0,...c});
 add('whole Update baseline');add('whole Update original direction and bank',{nativeTurn:true,nativeBank:true,steps:4});
 for(const enabled of [0,1,2,255])for(const enableCallback of [0,1])add('live enabled byte '+[enabled,enableCallback],{enabled,mutation:1,enableCallback});
 for(const delta of [0,-.1,.00001,.0001,.016,.266,.267,1,Infinity,NaN])for(const timeScale of [0,1,2])add('clamped scaled delta '+[delta,timeScale],{delta:bits(delta),timeScale:bits(timeScale)});
 for(const debugScale of [bits(0),bits(-1),bits(.5),bits(2),0x7fc00000])add('debug clock scale '+debugScale,{debugScale});
 for(const state of [0,1,2,3,4,5,0xffffffff])for(const steps of [1,5])for(const weights of [[0,0,0,0],[1,.5,-.2,1.2]])add('animation state transitions '+[state,steps,weights],{state,steps,weights:weights.map(bits)});
 for(const velocity of [[0,0,0,0],[0,1,0,0],[0,-1,0,0],[1,0,0,1],[1,2,-3,-1],[.000009,0,0,0],[.000011,0,0,0],[NaN,0,0,0],[Infinity,0,0,0]])for(const drag of [0,.5,-.5])add('velocity poles and vertical drag '+[velocity,drag],{velocity:velocity.map(bits),drag:bits(drag)});
 for(const maximumSpeed of [0,.1,1,5])for(const drag of [0,-1,.5])add('strict speed clamp '+[maximumSpeed,drag],{maximumSpeed:bits(maximumSpeed),drag:bits(drag),velocity:[3,1,2,1].map(bits)});
 for(const collisionCount of [1,2,3])for(const steps of [1,4])add('collision iteration limit '+[collisionCount,steps],{collisionCount,steps,collisionVelocities:[[1,1,2,0],[2,-1,1,0],[3,0,1,0]].map(v=>v.map(bits))});
 for(const turnOutput of [[0,0,0,0],[0,0,1,0],[0,1,0,0],[1,2,3,1],[NaN,0,0,0]])for(const bankAngle of [0,15,-30])add('turning output and bank basis '+[turnOutput,bankAngle],{turnOutput:turnOutput.map(bits),bankAngle:bits(bankAngle)});
 for(const rayHit of [0,1])for(const rayFlags of [0,1,2,3])for(const rayPosition of [[1,2,3,1],[1,3,3,1],[1,3.5,3,1],[1,10,3,1]])add('surface flags ripple distance '+[rayHit,rayFlags,rayPosition],{rayHit,rayFlags,rayPosition:rayPosition.map(bits)});
 for(const timer of [0,1,4.99,5,5.01,100])for(const interactionTimer of [0,1,2,3])for(const interactionResult of [0,1])add('alert and interaction timer gates '+[timer,interactionTimer,interactionResult],{timer:bits(timer),interactionTimer:bits(interactionTimer),interactionResult,avatarPosition:[100,100,100,1].map(bits)});
 for(const avatarPosition of [[1,2,3,1],[5.99,2,3,1],[6,2,3,1],[6.01,2,3,1]])add('local alert strict radius '+avatarPosition,{timer:bits(100),avatarPosition:avatarPosition.map(bits)});
 for(const emitCount of [0,1,2,3,255])for(const timer of [0,.1,.2,.3,1,100])add('follow-up count and strict interval '+[emitCount,timer],{emitCount,timer:bits(timer),steps:4,avatarPosition:[100,100,100,1].map(bits)});
 for(const mutation of [2,3,4,5,6,7,8,9,10,11,12,13,14])for(const steps of [1,4])add('callback reread '+[mutation,steps],{mutation,steps,rayHit:1,rayFlags:1,timer:bits(100),interactionTimer:bits(3),interactionResult:1,light:1,callbackBits:bits(7),nativeTurn:mutation===4,nativeBank:mutation===5,avatarPosition:mutation===12?[1,2,3,1].map(bits):[100,100,100,1].map(bits)});
 for(const deferred of [0,1])for(const light of [0,1])add('Model deferred and light transform '+[deferred,light],{deferred,light,steps:3});
 for(const packedSincos of [[0,0],[1,-1],[NaN,NaN]])add('explicit sincos upper lanes '+packedSincos,{nativeTurn:true,nativeBank:true,packedSincos:packedSincos.map(bits)});
 for(const transformFaultOffset of [0,4,8,12,16,20,24,28,32,36,40,44,48,52,56,60])add('full transform NaN assertion lane '+transformFaultOffset,{transformFaultCall:2,transformFaultBits:0x7fc00000,transformFaultOffset});
 for(const transformFaultBits of [0x7f800000,0xff800000,0x7f800001])add('transform Inf and signaling NaN '+transformFaultBits,{transformFaultCall:2,transformFaultBits});
 for(const before of [[0,0,0,0],[0,0,1,0],[0,1,0,0],[1,2,3,1]])for(const desired of [[0,0,1,0],[0,0,-1,0],[1,2,3,0],[NaN,0,0,0]])for(const maximumAngle of [0,.1,Math.PI,NaN])add('whole TurnDirection '+[before,desired,maximumAngle],{mode:1,nativeTurn:true,before:before.map(bits),desired:desired.map(bits),maximumAngle:bits(maximumAngle)});
 for(const bankSmoothing of [0,.1,1,10,NaN])for(const steps of [1,4])for(const position of [[0,0,0,0],[1,2,3,1],[NaN,0,0,0]])add('whole persistent Bank '+[bankSmoothing,steps,position],{mode:2,nativeBank:true,bankSmoothing:bits(bankSmoothing),steps,position:position.map(bits)});
 for(const position of [[1,2,3,0],[0,0,0,1],[NaN,0,0,1]])add('whole motion transform '+position,{mode:3,position:position.map(bits)});
 let seed=83931;const next=()=>{seed=(Math.imul(seed,1664525)+1013904223)>>>0;return seed;},vec=()=>[0,1,2].map(()=>bits(((next()%2001)-1000)/137)).concat(0);
 for(let i=0;i<48;i++)add('whole Update finite randomized '+i,{nativeTurn:true,nativeBank:true,steps:3,position:vec(),velocity:vec(),force:vec(),state:next()%6,drag:bits((next()%100)/100),maximumSpeed:bits((next()%100)/20),bankAngle:bits((next()%100)-50),rayHit:next()%2,rayFlags:next()%4,rayPosition:vec(),timer:bits((next()%100)/9),interactionTimer:bits((next()%100)/10),interactionResult:next()%2,emitCount:next()%4,weights:Array.from({length:4},()=>bits((next()%101)/100))});
 for(const row of [...cases].filter(c=>c.label.startsWith('whole Update finite randomized')||c.label==='whole Update original direction and bank'))cases.push({...row,mode:4,label:'production movement composition '+row.label});
 return cases;
}
export function prepareFishUpdate(c:FishUpdateCase){
 const b=Buffer.alloc(FISH_UPDATE_ARENA),m={bytes:(address:bigint,n:number)=>{const at=Number(address-base);if(at<0||at+n>b.length)throw new Error('Fish fixture address out of range '+address.toString(16));return b.subarray(at,at+n);},read8:(address:bigint)=>b[Number(address-base)],read32:(address:bigint)=>b.readUInt32LE(Number(address-base)),read64:(address:bigint)=>b.readBigUInt64LE(Number(address-base)),write8:(address:bigint,n:number)=>{b[Number(address-base)]=n;},write32:(address:bigint,n:number)=>{b.writeUInt32LE(n>>>0,Number(address-base));},write64:(address:bigint,n:bigint)=>{b.writeBigUInt64LE(n,Number(address-base));},string:(address:bigint)=>{const at=Number(address-base);return b.toString('utf8',at,b.indexOf(0,at));}};
 const u32=(at:number,n:number)=>b.writeUInt32LE(n>>>0,at),ptr=(at:number,to:number)=>b.writeBigUInt64LE(base+BigInt(to),at),vec=(at:number,v:number[])=>v.forEach((n,i)=>u32(at+i*4,n)),f=(at:number,v:number[])=>vec(at,v.map(bits));
 b.writeBigUInt64LE(0x100c14ff0n,0x1000);vec(0x1010,c.position??[1,2,3,1].map(bits));f(0x1020,[1,0,0,0]);f(0x1030,[0,1,0,0]);f(0x1040,[0,0,-1,0]);vec(0x1050,c.velocity??[1,.2,2,0].map(bits));ptr(0x1078,0x4000);f(0x1080,[1,0,0,0]);
 for(let i=0;i<3;i++)vec(0x10d0+i*16,c.bankHistory?.[i]??[[.2,.3,.4,0],[.1,.2,.3,0],[.4,0,.5,0]][i].map(bits));u32(0x1100,c.bankAngle??bits(0));
 b[0x10c0]=c.enabled??1;ptr(0x1110,0x6000);vec(0x1120,c.scale??[.1,.2,.3,0].map(bits));[12,34,56,78].forEach((n,i)=>u32(0x1130+i*4,n));vec(0x1140,c.weights??[0,0,0,0].map(bits));ptr(0x1158,c.light?0x7000:0);if(!c.light)b.writeBigUInt64LE(0n,0x1158);
 u32(0x1160,c.timer??bits(0));b[0x1164]=c.emitCount??0;u32(0x1168,c.interactionTimer??bits(0));u32(0x117c,c.state??1);
 for(const at of [0x4000,0x4100]){u32(at+16,c.radius??bits(5));u32(at+20,c.maximumSpeed??bits(4));u32(at+28,c.drag??bits(.2));}u32(0x4110,bits(3));u32(0x4114,bits(2));u32(0x411c,bits(-.1));
 ptr(0x3160,0x3800);u32(0x3814,c.delta??bits(.016));u32(0x3820,c.timeScale??bits(1));for(const at of [0x3138,0x3280,0x33c8,0x3500])ptr(at,0xb000);
 for(const at of [0x6000,0x6500]){ptr(at+104,at+0x400);b[at+0x32e]=c.deferred??0;b[at+0x227]=1;b[at+0x3c0]=1;}
 ptr(0x8018,0x8100);u32(0x80e0,123);vec(0x8110,c.avatarPosition??[100,100,100,1].map(bits));vec(0x9000,c.force??[.1,.2,-.1,0].map(bits));for(let i=0;i<3;i++)vec(0x9010+i*16,c.collisionVelocities?.[i]??[1,0,2,0].map(bits));vec(0x9040,c.turnOutput??[1,.2,2,0].map(bits));vec(0x9050,c.rayPosition??[1,3,3,1].map(bits));vec(0x9060,c.before??[0,0,1,0].map(bits));vec(0x9070,c.desired??[1,0,0,0].map(bits));
 const cfg=[c.steps??1,c.mutation??0,c.collisionCount??1,c.collisionVelocities?1:0,c.nativeTurn?1:0,c.nativeBank?1:0,c.transformFaultCall??0,c.transformFaultBits??0,c.rayHit??0,c.rayFlags??0,c.interactionResult??0,0];cfg.forEach((n,i)=>u32(0x1f000+i*4,n));(c.random??[1234567,1073741823,2147483647,0]).forEach((n,i)=>u32(0x1f030+i*4,n));u32(0x1f044,c.debugScale===undefined?0:1);u32(0x1f048,c.debugScale??bits(1));u32(0x1f04c,c.maximumAngle??bits(.1));vec(0x1f050,c.packedSincos??[0,0]);u32(0x1f058,c.enableCallback??0);u32(0x1f05c,c.transformFaultOffset??0);u32(0x1f060,c.callbackBits??c.bankAngle??bits(0));u32(0x1f064,c.callbackState??4);u32(0x1f068,c.bankStrength??bits(5));u32(0x1f06c,c.bankSmoothing??bits(1));u32(0x1f070,c.bankLimit??bits(50));f(0x1f100,[3,1,-1,.5]);f(0x1f110,[2,3,4,1]);f(0x1f120,[.2,.3,.4,0]);return {b,m};
}
export function evaluateFishUpdate(c:FishUpdateCase,math:readonly FishNativeMath[],probes:readonly number[][]){
 const {b,m}=prepareFishUpdate(c),rows:Buffer[]=[],map=new Map(probes.map(r=>[`${r[0]}:${r[1]}:${r[2]}`,r[3]]));let mathAt=0,collisions=0,transforms=0,randoms=0,status=0,line=0,severity=0;
 const record=(kind:number,x:number|bigint=0,y:number|bigint=0)=>{const r=Buffer.alloc(FISH_UPDATE_ROW);[kind,x,y].forEach((n,i)=>r.writeBigUInt64LE(BigInt(n),i*8));rows.push(r);return r;};
 const mutate=(event:number)=>{if(c.mutation!==event)return;const ptr=(at:number,to:number)=>b.writeBigUInt64LE(base+BigInt(to),at),u32=(at:number,n:number)=>b.writeUInt32LE(n>>>0,at),copy=(to:number,from:number)=>b.copy(b,to,from,from+16);
  switch(event){case 1:b[0x10c0]=c.enableCallback??0;ptr(0x1110,0x6500);break;case 2:ptr(0x1078,0x4100);copy(0x1050,0x1f100);copy(0x1010,0x1f110);break;case 3:ptr(0x3138,0xb100);copy(0x1010,0x1f110);break;case 4:ptr(0x1078,0x4100);copy(0x1030,0x1f110);break;case 5:copy(0x1030,0x1f110);u32(0x1100,b.readUInt32LE(0x1f060));break;case 6:ptr(0x1110,0x6500);copy(0x1120,0x1f120);break;case 7:u32(0x117c,b.readUInt32LE(0x1f064));ptr(0x1110,0x6500);break;case 8:u32(0x1144,b.readUInt32LE(0x1f060));u32(0x1134,321);ptr(0x1110,0x6500);break;case 9:copy(0x1010,0x1f110);ptr(0x1078,0x4100);ptr(0x3500,0xb200);break;case 10:ptr(0x1158,0x7100);break;case 11:copy(0x1010,0x1f110);ptr(0x1078,0x4100);u32(0x1160,b.readUInt32LE(0x1f060));break;case 12:u32(0x1160,b.readUInt32LE(0x1f060));break;case 13:u32(0x1168,b.readUInt32LE(0x1f060));ptr(0x33c8,0xb200);break;case 14:u32(0x1160,b.readUInt32LE(0x1f060));ptr(0x33c8,0xb200);break;}
 };
 const libm=(kind:number,x:number)=>{const row=math[mathAt++];if(!row||row.kind!==kind||row.x!==x)throw new Error('Fish native math order differs '+JSON.stringify({label:c.label,kind,x,row}));const r=record(kind,x);row.result.forEach((n,i)=>r.writeUInt32LE(n>>>0,24+i*4));return row.result;};
 const arithmetic={resolveDualNaN:(op:'add'|'sub'|'mul'|'div',x:number,y:number)=>{const n=map.get(`${['add','sub','mul','div'].indexOf(op)}:${x>>>0}:${y>>>0}`);if(n===undefined)throw new Error('Fish dual-NaN probe missing '+[op,x,y]);return n;}};
 const mathServices:FishMathServices={arithmetic,acosBits:x=>libm(1,x)[0],expBits:x=>libm(2,x)[0],logBits:x=>libm(3,x)[0],sincosBits:x=>{const v=libm(4,x),out=new Uint8Array(16);v.forEach((n,i)=>new DataView(out.buffer).setUint32(i*4,n,true));return out;}};
 const transform=(fish:bigint)=>{const r=record(10,fish,transforms++),out=getOriginalCreatureMotionTransform(m,fish);if(transforms===(c.transformFaultCall??0))new DataView(out.buffer).setUint32(c.transformFaultOffset??0,c.transformFaultBits??0,true);r.set(out,32);mutate(6);return out;};
 const turn=(maximum:number,before:Uint8Array,desired:Uint8Array)=>{const r=record(8,maximum);r.set(before,32);r.set(desired,48);const out=c.nativeTurn?turnOriginalCreatureDirection(maximum,before,desired,mathServices):new Uint8Array(b.subarray(0x9040,0x9050));r.set(out,64);mutate(4);return out;};
 const bank=(state:bigint,motion:bigint,delta:number,strength:number,smoothing:number,limit:number)=>{const r=record(9,state,motion);[delta,strength,smoothing,limit].forEach((n,i)=>r.writeUInt32LE(n,32+i*4));if(c.nativeBank)updateOriginalCreatureBank(m,state,motion,delta,strength,smoothing,limit,mathServices);else m.write32(state+48n,b.readUInt32LE(0x1f060));r.set(m.bytes(state,64),48);mutate(5);};
 const s:FishUpdateServices={...mathServices,debugScaleBits:c.debugScale,followUpParameters:0x10203f6b0n,turnDirection:turn,bank,transform,
  setModelEnabled:(model,enabled)=>{record(5,model,enabled);setOriginalModelEnabled(m,model,enabled);mutate(1);},
  updateAI:(fish,game)=>{const r=record(6,fish,game),out=new Uint8Array(b.subarray(0x9000,0x9010));r.set(out,32);mutate(2);return out;},
  collide:(position,velocity,scene,delta,repeat)=>{const r=record(7,position,velocity);r.writeBigUInt64LE(scene,24);r.writeUInt32LE(delta,32);r[36]=repeat.value;r.set(m.bytes(position,16),48);r.set(m.bytes(velocity,16),64);const out=new Uint8Array(c.collisionVelocities?b.subarray(0x9010+(collisions%3)*16,0x9020+(collisions%3)*16):m.bytes(velocity,16));repeat.value=++collisions%3<(c.collisionCount??1)?1:0;r[37]=repeat.value;r.set(out,80);mutate(3);return out;},
  setModelTransform:(model,matrix)=>{record(11,model).set(matrix,32);setOriginalModelTransform(m,model,matrix);mutate(7);},
  setAnimationWeight:(animation,index,weight)=>{record(12,animation,index>>>0).writeUInt32LE(weight,24);mutate(8);},
  raycast:(scene,position,direction,height,kind)=>{const r=record(13,scene,kind),out=new Uint8Array(b.subarray(0x9050,0x9060));r.writeUInt32LE(height,24);r.set(m.bytes(position,16),32);r.set(direction,48);r.set(out,64);r[80]=c.rayHit??0;r[81]=c.rayFlags??0;mutate(9);return {hit:c.rayHit??0,materialFlags:c.rayFlags??0,position:out};},
  ripple:(owner,kind,position,color,size,radius,weight,enabled)=>{const r=record(14,owner,kind);r.set(position,32);r.set(color,48);[size,radius,weight,enabled].forEach((n,i)=>r.writeUInt32LE(n,64+i*4));mutate(10);},
  setLightTransform:(light,matrix)=>{record(15,light).set(matrix,32);m.bytes(light+16n,64).set(matrix);},
  localPlayer:owner=>{record(16,owner,base+0x8000n);mutate(11);return base+0x8000n;},
  playNamed:(animation,_name,weight,speed,flags)=>{const r=record(17,animation,flags);r.writeUInt32LE(weight,24);r.writeUInt32LE(speed,28);mutate(12);},
  requestInteraction:(owner,position,id,range,kind,enabled)=>{const r=record(18,owner,id);r.set(position,32);[range,kind,enabled,c.interactionResult??0].forEach((n,i)=>r.writeUInt32LE(n,48+i*4));mutate(13);return c.interactionResult??0;},
  random:()=>{const n=b.readUInt32LE(0x1f030+(randoms++%4)*4);record(19,n);mutate(14);return n|0;},
  emitInteraction:(owner,fish,kind,parameters,radius,random,flags)=>{const r=record(20,owner,fish);r.writeBigUInt64LE(parameters,24);[kind,radius,random,...flags].forEach((n,i)=>r.writeUInt32LE(n,32+i*4));}
 };
 try{for(let i=0;i<(c.steps??1);i++){
  if(c.mode===0)updateOriginalFishV2(m,p,game,s);
  else if(c.mode===4)updateOriginalFishV2(m,p,game,originalFishMovementServices(m,s));
  else if(c.mode===1)m.bytes(base+0x9080n,16).set(turn(b.readUInt32LE(0x1f04c),new Uint8Array(b.subarray(0x9060,0x9070)),new Uint8Array(b.subarray(0x9070,0x9080))));
  else if(c.mode===2)bank(p+0xd0n,p+16n,b.readUInt32LE(0x1f04c),b.readUInt32LE(0x1f068),b.readUInt32LE(0x1f06c),b.readUInt32LE(0x1f070));
  else m.bytes(base+0x9080n,64).set(transform(p));
 }}catch(e){if(e instanceof NativeObjectFoundationFailure){status=1;line=e.line;severity=e.severity;}else throw e;}
 if(mathAt!==math.length)throw new Error('Fish native math results unused '+[c.label,mathAt,math.length]);
 const header=Buffer.alloc(16);[status,line,severity,rows.length].forEach((n,i)=>header.writeUInt32LE(n,i*4));return Buffer.concat([header,b,...rows]);
}
