#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t*arena=(void*)0x440000000UL;static jmp_buf escape;static uint32_t line,severity,trace[256],used;
static int32_t i32(size_t at){int32_t n;memcpy(&n,arena+at,4);return n;}static float f32(size_t at){float n;memcpy(&n,arena+at,4);return n;}
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[14]={0xff,0x25};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static void assertion(char*x,char*f,uint32_t l,uint32_t s,...){(void)x;(void)f;line=l;severity=s;longjmp(escape,1);}
static void collision(void*out,void*position,void*velocity,void*world,uint8_t*blocked,float lookahead){uint32_t bits;memcpy(&bits,&lookahead,4);if(used+6>256)exit(12);trace[used++]=1;trace[used++]=(uintptr_t)position-(uintptr_t)arena;trace[used++]=(uintptr_t)velocity-(uintptr_t)arena;trace[used++]=bits;trace[used++]=(uintptr_t)world-(uintptr_t)arena;trace[used++]=*blocked;memcpy(out,arena+0x6000,16);}
__attribute__((noinline)) static void seek(void*state,void*target){float weight[4]={f32(0x7000),0,0,f32(0x7010)},arrival[4]={f32(0x7004),0,0,0};void*entry=(void*)0x10062f710UL;
 __asm__ volatile("vmovups %3, %%xmm0\n\tvmovups %4, %%xmm1\n\tcall *%%rax" : "+D"(state),"+S"(target),"+a"(entry) : "m"(weight),"m"(arrival) : "rcx","rdx","r8","r9","r10","r11","xmm0","xmm1","xmm2","xmm3","xmm4","xmm5","xmm6","xmm7","memory","cc");
}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);
 if(mmap(arena,0x10000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 hook(0x1007e5f70UL,assertion);hook(0x10062d590UL,collision);
 uint32_t count;rd(&count,4);wr(&count,4);while(count--){uint32_t mode;rd(&mode,4);rd(arena,0x10000);line=severity=used=0;memset(trace,0,sizeof trace);
  void*state=arena+0x1000;void*motion=i32(0x7024)?arena+0x1000+i32(0x7024):arena+0x2000;void*target=i32(0x7028)?arena+0x1000+i32(0x7028):arena+0x3000;void*out=i32(0x702c)?arena+0x1000+i32(0x702c):arena+0x4000;
  // Explicit zero-offset aliases are encoded separately by the TS input.
  if(arena[0x7040])motion=state;if(arena[0x7041])target=state;if(arena[0x7042])out=state;
  if(!setjmp(escape)){
   if(mode==0||mode==3)((void(*)(void*,void*,float,float))0x10062e690UL)(state,motion,f32(0x7008),f32(0x700c));
   if(mode==2||mode==3)for(int32_t i=0;i<i32(0x7030);i++)seek(state,target);
   if(mode==1||mode==3)((void*(*)(void*,void*,uint32_t))0x10062e700UL)(out,state,i32(0x7020));
  }
  wr(&line,4);wr(&severity,4);wr(&used,4);wr(trace,sizeof trace);wr(arena,0x10000);
 }return 0;
}
