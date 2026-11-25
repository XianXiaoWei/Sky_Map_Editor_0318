import fs from 'node:fs';
import path from 'node:path';
import os from 'node:os';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import assert from 'node:assert/strict';
import { MeshesDocument } from '../src/core/meshes';
import { nativeMaterialDefs, terrainSurfaces } from '../src/core/mesh-surfaces';
import evidence from '../docs/meshes-evidence.json';
const data = process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const binary = path.join(data, '../MacOS/Sky');
assert.equal(crypto.createHash('sha256').update(fs.readFileSync(binary)).digest('hex'), evidence.executableSha256);
const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'sky-meshes-')), executable = path.join(tmp, 'oracle');
function command(cmd: string, args: string[], input?: Buffer) {
  const r = spawnSync(cmd, args, { input, maxBuffer: 256 * 1024 * 1024 });
  if (r.error || r.status) throw r.error ?? new Error(`${cmd}: ${r.status} ${r.stderr}`); return r.stdout;
}
const report: any[] = [], fixture: any[] = [];
try {
  command('x86_64-linux-gnu-gcc', ['-O2', '-no-pie', 'tools/native-meshes-oracle.c', '-lm', '-o', executable]);
  for (const level of fs.readdirSync(path.join(data, 'Levels')).sort()) {
    const file = path.join(data, 'Levels', level, 'BstBaked.meshes'); if (!fs.existsSync(file)) continue;
    const doc = new MeshesDocument(fs.readFileSync(file)), defs = nativeMaterialDefs(level);
    const cases = doc.geometries.filter(g => g.kind === 'terrain').map(g => ({ id: g.id, stride: g.stride, vertices: doc.lod.subarray(g.vertexOffset, g.vertexOffset + g.vertexCount*g.stride), view: doc.geometryView(g) }));
    // Exercise slot stops, zero weights, duplicate slots and unused vertices
    // using the original per-map definitions and deliberately non-unit sums.
    let seed = 0x4d455348; const rand = () => { seed ^= seed << 13; seed ^= seed >>> 17; seed ^= seed << 5; return seed >>> 0; };
    const vertices = Buffer.alloc(72*36), indices = new Uint32Array(180);
    for (let i = 0; i < 72; i++) for (let slot = 0; slot < 4; slot++) { vertices[i*36+16+slot] = rand()%5 ? defs[rand()%30].materialId : 0; vertices[i*36+20+slot] = [0,1,127,254,255][rand()%5]; }
    for (let i = 0; i < indices.length; i++) indices[i] = rand()%70;
    const ids = new Uint8Array(72*4), weights = new Uint8Array(72*4); for (let i = 0; i < 72; i++) { ids.set(vertices.subarray(i*36+16,i*36+20),i*4); weights.set(vertices.subarray(i*36+20,i*36+24),i*4); }
    cases.push({ id: 'synthetic', stride:36, vertices, view: { vertexCount:72, indices, materialIds:ids, weights } as any });
    const input = Buffer.concat(cases.flatMap(c => { const header = Buffer.alloc(12), idx = Buffer.alloc(c.view.indices.length*2); header.writeUInt32LE(c.stride); header.writeUInt32LE(c.view.vertexCount,4); header.writeUInt32LE(c.view.indices.length,8); c.view.indices.forEach((v,i) => idx.writeUInt16LE(v,i*2)); return [header,c.vertices,idx]; }));
    const output = command('qemu-x86_64', ['-L','/usr/x86_64-linux-gnu','-cpu','max',executable,binary,level],input);
    let at=4+30*416, triangles=0, outputIndices=0;
    for (const c of cases) {
      const n=output.readUInt32LE(at); at+=4;
      const counts=Array.from({length:59},(_,i)=>output.readUInt32LE(at+i*4)); at+=59*4;
      const result=Array.from({length:n},(_,i)=>output.readUInt16LE(at+i*2)); at+=n*2;
      const plan=terrainSurfaces(c.view,defs);
      assert.deepEqual(Array.from(plan.counts),counts,`${level}/${c.id} counts`);
      assert.deepEqual(Array.from(plan.indices),result,`${level}/${c.id} order`);
      if(c.id==='synthetic' && fixture.length<2) fixture.push({level,vertexCount:c.view.vertexCount,indices:Array.from(c.view.indices),materialIds:Array.from(c.view.materialIds),weights:Array.from(c.view.weights),counts,result});
      triangles+=c.view.indices.length/3;outputIndices+=n;
    }
    assert.equal(at,output.length);assert.ok(doc.source.equals(doc.serialize()));
    report.push({level,geometries:cases.length-1,inputTriangles:triangles,realInputTriangles:triangles-60,syntheticInputTriangles:60,outputIndices,exact:true,roundtrip:true});
  }
  fs.writeFileSync('tests/fixtures/meshes-native.json',JSON.stringify(fixture)+'\n');
  fs.writeFileSync('docs/meshes-oracle.json',JSON.stringify({executableSha256:evidence.executableSha256,functions:['0x10043fb70','0x1006a7280'],scope:'Native material initialization/color conversion and scatter; scratch allocator calls redirected, Linux libc imports. Counts and complete stable indices compared; no GPU or visibility execution.',levels:report},null,2)+'\n');
  console.log(JSON.stringify({levels:report.length,geometries:report.reduce((n,r)=>n+r.geometries,0),inputTriangles:report.reduce((n,r)=>n+r.inputTriangles,0),exact:true}));
} finally { fs.rmSync(tmp,{recursive:true,force:true}); }
