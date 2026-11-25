import type {ModelBakeMemory} from './model-baked-runtime';
import type {ModelBarnConstructorArguments,ModelBarnMemory} from './model-barn-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';

export interface ModelLifecycleServices {
  resetMeshInstance(instance:bigint):void;
  resetVertexData(data:bigint):void;
  destroyVertexData(data:bigint):void;
  destroyVertexRender(render:bigint):void;
  free(heap:bigint,pointer:bigint):void;
  releaseAnimation(animation:bigint):void;
  destroyAnimationState(state:bigint):void;
  removeCollision(renderer:bigint,collision:bigint):void;
  destroyAuxiliary(kind:0x70|0x78|0x80,object:bigint,heap?:bigint):void;
}

/** Complete normal Model destructor 0x100469eb0. Each table, owner and
 * count is re-read where the original re-reads it, including after callbacks.
 * Vertex/GPU, animation, collision and allocator internals are services.
 * The original clears ownership pointers but preserves LOD count and most
 * ordinary object fields; callers must not treat it as a zeroed constructor. */
export function destroyOriginalModel(m:Omit<ModelBakeMemory,'string'>,model:bigint,renderer:bigint,s:ModelLifecycleServices):void {
  const heap=()=>m.read64(model+0x3a8n),table=(offset:number)=>m.read64(model+BigInt(offset));
  const item=(offset:number,index:number)=>m.read64(table(offset)+BigInt(index*8));
  if(m.read32(model+0x8cn)) for(let index=0;;index=(index+1)>>>0) {
    s.resetMeshInstance(item(8,index));
    s.resetVertexData(item(16,index));
    let pointer=item(8,index);if(pointer)s.free(heap(),pointer);
    pointer=item(16,index);
    if(pointer){const savedHeap=heap();s.destroyVertexData(pointer);s.free(savedHeap,pointer);}
    m.write64(table(8)+BigInt(index*8),0n);m.write64(table(16)+BigInt(index*8),0n);
    for(const offset of [0x28,0x30,0x38,0x40]) {
      s.destroyVertexRender(item(offset,index));
      pointer=item(offset,index);if(pointer)s.free(heap(),pointer);
      m.write64(table(offset)+BigInt(index*8),0n);
    }
    if(((index+1)>>>0)>=m.read32(model+0x8cn))break;
  }
  for(const offset of [8,0x28,0x30,0x38,0x40,16]) s.free(heap(),table(offset));
  for(const offset of [0x18,0x20,0x48]) {
    const firstTable=table(offset);if(!firstTable)continue;
    if(m.read32(model+0x8cn)) {
      s.free(heap(),m.read64(firstTable));
      if(m.read32(model+0x8cn)>=2)for(let index=1;;index=(index+1)>>>0){
        s.free(heap(),item(offset,index));if(((index+1)>>>0)>=m.read32(model+0x8cn))break;
      }
    }
    s.free(heap(),table(offset));
  }
  let object=table(0x68);
  if(object){s.releaseAnimation(object);object=table(0x68);if(object){const savedHeap=heap();s.destroyAnimationState(object+0x5bd0n);s.free(savedHeap,object);}}
  object=table(0x50);if(object)s.removeCollision(renderer,object);
  for(const offset of [0x70,0x78,0x80] as const){
    object=table(offset);if(!object)continue;
    s.destroyAuxiliary(offset,object,offset===0x80?undefined:heap());
    object=table(offset);if(object)s.free(heap(),object);
  }
  m.write64(model+8n,0n);m.bytes(model+0x28n,32).fill(0);m.write64(model+0x10n,0n);m.write8(model+0x226n,0);
  m.bytes(model+0x18n,16).fill(0);m.bytes(model+0x48n,16).fill(0);m.bytes(model+0x68n,32).fill(0);
}

export interface ModelRecreateServices {
  destroy(model:bigint,renderer:bigint):void;
  construct(input:ModelBarnConstructorArguments):void;
  /** Explicit unwritten GUID dword in the unbaked ABI aggregate. */
  parameterStorage():Uint8Array;
}
/** Complete ModelBarn hot-recreate wrappers 0x10046ce50 / 0x10046d010.
 * Baked selection uses the original signed GUID test; they reconstruct the
 * same slot after destruction and never allocate/increment the pool count. */
export function recreateOriginalModel(m:ModelBarnMemory,barn:bigint,input:{model:bigint;levelName?:bigint;meshName:bigint;guid:number;shader:bigint;transform:bigint;options:bigint},s:ModelRecreateServices):void {
  const baked=input.levelName!==undefined;
  if(!input.options)throw new NativeObjectFoundationFailure('Model.cpp',baked?2167:2153,3,'options');
  const aggregate=s.parameterStorage();if(aggregate.length!==152)throw new Error('Model aggregate storage must be 152 bytes');aggregate.fill(0,0,128);
  const name=(p:bigint,at:number)=>{const b=m.string(p);if(((b.length+1)>>>0)>=65)throw new NativeObjectFoundationFailure('../../../Code/Base/FixedString.h',48,3,'len + 1 <= N');aggregate.set(b,at);aggregate[at+b.length]=0;};
  if(baked)name(input.levelName!,0);name(input.meshName,64);
  const v=new DataView(aggregate.buffer,aggregate.byteOffset,aggregate.byteLength);
  if(baked)v.setUint32(128,input.guid>>>0,true);
  v.setUint32(132,baked?((input.guid>>>31)^1):0,true);v.setBigUint64(136,input.shader,true);v.setBigUint64(144,input.transform,true);
  s.destroy(input.model,m.read64(barn+0xfd258n));
  const resources=m.read64(barn+0xfd260n),heap=m.read64(barn+0xfd250n),renderer=m.read64(barn+0xfd258n),parameters=new Uint8Array(184);
  parameters.set(aggregate);parameters.set(m.bytes(barn+0xfd270n,16),152);parameters.set(m.bytes(barn+0xfd290n,16),168);
  s.construct({model:input.model,options:input.options,heap,resources,renderer,parameters});
}
