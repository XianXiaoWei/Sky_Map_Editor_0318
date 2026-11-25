#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>
static uint64_t ticks;
static _Alignas(32) float wind[4];
static uint64_t tick_get(void){return ticks;}
static uint64_t epoch_get(void){return 0;}
static void wind_get(void *out,void *environment,void *position){(void)environment;(void)position;memcpy(out,wind,16);}
static void hook(uintptr_t at,void *fn){uint8_t j[]={0x48,0xb8,0,0,0,0,0,0,0,0,0xff,0xe0};memcpy(j+2,&fn,8);memcpy((void *)at,j,12);}
static void readin(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
int main(int argc,char **argv){
 if(argc!=2)return 2;
 FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *mem=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);if(mem==MAP_FAILED||fread(mem,1,0xd22000,file)!=0xd22000)return 4;fclose(file);
 hook(0x100aa285eUL,tick_get);hook(0x1007e8490UL,epoch_get);hook(0x100aa2744UL,fmodf);hook(0x100328200UL,wind_get);
 uint32_t count;readin(&count,4);fwrite(&count,4,1,stdout);
 for(uint32_t i=0;i<count;i++){
  _Alignas(32) unsigned char time[256]={0},environment[256]={0};_Alignas(32) float scrolls[12],position[4]={0};
  float input[6];uint32_t tb[2]={1,1};readin(input,sizeof(input));readin(wind,sizeof(wind));readin(scrolls,sizeof(scrolls));
  // raw delta is represented as integer nanoseconds; fixed override permits
  // exact float boundary cases without fabricating the clock conversion.
  ticks=1000000000000ULL+(uint64_t)llround((double)input[0]*1e9);uint64_t last=1000000000000ULL;void *tbp=tb;
  memcpy(time+0x88,&last,8);memcpy(time+0x90,&last,8);memcpy(time+0x98,&tbp,8);
  time[0xc]=1;memcpy(time+0x10,input,4);memcpy(time+0x20,input+1,4);memcpy(time+0x24,input+2,4);
  for(unsigned lane=0;lane<16;lane++){float minus=-1;memcpy(time+0x2c+lane*4,&minus,4);}
  *(unsigned char *)0x101ffb0d0UL=(unsigned char)input[3];memcpy((void *)0x100cb8540UL,input+4,4);
  ((void (*)(void *,void *))0x1003879d0UL)(time,NULL);
  float scale=input[5],delta=fminf(.266f,fmaxf(.0001f,input[0]*(input[1]*(input[3]?input[4]:1.f))));memcpy(environment+0xc,&delta,4);
  ((void (*)(void *,void *,void *,void *,void *,float))0x100328050UL)(environment,position,scrolls,scrolls+4,scrolls+8,scale);
  fwrite(time+0x24,4,1,stdout);fwrite(&delta,4,1,stdout);fwrite(scrolls,4,12,stdout);
 }
 return 0;
}
