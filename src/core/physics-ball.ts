import * as THREE from 'three';
import {queryCloudAvatar,type CloudAvatarQueryState} from './cloud-avatar-query';
import type {CloudDistanceField} from './cloud-volume';
export interface CollisionMesh {positions:Float32Array;indices:Uint32Array;matrix?:number[];}
interface Node {min:number[];max:number[];start:number;end:number;left?:Node;right?:Node;}
// Temporary read-only triangle acceleration for the editor's test ball.
// This neither rebuilds BstBaked collision data nor claims native Avatar
// locomotion parity. The cloud distance/normal query is the original path.
export class BallCollisionWorld {
 private vertices:Float32Array;private order:Uint32Array;private root?:Node;
 constructor(meshes:CollisionMesh[]) {
  const points:number[]=[];const p=new THREE.Vector3(),matrix=new THREE.Matrix4();
  for(const mesh of meshes) {
   if(mesh.positions.length%3||mesh.indices.length%3||mesh.indices.some(i=>i*3+2>=mesh.positions.length)||!mesh.positions.every(Number.isFinite)||mesh.matrix&& (mesh.matrix.length!==16||!mesh.matrix.every(Number.isFinite)))throw new Error('测试球碰撞网格无效');
   matrix.fromArray(mesh.matrix??new THREE.Matrix4().elements);
   for(const i of mesh.indices){p.fromArray(mesh.positions,i*3).applyMatrix4(matrix);points.push(p.x,p.y,p.z);}
  }
  this.vertices=Float32Array.from(points);this.order=Uint32Array.from({length:points.length/9},(_,i)=>i);
  const key=(index:number,axis:number)=>{const at=this.order[index]*9;return (this.vertices[at+axis]+this.vertices[at+3+axis]+this.vertices[at+6+axis])/3;};
  const swap=(a:number,b:number)=>{const t=this.order[a];this.order[a]=this.order[b];this.order[b]=t;};
  const build=(start:number,end:number):Node=>{
   const min=[Infinity,Infinity,Infinity],max=[-Infinity,-Infinity,-Infinity];
   for(let i=start;i<end;i++)for(let v=0;v<3;v++)for(let lane=0;lane<3;lane++){const n=this.vertices[this.order[i]*9+v*3+lane];min[lane]=Math.min(min[lane],n);max[lane]=Math.max(max[lane],n);}
   const node:Node={min,max,start,end};if(end-start<=16)return node;
   const axis=max.map((v,i)=>v-min[i]).reduce((best,v,i,a)=>v>a[best]?i:best,0),middle=(start+end)>>>1;
   let lo=start,hi=end-1;while(lo<hi){const pivot=key((lo+hi)>>>1,axis);let left=lo,right=hi;while(left<=right){while(key(left,axis)<pivot)left++;while(key(right,axis)>pivot)right--;if(left<=right){swap(left++,right--);}}if(middle<=right)hi=right;else if(middle>=left)lo=left;else break;}
   node.left=build(start,middle);node.right=build(middle,end);return node;
  };
  if(this.order.length)this.root=build(0,this.order.length);
 }
 contacts(position:number[],radius:number) {
  const contacts:{normal:number[];depth:number}[]=[],center=new THREE.Vector3().fromArray(position),closest=new THREE.Vector3(),triangle=new THREE.Triangle(),normal=new THREE.Vector3();
  const visit=(node:Node)=>{
   let distance=0;for(let i=0;i<3;i++)distance+=Math.max(node.min[i]-position[i],0,position[i]-node.max[i])**2;if(distance>(radius+1e-5)**2)return;
   if(node.left){visit(node.left);visit(node.right!);return;}
   for(let i=node.start;i<node.end;i++){
    const at=this.order[i]*9;triangle.a.fromArray(this.vertices,at);triangle.b.fromArray(this.vertices,at+3);triangle.c.fromArray(this.vertices,at+6);triangle.getNormal(normal);if(normal.lengthSq()<.5)continue;
    triangle.closestPointToPoint(center,closest);const distance=center.distanceTo(closest);if(distance>radius+1e-5)continue;
    if(distance>1e-8)normal.copy(center).sub(closest).divideScalar(distance);
    contacts.push({normal:normal.toArray(),depth:radius-distance});
   }
  };
  if(this.root)visit(this.root);return contacts;
 }
 get triangles(){return this.order.length;}
}
export interface PhysicsBallState {position:number[];velocity:number[];radius:number;grounded:boolean;cloud:boolean;time:number;}
export interface PhysicsBallInput {move:number[];jump:boolean;fly:boolean;vertical:number;}
export interface PhysicsBallSlide {move(position:number[],target:number[],velocity:number[],world:BallCollisionWorld,radius:number):{position:number[];velocity:number[]};}
export function initialPhysicsBall(position:number[],radius=.6):PhysicsBallState {
 if(position.length!==3||!position.every(Number.isFinite)||!Number.isFinite(radius)||radius<=0)throw new Error('测试球初始位置/半径无效');
 return {position:position.slice(),velocity:[0,0,0],radius,grounded:false,cloud:false,time:0};
}
export const PHYSICS_BALL_SCOPE='Editor test-ball locomotion: WASD, jump, gravity, slide, optional flight and read-only triangle collision with bounded motion substeps. Original Avatar CloudBarn distance/normal query is used for cloud contact; cloud buoyancy/drag and movement constants are editor controls, not recovered full Avatar physics. No native collision-tree rebuilding or game image parity.';
export function stepPhysicsBall(state:PhysicsBallState,input:PhysicsBallInput,delta:number,world:BallCollisionWorld,field?:CloudDistanceField,cloudState?:Pick<CloudAvatarQueryState,'undulationScale'|'enabled'>,slide?:PhysicsBallSlide) {
 if(!Number.isFinite(delta)||delta<0||input.move.length!==3||![...input.move,input.vertical].every(Number.isFinite))throw new Error('测试球控制输入无效');
 const next:PhysicsBallState=structuredClone(state),dt=Math.min(delta,.1);if(!dt)return next;
 const move=new THREE.Vector3().fromArray(input.move);move.y=0;if(move.length()>1)move.normalize();
 const speed=input.fly?12:8,blend=1-Math.exp(-14*dt);
 next.velocity[0]+=(move.x*speed-next.velocity[0])*blend;next.velocity[2]+=(move.z*speed-next.velocity[2])*blend;
 const query=field?queryCloudAvatar(field,next.position,{time:next.time,undulationScale:cloudState?.undulationScale??0,radius:next.radius,enabled:cloudState?.enabled??true}):undefined;
 next.cloud=!!query&&(cloudState?.enabled??true)&&query.distance>0;
 if(input.fly)next.velocity[1]+=(input.vertical*speed-next.velocity[1])*blend;
 else {next.velocity[1]+=(-18+(next.cloud?22.5:0))*dt;if(input.jump&&(next.grounded||next.cloud))next.velocity[1]=6.5;}
 if(next.cloud&&!input.fly){const drag=Math.exp(-1.6*dt);next.velocity=next.velocity.map(v=>v*drag);}
 // Substep by BOTH elapsed time and travel/radius to retain thin walls.
 const distance=Math.hypot(...next.velocity)*dt,steps=Math.max(1,Math.ceil(dt*120),Math.ceil(distance/(next.radius*.25))),h=dt/steps;
 next.grounded=false;
 for(let step=0;step<steps;step++) {
  const target=next.position.map((v,i)=>v+next.velocity[i]*h);
  if(slide){const moved=slide.move(next.position,target,next.velocity,world,next.radius);next.position=moved.position;next.velocity=moved.velocity;}else next.position=target;
  for(let iteration=0;iteration<6;iteration++) {
   const contacts=world.contacts(next.position,next.radius);if(!contacts.length)break;let moved=false;
   for(const contact of contacts){if(contact.normal[1]>.55)next.grounded=true;const into=next.velocity.reduce((n,v,i)=>n+v*contact.normal[i],0);if(into<0)next.velocity=next.velocity.map((v,i)=>v-into*contact.normal[i]);
    if(contact.depth>0){next.position=next.position.map((v,i)=>v+(contact.depth+1e-6)*contact.normal[i]);moved=true;break;}
   }if(!moved)break;
  }
 }
 next.time+=dt;return next;
}
