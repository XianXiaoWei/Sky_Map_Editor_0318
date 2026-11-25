#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t *barn=(void *)0x2c0000000UL;static uint8_t meta[5][64];static uint32_t calls[8],call_count,line,severity;static jmp_buf escape;
static void *base_type(void){calls[call_count++]=1;return meta[0];}
static void *world_type(void){calls[call_count++]=2;return meta[1];}
static void *level_type(void){calls[call_count++]=3;return meta[2];}
static void assertion(void *expr,void *file,uint32_t l,uint32_t s,...){(void)expr;(void)file;line=l;severity=s;longjmp(escape,1);}
static void rd(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void *p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void ptr(void *p,void *v){memcpy(p,&v,8);}
static void hook(uintptr_t p,void *fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void *)p,b,14);}
static void map(void *p,size_t n){if(mmap(p,n,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)exit(5);}
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *f=fopen(argv[1],"rb");if(!f)return 3;map((void *)0x100000000UL,0x2400000);if(fread((void *)0x100000000UL,1,0xd22000,f)!=0xd22000)return 4;fclose(f);map(barn,0x23000);
 for(uint32_t i=0;i<5;i++){uint32_t id=16+i;memcpy(meta[i]+56,&id,4);}
 ptr((void *)0x101dd8ca0UL,meta[3]);ptr((void *)0x101dd9000UL,meta[4]);
 hook(0x1007abc10UL,base_type);hook(0x10074a170UL,world_type);hook(0x100407ab0UL,level_type);hook(0x1007e6030UL,assertion);
 if(mprotect((void *)0x100000000UL,0xc05000,5))return 6;
 uint32_t n;rd(&n,4);wr(&n,4);while(n--){
  uint32_t h[4];uint8_t raw[256],out[64];rd(h,16);rd(raw,256);memset(barn,0xa5,0x23000);memset(out,0xa5,64);
  memcpy(barn+0x20010,h+1,8);uint32_t old=0xa5a5a5a5;memcpy(barn+0x20018,&old,4);ptr(barn+0x20020,barn+0x20040);
  uint8_t *object=barn+0x21000;
  if(h[0]==2&&h[1]<512)object=barn+16+h[1]*192;
  if(h[0]==3&&h[2]<256)object=barn+0x18010+h[2]*128;
  memcpy(object,raw,192);memcpy(barn+0x22000,raw+192,64);
  if(h[0]==5)ptr(object+0xb0,barn);if(h[0]==6)ptr(object+0x78,barn);
  void *source=h[3]==0xffffffff?barn+0x22000:object+h[3];uintptr_t result=0;line=severity=call_count=0;
  if(!setjmp(escape))switch(h[0]){
   case 0:result=(uintptr_t)((void *(*)(void *,void *))0x100198cf0UL)(NULL,object);break;
   case 1:result=(uintptr_t)((void *(*)(void *,void *))0x100199280UL)(NULL,object);break;
   case 2:result=(uintptr_t)((void *(*)(void *))0x1001973a0UL)(barn);break;
   case 3:result=(uintptr_t)((void *(*)(void *))0x1001974a0UL)(barn);break;
   case 4:((void (*)(void *))0x100194a10UL)(barn);break;
   case 5:((void (*)(void *))0x100194940UL)(object);break;
   case 6:((void (*)(void *))0x1001949b0UL)(object);break;
   case 7:((void (*)(void *,void *))0x100194960UL)(object,source);break;
   case 8:((void (*)(void *,void *))0x1001949c0UL)(object,source);break;
   case 9:((void *(*)(void *,void *))0x1001985b0UL)(out,object);break;
   case 10:((void *(*)(void *,void *))0x100198730UL)(out,object);break;
   default:return 7;
  }
  uint8_t header[48]={0};memcpy(header,&line,4);memcpy(header+4,&severity,4);memcpy(header+8,&call_count,4);memcpy(header+12,calls,call_count*4);memcpy(header+24,&result,8);header[32]=barn[12];memcpy(header+36,barn+0x20010,12);
  wr(header,48);wr(barn+0x20020,8);wr(object,192);wr(out,64);
 }
 return 0;
}
