import fs from 'node:fs';
import path from 'node:path';
import assert from 'node:assert/strict';
import * as THREE from 'three';
import {VulkanHost} from '../src/main/vulkan';
import {exportVulkanScene} from '../src/renderer/vulkan-viewport';

async function main(){
const host=new VulkanHost(path.resolve('dist/native/sky-vulkan'));
const report:any={passed:false,scope:'Actual Vulkan diagnostic opaque editor geometry writes the original Mesh GLSL RGBDepth rule min(256000, 1/gl_FragCoord.w)*0.1 during HDR capture. Editor overlays preserve underlying alpha; regular RGBA display remains unchanged. This does not establish original Model/material/GPU lifecycle or game image parity.',checks:[]};
try {
 report.device=await host.start();
 const camera=new THREE.PerspectiveCamera(50,1,.1,1000);camera.updateMatrixWorld();
 const matrix=new THREE.Matrix4().multiplyMatrices(camera.projectionMatrix,camera.matrixWorldInverse).toArray();
 const scene=new THREE.Scene(),mesh=new THREE.Mesh(new THREE.PlaneGeometry(4,4),new THREE.MeshBasicMaterial({color:0x808080,side:THREE.DoubleSide}));scene.add(mesh);
 for(const distance of [5,10,20]){
  mesh.position.z=-distance;await host.setScene(exportVulkanScene(scene));
  const hdr=(await host.viewportHDR(64,64,matrix)).attachments[0],at=(32*64+32)*4;
  assert.ok(Math.abs(hdr[at+3]-distance*.1)<1e-5);assert.ok(Math.abs(hdr[at+3]-1)>1e-5||distance===10);
  const regular=await host.frame(64,64,matrix);assert.equal(regular.pixels[at+3],255);
  report.checks.push({distance,hdrDepth:hdr[at+3],displayAlpha:regular.pixels[at+3]});
 }
 mesh.position.z=-10;
 const helper=new THREE.Mesh(new THREE.PlaneGeometry(1,1),new THREE.MeshBasicMaterial({color:0xff0000,depthTest:false}));helper.position.z=-2;scene.add(helper);
 await host.setScene(exportVulkanScene(scene));
 const hdr=(await host.viewportHDR(64,64,matrix)).attachments[0],at=(32*64+32)*4;
 assert.equal(hdr[at],1);assert.equal(hdr[at+1],0);assert.ok(Math.abs(hdr[at+3]-1)<1e-5);
 report.checks.push({overlayPreservesOpaqueDepth:true,hdrDepth:hdr[at+3]});report.passed=true;
}finally{host.stop();fs.writeFileSync('docs/object-preview-depth-check.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report));}
}
void main().catch(error=>{console.error(error);process.exitCode=1;});
