import {updateOriginalDarkstoneDiffuse} from './darkstone-diffuse-runtime';
import evidence from '../../docs/darkstone-initialization-native.json';
import stateEvidence from '../../docs/darkstone-state-native.json';
import {applyOriginalDarkstoneState,updateOriginalDarkstoneBurnShape,type DarkstoneStateServices} from './darkstone-state-runtime';
import {updateOriginalDarkstoneContact,type DarkstoneContactResult} from './darkstone-contact-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import type {ModelBakeMemory} from './model-baked-runtime';
/** Camera reach, a local stationary Flame and a fixed 60 Hz simulation clock
 * remain editor adapters. Contact, heat, consumption, shape and diffuse use
 * recovered original instructions.
 * Complete Darkstone.Update, fire propagation and game UI remain pending. */
export const IGNITION_REACH=4.5;
export const PLANT_PREVIEW_STEP=1/60;
export interface PlantIgnitionGeometry {position:number[];scale:number[];worldObb:number[];}
export interface IgnitionTarget {
 nodeId:number;kind:'candle'|'darkstone';position:number[];radius:number;
 enabled:boolean;lit:boolean;burnt:boolean;progress:number;light?:number;loaded?:boolean;
 shrinkScale?:number[];
}
export interface IgnitionSnapshot {level:string;token:number;targets:IgnitionTarget[];}
export function ignitionDistance(target:IgnitionTarget,eye:readonly number[]){
 return Math.max(0,Math.hypot(...target.position.map((v,i)=>v-eye[i]))-target.radius);
}
export function canIgnite(target:IgnitionTarget,eye:readonly number[]){
 return target.enabled&&!target.lit&&!target.burnt&&eye.length===3&&eye.every(Number.isFinite)&&ignitionDistance(target,eye)<=IGNITION_REACH;
}
export class PlantIgnitionPreview {
 private records=new Map<number,ModelBakeMemory>();
 private scales=new Map<number,number[]>();private contacts=new Map<number,DarkstoneContactResult>();private accumulator=0;
 private colors=new Map<number,number[]>();private time=0;
 private services:DarkstoneStateServices={expf:n=>bits(Math.exp(value(n))),transform:()=>{throw new Error('Plant preview Model owner not attached');},localObb:()=>{throw new Error('Plant preview OBB owner not attached');},setTransform:()=>{throw new Error('Plant preview Model owner not attached');},setEnabled:()=>{throw new Error('Plant preview enabled owner not attached');},setVector:()=>{throw new Error('Plant preview material owner not attached');},diffuseColor:new Uint8Array(Float32Array.from(evidence.colors.diffuse.values).buffer)};
 ignite(id:number,geometry?:PlantIgnitionGeometry){
  if(this.records.has(id))throw new Error('植物已点燃');
  const storage=new Uint8Array(0x6000),v=new DataView(storage.buffer),at=(p:bigint)=>Number(p);
  const m:ModelBakeMemory={bytes:(p,n)=>storage.subarray(at(p),at(p)+n),read32:p=>v.getUint32(at(p),true),read64:p=>v.getBigUint64(at(p),true),write32:(p,n)=>v.setUint32(at(p),n,true),write64:(p,n)=>v.setBigUint64(at(p),n,true),write8:(p,n)=>v.setUint8(at(p),n),string:()=>{throw new Error('Plant preview has no string owner');}};
  for(const offset of [0x70,0x74,0x78,0xc0,0xc4,0xc8,0xd0,0xd4,0xd8,0x190])m.write32(BigInt(offset),bits(1));
  m.write8(0xdcn,1);m.write32(0x184n,bits(stateEvidence.constants.recoveryDelay));
  const scale=geometry?.scale??[1,1,1],position=geometry?.position??[0,0,0],obb=geometry?.worldObb??[1,0,0,0,0,1,0,0,0,0,1,0,...position,1];
  if(scale.length!==3||position.length!==3||obb.length!==16||![...scale,...position,...obb].every(Number.isFinite))throw new Error('植物点火几何无效');
  scale.forEach((n,i)=>{m.write32(0x70n+BigInt(i*4),bits(n));m.write32(0xc0n+BigInt(i*4),bits(n));});obb.forEach((n,i)=>m.write32(0x80n+BigInt(i*4),bits(n)));
  // Distinct local Avatar/Flame records supply the recovered contact region.
  // This preview Flame stays at the clicked target; production Avatar state,
  // moving fire/propagation, audio and particle dispatch remain separate.
  m.write64(0x1018n,0x3000n);m.write64(0x10a0n,0x2000n);m.write32(0x2a20n,1);m.write64(0x1030n,0x3040n);m.write64(0x10a8n,0x3080n);m.write64(0x3290n,0x3300n);m.write64(0x3300n,0x4000n);m.write64(0x1038n,0x3400n);
  m.write32(0x4108n,bits(.2));m.write32(0x410cn,bits(0));m.write8(0x4148n,1);
  position.concat(1).forEach((n,i)=>{m.write32(0x3010n+BigInt(i*4),bits(n));m.write32(0x40c0n+BigInt(i*4),bits(n));});
  this.scales.set(id,scale.map(Math.fround));
  this.records.set(id,m);this.colors.set(id,evidence.colors.burning.values.slice());
 }
 advance(delta:number){
  if(!Number.isFinite(delta)||delta<0)throw new Error('燃烧预览帧时间无效');this.time+=delta;
  if(delta===0)return;this.accumulator+=delta;
  const ticks=Math.floor((this.accumulator+Number.EPSILON)/PLANT_PREVIEW_STEP);this.accumulator-=ticks*PLANT_PREVIEW_STEP;
  for(let tick=0;tick<ticks;tick++)for(const [id,m] of this.records){
   if(this.state(id).burnt)continue;
   // Barn applies the current health before burning Update consumes heat.
   applyOriginalDarkstoneState(m,0n,0n,m.read32(0xd0n),bits(PLANT_PREVIEW_STEP),this.services);
   const contact=updateOriginalDarkstoneContact(m,0n,{avatars:[0x1000n],localAvatar:0x1000n,game:0x5000n,deltaBits:bits(PLANT_PREVIEW_STEP),timerBits:this.contacts.get(id)?.timerBits??0,fastBurn:false},{selectFlame:owner=>m.read64(owner),flameEnabled:flame=>m.bytes(flame+0x148n,1)[0],createLevelHint:()=>{throw new Error('Plant preview local level hint owner not attached');}});
   this.contacts.set(id,contact);
   updateOriginalDarkstoneBurnShape(m,0n,0n);
   this.colors.set(id,updateOriginalDarkstoneDiffuse(this.colors.get(id)!,{eligible:false,childScales:[],rootKillable:false,requiredLevel:0,availableLevel:contact.nearLevel,pulseLevel:contact.level,collectible:false,collectibleAvailable:false,rewardAllowed:true,specialOwner:false,rewardCount:1,heat:value(contact.heatBits),time:this.time-this.accumulator-(ticks-tick-1)*PLANT_PREVIEW_STEP,delta:PLANT_PREVIEW_STEP}));
  }
 }
 diffuse(id:number){return this.colors.get(id)?.slice();}
 state(id:number){const m=this.records.get(id),health=m?value(m.read32(0xd0n)):1,burnt=!!m&&health<=stateEvidence.constants.burntThreshold;return {lit:!!m,burnt,progress:burnt?1:1-health};}
 shape(id:number){const m=this.records.get(id),initial=this.scales.get(id);return m&&[0,4,8].map((i,j)=>initial![j]===0?1:value(m.read32(0xc0n+BigInt(i)))/initial![j]);}
 contact(id:number){const contact=this.contacts.get(id);return contact&&{heat:value(contact.heatBits),level:contact.level,nearCount:contact.nearCount,particles:contact.particles.length};}
 ids(){return [...this.records.keys()];}
}
