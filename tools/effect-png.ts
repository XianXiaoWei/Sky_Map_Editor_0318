import fs from 'node:fs/promises';import {deflateSync} from 'node:zlib';
export async function writeEffectPng(file:string,width:number,height:number,rgba:Uint8Array){
 const crc=(b:Buffer)=>{let c=0xffffffff;for(const byte of b){c^=byte;for(let i=0;i<8;i++)c=(c>>>1)^((c&1)?0xedb88320:0);}return(c^0xffffffff)>>>0;};
 const chunk=(name:string,b:Buffer)=>{const type=Buffer.from(name),out=Buffer.alloc(b.length+12);out.writeUInt32BE(b.length);type.copy(out,4);b.copy(out,8);out.writeUInt32BE(crc(Buffer.concat([type,b])),8+b.length);return out;};
 const header=Buffer.alloc(13);header.writeUInt32BE(width);header.writeUInt32BE(height,4);header[8]=8;header[9]=6;const rows=Buffer.alloc(height*(width*4+1));for(let y=0;y<height;y++)Buffer.from(rgba.subarray(y*width*4,(y+1)*width*4)).copy(rows,y*(width*4+1)+1);
 await fs.writeFile(file,Buffer.concat([Buffer.from([137,80,78,71,13,10,26,10]),chunk('IHDR',header),chunk('IDAT',deflateSync(rows)),chunk('IEND',Buffer.alloc(0))]));
}
export function effectDisplay(values:Float32Array){const rgba=new Uint8Array(values.length);for(let i=0;i<values.length;i++) {const v=Math.max(0,values[i]),mapped=v/(1+v);rgba[i]=i%4===3?255:Math.round(255*(mapped<=.0031308?12.92*mapped:1.055*mapped**(1/2.4)-.055));}return rgba;}
