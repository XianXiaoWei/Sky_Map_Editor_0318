import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import {generateOriginalFlowerTexture} from '../src/core/flower-texture-runtime';
import {originalWaterRenderMatrix,originalOceanResourceNames,WaterSimulationState} from '../src/core/water-render-state';
import {createViewportEnvironment} from '../src/main/viewport-environment';
import type {ObjectNode} from '../src/core/objects';

test('FlowerTex matches every generated native RG byte',()=>{
 const fixture=JSON.parse(fs.readFileSync('tests/fixtures/flower-texture-native.json','utf8'));
 assert.equal(fixture.passed,true);assert.equal(fixture.entry,'0x10034e2b0');
 assert.deepEqual(Buffer.from(generateOriginalFlowerTexture()),Buffer.from(fixture.textureHex,'hex'));
});
test('Water preserves shear and all matrix lanes except the original Y shift; live transforms use shared owner storage',()=>{
 const matrix=Float32Array.from([2,.3,.1,0,.4,6,.2,0,.7,.8,9,0,11,12,13,1]),bytes=new Uint8Array(matrix.buffer);
 const expected=Array.from(matrix);expected[13]=15;
 assert.deepEqual(originalWaterRenderMatrix(bytes),expected);assert.equal(matrix[13],12);
 const node={id:7,className:'Water',fields:[{name:'transform',raw:Buffer.from(bytes).toString('hex'),kind:'matrix'},{name:'sunShadowed',raw:'01',kind:'boolean',value:true}]} as unknown as ObjectNode;
 const owner=createViewportEnvironment([node]);
 try{assert.deepEqual(owner.waterRenderStates(),[{nodeId:7,model:expected,specScale:Math.fround(.005)}]);
  matrix[13]=-20;assert.equal(owner.setControllerTransform(7,new Uint8Array(matrix.buffer)),true);
  assert.equal(owner.waterRenderStates()[0].model[13],-17);
  // Water has no native enabled property; do not invent a visibility toggle.
  assert.equal(owner.setControllerEnabled(7,false),false);
 }finally{owner.dispose();}
});
test('Water grid tracks negative coordinates, exact cell crossings, previous contact and reset',()=>{
 const state=new WaterSimulationState(),input={position:[-.01,4,-8],delta:1/60,radius:.3,depthImpulse:.8,sinkImpulse:.5};
 const a=state.next(input);assert.deepEqual(a.u_waterSimTerms.slice(0,2),[-8.0625,-16]);assert.deepEqual(a.u_waterSimTerms2.slice(0,2),[0,0]);
 const b=state.next({...input,position:[.0625,99,-7.9375]});assert.deepEqual(b.u_waterSimTerms2.slice(0,2),[.0078125,.00390625]);assert.deepEqual(b.u_waterSimTerms3,[.0625,-7.9375,Math.fround(-.01),-8]);
 state.reset();assert.deepEqual(state.next(input),a);
 for(const change of [{delta:-1},{radius:-1},{position:[NaN,0,0]},{sinkImpulse:Infinity}])assert.throws(()=>state.next({...input,...change}));
});
test('Ocean shader names preserve original level-specific rain/dark/cloud selection',()=>{
 assert.equal(originalOceanResourceNames('RainEnd',false).meshShader,'OceanDarkMeshWet');
 assert.equal(originalOceanResourceNames('DuskGraveyard',false).meshShader,'OceanDarkMesh');
 assert.equal(originalOceanResourceNames('Rain',false).meshShader,'OceanMeshWet');
 assert.equal(originalOceanResourceNames('rain',false).meshShader,'OceanMesh');
 assert.equal(originalOceanResourceNames('CandleSpace',false).shader,'OceanCandle');
 for(const level of ['OrbitMid','CandleSpaceEnd'])assert.equal(originalOceanResourceNames(level,true).cloud,false);
 assert.equal(originalOceanResourceNames('SkyHub2',true).shader,'OceanCloud');
});
