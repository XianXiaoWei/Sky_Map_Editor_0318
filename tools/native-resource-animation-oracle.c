#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>

static uint8_t *arena;
static size_t used;
static struct { void *pointer; uint32_t size; } allocations[32];
static uint32_t allocation_count, line, severity;
static jmp_buf escape;
static void read_exact(void *p, size_t n) { if (fread(p, 1, n, stdin) != n) exit(10); }
static void write_exact(const void *p, size_t n) { if (fwrite(p, 1, n, stdout) != n) exit(11); }
static uint32_t word(const void *p, size_t at) { uint32_t n; memcpy(&n, (const uint8_t *)p + at, 4); return n; }
static void *pointer(const void *p, size_t at) { void *n; memcpy(&n, (const uint8_t *)p + at, 8); return n; }
static void write_word(uint32_t n) { write_exact(&n, 4); }
static void hook(uintptr_t at, void *fn) { uint8_t bytes[14] = {0xff, 0x25}; memcpy(bytes + 6, &fn, 8); memcpy((void *)at, bytes, 14); }
static void assertion(char *expr, char *file, uint32_t l, uint32_t s, ...) {
  (void)expr; (void)file; line = l; severity = s; longjmp(escape, 1);
}
static void *allocate(void *owner, uint64_t n, void *label, uint32_t alignment) {
  (void)owner; (void)label;
  if (!alignment || (alignment & (alignment - 1)) || allocation_count >= 32) exit(12);
  used = (used + alignment - 1) & ~(size_t)(alignment - 1);
  if (n > 64 * 1024 * 1024 - used) exit(13);
  void *out = arena + used;
  allocations[allocation_count].pointer = out; allocations[allocation_count++].size = n;
  used += n ? n : 16;
  return out;
}
static void release(void *owner, void *p) { (void)owner; (void)p; }
static void *no_library(void) { return NULL; }
static void *scratch(void) { return arena; }
static void write_name(const void *p) { char name[64] = {0}; size_t n = strnlen(p, 64); memcpy(name, p, n); write_exact(name, 64); }
static void write_array(void *p) {
  if (!p) { write_word(0); return; }
  for (uint32_t i = 0; i < allocation_count; i++) if (allocations[i].pointer == p) {
    write_word(allocations[i].size); write_exact(p, allocations[i].size); return;
  }
  exit(14);
}

int main(int argc, char **argv) {
  if (argc != 2) return 2;
  FILE *f = fopen(argv[1], "rb"); if (!f) return 3;
  if (mmap((void *)0x100000000UL, 0x2400000, 7, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0) == MAP_FAILED) return 4;
  if (fread((void *)0x100000000UL, 1, 0xd22000, f) != 0xd22000) return 5;
  fclose(f);
  arena = mmap(NULL, 64 * 1024 * 1024, 3, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0); if (arena == MAP_FAILED) return 6;
  hook(0x100795530UL, allocate); hook(0x100795a70UL, release); hook(0x1007c6c20UL, scratch);
  hook(0x10009fcd0UL, no_library);
  hook(0x1007e5f70UL, assertion); hook(0x1007e6030UL, assertion);
  hook(0x100aa28f4UL, memcpy);
#ifdef ANIMATION_LOOP_ORACLE
  uint64_t stack_guard = 0; void *guard_pointer = &stack_guard; memcpy((void *)0x100c0d8d8UL, &guard_pointer, 8);
#endif
  uint32_t count; read_exact(&count, 4); write_word(count);
  while (count--) {
    uint32_t size; read_exact(&size, 4); if (!size || size > 16000000) return 7;
    uint8_t *input = malloc(size); if (!input) return 8; read_exact(input, size);
    uint8_t pack[0x100] __attribute__((aligned(16))) = {0}, stream[0x50] __attribute__((aligned(16))) = {0};
    memset(arena, 0, used); used = 0; allocation_count = line = severity = 0;
    ((void (*)(void *, uint32_t, void *, uint32_t))0x100769c80UL)(stream, 0, input, size);
    if (!setjmp(escape)) ((void (*)(void *, void *, void *, uint32_t, const char *))0x1000e5db0UL)(pack, stream, arena, 0, "resource-animation-oracle");
    write_word(line); write_word(severity);
    if (!line) {
#if defined(ANIMATION_LOOP_ORACLE)
      uint32_t requests; read_exact(&requests, 4); write_word(requests);
      uint32_t bones = word(pack, 0x54), mask_size = (bones + 7) / 8; if (!bones || bones > 256) return 18;
      uint8_t mask[32];
      while (requests--) {
        uint32_t start, length; read_exact(&start, 4); read_exact(&length, 4); read_exact(mask, mask_size);
        uint32_t negative = ((uint32_t (*)(void *, uint32_t, uint32_t, void *))0x1000e6580UL)(pack, start, length, mask);
        write_word(negative); write_exact(mask, mask_size);
      }
#elif defined(ANIMATION_SAMPLE_ORACLE) || defined(ANIMATION_MATRIX_ORACLE)
      uint32_t samples; read_exact(&samples, 4); write_word(samples);
      uint32_t bones = word(pack, 0x54), mask_size = (bones + 7) / 8;
      if (!bones || bones > 256) return 15;
      uint8_t mask[32]; float pose[256 * 12] __attribute__((aligned(16)));
      while (samples--) {
        int32_t frames[4], clip; uint32_t fix; float fraction;
        read_exact(frames, 16); read_exact(&fraction, 4); read_exact(&clip, 4); read_exact(&fix, 4); read_exact(mask, mask_size);
        uint8_t state[0x38] __attribute__((aligned(16))) = {0};
        ((void (*)(void *, int32_t, int32_t, int32_t, int32_t, uint32_t, float, int32_t, void *))0x1000e42d0UL)(state, frames[0], frames[1], frames[2], frames[3], fix, fraction, clip, pack);
        ((void (*)(void *, void *, int32_t, int32_t, int32_t, int32_t, float, int32_t, uint32_t, void *, uint32_t))0x1000e6900UL)(pack, pose, frames[0], frames[1], frames[2], frames[3], fraction, clip, fix, mask, 0);
        for (uint32_t i = 0; i < bones; i++) { pose[i * 12 + 3] = 0; pose[i * 12 + 11] = 0; }
#ifdef ANIMATION_MATRIX_ORACLE
        float root_pose[12] __attribute__((aligned(16))), axes[3], palette[257 * 16] __attribute__((aligned(16)));
        read_exact(root_pose, 48); read_exact(axes, 12);
        uint8_t *nodes = calloc(bones + 1, 0xf0); if (!nodes) return 16;
        for (uint32_t i = 0; i <= bones; i++) ((void (*)(void *))0x1007f21f0UL)(nodes + i * 0xf0);
        for (uint32_t i = 0; i < bones; i++) {
          uint32_t parent = word((uint8_t *)pointer(pack, 0x60) + i * 68, 64);
          if (parent > bones) return 17;
          ((void (*)(void *, void *))0x1007f22c0UL)(nodes + (i + 1) * 0xf0, nodes + parent * 0xf0);
        }
        for (uint32_t i = 0; i <= bones; i++) {
          uint8_t *node = nodes + i * 0xf0; float *input_pose = i ? pose + (i - 1) * 12 : root_pose;
          memcpy(node, input_pose + 8, 16); memcpy(node + 0x20, input_pose, 16); memcpy(node + 0x30, input_pose + 4, 16); node[0xe0] = 1;
          if (!i) memcpy(node + 0x10, axes, 12);
        }
        ((void (*)(void *, void *))0x1007f26e0UL)(palette, nodes);
        for (uint32_t i = 0; i < bones; i++) {
          float world[16] __attribute__((aligned(16)));
          ((void (*)(void *, void *))0x1007f26e0UL)(world, nodes + (i + 1) * 0xf0);
          ((void (*)(void *, void *, void *))0x100076df0UL)(palette + (i + 1) * 16, world, (uint8_t *)pointer(pack, 0x68) + i * 64);
        }
        write_exact(palette, (bones + 1) * 64); free(nodes);
#else
        write_word(((uint8_t *)pointer(state, 0x30) - (uint8_t *)pointer(pack, 0x70)) / 128);
        write_exact(state, 0x2c); write_exact(pose, bones * 48);
#endif
      }
#else
      write_word((uint8_t *)pointer(stream, 0x20) - input);
      write_name(pack);
      write_word(word(pack, 0x54)); write_word(word(pack, 0x48)); write_word(word(pack, 0x50)); write_word(pack[0x4c]); write_word(pack[0xd8]);
      for (uint32_t i = 0; i < word(pack, 0x54); i++) {
        uint8_t *bone = (uint8_t *)pointer(pack, 0x60) + i * 68;
        write_name(bone); write_word(word(bone, 64));
      }
      write_array(pointer(pack, 0x68)); write_array(pointer(pack, 0x58));
      write_array(pointer(pack, 0x70)); write_array(pointer(pack, 0x88));
      write_array(pointer(pack, 0xa0)); write_array(pointer(pack, 0x98)); write_array(pointer(pack, 0xa8)); write_array(pointer(pack, 0xb0));
#endif
    }
    free(input);
  }
  return 0;
}
