/* Complete original EventBarn Update + real TransformObject virtual bodies.
 * Input is an explicitly prepared, already loaded editor state. Constructors,
 * registration/bootstrap and rendering are not asserted by this harness. */
#define SKY_TRANSFORM_OBJECT_LIBRARY
#include "native-transform-object-oracle.c"
static uint8_t sequence_scratch[0x2800],sequence_game[0x300],sequence_time[0x100];
static int scratch_token;
static void *sequence_scratch_heap(void){return &scratch_token;}
static void *sequence_allocate(void *heap,uint64_t size,void *label,uint64_t alignment){
 if(heap==&scratch_token){if(size!=0x2800||alignment!=8)exit(30);return sequence_scratch;}
 return transform_allocate(heap,size,label,alignment);
}
static void sequence_release(void *heap,void *allocation){
 if(heap!=&scratch_token||allocation!=sequence_scratch)exit(31);
}
#ifndef SKY_TRANSFORM_SEQUENCE_LIBRARY
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 map_memory((void *)0x100000000UL,0x2400000);
 if(fread((void *)0x100000000UL,1,0xd22000,file)!=0xd22000)return 4;fclose(file);
 map_memory(registry,0x9000);map_memory(objects,0x40000);map_memory(event_barn,0x105100);
 ptr((void *)0x102047c70UL,(uintptr_t)registry);ptr((void *)0x1020045b8UL,(uintptr_t)(registry+0x5000));
 ptr((void *)0x101df4208UL,(uintptr_t)(registry+0x5700));ptr((void *)0x102036c70UL,(uintptr_t)(registry+0x5900));ptr((void *)0x100c0d8d8UL,(uintptr_t)&guard);
 hook(0x1007e5f70UL,assertion);hook(0x1007e6030UL,assertion);
 hook(0x1007abc10UL,meta_object);hook(0x1007abbf0UL,meta_void);hook(0x1007abbd0UL,meta_bool);hook(0x1007fa3b0UL,meta_matrix);hook(0x1007abc60UL,meta_fallback);
 hook(0x102310100UL,meta_receiver);hook(0x102310200UL,event_meta_receiver);hook(0x102310300UL,event_parent);
 hook(0x1007c6c20UL,sequence_scratch_heap);hook(0x100795530UL,sequence_allocate);hook(0x100795a70UL,sequence_release);
 hook(0x1007e5db0UL,transform_free);hook(0x1007e50d0UL,get_pool);install_level_mesh();
 bind(0x100aa2c4eUL,strcmp);bind(0x100aa2900UL,memset);bind(0x100aa260cUL,transform_cos);bind(0x100aa2576UL,transform_acos);bind(0x100aa2bcaUL,transform_sin);
 *(uint8_t *)0x100cd3120UL=0;*(uint8_t *)0x101ffb0d0UL=0;
 if(mprotect((void *)0x100000000UL,0xc05000,5)||mprotect((void *)0x102310000UL,4096,5))return 6;
 ptr(sequence_game+0x160,(uintptr_t)sequence_time);memcpy(sequence_time+0x20,&(float){1},4);
 uint32_t count;rd(&count,4);wr(&count,4);
 while(count--){
  uint32_t h[3];rd(h,sizeof(h));object_bytes=h[0];if(object_bytes>0x40000||h[1]>1280||h[2]>512)return 9;
  setup_transform();setup_level_mesh();memset(objects,0,0x40000);memset(event_barn,0,0x105100);
  rd(objects,object_bytes);rd(event_barn,0x5040);
  float deltas[512];rd(deltas,h[2]*4);wr(h+2,4);heap_cursor=object_bytes;
  for(uint32_t i=0;i<h[2];i++){
   log_count=error_line=severity=0;memcpy(sequence_time+0x14,deltas+i,4);
   if(!setjmp(escape))((void(*)(void *,void *))0x10032ea90UL)(event_barn,sequence_game);
   uint32_t header[]={error_line,severity,log_count,object_bytes};wr(header,sizeof(header));wr(log_entries,log_count*12);wr(objects,object_bytes);wr(event_barn,0x5040);
  }
 }
 return 0;
}
#endif
