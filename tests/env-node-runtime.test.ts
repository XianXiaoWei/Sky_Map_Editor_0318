import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import { gunzipSync } from 'node:zlib';
import { constructOriginalEnvNode,ENV_NODE_GROUPS,readOriginalEnvNodeEnabled,writeOriginalEnvNodeEnabled } from '../src/core/env-node-runtime';
import { ObjectsDocument } from '../src/core/objects';
import { readEnvironmentStorage } from '../src/core/environment-storage';
import { createViewportEnvironment } from '../src/main/viewport-environment';

test('Whole original EnvNode constructor preserves unwritten bytes and all real saved/default overlays',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/env-node-constructor-native.json.gz')).toString());
 for(const c of fixture.cases){const storage=Uint8Array.from(Buffer.from(c.initial,'base64'));let calls=0;
  constructOriginalEnvNode(storage,{ensureBaseMetaType:()=>{calls++;},envNodeClassId:()=>c.ids[0],genericValueClassId:()=>c.ids[1],groupClassId:name=>c.ids[2+ENV_NODE_GROUPS.findIndex(([g])=>g===name)],zeroColor:()=>new Uint8Array(Float32Array.from([0,0,0,1]).buffer),vptr:BigInt(c.vptr)});
  assert.deepEqual(Buffer.from(storage),Buffer.from(c.nativeCtor,'base64'),c.label);assert.equal(calls,c.baseMetaCalls);
  assert.equal(storage[0x50],Buffer.from(c.initial,'base64')[0x50],`${c.label}: constructor does not default enabled`);
  const raw=Buffer.from(c.raw,'base64'),mask=Buffer.from(c.mask,'base64');for(let i=0;i<0x410;i++)if(mask[i])storage[i]=raw[i];
  assert.deepEqual(Buffer.from(storage),Buffer.from(c.nativeLoaded,'base64'),c.label);
  writeOriginalEnvNodeEnabled(storage,0);assert.equal(readOriginalEnvNodeEnabled(storage),0);writeOriginalEnvNodeEnabled(storage,1);assert.equal(readOriginalEnvNodeEnabled(storage),1);
 }
});
const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus';
test('EnvNode missing enabled uses its original true tag; saved false stays false',()=>{
 const nodes=new ObjectsDocument(fs.readFileSync(`${data}/Levels/Dawn/Objects.level.bin`)).nodes,node=nodes.find(n=>n.className==='EnvNode')!;
 const absent={...node,fields:node.fields.filter(f=>f.name!=='enabled')};assert.equal(readEnvironmentStorage(absent).storage[0x50],1);
 const disabled={...absent,fields:[...absent.fields,{id:'test',name:'enabled',kind:'bool',value:0,raw:'00',offset:0,length:1}]};assert.equal(readEnvironmentStorage(disabled).storage[0x50],0);
});
test('One shared owner advances timers explicitly; repeated camera/renderer sampling does not advance fade',()=>{
 const nodes=new ObjectsDocument(fs.readFileSync(`${data}/Levels/Dawn/Objects.level.bin`)).nodes;
 const owner=createViewportEnvironment(nodes);owner([0,0,0]);const before=owner.info();
 owner([0,100,0]);owner([100,100,20]);assert.deepEqual(owner.info(),before);
 const target=before.nodes[0];assert.ok(target);owner.setEnabled(target.id,false);owner.advance({delta:.05,timeScale:1});
 const after=owner.info();assert.equal(after.nodes[0].enabled,false);assert.ok(after.revision>before.revision);
 assert.notDeepEqual(after.nodes[0].states,before.nodes[0].states);owner([0,0,0]);assert.deepEqual(owner.info(),after);
});
test('No EnvNode/default retains the original initialized output; absent default retains last regional output after exit',()=>{
 const empty=createViewportEnvironment([]),before=empty([0,0,0]);empty.advance({delta:.1,timeScale:1});assert.deepEqual(empty([0,0,0]).values,before.values);
 const nodes=new ObjectsDocument(fs.readFileSync(`${data}/Levels/Dawn/Objects.level.bin`)).nodes.filter(n=>n.className==='EnvNode');
 const node=nodes[0],fields=node.fields.map(f=>f.name==='duration'?{...f,raw:'00000000',value:{float:0,uint:0,int:0}}:f.name==='enabled'?{...f,raw:'01',value:1}:f);
 const region={...node,fields};const owner=createViewportEnvironment([region]);
 const pos=region.fields.find(f=>f.name==='pos')?.value as number[];assert.ok(pos?.length>=3);
 const inside=owner(pos.slice(0,3));const outside=owner([100000,100000,100000]);assert.deepEqual(outside.values,inside.values);
});
