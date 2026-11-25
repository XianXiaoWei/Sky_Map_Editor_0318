import fs from 'node:fs';
import path from 'node:path';
import {assetPath} from '../core/storage';
import {readWaveInfo,decodeWave,type WaveInfo} from '../core/audio-wave';

export interface FsbContainer {offset:number;version:number;samples:number;sampleHeadersBytes:number;namesBytes:number;dataBytes:number;codec:number;codecName:string;sampleNames:string[];}
export interface AudioAsset {path:string;bytes:number;kind:'wave'|'bank';playable:boolean;wave?:WaveInfo;containers?:FsbContainer[];error?:string;}
/** Read only outer bank chunks and the explicitly aligned SND payload header.
 * FSB magic inside compressed sample bytes is never treated as another bank. */
export function inspectAudioBank(file:string):FsbContainer[]{
 const fd=fs.openSync(file,'r');try{
  const size=fs.fstatSync(fd).size,read=(at:number,n:number)=>{if(at<0||n<0||at+n>size||n>4*1024*1024)throw new Error('音频 bank 字节范围无效');const b=Buffer.alloc(n);if(fs.readSync(fd,b,0,n,at)!==n)throw new Error('音频 bank 截断');return b;};
  const header=read(0,12);if(header.toString('ascii',0,4)!=='RIFF'||header.toString('ascii',8,12)!=='FEV '||header.readUInt32LE(4)+8!==size)throw new Error('FMOD bank RIFF 无效');
  const containers:FsbContainer[]=[];let at=12;
  while(at<size){const chunk=read(at,8),length=chunk.readUInt32LE(4),data=at+8,end=data+length;if(end>size)throw new Error('FMOD bank chunk 越界');
   if(chunk.toString('ascii',0,4)==='SND '){
    const offset=Math.ceil(data/32)*32,h=read(offset,60);if(offset+60>end||h.toString('ascii',0,4)!=='FSB5')throw new Error('FMOD SND 缺少对齐 FSB5');
    const [version,samples,sampleHeadersBytes,namesBytes,dataBytes,codec]=Array.from({length:6},(_,i)=>h.readUInt32LE(4+i*4));
    if(version!==1||samples>100000||sampleHeadersBytes<samples*8||offset+60+sampleHeadersBytes+namesBytes+dataBytes>end||namesBytes&&namesBytes<samples*4)throw new Error('FSB5 布局或样本范围无效');
    const names=read(offset+60+sampleHeadersBytes,namesBytes),sampleNames:string[]=[];
    if(namesBytes)for(let i=0;i<samples;i++){const p=names.readUInt32LE(i*4),stop=names.indexOf(0,p);if(p<samples*4||p>=names.length||stop<0)throw new Error('FSB5 名称表无效');sampleNames.push(names.toString('utf8',p,stop));}
    containers.push({offset,version,samples,sampleHeadersBytes,namesBytes,dataBytes,codec,codecName:codec===15?'Vorbis':codec===16?'FMOD ADPCM':`FSB 编码 ${codec}`,sampleNames});
   }
   at=end+(length&1);
  }
  if(at!==size)throw new Error('FMOD bank 尾部范围无效');return containers;
 }finally{fs.closeSync(fd);}
}

export class AudioCatalog {
 private assets:AudioAsset[]|undefined;
 constructor(private readonly root:string){}
 inventory():AudioAsset[]{
  if(this.assets)return structuredClone(this.assets);
  if(!fs.existsSync(path.join(this.root,'Audio')))return [];
  const assets:AudioAsset[]=[],scan=(relative:string)=>{const directory=assetPath(this.root,relative);for(const entry of fs.readdirSync(directory,{withFileTypes:true}).sort((a,b)=>a.name.localeCompare(b.name))){const next=relative+'/'+entry.name;if(entry.isDirectory())scan(next);else if(entry.isFile()&&/\.(wav|bank)$/i.test(entry.name)){const file=assetPath(this.root,next),kind=entry.name.toLowerCase().endsWith('.wav')?'wave':'bank';const asset:AudioAsset={path:next,bytes:fs.statSync(file).size,kind,playable:false};try{if(kind==='wave'){asset.wave=readWaveInfo(fs.readFileSync(file));asset.playable=true;}else asset.containers=inspectAudioBank(file);}catch(error){asset.error=String((error as Error).message);}assets.push(asset);}}};
  scan('Audio');this.assets=assets;return structuredClone(assets);
 }
 pcm(relative:string){
  const asset=this.inventory().find(a=>a.path===relative);if(!asset||!asset.playable||asset.kind!=='wave')throw new Error('请选择已登记的可播放原 WAV');
  const decoded=decodeWave(fs.readFileSync(assetPath(this.root,relative)));return {path:relative,...decoded};
 }
}
