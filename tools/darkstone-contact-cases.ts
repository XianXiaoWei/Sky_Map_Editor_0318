import {updateOriginalDarkstoneContact} from '../src/core/darkstone-contact-runtime';
import type {ModelBakeMemory} from '../src/core/model-baked-runtime';
import {numericFloatBits as bits} from '../src/core/object-numeric-runtime';
export const contactBase=0x440000000n;
export interface ContactAvatar {position?:number[];flamePosition?:number[];level?:number;enabled?:number;gate?:number;gateBits?:number;radius?:number;radiusBits?:number;growth?:number;local?:boolean;uiFlag?:number;uiValue?:number;}
export interface DarkstoneContactCase {label:string;avatars:ContactAvatar[];scale?:number[];health?:number;display?:number;required?:number;delta?:number;fast?:boolean;obb?:number[];hint?:boolean;timer?:number;}
export function darkstoneContactCases(){
 const out:DarkstoneContactCase[]=[];
 const add=(label:string,c:Omit<DarkstoneContactCase,'label'>)=>out.push({label,...c});
 const defaults={position:[0,0,0],flamePosition:[0,0,0],level:1};
 add('no Avatar',{avatars:[]});
 for(const required of [0,1,2,3,6])for(const level of [-3,0,1,2,7])for(const fast of [false,true])add('levels '+[required,level,fast],{avatars:[{...defaults,level}],required,fast});
 for(const enabled of [0,1])for(const gate of [-1,-.98,-.5,0,NaN])add('Flame eligibility '+[enabled,gate],{avatars:[{...defaults,enabled,gate:Number.isNaN(gate)?undefined:gate,gateBits:Number.isNaN(gate)?0x7fc00000:undefined}]});
 for(const x of [.2,1,2.3,2.4,3.2,25,26])for(const flameX of [0,1.3,2])add('Avatar / Flame surface '+[x,flameX],{avatars:[{...defaults,position:[x,0,0],flamePosition:[flameX,0,0]}]});
 for(const radius of [0,.01,.2,2,NaN])for(const growth of [0,2,-4])add('radius growth '+[radius,growth],{avatars:[{...defaults,radius:Number.isNaN(radius)?undefined:radius,radiusBits:Number.isNaN(radius)?0x7fc00000:undefined,growth}]});
 for(const scale of [[0,0,0],[.1,.1,.1],[1,2,3],[8,.2,11]])for(const required of [0,3])add('volume '+[scale,required],{avatars:[defaults],scale,required});
 for(const count of [1,2,4,5,8])add('multi Avatar '+count,{avatars:Array.from({length:count},(_,i)=>({...defaults,level:i+1,local:i===0,uiFlag:i%2,uiValue:3})),required:1});
 for(const hint of [false,true])for(const display of [.1,.5,1])add('local unavailable hint '+[hint,display],{avatars:[{...defaults,level:2,local:true}],required:3,display,hint});
 for(const obb of [[0,0,0,0,0,0,0,0,0,0,0,0,.2,.4,.6,1],[0,1,0,0,-2,0,0,0,0,0,3,0,.2,.4,.6,1],[1e-7,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]])add('rotated / degenerate OBB '+obb,{avatars:[{...defaults,flamePosition:[.4,.4,.4]}],obb});
 for(const health of [.0075,.0125,.1,1])for(const delta of [0,1/60,2])add('consumption '+[health,delta],{avatars:[defaults],health,delta});
 return out;
}
export function prepareDarkstoneContact(c:DarkstoneContactCase){
 const b=Buffer.alloc(0x60000),at=(p:bigint)=>Number(p-contactBase);
 const m:ModelBakeMemory={bytes:(p,n)=>b.subarray(at(p),at(p)+n),read32:p=>b.readUInt32LE(at(p)),read64:p=>b.readBigUInt64LE(at(p)),write32:(p,n)=>b.writeUInt32LE(n>>>0,at(p)),write64:(p,n)=>b.writeBigUInt64LE(n,at(p)),write8:(p,n)=>{b[at(p)]=n;},string:p=>b.subarray(at(p),b.indexOf(0,at(p))).toString()};
 const p=contactBase+0x4000n;
 (c.obb??[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]).forEach((n,i)=>b.writeFloatLE(n,0x4080+i*4));
 (c.scale??[1,1,1]).concat(0).forEach((n,i)=>b.writeFloatLE(n,0x40c0+i*4));
 b.writeFloatLE(c.health??1,0x40d0);b.writeFloatLE(c.display??.5,0x40d4);b.writeFloatLE(1.5,0x4184);m.write32(p+0x140n,c.required??0);
 if(c.hint)m.write64(p+0x178n,contactBase+0x58000n);
 const avatars=c.avatars.map((row,i)=>{
  const avatar=contactBase+0x10000n+BigInt(i)*0x2800n,components=avatar+0x2000n,flame=avatar+0x2400n;
  m.write64(avatar+24n,components);m.write64(avatar+0xa0n,avatar+0x1200n);m.write64(avatar+0x30n,components+0x40n);m.write64(avatar+0xa8n,components+0x80n);m.write64(components+0x290n,components+0x300n);m.write64(components+0x300n,flame);m.write64(avatar+0x38n,components+0x400n);
  m.write32(avatar+0x1c20n,row.level??1);m.write32(components+0x48n,row.gateBits??bits(row.gate??0));m.write8(avatar+0x1ef8n,Number(row.local??false));
  m.write8(components+0x7f4n,row.uiFlag??0);m.write32(components+0x7f0n,bits(row.uiValue??0));
  m.write64(flame,contactBase+0x5e000n);m.write8(flame+0x148n,row.enabled??1);m.write32(flame+0x108n,row.radiusBits??bits(row.radius??.2));m.write32(flame+0x10cn,bits(row.growth??0));
  (row.position??[0,0,0]).concat(1).forEach((n,j)=>m.write32(components+16n+BigInt(j*4),bits(n)));
  (row.flamePosition??[0,0,0]).concat(1).forEach((n,j)=>m.write32(flame+0xc0n+BigInt(j*4),bits(n)));
  m.write64(contactBase+0x7000n+BigInt(i*8),avatar);return avatar;
 });
 b.writeUInt32LE(avatars.length,0x5f000);b.writeFloatLE(c.delta??1/60,0x5f004);b.writeUInt32LE(Number(c.fast??false),0x5f008);b.writeFloatLE(c.timer??.2,0x5f00c);m.write64(contactBase+0x5f010n,avatars[0]??0n);
 return {b,m,avatars};
}
export function evaluateDarkstoneContact(c:DarkstoneContactCase){
 const {b,m,avatars}=prepareDarkstoneContact(c),calls:Buffer[]=[];
 const record=(kind:number,p:bigint)=>{const row=Buffer.alloc(96);row.writeBigUInt64LE(BigInt(kind));row.writeBigUInt64LE(p,8);calls.push(row);return row;};
 const result=updateOriginalDarkstoneContact(m,contactBase+0x4000n,{avatars,localAvatar:avatars[0]??0n,game:contactBase+0x8000n,deltaBits:m.read32(contactBase+0x5f004n),fastBurn:c.fast??false,timerBits:m.read32(contactBase+0x5f00cn)},{
  selectFlame:owner=>{record(1,owner);return m.read64(owner);},flameEnabled:flame=>{record(2,flame);return m.bytes(flame+0x148n,1)[0];},
  createLevelHint:()=>{record(3,0n);const row=record(4,contactBase+0x9000n);row.writeBigUInt64LE(contactBase+0x59000n,16);b.fill(0,0x58000,0x58100);b.write('no_darkstone_level_00',0x58049);b[0x58048]=0x2a;b.writeUInt32LE(0x5f5e0ff,0x58088);record(5,contactBase+0x58000n);return contactBase+0x58000n;}
 });
 [result.heatBits,result.level,result.nearCount,result.nearLevel,result.distanceBits,Number(result.localNear),Number(result.positiveHeat),result.particles.length,result.timerBits].forEach((v,i)=>b.writeUInt32LE(v>>>0,0x5f100+i*4));
 result.particles.forEach((row,i)=>{row.point.concat(row.direction).forEach((v,j)=>b.writeUInt32LE(v>>>0,0x5f130+i*48+j*4));b.writeUInt32LE(row.count,0x5f150+i*48);});
 b.fill(0,0x5e000,0x5e100);const count=Buffer.alloc(4);count.writeUInt32LE(calls.length);return Buffer.concat([b,count,...calls]);
}
