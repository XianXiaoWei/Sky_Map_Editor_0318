import * as THREE from 'three';
import type {ModelBakeMemory} from './model-baked-runtime';
import {originalForceVectors,wanderOriginalCreatureSteering,type CreatureWanderServices} from './creature-force-runtime';
import {seekOriginalCreatureSteering} from './creature-steering-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
/** Bounded ordinary Mote wander, 0x10062eb90. OBB projections/inverse basis
 * are editor geometry services. The distant Rail avoidance branch is supplied
 * by the editor collision sweep rather than the original ObjectBarn query. */
export function wanderMoteInRegion(m:ModelBakeMemory,state:bigint,obb:readonly number[],s:CreatureWanderServices){
 const {a,read,bytes,length,sum,squared}=originalForceVectors(s.arithmetic),axes=[0,4,8].map(at=>obb.slice(at,at+3)),center=obb.slice(12,15),position=read(m.bytes(state+32n,16)).slice(0,3).map(value);
 const extents=axes.map(v=>Math.hypot(...v)),unit=axes.map((v,i)=>v.map(n=>extents[i]>1e-5?n/extents[i]:n));
 const contains=(v:number[],radius=0)=>unit.every((axis,i)=>Math.abs(axis.reduce((n,k,j)=>n+k*(v[j]-center[j]),0))<=extents[i]-radius);
 const storeTarget=()=>{let target=[...center];for(const axis of axes){const random=a.mul(bits(s.random()|0),bits(2**-31)),twice=a.add(random,random);target=target.map((n,i)=>value(a.add(a.sub(a.mul(bits(axis[i]),twice),bits(axis[i])),bits(n))));}m.bytes(state+0xa0n,16).set(bytes([...target.map(bits),0]));};
 if(!contains(read(m.bytes(state+0xa0n,16)).slice(0,3).map(value)))storeTarget();
 const previous=m.bytes(state+0xb0n,1)[0],counter=m.read32(state+0xb4n)|0;m.write32(state+0xb4n,(counter-1)>>>0);
 if(counter<=0){m.write32(state+0xb4n,4);const inside=contains(position,value(m.read32(state+0x70n)));m.write8(state+0xb0n,Number(inside));if(!previous&&inside){const direction=new THREE.Vector3().fromArray(center).sub(new THREE.Vector3().fromArray(position)),n=direction.length();if(n>1)direction.divideScalar(n);const basis=new THREE.Matrix4().fromArray([...new Float32Array(m.bytes(state+48n,48).slice().buffer),...position,1]);direction.transformDirection(basis.invert());m.bytes(state+0x90n,16).set(bytes([...direction.toArray().map(bits),0]));}}
 const inside=!!m.bytes(state+0xb0n,1)[0];
 if(inside){wanderOriginalCreatureSteering(m,state,bits(Math.fround(.5)*Math.fround(.35)),bits(1),bits(1),bits(2),bits(1),s);seekOriginalCreatureSteering(m,state,state+0xa0n,bits(Math.fround(.5)*Math.fround(.65)),bits(0),s.arithmetic);const target=read(m.bytes(state+0xa0n,16)),delta=target.map((n,i)=>a.sub(n,m.read32(state+32n+BigInt(i*4))));if(value(sum(squared(delta)))<1)storeTarget();}
 else seekOriginalCreatureSteering(m,state,state+0xa0n,bits(.5),bits(0),s.arithmetic);
}
