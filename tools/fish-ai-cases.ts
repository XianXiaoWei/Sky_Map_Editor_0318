import {updateOriginalFishAI,filterOriginalFishNeighbor,filterOriginalFishFlock,type FishAIServices,type FishMetadataKind,originalFishAIUpdateServices,originalFishAISteeringServices} from '../src/core/fish-ai-runtime';
import {pursueOriginalCreatureSteering,avoidOriginalCreatureSteering} from '../src/core/creature-force-runtime';
import {updateOriginalFishV2,type FishMathServices} from '../src/core/fish-update-runtime';
import {setOriginalModelEnabled,setOriginalModelTransform} from '../src/core/level-mesh-runtime';
import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
import {numericFloatBits as bits} from '../src/core/object-numeric-runtime';
export interface FishAICase {label:string;mode:0|1|2|3|4|5|6|7;steps?:number;u32?:[number,number][];u8?:[number,number][];ptr?:[number,number][];vectors?:[number,number[]][];}
export interface FishAINativeMath {kind:number;x:number;result:number[];}
export const FISH_AI_ARENA=0x20000,FISH_AI_ROW=640,base=0x440000000n;
const kinds:FishMetadataKind[]=['Object','Entity','Marker','Rail','Mote','Player','Actor'];
const animations=['CritterAlert','CritterExcite','CritterBite','CritterBiteDone','CritterRoll','CritterBiteOpen'];
export function fishAICases(){
 const cases:FishAICase[]=[],add=(label:string,c:Partial<FishAICase>={})=>cases.push({label,mode:0,...c}),f=(at:number,n:number):[number,number]=>[at,bits(n)];
 add('whole AI default');
 for(const state of [0,1,2,3,4,5,6,0xffffffff])for(const timer of [-.1,0,.00001,1,NaN])for(const steps of [1,4])add('whole AI state and saved decision timer '+[state,timer,steps],{steps,u32:[[0x117c,state],f(0x1188,timer)]});
 for(const state of [1,2,3,4,5])for(const amount of [-1,0,.999,1,1.001,NaN])for(const alert of [0,1,2,NaN])add('state amount and alert decisions '+[state,amount,alert],{u32:[[0x117c,state],f(0x1188,0),f(0x1184,amount),f(0x1180,alert)]});
 for(const delta of [-1,0,.000099,.0001,.266,.267,Infinity,NaN])for(const scale of [0,1,NaN])add('native delta clamp '+[delta,scale],{u32:[f(0x3814,delta),f(0x3820,scale)]});
 for(const timer of [-1,0,.0001,1.5,NaN])add('neighbor query timer '+timer,{u32:[f(0x1294,timer)]});
 for(const debug of [0,-1,.5,2,NaN])add('debug clock scale '+debug,{u32:[[0x1f120,1],f(0x1f124,debug)]});
 for(const state of [1,2,4])for(const rails of [0,1,2])for(const loop of [0,1])for(const cached of [0,1])add('rail selection '+[state,rails,loop,cached],{u32:[[0x117c,state],[0x5110,rails],[0x5210,rails]],u8:[[0x7041,rails?1:0],[0x7141,0],[0x702c,loop]],ptr:[[0x1490,cached?0x7000:0]]});
 for(const state of [1,2])for(const parameter of [-2.3,-.1,0,.99,1,10,NaN])for(const length of [0,4,10])add('rail advance floor '+[state,parameter,length],{u32:[[0x117c,state],f(0x70a0,parameter),f(0x7018,length)]});
 for(const state of [1,2])for(const point of [[NaN,0,0,0],[Infinity,0,0,0],[1,2,3,1]])add('nearest selection ordered distances '+[state,point],{u8:[[0x7141,1],[0x712c,1]],vectors:[[0x7080,point.map(bits)],[0x7180,[1,2,3,1].map(bits)]]});
 for(const count of [0,1,2])for(const markerCount of [0,1,0xffffffff])add('weighted Marker Clump target '+[count,markerCount],{u32:[[0x5010,count],[0x6884,markerCount]],ptr:[[0x4048,0x5000]]});
 for(const w of [0,1,-1,NaN])for(const weight of [0,1,NaN])add('flee Marker private velocity W '+[w,weight],{u32:[f(0x1f110,w),f(0x4078,weight)],ptr:[[0x4040,0x6800]]});
 for(const state of [2,3])for(const on of [0,1])for(const distance of [0,1.99,2,2.01,8,9.99,10,11.99,12,12.01,NaN])for(const keep of [0,1])add('Mote bite and pursuit range '+[state,on,distance,keep],{u32:[[0x117c,state],f(0x1188,0),[0x1290,1],[0x1f01c,keep]],u8:[[0x90f1,on]],vectors:[[0x9010,[1,2,3+distance,1].map(bits)]],ptr:[[0x1190,0x9000]]});
 for(const state of [4,5])for(const distance of [0,.49,.5,.51,1,7.99,8,8.01,NaN])for(const blocked of [0,1])add('Player flee and interaction '+[state,distance,blocked],{u32:[[0x117c,state],f(0x1188,0),[0x1290,1]],ptr:[[0x1190,0x8000]],u8:[[0x8cb0,blocked]],vectors:[[0x8010+0x100,[1+distance,2,3,1].map(bits)],[0x8200,[1-distance,2,3,1].map(bits)],[0x8210,[1,2,3,1].map(bits)]]});
 for(const y of [-3,0,3])for(const w of [0,1,NaN])add('packed player quaternion lanes '+[y,w],{u32:[[0x117c,5],[0x1290,1]],ptr:[[0x1190,0x8000]],vectors:[[0x8200,[0,y,0,w].map(bits)]]});
 for(const near of [1.2499,1.25,1.2501,NaN])add('strict player interaction radius '+near,{u32:[[0x117c,5],[0x1290,1]],ptr:[[0x1190,0x8000]],vectors:[[0x8210,[1+near,2,3,1].map(bits)]]});
 for(const markerKind of [0,2])add('Clump Marker cast success or assertion '+markerKind,{ptr:[[0x4048,0x5000]],u8:[[0x68f0,markerKind]]});
 add('Rail cast assertion',{u8:[[0x70f0,0]]});
 for(const event of [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29])for(const mutation of [1,2,3,4,5,6,7,8,9,10]){
  const state=event<=13?1:event<=19?3:event<=25?5:2;
  add('live callback rereads '+[event,mutation],{u32:[[0x117c,state],f(0x1188,0),[0x1290,2],[0x1f004,event],[0x1f008,mutation],[0x1f00c,1],f(0x1f010,2),f(0x1f014,3)],ptr:[[0x4040,0x6800],[0x4048,0x5000],[0x1190,state===5?0x8000:0x9000],[0x1198,0x9100]]});
 }
 for(const mode of [1,2] as const)for(const weight of [0,.000009,.00001,.000011,-1,1,NaN])for(const w of [0,1,NaN])for(const accum of [0,1])add('whole steering accumulation '+[mode,weight,w,accum],{mode,u8:[[0x12b0,accum]],u32:[f(0x1f128,weight),f(0x1f12c,w)],steps:accum?3:1});
 for(const mode of [1,2] as const)for(const vector of [[0,0,0,0],[1,2,3,1],[NaN,0,0,0],[Infinity,0,0,0]])for(const prediction of [0,1,-1,NaN])add('whole steering packed prediction '+[mode,vector,prediction],{mode,vectors:[[0xc300,vector.map(bits)],[0xc000,vector.map(bits)]],u32:[f(0x1f130,prediction),f(0x1f134,1)]});
 for(const flag of [0,1,255,256,0xffffffff])add('Avoidance flag truncation '+flag,{mode:2,u32:[[0x1f138,flag],[0x1f004,31],[0x1f008,10]]});
 for(const mode of [3,4] as const)for(const player of [0,1])for(const actor of [0,1])for(const replacement of [0,0xb500])add('whole fish neighbor filter '+[mode,player,actor,replacement],{mode,u32:[[0x1f034,player],[0x1f038,actor],[0x1f064,replacement]]});
 let seed=0x1af23;const random=()=>{seed=(Math.imul(seed,1664525)+1013904223)>>>0;return seed;};
 for(let i=0;i<60;i++)add('randomized whole AI '+i,{steps:3,u32:[[0x117c,1+random()%5],f(0x1188,(random()%30-10)/100),f(0x1184,(random()%200-50)/100),f(0x1180,(random()%300)/100),f(0x1184,(random()%200)/100),[0x1290,2],[0x1f018,2]],vectors:[[0x1010,[random()%10,random()%10,random()%10,1].map(bits)],[0x9010,[random()%10,random()%10,random()%10,1].map(bits)]],ptr:[[0x1190,0x9000],[0x1198,0x8000],[0xc200,0x9000],[0xc208,0x8000]]});
 for(const source of cases.filter(c=>c.mode===0&&(c.label.startsWith('whole AI state and saved decision timer')||c.label.startsWith('randomized whole AI'))))cases.push({...source,mode:5,label:'production Update and AI '+source.label,u8:[...(source.u8??[]),[0x10c0,1]],vectors:[...(source.vectors??[]),[0x1120,[.2,.2,.2,0].map(bits)]]});
 for(const upper of [[1,-1],[NaN,NaN]])add('explicit AI sincos upper lanes '+upper,{u32:[[0x117c,5],[0x1290,1],f(0x1f114,upper[0]),f(0x1f118,upper[1])],ptr:[[0x1190,0x8000]]});
 for(const animationCount of [-1,0,1])for(const amount of [-.00001,0,.00001])add('signed animation count Roll gate '+[animationCount,amount],{u32:[[0x117c,2],f(0x1188,0),f(0x1184,amount),[0x640c,animationCount]],ptr:[[0x4028,0]]});
 for(const timer of [0,.19999,.2,.20001,1,1.9999,2,2.0001,NaN])for(const disabled of [0,1])add('live interaction and alert reset thresholds '+[timer,disabled],{u32:[f(0x1160,timer)],u8:[[0x4021,disabled]]});
 for(const source of [...cases].filter(c=>c.mode===0&&(c.label.startsWith('whole AI state and saved decision timer')||c.label.startsWith('randomized whole AI')||c.label.startsWith('Player flee and interaction')||c.label.startsWith('Mote bite and pursuit range')))){
  cases.push({...source,mode:6,label:'production AI steering '+source.label});
 }
 for(const mode of [6,7] as const)for(const state of [1,2,3,4,5])for(const count of [0,1,2])for(const steps of [1,9])add('actual steering flock neighborhoods '+[mode,state,count,steps],{mode,steps,u32:[[0x117c,state],[0x1f018,count],[0x1290,1]],ptr:[[0xc200,0x9200],[0xc208,0x9300],[0x1190,state===3?0x9000:0x8000]],u8:[[0x10c0,1]],vectors:[[0x1120,[.2,.2,.2,0].map(bits)]]});
 return cases;
}
export function prepareFishAI(c:FishAICase){
 const b=Buffer.alloc(FISH_AI_ARENA),at=(p:bigint)=>Number(p-base),m={bytes:(p:bigint,n:number)=>{const x=at(p);if(x<0||x+n>b.length)throw new Error('Fish AI memory out of range '+p.toString(16));return b.subarray(x,x+n);},read32:(p:bigint)=>b.readUInt32LE(at(p)),read64:(p:bigint)=>b.readBigUInt64LE(at(p)),write8:(p:bigint,n:number)=>{b[at(p)]=n;},write32:(p:bigint,n:number)=>{b.writeUInt32LE(n>>>0,at(p));},write64:(p:bigint,n:bigint)=>{b.writeBigUInt64LE(n,at(p));},string:(p:bigint)=>b.toString('utf8',at(p),b.indexOf(0,at(p)))};
 const u32=(at:number,n:number)=>b.writeUInt32LE(n>>>0,at),ptr=(at:number,n:number)=>b.writeBigUInt64LE(n?base+BigInt(n):0n,at),vec=(at:number,v:number[])=>v.forEach((n,i)=>u32(at+i*4,n)),f=(at:number,v:number[])=>vec(at,v.map(bits));
 f(0x1010,[1,2,3,1]);f(0x1020,[1,0,0,0]);f(0x1030,[0,1,0,0]);f(0x1040,[0,0,-1,0]);f(0x1050,[1,.2,2,0]);f(0x1060,[2,4,1]);ptr(0x1078,0x4000);f(0x1080,[1,0,0,0]);ptr(0x1110,0x6000);u32(0x117c,1);f(0x1180,[0,.5,1]);u32(0x1160,bits(10));u32(0x1294,bits(1));
 for(const p of [0x4000,0x4100]){f(p+16,[2,4,10,0]);b[p+0x21]=1;ptr(p+0x28,0x5200);ptr(p+0x30,0x5100);b[p+0x50]=1;b[p+0x51]=0;f(p+0x54,[1,2,3,20,.5,1,2,.3,.4,.5,.6,.7]);}
 f(0x4110,[3,6,12,0]);ptr(0x4140,0x6900);ptr(0x4148,0x5000);
 ptr(0x3160,0x3800);f(0x3814,[.016]);u32(0x3820,bits(1));for(const p of [0x3220,0x30e8,0x3438,0x35c8,0x1480])ptr(p,0xb300);
 for(const p of [0x5000,0x5100,0x5200]){ptr(p+8,p+0x40);u32(p+16,2);}ptr(0x5040,0x6800);ptr(0x5048,0x6900);ptr(0x5140,0x7000);ptr(0x5148,0x7100);ptr(0x5240,0x7000);ptr(0x5248,0x7100);
 for(const p of [0x6800,0x6900]){f(p+16,[3,4,5,1]);f(p+64,[3,4,5,1]);f(p+128,[4]);u32(p+132,0);b[p+0xf0]=2;}f(0x6940,[1,2,3,1]);
 for(const p of [0x7000,0x7100]){u32(p+24,bits(10));b[p+0x41]=1;b[p+0x2c]=1;b[p+0xf0]=3;f(p+0x80,[2,3,4,1]);f(p+0x90,[4,5,6,1]);f(p+0xa0,[.25]);f(p+0xb0,[3,4,5,1]);}f(0x7180,[10,10,10,1]);
 for(const p of [0x6000,0x6500]){ptr(p+104,p+0x400);u32(p+0x40c,1);}ptr(0x8018,0x8100);ptr(0x8020,0x8300);ptr(0x8030,0x8600);b[0x80f0]=5;f(0x8110,[2,2,3,1]);f(0x8160,[0,0,0,0]);
 for(const p of [0x8300,0x8500]){ptr(p+0x298,0x8200);ptr(p+0x288,0x8210);}f(0x8200,[0,2,3,1]);f(0x8210,[1,2,3,1]);
 for(const p of [0x9000,0x9100,0x9200,0x9300]){b[p+0xf0]=p>=0x9200?6:4;b[p+0xf1]=1;f(p+16,p===0x9000?[1,2,4,1]:[1,2,5.5,1]);f(p+32,[1,0,0,0]);f(p+48,[0,1,0,0]);f(p+64,[0,0,-1,0]);f(p+80,[1,.2,2,0]);f(p+96,[2,4,1]);}
 f(0xb100,[1,0,0,0,0,1,0,0,0,0,1,0]);f(0xc000,[.5,-.25,.125,0]);f(0xc100,[2,3,4,1]);b.copy(b,0xc300,0x1010,0x106c);f(0xc350,[1,.5,-.5,0]);ptr(0xc220,0x9200);ptr(0xc228,0x9300);u32(0x1f000,c.steps??1);u32(0x1f01c,0);u32(0x1f110,bits(0));[1,1234567,1073741823,2147483647].forEach((n,i)=>u32(0x1f100+i*4,n));u32(0x1f128,bits(1));u32(0x1f130,bits(1));u32(0x1f138,1);
 f(0x12a0,[1,2,3,0]);b[0x12b0]=1;b.copy(b,0x12c0,0x1010,0x106c);
 for(const [at,n] of c.u32??[])u32(at,n);for(const [at,n] of c.u8??[])b[at]=n;for(const [at,n] of c.ptr??[])ptr(at,n);for(const [at,v] of c.vectors??[])vec(at,v);
 b.writeBigUInt64LE(base+0x18a00n,0x1000);b.writeBigUInt64LE(0x1001a6610n,0x18a18);
 for(let i=0;i<7;i++)ptr(0x18000+i*0x100,0x18800);b.writeBigUInt64LE(0x102220000n,0x18840);b.writeBigUInt64LE(0x102220020n,0x18910);b.writeBigUInt64LE(0x102220040n,0x18938);ptr(0x9000,0x18900);ptr(0x9100,0x18900);
 return {b,m};
}
export function evaluateFishAI(c:FishAICase,math:readonly FishAINativeMath[],probes:readonly number[][]){
 const {b,m}=prepareFishAI(c),rows:Buffer[]=[],map=new Map(probes.map(r=>[`${r[0]}:${r[1]}:${r[2]}`,r[3]]));let mathAt=0,randoms=0,status=0,line=0,severity=0,result=0;
 const record=(kind:number,x:number|bigint=0,y:number|bigint=0)=>{const r=Buffer.alloc(FISH_AI_ROW);[kind,x,y].forEach((n,i)=>r.writeBigUInt64LE(BigInt(n),i*8));rows.push(r);return r;},u32=(at:number,n:number)=>b.writeUInt32LE(n>>>0,at),ptr=(at:number,n:number)=>b.writeBigUInt64LE(n?base+BigInt(n):0n,at),copy=(to:number,from:number,n=16)=>b.copy(b,to,from,from+n);
 const mutate=(event:number)=>{if(b.readUInt32LE(0x1f004)!==event)return;
  switch(b.readUInt32LE(0x1f008)){case 1:ptr(0x1078,0x4100);break;case 2:u32(0x117c,b.readUInt32LE(0x1f00c));u32(0x1180,b.readUInt32LE(0x1f010));u32(0x1184,b.readUInt32LE(0x1f014));break;case 3:copy(0x1010,0xc100);break;case 4:u32(0x1290,b.readUInt32LE(0x1f00c));break;case 5:ptr(0x1110,0x6500);break;case 6:u32(0x5010,b.readUInt32LE(0x1f00c));u32(0x5110,b.readUInt32LE(0x1f00c));break;case 7:copy(0x9010,0xc100);break;case 8:ptr(0x8020,0x8500);ptr(0x8030,0x8700);break;case 9:copy(0x1290,0x1f00c,4);ptr(0x1190,0x9100);break;case 10:copy(0x12a0,0xc100);break;}
 };
 const fs=(r:Buffer,v:number[],at=24)=>v.forEach((n,i)=>r.writeUInt32LE(n>>>0,at+i*4));
 const force=(state:bigint,event:number)=>{m.bytes(state,16).set(b.subarray(0xc000,0xc010));mutate(event);};
 const arithmetic={resolveDualNaN:(op:'add'|'sub'|'mul'|'div',x:number,y:number)=>{const n=map.get(`${['add','sub','mul','div'].indexOf(op)}:${x>>>0}:${y>>>0}`);if(n===undefined)throw new Error('Fish AI dual-NaN probe missing '+[op,x,y]);return n;}};
 const libm=(kind:number,x:number)=>{const row=math[mathAt++];if(!row||row.kind!==kind||row.x!==x)throw new Error('Fish AI math order differs '+JSON.stringify({label:c.label,kind,x,row}));fs(record(kind,x),row.result);mutate(kind);return row.result;};
 const s:FishAIServices={arithmetic,debugScaleBits:b.readUInt32LE(0x1f120)?b.readUInt32LE(0x1f124):undefined,markerVelocityWBits:b.readUInt32LE(0x1f110),identityAxes:new Uint8Array(b.subarray(0xb100,0xb130)),soulParticleTemplate:base+0xb200n,
  metadata:kind=>{const n=kinds.indexOf(kind),p=base+0x18000n+BigInt(n*0x100);record(1,n,p);mutate(1);return p;},
  cast:(meta,object,source)=>{const r=record(2,meta,object),kind=Number(meta-base-0x18000n)/0x100;r.writeBigUInt64LE(source,24);let output=0n;
   if((c.mode===3||c.mode===4)){const success=b.readUInt32LE(0x1f020+kind*4),replacement=b.readUInt32LE(0x1f050+kind*4);if(replacement)object=base+BigInt(replacement);output=success?base+0xb000n:0n;}
   else output=object&&m.bytes(object+0xf0n,1)[0]===kind?object:0n;
   r.writeBigUInt64LE(object,32);r.writeBigUInt64LE(output,40);mutate(2);return {object,cast:output};},
  random:()=>{const n=b.readUInt32LE(0x1f100+(randoms++%4)*4);record(3,n);mutate(3);return n|0;},
  query:(world,position,out,cap,filter,radius,zero)=>{const r=record(4,world,cap),count=b.readUInt32LE(0x1f018);r.writeBigUInt64LE(filter,24);fs(r,[radius,zero,count],32);r.set(m.bytes(position,16),48);const pool=filter===0x1003385f0n?0xc220:0xc200;m.bytes(out,count*8).set(b.subarray(pool,pool+count*8));mutate(4);return b.readUInt32LE(0x1f018);},
  begin:(state,motion,delta,maximum)=>{const r=record(5,state);fs(r,[delta,maximum]);r.set(motion,32);m.bytes(state,16).fill(0);m.write8(state+16n,1);m.bytes(state+32n,80).set(motion.subarray(0,80));m.bytes(state+0x70n,12).set(motion.subarray(80,92));m.write32(state+0x80n,delta);m.write32(state+0x84n,maximum);mutate(5);},
  avoidance:(state,weight,lookahead,flag)=>{fs(record(6,state,flag&255),[weight,lookahead]);force(state,6);},
  flee:(state,motion,weight,min,max,prediction)=>{const r=record(7,state);fs(r,[weight,min,max,prediction]);r.set(motion,48);force(state,7);},
  markerRadius:marker=>{const n=m.read32(marker+128n);fs(record(8,marker),[n]);mutate(8);return n;},
  markerCount:marker=>{const n=m.read32(marker+132n);record(9,marker,n);mutate(9);return n;},
  nearestRail:(rail,position)=>{const r=record(10,rail),out=new Uint8Array(m.bytes(rail+128n,16)),parameter=m.read32(rail+160n);r.set(position,32);r.set(out,48);fs(r,[parameter]);mutate(10);return {position:out,parameter};},
  initialRail:rail=>{const out=new Uint8Array(m.bytes(rail+144n,16));record(11,rail).set(out,32);mutate(11);return out;},
  sampleRail:(rail,param)=>{const out=new Uint8Array(m.bytes(rail+176n,16));record(12,rail,param).set(out,32);mutate(12);return out;},
  seekDirect:(state,position,weight,speed)=>{const r=record(13,state);fs(r,[weight,speed]);r.set(position,32);force(state,13);},
  enabled:obj=>{const on=m.bytes(obj+0xf1n,1)[0];record(14,obj,on);mutate(14);return on;},
  consume:(obj,owner,game)=>{record(15,obj,owner).writeBigUInt64LE(game,24);m.write8(obj+0xf1n,b.readUInt32LE(0x1f01c));mutate(15);},
  particle:(owner,pos,dir,template,flag,scale)=>{const r=record(16,owner,template);r.set(pos,32);r.set(dir,48);fs(r,[flag,scale]);mutate(16);},
  sound:(owner,_name,options,parameters)=>{const r=record(17,owner);r.set(options,32);r.set(parameters,160);mutate(17);},
  pursuit:(state,motion,velocity,weight,prediction)=>{const r=record(18,state);fs(r,[weight,prediction]);r.set(motion,32);r.set(velocity,128);force(state,18);},
  playNamed:(owner,name,flags,weight,speed)=>{fs(record(19,owner,animations.indexOf(name)),[flags,weight,speed]);mutate(19);},
  motionState:obj=>{const out=new Uint8Array(b.subarray(0xc300,0xc35c));record(20,obj).set(out,32);mutate(20);return out;},
  componentPosition:obj=>{const out=new Uint8Array(m.bytes(obj,16));record(21,obj).set(out,32);mutate(21);return out;},
  asinBits:x=>libm(22,x)[0],sincosBits:x=>{const out=Buffer.alloc(16);fs(out,libm(23,x),0);return out;},
  seekArrival:(state,position,weight,distance)=>{const r=record(24,state);fs(r,[weight,distance]);r.set(position,32);force(state,24);},
  interact:(owner,position,first,second,weight,scale)=>{const r=record(25,owner);fs(r,[first,second,weight,scale]);r.set(position,48);mutate(25);},
  modelParameter:(owner,index,_name,amount)=>{fs(record(26,owner,index),[amount]);mutate(26);},
  wander:(state,weight,radius,distance,jitter,vertical)=>{fs(record(27,state),[weight,radius,distance,jitter,vertical]);force(state,27);},
  flock:(state,self,filter,weight,alignment,cohesion,separation,radius)=>{const r=record(28,state,self);r.writeBigUInt64LE(filter,24);fs(r,[weight,alignment,cohesion,separation,radius],32);force(state,28);},
  end:(state,avoid)=>{const out=new Uint8Array(m.bytes(state,16));record(29,state,avoid).set(out,32);m.write8(state+16n,0);mutate(29);return out;}
 };
 const rawAvoidance=(motion:bigint,world:bigint,flag:number,lookahead:number)=>{const r=record(31,motion,world),out=new Uint8Array(b.subarray(0xc000,0xc010));fs(r,[flag,lookahead]);r.set(m.bytes(motion,92),32);r.set(out,128);mutate(31);return out;};
 const activeAI=c.mode===6||c.mode===7?originalFishAISteeringServices(m,s,{avoidance:{avoidance:rawAvoidance},collision:{collision:(position,velocity,lookahead,world,blocked)=>{const r=record(35,position,velocity);r.writeBigUInt64LE(world,24);fs(r,[lookahead],32);r[36]=blocked;r.set(m.bytes(position,16),48);r.set(m.bytes(velocity,16),64);return new Uint8Array(m.bytes(velocity,16));}},flocking:{
  query:(owner,position,out,cap,filter,radius)=>s.query(owner,position,out,cap,filter,radius,0),
  cast:(memory,ref,kind)=>{const source=s.metadata('Entity'),meta=s.metadata(kind==='Actor'?'Actor':'Player'),converted=s.cast(meta,memory.read64(ref),source);memory.write64(ref,converted.object);return converted.cast;},
  avatarMotion:()=>{throw new Error('Unprepared flock Avatar');},obb:()=>{throw new Error('Unprepared flock OBB');},fallbackWeightBits:()=>{throw new Error('Unprepared flock W');}
 }}):s;
 const mathServices:FishMathServices={arithmetic,acosBits:x=>libm(32,x)[0],expBits:x=>libm(33,x)[0],logBits:x=>libm(34,x)[0],sincosBits:s.sincosBits};
 const memory={...m,read8:(p:bigint)=>m.bytes(p,1)[0]};
 const updateServices=originalFishAIUpdateServices(m,activeAI,{...mathServices,followUpParameters:0n,
  setModelEnabled:(model,enabled)=>{record(36,model,enabled);setOriginalModelEnabled(memory,model,enabled);},
  collide:(position,velocity,scene,delta,repeat)=>{const r=record(35,position,velocity);r.writeBigUInt64LE(scene,24);fs(r,[delta],32);r[36]=repeat.value;r.set(m.bytes(position,16),48);r.set(m.bytes(velocity,16),64);repeat.value=0;return new Uint8Array(m.bytes(velocity,16));},
  setModelTransform:(model,matrix)=>{record(39,model).set(matrix,32);setOriginalModelTransform(memory,model,matrix);},
  setAnimationWeight:(owner,index,weight)=>fs(record(37,owner,index>>>0),[weight]),
  raycast:(scene,position,direction,height,kind)=>{const r=record(38,scene,kind);fs(r,[height]);r.set(m.bytes(position,16),32);r.set(direction,48);return {hit:0,position:new Uint8Array(16),materialFlags:0};},
  localPlayer:owner=>{record(40,owner);return base+0x8000n;},
  playNamed:(owner,name,weight,speed,flags)=>s.playNamed(owner,name,flags as 0,weight,speed),
  random:s.random,
  ripple:()=>{throw new Error('Unexpected ripple');},setLightTransform:()=>{throw new Error('Unexpected light');},requestInteraction:()=>{throw new Error('Unexpected interaction request');},emitInteraction:()=>{throw new Error('Unexpected emission');}
 });
 try{for(let i=0;i<(c.steps??1);i++){
  if(c.mode===5||c.mode===7)updateOriginalFishV2(m,base+0x1000n,base+0x3000n,updateServices);
  else if(c.mode===0||c.mode===6)m.bytes(base+0xc400n,16).set(updateOriginalFishAI(m,base+0x1000n,base+0x3000n,activeAI));
  else if(c.mode===1)pursueOriginalCreatureSteering(m,base+0x12a0n,b.subarray(0xc300,0xc35c),b.subarray(0xc350,0xc360),b.readUInt32LE(0x1f128),b.readUInt32LE(0x1f130),arithmetic,b.readUInt32LE(0x1f12c),b.readUInt32LE(0x1f134));
  else if(c.mode===2)avoidOriginalCreatureSteering(m,base+0x12a0n,b.readUInt32LE(0x1f128),b.readUInt32LE(0x1f130),b.readUInt32LE(0x1f138),{arithmetic,avoidance:(motion,world,flag,lookahead)=>{const r=record(31,motion,world),out=new Uint8Array(b.subarray(0xc000,0xc010));fs(r,[flag,lookahead]);r.set(m.bytes(motion,92),32);r.set(out,128);mutate(31);return out;}},b.readUInt32LE(0x1f12c));
  else result=c.mode===3?filterOriginalFishNeighbor(base+0xb000n,s):filterOriginalFishFlock(base+0xb000n,s);
 }}catch(e){if(e instanceof NativeObjectFoundationFailure){status=1;line=e.line;severity=e.severity;const r=record(30,line,severity);r.write(e.expression,24);r.write(e.file,104);}else throw e;}
 if(mathAt!==math.length)throw new Error('Fish AI unused math '+[c.label,mathAt,math.length]);
 const h=Buffer.alloc(20);[status,line,severity,rows.length,result].forEach((n,i)=>h.writeUInt32LE(n,i*4));return Buffer.concat([h,b,...rows]);
}
