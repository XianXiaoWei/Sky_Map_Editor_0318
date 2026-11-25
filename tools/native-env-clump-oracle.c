/* Original Clump registration, Marker casting/enabled, spatial, fade and full
 * Environment update/mix. Python SHA-gates the supplied Mach-O. Metadata for
 * the test parameter groups supplies explicit field size/identity only; Marker
 * and Object casting use the ORIGINAL vtables, class lookup and mixin offsets.
 * Original imported bzero is bound to memset. No game files are written.
 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
typedef struct { uintptr_t *vtable; uintptr_t reserved; } Meta;
static Meta metadata[8];
static Meta *identity(Meta *m) { return m; }
static size_t object_size(Meta *m) { (void)m; return 32; }
static void *construct(Meta *m, void *p) { memset(p,0,32); *(uint32_t *)p=(uint32_t)(m-metadata); return p; }
static void zero_bytes(void *p,size_t n) { memset(p,0,n); }
static void putptr(void *p,size_t at,const void *v) { memcpy((uint8_t *)p+at,&v,8); }
static void put32(void *p,size_t at,uint32_t v) { memcpy((uint8_t *)p+at,&v,4); }
static int read_bytes(void *p,size_t n) { return fread(p,1,n,stdin)==n; }
static int write_bytes(const void *p,size_t n) { return fwrite(p,1,n,stdout)==n; }
int main(int argc,char **argv) {
    if(argc!=2) return 2;
    FILE *file=fopen(argv[1],"rb"); if(!file) return 3;
    void *memory=mmap((void *)0x100000000UL,0x2400000,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
    if(memory==MAP_FAILED) return 4;
    if(fread(memory,1,0xd22000,file)!=0xd22000) return 5;
    fclose(file); if(mprotect(memory,0xc05000,PROT_READ|PROT_EXEC)) return 6;
    static uint64_t guard=0x123456789abcdef;
    putptr((void *)0x100c0d8d8UL,0,&guard); putptr((void *)0x100c0e4b8UL,0,zero_bytes);
    static uint8_t registry[0x98+0x500*8], marker_meta[80], object_meta[80];
    putptr((void *)0x102047c70UL,0,registry);
    putptr(marker_meta,0,(void *)0x100cc6138UL); put32(marker_meta,0x38,32);
    putptr(object_meta,0,(void *)0x100d12db8UL);
    putptr(registry,0x98+32*8,marker_meta);
    putptr((void *)0x1020045b8UL,0,marker_meta); putptr((void *)0x102047f70UL,0,object_meta);
    uintptr_t vtable[32]={0}; vtable[0x68/8]=(uintptr_t)identity;
    vtable[0xa0/8]=(uintptr_t)object_size; vtable[0xc0/8]=(uintptr_t)construct;
    for(int i=0;i<8;++i) { metadata[i].vtable=vtable; putptr(registry,0x98+i*8,&metadata[i]); }
    typedef void (*Init)(void *);
    typedef void (*Vars)(void *,void *);
    typedef void *(*Hull)(void *,void *,void *,uint32_t,float,float,float,float);
    typedef void (*Weight)(const void *,const float *,float *,void **);
    typedef void (*Fade)(void *,float);
    typedef void (*Update)(void *,void *,void *);
    uint32_t h[6];
    while(read_bytes(h,sizeof(h))) {
        uint32_t mode=h[0],nm=h[1],nv=h[2],nf=h[3],tag=h[4],layer=h[5];
        if(mode>2 || nm>16 || !nv || nv>8 || nf>128 || tag>11 || layer>3 || (mode!=0&&!nm)) return 7;
        float control[7]; if(!read_bytes(control,sizeof(control))) return 9;
        _Alignas(32) uint8_t env[0x2e270]={0};
        _Alignas(16) uint8_t markers[16][0x50]={0},clump[0x20]={0},runtime[0x40]={0};
        _Alignas(16) uint8_t outputs[8][32]={0},defaults[8][32]={0},values[8][32]={0};
        void *refs[16]; uint8_t *entries[8];
        for(uint32_t j=0;j<nm;++j) {
            uint32_t enabled; if(!read_bytes(&enabled,4)||!read_bytes(markers[j]+16,48)) return 9;
            putptr(markers[j],0,(void *)0x100cc6250UL); put32(markers[j],8,32); markers[j][0x40]=enabled!=0;
            refs[j]=markers[j]+8; /* serialized Object* points at the mixin */
        }
        putptr(clump,8,refs); put32(clump,0x10,nm); putptr(runtime,8,clump);
        memcpy(runtime+0x18,control,24); runtime[0x30]=control[6]!=0;
        if(mode==0) {
            _Alignas(16) float point[4]; float out; void *vars;
            if(!read_bytes(point,16)) return 9;
            ((Weight)0x10031a6f0UL)(runtime,point,&out,&vars);
            if(!write_bytes(&out,4)) return 8;
        } else if(mode==1) {
            for(uint32_t i=0;i<nf;++i) {
                float dt; uint32_t mask; if(!read_bytes(&dt,4)||!read_bytes(&mask,4)) return 9;
                if(mask!=UINT32_MAX) for(uint32_t j=0;j<nm;++j) markers[j][0x40]=(mask>>j)&1;
                ((Fade)0x10031a450UL)(runtime,dt);
                float out[4]; memcpy(out,runtime+0x28,8); out[2]=markers[0][0x40]; out[3]=runtime[0x30];
                if(!write_bytes(out,16)) return 8;
            }
        } else {
            ((Init)0x100319840UL)(env);
            uint32_t fields[8][2]; uint8_t caches[8][24]={0};
            for(uint32_t v=0;v<nv;++v) {
                put32(outputs[v],0,v); put32(defaults[v],0,v); put32(values[v],0,v);
                if(!read_bytes(outputs[v]+16,16)||!read_bytes(defaults[v]+16,16)||!read_bytes(values[v]+16,16)) return 9;
                ((Vars)0x10031b220UL)(env,outputs[v]);
                fields[v][0]=tag; fields[v][1]=16; putptr(caches[v],0,fields[v]); put32(caches[v],8,1); putptr(caches[v],16,&metadata[v]);
                putptr(env,0x50+v*8,caches[v]);
                ((Vars)0x10031b2e0UL)(env,defaults[v]);
                entries[v]=((Hull)0x10031b3c0UL)(env,values[v],clump,layer,control[0],control[1],control[2],control[3]);
                if(!write_bytes(entries[v]+24,32)) return 8;
            }
            env[0x2e264]=0;
            for(uint32_t i=0;i<nf;++i) {
                float clock[4]; uint32_t mask; _Alignas(16) uint8_t camera[0x1a0]={0},time[0x30]={0};
                if(!read_bytes(clock,16)||!read_bytes(&mask,4)||!read_bytes(camera+0x190,16)) return 9;
                memcpy(time+0x14,clock,4); memcpy(time+0x20,clock+1,4);
                *(uint8_t *)0x101ffb0d0UL=clock[3]!=0; memcpy((void *)0x100cb8540UL,clock+2,4);
                if(mask!=UINT32_MAX) for(uint32_t j=0;j<nm;++j) markers[j][0x40]=(mask>>j)&1;
                ((Update)0x100319a30UL)(env,time,camera);
                for(uint32_t v=0;v<nv;++v) if(!write_bytes(outputs[v]+16,16)||!write_bytes(entries[v]+40,16)) return 8;
                uint32_t enabled=markers[0][0x40]; if(!write_bytes(&enabled,4)) return 8;
            }
        }
    }
    return ferror(stdin)?9:0;
}
