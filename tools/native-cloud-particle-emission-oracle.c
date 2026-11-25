#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>
static _Alignas(32) unsigned char barn[0xc830];
static _Alignas(32) float position[4],velocity[4],normal[4];
static uint64_t guard=0x318;
static uint32_t randoms[16],random_used,pow_used,available;
static float powers[2],distance;
static void readin(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void hook(uintptr_t at,void *fn){uint8_t j[]={0x48,0xb8,0,0,0,0,0,0,0,0,0xff,0xe0};memcpy(j+2,&fn,8);memcpy((void *)at,j,12);}
static int random_get(void){if(random_used>=16)exit(11);return randoms[random_used++];}
static float power_get(float b,float e){if(pow_used>=2)exit(12);float r=powf(b,e);powers[pow_used++]=r;return r;}
static unsigned char distance_get(void *owner,void *pos,float *out,void *n,unsigned lod){(void)owner;(void)pos;(void)lod;*out=distance;memcpy(n,normal,16);return available;}
int main(int argc,char **argv){
 if(argc!=2)return 2;
 FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *mem=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);if(mem==MAP_FAILED||fread(mem,1,0xd22000,file)!=0xd22000)return 4;fclose(file);
 hook(0x100aa2b22UL,random_get);hook(0x100aa2a2cUL,power_get);hook(0x1002149c0UL,distance_get);
 *(void **)0x100c0d8d8UL=&guard;
 uint32_t cases;readin(&cases,4);fwrite(&cases,4,1,stdout);
 for(unsigned i=0;i<cases;i++){
  uint32_t kind;float scalars[4];readin(&kind,4);readin(barn,sizeof(barn));readin(position,16);readin(velocity,16);readin(scalars,16);distance=scalars[2];readin(&available,4);readin(randoms,sizeof(randoms));random_used=pow_used=0;memset(powers,0,sizeof(powers));
  if(kind==0){
   _Alignas(32) unsigned char source[48]={0};memcpy(source,position,16);memcpy(source+16,velocity,16);memcpy(source+32,scalars,8);
   ((void (*)(void *,void *))0x100228a30UL)(barn,source);
  }else if(kind==1){
   ((void (*)(void *,void *,void *,void *,void *,float))0x1001a1670UL)(&scalars[1],position,velocity,NULL,barn,scalars[0]);
  }else if(kind==2){
   ((void (*)(void *,void *,void *,void *,void *,float,float))0x1001a1140UL)(&scalars[1],position,velocity,NULL,barn,scalars[0],scalars[3]);
  }else if(kind==3){((void (*)(void *))0x100225e90UL)(barn);}
  else if(kind==4){memcpy(normal,randoms,16);((void (*)(void *,void *,void *,void *,float))0x1002289b0UL)(barn,position,velocity,normal,scalars[0]);}
  else return 5;
  fwrite(&random_used,4,1,stdout);fwrite(&pow_used,4,1,stdout);fwrite(powers,4,2,stdout);fwrite(scalars+1,4,1,stdout);fwrite(barn,sizeof(barn),1,stdout);
 }
 return 0;
}
