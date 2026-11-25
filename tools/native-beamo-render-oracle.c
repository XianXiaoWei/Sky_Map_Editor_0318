#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t *storage=(void *)0x3a0000000UL;static uint64_t traces[16384][32];static uint32_t calls,line,severity,observed,vectors,textures;static jmp_buf escape;
extern void segment(void *context,uint32_t materials,void *barn);
__asm__(".text\n.global segment\nsegment:\n"
 "push %rbp\npush %rbx\npush %r12\npush %r13\npush %r14\npush %r15\nsub $16,%rsp\n"
 "mov %rdi,%rbx\nmov %esi,%r12d\nmov %rdx,%r13\nmovabs $0x100196094,%r11\ncall *%r11\n"
 "add $16,%rsp\npop %r15\npop %r14\npop %r13\npop %r12\npop %rbx\npop %rbp\nret\n");
static void rd(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void *p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static uint32_t u(const void *p){uint32_t n;memcpy(&n,p,4);return n;}static uint64_t q(const void *p){uint64_t n;memcpy(&n,p,8);return n;}static void p32(void *p,uint32_t n){memcpy(p,&n,4);}static void p64(void *p,uint64_t n){memcpy(p,&n,8);}
static uint64_t *trace(uint32_t kind){if(calls>=16384)exit(12);uint64_t *t=traces[calls++];t[0]=kind;return t;}
static char *copy_string(char *out,const char *input,size_t n){uint64_t *t=trace(1);t[1]=(uintptr_t)out;t[2]=(uintptr_t)input;t[3]=n;return strncpy(out,input,n);}
static size_t length(const char *input){size_t n=strlen(input);uint64_t *t=trace(2);t[1]=(uintptr_t)input;t[2]=n;return n;}
static void *shader_type(void){trace(3);return storage+0x1f0100;}static void *image_type(void){trace(4);return storage+0x1f0200;}
static void *lookup(void *manager,void *type,const char *name){uint32_t kind=type==storage+0x1f0100?0:1;void *found=0;for(uint32_t i=0;i<u(storage+0x1f0000);i++){uint8_t *r=storage+0x160000+i*24;if(u(r)==kind&&!strcmp(name,(void *)(uintptr_t)q(r+16))){found=(void *)(uintptr_t)q(r+8);break;}}uint64_t *t=trace(5);t[1]=(uintptr_t)manager;t[2]=(uintptr_t)type;t[3]=(uintptr_t)name;t[4]=(uintptr_t)found;return found;}
static void callback(uint32_t slot,uint8_t *resource,uint8_t *ref){uint64_t *t=trace(6);t[1]=slot;t[2]=(uintptr_t)resource;t[3]=(uintptr_t)ref;t[4]=q(ref);t[5]=q(ref+8);t[6]=q(ref+16);t[7]=ref[24];uint32_t flags=u(storage+0xc0608);if(slot==0x38){if(observed++==0){if((flags&1)&&u(storage+0xc060c)!=0xffffffff)p32(storage+0xb8f30,u(storage+0xc060c));if(flags&2)p64(storage+0xc0018,(uintptr_t)storage+0x1b0000);}if((flags&4)&&ref==storage+0xc0090)((void(*)(void *))0x1007c2600UL)(ref);}}
static void removed(void *r,void *f){callback(0x30,r,f);}static void added(void *r,void *f){callback(0x38,r,f);}static void replaced(void *r,void *f){callback(0x40,r,f);}
static void register_list(void *list,uint8_t *render){uint64_t *t=trace(7);t[1]=(uintptr_t)list;t[2]=(uintptr_t)render;if(u(storage+0xc0608)&64)p64(render+0x500,(uintptr_t)list+0xe8);}
static uint8_t find_context(void *list,void **format,void **context,uint32_t unused){(void)unused;uint64_t *t=trace(8);t[1]=(uintptr_t)list;memcpy(t+2,*format,32);*context=storage+0x1f3000;*format=storage+0x1f3100;return u(storage+0xc0614);}
static void *graphics(void){trace(9);return storage+0x1f1000;}
static uint32_t create_program(void *g,void *definition){uint32_t result=u(storage+0xc0618);uint64_t *t=trace(10);t[1]=(uintptr_t)g;t[2]=(uintptr_t)definition;t[3]=u(definition);t[4]=result;return result;}
static void parameters(void *out,uint32_t program){uint64_t *t=trace(11);t[1]=(uintptr_t)out;t[2]=program;p32(out,program);}
static void bind_data(uint8_t *out,void *data,uint32_t count,uint32_t offset){uint64_t *t=trace(12);t[1]=(uintptr_t)out;t[2]=(uintptr_t)data;t[3]=count;t[4]=offset;p64(out+8,(uintptr_t)data);}
static void *copy_bytes(void *out,void *input,size_t count){uint64_t *t=trace(13);t[1]=(uintptr_t)out;t[2]=(uintptr_t)input;t[3]=count;return memcpy(out,input,count);}
static void count_mutation(void){uint32_t count=u(storage+0xc0610);if(count!=0xffffffff)p32((void *)(uintptr_t)(q(storage+0xc0008)+0x98),count);}
static void vector(uint8_t *out,void *name,void *input){uint64_t *t=trace(14);t[1]=(uintptr_t)out;t[2]=(uintptr_t)name;t[3]=(uintptr_t)input;t[4]=q(input);t[5]=q((uint8_t *)input+8);memcpy(out+0x20,input,16);if(vectors++==0&&(u(storage+0xc0608)&8))count_mutation();}
static void texture(uint8_t *out,void *name,void *image,void *sampler){uint64_t *t=trace(15);t[1]=(uintptr_t)out;t[2]=(uintptr_t)name;t[3]=(uintptr_t)image;t[4]=(uintptr_t)sampler;p64(out+0x40,(uintptr_t)image);if(textures++==0&&(u(storage+0xc0608)&16))count_mutation();}
static void request(void *manager,void *type,const char *name){uint64_t *t=trace(16);t[1]=(uintptr_t)manager;t[2]=(uintptr_t)type;t[3]=(uintptr_t)name;if(u(storage+0xc0608)&128){for(uint32_t i=0;i<u(storage+0x1f0000);i++){uint8_t *r=storage+0x160000+i*24;if(u(r)==1){((void(*)(void *,void *))0x1007c2310UL)((void *)(uintptr_t)q(r+8),storage+0xc0090);break;}}}}
static void assertion(const char *expr,const char *file,uint32_t l,uint32_t s,...){(void)expr;(void)file;line=l;severity=s;longjmp(escape,1);}static void done(void){}
static void hook(uintptr_t p,void *fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void *)p,b,14);}
static void map(void *p,size_t n){if(mmap(p,n,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)exit(5);}
int main(int argc,char **argv){if(argc!=2)return 2;FILE *f=fopen(argv[1],"rb");if(!f)return 3;map((void *)0x100000000UL,0x2400000);if(fread((void *)0x100000000UL,1,0xd22000,f)!=0xd22000)return 4;fclose(f);map(storage,0x300000);
 hook(0x100196447UL,done);hook(0x100aa2c90UL,copy_string);hook(0x100aa2c7eUL,length);hook(0x100aa2c4eUL,strcmp);hook(0x1007d1100UL,shader_type);hook(0x10079ac90UL,image_type);hook(0x1007c4360UL,lookup);hook(0x1007c4640UL,request);hook(0x100198510UL,removed);hook(0x100198690UL,added);hook(0x100198730UL,replaced);hook(0x1007b97b0UL,register_list);hook(0x1007ba080UL,find_context);hook(0x1007c1470UL,graphics);hook(0x1001973a0UL,create_program);hook(0x1007bfd80UL,parameters);hook(0x1007bdfd0UL,bind_data);hook(0x100aa28f4UL,copy_bytes);hook(0x1007be690UL,vector);hook(0x1007be8b0UL,texture);hook(0x1007e5f70UL,assertion);hook(0x1007e6030UL,assertion);if(mprotect((void *)0x100000000UL,0xc05000,5))return 6;
 uint32_t cases;rd(&cases,4);wr(&cases,4);while(cases--){rd(storage,0x300000);calls=line=severity=observed=vectors=textures=0;memset(traces,0,sizeof traces);uint64_t result=0;if(!setjmp(escape)){uint32_t mode=u(storage+0xc0600);if(mode==0)segment(storage+0xc0000,u(storage+0xc0604),storage);else if(mode==1)((void(*)(void *,void *,void *,void *,uint32_t))0x1007f5e90UL)(storage+0x6cc70,storage+0x6c838,storage+0xd0100,(void *)(uintptr_t)q(storage+0xc0620),u(storage+0xc061c));else if(mode==2)((void(*)(void *,void *,void *,void *,void *,uint32_t))0x1007f5fb0UL)(storage+0x6cc70,storage+0x6c838,storage+0xd0100,storage+0x1f3100,storage+0x1f3000,u(storage+0xc061c));else if(mode==3)result=(uintptr_t)((void *(*)(void *,void *))0x10017e8d0UL)(storage+0x1d0000,(void *)(uintptr_t)q(storage+0xc0628));else return 7;}
 uint32_t h[3]={line,severity,calls};wr(h,12);wr(&result,8);wr(traces,calls*256);wr(storage,0x300000);}return 0;
}
