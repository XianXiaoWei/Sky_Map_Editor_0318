#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
static _Alignas(32) __attribute__((used)) unsigned char barn[0xc830],sources[48*192],records[48*48];
static __attribute__((used)) uint32_t source_count,accepted_count,selected_count;
static __attribute__((used)) uintptr_t source_base;
static void readin(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void hook(uintptr_t at,void *fn){uint8_t j[]={0x48,0xb8,0,0,0,0,0,0,0,0,0xff,0xe0};memcpy(j+2,&fn,8);memcpy((void *)at,j,12);}
static void count_hook(uintptr_t at,void *fn){uint8_t j[]={0x49,0xba,0,0,0,0,0,0,0,0,0x41,0xff,0xe2};memcpy(j+2,&fn,8);memcpy((void *)at,j,13);}
__attribute__((naked,noinline)) static void classify_capture(void){__asm__ volatile(
 // Capture count and replay all instructions displaced by the count hook.
 "mov %eax,accepted_count(%rip)\nmov %ecx,%r13d\nmov %r13,%rcx\nshl $4,%rcx\nlea (%rcx,%rcx,2),%rcx\nmovabs $0x100226a15,%rdx\njmp *%rdx");}
__attribute__((naked,noinline)) static void finish(void){__asm__ volatile(
 "mov %r13d,selected_count(%rip)\nlea -0x930(%rbp),%rsi\nlea records(%rip),%rdi\nmov $288,%ecx\nrep movsq\n"
 "lea -0x2d30(%rbp),%rax\nmov %rax,source_base(%rip)\n"
 "add $0x2ee8,%rsp\npop %rbx\npop %r12\npop %r13\npop %r14\npop %r15\npop %rbp\nret");}
__attribute__((naked,noinline)) static void run(void){__asm__ volatile(
 "push %rbp\nmov %rsp,%rbp\npush %r15\npush %r14\npush %r13\npush %r12\npush %rbx\nsub $0x2ee8,%rsp\n"
 "lea sources(%rip),%rsi\nlea -0x2d30(%rbp),%rdi\nmov $1152,%ecx\nrep movsq\n"
 "lea -0x930(%rbp),%rdi\nxor %eax,%eax\nmov $288,%ecx\nrep stosq\n"
 "mov source_count(%rip),%eax\nmov %eax,-0x2d48(%rbp)\nmov %rax,-0x2e50(%rbp)\n"
 "lea barn(%rip),%r12\nxor %ecx,%ecx\nvxorps %xmm0,%xmm0,%xmm0\nmovabs $0xaaaaaaaaaaaaaaab,%r11\n"
 "movabs $0x100aa77ec,%rax\nvmovss (%rax),%xmm8\nmovabs $0x100226920,%rax\njmp *%rax");}
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *mem=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);if(mem==MAP_FAILED||fread(mem,1,0xd22000,file)!=0xd22000)return 4;fclose(file);
 count_hook(0x100226a07UL,classify_capture);hook(0x100226fc2UL,finish);
 uint32_t cases;readin(&cases,4);fwrite(&cases,4,1,stdout);
 for(unsigned i=0;i<cases;i++){
  float position[3];readin(&source_count,4);if(source_count>48)return 5;readin(position,12);memset(barn,0,sizeof(barn));memset(sources,0,sizeof(sources));
  for(unsigned lane=0;lane<3;lane++)memcpy(barn+0x18+lane*0x1000,position+lane,4);
  for(unsigned j=0;j<source_count;j++){readin(sources+j*192,16);readin(sources+j*192+0x8c,8);}
  run();fwrite(&accepted_count,4,1,stdout);fwrite(&selected_count,4,1,stdout);
  for(unsigned j=0;j<accepted_count;j++){uintptr_t pointer;memcpy(&pointer,records+j*48,8);uint32_t index=(pointer-source_base)/192;fwrite(&index,4,1,stdout);fwrite(records+j*48+16,4,5,stdout);}
 }
 return 0;
}
