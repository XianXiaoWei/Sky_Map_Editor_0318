/** Bounded resource reuse. Values larger than the budget remain uncached. */
export class ByteCache<K,V>{
  private entries=new Map<K,{value:V;bytes:number}>();
  private used=0;
  constructor(private maximum:number){if(!Number.isSafeInteger(maximum)||maximum<0)throw new Error('资源缓存预算无效');}
  get(key:K){const entry=this.entries.get(key);if(!entry)return undefined;this.entries.delete(key);this.entries.set(key,entry);return entry.value;}
  set(key:K,value:V,bytes:number){
    if(!Number.isSafeInteger(bytes)||bytes<0)throw new Error('资源缓存大小无效');
    const old=this.entries.get(key);if(old){this.used-=old.bytes;this.entries.delete(key);}
    if(bytes>this.maximum)return;
    while(this.used+bytes>this.maximum){const first=this.entries.keys().next().value as K;const entry=this.entries.get(first)!;this.used-=entry.bytes;this.entries.delete(first);}
    this.entries.set(key,{value,bytes});this.used+=bytes;
  }
  clear(){this.entries.clear();this.used=0;}
  get bytes(){return this.used;}
}
