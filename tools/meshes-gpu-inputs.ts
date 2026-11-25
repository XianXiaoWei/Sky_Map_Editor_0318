import { AssetCatalog } from '../src/main/assets';
import { nativeMaterialDefs, nativeMaterialParameters } from '../src/core/mesh-surfaces';
import { portableShader } from '../src/core/materials';
import { bakedDiagnosticVertex, bakedDiagnosticFragment, nativeBakedState } from '../src/renderer/baked-renderer';
import * as THREE from 'three';
const data=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const catalog=new AssetCatalog(data), programs:any[]=[], missing:string[]=[], seen=new Set<string>();
for(const def of nativeMaterialDefs('Dawn'))for(const suffix of ['','Alpha','AlphaSkirt']){
  const name=def.shaderName+suffix;if(seen.has(name))continue;seen.add(name);
  try {const p=catalog.program(name);programs.push({name,vertexFile:p.definition.vertex,fragmentFile:p.definition.fragment,vertex:portableShader(p.vertexSource),fragment:portableShader(p.fragmentSource),parameters:nativeMaterialParameters(def),variables:p.variables});}
  catch(e){missing.push(`${name}: ${(e as Error).message}`);}
}
programs.push({name:'MeshesAttributeDiagnostic',vertex:'#version 300 es\n'+bakedDiagnosticVertex,fragment:'#version 300 es\n'+bakedDiagnosticFragment,parameters:[],variables:[]});
const blendFactors=new Map<number,string>([[THREE.ZeroFactor,'zero'],[THREE.OneFactor,'one'],[THREE.SrcAlphaFactor,'sourceAlpha'],[THREE.OneMinusSrcAlphaFactor,'oneMinusSourceAlpha']]);
const states=['Opaque','Decal','Skirts'].map(group=>{
  const s=nativeBakedState(group);
  if(s.depthFunc!==THREE.LessEqualDepth || (s.blending!==THREE.NoBlending&&s.blending!==THREE.CustomBlending))throw new Error('GPU state adapter needs update');
  return {group,depthTest:s.depthTest,depthWrite:s.depthWrite,depthFunc:'lessEqual',cull:s.side===THREE.FrontSide?'back':'none',
    blend:s.blending===THREE.CustomBlending,colorWrite:s.colorWrite,
    sourceRGB:blendFactors.get(s.blendSrc!),destinationRGB:blendFactors.get(s.blendDst!),sourceAlpha:blendFactors.get(s.blendSrcAlpha!),destinationAlpha:blendFactors.get(s.blendDstAlpha!),
    polygonOffset:s.polygonOffset,polygonOffsetFactor:s.polygonOffsetFactor,polygonOffsetUnits:s.polygonOffsetUnits};
});
console.log(JSON.stringify({programs,missing,states}));
