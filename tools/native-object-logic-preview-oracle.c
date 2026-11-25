/* Whole original Barn/derived/Clump/endpoint/reflector bodies; prepared
 * constructor/field states, registered metadata and runtime services explicit. */
#define SKY_TRANSFORM_SEQUENCE_LIBRARY
#include "native-transform-sequence-oracle.c"
static void *preview_event_type(void){return registry+0x5700;}
static void *preview_clump_receiver(void){return registry+0x8000;}
static void preview_convert(void *type,void *out,void *in,void *source){
 if(type==registry+0x5700&&source==registry+0x5100){
  uint8_t *p=*(void **)in;uint32_t id=p?u32(p):0;void *event=p&&(id==3||id==4||id==5||id==6||id==9||id==10||id==11||id==13||id==14)?p-8:NULL;memcpy(out,&event,8);
 }else if(type==registry+0x8d00){void *p=*(void **)in;*(void **)out=p&&u32(p)==1?p:NULL;
 }else if(type==registry+0x8000)memcpy(out,in,8);
 else level_mesh_convert(type,out,in,source);
}
static void preview_metadata(void){
 for(int id=4;id<=9;id+=5){
  uint8_t *meta=registry+(id==4?0x8100:0x8200);ptr(meta,(uintptr_t)vt);memcpy(meta+56,&id,4);
  ptr(registry+0x98+id*8,(uintptr_t)meta);ptr(meta+0x50,(uintptr_t)(registry+0x6080));ptr(meta+0x30,0x102310300UL);
 }
 uint8_t *meta=registry+0x8300;ptr(meta,(uintptr_t)vt);memcpy(meta+56,&(uint32_t){2},4);ptr(registry+0x98+2*8,(uintptr_t)meta);
 ptr(meta+0x50,(uintptr_t)(registry+0x8400));ptr(registry+0x8408,(uintptr_t)(registry+0x8440));
 ptr(registry+0x8460,(uintptr_t)(registry+0x8500));ptr(registry+0x8468,(uintptr_t)(registry+0x8600));strcpy((char *)registry+0x8500,"SetEnabled");
 ptr(registry+0x8638,0x10022b7f0UL);ptr(registry+0x8648,0x10022c720UL);ptr(registry+0x8658,0x102310500UL);ptr(registry+0x8000,(uintptr_t)vt);
 for(int id=1;id<=6;id+=(id==1?4:1)){
  uint8_t *meta=registry+(id==1?0x8700:id==5?0x8800:0x8900);ptr(meta,(uintptr_t)vt);memcpy(meta+56,&id,4);ptr(registry+0x98+id*8,(uintptr_t)meta);ptr(meta+0x50,(uintptr_t)(registry+0x6080));if(id!=1)ptr(meta+0x30,0x102310300UL);
 }
 uint8_t *set_meta=registry+0x8a00;ptr(set_meta,(uintptr_t)vt);memcpy(set_meta+56,&(uint32_t){10},4);ptr(registry+0x98+10*8,(uintptr_t)set_meta);ptr(set_meta+0x50,(uintptr_t)(registry+0x6080));ptr(set_meta+0x30,0x102310300UL);
 for(int id=11;id<=13;id+=2){uint8_t *meta=registry+(id==11?0x8b00:0x8c00);ptr(meta,(uintptr_t)vt);memcpy(meta+56,&id,4);ptr(registry+0x98+id*8,(uintptr_t)meta);ptr(meta+0x50,(uintptr_t)(registry+0x6080));ptr(meta+0x30,0x102310300UL);}
 ptr(registry+0x8d00,(uintptr_t)vt);
}
static float preview_log(float a){return math_trace(10,a,logf(a));}
static float preview_exp(float a){return math_trace(11,a,expf(a));}
static void *preview_allocate(void *heap,uint64_t size,void *label,uint64_t alignment){
 if(heap==&scratch_token)return sequence_allocate(heap,size,label,alignment);
 log_service(6,NULL,size);log_service(7,NULL,alignment);heap_cursor=(heap_cursor+alignment-1)&~(alignment-1);
 void *p=objects+heap_cursor;heap_cursor+=size;if(heap_cursor>object_bytes)exit(32);return p;
}
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *file=fopen(argv[1],"rb");if(!file)return 3;map_memory((void *)0x100000000UL,0x2400000);
 if(fread((void *)0x100000000UL,1,0xd22000,file)!=0xd22000)return 4;fclose(file);
 map_memory(registry,0x9000);map_memory(objects,0x40000);map_memory(event_barn,0x105100);
 ptr((void *)0x102047c70UL,(uintptr_t)registry);ptr((void *)0x1020045b8UL,(uintptr_t)(registry+0x5000));
 ptr((void *)0x101df4208UL,(uintptr_t)(registry+0x5700));ptr((void *)0x102036c70UL,(uintptr_t)(registry+0x5900));ptr((void *)0x100c0d8d8UL,(uintptr_t)&guard);
 ptr((void *)0x10203aa30UL,(uintptr_t)(registry+0x8d00));
 hook(0x1007e5f70UL,assertion);hook(0x1007e6030UL,assertion);hook(0x1007abc10UL,meta_object);hook(0x1007abbf0UL,meta_void);hook(0x1007abbd0UL,meta_bool);hook(0x1007fa3b0UL,meta_matrix);hook(0x1007abc60UL,meta_fallback);
 hook(0x10032e2b0UL,preview_event_type);hook(0x1007b0280UL,preview_event_type);
 hook(0x102310100UL,meta_receiver);hook(0x102310200UL,event_meta_receiver);hook(0x102310300UL,event_parent);hook(0x102310500UL,preview_clump_receiver);
 hook(0x1007c6c20UL,sequence_scratch_heap);hook(0x100795530UL,preview_allocate);hook(0x100795a70UL,sequence_release);hook(0x1007e5db0UL,transform_free);hook(0x1007e50d0UL,get_pool);install_level_mesh();vt[0x40/8]=(uintptr_t)preview_convert;
 bind(0x100aa2c4eUL,strcmp);bind(0x100aa2900UL,memset);bind(0x100aa260cUL,transform_cos);bind(0x100aa2576UL,transform_acos);bind(0x100aa2bcaUL,transform_sin);
 bind(0x100aa2858UL,preview_log);bind(0x100aa2708UL,preview_exp);
 bind(0x100aa28f4UL,memcpy);bind(0x100aa24aaUL,bzero);
 *(uint8_t *)0x100cd3120UL=0;*(uint8_t *)0x101ffb0d0UL=0;
 if(mprotect((void *)0x100000000UL,0xc05000,5)||mprotect((void *)0x102310000UL,4096,5))return 6;
 ptr(sequence_game+0x160,(uintptr_t)sequence_time);memcpy(sequence_time+0x20,&(float){1},4);
 uint32_t count;rd(&count,4);wr(&count,4);
 while(count--){
  uint32_t h[4];rd(h,sizeof(h));object_bytes=h[0];heap_cursor=h[3];if(object_bytes>0x40000||h[1]>1280||h[2]>512)return 9;
  setup_transform();setup_level_mesh();preview_metadata();memset(objects,0,0x40000);memset(event_barn,0,0x105100);
  rd(objects,object_bytes);rd(event_barn,0x5040);float deltas[512];rd(deltas,h[2]*4);wr(h+2,4);
  for(uint32_t i=0;i<h[2];i++){
   log_count=error_line=severity=0;memcpy(sequence_time+0x14,deltas+i,4);
   if(!setjmp(escape))((void(*)(void *,void *))0x10032ea90UL)(event_barn,sequence_game);
   uint32_t header[]={error_line,severity,log_count,object_bytes,heap_cursor};wr(header,sizeof(header));wr(log_entries,log_count*12);wr(objects,object_bytes);wr(event_barn,0x5040);
  }
 }
 return 0;
}
