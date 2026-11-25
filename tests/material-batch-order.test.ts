import test from 'node:test';import assert from 'node:assert/strict';
import {gradientPatchScene} from './helpers/gradient-patches';
import {exportVulkanScene} from '../src/renderer/vulkan-viewport';
import {mergeVulkanOverlays} from '../src/core/vulkan-protocol';
import * as THREE from 'three';
test('Cross-patch merging keeps each triangle sand-before-grass even when grass appears on an earlier patch',()=>{
 const {scene}=gradientPatchScene(),draws=exportVulkanScene(scene).baked!;
 assert.deepEqual(draws.map(d=>d.shader),['RockFaceSh','SandShAlpha','GrassShAlpha']);
 assert.equal(draws[0].indices.length,12);assert.equal(draws[1].indices.length,6);assert.equal(draws[2].indices.length,12);
});
test('Dynamic wire ball updates preserve static diagnostic ranges and leave baked draw uploads separate',()=>{
 const {scene}=gradientPatchScene(),ball=new THREE.LineSegments(new THREE.BufferGeometry().setFromPoints([new THREE.Vector3(),new THREE.Vector3(1,0,0)]),new THREE.LineBasicMaterial());ball.userData.dynamicViewport=true;scene.add(ball);
 const base=exportVulkanScene(scene,false),a=exportVulkanScene(scene,true);ball.position.x=10;const b=exportVulkanScene(scene,true);
 assert.deepEqual(exportVulkanScene(scene,false),base);assert.notDeepEqual(a.vertices,b.vertices);assert.equal(b.baked!.length,0);assert.equal(base.baked!.length,3);
 const merged=mergeVulkanOverlays({vertices:Float32Array.from([1,2,3,1,1,1,1,2,2,3,1,1,1,1]),draws:Uint32Array.from([0,2,3,0])},b);
 assert.deepEqual(Array.from(merged.draws),[0,2,3,0,2,2,3,0]);assert.equal(merged.baked,undefined);
});
