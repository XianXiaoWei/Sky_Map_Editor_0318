const f=Math.fround;
// Compositor frame update 0x10024716e..0x1002471c7, given three explicit
// Darwin rand() results. The editor supplies a deterministic preview stream;
// this does not claim to reproduce the game's process-wide random state.
export function compositorRandomOffset(values:number[]) {
 if(values.length!==3||!values.every(v=>Number.isInteger(v)&&v>=0&&v<=0x7fffffff))throw new Error('Compositor 随机输入需要三个 31-bit 整数');
 return values.map(v=>f(f(v)*2**-31));
}
// Original CameraSystem Gaussian corner reconstruction at centered scene
// jitter, executed by the native oracle. Preserve its staggered four taps;
// they are not the diagonal +/- half-pixel taps of a generic TAA filter.
export function centeredTemporalCorners(width:number,height:number) {
 if(![width,height].every(v=>Number.isInteger(v)&&v>0&&v<=16384))throw new Error('时间抗锯齿尺寸无效');
 const c=0.09195452928543091;
 const taps=[-c,-1,1,-c,c,1,-1,c].map((v,i)=>f(v/f(i%2?height:width)));
 return {u_aaCornerUvs0:taps.slice(0,4),u_aaCornerUvs1:taps.slice(4)};
}
