/** Frame-local editor allocation service. Zero-byte native requests may
 * alias the same address; each request still owns one matching release. */
export function candleRenderScratch(base:bigint,capacity:number){
 let cursor=0;const allocations=new Map<bigint,number>();
 return {
  allocate(size:number,alignment:number){
   cursor=Math.ceil(cursor/alignment)*alignment;
   if(cursor+size>capacity)throw new Error('Candle render scratch exhausted');
   const pointer=base+BigInt(cursor);cursor+=size;
   allocations.set(pointer,(allocations.get(pointer)??0)+1);return pointer;
  },
  free(pointer:bigint){
   const count=allocations.get(pointer);
   if(!count)throw new Error('Candle scratch release is not owned');
   if(count===1)allocations.delete(pointer);else allocations.set(pointer,count-1);
  },
  reset(){cursor=0;allocations.clear();},
  get pending(){return allocations.size;}
 };
}
