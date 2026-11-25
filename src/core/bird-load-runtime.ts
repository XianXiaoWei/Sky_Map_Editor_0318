import type {ModelBakeMemory} from './model-baked-runtime';import {NativeObjectFoundationFailure} from './object-foundation-runtime';import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';import {natureArithmetic} from './nature-event-runtime';
const a=natureArithmetic();
export function originalCreatureLength3(v:Uint8Array){const d=new DataView(v.buffer,v.byteOffset,v.byteLength),s=[0,1,2].map(i=>a.mul(d.getUint32(i*4,true),d.getUint32(i*4,true)));return bits(Math.sqrt(value(a.add(s[2],a.add(s[0],s[1])))));}
/** Whole mutable NormalizeColumns 0x10078a070. It returns xyz lengths while
 * writing each qualifying input column; the SSE W divisor is squared Y. */
export function normalizeOriginalCreatureBasis(m:ModelBakeMemory,p:bigint,thresholdBits:number){const columns=Array.from({length:3},(_,i)=>new Uint8Array(m.bytes(p+BigInt(i*16),16))),lengths=columns.map(originalCreatureLength3);for(let i=0;i<3;i++){if(!(value(lengths[i])>value(thresholdBits)))continue;const d=new DataView(columns[i].buffer),w=a.mul(d.getUint32(4,true),d.getUint32(4,true));for(let k=0;k<4;k++)m.write32(p+BigInt(i*16+k*4),a.div(d.getUint32(k*4,true),k===3?w:lengths[i]));}return lengths;}
export function initializeOriginalBirdMovement(m:ModelBakeMemory,p:bigint){m.bytes(p,32).fill(0);m.bytes(p+32n,16).set(new Uint8Array(Uint32Array.of(0x80000000,0x80000000,0xbf800000,0).buffer));m.write32(p+48n,0);}
export const ORIGINAL_BIRD_BONE_NAMES=['M_head_Sim','R_shoulderRoot','R_wingTip','R_wingMidA','R_wingTip1','L_shoulderRoot','L_wingTip','L_wingMidA','L_wingTip1','M_tail7_Sim'] as const;
export interface BirdLoadServices {
 transform(object:bigint):Uint8Array;
 localObb(mesh:bigint):Uint8Array;
 initializeAi(ai:bigint,bird:bigint,game:bigint):void;
 cloneModel(owner:bigint,source:bigint):bigint;
 playNamed(animation:bigint,name:'critterMove'|'critterIdle'):number;
 pause(animation:bigint,index:number):void;
 playStruggle(animation:bigint):void;
 findBone(animation:bigint,name:string):number;
 boneTransform(animation:bigint,index:number):bigint;
 createWingEffect(owner:bigint):bigint;
 worldMatrix(transform:bigint):Uint8Array;
 emitterTemplate():bigint;
 createEmitter(owner:bigint,matrix:Uint8Array,parameters:Uint8Array,template:bigint):bigint;
 createWind(owner:bigint):bigint;
 rand():number;
}
export interface BirdUnloadServices {
 releaseWingEffect(owner:bigint,effect:bigint):void;
 setModelEnabled(model:bigint,enabled:0):void;
}
/** Whole BirdV2.Unload 0x1001a20f0. Effects are released in their saved
 * order, emitters retire asynchronously, and the original Barn writes are
 * retained even when its count slot overlaps the one-past-last pointer. */
export function unloadOriginalBirdV2(m:ModelBakeMemory,p:bigint,game:bigint,s:BirdUnloadServices){
 const effects=m.read64(game+0x3f0n);
 for(const offset of [0x420n,0x428n,0x430n,0x438n]){s.releaseWingEffect(effects,m.read64(p+offset));m.write64(p+offset,0n);}
 for(const offset of [0x448n,0x450n]){const emitter=m.read64(p+offset);if(emitter)m.write8(emitter+0xb1n,1);}
 s.setModelEnabled(m.read64(p+0x3a0n),0);m.write8(p+0xd0n,0);
 const barn=m.read64(game+0x380n),count=m.read32(barn+0x210n);
 for(let i=0;i<count;i++)if(m.read64(barn+16n+BigInt(i)*8n)===p){
  const last=count-1;m.write64(barn+16n+BigInt(count)*8n,m.read64(barn+16n+BigInt(last)*8n));m.write32(barn+0x210n,last);m.write64(barn+16n+BigInt(last)*8n,0n);break;
 }
}
/** Whole BirdV2.Load 0x1001a1840. Bird and manta configurations retain their
 * actual params, model, named actions and bone availability. Model/animation,
 * effects and allocation are services; no species or action is substituted. */
export function loadOriginalBirdV2(m:ModelBakeMemory,p:bigint,game:bigint,s:BirdLoadServices){
 let params=m.read64(p+120n),region=m.read64(params+8n);m.bytes(p+16n,16).set(m.bytes(region?region+16n:p+0xc0n,16));m.bytes(p+80n,16).fill(0);m.write32(p+96n,m.read32(params+24n));m.write32(p+100n,m.read32(params+28n));m.write32(p+104n,0x3f800000);
 if(region){const matrix=s.transform(region);m.bytes(p+32n,48).set(matrix.subarray(0,48));}else m.bytes(p+32n,48).set(new Uint8Array(m.bytes(p+0x90n,48)));
 normalizeOriginalCreatureBasis(m,p+32n,0x3727c5ac);m.write64(p+0xe8n,m.read64(p+128n));s.initializeAi(p+0xe0n,p,game);initializeOriginalBirdMovement(m,p+0x360n);m.write64(p+0x3a0n,0n);
 params=m.read64(p+120n);let mesh=m.read64(params+16n);if(!mesh)throw new NativeObjectFoundationFailure('BirdV2.cpp',1545,3,'m_model');const model=s.cloneModel(m.read64(game+0x5a8n),m.read64(mesh+0x228n));m.write64(p+0x3a0n,model);
 if(m.bytes(m.read64(p+0xe8n)+136n,1)[0])m.write8(model+0x348n,0);else if(!model)throw new NativeObjectFoundationFailure('BirdV2.cpp',1545,3,'m_model');
 m.bytes(p+0x3b0n,16).set(new Uint8Array(Float32Array.of(1,1,1,0).buffer));for(let i=0;i<3;i++){mesh=m.read64(m.read64(p+120n)+16n);const obb=s.localObb(mesh),scale=originalCreatureLength3(m.bytes(p+BigInt(0x90+i*16),16));m.write32(p+BigInt(0x3b0+i*4),a.mul(originalCreatureLength3(obb.subarray(i*16,i*16+16)),scale));}
 const animation=m.read64(m.read64(p+0x3a0n)+104n);if(animation){m.write32(p+0x3c0n,s.playNamed(animation,'critterMove'));m.write32(p+0x3c4n,s.playNamed(animation,'critterIdle'));s.pause(animation,m.read32(p+0x3c0n)|0);s.pause(animation,m.read32(p+0x3c4n)|0);if(m.bytes(p+0x164n,1)[0])s.playStruggle(animation);
  for(let i=0;i<ORIGINAL_BIRD_BONE_NAMES.length;i++){let index=s.findBone(animation,ORIGINAL_BIRD_BONE_NAMES[i]);if(i===0&&index===-1)index=s.findBone(animation,'M_head');if(index!==-1)m.write64(p+BigInt(0x3d0+i*8),s.boneTransform(animation,index));}
 }
 m.write8(p+0x3c8n,0);params=m.read64(p+120n);
 if(m.bytes(params+40n,1)[0])for(const [boneOffset,effectOffset] of [[0x3f0,0x420],[0x3e8,0x428],[0x410,0x430],[0x408,0x438]])if(m.read64(p+BigInt(boneOffset))){const effect=s.createWingEffect(m.read64(game+0x3f0n));m.write64(p+BigInt(effectOffset),effect);m.write32(effect+84n,4);m.write64(effect+112n,p+8n);}
 params=m.read64(p+120n);if(m.bytes(params+60n,1)[0])for(const [boneOffset,emitterOffset] of [[0x3e0,0x448],[0x400,0x450]]){const transform=m.read64(p+BigInt(boneOffset));if(transform){
  const owner=m.read64(game+0x438n),matrix=new Uint8Array(s.worldMatrix(transform));
  // The native stack parameters overlap the third matrix column (+32).
  // Preserve both the overwritten matrix bytes and the alias passed to Add.
  const parameters=matrix.subarray(32,44);parameters.set(new Uint8Array(Float32Array.of(0,0,-1).buffer));
  const template=s.emitterTemplate(),emitter=s.createEmitter(owner,matrix,parameters,template);m.write64(p+BigInt(emitterOffset),emitter);
 }}
 params=m.read64(p+120n);if(m.bytes(params+62n,1)[0])for(const [boneOffset,windOffset] of [[0x3e8,0x458],[0x408,0x460]])if(m.read64(p+BigInt(boneOffset))){const wind=s.createWind(m.read64(game+0x2c8n));m.write64(p+BigInt(windOffset),wind);m.write32(wind+88n,0x40e00000);}
 m.write64(p+0x500n,0n);m.write32(p+0x508n,0);params=m.read64(p+120n);const lo=m.read32(params+52n),hi=m.read32(params+56n),random=a.mul(bits(s.rand()|0),0x30000000);m.write32(p+0x514n,a.add(a.mul(random,hi),a.mul(a.sub(0x3f800000,random),lo)));m.write64(p+0x50cn,0x3f80000000000000n);m.write8(p+0x440n,0);
 const barn=m.read64(game+0x380n),index=m.read32(barn+0x210n);if(index>=64)throw new NativeObjectFoundationFailure('BirdV2.cpp',1984,3,'m_birdCount < kMaxBirdCount');if(m.read64(barn+16n+BigInt(index)*8n))throw new NativeObjectFoundationFailure('BirdV2.cpp',1985,3,'m_birds[ m_birdCount ] == nullptr');m.write32(barn+0x210n,index+1);m.write64(barn+16n+BigInt(index)*8n,p);
}
