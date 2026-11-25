import type {ModelBakeMemory} from './model-baked-runtime';
import type {NativeMarkerArithmeticServices} from './marker-transform-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {cloudCardFrustumPlanes} from './cloud-card-visibility';
import {itemEffectArithmetic,itemFloatBytes,itemFloats,itemView,itemMin,itemMax} from './item-effect-arithmetic';

export interface CandleRenderServices {
 specialTune():boolean;arithmetic?:NativeMarkerArithmeticServices;
 allocator():bigint;heap():bigint;allocate(owner:bigint,size:number,heap:bigint,alignment:number):bigint;free(owner:bigint,pointer:bigint):void;
 cameraPosition(camera:bigint):Uint8Array;
 visibility(owner:bigint,spheres:bigint,count:number,statuses:bigint,mode:number):void;
 parameter(shader:bigint,index:number,value:Uint8Array):void;render(renderData:bigint):void;
}
/** Whole normal CandleBarn.Render 0x1001ea220. This owns pool traversal,
 * near-range/frustum filtering, Visibility service submission, native Flame
 * light modulation and the original shader-parameter/render call sequence. */
export function renderOriginalCandleBarn(m:ModelBakeMemory,barn:bigint,game:bigint,s:CandleRenderServices){
 const a=itemEffectArithmetic(s.arithmetic),read=(p:bigint)=>itemView(m.bytes(p,4)).getFloat32(0,true),camera=m.read64(game+0x70n),planes=cloudCardFrustumPlanes(itemFloats(m.bytes(camera+0x1c0n,64)));
 const poolCount=m.read32(barn+0xf988n),pointers=s.allocate(s.allocator(),poolCount*8,s.heap(),8),statuses=s.allocate(s.allocator(),m.read32(barn+0xf988n)*4,s.heap(),4),spheres=s.allocate(s.allocator(),m.read32(barn+0xf988n)*16,s.heap(),16),capacity=m.read32(barn+0xf980n),bits=m.read64(barn+0xf990n);
 let count=0,drawn=0;
 for(let index=0;index<capacity;index++){
  if(!(m.read32(bits+BigInt(index>>>5)*4n)&(1<<(index&31))))continue;
  const candle=m.read64(barn+0xf998n)+BigInt(index)*0x570n;
  if(m.bytes(candle+0x568n,1)[0]&&s.specialTune())continue;
  const sphere=itemFloats(m.bytes(candle,16)),eye=itemFloats(s.cameraPosition(camera)),weight=itemMin(1,itemMax(0,a.mul(sphere[3],3))),range=a.add(a.mul(weight,55),a.mul(a.sub(1,weight),30)),diff=sphere.map((n,i)=>a.sub(n,eye[i]));
  if(a.add(a.mul(diff[2],diff[2]),a.add(a.mul(diff[0],diff[0]),a.mul(diff[1],diff[1])))>a.mul(range,range))continue;
  if(planes.some(p=>-sphere[3]>a.add(a.add(a.mul(sphere[0],p[0]),a.mul(sphere[2],p[2])),a.add(a.mul(sphere[1],p[1]),p[3]))))continue;
  m.bytes(spheres+BigInt(count)*16n,16).set(itemFloatBytes(sphere));m.write64(pointers+BigInt(count)*8n,candle);m.write32(statuses+BigInt(count)*4n,0xffffffff);count++;
 }
 s.visibility(m.read64(game+0x2b8n),spheres,count,statuses,0);
 for(let i=0;i<count;i++){
  if(!m.read32(statuses+BigInt(i)*4n))continue;
  const candle=m.read64(pointers+BigInt(i)*8n),flame=m.read64(candle+0x10n),size=read(flame+0x108n),safeSize=Number.isNaN(size)?Math.fround(.01):itemMax(Math.fround(.01),size);
  const light=itemMin(a.mul(a.mul(a.mul(safeSize,a.add(a.mul(.25,read(flame+0x10cn)),1)),read(flame+0x114n)),10),1),color=new Uint8Array(m.bytes(m.read64(candle+0x18n)+0x50n,16));itemView(color).setFloat32(12,light,true);
  if(!m.bytes(candle+0x558n,1)[0])throw new NativeObjectFoundationFailure('../../../Code/Base/Vertex.h',168,3,'IsInitialized()');
  s.parameter(candle+0x290n,m.read32(candle+0x564n),color);s.render(candle+0x20n);drawn++;
 }
 s.free(s.allocator(),spheres);s.free(s.allocator(),statuses);s.free(s.allocator(),pointers);return {candidates:count,drawn};
}
