/* Original ResourceManager::Observe-name range, lookup and ID getter are
 * untouched; metadata asClass/void/fallback and libc are boundary services. */
#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t *memory=(void *)0x2c0000000UL;static uint32_t h[7],query_index,mutated,line,severity,logs[65536][2],log_count;static jmp_buf escape;
static void rd(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void *p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}static void ptr(void *p,uintptr_t n){memcpy(p,&n,8);}static uint32_t code(void *p){return p?(uint32_t)((uint8_t *)p-memory):0xffffffff;}
static void log_call(uint32_t op,uint32_t id){if(log_count==65536)exit(12);logs[log_count][0]=op;logs[log_count++][1]=id;}
static void *as_class(uint8_t *type){uint32_t id=(type-memory-0x4000)/128;log_call(1,id);if(!mutated&&h[3]==query_index&&h[4]==id){mutated=1;ptr(memory+h[5]+40,(uintptr_t)(memory+h[6]));}return h[2]&(1<<id)?NULL:type;}
static void *void_type(void){log_call(2,0);return memory+0x4000;}static void *fallback_class(void){log_call(3,4);return memory+0x4200;}
static void assertion(char *expr,char *file,uint32_t n,uint32_t s,...){(void)expr;(void)file;line=n;severity=s;longjmp(escape,1);}
static void hook(uintptr_t at,void *fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void *)at,b,14);}static void bind(uintptr_t stub,void *fn){int32_t rel;memcpy(&rel,(void *)(stub+2),4);memcpy((void *)(stub+6+rel),&fn,8);}static void map(void *p,size_t n){if(mmap(p,n,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)exit(5);}
struct range {void *first,*last;};
int main(int argc,char **argv){if(argc!=2)return 2;FILE *f=fopen(argv[1],"rb");if(!f)return 3;map((void *)0x100000000UL,0x2400000);if(fread((void *)0x100000000UL,1,0xd22000,f)!=0xd22000)return 4;fclose(f);map(memory,0x100000);map(memory+0x100000,4096);ptr((void *)0x102047c70UL,(uintptr_t)(memory+0x1000));hook((uintptr_t)(memory+0x100000),as_class);hook(0x1007abbf0UL,void_type);hook(0x1007abc60UL,fallback_class);hook(0x1007e6030UL,assertion);bind(0x100aa2c4eUL,strcmp);if(mprotect((void *)0x100000000UL,0xc05000,5)||mprotect(memory+0x100000,4096,5))return 6;
 uint32_t count;rd(&count,4);wr(&count,4);while(count--){rd(h,28);if(h[0]>0x100000||h[1]>16384)return 7;rd(memory,h[0]);uint32_t queries[16384][2],results[16384][5];rd(queries,h[1]*8);mutated=log_count=0;
  for(query_index=0;query_index<h[1];query_index++){void *name=memory+queries[query_index][0];struct range r=((struct range (*)(void *,void *))0x1007c5970UL)(memory+0x528,&name);line=severity=0;void *found=NULL;if(!setjmp(escape))found=((void *(*)(void *,void *,void *))0x1007c4360UL)(memory+0x100,memory+0x4000+(uint64_t)queries[query_index][1]*128,name);uint32_t row[]={code(r.first),code(r.last),code(found),line,severity};memcpy(results[query_index],row,20);}
  wr(&h[1],4);wr(results,h[1]*20);wr(&log_count,4);wr(logs,log_count*8);wr(memory,h[0]);
 }return 0;}
