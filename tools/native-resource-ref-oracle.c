/* All four ResourceRef/Observe bodies run at original addresses unchanged.
 * Only Resource virtual callbacks are supplied ABI services. */
#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
static uint8_t *memory=(void *)0x2b0000000UL;
static uint32_t selected_slot,mutation,mutated,log_count,logs[128][7];static uint8_t states[64][4096];
static void rd(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void *p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static uintptr_t u64(void *p){uintptr_t n;memcpy(&n,p,8);return n;}static void ptr(void *p,uintptr_t n){memcpy(p,&n,8);}static uint32_t code(uintptr_t p){return p?(uint32_t)(p-(uintptr_t)memory):0xffffffff;}
static void callback(uint32_t slot,uint8_t *resource,uint8_t *ref){if(log_count==128)exit(12);uint32_t row[]={slot,code((uintptr_t)resource),code((uintptr_t)ref),code(u64(ref)),code(u64(ref+8)),code(u64(ref+16)),ref[24]};memcpy(logs[log_count++],row,28);if(mutated||slot!=selected_slot)return;mutated=1;uint32_t index=(ref-memory-0x800)/32;uint8_t *other=memory+0x800+((index+1)%8)*32;
 if(mutation==1)((void (*)(void *))0x1007c2600UL)(ref);
 else if(mutation==2)((void (*)(void *))0x1007c2600UL)(other);
 else if(mutation==3)ptr(resource+80,0);
 else if(mutation==4)((void (*)(void *,void *))0x1007c2310UL)(memory+0x500,memory+0x860);
 else if(mutation==5)ref[24]=0xfe;
}
static void removed(uint8_t *resource,uint8_t *ref){callback(0x30,resource,ref);}static void added(uint8_t *resource,uint8_t *ref){callback(0x38,resource,ref);}static void replaced(uint8_t *resource,uint8_t *ref){callback(0x40,resource,ref);}
static void hook(uintptr_t at,void *fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void *)at,b,14);}static void map(void *p,size_t n){if(mmap(p,n,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)exit(5);}
int main(int argc,char **argv){if(argc!=2)return 2;FILE *f=fopen(argv[1],"rb");if(!f)return 3;map((void *)0x100000000UL,0x2400000);if(fread((void *)0x100000000UL,1,0xd22000,f)!=0xd22000)return 4;fclose(f);map(memory,4096);map(memory+0x10000,8192);
 ptr(memory+0x10030,(uintptr_t)(memory+0x11000));ptr(memory+0x10038,(uintptr_t)(memory+0x11020));ptr(memory+0x10040,(uintptr_t)(memory+0x11040));hook((uintptr_t)(memory+0x11000),removed);hook((uintptr_t)(memory+0x11020),added);hook((uintptr_t)(memory+0x11040),replaced);
 if(mprotect((void *)0x100000000UL,0xc05000,5)||mprotect(memory+0x11000,4096,5))return 6;uint32_t count;rd(&count,4);wr(&count,4);while(count--){uint32_t h[4],actions[64][3];rd(h,16);if(h[0]>64)return 7;rd(memory,4096);rd(actions,h[0]*12);selected_slot=h[1];mutation=h[2];mutated=log_count=0;for(uint32_t i=0;i<4;i++)if(h[3]&(1<<i))ptr(memory+0x250+i*256,0);
  for(uint32_t i=0;i<h[0];i++){uint8_t *ref=memory+0x800+actions[i][1]*32;if(actions[i][0]==0)((void (*)(void *))0x1007c2530UL)(ref);else if(actions[i][0]==1)((void (*)(void *,void *))0x1007c2310UL)(memory+0x200+actions[i][2]*256,ref);else if(actions[i][0]==2)((void (*)(void *))0x1007c2570UL)(ref);else if(actions[i][0]==3)((void (*)(void *))0x1007c2600UL)(ref);else return 8;memcpy(states[i],memory,4096);}
  wr(&log_count,4);wr(logs,log_count*28);wr(&h[0],4);wr(states,h[0]*4096);
 }return 0;}
