#define main animation_list_reader_main
#include "native-resource-animation-list-oracle.c"
#undef main
/* Execute the entire unmodified static initializer. Its only successful-path
 * external dependency is memcpy; assertions remain fatal and visible. */
static void registry_assertion(const char *x, const char *f, uint32_t l, uint32_t s, ...) {
  fprintf(stderr, "%s:%u severity %u: %s\n", f, l, s, x); exit(18);
}
static void text_record(const char *s) { uint32_t n = strlen(s); put_word(n); wr(s, n); }
int main(int argc, char **argv) {
  struct sigaction action = {0}; action.sa_sigaction = fault; action.sa_flags = SA_SIGINFO; sigaction(SIGSEGV, &action, NULL);
  if (argc != 2) return 2;
  FILE *f = fopen(argv[1], "rb"); if (!f) return 3;
  if (mmap((void *)0x100000000UL, 0x2400000, 7, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0) == MAP_FAILED) return 4;
  if (fread((void *)0x100000000UL, 1, 0xd22000, f) != 0xd22000) return 5;
  fclose(f); imported(0x100aa28f4UL, memcpy); hook(0x1007e5f70UL, registry_assertion);
  ((void (*)(void))0x10009fe60UL)();
  uint8_t *registry = (void *)0x101dcff30UL;
  uint32_t count = word(registry, 0); if (count > 1400) return 19;
  put_word(count);
  for (uint32_t i = 0; i < count; i++) {
    uint8_t *sequence = ptr(registry, 8 + i * 8);
    wr(&sequence, 8); wr(sequence, 0xa8); text_record(ptr(sequence, 0));
    uint32_t steps = word(sequence, 0x18); if (steps > 16) return 20;
    for (uint32_t j = 0; j < steps; j++) {
      uint8_t *step = ptr(sequence, 0x20 + j * 8);
      wr(&step, 8); wr(step, 0x28); text_record(ptr(step, 8));
    }
  }
  return 0;
}
