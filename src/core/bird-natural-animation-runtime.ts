import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {resourceAnimationNameHash} from './resource-animation-list';
import {natureArithmetic,type NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatValue as value} from './object-numeric-runtime';

/** Whole Animation.FindSequence 0x1000962f0. Null pack means unrestricted
 * hash zero; an empty pack string hashes to the FNV offset basis. */
export function findOriginalBirdAnimationSequence(m:ModelBakeMemory,registry:bigint,name:string,required:number,pack:string|undefined){
 const nameHash=BigInt('0x'+resourceAnimationNameHash(name)),packHash=pack===undefined?0n:BigInt('0x'+resourceAnimationNameHash(pack)),count=m.read32(registry)|0;
 for(let i=0;i<count;i++){const sequence=m.read64(registry+8n+BigInt(i)*8n);if(m.read64(sequence+8n)!==nameHash)continue;const restriction=m.read64(sequence+16n);if(!restriction||restriction===packHash)return i;}
 if(required&255)throw new NativeObjectFoundationFailure('AnimationInstance.cpp',722,4,'id != -1');return -1;
}
export interface BirdNaturalAnimationServices {
 registry:bigint;
 /** Original named action lookup 0x100095690; false means optional. */
 findAction(animation:bigint,name:string,required:false):bigint;
 /** Original PlaySequenceByIndex 0x1000968e0, already recovered separately.
  * The live sequence/resource/request owner must supply its actual bindings. */
 playSequence(animation:bigint,index:number,flags:0,weight:1,speed:1):void;
 arithmetic?:NatureArithmeticServices;
}
/** Whole Animation.IsSequenceValid 0x100096410. Empty sequences are valid;
 * step count is read again after the optional action lookup callback. */
export function isOriginalBirdAnimationSequenceValid(m:ModelBakeMemory,animation:bigint,index:number,s:Pick<BirdNaturalAnimationServices,'registry'|'findAction'>){
 index|=0;if(index<0||(m.read32(s.registry)|0)<=index)throw new NativeObjectFoundationFailure('AnimationInstance.cpp',730,3,'idx >= 0 && idx < animationSequenceList.sequenceCount');
 const sequence=m.read64(s.registry+8n+BigInt(index)*8n);
 for(let i=0;i<(m.read32(sequence+24n)|0);i++){
  const step=m.read64(sequence+32n+BigInt(i)*8n);
  if(!s.findAction(animation,m.string(m.read64(step+8n)),false))return false;
 }
 return true;
}
/** Whole BirdV2 takeoff-sequence consumer 0x1001a3980 (descriptive name).
 * This is driven by the bird's actual AI fields; it does not invent AI state
 * or automatically drive the editor's manual single-action pose preview. */
export function updateOriginalBirdTakeoffAnimation(m:ModelBakeMemory,bird:bigint,ai:bigint,animation:bigint,s:BirdNaturalAnimationServices){
 if(m.bytes(ai+0x84n,1)[0])return;
 const weight=m.read32(ai+0x24n);let takeoff=false;
 if(m.bytes(ai+0x21n,1)[0])takeoff=(0.5>value(weight)&&(m.read32(animation+12n)|0)<=0)||!m.bytes(bird+0x3c8n,1)[0];
 if(!takeoff){
  if(!(1>value(weight)))return;
  const difference=natureArithmetic(s.arithmetic).add(m.read32(ai+0x28n),0xbf800000)&0x7fffffff;
  if(!(value(difference)<=value(0x3727c5ac)))return;
 }
 const mesh=m.read64(m.read64(bird+0x78n)+16n),string=mesh+0x58n,pack=m.string(m.bytes(string,1)[0]&1?m.read64(mesh+0x68n):string+1n);
 const index=findOriginalBirdAnimationSequence(m,s.registry,takeoff?'Takeoff':'TakeoffShort',0,pack);
 if(index>=0&&isOriginalBirdAnimationSequenceValid(m,animation,index,s))s.playSequence(animation,index,0,1,1);
 m.write8(bird+0x3c8n,Number(takeoff));
}
