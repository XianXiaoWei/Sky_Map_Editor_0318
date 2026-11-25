/* Unchanged original VertexData.SetStream; RenderBuffer creation is captured. */
#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t *memory=(void*)0x2f0000000UL;static uint32_t line,severity,calls,log_args[6];static jmp_buf escape;
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static uint32_t offset(void*p){return p?(uint32_t)((uint8_t*)p-memory):0xffffffff;}
static void create(void*buffer,void*name,uint32_t usage,uint32_t mode,uint32_t bytes,void*data){calls++;uint32_t a[]={offset(buffer),offset(name),usage,mode,bytes,offset(data)};memcpy(log_args,a,24);}
static void assertion(char*expr,char*file,uint32_t l,uint32_t s){(void)expr;(void)file;line=l;severity=s;longjmp(escape,1);}
static void hook(uintptr_t at,void*fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static void map(void*p,size_t n){if(mmap(p,n,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)exit(5);}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;map((void*)0x100000000UL,0x2400000);if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 4;fclose(f);map(memory,4096);hook(0x100794e00UL,create);hook(0x1007e5f70UL,assertion);if(mprotect((void*)0x100000000UL,0xc05000,5))return 6;
 uint32_t count;rd(&count,4);wr(&count,4);while(count--){uint32_t a[9];rd(a,36);rd(memory,4096);line=severity=calls=0;memset(log_args,0,24);
 if(!setjmp(escape))((void(*)(void*,uint32_t,void*,void*,uint32_t,uint32_t,uint32_t,void*))0x1007f5430UL)(memory+a[0],a[1],memory+a[2],memory+a[3],a[4],a[5],a[6],a[7]==0xffffffff?NULL:memory+a[7]);
 uint32_t result[]={line,severity,calls};wr(result,12);wr(log_args,24);wr(memory,4096);
 }return 0;}
