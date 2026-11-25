import fs from 'node:fs';
import {assetPath} from '../core/storage';
import {avatarPreviewMeshFile,type AvatarPreviewResources} from '../core/avatar-preview';
import type {ResourceMesh} from '../core/resources';
import type {AssetCatalog} from './assets';
export function loadAvatarPreview(root:string,catalog:AssetCatalog,mesh:(name:string)=>ResourceMesh):AvatarPreviewResources {
 const outfits:unknown=JSON.parse(fs.readFileSync(assetPath(root,'Resources/OutfitDefs.json'),'utf8'));if(!Array.isArray(outfits))throw new Error('OutfitDefs 不是数组');
 const parts:AvatarPreviewResources['parts']=[],omitted:string[]=[];
 // Only unique default mesh declarations are displayed. Multi-mesh masks need
 // the original variant selector and are retained as an unresolved dependency.
 for(const outfit of outfits.filter(o=>o.isDefault===true)){
  if(outfit.type==='prop')continue;
  if(!Array.isArray(outfit.mesh)||outfit.mesh.length!==1){omitted.push(`${outfit.name}：网格变体选择待恢复`);continue;}
  const resource=outfit.mesh[0],definition=catalog.resourceDefinition('Mesh',resource);if(!definition)throw new Error(`缺少 Avatar Mesh 声明：${resource}`);
  const file=avatarPreviewMeshFile(definition.entry);parts.push({slot:outfit.type,outfit:outfit.name,resource,file,mesh:mesh(file)});
 }
 if(!parts.some(p=>p.slot==='body'))throw new Error('缺少原默认 body Mesh');
 return {parts,omitted,scope:'OutfitDefs isDefault 单网格定义的原 v28 LOD0 静态几何。默认标记不代表账户装备；骨骼动画、mask 变体、原 shader/纹理及原角色比例待恢复。'};
}
