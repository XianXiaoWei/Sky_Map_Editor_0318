/* Original placement/load/start/enable/resume/stop/update and Event dispatch.
 * Registry bootstrap, casts, matrix conversion, Heap, libc/libm are services. */
#define SKY_MARKER_TRANSFORM_LIBRARY
#include "native-marker-transform-oracle.c"
static uint32_t heap_cursor,snapshots;
static uint8_t states[64][0x40000];
static uint32_t object_bytes=0x10000;
static uint32_t sequences[64];
static void *event_meta_receiver(void){return registry+0x5c00;}
static void *event_parent(void){return registry+0x5700;}
static void *transform_asclass(void *type){uint32_t id=u32((uint8_t *)type+0x38);log_service(1,type,0);if(id>=15){log_service(60,type,id);error_line=0xfffffffe;longjmp(escape,1);}return type;}
static void transform_convert(void *type,void *out,void *in,void *source){
 if(type==registry+0x5500||type==registry+0x5c00){void *p=*(void **)in;log_service(2,type,pointer_code(p));*(void **)out=(uint8_t *)p-8;}
 else{log_service(3,type,(uint8_t *)source-registry);memcpy(out,in,type==registry+0x5100?8:type==registry+0x5300?1:64);}
}
static void *transform_allocate(void *heap,uint64_t bytes,void *label,uint64_t alignment){(void)heap;(void)label;log_service(6,NULL,bytes);log_service(7,NULL,alignment);void *p=objects+heap_cursor;heap_cursor+=(bytes+15)&~15UL;if(heap_cursor>0x8000)exit(20);return p;}
static float math_trace(uint32_t kind,float a,float b){uint32_t in,out;memcpy(&in,&a,4);memcpy(&out,&b,4);log_service(20+kind,NULL,in);log_service(24+kind,NULL,out);return b;}
static float transform_cos(float a){return math_trace(0,a,cosf(a));}
static float transform_acos(float a){return math_trace(1,a,acosf(a));}
static float transform_sin(float a){return math_trace(2,a,sinf(a));}
static void transform_free(void *pool,void *p){(void)pool;log_service(8,NULL,pointer_code(p));}
static void capture(void){if(snapshots>=64)exit(21);memcpy(states[snapshots],objects,object_bytes);sequences[snapshots++]=u32(event_barn+16);}
static void setup_transform(void){
 flags=0;setup();ptr(registry+0x98+7*8,(uintptr_t)(registry+0x5700));ptr(registry+0x98+3*8,(uintptr_t)(registry+0x5800));ptr(registry+0x98+14*8,(uintptr_t)(registry+0x5900));ptr(registry+0x98+15*8,(uintptr_t)(registry+0x5a00));
 for(int i=7;i<=12;i++)ptr(registry+0x5000+i*256,(uintptr_t)vt);
 memcpy(registry+0x5738,&(uint32_t){7},4);memcpy(registry+0x5838,&(uint32_t){3},4);memcpy(registry+0x5938,&(uint32_t){14},4);memcpy(registry+0x5a38,&(uint32_t){15},4);
 ptr(registry+0x5750,(uintptr_t)(registry+0x6c00));ptr(registry+0x5850,(uintptr_t)(registry+0x6080));ptr(registry+0x5950,(uintptr_t)(registry+0x6080));ptr(registry+0x5830,0x102310300UL);ptr(registry+0x5930,0x102310300UL);
 ptr(registry+0x6c08,(uintptr_t)(registry+0x6c80));ptr(registry+0x6c88,(uintptr_t)(registry+0x6cc0));
 ptr(registry+0x6ca0,(uintptr_t)(registry+0x6800));ptr(registry+0x6ca8,(uintptr_t)(registry+0x6d00));ptr(registry+0x6ce0,(uintptr_t)(registry+0x6860));ptr(registry+0x6ce8,(uintptr_t)(registry+0x6d80));
 ptr(registry+0x6d38,0x10032e2e0UL);ptr(registry+0x6d48,0x10032fe80UL);ptr(registry+0x6d58,0x102310200UL);
 ptr(registry+0x6db8,0x10032e2c0UL);ptr(registry+0x6dc8,0x10032fd60UL);ptr(registry+0x6dd8,0x102310200UL);
}

#include "native-level-mesh-services.h"
#ifndef SKY_TRANSFORM_OBJECT_LIBRARY
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *f=fopen(argv[1],"rb");if(!f)return 3;map_memory((void *)0x100000000UL,0x2400000);if(fread((void *)0x100000000UL,1,0xd22000,f)!=0xd22000)return 4;fclose(f);
 map_memory(registry,0x9000);map_memory(objects,0x40000);map_memory(event_barn,0x105100);
 ptr((void *)0x102047c70UL,(uintptr_t)registry);ptr((void *)0x1020045b8UL,(uintptr_t)(registry+0x5000));ptr((void *)0x101df4208UL,(uintptr_t)(registry+0x5700));ptr((void *)0x102036c70UL,(uintptr_t)(registry+0x5900));ptr((void *)0x100c0d8d8UL,(uintptr_t)&guard);
 hook(0x1007e5f70UL,assertion);hook(0x1007e6030UL,assertion);hook(0x1007abc10UL,meta_object);hook(0x1007abbf0UL,meta_void);hook(0x1007abbd0UL,meta_bool);hook(0x1007fa3b0UL,meta_matrix);hook(0x1007abc60UL,meta_fallback);
 hook(0x102310100UL,meta_receiver);hook(0x102310200UL,event_meta_receiver);hook(0x102310300UL,event_parent);hook(0x100795530UL,transform_allocate);hook(0x1007e5db0UL,transform_free);hook(0x1007e50d0UL,get_pool);
 install_level_mesh();
 bind(0x100aa2c4eUL,strcmp);bind(0x100aa2900UL,memset);bind(0x100aa260cUL,transform_cos);bind(0x100aa2576UL,transform_acos);bind(0x100aa2bcaUL,transform_sin);*(uint8_t *)0x100cd3120UL=0;
 if(mprotect((void *)0x100000000UL,0xc05000,5)||mprotect((void *)0x102310000UL,4096,5))return 6;
 uint32_t count;rd(&count,4);wr(&count,4);
 while(count--){uint32_t h[4];rd(h,16);if(h[0]>60)return 9;setup_transform();setup_level_mesh();object_bytes=h[3]?h[3]:0x10000;if(object_bytes<0x10000||object_bytes>0x40000)return 22;rd(objects,object_bytes);uint32_t actions[60][4];rd(actions,h[0]*16);memset(event_barn,0,0x105100);heap_cursor=0x4000;error_line=severity=log_count=snapshots=0;
  *(uint8_t *)0x101ffb0d0UL=objects[0xa040];memcpy((void *)0x100cb8540UL,objects+0xa044,4);
  if(!setjmp(escape)){
   uint8_t saved[216];memcpy(saved,objects,216);((void *(*)(void *,void *))0x1006d94c0UL)(NULL,objects);
   if(!h[1]){memcpy(objects+12,saved+12,1);memcpy(objects+16,saved+16,40);memcpy(objects+56,saved+56,100);}capture();
   for(uint32_t i=0;i<h[0];i++){
    uint32_t *a=actions[i];
    if((a[0]==2||a[0]==9)&&*(float *)(objects+164)==0&&(objects[152]||objects[122]||(u64(objects+88)&&!h[2]))){error_line=0xfffffffd;log_service(61,NULL,objects[152]?1:objects[122]?2:3);break;}
    switch(a[0]){
     case 0:((void (*)(void *,void *,void *))0x1006d5d80UL)(objects,objects+0xa000,event_barn+0x85098);break;
     case 1:((void (*)(void *,void *))0x1006d6090UL)(objects,objects+0xa000);break;
     case 2:((void (*)(void *,void *))0x1006d6380UL)(objects,objects+0xa000);break;
     case 3:((void (*)(void *,void *))0x1006d6370UL)(objects,objects+0xa000);break;
     case 4:((void (*)(void *,void *))0x1006d9160UL)(objects,objects+0xa000);break;
     case 5:((void (*)(void *,void *))0x1006d62e0UL)(objects,objects+0xa000);break;
     case 6:((void (*)(void *))0x1006d9240UL)(objects);break;
     case 7:memcpy(objects+a[1],a+2,4);break;
     case 8:((void (*)(void *))0x10032e2f0UL)(objects);break;
     case 9:((void (*)(void *,void *,void *))0x10032f5b0UL)(event_barn,objects,objects+0xa000);break;
     case 10:log_service(9,NULL,((uint8_t (*)(void *))0x1006d9150UL)(objects));break;
     default:return 10;
    }capture();
   }
  }
  uint32_t result[]={error_line,severity,log_count,snapshots};wr(result,16);wr(log_entries,log_count*12);for(uint32_t i=0;i<snapshots;i++){wr(states[i],object_bytes);wr(sequences+i,4);}wr(objects,object_bytes);wr(event_barn+16,4);
 }
 return 0;
}

#endif
