#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t *storage=(void *)0x390000000UL;static uint64_t traces[1024][8];static uint32_t calls,line,severity;static jmp_buf escape;
static void rd(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void *p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static uint32_t u(uint8_t *p){uint32_t n;memcpy(&n,p,4);return n;}static uint64_t q(uint8_t *p){uint64_t n;memcpy(&n,p,8);return n;}static void p32(uint8_t *p,uint32_t n){memcpy(p,&n,4);}static void p64(uint8_t *p,uint64_t n){memcpy(p,&n,8);}
static uint64_t *trace(uint32_t kind){if(calls>=1024)exit(12);uint64_t *t=traces[calls++];t[0]=kind;return t;}
static void *metadata(void){trace(1);if(u(storage+0x7c10)&1)p64(storage+0x4810,(uintptr_t)storage+0x6010);p32(storage+0x7e38,u(storage+0x7c18));return storage+0x7e00;}
static void reset_begin(void){trace(2);}
static void *allocator(void){trace(3);if(u(storage+0x7c10)&2){uint8_t *object=(void *)(uintptr_t)q(storage+0x7c08);p64(object+0x30,(uintptr_t)storage+0x7100);}return storage+0x7000;}
static void free_string(void *a,void *p){uint64_t *t=trace(4);t[1]=(uintptr_t)a;t[2]=(uintptr_t)p;if(u(storage+0x7c10)&4)p64(storage+0x4810,(uintptr_t)storage+0x6100);}
static void remove_node(void *owner,void *node){uint64_t *t=trace(5);t[1]=(uintptr_t)owner;t[2]=(uintptr_t)node;if(u(storage+0x7c10)&8){uint8_t *object=(void *)(uintptr_t)q(storage+0x7c08);p64(object+0x58,(uintptr_t)storage+0x7200);p64(object+0x68,(uintptr_t)storage+0x7300);}}
static void assertion(const char *expr,const char *file,uint32_t l,uint32_t s,...){(void)expr;(void)file;line=l;severity=s;longjmp(escape,1);}
static void hook(uintptr_t p,void *fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void *)p,b,14);}
static void map(void *p,size_t n){if(mmap(p,n,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)exit(5);}
int main(int argc,char **argv){if(argc!=2)return 2;FILE *f=fopen(argv[1],"rb");if(!f)return 3;map((void *)0x100000000UL,0x2400000);if(fread((void *)0x100000000UL,1,0xd22000,f)!=0xd22000)return 4;fclose(f);map(storage,0x8000);hook(0x1007abc10UL,metadata);hook(0x100011c10UL,reset_begin);hook(0x1007e50d0UL,allocator);hook(0x1007e5db0UL,free_string);hook(0x100795a70UL,remove_node);hook(0x1007e5f70UL,assertion);p64((void *)0x102017cb8UL,(uintptr_t)storage+0x7e00);if(mprotect((void *)0x100000000UL,0xc05000,5))return 6;
 uintptr_t functions[]={0x100522290UL,0x100522700UL,0x1005227a0UL,0x100522390UL,0x100522380UL,0x100523480UL,0x100523c00UL};uint32_t cases;rd(&cases,4);wr(&cases,4);while(cases--){rd(storage,0x8000);uint32_t mode=u(storage+0x7c00);if(mode>6)return 7;calls=line=severity=0;memset(traces,0,sizeof traces);uint64_t result=0;if(!setjmp(escape)){if(mode==5)((void(*)(void *))functions[mode])((void *)(uintptr_t)q(storage+0x7c08));else if(mode==1)result=(uintptr_t)((void *(*)(void *))functions[mode])(storage);else if(mode==6)result=((uint32_t(*)(void *,void *,void *))functions[mode])(storage,(void *)(uintptr_t)q(storage+0x7c20),storage+0x6800);else((void(*)(void *,void *))functions[mode])(storage,(void *)(uintptr_t)q(storage+0x7c08));}uint32_t h[3]={line,severity,calls};wr(h,12);wr(&result,8);wr(traces,calls*64);wr(storage,0x8000);}return 0;
}
