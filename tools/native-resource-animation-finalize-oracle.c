#define main animation_list_reader_main
#include "native-resource-animation-list-oracle.c"
#undef main
static uint8_t *memory;
static uint8_t library[0x9020] __attribute__((aligned(16)));
static size_t owner_used;
static void *owner_allocate(void *owner, size_t n, void *tag, uint32_t alignment) {
  if (owner != memory + 0x9008) return allocate(owner, n, tag, alignment);
  if (alignment != 16 || (tag != memory + 0x9000 && tag != memory + 0x9010)) exit(20);
  owner_used = (owner_used + alignment - 1) & ~(size_t)(alignment - 1);
  if (owner_used + n + 16 > 0x60000) exit(21);
  uint32_t at = word(memory, 0x8c00), fields[4] = {owner_used, n, alignment, tag == memory + 0x9010};
  if (at + 4 > 128) exit(22);
  memcpy(memory + 0x8c10 + at * 4, fields, 16); at += 4; memcpy(memory + 0x8c00, &at, 4);
  void *out = memory + owner_used; owner_used += n + 16; return out;
}
static void *loaded_library(void) {
  uint32_t calls = word(memory, 0x8a34) + 1; memcpy(memory + 0x8a34, &calls, 4);
  return word(memory, 0x8a30) ? library : NULL;
}
static int ascii_lower(int c) { return c >= 'A' && c <= 'Z' ? c + 'a' - 'A' : c; }
static void pattern16(void *out, const void *pattern, size_t n) { for (size_t i = 0; i < n; i += 16) memcpy((uint8_t *)out + i, pattern, 16); }
#ifndef SKY_ANIMATION_FINALIZE_HELPERS_ONLY
int main(int argc, char **argv) {
  struct sigaction action = {0}; action.sa_sigaction = fault; action.sa_flags = SA_SIGINFO; sigaction(SIGSEGV, &action, NULL);
  if (argc != 2) return 2;
  FILE *f = fopen(argv[1], "rb"); if (!f) return 3;
  if (mmap((void *)0x100000000UL, 0x2400000, 7, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0) == MAP_FAILED) return 4;
  if (fread((void *)0x100000000UL, 1, 0xd22000, f) != 0xd22000) return 5;
  fclose(f);
  memory = mmap((void *)0x490000000UL, 0x60000, 3, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0); if (memory == MAP_FAILED) return 6;
  arena = mmap(NULL, 64 * 1024 * 1024, 3, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0); if (arena == MAP_FAILED) return 6;
  hook(0x100795530UL, owner_allocate); hook(0x1007e5790UL, string_allocate); hook(0x1007e50d0UL, allocator); hook(0x1007e5db0UL, release); hook(0x1007abc10UL, types);
  hook(0x1007e5f70UL, assertion); hook(0x1007e6030UL, assertion); hook(0x10009fcd0UL, loaded_library);
  imported(0x100aa28f4UL, memcpy); imported(0x100aa28faUL, memmove); imported(0x100aa2c7eUL, strlen); imported(0x100aa2c90UL, strncpy);
  imported(0x100aa2c9cUL, strrchr); imported(0x100aa2c4eUL, strcmp); imported(0x100aa2c48UL, strchr); imported(0x100aa2522UL, ascii_lower); imported(0x100aa2906UL, pattern16);
  uint64_t guard = 0; void *guard_pointer = &guard; memcpy((void *)0x100c0d8d8UL, &guard_pointer, 8);
  uint8_t type[0x80] = {0}; void *type_pointer = type;
  for (uintptr_t at = 0x101d74640UL; at <= 0x101d74760UL; at += 0x60) memcpy((void *)at, &type_pointer, 8);
  void *tag = memory + 0x9000; memcpy((void *)0x101d74608UL, &tag, 8);
  tag = memory + 0x9010; memcpy((void *)0x101dd2b68UL, &tag, 8);
  if (mprotect((void *)0x100000000UL, 0xc05000, 5)) return 7;
  uint32_t count; rd(&count, 4); put_word(count);
  while (count--) {
    uint32_t size; rd(&size, 4); if (size > 4000000) return 8;
    uint8_t *input = malloc(size); rd(input, size); rd(memory, 0x60000); used = 0; owner_used = 0x20000; line = severity = 0;
    memset(library, 0, sizeof library);
    if (size) {
      uint8_t stream[0x50] __attribute__((aligned(16))) = {0};
      ((void (*)(void *, uint32_t, void *, uint32_t))0x100769c80UL)(stream, 0, input, size);
      if (!setjmp(escape)) ((void (*)(void *, void *, void *))0x1000dd370UL)(library, stream, arena);
      if (line) return 23;
    }
    memcpy((void *)0x100d22ed0UL, memory + 0x8000, 0x400); memcpy((void *)0x100d232d0UL, memory + 0x8400, 0x400);
    if (!setjmp(escape)) {
      const uint32_t mode = word(memory, 0x8a00);
      if (mode == 0) ((void (*)(void *, void *))0x1000e6a40UL)(memory + 0x9100, memory + 0x9008);
      else if (mode == 1 || mode == 2) {
        ((void (*)(void *))0x1000e62a0UL)(memory + 0x9100);
        if (mode == 2) ((void (*)(void *))0x1000e62a0UL)(memory + 0x9100);
      } else if (mode == 3 || mode == 4) {
        ((void (*)(void *, void *))0x100094430UL)(memory, memory + 0x9100);
        if (mode == 4) ((void (*)(void *, void *))0x100094430UL)(memory, memory + 0x9100);
      } else return 24;
    }
    memcpy(memory + 0x8000, (void *)0x100d22ed0UL, 0x400); memcpy(memory + 0x8400, (void *)0x100d232d0UL, 0x400);
    memcpy(memory + 0x8a20, &line, 4); memcpy(memory + 0x8a24, &severity, 4);
    wr(memory, 0x60000); free(input);
  }
  return 0;
}
#endif
