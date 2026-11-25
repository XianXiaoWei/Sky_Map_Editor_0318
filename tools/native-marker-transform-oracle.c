/* SHA-gated by the TS driver. Original Marker/factory/wrapper/OBB bodies run
 * unchanged; startup registry, casts, Matrix4 conversion and libc are services. */
#define main foundation_main
#include "native-object-foundation-oracle.c"
#undef main
static uint8_t *barn=(void *)0x290000000UL;
static uint32_t flags;
static void *meta_object(void){return registry+0x5100;}
static void *meta_matrix(void *ignored){(void)ignored;return registry+0x5200;}
static void *meta_void(void){return registry+0x5400;}
static void *meta_bool(void *ignored){(void)ignored;return registry+0x5300;}
static void *meta_receiver(void){return registry+0x5500;}
static void *meta_parent(void){log_service(4,NULL,0);return registry+0x5600;}
static void *meta_fallback(void){log_service(5,NULL,0);return registry+0x5600;}
static void *marker_asclass(void *meta){log_service(1,meta,0);return flags&16?NULL:meta;}
static uint32_t pointer_code(void *p){if(!p)return UINT32_MAX;if((uint8_t *)p>=barn&&(uint8_t *)p<barn+0x15000)return 0x10000+(uint8_t *)p-barn;return (uint8_t *)p-objects;}
static void marker_convert(void *type,void *out,void *in,void *source){
 if(type==registry+0x5500){void *p=*(void **)in;log_service(2,type,pointer_code(p));*(void **)out=flags&1?NULL:(uint8_t *)p-8;}
 else {log_service(3,type,(uint8_t *)source-registry);memcpy(out,in,type==registry+0x5300?1:64);}
}
static void ptr(void *at,uintptr_t value){memcpy(at,&value,8);}
static void map_memory(void *at,size_t n){if(mmap(at,n,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)exit(5);}
static void setup(void){
 memset(registry,0,0x7000);memcpy(registry+0x5038,&(uint32_t){12},4);ptr(registry+0x98+12*8,(uintptr_t)(registry+0x5000));
 for(int i=0;i<7;i++)ptr(registry+0x5000+i*256,(uintptr_t)vt);
 ptr(registry+0x5050,(uintptr_t)(registry+0x6000));ptr(registry+0x5650,(uintptr_t)(registry+0x6080));
 if(flags&32){ptr(registry+0x5030,0x102310000UL);ptr(registry+0x5650,(uintptr_t)(registry+0x6000));ptr(registry+0x5050,(uintptr_t)(registry+0x6080));}
 const char *names[]={"GetEnabled","GetObb","GetTransform","SetEnabled","SetTransform"};
 uintptr_t members[]={0x11,0x21,0x19,0x10043cff0UL,0x10043ccd0UL};
 uintptr_t wrappers[]={0x10043e820UL,0x10043e640UL,0x10043e640UL,0x10043e700UL,0x10043e520UL};
 for(int i=0;i<5;i++){
  uint8_t *node=registry+0x6100+i*64,*desc=registry+0x6400+i*128,*name=registry+0x6800+i*32;
  strcpy((char *)name,names[i]);if(flags&8)name[0]+=32;
  ptr(node+0x20,(uintptr_t)name);ptr(node+0x28,(uintptr_t)desc);
  ptr(desc+0x38,members[i]);ptr(desc+0x48,wrappers[i]);ptr(desc+0x58,0x102310100UL);
 }
 // Balanced case-sensitive std::map tree, owned by registry bootstrap.
 ptr(registry+0x6008,(uintptr_t)(registry+0x6180));
 ptr(registry+0x6180,(uintptr_t)(registry+0x6100));ptr(registry+0x6188,(uintptr_t)(registry+0x61c0));
 ptr(registry+0x6108,(uintptr_t)(registry+0x6140));ptr(registry+0x61c8,(uintptr_t)(registry+0x6200));
 if(flags&2)ptr(registry+0x6008,0);if(flags&64)ptr(registry+0x6200+0x28,0);
}
#ifndef SKY_MARKER_TRANSFORM_LIBRARY
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *f=fopen(argv[1],"rb");if(!f)return 3;
 map_memory((void *)0x100000000UL,0x2400000);if(fread((void *)0x100000000UL,1,0xd22000,f)!=0xd22000)return 4;fclose(f);
 map_memory(registry,0x7000);map_memory(objects,0x1000);map_memory(barn,0x15000);
 ptr((void *)0x102047c70UL,(uintptr_t)registry);ptr((void *)0x1020045b8UL,(uintptr_t)(registry+0x5000));
 ptr((void *)0x102004830UL,(uintptr_t)(registry+0x5000));
 ptr((void *)0x100c0d8d8UL,(uintptr_t)&guard);
 hook(0x1007e5f70UL,assertion);hook(0x1007abc10UL,meta_object);hook(0x1007abbf0UL,meta_void);hook(0x1007abbd0UL,meta_bool);hook(0x1007fa3b0UL,meta_matrix);hook(0x1007abc60UL,meta_fallback);
 hook(0x102310000UL,meta_parent);hook(0x102310100UL,meta_receiver);
 vt[0x68/8]=(uintptr_t)marker_asclass;vt[0x40/8]=(uintptr_t)marker_convert;
 bind(0x100aa2c4eUL,strcmp);bind(0x100aa2900UL,memset);*(uint8_t *)0x100cd3120UL=0;
 if(mprotect((void *)0x100000000UL,0xc05000,5)||mprotect((void *)0x102310000UL,4096,5))return 6;
 uint32_t count;rd(&count,4);wr(&count,4);
 while(count--){
  uint32_t h[4];rd(h,16);flags=h[1];setup();rd(objects,80);rd(objects+0x100,64);rd(objects+0x140,64);
  uint8_t *body=objects;uint8_t out[4][64] __attribute__((aligned(16))),ext[16],reused[80];uint32_t life[4]={0};
  memset(out,0xa5,sizeof out);memset(ext,0xa5,16);memset(reused,0xa5,80);error_line=severity=log_count=0;
  if(!setjmp(escape)){
   if(h[0]==3){memset(barn,0,0x15000);((void *(*)(void *,void *))0x10043eaa0UL)(NULL,barn);((void (*)(void *))0x10043d020UL)(barn);body=((void *(*)(void *,void *))0x10043d6a0UL)(barn,NULL);memcpy(body,objects,80);}
   void *object=flags&4?NULL:body+8;
   if(h[0]==1)((void (*)(void *,void *))0x10043ccd0UL)(body,objects+0x100);
   if(h[0]==3){((void (*)(void *,uint8_t))0x1004d1f60UL)(object,0);log_service(10,NULL,((uint8_t (*)(void *))0x1004d2050UL)(object));}
   if(h[0]==2||h[0]==3)((void (*)(void *,void *))0x1004d1d50UL)(object,objects+0x100);
   if(h[0]==4||h[0]==5){void *args[]={objects+0x100,registry+0x5200};((void (*)(uintptr_t,uintptr_t,void *,void *,void *,void **,uint32_t))(h[0]==4?0x10043e520UL:0x10043e640UL))(h[0]==4?0x10043ccd0UL:0x19,h[3],body-h[3],out[0],registry+0x5200,args,h[2]);}
   if(h[0]==6){if(h[3]>16||h[3]%16)exit(9);((void (*)(void *,void *))0x10043ccd0UL)(body,body+h[3]);}
   if(h[0]==7){if(h[3]>16||h[3]%16)exit(9);((void *(*)(void *,void *))0x10043e2d0UL)(body+h[3],body);memcpy(out[0],body+h[3],64);}
   else if(h[0]==8){uint8_t *dest=h[3]==1?objects+0x100:h[3]==2?objects+0x140:out[0];((void *(*)(void *,void *,void *))0x100076df0UL)(dest,objects+0x100,objects+0x140);memcpy(out[0],dest,64);}
   else {
    if(h[0]==2||h[0]==3){((void *(*)(void *,void *))0x1004d1e40UL)(out[0],object);((void *(*)(void *,void *))0x1004d2140UL)(out[1],object);}
    else {((void *(*)(void *,void *))0x10043e2d0UL)(out[0],body);((void *(*)(void *,void *))0x10043e470UL)(out[1],body);}
    ((void *(*)(void *,void *))0x10043e4b0UL)(out[2],body);((void *(*)(void *,void *))0x1004d2260UL)(ext,object);
   }
   if(h[0]==3){((void (*)(void *,uint8_t))0x1004d1f60UL)(object,1);log_service(10,NULL,((uint8_t (*)(void *))0x1004d2050UL)(object));memcpy(objects,body,80);life[0]=u32(barn+0x18);((void (*)(void *,void *))0x10043d7a0UL)(barn,body);life[1]=u32(barn+0x18);void *p=((void *(*)(void *,void *))0x10043d6a0UL)(barn,NULL);life[2]=u32(barn+0x140b0);life[3]=(uint8_t *)p-barn-0xb0;memcpy(reused,p,80);body=objects;}
  }
  uint32_t result[]={error_line,severity,log_count};wr(result,12);wr(life,16);wr(log_entries,log_count*12);wr(body,80);wr(out,3*64);wr(ext,16);wr(reused,80);
 }
 return 0;
}

#endif
