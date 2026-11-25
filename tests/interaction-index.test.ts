import test from 'node:test';
import assert from 'node:assert/strict';
import * as THREE from 'three';
import {prepareInteractionMesh} from '../src/renderer/interaction-index';

const normalized=(hits:THREE.Intersection[])=>hits.map(h=>({face:h.faceIndex,material:h.face?.materialIndex,point:h.point.toArray(),distance:h.distance,uv:h.uv?.toArray(),normal:h.face?.normal.toArray()})).sort((a,b)=>a.distance-b.distance||(a.face??0)-(b.face??0));
test('Interaction index preserves transformed grouped mesh hits, face IDs and source index bytes',()=>{
 const geometry=new THREE.BoxGeometry(8,6,4,14,12,10),index=geometry.index!,bytes=index.array.slice(),material=Array.from({length:6},()=>new THREE.MeshBasicMaterial({side:THREE.DoubleSide})),mesh=new THREE.Mesh(geometry,material);
 mesh.position.set(12,-3,8);mesh.rotation.set(.3,.7,.1);mesh.scale.set(2,.5,1.2);mesh.updateMatrixWorld(true);
 const rays=Array.from({length:30},(_,i)=>new THREE.Raycaster(new THREE.Vector3(12+Math.sin(i)*24,-3+Math.cos(i)*18,40),new THREE.Vector3(Math.sin(i)*-24,Math.cos(i)*-18,-32).normalize()));
 const before=rays.map(ray=>normalized(ray.intersectObject(mesh,false)));assert.ok(before.every(h=>h.length>0));
 assert.equal(prepareInteractionMesh(mesh),true);assert.deepEqual(index.array,bytes);
 const after=rays.map(ray=>normalized(ray.intersectObject(mesh,false)));
 for(let i=0;i<before.length;i++){assert.equal(after[i].length,before[i].length);for(let j=0;j<before[i].length;j++){const a=after[i][j],b=before[i][j];assert.equal(a.face,b.face);assert.equal(a.material,b.material);assert.ok(Math.abs(a.distance-b.distance)<1e-8);for(let c=0;c<3;c++){assert.ok(Math.abs(a.point[c]-b.point[c])<1e-8);assert.ok(Math.abs(a.normal![c]-b.normal![c])<1e-8);}for(let c=0;c<2;c++)assert.ok(Math.abs(a.uv![c]-b.uv![c])<1e-8);}}
 geometry.dispose();material.forEach(m=>m.dispose());
});
test('Changed geometry or draw groups falls back to current triangle queries',()=>{
 const geometry=new THREE.PlaneGeometry(10,10,20,20),mesh=new THREE.Mesh(geometry,new THREE.MeshBasicMaterial({side:THREE.DoubleSide}));mesh.updateMatrixWorld(true);prepareInteractionMesh(mesh);
 const ray=new THREE.Raycaster(new THREE.Vector3(.15,.25,10),new THREE.Vector3(0,0,-1));
 const position=geometry.getAttribute('position') as THREE.BufferAttribute;for(let i=0;i<position.count;i++)position.setZ(i,3);position.needsUpdate=true;geometry.setDrawRange(0,geometry.index!.count);
 const actual=ray.intersectObject(mesh,false),expected:THREE.Intersection[]=[];THREE.Mesh.prototype.raycast.call(mesh,ray,expected);assert.deepEqual(normalized(actual),normalized(expected));assert.ok(expected.length>0);assert.equal(expected[0].point.z,3);
 geometry.setDrawRange(0,3);expected.length=0;THREE.Mesh.prototype.raycast.call(mesh,ray,expected);assert.deepEqual(normalized(ray.intersectObject(mesh,false)),normalized(expected));
 geometry.dispose();(mesh.material as THREE.Material).dispose();
});
