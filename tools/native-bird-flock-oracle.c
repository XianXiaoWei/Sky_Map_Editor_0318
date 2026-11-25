#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t *arena=(void*)0x440000000UL;static jmp_buf escape;static uint32_t line,severity,trace[2048],used,frees,gets,mode;
static uint32_t u32(size_t at){uint32_t n;memcpy(&n,arena+at,4);return n;}static uint64_t u64(size_t at){uint64_t n;memcpy(&n,arena+at,8);return n;}static void w32(size_t at,uint32_t n){memcpy(arena+at,&n,4);}static void w64(size_t at,uint64_t n){memcpy(arena+at,&n,8);}
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[14]={0xff,0x25};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}static uint32_t off(void*p){return p?(uintptr_t)p-(uintptr_t)arena:0xffffffff;}
static void logop(uint32_t op,void*p,uint32_t a,uint32_t b,uint32_t c){if(used+5>2048)exit(12);trace[used++]=op;trace[used++]=off(p);trace[used++]=a;trace[used++]=b;trace[used++]=c;}
static void assertion(char*x,char*f,uint32_t l,uint32_t s,...){(void)x;(void)f;line=l;severity=s;longjmp(escape,1);}
static size_t flock(void){return mode==0?0x82000:0x80070;}
static void free_allocation(void*allocator,void*p){logop(1,allocator,off(p),0,0);uint32_t c=u32(0x1f0100);if(++frees==1&&c==1){w64(flock()+0xa0,(uintptr_t)arena+0x89000);w64(flock()+0x68,(uintptr_t)arena+0x90200);}if(c==11){w32(0x5c,1);w64(0x8c000,0);}}
static void release_allocator(void*p){logop(2,p,0,0,0);if(u32(0x1f0100)==9){w64(0x18,(uintptr_t)arena+0x8a100);w64(0x20,32);}}
static void* create_allocator(void*start,uint64_t size,uint32_t flags){logop(3,start,size,flags,0);if(u32(0x1f0100)==10)w64(0x20,16);return arena+0x8b100;}
static void initialize_allocator(void*p,uint64_t size){logop(4,p,size,0,0);memcpy(p,&size,4);}
static void* generation(void*p){logop(5,p,0,0,0);uint64_t gen;memcpy(&gen,(uint8_t*)p+8,8);uint32_t c=u32(0x1f0100);gets++;if(c==2&&gets==1)w64(flock()+0xa8,(uintptr_t)arena+0x88100);if(c==5&&gets==2)gen+=16;return (void*)gen;}
static uint8_t enabled(void*p){logop(6,p,0,0,0);uint8_t n=((uint8_t*)p)[16];uint32_t c=u32(0x1f0100);if(c==3)w64(flock()+0xa8,0);if(c==4)w64(flock()+0xb0,(uintptr_t)arena+0x8d010);return n;}
static void set_enabled(void*p,uint32_t n){logop(7,p,n,0,0);((uint8_t*)p)[16]=n;}
static void update_flock(void*p,void*game){logop(8,p,off(game),0,0);uint32_t c=u32(0x1f0100);if(c==7)w32(0x80cf0,1);if(c==8)w64(0x80068,(uintptr_t)arena+0x84800);if(c==12){memcpy((uint8_t*)p+0x88,&(void*){arena+0xb0000},8);*(uint32_t*)((uint8_t*)p+0x94)=1;}}
static void zero(void*p,size_t n){memset(p,0,n);}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);
 if(mmap(arena,0x200000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 hook(0x1007e5f70UL,assertion);hook(0x1007e6030UL,assertion);hook(0x1007844b0UL,free_allocation);hook(0x100782e20UL,release_allocator);hook(0x100782930UL,create_allocator);hook(0x1007860d0UL,initialize_allocator);hook(0x100aa24aaUL,zero);hook(0x10019bdc0UL,update_flock);
 hook(0x102220000UL,generation);hook(0x102220020UL,enabled);hook(0x102220040UL,set_enabled);
 uint32_t count;rd(&count,4);wr(&count,4);while(count--){rd(&mode,4);rd(arena,0x200000);line=severity=used=frees=gets=0;memset(trace,0,sizeof trace);*(void**)0x100c0d8d8UL=arena+0x1f0000;
  if(!setjmp(escape)){
   if(mode==0)((void(*)(void*))0x10019bd00UL)(arena+0x82000);
   else if(mode==1)((void(*)(void*))0x10019b680UL)(arena);
   else if(mode==2)((void(*)(void*,void*))0x10019b6f0UL)(arena,arena);
   else if(mode==3)((void(*)(void*,void*))0x100795a70UL)(arena+0x10,u64(0x82088)?arena+0x90100:0);
   else if(mode==4)((void(*)(void*))0x100795650UL)(arena+0x10);
   else if(mode==5)((void(*)(void*,uint32_t))0x100473d40UL)(arena+0x84000,u32(0x1f0108));
   else return 7;
  }
  wr(&line,4);wr(&severity,4);wr(&used,4);wr(trace,sizeof trace);wr(arena,0x200000);
 }return 0;
}
