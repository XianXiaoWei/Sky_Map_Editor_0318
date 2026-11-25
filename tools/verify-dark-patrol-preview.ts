import fs from 'node:fs';
import assert from 'node:assert/strict';
import * as THREE from 'three';
import {ObjectsDocument} from '../src/core/objects';
import {creatureField} from '../src/core/basic-creature-plan';
import {readResourceMesh} from '../src/core/resources';
import {readResourceAnimationList} from '../src/core/resource-animation-list';
import {AssetCatalog} from '../src/main/assets';
import {BasicCreaturePreview} from '../src/renderer/basic-creature-preview';
async function main(){
 const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data',nodes=new ObjectsDocument(fs.readFileSync(data+'/Levels/DuskGraveyard/Objects.level.bin')).nodes,root=new THREE.Group(),objects=new Map<number,THREE.Object3D>(),preview=new BasicCreaturePreview(),catalog=new AssetCatalog(data,'DuskGraveyard');
 const floor=new THREE.Mesh(new THREE.PlaneGeometry(10000,10000),new THREE.MeshBasicMaterial({side:THREE.DoubleSide}));floor.rotation.x=-Math.PI/2;floor.position.y=65;root.add(floor);root.updateMatrixWorld(true);
 await preview.load(nodes,root,objects,async name=>readResourceMesh(fs.readFileSync(catalog.meshFile(name))),readResourceAnimationList(fs.readFileSync(data+'/Meshes/Bin/AnimationList.dat')),(node,object)=>{const matrix=creatureField(node,'transform')?.value;if(Array.isArray(matrix)){object.matrix.fromArray(matrix);object.matrix.decompose(object.position,object.quaternion,object.scale);}object.updateMatrixWorld(true);},()=>true,'DuskGraveyard');
 const initial=preview.snapshot();for(let i=0;i<90;i++){preview.update(1000+i*200);preview.animations.step(.2);}
 const active=preview.snapshot(),dark=active.objects.filter(o=>o.kind==='dark');console.log(JSON.stringify(dark.map(d=>({id:d.id,error:d.motion?.error,spotlight:d.spotlight}))));assert.equal(dark.length,6);assert.deepEqual(active.resources.filter(r=>r.error),[]);assert.ok(dark.every(d=>d.motion&&!d.motion.error&&'awake' in d.motion&&d.motion.awake));assert.ok(dark.some(d=>d.spotlight));assert.ok(dark.some(d=>d.position.some((n,i)=>Math.abs(n-initial.objects.find(o=>o.id===d.id)!.position[i])>1)));
 preview.stop();const stopped=preview.snapshot();assert.ok(stopped.objects.filter(o=>o.kind==='dark').every(d=>d.motion&&'awake' in d.motion&&!d.motion.awake&&!d.spotlight));preview.togglePause();preview.update(30000);assert.ok(preview.snapshot().objects.filter(o=>o.kind==='dark').every(d=>d.motion&&'awake' in d.motion&&d.motion.awake));
 const report={passed:true,scope:'Original DuskGraveyard saved params/resources, original animation and FloppySpine, editor awake/stop/replay entry. Deterministic flat test floor; real map surface rendering is checked separately.',frames:90,elapsed:active.elapsed,dragons:dark.length,spotlights:dark.filter(d=>d.spotlight).length,objects:dark.map(d=>({id:d.id,position:d.position,error:d.motion?.error,spotlight:d.spotlight})),restAndReplay:true};fs.writeFileSync('docs/dark-patrol-preview-verification.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify({...report,objects:undefined}));preview.reset();floor.geometry.dispose();(floor.material as THREE.Material).dispose();
}
void main().catch(e=>{console.error(e);process.exitCode=1;});
