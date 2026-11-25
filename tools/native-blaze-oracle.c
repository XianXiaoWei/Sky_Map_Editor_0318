#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t *a=(void*)0x440000000UL;static jmp_buf escape;static uint32_t line,severity,calls,alloc_at;static uint8_t trace[1024][160];
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static uint32_t get32(uint32_t at){uint32_t n;memcpy(&n,a+at,4);return n;}static uint64_t get64(uint32_t at){uint64_t n;memcpy(&n,a+at,8);return n;}
static uint8_t* call(uint32_t kind,uint64_t x,uint64_t y,uint64_t z){if(calls>=1024)exit(12);uint8_t*p=trace[calls++];memset(p,0,160);memcpy(p,&kind,4);memcpy(p+8,&x,8);memcpy(p+16,&y,8);memcpy(p+24,&z,8);return p;}
static void assertion(char*x,char*f,uint32_t l,uint32_t s,...){(void)x;(void)f;line=l;severity=s;longjmp(escape,1);}
static void* metadata(void){return a+0x18000;}
static void thread(void){call(1,0,0,0);}
static uint64_t identity(void*p){call(2,(uintptr_t)p,0,0);return get64(0x17f00);}
static void stop(void*p,uint32_t fade){call(3,(uintptr_t)p,fade,0);}
static void enable(void*p,uint32_t value){call(4,(uintptr_t)p,value,0);}
static void start(void*p){call(5,(uintptr_t)p,0,0);}
static void load(void*p,void*g){call(6,(uintptr_t)p,(uintptr_t)g,0);}
static void sound(void*owner,char*name,void*params,void*out){(void)out;uint32_t kind=!strcmp(name,"blazearrive")?7:8;memcpy(call(kind,(uintptr_t)owner,0,0)+32,params,128);}
static uint32_t ticks(void){call(9,0,0,0);return get32(0x17f08);}
static void* heap(void){return a+0x18100;}
static void* allocate(void*h,size_t size,void*t,uint32_t align){(void)h;(void)t;(void)align;void*out=a+alloc_at;alloc_at+=(size+15)&~15;call(10,size,(uintptr_t)out,0);return out;}
static void release(void*h,void*p){(void)h;call(11,(uintptr_t)p,0,0);}
static void cast(void*meta,void*out,void*input,void*type){(void)meta;(void)type;void*p;memcpy(&p,input,8);call(12,(uintptr_t)p,0,0);if((uintptr_t)p==get64(0x17f10))p=0;memcpy(out,&p,8);}
static void rpc_ctor(void*p){(void)p;}
static void send(void*owner,void*p){uint8_t*out=call(13,(uintptr_t)owner,0,0)+32;memcpy(out,p,12);memcpy(out+20,(uint8_t*)p+20,12);out[25]=out[26]=out[27]=0;}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);if(mmap(a,0x30000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 hook(0x1007e5f70UL,assertion);hook(0x1007abc10UL,metadata);hook(0x100011c10UL,thread);hook(0x1001ae8e0UL,load);hook(0x1004d1f60UL,enable);hook(0x10032ef60UL,start);hook(0x1006018a0UL,sound);hook(0x1007e8470UL,ticks);hook(0x1007c6c20UL,heap);hook(0x100795530UL,allocate);hook(0x100795a70UL,release);hook(0x1004b1530UL,rpc_ctor);hook(0x1004b1f90UL,send);
 uint64_t meta=(uintptr_t)(a+0x18000),vptr=(uintptr_t)(a+0x18180),sound_vptr=(uintptr_t)(a+0x18200),stack=(uintptr_t)(a+0x17ff0);
 memcpy((void*)0x101ddae00UL,&meta,8);memcpy((void*)0x101ddb5a0UL,&meta,8);memcpy((void*)0x100c0d8d8UL,&stack,8);
 uint32_t count;rd(&count,4);wr(&count,4);while(count--){uint32_t mode,repeat;rd(&mode,4);rd(&repeat,4);rd(a,0x30000);line=severity=calls=0;alloc_at=0x20000;uint64_t result=0;memcpy((void*)0x100d23f9cUL,a+0x17f04,4);
 memcpy(a+0x18000,&vptr,8);void*fn=cast;memcpy(a+0x181c0,&fn,8);fn=identity;memcpy(a+0x18200,&fn,8);fn=stop;memcpy(a+0x18230,&fn,8);memcpy(a+0x18300,&sound_vptr,8);
 if(!setjmp(escape))switch(mode){
 case 0:((void(*)(void*))0x1001ad5a0UL)(a);break;
 case 1:for(uint32_t i=0;i<repeat;i++)result=(uintptr_t)((void*(*)(void*,void*))0x1001add30UL)(a,0);break;
 case 2:((void(*)(void*))0x1001af340UL)(a+0x14000);break;
 case 3:((void(*)(void*,uint32_t))0x1001ad560UL)(a+0x14000,get32(0x17f18));break;
 case 4:result=((uint8_t(*)(void*))0x1001ad570UL)(a+0x14000);break;
 case 5:result=(uintptr_t)((void*(*)(void*,uint32_t))0x1001ae000UL)(a,get32(0x17f18));break;
 case 6:result=((uint32_t(*)(void*))0x1001b1a50UL)(a);break;
 case 7:((void(*)(void*,void*))0x1001adeb0UL)(a,(void*)(uintptr_t)get64(0x17f20));break;
 case 8:((void(*)(void*))0x1001ad6d0UL)(a);break;
 case 9:((void(*)(void*,void*))0x1001ad680UL)(a,a+0x19000);break;
 case 10:((void(*)(void*))0x1001b1af0UL)(a+0x15000);break;
 case 11:for(uint32_t i=0;i<repeat;i++)((void(*)(void*))0x1001b1b00UL)(a+0x15000);break;
 case 12:((void(*)(void*,void*,void*,void*,uint32_t,uint32_t))0x1001ae070UL)(a+0x14000,a+0x17f04,a+0x19000,a+0x19500,get32(0x17f28),get32(0x17f18));break;
 case 13:((void(*)(void*,void*))0x1001ad500UL)(a+0x14000,a+get32(0x17f18));break;
 case 14:((void*(*)(void*,void*))0x1001ad530UL)(a+get32(0x17f18),a+0x14000);break;
 default:return 7;
 }
 // Prepared vtables contain host hook addresses: exclude only their input service region.
 memset(a+0x18000,0,0x400);wr(&line,4);wr(&severity,4);wr(&result,8);wr(a,0x30000);wr(&calls,4);wr(trace,calls*160);
 }return 0;}
