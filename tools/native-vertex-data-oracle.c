/* Original normal Vertex.cpp data constructors and AutoLister constructor.
 * Lock internals and supplied global vars/default matrix are services. */
#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t *memory=(void*)0x2e0000000UL;static uint32_t mutation,mutated,line,severity,logs[64][2],log_count;static jmp_buf escape;
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}static void ptr(void*p,uintptr_t n){memcpy(p,&n,8);}static uint32_t code(void*p){return p?(uint32_t)((uint8_t*)p-memory):0xffffffff;}
static void log_call(uint32_t op,uint32_t id){if(log_count==64)exit(12);logs[log_count][0]=op;logs[log_count++][1]=id;}
static void lock(void*token,void*vars){(void)token;log_call(1,code(vars));if(!mutated&&mutation){mutated=1;ptr((void*)0x102049a48UL,mutation==1?0:(uintptr_t)(memory+0x1500));}}
static void unlock(void*token){(void)token;log_call(2,0);}
static void assertion(char*expr,char*file,uint32_t n,uint32_t s){(void)expr;(void)file;line=n;severity=s;longjmp(escape,1);}
static void hook(uintptr_t at,void*fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}static void bind(uintptr_t stub,void*fn){int32_t rel;memcpy(&rel,(void*)(stub+2),4);memcpy((void*)(stub+6+rel),&fn,8);}static void map(void*p,size_t n){if(mmap(p,n,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)exit(5);}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;map((void*)0x100000000UL,0x2400000);if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 4;fclose(f);map(memory,8192);hook(0x1007e9360UL,lock);hook(0x1007e9480UL,unlock);hook(0x1007e5f70UL,assertion);bind(0x100aa24aaUL,bzero);bind(0x100aa2c90UL,strncpy);if(mprotect((void*)0x100000000UL,0xc05000,5))return 6;
 uint32_t count;rd(&count,4);wr(&count,4);while(count--){uint32_t h[2],actions[32][2];rd(h,8);if(h[0]>32)return 7;mutation=h[1];mutated=0;rd(memory,8192);rd(actions,h[0]*8);uintptr_t p;memcpy(&p,memory+0x1700,8);ptr((void*)0x102049a48UL,p);memcpy(&p,memory+0x1710,8);ptr((void*)0x100c0db08UL,p);
  for(uint32_t i=0;i<h[0];i++){uint32_t op=actions[i][0];line=severity=log_count=0;if(!setjmp(escape)){void*out=memory+actions[i][1];if(op==0)((void(*)(void*))0x1007f5010UL)(out);else if(op==1)((void(*)(void*))0x1007f5b20UL)(out);else if(op==2)((void(*)(void*))0x1007f5d80UL)(out);else if(op==3)((void(*)(void*))0x1007f6ca0UL)(out);else return 8;}
   memcpy(memory+0x1700,(void*)0x102049a48UL,8);uint32_t out[]={line,severity,log_count};wr(out,12);wr(logs,log_count*8);wr(memory,8192);if(line)break;
  }
 }return 0;}
