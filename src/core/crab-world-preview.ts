import type {ObjectNode,Field} from './objects';
import {PreparedEnvironmentObjectState} from './environment-object-state';
import {loadOriginalCrab} from './crab-load-runtime';
import {initializeOriginalCrabAi} from './creature-ai-initialize-runtime';
import {initializeOriginalCreatureSteering,type CreatureSteeringCounters} from './creature-steering-runtime';
import {updateOriginalCrabAutonomousAi,type CrabAutonomousAiServices} from './crab-ai-update-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import {natureArithmetic} from './nature-event-runtime';
import {originalCreatureArithmetic as arithmetic} from './creature-arithmetic-capability';
import {crabGroundContact} from './crab-ground-contact';
import type {CreatureWorldServices} from './creature-world-runtime';
const bytes=(v:readonly number[])=>new Uint8Array(Float32Array.from(v).buffer);
const read=(b:Uint8Array)=>Array.from(new Float32Array(b.buffer,b.byteOffset,b.length/4));
const identity=bytes([1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]);
type Crab={id:number;p:bigint;initial:Uint8Array;stack:{state:bigint;update:bigint;score:bigint};turn:bigint;speed:bigint;error?:string;animation:string;grounded:boolean;};
/** Real saved Crab params -> original Load/AI -> turn and speed. The scene
 * ray provider and local Avatar are editor services. Offline network identity,
 * interaction UI and audio are deliberately not game/network implementations. */
export class CrabWorldPreview {
 readonly state:PreparedEnvironmentObjectState;
 private crabPointers=new Map<bigint,bigint>();private crabs=new Map<number,Crab>();private byPointer=new Map<bigint,number>();private initial=new Map<number,Uint8Array>();
 private game:bigint;private clock:bigint;private avatar:bigint;private avatarMotion:bigint;private avatarActive=false;private previousAvatar?:number[];
 private elapsed=0;private seed=0x6c726162;private counters:CreatureSteeringCounters={wander:0,flock:0,avoid:0};private queries=0;
 constructor(private nodes:ObjectNode[],ids:number[],private world:Pick<CreatureWorldServices,'raycast'>){
  const selected=new Set<number>(),supported=new Set(['Crab','CrabParams','LevelMesh','Marker','Clump']);
  const collect=(id:number)=>{const n=nodes[id];if(!n||selected.has(id)||!supported.has(n.className))return;selected.add(id);const walk=(fs:Field[])=>{for(const f of fs){if(f.kind==='reference')collect(Number(f.value));if(f.children)walk(f.children);}};walk(n.fields);};ids.forEach(collect);
  this.state=new PreparedEnvironmentObjectState([...selected].map(id=>nodes[id]));const m=this.state.runtimeMemory;
  for(const e of this.state.entries.values())this.byPointer.set(e.pointer,e.node.id);
  this.game=this.state.allocate(0x700);this.clock=this.state.allocate(64);this.avatar=this.state.allocate(0x100);this.avatarMotion=this.state.allocate(0xc00);
  m.write64(this.game+0x160n,this.clock);m.write32(this.clock+32n,bits(1));m.write64(this.avatar+24n,this.avatarMotion);
  for(const o of [0x138n,0x200n,0x220n,0x280n,0x300n,0x370n,0x380n,0x398n,0x418n,0x488n,0x5a8n])m.write64(this.game+o,this.state.allocate(0x600));
  const network=this.state.allocate(80),identityRecord=this.state.allocate(0x900);m.write64(this.game+0x178n,network);m.write64(network+56n,1n);m.write64(network+64n,identityRecord);
  const math=(op:'atan2f'|'asinf',args:number[])=>bits(op==='atan2f'?Math.atan2(value(args[0]),value(args[1])):Math.asin(value(args[0])));
  for(const id of ids){const p=this.state.require(id).pointer,model=this.state.allocate(0x400),animation=this.state.allocate(32);m.write64(model+104n,animation);
   loadOriginalCrab(m,p,this.game,{math,cloneModel:()=>model,localObb:mesh=>this.transform(mesh),playIdle:()=>{},frame:()=>0,rand:()=>this.random(),initializeAi:(ai,crab,seed,game)=>initializeOriginalCrabAi(m,ai,crab,seed,game,{rand:()=>this.random(),initializeMotion:motion=>initializeOriginalCreatureSteering(m,motion,m.read64(this.game+0x220n),m.read64(this.game+0x380n),m.read64(this.game+0x138n),this.counters)}),createGoSit:()=>this.state.allocate(256),createClump:(_owner,count)=>{const p=this.state.allocate(32);m.write64(p+8n,this.state.allocate(count*8));m.write32(p+16n,count);return p;},createTeleport:()=>this.state.allocate(80),castTeleport:o=>o-8n,assignString:()=>{},loadGoSit:()=>{}});
   this.crabPointers.set(p,p);this.crabPointers.set(p+8n,p);this.crabs.set(id,{id,p,initial:this.state.require(id).bytes.slice(),stack:{state:this.state.allocate(0x460),update:this.state.allocate(0x280),score:this.state.allocate(80)},turn:this.state.allocate(4),speed:this.state.allocate(4),animation:'idle',grounded:false});
  }
  for(const e of this.state.entries.values())this.initial.set(e.node.id,e.bytes.slice());
 }
 private random(){this.seed=(Math.imul(this.seed,1103515245)+12345)>>>0;return this.seed>>>1;}
 private transform(p:bigint){const id=this.byPointer.get(p);if(id===undefined)throw new Error('Crab template transform unavailable');return this.state.transform(id);}
 private crabPointer(o:bigint){return this.crabPointers.get(o)??0n;}
 private motion(o:bigint){const m=this.state.runtimeMemory,p=this.crabPointer(o);if(p)return m.bytes(p+16n,92).slice();if(o===this.avatar||o===this.avatar+8n){const v=new Uint8Array(92);v.set(m.bytes(this.avatarMotion+16n,16));v.set(identity.subarray(0,48),16);v.set(m.bytes(this.avatarMotion+80n,12),64);const d=new DataView(v.buffer);d.setFloat32(80,.6,true);d.setFloat32(88,1,true);return v;}const id=this.byPointer.get(o-8n)??this.byPointer.get(o);if(id!==undefined&&this.nodes[id].className==='Marker'){const t=this.state.transform(id),v=new Uint8Array(92);v.set(t.subarray(48,64));v.set(t.subarray(0,48),16);new DataView(v.buffer).setFloat32(80,1,true);return v;}throw new Error('Crab neighborhood motion unavailable');}
 private query(position:bigint,out:bigint,capacity:number,radius:number,flock=false){this.queries++;const m=this.state.runtimeMemory,v=read(m.bytes(position,16)),max=value(radius),selected:bigint[]=[];
  const add=(p:bigint,point:readonly number[])=>{if(selected.length<capacity&&Math.hypot(...point.slice(0,3).map((n,i)=>n-v[i]))<=max)selected.push(p);};
  for(const c of this.crabs.values())if(!c.error&&this.state.enabled(c.id))add(c.p,read(m.bytes(c.p+16n,16)));
  if(this.avatarActive)add(flock?this.avatar:this.avatar+8n,read(m.bytes(this.avatarMotion+16n,16)));
  if(!flock)for(const e of this.state.entries.values())if(e.node.className==='Marker'&&this.state.enabled(e.node.id))add(e.pointer+8n,read(this.state.transform(e.node.id).subarray(48)));
  selected.forEach((p,i)=>m.write64(out+BigInt(i*8),p));return selected.length;
 }
 reset(){for(const [id,b] of this.initial)this.state.require(id).bytes.set(b);for(const c of this.crabs.values()){c.animation='idle';c.grounded=false;delete c.error;}this.seed=0x6c726162;this.avatarActive=false;this.previousAvatar=undefined;this.queries=0;this.elapsed=0;}
 dispose(){this.state.dispose();this.crabs.clear();this.crabPointers.clear();}
 step(delta:number,avatar?:readonly number[]){if(!(delta>0))return;const m=this.state.runtimeMemory,a=natureArithmetic(arithmetic),dt=Math.fround(Math.min(.266,Math.max(.0001,delta)));this.elapsed+=dt;m.write32(this.clock+20n,bits(dt));m.write32(this.clock+36n,bits(this.elapsed));this.avatarActive=!!avatar;
  if(avatar){m.bytes(this.avatarMotion+16n,16).set(bytes([...avatar,0]));m.bytes(this.avatarMotion+80n,16).set(bytes(avatar.map((n,i)=>(n-(this.previousAvatar?.[i]??n))/dt).concat(0)));this.previousAvatar=[...avatar];}
  const sin=(n:number)=>bits(Math.sin(value(n))),cos=(n:number)=>bits(Math.cos(value(n))),atan2=(y:number,x:number)=>bits(Math.atan2(value(y),value(x)));
  const services:CrabAutonomousAiServices={arithmetic,query:(_owner,position,out,cap,filter,radius)=>this.query(position,out,cap,radius),readMotion:(out,o)=>m.bytes(out,92).set(this.motion(o)),sin,sincos:n=>({sin:sin(n),cos:cos(n)}),atan2,asin:n=>bits(Math.asin(value(n))),actorById:()=>0n,flameById:()=>0n,cast:()=>0n,
   behavior:{arithmetic,heightThresholdBits:bits(.9),castCrab:(_m,ref)=>this.crabPointer(m.read64(ref)),castMarker:(_m,ref)=>{const p=m.read64(ref)-8n,id=this.byPointer.get(p);return id!==undefined&&this.nodes[id].className==='Marker'?p:0n;},motionState:o=>this.motion(o),transform:p=>this.transform(p)},
   state:{cast:(ref,target)=>{const o=m.read64(ref),p=this.crabPointer(o);if(target==='CrabPointer')return p;const id=this.byPointer.get(o-8n);return target===0x10043ccc0n&&id!==undefined&&this.nodes[id].className==='Marker'?o-8n:0n;},actorActive:()=>0,nearestAvatar:()=>this.avatarActive?this.avatar:0n},
   flocking:{arithmetic,query:(_owner,position,out,cap,_filter,radius)=>this.query(position,out,cap,radius,true),cast:(_m,ref,kind)=>kind==='Actor'?this.crabPointer(m.read64(ref)):m.read64(ref)===this.avatar?this.avatar:0n,avatarMotion:o=>this.motion(o),obb:()=>{throw new Error('Crab flock received unsupported OBB');},fallbackWeightBits:()=>{throw new Error('Crab flock received unsupported OBB weight');}}
  };
  for(const c of this.crabs.values()){if(c.error||!this.state.enabled(c.id))continue;const p=c.p;try{
   updateOriginalCrabAutonomousAi(m,p+0xf0n,this.game,c.turn,c.speed,c.stack,services);
   // Outer Update 0x10025c8c9..0x10025c943: retain signed yaw and the
   // radius-dependent minimum movement while turning (1.5 native constant).
   const angular=m.read32(c.turn),yaw=a.add(m.read32(p+0xd0n),a.mul(angular,bits(dt)));m.write32(p+0xd0n,yaw);
   const minimum=a.mul(a.mul(angular&0x7fffffff,m.read32(m.read64(p+0x80n)+16n)),bits(1.5)),speed=a.max(m.read32(c.speed),minimum);
   const heading=value(yaw),pitch=value(m.read32(p+0xd4n)),direction=[Math.fround(Math.sin(heading)*Math.cos(pitch)),Math.fround(Math.sin(pitch)),Math.fround(Math.cos(heading)*Math.cos(pitch)),0],velocity=direction.map(n=>Math.fround(n*value(speed))),before=read(m.bytes(p+16n,16)),next=before.map((n,i)=>Math.fround(n+Math.fround(velocity[i]*dt)));
   // Scene collision service: sweep movement before placing the feet. A
   // missing ground hit retains the last height; it never snaps to y=0.
   const contact=crabGroundContact(before,next,velocity,dt,value(m.read32(p+96n)),this.world.raycast);next.splice(0,4,...contact.position);velocity.splice(0,4,...contact.velocity);c.grounded=contact.grounded;
   if(c.grounded){const normal=contact.normal,slope=-(normal[0]*direction[0]+normal[2]*direction[2])/Math.max(.00001,normal[1]);m.write32(p+0xd4n,bits(Math.atan(slope)));}
   m.bytes(p+16n,16).set(bytes(next));m.bytes(p+80n,16).set(bytes(velocity));this.updateBasis(c);
   // Original outer animation policy 0x10025da7e..0x10025db52.
   const actual=Math.hypot(...velocity.slice(0,3)),params=m.read64(p+0x80n),walk=value(m.read32(params+20n));
   c.animation=m.read32(p+0x140n)===10?'flip':value(m.read32(p+0x4d0n))>0?'pickedUp':actual>walk*.15000000596046448?'run':[3,7].includes(m.read32(p+0x140n))?'hide':'idle';
   if(![...next,...velocity].every(Number.isFinite))throw new Error('Crab original AI produced non-finite geometry');
  }catch(error){c.error=String((error as Error).message);}}
 }
 private updateBasis(c:Crab){const m=this.state.runtimeMemory,p=c.p,yaw=value(m.read32(p+0xd0n)),pitch=value(m.read32(p+0xd4n)),sy=Math.sin(yaw),cy=Math.cos(yaw),sp=Math.sin(pitch),cp=Math.cos(pitch);
  m.bytes(p+32n,48).set(bytes([-cy,0,sy,0,-sy*sp,cp,-cy*sp,0,-sy*cp,-sp,-cy*cp,0]));
 }
 snapshot(id:number){const c=this.crabs.get(id);if(!c)return;const m=this.state.runtimeMemory,p=c.p,axes=read(m.bytes(p+32n,48)),scale=read(m.bytes(p+0x4f0n,12)),position=read(m.bytes(p+16n,16)).slice(0,3);return {algorithm:'Crab original Load / autonomous AI / steering',position,velocity:read(m.bytes(p+80n,16)).slice(0,3),scale,transform:[...axes.map((n,i)=>n*scale[Math.floor(i/4)]),...position,1],state:m.read32(p+0x140n),animation:c.animation,enabled:this.state.enabled(id),grounded:c.grounded,queries:this.queries,error:c.error};}
}
