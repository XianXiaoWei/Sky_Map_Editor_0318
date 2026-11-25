import type { ModelBakeMemory, ModelBakeRef } from './model-baked-runtime';
import { NativeObjectFoundationFailure } from './object-foundation-runtime';

export const ENV_DEFAULT_EVENT_OFFSETS = [0x190,0x1d0,0x2a0,0x2d0,0x300,0x310,0x340,0x348] as const;
export const ENV_HULL_EVENT_OFFSETS = [0x1c0,0x200,0x2d0,0x300,0x330,0x340,0x370,0x378] as const;
export interface EnvironmentEventServices {
  createRef(): ModelBakeRef;
  levelObjectsType(): bigint;
  lookup(manager:bigint,type:bigint,name:bigint):bigint;
  observe(resource:bigint,ref:ModelBakeRef):void;
  cameraPredicate(camera:bigint):number;
  convert(kind:'SetEnvDefault'|'SetEnvHull',event:bigint):void;
  registerDefault(environment:bigint,values:bigint):void;
  registerClump(environment:bigint,values:bigint,clump:bigint,falloffBits:number,layer:number,fadeInBits:number,fadeOutBits:number,durationBits:number):bigint;
  start(event:bigint):void;
  destroyRef(ref:ModelBakeRef):void;
}
/** Whole normal SetEnvDefault.Update 0x10031d710. The membership test uses
 * the Object subobject (+8); registration is gated by the exact native byte
 * expression. Ref/resource/camera/metadata services remain explicit. */
export function updateOriginalSetEnvDefault(m:ModelBakeMemory,event:bigint,game:bigint,s:EnvironmentEventServices):void {
  const ref=s.createRef(),manager=m.read64(game+0x140n),type=s.levelObjectsType();
  const resource=s.lookup(manager,type,game+0x13b8n);
  let member=1;
  if(resource){
    s.observe(resource,ref);
    const data=ref.handle?m.read64(ref.handle+16n):0n;
    let table=data?m.read64(data+0x3a8n):0n,count=data?m.read32(data+0x3b8n):0;
    const end=table+BigInt(count)*8n,target=event?event+8n:0n;
    while(count){if(m.read64(table)===target)break;table+=8n;count--;}
    const current=ref.handle?m.read64(ref.handle+16n):0n;
    const currentEnd=current?m.read64(current+0x3a8n)+BigInt(m.read32(current+0x3b8n))*8n:0n;
    // Empty observed tables have the same begin/end; no fabricated match.
    member=Number((count?table:end)!==currentEnd);
  }
  if((member|((s.cameraPredicate(m.read64(game+0x310n))&255)^1))===1){
    s.convert('SetEnvDefault',event);
    for(const offset of ENV_DEFAULT_EVENT_OFFSETS)s.registerDefault(m.read64(game+0x2a8n),event+BigInt(offset));
  }
  s.start(event);s.destroyRef(ref);
}
/** Whole SetEnvHull.Update 0x10031ded0. Each registration reloads all Game
 * and event fields, and writes the returned entry pointer before the next call. */
export function updateOriginalSetEnvHull(m:ModelBakeMemory,event:bigint,game:bigint,s:EnvironmentEventServices):void {
  s.convert('SetEnvHull',event);
  for(const [i,offset] of ENV_HULL_EVENT_OFFSETS.entries()){
    const entry=s.registerClump(m.read64(game+0x2a8n),event+BigInt(offset),m.read64(event+0x40n),m.read32(event+0x48n),m.read32(event+0x4cn),m.read32(event+0x50n),m.read32(event+0x54n),m.read32(event+0x58n));
    m.write64(event+0x388n+BigInt(i)*8n,entry);
  }
  s.start(event);
}
export interface EnvironmentTypeServices {
  typeById(id:number):bigint;
  nullType():bigint;
  asClass(type:bigint):bigint;
  fallbackClass():bigint;
}
/** Complete normal RegisterDefault 0x10031b2e0. Type identity is obtained
 * through the original metadata boundary; count and slots stay live. */
export function registerOriginalEnvironmentDefault(m:ModelBakeMemory,environment:bigint,values:bigint,s:EnvironmentTypeServices):void {
  const resolve=(p:bigint)=>s.asClass(p?s.typeById(m.read32(p)):s.nullType())||s.fallbackClass();
  const type=resolve(values);
  for(let i=0;m.read32(environment+0x90n)!==0;){
    if(resolve(m.read64(environment+0x10n+BigInt(i)*8n))===type){m.write64(environment+0x98n+BigInt(i)*8n,values);return;}
    i=(i+1)>>>0;if(i>=m.read32(environment+0x90n))break;
  }
  throw new NativeObjectFoundationFailure('Environment.cpp',416,4,'false');
}
/** Environment.Initialize 0x100319840 retains outputs and queued slots. */
export function initializeOriginalEnvironment(m:ModelBakeMemory,environment:bigint):void {
  m.write32(environment+0x90n,0);m.write8(environment+0x2e264n,1);m.write32(environment+0x2e260n,0);
}
