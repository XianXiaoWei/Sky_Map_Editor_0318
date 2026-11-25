import {uploadOriginalBeamoBarn} from '../src/core/beamo-upload-barn-runtime';
export const BEAMO_BARN_UPLOAD_BASE=0x350000000n,BEAMO_BARN_UPLOAD_BYTES=0x300000;
export interface BeamoBarnUploadRecord {sphereBits:number[];lods:{vertices:number;indices:number;counts:number[]}[];baked:boolean;}
export interface BeamoBarnUploadCase {label:string;records:BeamoBarnUploadRecord[];initialCount?:number;initialLodCount?:number;countAfterFirst?:number;lodCountAfterFirst?:number;swapTable?:boolean;mutateOffsets?:boolean;}
export function prepareBeamoBarnUpload(c:BeamoBarnUploadCase){
 const b=Buffer.alloc(BEAMO_BARN_UPLOAD_BYTES,0xa5),base=BEAMO_BARN_UPLOAD_BASE,at=(a:bigint)=>Number(a-base);
 const m={bytes:(a:bigint,n:number)=>b.subarray(at(a),at(a)+n),read32:(a:bigint)=>b.readUInt32LE(at(a)),read64:(a:bigint)=>b.readBigUInt64LE(at(a)),write32:(a:bigint,v:number)=>b.writeUInt32LE(v>>>0,at(a)),write64:(a:bigint,v:bigint)=>b.writeBigUInt64LE(v,at(a)),write8:(a:bigint,v:number)=>{b[at(a)]=v&255;},string:()=>''};
 const u=(offset:number,value:number)=>b.writeUInt32LE(value>>>0,offset),p=(offset:number,target:number)=>b.writeBigUInt64LE(base+BigInt(target),offset);
 u(0x20018,c.initialCount??c.records.length);p(0x20020,0x20030);
 c.records.forEach((r,i)=>{
  const mesh=0x180000+i*0x400,lods=mesh+0x80;u(mesh+0x40,i===0?c.initialLodCount??r.lods.length:r.lods.length);p(mesh+0x48,lods);
  for(const table of [0x20030,0x100000]){const rec=table+i*384;p(rec+0x18,mesh);b.writeBigUInt64LE(r.baked?base+0x280000n+BigInt(i*64):0n,rec+0x20);r.sphereBits.forEach((n,j)=>u(rec+0xa0+j*4,n));u(rec+0xb0,r.sphereBits[3]);}
  r.lods.forEach((l,j)=>{u(lods+j*0xb8+0x34,l.vertices);u(lods+j*0xb8+0x38,l.indices);l.counts.forEach((n,k)=>u(mesh+0x360+j*16+k*4,n));});
 });
 p(0x2e0010,0);p(0x2e0510,0x290000);
 u(0x2e0600,c.countAfterFirst??0xffffffff);u(0x2e0604,c.lodCountAfterFirst??0xffffffff);u(0x2e0608,Number(!!c.swapTable));u(0x2e060c,Number(!!c.mutateOffsets));
 return{b,m,base};
}
export function evaluateBeamoBarnUpload(c:BeamoBarnUploadCase){
 const {b,m,base}=prepareBeamoBarnUpload(c),calls:bigint[][]=[];let uploads=0;
 const call=(kind:number,values:(number|bigint)[])=>calls.push([BigInt(kind),...values.map(BigInt)]);
 uploadOriginalBeamoBarn(m,base,base+0x2e0000n,base+0x290000n,{
  createVertexData:(a,name,n)=>{if(name!=='Beamos')throw new Error('Unexpected original stream name');call(1,[a,n]);},
  configureStream:(a,slot,formats,attributes,count,usage,extra,pointer)=>call(2,[a,slot,count,usage,extra,pointer,...formats,...attributes]),
  configureIndices:(a,slot,format,usage,count,extra)=>call(3,[a,slot,format,usage,count,extra]),
  mapBuffer:a=>{const p=a===base+0x6c980n?base+0x2a0000n:base+0x2b0000n;call(4,[a,p]);return p;},
  upload:(record,bake,volume,lod,offsets,vertices,indices)=>{
   const initial=[0,1,2,3].map(i=>m.read32(offsets+BigInt(i*4)));call(5,[record,bake,volume,lod,offsets,vertices,indices,...initial]);
   const mesh=m.read64(record+0x18n),output=[0,1,2,3].map(i=>m.read32(mesh+0x360n+BigInt(lod*16+i*4)));
   if(c.mutateOffsets)for(let i=0;i<4;i++)m.write32(offsets+BigInt(i*4),0x11111111+i);
   if(uploads++===0){if(c.countAfterFirst!==undefined)m.write32(base+0x20018n,c.countAfterFirst);if(c.lodCountAfterFirst!==undefined)m.write32(mesh+0x40n,c.lodCountAfterFirst);if(c.swapTable)m.write64(base+0x20020n,base+0x100000n);}
   return{vertices:output[0],primaryIndices:output[1],secondaryIndices:output[2],alphaIndices:output[3]};
  },
  unmapBuffer:a=>call(6,[a]),finishVertexData:a=>call(7,[a])
 });
 const trace=Buffer.alloc(4+calls.length*192);trace.writeUInt32LE(calls.length);calls.forEach((c,i)=>c.forEach((n,j)=>trace.writeBigUInt64LE(BigInt.asUintN(64,n),4+i*192+j*8)));
 return Buffer.concat([trace,b.subarray(0,0x2e0000),b.subarray(0x2e0040,0x2e0050),b.subarray(0x2e0600,0x2e0610)]);
}
