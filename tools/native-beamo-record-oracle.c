#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t *barn=(void *)0x2f0000000UL;static uint32_t calls,names,line,severity;static jmp_buf escape;
extern void prepare_records(void *barn,void *context);
__asm__(".text\n.global prepare_records\nprepare_records:\n"
 "push %rbp\nmov %rsp,%rbp\npush %rbx\npush %r12\npush %r13\npush %r14\npush %r15\nsub $8,%rsp\n"
 "mov %rdi,%r12\nmov %rsi,%rbx\nmovabs $0x1001950da,%r11\ncall *%r11\n"
 "add $8,%rsp\npop %r15\npop %r14\npop %r13\npop %r12\npop %rbx\npop %rbp\nret\n");
static void done(void){}
static void *base(void){uint32_t id=16+calls++;memcpy(barn+0xe0038,&id,4);return barn+0xe0000;}
static const char *name(void *p){(void)p;names++;return "prepared-mesh-name";}
static void assertion(void *expr,void *file,uint32_t l,uint32_t s,...){(void)expr;(void)file;line=l;severity=s;longjmp(escape,1);}
static void rd(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void *p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void u32(size_t at,uint32_t v){memcpy(barn+at,&v,4);}static void ptr(size_t at,uintptr_t v){memcpy(barn+at,&v,8);}
static void hook(uintptr_t p,void *fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void *)p,b,14);}
static void map(void *p,size_t n){if(mmap(p,n,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)exit(5);}
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *f=fopen(argv[1],"rb");if(!f)return 3;map((void *)0x100000000UL,0x2400000);if(fread((void *)0x100000000UL,1,0xd22000,f)!=0xd22000)return 4;fclose(f);map(barn,0x100000);
 hook(0x100195330UL,done);hook(0x100195d10UL,done);hook(0x1007abc10UL,base);hook(0x1007e6030UL,assertion);void *meta=barn+0xe0000;memcpy((void *)0x101dd8c40UL,&meta,8);
 if(mprotect((void *)0x100000000UL,0xc05000,5))return 6;
 uint32_t n;rd(&n,4);wr(&n,4);while(n--){
  uint32_t h[5],materials[16];rd(h,20);rd(materials,64);if(h[0]+h[1]>16||h[2]>16)return 7;memset(barn,h[4],0x100000);calls=names=line=severity=0;
  u32(0x20010,h[0]);u32(0x20014,h[1]);ptr(0x20020,(uintptr_t)barn+0x20040);u32(0xc8f30,h[2]);barn[0xe100d]=h[3];ptr(0xe2038,(uintptr_t)name);
  for(uint32_t i=0;i<h[2];i++)u32(0xc2034+i*0x6f0,materials[i]);
  for(uint32_t i=0;i<h[0]+h[1];i++){size_t at=i<h[0]?16+i*192:0x18010+(i-h[0])*128;uint8_t raw[192];rd(raw,192);memcpy(barn+at,raw,i<h[0]?192:128);ptr(at,(uintptr_t)barn+0xe2000);}
  ptr(0xe3008,(uintptr_t)barn+0xe1000);ptr(0xe3018,(uintptr_t)barn+0xc0000);
  if(!setjmp(escape))prepare_records(barn,barn+0xe3000);
  uint32_t header[8]={line,severity,calls,names,0,0,0,0};memcpy(header+4,barn+0x20010,12);memcpy(header+7,barn+0x6c830,4);wr(header,32);wr(barn+0x20040,(h[0]+h[1])*384);
 }
 return 0;
}
