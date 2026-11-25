#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t*a=(void*)0x440000000UL;static jmp_buf escape;static uint32_t line,severity,calls;static uint32_t trace[128];
static uint32_t u32(size_t at){uint32_t n;memcpy(&n,a+at,4);return n;}
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[14]={0xff,0x25};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static void assertion(char*x,char*f,uint32_t l,uint32_t s,...){if(strcmp(x,"m_accum")||strcmp(f,"SteeringBehaviors.cpp"))exit(12);line=l;severity=s;longjmp(escape,1);}
static uint32_t random_value(void){if(calls>=128)exit(13);uint32_t n=u32(0x7200+(calls%3)*4);trace[calls++]=n;return n;}
static uint32_t probe(uint32_t op,uint32_t a,uint32_t b){float x,y,z;memcpy(&x,&a,4);memcpy(&y,&b,4);switch(op){case 0:__asm__("vaddss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;case 1:__asm__("vsubss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;case 2:__asm__("vmulss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;default:__asm__("vdivss %2,%1,%0":"=x"(z):"x"(x),"x"(y));}uint32_t n;memcpy(&n,&z,4);return n;}
__attribute__((noinline))static void run(uint32_t mode){void*entry=(void*)(mode==0?0x10062d010UL:mode==1?0x10062e8f0UL:0x10062f540UL),*first=mode==0?a+u32(0x7100):a+0x1000,*second=a+(mode==2?0x3000:0x2000),*third=a+u32(0x7104);float args[5][4];memcpy(args,a+0x7000,sizeof args);
 __asm__ volatile("vmovups %4,%%xmm0\n\tvmovups %5,%%xmm1\n\tvmovups %6,%%xmm2\n\tvmovups %7,%%xmm3\n\tvmovups %8,%%xmm4\n\tcall *%%rax" : "+D"(first),"+S"(second),"+d"(third),"+a"(entry) : "m"(args[0]),"m"(args[1]),"m"(args[2]),"m"(args[3]),"m"(args[4]) : "rcx","r8","r9","r10","r11","xmm0","xmm1","xmm2","xmm3","xmm4","xmm5","xmm6","xmm7","xmm8","xmm9","xmm10","xmm11","xmm12","xmm13","xmm14","xmm15","memory","cc");
}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);if(mmap(a,0x8000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;hook(0x100aa2b22UL,random_value);hook(0x1007e5f70UL,assertion);
 uint32_t count;rd(&count,4);wr(&count,4);uint32_t n=16,values[]={0x7fc00000,0xffc00000};wr(&n,4);for(uint32_t op=0;op<4;op++)for(uint32_t x=0;x<2;x++)for(uint32_t y=0;y<2;y++){uint32_t row[]={op,values[x],values[y],probe(op,values[x],values[y])};wr(row,16);}
 while(count--){uint32_t mode;rd(&mode,4);rd(a,0x8000);line=severity=calls=0;if(!setjmp(escape))for(uint32_t step=0;step<u32(0x7108);step++)run(mode);uint32_t header[]={line,severity,calls};wr(header,12);wr(a,0x8000);wr(trace,calls*4);}return 0;}
