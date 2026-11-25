#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t*a=(void*)0x440000000UL;static jmp_buf escape;static uint32_t line,severity,calls;static uint8_t trace[1024][128];
static uint32_t u32(size_t p){uint32_t n;memcpy(&n,a+p,4);return n;}static float fl(size_t p){float n;memcpy(&n,a+p,4);return n;}
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[14]={0xff,0x25};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static uint8_t*record(uint64_t kind,uint64_t x,uint64_t y){if(calls>=1024)exit(12);uint8_t*r=trace[calls++];memset(r,0,128);uint64_t v[]={kind,x,y};memcpy(r,v,24);return r;}
static void assertion(char*x,char*f,uint32_t l,uint32_t s,...){if(strcmp(f,"SteeringBehaviors.cpp")&&strcmp(f,"Rail.cpp")&&strcmp(f,"./Clump.h"))exit(13);if(strcmp(x,"m_accum")&&strcmp(x,"ret")&&strcmp(x,"pPoints")&&strcmp(x,"ind < numPoints"))exit(14);line=l;severity=s;longjmp(escape,1);}
static uint32_t random_value(void){uint32_t n=u32(0xd100);record(1,n,0);return n;}
static void*generic(void){return a+0xe000;}static void*rail_type(void){return a+0xe100;}
static void cast(void*meta,void**out,void**input,void*from){(void)meta;(void)from;record(2,(uintptr_t)*input,0);*out=u32(0xd020)?NULL:(uint8_t*)*input-8;if(u32(0xd01c)==1){uint32_t n=1;memcpy(a+0x5010,&n,4);}if(u32(0xd01c)==2){void*p=a+0x4100;memcpy(a+0x1008,&p,8);}}
static void mutate(uint32_t n){uint32_t x=0x40000000,speed=0x40a00000,velocity=0x40400000;if(u32(0xd01c)!=n)return;if(n==3||n==5)memcpy(a+0x2020,&x,4);if(n==3||n==4)memcpy(a+0x2074,&speed,4);if(n==4||n==6)memcpy(a+0x2060,&velocity,4);}
static float nearest(void*rail,void*position,void*out){uint8_t*r=record(3,(uintptr_t)rail,u32(0xd200));memcpy(r+32,position,16);memcpy(r+48,a+0xd210,16);memcpy(out,a+0xd210,16);mutate(3);return fl(0xd200);}
static float distance(void*rail,float time){uint8_t*r=record(4,(uintptr_t)rail,u32(0xd220));memcpy(r+32,&time,4);mutate(4);return fl(0xd220);}
static float parameter(void*rail,float d){uint8_t*r=record(5,(uintptr_t)rail,u32(0xd224));memcpy(r+32,&d,4);mutate(5);return fl(0xd224);}
static void*sample(void*out,void*rail,float time){uint8_t*r=record(6,(uintptr_t)rail,0);memcpy(r+32,&time,4);memcpy(r+48,a+0xd230,16);memcpy(out,a+0xd230,16);mutate(6);return out;}
static uint32_t probe(uint32_t op,uint32_t a,uint32_t b){float x,y,z;memcpy(&x,&a,4);memcpy(&y,&b,4);switch(op){case 0:__asm__("vaddss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;case 1:__asm__("vsubss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;case 2:__asm__("vmulss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;default:__asm__("vdivss %2,%1,%0":"=x"(z):"x"(x),"x"(y));}uint32_t n;memcpy(&n,&z,4);return n;}
__attribute__((noinline))static void run(uint32_t mode){void*entry=(void*)(mode==0?0x1001a06a0UL:mode==1?0x100630020UL:0x100560300UL),*first=mode==0?a+0x1000:mode==1?a+0x2000:a+0xc000,*second=mode==0?a+0x4000:a+0x6000,*third=mode==0?a+0x3000:(void*)(uintptr_t)u32(mode==1?0xd004:0xd008);float args[3][4];memcpy(args,a+0xd300,sizeof args);
 __asm__ volatile("vmovups %4,%%xmm0\n\tvmovups %5,%%xmm1\n\tvmovups %6,%%xmm2\n\tcall *%%rax" : "+D"(first),"+S"(second),"+d"(third),"+a"(entry) : "m"(args[0]),"m"(args[1]),"m"(args[2]) : "rcx","r8","r9","r10","r11","xmm0","xmm1","xmm2","xmm3","xmm4","xmm5","xmm6","xmm7","xmm8","xmm9","xmm10","xmm11","xmm12","xmm13","xmm14","xmm15","memory","cc");
}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);if(mmap(a,0x10000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 hook(0x100aa2b22UL,random_value);hook(0x1007e5f70UL,assertion);hook(0x1007abc10UL,generic);hook(0x10055b490UL,rail_type);hook(0x10055d820UL,nearest);hook(0x10055d410UL,distance);hook(0x10055d4e0UL,parameter);hook(0x10055e420UL,sample);
 uint32_t count;rd(&count,4);wr(&count,4);uint32_t n=16,values[]={0x7fc00000,0xffc00000};wr(&n,4);for(uint32_t op=0;op<4;op++)for(uint32_t x=0;x<2;x++)for(uint32_t y=0;y<2;y++){uint32_t row[]={op,values[x],values[y],probe(op,values[x],values[y])};wr(row,16);}
 while(count--){uint32_t mode;rd(&mode,4);rd(a,0x10000);*(void**)(a+0xe100)=a+0xe200;*(void**)(a+0xe240)=cast;line=severity=calls=0;if(!setjmp(escape))for(uint32_t step=0;step<u32(0xd000);step++)run(mode);memset(a+0xe000,0,0x300);uint32_t header[]={line,severity,calls};wr(header,12);wr(a,0x10000);wr(trace,calls*128);}return 0;}
