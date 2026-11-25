#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t*a=(void*)0x440000000UL;static jmp_buf escape;static uint32_t line,calls,refs,models,winds;static void*ref_ptrs[5];static uint8_t trace[128][256];
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static uint32_t u32(void*p){uint32_t n;memcpy(&n,p,4);return n;}
static void hook(uintptr_t at,void*fn){uint8_t b[14]={0xff,0x25};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static uint8_t*record(uint64_t k,uint64_t x,uint64_t y,uint64_t z){if(calls>=128)exit(12);uint8_t*out=trace[calls++];memset(out,0,256);uint64_t v[]={k,x,y,z};memcpy(out,v,32);return out;}
static void assertion(char*x,char*f,uint32_t l,uint32_t severity,...){(void)x;(void)f;(void)severity;line=l;longjmp(escape,1);}
static void scale(void*out,void*matrix){memcpy(record(1,0,0,0)+32,matrix,64);memcpy(out,a+0x30000,16);}
static void rail(void*p,uint32_t cooldown){record(2,(uintptr_t)p,cooldown,0);}
static uint32_t random_value(void){uint32_t n=u32(a+0x5f004);record(3,n,0,0);return n;}
static void*model(void*owner,char*name,char*shader,void*matrix,void*options){uint8_t*r=record(4,(uintptr_t)owner,0,0);snprintf((char*)r+32,32,"%s",name);snprintf((char*)r+64,32,"%s",shader);memcpy(r+96,matrix,64);memcpy(r+160,options,96);for(int i=0;i<96;i++){int used=i<22||(i>=24&&i<33)||(i>=36&&i<51)||(i>=52&&i<56)||(i>=64&&i<73)||(i>=76&&i<90);if(!used)r[160+i]=0;}return a+0x10000+models++*0x1000;}
static int ref_index(void*p){for(int i=0;i<5;i++)if(ref_ptrs[i]==p)return i;exit(13);}
static void ref_new(void*p){record(5,refs,0,0);ref_ptrs[refs++]=p;memset(p,0,8);}
static void*texture_type(void){record(6,0,0,0);return a+0x5e200;}
static char*textures[]={"Noise3Ch","AvatarMaskBasicTex","AttribSimpleGlow","UpNormal","White"};
static int texture_index(char*name){for(int i=0;i<5;i++)if(!strcmp(name,textures[i]))return i;exit(14);}
static void*lookup(void*owner,void*type,char*name){int i=texture_index(name);record(7,(uintptr_t)owner,(uintptr_t)type,i);return (u32(a+0x5f008)&(1U<<i))?0:a+0x15000+i*0x100;}
static void observe(void*resource,void*ref){int i=ref_index(ref);record(8,(uintptr_t)resource,i,0);uintptr_t handle=(u32(a+0x5f00c)&(1U<<i))?0:(uintptr_t)resource;memcpy(ref,&handle,8);}
static void request(void*owner,void*type,char*name){record(9,(uintptr_t)owner,(uintptr_t)type,texture_index(name));}
static void ref_destroy(void*p){uint64_t handle;memcpy(&handle,p,8);record(24,ref_index(p),handle,0);}
static char*uniforms[]={"u_diffuse1Tex","u_diffuse2Tex","u_lightTex","u_normTex","u_diffuse1TexScale","u_normTexScale","u_texture","u_diffuseColor","u_uvScroll","u_uvOffset"};
static int uniform_index(char*name){for(int i=0;i<10;i++)if(!strcmp(name,uniforms[i]))return i;exit(15);}
static void texture(void*p,uint32_t pass,char*name,void*texture,void*unused){if(pass||unused)exit(16);record(10,(uintptr_t)p,uniform_index(name),(uintptr_t)texture);}
static void scalar(void*p,uint32_t pass,char*name,float value){if(pass)exit(17);uint32_t v;memcpy(&v,&value,4);record(11,(uintptr_t)p,uniform_index(name),v);}
static void enabled(void*p,uint32_t n){record(12,(uintptr_t)p,n,0);}
static void default_animation(void*p){record(13,(uintptr_t)p,0,0);}
static char*bones[]={"M_head_Con","M_belly_Sim","M_tail4_Sim","M_tail7_Sim","M_eye"};
static void*bone(void*p,char*name){int i=0;for(;i<5;i++)if(!strcmp(name,bones[i]))break;if(i==5)exit(18);record(14,(uintptr_t)p,i,0);return (u32(a+0x5f018)&(1U<<i))?0:a+0x17000+i*0x100;}
static void*wind_type(void){record(15,0,0,0);return a+0x5e400;}
static void*wind_lookup(void*owner,void*type){record(16,(uintptr_t)owner,(uintptr_t)type,0);return a+0x5e600;}
static void*wind_object_type(void){record(17,0,0,0);return a+0x5e500;}
static void wind_create(void*type,void*out,void*ref,void*object_type){record(18,(uintptr_t)type,*(uintptr_t*)ref,(uintptr_t)object_type);void*p=a+0x18000+winds++*0x100;memcpy(out,&p,8);}
static void wind_commit(void*p){record(19,(uintptr_t)p,0,0);}
static void*marker(void*owner,uint32_t mode){record(20,(uintptr_t)owner,mode,0);return a+0x19000;}
static void marker_transform(void*p,void*matrix){memcpy(record(21,(uintptr_t)p,0,0)+32,matrix,64);}
static void marker_activate(void*owner,void*p,uint32_t n){record(22,(uintptr_t)owner,(uintptr_t)p,n);}
static void world_position(void*out,void*p){record(23,(uintptr_t)p,0,0);memcpy(out,a+0x30020,16);}
static void vector_color(void*p,uint32_t pass,char*name,void*data){if(pass)exit(19);memcpy(record(25,(uintptr_t)p,uniform_index(name),0)+32,data,16);}
static void vector_value(void*p,uint32_t pass,char*name,void*data){if(pass)exit(20);memcpy(record(25,(uintptr_t)p,uniform_index(name),1)+32,data,16);}
int main(int argc,char**argv){
 if(argc!=2)return 2;
 FILE*f=fopen(argv[1],"rb");if(!f)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;
 fclose(f);if(mmap(a,0x60000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 hook(0x1007e5f70UL,assertion);hook(0x100789f00UL,scale);hook(0x10026d0f0UL,rail);hook(0x100aa2b22UL,random_value);hook(0x10046c700UL,model);hook(0x1007c2530UL,ref_new);hook(0x10079ac90UL,texture_type);hook(0x1007c4360UL,lookup);hook(0x1007c2310UL,observe);hook(0x1007c4640UL,request);hook(0x1007c2570UL,ref_destroy);hook(0x100466ee0UL,texture);hook(0x1004667c0UL,scalar);hook(0x1004636d0UL,enabled);hook(0x100096120UL,default_animation);hook(0x10009e110UL,bone);hook(0x100327f70UL,wind_type);hook(0x100327790UL,wind_lookup);hook(0x100327e10UL,wind_object_type);hook(0x100328de0UL,wind_commit);hook(0x10043d6a0UL,marker);hook(0x10043ccd0UL,marker_transform);hook(0x1004ce8c0UL,marker_activate);hook(0x1007f26b0UL,world_position);hook(0x100466a50UL,vector_color);hook(0x100466af0UL,vector_value);
 uint32_t count;rd(&count,4);wr(&count,4);while(count--){
  rd(a,0x60000);line=calls=refs=models=winds=0;void*fn=wind_create;memcpy(a+0x5e040,&fn,8);uintptr_t vtable=(uintptr_t)(a+0x5e000);memcpy(a+0x5e400,&vtable,8);memcpy((void*)0x10203f6b0UL,a+0x30040,16);memcpy((void*)0x100d2b420UL,a+0x5f010,4);
  if(!setjmp(escape))((void(*)(void*,uint32_t,void*,void*,void*,void*,void*,void*))0x10026c670UL)(a+0x4000,u32(a+0x5f000),a+0x2000,0,a+0x2100,a+0x2200,a+0x2300,a+0x3000);
  memcpy(a+0x5f100,&line,4);memset(a+0x5e000,0,0x100);memset(a+0x5e400,0,8);wr(a,0x60000);wr(&calls,4);wr(trace,calls*256);
 }
 return 0;
}
