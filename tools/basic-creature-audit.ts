import fs from 'node:fs';
import path from 'node:path';
import {createHash} from 'node:crypto';
import {ObjectsDocument} from '../src/core/objects';
import {basicCreaturePlans} from '../src/core/basic-creature-plan';
import {AssetCatalog} from '../src/main/assets';
import {readResourceMesh} from '../src/core/resources';
import {ResourceModelAnimationPreview,resourceModelPreviewActions,resourceModelDefaultAnimation} from '../src/core/resource-model-animation-preview';
import {resourceModelGeometry} from '../src/renderer/resource-model-renderer';
const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const rows:any[]=[],maps:any[]=[],cache=new Map<string,any>();
for(const level of fs.readdirSync(path.join(data,'Levels')).sort()){
 const file=path.join(data,'Levels',level,'Objects.level.bin');if(!fs.existsSync(file))continue;const source=fs.readFileSync(file),doc=new ObjectsDocument(source),catalog=new AssetCatalog(data,level);
 const plans=basicCreaturePlans(doc.nodes);
 for(const p of plans){let actual=p.resource,mesh;try{mesh=readResourceMesh(fs.readFileSync(catalog.meshFile(actual)));}catch{actual=p.fallback;try{mesh=readResourceMesh(fs.readFileSync(catalog.meshFile(actual)));}catch{}}
  if(p.kind==='butterfly'){rows.push({...p,level,path:0,actualResource:actual,available:!!mesh,vertices:mesh?mesh.positions.length/3:0,animation:'Mote0.vert independent wing phase',animationChanged:!!mesh?.uvs.some((v,i)=>i%8===1&&v<.95),proceduralAnimation:true});continue;}
  let result=cache.get(actual);if(!result){result={available:!!mesh};if(mesh){const g=resourceModelGeometry(mesh);result.vertices=g.getAttribute('position').count;result.poseBoundary=g.userData.nativeSkinBoundary;g.dispose();const list=catalog.animationList(),actions=resourceModelPreviewActions(mesh,list);result.actions=actions.filter(a=>a.available).map(a=>a.name);const preferred=actions.find(a=>a.available&&(/crab|buddy/.test(p.kind)?/walk|run/i:/fly|swim|patrol/i).test(a.name));try{const name=preferred?.name??(resourceModelDefaultAnimation(mesh,list).available?undefined:actions.find(a=>a.available)?.name);const preview=new ResourceModelAnimationPreview(mesh,list,name),a=preview.step(0),b=preview.step(.2);result.animation=preview.name;result.animationChanged=!Buffer.from(a.packedPositions!).equals(Buffer.from(b.packedPositions!));}catch(error){result.animationError=String(error);}}cache.set(actual,result);}
  rows.push({...p,level,path:p.path.length,actualResource:actual,...actual!==p.resource?{fallbackFrom:p.resource}:{},...result});
 }
 if(!doc.serialize().equals(source))throw new Error('原文件变化：'+level);maps.push({level,objects:plans.length,sourceSha256:createHash('sha256').update(source).digest('hex'),sourceUnchanged:true});
}
const summary={maps:maps.length,creatureObjects:rows.length,generatedFlockBirds:rows.filter(r=>r.kind==='flock').reduce((n,r)=>n+r.count,0),kinds:Object.fromEntries([...new Set(rows.map(r=>r.kind))].map(k=>[k,rows.filter(r=>r.kind===k).length])),resourceModels:rows.filter(r=>r.available).length,fallbacks:rows.filter(r=>r.fallbackFrom).length,animatedObjects:rows.filter(r=>r.animation&&!r.animationError).length,movingAnimationSamples:rows.filter(r=>r.animationChanged).length,paths:rows.filter(r=>r.path>1).length};
const passed=rows.every(r=>r.available&&r.vertices>0&&!r.poseBoundary&&!r.animationError);
fs.writeFileSync('docs/basic-creature-audit.json',JSON.stringify({passed,summary,maps,rows,scope:'基础编辑器预览：真实生物模型、动作采样、动态 SpawnMotes 蝴蝶和待事件启用实例；原 BirdFlock 数量由地图配置决定。蝴蝶使用原 Mote0.vert，独立运动，不进行骨骼动画采样。非完整原版 AI 验收。'},null,2)+'\n');console.log(JSON.stringify({passed,summary,errors:rows.filter(r=>!r.available||r.poseBoundary||r.animationError).map(r=>({level:r.level,id:r.id,resource:r.actualResource,error:r.poseBoundary??r.animationError}))}));if(!passed)process.exitCode=1;
