#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t *arena=(void*)0x440000000UL;static jmp_buf escape;static uint32_t line,severity;
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static void assertion(char*x,char*f,uint32_t l,uint32_t s,...){(void)x;(void)f;line=l;severity=s;longjmp(escape,1);}
static void zero(void*p,size_t n){memset(p,0,n);}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);
 if(mmap(arena,0x90000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;hook(0x1007e5f70UL,assertion);hook(0x100aa24aaUL,zero);
 uint32_t count;rd(&count,4);wr(&count,4);while(count--){uint32_t mode,repeat;rd(&mode,4);rd(&repeat,4);rd(arena,0x90000);line=severity=0;volatile uint64_t result=0;
  if(!setjmp(escape)){
   uintptr_t pools[]={0x10019bb70UL,0x10026c330UL,0x10026c370UL,0x10026c3c0UL},enabled[]={0x10019feb0UL,0x10019fec0UL,0x10019b500UL,0x10019b510UL,0x100258270UL,0x100258280UL},resets[]={0x10019ff10UL,0x10025ed50UL,0x10025ed70UL,0x10026c310UL};
   if(mode<4)for(uint32_t i=0;i<repeat;i++)result=(uintptr_t)((void*(*)(void*,void*))pools[mode])(arena,0);
   else if(mode<10){if(mode%2==0){uint32_t value;memcpy(&value,arena+0x8ffe0,4);((void(*)(void*,uint32_t))enabled[mode-4])(arena+0x1000,value);}else result=((uint8_t(*)(void*))enabled[mode-4])(arena+0x1000);}
   else if(mode<14)((void(*)(void*))resets[mode-10])(arena);else if(mode==14){uint32_t value;memcpy(&value,arena+0x8ffe0,4);((void(*)(void*,uint32_t))0x10033ac40UL)(arena+0x1000,value);}else if(mode==15)result=((uint8_t(*)(void*))0x100340c10UL)(arena+0x1000);else return 7;
  }wr(&line,4);wr(&severity,4);uint64_t r=result;wr(&r,8);wr(arena,0x90000);
 }return 0;
}
