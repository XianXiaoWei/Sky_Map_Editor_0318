import test from 'node:test';
import assert from 'node:assert/strict';
import {viewportProbeBindings} from '../src/main/viewport-probe';
import {PROBE_BASE_PIXELS} from '../src/core/probe';
test('Atmosphere preview probe projects constant radiance into diffuse SH and preserves the original cube upload layout',()=>{
 const history=new Float32Array(PROBE_BASE_PIXELS*4),color=[.25,.5,1,1];
 for(let i=0;i<history.length;i+=4)history.set(color,i);
 const bound=viewportProbeBindings(history,[3,5,7]);
 // The original flush multiplies DC SH by sqrt(4*pi), giving integrated
 // radiance (4*pi*color), despite the uniform's "average" name.
 bound.uniforms.u_averageProbeColor.forEach((value,i)=>assert.ok(Math.abs(value-color[i]*4*Math.PI)<1e-5));
 assert.deepEqual(bound.uniforms.u_probeCenter,[3,5,7]);
 assert.deepEqual(bound.textures.u_probeCube.dimensions,[32,32,6]);
 assert.equal(bound.textures.u_probeCube.mipLevels,6);
 assert.equal(bound.textures.u_probeCube.data.length,8190*4*2);
 for(const name of ['u_probeShR0','u_probeShG0','u_probeShB0'] as const)assert.ok(bound.uniforms[name].slice(1).every(v=>Math.abs(v)<1e-6));
 for(const name of ['u_probeShR1','u_probeShG1','u_probeShB1','u_probeShRGB2'] as const)assert.ok(bound.uniforms[name].every(v=>Math.abs(v)<1e-6));
});
test('Directional preview probe produces directional SH without altering its source cubemap',()=>{
 const history=new Float32Array(PROBE_BASE_PIXELS*4);
 // The +X cube face emits red; all other faces emit zero.
 for(let pixel=0;pixel<1024;pixel++)history[pixel*4]=1;
 const before=history.slice(),bound=viewportProbeBindings(history,[0,0,0]);
 assert.ok(Math.abs(bound.uniforms.u_averageProbeColor[0]-4*Math.PI/6)<1e-5);
 assert.ok(bound.uniforms.u_probeShR0[1]>.5);
 assert.ok(Math.abs(bound.uniforms.u_probeShR0[2])<1e-6);
 assert.ok(Math.abs(bound.uniforms.u_probeShR0[3])<1e-6);
 assert.deepEqual(bound.uniforms.u_averageProbeColor.slice(1),[0,0]);
 assert.deepEqual(history,before);
});
