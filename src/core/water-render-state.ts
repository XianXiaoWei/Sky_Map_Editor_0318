import type {ObjectNode} from './objects';
import {itemFloats} from './item-effect-arithmetic';

export function originalOceanResourceNames(level:string,cloudOcean:boolean){
 const dark=level==='RainEnd'||level==='Storm'||level==='StormEnd'||level.startsWith('Dusk');
 const cloud=cloudOcean&&level!=='OrbitMid'&&level!=='CandleSpaceEnd';
 return {dark,cloud,shader:level==='CandleSpace'?'OceanCandle':cloud?'OceanCloud':dark?'OceanDark':'Ocean',
  meshShader:(dark?'OceanDarkMesh':'OceanMesh')+(level.includes('Rain')?'Wet':''),normal:cloud?'CloudNormal':'OceanNormal',caustics:'Caustics'};
}
/** Original Water OnLevelLoad copies all matrix lanes and shifts only Y by
 * half of the saved Y axis (double operation before rounding to float). */
export function originalWaterRenderMatrix(saved:Uint8Array):number[]{
 if(saved.length!==64)throw new Error('Original Water transform must have 64 bytes');
 const ns=itemFloats(saved);if(!ns.every(Number.isFinite))throw new Error('Original Water render transform requires finite values');
 ns[13]=Math.fround(ns[5]*0.5+ns[13]);return ns;
}
export function savedWaterRenderStates(nodes:readonly ObjectNode[]){
 return nodes.filter(n=>n.className==='Water').map(n=>{
  const field=n.fields.find(f=>f.name==='transform');if(!field)throw new Error(`Water #${n.id} transform unavailable`);
  const bytes=Uint8Array.from(field.raw.match(/../g)??[],h=>parseInt(h,16));
  return {nodeId:n.id,model:originalWaterRenderMatrix(bytes),specScale:n.fields.find(f=>f.name==='sunShadowed')?.value?Math.fround(0.005):1};
 });
}

export interface WaterSimulationInputs {position:number[];delta:number;radius:number;depthImpulse:number;sinkImpulse:number;}
/** Preview adapter for the original 256²/16m grid and packed three vec4s.
 * Focus/impulses are explicit inputs. The native Avatar contact/velocity query
 * and Ocean.Update are not replaced by an invented interaction model. */
export class WaterSimulationState {
 private origin:number[]|undefined;
 private previous:number[]|undefined;
 next(input:WaterSimulationInputs){
  if(input.position.length<3||![...input.position,input.delta,input.radius,input.depthImpulse,input.sinkImpulse].every(Number.isFinite)||input.delta<0||input.radius<0)throw new Error('Water simulation inputs invalid');
  const f=Math.fround,p=input.position,origin=[p[0],p[2]].map(n=>f(Math.floor(f(f(n-8)/0.0625))*0.0625));
  const old=this.origin??origin,previous=this.previous??[p[0],p[2]],shift=origin.map((n,i)=>f(f(n-old[i])/16));
  this.origin=origin;this.previous=[p[0],p[2]];
  return {u_waterSimTerms:[...origin,f(input.radius),0.0625],u_waterSimTerms2:[...shift,f(input.depthImpulse),f(input.sinkImpulse)],u_waterSimTerms3:[p[0],p[2],...previous].map(f),u_averagedt:f(input.delta),u_viewportSize:[256,256]};
 }
 reset(){this.origin=this.previous=undefined;}
}
