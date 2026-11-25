#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>
static _Alignas(32) __attribute__((used)) unsigned char barn[0xc830];
static _Alignas(32) __attribute__((used)) float input[48],vector[4],powers[2];
static unsigned power_used;
static void readin(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void hook(uintptr_t at,void *fn){uint8_t j[]={0x48,0xb8,0,0,0,0,0,0,0,0,0xff,0xe0};memcpy(j+2,&fn,8);memcpy((void *)at,j,12);}
static float exponent_get(float v){if(power_used>=2)exit(11);float r=expf(v);powers[power_used++]=r;return r;}
__attribute__((naked,noinline)) static void finish(void){__asm__ volatile("add $0x2ee8,%rsp\npop %rbx\npop %r12\npop %r13\npop %r14\npop %r15\npop %rbp\nret");}
__attribute__((naked,noinline)) static void start_weights(void){__asm__ volatile("movabs $0x100aa50c0,%rax\nvmovss (%rax),%xmm9\nmovabs $0x10022689f,%rax\njmp *%rax");}
__attribute__((naked,noinline)) static void start_tail(void){__asm__ volatile(
 "vmovaps input+64(%rip),%xmm0\nvmovaps input+80(%rip),%xmm11\nvmovaps input(%rip),%xmm7\nvmovss input+96(%rip),%xmm14\n"
 "vmovaps input+112(%rip),%xmm1\nvmovaps %xmm1,-0x2d30(%rbp)\nvmovaps input+128(%rip),%xmm1\nvmovaps %xmm1,-0x2d20(%rbp)\n"
 "vmovaps input+144(%rip),%xmm1\nvmovaps %xmm1,-0x2d10(%rbp)\nvmovaps input+160(%rip),%xmm1\nvmovaps %xmm1,-0x2d00(%rbp)\nvmovss input+176(%rip),%xmm1\nvmovss %xmm1,-0x2ca8(%rbp)\n"
 "vmovss input+40(%rip),%xmm1\nvpermilps $0,%xmm1,%xmm1\nvmovaps %xmm1,-0x2d90(%rbp)\n"
 "lea vector(%rip),%r13\nmov %r13,-0x2d60(%rbp)\nlea vector+4(%rip),%rax\nmov %rax,-0x2d78(%rbp)\nlea vector+8(%rip),%rax\nmov %rax,-0x2d70(%rbp)\n"
 "movabs $0x100aa78c4,%rax\nvmovss (%rax),%xmm10\nmovabs $0x100aa70f4,%rax\nvmovss (%rax),%xmm12\nvxorps %xmm13,%xmm13,%xmm13\n"
 "xor %eax,%eax\nxor %r15d,%r15d\nxor %ecx,%ecx\nmovabs $0x10022757e,%rbx\njmp *%rbx");}
__attribute__((naked,noinline)) static void run(void){__asm__ volatile(
 "push %rbp\nmov %rsp,%rbp\npush %r15\npush %r14\npush %r13\npush %r12\npush %rbx\nsub $0x2ee8,%rsp\n"
 "lea barn(%rip),%r12\nvmovss input+40(%rip),%xmm0\nvmovaps %xmm0,-0x2db0(%rbp)\nmovabs $0x100226839,%rax\njmp *%rax");}
int main(int argc,char **argv){
 if(argc!=2)return 2;
 FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *mem=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);if(mem==MAP_FAILED||fread(mem,1,0xd22000,file)!=0xd22000)return 4;fclose(file);
 hook(0x100aa2708UL,exponent_get);hook(0x100226873UL,start_weights);hook(0x1002268e3UL,start_tail);hook(0x10022788bUL,finish);
 uint32_t cases;readin(&cases,4);fwrite(&cases,4,1,stdout);
 for(unsigned i=0;i<cases;i++){
  readin(input,sizeof(input));memset(barn,0,sizeof(barn));memset(vector,0,sizeof(vector));power_used=0;
  for(unsigned lane=0;lane<3;lane++){memcpy(barn+0x18+lane*0x1000,input+lane,4);memcpy(barn+0x4018+lane*0x1000,input+4+lane,4);}
  memcpy(barn+0x7018,input+8,4);memcpy(barn+0x3018,input+9,4);*(uint32_t *)(barn+0xc828)=1;
  run();fwrite(powers,4,2,stdout);
  for(unsigned lane=0;lane<3;lane++)fwrite(barn+0x18+lane*0x1000,4,1,stdout);
  for(unsigned lane=0;lane<3;lane++)fwrite(barn+0x4018+lane*0x1000,4,1,stdout);
  fwrite(barn+0x7018,4,1,stdout);fwrite(barn+0x3018,4,1,stdout);fwrite(vector,4,3,stdout);
 }
 return 0;
}
