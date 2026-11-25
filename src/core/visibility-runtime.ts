import {visibilityMipLayout,reduceVisibilityDepthMips,type VisibilityMip} from './visibility-depth';
import {submitVisibilityGeometry,type VisibilityScratchAllocator} from './visibility-submit';
import type {VisibilityReciprocal} from './visibility-transform';
import type {VisibilitySphereState} from './visibility-spheres';

export interface VisibilityAllocation {id:number;memory:Uint8Array;}
export interface VisibilityHeap {
  /** Caller supplies original initial bytes. Depth needs 128 explicit guard
   * bytes for the original mip overreads; guards are not allocation payload. */
  allocate(bytes:number,alignment:number,kind:'camera'|'depth'):VisibilityAllocation;
  free(allocation:VisibilityAllocation,kind:'camera'|'depth'):void;
}
export interface VisibilityGeometry {vertices:Uint8Array;vertexCount:number;indices:Uint16Array;indexCount:number;}
export interface VisibilityLevelResources {
  /** Original loaded-resource identity/name and reference ownership are caller
   * inputs. Only the first occluder record is submitted by Visibility Update. */
  acquire():{records:readonly VisibilityGeometry[];release():void;};
}
const stateBytes=0x240;
const cameraBytes=0x300;

/** Registered Visibility method behavior with explicit loaded-resource/heap
 * ownership and camera snapshots. No debug rendering. State pointer words are
 * represented as allocation-id:byte-offset tokens for portable inspection.
 * Terminate preserves original pointer words; callers must respect lifetime.
 */
export class VisibilityRuntime {
  readonly raw:Uint8Array;
  private readonly data:DataView;
  private camera:VisibilityAllocation|null=null;
  private depth:VisibilityAllocation|null=null;
  constructor(private readonly heap:VisibilityHeap,private readonly scratch:VisibilityScratchAllocator,private readonly reciprocal:VisibilityReciprocal,private readonly minimum:(a:number,b:number)=>number,private readonly maximum:(a:number,b:number)=>number,initialState:Uint8Array=new Uint8Array(stateBytes)) {
    if(initialState.length!==stateBytes)throw new Error('Visibility state snapshot length');
    // Buffer.slice aliases its source and may have a nonzero byte offset.
    // Own an exact typed-array copy before inspecting or updating native state.
    this.raw=new Uint8Array(initialState);this.data=new DataView(this.raw.buffer);
    if(this.data.getBigUint64(0x10,true)||this.data.getBigUint64(0x20,true)||this.data.getUint32(0x218,true))throw new Error('Visibility initial state must have no live allocations/mips');
  }
  private allocate(bytes:number,kind:'camera'|'depth'):VisibilityAllocation {
    const allocation=this.heap.allocate(bytes,16,kind);
    if(!Number.isInteger(allocation.id)||allocation.id<1||allocation.id>0xffffffff||allocation.memory.byteLength<bytes+(kind==='depth'?128:0)||allocation.memory.byteOffset%4)throw new Error('Visibility allocation snapshot range');
    return allocation;
  }
  private pointer(at:number,allocation:VisibilityAllocation|null,offset=0):void {
    this.data.setBigUint64(at,allocation?(BigInt(allocation.id)<<32n)|BigInt(offset):0n,true);
  }
  private copyCamera(source:Uint8Array):void {
    if(!this.camera||source.length<cameraBytes)throw new Error('Visibility camera snapshot/lifetime');
    // The native scalar/vector copies omit eight bytes at +0x18..+0x1f.
    this.camera.memory.set(source.subarray(0,0x18));
    this.camera.memory.set(source.subarray(0x20,cameraBytes),0x20);
  }
  initialize(cameraSnapshot:Uint8Array):void {
    this.camera=this.allocate(cameraBytes,'camera');this.pointer(0x10,this.camera);this.copyCamera(cameraSnapshot);
  }
  get mips():VisibilityMip[] {
    const result:VisibilityMip[]=[],count=this.data.getUint32(0x218,true);let offset=0;
    if(count>20)throw new Error('Visibility stored mip count');
    for(let i=0;i<count;i++) {
      const width=this.data.getUint32(0xd8+i*4,true),height=this.data.getUint32(0x128+i*4,true);
      result.push({width,height,logicalWidth:this.data.getFloat32(0x178+i*4,true),logicalHeight:this.data.getFloat32(0x1c8+i*4,true),offset});offset+=width*height;
    }
    return result;
  }
  /** DeviceInfo+0x284/+0x288 determine dimensions; +0x244/+0x298 are the
   * original ratio inputs. Resize keeps ambient floating-point rounding.
   * Unchanged quarter dimensions return before clear, ratio and camera copy. */
  resize(deviceInfo:Uint8Array,cameraSnapshot:Uint8Array,ambientDivide:(a:number,b:number)=>number):boolean {
    if(deviceInfo.length<0x29c)throw new Error('Visibility DeviceInfo snapshot length');
    const device=new DataView(deviceInfo.buffer,deviceInfo.byteOffset,deviceInfo.byteLength);
    const dimensions=[device.getFloat32(0x284,true),device.getFloat32(0x288,true)];
    // The original accesses null/zero-sized mip storage for tiny viewports.
    // Restrict this portable runtime to the verified nondegenerate range.
    if(!dimensions.every(v=>Number.isFinite(v)&&v>=8&&v<=16384))throw new Error('Visibility supported viewport snapshot range');
    const [w,h]=dimensions.map(v=>Math.trunc(v)>>>2);
    if(this.data.getUint32(0x28,true)===w&&this.data.getUint32(0x2c,true)===h)return false;
    const previousSize=this.mips.reduce((sum,m)=>sum+m.width*m.height,0);
    this.data.setUint32(0x28,w,true);this.data.setUint32(0x2c,h,true);
    const mips=visibilityMipLayout(dimensions[0],dimensions[1]),size=mips.reduce((sum,m)=>sum+m.width*m.height,0);
    this.data.setUint32(0x218,mips.length,true);
    mips.forEach((m,i)=>{
      this.data.setUint32(0xd8+i*4,m.width,true);this.data.setUint32(0x128+i*4,m.height,true);
      this.data.setFloat32(0x178+i*4,m.logicalWidth,true);this.data.setFloat32(0x1c8+i*4,m.logicalHeight,true);
    });
    if(previousSize!==size) {
      if(this.depth)this.heap.free(this.depth,'depth');
      this.depth=this.allocate(size*4,'depth');this.pointer(0x20,this.depth);
    }
    mips.forEach((m,i)=>this.pointer(0x38+i*8,this.depth,m.offset*4));
    if(size)this.depthFloats().fill(1,0,size);
    this.data.setFloat32(0x30,ambientDivide(device.getFloat32(0x244,true),device.getFloat32(0x298,true)),true);
    this.copyCamera(cameraSnapshot);return true;
  }
  private depthFloats():Float32Array {
    if(!this.depth)throw new Error('Visibility depth allocation/lifetime');
    return new Float32Array(this.depth.memory.buffer,this.depth.memory.byteOffset,this.depth.memory.byteLength/4);
  }
  /** kDisableVisibility returns before all reads. Update's camera-copy flag
   * controls refreshing the snapshot; its default branch only draws a debug
   * frustum and leaves the stored camera untouched. kDisableOcclusion returns
   * after that branch, before clear/resource acquisition. */
  update(cameraSnapshot:Uint8Array,resources:VisibilityLevelResources,options:{disabled:boolean;copyCamera:boolean;frustumOnly:boolean}):boolean {
    if(options.disabled)return false;
    if(options.copyCamera)this.copyCamera(cameraSnapshot);
    if(options.frustumOnly)return false;
    const width=this.data.getUint32(0x28,true),height=this.data.getUint32(0x2c,true),mips=this.mips;
    if(width*height)this.depthFloats().fill(1,0,width*height);
    const resource=resources.acquire();
    try {
      if(resource.records.length) {
        if(!this.camera)throw new Error('Visibility camera allocation/lifetime');
        const c=this.camera.memory,matrix=new Float32Array(c.buffer,c.byteOffset+0x1c0,16),geometry=resource.records[0];
        submitVisibilityGeometry(this.depthFloats(),width,height,geometry.vertices,geometry.vertexCount,geometry.indices,geometry.indexCount,matrix,this.scratch,this.reciprocal,this.minimum);
      }
      if(mips.length)reduceVisibilityDepthMips(this.depthFloats(),mips.map(m=>m.width),mips.map(m=>m.height),this.maximum);
    }finally{resource.release();}
    return true;
  }
  queryState(disabled=false,frustumOnly=false):VisibilitySphereState {
    const memory=this.camera?.memory;
    return {camera:memory?{view:new Float32Array(memory.buffer,memory.byteOffset+0x140,16),projection:new Float32Array(memory.buffer,memory.byteOffset+0x180,16)}:null,
      disabled,frustumOnly,distanceLimit:this.data.getFloat32(0x18,true),mips:this.mips,depth:this.depth?this.depthFloats():new Float32Array()};
  }
  terminate():void {
    if(this.camera)this.heap.free(this.camera,'camera');
    if(this.depth)this.heap.free(this.depth,'depth');
  }
}
