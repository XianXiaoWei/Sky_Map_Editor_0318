import {updateOriginalDarkstoneDiffuse,originalDarkstoneDiffuseColors,type DarkstoneDiffuseInput,type DarkstoneDiffuseColors} from '../src/core/darkstone-diffuse-runtime';
import {prepareDarkstoneHierarchy,hierarchyBase as base} from './darkstone-hierarchy-cases';
export interface DarkstoneDiffuseCase {label:string;seed:number;input:DarkstoneDiffuseInput;previous?:number[];colors?:DarkstoneDiffuseColors;}
const defaults:DarkstoneDiffuseInput={eligible:true,childScales:[],rootKillable:true,requiredLevel:2,availableLevel:2,pulseLevel:2,collectible:false,collectibleAvailable:false,rewardAllowed:true,specialOwner:false,rewardCount:1,heat:0,time:.125,delta:1/60};
export function darkstoneDiffuseCases(){
 const out:DarkstoneDiffuseCase[]=[];
 const add=(label:string,input:Partial<DarkstoneDiffuseInput>,extra:Partial<DarkstoneDiffuseCase>={})=>out.push({label,seed:37,input:{...defaults,...input},...extra});
 for(const eligible of [false,true])for(const rootKillable of [false,true])for(const availableLevel of [0,2,3,0xffffffff])for(const childScales of [[],[0],[1e-5],[.1],[0,.1]])add('hierarchy/level '+[eligible,rootKillable,availableLevel,childScales],{eligible,rootKillable,availableLevel,childScales});
 for(const collectible of [false,true])for(const collectibleAvailable of [false,true])for(const rewardAllowed of [false,true])for(const specialOwner of [false,true])for(const rewardCount of [0,1,0xffffffff])add('rewards '+[collectible,collectibleAvailable,rewardAllowed,specialOwner,rewardCount],{collectible,collectibleAvailable,rewardAllowed,specialOwner,rewardCount});
 for(const heat of [0,1e-6,1e-5,Math.fround(1e-5),1.000001e-5,.5,1])for(const pulseLevel of [0,2,0xffffffff])for(const time of [0,.125,4.7])add('pulse '+[heat,pulseLevel,time],{heat,pulseLevel,time});
 for(const delta of [0,1e-45,1e-6,1/120,.25,2])add('smoothing '+delta,{delta,heat:.5},{previous:[.7,.01,.3,.15]});
 for(let i=0;i<24;i++)add('nondefault globals '+i,{heat:i%3===0?.03:0,availableLevel:i%4,delta:.013*i},{colors:{diffuse:[.03,.07,.11,.15],blocked:[.9,.2,.3,.4],dynamic:[.2,.6,.8,1],pulseLow:[.02,.04,.06,.08],pulseHigh:[.8,.6,.4,.2]},previous:[.13,.27,.39,.51]});
 return out;
}
export function prepareDarkstoneDiffuse(c:DarkstoneDiffuseCase){
 const {b,m}=prepareDarkstoneHierarchy({label:c.label,seed:c.seed,geometry:[]}),p=base+0x4000n,barn=base+0x2000n,input=c.input;
 m.write64(p+0x18n,barn);m.write64(p+0x28n,base+0x50000n);m.write64(p+0x170n,input.collectible?base+0x1000n:0n);
 m.write8(p+0xdcn,Number(input.rootKillable));m.write32(p+0x140n,input.requiredLevel);m.write32(p+0x188n,input.rewardCount);
 m.write32(p+0x104n,input.childScales.length);m.write32(barn+0x1b220n,input.childScales.length);
 input.childScales.forEach((v,i)=>{m.write32(p+0xe4n+BigInt(i)*4n,i);b.writeFloatLE(v,0x2000+0x1220+i*0x1a0+0xd0);});
 const colors=c.colors??originalDarkstoneDiffuseColors;
 [colors.diffuse,colors.blocked,colors.dynamic,colors.pulseLow,colors.pulseHigh].flat().forEach((v,i)=>b.writeFloatLE(v,0x5e200+i*4));
 (c.previous??colors.diffuse).forEach((v,i)=>b.writeFloatLE(v,0x4150+i*4));
 [input.eligible,input.availableLevel,input.pulseLevel,input.collectibleAvailable,input.rewardAllowed,input.specialOwner].forEach((v,i)=>b.writeUInt32LE(Number(v)>>>0,0x5f000+i*4));
 [input.heat,input.time,input.delta].forEach((v,i)=>b.writeFloatLE(v,0x5f018+i*4));return {b,m};
}
export function evaluateDarkstoneDiffuse(c:DarkstoneDiffuseCase,mathTrace:readonly Buffer[]){
 const {b}=prepareDarkstoneDiffuse(c),calls:Buffer[]=[];
 const math=(kind:number,n:number)=>{
  const native=mathTrace[calls.length];if(!native||Number(native.readBigUInt64LE())!==kind)throw new Error('Native libm call order differs');
  const arg=Buffer.alloc(4);arg.writeFloatLE(n);if(!arg.equals(native.subarray(48,52)))throw new Error('Native libm argument differs: '+n+' / '+native.readFloatLE(48));
  calls.push(native);return native.readFloatLE(52);
 };
 const previous=Array.from({length:4},(_,i)=>b.readFloatLE(0x4150+i*4));
 const color=updateOriginalDarkstoneDiffuse(previous,c.input,c.colors??originalDarkstoneDiffuseColors,{sinf:n=>math(1,n),expf:n=>math(2,n)});
 color.forEach((v,i)=>b.writeFloatLE(v,0x4150+i*4));
 const row=Buffer.alloc(96);row.writeBigUInt64LE(3n);row.writeBigUInt64LE(base+0x50000n,8);row.write('u_diffuseColor',16);row.set(b.subarray(0x4150,0x4160),48);calls.push(row);
 const count=Buffer.alloc(4);count.writeUInt32LE(calls.length);return Buffer.concat([b,count,...calls]);
}
