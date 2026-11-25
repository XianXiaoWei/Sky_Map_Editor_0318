import {OBB} from 'three/addons/math/OBB.js';import * as THREE from 'three';
import {originalFlowerSeeds,prepareOriginalFlowerPatchRegion,type FlowerGroundTriangle} from '../src/core/flower-distribution';
import {itemFloats} from '../src/core/item-effect-arithmetic';
export function evaluateFlowerSeedCase(config:Uint8Array){
 const input=Buffer.from(config),count=input.readUInt32LE(0),patches=Array.from({length:input[64]},(_,i)=>({nodeId:i,bytes:new Uint8Array(input.subarray(80+i*272,80+(i+1)*272))}));
 for(const p of patches)if(new DataView(p.bytes.buffer).getUint32(124,true))prepareOriginalFlowerPatchRegion(p.bytes);
 const size=input.readFloatLE(60),center=[48,52,56].map(at=>input.readFloatLE(at)),f=Math.fround,triangles:FlowerGroundTriangle[]=Array.from({length:count},(_,t)=>({vertices:Array.from({length:3},(_,v)=>[f(f(center[0]+f(t*size))+(v===2?size:0)),center[1],f(center[2]+(v===1?size:0))]),normalY:input.readUInt32LE(12)===1?-1:127,material:input[16]}));
 const result=originalFlowerSeeds(patches,[triangles],(bytes,point,half)=>{
  const matrix=itemFloats(bytes.subarray(144,208)),axes=[0,1,2].map(i=>new THREE.Vector3(...matrix.slice(i*4,i*4+3) as [number,number,number])),length=axes.map(a=>a.length());axes.forEach(a=>a.normalize());const rotation=new THREE.Matrix3().set(axes[0].x,axes[1].x,axes[2].x,axes[0].y,axes[1].y,axes[2].y,axes[0].z,axes[1].z,axes[2].z);
  return new OBB(new THREE.Vector3(...matrix.slice(12,15) as [number,number,number]),new THREE.Vector3(...length as [number,number,number]),rotation).intersectsOBB(new OBB(new THREE.Vector3(...point as [number,number,number]),new THREE.Vector3(...half as [number,number,number])));
 });
 const header=Buffer.alloc(9);header.writeUInt32LE(result.seeds.length);header.writeFloatLE(result.densityScale,4);header[8]=Number(result.seeds.some(s=>Math.trunc(Math.fround(Math.fround(s.density*result.densityScale)+1))>s.reserve));
 const spheres=Buffer.alloc(result.seeds.length*16),clusters=Buffer.alloc(result.seeds.length*16);
 result.seeds.forEach((s,i)=>{s.sphere.forEach((v,j)=>spheres.writeFloatLE(v,i*16+j*4));clusters.writeFloatLE(s.density,i*16);clusters.writeUInt16LE(s.reserve,i*16+8);clusters.set(s.patches,i*16+10);clusters[i*16+14]=s.patches.length;});
 return Buffer.concat([header,spheres,clusters,...patches.map(p=>Buffer.from(p.bytes.subarray(144,272)))]);
}
export function flowerSeedCases(){
 const cases:Buffer[]=[];
 for(const count of [0,1,4,16])for(let variant=0;variant<16;variant++){
  const b=Buffer.alloc(1168);b.writeUInt32LE(count);b.writeUInt32LE(variant===1?1:0,12);b[16]=variant===2?4:3;[variant===3?-2:0,variant===4?-1:5,0,[.5,1,2,4][variant%4]].forEach((n,i)=>b.writeFloatLE(n,48+i*4));b[64]=variant<8?1:4;
  for(let i=0;i<4;i++){
   const p=80+i*272;b[p+120]=1;b[p+132]=3;b.writeUInt32LE(variant%3,p+124);[variant===7?8:0,5,0,0].forEach((n,j)=>b.writeFloatLE(n,p+16+j*4));b.writeFloatLE(1,p+44);[variant>=12?32:8,8,8,0].forEach((n,j)=>b.writeFloatLE(n,p+48+j*4));b.writeFloatLE(i+1,p+112);b.writeFloatLE(variant===6?.5:0,p+116);
  }
  cases.push(b);
 }
 return cases;
}
