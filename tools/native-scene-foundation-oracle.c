#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
static uint8_t *storage=(void *)0x360000000UL;static uint32_t allocations,ensures,steps,after;static uint64_t allocation_size,order;
static void rd(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void *p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void *allocate(size_t size){allocations++;allocation_size=size;order|=1UL<<(steps++*8);return storage+0x100;}
static void *ensure(void){ensures++;order|=2UL<<(steps++*8);if(after!=0xffffffff)memcpy(storage+0xe38,&after,4);return storage+0xe00;}
static void map(void *p,size_t n){if(mmap(p,n,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)exit(5);}
static void hook(uintptr_t p,void *fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void *)p,b,14);}
int main(int argc,char **argv){if(argc!=2)return 2;FILE *f=fopen(argv[1],"rb");if(!f)return 3;map((void *)0x100000000UL,0x2400000);if(fread((void *)0x100000000UL,1,0xd22000,f)!=0xd22000)return 4;fclose(f);map(storage,4096);hook(0x100aa2498UL,allocate);hook(0x1007abc10UL,ensure);
 void *meta=storage+0xe00;memcpy((void *)0x102017cb8UL,&meta,8);memcpy((void *)0x101dddb58UL,&meta,8);memcpy((void *)0x102034160UL,&meta,8);
 if(mprotect((void *)0x100000000UL,0xc05000,5))return 6;
 uintptr_t placements[]={0x100523e80UL,0x1001e2eb0UL,0x1006b0f30UL},constructors[]={0x100523dc0UL,0x1001e2de0UL,0x1006b0ea0UL};uint32_t cases;rd(&cases,4);wr(&cases,4);while(cases--){uint32_t h[6];rd(h,24);rd(storage,4096);uint32_t kind=h[0],operation=h[1],source=h[2],output=h[3],enabled=h[5];after=h[4];allocations=ensures=steps=0;allocation_size=order=0;uint64_t result=0;void *object=storage+0x100;
  switch(operation){
   case 0:result=(uintptr_t)((void *(*)(void *,void *))placements[kind])(NULL,object);break;
   case 1:result=(uintptr_t)((void *(*)(void *))constructors[kind])(NULL);break;
   case 2:result=(uintptr_t)((void *(*)(void *,void *))(kind==1?0x1001ddf90UL:0x1006ae9d0UL))(storage+output,object);break;
   case 3:((void (*)(void *,void *))(kind==1?0x1001ddf60UL:0x1006ae960UL))(object,storage+source);break;
   case 4:((void (*)(void *))0x1001ddf50UL)(object);break;
   case 5:result=(uintptr_t)((void *(*)(void *,void *))0x1006aea00UL)(storage+output,object);break;
   case 6:result=((uint8_t (*)(void *))0x100522260UL)(object);break;
   case 7:((void (*)(void *,uint8_t))0x100522250UL)(object,enabled);break;
   case 8:((void (*)(void *,void *,void *))0x10078c720UL)(storage+source,storage+output,storage+output+16);break;
   default:return 7;
  }
  wr(&result,8);wr(&allocations,4);wr(&ensures,4);wr(&allocation_size,8);wr(&order,8);wr(storage,4096);
 }return 0;
}
