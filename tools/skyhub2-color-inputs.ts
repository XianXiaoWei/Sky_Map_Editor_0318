import fs from 'node:fs';
import path from 'node:path';
import {ObjectsDocument} from '../src/core/objects';
import {effectiveLevelMeshMaterial} from '../src/core/model-draw';
import {beamoDrawMaterial} from '../src/core/beamo-draw';
import {objectScalar,objectText} from '../src/core/model-material-index';
import {AssetCatalog} from '../src/main/assets';
import {createViewportEnvironment} from '../src/main/viewport-environment';
import {skyProbe} from '../src/main/vulkan-baked';
import {decodePng} from '../src/core/png';
const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const nodes=new ObjectsDocument(fs.readFileSync(path.join(data,'Levels/SkyHub2/Objects.level.bin'))).nodes,catalog=new AssetCatalog(data,'SkyHub2');
const selected=nodes.filter(n=>objectText(n,'resourceName').startsWith('StormCardCloud')||n.id===844);
const rows=selected.map(node=>{
 const d=node.className==='LevelMesh'?effectiveLevelMeshMaterial(node,'SkyHub2'):beamoDrawMaterial(nodes,'SkyHub2',node.id,'primary').material;
 const t=node.fields.find(f=>f.name==='transform')?.value as number[];
 return {id:node.id,name:node.name,resource:objectText(node,'resourceName')||objectText(node,'meshName'),guid:objectScalar(node,'bstGuid'),shader:d.shaderName,parameters:d.parameters.map(p=>({name:p.name,vector:p.vector,texture:p.texture})),position:t?.slice(12,15),flags:Object.fromEntries(['visible','visibleInWorld','baked','selfShadow','simpleBake','isCloud'].map(name=>[name,node.fields.find(f=>f.name===name)?.value]))};
});
const images=['CloudFarTex','CliffSh'].map(name=>{
 const image=catalog.image(name),png=decodePng(fs.readFileSync(catalog.imageFile(name))),ranges=Array.from({length:4},()=>({min:255,max:0,sum:0}));
 for(let i=0;i<png.rgba.length;i++){const r=ranges[i%4],v=png.rgba[i];r.min=Math.min(r.min,v);r.max=Math.max(r.max,v);r.sum+=v;}
 return {name,fields:image.declaration?.fields,width:png.width,height:png.height,channels:ranges.map(r=>({...r,mean:r.sum/(png.width*png.height)}))};
});
const evaluate=createViewportEnvironment(nodes,undefined,{level:'SkyHub2'});
const cameras=[[440,285,200],...rows.filter(r=>r.id===844||r.flags.visibleInWorld!==false).map(r=>r.position!).filter(Boolean).slice(0,3)];
const lighting=cameras.map(eye=>{const e=evaluate(eye),probe=skyProbe(e,eye);return {eye,sunColor:e.sunColor,averageSky:e.average,averageProbe:probe.uniforms.u_averageProbeColor,exposure:e.values.AmbienceToneMap.exposure,atmosphereSample:e.atmosphereSample};});
evaluate.dispose();
const report={scope:'Saved SkyHub2 instances and current production inputs. Sky-only probe is an editor service; these values do not establish original scene parity.',rows,images,lighting};
fs.writeFileSync('docs/skyhub2-color-inputs.json',JSON.stringify(report,null,2)+'\n');
console.log(JSON.stringify(report,null,2));
