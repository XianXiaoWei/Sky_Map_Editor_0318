#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
static unsigned char *a=(void*)0x440000000UL;
static float scratch[512],matrix[16]={1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1};
static void read_bytes(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void write_bytes(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){unsigned char b[14]={0xff,0x25};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static void *root(void*p){(void)p;return a+0x5000;}
static void *world_matrix(void*out,void*p){(void)p;memcpy(out,matrix,64);return out;}
static void *position(void*out,void*p){memcpy(out,(unsigned char*)p+0xb0,16);return out;}
static void *forward(void*out,void*p){(void)p;float v[]={0,1,0,0};memcpy(out,v,16);return out;}
static void *heap(void){return a;}
static void *allocate(void*h,size_t n,void*tag,uint32_t align){(void)h;(void)tag;(void)align;if(n>sizeof scratch)exit(12);memset(scratch,0,sizeof scratch);return scratch;}
static void release(void*h,void*p){(void)h;(void)p;}
static void aim(void*p,void*target,void*direction,float weight){(void)p;(void)target;(void)direction;(void)weight;}
int main(int argc,char**argv){
 if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);
 if(mmap(a,0x10000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 hook(0x100098b20UL,root);hook(0x1007f26e0UL,world_matrix);hook(0x1007f26b0UL,position);hook(0x1007f3b70UL,forward);
 hook(0x1007c6c20UL,heap);hook(0x100795530UL,allocate);hook(0x100795a70UL,release);hook(0x1007f3180UL,aim);
 hook(0x100aa28f4UL,memmove);
 uint32_t cases;read_bytes(&cases,4);write_bytes(&cases,4);
 while(cases--){
  uint32_t count,steps;read_bytes(&count,4);read_bytes(&steps,4);if(count<2||count>128)return 7;
  memset(a,0,0x10000);a[0]=1;memcpy(a+0x10,&count,4);
  void*p=a+0x1000;memcpy(a+8,&p,8);p=a+0x3000;memcpy(a+0x18,&p,8);p=a+0x3800;memcpy(a+0x20,&p,8);p=a+0x6000;memcpy(a+0x40,&p,8);
  float scale[]={1,1,1,0};memcpy(a+0x30,scale,16);
  float total=0;
  for(uint32_t i=0;i<count;i++){read_bytes(a+0x1000+i*0x30,16);read_bytes(a+0x1020+i*0x30,4);float length;memcpy(&length,a+0x1020+i*0x30,4);total+=length;p=a+0x7000+i*0x100;memcpy(a+0x1028+i*0x30,&p,8);float local[]={0,1,0,0};memcpy(p,local,16);}
  memcpy(a+0x28,&total,4);
  read_bytes(a+0x3000,2048);read_bytes(a+0x3800,2048);
  for(uint32_t step=0;step<steps;step++){
   read_bytes(a+0x70b0,16);
   ((void(*)(void*,void*,uint8_t))0x10034d360UL)(a,a+0x6000,1);
   for(uint32_t i=0;i<count;i++)write_bytes(a+0x1000+i*0x30,12);
   write_bytes(a+0x3000,2048);write_bytes(a+0x3800,2048);
  }
 }
 return 0;
}
