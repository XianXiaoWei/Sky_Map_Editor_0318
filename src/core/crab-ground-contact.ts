import type {CreatureWorldServices} from './creature-world-runtime';
import {numericFloatBits as bits} from './object-numeric-runtime';
const bytes=(v:readonly number[])=>new Uint8Array(Float32Array.from(v).buffer),read=(b:Uint8Array)=>Array.from(new Float32Array(b.buffer,b.byteOffset,b.length/4));
/** Editor collision adapter for the original AI velocity. Feet cast starts
 * close to the previous contact, so a wall roof cannot become a new floor. */
export function crabGroundContact(before:readonly number[],wanted:readonly number[],velocity:readonly number[],delta:number,radius:number,raycast:CreatureWorldServices['raycast']){
 const next=[...wanted],speed=[...velocity],horizontal=Math.hypot(speed[0],speed[2]);
 if(horizontal>1e-5){const hit=raycast(0n,bytes([before[0],before[1]+.1,before[2],0]),bytes([speed[0]/horizontal,0,speed[2]/horizontal,0]),bits(horizontal*delta+Math.max(.1,radius)),42);if(hit.hit&&hit.active&&read(hit.normal)[1]<=.5){next[0]=before[0];next[2]=before[2];speed[0]=speed[2]=0;}}
 const ground=raycast(0n,bytes([next[0],before[1]+.10000000149011612,next[2],0]),bytes([0,-1,0,0]),bits(1.5),42),point=read(ground.position),normal=read(ground.normal),rise=point[1]-before[1];
 const grounded=ground.hit&&ground.active&&point.slice(0,3).every(Number.isFinite)&&normal.slice(0,3).every(Number.isFinite)&&normal[1]>.5&&rise<=.101&&rise>=-.5;
 if(grounded){next[1]=Math.abs(rise)<.001?before[1]:point[1];speed[1]=(next[1]-before[1])/delta;}
 else{next.splice(0,3,...before.slice(0,3));speed.fill(0);}
 return {position:next,velocity:speed,grounded,normal};
}
