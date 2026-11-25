/* Execute unchanged LevelMesh setters/find/update and Model forwarding.
 * Vertex upload, resource manager/ref lifecycle and pool are ABI services. */
#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t *memory=(void*)0x300000000UL;
static uint32_t events[256][8],count,line,severity,growth,config[3];
static jmp_buf escape;
static uint32_t off(void*p){return p?(uint32_t)((uint8_t*)p-memory):0;}
static uint32_t hash(const char*p){uint32_t n=2166136261U;while(*p)n=(n^(uint8_t)*p++)*16777619U;return n;}
static uint32_t u32(void*p){uint32_t n;memcpy(&n,p,4);return n;}
static void record(uint32_t type,uint32_t a,uint32_t b,uint32_t c,uint32_t d,uint32_t e,uint32_t f,uint32_t g){if(count==256)exit(9);uint32_t row[]={type,a,b,c,d,e,f,g};memcpy(events[count++],row,32);}
static void mutate(void){if(config[2]==1)memcpy(memory+0x208c,&(uint32_t){1},4);if(config[2]==2)memcpy(memory+0x220,&(uint32_t){1},4);if(config[2]==3)memory[0xa32]=1;}
static uint32_t find(void*vertex,char*name){record(1,off(vertex),hash(name),0,0,0,0,0);return config[0];}
static void scalar(void*vertex,uint32_t index,float value){uint32_t bits;memcpy(&bits,&value,4);record(2,off(vertex),index,bits,0,0,0,0);mutate();}
static void vector(void*vertex,uint32_t index,void*value){record(3,off(vertex),index,u32(value),u32((uint8_t*)value+4),u32((uint8_t*)value+8),u32((uint8_t*)value+12),0);mutate();}
static void texture(void*vertex,uint32_t index,void*tex,void*sampler){record(4,off(vertex),index,off(tex),off(sampler),0,0,0);mutate();}
static void*resource_class(void){record(10,0,0,0,0,0,0,0);return memory+0xc000;}
static void*resource_find(void*context,void*type,char*name){record(11,off(context),off(type),hash(name),0,0,0,0);return config[1]?memory+0xc100:NULL;}
static void observe(void*resource,void*ref){record(12,off(resource),0,0,0,0,0,0);*(void**)ref=memory+0xc300;}
static void missing(void*context,void*type,char*name){record(13,off(context),off(type),hash(name),0,0,0,0);}
static void detach(void*ref){(void)ref;record(14,0,0,0,0,0,0,0);}
static void*object_type(void){record(30,0,0,0,0,0,0,0);return memory+0xe200;}
static void*mesh_type(void){record(31,0,0,0,0,0,0,0);return memory+0xe300;}
static void cast_mesh(void*type,void**out,void**input,void*source){record(32,off(type),off(*input),off(source),0,0,0,0);*out=*input;}
static void start_event(void*event){record(34,off(event),0,0,0,0,0,0);}
static void*pool(void){record(20,0,0,0,0,0,0,0);return memory+0xe000;}
static void*allocate(void*p,uint64_t n){(void)p;void*out=memory+growth;record(21,n,growth,0,0,0,0,0);growth+=n;if(growth>0x10000)exit(10);return out;}
static void release(void*p,void*data){(void)p;record(22,off(data),0,0,0,0,0,0);memset(data,0xdd,64);}
static void assertion(const char*expr,const char*file,uint32_t at,uint32_t sev,...){(void)expr;(void)file;line=at;severity=sev;longjmp(escape,1);}
static void hook(uintptr_t at,void*fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static void bind(uintptr_t stub,void*fn){int32_t rel;memcpy(&rel,(void*)(stub+2),4);memcpy((void*)(stub+6+rel),&fn,8);}
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(11);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(12);}
static float fp(uint32_t bits){float f;memcpy(&f,&bits,4);return f;}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);
 if(mmap(memory,65536,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 hook(0x1007e5f70UL,assertion);hook(0x1007e6030UL,assertion);
 hook(0x1007bdb60UL,find);hook(0x1007be0b0UL,scalar);hook(0x1007be290UL,vector);hook(0x1007be9c0UL,texture);
 hook(0x10079ac90UL,resource_class);hook(0x1007c4360UL,resource_find);hook(0x1007c2310UL,observe);hook(0x1007c4640UL,missing);hook(0x1007c2570UL,detach);
 hook(0x1007e50d0UL,pool);hook(0x1007e5790UL,allocate);hook(0x1007e5db0UL,release);
 hook(0x1007abc10UL,object_type);hook(0x1003ffcf0UL,mesh_type);hook(0x100020000UL,cast_mesh);hook(0x10032ef60UL,start_event);
 bind(0x100aa28f4UL,memcpy);bind(0x100aa28faUL,memmove);bind(0x100aa2c4eUL,strcmp);
 *(void**)0x100c0d8d8UL=memory+0xe100;
 if(mprotect((void*)0x100000000UL,0xc05000,5))return 7;
 uint32_t total;rd(&total,4);wr(&total,4);while(total--){uint32_t n,actions[32][6];rd(config,12);rd(&n,4);if(n>32)return 8;rd(actions,n*24);rd(memory,65536);growth=0xf000;
  for(uint32_t i=0;i<n;i++){count=line=severity=0;uint32_t*a=actions[i],result=0;
   if(!setjmp(escape)){
    if(a[0]==0)((void(*)(void*,uint32_t,void*,float,float))0x1003ffe90UL)(memory,a[1],memory+a[2],fp(a[4]),fp(a[5]));
    else if(a[0]==1)((void(*)(void*,uint32_t,void*,void*,float))0x1003fff20UL)(memory,a[1],memory+a[2],memory+a[3],fp(a[5]));
    else if(a[0]==2)((void(*)(void*,uint32_t,void*,void*))0x1003fffc0UL)(memory,a[1],memory+a[2],memory+a[3]);
    else if(a[0]==3)((void(*)(void*,void*,float))0x100402060UL)(memory,memory+0xb000,fp(a[4]));
    else if(a[0]==4)result=off(((void*(*)(void*,uint32_t,void*,uint32_t))0x100400c80UL)(memory,a[1],memory+a[2],a[4]));
    else if(a[0]==5)((void(*)(void*,uint32_t,uint32_t,float))0x100466710UL)(memory+0x2000,a[1],a[2],fp(a[4]));
    else if(a[0]==6)((void(*)(void*,uint32_t,uint32_t,void*))0x1004669b0UL)(memory+0x2000,a[1],a[2],memory+a[3]);
    else if(a[0]==7)((void(*)(void*,uint32_t,uint32_t,void*,void*))0x100466e30UL)(memory+0x2000,a[1],a[2],a[3]?memory+a[3]:NULL,a[4]?memory+a[4]:NULL);
    else if(a[0]==8)result=((uint32_t(*)(void*,uint32_t,void*))0x1004666a0UL)(memory+0x2000,a[1],memory+a[2]);
    else if(a[0]==9){*(uint8_t*)0x101ffb0d0UL=0;((void(*)(void*,void*))0x100592940UL)(memory+0x8000,memory+0xb000);}
    else return 13;
   }
   uint32_t out[]={line,severity,result,count};wr(out,16);wr(events,count*32);wr(memory,65536);
  }
 }return 0;}
