import fs from 'node:fs';
import path from 'node:path';
import {ObjectsDocument} from '../src/core/objects';
import {readResourceMesh} from '../src/core/resources';
import {objectText} from '../src/core/model-material-index';
import {AssetCatalog} from '../src/main/assets';
const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const cache=new Map<string,ReturnType<typeof readResourceMesh>>(),resources:any[]=[],maps:any[]=[];
for(const level of fs.readdirSync(path.join(data,'Levels')).sort()){
 const file=path.join(data,'Levels',level,'Objects.level.bin');if(!fs.existsSync(file))continue;
 const doc=new ObjectsDocument(fs.readFileSync(file)),catalog=new AssetCatalog(data,level),owners:any[]=[],errors:any[]=[];
 for(const node of doc.nodes){
  if(!['LevelMesh','Beamo','BeamoDecal'].includes(node.className))continue;
  const name=objectText(node,node.className==='LevelMesh'?'resourceName':'meshName')||'UnitCube';
  try{const file=catalog.meshFile(name);let mesh=cache.get(file);if(!mesh){mesh=readResourceMesh(fs.readFileSync(file));cache.set(file,mesh);resources.push({name,file,animated:mesh.animated,levels:mesh.levels.map(l=>({vertices:l.positions.length/3,triangles:l.indices.length/3,distance:l.lodDistance}))});}
   owners.push({nodeId:node.id,className:node.className,name,lods:mesh.lods,highTriangles:mesh.indices.length/3,lowTriangles:mesh.levels.at(-1)!.indices.length/3,highVertices:mesh.positions.length/3,lowVertices:mesh.levels.at(-1)!.positions.length/3});
  }catch(error){errors.push({nodeId:node.id,name,error:String(error)});}
 }
 const sum=(key:string)=>owners.reduce((n,o)=>n+o[key],0),high=sum('highTriangles'),low=sum('lowTriangles');
 maps.push({level,owners:owners.length,multiLodOwners:owners.filter(o=>o.lods>1).length,highTriangles:high,lowestTriangles:low,maximumGeometryReduction:low?high/low:1,highVertices:sum('highVertices'),lowestVertices:sum('lowVertices'),errors,instances:owners});
}
const report={scope:'Resource model geometry only. Lowest-LOD totals are an upper bound: actual distance selection retains nearby detail. Terrain, effects, draw count, shading and presentation are excluded. This is not an FPS benchmark.',resources:resources.length,multiLodResources:resources.filter(r=>r.levels.length>1).length,maps,models:resources};
fs.writeFileSync('docs/model-lod-audit.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify({...report,maps:maps.map(({instances,...map})=>map),models:undefined}));
