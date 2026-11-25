import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import {staticModelVertexVerified} from '../src/main/viewport-static-model';
const shaders='/root/sky-research/original-runtime-corpus/Shaders/Bin/';
test('Audited original static vertex stages allow culling; changed positions are rejected',()=>{
 for(const name of ['Mesh0.vert','Mesh27454.vert']){
  const source=fs.readFileSync(shaders+name,'utf8');assert.equal(staticModelVertexVerified(source),true);
  assert.equal(staticModelVertexVerified(source.replace('tmpvar_2.xyz = a_position;','tmpvar_2.xyz = a_position + vec3(20.0);')),false);
 }
 assert.equal(staticModelVertexVerified('void main(){ gl_Position=vec4(0); }'),false);
});
