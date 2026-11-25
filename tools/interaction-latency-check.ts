import fs from 'node:fs';
import crypto from 'node:crypto';
import assert from 'node:assert/strict';
import * as THREE from 'three';
import {MeshesDocument} from '../src/core/meshes';
import {createBakedObject} from '../src/renderer/baked-renderer';
import {nativeMaterialDefs} from '../src/core/mesh-surfaces';
import {prepareInteractionMesh} from '../src/renderer/interaction-index';

const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',report:any={passed:false,scope:'Read-only original map triangle queries in the production editor picking adapter. Host CPU timings; not Android display FPS.',maps:[]};
for(const level of ['Dawn','SkyHub2']){
 const file=data+'/Levels/'+level+'/BstBaked.meshes',source=fs.readFileSync(file),sha=crypto.createHash('sha256').update(source).digest('hex'),document=new MeshesDocument(source),defs=nativeMaterialDefs(level);
 const meshes=document.geometries.filter(g=>['terrain','skirt'].includes(g.kind)&&g.vertexCount).map(g=>createBakedObject(document.geometryView(g),defs,'material',false));
 const box=new THREE.Box3();for(const mesh of meshes){mesh.updateMatrixWorld(true);box.expandByObject(mesh);}const center=box.getCenter(new THREE.Vector3()),size=box.getSize(new THREE.Vector3());
 const rays=Array.from({length:120},(_,i)=>new THREE.Raycaster(new THREE.Vector3(center.x+(i%12/11-.5)*size.x*.85,box.max.y+size.y*.2+10,center.z+(Math.floor(i/12)/9-.5)*size.z*.85),new THREE.Vector3(0,-1,0)));
 const run=()=>rays.map(ray=>ray.intersectObjects(meshes,false)[0]);
 run();const beforeAt=performance.now(),before=run(),beforeMs=performance.now()-beforeAt;
 const indexCopies=meshes.map(mesh=>mesh.geometry.index!.array.slice()),buildAt=performance.now();for(const mesh of meshes)prepareInteractionMesh(mesh);const buildMs=performance.now()-buildAt;
 run();const afterAt=performance.now(),after=run(),afterMs=performance.now()-afterAt;
 let hits=0;for(let i=0;i<before.length;i++){assert.equal(!!after[i],!!before[i]);if(before[i]){hits++;assert.ok(before[i].point.distanceTo(after[i].point)<1e-7);assert.ok(Math.abs(before[i].distance-after[i].distance)<1e-7);assert.equal(before[i].faceIndex,after[i].faceIndex);assert.equal(before[i].face?.materialIndex,after[i].face?.materialIndex);}}
 assert.ok(hits>0);meshes.forEach((mesh,i)=>{assert.deepEqual(mesh.geometry.index!.array,indexCopies[i]);mesh.geometry.dispose();(Array.isArray(mesh.material)?mesh.material:[mesh.material]).forEach(m=>m.dispose());});assert.equal(crypto.createHash('sha256').update(fs.readFileSync(file)).digest('hex'),sha);
 report.maps.push({level,queries:rays.length,hits,triangles:meshes.reduce((n,m)=>n+m.geometry.index!.count/3,0),beforeMs,afterMs,buildMs,speedup:beforeMs/afterMs,sourceSha256:sha,indexBytesUnchanged:true});
}
report.passed=true;fs.writeFileSync('docs/interaction-latency-check.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report));
