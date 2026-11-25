/* Original CloudCard 128-byte group sort and 12-byte distance sort.
 * Only native storage/stack guard are initialized; sort bodies are untouched. */
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
static void readin(void *p,size_t n) { if(fread(p,1,n,stdin)!=n)__builtin_trap(); }
int main(int argc,char **argv) {
    if(argc!=2)return 2;
    FILE *file=fopen(argv[1],"rb");if(!file)return 3;
    void *mem=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
    if(mem==MAP_FAILED||fread(mem,1,0xd22000,file)!=0xd22000)return 4;
    fclose(file);
    static uint64_t guard=123;void *g=&guard;memcpy((void *)0x100c0d8d8UL,&g,8);
    static _Alignas(32) uint8_t records[512*128];
    uint32_t cases;readin(&cases,4);fwrite(&cases,4,1,stdout);
    for(unsigned c=0;c<cases;c++) {
        uint32_t mode,count;readin(&mode,4);readin(&count,4);if(mode>1||count>512)return 5;
        const unsigned stride=mode?12:128;memset(records,0,sizeof(records));
        for(uint32_t i=0;i<count;i++) {
            uint8_t *record=records+i*stride;
            readin(record+(mode?0:0x20),4);memcpy(record+(mode?4:0),&i,4);
            /* A second semantic field checks association through every move. */
            uint32_t marker=i*1664525U+1013904223U;
            memcpy(record+(mode?8:0x18),&marker,4);
        }
        ((void (*)(void *,void *))(mode?0x100224290UL:0x100222830UL))(records,records+count*stride);
        fwrite(&count,4,1,stdout);
        for(unsigned i=0;i<count;i++) {
            uint8_t *record=records+i*stride;
            fwrite(record+(mode?4:0),4,1,stdout);fwrite(record+(mode?0:0x20),4,1,stdout);fwrite(record+(mode?8:0x18),4,1,stdout);
        }
    }
    return 0;
}
