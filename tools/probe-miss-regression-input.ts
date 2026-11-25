import {viewportProbeBindings} from '../src/main/viewport-probe';
import {sampleAtmosphereRay} from '../src/core/atmosphere';
import type {createViewportEnvironment} from '../src/main/viewport-environment';
/** Prior preview input, only for before/after GPU regressions. This deliberately
 * omits the original hemisphere clamp/renormalization and must never be used
 * by production rendering. */
export function previousSkyProbe(e:ReturnType<ReturnType<typeof createViewportEnvironment>>,eye:number[]){
 const history=new Float32Array(6144*4);
 for(let face=0;face<6;face++)for(let y=0;y<32;y++)for(let x=0;x<32;x++){
  const u=2*(x+.5)/32-1,v=2*(y+.5)/32-1,d=[[1,-v,-u],[-1,-v,u],[u,1,v],[u,-1,-v],[u,-v,1],[-u,-v,-1]][face],length=Math.hypot(...d);
  const color=sampleAtmosphereRay({eye:[...eye,1],direction:[...d.map(n=>n/length),0],planetSphere:e.sphere,sunDirection:[...e.direction,0],sunColor:e.sunColor,averageSkyboxColor:e.average,atmosphereSunColor:e.values.AmbienceSun.sunColor as number[],atmosphereDensity:Number(e.values.AmbienceSky.atmosphereDensity),fogDensity:0,fogHeight:1,atmosphereSample:e.atmosphereSample,tintLookup:e.lut});
  color.forEach((n,l)=>history[(face*1024+y*32+x)*4+l]=Math.max(.0001,n));
 }
 return viewportProbeBindings(history,eye);
}
