#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>
static uint8_t *arena;static uint32_t seed;
static void rd(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[14]={0xff,0x25};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static void jump(uintptr_t from,uintptr_t to){*(uint8_t*)from=0xe9;int32_t d=to-from-5;memcpy((void*)(from+1),&d,4);}
static void ptr(size_t at,void*p){memcpy(arena+at,&p,8);}static void u32(size_t at,uint32_t n){memcpy(arena+at,&n,4);}static void scalar(size_t at,float n){memcpy(arena+at,&n,4);}
typedef struct{float sin,cos;} Pair;
static Pair sincos_native(float a){return (Pair){sinf(a),cosf(a)};}
static uint32_t random_native(void){seed=seed*1103515245+12345;return seed>>1;}
static void* avatar(void*p){(void)p;return arena+0x1800;}
static uint32_t section_count;
static void* allocate(void*h,size_t size,void*t,uint32_t align){(void)h;(void)size;(void)t;(void)align;return arena+0x4000;}
static void release(void*h,void*p){(void)h;(void)p;}
static void rail_transform(void*out,void*rail,float t){(void)rail;uint32_t i=lroundf(t*section_count);uint8_t*source=arena+0x6000+i*64;memcpy(out,source+16,16);memcpy((uint8_t*)out+16,source+32,16);memset((uint8_t*)out+32,0,16);memcpy((uint8_t*)out+48,source,16);}
int main(int argc,char**argv){if(argc<2||argc>3)return 2;int build_sections=argc==3&&!strcmp(argv[2],"--sections");FILE*f=fopen(argv[1],"rb");if(!f)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);
 arena=mmap((void*)0x440000000UL,0x20000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);if(arena==MAP_FAILED)return 6;
 // Keep the original cached rail movement/spawning instructions. Explicitly
 // exclude avatar impulse/collection and final audio/events from this oracle.
 jump(0x10019c5d0UL,0x10019ca76UL);jump(0x10019cf3aUL,0x10019d5fbUL);
 // Skip only ostream warning construction; retain native capacity clamp
 // and every instruction in the prepopulation body.
 jump(0x10019cdfaUL,0x10019cf13UL);jump(0x10019d631UL,0x10019d74aUL);
 hook(0x100aa250aUL,sincos_native);hook(0x100aa2b22UL,random_native);hook(0x1000fc260UL,avatar);
 hook(0x100795530UL,allocate);hook(0x100795a70UL,release);hook(0x100560b40UL,rail_transform);
 *(void**)0x100c0d8a8UL=(void*)0x100ab1ec0UL;*(void**)0x100c0d8b0UL=(void*)0x100ab22c0UL;
 uint64_t guard=42;*(void**)0x100c0d8d8UL=&guard;
 uint32_t cases;rd(&cases,4);wr(&cases,4);
 while(cases--){uint32_t header[13];rd(header,sizeof header);uint32_t cap=header[0],sections=header[10];if(cap>128||sections<2||sections>128)return 7;
  memset(arena,0,0x20000);ptr(0x10,arena+0x1000);ptr(0x78,arena+0x1000);ptr(0x68,arena+0x4000);ptr(0x88,arena+0x8000);
  u32(0x18,cap);u32(0x90,cap);u32(0x70,sections);u32(0x1c,header[1]);u32(0x20,header[2]);u32(0x24,header[3]);arena[0xc]=header[4];arena[0x102c]=header[5];
  arena[0xd]=header[11];u32(0x80,header[12]);
  ptr(0x1160,arena+0x2000);scalar(0x2020,1);u32(0x2014,header[6]);u32(0x94,header[7]);u32(0x98,header[8]);seed=header[9];ptr(0x1818,arena+0x2200);scalar(0x2d48,0);
  rd(arena+0x4000,sections*64);rd(arena+0x8000,cap*48);
  if(build_sections){if(sections%5)return 8;section_count=sections;memcpy(arena+0x6000,arena+0x4000,sections*64);memset(arena+0x4000,0,sections*64);ptr(0x68,0);ptr(0x78,0);u32(0x1028,sections/5);scalar(0x1018,0);}
  ((void(*)(void*,void*))0x10019bdc0UL)(arena,arena+0x1000);
  wr(arena+0x94,8);wr(&seed,4);wr(arena+0x8000,cap*48);
  if(build_sections)wr(arena+0x4000,sections*64);
 }
 return 0;
}
