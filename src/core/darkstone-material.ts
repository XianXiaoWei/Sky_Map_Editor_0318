import type {MaterialDescriptor,ShaderParameter} from './materials';
import type {ObjectNode} from './objects';
import evidence from '../../docs/darkstone-initialization-native.json';

/** Explicit saved SoulTrap.meshes ownership. A mesh name or shader alone
 * does not establish a Darkstone owner. */
export function savedDarkstoneMeshes(nodes:readonly ObjectNode[]){
 const byId=new Map(nodes.map(n=>[n.id,n])),meshes=new Set<number>();
 for(const owner of nodes.filter(n=>n.className==='SoulTrap')){
  const clump=byId.get(Number(owner.fields.find(f=>f.name==='meshes')?.value));
  if(clump?.className!=='Clump')continue;
  for(const member of clump.fields.find(f=>f.name==='data')?.children??[]){
   const mesh=byId.get(Number(member.value));if(mesh?.className==='LevelMesh')meshes.add(mesh.id);
  }
 }
 return meshes;
}
/** Project the original initialization material calls into the existing GPU
 * preview sink. Static default colors are exact native vec4 bits. This does
 * not allocate a Model or run burning Update. Runtime bindings may supersede
 * these initial values; saved fields and unrelated meshes remain intact. */
export function initialDarkstonePreviewMaterial(material:MaterialDescriptor):MaterialDescriptor {
 if(material.shaderName!=='DarkStone')return material;
 const initial:ShaderParameter[]=[
  {name:'u_diffuseColor',nativeType:1,vector:evidence.colors.diffuse.values.slice(),texture:'',fieldId:'darkstone:init:diffuse'},
  {name:'u_texSpots',nativeType:2,vector:[],texture:'DeerSpotTex',fieldId:'darkstone:init:spots'},
  {name:'u_normal',nativeType:2,vector:[],texture:'DarkstoneNorTex',fieldId:'darkstone:init:normal'},
  {name:'u_spotsColor',nativeType:1,vector:[0,0,0,0],texture:'',fieldId:'darkstone:init:spotsColor'},
 ];
 const replacements=new Map(initial.map(p=>[p.name,p]));
 const parameters=material.parameters.map(p=>replacements.get(p.name)??p);
 for(const p of initial)if(!parameters.some(v=>v.name===p.name))parameters.push(p);
 return {...material,parameters};
}
