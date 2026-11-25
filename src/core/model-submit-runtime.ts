import type {LevelMeshMemory} from './level-mesh-runtime';
import {NativeLevelMeshDependencyBoundary,getOriginalLevelMeshEnabled,getOriginalLevelMeshTransform,setOriginalLevelMeshEnabled,setOriginalLevelMeshTransform} from './level-mesh-runtime';
import {numericFloatValue} from './object-numeric-runtime';
import type {ModelBakeMemory} from './model-baked-runtime';
import {queueOriginalVertexRender} from './render-list-runtime';
export interface ModelSubmitMemory extends LevelMeshMemory {read32(address:bigint):number;}
export interface ModelSubmitServices {queue(renderData:bigint):void;debugEnabled():boolean;}
/** Original Model submit 0x10046b780, normal debug-disabled path. Native
 * debug geometry is a separate dependency. Render queue insertion is an
 * explicit service so later scene/compositor implementations can own it. */
export function submitOriginalModel(m:ModelSubmitMemory,model:bigint,s:ModelSubmitServices):void {
  if(!m.read8(model+0x227n)||!m.read8(model+0x32dn))return;
  const blend=numericFloatValue(m.read32(model+0x98n)),index=m.read32(model+(0.5>blend?0x90n:0x94n));
  if(index>=m.read32(model+0x8cn))return;
  const at=BigInt(index)*8n;
  if(m.read32(model+0x354n)!==2){
    s.queue(m.read64(m.read64(model+0x28n)+at));
    if(m.read8(model+0x391n))s.queue(m.read64(m.read64(model+0x30n)+at));
  }
  if(m.read32(model+0x354n)!==0){
    const render=m.read64(m.read64(model+0x40n)+at);
    if(m.read8(render+0x538n))s.queue(render);
  }
  if(s.debugEnabled())throw new NativeLevelMeshDependencyBoundary('Model debug geometry submission');
}
/** Submit into the recovered queue using the same Model/VertexRender memory.
 * The scene supplies actual storage and debug state; no stand-in Model is
 * constructed and GPU drawing remains the scene/compositor owner's job. */
export function submitOriginalModelToRenderLists(m:ModelBakeMemory,model:bigint,debugEnabled:()=>boolean):void {
  submitOriginalModel({bytes:(a,n)=>m.bytes(a,n),read8:a=>m.bytes(a,1)[0],read32:a=>m.read32(a),read64:a=>m.read64(a),write8:(a,n)=>m.write8(a,n)},model,{queue:render=>queueOriginalVertexRender(m,render),debugEnabled});
}
/** A shared endpoint over the actual LevelMesh address and its live Model
 * pointer. Enable/Parent/Timeline/TransformObject and later render schedulers
 * can share it; it allocates no stand-in Model and retains native visible vs
 * enabled semantics. Loader/resource lifetime belongs to the scene owner. */
export class OriginalLevelMeshModelEndpoint {
  constructor(readonly objectId:number,readonly address:bigint,private memory:ModelSubmitMemory){}
  get modelAddress(){return this.memory.read64(this.address+0x228n);}
  getEnabled(){return getOriginalLevelMeshEnabled(this.memory,this.address);}
  setEnabled(value:number){setOriginalLevelMeshEnabled(this.memory,this.address,value);}
  getTransform(){return getOriginalLevelMeshTransform(this.memory,this.address);}
  setTransform(matrix:Uint8Array){setOriginalLevelMeshTransform(this.memory,this.address,matrix);}
  submit(services:ModelSubmitServices){const model=this.modelAddress;if(!model)throw new NativeLevelMeshDependencyBoundary('Model creation/binding');submitOriginalModel(this.memory,model,services);}
}
