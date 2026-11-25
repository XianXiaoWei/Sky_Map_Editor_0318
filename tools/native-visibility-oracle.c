#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <immintrin.h>

static void readin(void *p,size_t n){if(fread(p,1,n,stdin)!=n)exit(10);}
static void *aligned(size_t n){void *p=NULL;if(posix_memalign(&p,16,n?n:16))exit(11);return p;}
static void *allocated[4];static uint32_t allocated_sizes[4],freed[4],allocation_count;
static void *scratch_context(void){return (void *)0x318faceUL;}
static void *scratch_allocate(void *context,size_t bytes,void *meta,uint32_t alignment){
 (void)context;(void)meta;(void)alignment;if(allocation_count>=4||bytes>64000000)exit(15);
 void *p=aligned(bytes);memset(p,0xef,bytes?bytes:16);allocated[allocation_count]=p;allocated_sizes[allocation_count]=bytes;freed[allocation_count]=0;allocation_count++;return p;
}
static void scratch_free(void *context,void *memory){(void)context;for(uint32_t i=0;i<allocation_count;i++)if(allocated[i]==memory){freed[i]++;return;}exit(16);}
static void jump(void *site,void *target){uint8_t code[12]={0x48,0xb8};memcpy(code+2,&target,8);code[10]=0xff;code[11]=0xe0;memcpy(site,code,12);}
extern void layout_slice(void *,uint32_t,uint32_t);
__asm__(".text\nlayout_slice:\n push %rbx\n push %r13\n sub $8,%rsp\n mov %rdi,%rbx\n mov %esi,%ecx\n mov %edx,%esi\n xor %edx,%edx\n xor %r13d,%r13d\n movabs $0x10071db19,%r11\n call *%r11\n add $8,%rsp\n pop %r13\n pop %rbx\n ret\n");
int main(int argc,char **argv){
 if(argc!=2)return 2;
 FILE *file=fopen(argv[1],"rb");if(!file)return 3;
 void *memory=mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
 if(memory==MAP_FAILED||fread(memory,1,0xd22000,file)!=0xd22000)return 4;
 fclose(file);
 // Layout loop only; return before allocation and the GPU lifecycle.
 *(uint8_t *)0x10071dbaeUL=0xc3;
 static uint64_t cookie=0x318facedcafebeefULL;
 void *cookieptr=&cookie;memcpy((void *)0x100c0d8d8UL,&cookieptr,8);
 jump((void *)0x1007c6c20UL,scratch_context);jump((void *)0x100795530UL,scratch_allocate);jump((void *)0x100795a70UL,scratch_free);
 jump((void *)0x100aa28f4UL,memcpy);jump((void *)0x100aa2900UL,memset);
 _mm_setcsr(_mm_getcsr()|0xe040);
 uint32_t groups;readin(&groups,4);fwrite(&groups,4,1,stdout);
 for(uint32_t g=0;g<groups;g++){
  uint32_t mode,count;readin(&mode,4);readin(&count,4);if(count>1000000)return 6;
  if(mode==0){
   for(uint32_t i=0;i<count;i++){
    float a,b;readin(&a,4);readin(&b,4);
    __m128 x=_mm_set_ss(a),y=_mm_set_ss(b);
    float result[7]={_mm_cvtss_f32(_mm_add_ss(x,y)),_mm_cvtss_f32(_mm_sub_ss(x,y)),_mm_cvtss_f32(_mm_mul_ss(x,y)),
      _mm_cvtss_f32(_mm_div_ss(x,y)),_mm_cvtss_f32(_mm_sqrt_ss(x)),_mm_cvtss_f32(_mm_max_ss(x,y)),_mm_cvtss_f32(_mm_rcp_ps(x))};
    fwrite(result,sizeof result,1,stdout);
   }
  }else if(mode==1){
   float *matrix=aligned(64),*output=aligned(count*16);void *vertices=aligned(count*16);
   readin(matrix,64);readin(vertices,count*16);readin(output,count*16);
   ((void (*)(void *,uint32_t,void *,void *))0x10071e7f0UL)(vertices,count,matrix,output);
   fwrite(output,count*16,1,stdout);free(vertices);free(matrix);free(output);
  }else if(mode==2){
   if(count>20)return 7;
   uint32_t widths[20],heights[20];readin(widths,count*4);readin(heights,count*4);
   size_t size=0;for(uint32_t i=0;i<count;i++)size+=(size_t)widths[i]*heights[i];if(size>1000000)return 8;
   float *buffer=aligned((size+32)*4),*mips[20];readin(buffer,(size+32)*4);
   size_t offset=0;for(uint32_t i=0;i<count;i++){mips[i]=buffer+offset;offset+=(size_t)widths[i]*heights[i];}
   ((void (*)(void *,void *,void *,uint32_t))0x100720560UL)(mips,widths,heights,count);
   fwrite(buffer,(size+32)*4,1,stdout);free(buffer);
  }else if(mode==3){
   if(count!=2)return 12;
   uint32_t dims[2];readin(dims,8);unsigned char state[0x220]={0};
   layout_slice(state,dims[0],dims[1]);uint32_t levels;memcpy(&levels,state+0x218,4);
   fwrite(&levels,4,1,stdout);fwrite(state+0xd8,levels*4,1,stdout);fwrite(state+0x128,levels*4,1,stdout);
   fwrite(state+0x178,levels*4,1,stdout);fwrite(state+0x1c8,levels*4,1,stdout);
  }else if(mode==4){
   uint32_t params[7];readin(params,sizeof params);
   uint32_t width=params[0],height=params[1],indexcount=params[2],capacity=params[3],selectedcount=params[4];
   uint32_t words=params[6];
   if((size_t)width*height>1000000||indexcount>1000000||capacity>1000000||words<(size_t)width*height+32||words>2000000)return 13;
   float *vertices=aligned(count*16),*depth=aligned((size_t)words*4);
   uint16_t *indices=aligned(indexcount*2);uint32_t *selected=aligned(capacity*4);
   readin(vertices,count*16);readin(indices,indexcount*2);readin(depth,(size_t)words*4);readin(selected,capacity*4);
   ((void (*)(void *,uint32_t,uint32_t,void *,void *,uint32_t,void *,void *,uint32_t))0x10071ee60UL)
      (depth,width,height,vertices,indices,indexcount,params[5]?selected:NULL,&selectedcount,capacity);
   fwrite(&selectedcount,4,1,stdout);fwrite(selected,capacity*4,1,stdout);fwrite(depth,(size_t)words*4,1,stdout);
   free(vertices);free(indices);free(depth);free(selected);
  }else if(mode==5){
   uint32_t params[4];readin(params,sizeof params);
   uint32_t selectedcount=params[0],indexcount=params[1],outvertices=params[2],outindices=params[3];
   if(selectedcount>100000||indexcount>1000000||outvertices>1000000||outindices>1000000)return 14;
   float *matrix=aligned(64),*vertices=aligned(count*16),*output=aligned(outvertices*16);
   uint16_t *indices=aligned(indexcount*2),*outputindices=aligned(outindices*2);uint32_t *selected=aligned(selectedcount*4);
   readin(matrix,64);readin(vertices,count*16);readin(indices,indexcount*2);readin(selected,selectedcount*4);readin(output,outvertices*16);readin(outputindices,outindices*2);
   uint32_t vertexcount=0x318faced,outputcount=0x318faced;
   // Original numeric path. The diagnostic flag in the copied image is zero;
   // logging/renderer calls used to display discarded huge triangles are off.
   *(uint8_t *)0x10203c2f8UL=0;
   ((void (*)(void *,void *,void *,uint32_t,void *,void *,void *,void *,void *))0x10071f790UL)
      (vertices,indices,selected,selectedcount,matrix,output,&vertexcount,outputindices,&outputcount);
   fwrite(&vertexcount,4,1,stdout);fwrite(&outputcount,4,1,stdout);fwrite(output,outvertices*16,1,stdout);fwrite(outputindices,outindices*2,1,stdout);
   free(matrix);free(vertices);free(indices);free(selected);free(output);free(outputindices);
  }else if(mode==6){
   uint32_t params[4];readin(params,sizeof params);
   uint32_t width=params[0],height=params[1],indexcount=params[2],words=params[3];
   if(indexcount>10000000||words<(size_t)width*height+32||words>2000000)return 17;
   float *matrix=aligned(64),*vertices=aligned(count*16),*depth=aligned((size_t)words*4);uint16_t *indices=aligned(indexcount*2);
   readin(matrix,64);readin(vertices,count*16);readin(indices,indexcount*2);readin(depth,(size_t)words*4);
   allocation_count=0;*(uint8_t *)0x10203c2f8UL=0;
   ((void (*)(void *,uint32_t,uint32_t,void *,uint32_t,void *,uint32_t,void *))0x100720250UL)(depth,width,height,vertices,count,indices,indexcount,matrix);
   fwrite(depth,(size_t)words*4,1,stdout);fwrite(&allocation_count,4,1,stdout);
   for(uint32_t i=0;i<allocation_count;i++){fwrite(allocated_sizes+i,4,1,stdout);fwrite(freed+i,4,1,stdout);fwrite(allocated[i],allocated_sizes[i],1,stdout);free(allocated[i]);}
   free(matrix);free(vertices);free(indices);free(depth);
  }else if(mode==7||mode==8){
   uint32_t params[6];readin(params,sizeof params);
   uint32_t hascamera=params[0],disabled=params[1],frustumonly=params[2],initialize=params[3],levels=params[4],words=params[5];
   if(levels>20||words>2000000)return 18;
   unsigned char *state=aligned(0x220),*camera=aligned(0x300);memset(state,0,0x220);memset(camera,0,0x300);
   readin(state+0x18,4);readin(camera+0x140,64);readin(camera+0x180,64);
   readin(state+0xd8,levels*4);readin(state+0x128,levels*4);readin(state+0x178,levels*4);readin(state+0x1c8,levels*4);
   float *depth=aligned(words*4),*spheres=aligned(count*16);uint32_t *statuses=aligned((count+8)*4);
   float *maxima=mode==8?aligned(count*16):NULL;
   readin(depth,words*4);readin(spheres,count*16);
   if(mode==8)readin(maxima,count*16);
   readin(statuses,(count+8)*4);
   if(hascamera)memcpy(state+0x10,&camera,8);
   memcpy(state+0x218,&levels,4);
   size_t offset=0;for(uint32_t i=0;i<levels;i++){
    uint32_t w,h;memcpy(&w,state+0xd8+i*4,4);memcpy(&h,state+0x128+i*4,4);
    if(offset+(size_t)w*h>words)return 19;
    float *mip=depth+offset;memcpy(state+0x38+i*8,&mip,8);offset+=(size_t)w*h;
   }
   *(uint8_t *)0x10203be90UL=disabled!=0;*(uint8_t *)0x10203bf08UL=frustumonly!=0;*(uint8_t *)0x10203c0c8UL=0;*(uint8_t *)0x10203c138UL=0;
   uint32_t before=_mm_getcsr();
   if(mode==7)((void (*)(void *,void *,uint32_t,void *,uint8_t))0x100720dd0UL)(state,spheres,count,statuses,initialize!=0);
   else ((void (*)(void *,void *,void *,uint32_t,void *))0x100721ce0UL)(state,spheres,maxima,count,statuses);
   uint32_t after=_mm_getcsr();fwrite(&before,4,1,stdout);fwrite(&after,4,1,stdout);fwrite(statuses,(count+8)*4,1,stdout);
   free(state);free(camera);free(depth);free(spheres);free(maxima);free(statuses);
  }else return 9;
 }
 return 0;
}
