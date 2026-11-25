#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t*a=(void*)0x440000000UL;static jmp_buf escape;static uint32_t line,severity,calls,rng,fx,em,wind;static uint8_t trace[128][160];
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static uint8_t*record(uint64_t k,uint64_t x,uint64_t y,uint64_t z){if(calls>=128)exit(12);uint8_t*out=trace[calls++];memset(out,0,160);memcpy(out,&k,8);memcpy(out+8,&x,8);memcpy(out+16,&y,8);memcpy(out+24,&z,8);return out;}
static void assertion(char*x,char*f,uint32_t l,uint32_t s,...){(void)x;(void)f;line=l;severity=s;longjmp(escape,1);}
static uint32_t random_value(void){rng=rng*1664525+1013904223;uint32_t v=rng>>1;record(3,v,0,0);return v;}
static void*metadata(void){return a+0x7000;}
static void cast(void*meta,void*out,void*input,void*type){(void)meta;(void)type;uintptr_t p;memcpy(&p,input,8);record(4,p,0,0);p=a[0x7f04]?0:p-8;memcpy(out,&p,8);}
static void motion(void*p,void*x,void*y,void*z){record(1,(uintptr_t)p,(uintptr_t)x,(uintptr_t)y);record(2,(uintptr_t)z,0,0);}
static void*clone(void*owner,void*source){record(7,(uintptr_t)owner,(uintptr_t)source,0);return a[0x7f08]?0:a+0x4800;}
static void*matrix(void*out,void*object){int region=object==a+0x4200;record(region?5:6,(uintptr_t)object,0,0);memcpy(out,a+(region?0x4b00:0x4600),64);return out;}
static uint32_t named(void*p,char*name,float speed){uint32_t b;memcpy(&b,&speed,4);uint32_t kind=!strcmp(name,"critterMove")?0:!strcmp(name,"critterIdle")?1:99;if(kind==99)exit(13);record(8,(uintptr_t)p,kind,b);return a[0x7f0a]?0xffffffff:kind+3;}
static void pause_action(void*p,uint32_t index){record(9,(uintptr_t)p,index,0);}
static void struggle(void*p,char*name,uint32_t kind,float speed,float weight){uint32_t x,y;memcpy(&x,&speed,4);memcpy(&y,&weight,4);if(strcmp(name,"CritterStruggle"))exit(14);record(10,(uintptr_t)p,kind,((uint64_t)x<<32)|y);}
static char*names[]={"M_head_Sim","R_shoulderRoot","R_wingTip","R_wingMidA","R_wingTip1","L_shoulderRoot","L_wingTip","L_wingMidA","L_wingTip1","M_tail7_Sim","M_head"};
static uint32_t find(void*p,char*name,uint32_t unused,uint32_t check){uint32_t i=0;for(;i<11;i++)if(!strcmp(name,names[i]))break;if(i>=11)exit(15);record(11,(uintptr_t)p,i,((uint64_t)unused<<32)|check);uint32_t profile=a[0x7f09];if(profile==0||profile==3)return 0xffffffff;if(profile==2&&i!=10&&(i==0||i%2))return 0xffffffff;return i==10?0:i;}
static void*bone(void*p,uint32_t index){record(12,(uintptr_t)p,index,0);return a+0x5000+index*0x80;}
static void*effect(void*owner){void*p=a+0x6400+fx++*0x80;record(13,(uintptr_t)owner,(uintptr_t)p,0);return p;}
static void*world(void*out,void*p){record(14,(uintptr_t)p,0,0);memcpy(out,a+0x4a00,64);return out;}
static void*emitter(void*owner,void*matrix,void*params,void*template,uint32_t active){void*p=a+0x6800+em++*0x100;uint8_t*t=record(15,(uintptr_t)owner,(uintptr_t)template,active);memcpy(t+32,matrix,64);memcpy(t+96,params,12);return p;}
static void*wind_meta(void){return a+0x7180;}
static void*wind_create(void*owner,void*meta){(void)meta;void*p=a+0x6b00+wind++*0x80;record(16,(uintptr_t)owner,(uintptr_t)p,0);return p;}
static void wind_cast(void*meta,void*out,void*input,void*type){(void)meta;(void)type;uintptr_t p;memcpy(&p,input,8);memcpy(out,&p,8);}
static void release_effect(void*owner,void*effect){record(17,(uintptr_t)owner,(uintptr_t)effect,0);}
static void model_enable(void*model,uint32_t enabled){record(18,(uintptr_t)model,enabled,0);}
static void*wind_type(void){return a+0x7180;}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);if(mmap(a,0x8000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 hook(0x1007e5f70UL,assertion);hook(0x100aa2b22UL,random_value);hook(0x1007abc10UL,metadata);hook(0x10043ccc0UL,metadata);hook(0x10062e5b0UL,motion);hook(0x10046ccc0UL,clone);hook(0x1000959b0UL,named);hook(0x100097d30UL,pause_action);hook(0x1000967b0UL,struggle);hook(0x100093a90UL,find);hook(0x10009e090UL,bone);hook(0x10039a7f0UL,effect);hook(0x1007f26b0UL,world);hook(0x1002de940UL,emitter);hook(0x100327f70UL,wind_meta);hook(0x100327790UL,wind_create);hook(0x100327e10UL,wind_type);
 hook(0x10039a780UL,release_effect);hook(0x1004636d0UL,model_enable);
 uint32_t count;rd(&count,4);wr(&count,4);while(count--){rd(&rng,4);rd(a,0x8000);line=severity=calls=fx=em=wind=0;uint64_t vptr=(uintptr_t)(a+0x7100);memcpy(a+0x7000,&vptr,8);memcpy(a+0x4200,&vptr,8);memcpy(a+0x4300,&vptr,8);void*fn=cast;memcpy(a+0x7140,&fn,8);fn=matrix;memcpy(a+0x7118,&fn,8);vptr=(uintptr_t)(a+0x71c0);memcpy(a+0x7180,&vptr,8);fn=wind_cast;memcpy(a+0x7200,&fn,8);uint64_t tpl=(uintptr_t)(a+0x6300);memcpy((void*)0x101def818UL,&tpl,8);
 if(!setjmp(escape)){((void(*)(void*,void*,void*))0x1001a1840UL)(a+0x1000,0,a+0x3000);if(a[0x7f0b])((void(*)(void*,void*,void*))0x1001a20f0UL)(a+0x1000,0,a+0x3000);}
 memset(a+0x7000,0,0x208);memset(a+0x4200,0,8);memset(a+0x4300,0,8);wr(&line,4);wr(&severity,4);wr(a,0x8000);wr(&calls,4);wr(trace,calls*160);
 }return 0;}
