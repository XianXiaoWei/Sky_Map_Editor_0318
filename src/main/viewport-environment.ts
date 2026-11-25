import { initialAmbienceFields } from '../core/ambience-initial';
import { initialOriginalFogVolumeFields } from '../core/fog-volume-runtime';
import { describeEnvironment } from '../core/environment-storage';
import { EnvironmentRuntime, type EnvRuntimeNode, type EnvFrameClock } from '../core/environment-runtime';
import specs from '../../docs/environment-runtime.json';
import type { ObjectNode } from '../core/objects';
import type { EnvValue } from '../core/environment';
import { sampleAtmosphereRay, type SkyTints } from '../core/atmosphere';
import { buildOriginalAmbienceLookup } from '../core/ambience-lookup-runtime';
import { PreparedEnvironmentEventOwner } from '../core/environment-event-owner';
import { PreparedEnvironmentWindOwner } from '../core/environment-wind-owner';
import { gameScaledDelta } from '../core/material-dynamics';
import {deriveOriginalPointLightUniform} from '../core/point-light-runtime';
import {originalWaterRenderMatrix} from '../core/water-render-state';
import type {FlameSoundServices} from '../core/flame-runtime';
import { deriveOriginalAmbienceSun, originalAmbiencePlanetSphere, ORIGINAL_AMBIENCE_WHITE, type AmbienceSunMath } from '../core/ambience-sun-runtime';

const f=Math.fround;
// Shared original environment blend/fade owner and restored environment event
// bodies. TGCL factory registration and game camera modes are editor services.
export function createViewportEnvironment(nodes:ObjectNode[],sunMath?:AmbienceSunMath,options:{level?:string}={}) {
  const initial:Record<string,Record<string,EnvValue>>={...initialAmbienceFields([...ORIGINAL_AMBIENCE_WHITE],1).outputs,FogVolumeParams:initialOriginalFogVolumeFields(),CloudEnvParams:{undulationScale:0}};
  const names=Object.keys(initial), entries:EnvRuntimeNode[]=[];
  for(const node of nodes.filter(node=>node.className==='EnvNode')) {
    const info=describeEnvironment(node,nodes), region=info.region, registration=info.registration;
    if(!region?.complete||!registration)throw new Error(`地图空间环境 #${node.id} 不完整`);
    const values=Object.fromEntries(info.groups.filter(group=>names.includes(group.className)).map(group=>{
      if(!group.complete)throw new Error(`地图空间环境 #${node.id}.${group.className} 不完整`);
      return [group.className,Object.fromEntries(group.fields.map(field=>[field.name,field.value!]))];
    }));
    const common={id:node.id,layer:registration.layer,values,timing:{fadeIn:registration.fadeIn,fadeOut:registration.fadeOut,duration:registration.duration}};
    entries.push(region.kind==='clump'?{...common,markers:region.markers,falloff:registration.falloff}
      :{...common,enabled:registration.state.enabled,hull:region.hull!});
  }
  const runtime=new EnvironmentRuntime(names.map(name=>({name,output:initial[name],
    fields:specs.groups.find(group=>group.className===name)!.fields.map(field=>({name:field.name,type:field.tag as 6|8|10|11}))})),entries);
  const events=new PreparedEnvironmentEventOwner(runtime,nodes,options.level);events.tick();
  const winds=new PreparedEnvironmentWindOwner(events.objects,nodes);
  let candleOwner:{advance(clock:EnvFrameClock):void;dispose():void;sound?:FlameSoundServices}|undefined;
  let initialized=false,revision=0,frame=0,committedSphere:number[]|undefined;
  let frameSphere:number[]|undefined,framePriorSphere:number[]|undefined;
  const beginFrame=(eye:number[])=>{
    framePriorSphere=committedSphere?.slice()??originalAmbiencePlanetSphere(eye);
    frameSphere=originalAmbiencePlanetSphere(eye);committedSphere=frameSphere.slice();frame++;
  };
  let cachedKey='',cached:ReturnType<typeof sample>|undefined;
  const advance=(clock:EnvFrameClock)=>{const debug=clock.debugEnabled?clock.debugScale:1;if(debug===undefined)throw new Error('环境调试时间缩放未设置');events.advance(clock.delta,clock.timeScale,debug);winds.advance(gameScaledDelta(clock.delta,clock.timeScale,debug));candleOwner?.advance(clock);const delta=runtime.advance(clock);initialized=true;revision++;return delta;};
  const sample=(eye:number[])=> {
    // The scene owner advances its clock explicitly. Extra material/sky/cloud
    // samples and camera repaints consume the same timers and enabled state.
    if(!initialized)advance({delta:1/60,timeScale:1});
    const result=runtime.sample([...eye,1],false);
    const values=Object.fromEntries(result.variables.map(group=>[group.name,group.values]));
    const sun=values.AmbienceSun,sky=values.AmbienceSky,fog=values.AmbienceFog;
    const pointLight=deriveOriginalPointLightUniform(values.AmbiencePointLight.color as number[],Number(values.AmbiencePointLight.intensity)).color;
    const tints=Object.fromEntries(['tintBot','tintMidBot','tintMidMid','tintMidTop','tintTop'].map(name=>[name,sky[name]])) as unknown as SkyTints;
    const cheapTints=Object.fromEntries(['tintBot','tintMidBot','tintMidMid','tintMidTop','tintTop'].map(name=>[name,sky['cheapFog'+name[0].toUpperCase()+name.slice(1)]])) as unknown as SkyTints;
    const lookup=buildOriginalAmbienceLookup(tints,cheapTints,!!sky.cheapFogEnabled,sunMath?.expf),lut=lookup.lut;
    const sphere=frameSphere??originalAmbiencePlanetSphere(eye),priorSphere=framePriorSphere??sphere;
    const derived=deriveOriginalAmbienceSun({color:sun.sunColor as number[],intensity:Number(sun.sunInt),angleXZ:Number(sun.sunAngleXZ),angleY:Number(sun.sunAngleY),cheapFog:Number(sky.cheapFogEnabled),atmosphereDensity:Number(sky.atmosphereDensity),tints,eye:[...eye,1],planetSphere:priorSphere},sunMath);
    const direction=derived.direction.slice(0,3),{atmosphereSample,sunColor,atmosphereSunColor}=derived;
    // Sky-only hemispherical integral supplies the background fog tint. It is
    // separate from the sky-only preview cubemap; neither includes scene hits.
    const average=[0,0,0,1];
    for(let i=0;i<64;i++) {
      const up=(i+.5)/64,angle=i*2.399963229728653,radius=Math.sqrt(1-up*up);
      const color=sampleAtmosphereRay({eye:[...eye,1],direction:[Math.cos(angle)*radius,up,Math.sin(angle)*radius,0],planetSphere:priorSphere,
        sunDirection:[...direction,0],sunColor,averageSkyboxColor:[0,0,0,1],atmosphereSunColor,
        atmosphereDensity:Number(sky.atmosphereDensity),fogDensity:0,fogHeight:1,atmosphereSample,tintLookup:lut});
      for(let lane=0;lane<3;lane++)average[lane]+=color[lane]/64;
    }
    return {values,direction,sunColor,atmosphereSunColor,sphere,atmosphereSample,lut,lookupRows:lookup.rows,average,priorSphere,pointLight,
      uniforms:{u_pointLight:pointLight,u_sunDir:direction,u_sunColor:sunColor.slice(0,3),u_sunSizeIntMoonPhase:[sun.sunSize,sun.sunInt,sun.sunToMoon,sun.moonPhase],
        u_atmosphereDensity:sky.atmosphereDensity,u_fogDensityHeightDist:[fog.fogDensity,fog.fogHeight,fog.drawDistance],
        u_atmosphereSunColor:atmosphereSunColor.slice(0,3),u_atmosphereSample:atmosphereSample,u_averageSkyboxColor:average.slice(0,3),
        u_earthPosRad:sphere,u_eyePos:eye},
      scope:'Original environment event Update and EventBarn dispatch with prepared TGCL trigger IDs/current-map resource and editor camera predicate; original blend/fade, derived sun and regular/cheap lookup. Explicit frame boundary retains prior sphere for sun/sky-average and current sphere for renderer. Initial sphere and JS libm are editor services. Sky-only average; complete scene probe, weather/pointlight/water/bloom and native factory/lifecycle remain pending'};
  };
  const evaluate=(eye:number[])=>{const key=JSON.stringify([revision,frame,eye]);if(cached&&cachedKey===key)return cached;cached=sample(eye);cachedKey=JSON.stringify([revision,frame,eye]);return cached;};
  return Object.assign(evaluate,{advance,beginFrame,dispose:()=>events.dispose(()=>candleOwner?.dispose()),wind:(position:number[])=>winds.sample(position,events.globalWind()),setAvatarPosition:(position:number[])=>events.setAvatarPosition(position),trigger:(id:number,predicate=0)=>{events.trigger(id,predicate);revision++;},setControllerEnabled:(id:number,enabled:boolean)=>{const objectFound=events.setControllerEnabled(id,enabled),found=runtime.setControllerEnabled(id,enabled);if(found||objectFound)revision++;return found||objectFound;},setControllerTransform:(id:number,matrix:Uint8Array)=>{const objectFound=events.setControllerTransform(id,matrix),railFound=winds.setTransform(id,matrix),found=runtime.setControllerTransform(id,matrix);if(found||objectFound||railFound)revision++;return found||objectFound||railFound;},setEnabled:(id:number,enabled:boolean)=>{runtime.setEnabled(id,enabled);events.setControllerEnabled(id,enabled);revision++;},revision:()=>revision,frame:()=>frame,
    attachBlazeStatusServices:(factory:(objects:typeof events.objects)=>(id:number)=>boolean)=>{events.attachBlazeStatusServices(factory(events.objects));revision++;},
    attachBirdGuideServices:(factory:(objects:typeof events.objects)=>Parameters<typeof events.attachBirdGuideServices>[0])=>{events.attachBirdGuideServices(factory(events.objects));revision++;},
    attachBirdReleaseServices:(factory:(objects:typeof events.objects)=>Parameters<typeof events.attachBirdReleaseServices>[0])=>{events.attachBirdReleaseServices(factory(events.objects));revision++;},
    attachCandleOwner:(factory:(objects:typeof events.objects)=>NonNullable<typeof candleOwner>)=>{if(candleOwner)throw new Error('Candle owner already attached to this environment');candleOwner=factory(events.objects);if(candleOwner.sound)events.attachFlameServices(candleOwner.sound);revision++;},
    detachCandleOwner:(owner:NonNullable<typeof candleOwner>)=>{if(candleOwner!==owner)throw new Error('Candle owner differs from this environment');owner.dispose();if(owner.sound)events.detachFlameServices(owner.sound);candleOwner=undefined;revision++;},
    waterRenderStates:()=>nodes.filter(n=>n.className==='Water').map(node=>({nodeId:node.id,model:originalWaterRenderMatrix(events.objects.transform(node.id)),specScale:events.objects.memory.read8(events.objects.field(node.id,'sunShadowed'))?f(0.005):1})),
    oceanRenderEnabled:()=>events.weatherInfo().oceanRender,
    flowerPatchStates:()=>nodes.filter(n=>n.className==='FlowerPatch').map(node=>({nodeId:node.id,bytes:new Uint8Array(events.objects.require(node.id).bytes)})),
    setEventPaused:(id:number,paused:boolean)=>events.setEventPaused(id,paused),
    setFloatValues:(values:{id:number;bits:number}[])=>{for(const value of values){if(!Number.isInteger(value.bits)||value.bits<0||value.bits>0xffffffff)throw new Error('环境 Float 快照必须为 uint32 原位模式');const e=events.objects.entries.get(value.id);if(e?.node.className==='Float')events.objects.memory.write32(e.pointer+16n,value.bits);}revision++;},
    info:()=>({revision,frame,events:events.info(),objects:events.objects.info(),effectPools:events.objects.effectPoolInfo(),creaturePools:events.objects.creaturePoolInfo(),weather:events.weatherInfo(),wind:winds.info(),occlusion:events.occlusionInfo(),nature:events.natureInfo(),registrations:events.registrations.slice(),registrationHandles:events.registrationHandles.map(h=>({...h,pointer:h.pointer.toString()})),nodes:runtime.nodes.map((node,index)=>({id:node.id,enabled:node.markers?node.markers[0].enabled:node.enabled,states:runtime.states.map(states=>({...states[index]}))})),scope:'Shared environment, 17 creature and five candle/flame parent constructors; native FlowerPatch/Water/CandleObject and creature factory slots, seven environment/weather bodies plus dependency-satisfied creature and Flame events through original EventBarn. Prepared allocation/metadata/trigger IDs/resource/camera services; candle rendering/lit/wax, creature AI/skinning/draw, unimplemented class updates, occlusion/weather rendering and full native startup remain pending'})});
}

// Clear-background specialization of FogUpsample0.frag's spherical atmosphere
// and fog equations. Foreground/cloud/history composition is not included.
export const viewportSkyVertex=`#version 450
layout(location=0) in vec2 a_position;
layout(location=0) out vec3 ray;
uniform mat4 u_camMat;
uniform vec2 u_projectionScale;
void main(){ray=mat3(u_camMat)*vec3(a_position*u_projectionScale,-1);gl_Position=vec4(a_position.x,-a_position.y,1,1);}`;
export const viewportSkyFragment=`#version 450
layout(location=0) in vec3 ray;
layout(location=0) out vec4 color;
uniform vec3 u_eyePos,u_sunDir,u_sunColor,u_atmosphereSunColor,u_averageSkyboxColor;
uniform vec4 u_earthPosRad,u_sunSizeIntMoonPhase;
uniform vec3 u_fogDensityHeightDist;
uniform float u_atmosphereDensity,u_atmosphereSample,u_exposure;
uniform bool u_viewportHDR;
uniform sampler2D u_atmosphereTex;
void main(){
 vec3 direction=normalize(ray);float edot=dot(direction,-u_sunDir);
 float distance=length(u_earthPosRad.xyz-u_eyePos);
 vec3 traced=u_eyePos+max(15000.,sqrt(max(0.,distance*distance-u_earthPosRad.w*u_earthPosRad.w)))*direction;
 vec3 pos=u_eyePos+25000.*direction;pos.y=length(traced-u_earthPosRad.xyz)-u_earthPosRad.w;
 vec3 diff=pos-u_eyePos;diff.y=(diff.y<0.?-1.:1.)*max(.1,abs(diff.y));
 vec2 rate=.000901684/vec2(1.,u_fogDensityHeightDist.y);
 vec2 scale=.000832548*vec2(u_atmosphereDensity,u_fogDensityHeightDist.x)/rate;
 vec2 depths=min(vec2(64000.),(length(diff)/diff.y)*scale*(exp2(-rate*u_eyePos.y)-exp2(-rate*(diff.y+u_eyePos.y))));
 float square=edot*edot,phase=square*.2+edot*.4+.4;
 float a=1.-exp2(-5.*depths.x),fog=1.-exp2(-20.*depths.y);
 vec3 tint=texture(u_atmosphereTex,vec2(exp2(-phase*depths.x*u_atmosphereSample*.15),0)).rgb;
 float halo=1./(200.+2000.*u_sunSizeIntMoonPhase.z);
 vec3 atmosphere=u_atmosphereSunColor*tint*(depths.x*(1.+square))*(phase*a);
 vec3 fogColor=(u_averageSkyboxColor+u_sunColor*max(square*edot-u_sunSizeIntMoonPhase.z,0.))*mix(3333.3*depths.y*(halo/(halo-(edot-1.))),phase,fog);
 vec3 radiance=mix(atmosphere,fogColor,fog);
 if(u_viewportHDR){color=vec4(radiance*.5,0);return;}
 vec3 hdr=radiance*.5;
 // Display the background with exposure and the game's reciprocal HDR curve.
 vec3 mapped=1.-1./(1.+max(vec3(.0001),hdr*u_exposure));
 vec3 display=mix(12.92*mapped,1.055*pow(mapped,vec3(1./2.4))-.055,greaterThan(mapped,vec3(.0031308)));
 color=vec4(display,1);
}`;
