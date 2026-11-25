#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>
static _Alignas(32) unsigned char barn[0x40de0];
static _Alignas(32) float position[4],normal[4],samples[7],sample_positions[7][4],sines[3];
static unsigned sample_used,sine_used;
static unsigned char noise[64*64*64];
__attribute__((naked,noinline,noclone,noipa)) static void native_tweaks(void *unused1,void *unused2){
 __asm__("push %rbp; push %rbx; mov %rdi,%rbx; mov %rsi,%rbp; movabs $0x100212727,%rax; call *%rax; pop %rbx; pop %rbp; ret");
}
static float distance_get(void *unused,const float *p){(void)unused;if(sample_used>=7)exit(11);memcpy(sample_positions[sample_used],p,16);return samples[sample_used++];}
static float sine_get(float v){if(sine_used>=3)exit(12);return sines[sine_used++]=sinf(v);}
static void readin(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void hook(uintptr_t at,void *fn){uint8_t j[]={0x48,0xb8,0,0,0,0,0,0,0,0,0xff,0xe0};memcpy(j+2,&fn,8);memcpy((void *)at,j,12);}
int main(int argc,char **argv){
 if(argc!=2)return 2;
 FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *mem=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);if(mem==MAP_FAILED||fread(mem,1,0xd22000,file)!=0xd22000)return 4;fclose(file);
 hook(0x100213dd0UL,distance_get);hook(0x100aa2bcaUL,sine_get);
 typedef uint8_t (*Fn)(void *,const float *,float *,float *,unsigned);Fn fn=(Fn)0x1002149c0UL;
 uint32_t cases;readin(&cases,4);readin(noise,sizeof(noise));fwrite(&cases,4,1,stdout);*(uint8_t *)0x100212784UL=0xc3;
 for(unsigned i=0;i<cases;i++){
  float inputs[9];uint32_t resolution,enabled;readin(inputs,36);readin(&resolution,4);readin(&enabled,4);readin(samples,28);
  memset(barn,0,sizeof(barn));memcpy(position,inputs,12);position[3]=1;memcpy(barn+0x40dd0,inputs+3,4);memcpy(barn+0x40d74,inputs+4,4);memcpy((void *)0x100c95814UL,inputs+5,4);*(uint8_t *)0x100c95810UL=enabled;memcpy(barn+0x2c0,&resolution,4);memcpy(barn+0x40d80,inputs+6,12);memcpy(barn+0x358,noise,sizeof(noise));
  sine_used=sample_used=0;memset(sample_positions,0,sizeof(sample_positions));float distance;uint32_t available=fn(barn,position,&distance,normal,1);
  fwrite(&available,4,1,stdout);fwrite(&distance,4,1,stdout);fwrite(normal,4,4,stdout);fwrite(&sample_used,4,1,stdout);fwrite(sines,4,3,stdout);fwrite(sample_positions,16,7,stdout);unsigned char scratch[128]={0};memcpy(scratch+64-0x2c,&distance,4);native_tweaks(barn,scratch+64);fwrite(barn+0x40db0,16,1,stdout);
 }
 return 0;
}
