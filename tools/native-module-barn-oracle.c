/* Whole unmodified ModuleBarn dispatch. Table setup, virtual receiver casts,
 * reflected calls and overrides are supplied services; callback mutations
 * affect the real native table and its next iteration. */
#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t *memory=(void *)0x230000000UL;
static uintptr_t vt[32];
static jmp_buf escape;
static uint32_t logs[512][4],log_count,error_line,severity,calls,casts,mutation_at,new_count,replace_override,cast_fails_at;
static uint8_t *group;
static uint32_t offset(const void *p){return (const uint8_t *)p-memory;}
static uint64_t u64(const void *p){uint64_t n;memcpy(&n,p,8);return n;}
static uint32_t u32(const void *p){uint32_t n;memcpy(&n,p,4);return n;}
static void log_service(uint32_t op,uint32_t i,uint32_t a,uint32_t b){
 if(log_count>=512)exit(12);uint32_t row[]={op,i,a,b};memcpy(logs[log_count++],row,16);
}
static void mutate(uint32_t i){
 if(calls++!=mutation_at)return;
 memcpy(group+48,&new_count,4);
 if(replace_override){void *entry=(void *)(uintptr_t)u64(group+40);uintptr_t p;memcpy(&p,(uint8_t *)entry+i*32+24,8);(void)p;
  extern void override(void *,void *,void *,void *);p=(uintptr_t)override;memcpy((uint8_t *)entry+i*32+24,&p,8);
 }
}
static void *receiver_type(void *unused){(void)unused;return memory+0x5200;}
/* Getter receives no arguments; method-specific wrappers record identity. */
#define GETTER(I) static void *getter##I(void){log_service(1,I,0,0);return receiver_type(NULL);}
GETTER(0) GETTER(1) GETTER(2) GETTER(3) GETTER(4) GETTER(5) GETTER(6) GETTER(7)
static void convert(void *type,void **out,void *storage,void *source){
 (void)type;uint32_t i=(offset(storage)-0xd000)/64;log_service(2,i,offset(source),0);*out=casts++==cast_fails_at?NULL:storage;
}
static void invoke(uintptr_t method,uintptr_t adjustment,void *receiver,void **out,void *result_type,void **args,uint32_t count){
 (void)adjustment;if(out||method<1||method>8)exit(13);
 uint32_t i=(offset(receiver)-0xd000)/64;if(method!=i+1)exit(13);
 log_service(3,i,offset(result_type),count);
 for(uint32_t a=0;a<count;a++)log_service(6,i,a,offset(args[a]));
 mutate(i);
}
void override(void *context,void *context_type,void *storage,void *source){
 uint32_t i=(offset(storage)-0xd000)/64;log_service(4,i,offset(context),offset(context_type));log_service(5,i,offset(source),0);mutate(i);
}
static void assertion(const char *expr,const char *file,uint32_t line,uint32_t sev,...){(void)expr;(void)file;error_line=line;severity=sev;longjmp(escape,1);}
static void stack_failure(void){exit(14);}
static void hook(uintptr_t at,void *fn){uint8_t j[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(j+6,&fn,8);memcpy((void *)at,j,14);}
static void bind(uintptr_t stub,void *fn){int32_t rel;memcpy(&rel,(void *)(stub+2),4);memcpy((void *)(stub+6+rel),&fn,8);}
static void rd(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(7);}
static void wr(void *p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(8);}
int main(int argc,char **argv){
 if(argc!=2)return 2;
 FILE *f=fopen(argv[1],"rb");if(!f)return 3;
 void *text=mmap((void *)0x100000000UL,0x2400000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
 if(text==MAP_FAILED||fread(text,1,0xd22000,f)!=0xd22000)return 4;fclose(f);
 if(mmap(memory,0x10000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 5;
 static uint64_t guard=0x31871a7e;uintptr_t guard_pointer=(uintptr_t)&guard;memcpy((void *)0x100c0d8d8UL,&guard_pointer,8);
 memcpy((void *)0x102047f10UL,&(uintptr_t){(uintptr_t)(memory+0x5100)},8);
 vt[0x40/8]=(uintptr_t)convert;
 bind(0x100aa2c90UL,strncpy);bind(0x100aa2c4eUL,strcmp);bind(0x100aa251cUL,stack_failure);
 hook(0x1007e5f70UL,assertion);hook(0x1007e6030UL,assertion);
 if(mprotect(text,0xc05000,PROT_READ|PROT_EXEC))return 6;
 uintptr_t getters[]={(uintptr_t)getter0,(uintptr_t)getter1,(uintptr_t)getter2,(uintptr_t)getter3,(uintptr_t)getter4,(uintptr_t)getter5,(uintptr_t)getter6,(uintptr_t)getter7};
 uint32_t count;rd(&count,4);wr(&count,4);
 while(count--){
  uint32_t h[10];rd(h,40);if(h[0]>31||h[9]>8)return 9;
  char query[32]={0};rd(query,h[0]);rd(memory,0x10000);
  mutation_at=h[4];new_count=h[5];replace_override=h[6];cast_fails_at=h[7];group=memory+0xb000+h[8]*56;
  for(uint32_t i=0;i<8;i++){
   memcpy(memory+0xe000+i*128+72,&(uintptr_t){(uintptr_t)invoke},8);memcpy(memory+0xe000+i*128+88,&getters[i],8);
   for(uint32_t g=0;g<4;g++)if(u64(memory+0xb800+g*0x400+i*32+24))memcpy(memory+0xb800+g*0x400+i*32+24,&(uintptr_t){(uintptr_t)override},8);
  }
  memcpy(memory+0x5200,&(uintptr_t){(uintptr_t)vt},8);
  log_count=error_line=severity=calls=casts=0;
  if(!setjmp(escape))for(uint32_t r=0;r<h[3];r++)((void (*)(void *,const char *,uint32_t,uint32_t))0x1007b1b40UL)(memory+0xa000,query,h[1],h[2]);
  for(uint32_t i=0;i<8;i++){
   memset(memory+0xe000+i*128+72,0,8);memset(memory+0xe000+i*128+88,0,8);
   for(uint32_t g=0;g<4;g++)if(u64(memory+0xb800+g*0x400+i*32+24))memcpy(memory+0xb800+g*0x400+i*32+24,&(uintptr_t){1},8);
  }
  memset(memory+0x5200,0,8);uint32_t out[]={error_line,severity,log_count};wr(out,12);wr(logs,log_count*16);wr(memory,0x10000);
 }
 return 0;
}
