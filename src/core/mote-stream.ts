import * as THREE from 'three';
import type {ObjectNode} from './objects';
import type {ResourceMesh} from './resources';
import {PreparedEnvironmentObjectState} from './environment-object-state';
import {creatureNumber} from './basic-creature-plan';
import {updateOriginalSpawnMotes,type OriginalSpawnMotesServices} from './spawn-motes-runtime';
import {beginOriginalCreatureSteering,endOriginalCreatureSteering,initializeOriginalCreatureSteering} from './creature-steering-runtime';
import {wanderOriginalCreatureSteering} from './creature-force-runtime';
import {wanderMoteInRegion} from './mote-wander-runtime';
import {originalCreatureArithmetic} from './creature-arithmetic-capability';
import {getNativeMarkerWorldObb} from './marker-transform-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import type {CreatureWorldServices} from './creature-world-runtime';
const bytes=(v:readonly number[])=>new Uint8Array(Float32Array.from(v).buffer),read=(v:Uint8Array)=>Array.from(new Float32Array(v.buffer,v.byteOffset,v.byteLength/4));
export const MOTE_VERTEX_STRIDE=72;
export const MOTE_ATTRIBUTES={a_position:{format:'vec3',offset:0},a_color:{format:'unorm4',offset:12},a_uv0:{format:'vec2',offset:16},a_userdata0:{format:'vec3',offset:24},a_rotX:{format:'vec3',offset:36},a_rotY:{format:'vec3',offset:48},a_userdata2:{format:'vec3',offset:60}} as const;
const individuality=(seed:number)=>{const hash=(x:number)=>(Math.imul(Math.imul(Math.imul(x,x),0x3d73)+0xc0ae5,x)+0x5208dd0d)&0x7fffffff;return [Math.fround(1-Math.fround(Math.fround(hash((seed<<13)^seed))*2**-30)),Math.fround(1-Math.fround(Math.fround(hash(Math.imul(seed,0x22eb2000)^Math.imul(seed,0x11759)))*2**-30))];};
type Mote={p:bigint;spawn:number;params:ObjectNode;region?:number[];phase:number;individuality:number[];state:number;scale:number;brightness:number;unlitTime:number;wingSpeed:number;radius:number;error?:string;};
/** Original SpawnMotes schedule/random volume, Mote ordinary independent
 * wander/float32 integration, and original Mote0.vert deformation stream.
 * Avatar carrying, quest/rail-end transitions, audio and game LightHouse
 * interactions are explicit remaining game services. */
export class MoteStream {
 readonly state:PreparedEnvironmentObjectState;private motes:Mote[]=[];private events=new Map<number,{p:bigint;active:boolean;initial:Uint8Array}>();private slots:bigint[]=[];private seed=0x62757474;private currentSpawn=0;private elapsed=0;private counters={wander:0,flock:0,avoid:0};
 private groups=new Map<number,Mote[]>();private revision=0;private buffers=new Map<number,{count:number;revision:number;vertices:Uint8Array;positions:Float32Array;indices:Uint32Array}>();private output:bigint;
 constructor(private nodes:ObjectNode[],private mesh:ResourceMesh,private world:Pick<CreatureWorldServices,'raycast'>&{isMoteLit?:(position:readonly number[],params:ObjectNode)=>boolean}){
  const selected=nodes.filter(n=>['SpawnMotes','Marker'].includes(n.className));this.state=new PreparedEnvironmentObjectState(selected);this.output=this.state.allocate(16);
  for(const n of selected)if(n.className==='SpawnMotes'){const e=this.state.require(n.id);this.events.set(n.id,{p:e.pointer,active:creatureNumber(n,'autoStart',0)!==0,initial:e.bytes.slice()});}
 }
 private random=()=>{this.seed=(Math.imul(this.seed,1103515245)+12345)>>>0;return this.seed>>>1;};
 reset(){this.motes=[];this.groups.clear();this.revision++;this.elapsed=0;this.seed=0x62757474;this.counters={wander:0,flock:0,avoid:0};this.buffers.clear();for(const [id,e] of this.events){this.state.require(id).bytes.set(e.initial);e.active=creatureNumber(this.nodes[id],'autoStart',0)!==0;}}
 dispose(){this.state.dispose();this.motes=[];this.groups.clear();this.buffers.clear();}
 setEnabled(id:number,enabled:boolean){const e=this.events.get(id);if(!e)return;if(enabled&&!e.active){const m=this.state.runtimeMemory;m.write64(e.p+152n,0n);m.write32(e.p+148n,0);}e.active=enabled;}
 private spawn(position:Uint8Array,velocity:Uint8Array){
  if(this.motes.length>=256)return;const node=this.nodes[this.currentSpawn],params=this.nodes[creatureNumber(node,'params',-1)];if(params?.className!=='MoteParams')throw new Error('蝴蝶缺少原 MoteParams');
  const index=this.motes.length,p=this.slots[index]??(this.slots[index]=this.state.allocate(0x400)),m=this.state.runtimeMemory;m.bytes(p,0x400).fill(0);m.bytes(p+16n,16).set(bytes([...read(position).slice(0,3),0]));m.bytes(p+32n,48).set(bytes([1,0,0,0,0,1,0,0,0,0,1,0]));m.bytes(p+80n,16).set(bytes([...read(velocity).slice(0,3),0]));
  m.write32(p+96n,bits(Math.max(.001,creatureNumber(params,'radius',1))));m.write32(p+100n,bits(8));m.write32(p+104n,bits(1));initializeOriginalCreatureSteering(m,p+0xe0n,0n,0n,0n,this.counters);
  const region=this.state.entries.get(creatureNumber(params,'wanderRegion',-1));
  const mote:Mote={p,spawn:this.currentSpawn,params,region:region?.node.className==='Marker'?read(getNativeMarkerWorldObb(region.bytes)):undefined,phase:Math.fround(this.random()*2**-31*Math.fround(Math.PI*2)),individuality:individuality(index+1),state:2,scale:Math.fround(.08),brightness:1,unlitTime:0,wingSpeed:Math.fround(8+this.random()*2**-31*3),radius:creatureNumber(params,'radius',1)};
  this.motes.push(mote);let group=this.groups.get(this.currentSpawn);if(!group)this.groups.set(this.currentSpawn,group=[]);group.push(mote);
 }
 step(delta:number,avatar?:readonly number[]){if(!(delta>0))return;const dt=Math.fround(Math.min(.266,delta)),m=this.state.runtimeMemory;this.elapsed+=dt;this.revision++;
  const services:OriginalSpawnMotesServices={arithmetic:{calculate:(op,a,b)=>Math.fround(op==='add'?a+b!:op==='subtract'?a-b!:op==='multiply'?a*b!:op==='divide'?a/b!:Math.sqrt(a))},defaultEmitterParams:0n,createEmitter:()=>({pointer:0n,generation:0}),delta:()=>dt,randomInt:this.random,sincos:n=>({sinBits:bits(Math.sin(value(n))),cosBits:bits(Math.cos(value(n)))}),spawnMote:(_game,position,_params,velocity)=>this.spawn(position,velocity),start:p=>{for(const e of this.events.values())if(e.p===p)e.active=false;}};
  for(const [id,e] of this.events)if(e.active){this.currentSpawn=id;updateOriginalSpawnMotes(m,e.p,0n,services);}
  const arithmetic=originalCreatureArithmetic,s={arithmetic,random:this.random};
  for(const o of this.motes){if(o.error)continue;try{
   const before=read(m.bytes(o.p+16n,16)).slice(0,3),lit=this.world.isMoteLit?.(before,o.params)??false;
   // +0x34c is elapsed time outside LightHouse, not avatar distance.
   // State selection precedes motion; the light timer updates afterwards.
   o.state=o.unlitTime<.5?2:o.unlitTime<2?3:4;
   const variation=(n:number)=>Math.fround(Math.fround((1-Math.max(0,Math.min(1,n)))*Math.fround(.95))+Math.fround(Math.max(0,Math.min(1,n))*Math.fround(1.1))),sadness=Math.max(0,Math.min(1,creatureNumber(o.params,'sadness',0))),sadFactor=Math.fround((1-sadness)+Math.fround(sadness*Math.fround(.3))),maxSpeed=Math.fround((lit||o.unlitTime>=20?8:2)*Math.fround(variation(o.individuality[1])*sadFactor)),maxForce=Math.fround(8*Math.fround(variation(o.individuality[0])*sadFactor));m.write32(o.p+100n,bits(maxSpeed));
   beginOriginalCreatureSteering(m,o.p+0xe0n,o.p+16n,bits(dt),bits(maxForce));if(o.region)wanderMoteInRegion(m,o.p+0xe0n,o.region,s);else wanderOriginalCreatureSteering(m,o.p+0xe0n,bits(.5),bits(1),bits(1),bits(2),bits(1),s);
   endOriginalCreatureSteering(m,this.output,o.p+0xe0n,0,{arithmetic,collision:()=>new Uint8Array(16)});
   const acceleration=read(m.bytes(this.output,16)),velocity=read(m.bytes(o.p+80n,16)).slice(0,3).map((n,i)=>Math.fround(n+Math.fround(acceleration[i]*dt))),speed=Math.hypot(...velocity);
   if(speed>maxSpeed)for(let i=0;i<3;i++)velocity[i]=Math.fround(velocity[i]*maxSpeed/speed);
   // Native motion heading is restricted to 25..165 degrees from world up.
   const heading=new THREE.Vector3().fromArray(velocity),length=heading.length(),angle=length>1e-5?Math.acos(Math.max(-1,Math.min(1,heading.y/length))):0;
   if(length>1e-5&&(angle<.4363323152065277||angle>2.879793405532837)){const polar=Math.max(.4363323152065277,Math.min(2.879793405532837,angle)),azimuth=Math.atan2(heading.x,heading.z);velocity.splice(0,3,Math.fround(Math.sin(azimuth)*Math.sin(polar)*length),Math.fround(Math.cos(polar)*length),Math.fround(Math.cos(azimuth)*Math.sin(polar)*length));}
   let next=before.map((n,i)=>Math.fround(n+Math.fround(velocity[i]*dt)));const travel=Math.hypot(...velocity)*dt;
   if(travel>1e-5){const hit=this.world.raycast(0n,bytes([...before,0]),bytes([...velocity.map(n=>n/Math.hypot(...velocity)),0]),bits(travel+Math.max(.02,o.radius*.15)),42);if(hit.hit&&hit.active){const normal=read(hit.normal),dot=velocity.reduce((n,v,i)=>n+v*normal[i],0);if(dot<0)for(let i=0;i<3;i++)velocity[i]-=dot*normal[i];next=before.map((n,i)=>Math.fround(n+velocity[i]*dt));}}
   if(![...next,...velocity].every(Number.isFinite))throw new Error('蝴蝶运动坐标无效');m.bytes(o.p+16n,16).set(bytes([...next,0]));m.bytes(o.p+80n,16).set(bytes([...velocity,0]));
   const z=new THREE.Vector3().fromArray(velocity).normalize().negate();if(z.lengthSq()>1e-6){const x=new THREE.Vector3(0,1,0).cross(z).normalize(),y=z.clone().cross(x).normalize();m.bytes(o.p+32n,48).set(bytes([...x.toArray(),0,...y.toArray(),0,...z.toArray(),0]));}o.phase=Math.fround(Math.fround(o.phase+Math.fround(dt*o.wingSpeed))%Math.fround(Math.PI*2));
   const squaredDistance=avatar?before.reduce((n,v,i)=>Math.fround(n+Math.fround(Math.fround(v-avatar[i])**2)),0):0;
   const blend=Math.max(0,Math.min(1,Math.fround(Math.fround(squaredDistance+Math.fround(-819.2))*2**-14)));
   o.scale=Math.fround(Math.fround((1-blend)*Math.fround(.08))+Math.fround(blend*Math.fround(.32)));
   if(creatureNumber(o.params,'useLightHouse',0)!==0)o.unlitTime=lit?0:Math.fround(o.unlitTime+dt);
  }catch(error){o.error=String((error as Error).message);}}
 }
 geometry(spawn:number){const list=this.groups.get(spawn)??[],count=Math.max(1,list.length),n=this.mesh.positions.length/3;let g=this.buffers.get(spawn);
  if(!g||g.count!==count){g={count,revision:-1,vertices:new Uint8Array(count*n*MOTE_VERTEX_STRIDE),positions:new Float32Array(count*n*3),indices:new Uint32Array(count*this.mesh.indices.length)};const v=new DataView(g.vertices.buffer);for(let i=0;i<count;i++){for(let j=0;j<n;j++){const at=(i*n+j)*72;for(let k=0;k<3;k++)v.setFloat32(at+k*4,this.mesh.positions[j*3+k],true);for(let k=0;k<4;k++)v.setUint8(at+12+k,this.mesh.packedPositions![j*16+12+k]);v.setFloat32(at+16,this.mesh.uvs[j*8],true);v.setFloat32(at+20,this.mesh.uvs[j*8+1],true);}for(let k=0;k<this.mesh.indices.length;k++)g.indices[i*this.mesh.indices.length+k]=this.mesh.indices[k]+i*n;}this.buffers.set(spawn,g);}
  if(g.revision===(list.length?this.revision:0))return g;g.revision=list.length?this.revision:0;const v=new DataView(g.vertices.buffer),m=this.state.runtimeMemory;for(let i=0;i<count;i++){const o=list[i],position=o?read(m.bytes(o.p+16n,16)).slice(0,3):[1e10,1e10,1e10],axes=o?read(m.bytes(o.p+32n,32)):[1,0,0,0,0,1,0,0];for(let j=0;j<n;j++){const at=(i*n+j)*72;position.forEach((p,k)=>{v.setFloat32(at+24+k*4,p,true);g!.positions[(i*n+j)*3+k]=p;});for(let k=0;k<3;k++){v.setFloat32(at+36+k*4,axes[k],true);v.setFloat32(at+48+k*4,axes[k+4],true);}v.setFloat32(at+60,o?.scale??0,true);v.setFloat32(at+64,o?.brightness??0,true);v.setFloat32(at+68,o?.phase??0,true);}}return g;
 }
 snapshot(spawn:number){const list=this.groups.get(spawn)??[];return {algorithm:'SpawnMotes / independent bounded Mote wander / Mote0.vert',count:list.length,pending:this.events.get(spawn)?.active??false,motes:list.slice(0,8).map(o=>({position:read(this.state.runtimeMemory.bytes(o.p+16n,16)).slice(0,3),velocity:read(this.state.runtimeMemory.bytes(o.p+80n,16)).slice(0,3),phase:o.phase,scale:o.scale,brightness:o.brightness,unlitTime:o.unlitTime,state:o.state,error:o.error})),errors:list.flatMap(o=>o.error?[o.error]:[])};}
}
