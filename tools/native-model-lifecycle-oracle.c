#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <signal.h>
#include <ucontext.h>
#include <sys/mman.h>
static uint8_t *arena=(void *)0x3b0000000UL;static uint64_t guard=0x1234;
static uint64_t traces[2048][8];static uint32_t calls,line,severity;static jmp_buf escape;
uint64_t model_lifecycle_call[10];
static uint32_t u(void*p){uint32_t n;memcpy(&n,p,4);return n;}
static uint64_t q(void*p){uint64_t n;memcpy(&n,p,8);return n;}
static void p32(void*p,uint32_t n){memcpy(p,&n,4);}
static void p64(void*p,uint64_t n){memcpy(p,&n,8);}
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void fault(int sig,siginfo_t*info,void*ctx){ucontext_t*c=ctx;fprintf(stderr,"signal %d pc=%llx addr=%llx\n",sig,(unsigned long long)c->uc_mcontext.gregs[REG_RIP],(unsigned long long)(uintptr_t)info->si_addr);exit(100);}
static void hook(uintptr_t at,void*fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static void bind(uintptr_t stub,void*fn){int32_t rel;memcpy(&rel,(void*)(stub+2),4);memcpy((void*)(stub+6+rel),&fn,8);}
static void mutate(void){if(calls!=u(arena+0xf014))return;uint32_t kind=u(arena+0xf018);uint8_t*m=arena+0x1000;
 if(kind==1)p64(m+0x3a8,(uintptr_t)arena+0xec00);
 if(kind==2)p32(m+0x8c,0);
 if(kind==3)p64(m+0x68,0);
 if(kind==4)p64(m+0x70,0);
 if(kind==5)p64(m+8,(uintptr_t)arena+0x4000);
 if(kind==6){p64(arena+0xfd250,(uintptr_t)arena+0xec00);p64(arena+0xfd260,(uintptr_t)arena+0xed00);p64(arena+0xfd258,(uintptr_t)arena+0xee00);memset(arena+0xfd270,0x72,16);memset(arena+0xfd290,0x91,16);}
}
static void service(uint64_t kind,void*p,void*other){if(calls==2048)exit(12);uint64_t*t=traces[calls++];t[0]=kind;t[1]=(uintptr_t)p;t[2]=(uintptr_t)other;mutate();}
static void reset_mesh(void*p){service(1,p,NULL);}
static void reset_data(void*p){service(2,p,NULL);}
static void destroy_data(void*p){service(3,p,NULL);}
static void destroy_render(void*p){service(4,p,NULL);}
static void free_heap(void*h,void*p){service(5,h,p);}
static void release_animation(void*p){service(6,p,NULL);}
static void destroy_animation(void*p){service(7,p,NULL);}
static void collision(void*r,void*p){service(8,r,p);}
static void aux70(void*p,void*h){service(9,p,h);}
static void aux78(void*p,void*h){service(10,p,h);}
static void aux80(void*p){service(11,p,NULL);}
static void assertion(char*expr,char*file,uint32_t l,uint32_t s,...){(void)expr;(void)file;line=l;severity=s;longjmp(escape,1);}
__attribute__((used,noinline)) static void constructor(void*m,void*options,void*h,void*r,void*renderer,uint8_t*args){
 service(12,m,options);uint64_t*t=traces[calls-1];t[3]=(uintptr_t)h;t[4]=(uintptr_t)r;t[5]=(uintptr_t)renderer;
 memcpy(arena+0xe000,args,168);memcpy(arena+0xe000+168,args+184,16);
}
__attribute__((naked)) static void capture_constructor(void){__asm__("lea 8(%rsp),%r9\n\tjmp constructor");}
__attribute__((naked)) static void invoke(void){__asm__(
 "push %rbp\n\tmov %rsp,%rbp\n\tlea -8192(%rsp),%rdi\n\tmov $1024,%ecx\n\tmov model_lifecycle_call+64(%rip),%rax\n\trep stosq\n\tsub $32,%rsp\n\t"
 "mov model_lifecycle_call+8(%rip),%rdi\n\tmov model_lifecycle_call+16(%rip),%rsi\n\tmov model_lifecycle_call+24(%rip),%rdx\n\t"
 "cmpq $0,model_lifecycle_call(%rip)\n\tje 1f\n\t"
 "mov model_lifecycle_call+32(%rip),%rcx\n\tmov model_lifecycle_call+40(%rip),%r8\n\tmov model_lifecycle_call+48(%rip),%r9\n\tmov model_lifecycle_call+56(%rip),%rax\n\tmov %rax,(%rsp)\n\tmov model_lifecycle_call+72(%rip),%rax\n\tmov %rax,8(%rsp)\n\tmovabs $0x10046d010,%rax\n\tjmp 2f\n\t"
 "1:mov model_lifecycle_call+32(%rip),%rdx\n\tmov model_lifecycle_call+48(%rip),%rcx\n\tmov model_lifecycle_call+56(%rip),%r8\n\tmov model_lifecycle_call+72(%rip),%r9\n\tmovabs $0x10046ce50,%rax\n\t"
 "2:call *%rax\n\tleave\n\tret");}
static void blocks(int output){void*ptrs[]={arena,arena+0xf8010,arena+0xfd250,arena+0x185110};size_t sizes[]={0x10000,4,80,4};for(int i=0;i<4;i++)if(output)wr(ptrs[i],sizes[i]);else rd(ptrs[i],sizes[i]);}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);
 if(mmap(arena,0x190000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 struct sigaction sa={0};sa.sa_sigaction=fault;sa.sa_flags=SA_SIGINFO;sigaction(SIGSEGV,&sa,NULL);sigaction(SIGILL,&sa,NULL);
 hook(0x10045f860UL,reset_mesh);hook(0x1007f5250UL,reset_data);hook(0x1007f5370UL,destroy_data);hook(0x1007f6150UL,destroy_render);hook(0x100795a70UL,free_heap);hook(0x10009e4e0UL,release_animation);hook(0x100106d10UL,destroy_animation);hook(0x100779200UL,collision);hook(0x100210130UL,aux70);hook(0x10028f5c0UL,aux78);hook(0x10034d300UL,aux80);hook(0x100467330UL,capture_constructor);hook(0x1007e5f70UL,assertion);bind(0x100aa2c7eUL,strlen);bind(0x100aa2c5aUL,strcpy);p64((void*)0x100c0d8d8UL,(uintptr_t)&guard);
 uint32_t cases;rd(&cases,4);wr(&cases,4);while(cases--){memset(arena,0xa5,0x190000);blocks(0);calls=line=severity=0;memset(traces,0,sizeof traces);uint32_t mode=u(arena+0xf000);
  if(!setjmp(escape)){
   if(mode==0)((void(*)(void*,void*))0x100469eb0UL)(arena+0x1000,arena+0xeb00);
   else if(mode==1||mode==2){model_lifecycle_call[0]=mode==2;model_lifecycle_call[1]=(uintptr_t)arena;model_lifecycle_call[2]=(uintptr_t)arena+0x1000;model_lifecycle_call[3]=(uintptr_t)arena+0xd000;model_lifecycle_call[4]=(uintptr_t)arena+0xd100;model_lifecycle_call[5]=u(arena+0xf004);model_lifecycle_call[6]=(uintptr_t)arena+0xd200;model_lifecycle_call[7]=(uintptr_t)arena+0xd300;model_lifecycle_call[8]=0x0101010101010101UL*(u(arena+0xf00c)&255);model_lifecycle_call[9]=u(arena+0xf008)?(uintptr_t)arena+0x2000:0;invoke();}
   else return 7;
  }
  uint32_t h[]={line,severity,calls};wr(h,12);wr(traces,calls*64);blocks(1);
 }return 0;
}
