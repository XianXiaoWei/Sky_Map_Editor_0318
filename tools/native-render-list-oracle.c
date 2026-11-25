/* Execute complete supplied RenderList / VertexRender queue functions, plus
 * original Model submit and VertexRender initialization with the same list.
 * Only graphics/program/parameter/copy/update-format/assertion ABI services
 * are hooked. No list registration, lookup, primitive count or queue hook. */
#define _GNU_SOURCE
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <setjmp.h>
#include <sys/mman.h>
#include <signal.h>
#include <ucontext.h>

#define SIZE 32768
static uint8_t *memory = (void *)0x300000000UL;
static jmp_buf escape;
static uint32_t line, severity, events[128][6], event_count, updates;
static char source[32], expression[128];
static uint32_t case_index, action_index;
static void fault(int signal, siginfo_t *info, void *context) {
  ucontext_t *state = context;
  fprintf(stderr, "Native case %u action %u signal %d address %p PC %#llx\n", case_index, action_index, signal, info->si_addr, (unsigned long long)state->uc_mcontext.gregs[REG_RIP]);
  _Exit(15);
}
static void rd(void *p, size_t n) {if (fread(p, 1, n, stdin) != n) exit(10);}
static void wr(void *p, size_t n) {if (fwrite(p, 1, n, stdout) != n) exit(11);}
static uint32_t u(void *p) {uint32_t n; memcpy(&n, p, 4); return n;}
static void put(void *p, uint32_t n) {memcpy(p, &n, 4);}
static void putq(void *p, uintptr_t n) {memcpy(p, &n, 8);}
static uint32_t off(void *p) {return p ? (uint32_t)((uint8_t *)p - memory) : 0;}
static void *ptr(uint32_t n) {return n ? memory + n : NULL;}
static void event(uint32_t id, uint32_t a, uint32_t b, uint32_t c, uint32_t d, uint32_t e) {
  if (event_count == 128) exit(12);
  uint32_t row[6] = {id, a, b, c, d, e}; memcpy(events[event_count++], row, 24);
}
static void assertion(const char *expr, const char *file, uint32_t ln, uint32_t sev, ...) {
  line = ln; severity = sev; snprintf(source, sizeof source, "%s", file);
  snprintf(expression, sizeof expression, "%s", expr); longjmp(escape, 1);
}
static void *graphics(void) {event(1, 0x7400, 0, 0, 0, 0); return memory + 0x7400;}
static uint32_t program(void *g, void *definition) {
  event(2, off(g), off(definition), u(definition), 0x12345678, 0); return 0x12345678;
}
static void parameters(void *out, uint32_t p) {
  event(3, off(out), p, 0, 0, 0); put(out, p);
  putq((uint8_t *)out+0x158, (uintptr_t)(memory+0x6500));
  putq((uint8_t *)out+0x148, (uintptr_t)(memory+0x6700));
  put((uint8_t *)out+0x164, p); put((uint8_t *)out+0x160, 0x5678);
}
static void bind_data(void *out, void *data, uint32_t count, uint32_t offset) {
  event(4, off(out), off(data), count, offset, 0); putq((uint8_t *)out + 8, (uintptr_t)data);
}
static void copy_bytes(void *out, void *in, size_t n) {event(5, off(out), off(in), n, 0, 0); memcpy(out, in, n);}
static void update_format(void *render, void *format, void *context) {
  uint32_t list = off(format) - 0xc0;
  event(6, off(render), off(format), off(context), memory[list + 0x3c], 0);
  uint32_t mode = u(memory + 0x7000);
  if (updates++ == 0) {
    if (mode == 1) put(memory + list + 0x18, 1);
    if (mode == 2) putq(memory + list, (uintptr_t)(memory + 0x780));
    if (mode == 3) putq(memory + 0x608, 0);
    if (mode == 4) put(memory + list + 0x18, 4);
  }
}
static void destroy_parameters(void *g, uint32_t p) {event(7,off(g),p,0,0,0);}
static void release(void *allocator, void *p) {event(8,off(allocator),off(p),0,0,0);}
static void destroy_program(void *g, uint32_t p) {event(9,off(g),p,0,0,0);}
static void graphics_table(void) {
  putq(memory+0x7400,(uintptr_t)(memory+0x7500));
  putq(memory+0x75a8,(uintptr_t)program);
  putq(memory+0x75c0,(uintptr_t)destroy_program);
  putq(memory+0x75d8,(uintptr_t)destroy_parameters);
}
static void hook(uintptr_t at, void *fn) {
  uint8_t b[] = {0xff,0x25,0,0,0,0,0,0,0,0,0,0,0,0}; memcpy(b+6, &fn, 8); memcpy((void *)at, b, 14);
}
static void map(void *p, size_t n) {
  if (mmap(p,n,3,MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED_NOREPLACE,-1,0)==MAP_FAILED) exit(5);
}
int main(int argc, char **argv) {
  struct sigaction handler = {.sa_sigaction=fault,.sa_flags=SA_SIGINFO}; sigaction(SIGSEGV,&handler,0);
  if (argc != 2) return 2;
  FILE *f = fopen(argv[1], "rb"); if (!f) return 3;
  map((void *)0x100000000UL, 0x2400000);
  if (fread((void *)0x100000000UL, 1, 0xd22000, f) != 0xd22000) return 4;
  fclose(f); map(memory, SIZE);
  hook(0x1007e5f70UL, assertion); hook(0x1007e6030UL, assertion);
  hook(0x1007c1470UL, graphics); hook(0x1007bfd80UL, parameters);
  hook(0x1007bdfd0UL, bind_data); hook(0x100aa28f4UL, copy_bytes);
  hook(0x1007f6280UL, update_format);
  hook(0x100795a70UL, release);
  putq((void *)0x100c0db08UL,(uintptr_t)(memory+0x6200));
  putq((void *)0x1020482d8UL,(uintptr_t)(memory+0x6300));
  *(uint8_t *)0x102007598UL = 0;
  if (mprotect((void *)0x100000000UL, 0xc05000, 5)) return 6;
  uint32_t cases; rd(&cases, 4); wr(&cases, 4);
  while (cases--) {
    case_index++;
    uint32_t actions[64][5], n; rd(&n, 4); if (n > 64) return 7;
    rd(actions, n * 20); rd(memory, SIZE);
    graphics_table();
    for (action_index = 0; action_index < n; action_index++) {
      uint32_t *ac = actions[action_index];
      uint32_t result = 0; line = severity = event_count = updates = 0;
      memset(source, 0, sizeof source); memset(expression, 0, sizeof expression);
      if (!setjmp(escape)) {
        void *a = ptr(ac[1]), *b = ptr(ac[2]), *c = ptr(ac[3]), *d = ptr(ac[4]);
        switch (ac[0]) {
          case 0: ((void (*)(void *, void *))0x1007b97b0UL)(a,b); break;
          case 1: ((void (*)(void *, void *))0x1007b9820UL)(a,b); break;
          case 2: ((void (*)(void *))0x1007f6540UL)(a); break;
          case 3: ((void (*)(void *, void *))0x1007b9990UL)(a,b); break;
          case 4: result = ((uint32_t (*)(void *))0x1007f65d0UL)(a); break;
          case 5: ((void (*)(void *))0x1007f6770UL)(a); break;
          case 6: result = ((uint8_t (*)(void *,void *,void *,void *))0x1007ba080UL)(a,b,c,d); break;
          case 7: ((void (*)(void *,void *,void *,uint8_t))0x1007b9fc0UL)(a,b,c,ac[4]); break;
          case 8: ((void (*)(void *,void *,void *,void *,uint32_t))0x1007f5e90UL)(a,b,c,d,4); break;
          case 9: ((void (*)(void *))0x10046b780UL)(a); break;
          case 10: *(uint8_t *)a = ac[2]; break;
          case 11: put(a, ac[2]); break;
          case 12: putq(a, (uintptr_t)b); break;
          case 13: ((void (*)(void *))0x1007f6b80UL)(a); break;
          default: return 8;
        }
      }
      /* Graphics vtable is an ABI service, not compared native object state. */
      memset(memory + 0x7400, 0, 8); memset(memory + 0x75a8, 0, 8); memset(memory+0x75c0,0,8); memset(memory+0x75d8,0,8);
      wr(&result,4); wr(&line,4); wr(&severity,4); wr(source,32); wr(expression,128);
      wr(&event_count,4); wr(events, event_count * 24); wr(memory,SIZE);
      graphics_table();
    }
  }
  return 0;
}
