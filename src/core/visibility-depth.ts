import { visibilityMul, visibilityFloatFromBits } from './visibility-float';

export interface VisibilityMip {width:number;height:number;logicalWidth:number;logicalHeight:number;offset:number;}
/** Resize 0x10071db19..0x10071dbae layout loop. Float dimensions are halved
 * independently of the padded integer dimensions. No allocator/GPU lifecycle. */
export function visibilityMipLayout(viewportWidth:number, viewportHeight:number): VisibilityMip[] {
  const viewport = [viewportWidth,viewportHeight].map(Math.fround);
  if (!viewport.every(v=>Number.isFinite(v)&&v>=0&&v<=0x7fffffff)) throw new Error('Visibility viewport range');
  let w = Math.trunc(viewport[0]) >>> 2, h = Math.trunc(viewport[1]) >>> 2;
  let logicalWidth = w, logicalHeight = h, offset = 0;
  const result:VisibilityMip[] = [];
  for(let i=0;i<20 && ((w|h)&0x7ffffffe)!==0;i++) {
    const width=w+(w&1),height=h+(h&1);
    result.push({width,height,logicalWidth,logicalHeight,offset});offset+=width*height;
    w=width>>>1;h=height>>>1;
    logicalWidth=visibilityMul(logicalWidth,0.5);logicalHeight=visibilityMul(logicalHeight,0.5);
  }
  return result;
}

/** Exact ordered reads/writes of 0x100720560, including vector overreads into
 * neighboring mip memory and padding overwrites. Input is an explicit snapshot
 * of the original contiguous allocation; retain at least 32 guard float words.
 * Each consecutive four-float group stores a 2x2 tile.
 * MAX capability is explicit to distinguish QEMU subnormal handling.
 */
export function reduceVisibilityDepthMips(buffer:Float32Array, widths:ArrayLike<number>, heights:ArrayLike<number>, maximum:(a:number,b:number)=>number):void {
  if(widths.length!==heights.length||widths.length>20)throw new Error('Visibility mip count');
  const offsets:number[]=[];let size=0;
  for(let i=0;i<widths.length;i++) {
    const w=widths[i],h=heights[i];
    if(!Number.isInteger(w)||!Number.isInteger(h)||w<2||h<2||w%2||h%2)throw new Error('Visibility mips require nonempty even stored dimensions');
    if(i&& (w!==((widths[i-1]>>>1)+(widths[i-1]>>>1&1))||h!==((heights[i-1]>>>1)+(heights[i-1]>>>1&1))))throw new Error('Visibility mip padding mismatch');
    offsets.push(size);size+=w*h;
  }
  if(!Number.isSafeInteger(size)||buffer.length<size+32)throw new Error('Visibility allocation snapshot/guard range');
  const words=new Uint32Array(buffer.buffer,buffer.byteOffset,buffer.length);
  const maxWord=(a:number,b:number)=>{
    const x=visibilityFloatFromBits(a),y=visibilityFloatFromBits(b),value=maximum(x,y);
    // Native MAX forwards operand two on unordered/equal, including its payload.
    if(Number.isNaN(value)||Object.is(value,y))return b;
    if(Object.is(value,x))return a;
    // A capability may flush a selected denormal operand to signed zero.
    return Object.is(value,-0)?0x80000000:0;
  };
  const read=(base:number,at:number)=>{const index=base+at;if(index<0||index>=words.length)throw new Error('Visibility native read outside explicit snapshot');return words[index];};
  const write4=(base:number,at:number,values:number[])=>{
    const index=base+at;if(index<0||index+4>words.length)throw new Error('Visibility native write outside explicit snapshot');words.set(values,index);
  };
  const forward4=(base:number,at:number)=>maxWord(maxWord(read(base,at),read(base,at+1)),maxWord(read(base,at+2),read(base,at+3)));
  const reversePairs4=(base:number,at:number)=>maxWord(maxWord(read(base,at+1),read(base,at)),maxWord(read(base,at+3),read(base,at+2)));
  for(let mip=1;mip<widths.length;mip++) {
    const sw=widths[mip-1],sh=heights[mip-1],dw=widths[mip],dh=heights[mip],src=offsets[mip-1],dst=offsets[mip];
    const halfW=sw>>>1,halfH=sh>>>1;
    for(let row=0;row<halfH;row+=2) {
      let output=row*dw;
      for(let col=0;col<halfW;col+=2) {
        const a=2*row*sw+col*4,b=(2*row+2)*sw+col*4;
        const values=[forward4(src,a),forward4(src,a+4),forward4(src,b),forward4(src,b+4)];
        write4(dst,output,values);output+=4;
      }
    }
    if(halfH!==dh) {
      const a=(sh-2)*sw,b=(dh-2)*dw;
      for(let col=0;col<halfW;col+=2) {
        const x=reversePairs4(src,a+col*4),y=reversePairs4(src,a+col*4+4);
        write4(dst,b+col*2,[x,y,x,y]);
      }
    }
    if(halfW!==dw) {
      const a=2*sw-4,b=2*dw-4;
      for(let row=0;row<halfH;row+=2) {
        const x=reversePairs4(src,a+row*2*sw),y=reversePairs4(src,a+(row*2+2)*sw);
        write4(dst,b+row*dw,[x,x,y,y]);
      }
      if(halfH!==dh) {
        const a=sw*sh-4;
        const x=maxWord(maxWord(read(src,a+3),read(src,a+2)),maxWord(read(src,a+1),read(src,a)));
        write4(dst,dw*dh-4,[x,x,x,x]);
      }
    }
  }
}
