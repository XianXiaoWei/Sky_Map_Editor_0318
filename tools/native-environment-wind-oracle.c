#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
static _Alignas(32) unsigned char env[0x7000], wind[0xd0];
static uintptr_t force_vtable[4];
static _Alignas(32) unsigned char markers[16][0xa0],clump[32],rail[80];
static uintptr_t marker_vtable[5];static void *marker_refs[16];
static void marker_world(void *out,void *owner){memcpy(out,(char *)owner+16,64);}
static void marker_scale(void *out,void *owner){memcpy(out,(char *)owner+80,64);}
static float rail_closest(void *owner,void *position,void *out){(void)position;memcpy(out,(char *)owner+64,16);return 0;}
static void rail_transform(void *out,void *owner){memcpy(out,owner,64);}
static void hook(uintptr_t at,void *fn){uint8_t j[]={0x48,0xb8,0,0,0,0,0,0,0,0,0xff,0xe0};memcpy(j+2,&fn,8);memcpy((void *)at,j,12);}
// Execute the original timer span at its original address/RIP. Only its exit
// is replaced with RET; no timer instruction is replaced or relocated.
__attribute__((noinline)) static void timer_span(void *timer,float delta){
 uintptr_t entry=0x100324b62UL;
 __asm__ volatile("mov %0,%%r14\n\tmovss %1,%%xmm0\n\tcall *%2" : : "r"(timer),"m"(delta),"r"(entry) : "r14","xmm0","xmm1","cc","memory");
}
static void readin(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void ptr(void *p,size_t at,const void *v){memcpy((char *)p+at,&v,8);}
static void u32(void *p,size_t at,uint32_t v){memcpy((char *)p+at,&v,4);}
// Explicit interaction-force samples. Original virtual selection/strength loop
// executes unchanged; source construction and force formula are separate gaps.
static void force_get(void *out,void *owner,void *position){(void)position;memcpy(out,(char *)owner+0x70,16);}
static void readwind(void *p){
 uint32_t h[2];float v[4];readin(h,8);readin(v,16);readin((char *)p+16,64);
 ((char *)p)[80]=h[0]!=0;u32(p,96,h[1]);memcpy((char *)p+84,v,12);memcpy((char *)p+200,v+3,4);
}
static void readextras(void *p){
 uint32_t has_rail,count;readin(&has_rail,4);
 if(has_rail){readin(rail,80);ptr(p,112,rail);}
 readin(&count,4);if(count>16)exit(11);
 memset(clump,0,sizeof(clump));memset(markers,0,sizeof(markers));
 for(unsigned i=0;i<count;i++){
  ptr(markers[i],0,marker_vtable);u32(markers[i],8,32);readin(markers[i]+16,64);
  static const float identity[16]={1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1};memcpy(markers[i]+80,identity,64);
  marker_refs[i]=markers[i]+8;
 }
 if(count){ptr(clump,8,marker_refs);u32(clump,16,count);ptr(p,104,clump);}
}
int main(int argc,char **argv){
 if(argc!=2)return 2;
 FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *mem=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
 if(mem==MAP_FAILED||fread(mem,1,0xd22000,file)!=0xd22000)return 4;fclose(file);
 force_vtable[3]=(uintptr_t)force_get;
 hook(0x10055d820UL,rail_closest);hook(0x100560b40UL,rail_transform);
 // Original Marker metaclass cast, explicit virtual Matrix4 getter outputs.
 static uint8_t registry[0x98+0x500*8],marker_meta[80],object_meta[80];
 ptr((void *)0x102047c70UL,0,registry);ptr(marker_meta,0,(void *)0x100cc6138UL);u32(marker_meta,0x38,32);
 ptr(object_meta,0,(void *)0x100d12db8UL);ptr(registry,0x98+32*8,marker_meta);
 ptr((void *)0x1020045b8UL,0,marker_meta);ptr((void *)0x102047f70UL,0,object_meta);
 marker_vtable[3]=(uintptr_t)marker_world;marker_vtable[4]=(uintptr_t)marker_scale;
 *(unsigned char *)0x100324b8dUL=0xc3;
 uint32_t count;readin(&count,4);fwrite(&count,4,1,stdout);
 for(unsigned i=0;i<count;i++){
  uint32_t mode,nw;_Alignas(16) float eye[4],out[4];float weight=0;
  readin(&mode,4);readin(eye,16);
  if(mode==0){
   memset(wind,0,sizeof(wind));readwind(wind);readextras(wind);
   ((void *(*)(void *,void *,void *,void *))0x100328810UL)(out,wind,eye,&weight);
   fwrite(out,12,1,stdout);fwrite(&weight,4,1,stdout);
  }else if(mode==1){
   memset(env,0,sizeof(env));readin(env+0x30,16);readin(&nw,4);if(nw>32)return 6;
   u32(env,0x48c0,nw);
   for(unsigned j=0;j<nw;j++)readwind(env+0x48d0+j*0xd0);
   for(unsigned j=0;j<32;j++)for(unsigned k=0;k<2;k++){
    unsigned at=0xc0+j*0x120+k*0x2400;uint32_t active;float force[4];readin(&active,4);readin(force,16);
    ptr(env,at,force_vtable);env[at+0x5c]=active!=0;memcpy(env+at+0x70,force,16);
   }
   ((void *(*)(void *,void *,void *))0x100328200UL)(out,env,eye);
   fwrite(out,12,1,stdout);fwrite(&weight,4,1,stdout);
  }else if(mode==2){
   uint32_t active;float values[3];readin(&active,4);readin(values,12);memset(wind,0,sizeof(wind));
   wind[80]=active!=0;memcpy(wind+88,values+1,4);memcpy(wind+200,values,4);
   timer_span(wind+200,values[2]);memset(out,0,16);memcpy(out,wind+200,4);fwrite(out,16,1,stdout);
  }else return 7;
 }
 return 0;
}
