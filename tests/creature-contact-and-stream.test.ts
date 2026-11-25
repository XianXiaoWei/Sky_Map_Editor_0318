import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import * as THREE from 'three';
import {CreatureTerrainQuery} from '../src/renderer/creature-terrain-query';
import {crabGroundContact} from '../src/core/crab-ground-contact';
import {numericFloatValue} from '../src/core/object-numeric-runtime';
import {ObjectsDocument} from '../src/core/objects';
import {readResourceMesh} from '../src/core/resources';
import {MoteStream,MOTE_VERTEX_STRIDE} from '../src/core/mote-stream';
import {projectDarkSearchEffect} from '../src/renderer/dark-search-effect';
import type {CreatureWorldServices} from '../src/core/creature-world-runtime';
const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const bytes=(v:number[])=>new Uint8Array(Float32Array.from(v).buffer);
const miss=()=>({hit:false,active:false,position:new Uint8Array(16),normal:new Uint8Array(16)});
function terrain(){const ground=new THREE.Mesh(new THREE.PlaneGeometry(100,100,24,24),new THREE.MeshBasicMaterial({side:THREE.DoubleSide}));ground.rotation.x=-Math.PI/2;ground.updateMatrixWorld();return ground;}
function provider(query:CreatureTerrainQuery):CreatureWorldServices['raycast']{return (_scene,o,d,maximum)=>{const vector=(b:Uint8Array)=>new THREE.Vector3().fromArray(new Float32Array(b.buffer,b.byteOffset,4)),hit=query.cast(vector(o),vector(d),numericFloatValue(maximum));return hit?{hit:true,active:true,position:bytes([...hit.point.toArray(),0]),normal:bytes([...(hit.face!.normal.clone().applyNormalMatrix(new THREE.Matrix3().getNormalMatrix(hit.object.matrixWorld))).toArray(),0])}:miss();};}
test('Creature scene BVH retains closest hits, original face IDs and edited transforms/geometry',()=>{
 const meshes=Array.from({length:200},(_,i)=>{const m=new THREE.Mesh(new THREE.BoxGeometry(2,2,2,4,4,4),new THREE.MeshBasicMaterial({side:THREE.DoubleSide}));m.position.set((i%20)*4,Math.floor(i/20)*4,0);m.rotation.set(.1,.2,.3);m.scale.set(1,2,.75);m.updateMatrixWorld();return m;}),query=new CreatureTerrainQuery(meshes),ray=new THREE.Raycaster();ray.firstHitOnly=true;
 const compare=()=>{for(let i=0;i<100;i++){const origin=new THREE.Vector3((i%20)*4,Math.floor(i/20)*4,20),direction=new THREE.Vector3(0,0,-1);ray.set(origin,direction);ray.far=50;const expected=ray.intersectObjects(meshes,false)[0],actual=query.cast(origin,direction,50);assert.equal(actual?.object,expected?.object);assert.equal(actual?.faceIndex,expected?.faceIndex);if(actual&&expected)assert.ok(actual.point.distanceTo(expected.point)<1e-6);}};
 compare();const rebuilds=query.stats.rebuilds;query.beginFrame();assert.equal(query.stats.rebuilds,rebuilds);meshes[0].position.z=8;meshes[0].scale.set(3,1,2);meshes[0].rotation.y=.8;query.beginFrame();compare();const position=meshes[0].geometry.getAttribute('position');for(let i=0;i<position.count;i++)position.setZ(i,position.getZ(i)+2);position.needsUpdate=true;query.beginFrame();compare();assert.ok(query.stats.candidateMeshes<query.stats.rays*10);for(const m of meshes){m.geometry.dispose();(m.material as THREE.Material).dispose();}
});
test('Crab feet stay on the floor at wall base, reject roofs/vertical faces and missing ground',()=>{
 const floor=terrain(),wall=new THREE.Mesh(new THREE.BoxGeometry(1,6,6),new THREE.MeshBasicMaterial({side:THREE.DoubleSide}));wall.position.set(1,3,0);wall.updateMatrixWorld();const cast=provider(new CreatureTerrainQuery([floor,wall]));let contact=crabGroundContact([0,0,0,0],[.8,0,0,0],[1,0,0,0],.8,.2,cast);assert.equal(contact.grounded,true);assert.ok(Math.abs(contact.position[1])<.001);assert.equal(contact.position[0],0);
 const high:CreatureWorldServices['raycast']=()=>({hit:true,active:true,position:bytes([1,6,0,0]),normal:bytes([0,1,0,0])});contact=crabGroundContact([0,0,0,0],[1,0,0,0],[1,0,0,0],1,.2,high);assert.deepEqual(contact.position,[0,0,0,0]);assert.equal(contact.grounded,false);
 const vertical:CreatureWorldServices['raycast']=()=>({hit:true,active:true,position:bytes([1,0,0,0]),normal:bytes([1,0,0,0])});assert.equal(crabGroundContact([0,0,0,0],[1,0,0,0],[1,0,0,0],1,.2,vertical).grounded,false);assert.deepEqual(crabGroundContact([0,3,0,0],[1,3,0,0],[1,0,0,0],1,.2,miss).position,[0,3,0,0]);
});
test('Crab flat-ground contact suppresses numeric height chatter and follows a walkable slope',()=>{
 let i=0;const noise:CreatureWorldServices['raycast']=(_s,_o,d)=>new Float32Array(d.buffer,d.byteOffset,4)[1]<0?{hit:true,active:true,position:bytes([0,((i++%2)*2-1)*.0005,0,0]),normal:bytes([0,1,0,0])}:miss();let p=[0,0,0,0];for(let j=0;j<200;j++)p=crabGroundContact(p,[p[0]+.01,p[1],0,0],[.1,0,0,0],.1,.1,noise).position;assert.equal(p[1],0);
 const floor=terrain();floor.rotation.y=.1;floor.rotation.z=.1;floor.updateMatrixWorld();const cast=provider(new CreatureTerrainQuery([floor]));const a=crabGroundContact([0,0,0,0],[.02,0,0,0],[.2,0,0,0],.1,.1,cast);assert.equal(a.grounded,true);assert.ok(Math.abs(a.position[1])<.1);
});
test('Original butterfly-field auto spawns create independent finite Motes and preserve inactive events',()=>{
 const nodes=new ObjectsDocument(fs.readFileSync(data+'/Levels/Prairie_ButterflyFields/Objects.level.bin')).nodes,mesh=readResourceMesh(fs.readFileSync(data+'/Meshes/Bin/CharFlyBeingMiniAAnim.mesh')),stream=new MoteStream(nodes,mesh,{raycast:miss});
 for(let i=0;i<120;i++)stream.step(1/60);const ids=nodes.filter(n=>n.className==='SpawnMotes').map(n=>n.id),snapshots=ids.map(id=>stream.snapshot(id));assert.equal(snapshots.reduce((n,s)=>n+s.count,0),117);assert.ok(snapshots.every(s=>s.errors.length===0));assert.equal(stream.snapshot(39).count,0);const sample=stream.snapshot(673);assert.equal(sample.count,50);assert.notDeepEqual(sample.motes[0].position,sample.motes[1].position);assert.notEqual(sample.motes[0].phase,sample.motes[1].phase);assert.ok(sample.motes.every(o=>[...o.position,...o.velocity,o.phase,o.scale].every(Number.isFinite)));const g=stream.geometry(673);assert.equal(g.vertices.length,sample.count*mesh.positions.length/3*MOTE_VERTEX_STRIDE);const initial=sample.motes.map(o=>o.position);stream.step(.05);assert.notDeepEqual(stream.snapshot(673).motes.map(o=>o.position),initial);stream.reset();assert.equal(stream.snapshot(673).count,0);stream.setEnabled(39,true);stream.step(.016);assert.equal(stream.snapshot(39).count,1);stream.dispose();
});
test('Dark search footprint conforms to actual terrain and hides without any surface',()=>{
 const floor=terrain();floor.rotation.z=.1;floor.updateMatrixWorld();const query=new CreatureTerrainQuery([floor]),ring=new THREE.Mesh(new THREE.RingGeometry(.86,1,24)),beam=new THREE.Mesh(new THREE.ConeGeometry());beam.userData.originalSearchCone=true;
 const effect=projectDarkSearchEffect(ring,beam,new THREE.Vector3(0,10,0),new THREE.Vector3(0,0,0),3,(o,d,m)=>query.cast(o,d,m));assert.ok(effect);assert.ok(ring.visible&&beam.visible);assert.ok(effect.triangles>0);assert.ok(effect.triangles<=48);assert.equal(ring.scale.x,3);assert.deepEqual(beam.position.toArray(),[0,10,0]);assert.ok(Array.from(ring.geometry.getAttribute('position').array).every(Number.isFinite));projectDarkSearchEffect(ring,beam,new THREE.Vector3(0,10,0),new THREE.Vector3(0,0,0),3,()=>undefined);assert.equal(ring.visible,false);assert.equal(beam.visible,false);
});

test('Motes keep original small visual size, light timers and independent phase when avatar distance changes',()=>{
 const nodes=new ObjectsDocument(fs.readFileSync(data+'/Levels/Prairie_ButterflyFields/Objects.level.bin')).nodes,mesh=readResourceMesh(fs.readFileSync(data+'/Meshes/Bin/CharFlyBeingMiniAAnim.mesh'));
 const streams=[new MoteStream(nodes,mesh,{raycast:miss}),new MoteStream(nodes,mesh,{raycast:miss})];
 for(let i=0;i<120;i++){streams[0].step(1/60);streams[1].step(1/60,[1e4,1e4,1e4]);}
 const near=streams[0].snapshot(673),far=streams[1].snapshot(673);assert.equal(near.count,50);
 assert.deepEqual(near.motes.map(m=>m.velocity),far.motes.map(m=>m.velocity));assert.deepEqual(near.motes.map(m=>m.state),far.motes.map(m=>m.state));
 assert.ok(near.motes.every(m=>m.scale===Math.fround(.08)&&m.brightness===1&&m.phase>=0&&m.phase<Math.fround(Math.PI*2)));assert.ok(far.motes.every(m=>m.scale===Math.fround(.32)));
 const empty=streams[0].geometry(39),revision=empty.revision;streams[0].step(.02);assert.equal(streams[0].geometry(39).revision,revision);streams.forEach(s=>s.dispose());
});
