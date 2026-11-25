#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t*arena=(void*)0x440000000UL;static uint32_t trace[2048],used,casts,transforms;
static uint32_t u32(size_t at){uint32_t n;memcpy(&n,arena+at,4);return n;}static uint64_t u64(size_t at){uint64_t n;memcpy(&n,arena+at,8);return n;}static void w32(size_t at,uint32_t n){memcpy(arena+at,&n,4);}static void w64(size_t at,uint64_t n){memcpy(arena+at,&n,8);}
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}static uint32_t off(void*p){return p?(uintptr_t)p-(uintptr_t)arena:0xffffffff;}
static void hook(uintptr_t at,void*fn){uint8_t b[14]={0xff,0x25};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}static void logop(uint32_t op,uint32_t a,uint32_t b,uint32_t c,uint32_t d){if(used+8>2048)exit(12);trace[used++]=op;trace[used++]=a;trace[used++]=b;trace[used++]=c;trace[used++]=d;trace[used++]=0;trace[used++]=0;trace[used++]=0;}
static void* generic(void){return arena+0x18500;}static void* actor_type(void){return arena+0x18100;}static void* avatar_type(void){return arena+0x18200;}static void* marker_type(void){return arena+0x18400;}
static void* flame_type(void){return arena+0x18600;}
static uint8_t actor_active(void*p){logop(11,off(p),0,0,0);return ((uint8_t*)p)[0xe1];}
static void* nearest_avatar(void*owner,void*position,uint32_t a,uint32_t b,uint32_t c){uint32_t v[4];memcpy(v,position,16);logop(10,off(owner),v[0],v[1],v[2]);trace[used-3]=a;trace[used-2]=b;trace[used-1]=c;return (void*)u64(0x1f240);}
static void meta_cast(void*meta,void**out,void**in,void*from){(void)from;uint32_t kind;memcpy(&kind,(uint8_t*)meta+8,4);void*object=*in;uint8_t*body=object?(uint8_t*)object-(u32(0x1f004)==4||(u32(0x1f004)==6&&object>=(void*)(arena+0x13000)&&object<(void*)(arena+0x15000))?0:8):0;uint8_t flags=body?body[0xe0]:0;void*selected=(flags&(1<<kind))?body:0;casts++;uint32_t c=u32(0x1f000);
 if(c==1&&kind==2&&casts==1)*in=arena+0x7808;
 if(c==2&&kind==2&&casts==1){w32(0x2010,0x42c60000);w64(0x2080,(uintptr_t)arena+0x9100);}
 if(c==3&&kind==3)w32(0x1050,3);
 if(c==4&&kind==0&&selected)selected=arena+0x10000;
 if(c==5&&kind==0&&casts==1){*in=arena+(u32(0x1f004)==4?0x7800:0x7808);selected=0;}
 if(c==9&&kind==2&&casts==1){w32(0x1050,9);w64(0x1008,(uintptr_t)arena+0x9200);}
 if(c==7&&kind==2&&casts==1)w32(0x6000,9);
 if(c==10&&casts==1)w32(0x11b8,1);
 *out=selected;logop(1,kind,off(object),off(selected),off(*in));
}
static void avatar_motion(void*out,void*p){logop(2,off(p),0,0,0);memcpy(out,(uint8_t*)p+0x190,0x5c);}
static void transform(void*out,void*p){logop(3,off(p),0,0,0);uint8_t*body=p?(uint8_t*)p-8:arena+0x7000;memcpy(out,body+0x100,64);}
static void scale(void*out,void*p){logop(4,off(p),0,0,0);uint8_t*body=p?(uint8_t*)p-8:arena+0x7000;memcpy(out,body+0x140,64);}
static void marker_transform(void*out,void*p){logop(5,off(p),0,0,0);transforms++;if(u32(0x1f000)==6&&transforms==1){w32(0x1050,3);float n=4;memcpy((uint8_t*)p+0x120,&n,4);}memcpy(out,(uint8_t*)p+0x100,64);}
static void obb(void*out,void*a,void*b){uint32_t x,y;memcpy(&x,a,4);memcpy(&y,b,4);logop(6,x,y,0,0);memcpy(out,arena+0x19000,64);}
static uint64_t guard;
static void generic_obb(void*out,void*object){logop(9,off(object),0,0,0);memcpy(out,(uint8_t*)object+0x100,64);}
static uint32_t query(void*owner,void*position,void*out,uint32_t capacity,void*filter,uint32_t flags,float radius){uint32_t n;memcpy(&n,&radius,4);if(u32(0x1f004)==6){uint32_t x;memcpy(&x,position,4);logop(8,off(owner),x,off(out),capacity);}else logop(8,off(owner),off(position),off(out),capacity);trace[used-3]=off(filter);trace[used-2]=n;trace[used-1]=flags;memcpy(out,arena+0x1e000,32*8);return u32(0x1f004)==6&&out==arena+0x10c8?0:u32(0x1f208);}
static jmp_buf escape;static uint32_t line,severity;
static void assertion(char*x,char*f,uint32_t l,uint32_t s,...){(void)x;(void)f;line=l;severity=s;longjmp(escape,1);}
__attribute__((noinline)) static void flock(void*state,void*self,void*filter){float weights[5][4];memcpy(weights,arena+0x1f100,sizeof weights);void*entry=(void*)0x10062f800UL;uint32_t fallback=u32(0x1f210);
 __asm__ volatile("vmovups %4, %%xmm0\n\tvmovups %5, %%xmm1\n\tvmovups %6, %%xmm2\n\tvmovups %7, %%xmm3\n\tvmovups %8, %%xmm4\n\tmov %%rdi, %%r10\n\tmov %%rax, %%r9\n\tlea -0x2000(%%rsp), %%rdi\n\txor %%eax, %%eax\n\tmov $1024, %%ecx\n\trep stosq\n\tmov %%r10, %%rdi\n\tlea -0xbe8(%%rsp), %%r8\n\tmov %9, %%eax\n\tmov $32, %%ecx\n1:\n\tmov %%eax, (%%r8)\n\tadd $0x60, %%r8\n\tdec %%ecx\n\tjne 1b\n\tmov %%r9, %%rax\n\tcall *%%rax" : "+D"(state),"+S"(self),"+d"(filter),"+a"(entry) : "m"(weights[0]),"m"(weights[1]),"m"(weights[2]),"m"(weights[3]),"m"(weights[4]),"m"(fallback) : "rcx","r8","r9","r10","r11","xmm0","xmm1","xmm2","xmm3","xmm4","xmm5","xmm6","xmm7","xmm8","xmm9","xmm10","xmm11","xmm12","xmm13","xmm14","xmm15","memory","cc");
}
static float asin_service(float x){uint32_t argument;memcpy(&argument,&x,4);logop(7,argument,0,0,0);if(u32(0x1f000)==8){w32(0x6000,9);w64(0x6008,(uintptr_t)arena+0x7808);w32(0x6030,0x42c60000);}float out;uint32_t n=u32(0x1f014);memcpy(&out,&n,4);return out;}
static float sin_service(float x){uint32_t n;memcpy(&n,&x,4);logop(12,n,0,0,0);float out;memcpy(&out,arena+0x1f250,4);return out;}
typedef float pair_float __attribute__((vector_size(8)));
static pair_float sincos_service(float x){uint32_t n;memcpy(&n,&x,4);logop(13,n,0,0,0);pair_float out;memcpy(&out,arena+0x1f254,8);return out;}
static float atan2_service(float x,float y){uint32_t a,b;memcpy(&a,&x,4);memcpy(&b,&y,4);logop(14,a,b,0,0);float out;memcpy(&out,arena+0x1f25c,4);return out;}
static void* actor_by_id(void*owner,uint32_t id){logop(15,off(owner),id,0,0);return (void*)u64(0x1f260);}
static void* flame_by_id(void*owner,uint32_t id){logop(16,off(owner),id,0,0);return (void*)u64(0x1f268);}
static void select_service(void*ai,void*game){logop(17,off(ai),off(game),0,0);w32(0x1050,u32(0x1f270));w32(0x1090,0x3e99999a);}
/* SelectState reads four unwritten stack W lanes. Provide their storage in
 * the caller, without patching the recovered body or its scoring callees. */
__attribute__((naked,noinline)) static void select_state(void*ai __attribute__((unused)),void*game __attribute__((unused))){
 __asm__ volatile("push %rbp\n\tmov %rsp, %rbp\n\tmov %rdi, %r10\n\tmovabs $0x44001f248, %rax\n\tmov (%rax), %eax\n\tlea -0x4000(%rsp), %rdi\n\tmov $4096, %ecx\n\trep stosl\n\tmov %r10, %rdi\n\tmovabs $0x1002594c0, %rax\n\tcall *%rax\n\tleave\n\tret");
}
/* Separate AVX probes supply exact dual-NaN operand results under QEMU.
 * Neither recovered body is instrumented to collect these results. */
static uint32_t arithmetic_probe(uint32_t op,uint32_t a,uint32_t b){float x,y,z;memcpy(&x,&a,4);memcpy(&y,&b,4);switch(op){case 0:__asm__("vaddss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;case 1:__asm__("vsubss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;case 2:__asm__("vmulss %2,%1,%0":"=x"(z):"x"(x),"x"(y));break;default:__asm__("vdivss %2,%1,%0":"=x"(z):"x"(x),"x"(y));}uint32_t n;memcpy(&n,&z,4);return n;}
static void write_probes(void){const uint32_t values[]={0x7fc00000,0xffc00000};uint32_t count=16;wr(&count,4);for(uint32_t op=0;op<4;op++)for(uint32_t a=0;a<2;a++)for(uint32_t b=0;b<2;b++){uint32_t row[]={op,values[a],values[b],arithmetic_probe(op,values[a],values[b])};wr(row,16);}}
int main(int argc,char**argv){setvbuf(stdout,NULL,_IONBF,0);if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);
 if(mmap(arena,0x20000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 hook(0x1007abc10UL,generic);hook(0x100262d70UL,actor_type);hook(0x1000f8400UL,avatar_type);hook(0x10043ccc0UL,marker_type);hook(0x102220000UL,meta_cast);hook(0x102220020UL,marker_transform);hook(0x100101450UL,avatar_motion);hook(0x1004d1e40UL,transform);hook(0x1004d2140UL,scale);hook(0x100076df0UL,obb);
 hook(0x10074a170UL,generic);hook(0x102220060UL,generic_obb);hook(0x1004ce4b0UL,query);hook(0x1007e5f70UL,assertion);
 hook(0x100474e80UL,actor_type);hook(0x10033abb0UL,flame_type);hook(0x102220080UL,actor_active);hook(0x100103770UL,nearest_avatar);
 hook(0x100aa2bcaUL,sin_service);hook(0x100aa250aUL,sincos_service);hook(0x100aa25a0UL,atan2_service);hook(0x100263550UL,actor_by_id);hook(0x10033a5f0UL,flame_by_id);
 hook(0x100aa2588UL,asin_service);*(void**)0x100c0d8d8UL=&guard;
 uint32_t count;rd(&count,4);wr(&count,4);write_probes();while(count--){uint32_t mode,result=0;rd(&mode,4);rd(arena,0x20000);used=casts=transforms=0;memset(trace,0,sizeof trace);*(void**)0x101de5c60UL=arena+0x18300;memcpy((void*)0x100ac1838UL,arena+0x1f010,4);
  if(mode==0){float n=((float(*)(void*,void*))0x100258790UL)(arena+0x1000,arena+0x6000);memcpy(&result,&n,4);}
  else if(mode==1){int32_t alias=(int32_t)u32(0x1f008);void*out=alias<0?arena+0x12000:arena+0x7000+alias;result=off(((void*(*)(void*,void*))0x10062e430UL)(out,(void*)u64(0x6008)));}else if(mode==2){((void(*)(void*,void*,void*))0x100258f00UL)(arena+0x1000,arena+u32(0x1f018),arena+0x6000);}else if(mode==3){*(uint8_t*)0x101ffb0d0UL=arena[0x1f020];memcpy((void*)0x100cb8540UL,arena+0x1f01c,4);((void(*)(void*,void*))0x1002591f0UL)(arena+0x1000,arena+0xa000);}else if(mode==4){line=severity=0;if(!setjmp(escape))for(uint32_t i=0;i<u32(0x1f20c);i++)flock(arena+0x1000,arena+0x2000,arena+0x9900);result=line|(severity<<16);}else if(mode==5)select_state(arena+0x1000,arena+0xa000);else if(mode==6){hook(0x1002594c0UL,select_service);*(uint8_t*)0x101ffb0d0UL=arena[0x1f020];memcpy((void*)0x100cb8540UL,arena+0x1f01c,4);for(uint32_t frame=0;frame<u32(0x1f274);frame++)((void(*)(void*,void*,void*,void*))0x10025a880UL)(arena+0x1000,arena+0xa000,arena+0x12000,arena+0x12004);}else return 7;
  wr(&result,4);wr(&used,4);wr(trace,sizeof trace);wr(arena,0x20000);
 }return 0;
}
