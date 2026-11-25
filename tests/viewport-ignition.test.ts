import {test} from 'node:test';
import assert from 'node:assert/strict';
import {canIgnite,PlantIgnitionPreview,type IgnitionTarget} from '../src/core/viewport-ignition';
const target:IgnitionTarget={nodeId:23,kind:'darkstone',position:[0,0,0],radius:.5,enabled:true,lit:false,burnt:false,progress:0};
test('camera proximity excludes far, disabled, lit and burnt targets and invalid eyes',()=>{
 assert.equal(canIgnite(target,[0,0,4.9]),true);assert.equal(canIgnite(target,[0,0,5.1]),false);
 for(const patch of [{enabled:false},{lit:true},{burnt:true}])assert.equal(canIgnite({...target,...patch},[0,0,1]),false);
 assert.equal(canIgnite(target,[NaN,0,0]),false);assert.equal(canIgnite(target,[0,0]),false);
});
test('plant simulation advances independently by instance, rejects duplicate ignition and resets with owner',()=>{
 const preview=new PlantIgnitionPreview();assert.deepEqual(preview.state(23),{lit:false,burnt:false,progress:0});
 preview.ignite(23);preview.advance(.5);preview.ignite(42);
 assert.ok(preview.state(23).progress>0&&preview.state(23).progress<1);assert.equal(preview.state(42).progress,0);assert.throws(()=>preview.ignite(23));
 preview.advance(10);assert.equal(preview.state(23).burnt,true);assert.equal(preview.state(42).burnt,true);assert.equal(preview.state(23).progress,1);
 assert.throws(()=>preview.advance(-1));assert.throws(()=>preview.advance(Infinity));assert.equal(new PlantIgnitionPreview().state(23).lit,false);
});
