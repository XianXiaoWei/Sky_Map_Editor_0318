import test from 'node:test';
import assert from 'node:assert/strict';
import * as THREE from 'three';
import { MeshWireOverlay } from '../src/renderer/viewport-overlays';
import { exportVulkanScene } from '../src/renderer/vulkan-viewport';

test('Cloud-only material maps request their pipeline without terrain and diagnostic views disable it',()=>{
 const scene=new THREE.Scene();scene.userData.entityCloud=true;scene.userData.bakedDisplay='material';
 const material=exportVulkanScene(scene);assert.equal(material.baked?.length,0);assert.equal(material.cloud,true);
 scene.userData.bakedDisplay='light0';assert.equal(exportVulkanScene(scene).cloud,false);
 scene.userData.bakedDisplay='material';scene.userData.entityCloud=false;assert.equal(exportVulkanScene(scene).cloud,false);
});

test('Mesh outlines retain the coplanar diagonal, follow parent transforms and respect visibility', () => {
  const geometry = new THREE.BufferGeometry();
  geometry.setAttribute('position', new THREE.Float32BufferAttribute([0,0,0,1,0,0,1,1,0,0,1,0], 3));
  geometry.setIndex([0,1,2,0,2,3]);
  const parent = new THREE.Group(), mesh = new THREE.Mesh(geometry, new THREE.MeshBasicMaterial());
  mesh.userData.bakedView = {}; parent.add(mesh); parent.position.set(5,6,7);
  mesh.add(new THREE.Mesh(geometry, new THREE.MeshBasicMaterial())); // repeated native pass stream
  const scene = new THREE.Scene(), overlayParent = new THREE.Group();
  overlayParent.position.set(-2,3,1); scene.add(parent,overlayParent);
  const overlay = new MeshWireOverlay(parent); overlayParent.add(overlay); overlay.update();
  assert.equal(overlay.children.length, 1);
  const wire = overlay.children[0] as THREE.LineSegments;
  assert.equal(wire.geometry.getAttribute('position').count, 10); // five edges, including the diagonal
  assert.deepEqual(wire.matrixWorld.elements.slice(12,15),[5,6,7]);
  const exported = new THREE.Scene(); exported.add(overlayParent);
  assert.equal(exportVulkanScene(exported).vertices.length, 70);
  parent.visible=false; overlay.update(); assert.equal(exportVulkanScene(exported).vertices.length,0);
  parent.visible=true;parent.position.x=9;overlay.update();assert.equal(wire.matrixWorld.elements[12],9);
  overlay.dispose();assert.equal(overlay.children.length,0);assert.equal(geometry.getAttribute('position').count,4);
});

test('Map mesh lines omit helper proxy meshes', () => {
  const source = new THREE.Group(), mesh = new THREE.Mesh(new THREE.BoxGeometry(),new THREE.MeshBasicMaterial());
  mesh.userData.editorHelper=true;source.add(mesh);
  const map = new MeshWireOverlay(source);assert.equal(map.children.length,0);
  const selection = new MeshWireOverlay(source,undefined,true);assert.equal(selection.children.length,1);
  map.dispose();selection.dispose();mesh.geometry.dispose();mesh.material.dispose();
});
