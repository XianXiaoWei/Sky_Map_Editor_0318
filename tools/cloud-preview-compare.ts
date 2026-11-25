import fs from 'node:fs';
import crypto from 'node:crypto';
import assert from 'node:assert/strict';
import { decodePng } from '../src/core/png';
import { writeEffectPng } from './effect-png';

async function main(){
 const noise=process.argv.includes('--noise'),baseline=noise?'cloud-noise-before':'cloud-coordinate-before',suffix=noise?'cloud-noise-before-after':'cloud-before-after';
 const maps=[];
 for(const level of ['Dawn','Prairie_ButterflyFields','Sunset']){
  const beforeFile=`docs/shader-effects/${baseline}/${level}.png`,afterFile=`docs/shader-effects/${level}-cloud-pipeline.png`;
  const beforeBytes=fs.readFileSync(beforeFile),afterBytes=fs.readFileSync(afterFile),before=decodePng(beforeBytes),after=decodePng(afterBytes);
  assert.equal(before.width,after.width);assert.equal(before.height,after.height);
  const pixels=new Uint8Array(before.rgba.length*2);let changedPixels=0,absoluteDifference=0;
  for(let y=0;y<before.height;y++){
   const offset=y*before.width*4;
   pixels.set(before.rgba.subarray(offset,offset+before.width*4),offset*2);
   pixels.set(after.rgba.subarray(offset,offset+before.width*4),offset*2+before.width*4);
  }
  for(let i=0;i<before.rgba.length;i+=4){let changed=false;for(let c=0;c<3;c++){const difference=Math.abs(before.rgba[i+c]-after.rgba[i+c]);changed||=difference!==0;absoluteDifference+=difference;}if(changed)changedPixels++;}
  const file=`docs/shader-effects/${level}-${suffix}.png`;await writeEffectPng(file,before.width*2,before.height,pixels);
  maps.push({level,width:before.width,height:before.height,changedPixels,meanAbsoluteRGBDifference:absoluteDifference/(before.width*before.height*3),beforeSha256:crypto.createHash('sha256').update(beforeBytes).digest('hex'),afterSha256:crypto.createHash('sha256').update(afterBytes).digest('hex'),file});
 }
 fs.writeFileSync(noise?'docs/cloud-noise-compare.json':'docs/cloud-preview-compare.json',JSON.stringify({scope:'Same real-map cameras, two animated frames. Left: preceding preview; right: corrected cloud inputs, mip/anisotropic texture filtering and original FXAA. Image differences quantify the editor change; they do not compare against original game images.',maps},null,2)+'\n');
 console.log(JSON.stringify(maps));
}
void main().catch(e=>{console.error(e);process.exitCode=1;});
