import { inflateSync } from 'node:zlib';

// Asset decoding must keep straight RGBA, including RGB under transparent
// texels. Desktop bitmap APIs premultiply alpha and corrupt packed data maps.
export function decodePng(bytes: Uint8Array) {
  const b=Buffer.from(bytes.buffer,bytes.byteOffset,bytes.byteLength);
  if(!b.subarray(0,8).equals(Buffer.from([137,80,78,71,13,10,26,10])))throw new Error('PNG 签名无效');
  let width=0,height=0,type=-1,channels=0,ended=false;
  let palette:Buffer=Buffer.alloc(0),transparency:Buffer=Buffer.alloc(0);
  const parts:Buffer[]=[];
  for(let at=8;at+12<=b.length;) {
    const length=b.readUInt32BE(at),name=b.toString('ascii',at+4,at+8),end=at+12+length;
    if(end>b.length)throw new Error('PNG 区块截断');
    const data=b.subarray(at+8,end-4);
    if(name==='IHDR') {
      if(length!==13||width)throw new Error('PNG 头部无效');
      width=data.readUInt32BE(0);height=data.readUInt32BE(4);type=data[9];channels=({0:1,2:3,3:1,4:2,6:4} as Record<number,number>)[type];
      if(!width||!height||width>16384||height>16384||width*height>64000000||!channels||data[8]!==8||data[10]||data[11]||data[12])throw new Error('PNG 需要非交错 8-bit 图像');
    } else if(name==='PLTE')palette=data;
    else if(name==='tRNS')transparency=data;
    else if(name==='IDAT')parts.push(data);
    else if(name==='IEND'){ended=true;break;}
    at=end;
  }
  if(!width||!parts.length||!ended)throw new Error('PNG 图像不完整');
  const row=width*channels,raw=inflateSync(Buffer.concat(parts),{maxOutputLength:height*(row+1)});
  if(raw.length!==height*(row+1))throw new Error('PNG 像素长度无效');
  const pixels=new Uint8Array(width*height*channels);
  const paeth=(a:number,c:number,d:number)=>{const p=a+c-d,pa=Math.abs(p-a),pc=Math.abs(p-c),pd=Math.abs(p-d);return pa<=pc&&pa<=pd?a:pc<=pd?c:d;};
  for(let y=0;y<height;y++) {
    const filter=raw[y*(row+1)];if(filter>4)throw new Error('PNG 行过滤器无效');
    for(let x=0;x<row;x++) {
      const at=y*row+x,left=x>=channels?pixels[at-channels]:0,up=y?pixels[at-row]:0,corner=y&&x>=channels?pixels[at-row-channels]:0;
      const predictor=[0,left,up,Math.floor((left+up)/2),paeth(left,up,corner)][filter];
      pixels[at]=(raw[y*(row+1)+x+1]+predictor)&255;
    }
  }
  const rgba=new Uint8Array(width*height*4);
  for(let i=0;i<width*height;i++) {
    const at=i*channels,out=i*4;
    if(type===3) {
      const index=pixels[at];if(index*3+2>=palette.length)throw new Error('PNG 调色板索引无效');
      rgba.set(palette.subarray(index*3,index*3+3),out);rgba[out+3]=transparency[index]??255;
    } else if(type===0||type===4) {
      rgba.fill(pixels[at],out,out+3);rgba[out+3]=type===4?pixels[at+1]:transparency.length===2&&pixels[at]===transparency.readUInt16BE(0)?0:255;
    } else {
      rgba.set(pixels.subarray(at,at+3),out);rgba[out+3]=type===6?pixels[at+3]:transparency.length===6&&[0,1,2].every(c=>pixels[at+c]===transparency.readUInt16BE(c*2))?0:255;
    }
  }
  return {width,height,rgba};
}
