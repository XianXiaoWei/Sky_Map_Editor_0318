#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
/* Full unmodified ReadString, recursive ReadFields and string growth.
 * Metadata, reflected allocator and pool alloc/free are boundary services. Pointer
 * resolution executes the exact original loader SUBRANGE via a trampoline. */
static uint8_t *memory=(void *)0x250000000UL;
static uintptr_t vt[32];
static uint32_t h[12],events[8192][4],event_count,error_line,severity,active_field,array_at,growth_at,length_error;
static jmp_buf escape;
static uint32_t off(const void *p){return (uintptr_t)p-(uintptr_t)memory;}
static uint32_t u32(const void *p){uint32_t n;memcpy(&n,p,4);return n;}
static uintptr_t ptr(const void *p){uintptr_t n;memcpy(&n,p,8);return n;}
static void record(uint32_t a,uint32_t b,uint32_t c,uint32_t d){if(event_count>=8192)exit(12);uint32_t row[]={a,b,c,d};memcpy(events[event_count++],row,16);}
static void *as_class(void *type){record(1,off(type),0,0);return type==memory+0x20200||(h[3]&&type==memory+0x1f000)?NULL:type;}
static void *cast_object(void *type,void **value){record(2,off(type),off(*value),0);return (uint8_t *)*value+(int32_t)h[2];}
static void *method_type(void){record(3,0,0,0);return memory+0x20100;}
static void receiver(void *type,void **out,void **value,void *source){record(4,off(type),off(*value),off(source));*out=h[4]?NULL:*value;}
static void *field_type(void){record(6,0,0,0);return memory+0x20100;}
static void *field_address(void *type,void **root,void *root_class,uintptr_t member){
 (void)type;active_field=member;record(7,member,off(*root),off(root_class));return (uint8_t *)*root+ptr(memory+0x6000+member*32);
}
static void *element_type(void){record(8,0,0,0);uint32_t ci=u32(memory+0x500c+active_field*16);return ci==0xffffffff?memory+0x20200:memory+0x1f000+ci*256;}
static void *element_object(void *type,void **slot){record(9,off(type),off(slot),0);return *slot;}
static void invoke(uintptr_t method,uintptr_t adjustment,uint8_t *root,void **out,void *result_type,void **arguments,uint32_t count){
 (void)adjustment;if(out||count!=1||method<1||method>128)exit(13);
 uint32_t i=method-1,n=*(uint32_t *)arguments[0];active_field=i;record(5,i,n,off(memory+0x20300));record(13,off(result_type),0,0);
 uint8_t *property=memory+0x5000+i*16,*field=memory+0x18000+i*128;
 uint32_t offset=ptr(memory+0x6000+i*32),indirect=ptr(field+56)!=UINT64_MAX;
 uint8_t *data=indirect?(h[5]?NULL:memory+array_at):root+offset;
 if(indirect){memcpy(root+offset,&data,8);array_at+=(n*8+15)&~15U;}
 if(data)for(uint32_t j=0;j<n;j++){
  uint32_t ci=u32(property+12);
  if(ci==0xffffffff)memset(data+j*8,0,8);
  else{
   uint8_t *object=memory+array_at;array_at+=256;
   void *value=h[6]&&j==0?NULL:object;memcpy(data+j*8,&value,8);memcpy(object,&(uint32_t){ci+1},4);
   uint32_t first=u32(memory+0x4004+ci*12),fields=u32(memory+0x4008+ci*12);
   for(uint32_t k=0;k<fields;k++){
    uint8_t *p=memory+0x5000+(first+k)*16;uint32_t type=u32(p);
    if(u32(p+4)!=0xffffffff&&(type==1||type==3))memset(object+(int32_t)h[2]+ptr(memory+0x6000+(first+k)*32),0,24);
   }
  }
 }
 if(array_at>0x10000)exit(14);
 if(h[7])memset(memory+0x4008,0,4);
}
static void *get_pool(void){record(10,0,0,0);return memory+0x2be00;}
static void *pool_allocate(void *pool,uint64_t bytes){
 (void)pool;uint8_t *data=memory+growth_at;record(11,bytes,off(data),0);growth_at+=bytes;if(growth_at>0x30000)exit(15);return data;
}
static void pool_release(void *pool,void *data){(void)pool;record(12,off(data),u32(data),0);memset(data,0xdd,64);}
static void throw_length_error(void){length_error=1;record(14,0,0,0);longjmp(escape,1);}
static void assertion(const char *expression,const char *file,uint32_t line,uint32_t sev,...){(void)expression;(void)file;error_line=line;severity=sev;longjmp(escape,1);}
static void hook(uintptr_t at,void *fn){uint8_t j[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(j+6,&fn,8);memcpy((void *)at,j,14);}
static void bind(uintptr_t stub,void *fn){int32_t rel;memcpy(&rel,(void *)(stub+2),4);memcpy((void *)(stub+6+rel),&fn,8);}
static void rd(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(7);}
static void wr(const void *p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(8);}
static void resolve_pointers(void);
/* Install original register/stack inputs, enter at its reference-fixup loop,
 * and return at the end of that loop. None of the copied instructions are
 * translated. Caller-saved state of the original loader is reproduced. */
__asm__(
 ".text\nresolve_pointers:\n"
 "push %rbp\nmov %rsp,%rbp\npush %rbx\npush %r12\npush %r14\npush %r15\nsub $0x1600,%rsp\n"
 "movabs $0x25000248c,%rax\nmov (%rax),%eax\nmov %eax,0x157c(%rsp)\n"
 "movabs $0x250009000,%rax\nmov %rax,0x1570(%rsp)\n"
 "movabs $0x250009c00,%rax\nmov %rax,0xf0(%rsp)\n"
 "movabs $0x10040d2aa,%rax\njmp *%rax\n"
 ".globl resolve_return\nresolve_return:\nadd $0x1600,%rsp\npop %r15\npop %r14\npop %r12\npop %rbx\npop %rbp\nret\n"
);
extern void resolve_return(void);
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *f=fopen(argv[1],"rb");if(!f)return 3;
 void *text=mmap((void *)0x100000000UL,0x2400000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
 if(text==MAP_FAILED||fread(text,1,0xd22000,f)!=0xd22000)return 4;fclose(f);
 if(mmap(memory,0x30000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 5;
 memcpy((void *)0x102047c70UL,&(uintptr_t){(uintptr_t)(memory+0x22000)},8);
 memcpy((void *)0x102047f10UL,&(uintptr_t){(uintptr_t)(memory+0x20000)},8);
 memcpy((void *)0x102047d90UL,&(uintptr_t){(uintptr_t)(memory+0x20300)},8);
 vt[0x68/8]=(uintptr_t)as_class;vt[0xd8/8]=(uintptr_t)cast_object;vt[0xd0/8]=(uintptr_t)element_object;vt[0xe0/8]=(uintptr_t)field_address;vt[0x40/8]=(uintptr_t)receiver;
 hook(0x1007e5f70UL,assertion);hook(0x1007e6030UL,assertion);hook(0x10040d311UL,resolve_return);
 hook(0x1007e50d0UL,get_pool);hook(0x1007e5790UL,pool_allocate);hook(0x1007e5db0UL,pool_release);
 bind(0x100aa230cUL,throw_length_error);
 bind(0x100aa28f4UL,memcpy);bind(0x100aa28faUL,memmove);bind(0x100aa2c7eUL,strlen);
 if(mprotect(text,0xc05000,PROT_READ|PROT_EXEC))return 6;
 uint32_t total;rd(&total,4);wr(&total,4);
 while(total--){
  rd(h,48);rd(memory,0x30000);if(h[10]>128||h[11]>16)return 9;
  for(uint32_t i=0;i<h[11];i++)memcpy(memory+0x1f000+i*256,&(uintptr_t){(uintptr_t)vt},8);
  for(uint32_t i=0;i<4;i++)memcpy(memory+0x20000+i*256,&(uintptr_t){(uintptr_t)vt},8);
  for(uint32_t i=0;i<h[10];i++){
   memcpy(memory+0x18000+i*128+40,&(uintptr_t){(uintptr_t)element_type},8);
   memcpy(memory+0x18000+i*128+48,&(uintptr_t){(uintptr_t)field_type},8);
   memcpy(memory+0x28000+i*128+72,&(uintptr_t){(uintptr_t)invoke},8);
   memcpy(memory+0x28000+i*128+88,&(uintptr_t){(uintptr_t)method_type},8);
  }
  event_count=error_line=severity=active_field=length_error=0;array_at=0xc000;growth_at=0x2c000;
  if(!setjmp(escape)){
   if(h[0]==0)((void (*)(void *,void *))0x10040b1d0UL)(memory+0x1000,h[1]?NULL:memory+0xa040+(int32_t)h[2]);
   else if(h[0]==2){
    uint64_t a[8];memcpy(a,memory+0x2bf00,64);
    ((void (*)(uint64_t,uint64_t,uint64_t,uint64_t,uint64_t,uint64_t,uint64_t,uint64_t))0x1000198c0UL)(a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7]);
   }
   else{
    for(uint32_t i=0;i<h[8];i++)((void (*)(void *,void *,void *))0x10040b390UL)(memory+0x1000,h[1]?NULL:memory+0xa000+i*2048,memory+0x4000);
    if(h[9])resolve_pointers();
   }
  }
  for(uint32_t i=0;i<h[11];i++)memset(memory+0x1f000+i*256,0,8);
  for(uint32_t i=0;i<4;i++)memset(memory+0x20000+i*256,0,8);
  for(uint32_t i=0;i<h[10];i++){
   memset(memory+0x18000+i*128+40,0,8);memset(memory+0x18000+i*128+48,0,8);
   memset(memory+0x28000+i*128+72,0,8);memset(memory+0x28000+i*128+88,0,8);
  }
  uint32_t out[]={error_line,severity,event_count,u32(memory+0x247c),u32(memory+0x248c),length_error};wr(out,24);wr(events,event_count*16);wr(memory,0x30000);
 }
 return 0;
}
