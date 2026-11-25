#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
static uint8_t *memory=(void *)0x270000000UL;
static uint64_t ptr(const void *p){uint64_t v;memcpy(&v,p,8);return v;}
static void rd(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(7);}
static void wr(void *p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(8);}
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *f=fopen(argv[1],"rb");if(!f)return 3;
 void *text=mmap((void *)0x100000000UL,0x2400000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
 if(text==MAP_FAILED||fread(text,1,0xd22000,f)!=0xd22000)return 4;fclose(f);
 if(mmap(memory,0x10000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 5;
 if(mprotect(text,0xc05000,PROT_READ|PROT_EXEC))return 6;
 uint32_t total;rd(&total,4);wr(&total,4);
 while(total--){
  uint32_t n;rd(&n,4);if(n>1000)return 9;rd(memory,0x10000);wr(&n,4);uint32_t cursor=0x2000;
  for(uint32_t i=0;i<n;i++){
   uint32_t h[3];rd(h,12);uint8_t *hint=memory+0x1008;
   if(h[2])for(uint32_t at=0x2000;at<cursor;at+=40){uint32_t key;memcpy(&key,memory+at+28,4);if(key==h[1]){hint=memory+at;break;}}
   memcpy(memory+0x8000,h,4);
   void **link=((void **(*)(void *,void *,void *,void *,void *))0x1003320e0UL)(memory+0x1000,hint,memory+0x8010,memory+0x8018,memory+0x8000);
   uint8_t *parent=(void *)(uintptr_t)ptr(memory+0x8010);uint32_t out[]={(uint8_t *)link-memory,parent-memory};wr(out,8);
   if(*link)continue;
   uint8_t *node=memory+cursor;cursor+=40;if(cursor>0x7000)return 9;
   memcpy(node+28,h,4);node[32]=0;memset(node,0,16);memcpy(node+16,&parent,8);memcpy(link,&node,8);
   void *left=*(void **)(uintptr_t)ptr(memory+0x1000);if(left)memcpy(memory+0x1000,&left,8);
   ((void (*)(void *,void *))0x1001a7bb0UL)((void *)(uintptr_t)ptr(memory+0x1008),node);
   uint64_t count=ptr(memory+0x1010)+1;memcpy(memory+0x1010,&count,8);
  }
  wr(memory,0x10000);
 }
 return 0;
}
