const f=Math.fround,mul=(a:number,b:number)=>f(f(a)*f(b));
export const GAME_SHADER_TIME_PERIOD=43200;
export const GAME_DELTA_MIN=f(.0001),GAME_DELTA_MAX=f(.266);
export interface MaterialDynamicsState {time:number;scrolls:number[][];}
export interface MaterialDynamicsStep {delta:number;timeScale:number;debugScale?:number;wind:number[];scrollScale:number;}
export const initialMaterialDynamics=():MaterialDynamicsState=>({time:0,scrolls:[[0,0,0,0],[0,0,0,0],[0,0,0,0]]});
// GameTime 0x100387aa8..0x100387aed and EnvironmentForces
// 0x100324ad5..0x100324aff. Inputs are raw/fixed frame delta and explicit scales.
export function gameScaledDelta(delta:number,timeScale:number,debugScale=1){
 if(![delta,timeScale,debugScale].every(Number.isFinite))throw new Error('原游戏帧时间/缩放无效');
 return Math.min(GAME_DELTA_MAX,Math.max(GAME_DELTA_MIN,mul(delta,mul(debugScale,timeScale))));
}
export function gameShaderTime(time:number,delta:number){
 if(!Number.isFinite(time)||time<0||!Number.isFinite(delta))throw new Error('原 shader 时间无效');
 const next=f(f(time)+f(delta));return next>GAME_SHADER_TIME_PERIOD?f(next%GAME_SHADER_TIME_PERIOD):next;
}
// EnvironmentForces 0x100328087..0x1003281e9 (per-object), duplicated in
// 0x100327438..0x1003275b9 (global). Keep each original multiply/add boundary.
// Sampling the full field, rails, localized Wind objects and noise remains a
// separate caller responsibility; this function never invents their result.
export function materialWindScroll(scrolls:number[][],wind:number[],delta:number,scale:number){
 if(scrolls.length!==3||scrolls.some(v=>v.length!==4||!v.every(Number.isFinite))||wind.length!==4||!wind.every(Number.isFinite)||![delta,scale].every(Number.isFinite))throw new Error('原风滚动输入无效');
 const dt=mul(delta,scale),factors=[[f(.4),.03759765625],[f(.8),.14453125],[f(.6),.05078125]],drift=[[f(.015039063058793545),0,0,0],[-.0288013257086277,0,-.05012752488255501,0],[-.010174672119319439,0,.017580492421984673,0]];
 return scrolls.map((scroll,layer)=>scroll.map((value,lane)=>{
  const velocity=mul(mul(wind[lane],lane===3?0:factors[layer][0]),lane===3?0:factors[layer][1]);
  const moved=f(f(f(value)-mul(dt,velocity))+mul(dt,drift[layer][lane]));
  return lane<3?f(moved-f(Math.floor(moved))):moved;
 }));
}
export function stepMaterialDynamics(state:MaterialDynamicsState,input:MaterialDynamicsStep):MaterialDynamicsState{
 const delta=gameScaledDelta(input.delta,input.timeScale,input.debugScale);
 return {time:gameShaderTime(state.time,delta),scrolls:materialWindScroll(state.scrolls,input.wind,delta,input.scrollScale)};
}
