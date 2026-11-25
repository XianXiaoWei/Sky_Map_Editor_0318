#define MOVE_RAIL_NO_MAIN
#include "native-move-object-along-rail-oracle.c"
static uint32_t exp_trace[4096 * 2], exp_count;
static void *readable_state(void *manager) { void *p = mo + 0x33000; mrecord(12, (uintptr_t)manager, (uintptr_t)p); mmutate(12); return p; }
static uint32_t session_authority(void *session) { uint32_t n = mo[0x4f038]; mrecord(13, (uintptr_t)session, n); mmutate(13); return n; }
static uint32_t objective_enabled(void *objective) { uint32_t n = ((uint8_t *)objective)[0xf0]; mrecord(14, (uintptr_t)objective, n); mmutate(14); return n; }
static void *local_avatar(void *barn) { void *p = mo + 0x36000; mrecord(15, (uintptr_t)barn, (uintptr_t)p); mmutate(15); return p; }
static void set_enabled(void *object, uint32_t enabled) { mrecord(16, (uintptr_t)object, enabled); mmutate(16); }
static void event_finish(void *event) { mrecord(17, (uintptr_t)event, 0); mmutate(17); ((uint8_t *)event)[224] = 0; }
static float traced_exp(float input) {
  if (exp_count >= 4096) exit(23);
  float result = expf(input); uint32_t in, out; memcpy(&in, &input, 4); memcpy(&out, &result, 4);
  exp_trace[exp_count * 2] = in; exp_trace[exp_count++ * 2 + 1] = out; mrecord(18, in, out); mmutate(18); return result;
}
static float traced_fmod(float input, float denominator) {
  float result = fmodf(input, denominator); uint32_t in, den, out; memcpy(&in, &input, 4); memcpy(&den, &denominator, 4); memcpy(&out, &result, 4);
  uint8_t *r = mrecord(19, in, den); memcpy(r + 24, &out, 4); return result;
}
__attribute__((used,noinline)) static void object_boundary(void) { mrecord(11, 0, 0); longjmp(escape, 1); }
/* The native object-loop boundary is reached by a jump, not a CALL. Supply
 * the ordinary C stack alignment for the terminating trace service. */
__attribute__((naked,noinline)) static void boundary_entry(void) {
  __asm__ volatile("sub $8,%rsp\nmovabs $object_boundary,%rax\njmp *%rax");
}
int main(int argc, char **argv) {
  struct sigaction action = {0}; action.sa_sigaction = fault; action.sa_flags = SA_SIGINFO; sigaction(SIGSEGV, &action, NULL);
  if (argc != 2) return 2; FILE *f = fopen(argv[1], "rb"); if (!f) return 3;
  if (mmap((void *)0x100000000UL, 0x2400000, 7, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0) == MAP_FAILED) return 4;
  if (fread((void *)0x100000000UL, 1, 0xd22000, f) != 0xd22000) return 5; fclose(f);
  if (mmap(mo, MOVE_SIZE, 3, MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0) == MAP_FAILED) return 6;
  hook(0x1007abc10UL, move_meta); hook(0x102220000UL, move_cast); hook(0x1004d1e40UL, move_transform);
  hook(0x10055d820UL, move_nearest); hook(0x10055d410UL, move_distance);
  hook(0x100410c90UL, move_network); hook(0x100410ca0UL, readable_state);
  hook(0x1004a0a20UL, session_authority); hook(0x1004d2050UL, objective_enabled);
  hook(0x1000fc260UL, local_avatar); hook(0x1004d1f60UL, set_enabled); hook(0x10032ef60UL, event_finish);
  hook(0x100484fc0UL, boundary_entry);
  imported(0x100aa2708UL, traced_exp); imported(0x100aa2744UL, traced_fmod);
  hook(0x1007e5f70UL, move_assertion); hook(0x1007e6030UL, move_assertion);
  uint32_t n; rd(&n, 4); put_word(n);
  while (n--) {
    uint32_t mode; rd(&mode, 4); if (mode != 7) return 7;
    rd(mo, MOVE_SIZE); move_calls = line = severity = move_nearest_count = move_distance_count = move_mutated = exp_count = 0; memset(move_kind_count, 0, sizeof move_kind_count);
    *(uint8_t *)0x101ffb0d0UL = !!mu32(0x4f030); uint32_t scale = mu32(0x4f034); memcpy((void *)0x100cb8540UL, &scale, 4);
    uint64_t p = (uintptr_t)mo + 0x48800; mp64(0x48000, p); mp64(0x48840, 0x102220000UL);
    for (volatile uint32_t step = 0; step < mu32(0x4f000); step++) {
      if (!setjmp(escape)) ((void (*)(void *, void *))0x100484a90UL)(mo + 0x1000, mo + 0x2000);
      if (line) break;
    }
    uint32_t h[] = {line, severity, move_calls, 0}; wr(h, 16); wr(mo, MOVE_SIZE); wr(move_trace, move_calls * MOVE_ROW);
    put_word(exp_count); wr(exp_trace, exp_count * 8);
  }
  return 0;
}
