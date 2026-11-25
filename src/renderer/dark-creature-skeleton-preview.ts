import * as THREE from 'three';
import type {ResourceAnimationPack} from '../core/resource-animation';
import {resourceAnimationSkeletonMatrices} from '../core/resource-animation-matrices';
import {solveOriginalFloppySpine,type FloppySpineState} from '../core/floppy-spine';
import {updateOriginalDarkCreatureLookPhase} from '../core/dark-creature-look-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from '../core/object-numeric-runtime';
import loadEvidence from '../../docs/dark-creature-load-native.json';
import motionEvidence from '../../docs/dark-creature-motion-native.json';

// Saved matrix scale -> DarkCreature.Load +0xd0 -> Update model matrix.
export const DARK_CREATURE_MODEL_SCALE=loadEvidence.vectors.halfScale[0]*value(motionEvidence.vectors.modelScale[0]);
const bytes=(v:ArrayLike<number>)=>new Uint8Array(Float32Array.from(v).buffer);

/** Editor owner for the original spatial spine solver and head-look kernel.
 * Motion/AI still supplies the editor's trajectory; JS Matrix/Quaternion and
 * libm adapters are visual services, not a bitwise native Transform claim. */
export class CreatureSpineSkeletonPreview {
 readonly chain:number[];
 private spine?:FloppySpineState;private scale=new THREE.Vector3();
 private storage=new Uint8Array(0x300);private view=new DataView(this.storage.buffer);private looking=false;
 direction=new THREE.Vector3();target?:THREE.Vector3;
 private head:number;private eye:number;
 private boneWorldPositions:number[]=[];private boneTransforms=new Map<string,number[]>();
 constructor(private pack:ResourceAnimationPack,private object:THREE.Object3D,private headLook=false){
  const sim=pack.bones.map((b,i)=>b.name.includes('_Sim')?i:-1).filter(i=>i>=0);
  const ancestor=(child:number,parent:number)=>{for(let p=pack.bones[child].parentLink;p>0;p=pack.bones[p-1].parentLink)if(p-1===parent)return true;return false;};
  // Native finds the terminal marked joint and walks direct parents backwards
  // for exactly the number of marked joints; wing branches are not the spine.
  const tail=sim.find(i=>!sim.some(j=>j!==i&&ancestor(j,i)));this.chain=[];
  if(tail!==undefined){let bone=tail;for(let i=0;i<sim.length;i++){if(bone<0)throw new Error('原冥龙 _Sim 骨骼链不完整');this.chain.unshift(bone);bone=pack.bones[bone].parentLink-1;}}
  this.head=pack.bones.findIndex(b=>b.name==='M_head_Con');this.eye=pack.bones.findIndex(b=>b.name==='M_eye');
 }
 reset(){this.spine=undefined;this.looking=false;this.storage.fill(0);this.direction.set(0,0,0);this.target=undefined;this.boneWorldPositions=[];this.boneTransforms.clear();}
 private matrices(pose:Float32Array){const local=resourceAnimationSkeletonMatrices(this.pack,pose);return local.scaled.map(m=>new THREE.Matrix4().multiplyMatrices(this.object.matrixWorld,new THREE.Matrix4().fromArray(m)));}
 apply(pose:Float32Array,delta:number){
  this.object.updateMatrixWorld(true);let world=this.matrices(pose);
  if(this.headLook&&this.head>=0&&(this.direction.lengthSq()>1e-10||this.target)){
   const m={bytes:(p:bigint,n:number)=>this.storage.subarray(Number(p),Number(p)+n),read32:(p:bigint)=>this.view.getUint32(Number(p),true),read64:(p:bigint)=>this.view.getBigUint64(Number(p),true),write32:(p:bigint,n:number)=>this.view.setUint32(Number(p),n,true),write64:(p:bigint,n:bigint)=>this.view.setBigUint64(Number(p),n,true),write8:(p:bigint,n:number)=>{this.storage[Number(p)]=n;},string:()=>''};
   if(!this.looking){const q=new THREE.Quaternion(),position=new THREE.Vector3(),scale=new THREE.Vector3();world[this.head+1].decompose(position,q,scale);this.storage.set(bytes(q.toArray()),0x110);this.looking=true;}
   this.storage.set(bytes([...this.direction.toArray(),0]),0xa0);m.write32(0x120n,bits(delta));m.write32(0x2e0n,this.target?1:0);
   if(this.target)this.storage.set(bytes([...this.target.toArray(),1]),0x130);
   const eye=new THREE.Vector3().setFromMatrixPosition(world[this.eye>=0?this.eye+1:this.head+1]);
   updateOriginalDarkCreatureLookPhase(m,0n,bytes(this.object.matrixWorld.elements),{
    worldPosition:()=>bytes([...eye.toArray(),1]),setEyeTransform:()=>{},exp:x=>bits(Math.exp(value(x))),sine:x=>bits(Math.sin(value(x))),acos:x=>bits(Math.acos(value(x))),sinCos:x=>bytes([Math.sin(value(x)),Math.cos(value(x)),0,0]),
   });
   const q=new THREE.Quaternion().fromArray([0,4,8,12].map(i=>this.view.getFloat32(0x110+i,true)));
   if(q.toArray().every(Number.isFinite)){
    const parent=this.pack.bones[this.head].parentLink,parentQ=new THREE.Quaternion();world[parent].decompose(new THREE.Vector3(),parentQ,new THREE.Vector3());
    q.premultiply(parentQ.invert());pose.set(q.toArray(),this.head*12+4);world=this.matrices(pose);
   }
  }
  if(this.chain.length<2){this.captureBoneTransforms(world);return;}
  const positions=this.chain.map(i=>new THREE.Vector3().setFromMatrixPosition(world[i+1])),modelScale=new THREE.Vector3().setFromMatrixScale(this.object.matrixWorld);
  if(!this.spine){
   const p=new Float32Array(this.chain.length*4),lengths=new Float32Array(this.chain.length),history=new Float32Array(512),directionHistory=new Float32Array(512);
   positions.forEach((v,i)=>{p.set([...v.toArray(),1],i*4);if(i)lengths[i]=positions[i-1].distanceTo(v);});
   for(let i=0;i<128;i++){history.set(i<this.chain.length?p.subarray(i*4,i*4+4):[0,1,0,0],i*4);directionHistory.set([0,1,0,0],i*4);}
   this.spine={positions:p,lengths,history,directionHistory};this.scale.copy(modelScale);
  }else if(modelScale.toArray().some((v,i)=>Math.abs(v-this.scale.getComponent(i))>Math.max(Math.abs(v),Math.abs(this.scale.getComponent(i)))*.01)){
   positions.forEach((v,i)=>{if(i)this.spine!.lengths[i]=positions[i-1].distanceTo(v);});this.scale.copy(modelScale);
  }
  this.spine.positions.set([...positions[0].toArray(),1]);
  const forward=new THREE.Vector3(0,1,0).transformDirection(world[this.chain[0]+1]);solveOriginalFloppySpine(this.spine,[...forward.toArray(),0]);
  for(let i=0;i<this.chain.length-1;i++){
   const bone=this.chain[i],child=this.chain[i+1],target=new THREE.Vector3().fromArray(this.spine.positions,(i+1)*4).applyMatrix4(world[bone+1].clone().invert());
   const source=new THREE.Vector3().fromArray(pose,child*12+8).normalize();if(target.lengthSq()<1e-10||source.lengthSq()<1e-10)continue;
   const q=new THREE.Quaternion().fromArray(pose,bone*12+4).multiply(new THREE.Quaternion().setFromUnitVectors(source,target.normalize()));
   pose.set(q.toArray(),bone*12+4);world=this.matrices(pose);
  }
  this.captureBoneTransforms(world);
  this.boneWorldPositions=this.chain.flatMap(i=>new THREE.Vector3().setFromMatrixPosition(world[i+1]).toArray());
 }
 private captureBoneTransforms(world:THREE.Matrix4[]){this.pack.bones.forEach((bone,i)=>this.boneTransforms.set(bone.name,world[i+1].toArray()));}
 boneTransform(name:string){return this.boneTransforms.get(name)?.slice();}
 snapshot(){return {algorithm:'FloppySpine',bones:this.chain.map(i=>this.pack.bones[i].name),positions:this.spine?Array.from(this.spine.positions):[],lengths:this.spine?Array.from(this.spine.lengths):[],boneWorldPositions:this.boneWorldPositions};}
}

/** DarkCreature adds its recovered head-look kernel to the shared spatial spine. */
export class DarkCreatureSkeletonPreview extends CreatureSpineSkeletonPreview {
 constructor(pack:ResourceAnimationPack,object:THREE.Object3D){super(pack,object,true);}
}
