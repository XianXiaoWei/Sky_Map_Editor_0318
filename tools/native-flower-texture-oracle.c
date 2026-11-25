#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
static uint8_t *arena=(void*)0x460000000UL,trace[16][64];static uint32_t calls,allocators;
static void put(void*p,uint32_t n){memcpy(p,&n,4);}static void pq(void*p,uint64_t n){memcpy(p,&n,8);}
static uint8_t *record(uint32_t tag){uint8_t*r=trace[calls++];memset(r,0,64);put(r,tag);return r;}
static void hook(uintptr_t at,void*fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static void sampler(void*p,void*desc){uint8_t*r=record(1);pq(r+8,(uintptr_t)p);memcpy(r+16,desc,36);}
static void *allocator(void){uint8_t*r=record(2);void*p=arena+0x510100+(allocators++)*0x100;pq(r+8,(uintptr_t)p);return p;}
static void *allocate(void*owner,uint64_t bytes,void*heap,uint32_t alignment){uint8_t*r=record(3);pq(r+8,(uintptr_t)owner);pq(r+16,bytes);pq(r+24,(uintptr_t)heap);put(r+32,alignment);return arena+0x500000;}
static void image(void*p,char*name,uint32_t kind,uint32_t w,uint32_t h,uint32_t format,uint32_t flags){uint8_t*r=record(4);pq(r+8,(uintptr_t)p);memcpy(r+16,name,strlen(name)+1);put(r+32,kind);put(r+36,w);put(r+40,h);put(r+44,format);put(r+48,flags);}
static void upload(void*p,void*data){uint8_t*r=record(5);pq(r+8,(uintptr_t)p);pq(r+16,(uintptr_t)data);}
static void finalize(void*p){uint8_t*r=record(6);pq(r+8,(uintptr_t)p);}
static void release(void*owner,void*p){uint8_t*r=record(7);pq(r+8,(uintptr_t)owner);pq(r+16,(uintptr_t)p);}
int main(int argc,char**argv){
 if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);
 if(mmap(arena,0x600000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;memset(arena,0xaa,0x600000);
 pq((void*)0x102048b50UL,(uintptr_t)(arena+0x510300));
 hook(0x1007f04d0UL,sampler);hook(0x1007c6c20UL,allocator);hook(0x100795530UL,allocate);hook(0x1007f0850UL,image);hook(0x1007f0e00UL,upload);hook(0x1007f12f0UL,finalize);hook(0x100795a70UL,release);
 ((void(*)(void*,void*))0x10034e2b0UL)(arena,0);
 fwrite(&calls,1,4,stdout);fwrite(trace,64,calls,stdout);fwrite(arena+0x11dc0,1,4,stdout);fwrite(arena+0x455df0,1,8,stdout);fwrite(arena+0x500000,1,0x800,stdout);return 0;
}
