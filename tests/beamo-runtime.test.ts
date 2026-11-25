import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import {gunzipSync} from 'node:zlib';
import {evaluateBeamoBake} from '../tools/beamo-bake-cases';import {evaluateBeamoRuntime} from '../tools/beamo-runtime-cases';
import {evaluateBeamoUnload} from '../tools/beamo-unload-cases';
import {evaluateBeamoRecords} from '../tools/beamo-record-cases';
import {createOriginalBeamo,initializeOriginalBeamoBarn,prepareOriginalBeamoRecords,OriginalBeamoEndpoint} from '../src/core/beamo-runtime';
import {selectOriginalBeamoBake} from '../src/core/beamo-baked-runtime';
import {beamoBakeInput,selectEditorBeamoBake} from '../src/core/beamo-bake-adapter';import {ObjectsDocument} from '../src/core/objects';import {MeshesDocument} from '../src/core/meshes';import {readResourceMesh} from '../src/core/resources';
import {loadEditorLevelDataModelBakes} from '../src/core/level-data-bake-adapter';import {findLoadedBake} from '../src/core/baked-lookup';import {objectScalar,objectText} from '../src/core/model-material-index';

test('Original Beamo and BeamoDecal bake predicate, opaque pointer, selected LODs and distance bits match all native inputs',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/beamo-bake-native.json.gz')).toString());
 for(const c of fixture.cases)assert.deepEqual(evaluateBeamoBake(c.input),Buffer.from(c.native,'base64'),c.input.label);
});
test('Original Beamo placements/pool creation/assertions/Changed/transforms preserve native byte snapshots and service order',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/beamo-runtime-native.json.gz')).toString());
 for(const c of fixture.cases)assert.deepEqual(evaluateBeamoRuntime(c.input),Buffer.from(c.native,'base64'),c.input.label);
});
test('Original BeamoBarn unload and destructors preserve native release order, dynamic counts, replacement tables and pool bytes',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/beamo-unload-native.json.gz')).toString());
 for(const c of fixture.cases)assert.deepEqual(evaluateBeamoUnload(c.input),Buffer.from(c.native,'base64'),c.input.label);
});
test('Original BeamoBarn record preparation and actual material GUID lookup match all native corpus records and missing-material assertions',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/beamo-record-native.json.gz')).toString());
 for(const c of fixture.cases)assert.deepEqual(evaluateBeamoRecords(c.input),Buffer.from(c.native,'base64'),c.input.label);
});
test('Beamo pool creation, runtime records, bake acceptance and interaction endpoints retain the same live object addresses',()=>{
 const base=0x310000000n,b=Buffer.alloc(0xa2100,0xa5),at=(a:bigint)=>Number(a-base);
 const m={bytes:(a:bigint,n:number)=>b.subarray(at(a),at(a)+n),read32:(a:bigint)=>b.readUInt32LE(at(a)),read64:(a:bigint)=>b.readBigUInt64LE(at(a)),write32:(a:bigint,v:number)=>b.writeUInt32LE(v>>>0,at(a)),write64:(a:bigint,v:bigint)=>b.writeBigUInt64LE(v,at(a)),write8:(a:bigint,v:number)=>{b[at(a)]=v&255;},string:()=>''};
 initializeOriginalBeamoBarn(m,base);
 const services={baseClassId:()=>16,worldClassId:()=>17,worldVptr:0x100c87fe8n,ensureLevelModelMeta:()=>{},classId:(kind:string)=>kind==='Beamo'?19:20};
 const normal=createOriginalBeamo(m,base,'Beamo',services),decal=createOriginalBeamo(m,base,'BeamoDecal',services);
 for(const object of [normal,decal]){m.write32(object+0x50n,123);m.write32(object+0x70n,7);}
 m.write32(normal+0x74n,0);m.write32(normal+0xa0n,0x3f800000);m.write32(normal+0xa4n,0x3f800000);
 m.write32(decal+0x74n,0x42480000);const levelData=base+0x69000n;m.write8(levelData+13n,0);
 const material=base+0x69100n;
 prepareOriginalBeamoRecords(m,base,base+0x69200n,levelData,{baseClassId:()=>16,findMaterial:(_barn,guid)=>guid===7?material:0n,meshName:()=>''});
 const table=m.read64(base+0x20020n),mesh=base+0x69300n,lod=base+0x69400n,bake=base+0x69600n,loadedLod=base+0x69700n;
 m.write32(mesh+0x40n,1);m.write64(mesh+0x48n,lod);m.write32(lod,0x42c80000);m.write32(lod+0x34n,42);
 m.write32(bake+0x1cn,1);m.write64(bake+0x28n,loadedLod);m.write32(loadedLod,42);m.write64(loadedLod+8n,0n);m.write64(loadedLod+16n,base+0x69800n);
 for(const [i,object] of [normal,decal].entries()){
  const record=table+BigInt(i)*384n;assert.equal(m.read64(record+8n),object);assert.equal(m.read64(record+16n),i===0?normal:0n);assert.equal(m.read64(record+0xd8n),material);
  m.write64(record+0x18n,mesh);assert.equal(selectOriginalBeamoBake(m,record,true,bake),true);assert.equal(m.read64(record+0x20n),bake);
  const endpoint=new OriginalBeamoEndpoint(i,object,i===0?'Beamo':'BeamoDecal',m),matrix=Buffer.from(Array.from({length:64},(_,j)=>(j*113)&255));
  assert.equal(endpoint.barn,base);assert.equal(endpoint.getGuid(),123);endpoint.setTransform(matrix);assert.deepEqual(Buffer.from(endpoint.getTransform()),matrix);assert.deepEqual(m.bytes(m.read64(record+8n)+16n,64),matrix);
  assert.equal(b[12],0);endpoint.changed();assert.equal(b[12],1);m.write8(base+12n,0);
 }
 assert.equal(m.read64(table+8n),normal);assert.equal(m.read64(table+384n+8n),decal);
});
test('Real BeamoDecal accepted bake retains distinct light/opaque bytes; missing Beamo fields use proven tags without changing Objects',()=>{
 const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',file=`${data}/Levels/Dawn/Objects.level.bin`,raw=fs.readFileSync(file),doc=new ObjectsDocument(raw),baked=new MeshesDocument(fs.readFileSync(`${data}/Levels/Dawn/BstBaked.meshes`));
 const cache=new Map<string,ReturnType<typeof readResourceMesh>>(),resolve=(name:string)=>{if(!cache.has(name))cache.set(name,readResourceMesh(fs.readFileSync(`${data}/Meshes/Bin/${name}.mesh`)));return cache.get(name)!;};
 const source=loadEditorLevelDataModelBakes(baked,name=>{try{return resolve(name);}catch(e){if((e as NodeJS.ErrnoException).code==='ENOENT')return null;throw e;}});
 const decal=doc.nodes.find(n=>n.className==='BeamoDecal')!;assert.ok(decal);const mesh=resolve(objectText(decal,'meshName')),record=findLoadedBake(source,objectScalar(decal,'bstGuid'))!;
 const selected=selectEditorBeamoBake(decal,mesh,record);assert.equal(selected.accepted,true);assert.equal(selected.record,record);assert.ok(record.lods[0].lighting?.packed.length);assert.ok(record.lods[0].extra!==null);
 const absent=structuredClone(record);absent.lods[0].extra=null;assert.equal(selectEditorBeamoBake(decal,mesh,absent).accepted,false);
 const absentLight=structuredClone(record);absentLight.lods[0].lighting=null;assert.equal(selectEditorBeamoBake(decal,mesh,absentLight).accepted,true);
 const beamo=doc.nodes.find(n=>n.className==='Beamo')!,defaultNode={...beamo,fields:beamo.fields.filter(f=>!['lodDists','lodEnables'].includes(f.name))};
 const input=beamoBakeInput(defaultNode,resolve(objectText(beamo,'meshName')),findLoadedBake(source,objectScalar(beamo,'bstGuid')));
 assert.deepEqual(input.distanceBits,[0xbf800000,0xbf800000,0xbf800000]);assert.deepEqual(input.enableBits,[0x3f800000,0x3f800000,0x3f800000]);assert.deepEqual(doc.serialize(),raw);assert.deepEqual(fs.readFileSync(file),raw);
});
