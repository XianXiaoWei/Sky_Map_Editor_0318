import type {ObjectNode} from './objects';
import {restoredCreatureEventClasses} from './nature-event-runtime';
import {restoredSceneEventClasses} from './scene-event-construction';
export const restoredEnvironmentEventClasses=['SetEnvDefault','SetEnvHull','SetWind','SetRainParams','SetOceanRender','SetEmitterFlowRail','DropOcclusion'] as const;
export const restoredNatureEventClasses=[...restoredCreatureEventClasses,'SetFlame','OnFlame','SetFlameOccIntensity','OnBlaze'] as const;
// Delay/Enable keep their existing object-playback inspector entry. The shared
// owner can also dispatch them when they belong to a scene event graph.
export const isSharedRuntimeEvent=(name:string)=>([...restoredEnvironmentEventClasses,...restoredNatureEventClasses,...restoredSceneEventClasses.filter(n=>n!=='Delay'&&n!=='Enable')] as readonly string[]).includes(name);
export const isRestoredEnvironmentEvent=(name:string):name is typeof restoredEnvironmentEventClasses[number]=>(restoredEnvironmentEventClasses as readonly string[]).includes(name);
export const isContinuousEnvironmentEvent=(node:ObjectNode)=>node.className==='DropOcclusion'||node.className==='SetWind'&&Number(node.fields.find(f=>f.name==='fireOnce')?.value??1)===0||node.className==='SetEmitterFlowRail'&&Number(node.fields.find(f=>f.name==='firstFrameOnly')?.value??0)===0;
