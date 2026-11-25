import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';import {gunzipSync} from 'node:zlib';
import {buildOriginalAmbienceLookup} from '../src/core/ambience-lookup-runtime';
import {createViewportEnvironment} from '../src/main/viewport-environment';
import {ObjectsDocument} from '../src/core/objects';
import {originalAmbiencePlanetSphere} from '../src/core/ambience-sun-runtime';
test('Both atmosphere lookup paths and all cheap-fog rows match independently executed original code',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/ambience-lookup-native.json.gz')).toString());
 for(const row of fixture.cases){let at=0;const c=row.input;const output=buildOriginalAmbienceLookup(c.ordinary,c.cheap,c.enabled,x=>{const b=Buffer.alloc(4);b.writeFloatLE(x);const call=row.trace[at++];assert.equal(b.readUInt32LE(),call.input,c.label);b.writeUInt32LE(call.result);return b.readFloatLE();});assert.equal(at,row.trace.length);assert.equal(crypto.createHash('sha256').update(new Uint8Array(output.rows.buffer)).digest('hex'),row.nativeSha256,c.label);}
});
test('Shared frame consumes prior sphere for derived sun and freezes repeated atmosphere reads',()=>{
 const owner=createViewportEnvironment([]),eyeA=[12,20,30],eyeB=[500,1200,-30];owner.beginFrame(eyeA);const a=owner(eyeA);owner.beginFrame(eyeB);const b=owner(eyeB);
 assert.deepEqual(b.priorSphere,a.sphere);assert.deepEqual(b.sphere,originalAmbiencePlanetSphere(eyeB));assert.strictEqual(owner(eyeB),b);assert.equal(owner.info().frame,2);
});
test('Environment events start through native Barn, replace defaults, append hulls and retain stop state',()=>{
 const data='/root/sky-research/original-runtime-corpus';
 let defaultEvents=0,hullEvents=0;
 for(const level of fs.readdirSync(data+'/Levels')){
  const original=fs.readFileSync(`${data}/Levels/${level}/Objects.level.bin`),doc=new ObjectsDocument(original),owner=createViewportEnvironment(doc.nodes);
  for(const node of doc.nodes.filter(n=>n.className==='SetEnvDefault'||n.className==='SetEnvHull')){
   const initial=owner.info(),before=initial.registrations.length;owner.trigger(node.id);const after=owner.info();assert.equal(after.registrations.length-before,8,`${level}/#${node.id}`);assert.equal(after.events.find(e=>e.id===node.id)?.running,false);
   if(node.className==='SetEnvHull'){hullEvents++;assert.equal(after.nodes.length,initial.nodes.length+1);owner.trigger(node.id);assert.equal(owner.info().nodes.length,initial.nodes.length+2);}else defaultEvents++;
  }
  assert.deepEqual(Buffer.from(doc.serialize()),original);
 }
 assert.equal(defaultEvents,29);assert.equal(hullEvents,4);
});
test('Moving a shared hull controller updates current and subsequent registrations without rewriting saved objects',()=>{
 const data='/root/sky-research/original-runtime-corpus';let count=0;
 for(const level of fs.readdirSync(data+'/Levels')){const file=`${data}/Levels/${level}/Objects.level.bin`,original=fs.readFileSync(file),doc=new ObjectsDocument(original);
  for(const event of doc.nodes.filter(n=>n.className==='SetEnvHull')){const clump=doc.nodes.find(n=>n.id===Number(event.fields.find(f=>f.name==='hull')?.value))!,id=Number(clump.fields.find(f=>f.name==='data')!.children![0].value),owner=createViewportEnvironment(doc.nodes),matrix=new Uint8Array(Float32Array.from([100,0,0,0,0,100,0,0,0,0,100,0,10000,20000,30000,1]).buffer);
   owner.setControllerTransform(id,matrix);owner.setControllerEnabled(id,true);owner.trigger(event.id);owner.advance({delta:.1,timeScale:1});const first=owner([10000,20000,30000]);owner.trigger(event.id);const handles=owner.info().registrationHandles;assert.equal(new Set(handles.map(h=>h.pointer)).size,handles.length);
   const changed=new Uint8Array(matrix);new DataView(changed.buffer).setFloat32(48,40000,true);assert.equal(owner.setControllerTransform(id,changed),true);assert.notStrictEqual(owner([10000,20000,30000]),first);
   owner.setControllerEnabled(id,false);assert.ok(owner.info().nodes.filter(n=>n.id===event.id).every(n=>!n.enabled));assert.deepEqual(Buffer.from(doc.serialize()),original);count++;
  }
 }
 assert.equal(count,4);
});
