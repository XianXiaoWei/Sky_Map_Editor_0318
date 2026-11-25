import test from 'node:test';
import assert from 'node:assert/strict';
import * as THREE from 'three';
import { VulkanViewport } from '../src/renderer/vulkan-viewport';

test('Cloud-only viewports animate, pause after history refresh and ignore sub-float32 camera roundoff', async () => {
  const globals = ['document', 'ImageData', 'requestAnimationFrame', 'cancelAnimationFrame', 'performance'];
  const before = globals.map(name => Object.getOwnPropertyDescriptor(globalThis, name));
  let now = 0;
  const canvas = { width: 1, height: 1, style: {}, dataset: {}, getContext: () => ({ putImageData() {} }) };
  const replacements = [ { createElement: () => canvas }, class { constructor(public pixels: Uint8ClampedArray, public width: number, public height: number) {} }, () => 1, () => {}, { now: () => now } ];
  globals.forEach((name, i) => Object.defineProperty(globalThis, name, { value: replacements[i], configurable: true }));
  let viewport: VulkanViewport | undefined;
  try {
    const requests: { animation?: { delta: number } }[] = [], errors: string[] = [];
    viewport = new VulkanViewport({ vulkanInfo: async () => ({ backend: 'Vulkan', device: 'mock' }), vulkanScene: async () => {},
      vulkanFrame: async (width, height, _matrix, _camera, animation) => { requests.push({ animation }); return { width, height, pixels: new Uint8Array(width * height * 4) }; } }, e => errors.push(e));
    viewport.setSize(8, 8); viewport.setAnimationLoop(() => {});
    const scene = new THREE.Scene(); Object.assign(scene.userData, { level: 'OnlyCloud', entityCloud: true, bakedDisplay: 'material', animateMaterials: true });
    const camera = new THREE.PerspectiveCamera(50, 1, .1, 1000); camera.position.set(0, 0, 10); camera.lookAt(0, 0, 0);
    const draw = async (time: number) => { now = time; viewport!.render(scene, camera); await new Promise<void>(resolve => setImmediate(resolve)); };
    await draw(0);assert.equal(requests.length,0,'No readback frame starts before viewport initialization');await viewport.initialize();
    await draw(0); await draw(150); assert.equal(requests.length, 2); assert.ok(requests[1].animation!.delta > 0);
    scene.userData.bakedDisplay = 'light0'; await draw(300); const diagnostics = requests.length; await draw(500); assert.equal(requests.length, diagnostics);
    scene.userData.bakedDisplay = 'material'; scene.userData.animateMaterials = false;
    const paused = requests.length; await draw(600); await draw(601); await draw(900); assert.equal(requests.length, paused + 2);
    camera.position.x = .5; const navigation = requests.length; await draw(950); await draw(951); await draw(1200); assert.equal(requests.length, navigation + 2);
    const settled = requests.length; camera.position.x += 1e-14; await draw(1250); assert.equal(requests.length, settled);
    assert.deepEqual(errors, []);
  } finally {
    viewport?.dispose(); globals.forEach((name, i) => { if (before[i]) Object.defineProperty(globalThis, name, before[i]!); else Reflect.deleteProperty(globalThis, name); });
  }
});
