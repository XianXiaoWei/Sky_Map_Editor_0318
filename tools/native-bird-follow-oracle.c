#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t*a=(void*)0x440000000UL;static jmp_buf escape;static uint32_t line,severity,calls;static uint8_t trace[1024][160];
static uint32_t u32(size_t p){uint32_t n;memcpy(&n,a+p,4);return n;}static float fl(size_t p){float n;memcpy(&n,a+p,4);return n;}
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[14]={0xff,0x25};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static uint8_t*record(uint64_t kind,uint64_t x,uint64_t y){if(calls>=1024)exit(12);uint8_t*r=trace[calls++];memset(r,0,160);uint64_t v[]={kind,x,y};memcpy(r,v,24);return r;}
static void assertion(char*x,char*f,uint32_t l,uint32_t s,...){if(strcmp(f,"SteeringBehaviors.cpp")&&strcmp(f,"Rail.cpp")&&strcmp(f,"./Clump.h")&&strcmp(f,"AvatarBarn.cpp"))exit(13);if(strcmp(x,"m_accum")&&strcmp(x,"ret")&&strcmp(x,"pPoints")&&strcmp(x,"ind < numPoints")&&strcmp(x,"avatar"))exit(14);line=l;severity=s;longjmp(escape,1);}

static void*avatar(void*owner){record(1,(uintptr_t)owner,0);if(u32(0xd008))return NULL;if(u32(0xd004)==1){uint32_t n=3;memcpy(a+0x1080,&n,4);}return a+0x6000;}
static void*position(void*out,void*p){uint8_t*r=record(2,(uintptr_t)p,0);memcpy(r+32,(uint8_t*)p+176,16);memcpy(out,(uint8_t*)p+176,16);if(u32(0xd004)==2){uint32_t n=3;memcpy(a+0x1080,&n,4);}return out;}
static void*transform(void*out,void*p){uint8_t*r=record(3,(uintptr_t)p,0);memcpy(r+32,(uint8_t*)p+16,64);memcpy(out,(uint8_t*)p+16,64);if(u32(0xd004)==3){void*n=a+0x7200;memcpy(a+0x1018,&n,8);}return out;}
static void*obb(void*out,void*p){uint8_t*r=record(4,(uintptr_t)p,0);memcpy(r+32,a+0x7100,64);memcpy(out,a+0x7100,64);if(u32(0xd004)==4){void*n=a+0x7200;memcpy(a+0x1018,&n,8);}return out;}
static uint8_t projection(void*sphere,void*box,void*out,float radius){uint32_t n;memcpy(&n,(uint8_t*)sphere+48,4);uint8_t*r=record(5,n,0);memcpy(r+32,sphere,16);memcpy(r+48,box,64);memcpy(r+112,a+0x9000,16);memcpy(out,a+0x9000,16);(void)radius;return 1;}
static uint32_t random_value(void){uint32_t n=u32(0xd00c);record(6,n,0);if(u32(0xd004)==5){uint32_t v=4;memcpy(a+0x4030,&v,4);}return n;}
static void emit(void*owner,void*bird,uint32_t kind,void*texture,uint32_t flags,uint32_t enabled,uint32_t local,float scale,float time){uint8_t*r=record(7,(uintptr_t)owner,(uintptr_t)bird);memcpy(r+24,&kind,4);memcpy(r+32,&texture,8);memcpy(r+40,&flags,4);memcpy(r+44,&enabled,4);memcpy(r+48,&local,4);memcpy(r+52,&scale,4);memcpy(r+56,&time,4);if(u32(0xd004)==6){uint32_t n=0x41f80000;memcpy(a+0x1060,&n,4);}}
static uint32_t probe(uint32_t op,uint32_t a,uint32_t b){float x,y,z;memcpy(&x,&a,4);memcpy(&y,&b,4);switch(op){case 0:__asm__("vaddss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;case 1:__asm__("vsubss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;case 2:__asm__("vmulss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;default:__asm__("vdivss %2,%1,%0":"=x"(z):"x"(x),"x"(y));}uint32_t n;memcpy(&n,&z,4);return n;}

__attribute__((noinline))static void run(uint32_t mode,uint32_t step){
 if(mode==0){uint8_t n=((uint8_t(*)(void*,void*,void*,void*,void*,float))0x1001a08e0UL)(a+0x1000,a+0x4000,a+0x8000,a+0x8100,a+0x3000,fl(0xd100));uint32_t result=n;memcpy(a+0xc000+step*4,&result,4);return;}
 void*entry=(void*)(mode==1?0x100630190UL:mode==3?0x10062f190UL:0x100630480UL),*first=a+0x1090,*second=a+0x65b0,*third=(void*)(uintptr_t)u32(0xd010);float args[2][4];memcpy(args,a+0xd110,sizeof args);
 __asm__ volatile("vmovups %4,%%xmm0\n\tvmovups %5,%%xmm1\n\tcall *%%rax" : "+D"(first),"+S"(second),"+d"(third),"+a"(entry) : "m"(args[0]),"m"(args[1]) : "rcx","r8","r9","r10","r11","xmm0","xmm1","xmm2","xmm3","xmm4","xmm5","xmm6","xmm7","xmm8","xmm9","xmm10","xmm11","xmm12","xmm13","xmm14","xmm15","memory","cc");
}

int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);if(mmap(a,0x10000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 hook(0x100aa2b22UL,random_value);hook(0x1007e5f70UL,assertion);hook(0x1000ff210UL,avatar);hook(0x1007f26b0UL,position);hook(0x10078d250UL,projection);hook(0x1005a10e0UL,emit);
 uint32_t count;rd(&count,4);wr(&count,4);uint32_t n=16,values[]={0x7fc00000,0xffc00000};wr(&n,4);for(uint32_t op=0;op<4;op++)for(uint32_t x=0;x<2;x++)for(uint32_t y=0;y<2;y++){uint32_t row[]={op,values[x],values[y],probe(op,values[x],values[y])};wr(row,16);}
 while(count--){uint32_t mode;rd(&mode,4);rd(a,0x10000);*(void**)(a+0xe018)=transform;*(void**)(a+0xe020)=obb;line=severity=calls=0;if(!setjmp(escape))for(uint32_t step=0;step<u32(0xd000);step++)run(mode,step);memset(a+0xe000,0,0x100);uint32_t header[]={line,severity,calls};wr(header,12);wr(a,0x10000);wr(trace,calls*160);}return 0;
}
