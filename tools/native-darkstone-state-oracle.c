#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>
static uint8_t *a=(void*)0x440000000UL;
static uint32_t calls;
static uint8_t trace[32][96];
static void rd(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void wr(void *p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static uint32_t u32(void *p){uint32_t n;memcpy(&n,p,4);return n;}
static float f32(void *p){float n;memcpy(&n,p,4);return n;}
static void hook(uintptr_t at,void *fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static uint8_t *record(uint64_t kind,uintptr_t p){if(calls>=32)exit(12);uint8_t *r=trace[calls++];memset(r,0,96);memcpy(r,&kind,8);memcpy(r+8,&p,8);return r;}
static void transform(void *out,void *p){record(1,(uintptr_t)p);memcpy(out,a+0x30000,64);}
static void obb(void *out,void *p){record(2,(uintptr_t)p);memcpy(out,a+0x30040,64);}
static float exponential(float n){float out=expf(n);uint8_t *r=record(3,0);memcpy(r+48,&n,4);memcpy(r+52,&out,4);return out;}
static void set_transform(void *p,void *matrix){uint8_t *r=record(4,(uintptr_t)p);memcpy(r+16,matrix,64);if(u32(a+0x5f030)==1){void *mesh=a+0x51000;memcpy(a+0x4028,&mesh,8);}}
static void enabled(void *p,int n){uint8_t *r=record(5,(uintptr_t)p);memcpy(r+48,&n,4);if(u32(a+0x5f030)==2)a[0x1038]^=1;}
static void meta_enabled(void *p,int n){uint8_t *r=record(7,(uintptr_t)p);memcpy(r+48,&n,4);if(u32(a+0x5f030)==3){a[0x1039]=1;}}
static void vector(void *p,uint32_t pass,void *name,void *color,float transition){if(pass||transition!=0||*(uint8_t*)name&1)exit(14);uint8_t *r=record(6,(uintptr_t)p);snprintf((char*)r+16,32,"%s",(char*)name+1);memcpy(r+48,color,16);}
__attribute__((naked)) static void finish(void){__asm__ volatile("mov %r15,%rsp\n pop %r15\n pop %r14\n pop %r13\n pop %r12\n pop %rbx\n pop %rbp\n ret\n");}
__attribute__((naked)) static void consume(void *input __attribute__((unused))){__asm__ volatile(
 "push %rbp\n push %rbx\n push %r12\n push %r13\n push %r14\n push %r15\n mov %rsp,%r15\n and $-32,%rsp\n sub $0xb00,%rsp\n lea 0xa00(%rsp),%rbp\n"
 "lea 0x4000(%rdi),%r13\n mov %r13,0x80(%rsp)\n movss 0x5f008(%rdi),%xmm1\n movss %xmm1,0x68(%rsp)\n movss 0x5f004(%rdi),%xmm0\n movss %xmm0,0x60(%rsp)\n mov 0x5f00c(%rdi),%eax\n mov %eax,0x2c(%rsp)\n"
 "movabs $0x10027c8b5,%rax\n jmp *%rax\n");}
__attribute__((naked)) static void shape(void *input __attribute__((unused))){__asm__ volatile(
 "push %rbp\n push %rbx\n push %r12\n push %r13\n push %r14\n push %r15\n mov %rsp,%r15\n and $-32,%rsp\n sub $0xb00,%rsp\n lea 0xa00(%rsp),%rbp\n"
 "lea 0x4000(%rdi),%r13\n movss 0xd4(%r13),%xmm2\n xor %r12d,%r12d\n movq $0,0x40(%rbp)\n cmpl $0,0x5f010(%rdi)\n je 1f\n movq $1,0x40(%rbp)\n 1:\n movabs $0x10027d909,%rax\n jmp *%rax\n");}
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,file)!=0xd22000)return 5;fclose(file);
 if(mmap(a,0x60000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 hook(0x100aa2708UL,exponential);hook(0x1003ffe10UL,set_transform);hook(0x1003ffe50UL,enabled);hook(0x1003fff20UL,vector);hook(0x1004d1f60UL,meta_enabled);
 hook(0x10027c9bbUL,finish);hook(0x10027ca90UL,finish);hook(0x10027d9afUL,finish);
 uint32_t count;rd(&count,4);wr(&count,4);
 while(count--){
  rd(a,0x60000);calls=0;void *fn=transform;memcpy(a+0x5e018,&fn,8);fn=obb;memcpy(a+0x5e020,&fn,8);
  memcpy((void*)0x100d2b490UL,a+0x5e200,16);
  uint32_t mode=u32(a+0x5f014);void *p=a+0x4000;uint32_t result=0;
  switch(mode){
   case 0:for(uint32_t i=0;i<u32(a+0x5f018);i++)((void(*)(void*,void*,float,float))0x10027e530UL)(p,u32(a+0x5f010)?a+0x4800:0,f32(a+0x5f000),f32(a+0x5f004));break;
   case 1:consume(a);break;
   case 2:shape(a);break;
   case 3:((void(*)(void*,float))0x10027e3d0UL)(p,f32(a+0x5f000));break;
   case 4:((void(*)(void*,void*,float))0x10027b6e0UL)(p,a+0x28000,f32(a+0x5f000));break;
   case 5:result=((uint8_t(*)(void*))0x10027e410UL)(p);break;
   case 6:((void(*)(void*))0x10027b120UL)(a+0x1000);break;
   case 7:result=((uint8_t(*)(void*))0x10027b310UL)(a+0x1000);break;
   default:exit(15);
  }
  memcpy(a+0x5f040,&result,4);memset(a+0x5e000,0,0x200);wr(a,0x60000);wr(&calls,4);wr(trace,calls*96);
 }
 return 0;
}
