import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import {gunzipSync} from 'node:zlib';
import {solveOriginalFloppySpine,type FloppySpineState} from '../src/core/floppy-spine';
test('Original FloppySpine history and XYZ constraints match unmodified native Update over turns and teleports',()=>{
 const rows=JSON.parse(gunzipSync(fs.readFileSync(new URL('./fixtures/floppy-spine-native.json.gz',import.meta.url))).toString());let frames=0;
 for(const row of rows){const c=row.input,s:FloppySpineState={positions:Float32Array.from(c.positions),lengths:Float32Array.from(c.lengths),history:Float32Array.from(c.history),directionHistory:Float32Array.from(c.directionHistory)};
  for(const [step,anchor] of c.anchors.entries()){
   s.positions.set(anchor);solveOriginalFloppySpine(s,[0,1,0,0]);
   const xyz=Float32Array.from({length:c.lengths.length*3},(_,k)=>s.positions[Math.floor(k/3)*4+k%3]);
   const actual=Buffer.concat([Buffer.from(xyz.buffer),Buffer.from(s.history.buffer),Buffer.from(s.directionHistory.buffer)]);
   assert.ok(actual.equals(Buffer.from(row.nativeFrames[step],'base64')),`native frame ${frames}`);
   for(let i=1;i<s.lengths.length;i++){const a=(i-1)*4,b=i*4;assert.ok(Math.abs(Math.hypot(s.positions[b]-s.positions[a],s.positions[b+1]-s.positions[a+1],s.positions[b+2]-s.positions[a+2])-s.lengths[i])<1e-5);}
   frames++;
  }
 }
 assert.equal(frames,1152);
});
