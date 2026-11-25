#define main animation_list_reader_main
#include "native-resource-animation-list-oracle.c"
#undef main
static uint8_t *memory;
static void logop(uint32_t op, void *p, uint32_t n, uint32_t extra) {
  uint32_t at = word(memory, 0x8800), fields[4] = {op, (uintptr_t)p - (uintptr_t)memory, n, extra};
  if (at + 4 > 1024) exit(23);
  memcpy(memory + 0x9000 + at * 4, fields, 16); at += 4; memcpy(memory + 0x8800, &at, 4);
}
static void sound_construct(void *out, void *controller, void *audio, void *human) { (void)controller; logop(2, out, (uintptr_t)audio - (uintptr_t)memory, (uintptr_t)human - (uintptr_t)memory); }
static void emitter_construct(void *out, void *controller, void *emitters) { logop(3, out, (uintptr_t)emitters - (uintptr_t)memory, (uintptr_t)controller - (uintptr_t)memory); }
static float volume(void *out) { logop(4, out, 0, 0); return 0.375f; }
static void world_matrix(void *out, void *node) { logop(1, node, 0, 0); size_t index = ((uint8_t *)node - (uint8_t *)ptr(memory, 0x5838)) / 0xf0; memcpy(out, memory + 0x10000 + index * 64, 64); }
static void request_effects(void *controller, void *request, uint32_t secondary) {
  logop(5, request, secondary, 0); uint32_t variant = word(memory, 0x800c);
  if (variant == 4) { uint32_t count = word(controller, 0x5860) + 1; memcpy((uint8_t *)controller + 0x5860, &count, 4); ((uint8_t *)request)[0x60] = 0; }
  if (variant == 5) { uint32_t count = 1; memcpy((uint8_t *)controller + (secondary ? 12 : 8), &count, 4); }
}
static void sound_update(void *out, float delta) { uint32_t bits; memcpy(&bits, &delta, 4); logop(6, out, bits, 0); }
static void emitter_update(void *out, float delta) { uint32_t bits; memcpy(&bits, &delta, 4); logop(7, out, bits, 0); }
static void *scene(void) { logop(8, memory, 0, 0); return word(memory, 0x8010) ? memory + 0xf000 : NULL; }
static void bones(void *p) { logop(9, p, 0, 0); }
static void bounds(void *p) { logop(10, p, 0, 0); }
int main(int argc, char **argv) {
  struct sigaction action = {0}; action.sa_sigaction = fault; action.sa_flags = SA_SIGINFO; sigaction(SIGSEGV, &action, NULL);
  if (argc != 2) return 2;
  FILE *f = fopen(argv[1], "rb"); if (!f) return 3;
  if (mmap((void *)0x100000000UL, 0x2400000, 7, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0) == MAP_FAILED) return 4;
  if (fread((void *)0x100000000UL, 1, 0xd22000, f) != 0xd22000) return 5;
  fclose(f);
  memory = mmap((void *)0x480000000UL, 0x20000, 3, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0); if (memory == MAP_FAILED) return 6;
  hook(0x1000e7ee0UL, sound_construct); hook(0x1000918d0UL, emitter_construct); hook(0x1000ea880UL, volume);
  hook(0x1007f26e0UL, world_matrix); hook(0x10009b960UL, request_effects); hook(0x1000e8030UL, sound_update); hook(0x100092a70UL, emitter_update);
  hook(0x1002acd30UL, scene); hook(0x10009c000UL, bones); hook(0x10009c3a0UL, bounds);
  uint64_t guard = 0; void *guard_pointer = &guard; memcpy((void *)0x100c0d8d8UL, &guard_pointer, 8);
  if (mprotect((void *)0x100000000UL, 0xc05000, 5)) return 7;
  uint32_t count; rd(&count, 4); put_word(count);
  while (count--) {
    rd(memory, 0x20000);
    *(uint8_t *)0x101d744b8UL = word(memory, 0x8014) & 1 ? 1 : 0;
    *(uint8_t *)0x101d74528UL = word(memory, 0x8014) & 2 ? 1 : 0;
    if (!word(memory, 0x8000)) ((void (*)(void *, void *, void *, void *, void *))0x1000941f0UL)(memory, word(memory, 0x8018) ? memory + 0xe000 : NULL, memory + 0xe100, memory + 0xe200, word(memory, 0x8020) ? memory + 0xe300 : NULL);
    else { float delta; uint32_t bits = word(memory, 0x8008); memcpy(&delta, &bits, 4); ((void (*)(void *, uint32_t, float))0x10009a980UL)(memory, word(memory, 0x8004), delta); }
    wr(memory, 0x20000);
  }
  return 0;
}
