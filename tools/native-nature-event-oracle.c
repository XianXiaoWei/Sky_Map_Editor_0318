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
static void logop(uint32_t op,void*p,uint32_t n){if(used+3>1024)exit(12);trace[used++]=op;trace[used++]=(uintptr_t)p-(uintptr_t)arena;trace[used++]=n;}
static void assertion(char*x,char*f,uint32_t l,uint32_t s,...){(void)x;(void)f;line=l;severity=s;longjmp(escape,1);}
static void* generic(void){return arena+0xf000;}static void* candle_meta(void){return arena+0xf500;}static void* critter_meta(void){return arena+0xf700;}static void* message_meta(void){return arena+0xf800;}
static void meta_cast(void*self,void**out,void**in,void*from){(void)from;uint32_t kind;memcpy(&kind,(uint8_t*)self+8,4);logop(1,*in,kind);
 if(++casts==1){uint32_t mutation=u32(0xe014);if(mutation==1){w64(0x1038,(uintptr_t)arena+0x4000);w64(0x1040,(uintptr_t)arena+0x4000);w64(0x4100,(uintptr_t)arena+0x3600);}if(mutation==2)w32(0x2010,0);if(mutation==3){arena[0x1040]=255;arena[0x32dc]=0;}if(mutation==4){w32(0x103c,0x3f000000);w32(0x104c,0x40000000);}}
 *out=0;if(!*in||u32(0xe010))return;if(kind==4){if(u32(0xe00c))*out=*in;}else if(kind==3){if(!u32(0xe00c))*out=*in;}else *out=*in;if(kind==0&&u32(0xe018)==11)*out=u32(0xe01c)?0:(uint8_t*)*out+u32(0xe020);
}
static void shout(void*p,void*owner,uint32_t visual,uint32_t audio){logop(7,p,visual);logop(8,owner,audio);if(u32(0xe014)==5){w64(0x3c8,(uintptr_t)arena+0xd100);arena[0x1040]=255;arena[0x1041]=0;}if(u32(0xe014)==6)w32(0x2010,0);}
static void send_message(void*p,void*msg){logop(9,p,(uintptr_t)msg-(uintptr_t)arena);uint32_t mutation=u32(0xe014);if(mutation==7){w32(0x1048,1);w32(0x4010,0);}if(mutation==8)w64(0x1058,(uintptr_t)arena+0x2000);if(mutation==9)w32(0x4010,4);}
static void* local_player(void*p){logop(10,p,0);return arena+0xb000;}
static float exponential(float input){uint32_t bits;memcpy(&bits,&input,4);logop(11,arena,bits);bits=u32(0xe024);logop(12,arena,bits);memcpy(&input,&bits,4);return input;}
static void start(void*p){logop(2,p,0);}static void enabled(void*p,uint32_t n){logop(3,p,n);}static uint8_t get_enabled(void*p){logop(4,p,0);return ((uint8_t*)p)[180];}
static void extinguish(void*p,uint32_t n){logop(5,p,n);((uint8_t*)p)[182]=0;memset((uint8_t*)p+0x10c,0,8);((uint8_t*)p)[0x138]=0;}
static uint8_t authority(void*p){logop(6,p,0);return u32(0xe008);}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);
 if(mmap(arena,0x10000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 hook(0x1007e5f70UL,assertion);hook(0x1007abc10UL,generic);hook(0x1001e8c00UL,candle_meta);hook(0x102200000UL,meta_cast);hook(0x102200020UL,get_enabled);hook(0x100262d70UL,critter_meta);hook(0x102200040UL,shout);hook(0x100268810UL,message_meta);hook(0x100460020UL,send_message);hook(0x1000fc260UL,local_player);hook(0x100aa2708UL,exponential);
 hook(0x10032ef60UL,start);hook(0x1004d1f60UL,enabled);hook(0x10033a780UL,extinguish);hook(0x1004a0a20UL,authority);
 uint32_t count;rd(&count,4);wr(&count,4);while(count--){uint32_t mode;rd(&mode,4);rd(arena,0x10000);line=severity=used=casts=0;memset(trace,0,sizeof trace);
  *(void**)0x101dda7d0UL=arena+0xf200;*(void**)0x101de76a0UL=arena+0xf300;*(void**)0x101df5490UL=arena+0xf400;
  *(uint8_t*)0x101ffb0d0UL=u32(0xe000);*(uint32_t*)0x100cb8540UL=u32(0xe004);*(uint32_t*)0x100d2b420UL=77;
  if(!setjmp(escape)){uintptr_t entries[]={0x1001aa160UL,0x1001a99e0UL,0x100274080UL,0x1001a9dc0UL,0x1001a9df0UL,0x100273c50UL,0x100343270UL,0x100343280UL,0x100342910UL,0x1003439a0UL,0x100266350UL,0x100264fd0UL,0x1002744a0UL};if(mode>=13)return 7;((void(*)(void*,void*))entries[mode])(arena+0x1000,arena);}
  wr(&line,4);wr(&severity,4);wr(&used,4);wr(trace,sizeof trace);wr(arena,0x10000);
 }return 0;
}
