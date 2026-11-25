/* Original whole FloatMult, FloatSplit and Event::Start normal branch bodies.
 * Only metadata conversion, assertion/logging and stack canary dependencies
 * are host services. Original function bytes are left untouched. */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static jmp_buf escape;
static uint32_t casts,gets,asserts,log_events,log_chars,assert_line;
static uint32_t mutation_at,new_count,has_mutation,invalid_member;
static uint8_t clump[32];
static uintptr_t float_vtable[9],float_metadata[2],object_metadata[2],log_vtable[16];
static uint64_t guard=0x3180beef;
static void cast_float(void *meta,void **out,void **in,void *source){
 (void)meta;(void)source;casts++;
 *out=invalid_member?NULL:*in;
 if(has_mutation&&casts-1==mutation_at)memcpy(clump+0x10,&new_count,4);
}
static void assertion(const char *expr,const char *file,uint32_t line,uint32_t severity){
 (void)expr;(void)file;(void)severity;asserts++;assert_line=line;longjmp(escape,1);
}
static void noop(void *a,void *b){(void)a;(void)b;}
static void log_begin(void *a,const char *b,uint32_t n){(void)a;(void)b;(void)n;log_events++;}
static void *log_write(void *a,const char *b,uint32_t n){
 if(n!=86||memcmp(b,"Called Start() on an Event with a null m_eventBarn, will have 0 seq (undefined order).",86))exit(10);
 log_chars+=n;return a;
}
/* A RIP-indirect dependency thunk in an unused mapped service region. */
static void bind_call(uintptr_t slot,uintptr_t address,void *fn){
 uint8_t *stub=(uint8_t *)slot;stub[0]=0xff;stub[1]=0x25;memset(stub+2,0,4);memcpy(stub+6,&fn,8);memcpy((void *)address,&slot,8);
}
static void read_exact(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(7);}
static void write_exact(const void *p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(8);}
static int initialize_native(const char *executable){
 FILE *file=fopen(executable,"rb");if(!file)return 3;
 void *text=mmap((void *)0x100000000UL,0x2400000,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
 if(text==MAP_FAILED)return 4;
 if(fread(text,1,0xd22000,file)!=0xd22000)return 5;
 fclose(file);
 /* Original type getter is untouched; only its global metadata is supplied. */
 float_vtable[8]=(uintptr_t)cast_float;float_metadata[0]=(uintptr_t)float_vtable;
 memcpy((void *)0x10203aa30UL,&(uintptr_t){(uintptr_t)float_metadata},8);
 /* The original getter dereferences a global; initialize after inspecting
  * that getter in the SHA-gated Python extraction. */
 memcpy((void *)0x102047f70UL,&(uintptr_t){(uintptr_t)object_metadata},8);
 memcpy((void *)0x100c0d8d8UL,&(uintptr_t){(uintptr_t)&guard},8);
 /* The direct assertion dependency is a host thunk, explicitly excluded
  * from the verified original function bodies. */
 uint8_t *a=(uint8_t *)0x1007e5f70UL;a[0]=0xff;a[1]=0x25;memset(a+2,0,4);void *fn=assertion;memcpy(a+6,&fn,8);
 /* Logging functions are explicit dependencies, not Event::Start itself. */
 const uintptr_t addresses[]={0x1007a56a0UL,0x100011930UL,0x1007a58d0UL};
 void *functions[]={log_begin,log_write,noop};
 for(int i=0;i<3;i++){uint8_t *s=(uint8_t *)addresses[i];s[0]=0xff;s[1]=0x25;memset(s+2,0,4);memcpy(s+6,&functions[i],8);}
 memcpy((void *)0x100c0a520UL,&(uintptr_t){(uintptr_t)log_vtable},8);
 memcpy((void *)0x100c0d5c8UL,&(uintptr_t){(uintptr_t)log_vtable},8);
 memcpy((void *)0x100c0a580UL,&(uintptr_t){(uintptr_t)log_vtable},8);
 bind_call(0x102300020UL,0x100c0e440UL,noop);
 bind_call(0x102300040UL,0x100c0e378UL,noop);
 bind_call(0x102300060UL,0x100c0e450UL,noop);
 /* Import slots are verified by the extraction script before use. */
 if(mprotect(text,0xc05000,PROT_READ|PROT_EXEC)||mprotect((void *)0x102300000UL,4096,PROT_READ|PROT_EXEC))return 6;
 return 0;
}
int main(int argc,char **argv){
 if(argc!=2)return 2;
 int initialized=initialize_native(argv[1]);if(initialized)return initialized;
 uint32_t count;read_exact(&count,4);write_exact(&count,4);
 while(count--){
  uint32_t h[10];read_exact(h,sizeof(h));
  uint32_t kind=h[0],cells_count=h[1],n=h[5];if(kind>2||cells_count>1000000||n>2000000)return 9;
  static uint8_t event[80],barn[32];read_exact(event,80);read_exact(barn,32);
  uint8_t *cells=malloc(cells_count*32+1);uint32_t *indices=malloc(n*4+1);void **members=malloc(n*8+1);
  read_exact(cells,cells_count*32);read_exact(indices,n*4);
  for(uint32_t i=0;i<n;i++){if(indices[i]>=cells_count)return 9;members[i]=cells+indices[i]*32;}
  memset(clump,0,32);memcpy(clump+8,&members,8);memcpy(clump+0x10,&n,4);
  static uint64_t original_barn_pointer;memcpy(&original_barn_pointer,event+0x18,8);
  void *barn_pointer=h[6]?barn:NULL;memcpy(event+0x18,&barn_pointer,8);
  if(kind<2){if(h[2]>=cells_count)return 9;void *input=cells+h[2]*32;memcpy(event+0x38,&input,8);
   if(kind==0){if(h[3]>=cells_count||h[4]>=cells_count)return 9;void *b=cells+h[3]*32,*out=cells+h[4]*32;memcpy(event+0x40,&b,8);memcpy(event+0x48,&out,8);}
   else {void *outputs=clump;memcpy(event+0x40,&outputs,8);}
  }
  casts=gets=asserts=log_events=log_chars=assert_line=0;has_mutation=h[7]!=0xffffffff;mutation_at=h[7];new_count=h[8];invalid_member=h[9]>>16;
  uint32_t repeats=h[9]&0xffff;
  typedef void (*Execute)(void *);static Execute execute;execute=(Execute)(kind==0?0x1007191a0UL:kind==1?0x100717b20UL:0x10032ef60UL);
  if(setjmp(escape)==0)for(uint32_t i=0;i<repeats;i++)execute(event);
  /* Normalize only pointer fields introduced by this harness. */
  memcpy(event+0x18,&original_barn_pointer,8);
  if(kind<2)memset(event+0x38,0,kind==0?24:16);
  uint32_t result[]={casts,gets,asserts,assert_line,log_events,log_chars};write_exact(result,sizeof(result));
  write_exact(event,80);write_exact(barn,32);write_exact(cells,cells_count*32);
  free(cells);free(indices);free(members);
 }
 return 0;
}
