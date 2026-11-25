#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>
static _Alignas(32) uint8_t camera[1024],game[0x300],avatar[0x60],state[0x80];
static _Alignas(32) float forward[4];
static uint8_t available(void *p){(void)p;return 1;}
static void *local(void *p){(void)p;return avatar;}
static void direction(float *out,void *p){(void)p;memcpy(out,forward,16);}
static float arctan(float y,float x){return atan2f(y,x);}
static float arcsine(float v){return asinf(v);}
static void hook(uintptr_t at,void *fn){uint8_t j[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(j+6,&fn,8);memcpy((void *)at,j,14);}
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *mem=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);if(mem==MAP_FAILED||fread(mem,1,0xd22000,file)!=0xd22000)return 4;fclose(file);
 hook(0x1000fe060UL,available);hook(0x1000fc260UL,local);hook(0x100147510UL,direction);hook(0x100aa25a0UL,arctan);hook(0x100aa2588UL,arcsine);
 memcpy(avatar+0x18,&(void *){state},8);memcpy(game+0x70,&(void *){state},8);uint32_t count;if(fread(&count,4,1,stdin)!=1)return 5;fwrite(&count,4,1,stdout);
 while(count--){if(fread(state+0x10,16,1,stdin)!=1||fread(forward,16,1,stdin)!=1)return 5;memset(camera,0x5a,sizeof(camera));((void (*)(void *,void *))0x10073aa90UL)(camera,game);fwrite(camera+0x270,4,4,stdout);fwrite(camera+0x260,4,4,stdout);fwrite(camera+0x60,4,4,stdout);}
 return 0;
}
