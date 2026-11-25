import type {BirdUpdateCase} from './bird-update-cases';
export interface BirdForceCaseInput {
 forceChain?:boolean;forceNeighbors?:number;forceNeighborTypes?:('actor'|'avatar')[];forceNeighborPosition?:number[];forceNeighborVelocity?:number[];forceNeighborWeight?:number;forceCache?:number;
 forcePlayers?:number;forcePlayerPosition?:number[];forcePlayerVelocity?:number[];forcePlayerGuiding?:number;forceLandingAllowed?:number;forceLandingState?:number;forceRayHit?:boolean;forceRayPosition?:number[];forceRayNormal?:number[];forceAvoidObject?:boolean;forceMutation?:number;forceWeights?:number[];forceTargetPosition?:number[];
}
export function birdForceChainCases():BirdUpdateCase[]{
 const cases:BirdUpdateCase[]=[],add=(label:string,c:Partial<BirdUpdateCase>={})=>cases.push({label:'force AI '+label,forceChain:true,steeringFlightChain:true,flightChain:true,motionChain:true,aiTarget:true,...c});
 for(const arrival of [false,true])for(const forceNeighbors of [0,1,3])for(const forcePlayers of [0,1,3])add('target / neighbors / players '+[arrival,forceNeighbors,forcePlayers],{arrival,forceNeighbors,forcePlayers});
 for(const forceLandingAllowed of [0,1])for(const forceRayHit of [false,true])for(const forceRayNormal of [[0,1,0,0],[0,.5,0,0],[0,.50001,0,0],[1,0,0,0]])add('landing probe '+[forceLandingAllowed,forceRayHit,forceRayNormal],{forceLandingAllowed,forceRayHit,forceRayNormal,forceRayPosition:[1,2,3,1]});
 for(const forceAvoidObject of [false,true])for(const forceNeighbors of [0,3])for(const forceNeighborTypes of [['actor'],['avatar'],['actor','avatar']] as ('actor'|'avatar')[][])add('actual flock / flee '+[forceAvoidObject,forceNeighbors,forceNeighborTypes],{forceAvoidObject,forceNeighbors,forceNeighborTypes});
 for(const forcePlayerPosition of [[2,0,0,1],[-2,0,0,1],[25,0,0,1],[24.99,0,0,1],[0,0,0,1],[3,4,0,1]])for(const arrival of [false,true])add('player geometry '+[forcePlayerPosition,arrival],{forcePlayers:2,forcePlayerPosition,arrival,forcePlayerVelocity:[1,2,3,0]});
 for(const delta of [0,.00001,.0009999,.001,.001001,.016,.5])for(const arrival of [false,true])add('guide low delta '+[delta,arrival],{delta,arrival,forcePlayers:3});
 for(const forceCache of [-1,0,1,8])for(const frames of [1,3,10])add('consecutive query cache '+[forceCache,frames],{forceCache,frames,forceNeighbors:3,forcePlayers:2});
 for(const forceMutation of [1,2,3,4,5,6])add('live callback '+forceMutation,{forceMutation,forceLandingAllowed:1,forceRayHit:true,forceNeighbors:3,forcePlayers:2,frames:3});
 for(const random of [0,1,0x40000000,0x7fffffff,0xffffffff])add('native wander random '+random,{random,forceNeighbors:1,forcePlayers:1,forceLandingAllowed:1});
 for(const forceWeights of [[0,0,0,0,0,0,0],[1,1,1,1,1,1,1],[-1,-1,-1,-1,-1,-1,-1],[.00001,.00001,.00001,.00001,.00001,.00001,.00001],[.0000101,.0000101,.0000101,.0000101,.0000101,.0000101,.0000101]])add('weight boundaries '+forceWeights,{forceWeights,forceNeighbors:3,forcePlayers:2,forceAvoidObject:true});
 for(const forceNeighborWeight of [0,-1,.5,2])add('neighbor weighted forces '+forceNeighborWeight,{forceNeighbors:3,forceNeighborWeight});
 for(const velocity of [[0,0,0,0],[0,1,0,0],[0,-1,0,0],[2,4,-3,0]])add('motion speed '+velocity,{velocity,forcePlayers:2,forceNeighbors:3,forceAvoidObject:true,forceLandingAllowed:1});
 add('query skip player guiding',{forcePlayers:3,forcePlayerGuiding:0});add('suspended',{motionSuspended:true,forcePlayers:2,forceNeighbors:3});
 for(const forceLandingState of [2,255])for(const forceLandingAllowed of [0,1,255])add('raw landing bytes '+[forceLandingState,forceLandingAllowed],{forceLandingState,forceLandingAllowed,forcePlayers:2,forceNeighbors:3});
 add('target absent',{aiTarget:false,forcePlayers:2,forceNeighbors:3});
 return cases;
}
