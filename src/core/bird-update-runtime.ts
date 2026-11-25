import type {ModelBakeMemory} from './model-baked-runtime';
import {natureArithmetic,type NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import evidence from '../../docs/bird-update-native.json';
const c=evidence.constants,one=0x3f800000;
export interface BirdUpdateGlobals {debugEnabled:boolean;debugScaleBits:number;cameraCounter:number;drawDebug:boolean;}
export interface BirdUpdateServices {
 globals:BirdUpdateGlobals;arithmetic?:NatureArithmeticServices;
 setModelEnabled(model:bigint,enabled:number):void;
 objectEnabled(object:bigint):number;
 random():number;
 validateTarget(ai:bigint,timer:bigint):number;
 requireAvatar(barn:bigint):bigint;
 targetLost(bird:bigint,avatar:bigint):void;
 cameraPosition(camera:bigint):Uint8Array;
 updateAi(bird:bigint,ai:bigint,params:bigint,position:bigint,game:bigint,scene:bigint,deltaBits:number):number;
 updateMovement(bird:bigint,ai:bigint,animation:bigint,position:bigint,turnBits:number,deltaBits:number):void;
 transform(bird:bigint):Uint8Array;
 updateAnimation(bird:bigint,ai:bigint,animation:bigint):void;
 emitWake(owner:bigint,position:bigint,radiusBits:number,enabled:number):void;
 updateGuide(bird:bigint,ai:bigint,position:bigint,avatarBarn:bigint,birdBarn:bigint):void;
 updateAiPost(ai:bigint,motion:Uint8Array,timer:bigint,avatarBarn:bigint,deltaBits:number):void;
 updateEffects(bird:bigint,animation:bigint,position:bigint,avatarBarn:bigint):void;
 updateWind(bird:bigint):void;
 updateAttached(bird:bigint,owner:bigint,effects:bigint,deltaBits:number):void;
 updateAttachedTransform(bird:bigint,position:bigint):void;
 updatePickup(bird:bigint,position:bigint,avatarBarn:bigint,owner:bigint,timer:bigint,deltaBits:number):void;
 debugDraw(bird:bigint,position:bigint):void;
}
/** Whole ordinary BirdV2.Update. Target callbacks and live Model/clock fields
 * are re-read in native order; bird and manta params remain instance-owned. */
export function updateOriginalBirdV2(m:ModelBakeMemory,p:bigint,game:bigint,s:BirdUpdateServices){
 const a=natureArithmetic(s.arithmetic),g=s.globals;
 s.setModelEnabled(m.read64(p+0x3a0n),m.bytes(p+0xd0n,1)[0]);
 if(!m.bytes(p+0xd0n,1)[0])return;
 const time=m.read64(game+0x160n);
 const delta=a.min(bits(c.maximumDelta),a.max(bits(c.minimumDelta),a.mul(a.mul(g.debugEnabled?g.debugScaleBits:one,m.read32(time+32n)),m.read32(time+20n))));
 const timer=p+0x50cn,ai=p+0xe0n,position=p+16n,target=m.read64(p+0xf8n);
 if(target&&!(s.objectEnabled(target)&255)){
  let delay=0;
  if(value(m.read32(p+0x104n))>c.targetThreshold){const random=a.mul(bits(s.random()|0),bits(c.randomScale)),r=a.add(random,a.mul(a.sub(one,random),0));delay=a.mul(r,a.mul(r,bits(c.targetDelay)));}
  m.write32(timer,delay);m.write64(p+0xf8n,0n);
 }
 const remaining=a.sub(m.read32(timer),delta);m.write32(timer,remaining);
 if(value(remaining)<0&&!(s.validateTarget(ai,timer)&255))s.targetLost(p,s.requireAvatar(m.read64(game+0x280n)));
 let params=m.read64(p+120n),culled=false;
 const distance=(point:Uint8Array)=>{
  const v=new DataView(point.buffer,point.byteOffset,16),squares=[0,4,8].map(i=>{const d=a.sub(m.read32(position+BigInt(i)),v.getUint32(i,true));return a.mul(d,d);});return a.add(squares[2],a.add(squares[0],squares[1]));
 };
 if(m.bytes(params+0x3dn,1)[0]&&!m.bytes(p+0x71n,1)[0]&&((m.read32(params+48n)-1)>>>0)>=3){
  const camera=m.read64(game+0x70n);g.cameraCounter=(g.cameraCounter+1)>>>0;
  if(((g.cameraCounter+m.read32(p+0x74n))>>>0)%10!==0){
   const d=distance(s.cameraPosition(camera));culled=!(c.cullingDistanceSquared>value(d));
   if(!culled)params=m.read64(p+120n);
  }
 }
 if(!culled){
  const turn=s.updateAi(p,ai,params,position,game,m.read64(game+0x138n),delta);
  const animation=m.read64(m.read64(p+0x3a0n)+104n),clock=m.read64(game+0x160n);
  const movementDelta=a.min(bits(c.maximumDelta),a.max(bits(c.minimumDelta),a.mul(a.mul(g.debugEnabled?g.debugScaleBits:one,m.read32(clock+32n)),m.read32(clock+40n))));
  s.updateMovement(p,ai,animation,position,turn,movementDelta);
  const matrix=s.transform(p),v=new DataView(matrix.buffer,matrix.byteOffset,64);
  for(let i=0;i<16;i++)if((v.getUint32(i*4,true)&0x7fffffff)>0x7f800000)throw new NativeObjectFoundationFailure('BirdV2.cpp',1750,3,'!isNan( GetTransform() )');
  s.updateAnimation(p,ai,animation);
  if(c.wakeDistanceSquared>value(distance(s.cameraPosition(m.read64(game+0x70n)))))s.emitWake(m.read64(game+0x4d0n),position,a.mul(m.read32(m.read64(p+120n)+24n),bits(c.wakeRadiusScale)),1);
  s.updateGuide(p,ai,position,m.read64(game+0x280n),m.read64(game+0x380n));
  // Original scratch initializes +0x10..0x6c. Its four trailing padding
  // bytes belong to the caller; the service receives only written bytes.
  const motion=m.bytes(p+16n,92).slice();
  s.updateAiPost(ai,motion,timer,m.read64(game+0x280n),delta);
  s.updateEffects(p,animation,position,m.read64(game+0x280n));s.updateWind(p);
  if(m.bytes(p+0x71n,1)[0]){s.updateAttached(p,m.read64(game+0x3b8n),m.read64(game+0x450n),delta);s.updateAttachedTransform(p,position);}
 }
 s.updatePickup(p,position,m.read64(game+0x280n),m.read64(game+0x3c8n),timer,delta);
 if(g.drawDebug)s.debugDraw(p,position);
}
