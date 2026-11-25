import {uploadOriginalBeamoLod,generateOriginalBeamoNormals,updateOriginalBeamoWeights,distanceOriginalBeamoObb} from './beamo-geometry-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
export const BEAMO_GEOMETRY_BASE=0x330000000n;
// Separate input, volume Barn, output and scratch windows accommodate all
// original v28 meshes (largest vertex stream is 2,929,776 bytes).
export const BEAMO_GEOMETRY_LAYOUT={inputLimit:0x790000,volumeVtable:0x7b0000,volumeBarn:0x800000,vertices:0xa00000,indices:0xe00000,scratch:0x1000000,bytes:0x2000000} as const;
export interface BeamoGeometryResource {positions:string;uvs:string;indices:string;remap:string;groups:number;lod:number;}
export interface BeamoGeometryInput {label:string;resourceKey:string;matrix:string;secondary:boolean;autoMoss:number;bake:boolean;lighting?:string;culled?:string|null;vertexOffset?:number;indexOffsets?:number[];volumes?:{match:boolean;matrix:string;obb:string}[];}
// This is a resolved-resource ABI projection and scratch heap service. It does
// not allocate a native Model or establish original ResourceRef/Barn lifetime.
let storage:Uint8Array|undefined;
const decode=(s:string)=>Uint8Array.from(atob(s),c=>c.charCodeAt(0));
const encode=(b:Uint8Array)=>{let s='';for(let i=0;i<b.length;i+=16384)s+=String.fromCharCode(...b.subarray(i,i+16384));return btoa(s);};
export function prepareBeamoGeometryInput(input:BeamoGeometryInput,resource:BeamoGeometryResource){
 const positions=decode(resource.positions),uvs=decode(resource.uvs),indices=decode(resource.indices),remap=decode(resource.remap),count=positions.length/16;
 if(!Number.isInteger(count)||uvs.length!==count*16||remap.length!==count*4||indices.length%12)throw new Error('Beamo 原几何流长度无效');
 const data=storage??=new Uint8Array(0x2000000),d=new DataView(data.buffer),base=BEAMO_GEOMETRY_BASE,at=(a:bigint)=>Number(a-base);
 const m={bytes:(a:bigint,n:number)=>data.subarray(at(a),at(a)+n),read32:(a:bigint)=>d.getUint32(at(a),true),read64:(a:bigint)=>d.getBigUint64(at(a),true),write32:(a:bigint,v:number)=>d.setUint32(at(a),v>>>0,true),write64:(a:bigint,v:bigint)=>d.setBigUint64(at(a),v,true),write8:(a:bigint,v:number)=>{data[at(a)]=v&255;},string:()=>''};
 const ptr=(at:number,to:number)=>d.setBigUint64(at,to?base+BigInt(to):0n,true),u=(at:number,n:number)=>d.setUint32(at,n>>>0,true),align=(n:number)=>(n+15)&~15;
 let cursor=0x1000;data.fill(0xa5,0,0x1000);const append=(b:Uint8Array)=>{const at=cursor;data.set(b,at);cursor=align(at+b.length);data.fill(0xa5,at+b.length,cursor);return at;};
 const p=append(positions),uv=append(uvs),ix=append(indices),rm=append(remap),lod=0x400+resource.lod*0xb8;
 ptr(0x118,0x300);ptr(0x348,0x400);u(lod+0x34,count);u(lod+0x38,indices.length/4);u(lod+0x40,resource.groups);ptr(lod+0x60,p);ptr(lod+0x70,uv);ptr(lod+0x80,ix);ptr(lod+0x98,rm);
 const matrix=decode(input.matrix);if(matrix.length!==64)throw new Error('Beamo 原矩阵长度无效');data.set(matrix,0x130);ptr(0x1e0,input.secondary?0xb00:0);data[0x1f4]=input.autoMoss;
 ptr(0x828,0x900);const loaded=0x900+resource.lod*24;
 ptr(loaded+8,input.lighting?append(decode(input.lighting)):0);ptr(loaded+16,input.culled===null||input.culled===undefined?0:append(decode(input.culled)));
 const indexOffsets=input.indexOffsets??[0,indices.length/4,indices.length/2],vo=input.vertexOffset??0;u(0xa00,vo);indexOffsets.forEach((n,i)=>u(0xa04+i*4,n));
 const vertexBytes=(vo+count)*48,indexBytes=(Math.max(...indexOffsets)+indices.length/4)*4;
 if(cursor>BEAMO_GEOMETRY_LAYOUT.inputLimit||vertexBytes+16>BEAMO_GEOMETRY_LAYOUT.indices-BEAMO_GEOMETRY_LAYOUT.vertices||indexBytes+16>BEAMO_GEOMETRY_LAYOUT.scratch-BEAMO_GEOMETRY_LAYOUT.indices)throw new Error('Beamo 准备几何超过独立 ABI 窗口');
 data.fill(0xa5,BEAMO_GEOMETRY_LAYOUT.vertices,BEAMO_GEOMETRY_LAYOUT.vertices+vertexBytes+16);data.fill(0xa5,BEAMO_GEOMETRY_LAYOUT.indices,BEAMO_GEOMETRY_LAYOUT.indices+indexBytes+16);data.fill(0xa5,BEAMO_GEOMETRY_LAYOUT.volumeBarn,BEAMO_GEOMETRY_LAYOUT.volumeBarn+0x20000);u(BEAMO_GEOMETRY_LAYOUT.volumeBarn+0x185110,input.volumes?.length??0);
 for(const [i,v] of (input.volumes??[]).entries()){const at=BEAMO_GEOMETRY_LAYOUT.volumeBarn+16+i*0xa60;ptr(at,BEAMO_GEOMETRY_LAYOUT.volumeVtable);data[at+0x100]=Number(v.match);data.set(decode(v.matrix),at+0x110);data.set(decode(v.obb),at+0x150);}
 return{data,m,prefixBytes:cursor,vertexBytes,indexBytes,count,groups:resource.groups,input,resource,encode};
}
export interface BeamoGeometryEvaluation {snapshot:Uint8Array;rsqrtPairs:Uint32Array;counts:{vertices:number;primaryIndices:number;secondaryIndices:number;alphaIndices:number};line:number;vertices:Uint8Array;indices:Uint8Array;}
export function evaluatePreparedBeamoGeometry(prepared:ReturnType<typeof prepareBeamoGeometryInput>,fallback:Uint8Array,rsqrt:(inputBits:number)=>number,captureDiagnostics=true):BeamoGeometryEvaluation{
 const {m,data,input,resource}=prepared,base=BEAMO_GEOMETRY_BASE,allocations:{address:bigint;bytes:bigint;tag:bigint;alignment:number}[]=[],frees:bigint[]=[],pairs:number[]=[];let cursor:number=BEAMO_GEOMETRY_LAYOUT.scratch;
 const scratch={allocator:()=>0x340000000n,tag:()=>0x340000100n,allocate:(_allocator:bigint,bytes:bigint,tag:bigint,alignment:number)=>{cursor=(cursor+alignment-1)&~(alignment-1);const address=base+BigInt(cursor);data.fill(0xa5,cursor,cursor+Number(bytes)+16);cursor+=Number(bytes)+16;if(cursor>data.length)throw new Error('Beamo scratch allocation exceeds ABI window');allocations.push({address,bytes,tag,alignment});return address;},free:(_allocator:bigint,address:bigint)=>{frees.push(address);}};
 let line=0,severity=0,counts={vertices:0,primaryIndices:0,secondaryIndices:0,alphaIndices:0};
 try{counts=uploadOriginalBeamoLod(m,base+0x100n,input.bake?base+0x800n:0n,base+BigInt(BEAMO_GEOMETRY_LAYOUT.volumeBarn),resource.lod,base+0xa00n,base+BigInt(BEAMO_GEOMETRY_LAYOUT.vertices),base+BigInt(BEAMO_GEOMETRY_LAYOUT.indices),{...scratch,fallbackLighting:()=>fallback,
  generateNormals:(out,pos,lod)=>generateOriginalBeamoNormals(m,out,pos,lod,{...scratch,rsqrt:bits=>{const out=rsqrt(bits);if(captureDiagnostics)pairs.push(bits,out);return out;}}),
  updateWeights:(count,ns,ps,barn,ws,moss)=>updateOriginalBeamoWeights(m,count,ns,ps,barn,ws,moss,{...scratch,meshName:o=>m.bytes(o+0x100n,1)[0]?'UnitCube':'other',transform:o=>Uint8Array.from(m.bytes(o+0x110n,64)),localObb:o=>Uint8Array.from(m.bytes(o+0x150n,64)),distanceToObb:distanceOriginalBeamoObb})});
 }catch(e){if(!(e instanceof Error)||!('line'in e)||!('severity'in e))throw e;line=Number(e.line);severity=Number(e.severity);}
 if(!captureDiagnostics)return{snapshot:new Uint8Array(),rsqrtPairs:new Uint32Array(),counts,line,vertices:Uint8Array.from(m.bytes(base+BigInt(BEAMO_GEOMETRY_LAYOUT.vertices),prepared.vertexBytes)),indices:Uint8Array.from(m.bytes(base+BigInt(BEAMO_GEOMETRY_LAYOUT.indices),prepared.indexBytes))};
 const header=new Uint8Array(36+512+128),h=new DataView(header.buffer);[line,severity,allocations.length,frees.length,counts.vertices,counts.primaryIndices,counts.secondaryIndices,counts.alphaIndices,pairs.length/2].forEach((v,i)=>h.setUint32(i*4,v,true));
 allocations.forEach((a,i)=>[a.address,a.bytes,a.tag,BigInt(a.alignment)].forEach((v,j)=>h.setBigUint64(36+i*32+j*8,v,true)));frees.forEach((v,i)=>h.setBigUint64(548+i*8,v,true));
 const traces=new Uint8Array(pairs.length*4),t=new DataView(traces.buffer);pairs.forEach((v,i)=>t.setUint32(i*4,v>>>0,true));
 const pieces=[header,traces,m.bytes(base+BigInt(BEAMO_GEOMETRY_LAYOUT.vertices),prepared.vertexBytes+16),m.bytes(base+BigInt(BEAMO_GEOMETRY_LAYOUT.indices),prepared.indexBytes+16),m.bytes(base+0xa00n,16),...allocations.map(a=>m.bytes(a.address,Number(a.bytes)+16))];
 const snapshot=new Uint8Array(pieces.reduce((n,p)=>n+p.length,0));let at=0;for(const p of pieces){snapshot.set(p,at);at+=p.length;}
 return{snapshot,rsqrtPairs:Uint32Array.from(pairs),counts,line,vertices:Uint8Array.from(m.bytes(base+BigInt(BEAMO_GEOMETRY_LAYOUT.vertices),prepared.vertexBytes)),indices:Uint8Array.from(m.bytes(base+BigInt(BEAMO_GEOMETRY_LAYOUT.indices),prepared.indexBytes))};
}
/** Editor arithmetic capability. It is checked separately against every
 * native RSQRTSS input/output pair; it does not claim Intel/Mac CPU parity. */
export const beamoJsRsqrt=(input:number)=>bits(finiteRsqrt(value(input)));
const finiteRsqrt=(input:number)=>Math.fround(1/Math.sqrt(input));
