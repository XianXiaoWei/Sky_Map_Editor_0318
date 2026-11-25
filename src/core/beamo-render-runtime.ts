import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {constructOriginalResourceRef,observeOriginalResource,destroyOriginalResourceRef,type ResourceRefServices} from './resource-ref-runtime';
import {initializeOriginalVertexRender,type VertexRenderServices} from './vertex-render-runtime';
import {connectOriginalVertexRenderPipeline,type OriginalPipelineServices} from './render-pipeline-runtime';

export const ORIGINAL_RENDER_LIST_NAMES=['Opaque','AlphaTestOpaque','Blended','BlendedBackground','BlendedWithBackfaces','Skirts','Skybox','Decal','Ocean','Ghostly','PuddleSim','Sprites','Flowers','FlowerShadows','FogVolume','Motion','Hud','HudLowRes','LensDistortion','LensFlare','Cloud','Screenshot','MovieFrame'] as const;
/** Whole normal Scene.GetRenderListByName 0x10017e8d0. Comparisons are exact
 * C-string matches; null/empty returns null, unknown nonempty names assert. */
export function findOriginalNamedRenderList(m:ModelBakeMemory,scene:bigint,name:bigint){
 if(!name||!m.bytes(name,1)[0])return 0n;
 const index=ORIGINAL_RENDER_LIST_NAMES.indexOf(m.string(name) as typeof ORIGINAL_RENDER_LIST_NAMES[number]);
 if(index<0)throw new NativeObjectFoundationFailure('./Scene.h',111,4,'false');
 return scene+16n+BigInt(index)*0xe8n;
}
export interface BeamoRenderServices extends ResourceRefServices {
 copyCString(out:bigint,input:bigint,capacity:number):void;
 cStringLength(input:bigint):number;
 shaderType():bigint;
 imageType():bigint;
 lookup(manager:bigint,type:bigint,name:bigint):bigint;
 request(manager:bigint,typeName:bigint,name:bigint):void;
 initializeRenderable(out:bigint,vertexData:bigint,shader:bigint,renderList:bigint,topology:number):void;
 setVector(parameters:bigint,name:bigint,value:bigint):void;
 setTexture(parameters:bigint,name:bigint,texture:bigint,sampler:bigint):void;
}
const stringData=(m:ModelBakeMemory,descriptor:bigint)=>m.bytes(descriptor,1)[0]&1?m.read64(descriptor+16n):descriptor+1n;
/** Connect Barn's material loop to the shared original VertexRender and CPU
 * pipeline kernels using the same live addresses. GPU/reflector services are
 * explicit inputs; this entry does not synthesize a shader reflection. */
export function prepareOriginalBeamoRenderablesWithPipeline(m:ModelBakeMemory,context:bigint,barn:bigint,materialCount:number,s:Omit<BeamoRenderServices,'initializeRenderable'>,vertex:Omit<VertexRenderServices,'initializeParameters'|'bindVertexData'>,pipeline:OriginalPipelineServices){
 const connected=connectOriginalVertexRenderPipeline(m,vertex,pipeline);
 prepareOriginalBeamoRenderables(m,context,barn,materialCount,{...s,initializeRenderable:(out,data,shader,list,topology)=>initializeOriginalVertexRender(m,out,data,shader,list,topology,connected)});
}
/** Barn.Load 0x100196094..0x100196447, after all-LOD upload and material
 * grouping. Executes all three group phases and two subgroups, suffixes Alpha,
 * observes shader/Image refs using the proven original list kernels, selects
 * Scene RenderLists, initializes renderables, binds every parameter and cleans
 * refs. Missing textures request by type-name, then bind the current ref (null
 * is allowed); they are not replaced with an invented fallback texture.
 *
 * The caller provides live loader context: +0x10 Barn, +0x18 material Barn,
 * +0x20 group slots, +0x68 VertexData. Resource lookup/request/callbacks,
 * Renderable initialization, Vertex parameter setters and libc string ops are
 * explicit services. Cached pointers and original context reloads are retained
 * when services modify the table/counts. This is not complete GPU drawing.
 */
export function prepareOriginalBeamoRenderables(m:ModelBakeMemory,context:bigint,barn:bigint,materialCount:number,s:BeamoRenderServices){
 let cachedBarn=barn,width=BigInt(materialCount>>>0),doubleWidth=width*2n,count=m.read32(m.read64(context+0x18n)+0x8f30n);
 const fail=(line:number,expression:string):never=>{throw new NativeObjectFoundationFailure('Beamo.cpp',line,4,expression);};
 for(let phase=0;phase<3;phase++){
  if(!count)continue;
  let rows=m.read64(context+0x20n)+doubleWidth*BigInt(phase)*4n,index=0;
  m.write64(context+0x30n,width);m.write64(context+0xb0n,doubleWidth);m.write64(context+0x50n,BigInt(phase));m.write64(context+0xc0n,rows);
  do{
   const offset=BigInt(index)*0x6f0n,descriptor=m.read64(context+0x18n)+offset+0x2058n;
   m.write64(context+8n,descriptor);m.write64(context+0x38n,offset);m.write64(context+0x70n,BigInt(index));
   let shortData=descriptor+1n; m.write64(context+0xd0n,shortData);
   for(let subgroup=0;subgroup<2;subgroup++){
    const renderIndex=m.read32(rows+BigInt(subgroup)*width*4n+BigInt(index)*4n);
    if(renderIndex===0xffffffff)continue;
    m.write64(context+0x80n,BigInt(subgroup));
    const shaderName=context+0x140n,nameDescriptor=m.read64(context+8n);
    s.copyCString(shaderName,m.bytes(nameDescriptor,1)[0]&1?m.read64(nameDescriptor+16n):shortData,256);
    if(m.read64(context+0x50n)===2n){const length=s.cStringLength(shaderName);m.write32(shaderName+BigInt(length),0x68706c41);m.bytes(shaderName+BigInt(length)+4n,2).set([0x61,0]);}
    const shaderRef=context+0xe0n;constructOriginalResourceRef(m,shaderRef);
    const shaderManager=m.read64(cachedBarn+0xa2078n),shaderType=s.shaderType(),found=s.lookup(shaderManager,shaderType,shaderName);
    let renderListName=0n;
    if(found){
     observeOriginalResource(m,found,shaderRef,s);
     const handle=m.read64(shaderRef),resource=handle?m.read64(handle+16n):0n;
     // The original unobserved-shader path dereferences address +0xe8. Leave
     // invalid memory to the caller's memory boundary, not a made-up default.
     renderListName=stringData(m,resource+0xe8n);
    }
    const renderList=findOriginalNamedRenderList(m,m.read64(cachedBarn+0xa2080n),renderListName);
    if(!found)fail(770,'foundShader');
    width=m.read64(context+0x30n);
    if(!renderListName||!m.bytes(renderListName,1)[0])fail(771,'renderlistName && renderlistName[0]');
    if(!renderList)fail(772,'renderList');
    const render=cachedBarn+0x6cc70n+BigInt(renderIndex)*0x3540n,handle=m.read64(shaderRef),shader=handle?m.read64(handle+16n):0n;
    s.initializeRenderable(render,m.read64(context+0x68n),shader+0x100n,renderList,2);
    if(!m.bytes(render+0x538n,1)[0])throw new NativeObjectFoundationFailure('../../../Code/Base/Vertex.h',168,3,'IsInitialized()');
    if(m.read32(m.read64(context+8n)+0x98n)){
     m.write64(context+0x58n,render+0x270n);
     for(let parameterIndex=0;;parameterIndex++){
      let parameter=m.read64(m.read64(context+0x18n)+m.read64(context+0x38n)+0x2070n+BigInt(parameterIndex)*8n);
      if(m.bytes(parameter+0x20n,1)[0]!==1){s.setVector(m.read64(context+0x58n),stringData(m,parameter+8n),parameter+0x30n);}
      else{
       const imageRef=context+0x90n;constructOriginalResourceRef(m,imageRef);
       const manager=m.read64(cachedBarn+0xa2078n),textureName=stringData(m,parameter+0x40n),imageType=s.imageType(),image=s.lookup(manager,imageType,textureName);
       if(image)observeOriginalResource(m,image,imageRef,s);else{s.request(manager,m.read64(s.imageType()+8n),textureName);}
       const uniformName=stringData(m,parameter+8n),imageHandle=m.read64(imageRef),resource=imageHandle?m.read64(imageHandle+16n):0n;
       s.setTexture(m.read64(context+0x58n),uniformName,resource?resource+0xb0n:0n,0n);
       destroyOriginalResourceRef(m,imageRef,s);cachedBarn=m.read64(context+0x10n);width=m.read64(context+0x30n);
      }
      if(parameterIndex+1>=m.read32(m.read64(context+8n)+0x98n))break;
     }
    }
    destroyOriginalResourceRef(m,shaderRef,s);
    rows=m.read64(context+0xc0n);index=Number(m.read64(context+0x70n));shortData=m.read64(context+0xd0n);subgroup=Number(m.read64(context+0x80n));
   }
   index++;count=m.read32(m.read64(context+0x18n)+0x8f30n);doubleWidth=m.read64(context+0xb0n);phase=Number(m.read64(context+0x50n));
  }while(index<count);
 }
}
