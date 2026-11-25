/** Ambience probe non-cheap-fog miss suffix 0x1000624fd..0x10006259d.
 * The caller owns the scene query. Never send an unmodified downward miss
 * direction to the atmosphere sampler: the original clamps Y then normalizes.
 * RSQRTSS is an explicit native capability, followed by the original float32
 * Newton step. This also preserves the original zero-vector NaN result. */
const f=Math.fround;
const bitsBuffer=new ArrayBuffer(4),bitsFloat=new Float32Array(bitsBuffer),bitsUint=new Uint32Array(bitsBuffer);
export function probeMissLengthBits(direction:ArrayLike<number>){
 const x=f(direction[0]),rawY=f(direction[1]),y=rawY>=0?rawY:0,z=f(direction[2]);
 const length=f(f(f(x*x)+f(y*y))+f(z*z));bitsFloat[0]=length;return bitsUint[0];
}
export function originalProbeMissDirection(direction:ArrayLike<number>,rsqrt:(bits:number)=>number):number[]{
 if(direction.length!==4)throw new Error('Original probe miss requires float4 direction');
 const x=f(direction[0]),rawY=f(direction[1]),y=rawY>=0?rawY:0,z=f(direction[2]),w=f(direction[3]);
 const length=f(f(f(x*x)+f(y*y))+f(z*z));bitsFloat[0]=length;
 bitsUint[0]=rsqrt(bitsUint[0]);const seed=bitsFloat[0];
 const half=length===0?-Infinity:f(length*.5);
 const inverse=f(seed*f(1.5-f(seed*f(seed*half))));
 return [x,y,z,w].map(v=>f(v*inverse));
}
/** The editor's fixed cubemap rays. SH still projects the original full-sphere
 * directions; only the atmosphere sampling direction uses the miss suffix. */
export function previewProbeCubeDirection(face:number,x:number,y:number){
 if(!Number.isInteger(face)||face<0||face>5||![x,y].every(v=>Number.isInteger(v)&&v>=0&&v<32))throw new Error('Probe cube coordinate');
 const u=2*(x+.5)/32-1,v=2*(y+.5)/32-1;
 const direction=[[1,-v,-u],[-1,-v,u],[u,1,v],[u,-1,-v],[u,-v,1],[-u,-v,-1]][face],length=Math.hypot(...direction);
 return [...direction.map(value=>f(value/length)),0];
}
