import * as THREE from 'three';
import type {AvatarPreviewResources} from '../core/avatar-preview';
/** Actual resource geometry; neutral editor shading, static bind pose.
 * Motion is driven by the existing editor ball, not native Avatar locomotion. */
export class AvatarPreviewController {
 readonly object=new THREE.Group();private parts:THREE.Mesh[]=[];private scale=.1;private minY=0;
 resources?:AvatarPreviewResources;
 constructor(scene:THREE.Scene){this.object.name='AvatarResourcePreview';this.object.visible=false;scene.add(this.object);}
 load(resources:AvatarPreviewResources){
  this.clear();this.resources=resources;
  for(const part of resources.parts){
   const data=part.mesh,geometry=new THREE.BufferGeometry();geometry.setAttribute('position',new THREE.BufferAttribute(data.positions,3));geometry.setIndex(new THREE.BufferAttribute(data.indices,1));
   const colors=new Float32Array(data.positions.length),tint=new THREE.Color(part.slot==='hair'?0xf1e4c6:part.slot==='wing'?0xa5bacb:0xe5ddd0),light=new THREE.Vector3(.3,.8,.5).normalize();
   for(let i=0;i<data.positions.length/3;i++){const n=new THREE.Vector3().fromArray(data.normals,i*3).normalize(),brightness=.35+.65*Math.max(0,n.dot(light));colors.set(tint.toArray().map(v=>v*brightness),i*3);}
   geometry.setAttribute('color',new THREE.BufferAttribute(colors,3));geometry.computeBoundingBox();
   const object=new THREE.Mesh(geometry,new THREE.MeshBasicMaterial({vertexColors:true,side:THREE.DoubleSide,toneMapped:false}));object.name=part.resource;object.userData.dynamicViewport=true;object.userData.avatarResource=part.file;this.parts.push(object);this.object.add(object);
  }
  this.minY=Math.min(...this.parts.map(p=>p.geometry.boundingBox!.min.y));this.setScale(this.scale);this.object.visible=true;
 }
 setScale(value:number){if(!Number.isFinite(value)||value<=0||value>10)throw new Error('预览缩放应在 0 到 10 之间');this.scale=value;for(const part of this.parts){part.scale.setScalar(value);part.position.y=-this.minY*value;}}
 get previewScale(){return this.scale;}
 place(position:number[],euler?:number[]){this.object.position.fromArray(position);if(euler)this.object.rotation.set(-euler[1],euler[0],-euler[2],'YXZ');}
 sync(position?:number[],radius=.6){if(position)this.object.position.set(position[0],position[1]-radius,position[2]);}
 clear(){for(const part of this.parts){part.geometry.dispose();(part.material as THREE.Material).dispose();}this.parts=[];this.object.clear();this.object.visible=false;this.resources=undefined;delete this.object.userData.spawn;}
}
