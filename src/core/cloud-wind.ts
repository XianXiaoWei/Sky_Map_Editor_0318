import {gameScaledDelta} from './material-dynamics';
const f=Math.fround,mul=(a:number,b:number)=>f(f(a)*f(b)),add=(a:number,b:number)=>f(f(a)+f(b));
export const CLOUD_WIND_SPEED=f(.4); // Original tweak 0x100c95824.
export interface CloudWindState {move:number[];scroll:number[];time:number;}
export function initialCloudWind():CloudWindState{return {move:[0,0,0,0],scroll:[0,0,0,0],time:0};}
// CloudBarn::Update 0x100212510..0x1002126f7. Wind is the explicit
// EnvironmentForces sample at the camera. xyz length excludes scratch W.
// Unlike terrain texture scroll, this is world distance and does not wrap.
export function stepCloudWind(state:CloudWindState,input:{wind:number[];delta:number;timeScale:number;time:number;debugScale?:number;speed?:number;enabled:boolean}):CloudWindState{
 if(state.move.length!==4||state.scroll.length!==4||input.wind.length!==4||![...state.move,...state.scroll,...input.wind,input.time,input.speed??CLOUD_WIND_SPEED].every(Number.isFinite))throw new Error('原云风动态输入无效');
 const delta=gameScaledDelta(input.delta,input.timeScale,input.debugScale),time=f(input.time);
 if(!input.enabled)return {...state,move:[...state.move],scroll:[...state.scroll],time};
 const wind=input.wind.map(f),squares=wind.map(v=>mul(v,v)),length=f(Math.sqrt(add(squares[2],add(squares[0],squares[1])))),amount=mul(delta,input.speed??CLOUD_WIND_SPEED);
 const moved=[add(wind[0],10),add(wind[1],length),wind[2],wind[3]],move=moved.map((v,i)=>mul(v,i===3?0:amount)),scroll=state.scroll.map((v,i)=>add(v,move[i]));
 return {move,scroll,time};
}
