0x100715cd0: push rbp
0x100715cd1: mov rbp, rsp
0x100715cd4: push r14
0x100715cd6: push rbx
0x100715cd7: mov rbx, rdi
0x100715cda: lea r14, [rbx + 0x10]
0x100715cde: mov esi, 0x280
0x100715ce3: mov rdi, r14
0x100715ce6: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x100715ceb: lea rdi, [rbx + 0x298]
0x100715cf2: call 0x100795650 ; 0x100795650
0x100715cf7: xor eax, eax
0x100715cf9: call 0x100011c10 ; 0x100011c10
0x100715cfe: lea rax, [rbx + 0x288]
0x100715d05: mov qword ptr [rbx + 0x288], 0
0x100715d10: lea rcx, [rbx + 0x280]
0x100715d17: mov qword ptr [rbx + 0x280], rax
0x100715d1e: lea rax, [rbx + 0x278]
0x100715d25: mov qword ptr [rbx + 0x278], rcx
0x100715d2c: lea rcx, [rbx + 0x270]
0x100715d33: mov qword ptr [rbx + 0x270], rax
0x100715d3a: lea rax, [rbx + 0x268]
0x100715d41: lea rdx, [rbx + 0x260]
0x100715d48: lea rsi, [rbx + 0x258]
0x100715d4f: vmovq xmm0, rcx
0x100715d54: vmovq xmm1, rax
0x100715d59: vpunpcklqdq xmm0, xmm1, xmm0
0x100715d5d: vmovq xmm1, rdx
0x100715d62: vmovq xmm2, rsi
0x100715d67: vpunpcklqdq xmm1, xmm2, xmm1
0x100715d6b: vinsertf128 ymm0, ymm1, xmm0, 1
0x100715d71: lea rax, [rbx + 0x250]
0x100715d78: vmovups ymmword ptr [rbx + 0x250], ymm0
0x100715d80: lea rcx, [rbx + 0x248]
0x100715d87: lea rdx, [rbx + 0x240]
0x100715d8e: lea rsi, [rbx + 0x238]
0x100715d95: vmovq xmm0, rax
0x100715d9a: vmovq xmm1, rcx
0x100715d9f: vpunpcklqdq xmm0, xmm1, xmm0
0x100715da3: vmovq xmm1, rdx
0x100715da8: vmovq xmm2, rsi
0x100715dad: vpunpcklqdq xmm1, xmm2, xmm1
0x100715db1: vinsertf128 ymm0, ymm1, xmm0, 1
0x100715db7: lea rax, [rbx + 0x230]
0x100715dbe: vmovups ymmword ptr [rbx + 0x230], ymm0
0x100715dc6: lea rcx, [rbx + 0x228]
0x100715dcd: lea rdx, [rbx + 0x220]
0x100715dd4: lea rsi, [rbx + 0x218]
0x100715ddb: vmovq xmm0, rax
0x100715de0: vmovq xmm1, rcx
0x100715de5: vpunpcklqdq xmm0, xmm1, xmm0
0x100715de9: vmovq xmm1, rdx
0x100715dee: vmovq xmm2, rsi
0x100715df3: vpunpcklqdq xmm1, xmm2, xmm1
0x100715df7: vinsertf128 ymm0, ymm1, xmm0, 1
0x100715dfd: lea rax, [rbx + 0x210]
0x100715e04: vmovups ymmword ptr [rbx + 0x210], ymm0
0x100715e0c: lea rcx, [rbx + 0x208]
0x100715e13: lea rdx, [rbx + 0x200]
0x100715e1a: lea rsi, [rbx + 0x1f8]
0x100715e21: vmovq xmm0, rax
0x100715e26: vmovq xmm1, rcx
0x100715e2b: vpunpcklqdq xmm0, xmm1, xmm0
0x100715e2f: vmovq xmm1, rdx
0x100715e34: vmovq xmm2, rsi
0x100715e39: vpunpcklqdq xmm1, xmm2, xmm1
0x100715e3d: vinsertf128 ymm0, ymm1, xmm0, 1
0x100715e43: lea rax, [rbx + 0x1f0]
0x100715e4a: vmovups ymmword ptr [rbx + 0x1f0], ymm0
0x100715e52: lea rcx, [rbx + 0x1e8]
0x100715e59: lea rdx, [rbx + 0x1e0]
0x100715e60: lea rsi, [rbx + 0x1d8]
0x100715e67: vmovq xmm0, rax
0x100715e6c: vmovq xmm1, rcx
0x100715e71: vpunpcklqdq xmm0, xmm1, xmm0
0x100715e75: vmovq xmm1, rdx
0x100715e7a: vmovq xmm2, rsi
0x100715e7f: vpunpcklqdq xmm1, xmm2, xmm1
0x100715e83: vinsertf128 ymm0, ymm1, xmm0, 1
0x100715e89: lea rax, [rbx + 0x1d0]
0x100715e90: vmovups ymmword ptr [rbx + 0x1d0], ymm0
0x100715e98: lea rcx, [rbx + 0x1c8]
0x100715e9f: lea rdx, [rbx + 0x1c0]
0x100715ea6: lea rsi, [rbx + 0x1b8]
0x100715ead: vmovq xmm0, rax
0x100715eb2: vmovq xmm1, rcx
0x100715eb7: vpunpcklqdq xmm0, xmm1, xmm0
0x100715ebb: vmovq xmm1, rdx
0x100715ec0: vmovq xmm2, rsi
0x100715ec5: vpunpcklqdq xmm1, xmm2, xmm1
0x100715ec9: vinsertf128 ymm0, ymm1, xmm0, 1
0x100715ecf: lea rax, [rbx + 0x1b0]
0x100715ed6: vmovups ymmword ptr [rbx + 0x1b0], ymm0
0x100715ede: lea rcx, [rbx + 0x1a8]
0x100715ee5: lea rdx, [rbx + 0x1a0]
0x100715eec: lea rsi, [rbx + 0x198]
0x100715ef3: vmovq xmm0, rax
0x100715ef8: vmovq xmm1, rcx
0x100715efd: vpunpcklqdq xmm0, xmm1, xmm0
0x100715f01: vmovq xmm1, rdx
0x100715f06: vmovq xmm2, rsi
0x100715f0b: vpunpcklqdq xmm1, xmm2, xmm1
0x100715f0f: vinsertf128 ymm0, ymm1, xmm0, 1
0x100715f15: lea rax, [rbx + 0x190]
0x100715f1c: vmovups ymmword ptr [rbx + 0x190], ymm0
0x100715f24: lea rcx, [rbx + 0x188]
0x100715f2b: lea rdx, [rbx + 0x180]
0x100715f32: lea rsi, [rbx + 0x178]
0x100715f39: vmovq xmm0, rax
0x100715f3e: vmovq xmm1, rcx
0x100715f43: vpunpcklqdq xmm0, xmm1, xmm0
0x100715f47: vmovq xmm1, rdx
0x100715f4c: vmovq xmm2, rsi
0x100715f51: vpunpcklqdq xmm1, xmm2, xmm1
0x100715f55: vinsertf128 ymm0, ymm1, xmm0, 1
0x100715f5b: lea rax, [rbx + 0x170]
0x100715f62: vmovups ymmword ptr [rbx + 0x170], ymm0
0x100715f6a: lea rcx, [rbx + 0x168]
0x100715f71: lea rdx, [rbx + 0x160]
0x100715f78: lea rsi, [rbx + 0x158]
0x100715f7f: vmovq xmm0, rax
0x100715f84: vmovq xmm1, rcx
0x100715f89: vpunpcklqdq xmm0, xmm1, xmm0
0x100715f8d: vmovq xmm1, rdx
0x100715f92: vmovq xmm2, rsi
0x100715f97: vpunpcklqdq xmm1, xmm2, xmm1
0x100715f9b: vinsertf128 ymm0, ymm1, xmm0, 1
0x100715fa1: lea rax, [rbx + 0x150]
0x100715fa8: vmovups ymmword ptr [rbx + 0x150], ymm0
0x100715fb0: lea rcx, [rbx + 0x148]
0x100715fb7: lea rdx, [rbx + 0x140]
0x100715fbe: lea rsi, [rbx + 0x138]
0x100715fc5: vmovq xmm0, rax
0x100715fca: vmovq xmm1, rcx
0x100715fcf: vpunpcklqdq xmm0, xmm1, xmm0
0x100715fd3: vmovq xmm1, rdx
0x100715fd8: vmovq xmm2, rsi
0x100715fdd: vpunpcklqdq xmm1, xmm2, xmm1
0x100715fe1: vinsertf128 ymm0, ymm1, xmm0, 1
0x100715fe7: lea rax, [rbx + 0x130]
0x100715fee: vmovups ymmword ptr [rbx + 0x130], ymm0
0x100715ff6: lea rcx, [rbx + 0x128]
0x100715ffd: lea rdx, [rbx + 0x120]
0x100716004: lea rsi, [rbx + 0x118]
0x10071600b: vmovq xmm0, rax
0x100716010: vmovq xmm1, rcx
0x100716015: vpunpcklqdq xmm0, xmm1, xmm0
0x100716019: vmovq xmm1, rdx
0x10071601e: vmovq xmm2, rsi
0x100716023: vpunpcklqdq xmm1, xmm2, xmm1
0x100716027: vinsertf128 ymm0, ymm1, xmm0, 1
0x10071602d: lea rax, [rbx + 0x110]
0x100716034: vmovups ymmword ptr [rbx + 0x110], ymm0
0x10071603c: lea rcx, [rbx + 0x108]
0x100716043: lea rdx, [rbx + 0x100]
0x10071604a: lea rsi, [rbx + 0xf8]
0x100716051: vmovq xmm0, rax
0x100716056: vmovq xmm1, rcx
0x10071605b: vpunpcklqdq xmm0, xmm1, xmm0
0x10071605f: vmovq xmm1, rdx
0x100716064: vmovq xmm2, rsi
0x100716069: vpunpcklqdq xmm1, xmm2, xmm1
0x10071606d: vinsertf128 ymm0, ymm1, xmm0, 1
0x100716073: lea rax, [rbx + 0xf0]
0x10071607a: vmovups ymmword ptr [rbx + 0xf0], ymm0
0x100716082: lea rcx, [rbx + 0xe8]
0x100716089: lea rdx, [rbx + 0xe0]
0x100716090: lea rsi, [rbx + 0xd8]
0x100716097: vmovq xmm0, rax
0x10071609c: vmovq xmm1, rcx
0x1007160a1: vpunpcklqdq xmm0, xmm1, xmm0
0x1007160a5: vmovq xmm1, rdx
0x1007160aa: vmovq xmm2, rsi
0x1007160af: vpunpcklqdq xmm1, xmm2, xmm1
0x1007160b3: vinsertf128 ymm0, ymm1, xmm0, 1
0x1007160b9: lea rax, [rbx + 0xd0]
0x1007160c0: vmovups ymmword ptr [rbx + 0xd0], ymm0
0x1007160c8: lea rcx, [rbx + 0xc8]
0x1007160cf: lea rdx, [rbx + 0xc0]
0x1007160d6: lea rsi, [rbx + 0xb8]
0x1007160dd: vmovq xmm0, rax
0x1007160e2: vmovq xmm1, rcx
0x1007160e7: vpunpcklqdq xmm0, xmm1, xmm0
0x1007160eb: vmovq xmm1, rdx
0x1007160f0: vmovq xmm2, rsi
0x1007160f5: vpunpcklqdq xmm1, xmm2, xmm1
0x1007160f9: vinsertf128 ymm0, ymm1, xmm0, 1
0x1007160ff: lea rax, [rbx + 0xb0]
0x100716106: vmovups ymmword ptr [rbx + 0xb0], ymm0
0x10071610e: lea rcx, [rbx + 0xa8]
0x100716115: lea rdx, [rbx + 0xa0]
0x10071611c: lea rsi, [rbx + 0x98]
0x100716123: vmovq xmm0, rax
0x100716128: vmovq xmm1, rcx
0x10071612d: vpunpcklqdq xmm0, xmm1, xmm0
0x100716131: vmovq xmm1, rdx
0x100716136: vmovq xmm2, rsi
0x10071613b: vpunpcklqdq xmm1, xmm2, xmm1
0x10071613f: vinsertf128 ymm0, ymm1, xmm0, 1
0x100716145: lea rax, [rbx + 0x90]
0x10071614c: vmovups ymmword ptr [rbx + 0x90], ymm0
0x100716154: lea rcx, [rbx + 0x88]
0x10071615b: mov rdx, rbx
0x10071615e: sub rdx, -0x80
0x100716162: lea rsi, [rbx + 0x78]
0x100716166: vmovq xmm0, rax
0x10071616b: vmovq xmm1, rcx
0x100716170: vpunpcklqdq xmm0, xmm1, xmm0
0x100716174: vmovq xmm1, rdx
0x100716179: vmovq xmm2, rsi
0x10071617e: vpunpcklqdq xmm1, xmm2, xmm1
0x100716182: vinsertf128 ymm0, ymm1, xmm0, 1
0x100716188: lea rax, [rbx + 0x70]
0x10071618c: vmovups ymmword ptr [rbx + 0x70], ymm0
0x100716191: lea rcx, [rbx + 0x68]
0x100716195: lea rdx, [rbx + 0x60]
0x100716199: lea rsi, [rbx + 0x58]
0x10071619d: vmovq xmm0, rax
0x1007161a2: vmovq xmm1, rcx
0x1007161a7: vpunpcklqdq xmm0, xmm1, xmm0
0x1007161ab: vmovq xmm1, rdx
0x1007161b0: vmovq xmm2, rsi
0x1007161b5: vpunpcklqdq xmm1, xmm2, xmm1
0x1007161b9: vinsertf128 ymm0, ymm1, xmm0, 1
0x1007161bf: lea rax, [rbx + 0x50]
0x1007161c3: vmovups ymmword ptr [rbx + 0x50], ymm0
0x1007161c8: lea rcx, [rbx + 0x48]
0x1007161cc: lea rdx, [rbx + 0x40]
0x1007161d0: lea rsi, [rbx + 0x38]
0x1007161d4: vmovq xmm0, rax
0x1007161d9: vmovq xmm1, rcx
0x1007161de: vpunpcklqdq xmm0, xmm1, xmm0
0x1007161e2: vmovq xmm1, rdx
0x1007161e7: vmovq xmm2, rsi
0x1007161ec: vpunpcklqdq xmm1, xmm2, xmm1
0x1007161f0: vinsertf128 ymm0, ymm1, xmm0, 1
0x1007161f6: lea rax, [rbx + 0x30]
0x1007161fa: vmovups ymmword ptr [rbx + 0x30], ymm0
0x1007161ff: lea rcx, [rbx + 0x28]
0x100716203: lea rdx, [rbx + 0x20]
0x100716207: lea rsi, [rbx + 0x18]
0x10071620b: vmovq xmm0, rax
0x100716210: vmovq xmm1, rcx
0x100716215: vpunpcklqdq xmm0, xmm1, xmm0
0x100716219: vmovq xmm1, rdx
0x10071621e: vmovq xmm2, rsi
0x100716223: vpunpcklqdq xmm1, xmm2, xmm1
0x100716227: vinsertf128 ymm0, ymm1, xmm0, 1
0x10071622d: vmovups ymmword ptr [rbx + 0x10], ymm0
0x100716232: mov qword ptr [rbx + 0x290], r14
0x100716239: pop rbx
0x10071623a: pop r14
0x10071623c: pop rbp
0x10071623d: vzeroupper 
0x100716240: ret 
0x100716241: nop word ptr cs:[rax + rax]
