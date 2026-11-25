#define main animation_pack_reader_main
#include "native-resource-animation-oracle.c"
#undef main
#include <immintrin.h>
#include <math.h>
static uint32_t pow_trace[3072], pow_count;
static float traced_power(float base, float exponent) {
  if (pow_count >= 1024) exit(23);
  float result = powf(base, exponent);
  memcpy(pow_trace + pow_count * 3, &base, 4); memcpy(pow_trace + pow_count * 3 + 1, &exponent, 4); memcpy(pow_trace + pow_count * 3 + 2, &result, 4); pow_count++; return result;
}
#include <signal.h>
#include <ucontext.h>
static void imported(uintptr_t at, void *fn) { uint8_t *p = (void *)at; int32_t displacement; if (p[0] != 0xff || p[1] != 0x25) exit(21); memcpy(&displacement, p + 2, 4); memcpy(p + 6 + displacement, &fn, 8); }
static void zero_bytes(void *p, size_t n) { memset(p, 0, n); }
static void pattern16(void *out, const void *pattern, size_t n) { for (size_t at = 0; at < n; at += 16) memcpy((uint8_t *)out + at, pattern, n - at < 16 ? n - at : 16); }
static void fault(int sig, siginfo_t *info, void *context) { ucontext_t *c = context; fprintf(stderr, "native primary fault %d at %p rip=%llx rdi=%llx rsi=%llx rax=%llx\n", sig, info->si_addr, (unsigned long long)c->uc_mcontext.gregs[REG_RIP], (unsigned long long)c->uc_mcontext.gregs[REG_RDI], (unsigned long long)c->uc_mcontext.gregs[REG_RSI], (unsigned long long)c->uc_mcontext.gregs[REG_RAX]); _Exit(22); }
int main(int argc, char **argv) {
  struct sigaction action = {0}; action.sa_sigaction = fault; action.sa_flags = SA_SIGINFO; sigaction(SIGSEGV, &action, NULL);
  if (argc != 2) return 2;
  FILE *f = fopen(argv[1], "rb"); if (!f) return 3;
  if (mmap((void *)0x100000000UL, 0x2400000, 7, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0) == MAP_FAILED) return 4;
  if (fread((void *)0x100000000UL, 1, 0xd22000, f) != 0xd22000) return 5;
  fclose(f);
  arena = mmap(NULL, 64 * 1024 * 1024, 3, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0); if (arena == MAP_FAILED) return 6;
  hook(0x100795530UL, allocate); hook(0x100795a70UL, release); hook(0x1007c6c20UL, scratch);
  hook(0x10009fcd0UL, no_library); hook(0x1007e5f70UL, assertion); hook(0x1007e6030UL, assertion);
  imported(0x100aa28f4UL, memcpy); imported(0x100aa24aaUL, zero_bytes);
  imported(0x100aa2906UL, pattern16); imported(0x100aa2a2cUL, traced_power);
  uint64_t guard = 0; void *guard_pointer = &guard; memcpy((void *)0x100c0d8d8UL, &guard_pointer, 8);
  if (mprotect((void *)0x100000000UL, 0xc05000, 5)) return 7;
  uint8_t *memory = mmap((void *)0x460000000UL, 0x20000, 3, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0); if (memory == MAP_FAILED) return 8;
  uint32_t count; read_exact(&count, 4); write_word(count);
  while (count--) {
    uint32_t size; read_exact(&size, 4); if (!size || size > 16000000) return 9;
    uint8_t *input = malloc(size), stream[0x50] __attribute__((aligned(16))) = {0}; read_exact(input, size);
    used = allocation_count = 0; memset(memory + 0xa000, 0, 0x100);
    ((void (*)(void *, uint32_t, void *, uint32_t))0x100769c80UL)(stream, 0, input, size);
    ((void (*)(void *, void *, void *, uint32_t, const char *))0x1000e5db0UL)(memory + 0xa000, stream, arena, 0, "primary-oracle");
    uint32_t bones = word(memory + 0xa000, 0x54), nodes_size = (bones + 1) * 0xf0, requests; if (bones > 256) return 17;
    read_exact(&requests, 4); write_word(requests);
    while (requests--) {
      uint32_t clock_only, reciprocal_count; float delta;
      read_exact(&clock_only, 4); read_exact(&delta, 4); read_exact(memory, 0x6300); read_exact(memory + 0x7000, 0x1820); read_exact(memory + 0xb000, nodes_size);
      line = severity = pow_count = 0;
      if (!setjmp(escape)) ((void (*)(void *, uint32_t, float))0x100099ea0UL)(memory, clock_only, delta);
      write_word(line); write_word(severity); write_exact(memory, 0x6300); write_exact(memory + 0x7000, 0x1820); write_exact(memory + 0xb000, nodes_size);
      write_word(pow_count); write_exact(pow_trace, pow_count * 12);
      read_exact(&reciprocal_count, 4); write_word(reciprocal_count);
      // Independent instruction service, outside the unmodified original
      // update. Every proposed reciprocal input/result is checked separately.
      while (reciprocal_count--) {
        uint32_t input_bits; read_exact(&input_bits, 4); float input_float; memcpy(&input_float, &input_bits, 4);
        __m128 output = _mm_rsqrt_ps(_mm_set1_ps(input_float)); uint32_t output_bits = _mm_cvtsi128_si32(_mm_castps_si128(output));
        write_word(input_bits); write_word(output_bits);
      }
    }
    free(input);
  }
  return 0;
}
