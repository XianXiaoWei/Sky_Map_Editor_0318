import {beginOriginalCreatureSteering,endOriginalCreatureSteering,seekOriginalCreatureSteering} from '../src/core/creature-steering-runtime';
import {numericFloatBits as bits} from '../src/core/object-numeric-runtime';
import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
export const STEERING_ARENA_BYTES=0x10000,STEERING_TRACE_BYTES=1024;
export interface SteeringCase{mode:number;seed:number;position?:number[];target?:number[];velocity?:number[];force?:number[];maximum?:number;weight?:number;weightW?:number;arrival?:number;delta?:number;avoid?:number;active?:number;motionAlias?:number;targetAlias?:number;outAlias?:number;repeat?:number;label?:string;}
const BASE=0x440000000n;
export function prepareSteering(c:SteeringCase){
 const b=Buffer.alloc(STEERING_ARENA_BYTES);let seed=c.seed>>>0;for(let i=0;i<b.length;i++){seed=(Math.imul(seed,1664525)+1013904223)>>>0;b[i]=seed>>>24;}
 const vector=(at:number,v:number[])=>{for(let i=0;i<4;i++)b.writeFloatLE(v[i]??0,at+i*4);};
 const position=c.position??[0,0,0,0],velocity=c.velocity??[0,0,0,0];vector(0x2000,position);vector(0x2040,velocity);b.writeFloatLE(2,0x2050);b.writeFloatLE(3,0x2054);
 vector(0x1000,c.force??[3,4,0,0]);vector(0x1020,position);vector(0x1060,velocity);b.writeFloatLE(3,0x1074);b.writeFloatLE(c.delta??.016,0x1080);b.writeFloatLE(c.maximum??2,0x1084);b[0x1010]=c.active??1;b.writeBigUInt64LE(BASE+0x5000n,0x11e0);
 vector(0x3000,c.target??[10,0,0,0]);vector(0x6000,[.25,-.5,.75,0]);
 const config=[c.weight??1,c.arrival??1,c.delta??.016,c.maximum??2,c.weightW??0];config.forEach((n,i)=>b.writeFloatLE(n,0x7000+i*4));
 const ints=[c.avoid??0,c.motionAlias??0,c.targetAlias??0,c.outAlias??0,c.repeat??1];ints.forEach((n,i)=>b.writeInt32LE(n,0x7020+i*4));
 b[0x7040]=Number(c.motionAlias===0);b[0x7041]=Number(c.targetAlias===0);b[0x7042]=Number(c.outAlias===0);
 const at=(p:bigint,n:number)=>{const ix=Number(p-BASE);if(!Number.isSafeInteger(ix)||ix<0||ix+n>b.length)throw new Error('Unmapped creature steering address');return ix;};
 const m={bytes:(p:bigint,n:number)=>b.subarray(at(p,n),at(p,n)+n),read32:(p:bigint)=>b.readUInt32LE(at(p,4)),read64:(p:bigint)=>b.readBigUInt64LE(at(p,8)),write8:(p:bigint,n:number)=>{b[at(p,1)]=n;},write32:(p:bigint,n:number)=>{b.writeUInt32LE(n>>>0,at(p,4));},write64:(p:bigint,n:bigint)=>{b.writeBigUInt64LE(n,at(p,8));},string:()=>''};return {b,m,base:BASE};
}
export function evaluateSteering(c:SteeringCase){
 const {b,m,base}=prepareSteering(c),trace=Buffer.alloc(STEERING_TRACE_BYTES);let used=0,line=0,severity=0;
 const state=base+0x1000n,motion=(c.motionAlias!==undefined?state+BigInt(c.motionAlias):base+0x2000n),target=(c.targetAlias!==undefined?state+BigInt(c.targetAlias):base+0x3000n),out=(c.outAlias!==undefined?state+BigInt(c.outAlias):base+0x4000n);
 const s={collision:(position:bigint,velocity:bigint,lookahead:number,world:bigint,initial:0)=>{for(const n of [1,Number(position-base),Number(velocity-base),lookahead,Number(world-base),initial]){trace.writeUInt32LE(n>>>0,used*4);used++;}return new Uint8Array(m.bytes(base+0x6000n,16));}};
 try{
  if(c.mode===0||c.mode===3)beginOriginalCreatureSteering(m,state,motion,bits(c.delta??.016),bits(c.maximum??2));
  if(c.mode===2||c.mode===3)for(let i=0;i<(c.repeat??1);i++)seekOriginalCreatureSteering(m,state,target,bits(c.weight??1),bits(c.arrival??1),undefined,bits(c.weightW??0));
  if(c.mode===1||c.mode===3)endOriginalCreatureSteering(m,out,state,c.avoid??0,s);
 }catch(e){if(!(e instanceof NativeObjectFoundationFailure))throw e;line=e.line;severity=e.severity;}
 const header=Buffer.alloc(12);header.writeUInt32LE(line);header.writeUInt32LE(severity,4);header.writeUInt32LE(used,8);return Buffer.concat([header,trace,b]);
}
export function steeringCases(){const cases:SteeringCase[]=[],add=(mode:number,rest:Omit<SteeringCase,'mode'|'seed'>={})=>cases.push({mode,seed:91+cases.length,...rest});
 for(const motionAlias of [undefined,0,16,32,-16])add(0,{motionAlias,label:'native copy order and aliases'});
 for(const maximum of [0,2,100,-2,NaN,Infinity])for(const force of [[3,4,0,0],[0,0,0,7],[NaN,0,0,0],[Infinity,0,0,0]])add(1,{maximum,force});
 for(const avoid of [0,1,2,256,257])for(const outAlias of [undefined,0,16])add(1,{avoid,outAlias});add(1,{active:0});
 for(const weight of [0,.00001,.0000101,1,-1,NaN,Infinity])for(const arrival of [0,.00001,.0000101,1,-.00001,-.0000101,-1,NaN,Infinity])add(2,{weight,arrival});
 for(const target of [[0,0,0,0],[.001,0,0,0],[.0010001,0,0,0],[0,0,0,1],[3,4,0,7],[3,-4,0,-7],[NaN,0,0,0],[Infinity,0,0,0]])add(2,{target});
 for(const targetAlias of [0,32,96])add(2,{targetAlias});add(2,{active:0});
 for(const weightW of [0,1,-1])for(const target of [[10,0,0,0],[3,4,0,7]])add(2,{weightW,target,velocity:[0,0,0,2]});
 for(const repeat of [1,2,4])for(const avoid of [0,1])add(3,{repeat,avoid});return cases;
}
