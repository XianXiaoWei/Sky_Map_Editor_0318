#define main animation_pack_reader_main
#include "native-resource-animation-oracle.c"
#undef main
#include <immintrin.h>
#include <math.h>
#include <signal.h>
#include <ucontext.h>

static uint8_t *memory;
static uint32_t trace[8192], trace_count, variant, pow_trace[32768 * 3], pow_count;
static void imported(uintptr_t at, void *fn) { uint8_t *p = (void *)at; int32_t d; if (p[0] != 0xff || p[1] != 0x25) exit(21); memcpy(&d, p + 2, 4); memcpy(p + 6 + d, &fn, 8); }
static void zero_bytes(void *p, size_t n) { memset(p, 0, n); }
static void pattern16(void *out, const void *pattern, size_t n) { for (size_t at = 0; at < n; at += 16) memcpy((uint8_t *)out + at, pattern, n - at < 16 ? n - at : 16); }
static float traced_power(float base, float exponent) {
  if (pow_count >= 32768) exit(23);
  float result = powf(base, exponent);
  memcpy(pow_trace + pow_count * 3, &base, 4); memcpy(pow_trace + pow_count * 3 + 1, &exponent, 4); memcpy(pow_trace + pow_count * 3 + 2, &result, 4); pow_count++; return result;
}
static void logop(uint32_t op, void *p, uint32_t n, uint32_t extra) {
  if (trace_count + 4 > 8192) exit(24);
  uint32_t words[4] = {op, (uintptr_t)p - (uintptr_t)memory, n, extra}; memcpy(trace + trace_count, words, 16); trace_count += 4;
}
static void request_effects(void *controller, void *request, uint32_t secondary) {
  logop(1, request, secondary, 0);
  if (variant == 3) { ((uint8_t *)request)[0x60] = 0; uint32_t count = word(controller, 0x5860) + 1; memcpy((uint8_t *)controller + 0x5860, &count, 4); }
}
static void sounds(void *p, float delta) { uint32_t b; memcpy(&b, &delta, 4); logop(2, p, b, 0); }
static void emitters(void *p, float delta) { uint32_t b; memcpy(&b, &delta, 4); logop(3, p, b, 0); }
static void *scene(void) { logop(4, memory, 0, 0); return variant & 1 ? memory + 0x33000 : NULL; }
static void bones(void *p) { logop(5, p, 0, 0); }
static void bounds(void *p) { logop(6, p, 0, 0); }
static void fault(int sig, siginfo_t *info, void *context) { ucontext_t *c = context; fprintf(stderr, "native animation update fault %d at %p rip=%llx rdi=%llx rsi=%llx rax=%llx\n", sig, info->si_addr, (unsigned long long)c->uc_mcontext.gregs[REG_RIP], (unsigned long long)c->uc_mcontext.gregs[REG_RDI], (unsigned long long)c->uc_mcontext.gregs[REG_RSI], (unsigned long long)c->uc_mcontext.gregs[REG_RAX]); _Exit(22); }
int main(int argc, char **argv) {
  struct sigaction action = {0}; action.sa_sigaction = fault; action.sa_flags = SA_SIGINFO; sigaction(SIGSEGV, &action, NULL);
  if (argc != 2) return 2;
  FILE *f = fopen(argv[1], "rb"); if (!f) return 3;
  if (mmap((void *)0x100000000UL, 0x2400000, 7, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0) == MAP_FAILED) return 4;
  if (fread((void *)0x100000000UL, 1, 0xd22000, f) != 0xd22000) return 5;
  fclose(f);
  arena = mmap(NULL, 64 * 1024 * 1024, 3, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0); if (arena == MAP_FAILED) return 6;
  memory = mmap((void *)0x460000000UL, 0x40000, 3, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0); if (memory == MAP_FAILED) return 8;
  hook(0x100795530UL, allocate); hook(0x100795a70UL, release); hook(0x1007c6c20UL, scratch);
  hook(0x10009fcd0UL, no_library); hook(0x1007e5f70UL, assertion); hook(0x1007e6030UL, assertion);
  imported(0x100aa28f4UL, memcpy); imported(0x100aa24aaUL, zero_bytes); imported(0x100aa2906UL, pattern16); imported(0x100aa2a2cUL, traced_power);
  hook(0x10009b960UL, request_effects); hook(0x1000e8030UL, sounds); hook(0x100092a70UL, emitters);
  hook(0x1002acd30UL, scene); hook(0x10009c000UL, bones); hook(0x10009c3a0UL, bounds);
  uint64_t guard = 0; void *guard_pointer = &guard; memcpy((void *)0x100c0d8d8UL, &guard_pointer, 8);
  if (mprotect((void *)0x100000000UL, 0xc05000, 5)) return 7;
  uint32_t count; read_exact(&count, 4); write_word(count);
  while (count--) {
    uint32_t size; read_exact(&size, 4); if (!size || size > 16000000) return 9;
    uint8_t *input = malloc(size), stream[0x50] __attribute__((aligned(16))) = {0}; read_exact(input, size);
    used = allocation_count = 0; memset(memory + 0xa000, 0, 0x100);
    ((void (*)(void *, uint32_t, void *, uint32_t))0x100769c80UL)(stream, 0, input, size);
    ((void (*)(void *, void *, void *, uint32_t, const char *))0x1000e5db0UL)(memory + 0xa000, stream, arena, 0, "update-oracle");
    uint32_t bone_count = word(memory + 0xa000, 0x54), nodes_size = (bone_count + 1) * 0xf0, palette_size = (bone_count + 1) * 64, requests;
    if (bone_count > 256) return 17;
    read_exact(&requests, 4); write_word(requests);
    while (requests--) {
      uint32_t frames, dynamic, reciprocal_count;
      read_exact(&frames, 4); read_exact(&variant, 4); read_exact(&dynamic, 4);
      read_exact(memory, 0x6300); read_exact(memory + 0x7000, 0x1820); read_exact(memory + 0xb000, nodes_size); read_exact(memory + 0x22000, palette_size);
      read_exact((void *)0x100d22ed0UL, 1024); read_exact((void *)0x100d232d0UL, 1024);
      *(uint8_t *)0x100c7dc91UL = dynamic;
      *(uint8_t *)0x101d744b8UL = variant & 1 ? 1 : 0; *(uint8_t *)0x101d74528UL = variant & 2 ? 1 : 0;
      line = severity = trace_count = pow_count = 0;
      const float deltas[6] = {0, 1.0f / 60, 0.267f, 0.75f, 1.0f / 60, 0.1f};
      for (uint32_t frame = 0; frame < frames; frame++) {
        if (frame == 3) { float position = -0.35f; memcpy(memory + 0xb000, &position, 4); ((void (*)(void *))0x1007f2740UL)(memory + 0xb000); }
        if (!setjmp(escape)) ((void (*)(void *, float))0x100098b90UL)(memory, variant & 256 ? (frame ? 0.1f : 0) : deltas[frame % 6]);
        write_word(line); write_word(severity); write_exact(memory, 0x6300); write_exact(memory + 0x7000, 0x1820); write_exact(memory + 0xb000, nodes_size); write_exact(memory + 0x22000, palette_size);
        write_word(trace_count); write_exact(trace, trace_count * 4);
      }
      write_word(pow_count); write_exact(pow_trace, pow_count * 12);
      read_exact(&reciprocal_count, 4); write_word(reciprocal_count);
      while (reciprocal_count--) {
        uint32_t input_bits; read_exact(&input_bits, 4); float in; memcpy(&in, &input_bits, 4);
        uint32_t out = _mm_cvtsi128_si32(_mm_castps_si128(_mm_rsqrt_ps(_mm_set1_ps(in)))); write_word(input_bits); write_word(out);
      }
    }
    free(input);
  }
  return 0;
}
