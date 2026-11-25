#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <setjmp.h>
#include <immintrin.h>
#include <sys/mman.h>
#define SIZE 0x80000
#define ROW 640
static uint8_t*a=(void*)0x440000000UL;static uint32_t calls,samples,active_mode;static uint8_t trace[2048][ROW];static jmp_buf escape;
static void *seek_entry,*rail_entry,*appear_entry,*switch_entry,*chase_entry,*attack_entry,*hit_entry;static uint32_t id_calls;
static uint32_t u32(size_t p){uint32_t n;memcpy(&n,a+p,4);return n;}static float fl(size_t p){float n;memcpy(&n,a+p,4);return n;}
static uint32_t fb(float x){uint32_t n;memcpy(&n,&x,4);return n;}
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[14]={0xff,0x25};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static void*trampoline(uintptr_t at,size_t prefix){void*p=mmap(NULL,4096,7,MAP_PRIVATE|MAP_ANONYMOUS,-1,0);if(p==MAP_FAILED)exit(14);memcpy(p,(void*)at,prefix);hook((uintptr_t)p+prefix,(void*)(at+prefix));return p;}
static uint8_t*record(uint64_t kind,uint64_t x,uint64_t y){if(calls>=2048)exit(12);static uint8_t ignored[ROW];uint8_t*r=(active_mode==4&&((kind>=6&&kind<=9)||kind==13||kind==14||kind==21))?ignored:trace[calls++];memset(r,0,ROW);uint64_t v[]={kind,x,y};memcpy(r,v,24);return r;}
static void mutate(uint32_t kind){if(u32(0x1d008)!=kind)return;void*p;uint32_t n;
 switch(kind){case 1:n=3;memcpy(a+0x12e0,&n,4);break;case 2:p=a+0xb000;memcpy(a+0x11e0,&p,8);break;case 3:p=a+0xa000;memcpy(a+0x1218,&p,8);break;case 4:memcpy(a+0x1280,a+0x1d080,8);break;case 5:n=0;memcpy(a+0x7144,&n,4);break;case 6:memcpy((void*)0x100d2b440UL,a+0x1d090,16);break;case 7:p=a+0x5400;memcpy(a+0x1238,&p,8);break;}
}
static float sine(float x){float z=sinf(x);uint32_t n=fb(z);memcpy(record(1,fb(x),0)+24,&n,4);return z;}
static void combat_mutate(uint32_t event);
static float exponential(float x){float z=expf(x);uint32_t n=fb(z);memcpy(record(2,fb(x),0)+24,&n,4);combat_mutate(9);return z;}
static float remainder_value(float x,float y){float z=fmodf(x,y);uint32_t n=fb(z);memcpy(record(3,fb(x),fb(y))+24,&n,4);return z;}
static void*sample(void*out,void*rail,float time){uint8_t*r=record(4,(uintptr_t)rail,fb(time));memcpy(out,a+0x1c000+(samples++%16)*16,16);memcpy(r+32,out,16);return out;}
static float nearest(void*rail,void*position,void*out){uint8_t*r=record(5,(uintptr_t)rail,0);memcpy(r+32,position,16);uint32_t n=u32(0x1d030);memcpy(r+24,&n,4);memset(out,0,16);return fl(0x1d030);}
static void*seek(void*out,void*position,void*target,float weight){uint8_t*r=record(6,(uintptr_t)position,fb(weight));memcpy(r+32,target,16);((void*(*)(void*,void*,void*,float))seek_entry)(out,position,target,weight);memcpy(r+48,out,16);return out;}
static void*follow(void*out,void*position,void*rail,void*time,uint32_t direction,float tolerance,float delta){uint8_t*r=record(7,(uintptr_t)position,(uintptr_t)rail);uint64_t ptr=(uintptr_t)time;memcpy(r+24,&ptr,8);memcpy(r+32,&direction,4);uint32_t t=fb(tolerance),d=fb(delta);memcpy(r+36,&t,4);memcpy(r+40,&d,4);memcpy(out,a+0x1d040,16);((void*(*)(void*,void*,void*,void*,uint32_t,float,float))rail_entry)(out,position,rail,time,direction,tolerance,delta);memcpy(r+48,out,16);return out;}
static void switch_rail(void*p,uint32_t cooldown){record(8,(uintptr_t)p,cooldown);((void(*)(void*,uint32_t))switch_entry)(p,cooldown);}
static void appear(void*p,void*audio){record(9,(uintptr_t)p,(uintptr_t)audio);((void(*)(void*,void*))appear_entry)(p,audio);}
static void*find_avatar(void*owner,void*id){uint32_t n;memcpy(&n,id,4);void*p=(u32(0x1d004)&1)?NULL:a+0x20020;uint8_t*r=record(10,(uintptr_t)owner,n);memcpy(r+24,&p,8);mutate(1);return p;}
static uint8_t enabled(void*p){uint32_t n=u32(0x1d00c);record(11,(uintptr_t)p,n);return n;}
static void combat_mutate(uint32_t event);
static void*bird_position(void*out,void*p){uint8_t*r=record(12,(uintptr_t)p,0);memcpy(out,(uint8_t*)p+16,16);memcpy(r+32,out,16);combat_mutate(5);return out;}
static void hit(void*p,void*target,void*avatars,void*unused,void*birds,void*particles,void*stack_unused,void*audio,void*scene){uint8_t*r=record(21,(uintptr_t)p,(uintptr_t)target);uint64_t owners[]={(uintptr_t)avatars,(uintptr_t)birds,(uintptr_t)particles,(uintptr_t)audio,(uintptr_t)scene};memcpy(r+24,owners,sizeof owners);((void(*)(void*,void*,void*,void*,void*,void*,void*,void*,void*))hit_entry)(p,target,avatars,unused,birds,particles,stack_unused,audio,scene);}
static void attack(void*p,void*av,void*actors,void*birds,void*player,void*extra,void*audio,void*effects,__m128 delta){uint8_t*r=record(13,(uintptr_t)p,0);uint64_t owners[]={(uintptr_t)av,(uintptr_t)actors,(uintptr_t)birds,(uintptr_t)player,(uintptr_t)extra,(uintptr_t)audio,(uintptr_t)effects};memcpy(r+24,owners,sizeof owners);_mm_storeu_ps((float*)(r+80),delta);((void(*)(void*,void*,void*,void*,void*,void*,void*,void*,__m128))attack_entry)(p,av,actors,birds,player,extra,audio,effects,delta);}
static void chase(void*p,void*unused,void*audio,void*interaction,__m128 delta){uint8_t*r=record(14,(uintptr_t)p,(uintptr_t)audio);uint64_t o=(uintptr_t)interaction;memcpy(r+24,&o,8);_mm_storeu_ps((float*)(r+32),delta);((void(*)(void*,void*,void*,void*,float))chase_entry)(p,unused,audio,interaction,_mm_cvtss_f32(delta));}
static void bounds(void*p){uint8_t*r=record(15,(uintptr_t)p,0);memcpy(r+32,(uint8_t*)p+16,64);mutate(3);}
static void*world_position(void*out,void*p){uint8_t*r=record(16,(uintptr_t)p,0);memcpy(out,(uint8_t*)p+176,16);memcpy(r+32,out,16);mutate(7);return out;}
static void model_transform(void*p,void*matrix){uint8_t*r=record(17,(uintptr_t)p,0);memcpy(r+32,matrix,64);memcpy((uint8_t*)p+16,matrix,64);mutate(2);}
static void combat_mutate(uint32_t event){if(u32(0x1d300)!=event)return;void*p;uint32_t n;
 switch(event){case 1:p=a+0xc100;memcpy(a+0x1290,&p,8);p=a+0xc600;memcpy(a+0x1250,&p,8);break;
 case 2:memcpy(a+0x1060,a+0x1d340,16);break;case 3:n=0x40c00000;memcpy(a+0x1140,&n,4);break;
 case 4:n=0x40400000;memcpy(a+0x1170,&n,4);a[0x1174]=1;break;
 case 5:memcpy(a+0x1160,a+0x1d340,16);break;case 6:p=a+0x9a00;memcpy(a+0x9fe8,&p,8);break;
 case 7:p=a+0x6900;memcpy((void*)0x101defb88UL,&p,8);memcpy(a+0x1d330,&p,8);p=a+0x6300;memcpy(a+0x20050,&p,8);p=a+0x6400;memcpy(a+0xa060,&p,8);break;
 case 8:memcpy((void*)0x100d2b460UL,a+0x1d360,16);break;
 case 9:n=0x42c60000;memcpy(a+0x10a4,&n,4);break;}
}
static uint64_t sound_id(void*p){uint64_t n;memcpy(&n,(uint8_t*)p+8,8);if(++id_calls==u32(0x1d304))n=999;record(18,(uintptr_t)p,n);combat_mutate(1);return n;}
static uint8_t sound_playing(void*p){uint32_t n=((uint8_t*)p)[16];record(19,(uintptr_t)p,n);return n;}
struct sound_pair{void*handle;uint64_t id;};
static struct sound_pair play(void*owner,char*name,void*options,void*parameters){uint32_t which=!strcmp(name,"DuskCreatureWindup")?0:!strcmp(name,"duskstart2lockon")?1:!strcmp(name,"DuskCreatureAttack")?2:!strcmp(name,"DuskCreatureHit")?3:!strcmp(name,"DarkCreatureAppear")?4:!strcmp(name,"DuskCreatureReveal")?5:99;if(which==99)exit(15);uint8_t*r=record(20,(uintptr_t)owner,which);memcpy(r+32,options,128);memcpy(r+160,parameters,0x1b0);struct sound_pair pair={u32(0x1d308)==1?NULL:a+0xc000+which*0x100,u32(0x1d308)==2?0:1234};memcpy(r+24,&pair.id,8);memcpy(r+592,&pair.handle,8);combat_mutate(2);return pair;}
static void update_sound(void*p,void*packet){uint8_t*r=record(22,(uintptr_t)p,0);memcpy(r+32,packet,128);combat_mutate(4);}
static void play_animation(void*p,void*packet){uint8_t*r=record(23,(uintptr_t)p,0);memcpy(r+32,packet,0x1b0);combat_mutate(3);}
static void interaction(void*owner,void*p,uint32_t kind,void*template,uint32_t first,uint32_t second,uint32_t last,float size,float other){uint8_t*r=record(24,(uintptr_t)owner,(uintptr_t)p);uint64_t t=(uintptr_t)template;memcpy(r+24,&t,8);uint32_t data[]={kind,fb(size),fb(other),first,second,last};memcpy(r+32,data,sizeof data);combat_mutate(2);}
static void bird_hit(void*p,void*owner){record(25,(uintptr_t)p,(uintptr_t)owner);((uint8_t*)p)[0xd1]++;combat_mutate(6);}
static void*local_avatar(void*barn){void*p=(uint8_t*)barn+32;uint8_t*r=record(26,(uintptr_t)barn,0);memcpy(r+24,&p,8);return p;}
static void set_local(void*p,uint32_t kind){record(27,(uintptr_t)p,kind);combat_mutate(7);}
static void finish_local(void*p){record(28,(uintptr_t)p,0);}
static void*create_particle(void*owner,void*position,void*up,void*template,uint32_t flag){memcpy((uint8_t*)up+12,a+0x1d33c,4);uint8_t*r=record(29,(uintptr_t)owner,(uintptr_t)template);memcpy(r+24,&flag,4);memcpy(r+32,position,16);memcpy(r+48,up,16);void*p=a+0x6500;memcpy(r+64,&p,8);combat_mutate(8);return p;}
__attribute__((noinline,noreturn)) static __attribute__((used)) void stop_phase(void*palette){memcpy(a+0x1d100+u32(0x1d01c)*16,palette,16);longjmp(escape,1);}
__attribute__((naked)) static void stop_jump(void){__asm__("lea 0x80(%rsp),%rdi\n\tjmp stop_phase");}
static uint32_t probe(uint32_t op,uint32_t a,uint32_t b){float x,y,z;memcpy(&x,&a,4);memcpy(&y,&b,4);switch(op){case 0:__asm__("vaddss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;case 1:__asm__("vsubss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;case 2:__asm__("vmulss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;default:__asm__("vdivss %2,%1,%0":"=x"(z):"x"(x),"x"(y));}return fb(z);}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);if(mmap(a,SIZE,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 seek_entry=trampoline(0x10062cb10UL,16);rail_entry=trampoline(0x10062e300UL,15);appear_entry=trampoline(0x100270010UL,20);switch_entry=trampoline(0x10026d0f0UL,14);
 chase_entry=trampoline(0x1002703d0UL,15);attack_entry=trampoline(0x100270960UL,17);hit_entry=trampoline(0x100270fd0UL,17);
 hook(0x100270fd0UL,hit);hook(0x1005a1410UL,interaction);hook(0x1000fc260UL,local_avatar);hook(0x10011fce0UL,set_local);hook(0x10011fe00UL,finish_local);hook(0x1002de940UL,create_particle);hook(0x10062cb10UL,seek);hook(0x10062e300UL,follow);hook(0x100270010UL,appear);hook(0x10026d0f0UL,switch_rail);hook(0x100aa2bcaUL,sine);hook(0x100aa2708UL,exponential);hook(0x100aa2744UL,remainder_value);hook(0x10055e420UL,sample);hook(0x10055d820UL,nearest);hook(0x100101e20UL,find_avatar);hook(0x100270960UL,attack);hook(0x1002703d0UL,chase);hook(0x100328de0UL,bounds);hook(0x1007f26b0UL,world_position);hook(0x100463750UL,model_transform);hook(0x1006018a0UL,play);hook(0x10026e7daUL,stop_jump);*(void**)0x100c0d8d8UL=a+0x1eff0;
 uint32_t count;rd(&count,4);wr(&count,4);uint32_t n=16,values[]={0x7fc00000,0xffc00000};wr(&n,4);for(uint32_t op=0;op<4;op++)for(uint32_t x=0;x<2;x++)for(uint32_t y=0;y<2;y++){uint32_t row[]={op,values[x],values[y],probe(op,values[x],values[y])};wr(row,16);}
 while(count--){uint32_t mode;rd(&mode,4);active_mode=mode;rd(a,SIZE);*(void**)(a+0x1e038)=bird_hit;*(void**)(a+0x1e168)=update_sound;*(void**)(a+0x1e188)=play_animation;*(void**)(a+0x1e010)=enabled;*(void**)(a+0x1e058)=bird_position;*(void**)(a+0x1e100)=sound_id;*(void**)(a+0x1e110)=sound_playing;memcpy((void*)0x100d2b430UL,a+0x1d200,48);memcpy((void*)0x100d2b460UL,a+0x1d320,16);memcpy((void*)0x101defb88UL,a+0x1d330,8);calls=samples=id_calls=0;
 for(uint32_t step=0;step<u32(0x1d000);step++){memcpy(a+0x1d01c,&step,4);
 if(mode==3||mode==4){if(!setjmp(escape))((void(*)(void*,void*,void*,void*,void*,void*,void*,void*,void*,void*,void*,void*,__m128,float))0x10026ddb0UL)(a+0x1000,a+0x20000,a+0x8200,a+0x9000,a+0x9200,a+0x9400,a+0x9600,a+0x9800,a+0x9a00,a+0x9c00,a+0x9e00,a+0x9f00,_mm_loadu_ps((float*)(a+0x1d020)),fl(0x1d018));}
 else if(mode==0)((void(*)(void*,void*,void*,void*,float))chase_entry)(a+0x1000,NULL,a+0x9600,a+0x9800,fl(0x1d020));
 else if(mode==1)((void(*)(void*,void*,void*,void*,void*,void*,void*,void*,__m128))attack_entry)(a+0x1000,a+0x20000,a+0x8200,a+0x9000,a+0x9c00,a+0x9e00,a+0x9600,a+0x9f00,_mm_loadu_ps((float*)(a+0x1d020)));
 else ((void(*)(void*,void*,void*,void*,void*,void*,void*,void*,void*))hit_entry)(a+0x1000,a+0x1160,a+0x20000,NULL,a+0x9000,a+0x9c00,NULL,a+0x9600,a+0x9f00);
 }
 memcpy(a+0x1d320,(void*)0x100d2b460UL,16);memcpy(a+0x1d200,(void*)0x100d2b430UL,48);memset(a+0x1e000,0,0x200);wr(&calls,4);wr(a,SIZE);wr(trace,calls*ROW);
 }return 0;
}
