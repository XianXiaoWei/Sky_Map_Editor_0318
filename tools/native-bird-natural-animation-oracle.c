#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t*arena=(void*)0x440000000UL;static jmp_buf escape;static uint32_t line,severity,trace[512],used,finds;
static uint32_t u32(size_t at){uint32_t n;memcpy(&n,arena+at,4);return n;}static void w32(size_t at,uint32_t n){memcpy(arena+at,&n,4);}
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[14]={0xff,0x25};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static void logop(uint32_t op,void*p,uint32_t a,uint32_t b,uint32_t c,uint32_t d){if(used+6>512)exit(12);trace[used++]=op;trace[used++]=(uintptr_t)p-(uintptr_t)arena;trace[used++]=a;trace[used++]=b;trace[used++]=c;trace[used++]=d;}
static uint64_t hash(char*p){uint64_t h=0xcbf29ce484222325UL;for(;*p;p++)h=(h^(uint64_t)(int64_t)(int8_t)*p)*0x100000001b3UL;return h;}
static void assertion(char*x,char*f,uint32_t l,uint32_t s,...){(void)x;(void)f;line=l;severity=s;longjmp(escape,1);}
static void* find_action(void*p,char*name,int32_t*out1,int32_t*out2,int32_t*out3,uint32_t required){(void)out1;(void)out2;(void)out3;uint64_t h=hash(name);logop(1,p,h,h>>32,required,0);finds++;uint32_t c=u32(0x1f000);if(c==3)w32(0x5218,0);return c==1||(c==2&&finds==2)?0:arena+0x7000;}
static void play(void*p,int32_t index,uint32_t flags,float weight,float speed){uint32_t a,b;memcpy(&a,&weight,4);memcpy(&b,&speed,4);logop(2,p,index,flags,a,b);memcpy((uint8_t*)p+0x20,&index,4);uint32_t c=u32(0x1f000);if(c==4)arena[0x13c8]=254;if(c==5)memset(arena+0x1078,0,8);}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);
 if(mmap(arena,0x20000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 hook(0x1007e5f70UL,assertion);hook(0x1007e6030UL,assertion);hook(0x100095690UL,find_action);hook(0x1000968e0UL,play);
 uint32_t count;rd(&count,4);wr(&count,4);while(count--){uint32_t mode;int32_t result=0;rd(&mode,4);rd(arena,0x20000);line=severity=used=finds=0;memset(trace,0,sizeof trace);memcpy((void*)0x101dcff30UL,arena+0x5000,24);
  if(!setjmp(escape)){
   if(mode==0)((void(*)(void*,void*,void*))0x1001a3980UL)(arena+0x1000,arena+0x2000,arena+0x6000);
   else if(mode==1)result=((int32_t(*)(char*,uint32_t,char*))0x1000962f0UL)((char*)arena+0x5900,u32(0x1f008),u32(0x1f00c)?0:(char*)arena+0x5980);
   else if(mode==2)result=((uint8_t(*)(void*,int32_t))0x100096410UL)(arena+0x6000,u32(0x1f004));else return 7;
  }
  memcpy(arena+0x5000,(void*)0x101dcff30UL,24);wr(&line,4);wr(&severity,4);wr(&used,4);wr(&result,4);wr(trace,sizeof trace);wr(arena,0x20000);
 }return 0;
}
