import test from 'node:test';
import assert from 'node:assert/strict';
import * as THREE from 'three';
import evidence from '../docs/meshes-render-state.json';
import { bakedRenderState, bakedPassOrder, bakedShaderSortKey } from '../src/core/mesh-render-state';
import { nativeBakedState, nativeBakedGroupMaterial } from '../src/renderer/baked-renderer';
import type { ShaderProgram } from '../src/core/materials';

test('Baked passes use captured native descriptors and keep Scene capacity separate',()=>{
  for(const group of ['Opaque','Decal','Skirts']) {
    const native=evidence.captureWithAlphaDepth.renderLists.find(r=>r.name===group)!;
    const state=nativeBakedState(group);
    assert.equal(state.depthTest,native.depth.test);assert.equal(state.depthWrite,native.depth.write);
    assert.equal(native.depth.metalCompare,3);assert.equal(state.depthFunc,THREE.LessEqualDepth);
    assert.equal(native.metalCull,2);assert.equal(state.side,THREE.FrontSide);
    assert.equal(state.polygonOffsetFactor,native.depthBias[1]);assert.equal(state.polygonOffsetUnits,native.depthBias[0]);
    assert.equal(state.blending,native.colors[0].blend?THREE.CustomBlending:THREE.NoBlending);
    if(native.colors[0].blend) {
      assert.equal(native.colors[0].alphaWrite,false);assert.equal(state.blendSrcAlpha,THREE.ZeroFactor);assert.equal(state.blendDstAlpha,THREE.OneFactor);
      assert.equal(native.colors[0].sourceRGB,'sourceAlpha');assert.equal(state.blendSrc,THREE.SrcAlphaFactor);
      assert.equal(native.colors[0].destinationRGB,'oneMinusSourceAlpha');assert.equal(state.blendDst,THREE.OneMinusSrcAlphaFactor);
    }
  }
  assert.deepEqual(['opaque','decal','skirt'].map(p=>bakedPassOrder(p as 'opaque'|'decal'|'skirt')),[0,1,2]);
  assert.equal(evidence.captureWithAlphaDepth.sceneLists.find(r=>r.name==='Opaque')!.capacity,3072);
  const copy=bakedRenderState('Skirts');copy.depth.write=true;assert.equal(bakedRenderState('Skirts').depth.write,false);
});
test('Native group material requires known state and valid uniforms before shader activation',()=>{
  const program: ShaderProgram={definition:{name:'explicit-test',group:'Skirts',vertex:'fixture.vert',fragment:'fixture.frag',hash:0,defines:'',source:'test',line:1},
    vertexSource:'void main(){}',fragmentSource:'void main(){}',variables:[{storage:'uniform',stage:'fragment',name:'u_required',type:'float',count:1}]};
  assert.throws(()=>nativeBakedGroupMaterial(program,{}),/u_required/);
  const material=nativeBakedGroupMaterial(program,{u_required:5});
  assert.equal(material.depthWrite,false);assert.equal(material.polygonOffsetFactor,-2);assert.equal(material.blendDstAlpha,THREE.OneFactor);
  assert.throws(()=>nativeBakedGroupMaterial({...program,definition:{...program.definition,group:'Cloud'}},{u_required:5}),/绘制组 Cloud/);
});
test('Native mode 3 shader keys use signed handles and original readiness/null sentinels',()=>{
  const oracle=evidence.captureWithAlphaDepth.shaderSort;
  const keys=Array.from({length:32},(_,i)=>{
    let handle=((i*19)%11-5)>>>0;if(i===3)handle=0x80000000;if(i===4)handle=0x7fffffff;
    return bakedShaderSortKey(i%7!==0,i===13?null:handle);
  });
  assert.deepEqual(keys,oracle.keys);
  assert.deepEqual([...keys].sort((a,b)=>a-b),oracle.order.map(i=>oracle.keys[i]));
  assert.throws(()=>bakedShaderSortKey(true,0x100000000),/uint32/);
});
