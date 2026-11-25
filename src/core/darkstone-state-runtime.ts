import type {ModelBakeMemory} from './model-baked-runtime';
import {natureArithmetic,type NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import {transformNativeObb,type NativeMarkerArithmeticServices} from './marker-transform-runtime';
import evidence from '../../docs/darkstone-state-native.json';

const c=evidence.constants;
const one=0x3f800000,min=bits(c.minimum),threshold=bits(c.burntThreshold);
export interface DarkstoneStateServices {
 expf(argumentBits:number):number;
 transform(mesh:bigint):Uint8Array;
 localObb(stone:bigint):Uint8Array;
 setTransform(mesh:bigint,matrix:Uint8Array):void;
 setEnabled(mesh:bigint,enabled:number):void;
 setVector(mesh:bigint,name:string,color:Uint8Array):void;
 diffuseColor:Uint8Array;
 arithmetic?:NatureArithmeticServices;
 matrixArithmetic?:NativeMarkerArithmeticServices;
}
export function setOriginalDarkstoneHealth(m:ModelBakeMemory,p:bigint,healthBits:number){const a=natureArithmetic();m.write32(p+0xd0n,a.min(one,a.max(min,healthBits)));}
/** The network slot receives the unclamped input, as in the original body. */
export function setOriginalDarkstoneNetworkHealth(m:ModelBakeMemory,p:bigint,network:bigint,healthBits:number){setOriginalDarkstoneHealth(m,p,healthBits);m.write32(network+0x930n+BigInt(m.read32(p+32n))*4n,healthBits);}
export function originalDarkstoneKillable(m:ModelBakeMemory,p:bigint){
 const count=m.read32(p+0x104n);
 if(count){const barn=m.read64(p+24n),total=m.read32(barn+0x1b220n);
  for(let i=0;i<count;i++){const index=m.read32(p+0xe4n+BigInt(i)*4n);if(index<total&&!(c.burntThreshold>=value(m.read32(barn+0x1220n+BigInt(index)*0x1a0n+0xd0n))))return false;}
 }
 return m.bytes(p+0xdcn,1)[0]!==0;
}
export function originalSoulTrapBurnt(m:ModelBakeMemory,p:bigint){
 const first=m.read64(p+0x40n);if(!first)return false;
 const count=m.read32(m.read64(p+8n)+16n);
 for(let i=0;i<count;i++)if(!(c.burntThreshold>=value(m.read32(first+BigInt(i)*0x1a0n+0xd0n))))return false;
 return true;
}
/** Whole SoulTrap.Update: completion edges call the original Meta enabled
 * service, with its original post-callback flag writes. */
export function updateOriginalSoulTrap(m:ModelBakeMemory,p:bigint,setEnabled:(event:bigint,enabled:number)=>void){
 if(!m.read64(p+0x40n))return;
 if(!originalSoulTrapBurnt(m,p)){m.write8(p+0x3an,0);m.write8(p+0x39n,0);return;}
 if(!m.bytes(p+0x3an,1)[0]){const event=m.read64(p+16n);if(event){setEnabled(event,1);m.write8(p+0x3an,1);}}
 if(!m.bytes(p+0x39n,1)[0]){setEnabled(m.read64(p+24n),1);m.write8(p+0x39n,1);}
}
/** Original consume subregion 0x10027c8b5..0x10027c9bb. Heat and level
 * are caller-owned inputs; this function does not decide fire eligibility. */
export function consumeOriginalDarkstone(m:ModelBakeMemory,p:bigint,heatBits:number,level:number,deltaBits:number,arithmetic?:NatureArithmeticServices){
 const a=natureArithmetic(arithmetic);
 if(value(heatBits)>0)m.write32(p+0x184n,a.min(bits(c.recoveryDelay),a.max(0,a.sub(m.read32(p+0x184n),deltaBits))));
 if((level>>>0)>=m.read32(p+0x140n))m.write32(p+0xd0n,a.min(one,a.max(min,a.sub(m.read32(p+0xd0n),heatBits))));
}
/** Original burn-shape subregion 0x10027d909..0x10027d9af, preserving
 * the half-size floor and the nonkillable root's asymmetric retained shape.
 * Rotation and final world OBB submission are still caller dependencies. */
export function updateOriginalDarkstoneBurnShape(m:ModelBakeMemory,p:bigint,parent:bigint,arithmetic?:NatureArithmeticServices){
 const a=natureArithmetic(arithmetic),hp=m.read32(p+0xd4n);
 const factor=bits(value(a.sub(one,hp))*c.shapeMinimum+value(hp));
 const old=[0,4,8,12].map(i=>m.read32(p+0x70n+BigInt(i)));
 const retained=old.map((v,i)=>i===3?0:a.mul(v,i===1?0x3e800000:0x3f000000));
 const preserve=!parent&&!m.bytes(p+0xdcn,1)[0];
 for(let i=0;i<4;i++)m.write32(p+0xc0n+BigInt(i*4),preserve?a.add(retained[i],a.mul(factor,a.sub(old[i],retained[i]))):a.mul(factor,old[i]));
}
/** Whole ordinary Darkstone state application 0x10027e530. Called by
 * DarkstoneBarn before burning Update. Includes unclamped-input smoothing,
 * parent-gated visibility, transform/OBB and material calls in original order.
 * Network transport, actual Model ownership and C++ unwind are dependencies. */
export function applyOriginalDarkstoneState(m:ModelBakeMemory,p:bigint,parent:bigint,healthBits:number,deltaBits:number,s:DarkstoneStateServices){
 const a=natureArithmetic(s.arithmetic),health=a.min(one,a.max(min,healthBits));
 m.write32(p+0xd0n,health);
 const weight=a.min(one,a.max(0,a.sub(one,s.expf(a.mul(deltaBits,bits(c.displaySmoothing)))))),retained=a.sub(one,weight);
 m.write32(p+0xd4n,a.min(one,a.max(min,a.add(a.mul(weight,healthBits),a.mul(retained,m.read32(p+0xd4n))))));
 const owner=m.read64(p+16n);let visibility=m.read32(p+0x190n);
 if(!owner||m.bytes(owner+0x38n,1)[0]){
  if(!(1>value(visibility)))return;
  if(!parent||!(value(m.read32(parent+0x190n))<1)){
   visibility=a.add(visibility,a.mul(deltaBits,m.read32(p+0x194n)));m.write32(p+0x190n,visibility);
   // SETB includes unordered operands.
   s.setEnabled(m.read64(p+40n),Number(!(c.burntThreshold>=value(health))));
  }
 }else{
  if(!(value(visibility)>0))return;
  const count=m.read32(p+0x104n);let active=false;
  if(count){const barn=m.read64(p+24n),total=m.read32(barn+0x1b220n);
   for(let i=0;i<count;i++){const index=m.read32(p+0xe4n+BigInt(i)*4n);if(index<total&&value(m.read32(barn+0x1220n+BigInt(index)*0x1a0n+0x190n))>0){active=true;break;}}
  }
  if(!active){visibility=a.sub(visibility,a.mul(deltaBits,m.read32(p+0x194n)));m.write32(p+0x190n,visibility);
   if(!(value(visibility)>0))s.setEnabled(m.read64(p+40n),0);
  }
 }
 visibility=a.min(one,a.max(0,m.read32(p+0x190n)));m.write32(p+0x190n,visibility);
 const factor=bits(value(a.sub(one,visibility))*c.loadShapeMinimum+value(visibility));
 const scales=[0,4,8,12].map(i=>m.read32(p+0x70n+BigInt(i)));
 if(!parent&&!m.bytes(p+0xdcn,1)[0]){
  const kept=scales.map((v,i)=>i===3?0:a.mul(v,i===1?0x3e800000:0x3f000000));
  scales.forEach((v,i)=>scales[i]=a.add(kept[i],a.mul(a.sub(v,kept[i]),factor)));
 }else scales.forEach((v,i)=>scales[i]=a.mul(v,factor));
 const matrix=Uint8Array.from(s.transform(m.read64(p+40n)));
 const axes=[0,16,32].map(offset=>[0,4,8,12].map(i=>m.read32(p+0x40n+BigInt(offset+i))));
 const zero=0;
 for(let i=0;i<4;i++){
  const output=[a.add(a.add(a.mul(scales[0],axes[0][i]),a.mul(axes[1][i],zero)),a.mul(axes[2][i],zero)),a.add(a.mul(axes[2][i],zero),a.add(a.mul(axes[1][i],scales[1]),a.mul(axes[0][i],zero))),a.add(a.mul(axes[2][i],scales[2]),a.add(a.mul(axes[0][i],zero),a.mul(axes[1][i],zero)))];
  if(i!==3)output.forEach((v,j)=>new DataView(matrix.buffer,matrix.byteOffset,matrix.byteLength).setUint32(j*16+i*4,v,true));
 }
 s.setTransform(m.read64(p+40n),matrix);
 const local=s.localObb(p);m.bytes(p+0x80n,64).set(transformNativeObb(matrix,local,undefined,s.matrixArithmetic));
 const diffuseWeight=a.min(one,a.max(0,a.sub(one,s.expf(a.mul(deltaBits,0xc0af075a))))),diffuseRetained=a.sub(one,diffuseWeight);
 if(s.diffuseColor.length!==16)throw new Error('Darkstone diffuse global must be float4');
 const color=new DataView(s.diffuseColor.buffer,s.diffuseColor.byteOffset,16);
 for(let i=0;i<4;i++)m.write32(p+0x150n+BigInt(i*4),a.add(a.mul(diffuseWeight,color.getUint32(i*4,true)),a.mul(diffuseRetained,m.read32(p+0x150n+BigInt(i*4)))));
 s.setVector(m.read64(p+40n),'u_diffuseColor',m.bytes(p+0x150n,16).slice());
 if(m.bytes(p+0x30n,1)[0])s.setVector(m.read64(p+40n),'u_spotsColor',new Uint8Array(16));
}
