// FloppySpine.Update 0x10034d360: path history, smoothing and distance
// constraints at 0x10034d727..0x10034daf7. This is the spatial solver;
// skeleton discovery, Transform aiming and owner enable/reset are separate.
const f=Math.fround,add=(a:number,b:number)=>f(a+b),sub=(a:number,b:number)=>f(a-b),mul=(a:number,b:number)=>f(a*b);
const distance=(a:ArrayLike<number>,ai:number,b:ArrayLike<number>,bi:number)=>f(Math.sqrt(add(add(mul(sub(a[ai],b[bi]),sub(a[ai],b[bi])),mul(sub(a[ai+1],b[bi+1]),sub(a[ai+1],b[bi+1]))),mul(sub(a[ai+2],b[bi+2]),sub(a[ai+2],b[bi+2])))));
export interface FloppySpineState {
 positions:Float32Array;lengths:Float32Array;history:Float32Array;directionHistory:Float32Array;
}
export function solveOriginalFloppySpine(s:FloppySpineState,forward:ArrayLike<number>){
 const {positions:p,lengths,history:h,directionHistory:dh}=s,count=lengths.length;
 if(count<2||count>128||p.length!==count*4||h.length!==512||dh.length!==512)throw new Error('原 FloppySpine 数据长度无效');
 let total=0;for(const length of lengths)total=add(total,length);
 const spacing=mul(mul(mul(total,f(Math.PI)),f(1.2)),1/128);
 if(distance(h,0,p,0)>spacing){
  // Native overlapping copy shifts 127 entries by one. copyWithin has the
  // same retained result without invoking an overlapping C memcpy in JS.
  h.copyWithin(4,0,508);dh.copyWithin(4,0,508);
  h.set(p.subarray(0,4));for(let k=0;k<4;k++)dh[k]=forward[k]??0;
 }
 const targets=new Float32Array(count*4);targets.set(p.subarray(0,4));let cursor=0;
 for(let i=1;i<count;i++){
  const at=i*4,previous=at-4,length=lengths[i];let selected=0,best=3.4028234663852886e38,priorDistance=0;
  if(cursor>=128)throw new Error('原 FloppySpine historyCount 断言');
  for(let j=0;j<128-cursor;j++){
   const d=distance(h,(cursor+j)*4,targets,previous);
   if(length>priorDistance&&j!==0&&d>length){selected=j;break;}
   const error=Math.abs(sub(d,length));if(best>error)selected=j;best=Math.min(best,error);priorDistance=d;
  }
  cursor+=selected;
  const d=distance(h,cursor*4,targets,previous);
  for(let k=0;k<3;k++){let direction=sub(h[cursor*4+k],targets[previous+k]);if(d>f(.00001))direction=f(direction/d);targets[at+k]=add(targets[previous+k],mul(length,direction));}
 }
 for(let i=4;i<p.length;i++)p[i]=i%4===3?0:add(mul(f(.7),p[i]),mul(f(.3),targets[i]));
 // Ten relaxation passes, fixed leading point; the final forward pass
 // places every follower exactly one original segment length away.
 for(let pass=0;pass<10;pass++)for(let i=0;i<count-1;i++){
  const a=i*4,b=a+4,d=distance(p,a,p,b),error=sub(d,lengths[i+1]);
  for(let k=0;k<3;k++){let direction=sub(p[a+k],p[b+k]);if(d>f(.00001))direction=f(direction/d);let correction=mul(direction,error);if(i){correction=mul(correction,.5);p[a+k]=sub(p[a+k],correction);}p[b+k]=add(p[b+k],correction);}
 }
 for(let i=1;i<count;i++){
  const a=(i-1)*4,b=i*4,d=distance(p,a,p,b);
  for(let k=0;k<3;k++){let direction=sub(p[b+k],p[a+k]);if(d>f(.00001))direction=f(direction/d);p[b+k]=add(p[a+k],mul(lengths[i],direction));}
 }
 return targets;
}
