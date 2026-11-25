#define _GNU_SOURCE
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <immintrin.h>
static void input(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void jump(uintptr_t at,void *target){static uintptr_t slot=0x102300000;uint8_t b[6]={0xff,0x25};int32_t d=slot-at-6;memcpy(b+2,&d,4);memcpy((void*)slot,&target,8);slot+=8;memcpy((void*)at,b,6);}
extern uint32_t selection(void*,uint32_t);
extern void selection_return(void);
extern uint32_t beamo_selection(void*,uint32_t);
extern void beamo_selection_return(void);
__asm__(".text\nselection:\n"
 "push %rbp\nmov %rsp,%rbp\npush %rbx\npush %r12\npush %r13\npush %r14\npush %r15\nsub $0x6308,%rsp\n"
 "mov %rdi,%r15\nxor %r13d,%r13d\nxor %r14d,%r14d\nmov %esi,-0x5030(%rbp)\nmovq $0,-0x6158(%rbp)\n"
 "movabs $0x10046455f,%r11\njmp *%r11\nselection_return:\n"
 "lea -40(%rbp),%rsp\npop %r15\npop %r14\npop %r13\npop %r12\npop %rbx\npop %rbp\nvzeroupper\nret\n");
__asm__(".text\nbeamo_selection:\n"
 "push %rbp\nmov %rsp,%rbp\npush %rbx\npush %r12\npush %r13\npush %r14\npush %r15\nsub $0x408,%rsp\n"
 "mov %rdi,%r10\nlea 0x200(%rdi),%r14\nxor %r11d,%r11d\nxor %ebx,%ebx\nlea -0x380(%rbp),%r13\nvmovd %esi,%xmm0\n"
 "movabs $0x100196ae4,%r9\njmp *%r9\nbeamo_selection_return:\n"
 "lea -40(%rbp),%rsp\npop %r15\npop %r14\npop %r13\npop %r12\npop %rbx\npop %rbp\nvzeroupper\nret\n");
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *image=mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
 if(image==MAP_FAILED||fread(image,1,0xd22000,file)!=0xd22000)return 4;fclose(file);
 jump(0x10046464e,selection_return);jump(0x100464731,selection_return);
 jump(0x100196be2,beamo_selection_return);
 uint32_t count;input(&count,4);fwrite(&count,4,1,stdout);
 for(uint32_t i=0;i<count;i++){
  uint32_t mode,n,d,enabled;input(&mode,4);input(&n,4);input(&d,4);input(&enabled,4);if(!n||n>7)return 5;
  _Alignas(32) uint8_t state[0x400]={0};float distances[7];input(distances,n*4);
  _Alignas(32) float point[4],obb[16],out[4];input(point,16);input(obb,64);
  _mm_setcsr(0x1f80);memcpy(state+0x98,&n,4);*(uint32_t*)(state+0x98)=n+1;memcpy(state+0xb4,distances,n*4);
  uint32_t ix=0,result=0;float continuous=0;
  if(mode==0){*(uint8_t*)0x100cc9610=enabled;ix=selection(state,d);memcpy(&continuous,state+0xb0,4);}
  else if(mode==1){typedef void(*Setter)(void*,uint32_t,float);float value;memcpy(&value,&d,4);((Setter)0x100466440)(state+0x10,enabled,value);memcpy(distances,state+0xb4,n*4);}
  else if(mode==3){if(n>4)return 6;memcpy(state+0xb8,&n,4);memcpy(state+0x290,distances,n*4);for(uint32_t j=0;j<3;j++)*(float*)(state+0x2a0+j*4)=(enabled&(1U<<j))?1:0;ix=beamo_selection(state,d);}
  else if(mode!=2)return 6;
  typedef uint8_t(*Nearest)(const float*,const float*,float*);result=((Nearest)0x10078cae0)(point,obb,out);
  fwrite(&ix,4,1,stdout);fwrite(&continuous,4,1,stdout);fwrite(distances,n*4,1,stdout);fwrite(&result,4,1,stdout);fwrite(out,12,1,stdout);
 }
 return 0;
}
