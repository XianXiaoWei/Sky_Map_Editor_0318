/* Execute original resolved-Mesh Beamo/BeamoDecal LOD/bake selection unchanged.
 * The wrapper supplies registers/stack slots established by the real loader.
 * Only the first instruction AFTER the verified subchain is a return service.
 */
#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
static uint8_t *storage=(void *)0x2b0000000UL;
extern uint32_t select_bake(void *context,uint32_t found);
__asm__(
 ".text\n.global select_bake\nselect_bake:\n"
 "push %rbp\nmov %rsp,%rbp\npush %rbx\npush %r12\npush %r13\npush %r14\npush %r15\nsub $8,%rsp\n"
 "mov %rdi,%rbx\nmov 0(%rbx),%r8\nlea 0x18(%r8),%r14\nxor %r13d,%r13d\nmov %esi,%eax\n"
 "movabs $0x100195427,%r11\ncall *%r11\n"
 "add $8,%rsp\npop %r15\npop %r14\npop %r13\npop %r12\npop %rbx\npop %rbp\nret\n"
 ".global selection_done\nselection_done:\nmovzbl %dil,%eax\nret\n");
extern void selection_done(void);
static void map(void *p,size_t n){if(mmap(p,n,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED)exit(5);}
static void rd(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void wr(void *p,size_t n){if(fwrite(p,1,n,stdout)!=n)exit(11);}
int main(int argc,char **argv){
 if(argc!=2)return 2;FILE *f=fopen(argv[1],"rb");if(!f)return 3;
 map((void *)0x100000000UL,0x2400000);if(fread((void *)0x100000000UL,1,0xd22000,f)!=0xd22000)return 4;fclose(f);map(storage,4096);
 uint8_t hook[]={0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0};void *end=selection_done;memcpy(hook+6,&end,8);memcpy((void *)0x100195678UL,hook,14);
 if(mprotect((void *)0x100000000UL,0xc05000,5))return 6;
 uint32_t n;rd(&n,4);wr(&n,4);while(n--){uint32_t found;rd(&found,4);rd(storage,4096);uint32_t accepted=select_bake(storage+0xc00,found);wr(&accepted,4);wr(storage,4096);}return 0;
}
