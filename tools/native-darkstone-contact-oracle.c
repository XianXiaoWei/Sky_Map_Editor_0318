#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
static uint8_t *a=(void*)0x440000000UL;
static uint32_t calls;
static uint8_t trace[64][96];
uintptr_t contact_saved_rsp;
static void rd(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void wr(void *p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void *fn){uint8_t b[14]={0xff,0x25};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static uint8_t *record(uint64_t kind,uintptr_t p){if(calls>=64)exit(12);uint8_t *r=trace[calls++];memset(r,0,96);memcpy(r,&kind,8);memcpy(r+8,&p,8);return r;}
static void *select_flame(void *p){record(1,(uintptr_t)p);return *(void**)p;}
static uint8_t flame_enabled(void *p){record(2,(uintptr_t)p);return *((uint8_t*)p+0x148);}
static void *hint_type(void){record(3,0);return a+0x59000;}
static void *create_hint(void *owner,void *type){uint8_t *r=record(4,(uintptr_t)owner);memcpy(r+16,&type,8);memset(a+0x58000,0,0x100);return a+0x58000;}
static void enable_hint(void *p){record(5,(uintptr_t)p);}
__attribute__((naked)) static void finish(void){__asm__ volatile(
 "movabs $0x44005f100,%rdi\n"
 "mov 0x68(%rsp),%eax\n mov %eax,0(%rdi)\n mov 0x2c(%rsp),%eax\n mov %eax,4(%rdi)\n"
 "mov 0xc0(%rsp),%eax\n mov %eax,8(%rdi)\n mov 0xf0(%rsp),%eax\n mov %eax,12(%rdi)\n"
 "mov 0x40(%rsp),%eax\n mov %eax,16(%rdi)\n mov 0x30(%rsp),%rax\n mov %eax,20(%rdi)\n"
 "mov 0xa0(%rsp),%eax\n and $255,%eax\n mov %eax,24(%rdi)\n mov %edx,28(%rdi)\n"
 "movabs $0x100d2b528,%rax\n mov (%rax),%eax\n mov %eax,32(%rdi)\n"
 "xor %ecx,%ecx\n 1: cmp %edx,%ecx\n jae 2f\n mov %rcx,%rax\n imul $48,%rax\n"
 "movups 0x260(%rsp,%rax),%xmm0\n movups %xmm0,48(%rdi,%rax)\n"
 "movups 0x270(%rsp,%rax),%xmm0\n movups %xmm0,64(%rdi,%rax)\n"
 "movzbl 0x280(%rsp,%rax),%ebx\n mov %ebx,80(%rdi,%rax)\n inc %ecx\n jmp 1b\n 2:\n"
 "mov contact_saved_rsp(%rip),%rsp\n pop %r15\n pop %r14\n pop %r13\n pop %r12\n pop %rbx\n pop %rbp\n ret\n");}
__attribute__((naked)) static void run(void *input __attribute__((unused))){__asm__ volatile(
 "push %rbp\n push %rbx\n push %r12\n push %r13\n push %r14\n push %r15\n mov %rsp,contact_saved_rsp(%rip)\n and $-32,%rsp\n sub $0xb00,%rsp\n lea 0xa00(%rsp),%rbp\n"
 "lea 0x4000(%rdi),%r13\n mov %r13,0x80(%rsp)\n lea 0x4080(%rdi),%rax\n mov %rax,0x110(%rsp)\n"
 "lea 0x8000(%rdi),%rax\n mov %rax,0x10(%rbp)\n lea 0x9000(%rdi),%rax\n mov %rax,0x18(%rbp)\n"
 "mov 0x5f010(%rdi),%rax\n mov %rax,0x48(%rbp)\n mov %rax,%rbx\n"
 "lea 0x7000(%rdi),%rax\n mov %rax,0x50(%rbp)\n mov 0x5f000(%rdi),%eax\n mov %eax,0x58(%rbp)\n"
 "mov 0x5f004(%rdi),%eax\n mov %rax,0x60(%rsp)\n movabs $0x10027c239,%rax\n jmp *%rax\n");}
int main(int argc,char **argv){
 if(argc!=2)return 2;
 FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,file)!=0xd22000)return 5;
 fclose(file);
 if(mmap(a,0x60000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 hook(0x1003c62c0UL,select_flame);hook(0x1002c6ff0UL,hint_type);hook(0x100039f40UL,create_hint);hook(0x10032e2f0UL,enable_hint);
 hook(0x10027c9bbUL,finish);hook(0x10027ca90UL,finish);
 uint32_t count;rd(&count,4);wr(&count,4);
 while(count--){
  rd(a,0x60000);calls=0;void *fn=flame_enabled;memcpy(a+0x5e010,&fn,8);
  *(uint8_t*)0x101de7fc8UL=*(uint8_t*)(a+0x5f008);memcpy((void*)0x100d2b528UL,a+0x5f00c,4);
  run(a);memset(a+0x5e000,0,0x100);wr(a,0x60000);wr(&calls,4);wr(trace,calls*96);
 }
 return 0;
}
