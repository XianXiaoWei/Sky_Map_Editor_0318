#define SKY_TRANSFORM_OBJECT_LIBRARY
#include "native-transform-object-oracle.c"
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *f=fopen(argv[1],"rb");if(!f)return 3;map_memory((void *)0x100000000UL,0x2400000);if(fread((void *)0x100000000UL,1,0xd22000,f)!=0xd22000)return 4;fclose(f);
 map_memory(registry,0x9000);map_memory(objects,0x2000);map_memory(event_barn,0x105100);
 ptr((void *)0x102047c70UL,(uintptr_t)registry);ptr((void *)0x1020045b8UL,(uintptr_t)(registry+0x5000));ptr((void *)0x100c0d8d8UL,(uintptr_t)&guard);
 hook(0x1007e5f70UL,assertion);hook(0x1007abc10UL,meta_object);hook(0x1007abbf0UL,meta_void);hook(0x1007abbd0UL,meta_bool);hook(0x1007fa3b0UL,meta_matrix);hook(0x1007abc60UL,meta_fallback);hook(0x102310100UL,meta_receiver);
 bind(0x100aa2c4eUL,strcmp);bind(0x100aa2900UL,memset);*(uint8_t *)0x100cd3120UL=0;install_level_mesh();if(mprotect((void *)0x100000000UL,0xc05000,5)||mprotect((void *)0x102310000UL,4096,5))return 6;
 uint32_t count;rd(&count,4);wr(&count,4);
 while(count--){uint32_t h[4];rd(h,16);setup();setup_level_mesh();memcpy(registry+0x5e38,&(uint32_t){17},4);rd(objects,0x2000);error_line=severity=log_count=0;uint32_t result=0;
  if(!setjmp(escape)){
   if((h[0]==4||h[0]==9)&&!u64(objects+0x228)){error_line=0xfffffffd;log_service(61,NULL,4);}
   else switch(h[0]){
    case 0:((void *(*)(void *,void *))0x100403670UL)(NULL,objects);break;
    case 1:((void *(*)(void *,void *))0x100402ab0UL)(objects+0x1900,objects);break;
    case 2:((void (*)(void *,void *))0x1003ffe10UL)(objects,objects+0x1800);break;
    case 3:
     ((void (*)(void *,void *))0x1004d1d50UL)(objects+8,objects+0x1800);
     ((void *(*)(void *,void *))0x1004d1e40UL)(objects+0x1900,objects+8);
     ((void (*)(void *,uint8_t))0x1004d1f60UL)(objects+8,0);log_service(9,NULL,((uint8_t (*)(void *))0x1004d2050UL)(objects+8));
     ((void (*)(void *,uint8_t))0x1004d1f60UL)(objects+8,1);log_service(9,NULL,((uint8_t (*)(void *))0x1004d2050UL)(objects+8));break;
    case 4:((void *(*)(void *,void *))0x100402b60UL)(objects+0x1980,objects);break;
    case 5:case 7:{void *args[]={objects+0x1800,registry+0x5200};((void (*)(uintptr_t,uintptr_t,void *,void *,void *,void **,uint32_t))(h[0]==5?0x1004037c0UL:0x1004038e0UL))(h[0]==5?0x1003ffe10UL:0x19,h[2],objects-h[2],objects+0x1900,registry+0x5200,args,h[3]);break;}
    case 6:((void (*)(void *,uint8_t))0x1003ffe50UL)(objects,h[1]);result=((uint8_t (*)(void *))0x100402a80UL)(objects);break;
    case 8:((void (*)(void *,void *))0x100463750UL)(objects+0x1000,objects+0x1800);break;
    case 9:((void *(*)(void *,void *))0x100402b10UL)(objects+0x1940,objects);break;
    case 10:((void (*)(void *,void *))0x1003ffe10UL)(objects,objects+h[1]);break;
    case 11:result=((uint32_t (*)(void *))0x100402bc0UL)(objects);break;
    default:return 9;
   }
  }
  uint32_t out[]={error_line,severity,log_count,result};wr(out,16);wr(log_entries,log_count*12);wr(objects,0x2000);
 }
 return 0;
}
