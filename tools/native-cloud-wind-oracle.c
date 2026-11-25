#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
static _Alignas(32) unsigned char barn[0x41000],time[256];static _Alignas(32) float wind[4],eye[4];
static void camera_get(void *out,void *camera){memcpy(out,camera,16);}
static void wind_get(void *out,void *environment,void *position){(void)environment;(void)position;memcpy(out,wind,16);}
static void distance_get(void *owner,void *pos,float *distance,void *normal,unsigned lod){(void)owner;(void)pos;(void)lod;*distance=0;memset(normal,0,16);}
static void hook(uintptr_t at,void *fn){uint8_t j[]={0x48,0xb8,0,0,0,0,0,0,0,0,0xff,0xe0};memcpy(j+2,&fn,8);memcpy((void *)at,j,12);}
static void readin(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
int main(int argc,char **argv){
 if(argc!=2)return 2;
 FILE *file=fopen(argv[1],"rb");if(!file)return 3;void *mem=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);if(mem==MAP_FAILED||fread(mem,1,0xd22000,file)!=0xd22000)return 4;fclose(file);
 hook(0x10076be90UL,camera_get);hook(0x100328200UL,wind_get);hook(0x1002149c0UL,distance_get);
 uint32_t count;readin(&count,4);fwrite(&count,4,1,stdout);
 for(unsigned i=0;i<count;i++){float input[6];unsigned enabled;readin(input,24);readin(&enabled,4);readin(wind,16);memset(barn,0,sizeof(barn));memset(time,0,sizeof(time));readin(barn+0x40d90,16);readin(barn+0x40d80,16);
  *(unsigned char *)0x100c95810UL=enabled;*(unsigned char *)0x101ffb0d0UL=input[3]!=0;memcpy((void *)0x100cb8540UL,input+4,4);memcpy((void *)0x100c95824UL,input+5,4);
  unsigned blocks=1;memcpy(barn+0x2c0,&blocks,4);memcpy(time+0x14,input,4);memcpy(time+0x20,input+1,4);memcpy(time+0x24,input+2,4);
  ((void (*)(void *,void *,void *,void *,void *))0x100212510UL)(barn,eye,NULL,time,NULL);
  fwrite(barn+0x40d90,16,1,stdout);fwrite(barn+0x40d80,16,1,stdout);fwrite(barn+0x40dd0,4,1,stdout);
 }
 return 0;
}
