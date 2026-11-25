#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>
static float trace[4096];static unsigned trace_count;
static float traced_cos(float x){float y=cosf(x);trace[trace_count++]=x;trace[trace_count++]=y;return y;}
static float traced_exp(float x){float y=expf(x);trace[trace_count++]=x;trace[trace_count++]=y;return y;}
typedef struct {float sin,cos;} SinCos;
static SinCos traced_sincos(float x){SinCos y;sincosf(x,&y.sin,&y.cos);trace[trace_count++]=x;trace[trace_count++]=y.sin;trace[trace_count++]=y.cos;return y;}
static void hook(uintptr_t at,void *fn){uint8_t j[]={0x48,0xb8,0,0,0,0,0,0,0,0,0xff,0xe0};memcpy(j+2,&fn,8);memcpy((void *)at,j,12);}
static void readin(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
// Preserve original RIP and all instructions inside the gust span. Its only
// replaced instruction is the explicit RET exit outside the span.
__attribute__((naked)) static void gust_span(void *env,void *game,void *force){
 __asm__ volatile("push %rbp\n\tpush %rbx\n\tpush %r12\n\tpush %r13\n\tpush %r14\n\tpush %r15\n\tsub $0x420,%rsp\n\tmov %rdi,%r13\n\tmov %rsi,%r14\n\tmovups (%rdx),%xmm0\n\tmovups %xmm0,0x18(%rsp)\n\tmovabs $0x100326666,%rax\n\tcall *%rax\n\tadd $0x420,%rsp\n\tpop %r15\n\tpop %r14\n\tpop %r13\n\tpop %r12\n\tpop %rbx\n\tpop %rbp\n\tret");
}
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *mem=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
 if(mem==MAP_FAILED||fread(mem,1,0xd22000,file)!=0xd22000)return 4;fclose(file);
 hook(0x100aa260cUL,traced_cos);hook(0x100aa2708UL,traced_exp);hook(0x100aa250aUL,traced_sincos);
 *(unsigned char *)0x1003273b6UL=0xc3;
 uint32_t count;readin(&count,4);fwrite(&count,4,1,stdout);
 for(unsigned i=0;i<count;i++){
  _Alignas(32) unsigned char env[256]={0},game[512]={0},time[64]={0};_Alignas(16) float force[4],over[4];
  float v[9];uint32_t override;readin(v,36);readin(&override,4);readin(force,16);readin(over,16);
  memcpy(env+0x54,v,4);memcpy(env+0x70,v+1,8);memcpy(env+0x20,v+3,12);
  memcpy(time+0x24,v+6,4);memcpy(env+0xc,v+7,4);memcpy(env+0x58,v+8,4);env[0x5c]=1;
  env[0x50]=override!=0;memcpy(env+0x10,over,16);void *tp=time;memcpy(game+0x160,&tp,8);
  trace_count=0;gust_span(env,game,force);
  fwrite(env+0x54,4,1,stdout);fwrite(env+0x70,4,2,stdout);fwrite(env+0x20,4,3,stdout);fwrite(env+0x30,4,3,stdout);
  fwrite(&trace_count,4,1,stdout);fwrite(trace,4,trace_count,stdout);
 }
 return 0;
}
