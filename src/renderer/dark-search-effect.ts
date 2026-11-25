import * as THREE from 'three';
type Cast=(origin:THREE.Vector3,direction:THREE.Vector3,maximum:number)=>THREE.Intersection|undefined;
const axis=new THREE.Vector3(0,0,-1);
/** Surface projection adapter for original spotlight position/radius. Every
 * perimeter ray obeys nearest collision, preventing the footprint drawing
 * through a wall. The actual original cone mesh faces local negative Z. */
export function projectDarkSearchEffect(ring:THREE.Mesh,beam:THREE.Mesh,eye:THREE.Vector3,target:THREE.Vector3,radius:number,cast:Cast){
 const direction=target.clone().sub(eye),distance=direction.length();if(distance<1e-4||radius<=0||![...eye.toArray(),...target.toArray(),radius].every(Number.isFinite)){ring.visible=beam.visible=false;return;}
 const hit=cast(eye,direction.divideScalar(distance),distance+radius);if(!hit){ring.visible=beam.visible=false;return;}
 const center=hit.point,normal=hit.face?.normal.clone().applyNormalMatrix(new THREE.Matrix3().getNormalMatrix(hit.object.matrixWorld))??new THREE.Vector3(0,1,0),x=new THREE.Vector3(1,0,0);if(Math.abs(x.dot(normal))>.95)x.set(0,0,1);x.addScaledVector(normal,-x.dot(normal)).normalize();const y=normal.clone().cross(x).normalize();
 const count=24,positions=new Float32Array((count+1)*2*3),valid:boolean[]=[],indices:number[]=[];
 for(let i=0;i<=count;i++)for(let side=0;side<2;side++){const angle=i/count*Math.PI*2,r=radius*(side?1:.86),point=center.clone().addScaledVector(x,Math.cos(angle)*r).addScaledVector(y,Math.sin(angle)*r),ray=point.clone().sub(eye),length=ray.length(),surface=cast(eye,ray.divideScalar(length),length+radius*.3);const visible=!!surface&&surface.point.distanceTo(point)<Math.max(.25,radius*.3);valid[i*2+side]=visible;positions.set((surface&&visible?surface.point.clone().addScaledVector(normal,.02):center).sub(center).divideScalar(radius).toArray(),(i*2+side)*3);}
 for(let i=0;i<count;i++){const a=i*2,b=a+2;if(valid[a]&&valid[a+1]&&valid[b]&&valid[b+1])indices.push(a,a+1,b,a+1,b+1,b);}
 ring.geometry.setAttribute('position',new THREE.BufferAttribute(positions,3));ring.geometry.setIndex(indices);ring.geometry.computeBoundingSphere();ring.position.copy(center);ring.quaternion.identity();ring.scale.setScalar(radius);ring.visible=indices.length>0;
 beam.position.copy(beam.userData.originalSearchCone?eye:eye.clone().add(center).multiplyScalar(.5));const length=eye.distanceTo(center);beam.quaternion.setFromUnitVectors(beam.userData.originalSearchCone?axis:new THREE.Vector3(0,1,0),beam.userData.originalSearchCone?center.clone().sub(eye).normalize():eye.clone().sub(center).normalize());beam.scale.set(radius,radius,Math.max(.1,length));if(!beam.userData.originalSearchCone)beam.scale.set(radius,Math.max(.1,length),radius);beam.visible=ring.visible;
 return {position:center.toArray(),normal:normal.toArray(),radius,triangles:indices.length/3};
}
