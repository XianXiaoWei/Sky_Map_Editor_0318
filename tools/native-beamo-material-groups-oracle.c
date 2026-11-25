#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t *storage=(void *)0x370000000UL;static uint32_t line,severity;static jmp_buf escape;
extern void segment(void *context,uint32_t materials);
__asm__(".text\n.global segment\nsegment:\n"
 "push %rbp\npush %rbx\npush %r12\npush %r13\npush %r14\npush %r15\nsub $16,%rsp\n"
 "mov %rdi,%rbx\nmov %esi,%r12d\nmovabs $0x100195f89,%r11\ncall *%r11\n"
 "add $16,%rsp\npop %r15\npop %r14\npop %r13\npop %r12\npop %rbx\npop %rbp\nret\n");
static void rd(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void *p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void assertion(const char *expr,const char *file,uint32_t l,uint32_t s,...){(void)expr;(void)file;line=l;severity=s;longjmp(escape,1);}static void done(void){}
static void hook(uintptr_t p,void *fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void *)p,b,14);}
static void map(void *p,size_t n){if(mmap(p,n,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)exit(5);}
int main(int argc,char **argv){if(argc!=2)return 2;FILE *f=fopen(argv[1],"rb");if(!f)return 3;map((void *)0x100000000UL,0x2400000);if(fread((void *)0x100000000UL,1,0xd22000,f)!=0xd22000)return 4;fclose(f);map(storage,0x100000);hook(0x100196094UL,done);hook(0x1007e6030UL,assertion);if(mprotect((void *)0x100000000UL,0xc05000,5))return 6;
 uint32_t cases;rd(&cases,4);wr(&cases,4);while(cases--){uint32_t materials;rd(&materials,4);rd(storage,0x100000);line=severity=0;if(!setjmp(escape))segment(storage+0xe0000,materials);uint32_t h[2]={line,severity};wr(h,8);wr(storage,0x100000);}return 0;
}
