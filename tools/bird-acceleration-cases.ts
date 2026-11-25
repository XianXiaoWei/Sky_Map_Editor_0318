import type {BirdUpdateCase} from './bird-update-cases';
export function birdSteeringFlightChainCases():BirdUpdateCase[]{
 const cases:BirdUpdateCase[]=[],add=(label:string,c:Partial<BirdUpdateCase>)=>cases.push({label,flightChain:true,steeringFlightChain:true,...c});
 for(const aiTarget of [false,true])for(const arrival of [false,true])for(const radius of [0,1,-1])for(const targetDistance of [0,.2,1,4])add('distance / landing weight '+[aiTarget,arrival,radius,targetDistance],{aiTarget,arrival,radius,targetDistance});
 for(const flocking of [false,true])for(const flockWeight of [0,.3,1])for(const railDistance of [.5,.9899,.99,1])add('flock / rail '+[flocking,flockWeight,railDistance],{flocking,flockWeight,rail:true,railDistance});
 for(const followObject of [0,1,2])for(const followResult of [0,1,255])add('object follow '+[followObject,followResult],{followObject,followResult});
 for(const avoidance of [0,.00001,.00001001,1])for(const frames of [1,3])add('steering avoidance '+[avoidance,frames],{avoidance,frames,collisionSteps:3});
 for(const steeringMutation of [1,2,3])add('callback changes live state '+steeringMutation,{steeringMutation,flocking:true,rail:true});
 for(const debug of [false,true])for(const delta of [0,.00001,.016,.5])add('clock '+[debug,delta],{debug,delta,debugScale:2,flocking:true});
 for(const velocity of [[0,0,0,0],[0,1,0,0],[0,-1,0,0],[2,4,-3,0]])add('motion '+velocity,{velocity,avoidance:1,arrival:true});
 return cases;
}
