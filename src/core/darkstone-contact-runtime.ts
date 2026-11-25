import type {ModelBakeMemory} from './model-baked-runtime';
import {natureArithmetic,type NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import evidence from '../../docs/darkstone-contact-native.json';

const c=evidence.constants,one=0x3f800000;
const b=(name:keyof typeof c)=>bits(c[name]);
const sqrt=(n:number)=>(n&0x7fffffff)>0x7f800000?(n|0x400000)>>>0:value(n)<0?0xffc00000:bits(Math.sqrt(value(n)));
const negate=(n:number)=>(n^0x80000000)>>>0;
const nan=(n:number)=>(n&0x7fffffff)>0x7f800000;
/** Whole original sphere/OBB closest-point body, including zero axes and
 * ordered projection accumulation. Radius changes overlap only. */
export function originalObbContactPoint(point:readonly number[],obb:Uint8Array,radiusBits=0,arithmetic?:NatureArithmeticServices){
 const a=natureArithmetic(arithmetic),v=new DataView(obb.buffer,obb.byteOffset,64);
 const axes=[0,16,32].map(o=>[0,4,8,12].map(i=>v.getUint32(o+i,true))),center=[0,4,8,12].map(i=>v.getUint32(48+i,true));
 const sum=(vs:number[])=>a.add(vs[2],a.add(vs[0],vs[1]));
 const ySquared=axes.map(axis=>a.mul(axis[1],axis[1]));
 const lengths=axes.map(axis=>sqrt(sum(axis.map(n=>a.mul(n,n)))));
 axes.forEach((axis,i)=>{if(value(lengths[i])>Math.fround(1e-5))axis.forEach((n,j)=>axis[j]=a.div(n,j===3?ySquared[i]:lengths[i]));});
 const relative=point.map((n,i)=>a.sub(n,center[i]));let out=center.slice(),overlap=true;
 axes.forEach((axis,i)=>{
  let projection=sum(axis.map((n,j)=>a.mul(n,relative[j]))),projectionW=a.mul(axis[1],relative[1]),inside=true;
  if(value(projection)>value(lengths[i])){inside=value(projection)<=value(a.add(lengths[i],radiusBits));projection=lengths[i];projectionW=ySquared[i];}
  else if(value(negate(projection))>value(lengths[i])){inside=value(negate(projection))<=value(a.add(lengths[i],radiusBits));projection=negate(lengths[i]);projectionW=negate(ySquared[i]);}
  overlap=overlap&&inside;out=out.map((n,j)=>a.add(n,a.mul(axis[j],j===3?projectionW:projection)));
 });
 return {point:out,overlap};
}
export interface DarkstoneContactServices {
 selectFlame(owner:bigint):bigint;
 flameEnabled(flame:bigint):number;
 closestPoint?(point:readonly number[],obb:Uint8Array,radiusBits:number):number[];
 createLevelHint(stone:bigint,requiredLevel:number):bigint;
 arithmetic?:NatureArithmeticServices;
}
export interface DarkstoneContactInput {avatars:readonly bigint[];localAvatar:bigint;game:bigint;deltaBits:number;fastBurn:boolean;timerBits:number;}
export interface DarkstoneContactResult {heatBits:number;level:number;nearCount:number;nearLevel:number;distanceBits:number;localNear:boolean;positiveHeat:boolean;timerBits:number;particles:{point:number[];direction:number[];count:number}[];}

/** Unchanged contact/consumption region 0x10027c239..0x10027c9bb.
 * Avatar/Flame records and local hint services belong to the caller. This
 * region neither chooses hierarchy eligibility nor regenerates/rewards. */
export function updateOriginalDarkstoneContact(m:ModelBakeMemory,p:bigint,input:DarkstoneContactInput,s:DarkstoneContactServices):DarkstoneContactResult {
 const a=natureArithmetic(s.arithmetic),clamp=(n:number)=>a.min(one,a.max(0,n));
 const vec=(at:bigint)=>[0,4,8,12].map(i=>m.read32(at+BigInt(i)));
 const distanceSquared=(v:number[])=>a.add(v[2],a.add(v[0],v[1]));
 const closest=(point:number[],radius:number)=>s.closestPoint?s.closestPoint(point,m.bytes(p+0x80n,64),radius):originalObbContactPoint(point,m.bytes(p+0x80n,64),radius,s.arithmetic).point;
 let heat=0,level=0,nearCount=0,nearLevel=0,distance=b('maximumDistance'),localNear=false;
 const particles:DarkstoneContactResult['particles']=[],timer=a.add(input.deltaBits,input.timerBits);
 const avatarRadius=b('avatarRadius'),radiusSquared=a.mul(avatarRadius,avatarRadius);
 const avatarEnergy=a.mul(a.mul(a.mul(avatarRadius,a.mul(avatarRadius,b('volumeFactor'))),b('avatarDensity')),b('energyFactor'));
 for(const avatar of input.avatars){
  const position=vec(m.read64(avatar+24n)+16n),point=closest(position,avatarRadius);
  let delta=a.sub(distanceSquared(point.map((n,i)=>a.mul(a.sub(n,position[i]),a.sub(n,position[i])))),radiusSquared);
  if(value(b('nearThreshold'))>value(delta)){
   if(avatar===input.localAvatar)localNear=true;
   nearCount=(nearCount+1)>>>0;nearLevel=(nearLevel+m.read32(m.read64(avatar+0xa0n)+0xa20n))>>>0;
   // JBE includes unordered operands; nearThreshold above is ordered.
   if(!(value(delta)>c.levelDivisor)){
    const flame=s.selectFlame(m.read64(m.read64(avatar+0xa8n)+0x210n));
    if((s.flameEnabled(flame)&255)&&value(m.read32(m.read64(avatar+0x30n)+8n))>c.flameGate){
     const flamePosition=vec(flame+0xc0n),rawRadius=m.read32(flame+0x108n);
     const radius=a.mul(nan(rawRadius)?b('flameMinimumRadius'):a.max(b('flameMinimumRadius'),rawRadius),a.add(one,a.mul(b('flameGrowth'),m.read32(flame+0x10cn))));
     const flamePoint=closest(flamePosition,0),direction=flamePoint.map((n,i)=>a.sub(n,flamePosition[i]));
     const surfaceDistance=a.sub(sqrt(distanceSquared(direction.map(n=>a.mul(n,n)))),radius);
     if(!(value(surfaceDistance)>c.contactThreshold)){
      const state=m.read64(avatar+0xa0n),rawLevel=m.read32(state+0xa20n)|0,effectiveLevel=rawLevel>0?rawLevel:1,required=m.read32(p+0x140n);
      const ui=m.read64(avatar+0x38n),available=((1-required+effectiveLevel)>>>0);
      const uiValue=a.add(bits(available),a.add(b('levelOffset'),m.read32(p+0xd4n)));
      m.write32(ui+0x3f0n,m.bytes(ui+0x3f4n,1)[0]?a.max(uiValue,m.read32(ui+0x3f0n)):uiValue);m.write8(ui+0x3f4n,1);
      if(m.bytes(avatar+0x1ef8n,1)[0]){
       m.write32(input.game+0xe0n,0);m.write32(input.game+0xf0n,2);m.write32(input.game+0xecn,uiValue);
       if(value(uiValue)<0){let hint=m.read64(p+0x178n);if(!hint){hint=s.createLevelHint(p,required);m.write64(p+0x178n,hint);}m.write32(hint+0xb8n,bits(5));m.write32(p+0x180n,bits(5));}
       m.write8(p+0x199n,1);
      }
      const difference=(rawLevel-required)|0;let levelWeight=one;
      if(difference>0){const t=clamp(a.div(bits(difference),b('levelDivisor')));levelWeight=a.add(a.sub(one,t),a.add(t,t));}
      else if(difference<0){const t=clamp(a.div(bits(difference),b('negativeLevelDivisor')));levelWeight=a.add(a.sub(one,t),a.mul(t,b('negativeLevelWeight')));}
      let energy:number;
      if(input.fastBurn)energy=b('levelDivisor');
      else{
       const vertical=clamp(a.add(one,a.div(a.add(surfaceDistance,b('verticalOffset')),b('verticalDivisor'))));
       const scales=vec(p+0xc0n),volume=a.mul(a.mul(scales[2],a.mul(scales[0],scales[1])),b('volumeDivisor'));
       energy=a.min(b('maximumEnergy'),a.max(b('minimumEnergy'),a.div(avatarEnergy,volume)));
       energy=a.mul(levelWeight,a.add(energy,energy));
       energy=a.mul(a.add(a.mul(vertical,b('highWeight')),a.mul(a.sub(one,vertical),b('lowWeight'))),energy);
      }
      if(particles.length<=3){
       const scaled=value(a.mul(energy,b('particleScale'))),truncated=Number.isFinite(scaled)&&scaled>=-9223372036854775808&&scaled<9223372036854775808?BigInt(Math.trunc(scaled)):-(1n<<63n);
       const count=Math.min(10,Math.max(1,Number(BigInt.asUintN(32,truncated))));
       particles.push({point:flamePoint.slice(),direction:direction.map(negate),count});
      }
      heat=a.add(heat,energy);level=(level+rawLevel)>>>0;
     }
    }
   }
  }
  distance=a.min(delta,distance);
 }
 const positiveHeat=value(heat)>0;
 if(positiveHeat)m.write32(p+0x184n,a.min(b('maximumEnergy'),a.max(0,a.sub(m.read32(p+0x184n),input.deltaBits))));
 if(level>=m.read32(p+0x140n))m.write32(p+0xd0n,a.min(one,a.max(b('healthMinimum'),a.sub(m.read32(p+0xd0n),heat))));
 return {heatBits:heat,level,nearCount,nearLevel,distanceBits:distance,localNear,positiveHeat,timerBits:timer,particles};
}
