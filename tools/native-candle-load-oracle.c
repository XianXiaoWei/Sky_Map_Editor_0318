#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
static uint8_t *arena=(void*)0x450000000UL;
static jmp_buf escape;
static uint32_t line,severity,calls,flames,effects,sounds,randoms;
static uint32_t allocation;
static uint8_t trace[256][640];
static uint32_t u(void*p){uint32_t n;memcpy(&n,p,4);return n;}
static uint64_t q(void*p){uint64_t n;memcpy(&n,p,8);return n;}
static float f32(void*p){float n;memcpy(&n,p,4);return n;}
static void put(void*p,uint32_t n){memcpy(p,&n,4);}
static void pq(void*p,uint64_t n){memcpy(p,&n,8);}
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static void hook(uintptr_t at,void*fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static uint8_t *record(uint32_t tag){if(calls>=256)exit(15);uint8_t*r=trace[calls++];memset(r,0,640);put(r,tag);return r;}
static void assertion(char*x,char*file,uint32_t l,uint32_t s,...){(void)x;(void)file;line=l;severity=s;longjmp(escape,1);}
static void zero(void*p,size_t n){memset(p,0,n);}
static void *create_flame(void*owner,uint32_t arg){uint8_t*r=record(1),*p=arena+0xa0000+(flames++)*0x1b0;pq(r+8,(uintptr_t)owner);put(r+16,arg);pq(r+24,(uintptr_t)p);return p;}
static void load_flame(void*p,void*a,void*b){uint8_t*r=record(2);pq(r+8,(uintptr_t)p);pq(r+16,(uintptr_t)a);pq(r+24,(uintptr_t)b);if(u(arena+0xf001c)){((uint8_t*)p)[0xb6]=1;put(p+0x110,0);} }
static void setup_vertex(void*p,void*ref,void*dependency,char*name,void*buffer,uint32_t flag){
 uint8_t*r=record(3);pq(r+8,(uintptr_t)p);pq(r+16,(uintptr_t)ref);pq(r+24,(uintptr_t)dependency);pq(r+32,(uintptr_t)buffer);put(r+40,flag);memcpy(r+48,name,strlen(name)+1);
 uint32_t mode=u(arena+0xf0010);((uint8_t*)p)[0x538]=mode==2?0:1;((uint8_t*)p)[0x52a]=mode==1?1:0;
}
static uint32_t shader(void*p,char*name){uint8_t*r=record(4);pq(r+8,(uintptr_t)p);memcpy(r+16,name,strlen(name)+1);return 7;}
static uint8_t ray(void*owner,void*start,void*direction,void*config,void*out,float distance){
 uint8_t*r=record(5);pq(r+8,(uintptr_t)owner);memcpy(r+16,start,16);memcpy(r+32,direction,16);memcpy(r+48,config,9);memcpy(r+64,config+16,16);memcpy(r+80,&distance,4);
 if(u(arena+0xf0028)){memcpy(out,arena+0xf0120,32);return 1;}return 0;
}
// These are independently provided arithmetic services, not macOS libm.
// Verify the original call arguments and service-return consumption exactly.
static float acos_service(float n){uint8_t*r=record(6);memcpy(r+8,&n,4);return f32(arena+0xf0030);}
static float tan_service(float n){uint8_t*r=record(7);memcpy(r+8,&n,4);return f32(arena+0xf0034);}
static void *metadata(void){record(8);return arena+0xf0060;}
static void *create_effect(void*owner,void*meta){uint8_t*r=record(9),*p=arena+0xc0000+(effects++)*0x80;pq(r+8,(uintptr_t)owner);pq(r+16,(uintptr_t)meta);pq(r+24,(uintptr_t)p);return p;}
static void activate(void*p){uint8_t*r=record(10);pq(r+8,(uintptr_t)p);uint32_t delta=u(arena+0xf000c);if(delta){put(arena+0xf6d0,u(arena+0xf6d0)+delta);put(arena+0xf000c,0);} }
typedef struct {uint64_t pointer,token;} Handle;
static int random_service(void){put(record(22)+8,randoms);return (int)u(arena+0xf0068+4*(randoms++&1));}
static Handle audio(void*owner,char*name,void*options,void*parameters){
 uint8_t*r=record(11);pq(r+8,(uintptr_t)owner);memcpy(r+16,name,strlen(name)+1);memcpy(r+48,options,128);memcpy(r+176,parameters,0x1b0);
 if(++sounds==1&&u(arena+0xf0014)){uint8_t*p=arena+0xa0000;pq(p+0x148,(uintptr_t)(arena+0xf0070));put(p+0xa8,0x40a00000);put(p+0x108,0x3f400000);put(p+0x10c,0x40000000);put(p+0xac,0x3f000000);put(p+0xc4,0x41200000);}return (Handle){u(arena+0xf0000)>=10?(uintptr_t)(arena+0xe3000):0,u(arena+0xf0000)>=10?123:0};
}
static void *registry(void){record(12);return arena+0xe6000;}
static void registration(void){record(13);}
static void network(void*owner,void*message){uint8_t*r=record(14);pq(r+8,(uintptr_t)owner);memcpy(r+16,message,8);memcpy(r+24,message+8,4);memcpy(r+28,message+20,4);}
static void *allocator(void){record(15);return arena+0xe9200;}
static void *allocate(void*owner,size_t n,void*heap,uint32_t alignment){uint8_t*r=record(16);pq(r+8,(uintptr_t)owner);pq(r+16,n);pq(r+24,(uintptr_t)heap);put(r+32,alignment);allocation=(allocation+alignment-1)&~(alignment-1);void*p=arena+allocation;allocation+=n+16;return p;}
static void release(void*owner,void*p){uint8_t*r=record(17);pq(r+8,(uintptr_t)owner);pq(r+16,(uintptr_t)p);}
static void camera_position(void*out,void*camera){uint8_t*r=record(18);pq(r+8,(uintptr_t)camera);memcpy(out,arena+0xf00c0,16);}
static void visibility(void*owner,void*spheres,uint32_t count,void*statuses,uint32_t mode){uint8_t*r=record(19);pq(r+8,(uintptr_t)owner);pq(r+16,(uintptr_t)spheres);put(r+24,count);pq(r+32,(uintptr_t)statuses);put(r+40,mode);if(count>32)exit(16);memcpy(r+64,spheres,count*16);for(uint32_t i=0;i<count;i++)put(statuses+i*4,(u(arena+0xf0058)>>i)&1);}
static void parameter(void*owner,uint32_t index,void*value){uint8_t*r=record(20);pq(r+8,(uintptr_t)owner);put(r+16,index);memcpy(r+32,value,16);}
static uint64_t handle_identity(void*p){uint8_t*r=record(23);pq(r+8,(uintptr_t)p);if(u(arena+0xf00e4)){pq(arena+0xa0168,(uintptr_t)(arena+0xe3200));put(arena+0xf00e4,0);}return q(arena+0xf00e0);}
static void stop_handle(void*p,uint32_t enabled){uint8_t*r=record(24);pq(r+8,(uintptr_t)p);put(r+16,enabled);}
static void unload_vertex(void*p){pq(record(25)+8,(uintptr_t)p);if(u(arena+0xf00e8)){put(arena+0xf980,1);put(arena+0xf00e8,0);}}
static float exp_service(float input){memcpy(record(26)+8,&input,4);return f32(arena+0xf0060);}
static float pow_service(float input,float exponent){uint8_t*r=record(27);memcpy(r+8,&input,4);memcpy(r+12,&exponent,4);return f32(arena+(exponent==3?0xf0054:0xf005c));}
static void jump_equal(uintptr_t from,uintptr_t to){uint8_t b[6]={0x0f,0x84};int32_t d=(int32_t)(to-from-6);memcpy(b+2,&d,4);memcpy((void*)from,b,6);}
static void jump(uintptr_t from,uintptr_t to){uint8_t b[5]={0xe9};int32_t d=(int32_t)(to-from-5);memcpy(b+1,&d,4);memcpy((void*)from,b,5);}
static void render(void*p){pq(record(21)+8,(uintptr_t)p);}
static const uint32_t spans[][2]={{0,0x30000},{0x669c0,0x40},{0x70000,0x26000},{0xa0000,0x8000},{0xc0000,0x2000},{0xf0000,0x200}};
int main(int argc,char**argv){
 if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;
 if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;
 if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);
 if(mmap(arena,0x100000,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
 hook(0x100aa2708UL,exp_service);hook(0x100aa2a2cUL,pow_service);hook(0x1007f6150UL,unload_vertex);
 hook(0x1007e5f70UL,assertion);hook(0x1007e6030UL,assertion);hook(0x100aa24aaUL,zero);
 uint8_t original_load[14];memcpy(original_load,(void*)0x10033afa0UL,14);
 hook(0x100aa2b22UL,random_service);hook(0x10033f470UL,create_flame);hook(0x10033afa0UL,load_flame);hook(0x1007f5d90UL,setup_vertex);hook(0x1007bdb60UL,shader);
 hook(0x100776a90UL,ray);hook(0x100aa2576UL,acos_service);hook(0x100aa2cfcUL,tan_service);
 hook(0x10072d070UL,metadata);hook(0x100039f40UL,create_effect);hook(0x10032e2f0UL,activate);hook(0x1006018a0UL,audio);
 hook(0x1007abc10UL,registry);hook(0x1004b1530UL,registration);hook(0x1004b1f90UL,network);
 hook(0x1007c6c20UL,allocator);hook(0x100795530UL,allocate);hook(0x100795a70UL,release);hook(0x10076be90UL,camera_position);hook(0x100720dd0UL,visibility);hook(0x1007be290UL,parameter);hook(0x1007f6540UL,render);
 uint32_t count;rd(&count,4);wr(&count,4);
 while(count--){
  rd(arena,0x100000);calls=line=severity=flames=effects=sounds=randoms=0;
  if(u(arena+0xf0000)>=10)memcpy((void*)0x10033afa0UL,original_load,14);else hook(0x10033afa0UL,load_flame);allocation=0xd0000;volatile uint64_t result=0;
  pq((void*)0x101dde700UL,(uintptr_t)(arena+0x10000));pq((void*)0x100c0db08UL,(uintptr_t)(arena+0xf0080));pq((void*)0x100c0d8d8UL,(uintptr_t)(arena+0xf0078));
  *(uint8_t*)0x100c90340UL=arena[0xf0024];memcpy((void*)0x100c90344UL,arena+0xf0020,4);
  *(uint8_t*)0x101ffb0d0UL=arena[0xf0040];memcpy((void*)0x100cb8540UL,arena+0xf0044,4);*(uint8_t*)0x101dde898UL=0;
  pq((void*)0x101ddea90UL,(uintptr_t)(arena+0xf0180));pq((void*)0x100c0a6c0UL,(uintptr_t)(arena+0xe4000));
  pq((void*)0x102048b50UL,(uintptr_t)(arena+0xe9100));
  pq(arena+0xe3000,(uintptr_t)(arena+0xe3100));pq(arena+0xe3200,(uintptr_t)(arena+0xe3100));pq(arena+0xe3100,(uintptr_t)handle_identity);pq(arena+0xe3130,(uintptr_t)stop_handle);
  if(!setjmp(escape))switch(u(arena+0xf0000)){
   case 0:((void(*)(void*,void*))0x1001e9320UL)(arena,arena+0xf1000);break;
   case 1:result=(uintptr_t)((void*(*)(void*))0x1001eab70UL)(arena);break;
   case 2:((void(*)(void*,void*))0x1001eaf00UL)(arena+0x70000,arena+u(arena+0xf0008));break;
   case 3:((void(*)(void*,void*))0x10033abc0UL)(arena+0xa0000,arena+u(arena+0xf0008));break;
   case 4:((void(*)(void*))0x10033a760UL)(arena+0xa0000);break;
   case 5:((void(*)(void*,uint32_t))0x10033a780UL)(arena+0xa0000,u(arena+0xf0004));break;
   case 6:for(uint32_t i=0;i<u(arena+0xf0048);i++)((void(*)(void*,void*))0x1001e9ba0UL)(arena,arena+0xf1000);break;
   case 7:((void(*)(void*,void*,uint32_t,uint32_t))0x1001eb190UL)(arena,arena+0xf1000,u(arena+0xf004c),u(arena+0xf0004));break;
   case 8:((void(*)(void*,float))0x10033b460UL)(arena+0xa0000,f32(arena+0xf0050));break;
   case 9:((void(*)(void*,void*))0x1001ea220UL)(arena,arena+0xf1000);break;
   case 10:((void(*)(void*,void*,void*))0x10033afa0UL)(arena+0xa0000,arena+0xe2000,arena+0xe3000);break;
   case 11:((void(*)(void*,void*))0x1001e9320UL)(arena,arena+0xf1000);break;
   case 12:((void(*)(void*))0x10033b350UL)(arena+0xa0000);break;
   case 13:((void(*)(void*))0x1001e99c0UL)(arena);break;
   case 14:jump_equal(0x10033c199UL,0x10033d40bUL);jump(0x10033c2ecUL,0x10033d40bUL);((void(*)(void*,void*,void*,float))0x10033c010UL)(arena+0xa0000,arena+0xe2000,arena+0xf1000,f32(arena+0xf0050));break;
   default:return 7;
  }
  uint32_t header[]={line,severity,calls};uint64_t returned=result;wr(header,12);wr(&returned,8);wr(trace,calls*640);
  for(unsigned i=0;i<sizeof(spans)/sizeof(spans[0]);i++)wr(arena+spans[i][0],spans[i][1]);
 }
 return 0;
}
