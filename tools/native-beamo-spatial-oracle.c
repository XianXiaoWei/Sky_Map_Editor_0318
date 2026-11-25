#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t *storage=(void *)0x360000000UL;
static uint64_t traces[16][24];static uint32_t calls,line,severity;static jmp_buf escape;
extern void segment(void *context,uint64_t offset);
__asm__(".text\n.global segment\nsegment:\n"
 "push %rbp\npush %rbx\npush %r12\npush %r13\npush %r14\npush %r15\nsub $16,%rsp\n"
 "mov %rdi,%rbx\nmov %rsi,%r13\nmov 0x20(%rbx),%r14\nlea 0x18(%r14,%r13),%r14\nlea 0x90(%rbx),%r15\n"
 "movabs $0x10019579b,%r11\ncall *%r11\n"
 "add $16,%rsp\npop %r15\npop %r14\npop %r13\npop %r12\npop %rbx\npop %rbp\nret\n");
static void rd(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void *p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static uint32_t u(uint8_t *p){uint32_t n;memcpy(&n,p,4);return n;}static uint64_t q(uint8_t *p){uint64_t n;memcpy(&n,p,8);return n;}
static void p32(uint8_t *p,uint32_t n){memcpy(p,&n,4);}static void p64(uint8_t *p,uint64_t n){memcpy(p,&n,8);}
static uint64_t *trace(uint32_t kind){if(calls>=16)exit(12);uint64_t *t=traces[calls++];t[0]=kind;return t;}
static void transform(void *out,uint8_t *object){uint64_t *t=trace(1);t[1]=(uintptr_t)out;t[2]=(uintptr_t)object;t[3]=q(object);((void *(*)(void *,void *))0x1001985b0UL)(out,object);
 uint32_t flags=u(storage+0x3d00);if(flags&1)p64(storage+0x3020,(uintptr_t)storage+0x400);if(flags&2)p64(storage+0x3008,0);if(flags&4)p64(storage+0x3008,(uintptr_t)storage+0x1200);if(flags&8)p32(storage+0x1804,0x44400000);if(flags&16)p32(storage+0x30cc,0x3f800000);
}
static float power(float x,float y){uint64_t *t=trace(2);uint32_t xb,yb,rb;memcpy(&xb,&x,4);memcpy(&yb,&y,4);float result=powf(x,y);memcpy(&rb,&result,4);t[1]=xb;t[2]=yb;t[3]=rb;return result;}
static float scale(uint8_t *object){uint64_t *t=trace(3);t[1]=(uintptr_t)object;t[2]=q(object);uint32_t flags=u(storage+0x3d00);if(flags&32)p64(storage+0x3020,(uintptr_t)storage+0x400);if(flags&64){uint8_t *r=(void *)(uintptr_t)q(storage+0x3020);p64(r+q(storage+0x3d08)+0xd8,(uintptr_t)storage+0x2600);}float result;memcpy(&result,object+0xb0,4);t[3]=u(object+0xb0);return result;}
static void *register_collision(void *owner,uint32_t id,void *matrix,uint8_t *descriptor,uint8_t *callback){uint64_t *t=trace(4);t[1]=(uintptr_t)owner;t[2]=id;t[3]=(uintptr_t)matrix;t[4]=(uintptr_t)descriptor;t[5]=(uintptr_t)callback;memcpy(t+6,descriptor,56);memcpy(t+13,callback,16);memcpy(t+15,matrix,64);uint32_t flags=u(storage+0x3d00);if(flags&128)p64(storage+0x3020,(uintptr_t)storage+0x400);if(flags&256)p32(descriptor+0x34,0x43210000);return(void *)(uintptr_t)q(storage+0x3d10);}
static void assertion(const char *expr,const char *file,uint32_t l,uint32_t s,...){(void)expr;(void)file;line=l;severity=s;longjmp(escape,1);}
static void done(void){}
static void hook(uintptr_t p,void *fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void *)p,b,14);}
static void map(void *p,size_t n){if(mmap(p,n,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)exit(5);}
int main(int argc,char **argv){if(argc!=2)return 2;FILE *f=fopen(argv[1],"rb");if(!f)return 3;map((void *)0x100000000UL,0x2400000);if(fread((void *)0x100000000UL,1,0xd22000,f)!=0xd22000)return 4;fclose(f);map(storage,0x4000);
 hook(0x100195bc5UL,done);hook(0x100197ab0UL,transform);hook(0x1001987d0UL,scale);hook(0x100aa2a2cUL,power);hook(0x100778fd0UL,register_collision);hook(0x1007e5f70UL,assertion);
 if(mprotect((void *)0x100000000UL,0xc05000,5))return 6;uint32_t cases;rd(&cases,4);wr(&cases,4);while(cases--){rd(storage,0x4000);calls=line=severity=0;memset(traces,0,sizeof traces);if(!setjmp(escape))segment(storage+0x3000,q(storage+0x3d08));uint32_t h[3]={line,severity,calls};wr(h,12);wr(traces,calls*192);wr(storage,0x4000);}return 0;
}
