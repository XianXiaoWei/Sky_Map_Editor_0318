import * as THREE from 'three';
import {MeshBVH,acceleratedRaycast,CENTER} from 'three-mesh-bvh';

// Read-only editor query acceleration. Indirect mode preserves the original
// index stream, face IDs, material groups and exported geometry bytes.
const prepared=new WeakMap<THREE.BufferGeometry,{position:THREE.BufferAttribute;index:THREE.BufferAttribute;positionVersion:number;indexVersion:number;groups:string;tree:MeshBVH}>();
function groups(geometry:THREE.BufferGeometry){return JSON.stringify([geometry.groups,geometry.drawRange]);}
export function prepareInteractionMesh(object:THREE.Mesh){
 const geometry=object.geometry,position=geometry.getAttribute('position'),index=geometry.index;
 if(!(position instanceof THREE.BufferAttribute)||!index||index.count<384||geometry.userData.nativeAnimated)return false;
 let entry=prepared.get(geometry);
 if(!entry){entry={position,index,positionVersion:position.version,indexVersion:index.version,groups:groups(geometry),tree:new MeshBVH(geometry,{indirect:true,strategy:CENTER,targetLeafSize:16})};prepared.set(geometry,entry);}
 geometry.boundsTree=entry.tree;
 geometry.computeBoundingBox();geometry.computeBoundingSphere();
 object.raycast=function(raycaster,hits){
  const current=prepared.get(this.geometry);
  const unchanged=current&&this.geometry.getAttribute('position')===current.position&&this.geometry.index===current.index&&current.position.version===current.positionVersion&&current.index.version===current.indexVersion;
  if(current&&!unchanged){this.geometry.boundingBox=null;this.geometry.boundingSphere=null;this.geometry.boundsTree=undefined;prepared.delete(this.geometry);}
  if(unchanged&&groups(this.geometry)===current.groups)acceleratedRaycast.call(this,raycaster,hits);
  else THREE.Mesh.prototype.raycast.call(this,raycaster,hits);
 };
 return true;
}
export async function prepareInteractionScene(root:THREE.Object3D,current:()=>boolean){
 const meshes:THREE.Mesh[]=[];root.traverse(object=>{if(object instanceof THREE.Mesh&&!object.userData.editorHelper)meshes.push(object);});
 let slice=performance.now();
 for(const mesh of meshes){if(!current())return;prepareInteractionMesh(mesh);if(performance.now()-slice>4){await new Promise<void>(resolve=>requestAnimationFrame(()=>resolve()));slice=performance.now();}}
}
