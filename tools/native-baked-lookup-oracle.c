#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>

static void readin(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void ptr(void *p,size_t offset,void *value){memcpy((char *)p+offset,&value,8);}
extern uint32_t beamo_check(void *,void *,uint32_t);
extern void *card_check(void *,void *,uint32_t);
extern void *model_check(void *,void *,uint32_t);
__asm__(
 ".text\nbeamo_check:\n push %rbx\n push %r14\n sub $8,%rsp\n mov %rdi,%rbx\n mov %rsi,%r14\n mov %edx,%eax\n movabs $0x100195427,%r11\n call *%r11\n add $8,%rsp\n pop %r14\n pop %rbx\n ret\n"
 "card_check:\n push %rbp\n push %r12\n push %r15\n sub $0x60,%rsp\n lea 0x60(%rsp),%rbp\n mov %rdi,%r12\n xor %r15d,%r15d\n mov %rsi,-0x58(%rbp)\n mov %edx,%eax\n movabs $0x10021fc86,%r11\n call *%r11\n add $0x60,%rsp\n pop %r15\n pop %r12\n pop %rbp\n ret\n"
 "model_check:\n push %rbp\n push %rbx\n push %r14\n sub $0x240,%rsp\n lea 0x240(%rsp),%rbp\n mov %rdi,%rbx\n mov %rsi,-0x230(%rbp)\n movl $0,-0x21c(%rbp)\n mov %edx,%eax\n movabs $0x10045fb24,%r11\n call *%r11\n add $0x240,%rsp\n pop %r14\n pop %rbx\n pop %rbp\n ret\n"
);
int main(int argc,char **argv){
 if(argc!=2)return 2;
 FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *memory=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
 if(memory==MAP_FAILED||fread(memory,1,0xd22000,file)!=0xd22000)return 4;
 fclose(file);
 // Return trampolines replace continuations only. Original acceptance
 // instructions and branch targets inside each selected slice are retained.
 memcpy((void *)0x100195440UL,"\x40\x0f\xb6\xc7\xc3",5);
 *(uint8_t *)0x10021fcb2UL=0xc3;
 memcpy((void *)0x10045fb55UL,"\x48\x89\xd0\xc3",4);
 uint32_t groups;readin(&groups,4);fwrite(&groups,4,1,stdout);
 for(uint32_t i=0;i<groups;i++){
  uint32_t count,queries;readin(&count,4);readin(&queries,4);
  if(count>65536||queries>65536)return 6;
  unsigned char *records=calloc(count?count:1,0x30);if(!records)return 7;
  unsigned char *lods=calloc(count?count:1,0x18);if(!lods)return 7;
  for(uint32_t j=0;j<count;j++){
   uint32_t values[3];readin(values,sizeof values);
   memcpy(records+j*0x30+0x18,values,8);memcpy(lods+j*0x18,values+2,4);
   ptr(records+j*0x30,0x28,lods+j*0x18);
  }
  unsigned char resource[0x280]={0},handle[0x20]={0},ref[8]={0};
  memcpy(resource+0xd0,&count,4);ptr(resource,0xe8,records);
  for(uint32_t j=0;j<queries;j++){
   uint32_t query[6];readin(query,sizeof query);
   memcpy(resource+0x264,query+2,4);
   ptr(ref,0,query[0]?handle:NULL);ptr(handle,0x10,query[1]?resource:NULL);
   void *unchanged=(void *)0x318f01UL,*output=unchanged;
   uint8_t found=((uint8_t (*)(void *,uint32_t,void **))0x1003f68d0UL)(ref,query[3],&output);
   unsigned char mesh[0x50]={0},context[0x100]={0};void *meshptr=mesh;
   memcpy(mesh+0x40,query+4,4);memcpy(mesh+0x34,query+5,4);
   ptr(context,8,mesh);ptr(context,0x40,output);ptr(context,0xf0,mesh);
   uint32_t result[6]={found,found?(uint32_t)(((unsigned char *)output-records)/0x30):0xffffffffUL,output==unchanged,
    beamo_check(context,&meshptr,found),card_check(context,output,found)!=NULL,model_check(context,output,found)==output&&found};
   if(found&&((unsigned char *)output<records||(unsigned char *)output>=records+count*0x30))return 8;
   fwrite(result,sizeof result,1,stdout);
  }
  free(records);free(lods);
 }
 return 0;
}
