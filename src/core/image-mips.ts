// Preview mip generation from the supplied PNG. Average color in linear light
// for sRGB images, alpha and non-gamma data in their original channel space.
// Normal/data textures retain their packed channels. Original exporter mip
// generation/compression is a separate parity question.
export function imageMipChain(width:number,height:number,rgba:Uint8Array,srgb=false,enabled=true){
 if(!Number.isInteger(width)||!Number.isInteger(height)||width<1||height<1||rgba.length!==width*height*4)throw new Error('PNG mip 输入无效');
 const levels=[rgba];let w=width,h=height,previous=rgba;
 const decode=Array.from({length:256},(_,i)=>{const v=i/255;return v<=.04045?v/12.92:((v+.055)/1.055)**2.4;});
 while(enabled&&(w>1||h>1)){
  const nw=Math.max(1,Math.floor(w/2)),nh=Math.max(1,Math.floor(h/2)),next=new Uint8Array(nw*nh*4);
  for(let y=0;y<nh;y++)for(let x=0;x<nw;x++){
   const left=x*w/nw,right=(x+1)*w/nw,top=y*h/nh,bottom=(y+1)*h/nh,sum=[0,0,0,0];let area=0;
   for(let sy=Math.floor(top);sy<Math.ceil(bottom);sy++)for(let sx=Math.floor(left);sx<Math.ceil(right);sx++){
    const weight=(Math.min(sx+1,right)-Math.max(sx,left))*(Math.min(sy+1,bottom)-Math.max(sy,top));area+=weight;
    for(let c=0;c<4;c++){const v=previous[(sy*w+sx)*4+c];sum[c]+=weight*(srgb&&c<3?decode[v]:v/255);}
   }
   for(let c=0;c<4;c++){const v=sum[c]/area,encoded=srgb&&c<3?(v<=.0031308?12.92*v:1.055*v**(1/2.4)-.055):v;next[(y*nw+x)*4+c]=Math.round(Math.max(0,Math.min(1,encoded))*255);}
  }
  levels.push(next);previous=next;w=nw;h=nh;
 }
 const data=new Uint8Array(levels.reduce((size,level)=>size+level.length,0));let offset=0;for(const level of levels){data.set(level,offset);offset+=level.length;}
 return {mipLevels:levels.length,data};
}
