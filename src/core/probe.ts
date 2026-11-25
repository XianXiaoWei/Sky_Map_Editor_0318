// Ambience probe reduction 0x10006103b..0x100061653, and flush data layout.
// Callers must supply the ORIGINAL scene ray directions/intersection colors.
// This module does not substitute sky colors for scene ray casts.
import { probeMipIndices, probeHalfBase, probeHalfShift } from './probe-tables';

const f = Math.fround;
export const PROBE_SIZE = 32;
export const PROBE_MIP_LEVELS = 6;
export const PROBE_BASE_PIXELS = 6144;
export const PROBE_PIXELS = 8190;
export interface ProbeState { history: Float32Array; sh: Float32Array; }
export interface ProbeSamples {
  // float4 [face, u, v, unused]; u/v in [0,1), 0..5 in standard cube order.
  coordinates: Float32Array; directions: Float32Array; colors: Float32Array;
}
export interface ProbeReduction extends ProbeState { cube: Float32Array; half: Uint16Array; }

// Coefficients and operation order from 0x100413f50's original jump table.
export function probeShBasis(direction: ArrayLike<number>): number[] {
  const x = f(direction[0]), y = f(direction[1]), z = f(direction[2]);
  const xx = f(x*x), yy = f(y*y), zz = f(z*z);
  return [f(.2820947766304016), f(x*f(.48860251903533936)), f(y*f(.48860251903533936)), f(z*f(.48860251903533936)),
    f(f(f(-xx-yy)+f(zz+zz))*f(.31539157032966614)), f(z*f(y*f(1.0925483703613281))),
    f(x*f(z*f(1.0925483703613281))), f(y*f(x*f(1.0925483703613281))), f(f(xx-yy)*f(.5462741851806641))];
}

// Original software lookup path truncates; it is also used for a vector tail
// even on an F16C machine. Preserve that distinction, signed zero and NaNs.
export function packProbeHalf(values: Float32Array, hardwareF16c: boolean): Uint16Array {
  const bits = new Uint32Array(values.buffer, values.byteOffset, values.length), out = new Uint16Array(values.length);
  const vectorEnd = hardwareF16c ? values.length - values.length % 4 : 0;
  const roundEven = (mantissa: number, shift: number) => {
    const divisor = 2**shift, whole = Math.floor(mantissa/divisor), remainder = mantissa-whole*divisor;
    return whole + Number(remainder > divisor/2 || remainder === divisor/2 && whole % 2 !== 0);
  };
  for (let i=0; i<bits.length; i++) {
    const v=bits[i], exponent=(v>>>23)&255, sign=(v>>>16)&0x8000, mantissa=v&0x7fffff;
    if (i >= vectorEnd) { const index=v>>>23; out[i]=(probeHalfBase[index]+(mantissa>>>probeHalfShift[index]))&0xffff; }
    else if (exponent===255) out[i]=sign|0x7c00|(mantissa ? (mantissa>>>13)|0x200 : 0);
    else if (exponent>=143) out[i]=sign|0x7c00;
    else if (exponent>=113) out[i]=sign|(((exponent-112)<<10)+roundEven(mantissa,13));
    else if (exponent>=102) out[i]=sign|roundEven(0x800000+mantissa,126-exponent);
    else out[i]=sign;
  }
  return out;
}

export function reduceProbe(state: ProbeState, samples: ProbeSamples, hardwareF16c: boolean): ProbeReduction {
  if (!(state.history instanceof Float32Array) || state.history.length!==PROBE_BASE_PIXELS*4
    || !(state.sh instanceof Float32Array) || state.sh.length!==27
    || ![samples.coordinates,samples.directions,samples.colors].every(a=>a instanceof Float32Array)
    || samples.coordinates.length%4 || samples.coordinates.length>384*4
    || samples.directions.length!==samples.coordinates.length || samples.colors.length!==samples.coordinates.length)
    throw new Error('原探针状态或射线数组长度无效');
  const count=samples.colors.length/4, cube=new Float32Array(PROBE_PIXELS*4), sums=new Float32Array(27);
  cube.set(state.history);
  const scale=count ? f(f(12.566370964050293)/count) : 0;
  for (let i=0;i<count;i++) {
    const at=i*4, face=samples.coordinates[at], u=samples.coordinates[at+1], v=samples.coordinates[at+2];
    if (!Number.isInteger(face) || face<0 || face>5 || !(u>=0 && u<1 && v>=0 && v<1)
      || ![samples.directions[at],samples.directions[at+1],samples.directions[at+2]].every(Number.isFinite))
      throw new Error('原探针立方体坐标或方向无效');
    const basis=probeShBasis(samples.directions.subarray(at,at+4));
    for(let coefficient=0;coefficient<9;coefficient++) {
      const weight=f(basis[coefficient]*scale);
      for(let lane=0;lane<3;lane++) { const j=coefficient*3+lane; sums[j]=f(sums[j]+f(samples.colors[at+lane]*weight)); }
    }
    const pixel=face*1024+Math.trunc(f(v*32))*32+Math.trunc(f(u*32));
    // Sequential sparse updates: repeated hits must blend against the last hit.
    for(let lane=0;lane<4;lane++) {
      const j=pixel*4+lane, value=f(cube[j]+f(f(samples.colors[at+lane]-cube[j])*f(.35)));
      // vmaxps chooses its second operand on NaN or an equal comparison.
      cube[j]=value>f(.0001) ? value : f(.0001);
    }
  }
  const sh=Float32Array.from(sums,(value,i)=>f(f(state.sh[i]*f(.95))+f(value*f(.05))));
  for(let output=0;output<2046;output++) for(let lane=0;lane<4;lane++) {
    const start=output*16;
    let value=cube[probeMipIndices[start]*4+lane];
    for(let tap=1;tap<16;tap++) value=f(value+cube[probeMipIndices[start+tap]*4+lane]);
    cube[(PROBE_BASE_PIXELS+output)*4+lane]=f(value*.0625);
  }
  return {history:cube.slice(0,PROBE_BASE_PIXELS*4),sh,cube,half:packProbeHalf(cube,hardwareF16c)};
}

// Exact flush order at 0x10005c746, before GPU resource calls.
export function probeUniforms(sh: Float32Array) {
  if(sh.length!==27) throw new Error('原探针 SH 长度无效');
  const group=(channel:number,start:number)=>Array.from({length:4},(_,i)=>sh[(start+i)*3+channel]);
  return {u_probeShR0:group(0,0),u_probeShR1:group(0,4),u_probeShG0:group(1,0),u_probeShG1:group(1,4),
    u_probeShB0:group(2,0),u_probeShB1:group(2,4),u_probeShRGB2:Array.from(sh.subarray(24)),
    u_averageProbeColor:[f(sh[0]*f(3.544907808303833)),f(sh[1]*f(3.544907808303833)),f(sh[2]*f(3.544907808303833))]};
}
