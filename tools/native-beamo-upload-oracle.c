#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <setjmp.h>
#include <immintrin.h>
#include <sys/mman.h>
static uint8_t *memory=(void *)0x330000000UL;
static uint64_t allocs[16][4],frees[16];static uint32_t allocated,released,line,severity,rsqrt_count;static uint32_t *rsqrt_trace;static size_t cursor;
static jmp_buf escape;
static void rd(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void *p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void p64(size_t at,uintptr_t v){memcpy(memory+at,&v,8);}static void p32(size_t at,uint32_t v){memcpy(memory+at,&v,4);}
static uint32_t u32(size_t at){uint32_t v;memcpy(&v,memory+at,4);return v;}
static void *allocator(void){return (void *)0x340000000UL;}
static void *allocate(void *a,size_t bytes,void *tag,uint32_t align){if(allocated>=16)exit(12);cursor=(cursor+align-1)&~(size_t)(align-1);void *out=memory+cursor;allocs[allocated][0]=(uintptr_t)out;allocs[allocated][1]=bytes;allocs[allocated][2]=(uintptr_t)tag;allocs[allocated++][3]=align;memset(out,0xa5,bytes+16);cursor+=bytes+16;if(cursor>=0x2000000)exit(13);(void)a;return out;}
static void release(void *a,void *p){(void)a;if(released>=16)exit(14);frees[released++]=(uintptr_t)p;
 if(allocated>=7&&(uintptr_t)p==allocs[5][0]){uint32_t groups=(uint32_t)(allocs[5][1]/16);for(uint32_t i=0;i<groups;i++){__m128 n=_mm_load_ps((float *)p+i*4),s=_mm_mul_ps(n,n),v=_mm_add_ss(s,_mm_shuffle_ps(s,s,0x55));v=_mm_add_ss(_mm_shuffle_ps(s,s,0xaa),v);uint32_t input=(uint32_t)_mm_cvtsi128_si32(_mm_castps_si128(v));__m128 r=_mm_rsqrt_ss(v);rsqrt_trace[rsqrt_count*2]=input;rsqrt_trace[rsqrt_count++*2+1]=(uint32_t)_mm_cvtsi128_si32(_mm_castps_si128(r));}}
}
static void *transform(void *out,void *object){memcpy(out,(uint8_t *)object+0x110,64);return out;}
static void *obb(void *out,void *object){memcpy(out,(uint8_t *)object+0x150,64);return out;}
static const char *name(void *object){return *((uint8_t *)object+0x100)?"UnitCube":"other";}
static void assertion(void *expr,void *file,uint32_t l,uint32_t s,...){(void)expr;(void)file;line=l;severity=s;longjmp(escape,1);}
static void hook(uintptr_t p,void *fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void *)p,b,14);}
static void map(void *p,size_t n){if(mmap(p,n,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)exit(5);}
typedef struct {uint32_t vertices,primary,secondary,alpha;} Counts;
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *f=fopen(argv[1],"rb");if(!f)return 3;map((void *)0x100000000UL,0x2400000);if(fread((void *)0x100000000UL,1,0xd22000,f)!=0xd22000)return 4;fclose(f);map(memory,0x2000000);
 hook(0x1007c6c20UL,allocator);hook(0x100795530UL,allocate);hook(0x100795a70UL,release);hook(0x1007e5f70UL,assertion);
 hook(0x100aa24aaUL,bzero);hook(0x100aa2900UL,memset);hook(0x100aa2a2cUL,powf);hook(0x100aa2786UL,frexpf);hook(0x100aa2c4eUL,strcmp);
 void *tag=(void *)0x340000100UL;memcpy((void *)0x102048b50UL,&tag,8);
 if(mprotect((void *)0x100000000UL,0xc05000,5))return 6;
 /* Default-light constructor/encoder execute their original bytes too. */
 float c[4] __attribute__((aligned(16)));float light[12] __attribute__((aligned(16)))={0};uint8_t fallback[16] __attribute__((aligned(16)))={0};
 ((void *(*)(void *,void *,float))0x10077d310UL)(c,(void *)0x100aad5c0UL,2.2f);memcpy(light,c,16);light[5]=1;light[8]=1;((void (*)(void *,void *))0x100414530UL)(light,fallback);
 uint32_t cases;rd(&cases,4);wr(&cases,4);wr(fallback,12);
 uint32_t case_index=0;while(cases--){
  if(getenv("SKY_BEAMO_GEOMETRY_TRACE_CASES"))fprintf(stderr,"case %u\n",case_index);case_index++;
  uint32_t h[7];rd(h,28);uint32_t bytes=h[0],vertex_bytes=h[1],index_bytes=h[2],groups=h[3],bake=h[4],lod=h[5],volumes=h[6];if(bytes>0x790000||vertex_bytes+16>0x400000||index_bytes+16>0x200000||volumes>32)return 7;
  rd(memory,bytes);memset(memory+0x800000,0xa5,0x20000);p32(0x985110,volumes);p64(0x7b0018,(uintptr_t)transform);p64(0x7b0020,(uintptr_t)obb);p64(0x7b0038,(uintptr_t)name);
  for(uint32_t i=0;i<volumes;i++){size_t at=0x800010+i*0xa60;uint32_t match;rd(&match,4);memory[at+0x100]=(uint8_t)match;p64(at,(uintptr_t)memory+0x7b0000);rd(memory+at+0x110,64);rd(memory+at+0x150,64);}
  memset(memory+0xa00000,0xa5,vertex_bytes+16);memset(memory+0xe00000,0xa5,index_bytes+16);cursor=0x1000000;allocated=released=line=severity=rsqrt_count=0;memset(allocs,0,sizeof allocs);memset(frees,0,sizeof frees);rsqrt_trace=calloc(groups*2+2,4);if(!rsqrt_trace)return 8;
  Counts counts={0};if(!setjmp(escape))counts=((Counts (*)(void *,void *,void *,uint32_t,void *,void *,void *))0x100197ab0UL)(memory+0x100,bake?memory+0x800:NULL,memory+0x800000,lod,memory+0xa00,memory+0xa00000,memory+0xe00000);
  uint32_t result[]={line,severity,allocated,released,counts.vertices,counts.primary,counts.secondary,counts.alpha,rsqrt_count};wr(result,36);wr(allocs,sizeof allocs);wr(frees,sizeof frees);wr(rsqrt_trace,rsqrt_count*8);wr(memory+0xa00000,vertex_bytes+16);wr(memory+0xe00000,index_bytes+16);wr(memory+0xa00,16);
  for(uint32_t i=0;i<allocated;i++)wr((void *)(uintptr_t)allocs[i][0],allocs[i][1]+16);free(rsqrt_trace);
 }
 return 0;
}
