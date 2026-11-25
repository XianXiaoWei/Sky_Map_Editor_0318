import fs from 'node:fs';
import assert from 'node:assert/strict';
import {createRequire} from 'node:module';
import * as THREE from 'three';
import {CreatureTerrainQuery} from '../src/renderer/creature-terrain-query';
import {ResourceModelAnimationPreview} from '../src/core/resource-model-animation-preview';
import {readResourceMesh} from '../src/core/resources';
import {readResourceAnimationList} from '../src/core/resource-animation-list';
const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus';
const before=createRequire(import.meta.url)('/root/sky-research/animation-after.cjs');
const summary=(ns:number[])=>{const s=ns.slice().sort((a,b)=>a-b);return {medianMs:s[Math.floor(s.length*.5)],p95Ms:s[Math.floor(s.length*.95)]};};
const meshes=Array.from({length:1200},(_,i)=>{const m=new THREE.Mesh(new THREE.PlaneGeometry(2,2,12,12),new THREE.MeshBasicMaterial({side:THREE.DoubleSide}));m.rotation.x=-Math.PI/2;m.position.set((i%40)*3,0,Math.floor(i/40)*3);m.updateMatrixWorld();return m;}),query=new CreatureTerrainQuery(meshes),ray=new THREE.Raycaster();ray.firstHitOnly=true;ray.far=3;
const rays=Array.from({length:256},(_,i)=>new THREE.Vector3((i%32)*3,1,Math.floor(i/32)*3)),direction=new THREE.Vector3(0,-1,0);
const brute=()=>{for(const o of rays){ray.set(o,direction);ray.intersectObjects(meshes,false);}},tree=()=>{query.beginFrame();for(const o of rays)query.cast(o,direction,3);};
for(const o of rays){ray.set(o,direction);assert.equal(ray.intersectObjects(meshes,false)[0]?.object,query.cast(o,direction,3)?.object);}
const times={before:[] as number[],after:[] as number[]};for(let i=0;i<16;i++)for(const after of i%2?[true,false]:[false,true]){const start=performance.now();(after?tree:brute)();if(i>=4)times[after?'after':'before'].push(performance.now()-start);}
const mesh=readResourceMesh(fs.readFileSync(data+'/Meshes/Bin/CharCrabAAnim.mesh')),list=readResourceAnimationList(fs.readFileSync(data+'/Meshes/Bin/AnimationList.dat')),old=Array.from({length:128},()=>new before.ResourceModelAnimationPreview(mesh,list,'idle')),next=Array.from({length:128},()=>new ResourceModelAnimationPreview(mesh,list,'idle'));assert.deepEqual(next[0].step(0).packedPositions,old[0].step(0).packedPositions);
const idle={before:[] as number[],after:[] as number[]};for(let i=0;i<40;i++)for(const after of i%2?[true,false]:[false,true]){const cache=new Map(),start=performance.now();for(const preview of after?next:old)preview.step(1/60,cache);if(i>=8)idle[after?'after':'before'].push(performance.now()-start);}
const terrain={sceneMeshes:meshes.length,raysPerFrame:rays.length,before:summary(times.before),after:summary(times.after),speedup:summary(times.before).medianMs/summary(times.after).medianMs,stats:query.stats};
const staticAnimation={instances:128,before:summary(idle.before),after:summary(idle.after),speedup:summary(idle.before).medianMs/summary(idle.after).medianMs};
const report={passed:true,measuredAtUTC:new Date().toISOString(),scope:'CPU only. Identical mesh BVH geometry/closest-hit semantics; additional scene broad phase. Static original crab idle clock retained, single-frame skin result reused. These ratios are not whole-map FPS.',terrain,staticAnimation};fs.writeFileSync('docs/creature-contact-performance.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report));
