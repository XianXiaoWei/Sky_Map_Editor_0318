#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <math.h>
#include <sys/mman.h>
static uint8_t*a=(void*)0x440000000UL;static jmp_buf escape;static uint32_t line,severity,calls;static uint8_t trace[8192][192];
static uint32_t u32(size_t p){uint32_t n;memcpy(&n,a+p,4);return n;}static float fl(size_t p){float n;memcpy(&n,a+p,4);return n;}
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[14]={0xff,0x25};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static uint8_t*record(uint64_t kind,uint64_t x,uint64_t y){if(calls>=8192)exit(12);uint8_t*r=trace[calls++];memset(r,0,192);uint64_t v[]={kind,x,y};memcpy(r,v,24);return r;}
static void assertion(char*x,char*f,uint32_t l,uint32_t s,...){if(strcmp(f,"SteeringBehaviors.cpp")&&strcmp(f,"Rail.cpp")&&strcmp(f,"./Clump.h")&&strcmp(f,"AvatarBarn.cpp"))exit(13);if(strcmp(x,"m_accum")&&strcmp(x,"ret")&&strcmp(x,"pPoints")&&strcmp(x,"ind < numPoints")&&strcmp(x,"avatar"))exit(14);line=l;severity=s;longjmp(escape,1);}


static void**active_slots;
static uint32_t query(void*owner,void*out,uint32_t mode){uint32_t count=u32(0x2d000);uint8_t*r=record(1,(uintptr_t)owner,mode);memcpy(r+24,&count,4);memcpy(out,a+0x8100,count*8);active_slots=out;memcpy(r+32,a+0x8100,count*8);if(u32(0x2d008)==1){void*p=a+0x5200;memcpy(a+0x1228,&p,8);}return count;}
static void*position(void*out,void*p){uint8_t*r=record(2,(uintptr_t)p,0);memcpy(r+32,(uint8_t*)p+176,16);memcpy(out,(uint8_t*)p+176,16);if(u32(0x2d008)==2){void*p=a+0x5200;memcpy(a+0x1220,&p,8);}return out;}
static uint8_t enabled(void*p){uint8_t n=((uint8_t*)p)[0xe4];record(3,(uintptr_t)p,n);if(u32(0x2d008)==3){void*q;memcpy(&q,(uint8_t*)p+48,8);uint32_t v=0xbf800000;memcpy((uint8_t*)q+8,&v,4);}if(u32(0x2d008)==7)active_slots[1]=NULL;return n;}
static void*bird_position(void*out,void*p){uint8_t*r=record(4,(uintptr_t)p,0);memcpy(r+32,(uint8_t*)p+16,16);memcpy(out,(uint8_t*)p+16,16);if(u32(0x2d008)==4){uint32_t n=1;memcpy(a+0x9210,&n,4);}return out;}
static uint32_t fb(float x){uint32_t n;memcpy(&n,&x,4);return n;}
static float angle(float y,float x){float result=atan2f(y,x);uint8_t*r=record(5,fb(y),fb(x));uint32_t n=fb(result);memcpy(r+24,&n,4);return result;}
static float cosine(float x){float result=cosf(x);uint8_t*r=record(6,fb(x),0);uint32_t n=fb(result);memcpy(r+24,&n,4);return result;}
static uint32_t rays;
static uint8_t ray(void*scene,void*origin,void*direction,void*options,void*out,float maximum){uint32_t blocked=(u32(0x2d004)>>(rays++&31))&1;uint8_t*r=record(7,(uintptr_t)scene,blocked);uint32_t n=fb(maximum);memcpy(r+24,&n,4);memcpy(r+32,origin,16);memcpy(r+48,direction,16);memcpy(r+64,options,9);memcpy(r+80,(uint8_t*)options+16,16);memset(out,0,32);if(u32(0x2d008)==5){uint32_t id=999,index=99;memcpy(a+0x12c8,&id,4);memcpy(a+0x12cc,&index,4);}if(u32(0x2d008)==6)a[0x12c7]=1;return blocked;}
static void switch_rail(void*p,uint32_t cooldown){record(8,(uintptr_t)p,cooldown);((uint8_t*)p)[0x2c5]=cooldown;}
static uint32_t probe(uint32_t op,uint32_t a,uint32_t b){float x,y,z;memcpy(&x,&a,4);memcpy(&y,&b,4);switch(op){case 0:__asm__("vaddss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;case 1:__asm__("vsubss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;case 2:__asm__("vmulss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;default:__asm__("vdivss %2,%1,%0":"=x"(z):"x"(x),"x"(y));}uint32_t n;memcpy(&n,&z,4);return n;}


int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);if(mmap(a,0x30000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 hook(0x1001032a0UL,query);hook(0x1007f26b0UL,position);hook(0x1007f2a00UL,position);hook(0x100aa25a0UL,angle);hook(0x100aa260cUL,cosine);hook(0x100776a90UL,ray);hook(0x10026d0f0UL,switch_rail);*(void**)0x100c0d8d8UL=a+0x2eff0;
 uint32_t count;rd(&count,4);wr(&count,4);uint32_t n=16,values[]={0x7fc00000,0xffc00000};wr(&n,4);for(uint32_t op=0;op<4;op++)for(uint32_t x=0;x<2;x++)for(uint32_t y=0;y<2;y++){uint32_t row[]={op,values[x],values[y],probe(op,values[x],values[y])};wr(row,16);}
 while(count--){uint32_t mode;rd(&mode,4);rd(a,0x30000);*(void**)(a+0x2e010)=enabled;*(void**)(a+0x2e058)=bird_position;calls=rays=0;
  for(uint32_t step=0;step<u32(0x2d00c);step++){
   if(mode==0){uint32_t result=((uint8_t(*)(void*,void*,void*,void*,void*,void*,void*,float))0x10026d410UL)(a+0x1000,a+0x12c7,a+0x11b0,a+0x8000,a+0x8200,a+0x9000,a+0xa000,fl(0x11d0));memcpy(a+0x2d100+step*4,&result,4);}
   else ((void(*)(void*,void*,void*,void*,void*,float))0x10026d2a0UL)(a+0x1000,a+0x8000,a+0x8200,a+0x9000,a+0xa000,fl(0x2d010));
  }
  memset(a+0x2e000,0,0x100);wr(&calls,4);wr(a,0x30000);wr(trace,calls*192);
 }return 0;
}
