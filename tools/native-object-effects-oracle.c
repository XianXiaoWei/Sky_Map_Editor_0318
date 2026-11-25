#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t *arena=(void*)0x440000000UL;
static jmp_buf escape;
static uint32_t line,severity,calls;
static uint64_t trace[3][2];
static uint32_t u(void*p){uint32_t n;memcpy(&n,p,4);return n;}
static uint64_t q(void*p){uint64_t n;memcpy(&n,p,8);return n;}
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static void assertion(char*x,char*f,uint32_t l,uint32_t s,...){(void)x;(void)f;line=l;severity=s;longjmp(escape,1);}
static void vertex_release(void*p){trace[calls][0]=1;trace[calls++][1]=(uintptr_t)p;}
static void render_release(void*p){trace[calls][0]=2;trace[calls++][1]=(uintptr_t)p;}
int main(int argc,char**argv){
 if(argc!=2)return 2;
 FILE*f=fopen(argv[1],"rb");if(!f)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);
 if(mmap(arena,0x20000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 hook(0x1007e5f70UL,assertion);hook(0x1007f5250UL,vertex_release);hook(0x1007f6150UL,render_release);
 uint32_t count;rd(&count,4);wr(&count,4);
 while(count--){
  uint32_t mode,repeat;rd(&mode,4);rd(&repeat,4);rd(arena,0x20000);calls=line=severity=0;volatile uint64_t result=0;
  if(!setjmp(escape))switch(mode){
   case 0:for(uint32_t i=0;i<repeat;i++)result=(uintptr_t)((void*(*)(void*,void*))0x10034f110UL)(arena,0);break;
   case 1:for(uint32_t i=0;i<repeat;i++)result=(uintptr_t)((void*(*)(void*,void*))0x1001ea9e0UL)(arena,0);break;
   case 2:for(uint32_t i=0;i<repeat;i++)result=(uintptr_t)((void*(*)(void*,void*))0x1004d5eb0UL)(arena,0);break;
   case 3:((void(*)(void*,void*))0x1001e8c10UL)(arena+0x1000,arena+u(arena+0x1ffe0));break;
   case 4:result=(uintptr_t)((void*(*)(void*,void*))0x1001e8c40UL)(arena+u(arena+0x1ffe0),arena+0x1000);break;
   case 5:((void(*)(void*,uint32_t))0x1001e8cb0UL)(arena+0x1000,u(arena+0x1ffe4));break;
   case 6:result=((uint8_t(*)(void*))0x1001e8cd0UL)(arena+0x1000);break;
   case 7:((void(*)(void*))0x10034f050UL)(arena);break;
   default:return 7;
  }
  uint32_t header[]={line,severity,calls};uint64_t returned=result;wr(header,12);wr(&returned,8);wr(trace,calls*16);wr(arena,0x20000);
 }
 return 0;
}
