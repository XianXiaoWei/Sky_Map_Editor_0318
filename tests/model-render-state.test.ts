import test from 'node:test';import assert from 'node:assert/strict';
import evidence from '../docs/model-render-state.json';import {modelRenderState,modelRenderStateCode,materialUsesAlphaPass} from '../src/core/model-render-state';import {materialDrawBoundary} from '../src/core/model-draw';import type {MaterialDescriptor,ShaderProgram} from '../src/core/materials';import {orderViewportMaterialDraws} from '../src/core/viewport-material-order';import type {VulkanModelDraw} from '../src/core/vulkan-protocol';
test('Model lists use independent original descriptors, including transparent alpha and culling',()=>{
 for(const group of ['Opaque','Decal','AlphaTestOpaque','Skybox','Ghostly','Blended','BlendedBackground','BlendedWithBackfaces'])assert.deepEqual(modelRenderState(group),evidence.captureWithAlphaDepth.renderLists.find(r=>r.name===group));
 assert.equal(modelRenderState('Skybox').colors[0].alphaWrite,false);assert.equal(materialUsesAlphaPass(modelRenderStateCode('Skybox')),false);assert.equal(materialUsesAlphaPass(modelRenderStateCode('Ghostly')),false);
 for(const group of ['Blended','BlendedBackground','BlendedWithBackfaces']){const s=modelRenderState(group);assert.equal(s.depth.write,false);assert.equal(s.depth.test,true);assert.equal(s.colors[0].sourceAlpha,'one');assert.equal(s.colors[0].destinationAlpha,'oneMinusSourceAlpha');assert.equal(s.colors[1].blend,true);assert.equal(s.colors[2].blend,false);assert.deepEqual(s.depthBias,[0,0,0]);assert.equal(s.metalCull,group==='BlendedWithBackfaces'?0:2);}
 assert.equal(modelRenderStateCode('AlphaTestOpaque'),6);assert.equal(modelRenderStateCode('Blended'),9);assert.equal(modelRenderStateCode('BlendedWithBackfaces'),10);assert.throws(()=>modelRenderState('Cloud'),/绘制组/);
});
test('LevelMaterial and custom LevelMesh parameter type conventions stay separate',()=>{
 const material={custom:true,shaderName:'test',parameters:[{name:'u_tex',nativeType:1,texture:'White',vector:[]},{name:'u_vec',nativeType:0,texture:'',vector:[1,2,3,4]}]} as unknown as MaterialDescriptor;
 const program={definition:{name:'test',group:'Blended'},variables:[{name:'u_tex',storage:'uniform',stage:'fragment',type:'sampler2D',count:1},{name:'u_vec',storage:'uniform',stage:'fragment',type:'vec4',count:1}]} as ShaderProgram;
 assert.equal(materialDrawBoundary(material,program,true,false,'material'),null);assert.equal(materialDrawBoundary(material,program,true,false,'model'),'Texture u_tex');
 assert.equal(materialDrawBoundary({...material,shaderName:'different'},program,true,false,'material'),'Material shader identity');assert.equal(materialDrawBoundary(material,program,true,true,'material'),'Native skinning/animation unavailable');
});
test('Editor transparent ordering retains recovered list order and changes with camera distance',()=>{
 const make=(id:number,z:number,group:VulkanModelDraw['group']):VulkanModelDraw=>{const vertices=new Uint8Array(144),d=new DataView(vertices.buffer);for(let i=0;i<3;i++)d.setFloat32(i*48+8,z,true);return{nodeId:id,group,shader:'test',state:modelRenderStateCode(group),stride:48,vertices,indices:Uint32Array.from([0,1,2]),model:[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1],baked:true};};
 const draws=[make(1,1,'Blended'),make(2,9,'Blended'),make(3,2,'Opaque'),make(4,2,'BlendedBackground')];
 assert.deepEqual(orderViewportMaterialDraws(draws,[0,0,0]).map(d=>'nodeId' in d?d.nodeId:0),[3,4,2,1]);assert.deepEqual(orderViewportMaterialDraws(draws,[0,0,10]).map(d=>'nodeId' in d?d.nodeId:0),[3,4,1,2]);
});
