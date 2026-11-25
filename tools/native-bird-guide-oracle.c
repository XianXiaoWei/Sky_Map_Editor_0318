#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t *arena=(void*)0x440000000UL;static jmp_buf escape;static uint32_t line,severity,trace[1024],used,casts;
static uint32_t u32(size_t at){uint32_t n;memcpy(&n,arena+at,4);return n;}static void w32(size_t at,uint32_t n){memcpy(arena+at,&n,4);}static void w64(size_t at,uint64_t n){memcpy(arena+at,&n,8);}
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[14]={0xff,0x25};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static void logop(uint32_t op,void*p,uint32_t a,uint32_t b,uint32_t c,uint32_t d){if(used+6>1024)exit(12);trace[used++]=op;trace[used++]=(uintptr_t)p-(uintptr_t)arena;trace[used++]=a;trace[used++]=b;trace[used++]=c;trace[used++]=d;}
static void assertion(char*x,char*f,uint32_t l,uint32_t s,...){(void)x;(void)f;line=l;severity=s;longjmp(escape,1);}
static void* generic(void){return arena+0x57000;}
static void meta_cast(void*self,void**out,void**in,void*from){(void)self;(void)from;logop(1,*in,0,0,0,0);if(++casts==1){if(u32(0x5f008)==1){w64(0x1038,(uintptr_t)arena+0x2200);w64(0x2308,(uintptr_t)arena+0x3f00);}if(u32(0x5f008)==2)w32(0x2010,0);}*out=u32(0x5f000)?0:*in;}
static void fade(void*p,uint32_t kind,uint32_t force,float duration,float delay){uint32_t a,b;memcpy(&a,&duration,4);memcpy(&b,&delay,4);logop(2,p,kind,force,a,b);if(u32(0x5f008)==3)w64(0x33a0,(uintptr_t)arena+0x60c00);}
static void* avatar(void*p){logop(3,p,0,0,0,0);return u32(0x5f004)?0:arena+0x55000;}
static void pos(void*out,void*p){logop(4,p,0,0,0,0);if(u32(0x5f008)==4)w32(0x1040,0);memcpy(out,(uint8_t*)p+16,16);}
static float stat_get(void*p,uint32_t i){logop(5,p,i,0,0,0);float n;memcpy(&n,p,4);return n;}
static void stat_set(void*p,uint32_t i,float n){uint32_t bits;memcpy(&bits,&n,4);logop(6,p,i,bits,0,0);memcpy(p,&n,4);}
static uint8_t enabled(void*p){logop(7,p,0,0,0,0);if(u32(0x5f008)==5)w64(0x3420,(uintptr_t)arena+0x50300);return ((uint8_t*)p)[0x21b3];}
static void start(void*p){logop(8,p,0,0,0,0);}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);
 if(mmap(arena,0x70000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 hook(0x1007e5f70UL,assertion);hook(0x1007abc10UL,generic);hook(0x102200000UL,meta_cast);hook(0x102200020UL,pos);hook(0x102200040UL,enabled);
 hook(0x100096d50UL,fade);hook(0x1000ff210UL,avatar);hook(0x1000438e0UL,stat_get);hook(0x100044920UL,stat_set);hook(0x10032ef60UL,start);
 uint32_t count;rd(&count,4);wr(&count,4);while(count--){uint32_t mode;rd(&mode,4);rd(arena,0x70000);line=severity=used=casts=0;memset(trace,0,sizeof trace);*(void**)0x101dda7d0UL=arena+0x57000;
  if(!setjmp(escape)){uintptr_t entries[]={0x1001aa480UL,0x1001aa870UL};if(mode>1)return 7;((void(*)(void*,void*))entries[mode])(arena+0x1000,arena);}
  wr(&line,4);wr(&severity,4);wr(&used,4);wr(trace,sizeof trace);wr(arena,0x70000);
 }return 0;
}
