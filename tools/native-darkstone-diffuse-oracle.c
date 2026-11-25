#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>
static uint8_t *a=(void*)0x440000000UL;
static uint32_t calls;
static uint8_t trace[8][96];
static void rd(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void wr(void *p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void *fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static uint8_t *record(uint64_t kind){if(calls>=8)exit(12);uint8_t *r=trace[calls++];memset(r,0,96);memcpy(r,&kind,8);return r;}
static float sine(float n){float out=sinf(n);uint8_t *r=record(1);memcpy(r+48,&n,4);memcpy(r+52,&out,4);return out;}
static float exponential(float n){float out=expf(n);uint8_t *r=record(2);memcpy(r+48,&n,4);memcpy(r+52,&out,4);return out;}
static void vector(void *p,uint32_t pass,void *name,void *color,float transition){
 if(pass||transition!=0||*(uint8_t*)name&1)exit(13);
 uint8_t *r=record(3);memcpy(r+8,&p,8);snprintf((char*)r+16,32,"%s",(char*)name+1);memcpy(r+48,color,16);
}
/* The range is executed at its original address; only callers/continuation
 * and the three named services are supplied. No native branch is removed. */
__attribute__((naked)) static void finish(void){__asm__ volatile(
 "mov %r15,%rsp\n pop %r15\n pop %r14\n pop %r13\n pop %r12\n pop %rbx\n pop %rbp\n ret\n");}
__attribute__((naked)) static void run(void *input __attribute__((unused))){__asm__ volatile(
 "push %rbp\n push %rbx\n push %r12\n push %r13\n push %r14\n push %r15\n"
 "mov %rsp,%r15\n and $-32,%rsp\n sub $0xb00,%rsp\n lea 0xa00(%rsp),%rbp\n"
 "lea 0x4000(%rdi),%r13\n mov 0x5f000(%rdi),%r12d\n"
 "mov 0x5f004(%rdi),%eax\n mov %eax,0xf0(%rsp)\n"
 "mov 0x5f008(%rdi),%eax\n mov %eax,0x2c(%rsp)\n"
 "mov 0x5f00c(%rdi),%eax\n mov %eax,0x28(%rsp)\n"
 "mov 0x5f010(%rdi),%eax\n mov %eax,0x5c(%rsp)\n"
 "mov 0x5f014(%rdi),%eax\n mov %rax,0x40(%rbp)\n"
 "mov 0x5f018(%rdi),%eax\n mov %rax,0x68(%rsp)\n"
 "mov 0x5f01c(%rdi),%eax\n mov %eax,0xbc(%rsp)\n"
 "mov 0x5f020(%rdi),%eax\n mov %rax,0x60(%rsp)\n"
 "movabs $0x10027daeb,%rax\n jmp *%rax\n");}
int main(int argc,char **argv){
 if(argc!=2)return 2;
 FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,file)!=0xd22000)return 5;
 fclose(file);
 if(mmap(a,0x60000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 hook(0x100aa2bcaUL,sine);hook(0x100aa2708UL,exponential);hook(0x1003fff20UL,vector);hook(0x10027dd44UL,finish);
 uint32_t count;rd(&count,4);wr(&count,4);
 while(count--){
  rd(a,0x60000);calls=0;
  memcpy((void*)0x100d2b490UL,a+0x5e200,16);memcpy((void*)0x100d2b4e0UL,a+0x5e210,16);
  memcpy((void*)0x1020042f0UL,a+0x5e220,16);memcpy((void*)0x100d2b4c0UL,a+0x5e230,16);memcpy((void*)0x100d2b4d0UL,a+0x5e240,16);
  run(a);wr(a,0x60000);wr(&calls,4);wr(trace,calls*96);
 }
 return 0;
}
