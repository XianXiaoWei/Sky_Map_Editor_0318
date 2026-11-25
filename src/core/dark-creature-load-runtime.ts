import type {ModelBakeMemory} from './model-baked-runtime';
import {natureArithmetic,type NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import evidence from '../../docs/dark-creature-load-native.json';
const c=evidence.constants,one=0x3f800000;
const floats=(ns:readonly number[])=>new Uint8Array(Float32Array.from(ns).buffer);
export const DARK_CREATURE_BONES=['M_head_Con','M_belly_Sim','M_tail4_Sim','M_tail7_Sim','M_eye'] as const;
export interface DarkCreatureTextureRef {handle:bigint;}
export interface DarkCreatureLoadServices {
 arithmetic?:NatureArithmeticServices;
 matrixScale(matrix:Uint8Array):Uint8Array;
 switchRail(creature:bigint,cooldown:number):void;random():number;
 allocateOptions():Uint8Array;
 createModel(owner:bigint,name:string,shader:string,matrix:Uint8Array,options:Uint8Array):bigint;
 createTextureRef():DarkCreatureTextureRef;textureType():bigint;
 lookupTexture(owner:bigint,type:bigint,name:string):bigint;
 observeTexture(resource:bigint,ref:DarkCreatureTextureRef):void;
 requestTexture(owner:bigint,typeName:bigint,name:string):void;
 destroyTextureRef(ref:DarkCreatureTextureRef):void;
 setTexture(model:bigint,name:string,texture:bigint):void;
 setFloat(model:bigint,name:string,valueBits:number):void;
 setVector(model:bigint,name:string,bytes:Uint8Array,kind:'color'|'vector'):void;
 setModelEnabled(model:bigint,enabled:number):void;
 playDefault(animation:bigint):void;boneTransform(animation:bigint,name:string):bigint;
 whiteColor:Uint8Array;
 windType():bigint;lookupWind(owner:bigint,type:bigint):bigint;windObjectType():bigint;
 createWind(type:bigint,ownerRef:bigint,objectType:bigint):bigint;commitWind(wind:bigint):void;
 createMarker(owner:bigint,mode:number):bigint;setMarkerTransform(marker:bigint,matrix:Uint8Array):void;activateMarker(owner:bigint,marker:bigint,enabled:number):void;
 worldPosition(transform:bigint):Uint8Array;globalPhase:number;
}
export interface DarkCreatureLoadInput {index:number;modelOwner:bigint;windOwner:bigint;markerOwner:bigint;sceneOwner:bigint;resourceOwner:bigint;}
/** Whole ordinary Load 0x10026c670. All late reads and assertions retain
 * their original position relative to resource and scene service calls. */
export function loadOriginalDarkCreature(m:ModelBakeMemory,p:bigint,input:DarkCreatureLoadInput,s:DarkCreatureLoadServices){
 const a=natureArithmetic(s.arithmetic),translation=m.bytes(p+0x40n,16).slice();m.write32(p+0x58n,input.index);m.bytes(p+0x60n,16).set(translation);m.bytes(p+0xe0n,16).set(translation);
 const scale=s.matrixScale(m.bytes(p+16n,64).slice()),v=new DataView(scale.buffer,scale.byteOffset,16),sizes=[0,4,8,12].map((i,j)=>a.mul(v.getUint32(i,true),bits(evidence.vectors.halfScale[j])));
 sizes.forEach((n,i)=>m.write32(p+0xd0n+BigInt(i*4),n));
 const axes=[0,16,32].map(i=>Uint8Array.from(m.bytes(p+16n+BigInt(i),16)));
 if(sizes.slice(0,3).every(n=>Math.abs(value(n))>c.minimumScale)){
  axes.forEach((axis,i)=>{const view=new DataView(axis.buffer,axis.byteOffset,16),factor=a.div(one,sizes[i]);for(let j=0;j<4;j++)view.setUint32(j*4,a.mul(view.getUint32(j*4,true),j===3?0:factor),true);});
 }
 axes.forEach((axis,i)=>m.bytes(p+0x70n+BigInt(i*16),16).set(axis));m.bytes(p+0xa0n,16).fill(0);
 let radius=(sizes[0]&0x7fffffff)>0x7f800000?sizes[2]:a.max(sizes[2],sizes[0]);radius=(radius&0x7fffffff)>0x7f800000?sizes[1]:a.max(sizes[1],radius);m.write32(p+0xb0n,radius);m.write64(p+0xb4n,0x3f80000040800000n);m.write32(p+0x100n,bits(4));m.write8(p+0x2c5n,0);
 s.switchRail(p,0);
 const random=a.mul(bits(s.random()|0),bits(c.randomScale));m.write32(p+0x128n,a.add(a.mul(random,bits(c.randomHigh)),a.mul(a.sub(one,random),bits(c.randomLow))));
 for(const offset of [0x2e0n,0x140n])m.write32(p+offset,0);m.write8(p+0x2c1n,0);m.write8(p+0x2c2n,0);
 const options=s.allocateOptions();if(options.length!==96)throw new Error('DarkCreature Model options require 96 caller-owned bytes');const o=new DataView(options.buffer,options.byteOffset,96);
 o.setBigUint64(0,0x700000000n,true);options[12]=0;o.setUint32(8,0,true);o.setUint16(13,1,true);o.setUint32(16,0x447a0000,true);o.setUint16(20,0,true);o.setBigUint64(24,0x3f8000003f800000n,true);options[32]=0;o.setBigUint64(36,0x3eb33333n,true);o.setUint32(44,0xc11cf5c3,true);options[48]=0;options[50]=0;o.setUint32(52,0,true);o.setBigUint64(64,0x3f8000003cf5c28fn,true);options[72]=1;o.setUint32(76,0,true);o.setUint32(80,1,true);o.setUint32(84,one,true);options[88]=0;options[89]=0;
 options[10]=0;options[49]=1;o.setUint16(40,0x101,true);options[8]=1;
 m.write64(p+0x1e0n,s.createModel(input.modelOwner,'CharDarkCreatureAnim','Mesh',m.bytes(p+16n,64).slice(),options));
 const acquire=(name:string)=>{const ref=s.createTextureRef(),type=s.textureType(),resource=s.lookupTexture(input.resourceOwner,type,name);if(resource)s.observeTexture(resource,ref);else s.requestTexture(input.resourceOwner,m.read64(s.textureType()+8n),name);return ref;};
 const noise=acquire('Noise3Ch'),mask=acquire('AvatarMaskBasicTex'),glow=acquire('AttribSimpleGlow'),normal=acquire('UpNormal');
 const texture=(ref:DarkCreatureTextureRef)=>{const resource=ref.handle?m.read64(ref.handle+16n):0n;return resource?resource+0xb0n:0n;};
 for(const [name,ref] of [['u_diffuse1Tex',mask],['u_diffuse2Tex',glow],['u_lightTex',glow],['u_normTex',normal]] as const)s.setTexture(m.read64(p+0x1e0n),name,texture(ref));
 s.setFloat(m.read64(p+0x1e0n),'u_diffuse1TexScale',one);s.setFloat(m.read64(p+0x1e0n),'u_normTexScale',0);s.setModelEnabled(m.read64(p+0x1e0n),1);
 const animation=m.read64(m.read64(p+0x1e0n)+104n);if(animation){s.playDefault(animation);DARK_CREATURE_BONES.forEach((name,i)=>m.write64(p+0x208n+BigInt(i*8),s.boneTransform(animation,name)));}
 const white=acquire('White');m.write64(p+0x1e8n,s.createModel(input.modelOwner,'SpUnitBall','UnlitColor',m.bytes(p+16n,64).slice(),options));s.setTexture(m.read64(p+0x1e8n),'u_texture',texture(white));s.setVector(m.read64(p+0x1e8n),'u_diffuseColor',s.whiteColor,'color');
 for(const name of ['u_uvScroll','u_uvOffset'])s.setVector(m.read64(p+0x1e8n),name,new Uint8Array(16),'vector');s.setModelEnabled(m.read64(p+0x1e8n),1);
 const createWind=()=>{const ref=s.lookupWind(input.windOwner,s.windType()),objectType=s.windObjectType();return s.createWind(s.windType(),ref,objectType);};
 const initializeWind=(wind:bigint,position:Uint8Array,field:bigint)=>{m.bytes(wind+16n,16).set(floats([5,0,0,0]));m.bytes(wind+32n,16).set(floats(evidence.vectors.windColor));m.bytes(wind+48n,16).set(floats(evidence.vectors.windDirection));const pos=Uint8Array.from(position);new DataView(pos.buffer,pos.byteOffset,16).setUint32(12,one,true);m.bytes(wind+64n,16).set(pos);s.commitWind(wind);m.write64(m.read64(p+field)+80n,0n);};
 const wind=createWind();m.write64(p+0x230n,wind);initializeWind(wind,m.bytes(p+0x60n,16),0x230n);
 const marker=s.createMarker(input.markerOwner,0);m.write64(p+0x1d8n,marker);m.write8(marker+64n,1);const matrix=floats([1,0,0,0,...evidence.vectors.markerAxisY,...evidence.vectors.markerAxisZ,...evidence.vectors.markerPosition]);s.setMarkerTransform(marker,matrix);s.activateMarker(input.sceneOwner,m.read64(p+0x1d8n),1);
 if(m.read64(p+0x218n)){const tailWind=createWind();m.write64(p+0x238n,tailWind);initializeWind(tailWind,s.worldPosition(m.read64(p+0x218n)),0x238n);}
 m.write8(p+0x2c7n,0);m.write32(p+0x2c8n,s.globalPhase);for(const offset of [0x2ccn,0x180n,0x1a0n])m.write32(p+offset,0);
 let params=m.read64(p+0x50n);const awake=m.bytes(params+4n,1)[0]^1;m.write8(p+0x2c3n,awake);m.write8(p+0x2c4n,awake);m.write32(p+0x12cn,m.read32(p+0x64n));m.bytes(p+0x130n,16).fill(0);m.write8(p+0x2dcn,m.bytes(params+6n,1)[0]);
 if(!m.read64(params+16n))throw new NativeObjectFoundationFailure('DarkCreature.cpp',649,3,'params->patrolRail != nullptr');
 if(!m.read64(params+24n))throw new NativeObjectFoundationFailure('DarkCreature.cpp',650,3,'params->cooldownRail != nullptr');
 for(const ref of [white,normal,glow,mask,noise])s.destroyTextureRef(ref);
}
