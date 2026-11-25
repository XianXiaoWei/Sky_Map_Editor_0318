/* Whole original FloatAdd/FloatEnable/IfEnabled/SetFloat and Event base
 * routines. Enable metadata, casts, assertions and libm are host services. */
#define main numeric_oracle_main
#include "native-object-numeric-oracle.c"
#undef main
#include <math.h>
static uint32_t trace[100000][2],trace_count,math_count;
static float math_values[32][2];
static uint8_t event_state[96],game[0x200],time_state[0x40],event_clump[32],meta[64];
static uint8_t *cells;
static void record(uint32_t kind,uint32_t arg){if(trace_count>=100000)exit(12);trace[trace_count][0]=kind;trace[trace_count++][1]=arg;}
static void set_enabled(void *p,uint32_t enabled){uint32_t id=p?(uint32_t)(((uint8_t *)p-cells)/32):0xffffffff;record(1,id);record(2,enabled);if(p)((uint8_t *)p)[0xc]=enabled!=0;}
static uint8_t get_enabled(void *p){uint32_t id=p?(uint32_t)(((uint8_t *)p-cells)/32):0xffffffff;record(3,id);return p?((uint8_t *)p)[0xc]!=0:1;}
static void transition(void *p){(void)p;record(4,event_state[0x21]|event_state[0x22]<<8|event_state[0x23]<<16);}
static float host_log(float value){float result=logf(value);if(math_count>=32)exit(13);math_values[math_count][0]=value;math_values[math_count++][1]=result;return result;}
static float host_exp(float value){float result=expf(value);if(math_count>=32)exit(13);math_values[math_count][0]=value;math_values[math_count++][1]=result;return result;}
static void patch_function(uintptr_t address,void *fn){uintptr_t page=address&~4095UL;if(mprotect((void *)page,4096,PROT_READ|PROT_WRITE|PROT_EXEC))exit(6);uint8_t *s=(uint8_t *)address;s[0]=0xff;s[1]=0x25;memset(s+2,0,4);memcpy(s+6,&fn,8);if(mprotect((void *)page,4096,PROT_READ|PROT_EXEC))exit(6);}
int main(int argc,char **argv){
 if(argc!=2)return 2;
 int init=initialize_native(argv[1]);if(init)return init;
 patch_function(0x1004d1f60UL,set_enabled);patch_function(0x1004d2050UL,get_enabled);
 /* Original libm import stubs resolve through verified GOT destinations. */
 if(mprotect((void *)0x102300000UL,4096,PROT_READ|PROT_WRITE))return 6;
 bind_call(0x102300080UL,0x100c0e9a0UL,host_log);bind_call(0x1023000a0UL,0x100c0e7e0UL,host_exp);
 if(mprotect((void *)0x102300000UL,4096,PROT_READ|PROT_EXEC))return 6;
 object_metadata[0]=(uintptr_t)float_vtable;
 memcpy((void *)0x101df4208UL,&(uintptr_t){(uintptr_t)meta},8);
 uintptr_t event_vtable[9]={0};event_vtable[6]=(uintptr_t)transition;event_vtable[7]=(uintptr_t)transition;event_vtable[8]=(uintptr_t)transition;
 static uint32_t count;read_exact(&count,4);write_exact(&count,4);
 while(count--){
  static uint32_t h[7],kind,return_value;read_exact(h,sizeof(h));kind=h[0];if(kind>12||h[1]>100000||h[2]>65535||h[3]>65535)return 9;
  uint8_t barn[32];read_exact(event_state,96);read_exact(barn,32);float frame[3];read_exact(frame,12);
  cells=malloc(h[1]*32+1);read_exact(cells,h[1]*32);uint32_t *object_indices=malloc(h[2]*4+1),*event_indices=malloc(h[3]*4+1);read_exact(object_indices,h[2]*4);read_exact(event_indices,h[3]*4);
  void **objects=malloc(h[2]*8+1),**events=malloc(h[3]*8+1);
  for(uint32_t i=0;i<h[2];i++){if(object_indices[i]!=0xffffffff&&object_indices[i]>=h[1])return 9;objects[i]=object_indices[i]==0xffffffff?NULL:cells+object_indices[i]*32;}
  for(uint32_t i=0;i<h[3];i++){if(event_indices[i]!=0xffffffff&&event_indices[i]>=h[1])return 9;events[i]=event_indices[i]==0xffffffff?NULL:cells+event_indices[i]*32;}
  memset(clump,0,32);memcpy(clump+8,&objects,8);memcpy(clump+0x10,h+2,4);memset(event_clump,0,32);memcpy(event_clump+8,&events,8);memcpy(event_clump+0x10,h+3,4);
  void *p=barn;memcpy(event_state+0x18,&p,8);p=event_vtable;memcpy(event_state,&p,8);
  if(kind==0){if(h[4]>=h[1])return 9;p=cells+h[4]*32;memcpy(event_state+0x38,&p,8);p=h[5]==0xffffffff?NULL:cells+h[5]*32;memcpy(event_state+0x40,&p,8);p=h[6]==0xffffffff?NULL:cells+h[6]*32;memcpy(event_state+0x48,&p,8);}
  if(kind==1){if(h[4]>=h[1])return 9;p=cells+h[4]*32;memcpy(event_state+0x38,&p,8);p=clump;memcpy(event_state+0x40,&p,8);}
  if(kind==2){p=clump;memcpy(event_state+0x38,&p,8);p=event_clump;memcpy(event_state+0x48,&p,8);}
  if(kind==3||kind==4){if(h[4]>=h[1])return 9;p=cells+h[4]*32;memcpy(event_state+0x40,&p,8);memset(game,0,sizeof(game));memset(time_state,0,sizeof(time_state));p=time_state;memcpy(game+0x160,&p,8);memcpy(time_state+0x14,frame,4);memcpy(time_state+0x20,frame+1,4);uint8_t debug=1;memcpy((void *)0x101ffb0d0UL,&debug,1);memcpy((void *)0x100cb8540UL,frame+2,4);}
  if(kind==5)memcpy(meta+0x38,&h[4],4);
  casts=gets=asserts=assert_line=trace_count=math_count=log_events=log_chars=0;has_mutation=invalid_member=0;return_value=0xfffffffe;
  typedef void (*Execute)(void *,void *);typedef uint32_t (*Query)(void *);
  static uintptr_t addresses[]={0x1007194a0UL,0x100717f80UL,0x100718320UL,0x1007176f0UL,0x100717730UL,0x10032eea0UL,0x10032f0f0UL,0x10032f110UL,0x10032f130UL,0x10032f170UL,0x10032f1e0UL,0x10032f200UL,0x10032f220UL};
  if(setjmp(escape)==0){if(kind>=7&&kind<=9)return_value=((Query)addresses[kind])(event_state);else ((Execute)addresses[kind])(event_state,game);if(kind==7)return_value&=255;}
  /* Exclude only pointers installed by this harness; constructor's original
   * vtable address is compared separately as an original produced value. */
  if(kind!=5)memset(event_state,0,8);
  memset(event_state+0x18,0,8);
  if(kind==0)memset(event_state+0x38,0,24);
  if(kind==1)memset(event_state+0x38,0,16);
  if(kind==2){memset(event_state+0x38,0,8);memset(event_state+0x48,0,8);}
  if(kind==3||kind==4)memset(event_state+0x40,0,8);
  uint32_t results[]={return_value,casts,asserts,assert_line,trace_count,math_count};write_exact(results,sizeof(results));write_exact(trace,trace_count*8);write_exact(math_values,math_count*8);write_exact(event_state,96);write_exact(barn,32);write_exact(cells,h[1]*32);
  free(cells);free(object_indices);free(event_indices);free(objects);free(events);
 }
 return 0;
}
