import {applyOriginalDarkstoneState,consumeOriginalDarkstone,updateOriginalDarkstoneBurnShape,setOriginalDarkstoneHealth,setOriginalDarkstoneNetworkHealth,originalDarkstoneKillable,updateOriginalSoulTrap,originalSoulTrapBurnt} from '../src/core/darkstone-state-runtime';
import {prepareDarkstoneHierarchy,hierarchyBase as base} from './darkstone-hierarchy-cases';
import {numericFloatBits as bits} from '../src/core/object-numeric-runtime';
export interface DarkstoneStateCase {
 label:string;mode:number;seed?:number;health?:number;healthBits?:number;display?:number;delta?:number;heat?:number;level?:number;requiredLevel?:number;
 visibility?:number;speed?:number;owner?:boolean;enabled?:number;parent?:boolean;parentVisibility?:number;rootKillable?:boolean;darkShader?:boolean;
 children?:number[];childVisibility?:number[];childIds?:number[];members?:number;first?:boolean;flags?:number[];events?:boolean[];mutation?:number;scale?:number[];frames?:number;
}
export function darkstoneStateCases(){
 const out:DarkstoneStateCase[]=[];
 const add=(label:string,c:Omit<DarkstoneStateCase,'label'>)=>out.push({label,...c});
 for(const owner of [false,true])for(const enabled of [0,1])for(const visibility of [0,.25,1])for(const parent of [false,true])for(const parentVisibility of [.2,1])for(const rootKillable of [false,true])add('state owner/visibility '+[owner,enabled,visibility,parent,parentVisibility,rootKillable],{mode:0,owner,enabled,visibility,parent,parentVisibility,rootKillable});
 for(const healthBits of [0,0x80000000,bits(.0075),bits(.0125),bits(.5),bits(1),bits(2),0x7f800000,0xff800000,0x7fc12345])for(const mode of [0,3,4])add('health bits '+mode+'/'+healthBits,{mode,healthBits,visibility:1});
 for(const delta of [0,1e-6,1/120,1/60,.25,2])for(const display of [.0075,.2,1])add('display delta '+delta+'/'+display,{mode:0,delta,display,health:.0075,visibility:1});
 for(const childVisibility of [[],[0],[1],[0,1],[0,.01,0]])for(const visibility of [.01,.5,1])add('disabled children '+childVisibility+'/'+visibility,{mode:0,owner:true,enabled:0,childVisibility,children:childVisibility.map(()=>1),visibility});
 for(const mutation of [1,2])add('callback mutation '+mutation,{mode:0,mutation,visibility:.1,owner:true,enabled:1,darkShader:true});
 for(const scale of [[0,0,0],[.25,3,8],[2,.7,1.2]])add('state original axes '+scale,{mode:0,scale,visibility:.25,rootKillable:false,darkShader:true});
 for(const visibility of [0,.95,1])add('three consecutive native state frames '+visibility,{mode:0,visibility,health:.0075,frames:3,delta:.25,rootKillable:false});
 for(const heat of [0,.001,.4,1,-.1])for(const level of [0,2,0xffffffff])for(const delta of [0,1/60,2])add('consume heat/level '+[heat,level,delta],{mode:1,heat,level,requiredLevel:2,delta,health:.5});
 for(const display of [.0075,.0125,.1,.5,.9,1])for(const parent of [false,true])for(const rootKillable of [false,true])add('shape '+[display,parent,rootKillable],{mode:2,display,parent,rootKillable,scale:[2,.7,1.2]});
 for(const children of [[],[0],[.0075],[.0125],[.013],[1],[0,1],[1,0]])for(const rootKillable of [false,true])add('killability '+children+'/'+rootKillable,{mode:5,children,rootKillable});
 add('invalid child ids are skipped',{mode:5,children:[1],childIds:[0xffffffff],rootKillable:true});
 for(const members of [0,1,2,15,16,17,32])for(const mode of [6,7])for(const burnt of [false,true])add('SoulTrap count '+[mode,members,burnt],{mode,members,children:Array(members).fill(burnt?.0075:1)});
 for(const first of [false,true])for(const flags of [[0,0],[1,0],[0,1],[1,1]])for(const events of [[false,false],[false,true],[true,false],[true,true]])add('SoulTrap edge '+[first,flags,events],{mode:6,first,flags,events,members:1,children:[.0075]});
 add('SoulTrap callback enables second flag',{mode:6,members:1,children:[.0075],mutation:3});
 return out;
}
export function prepareDarkstoneState(c:DarkstoneStateCase){
 const {b,m}=prepareDarkstoneHierarchy({label:c.label,seed:c.seed??37,geometry:[]});const p=base+0x4000n,barn=base+0x10000n;
 b.fill(0,0x5e000,0x5e200);m.write64(p,base+0x5e000n);m.write64(base+0x50000n,base+0x5e000n);m.write64(base+0x51000n,base+0x5e000n);
 m.write64(p+16n,c.owner?base+0x1000n:0n);m.write64(p+24n,barn);m.write64(p+40n,base+0x50000n);m.write32(p+32n,7);
 m.write8(p+0x30n,Number(c.darkShader??true));m.write8(p+0xdcn,Number(c.rootKillable??true));m.write8(base+0x1038n,c.enabled??1);
 [c.healthBits??bits(c.health??.5),bits(c.display??1),bits(c.display??1)].forEach((v,i)=>m.write32(p+0xd0n+BigInt(i*4),v));
 b.writeFloatLE(c.visibility??1,0x4190);b.writeFloatLE(c.speed??.25,0x4194);b.writeFloatLE(1.5,0x4184);m.write32(p+0x140n,c.requiredLevel??0);
 b.writeFloatLE(c.parentVisibility??1,0x4990);
 const children=c.children??[];m.write32(p+0x104n,children.length);m.write32(barn+0x1b220n,children.length);
 children.forEach((n,i)=>{const child=barn+0x1220n+BigInt(i)*0x1a0n;m.write32(p+0xe4n+BigInt(i*4),c.childIds?.[i]??i);m.write32(child+0xd0n,bits(n));m.write32(child+0x190n,bits(c.childVisibility?.[i]??0));});
 m.write64(base+0x1008n,base+0x1800n);m.write32(base+0x1810n,c.members??children.length);m.write64(base+0x1040n,c.first===false?0n:barn+0x1220n);
 m.write64(base+0x1010n,c.events?.[0]===false?0n:base+0x55000n);m.write64(base+0x1018n,c.events?.[1]===false?0n:base+0x55100n);m.write8(base+0x103an,c.flags?.[0]??0);m.write8(base+0x1039n,c.flags?.[1]??0);
 const angle=.35,cos=Math.cos(angle),sin=Math.sin(angle),axis=[cos,0,-sin,0,0,1,0,0,sin,0,cos,0],matrix=[...axis,2,-3,5,1],obb=[1,0,0,0,0,2,0,0,0,0,3,0,.2,.4,-.1,1];
 [...matrix,...obb].forEach((v,i)=>b.writeFloatLE(v,0x30000+i*4));axis.forEach((v,i)=>b.writeFloatLE(v,0x4040+i*4));(c.scale??[2,3,4]).concat(0).forEach((v,i)=>b.writeFloatLE(v,0x4070+i*4));
 [.001,.001,.001,.003].forEach((v,i)=>{b.writeFloatLE(v,0x4150+i*4);b.writeFloatLE(v,0x5e200+i*4);});
 [c.healthBits??bits(c.health??.5),bits(c.delta??1/60),bits(c.heat??0),c.level??0,Number(c.parent??false),c.mode,c.frames??1].forEach((v,i)=>b.writeUInt32LE(v>>>0,0x5f000+i*4));m.write32(base+0x5f030n,c.mutation??0);return {b,m};
}
export function evaluateDarkstoneState(c:DarkstoneStateCase,mathTrace:readonly Buffer[]=[]){
 const {b,m}=prepareDarkstoneState(c),p=base+0x4000n,calls:Buffer[]=[];
 const record=(kind:number,object:bigint,name?:string,data?:Uint8Array|number)=>{const row=Buffer.alloc(96);row.writeBigUInt64LE(BigInt(kind));row.writeBigUInt64LE(object,8);if(name)row.write(name,16);if(typeof data==='number')row.writeUInt32LE(data>>>0,48);else if(data)row.set(data,kind===4?16:48);calls.push(row);};
 const expf=(arg:number)=>{const native=mathTrace[calls.length];if(!native||native.readBigUInt64LE()!==3n||native.readUInt32LE(48)!==arg)throw new Error('Darkstone state expf call differs: '+c.label);calls.push(native);return native.readUInt32LE(52);};
 const services={expf,transform:(mesh:bigint)=>{record(1,mesh);return Uint8Array.from(b.subarray(0x30000,0x30040));},localObb:(stone:bigint)=>{record(2,stone);return Uint8Array.from(b.subarray(0x30040,0x30080));},setTransform:(mesh:bigint,matrix:Uint8Array)=>{record(4,mesh,undefined,matrix);if(c.mutation===1)m.write64(p+40n,base+0x51000n);},setEnabled:(mesh:bigint,n:number)=>{record(5,mesh,undefined,n);if(c.mutation===2)m.write8(base+0x1038n,m.bytes(base+0x1038n,1)[0]^1);},setVector:(mesh:bigint,name:string,color:Uint8Array)=>record(6,mesh,name,color),diffuseColor:b.subarray(0x5e200,0x5e210),matrixArithmetic:{calculate:(op:string,x:number,y?:number)=>{const v=op==='sqrt'?Math.sqrt(x):op==='add'?x+y!:op==='subtract'?x-y!:op==='multiply'?x*y!:x/y!;return Math.fround(v);}}};
 const health=m.read32(base+0x5f000n),delta=m.read32(base+0x5f004n),parent=c.parent?base+0x4800n:0n;let result=0;
 switch(c.mode){
  case 0:for(let i=0;i<(c.frames??1);i++)applyOriginalDarkstoneState(m,p,parent,health,delta,services);break;
  case 1:consumeOriginalDarkstone(m,p,m.read32(base+0x5f008n),m.read32(base+0x5f00cn),delta);break;
  case 2:updateOriginalDarkstoneBurnShape(m,p,parent);break;
  case 3:setOriginalDarkstoneHealth(m,p,health);break;
  case 4:setOriginalDarkstoneNetworkHealth(m,p,base+0x28000n,health);break;
  case 5:result=Number(originalDarkstoneKillable(m,p));break;
  case 6:updateOriginalSoulTrap(m,base+0x1000n,(event,n)=>{record(7,event,undefined,n);if(c.mutation===3)m.write8(base+0x1039n,1);});break;
  case 7:result=Number(originalSoulTrapBurnt(m,base+0x1000n));break;
 }
 m.write32(base+0x5f040n,result);b.fill(0,0x5e000,0x5e200);const count=Buffer.alloc(4);count.writeUInt32LE(calls.length);return Buffer.concat([b,count,...calls]);
}
