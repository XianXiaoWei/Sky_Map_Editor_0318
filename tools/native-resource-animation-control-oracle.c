#define main animation_list_reader_main
#include "native-resource-animation-list-oracle.c"
#undef main
static uint8_t *library;
static void *animation_library(void) { return library; }
static void *scratch_allocator(void) { return arena; }
static void release_pack(void *owner, void *p) { (void)owner; (void)p; }
static int ascii_lower(int c) { return c >= 'A' && c <= 'Z' ? c + 'a' - 'A' : c; }
typedef int32_t (*play_range_fn)(void *, int32_t, int32_t, int32_t, int32_t, int32_t,
  float, float, float, float, float, float, int32_t, int32_t, int32_t, int32_t,
  int32_t, int32_t, int32_t, int32_t, int32_t);
static void initialize_skeleton(void *controller, void *bones, int32_t count) {
  uint32_t offset = (uintptr_t)bones - (uintptr_t)controller;
  memcpy((uint8_t *)controller + 0x6200, &offset, 4); memcpy((uint8_t *)controller + 0x6204, &count, 4);
}
static void finalize_pack(void *p) {
  uint8_t *controller = (void *)0x450000000UL; uint32_t offset = (uintptr_t)p - (uintptr_t)controller;
  memcpy(controller + 0x6208, &offset, 4); memcpy(controller + 0x620c, controller + 0x6220, 4);
}
int main(int argc, char **argv) {
  struct sigaction action = {0}; action.sa_sigaction = fault; action.sa_flags = SA_SIGINFO; sigaction(SIGSEGV, &action, NULL);
  if (argc != 2) return 2;
  FILE *f = fopen(argv[1], "rb"); if (!f) return 3;
  if (mmap((void *)0x100000000UL, 0x2400000, 7, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0) == MAP_FAILED) return 4;
  if (fread((void *)0x100000000UL, 1, 0xd22000, f) != 0xd22000) return 5;
  fclose(f);
  arena = mmap(NULL, 128 * 1024 * 1024, 3, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0); if (arena == MAP_FAILED) return 6;
  hook(0x100795530UL, allocate); hook(0x1007e5790UL, string_allocate); hook(0x1007e50d0UL, allocator);
  hook(0x1007e5db0UL, release); hook(0x100795a70UL, release_pack); hook(0x1007abc10UL, types);
  hook(0x1007c6c20UL, scratch_allocator); hook(0x10009fcd0UL, animation_library);
  hook(0x1007e5f70UL, assertion); hook(0x1007e6030UL, assertion);
  imported(0x100aa28f4UL, memcpy); imported(0x100aa28faUL, memmove);
  imported(0x100aa2c7eUL, strlen); imported(0x100aa2c90UL, strncpy); imported(0x100aa2c4eUL, strcmp);
  // FindFile's original C-locale case fold executes through this import.
  imported(0x100aa2522UL, ascii_lower);
  uint64_t stack_guard = 0; void *guard_pointer = &stack_guard; memcpy((void *)0x100c0d8d8UL, &guard_pointer, 8);
  uint8_t type[0x80] = {0}; void *type_pointer = type;
  for (uintptr_t at = 0x101d74640UL; at <= 0x101d74760UL; at += 0x60) memcpy((void *)at, &type_pointer, 8);
  hook(0x100094900UL, initialize_skeleton); hook(0x1000e74c0UL, finalize_pack);
  if (mprotect((void *)0x100000000UL, 0xc05000, 5)) return 7;
  uint8_t *memory = mmap((void *)0x450000000UL, 0x10000, 3, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0); if (memory == MAP_FAILED) return 8;
  uint32_t list_size; rd(&list_size, 4); if (!list_size || list_size > 4000000) return 9;
  uint8_t *list_bytes = malloc(list_size), list[0x9020] __attribute__((aligned(16))) = {0}, list_stream[0x50] __attribute__((aligned(16))) = {0}; rd(list_bytes, list_size);
  ((void (*)(void *, uint32_t, void *, uint32_t))0x100769c80UL)(list_stream, 0, list_bytes, list_size);
  ((void (*)(void *, void *, void *))0x1000dd370UL)(list, list_stream, arena);
  size_t list_used = used;
  uint32_t count; rd(&count, 4); put_word(count);
  while (count--) {
    uint32_t size; rd(&size, 4); if (!size || size > 16000000) return 17;
    uint8_t *input = malloc(size), stream[0x50] __attribute__((aligned(16))) = {0}; rd(input, size);
    used = list_used; library = NULL; memset(memory + 0xa000, 0, 0x100);
    ((void (*)(void *, uint32_t, void *, uint32_t))0x100769c80UL)(stream, 0, input, size);
    ((void (*)(void *, void *, void *, uint32_t, const char *))0x1000e5db0UL)(memory + 0xa000, stream, arena, 0, "request-oracle");
    library = list;
    uint32_t original_bones = word(memory + 0xa000, 0x54), original_frames = word(memory + 0xa000, 0x48);
    uint8_t empty_library[0x9020] __attribute__((aligned(16))) = {0};
    uint32_t requests; rd(&requests, 4); put_word(requests);
    while (requests--) {
      uint32_t mode; int32_t args[15]; float numbers[6]; char action_name[64];
      rd(&mode, 4); rd(args, sizeof(args)); rd(numbers, sizeof(numbers)); rd(action_name, sizeof(action_name));
      rd(memory, 0x6300); rd(memory + 0x7000, 0x1820);
      library = mode == 3 && args[14] ? empty_library : list;
      uint32_t bones = mode == 6 && args[14] == 1 ? 0 : original_bones;
      uint32_t frames = mode == 6 && args[14] == 2 ? 0 : original_frames;
      memcpy(memory + 0xa054, &bones, 4); memcpy(memory + 0xa048, &frames, 4);
      void *bone_pointer = memory + 0xb000; memcpy(memory + 0xa060, &bone_pointer, 8);
      if (mode == 6 && args[14] == 3) { uint32_t mismatch = original_bones + 1; memcpy(memory + 0xc054, &mismatch, 4); }
      line = severity = 0; int32_t result = -1234567;
      if (!setjmp(escape)) {
        if (mode == 3) result = ((int32_t (*)(void *))0x100096120UL)(memory);
        if (mode == 4) result = ((int32_t (*)(void *, int32_t))0x10009d520UL)(memory, args[2]);
        if (mode == 5) ((void (*)(void *, int32_t, float))0x100097c80UL)(memory, args[13], numbers[0]);
        if (mode == 6) ((void (*)(void *, void *))0x100094430UL)(memory, memory + 0xa000);
      }
      put_word(line); put_word(severity); put_word(result); wr(memory, 0x6300); wr(memory + 0x7000, 0x1820);
    }
    free(input);
  }
  free(list_bytes); return 0;
}
