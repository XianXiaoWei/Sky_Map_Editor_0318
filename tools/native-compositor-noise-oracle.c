#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>
static _Alignas(32) unsigned char compositor[0x100],camera_system[0x300];
static uint64_t guard;
static int values[3],next;
static int explicit_rand(void){return values[next++];}
static unsigned frame_number(void *p){(void)p;return 0;}
static void hook(uintptr_t at,void *fn){uint8_t j[]={0x48,0xb8,0,0,0,0,0,0,0,0,0xff,0xe0};memcpy(j+2,&fn,8);memcpy((void *)at,j,12);}
extern void invoke_random(void *);
__asm__(".text\n.global invoke_random\ninvoke_random:\n push %rbp\n push %r13\n sub $72,%rsp\n lea 72(%rsp),%rbp\n mov %rdi,%r13\n movabs $0x10024716e,%rax\n call *%rax\n add $72,%rsp\n pop %r13\n pop %rbp\n ret\n");
int main(int argc,char **argv){
 if(argc!=2)return 2;
 FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *mem=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
 if(mem==MAP_FAILED||fread(mem,1,0xd22000,file)!=0xd22000)return 4;
 fclose(file);
 hook(0x100aa2b22UL,explicit_rand);*(uint8_t *)0x1002471c7UL=0xc3;
 hook(0x100241e10UL,frame_number);hook(0x100aa2708UL,expf);
 hook(0x1001e1a47UL,(void *)0x1001e22ecUL);
 *(uintptr_t *)0x100c0d8d8UL=(uintptr_t)&guard;
 // Explicit centered scene jitter. Only input constants change; the native
 // Gaussian reconstruction instructions and float32 divisions are untouched.
 ((float *)0x100aaf3c0UL)[0]=3.5f;((float *)0x100aaf3c0UL)[1]=3.5f;
 unsigned count;if(fread(&count,4,1,stdin)!=1)return 5;fwrite(&count,4,1,stdout);
 for(unsigned i=0;i<count;i++){
  unsigned size[2];if(fread(values,12,1,stdin)!=1||fread(size,8,1,stdin)!=1)return 6;
  next=0;invoke_random(compositor);fwrite(compositor+0x50,12,1,stdout);
  ((float *)(compositor+0x30))[0]=size[0];((float *)(compositor+0x30))[1]=size[1];
  ((void (*)(void *,void *,void *))0x1001e1400UL)(camera_system,compositor,NULL);
  fwrite(camera_system+0x220,32,1,stdout);
 }
 return 0;
}
