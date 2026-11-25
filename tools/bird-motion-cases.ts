import type {BirdUpdateCase} from './bird-update-cases';
import {birdSteeringFlightChainCases} from './bird-acceleration-cases';
export function birdMotionChainCases(flight=false):BirdUpdateCase[]{
 const cases:BirdUpdateCase[]=[],add=(label:string,c:Partial<BirdUpdateCase>)=>cases.push({label,motionChain:true,...(flight?{flightChain:true}:{}),...c});
 for(const velocity of [[0,0,0,0],[1,0,2,0],[0,1,0,0],[0,-1,0,0],[2,4,-3,0]])for(const motionWeight of [0,.5,1])for(const motionBank of [0,15,-30])add('motion basis '+[velocity,motionWeight,motionBank],{velocity,motionWeight,motionBank});
 for(const motionSuspended of [false,true])for(const motionDeferred of [false,true])add('suspend / deferred '+[motionSuspended,motionDeferred],{motionSuspended,motionDeferred});
 for(const motionMutation of [1,2,3])add('callback changes '+motionMutation,{motionMutation});
 for(const motionDirection of [[0,0,0,0],[0,0,1,0],[0,1,0,0],[1,2,3,1]])add('interpolation output '+motionDirection,{motionDirection});
 for(const frames of [2,5])add('consecutive motion '+frames,{frames,motionHorizontal:true});
 return cases;
}
export function birdSteeringMotionChainCases():BirdUpdateCase[]{
 const cases=[...birdSteeringFlightChainCases().map(c=>({...c,label:'steering/motion '+c.label,motionChain:true})),...birdMotionChainCases(true).map(c=>({...c,label:'motion/steering '+c.label,steeringFlightChain:true}))];
 for(const motionMutation of [1,2,3])for(const steeringMutation of [1,2,3])for(const frames of [1,3])cases.push({label:'combined callback '+[motionMutation,steeringMutation,frames],motionChain:true,flightChain:true,steeringFlightChain:true,motionMutation,steeringMutation,frames,flocking:true,rail:true});
 return cases;
}
