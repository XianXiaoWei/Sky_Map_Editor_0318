#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
static uint8_t *a=(void*)0x410000000UL;static uint64_t traces[256][2];static uint32_t calls;
static void rd(void*p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}static void wr(void*p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
static uint32_t u(void*p){uint32_t n;memcpy(&n,p,4);return n;}
static void p32(void*p,uint32_t n){memcpy(p,&n,4);}
static void hook(uintptr_t at,void*fn){uint8_t b[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};memcpy(b+6,&fn,8);memcpy((void*)at,b,14);}
static void mutate(void){if(calls!=u(a+0xf000))return;float vector[]={-.125f,-.25f,-.375f,-.5f};memcpy((void*)0x10203f6e0UL,vector,16);p32(a+0x8038,0x12345678);}
static void *metadata(uint32_t index,uintptr_t fn){traces[calls][0]=fn;traces[calls++][1]=0;mutate();return a+0xc000+index*0x100;}
static void vertex(void*p){traces[calls][0]=0x1007f5010UL;traces[calls++][1]=(uintptr_t)p;memset(p,0x31,0x438);mutate();}
static void render(void*p){traces[calls][0]=0x1007f5d80UL;traces[calls++][1]=(uintptr_t)p;memset(p,0x47,0x560);mutate();}
static void *meta0(void){return metadata(0,0x100059920UL);}
static void *meta1(void){return metadata(1,0x100059940UL);}
static void *meta2(void){return metadata(2,0x100059960UL);}
static void *meta3(void){return metadata(3,0x100059980UL);}
static void *meta4(void){return metadata(4,0x1000599a0UL);}
static void *meta5(void){return metadata(5,0x1000599c0UL);}
static void *meta6(void){return metadata(6,0x1002129e0UL);}
static void *meta7(void){return metadata(7,0x100355ee0UL);}
static void *meta8(void){return metadata(8,0x100407ab0UL);}
static void *meta9(void){return metadata(9,0x10074a170UL);}
static void *meta10(void){return metadata(10,0x1007abc10UL);}
static uintptr_t globals[]={0x100aa50c0UL,0x100aa7660UL,0x100aa80a0UL,0x100aa8a00UL,0x100aa8a30UL,0x100aaa8c0UL,0x100ab9620UL,0x100c0a678UL,0x100c0a688UL,0x100c0a7b8UL,0x100c0ca28UL,0x100c0ca88UL,0x100c0ca98UL,0x100c0ce38UL,0x100c0ce40UL,0x100c0cec0UL,0x100c0d1b0UL,0x100c0d1f8UL,0x100c0d4b8UL,0x100c0d4e0UL,0x100c0d4f0UL,0x100c0d670UL,0x100c128e8UL,0x100c134b0UL,0x100c14cc0UL,0x101ddae00UL,0x101ddb600UL,0x101de22a0UL,0x101de89d8UL,0x101dee560UL,0x101deed90UL,0x101df0708UL,0x101df0a68UL,0x101df0b10UL,0x101df16f0UL,0x101df2510UL,0x101df3480UL,0x101df6850UL,0x101df7380UL,0x101fffd70UL,0x102007148UL,0x102009010UL,0x102011dd0UL,0x1020121f0UL,0x102013878UL,0x102014e90UL,0x102015330UL,0x102018778UL,0x10201a728UL,0x10201d720UL,0x10201d8e8UL,0x1020209e0UL,0x10203f6b0UL,0x10203f6e0UL,0x101df4208UL};
static uint32_t sizes[]={4,16,16,16,16,16,32,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,16,16,16,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,16,16,8};
int main(int argc,char**argv){if(argc!=2)return 2;FILE*f=fopen(argv[1],"rb");if(!f)return 3;if(mmap((void*)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 4;if(fread((void*)0x100000000UL,1,0xd22000,f)!=0xd22000)return 5;fclose(f);if(mmap(a,65536,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)return 6;
hook(0x100059920UL,meta0);hook(0x100059940UL,meta1);hook(0x100059960UL,meta2);hook(0x100059980UL,meta3);hook(0x1000599a0UL,meta4);hook(0x1000599c0UL,meta5);hook(0x1002129e0UL,meta6);hook(0x100355ee0UL,meta7);hook(0x100407ab0UL,meta8);hook(0x10074a170UL,meta9);hook(0x1007abc10UL,meta10);hook(0x1007f5010UL,vertex);hook(0x1007f5d80UL,render);
uint32_t n;rd(&n,4);wr(&n,4);while(n--){uint32_t kind;rd(&kind,4);rd(a,65536);for(uint32_t i=0;i<sizeof globals/sizeof globals[0];i++)rd((void*)globals[i],sizes[i]);for(uint32_t i=0;i<11;i++)p32(a+0xc038+i*0x100,1000+i);uintptr_t fn=0;switch(kind){case 0:fn=0x1001b1e20UL;break;case 1:fn=0x1004f7ed0UL;break;case 2:fn=0x100221b70UL;break;case 3:fn=0x100285be0UL;break;case 4:fn=0x1002cec10UL;break;case 5:fn=0x1002dcf80UL;break;case 6:fn=0x10031c830UL;break;case 7:fn=0x1004f4840UL;break;case 8:fn=0x1003528e0UL;break;case 9:fn=0x1003594f0UL;break;case 10:fn=0x1003ee990UL;break;case 11:fn=0x1001b2f50UL;break;case 12:fn=0x1004e2bc0UL;break;case 13:fn=0x100540e30UL;break;case 14:fn=0x100568920UL;break;case 15:fn=0x10052b080UL;break;case 16:fn=0x10031d450UL;break;case 17:fn=0x10031dbd0UL;break;case 18:fn=0x1004d8170UL;break;case 19:fn=0x10056b060UL;break;case 20:fn=0x100593a90UL;break;case 21:fn=0x100462440UL;break;case 22:fn=0x1004d7320UL;break;case 23:fn=0x100329f90UL;break;case 24:fn=0x100480880UL;break;}if(!fn)return 7;calls=0;memset(traces,0,sizeof traces);void*result=0;for(uint32_t i=0;i<u(a+0xf004);i++)result=((void*(*)(void*,void*))fn)(a+0x1000+i*0x2000,a+0x1000+i*0x2000);wr(&result,8);wr(&calls,4);wr(traces,calls*16);wr(a,65536);wr((void*)0x101df0a68UL,8);}return 0;}
