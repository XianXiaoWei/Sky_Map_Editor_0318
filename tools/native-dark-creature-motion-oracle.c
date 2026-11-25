#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <setjmp.h>
#include <immintrin.h>
#include <sys/mman.h>
#define SIZE 0x20000
#define ROW 640
static uint8_t*a=(void*)0x440000000UL;static uint32_t calls,samples,active_mode;static uint8_t trace[2048][ROW];static jmp_buf escape;
static void *seek_entry,*rail_entry,*appear_entry,*switch_entry;
static uint32_t u32(size_t p){uint32_t n;memcpy(&n,a+p,4);return n;}static float fl(size_t p){float n;memcpy(&n,a+p,4);return n;}
static uint32_t fb(float x){uint32_t n;memcpy(&n,&x,4);return n;}
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[14]={0xff,0x25};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static void*trampoline(uintptr_t at,size_t prefix){void*p=mmap(NULL,4096,7,MAP_PRIVATE|MAP_ANONYMOUS,-1,0);if(p==MAP_FAILED)exit(14);memcpy(p,(void*)at,prefix);hook((uintptr_t)p+prefix,(void*)(at+prefix));return p;}
static uint8_t*record(uint64_t kind,uint64_t x,uint64_t y){if(calls>=2048)exit(12);static uint8_t ignored[ROW];uint8_t*r=(active_mode==3&&kind>=6&&kind<=9)?ignored:trace[calls++];memset(r,0,ROW);uint64_t v[]={kind,x,y};memcpy(r,v,24);return r;}
static void mutate(uint32_t kind){if(u32(0x1d008)!=kind)return;void*p;uint32_t n;
 switch(kind){case 1:n=3;memcpy(a+0x12e0,&n,4);break;case 2:p=a+0xb000;memcpy(a+0x11e0,&p,8);break;case 3:p=a+0xa000;memcpy(a+0x1218,&p,8);break;case 4:memcpy(a+0x1280,a+0x1d080,8);break;case 5:n=0;memcpy(a+0x7144,&n,4);break;case 6:memcpy((void*)0x100d2b440UL,a+0x1d090,16);break;case 7:p=a+0x5400;memcpy(a+0x1238,&p,8);break;}
}
static float sine(float x){float z=sinf(x);uint32_t n=fb(z);memcpy(record(1,fb(x),0)+24,&n,4);return z;}
static float exponential(float x){float z=expf(x);uint32_t n=fb(z);memcpy(record(2,fb(x),0)+24,&n,4);return z;}
static float remainder_value(float x,float y){float z=fmodf(x,y);uint32_t n=fb(z);memcpy(record(3,fb(x),fb(y))+24,&n,4);return z;}
static void*sample(void*out,void*rail,float time){uint8_t*r=record(4,(uintptr_t)rail,fb(time));memcpy(out,a+0x1c000+(samples++%16)*16,16);memcpy(r+32,out,16);return out;}
static float nearest(void*rail,void*position,void*out){uint8_t*r=record(5,(uintptr_t)rail,0);memcpy(r+32,position,16);uint32_t n=u32(0x1d030);memcpy(r+24,&n,4);memset(out,0,16);return fl(0x1d030);}
static void*seek(void*out,void*position,void*target,float weight){uint8_t*r=record(6,(uintptr_t)position,fb(weight));memcpy(r+32,target,16);((void*(*)(void*,void*,void*,float))seek_entry)(out,position,target,weight);memcpy(r+48,out,16);return out;}
static void*follow(void*out,void*position,void*rail,void*time,uint32_t direction,float tolerance,float delta){uint8_t*r=record(7,(uintptr_t)position,(uintptr_t)rail);uint64_t ptr=(uintptr_t)time;memcpy(r+24,&ptr,8);memcpy(r+32,&direction,4);uint32_t t=fb(tolerance),d=fb(delta);memcpy(r+36,&t,4);memcpy(r+40,&d,4);memcpy(out,a+0x1d040,16);((void*(*)(void*,void*,void*,void*,uint32_t,float,float))rail_entry)(out,position,rail,time,direction,tolerance,delta);memcpy(r+48,out,16);return out;}
static void switch_rail(void*p,uint32_t cooldown){record(8,(uintptr_t)p,cooldown);((void(*)(void*,uint32_t))switch_entry)(p,cooldown);}
static void appear(void*p,void*audio){record(9,(uintptr_t)p,(uintptr_t)audio);((void(*)(void*,void*))appear_entry)(p,audio);}
static void*find_avatar(void*owner,void*id){uint32_t n;memcpy(&n,id,4);void*p=(u32(0x1d004)&1)?NULL:a+0x7000;uint8_t*r=record(10,(uintptr_t)owner,n);memcpy(r+24,&p,8);mutate(1);return p;}
static uint8_t enabled(void*p){uint32_t n=u32(0x1d00c);record(11,(uintptr_t)p,n);return n;}
static void*bird_position(void*out,void*p){uint8_t*r=record(12,(uintptr_t)p,0);memcpy(out,(uint8_t*)p+16,16);memcpy(r+32,out,16);mutate(1);return out;}
static void attack(void*p,void*av,void*actors,void*birds,void*player,void*extra,void*audio,void*effects,__m128 delta){uint8_t*r=record(13,(uintptr_t)p,0);uint64_t owners[]={(uintptr_t)av,(uintptr_t)actors,(uintptr_t)birds,(uintptr_t)player,(uintptr_t)extra,(uintptr_t)audio,(uintptr_t)effects};memcpy(r+24,owners,sizeof owners);_mm_storeu_ps((float*)(r+80),delta);memcpy((uint8_t*)p+0xc0,a+0x1d060,16);mutate(6);}
static void chase(void*p,void*unused,void*audio,void*interaction,__m128 delta){(void)unused;uint8_t*r=record(14,(uintptr_t)p,(uintptr_t)audio);uint64_t o=(uintptr_t)interaction;memcpy(r+24,&o,8);_mm_storeu_ps((float*)(r+32),delta);memcpy((uint8_t*)p+0xc0,a+0x1d060,16);memcpy((uint8_t*)p+0x140,a+0x1d070,4);mutate(6);}
static void bounds(void*p){uint8_t*r=record(15,(uintptr_t)p,0);memcpy(r+32,(uint8_t*)p+16,64);mutate(3);}
static void*world_position(void*out,void*p){uint8_t*r=record(16,(uintptr_t)p,0);memcpy(out,(uint8_t*)p+176,16);memcpy(r+32,out,16);mutate(7);return out;}
static void model_transform(void*p,void*matrix){uint8_t*r=record(17,(uintptr_t)p,0);memcpy(r+32,matrix,64);memcpy((uint8_t*)p+16,matrix,64);mutate(2);}
static uint64_t sound_id(void*p){uint64_t n;memcpy(&n,(uint8_t*)p+8,8);record(18,(uintptr_t)p,n);mutate(4);return n;}
static uint8_t sound_playing(void*p){uint32_t n=u32(0x1d014);record(19,(uintptr_t)p,n);return n;}
struct sound_pair{void*handle;uint64_t id;};
static struct sound_pair play(void*owner,char*name,void*options,void*parameters){uint32_t which=!strcmp(name,"DarkCreatureAppear")?0:!strcmp(name,"DuskCreatureReveal")?1:99;if(which==99)exit(15);uint8_t*r=record(20,(uintptr_t)owner,which);memcpy(r+32,options,128);memcpy(r+160,parameters,0x1b0);struct sound_pair pair={a+0xc000,1234};memcpy(r+24,&pair.id,8);mutate(5);return pair;}
__attribute__((noinline,noreturn)) static __attribute__((used)) void stop_phase(void*palette){memcpy(a+0x1d100+u32(0x1d01c)*16,palette,16);longjmp(escape,1);}
__attribute__((naked)) static void stop_jump(void){__asm__("lea 0x80(%rsp),%rdi\n\tjmp stop_phase");}
static uint32_t probe(uint32_t op,uint32_t a,uint32_t b){float x,y,z;memcpy(&x,&a,4);memcpy(&y,&b,4);switch(op){case 0:__asm__("vaddss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;case 1:__asm__("vsubss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;case 2:__asm__("vmulss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;default:__asm__("vdivss %2,%1,%0":"=x"(z):"x"(x),"x"(y));}return fb(z);}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);if(mmap(a,SIZE,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 seek_entry=trampoline(0x10062cb10UL,16);rail_entry=trampoline(0x10062e300UL,15);appear_entry=trampoline(0x100270010UL,20);switch_entry=trampoline(0x10026d0f0UL,14);
 hook(0x10062cb10UL,seek);hook(0x10062e300UL,follow);hook(0x100270010UL,appear);hook(0x10026d0f0UL,switch_rail);hook(0x100aa2bcaUL,sine);hook(0x100aa2708UL,exponential);hook(0x100aa2744UL,remainder_value);hook(0x10055e420UL,sample);hook(0x10055d820UL,nearest);hook(0x100101e20UL,find_avatar);hook(0x100270960UL,attack);hook(0x1002703d0UL,chase);hook(0x100328de0UL,bounds);hook(0x1007f26b0UL,world_position);hook(0x100463750UL,model_transform);hook(0x1006018a0UL,play);hook(0x10026e7daUL,stop_jump);*(void**)0x100c0d8d8UL=a+0x1eff0;
 uint32_t count;rd(&count,4);wr(&count,4);uint32_t n=16,values[]={0x7fc00000,0xffc00000};wr(&n,4);for(uint32_t op=0;op<4;op++)for(uint32_t x=0;x<2;x++)for(uint32_t y=0;y<2;y++){uint32_t row[]={op,values[x],values[y],probe(op,values[x],values[y])};wr(row,16);}
 while(count--){uint32_t mode;rd(&mode,4);active_mode=mode;rd(a,SIZE);*(void**)(a+0x1e010)=enabled;*(void**)(a+0x1e058)=bird_position;*(void**)(a+0x1e100)=sound_id;*(void**)(a+0x1e110)=sound_playing;memcpy((void*)0x100d2b430UL,a+0x1d200,48);calls=samples=0;
 for(uint32_t step=0;step<u32(0x1d000);step++){memcpy(a+0x1d01c,&step,4);
 if(mode==0||mode==3){if(!setjmp(escape))((void(*)(void*,void*,void*,void*,void*,void*,void*,void*,void*,void*,void*,void*,__m128,float))0x10026ddb0UL)(a+0x1000,a+0x8000,a+0x8200,a+0x9000,a+0x9200,a+0x9400,a+0x9600,a+0x9800,a+0x9a00,a+0x9c00,a+0x9e00,a+0x9f00,_mm_loadu_ps((float*)(a+0x1d020)),fl(0x1d018));}
 else if(mode==1)((void(*)(void*,void*))appear_entry)(a+0x1000,a+0x9600);
 else ((void*(*)(void*,void*,void*,void*,uint32_t,float,float))rail_entry)(a+0x1d040,a+0x1060,a+0x4000,a+0x1000+u32(0x1d03c),u32(0x1d034),fl(0x1d038),fl(0x1d020));
 }
 memcpy(a+0x1d200,(void*)0x100d2b430UL,48);memset(a+0x1e000,0,0x200);wr(&calls,4);wr(a,SIZE);wr(trace,calls*ROW);
 }return 0;
}
