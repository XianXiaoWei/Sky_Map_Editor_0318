import type {BirdUpdateCase} from './bird-update-cases';
export interface BirdFollowChainInput {followChain?:boolean;followState?:number;followAttempts?:number;followCountdown?:number;followElapsed?:number;followNearTimer?:number;followEmitterTimer?:number;followPlayerPosition?:number[];followProjected?:number[];followTargetPosition?:number[];followOldPosition?:number[];}
export function birdFollowChainCases():BirdUpdateCase[]{
 const cases:BirdUpdateCase[]=[],add=(label:string,c:Partial<BirdUpdateCase>={})=>cases.push({label:'object follow AI chain '+label,followChain:true,railChain:true,forceChain:true,steeringFlightChain:true,flightChain:true,motionChain:true,aiTarget:true,followObject:1,railListCount:0,random:0,...c});
 for(const followState of [0,1,2])for(const followAttempts of [0,2,3])for(const frames of [1,3])add('state/attempts/frames '+[followState,followAttempts,frames],{followState,followAttempts,frames,followElapsed:31});
 for(const followCountdown of [-10,-1,0,.01,10])for(const followElapsed of [0,30,30.001])add('timers '+[followCountdown,followElapsed],{followState:0,followCountdown,followElapsed,frames:3});
 for(const followPlayerPosition of [[0,0,0,1],[0,0,3,1],[0,0,-3,1],[1,2,3,1],[1.5,0,0,1]])for(const followProjected of [[0,0,0,1],[6,0,0,1],[20,0,0,1]])add('player/target release '+[followPlayerPosition,followProjected],{followState:0,followPlayerPosition,followProjected,followCountdown:10,followEmitterTimer:-1});
 for(const followNearTimer of [0,.99,1])for(const followAttempts of [0,2])add('orbit completion '+[followNearTimer,followAttempts],{followState:0,followElapsed:31,followCountdown:-1,followNearTimer,followAttempts,followPlayerPosition:[1,0,0,1],frames:10});
 for(const kind of [0,1,2,3,4])add('Critter kind '+kind,{kind,followState:0,followCountdown:10,followEmitterTimer:-1,followPlayerPosition:[0,0,3,1],frames:3});
 for(const forcePlayers of [0,2])for(const forceNeighbors of [0,3])add('target/guide/flock fallthrough '+[forcePlayers,forceNeighbors],{followState:1,forcePlayers,forceNeighbors,frames:10});
 add('changed target resets attempts',{followOldPosition:[10,0,0,1],followAttempts:3,followElapsed:31,frames:3});
 add('actual rail overrides follow',{railListCount:1,followState:0,frames:3});
 add('suspended AI still submits Model transform',{motionSuspended:true});
 add('absent target',{aiTarget:false,followState:0,followCountdown:10});
 return cases;
}
