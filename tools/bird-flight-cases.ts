import type {BirdUpdateCase} from './bird-update-cases';
export function birdFlightChainCases():BirdUpdateCase[]{
 const cases:BirdUpdateCase[]=[],add=(label:string,c:Partial<BirdUpdateCase>)=>cases.push({label,flightChain:true,...c});
 for(const velocity of [[0,0,0,0],[1,0,2,0],[0,1,0,0],[0,-1,0,0],[2,4,-3,0],[100,2,3,0]])
  for(const drag of [0,.5,1])for(const delta of [.0001,1/60,.266])add('velocity / drag / delta '+[velocity,drag,delta],{velocity,drag,delta});
 for(const flightWeight of [0,.00001,.00001001,1])for(const avoidance of [0,.00001,.00001001,1])for(const collisionSteps of [1,2,3,4])add('collision loop '+[flightWeight,avoidance,collisionSteps],{flightWeight,avoidance,collisionSteps});
 for(const arrivalPoint of [[.1,0,0,1],[.25,0,0,1],[1,0,0,1],[8,0,0,1]])for(const arrivalTimer of [-1,0,.1])for(const neighbors of [0,1,2])add('arrival / reselection '+[arrivalPoint,arrivalTimer,neighbors],{arrival:true,arrivalPoint,arrivalTimer,neighbors});
 for(const frames of [2,5,10])add('consecutive integrated frames '+frames,{frames,avoidance:1,collisionSteps:3,arrival:true,neighbors:2});
 add('suspended AI',{flightSuspended:true});add('callback updates speed cap',{flightMutation:1,velocity:[10,0,0,0]});add('collision changes live AI weight',{flightMutation:2,avoidance:1});
 add('unordered arrival timer',{arrival:true,arrivalTimerBits:0x7fc12345});add('unordered AI weight',{flightWeightBits:0x7fc12345});
 for(const velocity of [[0,0,0,1],[1,2,3,1]])add('SIMD W and non-finite speed '+velocity,{velocity});
 add('infinite speed',{velocityBits:[0x3f800000,0x7f800000,0,0]});
 for(const maximumSpeed of [0,-1,1])add('zero / negative / clamped speed '+maximumSpeed,{maximumSpeed,velocity:[10,0,0,0]});
 for(const flightWeightBits of [0x80000000,0x7f800000,0xff800000])add('signed zero / infinite AI weight '+flightWeightBits,{flightWeightBits});
 return cases;
}
