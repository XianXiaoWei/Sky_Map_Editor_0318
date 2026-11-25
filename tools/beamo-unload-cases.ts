import {destroyOriginalBeamo,unloadOriginalBeamoBarn} from '../src/core/beamo-runtime';
export interface BeamoUnloadCase {label:string;op:number;normal:number;decal:number;loaded:number;groups:number;mode:number;flags:number;fill:number;raw:string;}
export function evaluateBeamoUnload(c:BeamoUnloadCase){
 const base=0x2d0000000n,b=Buffer.alloc(0x120000,c.fill),at=(a:bigint)=>Number(a-base),u=(a:number,v:number)=>b.writeUInt32LE(v>>>0,a),p=(a:number,v:bigint)=>b.writeBigUInt64LE(v,a);
 const m={bytes:(a:bigint,n:number)=>b.subarray(at(a),at(a)+n),read32:(a:bigint)=>b.readUInt32LE(at(a)),read64:(a:bigint)=>b.readBigUInt64LE(at(a)),write32:(a:bigint,v:number)=>u(at(a),v),write64:(a:bigint,v:bigint)=>p(at(a),v),write8:(a:bigint,v:number)=>{b[at(a)]=v&255;},string:()=>''};
 for(let i=0;i<512;i++)p(16+i*192,0x2e0000200n);for(let i=0;i<256;i++)p(0x18010+i*128,0x2e0000300n);
 u(0x20010,c.normal);u(0x20014,c.decal);u(0x20018,c.loaded);u(0x6c830,c.groups);p(0x20020,base+0x20040n);p(0xa2088,0x2e0000000n);
 for(let t=0;t<2;t++)for(let i=0;i<8;i++){const a=(t?0xb0000:0x20040)+i*384;b[a+0xbc]=c.flags&(1<<i)?(i&1?255:2):0;p(a+0xd0,0x2e0001000n+BigInt(t*0x10000+i*512));}
 const log=Buffer.alloc(1024*24);let used=0,renders=0,collisions=0,normals=0,decals=0;
 const entry=(op:number,a=0n,v=0n)=>{log.writeBigUInt64LE(BigInt(op),used*24);log.writeBigUInt64LE(a,used*24+8);log.writeBigUInt64LE(v,used++*24+16);};
 if(c.op){Buffer.from(c.raw,'base64').copy(b,16);destroyOriginalBeamo(m,base+16n,c.op===1?'Beamo':'BeamoDecal',{
  stringAllocator:()=>{entry(6);if(c.mode)p(16+0x68,0x8877665544332211n);return 0x2e0000100n;},freeString:(a,v)=>entry(7,a,v)});
 }else unloadOriginalBeamoBarn(m,base,{
  resetVertexData:a=>{entry(1,a);b[0x6c838]=0x51;if(c.mode===1){u(0x6c830,2);u(0x20018,4);u(0x20010,3);u(0x20014,2);}},
  resetRenderable:a=>{entry(2,a);b[at(a)]=0x52;if(!renders++){if(c.mode===2)u(0x6c830,1);if(c.mode===3)u(0x6c830,3);}},
  removeCollision:(a,v)=>{entry(3,a,v);if(!collisions++&&(c.mode===2||c.mode===3)){u(0x20018,c.mode===2?1:3);p(0x20020,base+0xb0000n);}},
  destroyObject:(a,v)=>{const normal=v===0x2e0000200n;entry(normal?4:5,a);b[at(a)+(normal?0x84:0x74)]=normal?0x54:0x55;if(normal){if(!normals++){if(c.mode===2)u(0x20010,1);if(c.mode===3)u(0x20010,3);}}else if(!decals++){if(c.mode===2)u(0x20014,1);if(c.mode===3)u(0x20014,3);}}
 });
 const count=Buffer.alloc(4);count.writeUInt32LE(used);
 return Buffer.concat([count,log,b.subarray(12,16),b.subarray(16,0x20010),b.subarray(0x20010,0x20030),b.subarray(0x20040,0x20c40),b.subarray(0xb0000,0xb0c00),b.subarray(0x6c830,0x6c840),...Array.from({length:16},(_,i)=>b.subarray(0x6cc70+i*0x3540,0x6cc78+i*0x3540)),b.subarray(0xa2088,0xa2090)]);
}
