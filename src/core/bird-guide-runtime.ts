import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {natureArithmetic,type CreatureEventServices} from './nature-event-runtime';
import {numericFloatValue as value} from './object-numeric-runtime';

/** AvatarBarn.GetPlayer 0x1001031d0 and Avatar.IsActive 0x1000fe050.
 * These consume the real AvatarBarn storage; they do not create players. */
export function originalBirdGuideAvatarSlot(owner:bigint,index:number){return owner+0x20n+BigInt(index|0)*0x2230n;}
export function originalBirdGuideAvatarActive(m:ModelBakeMemory,avatar:bigint){return m.bytes(avatar+0x21b2n,1)[0];}
/** Versioned guide reference consumers 0x100133f30 / 0x100133b50.
 * A stale generation is a null guide. Detaching retains the original dirty
 * counter updates, timeout and unrelated reference bytes. */
export function getOriginalBirdGuide(m:ModelBakeMemory,reference:bigint){
 const guide=m.read64(reference+16n);
 return guide&&m.read32(guide+0xc4n)===m.read32(reference+24n)?guide:0n;
}
export function setOriginalBirdGuide(m:ModelBakeMemory,reference:bigint,guide:bigint){
 m.write32(reference+24n,0);m.write64(reference+16n,guide);
 if(guide)m.write32(reference+24n,m.read32(guide+0xc4n));
 m.write8(reference+60n,0);
 const revision=(m.read32(reference+44n)+1)>>>0;m.write32(reference+44n,revision);m.write32(reference+40n,revision);
 m.write64(reference+32n,0x40f00000n);
}
export interface BirdGuideDetachServices {
 /** Virtual Avatar.GetEnabled; IsActive is independently tested first. */
 avatarEnabled(avatar:bigint):number;
 start(event:bigint):void;
}
/** Whole DetachFromBirdGuides.OnEnabled 0x1001aa480. Visits all 16
 * original Avatar slots and all four live guide pointers. It does not clear
 * the bird's guide-active flag or detach inactive/disabled players. */
export function enableOriginalDetachFromBirdGuides(m:ModelBakeMemory,event:bigint,game:bigint,s:BirdGuideDetachServices){
 const bird=m.read64(event+56n);
 if(!bird)throw new NativeObjectFoundationFailure('BirdV2.cpp',2116,3,'bird');
 if(m.bytes(bird+0x440n,1)[0]){
  const owner=m.read64(game+0x280n);
  for(let i=0;i<16;i++){
   const avatar=originalBirdGuideAvatarSlot(owner,i);
   if(!originalBirdGuideAvatarActive(m,avatar)||!(s.avatarEnabled(avatar)&255))continue;
   const reference=m.read64(avatar+0x88n),guide=getOriginalBirdGuide(m,reference);
   if([0x420n,0x428n,0x430n,0x438n].some(at=>m.read64(bird+at)===guide))setOriginalBirdGuide(m,reference,0n);
  }
 }
 s.start(event);
}
export interface BirdReleaseServices extends CreatureEventServices {
 /** Animation.FadeSequence(secondary, forced, duration=.3, delay=0),
  * not Default/PlayNamed. Real animation controller belongs to this bird. */
 fadeSequence(animation:bigint,kind:1,forced:1,durationBits:number,delayBits:number):void;
 requireAvatar(owner:bigint):bigint;
 /** Virtual Object.GetPos result, original 16-byte SIMD layout. */
 birdPosition(bird:bigint):Uint8Array;
 getStatistic(owner:bigint,index:number):number;
 setStatistic(owner:bigint,index:number,bits:number):void;
}
/** Whole ReleaseBirds.OnEnabled 0x1001aa870. The original compares squared
 * XYZ distance directly to the saved threshold. The comparison is strict;
 * radius is neither squared nor square-rooted here. */
export function enableOriginalReleaseBirds(m:ModelBakeMemory,event:bigint,game:bigint,s:BirdReleaseServices){
 let clump=m.read64(event+56n);
 if(!clump)throw new NativeObjectFoundationFailure('BirdV2.cpp',2138,3,'birds');
 const count=m.read32(clump+16n),a=natureArithmetic(s.arithmetic);
 for(let i=0;i<count;i++){
  const bird=s.castCreature(m.read64(m.read64(clump+8n)+BigInt(i)*8n),'BirdV2');
  if(!bird)throw new NativeObjectFoundationFailure('./Clump.h',71,3,'ret');
  m.write8(bird+0x164n,0);
  s.fadeSequence(m.read64(m.read64(bird+0x3a0n)+104n),1,1,0x3e99999a,0);
  m.write8(m.read64(bird+0x3a0n)+0x348n,1);
  const physics=m.read64(s.requireAvatar(m.read64(game+0x280n))+24n),position=s.birdPosition(bird);
  if(position.length!==16)throw new Error('原鸟位置必须为 16 字节');
  const d=new DataView(position.buffer,position.byteOffset,16),squares=[0,4,8].map(at=>{const delta=a.sub(m.read32(physics+16n+BigInt(at)),d.getUint32(at,true));return a.mul(delta,delta);});
  const distance=a.add(squares[2],a.add(squares[0],squares[1]));
  if(value(m.read32(event+64n))>value(distance)){
   const stats=m.read64(game+0x240n),previous=s.getStatistic(stats,0x24);
   s.setStatistic(stats,0x24,a.add(previous,0x3f800000));
  }
  if(i+1<count){clump=m.read64(event+56n);if(i+1>=m.read32(clump+16n))throw new NativeObjectFoundationFailure('./Clump.h',54,3,'idx < size');}
 }
 s.start(event);
}
