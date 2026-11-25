/* Whole ModelBarn wrappers execute unchanged. The complete Model constructor
 * is a captured dependency service, not claimed as original Model creation. */
#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
#define BYTES 0x110000
static uint8_t *arena=(void *)0x2d0000000UL;
static uint32_t h[7],line,severity,boundary,called,capture[6];static uint8_t parameters[184];static jmp_buf escape;static uint64_t guard=0x1234567890abcdefUL;
/* Globals are addressed directly by the assembly caller, which explicitly
 * fills its entire future native stack allocation before invoking a wrapper. */
uint64_t model_barn_call[9];
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}static void ptr(void*p,uintptr_t n){memcpy(p,&n,8);}static uint32_t code(void*p){return p?(uint32_t)((uint8_t*)p-arena):0xffffffff;}
static void map(void*p,size_t n){if(mmap(p,n,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)exit(5);}static void hook(uintptr_t at,void*fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}static void bind(uintptr_t stub,void*fn){int32_t rel;memcpy(&rel,(void*)(stub+2),4);memcpy((void*)(stub+6+rel),&fn,8);}
static void assertion(char*expr,char*file,uint32_t n,uint32_t s){(void)expr;(void)file;line=n;severity=s;longjmp(escape,1);}
__attribute__((used,noinline)) static void constructor_service(void*model,void*options,void*heap,void*resources,void*renderer,uint8_t*args){called++;capture[0]=code(model);capture[1]=code(options);capture[2]=code(heap);capture[3]=code(resources);capture[4]=code(renderer);memcpy(capture+5,arena+0xf8010,4);memcpy(parameters,args,168);memcpy(parameters+168,args+184,16);if(h[4]){boundary=1;longjmp(escape,1);}}
__attribute__((naked)) static void capture_constructor(void){__asm__("lea 8(%rsp),%r9\n\tjmp constructor_service");}
__attribute__((naked)) static void *invoke(void){__asm__(
 "push %rbp\n\tmov %rsp,%rbp\n\tlea -8192(%rsp),%rdi\n\tmov $1024,%ecx\n\tmov model_barn_call+64(%rip),%rax\n\trep stosq\n\tsub $32,%rsp\n\t"
 "mov model_barn_call+8(%rip),%rdi\n\tcmpq $0,model_barn_call(%rip)\n\tje 1f\n\t"
 "mov model_barn_call+16(%rip),%rsi\n\tmov model_barn_call+24(%rip),%rdx\n\tmov model_barn_call+32(%rip),%ecx\n\tmov model_barn_call+40(%rip),%r8\n\tmov model_barn_call+48(%rip),%r9\n\tmov model_barn_call+56(%rip),%rax\n\tmov %rax,(%rsp)\n\tmovabs $0x10046ca30,%rax\n\tjmp 2f\n\t"
 "1:mov model_barn_call+24(%rip),%rsi\n\tmov model_barn_call+40(%rip),%rdx\n\tmov model_barn_call+48(%rip),%rcx\n\tmov model_barn_call+56(%rip),%r8\n\tmovabs $0x10046c700,%rax\n\t"
 "2:call *%rax\n\tleave\n\tret");}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;map((void*)0x100000000UL,0x2400000);if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 4;fclose(f);map(arena,BYTES);ptr((void*)0x100c0d8d8UL,(uintptr_t)&guard);hook(0x100467330UL,capture_constructor);hook(0x1007e5f70UL,assertion);bind(0x100aa2c7eUL,strlen);bind(0x100aa2c5aUL,strcpy);if(mprotect((void*)0x100000000UL,0xc05000,5))return 6;
 uint32_t n;rd(&n,4);wr(&n,4);while(n--){rd(h,28);memset(arena,h[5],BYTES);uint32_t lengths[2];rd(lengths,8);if(lengths[0]>255||lengths[1]>255)return 7;rd(arena+0x102000,lengths[0]);arena[0x102000+lengths[0]]=0;rd(arena+0x102100,lengths[1]);arena[0x102100+lengths[1]]=0;memcpy(arena+0xf8010,h+1,4);ptr(arena+0xfd250,(uintptr_t)(arena+0x102300));ptr(arena+0xfd260,(uintptr_t)(arena+0x102400));ptr(arena+0xfd258,(uintptr_t)(arena+0x102500));for(uint32_t i=0;i<16;i++){arena[0xfd270+i]=(i*17+h[5])&255;arena[0xfd290+i]=(i*29+h[5])&255;}
 model_barn_call[0]=h[0];model_barn_call[1]=(uintptr_t)arena;model_barn_call[2]=(uintptr_t)(arena+0x102000);model_barn_call[3]=(uintptr_t)(arena+0x102100);model_barn_call[4]=h[2];model_barn_call[5]=(uintptr_t)(arena+0x105000);model_barn_call[6]=(uintptr_t)(arena+0x106000);model_barn_call[7]=h[3]?(uintptr_t)(arena+0x104000):0;model_barn_call[8]=0x0101010101010101UL*(h[6]&255);
 line=severity=boundary=called=0;memset(capture,0,sizeof capture);memset(parameters,0,sizeof parameters);uint32_t result=0xffffffff;if(!setjmp(escape))result=code(invoke());uint32_t out[]={line,severity,boundary,result,called};wr(out,20);wr(capture,24);wr(parameters,184);wr(arena,BYTES);
 }return 0;}
