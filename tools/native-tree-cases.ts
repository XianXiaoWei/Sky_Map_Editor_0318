export const TREE_MEMORY=0x270000000n,TREE_BYTES=0x10000;
export interface NativeTreeCase {name:string;actions:{key:number;hintKey:number|null}[];}
export function nativeTreeCases():NativeTreeCase[]{
 const cases:NativeTreeCase[]=[];let seed=318;
 const random=()=>seed=(Math.imul(seed,1664525)+1013904223)>>>0;
 const add=(name:string,keys:number[],hintMode:number)=>{
  const actions=keys.map((key,i)=>({key:key>>>0,hintKey:hintMode===0||i===0?null:keys[hintMode===1?i-1:Math.floor(i/2)]>>>0}));
  cases.push({name,actions});
 };
 const boundaries=[0,1,2,31,32,63,127,0x7fffffff,0x80000000,0xfffffffe,0xffffffff];
 for(const hintMode of [0,1,2]){
  add('boundaries-'+hintMode,boundaries,hintMode);add('reverse-'+hintMode,[...boundaries].reverse(),hintMode);
  add('alternating-'+hintMode,boundaries.flatMap((v,i)=>[v,boundaries[boundaries.length-i-1]]),hintMode);
 }
 for(let i=0;i<192;i++){
  const keys=Array.from({length:1+i%63},()=>i%3===0?random()%17:random());
  add('random-'+i,keys,i%3);
 }
 for(const length of [1,2,3,4,7,15,31,63])for(const direction of [1,-1]){
  const keys=Array.from({length},(_,i)=>direction>0?i*2:(length-i)*2);
  const actions=keys.map(key=>({key,hintKey:null as number|null}));
  for(const hintKey of keys)for(const key of [keys[0],keys[length-1],0xffffffff,1,keys[Math.floor(length/2)]])actions.push({key,hintKey});
  cases.push({name:`all-hints-${length}-${direction}`,actions});
 }
 return cases;
}
export function nativeTreeMemory():Buffer {
 const b=Buffer.alloc(TREE_BYTES,0xa5);b.writeBigUInt64LE(TREE_MEMORY+0x1008n,0x1000);b.writeBigUInt64LE(0n,0x1008);b.writeBigUInt64LE(0n,0x1010);
 b.writeBigUInt64LE(0n,0x8010);b.writeBigUInt64LE(0x1122334455667788n,0x8018);return b;
}
