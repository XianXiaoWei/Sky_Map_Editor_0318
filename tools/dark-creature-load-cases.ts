import {loadOriginalDarkCreature,type DarkCreatureLoadServices,type DarkCreatureTextureRef,DARK_CREATURE_BONES} from '../src/core/dark-creature-load-runtime';
import type {ModelBakeMemory} from '../src/core/model-baked-runtime';import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';import {numericFloatBits as bits} from '../src/core/object-numeric-runtime';
const base=0x440000000n;
const textures=['Noise3Ch','AvatarMaskBasicTex','AttribSimpleGlow','UpNormal','White'],uniforms=['u_diffuse1Tex','u_diffuse2Tex','u_lightTex','u_normTex','u_diffuse1TexScale','u_normTexScale','u_texture','u_diffuseColor','u_uvScroll','u_uvOffset'];
export interface DarkCreatureLoadCase {label:string;index?:number;scale?:number[];matrix?:number[];missing?:number;unobserved?:number;animation?:boolean;missingBones?:number;oldBones?:boolean;dormant?:number;networked?:number;rails?:boolean[];random?:number;phase?:number;}
export function darkCreatureLoadCases(){
 const out:DarkCreatureLoadCase[]=[];const add=(label:string,c:Omit<DarkCreatureLoadCase,'label'>)=>out.push({label,...c});
 for(const missing of [0,1,2,4,8,16,31])for(const unobserved of [0,2,31])for(const animation of [false,true])add('resources '+[missing,unobserved,animation],{missing,unobserved,animation});
 for(const missingBones of [0,1,4,16,31])for(const oldBones of [false,true])add('bone owner '+[missingBones,oldBones],{missingBones,oldBones});
 for(const scale of [[1,1,1],[2,3,4],[0,0,0],[1e-6,1,2],[-2,3,4],[.01,4,.5]])for(const animation of [false,true])add('scale '+[scale,animation],{scale,animation,matrix:[2,0,0,0,0,3,0,0,0,0,4,0,7,-8,9,1]});
 for(const dormant of [0,1,7])for(const networked of [0,1,4])add('saved state '+[dormant,networked],{dormant,networked});
 for(const rails of [[false,true],[true,false],[false,false],[true,true]])add('late rail assertion '+rails,{rails,oldBones:true});
 for(const random of [0,0x12345678,0x7fffffff])for(const index of [0,13,0xffffffff])add('random/index '+[random,index],{random,index});
 return out;
}
export function prepareDarkCreatureLoad(c:DarkCreatureLoadCase){
 const b=Buffer.alloc(0x60000),at=(p:bigint)=>Number(p-base);
 const m:ModelBakeMemory={bytes:(p,n)=>b.subarray(at(p),at(p)+n),read32:p=>b.readUInt32LE(at(p)),read64:p=>b.readBigUInt64LE(at(p)),write32:(p,n)=>b.writeUInt32LE(n>>>0,at(p)),write64:(p,n)=>b.writeBigUInt64LE(n,at(p)),write8:(p,n)=>{b[at(p)]=n;},string:()=>{throw new Error('DarkCreature Load has no caller string access');}};
 const p=base+0x4000n;m.write64(p+0x50n,base+0x5000n);m.write8(base+0x5004n,c.dormant??0);m.write8(base+0x5006n,c.networked??1);m.write64(base+0x5010n,c.rails?.[0]===false?0n:base+0x6000n);m.write64(base+0x5018n,c.rails?.[1]===false?0n:base+0x6100n);
 (c.matrix??[1,0,0,0,0,1,0,0,0,0,1,0,2,-3,4,1]).forEach((n,i)=>b.writeFloatLE(n,0x4010+i*4));
 (c.scale??[2,3,4]).concat(0).forEach((n,i)=>b.writeFloatLE(n,0x30000+i*4));[7,8,9,1].forEach((n,i)=>b.writeFloatLE(n,0x30020+i*4));[.1,.2,.3,.4].forEach((n,i)=>b.writeFloatLE(n,0x30040+i*4));
 m.write64(base+0x10068n,c.animation===false?0n:base+0x10800n);m.write64(base+0x5e208n,base+0x5e300n);
 for(let i=0;i<5;i++){m.write64(base+0x15010n+BigInt(i)*0x100n,base+0x16000n+BigInt(i)*0x100n);if(c.oldBones)m.write64(p+0x208n+BigInt(i*8),base+0x17400n+BigInt(i)*0x100n);}
 [c.index??7,c.random??0x12345678,c.missing??0,c.unobserved??0,c.phase??0x12345678,Number(c.animation!==false),c.missingBones??0].forEach((n,i)=>b.writeUInt32LE(n>>>0,0x5f000+i*4));
 return {b,m};
}
export function evaluateDarkCreatureLoad(c:DarkCreatureLoadCase){
 const {b,m}=prepareDarkCreatureLoad(c),calls:Buffer[]=[];let refs=0,models=0,winds=0;
 const record=(kind:number,args:(number|bigint)[]=[])=>{const row=Buffer.alloc(256);row.writeBigUInt64LE(BigInt(kind));args.forEach((n,i)=>row.writeBigUInt64LE(BigInt(n),8+i*8));calls.push(row);return row;};
 const refIndexes=new Map<DarkCreatureTextureRef,number>();
 const s:DarkCreatureLoadServices={matrixScale:matrix=>{record(1).set(matrix,32);return b.subarray(0x30000,0x30010);},switchRail:(p,n)=>{record(2,[p,n]);},random:()=>{const n=b.readUInt32LE(0x5f004);record(3,[n]);return n;},allocateOptions:()=>new Uint8Array(96),
  createModel:(owner,name,shader,matrix,options)=>{const row=record(4,[owner]);row.write(name,32);row.write(shader,64);row.set(matrix,96);row.set(options,160);for(let i=0;i<96;i++){const used=i<22||i>=24&&i<33||i>=36&&i<51||i>=52&&i<56||i>=64&&i<73||i>=76&&i<90;if(!used)row[160+i]=0;}return base+0x10000n+BigInt(models++)*0x1000n;},
  createTextureRef:()=>{record(5,[refs]);const ref={handle:0n};refIndexes.set(ref,refs++);return ref;},textureType:()=>{record(6);return base+0x5e200n;},lookupTexture:(owner,type,name)=>{const i=textures.indexOf(name);record(7,[owner,type,i]);return ((c.missing??0)&(1<<i))?0n:base+0x15000n+BigInt(i)*0x100n;},observeTexture:(resource,ref)=>{const i=refIndexes.get(ref)!;record(8,[resource,i]);ref.handle=((c.unobserved??0)&(1<<i))?0n:resource;},requestTexture:(owner,type,name)=>{record(9,[owner,type,textures.indexOf(name)]);},destroyTextureRef:ref=>{record(24,[refIndexes.get(ref)!,ref.handle]);},
  setTexture:(model,name,texture)=>{record(10,[model,uniforms.indexOf(name),texture]);},setFloat:(model,name,n)=>{record(11,[model,uniforms.indexOf(name),n]);},setVector:(model,name,data,kind)=>{record(25,[model,uniforms.indexOf(name),Number(kind==='vector')]).set(data,32);},setModelEnabled:(model,n)=>{record(12,[model,n]);},playDefault:animation=>{record(13,[animation]);},boneTransform:(animation,name)=>{const i=DARK_CREATURE_BONES.indexOf(name as typeof DARK_CREATURE_BONES[number]);record(14,[animation,i]);return ((c.missingBones??0)&(1<<i))?0n:base+0x17000n+BigInt(i)*0x100n;},whiteColor:b.subarray(0x30040,0x30050),
  windType:()=>{record(15);return base+0x5e400n;},lookupWind:(owner,type)=>{record(16,[owner,type]);return base+0x5e600n;},windObjectType:()=>{record(17);return base+0x5e500n;},createWind:(type,ref,obj)=>{record(18,[type,ref,obj]);return base+0x18000n+BigInt(winds++)*0x100n;},commitWind:wind=>{record(19,[wind]);},createMarker:(owner,mode)=>{record(20,[owner,mode]);return base+0x19000n;},setMarkerTransform:(marker,matrix)=>{record(21,[marker]).set(matrix,32);},activateMarker:(owner,marker,n)=>{record(22,[owner,marker,n]);},worldPosition:p=>{record(23,[p]);return b.subarray(0x30020,0x30030);},globalPhase:b.readUInt32LE(0x5f010)
 };
 let line=0;try{loadOriginalDarkCreature(m,base+0x4000n,{index:c.index??7,modelOwner:base+0x2000n,windOwner:base+0x2100n,markerOwner:base+0x2200n,sceneOwner:base+0x2300n,resourceOwner:base+0x3000n},s);}catch(e){if(!(e instanceof NativeObjectFoundationFailure))throw e;line=e.line;}
 b.writeUInt32LE(line,0x5f100);b.fill(0,0x5e000,0x5e100);b.fill(0,0x5e400,0x5e408);const count=Buffer.alloc(4);count.writeUInt32LE(calls.length);return Buffer.concat([b,count,...calls]);
}
