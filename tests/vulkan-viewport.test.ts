import test from 'node:test';
import assert from 'node:assert/strict';
import * as THREE from 'three';
import {TransformControls} from 'three/addons/controls/TransformControls.js';
import { exportVulkanScene } from '../src/renderer/vulkan-viewport';
import { vulkanSceneBytes } from '../src/core/vulkan-protocol';
import {MeshWireOverlay,BoundsOverlay} from '../src/renderer/viewport-overlays';

test('Transform handles update active mode, camera scale and target pose before Vulkan export',()=>{
 const scene=new THREE.Scene(),parent=new THREE.Group(),object=new THREE.Mesh(new THREE.BoxGeometry(),new THREE.MeshBasicMaterial());
 parent.position.set(30,7,-15);object.position.set(7,5,-4);parent.add(object);scene.add(parent);
 const camera=new THREE.PerspectiveCamera(60,1,.01,64000);camera.position.set(70,40,30);camera.lookAt(37,12,-19);camera.updateMatrixWorld();
 const controls=new TransformControls(camera),helper=controls.getHelper();helper.traverse(o=>{o.userData.dynamicViewport=true;});scene.add(helper);controls.attach(object);
 const worldPosition=(controls as TransformControls & {worldPosition:THREE.Vector3}).worldPosition;
 const packets=[];
 for(const mode of ['translate','rotate','scale'] as const){
  controls.setMode(mode);const packet=exportVulkanScene(scene,true);assert.doesNotThrow(()=>vulkanSceneBytes(packet));
  assert.deepEqual(worldPosition.toArray(),[37,12,-19]);
  const gizmo=(helper.children[0] as any).gizmo;
  for(const name of ['translate','rotate','scale'])assert.equal(gizmo[name].visible,name===mode);
  assert.ok(packet.vertices.length>0);packets.push(Array.from(packet.vertices));
 }
 assert.notDeepEqual(packets[0],packets[1]);assert.notDeepEqual(packets[1],packets[2]);
 object.position.x+=10;exportVulkanScene(scene,true);assert.equal(worldPosition.x,47);
 controls.detach();assert.equal(exportVulkanScene(scene,true).vertices.length,0);
 helper.dispose();object.geometry.dispose();(object.material as THREE.Material).dispose();
});

function exportLine(kind: 'strip' | 'loop' | 'segments', points: number[], range?: [number, number]) {
  const geometry = new THREE.BufferGeometry().setFromPoints(points.map(x => new THREE.Vector3(x, 0, 0)));
  if (range) geometry.setDrawRange(...range);
  const material = new THREE.LineBasicMaterial();
  const object = kind === 'loop' ? new THREE.LineLoop(geometry, material)
    : kind === 'segments' ? new THREE.LineSegments(geometry, material) : new THREE.Line(geometry, material);
  const scene = new THREE.Scene(); scene.add(object);
  const output = exportVulkanScene(scene);
  assert.doesNotThrow(() => vulkanSceneBytes(output));
  return { x: Array.from(output.vertices).filter((_, i) => i % 7 === 0), draws: Array.from(output.draws) };
}

test('Vulkan rail strips preserve every adjacent edge for odd and even point counts', () => {
  assert.deepEqual(exportLine('strip', [0, 1, 2]), { x: [0, 1, 1, 2], draws: [0, 4, 3, 0] });
  assert.deepEqual(exportLine('strip', [0, 1, 2, 3]), { x: [0, 1, 1, 2, 2, 3], draws: [0, 6, 3, 0] });
});

test('Vulkan line loops close within the selected draw range', () => {
  assert.deepEqual(exportLine('loop', [0, 1, 2, 3, 4], [1, 3]), { x: [1, 2, 2, 3, 3, 1], draws: [0, 6, 3, 0] });
});

test('Vulkan independent segments stay disconnected and ignore incomplete primitives', () => {
  assert.deepEqual(exportLine('segments', [0, 1, 2, 3, 4]), { x: [0, 1, 2, 3], draws: [0, 4, 3, 0] });
  assert.deepEqual(exportLine('strip', [0]), { x: [], draws: [] });
});
test('Visible world transforms update correctly without visiting hidden helper subtrees',()=>{
 const scene=new THREE.Scene(),parent=new THREE.Group();parent.position.x=5;
 const geometry=new THREE.BufferGeometry().setAttribute('position',new THREE.BufferAttribute(Float32Array.from([0,0,0,1,0,0,0,1,0]),3));
 const mesh=new THREE.Mesh(geometry,new THREE.MeshBasicMaterial());mesh.position.x=3;parent.add(mesh);scene.add(parent);
 const hidden=new THREE.Group();hidden.visible=false;const helper=new THREE.Mesh(geometry,new THREE.MeshBasicMaterial());
 helper.updateWorldMatrix=()=>assert.fail('Hidden helper matrix should not be evaluated for rendering');hidden.add(helper);scene.add(hidden);
 const frame=exportVulkanScene(scene);assert.deepEqual(Array.from(frame.vertices).filter((_,i)=>i%7===0),[8,9,8]);
 parent.position.x=7;assert.deepEqual(Array.from(exportVulkanScene(scene).vertices).filter((_,i)=>i%7===0),[10,11,10]);
});
test('Selection outlines stay in the overlay batch when their target moves',()=>{
 const scene=new THREE.Scene(),mesh=new THREE.Mesh(new THREE.BoxGeometry(),new THREE.MeshBasicMaterial());mesh.geometry.clearGroups();scene.add(mesh);
 const wire=new MeshWireOverlay(mesh),bounds=new BoundsOverlay(mesh);scene.add(wire,bounds);
 const before=exportVulkanScene(scene,false),overlay=exportVulkanScene(scene,true);assert.ok(overlay.vertices.length>0);assert.equal(before.draws.length,4);
 mesh.position.x=3;mesh.updateMatrixWorld(true);wire.update();bounds.update();
 const after=exportVulkanScene(scene,false);assert.equal(after.draws.length,4);assert.equal(after.vertices.length,before.vertices.length);assert.equal(exportVulkanScene(scene,true).draws.length,8);
 wire.dispose();bounds.geometry.dispose();(bounds.material as THREE.Material).dispose();mesh.geometry.dispose();(mesh.material as THREE.Material).dispose();
});
