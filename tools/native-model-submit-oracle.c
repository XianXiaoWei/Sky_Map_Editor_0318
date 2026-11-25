/* Original Model render submit and LevelMesh enable forwarding. */
#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
static uint8_t *memory=(void*)0x300000000UL;static uint32_t queues[8],count;
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void queue(void*render){if(count==8)exit(12);queues[count++]=(uint32_t)((uint8_t*)render-memory);}
static void hook(uintptr_t at,void*fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static void map(void*p,size_t n){if(mmap(p,n,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)exit(5);}
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;map((void*)0x100000000UL,0x2400000);if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 4;fclose(f);map(memory,8192);hook(0x1007f6540UL,queue);*(uint8_t*)0x102007598UL=0;if(mprotect((void*)0x100000000UL,0xc05000,5))return 6;
 uint32_t cases;rd(&cases,4);wr(&cases,4);while(cases--){uint32_t actions[16][2],n;rd(&n,4);if(n>16)return 7;rd(actions,n*8);rd(memory,8192);
 for(uint32_t i=0;i<n;i++){count=0;uint32_t op=actions[i][0],value=actions[i][1];if(op==0)((void(*)(void*))0x10046b780UL)(memory);else if(op==1)((void(*)(void*,uint32_t))0x1003ffe50UL)(memory+0x1000,value);else if(op==2)memory[0x227]=value;else if(op==3)((void(*)(void*,void*))0x1003ffe10UL)(memory+0x1000,memory+0x1900);else return 8;wr(&count,4);wr(queues,count*4);wr(memory,8192);}
 }return 0;}
