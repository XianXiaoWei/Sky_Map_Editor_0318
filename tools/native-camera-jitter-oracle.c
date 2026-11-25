#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <sys/mman.h>

static _Alignas(32) unsigned char compositor[0x100], camera_system[0x300], camera_view[0x400];
static uint64_t guard;
static unsigned frame_value, centered_value, exp_count;
static _Alignas(32) float shifts[4], exponentials[18], translation[16], old_translation[16], input_matrix[16], projected[16], inverse_old[16], correction[16], corrected_old[16];
static unsigned explicit_frame(void *p) { (void)p; return frame_value; }
static unsigned char explicit_centered(void *p) { (void)p; return centered_value; }
static float captured_expf(float value) {
  float result = expf(value);
  if (exp_count >= 9) abort();
  exponentials[exp_count * 2] = value; exponentials[exp_count * 2 + 1] = result; exp_count++;
  return result;
}
static void hook(uintptr_t at, void *fn) {
  uint8_t j[] = {0x48,0xb8,0,0,0,0,0,0,0,0,0xff,0xe0}; memcpy(j+2,&fn,8); memcpy((void *)at,j,12);
}
void capture_shifts(void *stack) {
  memcpy(shifts, (uint8_t *)stack + 0x140, 8); memcpy(shifts + 2, (uint8_t *)stack + 0x1d0, 8);
  memcpy(translation, (uint8_t *)stack + 0x110, 64);
  memcpy(old_translation, (uint8_t *)stack + 0x1a0, 64);
}
extern void finish_sampling(void);
__asm__(".text\n.global finish_sampling\nfinish_sampling:\n vzeroupper\n mov %rsp,%rdi\n call capture_shifts\n movabs $0x1001e22ec,%rax\n jmp *%rax\n");

int main(int argc, char **argv) {
  if (argc != 2) return 2;
  FILE *file = fopen(argv[1], "rb"); if (!file) return 3;
  void *mem = mmap((void *)0x100000000UL,0x2400000,7,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0);
  if (mem == MAP_FAILED || fread(mem,1,0xd22000,file) != 0xd22000) return 4;
  fclose(file);
  hook(0x100241e10UL,explicit_frame); hook(0x100241e20UL,explicit_centered);
  hook(0x100aa2708UL,captured_expf); hook(0x1001e1c4dUL,finish_sampling);
  *(uintptr_t *)0x100c0d8d8UL = (uintptr_t)&guard;
  *(uintptr_t *)(camera_system + 0x140) = (uintptr_t)camera_view;
  unsigned count; if (fread(&count,4,1,stdin) != 1) return 5; fwrite(&count,4,1,stdout);
  for (unsigned i = 0; i < count; i++) {
    unsigned size[2]; float previous[4];
    if (fread(&frame_value,4,1,stdin)!=1 || fread(size,8,1,stdin)!=1 || fread(&centered_value,4,1,stdin)!=1 || fread(previous,16,1,stdin)!=1 || fread(input_matrix,64,1,stdin)!=1) return 6;
    ((float *)(compositor+0x30))[0] = size[0]; ((float *)(compositor+0x30))[1] = size[1];
    memcpy(camera_view + 0x20,previous,8); memcpy(camera_view + 0x30,previous+2,8);
    exp_count = 0;
    ((void (*)(void *,void *,void *))0x1001e1400UL)(camera_system,compositor,NULL);
    if (exp_count != 9) return 7;
    ((void (*)(void *,void *,void *))0x100076df0UL)(projected,translation,input_matrix);
    ((void (*)(void *,void *))0x100076940UL)(inverse_old,old_translation);
    ((void (*)(void *,void *,void *))0x100076df0UL)(correction,translation,inverse_old);
    ((void (*)(void *,void *,void *))0x100076df0UL)(corrected_old,correction,input_matrix);
    fwrite(camera_system+0x220,52,1,stdout); fwrite(camera_view+0x20,64,1,stdout);
    fwrite(shifts,16,1,stdout); fwrite(exponentials,72,1,stdout);
    fwrite(projected,64,1,stdout);
    fwrite(corrected_old,64,1,stdout);
  }
  return 0;
}
