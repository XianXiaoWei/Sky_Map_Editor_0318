import fs from 'node:fs';import crypto from 'node:crypto';
import {decodePng} from '../src/core/png';import {writeEffectPng} from './effect-png';
async function main(){const rows=[];
 for(const level of ['Dawn','Prairie_ButterflyFields','Sunset']){
  const previous=decodePng(fs.readFileSync(`docs/shader-effects/${level}-cloud-noise-before-after.png`)),after=decodePng(fs.readFileSync(`docs/shader-effects/${level}-cloud-pipeline.png`)),width=after.width,height=after.height;
  if(previous.width!==width*2||previous.height!==height)throw new Error('Previous preview image dimensions differ');
  const before=new Uint8Array(width*height*4),combined=new Uint8Array(width*height*8);let changed=0,sum=0;
  for(let y=0;y<height;y++){before.set(previous.rgba.subarray((y*previous.width+width)*4,(y*previous.width+width*2)*4),y*width*4);combined.set(before.subarray(y*width*4,(y+1)*width*4),y*width*8);combined.set(after.rgba.subarray(y*width*4,(y+1)*width*4),y*width*8+width*4);}
  for(let i=0;i<before.length;i+=4){let different=false;for(let lane=0;lane<3;lane++){sum+=Math.abs(before[i+lane]-after.rgba[i+lane]);different||=before[i+lane]!==after.rgba[i+lane];}if(different)changed++;}
  const file=`docs/shader-effects/${level}-cloud-temporal-before-after.png`;await writeEffectPng(file,width*2,height,combined);
  const hash=(bytes:Uint8Array)=>crypto.createHash('sha256').update(bytes).digest('hex');rows.push({level,width,height,changedPixels:changed,meanAbsoluteRGBDifference:sum/(width*height*3),beforeSha256:hash(before),afterSha256:hash(after.rgba),file});
 }
 const report={scope:'Same prior real-map camera and two frames. Left: preceding mip/FXAA preview; right: original Compositor random conversion with deterministic preview samples and original MotionGen/MotionDilate/TemporalAa branch at centered scene jitter. Editor differences, not original game visual parity.',maps:rows};fs.writeFileSync('docs/cloud-temporal-compare.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report));
}
void main().catch(e=>{console.error(e);process.exitCode=1;});
