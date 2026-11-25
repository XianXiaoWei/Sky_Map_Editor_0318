import * as THREE from 'three';
import type {ObjectNode} from '../core/objects';
import type {ResourceMesh} from '../core/resources';
import type {ResourceAnimationList} from '../core/resource-animation-list';
import {basicCreaturePlans,creatureNumber,sampleCreaturePath,type BasicCreaturePlan} from '../core/basic-creature-plan';
import {resourceModelGeometry} from './resource-model-renderer';
import {ModelAnimationPreviewController} from './model-animation-preview';
import {resourceModelPreviewActions,resourceModelDefaultAnimation} from '../core/resource-model-animation-preview';
import {DarkCreatureSkeletonPreview,CreatureSpineSkeletonPreview,DARK_CREATURE_MODEL_SCALE} from './dark-creature-skeleton-preview';
import {creatureModelTemplate,creatureTemplateScale,originalCreatureMaterial} from '../core/creature-model-binding';
import {BirdFlockStream,birdFlockRailSections} from '../core/bird-flock-stream';
import {savedRailCache} from '../core/rail-level';
import {buildRailArcTable} from '../core/rail-arc';
import {BirdWorldPreview} from '../core/bird-world-preview';
import {CreatureTerrainQuery} from './creature-terrain-query';
import {CrabWorldPreview} from '../core/crab-world-preview';
import {DarkCreatureWorldPreview} from '../core/dark-creature-world-preview';

import {projectDarkSearchEffect} from './dark-search-effect';
import {MoteStream} from '../core/mote-stream';

type Entry={plan:BasicCreaturePlan;object:THREE.Object3D;home:THREE.Vector3;rotation:THREE.Quaternion;auto:boolean;owned:boolean;visible:boolean;phase:number;distance:number;ring?:THREE.Mesh;beam?:THREE.Mesh;state:string;groundAt:number;skeleton?:CreatureSpineSkeletonPreview;flock?:BirdFlockStream;};
const UP=new THREE.Vector3(0,1,0),FORWARD=new THREE.Vector3(0,0,1);
const tint={bird:0xe2ede8,ray:0xb4daef,flock:0xe2ede8,crab:0x756b81,dark:0x333a48,buddy:0xeee3ce,fish:0xb4e4ee,butterfly:0xffffff};
export class BasicCreaturePreview {
 readonly animations=new ModelAnimationPreviewController();
 private entries:Entry[]=[];private elapsed=0;private last=0;private mode:'playing'|'paused'|'stopped'='playing';
 private geometries=new Map<string,THREE.BufferGeometry>();private terrain:THREE.Mesh[]=[];private ray=new THREE.Raycaster();
 private terrainQuery?:CreatureTerrainQuery;private nativeMotes?:MoteStream;private nativeBirds?:BirdWorldPreview;private nativeCrabs?:CrabWorldPreview;private nativeDragons?:DarkCreatureWorldPreview;
 private animationStarts=new Map<number,()=>void>();private animationSwitches=new Map<number,(name:string)=>void>();private objects?:Map<number,THREE.Object3D>;private generation=0;
 readonly report:{id:number;kind:string;resource:string;fallback?:string;animation?:string;error?:string}[]=[];
 reset(){
  this.generation++;this.animations.stop();this.restore();this.nativeMotes?.dispose();this.nativeMotes=undefined;this.nativeBirds?.dispose();this.nativeBirds=undefined;this.nativeCrabs?.dispose();this.nativeCrabs=undefined;this.nativeDragons?.dispose();this.nativeDragons=undefined;
  const shared=new Set(this.geometries.values()),disposed=new Set<THREE.BufferGeometry>();
  const release=(object:THREE.Object3D)=>{object.removeFromParent();object.traverse(child=>{if(child instanceof THREE.Mesh){if(!shared.has(child.geometry)&&!disposed.has(child.geometry)){child.geometry.dispose();disposed.add(child.geometry);}for(const material of Array.isArray(child.material)?child.material:[child.material])material.dispose();}});};
  for(const e of this.entries){if(e.ring)release(e.ring);if(e.beam)release(e.beam);if(e.owned){release(e.object);if(this.objects?.get(e.plan.id)===e.object)this.objects.delete(e.plan.id);}else{e.object.visible=e.visible;delete e.object.userData.basicCreature;delete e.object.userData.creatureResource;delete e.object.userData.creatureState;delete e.object.userData.creatureMoved;}}
  for(const g of shared)g.dispose();this.geometries.clear();this.animationStarts.clear();this.animationSwitches.clear();this.objects=undefined;this.entries=[];this.terrain=[];this.terrainQuery=undefined;this.report.length=0;this.elapsed=0;this.last=0;this.mode='playing';
 }
 private restore(){this.nativeMotes?.reset();this.nativeBirds?.reset();this.nativeCrabs?.reset();this.nativeDragons?.reset();for(const e of this.entries){e.object.position.copy(e.home);e.object.quaternion.copy(e.rotation);e.object.matrixAutoUpdate=e.auto;if(!e.auto)e.object.updateMatrix();e.object.updateMatrixWorld(true);e.skeleton?.reset();e.flock?.reset();if(e.plan.kind==='butterfly')this.updateMoteGeometry(e);if(e.flock)this.updateFlockGeometry(e);e.state='idle';if(e.ring)e.ring.visible=false;if(e.beam)e.beam.visible=false;}}
 togglePause(){if(this.mode==='stopped'){for(const start of this.animationStarts.values())start();this.startDragonPreview();}this.mode=this.mode==='playing'?'paused':'playing';this.last=0;}
 stop(){this.mode='stopped';this.elapsed=0;this.last=0;this.animations.stop();this.restore();for(const e of this.entries)e.groundAt=-Infinity;}
 private startDragonPreview(){for(const e of this.entries)if(e.plan.kind==='dark')this.nativeDragons?.awaken(e.plan.id,true);}
 get running(){return this.mode==='playing'&&this.entries.length>0;}
 get status(){return this.mode;}
 snapshot(){return {terrainQueries:this.terrainQuery?.stats,status:this.mode,elapsed:this.elapsed,instances:this.entries.length,objects:this.entries.map(e=>({id:e.plan.id,kind:e.plan.kind,position:e.object.position.toArray(),state:e.state,motion:this.nativeBirds?.snapshot(e.plan.id)??this.nativeCrabs?.snapshot(e.plan.id)??this.nativeDragons?.snapshot(e.plan.id),enabled:e.object.visible,skeleton:e.skeleton?.snapshot(),flock:e.flock?.snapshot(),motes:e.plan.kind==='butterfly'?this.nativeMotes?.snapshot(e.plan.id):undefined,spotlight:e.ring?.visible?{position:e.ring.position.toArray(),radius:e.ring.scale.x,color:(e.ring.material as THREE.MeshBasicMaterial).color.getHex()}:undefined})),resources:this.report};}
 async load(nodes:ObjectNode[],root:THREE.Group,objects:Map<number,THREE.Object3D>,load:(name:string)=>Promise<ResourceMesh>,list:ResourceAnimationList|undefined,transform:(n:ObjectNode,o:THREE.Object3D)=>void,current:()=>boolean,level='default'){
  this.reset();this.objects=objects;const generation=this.generation,active=()=>generation===this.generation&&current(),plans=basicCreaturePlans(nodes),models=new Map<string,Promise<ResourceMesh>>(),geometry=this.geometries;
  const get=(name:string)=>{let p=models.get(name);if(!p){p=load(name);models.set(name,p);}return p;};
  for(const plan of plans){
   if(plan.kind==='butterfly'){
    if(!active())return;const resource=await get('CharFlyBeingMiniAAnim');if(!active())return;
    const g=new THREE.BufferGeometry(),material=new THREE.MeshBasicMaterial({color:0xffffff,side:THREE.DoubleSide}),object=new THREE.Mesh(g,material);
    object.userData.nodeId=plan.id;object.userData.basicCreature=true;object.userData.creatureResource=plan.resource;object.userData.dynamicViewport=false;
    material.userData.nativeModel={shader:'MoteAnim',group:'Opaque',creatureNodeId:plan.id};g.userData.nativeMotes=true;object.frustumCulled=false;
    this.nativeMotes??=new MoteStream(nodes,resource,{raycast:(_s,origin,direction,maximum)=>{const read=(b:Uint8Array)=>new THREE.Vector3().fromArray(new Float32Array(b.buffer,b.byteOffset,4));const hit=this.terrainQuery?.cast(read(origin),read(direction),new Float32Array(Uint32Array.of(maximum).buffer)[0]);return hit?{hit:true,active:true,position:new Uint8Array(Float32Array.from([...hit.point.toArray(),0]).buffer),normal:new Uint8Array(Float32Array.from([...(hit.face?.normal.clone().applyNormalMatrix(new THREE.Matrix3().getNormalMatrix(hit.object.matrixWorld))??UP).toArray(),0]).buffer)}:{hit:false,active:false,position:new Uint8Array(16),normal:new Uint8Array(16)};}});
    const e:Entry={plan,object,home:new THREE.Vector3(),rotation:new THREE.Quaternion(),auto:true,owned:true,visible:true,phase:0,distance:0,state:'idle',groundAt:-Infinity};this.entries.push(e);this.updateMoteGeometry(e);root.add(object);objects.set(plan.id,object);this.report.push({id:plan.id,kind:plan.kind,resource:plan.resource,animation:'Mote0.vert independent wing phase'});continue;
   }
   if(plan.kind==='flock'){
    const old=objects.get(plan.id);if(old){old.removeFromParent();if(old instanceof THREE.Mesh){old.geometry.dispose();for(const m of Array.isArray(old.material)?old.material:[old.material])m.dispose();}}
    const g=new THREE.BufferGeometry(),material=new THREE.MeshBasicMaterial({color:0xffffff,side:THREE.DoubleSide}),object=new THREE.Mesh(g,material);
    object.userData.nodeId=plan.id;object.userData.basicCreature=true;object.userData.creatureResource='BirdFlock';object.userData.dynamicViewport=false;
    material.userData.nativeModel={shader:'BirdFlock',group:'AlphaTestOpaque',creatureNodeId:plan.id};g.userData.nativeFlock=true;
    let flock:BirdFlockStream|undefined,error:string|undefined;
    try{const node=nodes[plan.id],rail=nodes[creatureNumber(node,'rail',-1)],cache=rail?savedRailCache(rail,nodes):undefined,length=cache?buildRailArcTable(cache,32).totalLength:0;
     flock=new BirdFlockStream(cache?birdFlockRailSections(cache,length):[],cache?.looped??false,{maxInstances:Math.max(0,Math.min(10240,Math.trunc(creatureNumber(node,'maxInstances',1000)))),spawnRate:creatureNumber(node,'spawnRate',5),travelSpeed:creatureNumber(node,'travelSpeed',4),spinScalar:creatureNumber(node,'spinScalar',0),enabled:plan.savedEnabled,prepopulate:creatureNumber(node,'prepopulate',0)!==0});
    }catch(err){error=String((err as Error).message);}
    const e:Entry={plan,object,home:new THREE.Vector3(),rotation:new THREE.Quaternion(),auto:true,owned:true,visible:true,phase:0,distance:0,state:'stream',groundAt:-Infinity,flock};
    this.entries.push(e);this.report.push({id:plan.id,kind:plan.kind,resource:'BirdFlock',animation:'Bird0.vert distance phase',...error?{error}:{}});this.updateFlockGeometry(e);root.add(object);objects.set(plan.id,object);continue;
   }
   if(!active())return;let resource:ResourceMesh|undefined,actual=plan.resource,error:string|undefined;
   try{resource=await get(actual);}catch{actual=plan.fallback;try{resource=await get(actual);}catch(e){error=String((e as Error).message);}}
   if(!active())return;
   const row={id:plan.id,kind:plan.kind,resource:actual,...actual!==plan.resource?{fallback:plan.resource}:{},...error?{error}:{} } as typeof this.report[number];this.report.push(row);
   let object=plan.kind==='fish'?objects.get(plan.id):undefined;const owned=!object,visible=object?.visible??true;
   if(!object){const old=objects.get(plan.id);if(old){root.remove(old);if(old instanceof THREE.Mesh){old.geometry.dispose();for(const m of Array.isArray(old.material)?old.material:[old.material])m.dispose();}}
    if(resource){let g=geometry.get(actual);if(!g){g=resourceModelGeometry(resource);geometry.set(actual,g);}object=new THREE.Mesh(g,new THREE.MeshBasicMaterial({color:0xffffff}));object.userData.sharedResource=true;}
    else object=this.placeholder(plan);
    object.userData.nodeId=plan.id;transform(nodes[plan.id],object);
    if(plan.kind==='dark'&&resource){object.scale.multiplyScalar(DARK_CREATURE_MODEL_SCALE);object.updateMatrix();}
    else if(resource){
     const scale=new THREE.Vector3().fromArray(creatureTemplateScale(nodes,plan.id));
     if(plan.kind==='bird'||plan.kind==='ray')object.scale.multiply(scale);else object.scale.copy(scale);
     object.updateMatrix();
    }
    root.add(object);objects.set(plan.id,object);
   }
   object.userData.basicCreature=true;object.userData.creatureResource=actual;object.visible=resource?plan.savedEnabled:true;
   if(resource&&object instanceof THREE.Mesh&&plan.kind!=='fish'&&(plan.kind==='dark'||creatureModelTemplate(nodes,plan.id))){
    const material=originalCreatureMaterial(nodes,level,plan.id);
    const materials=Array.isArray(object.material)?object.material:[object.material];
    for(const m of materials)m.userData.nativeModel={shader:material.shaderName,group:'Opaque',creatureNodeId:plan.id};
    object.userData.dynamicViewport=false;
   }else if(plan.kind!=='fish')object.userData.dynamicViewport=true;
   const home=object.position.clone(),rotation=object.quaternion.clone(),auto=object.matrixAutoUpdate;
   object.position.copy(home);
   const e:Entry={plan,object,home,rotation,auto,owned,visible,phase:plan.id*.73,distance:0,state:'patrol',groundAt:-Infinity};
   if(plan.kind==='dark'&&resource?.animation)e.skeleton=new DarkCreatureSkeletonPreview(resource.animation,object);
   else if(resource?.animation&&creatureNumber(creatureModelTemplate(nodes,plan.id),'floppySpine',0)!==0)e.skeleton=new CreatureSpineSkeletonPreview(resource.animation,object);
   if(plan.path.length){let nearest=0,best=Infinity,d=0;for(let i=0;i<plan.path.length;i++){if(i)d+=new THREE.Vector3().fromArray(plan.path[i]).distanceTo(new THREE.Vector3().fromArray(plan.path[i-1]));const delta=home.distanceToSquared(new THREE.Vector3().fromArray(plan.path[i]));if(delta<best){best=delta;nearest=d;}}e.distance=nearest;}
   this.entries.push(e);
   const animate=(id:number,mesh:THREE.Mesh)=>{if(!resource?.animated||!list)return;const start=()=>{try{e.skeleton?.reset();const options={...(e.skeleton?{poseModifier:(pose:Float32Array,delta:number)=>e.skeleton!.apply(pose,delta)}:{}),...(plan.kind==='bird'||plan.kind==='ray'?{secondaryName:'critterIdle',secondaryWeight:()=>this.nativeBirds?.animationWeight(plan.id)??0,randomStart:(Math.imul(plan.id+1,1664525)+1013904223)>>>1}:{})};const actions=resourceModelPreviewActions(resource,list),wanted=actions.find(a=>a.available&&(plan.kind==='bird'||plan.kind==='ray'||plan.kind==='flock'?a.name==='critterMove':plan.kind==='crab'?a.name==='idle':/walk|swim|patrol/i.test(a.name)));if(wanted)this.animations.start(id,mesh,resource!,list,wanted.name,options);else if(resourceModelDefaultAnimation(resource!,list).available)this.animations.startDefault(id,mesh,resource!,list,{...options,randomStart:(plan.id*997)>>>0});else {const first=actions.find(a=>a.available);if(first)this.animations.start(id,mesh,resource!,list,first.name,options);}row.animation=this.animations.snapshot(id)?.name;}catch(err){row.error=String((err as Error).message);}};this.animationStarts.set(id,start);this.animationSwitches.set(id,name=>{if(!resource||!list||!resourceModelPreviewActions(resource,list).some(a=>a.name===name&&a.available))return;this.animations.start(id,mesh,resource,list,name);row.animation=name;});start();};
   if(object instanceof THREE.Mesh)animate(plan.id,object);
   if(plan.kind==='dark'){
    e.ring=new THREE.Mesh(new THREE.RingGeometry(.86,1,24),new THREE.MeshBasicMaterial({color:0x53bfff,side:THREE.DoubleSide,transparent:true,opacity:.85,depthWrite:false}));e.ring.visible=false;e.ring.rotation.x=-Math.PI/2;e.ring.userData.dynamicViewport=true;e.ring.userData.creatureEffect=true;root.add(e.ring);
    e.beam=new THREE.Mesh(new THREE.ConeGeometry(1,1,24,1,true),new THREE.MeshBasicMaterial({color:0x53bfff,side:THREE.DoubleSide,transparent:true,opacity:.09,depthWrite:false}));try{const source=await get('LightShaftCone_01_CompOcc_CompEdges');if(!active()){e.beam.geometry.dispose();return;}e.beam.geometry.dispose();const g=new THREE.BufferGeometry();g.setAttribute('position',new THREE.BufferAttribute(source.positions,3));g.setIndex(new THREE.BufferAttribute(source.indices,1));e.beam.geometry=g;e.beam.userData.originalSearchCone=true;}catch{}e.beam.visible=false;e.beam.userData.dynamicViewport=true;e.beam.userData.creatureEffect=true;root.add(e.beam);
   }
  }
  this.terrain=[];root.traverse(o=>{if(o instanceof THREE.Mesh&&!o.userData.editorHelper&&!o.userData.basicCreature&&!o.userData.creatureEffect&&!o.userData.dynamicViewport&&!o.geometry.userData.nativeAnimated&&o.visible)this.terrain.push(o);});
  this.terrainQuery=new CreatureTerrainQuery(this.terrain);
  const raycast:import('../core/creature-world-runtime').CreatureWorldServices['raycast']=(_scene,origin,direction,maximum)=>{
   const read=(b:Uint8Array)=>new THREE.Vector3().fromArray(new Float32Array(b.buffer,b.byteOffset,4));const eye=read(origin),axis=read(direction),distance=new Float32Array(Uint32Array.of(maximum).buffer)[0];
   if(![...eye.toArray(),...axis.toArray(),distance].every(Number.isFinite)||axis.lengthSq()<1e-12||distance<=0)return {hit:false,active:false,position:new Uint8Array(16),normal:new Uint8Array(16)};
   this.ray.set(eye,axis.normalize());this.ray.near=0;this.ray.far=distance;const hit=this.terrainQuery?.cast(eye,axis,distance);
   return hit?{hit:true,active:true,position:new Uint8Array(Float32Array.from([...hit.point.toArray(),0]).buffer),normal:new Uint8Array(Float32Array.from([...(hit.face?.normal.clone().applyNormalMatrix(new THREE.Matrix3().getNormalMatrix(hit.object.matrixWorld))??UP).toArray(),0]).buffer)}:{hit:false,active:false,position:new Uint8Array(16),normal:new Uint8Array(16)};
  };
  const bindError=(ids:number[],error:unknown)=>{for(const row of this.report)if(ids.includes(row.id))row.error=String((error as Error).message);};
  const birdIds=plans.filter(p=>p.kind==='bird'||p.kind==='ray').map(p=>p.id);
  if(birdIds.length)try{this.nativeBirds=new BirdWorldPreview(nodes,birdIds,{raycast});}catch(error){bindError(birdIds,error);}
  const crabIds=plans.filter(p=>p.kind==='crab'&&creatureModelTemplate(nodes,p.id)).map(p=>p.id);
  if(crabIds.length)try{this.nativeCrabs=new CrabWorldPreview(nodes,crabIds,{raycast});}catch(error){bindError(crabIds,error);}
  const darkIds=plans.filter(p=>p.kind==='dark'&&this.entries.find(e=>e.plan.id===p.id)?.skeleton&&creatureNumber(nodes[p.id],'params',-1)>=0).map(p=>p.id);
  if(darkIds.length)try{this.nativeDragons=new DarkCreatureWorldPreview(nodes,darkIds,{raycast,boneTransform:(id,name)=>this.entries.find(e=>e.plan.id===id)?.skeleton?.boneTransform(name),birds:()=>birdIds.flatMap(id=>{const s=this.nativeBirds?.snapshot(id);return s&&!s.error?[{id,position:s.position,radius:creatureNumber(nodes[creatureNumber(nodes[id],'boidParams',-1)],'radius',1),enabled:s.enabled}]:[];})});this.startDragonPreview();}catch(error){bindError(darkIds,error);}


 }
 private placeholder(plan:BasicCreaturePlan){const g=plan.kind==='crab'?new THREE.SphereGeometry(.55,12,8):new THREE.ConeGeometry(plan.kind==='dark'?2:.7,plan.kind==='dark'?12:2,8);return new THREE.Mesh(g,new THREE.MeshBasicMaterial({color:tint[plan.kind],side:THREE.DoubleSide}));}
 private updateFlockGeometry(e:Entry){
  const g=(e.object as THREE.Mesh).geometry,data=e.flock?.geometry()??{vertices:new Uint8Array(8*24),positions:new Float32Array(8*3),indices:Uint32Array.from([0,1,2,2,3,0,4,5,6,5,4,7])};
  const position=g.getAttribute('position') as THREE.BufferAttribute|undefined;if(position?.array===data.positions)position.needsUpdate=true;else g.setAttribute('position',new THREE.BufferAttribute(data.positions,3));if(g.index?.array!==data.indices)g.setIndex(new THREE.BufferAttribute(data.indices,1));g.userData.flockVertices=data.vertices;g.userData.nativePoseRevision=(g.userData.nativePoseRevision??0)+1;g.boundingBox=null;g.boundingSphere=null;
 }
 private updateMoteGeometry(e:Entry){const data=this.nativeMotes?.geometry(e.plan.id);if(!data)return;const g=(e.object as THREE.Mesh).geometry,position=g.getAttribute('position') as THREE.BufferAttribute|undefined;if(position?.array===data.positions&&g.userData.moteRevision===data.revision)return;g.userData.moteRevision=data.revision;if(position?.array===data.positions)position.needsUpdate=true;else g.setAttribute('position',new THREE.BufferAttribute(data.positions,3));if(g.index?.array!==data.indices)g.setIndex(new THREE.BufferAttribute(data.indices,1));g.userData.moteVertices=data.vertices;g.userData.nativePoseRevision=(g.userData.nativePoseRevision??0)+1;g.boundingBox=null;g.boundingSphere=null;}
 private floor(point:THREE.Vector3,above:number,depth:number){this.ray.set(point.clone().addScaledVector(UP,above),UP.clone().negate());this.ray.far=depth;return this.ray.intersectObjects(this.terrain,false)[0];}
 update(now:number,paused=false,avatar?:readonly number[]){
  const dt=this.last?Math.min(.266,Math.max(0,(now-this.last)/1000)):0;this.last=now;if(paused||!this.running)return;this.elapsed+=dt;this.terrainQuery?.beginFrame();
  this.nativeMotes?.step(dt,avatar);this.nativeBirds?.step(dt,avatar);this.nativeCrabs?.step(dt,avatar);this.nativeDragons?.step(dt,avatar);const subject=avatar?new THREE.Vector3().fromArray(avatar):undefined;
  for(const e of this.entries){const {plan,object,home}=e,t=this.elapsed,phase=e.phase,r=plan.radius;
   if(plan.kind==='butterfly'){if(dt>0)this.updateMoteGeometry(e);e.state='stream';const info=this.nativeMotes?.snapshot(plan.id);if(info?.errors.length){const row=this.report.find(r=>r.id===plan.id);if(row)row.error=info.errors[0];}object.userData.creatureState=e.state;object.userData.creatureMoved=dt>0&&(info?.count??0)>0;continue;}
   if(e.flock){if(dt>0){e.flock.step(dt);this.updateFlockGeometry(e);}e.state='stream';object.userData.creatureState=e.state;object.userData.creatureMoved=dt>0&&e.flock.count>0;continue;}
   const motion=this.nativeBirds?.snapshot(plan.id);
   if(plan.kind==='bird'||plan.kind==='ray'){
    const previous=object.position.clone();if(motion&&!motion.error){object.matrix.fromArray(motion.transform);object.matrix.decompose(object.position,object.quaternion,object.scale);object.scale.fromArray(motion.scale);object.matrixAutoUpdate=true;object.updateMatrix();object.updateMatrixWorld(true);e.skeleton?.direction.copy(object.position).sub(previous);e.state=motion.suspended?'suspended':motion.landWeight>=1?'landed':motion.landing?'landing':'flight';}else{e.state='motion-unavailable';const row=this.report.find(r=>r.id===plan.id);if(row&&motion?.error)row.error=motion.error;}
    object.userData.creatureState=e.state;object.userData.creatureMoved=previous.distanceToSquared(object.position)>1e-8;continue;
   }
   const native=this.nativeCrabs?.snapshot(plan.id)??this.nativeDragons?.snapshot(plan.id);
   if(native){const previous=object.position.clone();if(!native.error){object.matrix.fromArray(native.transform);object.matrix.decompose(object.position,object.quaternion,object.scale);object.matrixAutoUpdate=true;object.updateMatrix();object.updateMatrixWorld(true);e.state=plan.kind==='crab'?['','chase','flee','hide','home','idle','inspect','rest','wander','mote','flipped','rescue'][native.state]??'idle':['patrol','chase','attack','return','alert'][native.state]??'idle';
     if('animation' in native&&object instanceof THREE.Mesh){const old=this.animations.snapshot(plan.id);if(old&&old.name!==native.animation)this.animationSwitches.get(plan.id)?.(native.animation);}
     if(e.skeleton){e.skeleton.direction.fromArray(native.velocity);e.skeleton.target='targetKind' in native&&native.targetKind?new THREE.Vector3().fromArray(native.target):undefined;}
     if('spotlight' in native&&e.ring&&e.beam){
      if(native.awake&&native.appeared){const spot=new THREE.Vector3().fromArray(native.spotlight),eye=new THREE.Vector3().fromArray(native.eyeTransform,12);if(t-e.groundAt>=.066||!e.ring.visible){projectDarkSearchEffect(e.ring,e.beam,eye,spot,native.radius,(origin,direction,max)=>this.terrainQuery?.cast(origin,direction,max));e.groundAt=t;}(e.ring.material as THREE.MeshBasicMaterial).color.setRGB(...native.color.slice(0,3) as [number,number,number]);(e.beam.material as THREE.MeshBasicMaterial).color.copy((e.ring.material as THREE.MeshBasicMaterial).color);}
      else e.ring.visible=e.beam.visible=false;
     }
    }else{e.state='motion-unavailable';const row=this.report.find(r=>r.id===plan.id);if(row)row.error=native.error;}
    object.userData.creatureState=e.state;object.userData.creatureMoved=previous.distanceToSquared(object.position)>1e-8;continue;
   }
   const previous=object.position.clone();let target:THREE.Vector3,direction:THREE.Vector3;
   if(plan.path.length>1){const p=sampleCreaturePath(plan.path,e.distance+t*plan.speed);target=new THREE.Vector3().fromArray(p.position);direction=new THREE.Vector3().fromArray(p.direction);}
   else {const angle=t*plan.speed/r+phase;target=home.clone().add(new THREE.Vector3((Math.sin(angle)-Math.sin(phase))*r,plan.kind==='dark'?Math.sin(t*.7+phase)*1.5:plan.kind==='fish'?Math.sin(t)*.3:0,(Math.cos(angle)-Math.cos(phase))*r));direction=new THREE.Vector3(Math.cos(angle),0,-Math.sin(angle));}
   const near=subject&&subject.distanceTo(object.position)<(plan.kind==='dark'?32:plan.kind==='buddy'?12:5);
   e.state=near?(plan.kind==='dark'?'alert':plan.kind==='buddy'?'follow':plan.kind==='crab'?'charge':'evade'):'patrol';
   if(near&&subject){if(plan.kind==='dark'){target.lerp(subject.clone().addScaledVector(UP,10),.3);direction.copy(subject).sub(object.position);}else if(plan.kind==='buddy'||plan.kind==='crab'){target.copy(subject);target.y=home.y;direction.copy(target).sub(object.position);}else if(plan.kind!=='fish'){target.add(object.position.clone().sub(subject).normalize().multiplyScalar(4));}}
   object.position.lerp(target,1-Math.exp(-dt*(near?2:4)));
   if((plan.kind==='crab'||plan.kind==='buddy')&&t-e.groundAt>.2){const hit=this.floor(object.position,6,14);if(hit)object.position.y=hit.point.y+.15;e.groundAt=t;}
   if(direction.lengthSq()>1e-6){const forward=FORWARD.clone().negate();const q=new THREE.Quaternion().setFromUnitVectors(forward,direction.normalize());object.quaternion.slerp(q,1-Math.exp(-dt*3));}
   object.matrixAutoUpdate=true;object.updateMatrix();object.updateMatrixWorld(true);
   if(e.skeleton){e.skeleton.direction.copy(object.position).sub(previous);e.skeleton.target=near&&subject?subject:undefined;}
   if(e.ring&&e.beam){const forward=FORWARD.clone().negate().applyQuaternion(object.quaternion),spot=object.position.clone().addScaledVector(forward,12+Math.sin(t)*5);spot.y=home.y-15;
    if(near&&subject)spot.copy(subject);const hit=this.floor(spot,60,400);if(hit){spot.copy(hit.point);e.ring.quaternion.setFromUnitVectors(new THREE.Vector3(0,0,1),hit.face?hit.face.normal.clone().transformDirection(hit.object.matrixWorld):UP);}else e.ring.rotation.set(-Math.PI/2,0,0);
    spot.y+=.08;e.ring.position.copy(spot);const radius=near?2.5:10;e.ring.scale.setScalar(radius);(e.ring.material as THREE.MeshBasicMaterial).color.setHex(near?0xff4949:0x53bfff);e.ring.visible=true;
    const eye=object.position.clone().addScaledVector(UP,1),axis=eye.clone().sub(spot);e.beam.position.copy(eye).add(spot).multiplyScalar(.5);e.beam.quaternion.setFromUnitVectors(UP,axis.clone().normalize());e.beam.scale.set(radius,Math.max(.1,axis.length()),radius);(e.beam.material as THREE.MeshBasicMaterial).color.copy((e.ring.material as THREE.MeshBasicMaterial).color);e.beam.visible=true;
   }
   object.userData.creatureState=e.state;object.userData.creatureMoved=previous.distanceToSquared(object.position)>1e-8;
  }
  this.animations.step(dt);
 }
}
