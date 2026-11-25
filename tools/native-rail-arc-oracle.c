#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <xmmintrin.h>
#include <sys/mman.h>
static void hook(uintptr_t at,void *fn){uint8_t j[]={0x48,0xb8,0,0,0,0,0,0,0,0,0xff,0xe0};memcpy(j+2,&fn,8);memcpy((void *)at,j,12);}
static void readin(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void ptr(void *p,size_t at,const void *v){memcpy((char *)p+at,&v,8);}
static float normalize(float d,float length,unsigned looped){
 if(looped){d=fmodf(d,length);if(d<0)d+=length;return d;}
 return _mm_cvtss_f32(_mm_min_ss(_mm_set_ss(length),_mm_max_ss(_mm_setzero_ps(),_mm_set_ss(d))));
}
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *mem=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
 if(mem==MAP_FAILED||fread(mem,1,0xd22000,file)!=0xd22000)return 4;fclose(file);
 hook(0x100aa2744UL,fmodf);static uint64_t guard=0x318f01;ptr((void *)0x100c0d8d8UL,0,&guard);
 uint32_t count;readin(&count,4);fwrite(&count,4,1,stdout);
 for(unsigned i=0;i<count;i++){
  _Alignas(32) unsigned char rail[0x110]={0};_Alignas(32) float positions[256][4],table[4096][2];
  uint32_t h[4],mode,skipped=0;float v[5],result[5];readin(h,16);readin(v,20);
  unsigned n=h[0],size=h[2];if(n<2||n>256||size<2||size>4096)return 6;
  memcpy(rail+0x28,h,4);rail[0x2c]=h[1]!=0;memcpy(rail+0x14,h+2,4);
  readin(positions,n*16);ptr(rail,0x90,positions);ptr(rail,8,table);
  fprintf(stderr,"case %u build\n",i);((void (*)(void *,unsigned))0x10055b560UL)(rail,h[3]);
  fwrite(table,8,size,stdout);fwrite(rail+0x18,4,1,stdout);
  result[0]=((float (*)(void *,unsigned,unsigned,unsigned,float,float))0x10055c6a0UL)(positions,n,h[3],h[1],v[0],v[1]);
  result[1]=((float (*)(void *,float))0x10055d410UL)(rail,v[2]);
  float length;memcpy(&length,rail+0x18,4);
  fprintf(stderr,"case %u distance\n",i);
  if(normalize(v[3],length,h[1])>table[size-1][1]){skipped|=1;result[2]=0;}
  else result[2]=((float (*)(void *,float))0x10055d4e0UL)(rail,v[3]);
  readin(&mode,4);rail[0x1c]=mode!=0;memcpy(rail+0x18,v+4,4);
  float d=normalize(v[3],v[4],h[1]);
  _Alignas(32) unsigned char preview[0x110];_Alignas(32) float preview_table[4096][2];
  memcpy(preview,rail,sizeof rail);memcpy(preview_table,table,size*8);ptr(preview,8,preview_table);
  if(mode)((void (*)(void *,unsigned))0x10055b560UL)(preview,16);
  fprintf(stderr,"case %u dirty distance\n",i);
  if(d>preview_table[size-1][1]){
   skipped|=2;result[3]=0;
   if(mode)((void (*)(void *,unsigned))0x10055b560UL)(rail,16);
   fprintf(stderr,"case %u excluded dirty endpoint: normalized=%a final=%a\n",i,(double)d,(double)preview_table[size-1][1]);
  }else result[3]=((float (*)(void *,float))0x10055d4e0UL)(rail,v[3]);
  rail[0x1c]=mode!=0;memcpy(rail+0x18,v+4,4);
  result[4]=((float (*)(void *,float))0x10055d410UL)(rail,v[2]);
  fwrite(result,4,5,stdout);fwrite(table,8,size,stdout);fwrite(rail+0x10,4,1,stdout);fwrite(rail+0x18,4,1,stdout);uint32_t dirty=rail[0x1c];fwrite(&dirty,4,1,stdout);fwrite(&skipped,4,1,stdout);
 }
 return 0;
}
