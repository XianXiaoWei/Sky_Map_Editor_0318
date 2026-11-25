#define main animation_pack_reader_main
#include "native-resource-animation-oracle.c"
#undef main
static uint8_t mirrored_library[0x9020], mirrored_file[0x28], mirrored_meta[0x120];
static uint32_t library_ready;
static void *mirror_library(void) { return library_ready ? mirrored_library : NULL; }
static int lower_ascii(int c) { return c >= 'A' && c <= 'Z' ? c + 'a' - 'A' : c; }
static void bind_import(uintptr_t at, void *fn) { uint8_t *p = (void *)at; int32_t rel; if (p[0] != 0xff || p[1] != 0x25) exit(15); memcpy(&rel, p + 2, 4); memcpy(p + 6 + rel, &fn, 8); }
static void set_pointer(void *p, void *value) { memcpy(p, &value, 8); }
int main(int argc, char **argv) {
  if (argc != 2) return 2;
  FILE *f = fopen(argv[1], "rb"); if (!f) return 3;
  if (mmap((void *)0x100000000UL, 0x2400000, 7, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0) == MAP_FAILED) return 4;
  if (fread((void *)0x100000000UL, 1, 0xd22000, f) != 0xd22000) return 5;
  fclose(f);
  arena = mmap(NULL, 64 * 1024 * 1024, 3, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0); if (arena == MAP_FAILED) return 6;
  hook(0x100795530UL, allocate); hook(0x100795a70UL, release); hook(0x1007c6c20UL, scratch); hook(0x10009fcd0UL, mirror_library);
  hook(0x1007e5f70UL, assertion); hook(0x1007e6030UL, assertion);
  bind_import(0x100aa28f4UL, memcpy); bind_import(0x100aa2c9cUL, strrchr); bind_import(0x100aa2c4eUL, strcmp); bind_import(0x100aa2c7eUL, strlen); bind_import(0x100aa2522UL, lower_ascii);
  uint64_t guard = 0; void *guard_pointer = &guard; memcpy((void *)0x100c0d8d8UL, &guard_pointer, 8);
  if (mprotect((void *)0x100000000UL, 0xc05000, 5)) return 7;
  uint32_t count; read_exact(&count, 4); write_word(count);
  while (count--) {
    uint32_t size, additive; read_exact(&size, 4); read_exact(&additive, 4); if (!size || size > 16000000) return 8;
    uint8_t *input = malloc(size); read_exact(input, size);
    uint8_t pack[0x100] __attribute__((aligned(16))) = {0}, stream[0x50] __attribute__((aligned(16))) = {0};
    memset(arena, 0, used); used = allocation_count = line = severity = library_ready = 0;
    ((void (*)(void *, uint32_t, void *, uint32_t))0x100769c80UL)(stream, 0, input, size);
    if (!setjmp(escape)) ((void (*)(void *, void *, void *, uint32_t, const char *))0x1000e5db0UL)(pack, stream, arena, 0, "mirrored-animation-oracle");
    if (line) return 16;
    memset(mirrored_library, 0, sizeof mirrored_library); memset(mirrored_file, 0, sizeof mirrored_file); memset(mirrored_meta, 0, sizeof mirrored_meta);
    uint32_t one = 1, kind = additive ? 2 : 0;
    memcpy(mirrored_library + 8, &one, 4); set_pointer(mirrored_library + 16, mirrored_file); set_pointer(mirrored_library + 0x1018, mirrored_meta);
    mirrored_file[8] = 1; set_pointer(mirrored_file + 0x18, pack); memcpy(mirrored_file + 0x20, &one, 4);
    memcpy(mirrored_meta + 0x30, &kind, 4); mirrored_meta[0x40] = 1; library_ready = 1;
    if (!setjmp(escape)) ((void (*)(void *))0x1000e62a0UL)(pack); if (line) return 17;
    write_word(line); write_word(severity);
    const uint32_t bones = word(pack, 0x54), mask_size = (bones + 7) / 8;
    uint8_t *mask = malloc(mask_size), *pose = aligned_alloc(16, bones * 48);
    uint32_t samples; read_exact(&samples, 4); write_word(samples);
    while (samples--) {
      int32_t frames[4], clip; uint32_t fix; float fraction; uint8_t state[0x38] __attribute__((aligned(16))) = {0};
      read_exact(frames, 16); read_exact(&fraction, 4); read_exact(&clip, 4); read_exact(&fix, 4); read_exact(mask, mask_size);
      ((void (*)(void *, int32_t, int32_t, int32_t, int32_t, uint32_t, float, int32_t, void *))0x1000e42d0UL)(state, frames[0], frames[1], frames[2], frames[3], fix, fraction, clip, pack);
      ((void (*)(void *, void *, int32_t, int32_t, int32_t, int32_t, float, int32_t, uint32_t, void *, uint32_t))0x1000e6900UL)(pack, pose, frames[0], frames[1], frames[2], frames[3], fraction, clip, fix, mask, 1);
      for (uint32_t i = 0; i < bones; i++) { memset(pose + i * 48 + 12, 0, 4); memset(pose + i * 48 + 44, 0, 4); }
      write_word(((uint8_t *)pointer(state, 0x30) - (uint8_t *)pointer(pack, 0x70)) / 128);
      write_exact(state, 0x2c); write_exact(pose, bones * 48);
    }
    free(mask); free(pose); free(input);
  }
  return 0;
}
