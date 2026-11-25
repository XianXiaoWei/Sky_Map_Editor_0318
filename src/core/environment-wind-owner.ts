import type {ObjectNode} from './objects';
import type {PreparedEnvironmentObjectState} from './environment-object-state';
import {sampleEnvironmentWind,advanceWindTimer,type WindSnapshot} from './environment-wind';
import {buildRailCache,type RailCache,RAIL_MARKER_OBB} from './rail';
import {getNativeMarkerWorldObb} from './marker-transform-runtime';
const unpack=(b:Uint8Array)=>{const v=new DataView(b.buffer,b.byteOffset,b.byteLength);return Array.from({length:b.length/4},(_,i)=>v.getFloat32(i*4,true));};
/** Restored Wind timer/spatial/order/summation bodies. Rail cache construction
 * uses original saved Marker getters; Rail metadata, registration, self-updating
 * lifecycle and JS atan2/sincos are explicit dependencies. Boundary/interaction
 * forces and ambient target remain explicit services in the shared event owner. */
export class PreparedEnvironmentWindOwner {
 private rails=new Map<number,{node:ObjectNode;matrix:Uint8Array;key:string;cache?:RailCache}>();
 private windEntries;
 constructor(private objects:PreparedEnvironmentObjectState,nodes:ObjectNode[]){
  this.windEntries=[...objects.entries.values()].filter(e=>e.node.className==='Wind');
  if(this.windEntries.length>32)throw new Error('原 EnvironmentForces 每图最多 32 个 Wind');
  const byId=new Map(nodes.map(n=>[n.id,n]));
  for(const entry of this.windEntries){const id=Number(entry.node.fields.find(f=>f.name==='rail')?.value??0xffffffff);if(id===0xffffffff||this.rails.has(id))continue;
   const node=byId.get(id),field=node?.fields.find(f=>f.name==='transform');
   if(node?.className!=='Rail'||field?.raw.length!==128)throw new Error('Wind Rail 原变换未接通');
   this.rails.set(id,{node,matrix:Uint8Array.from(field.raw.match(/../g)!,h=>parseInt(h,16)),key:''});
  }
 }
 advance(delta:number){for(const entry of this.windEntries){const v=new DataView(entry.bytes.buffer,entry.bytes.byteOffset,entry.bytes.byteLength);v.setFloat32(176,advanceWindTimer(v.getFloat32(176,true),v.getFloat32(88,true),!!entry.bytes[80],delta),true);}}
 setTransform(id:number,matrix:Uint8Array){const rail=this.rails.get(id);if(!rail)return false;if(matrix.length!==64)throw new Error('Rail 变换必须为 64 字节');rail.matrix.set(matrix);rail.key='';return true;}
 private railCache(id:number){
  const rail=this.rails.get(id);if(!rail)throw new Error('Wind 原 Rail 缓存未接通');
  const refs=rail.node.fields.find(f=>f.name==='dataPoints')?.children??[],looped=rail.node.fields.find(f=>f.name==='looped');
  if(refs.length<2||!looped)throw new Error('Wind Rail 原控制点未接通');
  const points=refs.map(ref=>{const marker=this.objects.require(Number(ref.value));if(ref.kind!=='reference'||marker.node.className!=='Marker')throw new Error('Wind Rail 控制点 getter 未接通');return {world:unpack(this.objects.transform(marker.node.id)),obb:RAIL_MARKER_OBB};});
  const key=JSON.stringify([rail.matrix,points,looped.raw]);if(rail.cache&&key===rail.key)return rail.cache;
  rail.cache=buildRailCache(points,unpack(rail.matrix),looped.raw!=='00');rail.key=key;return rail.cache;
 }
 sample(position:number[],globalWind:number[]){
  const m=this.objects.memory,snapshots:WindSnapshot[]=this.windEntries.map(entry=>{
   const p=entry.pointer,v=new DataView(entry.bytes.buffer,entry.bytes.byteOffset,entry.bytes.byteLength),extra=entry.node.fields.find(f=>f.name==='additionalWindMarkers'),additionalBoxes:number[][]=[];
   if(extra&&extra.value!==0xffffffff){const clump=this.objects.require(Number(extra.value));if(clump.node.className!=='Clump')throw new Error('Wind 附加范围未解析为 Clump');
    for(const ref of clump.node.fields.find(f=>f.name==='data')?.children??[]){const marker=this.objects.require(Number(ref.value));if(marker.node.className!=='Marker')throw new Error('Wind 附加范围 Marker getter 未接通');additionalBoxes.push(unpack(getNativeMarkerWorldObb(marker.bytes)));}
   }
   const railId=Number(entry.node.fields.find(f=>f.name==='rail')?.value??0xffffffff);
   return {transform:unpack(m.bytes(p+16n,64)),enabled:!!entry.bytes[80],fadeDist:v.getFloat32(84,true),fadeTime:v.getFloat32(88,true),timer:v.getFloat32(176,true),intensity:v.getFloat32(92,true),order:v.getInt32(96,true),additionalBoxes,rail:railId===0xffffffff?undefined:this.railCache(railId)};
  });
  const forces=Array.from({length:32},()=>({a:{enabled:false,vector:[0,0,0]},b:{enabled:false,vector:[0,0,0]}}));
  return sampleEnvironmentWind({globalWind,winds:snapshots,forces},position);
 }
 info(){return {winds:this.windEntries.length,rails:this.rails.size,timers:this.windEntries.map(e=>({id:e.node.id,enabled:!!e.bytes[80],timer:new DataView(e.bytes.buffer,e.bytes.byteOffset,e.bytes.byteLength).getFloat32(176,true)})),scope:'Original saved Wind fields, Marker world OBBs and cached Rail equations. Native Rail lifecycle/selfUpdating and ambient/boundary/interaction force services remain separate; JS libm is an editor service.'};}
}
