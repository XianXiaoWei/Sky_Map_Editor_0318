import type {AvatarState} from './avatar-set-pos';
import {avatarRead,avatarWrite} from './avatar-set-pos';
import type {BallCollisionWorld,PhysicsBallSlide} from './physics-ball';
import {solveOriginalAvatarSlide} from './avatar-locomotion-runtime';
import {setOriginalPhysicalPositionImmediate} from './avatar-physical-state';
/** Editor adapter: native eight-iteration slide over the SAME Avatar physical
 * storage used for placement. Sphere contacts, radius, input acceleration and
 * gravity remain explicit editor services. This is not full Avatar physics. */
export class AvatarSlidePreview implements PhysicsBallSlide {
 readonly scope='Original AvatarLoco slide with editor triangle/sphere collision and movement inputs; animation/skinning and complete Avatar update remain open.';
 calls=0;queries=0;private scratch=new Uint8Array(64);private base=0x3c0000000n;
 constructor(readonly state:AvatarState){}
 reset(position:number[],radius:number){setOriginalPhysicalPositionImmediate(this.state,[position[0],position[1]-radius,position[2],1],{offsetAxis:[0,1,0,0]});}
 sync(position:number[],velocity:number[],radius:number){const physical=[position[0],position[1]-radius,position[2],1];for(const offset of [0x10,0x20,0x130,0xc80])avatarWrite(this.state,offset,physical);avatarWrite(this.state,0x50,[...velocity,0]);}
 move(position:number[],target:number[],velocity:number[],world:BallCollisionWorld,radius:number){
  const base=this.base,bytes=(a:bigint,n:number)=>{const offset=Number(a-base);return offset<0xd00?this.state.storage.subarray(offset,offset+n):this.scratch.subarray(offset-0xd00,offset-0xd00+n);},view=(a:bigint,n:number)=>{const b=bytes(a,n);return new DataView(b.buffer,b.byteOffset,b.byteLength);};
  const m={bytes,read32:(a:bigint)=>view(a,4).getUint32(0,true),read64:(a:bigint)=>view(a,8).getBigUint64(0,true),write32:(a:bigint,n:number)=>view(a,4).setUint32(0,n>>>0,true),write64:(a:bigint,n:bigint)=>view(a,8).setBigUint64(0,n,true),write8:(a:bigint,n:number)=>{bytes(a,1)[0]=n;},string:()=>''};
  avatarWrite(this.state,0x10,[position[0],position[1]-radius,position[2],1]);avatarWrite(this.state,0x50,[...velocity,0]);
  const destination=view(base+0xd00n,16);[target[0],target[1]-radius,target[2],1].forEach((n,i)=>destination.setFloat32(i*4,n,true));const radiusBytes=new DataView(new ArrayBuffer(4));radiusBytes.setFloat32(0,radius,true);
  solveOriginalAvatarSlide(m,0n,base+0x10n,base+0xd00n,base+0x50n,radiusBytes.getUint32(0,true),0xffffffef,false,0n,0n,{move:(_owner,_start,end)=>{
   this.queries++;const d=new DataView(end.buffer,end.byteOffset,end.byteLength),adjusted=[d.getFloat32(0,true),d.getFloat32(4,true)+radius,d.getFloat32(8,true)];let blocked=false;
   for(let i=0;i<6;i++){const contact=world.contacts(adjusted,radius).find(c=>c.depth>0);if(!contact)break;blocked=true;for(let j=0;j<3;j++)adjusted[j]+=(contact.depth+1e-6)*contact.normal[j];}
   const out=new Uint8Array(16),v=new DataView(out.buffer);[adjusted[0],adjusted[1]-radius,adjusted[2],1].forEach((n,i)=>v.setFloat32(i*4,n,true));return{blocked,position:out};
  }});this.calls++;
  const physical=avatarRead(this.state,0x10);avatarWrite(this.state,0x20,physical);avatarWrite(this.state,0x130,physical);avatarWrite(this.state,0xc80,physical);this.state.storage[0x120]=1;
  return{position:[physical[0],physical[1]+radius,physical[2]],velocity:avatarRead(this.state,0x50).slice(0,3)};
 }
}
