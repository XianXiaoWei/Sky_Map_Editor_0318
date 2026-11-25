import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import {spawnSync} from 'node:child_process';
import {AudioCatalog} from '../src/main/audio-assets';
import {ObjectsDocument} from '../src/core/objects';
const root=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const catalog=new AudioCatalog(root),assets=catalog.inventory();
const run=spawnSync('python3',['tools/audio-reference-decode.py',root],{maxBuffer:16*1024*1024});if(run.status!==0)throw new Error(run.stderr.toString());
let at=0;const take=(n:number)=>{if(at+n>run.stdout.length)throw new Error('Truncated audio reference');const b=run.stdout.subarray(at,at+n);at+=n;return b;},u32=()=>take(4).readUInt32LE();
const waveRows=[],fixtures:any[]=[];const count=u32();
for(let i=0;i<count;i++){
 const jsonBytes=u32(),pcmBytes=u32(),reference=JSON.parse(take(jsonBytes).toString()),native=take(pcmBytes),decoded=catalog.pcm(reference.path);
 const actual=Buffer.from(decoded.pcm.buffer,decoded.pcm.byteOffset,decoded.pcm.byteLength),compared=decoded.info.frames*decoded.info.channels*2;
 // libsndfile retains complete encoded final blocks; the WAVE fact chunk
 // gives the original audible frame count. Compare that exact prefix.
 if(reference.frames<decoded.info.frames||reference.channels!==decoded.info.channels||reference.sampleRate!==decoded.info.sampleRate)throw new Error('Independent WAV metadata mismatch');
 let failed=0;for(let j=0;j<compared;j++)if(actual[j]!==native[j])failed++;
 const original=fs.readFileSync(path.join(root,reference.path)),info=decoded.info;let chunkAt=12,fmt=Buffer.alloc(0);while(chunkAt<info.dataOffset){const size=original.readUInt32LE(chunkAt+4);if(original.toString('ascii',chunkAt,chunkAt+4)==='fmt ')fmt=Buffer.from(original.subarray(chunkAt+8,chunkAt+8+size));chunkAt+=8+size+(size&1);}
 const frames=info.samplesPerBlock!,header=Buffer.alloc(60);header.write('RIFF');header.writeUInt32LE(52+info.blockAlign,4);header.write('WAVEfmt ',8);header.writeUInt32LE(fmt.length,16);fmt.copy(header,20);header.write('fact',40);header.writeUInt32LE(4,44);header.writeUInt32LE(frames,48);header.write('data',52);header.writeUInt32LE(info.blockAlign,56);
 if(fmt.length!==20)throw new Error('Fixture requires original IMA fmt20');
 const fixture=Buffer.concat([header,original.subarray(info.dataOffset,info.dataOffset+info.blockAlign)]),pcm=native.subarray(0,frames*info.channels*2);
 fixtures.push({path:reference.path,reference:reference.reference,sourceHex:fixture.toString('hex'),frames,channels:info.channels,pcmSha256:crypto.createHash('sha256').update(pcm).digest('hex')});
 waveRows.push({path:reference.path,sha256:crypto.createHash('sha256').update(fs.readFileSync(path.join(root,reference.path))).digest('hex'),reference:reference.reference,referenceFrames:reference.frames,factFrames:decoded.info.frames,channels:decoded.info.channels,sampleRate:decoded.info.sampleRate,comparedSamples:decoded.pcm.length,failedBytes:failed,pcmSha256:crypto.createHash('sha256').update(actual).digest('hex'),passed:failed===0});
}
if(at!==run.stdout.length)throw new Error('Trailing audio reference');
const functionSpec=JSON.parse(fs.readFileSync('tools/objects-function-spec.json','utf8'));
const soundClasses=new Set(Object.entries(functionSpec.classes).filter(([,v]:any)=>v.group==='sound').map(([name])=>name));
const nodes:any[]=[],soundNames=new Map<string,{uses:string[]}>();let maps=0;
for(const level of fs.readdirSync(path.join(root,'Levels')).sort()){
 const file=path.join(root,'Levels',level,'Objects.level.bin');if(!fs.existsSync(file))continue;maps++;
 const doc=new ObjectsDocument(fs.readFileSync(file));
 for(const n of doc.nodes.filter(n=>soundClasses.has(n.className))){
  const fields=n.fields.filter(f=>f.kind==='string').map(f=>({name:f.name,value:String(f.value)}));
  const references=n.fields.flatMap(f=>[f,...(f.children??[])]).filter(f=>f.kind==='reference'&&f.value!==0xffffffff).map(f=>({field:f.name,target:`${level}:n${f.value}`,className:doc.nodes[Number(f.value)].className}));
  const key=`${level}:n${n.id}`;nodes.push({key,className:n.className,name:n.name,strings:fields,references});
  for(const f of fields.filter(f=>['sound','soundName'].includes(f.name)&&f.value)){if(!soundNames.has(f.value))soundNames.set(f.value,{uses:[]});soundNames.get(f.value)!.uses.push(key);}
 }
}
const report={passed:assets.every(a=>!a.error)&&waveRows.length===assets.filter(a=>a.kind==='wave').length&&waveRows.every(r=>r.passed),scope:'Original /Data/Audio read-only RIFF/FEV/FSB5 inventory and independent libsndfile comparison of all eight IMA WAV files, trimmed to original fact frames. Sound-related actual Objects fields/references listed by class. FSB5 names describe samples only: bank decoding, FMOD event routing, emitter/listener/mix lifecycle and playback/game integration remain pending.',summary:{assets:assets.length,waves:waveRows.length,banks:assets.filter(a=>a.kind==='bank').length,fsbContainers:assets.reduce((n,a)=>n+(a.containers?.length??0),0),bankSamples:assets.reduce((n,a)=>n+(a.containers?.reduce((n,c)=>n+c.samples,0)??0),0),comparedPcmSamples:waveRows.reduce((n,r)=>n+r.comparedSamples,0),maps,soundClasses:soundClasses.size,soundObjects:nodes.length,objectSoundNames:soundNames.size},waveRows,assets,nodes,soundNames:Array.from(soundNames,([name,v])=>({name,...v,eventResolved:false})),completeOriginalAudioRuntime:false};
fs.writeFileSync('docs/audio-runtime-inventory.json',JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/audio-wave-native.json',JSON.stringify({scope:'First original IMA blocks with independent libsndfile PCM prefix hashes and explicit fact length, full original WAV parity is in audio-runtime-inventory.json',cases:fixtures})+'\n');
console.log(JSON.stringify({passed:report.passed,summary:report.summary,waveRows}));if(!report.passed)process.exitCode=1;
