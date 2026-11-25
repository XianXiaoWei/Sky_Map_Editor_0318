import type {Field,ObjectNode} from './objects';
import type {ResourceManifestEntry} from './resource-manifest';
import type {ResourceMesh} from './resources';
export interface AvatarPreviewPart {slot:string;outfit:string;resource:string;file:string;mesh:ResourceMesh;}
export interface AvatarPreviewResources {parts:AvatarPreviewPart[];omitted:string[];scope:string;}
export interface AvatarSpawnCandidate {id:number;name:string;markerId:number|null;relativeMarkerId:number|null;flags:Record<string,boolean|null>;available:boolean;reason:string;}
const names=['setLevelStartPosition','randomGroundInMarker','breakHandHold','killMomentum','onGround'];
function field(node:ObjectNode,name:string):Field|undefined {const visit=(fields:Field[]):Field|undefined=>{for(const f of fields){if(f.name===name)return f;const child=f.children&&visit(f.children);if(child)return child;}};return visit(node.fields);}
/** Serialized candidates, without startup selection or inferred field defaults. */
export function avatarSpawnCandidates(nodes:ObjectNode[]):AvatarSpawnCandidate[]{return nodes.filter(n=>n.className==='AvatarSetPos').map(node=>{
 const ref=(name:string)=>{const f=field(node,name);return f?.kind==='reference'&&f.value!==0xffffffff?Number(f.value):null;};
 const markerId=ref('marker'),relativeMarkerId=ref('relMarker'),flags=Object.fromEntries(names.map(name=>{const f=field(node,name);return [name,f?Boolean(f.value):null];}));
 const valid=(id:number|null)=>id!==null&&nodes[id]?.className==='Marker'&&['pos','quat','scale'].every(name=>Array.isArray(field(nodes[id],name)?.value));
 const reason=markerId===null?'缺少 Marker':!valid(markerId)?'Marker 变换字段不完整':relativeMarkerId!==null&&!valid(relativeMarkerId)?'相对 Marker 变换字段不完整':Object.values(flags).some(v=>v===null)?'存在待恢复的默认字段':'';
 return {id:node.id,name:String(field(node,'name')?.value||node.name),markerId,relativeMarkerId,flags,available:!reason,reason};
});}
/** Generated names for the exact Mesh source flags used by default player
 * declarations in the supplied archive. Other compilation options are rejected. */
export function avatarPreviewMeshFile(entry:ResourceManifestEntry):string {
 const p=entry.parameters;if(entry.type!=='Mesh'||entry.unresolvedFields.length||typeof p.source!=='string'||!/^[-\w .+()]+\.fbx$/i.test(p.source))throw new Error('Avatar Mesh 资源声明未解析');
 for(const name of ['stripAnimation','computeOcclusions','computeEdges'])if(typeof p[name]!=='boolean')throw new Error(`Avatar Mesh 缺少 ${name}`);
 return p.source.replace(/\.fbx$/i,'')+(p.stripAnimation?'_StripAnim':'')+(p.computeOcclusions?'_CompOcc':'')+(p.computeEdges?'_CompEdges':'');
}
