import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import { ObjectsDocument } from '../src/core/objects';
import { constructNativeMarker } from '../src/core/marker-runtime';
import { getNativeMarkerTransform, nativeIdentityMatrix } from '../src/core/marker-transform-runtime';
export interface MarkerTransformCase { name: string; op: number; flags: number; count: number; alias: number; marker: string; matrix: string; local: string; source?: {level: string; node: number; sha256: string}; }
export const matrixBytes = (values: number[]) => { const b = Buffer.alloc(64); values.forEach((n, i) => b.writeFloatLE(n, i * 4)); return b; };
export function markerBytes(pos = [3, -4, 5, 17], quat = [0, 0, 0, 1], scale = [2, 3, 4, 19]): Buffer {
 const b = Buffer.alloc(80, 0xa5); constructNativeMarker(b, 12);
 [pos, quat, scale].forEach((ns, i) => ns.forEach((n, j) => b.writeFloatLE(n, 16 + i * 16 + j * 4))); b[64] = 2; b.writeUInt32LE(0, 68); return b;
}
export function markerTransformCases(): MarkerTransformCase[] {
 const cases: MarkerTransformCase[] = [];
 const put = (name: string, op: number, marker = markerBytes(), matrix: Uint8Array = nativeIdentityMatrix(), flags = 0, count = 0, alias = 0, local: Uint8Array = nativeIdentityMatrix(), source?: MarkerTransformCase['source']) => cases.push({name, op, flags, count, alias, marker: marker.toString('hex'), matrix: Buffer.from(matrix).toString('hex'), local: Buffer.from(local).toString('hex'), source});
 const quats = [[0,0,0,1],[1,0,0,0],[0,1,0,0],[0,0,1,0],[1,2,3,4],[0,0,0,0],[0.2,-0.4,0.8,-0.3],[-0,0,-0,1]];
 for (const [i, q] of quats.entries()) for (const [j, scale] of [[2,3,4,19],[-2,3,-4,19],[0,0,0,19],[1e-6,1e-5,1.1e-5,19],[-0,0,-0,19]].entries()) {
  const marker = markerBytes([3,-4,5,-0],q,scale), matrix = getNativeMarkerTransform(marker);
  put(`get-quat-${i}-scale-${j}`,0,marker); put(`set-quat-${i}-scale-${j}`,1,marker,matrix);
 }
 const matrices: number[][] = [Array(16).fill(0),[1,0,0,7, 1,1,0,8, 0,1,1,9, 3,-4,5,11],[-1,0,0,0, 0,-1,0,0, 0,0,-1,0, 0,0,0,1],[0,1,0,0,1,0,0,0,0,0,1,0,0,0,0,1]];
 for (const n of [0,1e-6,Math.fround(1e-5),1.0000001e-5,1e-4,1e-20,1e10]) matrices.push([n,0,0,-0,0,n,0,0,0,0,n,-0,-1,2,-3,13]);
 let seed = 0x318ca21;
 const random = () => { seed = (Math.imul(seed,1664525)+1013904223)>>>0; return Math.fround((seed/0x100000000-0.5)*16); };
 for (let i=0;i<256;i++) matrices.push(Array.from({length:16},random));
 matrices.forEach((ns,i)=>{ const m=matrixBytes(ns); put(`set-matrix-${i}`,1,markerBytes(),m); if(i<40)put(`factory-lifecycle-${i}`,3,markerBytes(),m); });
 for (const flags of [0,1,2,4,8,16,32,64]) put(`factory-flags-${flags}`,2,markerBytes(),matrixBytes(matrices[1]),flags);
 for (let i=0;i<16;i++) for (const bits of [0x7fc12345,0x7fa00001,0xffcabcde]) {
  const m=Buffer.from(nativeIdentityMatrix());m.writeUInt32LE(bits,i*4); put(`nan-lane-${i}-${bits.toString(16)}`,1,markerBytes(),m); if(i%4===3)put(`factory-nan-lane-${i}-${bits.toString(16)}`,2,markerBytes(),m);
 }
 for (const count of [0,2,3]) put(`set-wrapper-count-${count}`,4,markerBytes(),nativeIdentityMatrix(),0,count);
 for (const count of [1,2,3]) put(`get-wrapper-count-${count}`,5,markerBytes(),nativeIdentityMatrix(),0,count);
 put('set-wrapper-adjustment',4,markerBytes(),matrixBytes(matrices[1]),0,1,16);
 put('get-wrapper-adjustment',5,markerBytes(),nativeIdentityMatrix(),0,0,16);
 put('get-wrapper-virtual',5,markerBytes());
 for (const alias of [0,16]) {put(`set-alias-${alias}`,6,markerBytes(),nativeIdentityMatrix(),0,0,alias);put(`get-alias-${alias}`,7,markerBytes(),nativeIdentityMatrix(),0,0,alias);}
 for (let i=0;i<80;i++) for(const alias of [0,1,2])put(`obb-multiply-${i}-alias-${alias}`,8,markerBytes(),matrixBytes(Array.from({length:16},random)),0,0,alias,matrixBytes(Array.from({length:16},random)));
 const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus';
 for(const level of fs.readdirSync(path.join(data,'Levels')).sort()) {
  const filename=path.join(data,'Levels',level,'Objects.level.bin');if(!fs.existsSync(filename))continue;
  const bytes=fs.readFileSync(filename),doc=new ObjectsDocument(bytes),sha256=crypto.createHash('sha256').update(bytes).digest('hex');
  for(const node of doc.nodes.filter(n=>n.className==='Marker')) {
   const b=Buffer.alloc(80);constructNativeMarker(b,12);b[64]=1;
   for(const [name,offset] of [['pos',16],['quat',32],['scale',48],['enabled',64]] as const) {
    const f=node.fields.find(f=>f.name===name);if(!f){if(name!=='enabled')throw new Error(`Missing Marker ${name}`);continue;} const raw=Buffer.from(f.raw,'hex');if(raw.length>(name==='enabled'?1:16))throw new Error('Unexpected Marker vector layout');raw.copy(b,offset);
   }
   const source={level,node:node.id,sha256}; put(`corpus-get-${level}-${node.id}`,0,b,nativeIdentityMatrix(),0,0,0,nativeIdentityMatrix(),source);
   put(`corpus-set-${level}-${node.id}`,1,b,getNativeMarkerTransform(b),0,0,0,nativeIdentityMatrix(),source);
  }
 }
 return cases;
}
export function markerTransformInput(c: MarkerTransformCase): Buffer {
 const h=Buffer.alloc(16);[c.op,c.flags,c.count,c.alias].forEach((n,i)=>h.writeUInt32LE(n,i*4));return Buffer.concat([h,Buffer.from(c.marker,'hex'),Buffer.from(c.matrix,'hex'),Buffer.from(c.local,'hex')]);
}
