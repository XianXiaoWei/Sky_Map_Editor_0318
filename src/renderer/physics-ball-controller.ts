import * as THREE from 'three';
import {BallCollisionWorld,initialPhysicsBall,stepPhysicsBall,type CollisionMesh,type PhysicsBallState} from '../core/physics-ball';
import type {CloudDistanceField} from '../core/cloud-volume';
import {AvatarSlidePreview} from '../core/avatar-slide-preview';
import type {AvatarState} from '../core/avatar-set-pos';
export class PhysicsBallController {
 readonly object:THREE.LineSegments;
 state?:PhysicsBallState;private world?:BallCollisionWorld;private field?:CloudDistanceField;private keys=new Set<string>();private jump=false;private lastTime=0;
 private touch={x:0,forward:0,vertical:0};
 setTouchInput(x:number,forward:number,vertical:number,jump=false){this.touch={x,forward,vertical};if(jump&&this.state)this.jump=true;}
 fly=false;follow=false;subject='球';private initial?:number[];avatarSlide?:AvatarSlidePreview;
 constructor(private scene:THREE.Scene,private camera:THREE.Camera,private orbit:{target:THREE.Vector3},private label:HTMLElement) {
  const sphere=new THREE.SphereGeometry(.6,16,10),wire=new THREE.WireframeGeometry(sphere);sphere.dispose();
  this.object=new THREE.LineSegments(wire,new THREE.LineBasicMaterial({color:0xffda86}));this.object.name='PhysicsTestBall';this.object.userData.dynamicViewport=true;this.object.visible=false;scene.add(this.object);
  window.addEventListener('keydown',e=>{if(!this.state||e.ctrlKey||e.metaKey||['INPUT','SELECT','TEXTAREA'].includes((e.target as HTMLElement)?.tagName)||document.querySelector('dialog[open]'))return;
   if(['KeyW','KeyA','KeyS','KeyD','KeyQ','KeyE','ArrowUp','ArrowDown','ArrowLeft','ArrowRight','Space'].includes(e.code)){e.preventDefault();e.stopImmediatePropagation();this.keys.add(e.code);if(e.code==='Space'&&!e.repeat)this.jump=true;}
  });
  window.addEventListener('keyup',e=>this.keys.delete(e.code));window.addEventListener('blur',()=>{this.keys.clear();this.jump=false;this.touch={x:0,forward:0,vertical:0};});
 }
 setView(camera:THREE.Camera,target:{target:THREE.Vector3}){this.camera=camera;this.orbit=target;}
 start(meshes:CollisionMesh[],position:number[],field?:CloudDistanceField,avatarState?:AvatarState) {
  const world=new BallCollisionWorld(meshes);this.world=world;this.field=field;this.avatarSlide=avatarState?new AvatarSlidePreview(avatarState):undefined;this.initial=position.slice();this.state=initialPhysicsBall(position);this.avatarSlide?.reset(position,this.state.radius);this.object.position.fromArray(position);this.object.visible=true;this.keys.clear();this.lastTime=performance.now();this.label.hidden=false;
 }
 reset(position=this.initial) {if(this.state&&position){this.initial=position.slice();const time=this.state.time;this.state=initialPhysicsBall(position);this.state.time=time;this.avatarSlide?.reset(position,this.state.radius);this.object.position.fromArray(position);this.scene.userData.physicsBallPosition=position.slice();this.keys.clear();this.jump=false;this.touch={x:0,forward:0,vertical:0};this.lastTime=performance.now();}}
 stop() {this.state=undefined;this.world=undefined;this.field=undefined;this.avatarSlide=undefined;this.object.visible=false;this.label.hidden=true;delete this.label.dataset.avatarSlide;this.keys.clear();this.jump=false;this.touch={x:0,forward:0,vertical:0};delete this.scene.userData.physicsBallPosition;}
 update(now:number,paused:boolean) {
  const elapsed=(now-this.lastTime)/1000;this.lastTime=now;if(!this.state||!this.world||paused)return;
  const has=(...keys:string[])=>keys.some(k=>this.keys.has(k)),forward=new THREE.Vector3();this.camera.getWorldDirection(forward);forward.y=0;if(forward.lengthSq()<1e-8)forward.set(0,0,-1);forward.normalize();
  const right=new THREE.Vector3(-forward.z,0,forward.x),move=forward.multiplyScalar(+has('KeyW','ArrowUp')-+has('KeyS','ArrowDown')+this.touch.forward).addScaledVector(right,+has('KeyD','ArrowRight')-+has('KeyA','ArrowLeft')+this.touch.x);
  const old=this.state.position;this.state=stepPhysicsBall(this.state,{move:move.toArray(),jump:this.jump,fly:this.fly,vertical:+has('KeyE','Space')-+has('KeyQ')+this.touch.vertical},elapsed,this.world,this.field,undefined,this.avatarSlide);this.jump=false;
  this.avatarSlide?.sync(this.state.position,this.state.velocity,this.state.radius);
  this.object.position.fromArray(this.state.position);
  if(this.follow){const offset=new THREE.Vector3().fromArray(this.state.position).sub(new THREE.Vector3().fromArray(old));this.camera.position.add(offset);this.orbit.target.add(offset);}
  this.scene.userData.physicsBallPosition=this.state.position.slice();
  this.label.textContent=`点击地形放置${this.subject} · ${this.state.cloud?'云内':this.state.grounded?'着地':'空中'} · ${document.documentElement.classList.contains('android')?'摇杆移动 · 点按跳跃':'WASD 微调 · 空格跳跃'}`;
  this.label.dataset.state=JSON.stringify(this.state);this.label.dataset.triangles=String(this.world.triangles);
  if(this.avatarSlide)this.label.dataset.avatarSlide=JSON.stringify({calls:this.avatarSlide.calls,queries:this.avatarSlide.queries,scope:this.avatarSlide.scope});
  Object.assign(this.object.userData,{physicsState:this.state});
 }
}
