import {generateOriginalFlowerVertices} from '../src/core/flower-vertices-runtime';
export function evaluateFlowerVertexCase(config:Uint8Array):Buffer{
 const input=Buffer.from(config),arena=Buffer.alloc(0x530000),base=0x470000000n,trace:Buffer[]=[];
 const offset=(p:bigint)=>Number(p-base),m={bytes:(p:bigint,n:number)=>arena.subarray(offset(p),offset(p)+n),read32:(p:bigint)=>arena.readUInt32LE(offset(p)),read64:(p:bigint)=>arena.readBigUInt64LE(offset(p)),write8:(p:bigint,n:number)=>{arena[offset(p)]=n;},write32:(p:bigint,n:number)=>{arena.writeUInt32LE(n,offset(p));},write64:(p:bigint,n:bigint)=>{arena.writeBigUInt64LE(n,offset(p));},string:()=>''};
 const record=(tag:number,...parts:Buffer[])=>{const b=Buffer.alloc(4);b.writeUInt32LE(tag);trace.push(b,...parts);},word=(n:number)=>{const b=Buffer.alloc(4);b.writeUInt32LE(n>>>0);return b;},floats=(ns:number[])=>Buffer.from(Float32Array.from(ns).buffer);
 arena.set(input.subarray(80),0xed0);arena.set(input.subarray(64,80),0x500000);arena.set(input.subarray(48,64),0x500020);
 const count=input.readUInt32LE(0),scenario=input.readUInt32LE(12),outputs=Array.from({length:count},(_,i)=>base+0x520000n+BigInt(i)*32n),success=arena.subarray(0x501000,0x501000+count);success.fill(0xbb);arena.fill(0xaa,0x520000,0x520000+count*32);
 m.write64(base+0x5101d0n,scenario===2?0n:base+0x510800n);arena[0x510808]=scenario===3?1:0;
 generateOriginalFlowerVertices(m,base,base+0x500000n,base+0x500020n,outputs,success,count,input.readUInt32LE(4),!!input.readUInt32LE(8),{
  contains:(p,region)=>{record(1,floats(p.slice(0,3)),word(Number(region-base-0xf60n)/0x110));return p[0]>=0;},
  trace:(origins,direction,distance,options)=>{record(2,word(origins.length),floats(direction.slice(0,3)),floats([distance]),Buffer.from(options.subarray(0,9)),Buffer.from(options.subarray(16,32)),...origins.map(p=>floats(p.slice(0,3))));return origins.map((_,triangle)=>({distance:input.readFloatLE(20),triangle,mesh:scenario===1?0n:base+0x510000n}));},
  material:(_mesh,triangle)=>{record(3,word(triangle));return input[16];},normal:(_mesh,triangle)=>{record(4,word(triangle));return Array.from({length:4},(_,i)=>input.readFloatLE(24+i*4));},lighting:(_mesh,triangle)=>{record(5,word(triangle));return input.subarray(40,48);},defaultUserByte:()=>77
 });
 const bytes=Buffer.concat(trace);return Buffer.concat([word(bytes.length),bytes,success,arena.subarray(0x520000,0x520000+count*32)]);
}
export function flowerVertexCases(){
 const cases:Buffer[]=[];
 for(const count of [0,1,16,64,256])for(let variant=0;variant<12;variant++){
  const b=Buffer.alloc(1168);b.writeUInt32LE(count);b.writeUInt32LE([0,5,0xfffffff0,0x7ffffff0][variant%4],4);b.writeUInt32LE(variant%2,8);b.writeUInt32LE(variant<4?variant:0,12);b[16]=variant===8?255:3;b.writeFloatLE([2,.5,4,0][variant%4],20);
  [variant===9?-1:0,variant===10?-.999:1,variant===11?1:0,0].forEach((n,i)=>b.writeFloatLE(n,24+i*4));b.set([128,255,128,0,128,128,255,255],40);
  [variant===7?-.3:0,5,variant===6?-.7:0,variant===5?0:3].forEach((n,i)=>b.writeFloatLE(n,48+i*4));b.writeFloatLE(10,64);b.set([0,1,2,3],74);b[78]=variant<6?1:4;
  for(let i=0;i<4;i++){
   const p=80+i*272;for(const [offset,ns] of [[64,[.1*i,.2,.1,0]],[80,[.8,.6,.9,0]],[96,[.2,variant===10?2:.8,.1,.6]],[112,[i+1,variant===4?.5:0]]] as [number,number[]][])ns.forEach((n,j)=>b.writeFloatLE(n,p+offset+j*4));
   b.writeUInt32LE(variant===6?1:variant===7?2:0,p+124);b.writeUInt32LE(variant%2,p+128);b[p+132]=3;
   for(let j=0;j<16;j++)b.writeFloatLE(j%5===0?1:0,p+208+j*4);
  }
  cases.push(b);
 }
 return cases;
}
