import defaults from '../../docs/beamo-defaults.json';
import type { ObjectNode } from './objects';
import type { ResourceMesh } from './resources';
import type { LoadedLevelDataModelBake } from './level-data-bake-adapter';
import { selectOriginalBeamoBake } from './beamo-baked-runtime';
import { numericFloatBits } from './object-numeric-runtime';

export const BEAMO_BAKE_PREPARED_BASE = 0x2b0000000n;
export interface BeamoBakeInput {
 normal: boolean; found: boolean;
 mesh: { distanceBits: number; vertices: number }[];
 bake: { vertices: number; extraPresent: boolean }[];
 distanceBits: number[]; enableBits: number[];
 recordPresent?: boolean; objectAlias?: number;
}
/** Synchronous resolved-resource ABI projection. This scratch memory is not an
 * allocated native Beamo/Model. Original low-level consumers use live memory.
 * Mesh lodDistance comes from its saved v28 LOD header, not a guessed distance.
 */
export function prepareBeamoBakeInput(c: BeamoBakeInput): Uint8Array {
 if(c.mesh.length>4||c.bake.length>4)throw new Error('原 Beamo Mesh LOD 数必须小于 5');
 const b=new Uint8Array(4096).fill(0xa5),d=new DataView(b.buffer);
 const p=(at:number,to:number)=>d.setBigUint64(at,to?BEAMO_BAKE_PREPARED_BASE+BigInt(to):0n,true),u=(at:number,v:number)=>d.setUint32(at,v>>>0,true);
 p(0x110,c.normal?(c.objectAlias??0xb00):0);p(0x118,0x300);u(0x340,c.mesh.length);p(0x348,0x400);
 for(let i=0;i<4;i++){u(0x400+i*0xb8,c.mesh[i]?.distanceBits??0);u(0x434+i*0xb8,c.mesh[i]?.vertices??0);}
 u(0x81c,c.bake.length);p(0x828,0x900);
 for(let i=0;i<4;i++){u(0x900+i*24,c.bake[i]?.vertices??0);p(0x910+i*24,c.bake[i]?.extraPresent?0xe00+i*16:0);}
 const normal=c.objectAlias??0xb00;
 if(c.normal)for(let i=0;i<3;i++){u(normal+0x90+i*4,c.distanceBits[i]??0);u(normal+0xa0+i*4,c.enableBits[i]??0);}
 p(0xc00,0x100);p(0xc08,c.normal?normal:0);p(0xc40,c.recordPresent===false?0:0x800);
 return b;
}
export function evaluatePreparedBeamoBake(c: BeamoBakeInput) {
 const b=prepareBeamoBakeInput(c),d=new DataView(b.buffer),at=(a:bigint)=>Number(a-BEAMO_BAKE_PREPARED_BASE);
 const memory={bytes:(a:bigint,n:number)=>b.subarray(at(a),at(a)+n),read32:(a:bigint)=>d.getUint32(at(a),true),read64:(a:bigint)=>d.getBigUint64(at(a),true),
  write32:(a:bigint,v:number)=>d.setUint32(at(a),v>>>0,true),write64:(a:bigint,v:bigint)=>d.setBigUint64(at(a),v,true),write8:(a:bigint,v:number)=>{b[at(a)]=v&255;},string:()=>''};
 const accepted=selectOriginalBeamoBake(memory,BEAMO_BAKE_PREPARED_BASE+0x100n,c.found,c.recordPresent===false?0n:BEAMO_BAKE_PREPARED_BASE+0x800n);
 const normal=c.objectAlias??0xb00;
 return {accepted,selectedLods:d.getUint32(0x1b8,true),distanceBits:Array.from({length:3},(_,i)=>d.getUint32(normal+0x90+i*4,true)),memory:b};
}
/** Read saved/default public inputs without modifying Objects bytes. The
 * complete TGCL parser/cache/class construction remains a separate service.
 */
export function beamoBakeInput(node: ObjectNode, mesh: ResourceMesh, record: LoadedLevelDataModelBake | null): BeamoBakeInput {
 if(!['Beamo','BeamoDecal'].includes(node.className))throw new Error('此对象不是 Beamo / BeamoDecal');
 const vectorBits=(name:'lodDists'|'lodEnables')=>{
  const raw=node.fields.find(f=>f.name===name)?.raw??defaults.classes.Beamo[name].encodedHex;
  if(!/^[0-9a-f]{32}$/i.test(raw))throw new Error(`Beamo #${node.id} ${name} 原字段截断`);
  return Array.from({length:3},(_,i)=>parseInt(raw.slice(i*8,i*8+8).match(/../g)!.reverse().join(''),16));
 };
 return {normal:node.className==='Beamo',found:record!==null,recordPresent:record!==null,
  mesh:mesh.levels.map(lod=>{if(lod.lodDistance===undefined)throw new Error('缺少原 Mesh LOD 距离');return{distanceBits:numericFloatBits(lod.lodDistance),vertices:lod.positions.length/3};}),
  bake:record?.lods.map(lod=>({vertices:lod.renderVertexCount,extraPresent:lod.extra!==null}))??[],
  distanceBits:node.className==='Beamo'?vectorBits('lodDists'):[],enableBits:node.className==='Beamo'?vectorBits('lodEnables'):[]};
}
export function selectEditorBeamoBake(node: ObjectNode, mesh: ResourceMesh, record: LoadedLevelDataModelBake | null) {
 const result=evaluatePreparedBeamoBake(beamoBakeInput(node,mesh,record));
 return {accepted:result.accepted,record:result.accepted?record:null,selectedLods:result.selectedLods,distanceBits:result.distanceBits};
}
