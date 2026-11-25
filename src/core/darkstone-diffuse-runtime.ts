import evidence from '../../docs/darkstone-diffuse-native.json';

const f=Math.fround;
export interface DarkstoneDiffuseInput {
 eligible:boolean;childScales:readonly number[];rootKillable:boolean;
 requiredLevel:number;availableLevel:number;pulseLevel:number;
 collectible:boolean;collectibleAvailable:boolean;rewardAllowed:boolean;
 specialOwner:boolean;rewardCount:number;heat:number;time:number;delta:number;
}
export interface DarkstoneDiffuseColors {
 diffuse:readonly number[];blocked:readonly number[];dynamic:readonly number[];
 pulseLow:readonly number[];pulseHigh:readonly number[];
}
export interface DarkstoneDiffuseMath {sinf(value:number):number;expf(value:number):number;}
export const originalDarkstoneDiffuseColors:DarkstoneDiffuseColors=evidence.colors;

/** Original Darkstone.Update diffuse subregion 0x10027daeb..0x10027dd44.
 * Caller-supplied eligibility, hierarchy scales, reward state, heat and clock
 * retain their own owners. This does not implement burning or rewards. Libm
 * is an explicit service; browser defaults are float32 preview adapters. */
export function updateOriginalDarkstoneDiffuse(previous:readonly number[],input:DarkstoneDiffuseInput,
 colors:DarkstoneDiffuseColors=originalDarkstoneDiffuseColors,
 math:DarkstoneDiffuseMath={sinf:n=>f(Math.sin(n)),expf:n=>f(Math.exp(n))}){
 const c=evidence.constants;
 let target=colors.diffuse.slice();
 if(input.eligible&&!input.childScales.some(scale=>f(scale)>c.threshold)&&input.rootKillable){
  target=(input.availableLevel>>>0)<(input.requiredLevel>>>0)?colors.blocked.slice():colors.dynamic.map((v,i)=>f(f(v)*(i===3?c.dynamicAlpha:c.dynamicRgb)));
 }
 const rewards=input.collectible?input.collectibleAvailable:input.rewardAllowed&&(input.specialOwner||(input.rewardCount>>>0)!==0);
 if(!rewards)target=target.map(v=>f(f(v)*c.unavailable));
 const heat=f(input.heat);
 if(heat>c.threshold&&(input.pulseLevel>>>0)>=(input.requiredLevel>>>0)){
  const angle=f(f(heat*c.pulseFrequency)*f(input.time));
  const pulse=Math.min(1,Math.max(0,f(f(math.sinf(angle)*.5)+.5)));
  target=colors.pulseLow.map((v,i)=>f(f(v)+f(f(f(colors.pulseHigh[i])-f(v))*pulse)));
 }
 const weight=Math.min(1,Math.max(0,f(1-math.expf(f(f(input.delta)*c.smoothing))))),retained=f(1-weight);
 return previous.map((v,i)=>f(f(weight*f(target[i]))+f(retained*f(v))));
}
