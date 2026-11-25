import {halfFloat} from './resources';
import {probeHalfBase,probeHalfShift} from './probe-tables';
import {railTransform,type RailCache} from './rail';

const f=Math.fround,add=(a:number,b:number)=>f(a+b),sub=(a:number,b:number)=>f(a-b),mul=(a:number,b:number)=>f(a*b),div=(a:number,b:number)=>f(a/b);
const scratch=new Float32Array(1),bits=new Uint32Array(scratch.buffer);
const half=(n:number)=>{scratch[0]=n;const b=bits[0],i=b>>>23;return (probeHalfBase[i]+((b&0x7fffff)>>>probeHalfShift[i]))&0xffff;};
const length=(v:number[])=>f(Math.sqrt(add(mul(v[2],v[2]),add(mul(v[0],v[0]),mul(v[1],v[1])))));
const shuffle=(v:number[])=>[v[2],v[0],v[1],v[3]];
export const BIRD_FLOCK_WING_HALF2=Uint16Array.from([0,0x3e00,0x3800,0xbc00,0,0xbc00,0xb800,0xbc00,0,0xb800,0,0x3800,0x3e00,0,0xbe00,0]);
export const BIRD_FLOCK_WING_INDICES=Uint32Array.from([0,1,2,2,3,0,4,5,6,5,4,7]);
export const BIRD_FLOCK_VERTEX_STRIDE=24;
export const BIRD_FLOCK_ATTRIBUTES={a_userdata0:{offset:0,format:'vec4'},a_userdata1:{offset:16,format:'snorm4'},a_position:{offset:20,format:'half2'}} as const;
export interface BirdFlockStreamSettings {maxInstances:number;spawnRate:number;travelSpeed:number;spinScalar:number;enabled:boolean;prepopulate?:boolean;}
export interface BirdFlockStreamMath {sincos(angle:number):[number,number];random():number;}
export interface BirdFlockSection {center:number[];right:number[];up:number[];quaternion:Int8Array;}
/** The unbranched SIMD basis/quaternion calculation at 0x10019c0ad..1b4.
 * Flock wing geometry faces +Z, unlike the separate BirdV2 Actor model. */
export function birdFlockSectionQuaternion(direction:number[]):Int8Array {
 const n=length(direction),d=n>f(.00001)?direction.map(v=>div(v,n)):[-0,-0,-1,0];
 const p=shuffle(d),x=d.map((v,i)=>sub(mul(v,[0,0,1,0][i]),mul(p[i],[0,1,0,0][i]))),y=shuffle(x),z=shuffle(y);
 const u=p.map((v,i)=>sub(mul(v,y[i]),mul(d[i],z[i])));
 const w=mul(f(Math.sqrt(add(d[2],add(u[0],add(x[2],1))))),.5),inverse=div(1,mul(w,4));
 const q=[mul(inverse,sub(u[1],d[1])),mul(inverse,sub(d[0],x[1])),mul(inverse,sub(x[0],u[2])),w];
 return Int8Array.from(q.map(v=>Math.trunc(mul(v,f(127.999)))));
}
/** Rail cache sampling, count and axis copies from 0x10019beb7..1c4.
 * Rail lifecycle supplies its initialized cache and GetLength result. */
export function birdFlockRailSections(cache:RailCache,railLength:number):BirdFlockSection[] {
 const count=Math.trunc(mul(mul(Math.min(3,Math.max(1,div(railLength,250))),5),cache.positions.length));
 const step=div(1,count),sections:BirdFlockSection[]=Array.from({length:count},(_,i)=>{const m=railTransform(cache,mul(i,step));return {center:m.slice(12,16),right:m.slice(0,4),up:m.slice(4,8),quaternion:new Int8Array(4)};});
 for(let i=0;i<count;i++)sections[i].quaternion=birdFlockSectionQuaternion(sections[(i+1)%count].center.map((v,k)=>sub(v,sections[i].center[k])));
 return sections;
}
/** Original 48-byte bird records. This ports the rail travel, half offsets,
 * removal/replacement and ordinary spawning slices of BirdFlock.Update
 * 0x10019bdc0, including prepopulation. Avatar impulse/audio/events are separate. */
export class BirdFlockStream {
 readonly records:Uint8Array;readonly view:DataView;count=0;accumulator=0;
 private readonly math:BirdFlockStreamMath;
 private geometryBuffers?:{count:number;vertices:Uint8Array;positions:Float32Array;indices:Uint32Array;words:Uint32Array};
 constructor(readonly sections:BirdFlockSection[],readonly looped:boolean,readonly settings:BirdFlockStreamSettings,math?:BirdFlockStreamMath){
  if(!Number.isInteger(settings.maxInstances)||settings.maxInstances<0||settings.maxInstances>10240||![settings.spawnRate,settings.travelSpeed,settings.spinScalar].every(Number.isFinite))throw new Error('鸟群流参数无效');
  this.sections=sections.map(s=>({center:s.center.map(f),right:s.right.map(f),up:s.up.map(f),quaternion:s.quaternion.slice()}));
  this.settings={...settings,spawnRate:f(settings.spawnRate),travelSpeed:f(settings.travelSpeed),spinScalar:f(settings.spinScalar)};
  this.records=new Uint8Array(settings.maxInstances*48);this.view=new DataView(this.records.buffer);
  let seed=0x12345678;this.math=math??{sincos:a=>[f(Math.sin(a)),f(Math.cos(a))],random:()=>{seed=(Math.imul(seed,1103515245)+12345)>>>0;return seed>>>1;}};
 }
 reset(){this.records.fill(0);this.count=0;this.accumulator=0;}
 private target(index:number,x:number,y:number){const s=this.sections[index];return s.center.map((v,k)=>add(add(mul(x,s.right[k]),v),mul(y,s.up[k])));}
 private vector(at:number){return [0,4,8,12].map(i=>this.view.getFloat32(at+i,true));}
 private store(at:number,v:number[]){v.forEach((n,i)=>this.view.setFloat32(at+i*4,n,true));}
 private aim(at:number,target:number[]){const delta=target.map((v,i)=>sub(v,this.view.getFloat32(at+i*4,true))),n=length(delta);this.store(at+16,[...delta.slice(0,3).map(v=>div(v,n)),n]);}
 private spawn(segment:number){
  const at=this.count++*48,random=()=>mul(f(this.math.random()),f(1/2147483648)),rx=random(),x=add(rx,sub(rx,1)),ry=random(),y=add(ry,sub(ry,1)),n=length([x,y,0,0]);
  const direction=n>f(.00001)?[div(x,n),div(y,n)]:[0,0],radius=random();
  this.view.setUint16(at+32,half(mul(direction[0],radius)),true);this.view.setUint16(at+34,half(mul(direction[1],radius)),true);
  const ox=halfFloat(this.view.getUint16(at+32,true)),oy=halfFloat(this.view.getUint16(at+34,true)),phase=random();
  this.store(at,[...this.target(segment,ox,oy).slice(0,3),add(mul(phase,100),mul(sub(1,phase),0))]);
  this.aim(at,this.target((segment+1)%this.sections.length,ox,oy));this.view.setUint16(at+36,segment,true);return at;
 }
 /** Native prefill 0x10019cda6 / 0x10019d74a..db84. Center-segment
  * crossings reset the local spacing remainder instead of carrying it. */
 private prepopulate(){
  let total=0;for(let i=0;i<this.sections.length-(this.looped?0:1);i++)total=add(total,length(this.sections[(i+1)%this.sections.length].center.map((v,k)=>sub(v,this.sections[i].center[k]))));
  const requested=Math.ceil(div(total,div(this.settings.travelSpeed,this.settings.spawnRate))),count=Math.min(this.settings.maxInstances,Math.max(0,requested));
  if(!Number.isFinite(count)||!count)return;
  const spacing=div(total,count-1);let segment=0,distance=0,segmentLength=length(this.sections[1].center.map((v,k)=>sub(v,this.sections[0].center[k])));
  for(let i=0;i<count;i++){
   const at=this.spawn(segment),direction=this.vector(at+16),position=this.vector(at),phase=mul(Math.max(0,mul(distance,mul(add(.5,direction[1]),.25))),5);
   this.store(at,position.map((v,k)=>add(v,k===3?phase:mul(distance,direction[k]))));this.view.setFloat32(at+28,sub(direction[3],distance),true);
   distance=add(distance,spacing);if(distance>=segmentLength){segment=(segment+1)%this.sections.length;segmentLength=length(this.sections[(segment+1)%this.sections.length].center.map((v,k)=>sub(v,this.sections[segment].center[k])));distance=0;}
  }
 }
 step(delta:number){
  if(this.sections.length<2){this.count=0;this.accumulator=0;return;}
  if(!this.count&&this.settings.enabled&&this.settings.prepopulate)this.prepopulate();
  const dt=Math.min(f(.266),Math.max(f(.0001),f(delta))),distance=mul(dt,this.settings.travelSpeed);
  this.accumulator=add(this.accumulator,mul(dt,this.settings.spawnRate));
  const [sin,cos]=this.math.sincos(mul(this.settings.spinScalar,f(-.4))).map(f);
  for(let i=0;i<this.count;i++){
   const at=i*48;let remaining=distance,remove=false;
   // Degenerate adapter rails must not freeze the editor in a native zero
   // distance loop. Nondegenerate traversal keeps native operation order.
   let transitions=0;
   while(remaining>0){
    const segmentLength=this.view.getFloat32(at+28,true),travel=Math.min(segmentLength,remaining);
    for(let k=0;k<4;k++)this.view.setFloat32(at+k*4,add(this.view.getFloat32(at+k*4,true),k===3?mul(mul(travel,f(.2)),5):mul(travel,this.view.getFloat32(at+16+k*4,true))),true);
    remaining=sub(remaining,travel);const rest=sub(segmentLength,travel);
    if(rest>0){this.view.setFloat32(at+28,rest,true);continue;}
    const segment=this.view.getUint16(at+36,true),next=(segment+1)%this.sections.length,target=(segment+2)%this.sections.length;
    if(target===0){if(this.looped)this.accumulator=sub(this.accumulator,1);else remove=true;}
    this.view.setUint16(at+36,next,true);
    const x=halfFloat(this.view.getUint16(at+32,true)),y=halfFloat(this.view.getUint16(at+34,true));
    this.view.setUint16(at+32,half(sub(mul(cos,x),mul(sin,y))),true);this.view.setUint16(at+34,half(add(mul(sin,x),mul(cos,y))),true);
    this.aim(at,this.target(target,halfFloat(this.view.getUint16(at+32,true)),halfFloat(this.view.getUint16(at+34,true))));
    if(++transitions>this.sections.length*2&&!(this.view.getFloat32(at+28,true)>0)){remaining=0;remove=true;}
   }
   if(remove){this.count--;const last=this.count*48;this.records.copyWithin(at,last,last+38);i--;}
  }
  if(!this.settings.enabled){this.accumulator=0;return;}
  while(this.accumulator>=1){
   if(this.count<this.settings.maxInstances){
    this.spawn(0);
   }
   this.accumulator=sub(this.accumulator,1);
  }
 }
 /** One expanded Vulkan draw is an editor transport adapter for the native
  * 20-byte instance stream + immutable half2 wing buffer. */
 geometry(){
  const count=Math.max(1,this.count);let data=this.geometryBuffers;
  if(!data||data.count!==count){
   const vertices=new Uint8Array(count*8*24),positions=new Float32Array(count*8*3),indices=new Uint32Array(count*12),words=new Uint32Array(vertices.buffer),wing=new Uint32Array(BIRD_FLOCK_WING_HALF2.buffer);
   for(let i=0;i<count;i++){for(let v=0;v<8;v++)words[(i*8+v)*6+5]=wing[v];for(let k=0;k<12;k++)indices[i*12+k]=BIRD_FLOCK_WING_INDICES[k]+i*8;}
   data=this.geometryBuffers={count,vertices,positions,indices,words};
  }
  const {vertices,positions,indices,words}=data,records=new Uint32Array(this.records.buffer);
  for(let i=0;i<count;i++){
   const active=i<this.count,q=active?this.sections[this.view.getUint16(i*48+36,true)].quaternion:undefined,quaternion=q?((q[0]&255)|((q[1]&255)<<8)|((q[2]&255)<<16)|((q[3]&255)<<24))>>>0:0x7f000000;
   const x=active?this.view.getFloat32(i*48,true):1e10,y=active?this.view.getFloat32(i*48+4,true):1e10,z=active?this.view.getFloat32(i*48+8,true):1e10;
   for(let v=0;v<8;v++){const at=(i*8+v)*6,p=(i*8+v)*3;for(let k=0;k<4;k++)words[at+k]=active?records[i*12+k]:k===3?0:0x501502f9;words[at+4]=quaternion;positions[p]=x;positions[p+1]=y;positions[p+2]=z;}
  }
  return {vertices,positions,indices};
 }
 snapshot(){return {count:this.count,capacity:this.settings.maxInstances,accumulator:this.accumulator,birds:Array.from({length:Math.min(this.count,16)},(_,i)=>({position:this.vector(i*48).slice(0,3),phase:this.view.getFloat32(i*48+12,true),segment:this.view.getUint16(i*48+36,true),offset:[32,34].map(k=>halfFloat(this.view.getUint16(i*48+k,true)))}))};}
}
