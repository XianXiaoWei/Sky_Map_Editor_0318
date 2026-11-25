import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import path from 'node:path';import os from 'node:os';import crypto from 'node:crypto';
import {decodeWave,readWaveInfo} from '../src/core/audio-wave';import {inspectAudioBank} from '../src/main/audio-assets';
const fixture=JSON.parse(fs.readFileSync('tests/fixtures/audio-wave-native.json','utf8'));
test('All eight original IMA first-block fixtures match independent libsndfile PCM16 hashes and original fact frame counts',()=>{for(const c of fixture.cases){const {info,pcm}=decodeWave(Buffer.from(c.sourceHex,'hex'));assert.equal(info.frames,c.frames);assert.equal(info.channels,c.channels);assert.equal(crypto.createHash('sha256').update(Buffer.from(pcm.buffer)).digest('hex'),c.pcmSha256,c.path);}});
test('WAVE reader rejects truncated chunks, unbounded codec extensions, invalid IMA header/index and wrong fact lengths',()=>{
 const source=Buffer.from(fixture.cases[0].sourceHex,'hex');assert.throws(()=>readWaveInfo(source.subarray(0,source.length-1)),/RIFF/);
 const extension=Buffer.from(source);extension.writeUInt16LE(100,36);assert.throws(()=>readWaveInfo(extension),/块配置/);
 const fact=Buffer.from(source);fact.writeUInt32LE(999999,48);assert.throws(()=>readWaveInfo(fact),/fact/);
 for(const [offset,value] of [[62,89],[63,1]]){const malformed=Buffer.from(source);malformed[offset]=value;assert.throws(()=>decodeWave(malformed),/通道头/);}
});
test('FEV bank parser uses aligned outer SND chunks and ignores fake FSB magic in compressed payload',()=>{
 const temporary=fs.mkdtempSync(path.join(os.tmpdir(),'sky-bank-test-'));
 try{const b=Buffer.alloc(160);b.write('RIFF');b.writeUInt32LE(152,4);b.write('FEV SND ',8);b.writeUInt32LE(140,16);b.write('FSB5',32);b.writeUInt32LE(1,36);b.writeUInt32LE(1,40);b.writeUInt32LE(8,44);b.writeUInt32LE(11,48);b.writeUInt32LE(32,52);b.writeUInt32LE(16,56);b.writeUInt32LE(4,100);b.write('sample',104);b.write('FSB5',115);
 const file=path.join(temporary,'original.bank');fs.writeFileSync(file,b);const containers=inspectAudioBank(file);assert.equal(containers.length,1);assert.deepEqual(containers[0].sampleNames,['sample']);assert.equal(containers[0].codec,16);
 b.writeUInt32LE(0xffffffff,100);fs.writeFileSync(file,b);assert.throws(()=>inspectAudioBank(file),/名称表/);
 }finally{fs.rmSync(temporary,{recursive:true,force:true});}
});
