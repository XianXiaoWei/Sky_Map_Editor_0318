import test from 'node:test';
import assert from 'node:assert/strict';
import { deflateSync } from 'node:zlib';
import { decodePng } from '../src/core/png';

function png(width:number,height:number,type:number,rows:number[],palette?:number[],alpha?:number[]) {
  const chunk=(name:string,data:Buffer)=>{const b=Buffer.alloc(data.length+12);b.writeUInt32BE(data.length);b.write(name,4);data.copy(b,8);return b;};
  const header=Buffer.alloc(13);header.writeUInt32BE(width);header.writeUInt32BE(height,4);header[8]=8;header[9]=type;
  return Buffer.concat([Buffer.from([137,80,78,71,13,10,26,10]),chunk('IHDR',header),...(palette?[chunk('PLTE',Buffer.from(palette))]:[]),...(alpha?[chunk('tRNS',Buffer.from(alpha))]:[]),chunk('IDAT',deflateSync(Buffer.from(rows))),chunk('IEND',Buffer.alloc(0))]);
}
test('PNG keeps RGB bytes under zero and fractional alpha instead of premultiplying material data',()=>{
  assert.deepEqual(Array.from(decodePng(png(2,1,6,[0,200,100,50,0,25,50,75,128])).rgba),[200,100,50,0,25,50,75,128]);
});
test('PNG decodes independent known rows using all five predictors',()=>{
  // RGBA rows [10,20,30,40] repeated twice, then [11,22,33,44] twice.
  const wanted=[10,20,30,40,10,20,30,40,11,22,33,44,11,22,33,44];
  const rows=[
    [0,10,20,30,40,10,20,30,40,0,11,22,33,44,11,22,33,44],
    [1,10,20,30,40,0,0,0,0,1,11,22,33,44,0,0,0,0],
    [2,10,20,30,40,10,20,30,40,2,1,2,3,4,1,2,3,4],
    [3,10,20,30,40,5,10,15,20,3,6,12,18,24,1,1,2,2],
    [4,10,20,30,40,0,0,0,0,4,1,2,3,4,0,0,0,0]
  ];
  for(const row of rows)assert.deepEqual(Array.from(decodePng(png(2,2,6,row)).rgba),wanted);
});
test('PNG palette transparency and grayscale transparency preserve color',()=>{
  assert.deepEqual(Array.from(decodePng(png(2,1,3,[0,1,0],[1,2,3,100,150,200],[255,0])).rgba),[100,150,200,0,1,2,3,255]);
  assert.deepEqual(Array.from(decodePng(png(2,1,0,[0,33,44],undefined,[0,33])).rgba),[33,33,33,0,44,44,44,255]);
});
