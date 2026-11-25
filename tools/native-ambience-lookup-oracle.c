#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>
#include <signal.h>
#include <ucontext.h>
static uint32_t count,trace[1024][3];
static uint32_t bits(float x){uint32_t n;memcpy(&n,&x,4);return n;}
static float exp_service(float x){float y=expf(x);if(count==1024)exit(10);trace[count][0]=bits(x);trace[count][1]=bits(y);trace[count][2]=0;count++;return y;}
static void fault(int sig,siginfo_t*i,void*ctx){ucontext_t*c=ctx;fprintf(stderr,"signal %d pc=%llx address=%llx\n",sig,(unsigned long long)c->uc_mcontext.gregs[REG_RIP],(unsigned long long)(uintptr_t)i->si_addr);exit(100);}
static void bind(uint64_t at,void*fn){int32_t r;memcpy(&r,(void*)(at+2),4);memcpy((void*)(at+6+r),&fn,8);}
extern void run_lookup(void*,uint32_t);
__asm__(".text\nrun_lookup:\n push %rbp\n push %rbx\n push %r12\n push %r13\n push %r14\n push %r15\n sub $0x9a0,%rsp\n lea 0x988(%rsp),%rbp\n mov %rdi,%r14\n mov %esi,%r12d\n lea 0x120(%rdi),%rbx\n lea 0x50(%rdi),%r15\n movabs $0x10005b708,%r11\n call *%r11\n add $0x9a0,%rsp\n pop %r15\n pop %r14\n pop %r13\n pop %r12\n pop %rbx\n pop %rbp\n ret\n");
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);
 struct sigaction sa={0};sa.sa_sigaction=fault;sa.sa_flags=SA_SIGINFO;sigaction(SIGSEGV,&sa,NULL);sigaction(SIGILL,&sa,NULL);bind(0x100aa2708UL,exp_service);*(uint8_t*)0x10005ba02UL=0xc3;
 uint32_t n;if(fread(&n,4,1,stdin)!=1)return 6;fwrite(&n,4,1,stdout);while(n--){_Alignas(32) uint8_t a[0x15000];memset(a,0,sizeof a);float colors[40];uint32_t cheap;if(fread(&cheap,4,1,stdin)!=1||fread(colors,sizeof colors,1,stdin)!=1)return 7;for(int i=0;i<5;i++){memcpy(a+0xa0-i*16,colors+i*4,16);memcpy(a+0x100-i*16,colors+20+i*4,16);}count=0;run_lookup(a,cheap);fwrite(a+0x4c80,65536,1,stdout);fwrite(&count,4,1,stdout);fwrite(trace,12,count,stdout);}return 0;}
