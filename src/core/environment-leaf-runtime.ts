import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
type Memory=Omit<ModelBakeMemory,'string'>;
export const POINT_LIGHT_CAPACITY=256,POINT_LIGHT_BYTES=96,POINT_LIGHT_BARN_BYTES=0x6020;
/** PointLightBarn.Initialize 0x1005408d0. Pool links retain the original
 * allocation order; active flags are cleared before metadata bootstrap. */
export function initializeOriginalPointLightBarn(m:Memory,barn:bigint,bootstrap:()=>void){
 for(let i=0;i<256;i++)m.write8(barn+16n+BigInt(i*96)+80n,0);
 bootstrap();for(let i=255;i>=0;i--)m.write64(barn+16n+BigInt(i*96),i===255?0n:barn+16n+BigInt((i+1)*96));
 m.write64(barn+0x6010n,barn+16n);
}
/** Whole Create/Release/ReleaseAll/Gather normal bodies. Object storage is
 * cleared only on Create; duplicate Release is a no-op. */
export function createOriginalPointLight(m:Memory,barn:bigint,metadata:()=>number){
 const light=m.read64(barn+0x6010n);if(!light)throw new NativeObjectFoundationFailure('PointLight.cpp',78,3,'light');
 m.write64(barn+0x6010n,m.read64(light));m.bytes(light,96).fill(0);m.write32(light,metadata());m.write8(light+80n,1);return light;
}
export function releaseOriginalPointLight(m:Memory,barn:bigint,light:bigint){if(!light||!m.bytes(light+80n,1)[0])return;m.write8(light+80n,0);m.write64(light,m.read64(barn+0x6010n));m.write64(barn+0x6010n,light);}
export function releaseAllOriginalPointLights(m:Memory,barn:bigint){for(let i=0;i<256;i++)releaseOriginalPointLight(m,barn,barn+16n+BigInt(i*96));}
export function gatherOriginalPointLights(m:Memory,barn:bigint,out:bigint,capacity:number){
 if(BigInt(capacity)<256n)throw new NativeObjectFoundationFailure('PointLight.cpp',94,4,'size >= kMaxLights');
 let count=0;for(let i=0;i<256;i++){const light=barn+16n+BigInt(i*96);if(m.bytes(light+80n,1)[0])m.write64(out+BigInt(count++*8),light);}return count;
}
export interface EmitterFlowRailServices {castEmitter(object:bigint):bigint;start(event:bigint):void;}
/** SetEmitterFlowRail.OnEnabled 0x10052b1a0 and Update 0x10052b280.
 * Initial size is captured, while the table, rail and bounds are re-read
 * after each cast, exactly at the original callback boundaries. */
export function enableOriginalEmitterFlowRail(m:Memory,event:bigint,s:EmitterFlowRailServices){
 const count=m.read32(m.read64(event+56n)+16n);if(!count)return;
 for(let index=0;;index++){
  const emitter=s.castEmitter(m.read64(m.read64(m.read64(event+56n)+8n)+BigInt(index*8)));
  if(!emitter)throw new NativeObjectFoundationFailure('./Clump.h',71,3,'ret');
  m.write64(emitter+400n,m.read64(event+64n));if(index===count-1)return;
  if(index+1>=m.read32(m.read64(event+56n)+16n))throw new NativeObjectFoundationFailure('./Clump.h',54,3,'idx < size');
 }
}
export function updateOriginalEmitterFlowRail(m:Memory,event:bigint,s:EmitterFlowRailServices){if(m.bytes(event+72n,1)[0])s.start(event);else enableOriginalEmitterFlowRail(m,event,s);}
