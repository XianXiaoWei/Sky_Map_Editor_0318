#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
static uint8_t *storage=(void *)0x350000000UL;
static uint64_t traces[4096][24];static uint32_t calls,uploads;
extern void segment(void *context,void *barn);
__asm__(".text\n.global segment\nsegment:\n"
 "push %rbp\npush %rbx\npush %r12\npush %r13\npush %r14\npush %r15\nsub $16,%rsp\n"
 "mov %rdi,%rbx\nmov %rsi,%r12\nlea 0x500(%rbx),%rbp\nmov 0x20018(%r12),%eax\n"
 "movabs $0x100195be7,%r11\ncall *%r11\n"
 "add $16,%rsp\npop %r15\npop %r14\npop %r13\npop %r12\npop %rbx\npop %rbp\nret\n");
static void rd(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void *p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static uint32_t u(uint8_t *p){uint32_t n;memcpy(&n,p,4);return n;}static uint64_t q(uint8_t *p){uint64_t n;memcpy(&n,p,8);return n;}
static void p32(uint8_t *p,uint32_t n){memcpy(p,&n,4);}static void p64(uint8_t *p,uint64_t n){memcpy(p,&n,8);}
static uint64_t *trace(uint32_t kind){if(calls>=4096)exit(12);uint64_t *t=traces[calls++];t[0]=kind;return t;}
static void create(void *a,const char *name,uint32_t count){if(strcmp(name,"Beamos"))exit(13);uint64_t *t=trace(1);t[1]=(uintptr_t)a;t[2]=count;}
static void stream(void *a,uint32_t slot,uint32_t *formats,uint32_t *attrs,uint32_t count,uint32_t usage,uint32_t extra,void *pointer){uint64_t *t=trace(2);t[1]=(uintptr_t)a;t[2]=slot;t[3]=count;t[4]=usage;t[5]=extra;t[6]=(uintptr_t)pointer;for(int i=0;i<8;i++){t[7+i]=formats[i];t[15+i]=attrs[i];}}
static void index_config(void *a,uint32_t slot,uint32_t format,uint32_t usage,uint32_t count,uint32_t extra){uint64_t *t=trace(3);t[1]=(uintptr_t)a;t[2]=slot;t[3]=format;t[4]=usage;t[5]=count;t[6]=extra;}
static void *map_buffer(void *a){void *p=storage+((uint8_t *)a==storage+0x6c980?0x2a0000:0x2b0000);uint64_t *t=trace(4);t[1]=(uintptr_t)a;t[2]=(uintptr_t)p;return p;}
typedef struct {uint32_t vertices,primary,secondary,alpha;} Counts;
static Counts upload(uint8_t *record,void *bake,void *volume,uint32_t lod,uint32_t *offsets,void *vertices,void *indices){uint64_t *t=trace(5);t[1]=(uintptr_t)record;t[2]=(uintptr_t)bake;t[3]=(uintptr_t)volume;t[4]=lod;t[5]=(uintptr_t)offsets;t[6]=(uintptr_t)vertices;t[7]=(uintptr_t)indices;for(int i=0;i<4;i++)t[8+i]=offsets[i];uint8_t *mesh=(void *)(uintptr_t)q(record+0x18);Counts out;memcpy(&out,mesh+0x360+lod*16,16);
 if(u(storage+0x2e060c))for(int i=0;i<4;i++)offsets[i]=0x11111111+i;
 if(uploads++==0){uint32_t count=u(storage+0x2e0600),lc=u(storage+0x2e0604);if(count!=0xffffffff)p32(storage+0x20018,count);if(lc!=0xffffffff)p32(mesh+0x40,lc);if(u(storage+0x2e0608))p64(storage+0x20020,(uintptr_t)storage+0x100000);}return out;
}
static void unmap(void *a){trace(6)[1]=(uintptr_t)a;}static void finish(void *a){trace(7)[1]=(uintptr_t)a;}
static void done(void){}
static void hook(uintptr_t p,void *fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void *)p,b,14);}
static void map(void *p,size_t n){if(mmap(p,n,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)exit(5);}
int main(int argc,char **argv){if(argc!=2)return 2;FILE *f=fopen(argv[1],"rb");if(!f)return 3;map((void *)0x100000000UL,0x2400000);if(fread((void *)0x100000000UL,1,0xd22000,f)!=0xd22000)return 4;fclose(f);map(storage,0x300000);
 hook(0x100195f45UL,done);hook(0x1007f53c0UL,create);hook(0x1007f5430UL,stream);hook(0x1007f55d0UL,index_config);hook(0x1007950d0UL,map_buffer);hook(0x100197ab0UL,upload);hook(0x100795120UL,unmap);hook(0x1007f5690UL,finish);
 if(mprotect((void *)0x100000000UL,0xc05000,5))return 6;uint32_t cases;rd(&cases,4);wr(&cases,4);while(cases--){rd(storage,0x300000);calls=uploads=0;memset(traces,0,sizeof traces);segment(storage+0x2e0000,storage);wr(&calls,4);wr(traces,calls*192);wr(storage,0x2e0000);wr(storage+0x2e0040,16);wr(storage+0x2e0600,16);}return 0;
}
