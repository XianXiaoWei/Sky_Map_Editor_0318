import {sampleCheapFogTints,sampleSkyTints,type SkyTints} from './atmosphere';
const f=Math.fround;
/** Ambience.Update 0x10005b708..0x10005b98f: original 64-sample LUT and
 * 63 cheap-fog filter rows. The cheap branch samples sqrt(i/63), height=0,
 * and its own tint fields. Every row keeps 64 texels and mirrored indices. */
export function buildOriginalAmbienceLookup(ordinary:SkyTints,cheap:SkyTints,cheapEnabled:boolean,expf?:(x:number)=>number){
 const rows=new Float32Array(64*64*4);
 for(let i=0;i<64;i++){
  const x=f(i/63),color=cheapEnabled?sampleCheapFogTints(cheap,f(Math.sqrt(x)),10,0,expf):sampleSkyTints(ordinary,x,10,expf);
  rows.set(color,i*4);
 }
 if(cheapEnabled)for(let row=1;row<64;row++)for(let i=0;i<64;i++){
  const d=row>>2,left=i-d>0?i-d-1:d+1-i,right=i+d+1<=63?i+d+1:125-d-i;
  for(let lane=0;lane<4;lane++){
   const a=rows[((row-1)*64+left)*4+lane],b=rows[((row-1)*64+i)*4+lane],c=rows[((row-1)*64+right)*4+lane];
   rows[(row*64+i)*4+lane]=lane===3?0:f(f(f(a*f(.4))+f(b*f(.2)))+f(c*f(.4)));
  }
 }
 return {rows,lut:rows.subarray(0,256)};
}
