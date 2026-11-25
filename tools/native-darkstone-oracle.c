#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t*a=(void*)0x440000000UL;static uint32_t calls,line,severity,initialized;static uint8_t trace[1024][64];static jmp_buf escape;
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static void record(uint64_t kind,uint64_t x,uint64_t y,uint64_t z,uint64_t u,uint64_t v,uint64_t w){if(calls>=1024)exit(12);uint64_t row[8]={kind,x,y,z,u,v,w,0};memcpy(trace[calls++],row,64);}
static void assertion(char*text,char*file,uint32_t l,uint32_t s,...){(void)text;(void)file;line=l;severity=s;longjmp(escape,1);}
static void*metadata(void){return a+0x5e000;}
static void*mesh_type(void){return a+0x5e040;}
static void cast(void*meta,void*out,void*input,void*type){(void)meta;(void)type;uintptr_t p;memcpy(&p,input,8);record(1,p,0,0,0,0,0);p=a[0x5f000]?0:p-8;memcpy(out,&p,8);}
static void initialize(void*p,void*barn,void*unused,void*trap,void*mesh,uint32_t level,uint32_t index){(void)unused;record(2,(uintptr_t)p,(uintptr_t)barn,(uintptr_t)trap,(uintptr_t)mesh,level,index);memcpy((uint8_t*)p+32,&index,4);memcpy((uint8_t*)p+40,&mesh,8);uint32_t parent=0xffffffff,count=0;memcpy((uint8_t*)p+0xe0,&parent,4);memcpy((uint8_t*)p+0x104,&count,4);if(initialized++==0){if(a[0x5f001]){memcpy(&count,(uint8_t*)barn+0x1b220,4);count++;memcpy((uint8_t*)barn+0x1b220,&count,4);}if(a[0x5f002]){count=0;memcpy(a+0x50010,&count,4);}}}
static void hierarchy(void*parent,void*first,void**stones,uint32_t*cursor,uint32_t count,void*barn){if(parent||*cursor!=1)exit(13);record(3,(uintptr_t)first,count,(uintptr_t)barn,0,0,0);for(uint32_t i=1;i<count;i++){uint32_t index;memcpy(&index,(uint8_t*)stones[i-1]+32,4);memcpy((uint8_t*)stones[i]+0xe0,&index,4);}}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);if(mmap(a,0x60000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;hook(0x1007e5f70UL,assertion);hook(0x1007e6030UL,assertion);hook(0x1007abc10UL,metadata);hook(0x1003ffcf0UL,mesh_type);hook(0x10027a7c0UL,initialize);hook(0x10027ae30UL,hierarchy);uint64_t guard=0;void*gp=&guard;memcpy((void*)0x100c0d8d8UL,&gp,8);uint32_t count;rd(&count,4);wr(&count,4);while(count--){uint32_t mode;rd(&mode,4);rd(a,0x60000);calls=line=severity=initialized=0;uint64_t result=0;uintptr_t vptr=(uintptr_t)(a+0x5e100);memcpy(a+0x5e040,&vptr,8);void*fn=cast;memcpy(a+0x5e140,&fn,8);
 if(!setjmp(escape)){if(mode==0)result=(uintptr_t)((void*(*)(void*))0x10027f6a0UL)(a+0x2000);else if(mode==1)result=(uintptr_t)((void*(*)(void*,void*))0x10027a760UL)(a+0x2000,a+0x7000);else if(mode==2)((void(*)(void*,void*))0x10027ecb0UL)(a+0x4000,a[0x5f003]?a+0x6000:0);else if(mode==3)((void(*)(void*,void*))0x10027a370UL)(a+0x1000,a+0x2000);else exit(14);}
 memset(a+0x5e000,0,0x200);wr(&line,4);wr(&severity,4);wr(&result,8);wr(a,0x60000);wr(&calls,4);wr(trace,calls*64);
 }return 0;}
