import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import type {ModelParameterMemory} from './model-parameter-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
export interface SetMeshShaderParamServices {
  /** Shared original GameTime/debug scale, float32 multiply order and
   * MAXSS/MINSS clamp. The clock owner supplies the resulting frame bits. */
  frameBits():number;
  castMesh(object:bigint):bigint;
  float(mesh:bigint,pass:number,name:bigint,targetBits:number,durationBits:number):void;
  vector(mesh:bigint,pass:number,name:bigint,target:Uint8Array,durationBits:number):void;
  texture(mesh:bigint,pass:number,name:bigint,texture:bigint):void;
  startEvent(event:bigint):void;
}
/** Whole original SetMeshShaderParam Update 0x100592940. Event construction,
 * name-prefix enable hook, registry casts, clock and Barn start are explicit
 * dependencies. Targets use their existing LevelMesh parameter state. */
export function updateOriginalSetMeshShaderParam(m:ModelParameterMemory,event:bigint,s:SetMeshShaderParamServices){
  const oldBits=m.read32(event+0xc0n),old=value(oldBits),dt=s.frameBits();
  let elapsedBits:number;
  if(Number.isNaN(old))elapsedBits=(oldBits|0x400000)>>>0;
  else if(Number.isNaN(value(dt)))elapsedBits=(dt|0x400000)>>>0;
  else{const n=old+value(dt);elapsedBits=Number.isNaN(n)?0xffc00000:bits(n);}
  m.write32(event+0xc0n,elapsedBits);
  let clump=m.read64(event+0x38n),count=m.read32(clump+0x10n);
  if(count){for(let i=0;;i=(i+1)>>>0){
    const threshold=Math.fround(Math.fround(i)*value(m.read32(event+0x98n)));
    // UCOMISS below skips unordered too; upper endpoint is exclusive.
    if(threshold>=old&&value(m.read32(event+0xc0n))>threshold){
      const object=m.read64(m.read64(clump+8n)+BigInt(i)*8n),mesh=s.castMesh(object);
      if(!mesh)throw new NativeObjectFoundationFailure('SetMeshShaderParam.cpp',60,3,'mesh');
      const type=m.read32(event+0x90n),name=event+0x60n;
      if(type===0){const source=m.read64(event+0x48n);s.float(mesh,0,name,m.read32(source?source+0x10n:event+0x40n),m.read32(event+0x94n));}
      else if(type===1){const target=Uint8Array.from(m.bytes(event+0x50n,16)),v=new DataView(target.buffer,target.byteOffset,target.byteLength);
        for(let lane=0;lane<4;lane++){const source=m.read64(event+0xa0n+BigInt(lane)*8n);if(source)v.setUint32(lane*4,m.read32(source+0x10n),true);}
        s.vector(mesh,0,name,target,m.read32(event+0x94n));
      }else if(type===2)s.texture(mesh,0,name,event+0x78n);
      else throw new NativeObjectFoundationFailure('SetMeshShaderParam.cpp',79,3,'false');
    }
    clump=m.read64(event+0x38n);count=m.read32(clump+0x10n);if(((i+1)>>>0)>=count)break;
  }}
  const total=Math.fround(Math.fround(count)*value(m.read32(event+0x98n)));
  if(value(m.read32(event+0xc0n))>=total){m.write32(event+0xc0n,0);s.startEvent(event);}
}
