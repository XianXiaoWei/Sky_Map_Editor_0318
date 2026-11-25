import {Reader} from './binary';

export interface WaveInfo {format:number;codec:string;channels:number;sampleRate:number;byteRate:number;blockAlign:number;bitsPerSample:number;samplesPerBlock:number|null;frames:number;duration:number;dataOffset:number;dataBytes:number;}
const indexDelta=[-1,-1,-1,-1,2,4,6,8];
const steps=[7,8,9,10,11,12,13,14,16,17,19,21,23,25,28,31,34,37,41,45,50,55,60,66,73,80,88,97,107,118,130,143,157,173,190,209,230,253,279,307,337,371,408,449,494,544,598,658,724,796,876,963,1060,1166,1282,1411,1552,1707,1878,2066,2272,2499,2749,3024,3327,3660,4026,4428,4871,5358,5894,6484,7132,7845,8630,9493,10442,11487,12635,13899,15289,16818,18500,20350,22385,24623,27086,29794,32767];

/** RIFF WAVE structure only. Declared ADPCM fact length is retained rather
 * than guessing the final padded block's audible length. */
export function readWaveInfo(source:Buffer):WaveInfo {
 if(source.length<12||source.toString('ascii',0,4)!=='RIFF'||source.toString('ascii',8,12)!=='WAVE'||source.readUInt32LE(4)+8!==source.length)throw new Error('WAV RIFF 长度或格式无效');
 let fmt:Buffer|undefined,fact:number|undefined,dataOffset=-1,dataBytes=0;const r=new Reader(source,'WAVE');r.p=12;
 while(r.p<source.length){const tag=r.take(4).toString('ascii'),size=r.u32(),at=r.p,b=r.take(size);if(tag==='fmt '){if(fmt)throw new Error('重复 WAV fmt');fmt=b;}if(tag==='fact'){if(size<4||fact!==undefined)throw new Error('WAV fact 无效');fact=b.readUInt32LE();}if(tag==='data'){if(dataOffset>=0)throw new Error('重复 WAV data');dataOffset=at;dataBytes=size;}if(size&1)r.take(1);}
 if(!fmt||fmt.length<16||dataOffset<0)throw new Error('WAV 缺少 fmt/data');
 const format=fmt.readUInt16LE(0),channels=fmt.readUInt16LE(2),sampleRate=fmt.readUInt32LE(4),byteRate=fmt.readUInt32LE(8),blockAlign=fmt.readUInt16LE(12),bitsPerSample=fmt.readUInt16LE(14);
 if(channels<1||channels>2||sampleRate<1||sampleRate>384000||!blockAlign)throw new Error('WAV 通道或采样配置无效');
 let samplesPerBlock:number|null=null,frames:number,codec:string;
 if(format===0x11){
  if(fmt.length<20||fmt.readUInt16LE(16)<2||18+fmt.readUInt16LE(16)>fmt.length||bitsPerSample!==4||blockAlign<channels*4||(blockAlign-channels*4)%(channels*4))throw new Error('IMA ADPCM 块配置无效');
  samplesPerBlock=fmt.readUInt16LE(18);const expected=(blockAlign-channels*4)*2/channels+1;
  if(samplesPerBlock!==expected||dataBytes%blockAlign||fact===undefined||fact>dataBytes/blockAlign*samplesPerBlock)throw new Error('IMA ADPCM 样本或 fact 长度无效');
  frames=fact;codec='IMA ADPCM';
 }else if(format===1&&bitsPerSample===16){if(blockAlign!==channels*2||dataBytes%blockAlign)throw new Error('PCM16 块配置无效');frames=dataBytes/blockAlign;codec='PCM16';}
 else throw new Error(`尚未接入的 WAV 编码 ${format}/${bitsPerSample}`);
 if(frames*channels>64000000)throw new Error('WAV 解码容量超限');
 return {format,codec,channels,sampleRate,byteRate,blockAlign,bitsPerSample,samplesPerBlock,frames,duration:frames/sampleRate,dataOffset,dataBytes};
}

/** Standard IMA ADPCM WAVE decode: one predictor per block/channel and
 * four-byte channel groups, low nibble first. Returns original signed PCM16. */
export function decodeWave(source:Buffer):{info:WaveInfo;pcm:Int16Array} {
 const info=readWaveInfo(source),pcm=new Int16Array(info.frames*info.channels);
 if(info.format===1){for(let i=0;i<pcm.length;i++)pcm[i]=source.readInt16LE(info.dataOffset+i*2);return {info,pcm};}
 const {channels,blockAlign,samplesPerBlock,dataOffset,dataBytes}=info;let frameBase=0;
 for(let block=dataOffset;block<dataOffset+dataBytes;block+=blockAlign){
  const predictors=new Int32Array(channels),indices=new Int32Array(channels);
  for(let channel=0;channel<channels;channel++){const at=block+channel*4;predictors[channel]=source.readInt16LE(at);indices[channel]=source[at+2];if(indices[channel]>88||source[at+3]!==0)throw new Error('IMA ADPCM 通道头无效');if(frameBase<info.frames)pcm[frameBase*channels+channel]=predictors[channel];}
  let localFrame=1;
  for(let group=block+channels*4;group<block+blockAlign;group+=channels*4){
   for(let channel=0;channel<channels;channel++)for(let byte=0;byte<4;byte++){
    const encoded=source[group+channel*4+byte];
    for(let half=0;half<2;half++){
     const nibble=encoded>>half*4&15,step=steps[indices[channel]];
     let delta=step>>3;if(nibble&1)delta+=step>>2;if(nibble&2)delta+=step>>1;if(nibble&4)delta+=step;
     predictors[channel]=Math.min(32767,Math.max(-32768,predictors[channel]+(nibble&8?-delta:delta)));
     indices[channel]=Math.min(88,Math.max(0,indices[channel]+indexDelta[nibble&7]));
     const frame=frameBase+localFrame+byte*2+half;if(frame<info.frames)pcm[frame*channels+channel]=predictors[channel];
    }
   }
   localFrame+=8;
  }
  frameBase+=samplesPerBlock!;
 }
 return {info,pcm};
}
