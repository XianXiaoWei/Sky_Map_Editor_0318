/* Original complete MeshInstance init/consumer/GUID lookup execute unchanged.
 * ResourceRef, manager/type lookup and diagnostic streams are ABI services. */
#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t *objects=(void *)0x2a0000000UL;
static uint32_t flags,line,severity,logs[128][3],log_count,ref_count,diag_length;
static void *refs[4];static char diagnostics[4096];static jmp_buf escape;static uint64_t guard=0x1234567890abcdefUL;
#ifdef SKY_MODEL_BAKED_REF_RUNTIME
static uintptr_t ref_tramp=0x2a0040000UL;
static uint32_t ref_id(void *r);
static void capture_ref(void *ref){uint32_t i=ref_id(ref);memcpy(objects+0x1c00+i*32,ref,32);}
#endif
static void rd(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void *p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void ptr(void *p,uintptr_t n){memcpy(p,&n,8);}static void log_call(uint32_t k,uint32_t a,uint32_t b){if(log_count==128)exit(12);uint32_t row[]={k,a,b};memcpy(logs[log_count++],row,12);}
static uint32_t ref_id(void *r){for(uint32_t i=0;i<ref_count;i++)if(refs[i]==r)return i;exit(13);}
static void init_ref(void *r){if(ref_count==4)exit(14);refs[ref_count]=r;log_call(1,ref_count++,0);
#ifdef SKY_MODEL_BAKED_REF_RUNTIME
 memcpy(r,objects+0x1c00+ref_id(r)*32,32);((void (*)(void *))(ref_tramp+32))(r);capture_ref(r);
#else
 memset(r,0,25);
#endif
}
static void *mesh_type(void){log_call(2,0,0);return objects+0x240;}static void *level_type(void){log_call(3,0,0);return objects+0x260;}
static void *lookup(void *manager,void *type,void *name){if(manager!=objects+0x220)exit(15);log_call(4,(uint8_t *)type-objects,(uint8_t *)name-objects);
#ifdef SKY_MODEL_BAKED_REGISTERED_LOOKUP
 return ((void *(*)(void *,void *,void *))(ref_tramp+0x200))(manager,type,name);
#else
 return flags&(type==objects+0x240?1:2)?objects+(type==objects+0x240?0x400:0x800):NULL;
#endif
}
static void request(void *manager,void *type,void *name){if(manager!=objects+0x220)exit(15);log_call(6,(uint8_t *)type-objects,(uint8_t *)name-objects);}
static void observe(void *resource,void *r){log_call(5,(uint8_t *)resource-objects,ref_id(r));
#ifdef SKY_MODEL_BAKED_REF_RUNTIME
 ((void (*)(void *,void *))ref_tramp)(resource,r);capture_ref(r);
#else
 ptr(r,flags&(resource==objects+0x400?4:16)?0:(uintptr_t)(objects+(resource==objects+0x400?0xc00:0xc40)));
#endif
}
static void destroy_ref(void *r){log_call(10,ref_id(r),0);
#ifdef SKY_MODEL_BAKED_REF_RUNTIME
 ((void (*)(void *))(ref_tramp+64))(r);capture_ref(r);
#endif
}
static void assertion(char *expr,char *file,uint32_t n,uint32_t s){(void)expr;(void)file;line=n;severity=s;longjmp(escape,1);}
static void stream_noop(void *ignored,...){(void)ignored;}
static void debug_begin(void *stream,char *label,uint32_t sev){(void)stream;if(strcmp(label,"Mesh")||sev!=1)exit(16);log_call(7,sev,0);}
static void *stream_append(void *s,char *text,uint64_t n){if(diag_length+n>=sizeof diagnostics)exit(17);memcpy(diagnostics+diag_length,text,n);diag_length+=n;return s;}
static void *stream_integer(void *s,int32_t guid){log_call(8,guid,0);char b[32];size_t n=snprintf(b,sizeof b,"%d",guid);return stream_append(s,b,n);}
static void debug_end(void *stream){(void)stream;log_call(9,0,0);}
static void hook(uintptr_t p,void *fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void *)p,b,14);}
static void bind(uintptr_t stub,void *fn){int32_t rel;memcpy(&rel,(void *)(stub+2),4);memcpy((void *)(stub+6+rel),&fn,8);}
static void map(void *p,size_t n){if(mmap(p,n,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)exit(5);}
#ifdef SKY_MODEL_BAKED_REF_RUNTIME
static void resource_callback(uint32_t slot,uint8_t *resource,void *ref){log_call(12,resource-objects,(slot<<16)|ref_id(ref));uintptr_t handle;memcpy(&handle,ref,8);log_call(13,(uint32_t)(handle-(uintptr_t)objects),((uint8_t *)ref)[24]);if(slot==0x38&&(flags&(resource==objects+0x400?4:16)))((void (*)(void *))0x1007c2600UL)(ref);}
static void resource_added(void *resource,void *ref){resource_callback(0x38,resource,ref);}static void resource_removed(void *resource,void *ref){resource_callback(0x30,resource,ref);}static void resource_replaced(void *resource,void *ref){resource_callback(0x40,resource,ref);}
/* Prefixes end at original instruction boundaries and contain no PC-relative
 * instructions. Absolute jumps preserve registers/flags into original tails. */
static void install_ref_runtime(void){map((void *)ref_tramp,4096);map(objects+0x30000,4096);memcpy((void *)ref_tramp,(void *)0x1007c2310UL,16);hook(ref_tramp+16,(void *)0x1007c2320UL);memcpy((void *)(ref_tramp+32),(void *)0x1007c2530UL,19);memcpy((void *)(ref_tramp+64),(void *)0x1007c2570UL,16);hook(ref_tramp+80,(void *)0x1007c2580UL);
 hook(ref_tramp+0x100,resource_removed);hook(ref_tramp+0x120,resource_added);hook(ref_tramp+0x140,resource_replaced);ptr(objects+0x30030,ref_tramp+0x100);ptr(objects+0x30038,ref_tramp+0x120);ptr(objects+0x30040,ref_tramp+0x140);if(mprotect((void *)ref_tramp,4096,5))exit(19);}
static void normalize_ref_links(void){for(uint32_t resource=0;resource<2;resource++)for(uint32_t slot=0;slot<2;slot++){uint8_t *p=objects+(resource?0x800:0x400)+64+slot*8;uintptr_t value;memcpy(&value,p,8);for(uint32_t i=0;i<ref_count;i++)if(value==(uintptr_t)refs[i])ptr(p,(uintptr_t)(objects+0x1c00+i*32));}}
#endif
#ifdef SKY_MODEL_BAKED_REGISTERED_LOOKUP
static void *registered_as_class(void *type){log_call(14,(uint8_t *)type-objects,0);return type;}static void *registered_void(void){log_call(15,0,0);return objects+0x2c0;}static void *registered_fallback(void){log_call(16,0,0);return objects+0x2e0;}
static void install_registered_lookup(void){if(mprotect((void *)ref_tramp,4096,3))exit(19);memcpy((void *)(ref_tramp+0x200),(void *)0x1007c4360UL,18);hook(ref_tramp+0x212,(void *)0x1007c4372UL);hook(ref_tramp+0x1a0,registered_as_class);ptr(objects+0x30068,ref_tramp+0x1a0);map(objects+0x50000,4096);ptr(objects+0x50098+16*8,(uintptr_t)(objects+0x240));ptr(objects+0x50098+17*8,(uintptr_t)(objects+0x260));ptr((void *)0x102047c70UL,(uintptr_t)(objects+0x50000));hook(0x1007abbf0UL,registered_void);hook(0x1007abc60UL,registered_fallback);bind(0x100aa2c4eUL,strcmp);if(mprotect((void *)ref_tramp,4096,5))exit(19);}
#endif
/* Independent AVX one-operation probes supply emulator-specific dual-NaN
 * results. Original functions are not instrumented or replaced to obtain them. */
static uint32_t arithmetic_probe(uint32_t op,uint32_t a,uint32_t b){float x,y,z;memcpy(&x,&a,4);memcpy(&y,&b,4);switch(op){case 0:__asm__("vaddss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;case 1:__asm__("vsubss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;case 2:__asm__("vmulss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;default:__asm__("vdivss %2,%1,%0":"=x"(z):"x"(x),"x"(y));}uint32_t n;memcpy(&n,&z,4);return n;}
static void write_arithmetic_probes(void){uint32_t values[32]={0xffc00000},n=1;for(uint32_t i=0;i<12;i++){uint32_t v;memcpy(&v,objects+0x1004+i*4,4);if((v&0x7fffffff)<=0x7f800000)continue;for(uint32_t k=0;k<2;k++){uint32_t value=v|(k?0x400000:0),j=0;while(j<n&&values[j]!=value)j++;if(j==n)values[n++]=value;}}uint32_t count=n*n*4;wr(&count,4);for(uint32_t op=0;op<4;op++)for(uint32_t a=0;a<n;a++)for(uint32_t b=0;b<n;b++){uint32_t row[]={op,values[a],values[b],arithmetic_probe(op,values[a],values[b])};wr(row,16);}}
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *f=fopen(argv[1],"rb");if(!f)return 3;map((void *)0x100000000UL,0x2400000);if(fread((void *)0x100000000UL,1,0xd22000,f)!=0xd22000)return 4;fclose(f);map(objects,8192);
 ptr((void *)0x100c0d8d8UL,(uintptr_t)&guard);ptr((void *)0x100c0a520UL,(uintptr_t)(objects+0x300));ptr((void *)0x100c0a580UL,(uintptr_t)(objects+0x340));ptr((void *)0x100c0d5c8UL,(uintptr_t)(objects+0x380));
#ifdef SKY_MODEL_BAKED_REF_RUNTIME
 install_ref_runtime();
#endif
#ifdef SKY_MODEL_BAKED_REGISTERED_LOOKUP
 install_registered_lookup();
#endif
 hook(0x1007c2530UL,init_ref);hook(0x1004559d0UL,mesh_type);hook(0x1003f10c0UL,level_type);hook(0x1007c4360UL,lookup);hook(0x1007c4640UL,request);hook(0x1007c2310UL,observe);hook(0x1007c2570UL,destroy_ref);hook(0x1007e5f70UL,assertion);hook(0x1007e6030UL,assertion);
 bind(0x100aa2450UL,stream_noop);bind(0x100aa23baUL,stream_noop);bind(0x100aa245cUL,stream_noop);hook(0x1007a56a0UL,debug_begin);hook(0x100011930UL,stream_append);bind(0x100aa23d8UL,stream_integer);hook(0x1007a58d0UL,debug_end);bind(0x100aa2c7eUL,strlen);
 if(mprotect((void *)0x100000000UL,0xc05000,5))return 6;
 uint32_t count;rd(&count,4);wr(&count,4);while(count--){uint32_t h[5];rd(h,20);rd(objects,8192);write_arithmetic_probes();flags=h[1];
#ifdef SKY_MODEL_BAKED_REF_RUNTIME
 if(flags&8)ptr(objects+0x450,0);if(flags&32)ptr(objects+0x850,0);
#else
 if(flags&8)ptr(objects+0xc10,0);if(flags&32)ptr(objects+0xc50,0);
#endif
 line=severity=log_count=ref_count=diag_length=0;
  if(!setjmp(escape)){if(h[0]==0)((void (*)(void *,void *,void *,int32_t))0x10045f880UL)(objects+h[3],objects+0x4a8,h[4]?objects+h[4]:NULL,h[2]);else if(h[0]==2){uint32_t value=((uint32_t (*)(void *,void *))0x1004653c0UL)(objects+0x80,objects+0x220);memcpy(objects+h[3],&value,4);}else if(h[0]==3)((void (*)(void *,void *,void *,int32_t))0x10045f770UL)(objects+h[3],objects+0x220,objects+0x80,h[2]);else ((void (*)(void *,void *,void *,void *,uint32_t,int32_t))0x10045fa00UL)(objects+h[3],objects+0x220,objects+0x100,objects+0x80,h[4],h[2]);}
#ifdef SKY_MODEL_BAKED_REF_RUNTIME
  normalize_ref_links();
#endif
  uint32_t out[]={line,severity,log_count,diag_length};wr(out,16);wr(logs,log_count*12);wr(diagnostics,diag_length);wr(objects,8192);
 }return 0;
}
