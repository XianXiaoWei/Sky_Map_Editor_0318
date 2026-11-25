#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t *a=(void*)0x440000000UL;
static uint8_t trace[16][96];static uint32_t calls,line,severity;static jmp_buf escape;
static uint32_t u(void*p){uint32_t n;memcpy(&n,p,4);return n;}
static float f32(void*p){float n;memcpy(&n,p,4);return n;}
static void pq(void*p,uint64_t n){memcpy(p,&n,8);}
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static uint8_t *record(uint32_t kind){if(calls>=16)exit(12);uint8_t*r=trace[calls++];memset(r,0,96);memcpy(r,&kind,4);return r;}
static float sine(float n){float result=sinf(n);uint8_t*r=record(1);memcpy(r+8,&n,4);memcpy(r+12,&result,4);return result;}
static void wind(void*out,void*owner,void*position){uint8_t*r=record(2);memcpy(r+8,&owner,8);memcpy(r+16,&position,8);memcpy(r+24,position,16);memcpy(out,a+0x1e030,16);}
static void assertion(char*x,char*file,uint32_t l,uint32_t s,...){(void)x;(void)file;line=l;severity=s;longjmp(escape,1);}
static void *renderer(void){record(4);return a+0xc000;}
static void sort(void*begin,void*end,void*comparator){(void)comparator;uint8_t*r=record(5);memcpy(r+8,&begin,8);memcpy(r+16,&end,8);}
static void *map(void*buffer){uint8_t*r=record(6);memcpy(r+8,&buffer,8);return a+0x10000;}
static void camera(void*out,void*owner){uint8_t*r=record(7);memcpy(r+8,&owner,8);memcpy(out,a+0xa000,16);}
static void commit(void*vertex){uint8_t*r=record(8);memcpy(r+8,&vertex,8);}
__attribute__((naked)) static void finish(void){__asm__ volatile("mov %r15,%rsp\n pop %r15\n pop %r14\n pop %r13\n pop %r12\n pop %rbx\n pop %rbp\n ret\n");}
/* Execute the primary sprite span in place with its actual live caller
 * registers and stack. Every instruction and branch in this span is intact. */
__attribute__((naked)) static void primary(void *input __attribute__((unused))){__asm__ volatile(
 "push %rbp\n push %rbx\n push %r12\n push %r13\n push %r14\n push %r15\n"
 "mov %rsp,%r15\n and $-32,%rsp\n sub $0x3400,%rsp\n lea 0x3340(%rsp),%rbp\n"
 "lea 0x1000(%rdi),%rax\n mov %rax,-0x30b0(%rbp)\n lea 0x8000(%rdi),%r14\n"
 "lea 0x3000(%rdi),%rcx\n mov %rcx,-0x31c8(%rbp)\n"
 "lea 0x10c0(%rdi),%rcx\n mov %rcx,-0x3160(%rbp)\n"
 "vmovaps 0x1e010(%rdi),%xmm0\n vmovaps %xmm0,-0x3140(%rbp)\n"
 "vmovaps 0x1e020(%rdi),%xmm0\n vmovaps %xmm0,-0x3210(%rbp)\n"
 "vmovaps 0x10c0(%rdi),%xmm0\n vmovaps %xmm0,-0x3170(%rbp)\n"
 "mov 0x1e040(%rdi),%ecx\n mov %ecx,-0x30c0(%rbp)\n"
 "movabs $0x10033e5e3,%rcx\n jmp *%rcx\n");}
int main(int argc,char**argv){
 if(argc!=2)return 2;FILE*file=fopen(argv[1],"rb");if(!file)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,file)!=0xd22000)return 5;fclose(file);
 if(mmap(a,0x20000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 hook(0x10033e841UL,finish);hook(0x100aa2bcaUL,sine);hook(0x100328200UL,wind);hook(0x1007e6030UL,assertion);hook(0x1007e5f70UL,assertion);
 hook(0x100781700UL,renderer);hook(0x1006158c0UL,sort);hook(0x100795060UL,map);hook(0x10076be90UL,camera);hook(0x1007f58d0UL,commit);
 uint32_t count;rd(&count,4);wr(&count,4);
 while(count--){
  rd(a,0x20000);calls=line=severity=0;pq((void*)0x100c0d8d8UL,(uintptr_t)(a+0x1d000));
  if(!setjmp(escape))switch(u(a+0x1e000)){
   case 0:primary(a);break;
   case 1:{
    float x=f32(a+0x5000)-f32(a+0xa000),y=f32(a+0x5004)-f32(a+0xa004),z=f32(a+0x5008)-f32(a+0xa008);
    volatile float xx=x*x,yy=y*y,zz=z*z,xy=xx+yy;float square=zz+xy,estimate;
    __asm__("vrsqrtss %1,%1,%0":"=x"(estimate):"x"(square));uint8_t*r=record(3);memcpy(r+8,&square,4);memcpy(r+12,&estimate,4);
    ((void(*)(void*,void*))0x100614ea0UL)(a+0x3000,a+0xa000);break;
   }
   case 2:((void*(*)(void*,void*,void*,void*,float,float,float,float,float))0x100614df0UL)(a+0x3000,a+u(a+0x1e004),a+u(a+0x1e008),a+u(a+0x1e00c),f32(a+0x1e050),f32(a+0x1e054),f32(a+0x1e058),f32(a+0x1e05c),f32(a+0x1e060));break;
   case 3:((void(*)(void*))0x100614ca0UL)(a+0x3000);break;
  }
  wr(a,0x20000);wr(&line,4);wr(&severity,4);wr(&calls,4);wr(trace,calls*96);
 }
 return 0;
}
