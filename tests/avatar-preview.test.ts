import test from 'node:test';import assert from 'node:assert/strict';
import {avatarPreviewMeshFile,avatarSpawnCandidates} from '../src/core/avatar-preview';
import {readResourceManifest} from '../src/core/resource-manifest';
import type {ObjectNode,Field} from '../src/core/objects';
const field=(name:string,value:unknown,kind='u8')=>({name,value,kind}) as Field;
const marker={id:0,className:'Marker',fields:[field('pos',[1,2,3,1],'vector'),field('quat',[0,0,0,1],'vector'),field('scale',[1,1,1,0],'vector')]} as ObjectNode;
const spawn={id:1,name:'Spawn',className:'AvatarSetPos',fields:[field('marker',0,'reference'),field('relMarker',0xffffffff,'reference'),...['setLevelStartPosition','randomGroundInMarker','breakHandHold','killMomentum','onGround'].map(n=>field(n,0))]} as ObjectNode;
test('Avatar spawn candidates preserve missing defaults and broken/relative references',()=>{
 const candidate=avatarSpawnCandidates([marker,spawn])[0];assert.equal(candidate.available,true);assert.equal(candidate.markerId,0);assert.equal(candidate.relativeMarkerId,null);
 const missing={...spawn,fields:spawn.fields.filter(f=>f.name!=='onGround')};assert.equal(avatarSpawnCandidates([marker,missing])[0].flags.onGround,null);assert.equal(avatarSpawnCandidates([marker,missing])[0].available,false);
 const broken={...spawn,fields:spawn.fields.map(f=>f.name==='relMarker'?field(f.name,3,'reference'):f)};assert.equal(avatarSpawnCandidates([marker,broken])[0].available,false);
 assert.deepEqual(spawn.fields.map(f=>f.value),[0,0xffffffff,0,0,0,0,0]);
});
test('Avatar mesh paths resolve source and compilation flags; unresolved definitions fail',()=>{
 const entry=readResourceManifest('resource "Mesh" "Player" {source="Body.fbx",stripAnimation=true,computeOcclusions=false,computeEdges=true}')[0];assert.equal(avatarPreviewMeshFile(entry),'Body_StripAnim_CompEdges');
 assert.throws(()=>avatarPreviewMeshFile({...entry,unresolvedFields:['source']}));assert.throws(()=>avatarPreviewMeshFile({...entry,parameters:{...entry.parameters,source:'../Body.fbx'}}));
});
