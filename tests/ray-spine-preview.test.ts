import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import * as THREE from 'three';
import {readResourceMesh} from '../src/core/resources';import {readResourceAnimationList} from '../src/core/resource-animation-list';import {ResourceModelAnimationPreview} from '../src/core/resource-model-animation-preview';import {CreatureSpineSkeletonPreview} from '../src/renderer/dark-creature-skeleton-preview';
test('Ray model uses its own six-joint spine after primary move/idle blending',()=>{
 const data='/root/sky-research/original-runtime-corpus/Meshes/Bin/',mesh=readResourceMesh(fs.readFileSync(data+'CharSkyRayCAnim.mesh')),list=readResourceAnimationList(fs.readFileSync(data+'AnimationList.dat')),object=new THREE.Object3D();object.scale.setScalar(.1);const spine=new CreatureSpineSkeletonPreview(mesh.animation!,object);
 assert.deepEqual(spine.snapshot().bones.map(n=>n.split('_').slice(-3).join('_')),['M_head_Sim','M_neckLow_Sim','M_tail1_Sim','M_tail2_Sim','M_tail4_Sim','M_tail7_Sim']);
 const animation=new ResourceModelAnimationPreview(mesh,list,'critterMove',{secondaryName:'critterIdle',secondaryWeight:()=>.25,poseModifier:(pose,delta)=>spine.apply(pose,delta)});
 for(let i=0;i<50;i++){object.position.set(Math.sin(i*.03)*2,.05*i,-.05*i);object.rotation.y=i*.01;const pose=animation.step(.016);assert.ok(pose.positions.every(Number.isFinite));}
 const snapshot=spine.snapshot();assert.equal(snapshot.lengths.length,6);for(let i=1;i<6;i++){const distance=Math.hypot(...[0,1,2].map(k=>snapshot.positions[i*4+k]-snapshot.positions[(i-1)*4+k]));assert.ok(Math.abs(distance-snapshot.lengths[i])<1e-4);}spine.reset();assert.equal(spine.snapshot().positions.length,0);
});
