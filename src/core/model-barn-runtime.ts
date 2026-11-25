import {NativeObjectFoundationFailure} from './object-foundation-runtime';
export interface ModelBarnMemory {
 bytes(address:bigint,length:number):Uint8Array;
 read32(address:bigint):number;
 write32(address:bigint,value:number):void;
 read64(address:bigint):bigint;
 string(address:bigint):Uint8Array;
}
export interface ModelBarnConstructorArguments {
 model:bigint;options:bigint;heap:bigint;resources:bigint;renderer:bigint;
 /** Packed ABI bytes: aggregate 152, first vec4 16, second vec4 16.
  * The original intervening 16-byte stack alignment padding is excluded. */
 parameters:Uint8Array;
}
export interface ModelBarnCreateServices {
 /** Explicit previously allocated scratch contents. The unbaked function
  * does not initialize its aggregate LOD/GUID dword at +128. */
 allocateParameterStorage(length:152):Uint8Array;
 construct(arguments_:ModelBarnConstructorArguments):void;
}
export class NativeModelConstructorDependencyBoundary extends Error {
 constructor(){super('Complete Model constructor is an unresolved dependency');}
}
const failure=(file:string,line:number,expression:string):never=>{throw new NativeObjectFoundationFailure(file,line,3,expression);};
/** Complete normal ModelBarn CreateBaked 0x10046ca30 / CreateUnbaked
 * 0x10046c700 wrappers. Slot allocation and ABI parameter transmission are
 * recovered; the callback must implement the complete Model constructor
 * before these returned pool addresses establish actual Model creation. */
export function createOriginalModelBarnSlot(m:ModelBarnMemory,barn:bigint,input:{baked:boolean;levelName:bigint;meshName:bigint;guid:number;shader:bigint;transform:bigint;options:bigint},s:ModelBarnCreateServices):bigint {
 if(!input.options)failure('Model.cpp',input.baked?2131:2119,'options');
 const aggregate=s.allocateParameterStorage(152);
 if(aggregate.length!==152)throw new Error('Model aggregate storage must be 152 bytes');
 aggregate.fill(0,0,128);
 const copyName=(address:bigint,offset:number)=>{const name=m.string(address);if(((name.length+1)>>>0)>=65)failure('../../../Code/Base/FixedString.h',48,'len + 1 <= N');aggregate.set(name,offset);aggregate[offset+name.length]=0;};
 if(input.baked)copyName(input.levelName,0);
 copyName(input.meshName,64);
 const a=new DataView(aggregate.buffer,aggregate.byteOffset,aggregate.byteLength);
 if(input.baked)a.setUint32(128,input.guid>>>0,true);
 a.setUint32(132,input.baked?1:0,true);a.setBigUint64(136,input.shader,true);a.setBigUint64(144,input.transform,true);
 const count=m.read32(barn+0xf8010n);
 if(count>=1024)failure('Model.cpp',2182,'m_numModels < kMaxModels');
 m.write32(barn+0xf8010n,count+1);
 const model=barn+16n+BigInt(count)*0x3e0n;
 const heap=m.read64(barn+0xfd250n),resources=m.read64(barn+0xfd260n),renderer=m.read64(barn+0xfd258n);
 const parameters=new Uint8Array(184);parameters.set(aggregate);parameters.set(m.bytes(barn+0xfd270n,16),152);parameters.set(m.bytes(barn+0xfd290n,16),168);
 s.construct({model,options:input.options,heap,resources,renderer,parameters});return model;
}
