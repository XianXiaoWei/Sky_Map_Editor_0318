import type {ModelBakeMemory} from './model-baked-runtime';
import {natureArithmetic,type NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatBits as bits} from './object-numeric-runtime';

export interface CrabStateServices {
 arithmetic?:NatureArithmeticServices;
 /** Execute the original candidate comparator on this private stack record. */
 consider(ai:bigint,best:bigint,record:bigint):void;
 /** Native Object** conversion. It may replace the reference even on failure.
  * These are the exact target/source metadata getters used by SelectState. */
 cast(reference:bigint,target:0x100474e80n|0x10033abb0n|0x10043ccc0n|'CrabPointer',source:0x10074a170n|0x1007abc10n):bigint;
 actorActive(actor:bigint):number;
 nearestAvatar(owner:bigint,position:bigint,excludeHidden:0,excludeInactive:0,requireEnergy:1):bigint;
}

/** Whole CrabAi.SelectState 0x1002594c0. The caller supplies 0x460 bytes of
 * aligned private stack storage, including the original unwritten SIMD W
 * lanes. This does not allocate a game owner or substitute neighborhood data.
 * Candidate scoring, native casts and AvatarBarn lookup are dependencies. */
export function selectOriginalCrabState(m:ModelBakeMemory,ai:bigint,game:bigint,stack:bigint,s:CrabStateServices){
 const a=natureArithmetic(s.arithmetic),rbp=stack+0x460n,p=(offset:number)=>rbp-BigInt(offset),current=ai+0x50n;
 const copy=(out:bigint,input:bigint,n:number)=>m.bytes(out,n).set(new Uint8Array(m.bytes(input,n)));
 const snapshot=(out:bigint,input:bigint)=>{const tail=m.read64(input+16n);m.write64(out+16n,tail);copy(out,input,16);copy(out+32n,input+32n,16);m.write32(out+48n,m.read32(input+48n));};
 const make=(out:bigint,kind:number,target=0n,position?:bigint,id=0,count=0)=>{
  m.write32(out,kind);m.write64(out+8n,target);m.write32(out+16n,id);m.write32(out+20n,count);
  if(position)copy(out+32n,position,16);else m.bytes(out+32n,16).fill(0);
  m.write32(out+48n,0);
 };
 const best=p(0x80),self=m.read64(ai+16n);copy(p(0x420),self+16n,16);copy(p(0x3e0),self+64n,16);
 make(best,0);m.write32(best+64n,0xff7fffff);
 for(const [kind,offset] of [[5,0xc0],[7,0x100],[8,0x140],[3,0x180],[4,0x1c0]] as const){
  const record=p(offset);if(m.read32(current)===kind)snapshot(record,current);else make(record,kind,0n,kind===4?ai+48n:undefined);
  s.consider(ai,best,record);
 }
 if(m.read32(current)===6){snapshot(p(0x200),current);s.consider(ai,best,p(0x200));}
 const projected=p(0x220);
 for(let lane=0;lane<4;lane++)m.write32(projected+BigInt(lane*4),a.add(a.mul(m.read32(p(0x3e0)+BigInt(lane*4)),lane===3?0:0x41200000),m.read32(p(0x420)+BigInt(lane*4))));
 make(p(0x240),6,0n,projected);s.consider(ai,best,p(0x240));
 const reference=p(0x3c8),convert=(target:Parameters<CrabStateServices['cast']>[1])=>{
  m.write64(p(0x2c0),0n);const body=s.cast(reference,target,0x10074a170n);m.write64(p(0x2c0),body);return body;
 };
 const zeroXYZ=(at:bigint)=>{m.bytes(at,12).fill(0);return at;};
 const matches=(barn:bigint,offset:number,count:number,id:number)=>{let n=0;for(let i=0;i<count;i++)if(m.read32(barn+BigInt(offset+i*4))===id)n=(n+1)|0;return n;};
 const social=(body:bigint,isFlame:boolean)=>{
  m.write64(ai+BigInt(isFlame?32:24),body);
  const record=p(0x2c0),position=zeroXYZ(p(isFlame?0x400:0x410)),id=m.read32(body+BigInt(isFlame?0x150:0x74));make(record,9,0n,position,id);
  const barn=m.read64(game+0x370n),first=m.read32(barn+0x518n),second=m.read32(barn+0x514n);
  const n=Math.max(matches(barn,0x494,first,id),matches(barn,0x414,second,id));m.write32(record+20n,n);
  // The original scans the two lists twice. There are no calls between
  // scans, and both counts use signed int comparison before the store.
  m.write32(ai+0x64n,n);
  snapshot(p(isFlame?0x340:0x300),id===m.read32(ai+0x60n)&&m.read32(current)===9?current:record);
  s.consider(ai,best,p(isFlame?0x340:0x300));
 };
 for(let index=0;index<m.read32(ai+0x1c8n);index++){
  const object=m.read64(ai+0xc8n+BigInt(index*8));m.write64(reference,object);if(object===m.read64(ai+16n))continue;
  let allowed=convert(0x100474e80n);
  if(!allowed)allowed=convert('CrabPointer');
  if(!allowed)allowed=convert(0x10033abb0n);
  if(!allowed)allowed=convert(0x10043ccc0n);
  if(!allowed)continue;
  let body=convert(0x10043ccc0n);
  if(body){body=convert(0x10043ccc0n);if(!body)continue;make(p(0x280),3,body+8n,zeroXYZ(p(0x440)));s.consider(ai,best,p(0x280));continue;}
  body=convert(0x100474e80n);
  if(body){body=convert(0x100474e80n);if(!body)continue;if(s.actorActive(body)&255)social(body,false);continue;}
  body=convert(0x10033abb0n);
  if(body){body=convert(0x10033abb0n);if(!body)continue;if(m.bytes(body+0xb4n,1)[0]&&m.bytes(body+0xb6n,1)[0])social(body,true);continue;}
  body=convert('CrabPointer');if(!body)continue;body=convert('CrabPointer');if(m.read32(body+0x140n)!==10)continue;
  make(p(0x380),11,body?body+8n:0n,zeroXYZ(p(0x430)));s.consider(ai,best,p(0x380));
 }
 copy(p(0x450),p(0x420),16);const avatar=s.nearestAvatar(m.read64(game+0x280n),p(0x450),0,0,1);
 make(p(0x3c0),1,avatar?avatar+8n:0n);s.consider(ai,best,p(0x3c0));
 const attach=(change:number)=>{
  const crab=s.cast(ai+0x58n,'CrabPointer',0x1007abc10n);m.write32(crab+0x78n,(m.read32(crab+0x78n)+change)>>>0);
 };
 if(m.read32(current)===11)attach(-1);
 snapshot(current,best);
 if(m.read32(current)===11)attach(1);
 const seed=m.read32(ai+64n);m.write32(ai+64n,(seed+1)>>>0);
 const mixed=(seed^(seed<<13))>>>0,random=(Math.imul((Math.imul(Math.imul(mixed,mixed),0x3d73)+0xc0ae5)|0,mixed)+0x5208dd0d)&0x7fffffff;
 const unit=a.mul(a.add(a.add(a.mul(bits(random),0xb0800000),0x3f800000),0x3f800000),0x3f000000);
 m.write32(ai+0x90n,a.add(a.mul(unit,0x3ecccccd),a.mul(a.sub(0x3f800000,unit),0x3e4ccccd)));
}
