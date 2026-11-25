import type {ObjectNode,Field} from './objects';
import {PreparedEnvironmentObjectState} from './environment-object-state';
import {loadOriginalDarkCreature,DARK_CREATURE_BONES} from './dark-creature-load-runtime';
import {updateOriginalDarkCreatureMotionPhase,type DarkCreatureMotionWorld} from './dark-creature-motion-runtime';
import {originalDarkCreatureCombatServices,originalDarkCreatureCombatMotionPhaseServices,type DarkCreatureCombatServices} from './dark-creature-combat-runtime';
import {alertOriginalDarkCreature} from './dark-creature-state-runtime';
import {detectOriginalDarkCreature} from './dark-creature-detect-runtime';
import {updateOriginalDarkCreatureVisualPhase} from './dark-creature-visual-runtime';
import {switchOriginalDarkCreatureRail,type DarkCreatureRailServices} from './dark-creature-rail-runtime';
import {seekOriginalCreatureMotion} from './creature-motion-runtime';
import {originalCreatureLength3} from './bird-load-runtime';
import {buildRailArcTable} from './rail-arc';
import {savedRailCache} from './rail-level';
import {railClosestPoint,railPosition,type RailCache} from './rail';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import {originalCreatureArithmetic as arithmetic} from './creature-arithmetic-capability';
import {addOriginalCloudDrop,CLOUD_DROP_BYTES} from './cloud-drop-runtime';
import type {CreatureWorldServices} from './creature-world-runtime';
const bytes=(v:readonly number[])=>new Uint8Array(Float32Array.from(v).buffer);
const read=(b:Uint8Array)=>Array.from(new Float32Array(b.buffer,b.byteOffset,b.length/4));
// Original DarkCreatureBarn.Initialize 0x1002751ff..0x10027528e calls
// Color.Pow(2.2f) on these literal colors; alpha is copied without Pow.
export const DARK_CREATURE_PALETTE={patrol:[.699999988079071,1,.800000011920929,1],attack:[1,.10000000149011612,.019999999552965164,1],idle:[0,0,0,1]};
const palette=Object.fromEntries(Object.entries(DARK_CREATURE_PALETTE).map(([name,v])=>[name,bytes(v.map((n,i)=>i===3?n:Math.fround(Math.pow(Math.fround(n),Math.fround(2.2)))))])) as Record<'patrol'|'attack'|'idle',Uint8Array>;
type Dragon={id:number;p:bigint;model:bigint;eye:bigint;bones:Map<bigint,string>;body:Uint8Array;eyeTransform:Uint8Array;color:Uint8Array;marker:Uint8Array;error?:string;};
export interface DarkCreaturePreviewWorld extends Pick<CreatureWorldServices,'raycast'> {
 boneTransform(id:number,name:string):readonly number[]|undefined;
 birds?():readonly {id:number;position:readonly number[];radius:number;enabled:boolean}[];
}
/** Original load/motion/chase/attack/look/spotlight/detection with one shared
 * saved address space. Renderer bone transforms, collision intersections and
 * the editor's local avatar are the world services. Audio, particles, online
 * permissions and automatic event dispatch remain explicit external owners. */
export class DarkCreatureWorldPreview {
 readonly state:PreparedEnvironmentObjectState;private dragons=new Map<number,Dragon>();private initial=new Map<number,Uint8Array>();private rails=new Map<bigint,RailCache>();private byPointer=new Map<bigint,number>();
 private owners:DarkCreatureMotionWorld;private avatar:bigint;private avatarMotion:bigint;private avatarActive=false;private birdSlots:bigint[]=[];private seed=0x64726167;private elapsed=0;private effects:{kind:string;id?:number}[]=[];private textureTypePointer:bigint;private cloudDrops=new Uint8Array(CLOUD_DROP_BYTES);
 constructor(private nodes:ObjectNode[],ids:number[],private world:DarkCreaturePreviewWorld){
  const selected=new Set<number>(),supported=new Set(['DarkCreature','DarkCreatureParams','Marker','Clump','Rail']);
  const collect=(id:number)=>{const n=nodes[id];if(!n||selected.has(id)||!supported.has(n.className))return;selected.add(id);const walk=(fs:Field[])=>{for(const f of fs){if(f.kind==='reference')collect(Number(f.value));if(f.children)walk(f.children);}};walk(n.fields);};ids.forEach(collect);
  this.state=new PreparedEnvironmentObjectState([...selected].map(id=>nodes[id]));const m=this.state.runtimeMemory;
  for(const e of this.state.entries.values()){this.byPointer.set(e.pointer,e.node.id);if(e.node.className==='Rail'){const cache=savedRailCache(e.node,nodes),length=buildRailArcTable(cache,32).totalLength;if(!(length>0)||!Number.isFinite(length))throw new Error('DarkCreature patrol Rail has no finite length');this.rails.set(e.pointer,cache);m.write32(e.pointer+24n,bits(length));m.write8(e.pointer+44n,Number(cache.looped));}}
  const avatars=this.state.allocate(32+16*0x2230);this.avatar=avatars+32n;this.avatarMotion=this.state.allocate(0xc00);const avatarPhysics=this.state.allocate(0x300),avatarStats=this.state.allocate(64);m.write64(this.avatar+24n,this.avatarMotion);m.write64(this.avatar+32n,avatarPhysics);m.write64(avatarPhysics+0x2a0n,this.avatarMotion);m.write64(this.avatar+48n,avatarStats);m.write32(avatarStats+8n,bits(1));m.write32(this.avatar+0xe0n,1);m.write8(this.avatar+0x1ef8n,1);
  this.owners={avatars,actors:this.state.allocate(512),birds:this.state.allocate(0x300),scene:this.state.allocate(512),context:this.state.allocate(512),audio:this.state.allocate(32),interaction:this.state.allocate(32),auxiliary:this.state.allocate(32),player:this.state.allocate(32),extra:this.state.allocate(32),effects:this.state.allocate(512)};
  m.write64(this.owners.effects+0xe8n,this.state.allocate(32));m.write64(this.owners.effects+0x160n,this.state.allocate(0x100));this.textureTypePointer=this.state.allocate(16);
  for(let i=0;i<64;i++){const p=this.state.allocate(0x100),params=this.state.allocate(32);m.write64(p+120n,params);m.write64(this.owners.birds+16n+BigInt(i*8),p);this.birdSlots.push(p);}
  for(const id of ids){const p=this.state.require(id).pointer,d:Dragon={id,p,model:0n,eye:0n,bones:new Map(),body:this.state.transform(id),eyeTransform:new Uint8Array(64),color:palette.idle.slice(),marker:new Uint8Array(64)};this.dragons.set(id,d);
   loadOriginalDarkCreature(m,p,{index:id,modelOwner:this.owners.scene,windOwner:this.owners.scene,markerOwner:this.owners.scene,sceneOwner:this.owners.scene,resourceOwner:this.owners.scene},{arithmetic,matrixScale:matrix=>{const out=new Uint8Array(16);[0,1,2].forEach(i=>new DataView(out.buffer).setUint32(i*4,originalCreatureLength3(matrix.subarray(i*16,i*16+16)),true));return out;},switchRail:(p,c)=>switchOriginalDarkCreatureRail(m,p,c,this.railServices()),random:()=>this.random(),allocateOptions:()=>new Uint8Array(96),createModel:(_owner,name,_shader,matrix)=>{const model=this.state.allocate(0x400),animation=this.state.allocate(32);m.write64(model+104n,animation);if(name==='CharDarkCreatureAnim')d.model=model;else d.eye=model;return model;},createTextureRef:()=>({handle:0n}),textureType:()=>this.textureTypePointer,lookupTexture:()=>0n,observeTexture:()=>{},requestTexture:()=>{},destroyTextureRef:()=>{},setTexture:()=>{},setFloat:()=>{},setVector:()=>{},setModelEnabled:()=>{},playDefault:()=>{},boneTransform:(_animation,name)=>{const bone=this.state.allocate(256);d.bones.set(bone,name);return bone;},whiteColor:bytes([1,1,1,1]),windType:()=>this.owners.scene,lookupWind:()=>this.owners.scene,windObjectType:()=>this.owners.scene,createWind:()=>this.state.allocate(128),commitWind:()=>{},createMarker:()=>this.state.allocate(96),setMarkerTransform:(_marker,matrix)=>{d.marker=matrix.slice();},activateMarker:()=>{},worldPosition:bone=>this.bonePosition(d,bone),globalPhase:0});
  }
  for(const e of this.state.entries.values())this.initial.set(e.node.id,e.bytes.slice());
 }
 private record(kind:string,id?:number){if(this.effects.length===64)this.effects.shift();this.effects.push({kind,id});}
 private random(){this.seed=(Math.imul(this.seed,1103515245)+12345)>>>0;return this.seed>>>1;}
 private bonePosition(d:Dragon,p:bigint){const name=d.bones.get(p);if(!name)throw new Error('DarkCreature bone pointer unavailable');const matrix=this.world.boneTransform(d.id,name);if(!matrix||matrix.length!==16||!matrix.every(Number.isFinite))throw new Error('DarkCreature requires the live original bone transform: '+name);return bytes(matrix.slice(12,16));}
 private railServices():DarkCreatureRailServices{return {nearestTime:(p,point)=>{const cache=this.rails.get(p);if(!cache)throw new Error('DarkCreature patrol/cooldown Rail unavailable');return bits(railClosestPoint(cache,read(point).slice(0,3)).parameter);},remainder:(n,d)=>bits(value(n)%value(d)),sample:(p,n)=>{const cache=this.rails.get(p);if(!cache)throw new Error('DarkCreature Rail unavailable');return bytes([...railPosition(cache,value(n)),0]);}};}
 reset(){for(const [id,initial] of this.initial)this.state.require(id).bytes.set(initial);for(const d of this.dragons.values()){d.body=this.state.transform(d.id);d.eyeTransform.fill(0);d.color=palette.idle.slice();delete d.error;}this.seed=0x64726167;this.elapsed=0;this.avatarActive=false;this.effects=[];}
 dispose(){this.state.dispose();this.dragons.clear();}
 awaken(id:number,awake:boolean){const d=this.dragons.get(id);if(d)this.state.runtimeMemory.write8(d.p+0x2c3n,Number(awake));}
 step(delta:number,avatar?:readonly number[]){if(!(delta>0))return;const m=this.state.runtimeMemory,dt=Math.fround(Math.min(.266,Math.max(.0001,delta))),packedDelta=bytes([dt,0,0,0]);this.elapsed+=dt;this.avatarActive=!!avatar;m.write8(this.avatar+0x21b2n,Number(this.avatarActive));if(avatar){const position=bytes([...avatar,0]);for(const offset of [16n,0x130n,0xb0n])m.bytes(this.avatarMotion+offset,16).set(position);}
  const birds=this.world.birds?.()??[];m.write32(this.owners.birds+0x210n,Math.min(64,birds.length));for(let i=0;i<Math.min(64,birds.length);i++){const b=birds[i],p=this.birdSlots[i];m.bytes(p+16n,16).set(bytes([...b.position,0]));m.write8(p+0xd0n,Number(b.enabled));m.write32(m.read64(p+120n)+24n,bits(b.radius));}
  const rail=this.railServices(),exp=(n:number)=>bits(Math.exp(value(n))),sine=(n:number)=>bits(Math.sin(value(n))),worldPosition=(p:bigint)=>{for(const d of this.dragons.values())if(d.bones.has(p))return this.bonePosition(d,p);throw new Error('DarkCreature world transform owner unavailable');};
  const findAvatar=(_barn:bigint,id:number)=>this.avatarActive&&id===1?this.avatar:0n,birdPosition=(p:bigint)=>m.bytes(p+16n,16).slice();
  new DataView(this.cloudDrops.buffer).setUint32(0x6010,0,true);for(const d of this.dragons.values()){if(d.error)continue;try{
   // Barn 0x10026bea1 calls Alert before Update (0x10026c146). Its own
   // cone, anchors, avatar energy and occlusion decide target acquisition.
   alertOriginalDarkCreature(m,d.p,bits(dt),[this.owners.avatars,this.owners.actors,this.owners.birds,this.owners.scene],{arithmetic,switchRail:(p,c)=>switchOriginalDarkCreatureRail(m,p,c,rail),seek:(p,target,weight)=>seekOriginalCreatureMotion(m,p,target,weight,0,arithmetic),worldPosition,detect:(p,result,target,radius,owners)=>detectOriginalDarkCreature(m,p,result,target,radius,owners,{arithmetic,queryAvatars:()=>this.avatarActive?[this.avatar]:[],enabled:()=>Number(this.avatarActive),worldPosition,birdPosition,atan2:(y,x)=>bits(Math.atan2(value(y),value(x))),cos:n=>bits(Math.cos(value(n))),raycast:(scene,origin,direction,maximum)=>{const hit=this.world.raycast(scene,origin,direction,maximum,42);return hit.hit&&hit.active;}})});
   const combat:DarkCreatureCombatServices=originalDarkCreatureCombatServices(m,{arithmetic,globals:{hitTemplate:new Uint8Array(8),hitPalette:palette.attack,hitUpScratch:new Uint8Array(16)},exp,worldPosition,objectId:()=>0n,soundPlaying:()=>0,play:(_owner,name)=>{this.record(name,d.id);return {handle:0n,id:0n};},updateSound:()=>{},playAnimation:()=>{},interaction:(_owner,_p,kind)=>this.record('interaction:'+kind,d.id),birdPosition,hitBird:p=>{m.write8(p+0xd0n,0);this.record('bird-hit',d.id);},localAvatar:()=>this.avatar,setLocalHit:()=>this.record('avatar-hit',d.id),finishLocalHit:()=>{},createParticle:()=>{this.record('hit-particle',d.id);return this.state.allocate(0x140);}});
   const motion=originalDarkCreatureCombatMotionPhaseServices(m,{arithmetic,palette,seek:(p,target,weight)=>seekOriginalCreatureMotion(m,p,target,weight,0,arithmetic),switchRail:(p,c)=>switchOriginalDarkCreatureRail(m,p,c,rail),followRail:()=>{throw new Error('Composition must bind original FollowRail');},appear:()=>{throw new Error('Composition must bind original Appear');},forceScratch:new Uint8Array(16),findAvatar,avatarEnabled:()=>Number(this.avatarActive),birdPosition,sine,exp,worldPosition,updateBounds:()=>{},setModelTransform:(_model,matrix)=>{d.body=matrix.slice();}},rail,{...rail,arithmetic},{arithmetic,soundId:()=>0n,soundPlaying:()=>0,play:(_owner,name)=>{this.record(name,d.id);return {handle:0n,id:0n};}},combat);
   d.color=updateOriginalDarkCreatureMotionPhase(m,d.p,packedDelta,bits(this.elapsed),this.owners,motion);
   // Consecutive body -> look -> spotlight stages from original Update.
   updateOriginalDarkCreatureVisualPhase(m,d.p,d.body,packedDelta,bits(this.elapsed),{world:this.owners.scene,avatars:this.owners.avatars,birds:this.owners.birds,environment:this.owners.context},{arithmetic,worldPosition,setEyeTransform:(_model,matrix)=>{d.eyeTransform=matrix.slice();},exp,sine,acos:n=>bits(Math.acos(value(n))),sinCos:n=>bytes([Math.sin(value(n)),Math.cos(value(n)),0,0]),rayQueryScratch:new Uint8Array(32),colorScratch:d.color,phaseBits:()=>0x3e32b8c3,castRay:(scene,origin,direction,length)=>{const hit=this.world.raycast(scene,origin,direction,length,42);return hit.hit&&hit.active?hit.position:null;},findAvatar,birdPosition,environmentColor:(_owner,tint,position,radius,intensity,sharpness)=>{addOriginalCloudDrop(this.cloudDrops,tint,typeof position==='bigint'?m.bytes(position,16):position,value(radius),value(intensity),value(sharpness));},setDiffuseColor:(_model,color)=>{d.color=color.slice();},setMarkerTransform:(_marker,matrix)=>{d.marker=matrix.slice();}});
   if(!read(d.body).every(Number.isFinite))throw new Error('DarkCreature original motion produced non-finite geometry');
  }catch(error){d.error=String((error as Error).message);}}
 }
 snapshot(id:number){const d=this.dragons.get(id);if(!d)return;const m=this.state.runtimeMemory,p=d.p;return {algorithm:'DarkCreature original Load / Rail / motion / combat / look / spotlight / detect',position:read(m.bytes(p+0x60n,16)).slice(0,3),velocity:read(m.bytes(p+0xa0n,16)).slice(0,3),transform:read(d.body),eyeTransform:read(d.eyeTransform),color:read(d.color),spotlight:read(m.bytes(p+0x1b0n,16)).slice(0,3),radius:value(m.read32(p+0x1d0n)),state:m.read32(p+0x2e0n),targetKind:m.bytes(p+0x2c7n,1)[0],target:read(m.bytes(p+0x130n,16)).slice(0,3),awake:!!m.bytes(p+0x2c3n,1)[0],appeared:!!m.bytes(p+0x2c4n,1)[0],cooldown:!!m.bytes(p+0x2c5n,1)[0],railTime:value(m.read32(p+0x2d4n)),effects:this.effects.slice(),error:d.error};}
}
