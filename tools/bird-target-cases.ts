import type {BirdUpdateCase} from './bird-update-cases';
export function birdTargetChainCases():BirdUpdateCase[]{
 const base:BirdUpdateCase={label:'Target chain',targetChain:true,timer:-1,landTargets:3,chance:1};const cases:BirdUpdateCase[]=[];
 for(const landTargets of [undefined,0,1,3,8,16])for(const random of [0,0x12345678,0x7fffffff])for(const landEnabledMask of [0,0xffff,0x5555])cases.push({...base,label:`land ${landTargets} / rand ${random} / enabled ${landEnabledMask}`,landTargets,random,landEnabledMask});
 for(const chance of [-1,0,.0001,.5,1])cases.push({...base,label:`probability ${chance}`,chance});
 for(const option of [{targetCastFailure:true},{shrinkTargets:true},{landTargets:0},{timer:2},{enabled:0},{frames:2},{frames:8},{cull:true,distance:40},{target:true,targetEnabled:0,targetValue:0.6}])cases.push({...base,label:'target callbacks / consecutive frames',...option});
 return cases;
}
