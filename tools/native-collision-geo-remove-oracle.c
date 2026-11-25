#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t *storage=(void *)0x380000000UL;static uint64_t traces[4][8];static uint32_t calls,line,severity;static jmp_buf escape;
static void rd(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void *p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static uint32_t u(uint8_t *p){uint32_t n;memcpy(&n,p,4);return n;}static uint64_t q(uint8_t *p){uint64_t n;memcpy(&n,p,8);return n;}static void p32(uint8_t *p,uint32_t n){memcpy(p,&n,4);}static void p64(uint8_t *p,uint64_t n){memcpy(p,&n,8);}
static uint64_t *trace(uint32_t kind){if(calls>=4)exit(12);uint64_t *t=traces[calls++];t[0]=kind;return t;}
static void mutate(uint32_t call){uint32_t flags=u(storage+0xe0008);uint8_t *inst=(void *)(uintptr_t)q(storage+0xe0000);if(call==1){if(flags&1)p64(storage+0x92020,(uintptr_t)storage+0xd0200);if(flags&2){inst[0x188]=0xff;inst[0x189]=0xfe;}}if(call==2){if(flags&4)p64(storage+0x92028,(uintptr_t)storage+0xd0300);if(flags&8){inst[0x18a]=0xcd;inst[0x18b]=0xab;}}if(call==3){uint32_t count=u(storage+0xe000c);if(count!=0xffffffff)p32(storage+0x90018,count);if(flags&16)p64(storage+0x90020,(uintptr_t)inst);if(flags&32)p64(storage+0x90010,(uintptr_t)storage+0xd0400);}}
static void bounds(void *index,void *entry){uint64_t *t=trace(1);t[1]=(uintptr_t)index;t[2]=(uintptr_t)entry;mutate(1);}
static void membership(void *index,void *inst,uint32_t slot){uint64_t *t=trace(2);t[1]=(uintptr_t)index;t[2]=(uintptr_t)inst;t[3]=slot;mutate(calls);}
static void assertion(const char *expr,const char *file,uint32_t l,uint32_t s,...){(void)expr;(void)file;line=l;severity=s;longjmp(escape,1);}
static void hook(uintptr_t p,void *fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void *)p,b,14);}
static void map(void *p,size_t n){if(mmap(p,n,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)exit(5);}
int main(int argc,char **argv){if(argc!=2)return 2;FILE *f=fopen(argv[1],"rb");if(!f)return 3;map((void *)0x100000000UL,0x2400000);if(fread((void *)0x100000000UL,1,0xd22000,f)!=0xd22000)return 4;fclose(f);map(storage,0x100000);hook(0x10077e4b0UL,bounds);hook(0x10077b350UL,membership);hook(0x1007e5f70UL,assertion);if(mprotect((void *)0x100000000UL,0xc05000,5))return 6;
 uint32_t cases;rd(&cases,4);wr(&cases,4);while(cases--){rd(storage,0x100000);calls=line=severity=0;memset(traces,0,sizeof traces);if(!setjmp(escape))((void(*)(void *,void *))0x100779200UL)(storage,(void *)(uintptr_t)q(storage+0xe0000));uint32_t h[3]={line,severity,calls};wr(h,12);wr(traces,calls*64);wr(storage,0x100000);}return 0;
}
