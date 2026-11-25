import type {BirdUpdateCase} from './bird-update-cases';
export interface BirdRailChainInput {railChain?:boolean;railListCount?:number;railListCurrent?:number;railListLooped?:number;railPointStart?:number[];railPointEnd?:number[];railNearestPosition?:number[];railSamplePosition?:number[];railArcDistance?:number;railSampleTime?:number;railCastFailure?:boolean;railCallbackMutation?:number;}
export function birdRailChainCases():BirdUpdateCase[]{
 const cases:BirdUpdateCase[]=[],add=(label:string,c:Partial<BirdUpdateCase>={})=>cases.push({label:'rail AI chain '+label,railChain:true,forceChain:true,steeringFlightChain:true,flightChain:true,motionChain:true,aiTarget:true,random:0,...c});
 for(const railListCount of [0,1,3])for(const railListCurrent of [-1,0,1])for(const railListLooped of [0,1,255])add('selection/current/open '+[railListCount,railListCurrent,railListLooped],{railListCount,railListCurrent,railListLooped});
 for(const random of [0,1,42000000,42010000,0x40000000,0x7fffffff,0xffffffff])for(const frames of [1,3])add('random/carry '+[random,frames],{random,frames,railListCount:3});
 for(const railDistance of [0,.97999,.98,1])for(const frames of [1,3,10])add('end-of-rail '+[railDistance,frames],{railDistance,frames,forceNeighbors:3,forcePlayers:2});
 for(const velocity of [[0,0,0,0],[0,.5,0,0],[1,0,2,0],[-1,0,-2,0],[2,1,3,0]])for(const railPointStart of [[1,0,2,1],[0,0,0,1],[-1,0,-2,1],[100,0,0,1]])add('speed/distance/headings '+[velocity,railPointStart],{velocity,railPointStart,railListCount:3});
 for(const railNearestPosition of [[0,0,0,1],[.5,0,0,1],[.50001,0,0,1],[3,0,6,1]])for(const forceNeighbors of [0,3])add('corridor/flocking '+[railNearestPosition,forceNeighbors],{railNearestPosition,forceNeighbors,frames:3});
 for(const railSamplePosition of [[0,0,0,1],[1,0,2,1],[1,2,3,0]])add('sample/W '+railSamplePosition,{railSamplePosition,frames:3});
 for(const railCallbackMutation of [1,2,3,4,5,6])add('live callback mutation '+railCallbackMutation,{railCallbackMutation,railListCount:3,frames:3});
 add('cast assertion',{railCastFailure:true});add('absent list target chain',{railListCount:0,forcePlayers:2,forceNeighbors:3});add('suspended',{motionSuspended:true});
 return cases;
}
