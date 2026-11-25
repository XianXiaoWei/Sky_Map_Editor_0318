import type {ModelBakeMemory} from './model-baked-runtime';
import {natureArithmetic,type NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {transformNativeObb,type NativeMarkerArithmeticServices} from './marker-transform-runtime';
import evidence from '../../docs/creature-lifecycle-native.json';

export const FISH_ACTIONS=['critterIdle','critterMove','critterChase','critterFlee'] as const;
export interface FishLoadServices {
 arithmetic?:NatureArithmeticServices;
 identityBasis:Uint8Array;
 initializeSteering(steering:bigint,world:bigint,neighbors:bigint,scene:bigint):void;
 cloneModel(owner:bigint,model:bigint):bigint;
 meshTransform(mesh:bigint):Uint8Array;
 playNamed(animation:bigint,name:typeof FISH_ACTIONS[number],speedBits:number):number;
 loop(animation:bigint,index:number):void;
 createLight(owner:bigint):bigint;
}
export interface FishUnloadServices {releaseLight(owner:bigint,light:bigint):void;}
/** Original 0x100192520, shared by fish and bird movement state. */
export function initializeOriginalCreatureBank(m:ModelBakeMemory,p:bigint){
 m.bytes(p,32).fill(0);evidence.vectors.bankDirection.forEach((n,i)=>m.write32(p+32n+BigInt(i*4),n));m.write32(p+48n,0);
}
/** Whole FishV2.Load 0x1003370c0; three virtual mesh-transform calls and
 * captured animation pointer preserve live reads after callbacks. */
export function loadOriginalFishV2(m:ModelBakeMemory,p:bigint,game:bigint,s:FishLoadServices){
 const a=natureArithmetic(s.arithmetic);
 const length=(v:Uint8Array)=>{const d=new DataView(v.buffer,v.byteOffset,v.byteLength),q=[0,4,8].map(i=>a.mul(d.getUint32(i,true),d.getUint32(i,true))),sum=a.add(q[2],a.add(q[0],q[1]));return (sum&0x7fffffff)>0x7f800000?(sum|0x400000)>>>0:value(sum)<0?0xffc00000:bits(Math.sqrt(value(sum)));};
 const axes=[0x80n,0x90n,0xa0n].map(offset=>Uint8Array.from(m.bytes(p+offset,16)));
 m.bytes(p+16n,16).set(m.bytes(p+0xb0n,16));
 axes.forEach((v,i)=>m.bytes(p+32n+BigInt(i*16),16).set(v));
 axes.forEach((v,i)=>{const n=length(v),d=new DataView(v.buffer),w=a.mul(d.getUint32(4,true),d.getUint32(4,true));if(value(n)>value(evidence.constants.minimumLength))for(let j=0;j<4;j++)m.write32(p+32n+BigInt(i*16+j*4),a.div(d.getUint32(j*4,true),j===3?w:n));});
 m.bytes(p+0x50n,16).fill(0);const params=m.read64(p+0x78n);m.write32(p+0x60n,m.read32(params+16n));m.write32(p+0x64n,m.read32(params+20n));m.write32(p+0x68n,0x3f800000);
 if(s.identityBasis.length!==48)throw new Error('Fish identity requires three native 16-byte columns');m.bytes(p+32n,48).set(s.identityBasis);m.write64(p+0x170n,0n);
 s.initializeSteering(p+0x2a0n,m.read64(game+0x220n),m.read64(game+0x398n),m.read64(game+0x138n));initializeOriginalCreatureBank(m,p+0xd0n);
 m.write64(p+0x110n,0n);const mesh=m.read64(m.read64(p+0x78n)+8n);
 const fail=()=>{throw new NativeObjectFoundationFailure('FishV2.cpp',554,3,'m_model');};if(!mesh)fail();
 const model=s.cloneModel(m.read64(game+0x5a8n),m.read64(mesh+0x228n));m.write64(p+0x110n,model);if(!model)fail();
 evidence.vectors.modelScale.forEach((n,i)=>m.write32(p+0x120n+BigInt(i*4),n));
 for(let i=0;i<3;i++){
  const transform=s.meshTransform(m.read64(m.read64(p+0x78n)+8n));if(transform.length!==64)throw new Error('Fish mesh transform requires 64 bytes');
  m.write32(p+0x120n+BigInt(i*4),a.mul(length(transform.subarray(i*16,i*16+16)),length(m.bytes(p+0x80n+BigInt(i*16),16))));
 }
 const animation=m.read64(m.read64(p+0x110n)+0x68n);
 if(animation){FISH_ACTIONS.forEach((name,i)=>m.write32(p+0x130n+BigInt(i*4),s.playNamed(animation,name,evidence.constants.actionSpeed)));for(const i of [1,0,2,3])s.loop(animation,m.read32(p+0x130n+BigInt(i*4))|0);m.bytes(p+0x140n,16).fill(0);}
 m.write32(p+0x150n,0);let light=0n;
 if(m.bytes(m.read64(p+0x78n)+32n,1)[0]){light=s.createLight(m.read64(game+0x3f0n));m.write32(light+0x54n,4);}
 m.write64(p+0x158n,light);m.write32(p+0x160n,0x42c80000);m.write8(p+0x164n,0);
 for(const offset of [0x168n,0x294n,0x188n])m.write32(p+offset,0);m.write32(p+0x17cn,1);m.write64(p+0x180n,0n);m.write64(p+0x490n,0n);
}
/** Whole FishV2.Unload 0x100337500. The light retires before the saved
 * pointer is cleared; this body has no Model release call. */
export function unloadOriginalFishV2(m:ModelBakeMemory,p:bigint,game:bigint,s:FishUnloadServices){
 const light=m.read64(p+0x158n);if(light){m.write8(light+0x50n,0);s.releaseLight(m.read64(game+0x3f0n),light);m.write64(p+0x158n,0n);}
}
/** Whole FishV2 transform getter 0x1003384a0: own scale matrix multiplied
 * by the captured Model transform. Both inputs precede any output store. */
export function getOriginalFishV2Transform(m:ModelBakeMemory,p:bigint,out=new Uint8Array(64),arithmetic?:NativeMarkerArithmeticServices){
 const scale=new Uint8Array(64),v=new DataView(scale.buffer);for(let i=0;i<3;i++)v.setUint32(i*20,m.read32(p+0x120n+BigInt(i*4)),true);v.setUint32(60,0x3f800000,true);
 return transformNativeObb(scale,m.bytes(m.read64(p+0x110n)+0x120n,64).slice(),out,arithmetic);
}
