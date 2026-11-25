#define main animation_list_reader_main
#include "native-resource-animation-list-oracle.c"
#undef main
static uint8_t *memory;
static size_t skeleton_used;
static void *skeleton_allocate(void *owner, size_t n, void *tag, uint32_t alignment) {
  if (alignment != 16 || owner != memory + 0x9008 || tag != memory + 0x9000) exit(20);
  skeleton_used = (skeleton_used + alignment - 1) & ~(size_t)(alignment - 1);
  if (skeleton_used + n + 16 > 0x60000) exit(21);
  void *out = memory + skeleton_used;
  uint32_t at = word(memory, 0x8c00), fields[4] = {(uintptr_t)out - (uintptr_t)memory, n, alignment, 0};
  if (at + 4 > 128) exit(22);
  memcpy(memory + 0x8c10 + at * 4, fields, 16); at += 4; memcpy(memory + 0x8c00, &at, 4);
  skeleton_used += n + 16; return out;
}
static void pattern16(void *out, const void *pattern, size_t n) { for (size_t i = 0; i < n; i += 16) memcpy((uint8_t *)out + i, pattern, 16); }
static void *no_animation_library(void) { return NULL; }
int main(int argc, char **argv) {
  struct sigaction action = {0}; action.sa_sigaction = fault; action.sa_flags = SA_SIGINFO; sigaction(SIGSEGV, &action, NULL);
  if (argc != 2) return 2;
  FILE *f = fopen(argv[1], "rb"); if (!f) return 3;
  if (mmap((void *)0x100000000UL, 0x2400000, 7, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0) == MAP_FAILED) return 4;
  if (fread((void *)0x100000000UL, 1, 0xd22000, f) != 0xd22000) return 5;
  fclose(f);
  memory = mmap((void *)0x490000000UL, 0x60000, 3, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0); if (memory == MAP_FAILED) return 6;
  hook(0x100795530UL, skeleton_allocate); hook(0x1007e5f70UL, assertion); hook(0x1007e6030UL, assertion);
  hook(0x10009fcd0UL, no_animation_library);
  imported(0x100aa28f4UL, memcpy); imported(0x100aa2c48UL, strchr); imported(0x100aa2c4eUL, strcmp); imported(0x100aa2906UL, pattern16);
  uint64_t guard = 0; void *guard_pointer = &guard; memcpy((void *)0x100c0d8d8UL, &guard_pointer, 8);
  void *tag = memory + 0x9000; memcpy((void *)0x101d74608UL, &tag, 8);
  if (mprotect((void *)0x100000000UL, 0xc05000, 5)) return 7;
  uint32_t count; rd(&count, 4); put_word(count);
  while (count--) {
    rd(memory, 0x60000); skeleton_used = 0x20000; line = severity = 0;
    memcpy((void *)0x100d22ed0UL, memory + 0x8000, 0x400); memcpy((void *)0x100d232d0UL, memory + 0x8400, 0x400);
    if (!setjmp(escape)) {
      const uint32_t mode = word(memory, 0x8a00), bones = word(memory, 0x8a04);
      if (mode == 0 || mode == 4) ((void (*)(void *, void *, uint32_t))0x100094900UL)(memory, memory + 0xa000, bones);
      else if (mode == 1) ((void (*)(void *))0x100094550UL)(memory);
      else if (mode == 2) {
        void *node = memory + 0x20000 + word(memory, 0x8a10) * 0xf0;
        const int32_t parent = word(memory, 0x8a14);
        void *to = parent < 0 ? NULL : memory + 0x20000 + parent * 0xf0;
        if (word(memory, 0x8a0c) == 20) ((void (*)(void *))0x1007f21f0UL)(node);
        else if (word(memory, 0x8a0c) == 21) ((void (*)(void *))0x1007f2740UL)(node);
        else ((void (*)(void *, void *))0x1007f22c0UL)(node, to);
      } else if (mode == 3) {
        void *compare[2] = {memory + 0xa000, memory};
        ((void (*)(void *, void *, void *))0x10009eb40UL)(memory + 0x5610, memory + 0x5610 + bones * 2, compare);
      } else if (mode == 5) {
        ((void *(*)(void *, void *, void *, int32_t, uint32_t))0x1000e5ac0UL)(memory + 0x1e000, memory + 0x9100, memory + 0x1e010, word(memory, 0x8a10), word(memory, 0x8a08));
      } else if (mode == 6) {
        ((void (*)(void *, void *))0x100094430UL)(memory, memory + 0x9100);
      } else return 8;
    }
    memcpy(memory + 0x8000, (void *)0x100d22ed0UL, 0x400); memcpy(memory + 0x8400, (void *)0x100d232d0UL, 0x400);
    memcpy(memory + 0x8a20, &line, 4); memcpy(memory + 0x8a24, &severity, 4);
    wr(memory, 0x60000);
  }
  return 0;
}
