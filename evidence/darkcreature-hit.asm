0x100270fd0: push rbp
0x100270fd1: mov rbp, rsp
0x100270fd4: push r15
0x100270fd6: push r14
0x100270fd8: push r13
0x100270fda: push r12
0x100270fdc: push rbx
0x100270fdd: and rsp, 0xffffffffffffffe0
0x100270fe1: sub rsp, 0x2c0
0x100270fe8: mov qword ptr [rsp + 0x28], r9
0x100270fed: mov r12, rdx
0x100270ff0: mov qword ptr [rsp + 0x18], rsi
0x100270ff5: mov qword ptr [rsp + 0x30], rdi
0x100270ffa: mov rax, qword ptr [rip + 0x99c8d7] ; 0x100c0d8d8
0x100271001: mov rax, qword ptr [rax]
0x100271004: mov qword ptr [rsp + 0x2a0], rax
0x10027100c: mov r14d, dword ptr [r8 + 0x210]
0x100271013: test r14, r14
0x100271016: je 0x1002710ee
0x10027101c: vxorps xmm0, xmm0, xmm0
0x100271020: vmovaps xmmword ptr [rsp], xmm0
0x100271025: xor r15d, r15d
0x100271028: xor r13d, r13d
0x10027102b: mov qword ptr [rsp + 0x38], r8
0x100271030: cmp r15, 0x3f
0x100271034: ja 0x1002710e0
0x10027103a: mov rbx, qword ptr [r8 + r15*8 + 0x10]
0x10027103f: test rbx, rbx
0x100271042: je 0x1002710e0
0x100271048: cmp byte ptr [rbx + 0xd0], 0
0x10027104f: je 0x1002710e0
0x100271055: mov rax, qword ptr [rbx + 0x78]
0x100271059: vmovss xmm0, dword ptr [rax + 0x18]
0x10027105e: vmovss dword ptr [rsp + 0x24], xmm0
0x100271064: mov rax, qword ptr [rbx]
0x100271067: lea rdi, [rsp + 0x60]
0x10027106c: mov rsi, rbx
0x10027106f: call qword ptr [rax + 0x58]
0x100271072: vmovaps xmm0, xmmword ptr [rsp + 0x60]
0x100271078: mov rax, qword ptr [rsp + 0x18]
0x10027107d: vsubps xmm0, xmm0, xmmword ptr [rax]
0x100271081: vmulps xmm0, xmm0, xmm0
0x100271085: vmovshdup xmm1, xmm0
0x100271089: vaddss xmm1, xmm0, xmm1
0x10027108d: vpermilpd xmm0, xmm0, 1
0x100271093: vaddss xmm0, xmm0, xmm1
0x100271097: vmovss xmm1, dword ptr [rsp + 0x24]
0x10027109d: vmulss xmm1, xmm1, xmm1
0x1002710a1: vsubss xmm0, xmm0, xmm1
0x1002710a5: vmovss xmm1, dword ptr [rip + 0x843863] ; 0x100ab4910
0x1002710ad: vucomiss xmm1, xmm0
0x1002710b1: jbe 0x1002710da
0x1002710b3: mov rax, qword ptr [rbx]
0x1002710b6: mov rdx, qword ptr [rbp + 0x20]
0x1002710ba: mov rsi, qword ptr [rdx + 0xe8]
0x1002710c1: mov rdi, rbx
0x1002710c4: call qword ptr [rax + 0x38]
0x1002710c7: vmovaps xmm0, xmmword ptr [rsp]
0x1002710cc: vaddps xmm0, xmm0, xmmword ptr [rsp + 0x60]
0x1002710d2: vmovaps xmmword ptr [rsp], xmm0
0x1002710d7: inc r13d
0x1002710da: mov r8, qword ptr [rsp + 0x38]
0x1002710df: nop 
0x1002710e0: inc r15
0x1002710e3: cmp r14, r15
0x1002710e6: jne 0x100271030
0x1002710ec: jmp 0x1002710fa ; 0x1002710fa
0x1002710ee: xor r13d, r13d
0x1002710f1: vxorps xmm0, xmm0, xmm0
0x1002710f5: vmovaps xmmword ptr [rsp], xmm0
0x1002710fa: xor r15d, r15d
0x1002710fd: xor ebx, ebx
0x1002710ff: nop 
0x100271100: mov rdi, r12
0x100271103: mov esi, ebx
0x100271105: call 0x1001031d0 ; 0x1001031d0
0x10027110a: mov r14, rax
0x10027110d: mov rdi, r14
0x100271110: call 0x1000fe050 ; 0x1000fe050
0x100271115: test al, al
0x100271117: je 0x10027116d
0x100271119: mov rax, qword ptr [r14 + 0x18]
0x10027111d: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x100271122: mov rax, qword ptr [rsp + 0x18]
0x100271127: vsubps xmm1, xmm0, xmmword ptr [rax]
0x10027112b: vmulps xmm1, xmm1, xmm1
0x10027112f: vmovshdup xmm2, xmm1
0x100271133: vaddss xmm2, xmm1, xmm2
0x100271137: vpermilpd xmm1, xmm1, 1
0x10027113d: vaddss xmm1, xmm1, xmm2
0x100271141: vmovss xmm2, dword ptr [rip + 0x8437c7] ; 0x100ab4910
0x100271149: vucomiss xmm2, xmm1
0x10027114d: jbe 0x10027116d
0x10027114f: cmp byte ptr [r14 + 0x1ef8], 0
0x100271157: je 0x10027115c
0x100271159: mov r15b, 1
0x10027115c: vmovaps xmm1, xmmword ptr [rsp]
0x100271161: vaddps xmm1, xmm1, xmm0
0x100271165: vmovaps xmmword ptr [rsp], xmm1
0x10027116a: inc r13d
0x10027116d: inc ebx
0x10027116f: cmp ebx, 0x10
0x100271172: jne 0x100271100
0x100271174: test r13d, r13d
0x100271177: mov rbx, qword ptr [rsp + 0x30]
0x10027117c: je 0x1002713c3
0x100271182: cmp qword ptr [rbx + 0x1f8], 0
0x10027118a: jne 0x1002713c3
0x100271190: vmovd xmm0, r13d
0x100271195: vpshufd xmm0, xmm0, 0xc0
0x10027119a: vpblendw xmm1, xmm0, xmmword ptr [rip + 0x8378ec], 0xaa ; 0x100aa8a90
0x1002711a4: vpsrld xmm0, xmm0, 0x10
0x1002711a9: vpblendw xmm0, xmm0, xmmword ptr [rip + 0x8378ed], 0xaa ; 0x100aa8aa0
0x1002711b3: vaddps xmm0, xmm0, xmmword ptr [rip + 0x8378f5] ; 0x100aa8ab0
0x1002711bb: vaddps xmm0, xmm1, xmm0
0x1002711bf: vmovaps xmm1, xmmword ptr [rsp]
0x1002711c4: vdivps xmm0, xmm1, xmm0
0x1002711c8: vmovaps xmmword ptr [rsp], xmm0
0x1002711cd: test r15b, 1
0x1002711d1: je 0x100271217
0x1002711d3: mov rdi, r12
0x1002711d6: call 0x1000fc260 ; 0x1000fc260
0x1002711db: mov r14, rax
0x1002711de: mov rdi, qword ptr [r14 + 0x30]
0x1002711e2: mov esi, 3
0x1002711e7: call 0x10011fce0 ; 0x10011fce0
0x1002711ec: mov rdi, qword ptr [r14 + 0x30]
0x1002711f0: call 0x10011fe00 ; 0x10011fe00
0x1002711f5: mov rax, qword ptr [rbp + 0x20]
0x1002711f9: mov rax, qword ptr [rax + 0x160]
0x100271200: vmovaps xmm0, xmmword ptr [rip + 0x839db8] ; 0x100aaafc0
0x100271208: vmovups xmmword ptr [rax + 0x74], xmm0
0x10027120d: mov dword ptr [rax + 0x84], 0x3e4ccccd
0x100271217: vmovaps xmm0, xmmword ptr [rsp]
0x10027121c: vmovaps xmmword ptr [rsp + 0x50], xmm0
0x100271222: mov rax, qword ptr [rip + 0x836e77] ; 0x100aa80a0
0x100271229: mov qword ptr [rsp + 0x40], rax
0x10027122e: mov dword ptr [rsp + 0x48], 0
0x100271236: lea rax, [rip + 0x1b7e94b] ; 0x101defb88
0x10027123d: mov rcx, qword ptr [rax]
0x100271240: lea rsi, [rsp + 0x50]
0x100271245: lea rdx, [rsp + 0x40]
0x10027124a: xor r8d, r8d
0x10027124d: mov rdi, qword ptr [rsp + 0x28]
0x100271252: call 0x1002de940 ; 0x1002de940
0x100271257: mov qword ptr [rbx + 0x1f8], rax
0x10027125e: vmovaps xmm0, xmmword ptr [rip + 0xaba1fa] ; 0x100d2b460
0x100271266: vmovaps xmmword ptr [rax + 0x120], xmm0
0x10027126e: vmovaps xmmword ptr [rax + 0x110], xmm0
0x100271276: mov dword ptr [rbx + 0x200], 0x3f800000
0x100271280: mov rax, qword ptr [rsp + 0x18]
0x100271285: vmovaps xmm3, xmmword ptr [rsp]
0x10027128a: vsubps xmm0, xmm3, xmmword ptr [rax]
0x10027128e: vmulps xmm0, xmm0, xmm0
0x100271292: vmovshdup xmm1, xmm0
0x100271296: vaddss xmm1, xmm0, xmm1
0x10027129a: vpermilpd xmm0, xmm0, 1
0x1002712a0: vaddss xmm0, xmm0, xmm1
0x1002712a4: vsqrtss xmm0, xmm0, xmm0
0x1002712a8: vmovss xmm1, dword ptr [rip + 0x833e10] ; 0x100aa50c0
0x1002712b0: vdivss xmm0, xmm1, xmm0
0x1002712b4: vminss xmm2, xmm1, xmm0
0x1002712b8: vcmpunordss xmm0, xmm0, xmm0
0x1002712bd: vandnps xmm2, xmm0, xmm2
0x1002712c1: vandps xmm0, xmm0, xmm1
0x1002712c5: vorps xmm0, xmm2, xmm0
0x1002712c9: vxorps ymm1, ymm1, ymm1
0x1002712cd: vmovaps ymmword ptr [rsp + 0x220], ymm1
0x1002712d6: vmovaps ymmword ptr [rsp + 0x260], ymm1
0x1002712df: vmovaps ymmword ptr [rsp + 0x280], ymm1
0x1002712e8: vmovaps ymmword ptr [rsp + 0x240], ymm1
0x1002712f1: mov byte ptr [rsp + 0x22d], 1
0x1002712f9: vmovss dword ptr [rsp + 0x220], xmm0
0x100271302: vmovaps xmmword ptr [rsp + 0x230], xmm3
0x10027130b: movabs rax, 0x412000003f800000
0x100271315: mov qword ptr [rsp + 0x268], rax
0x10027131d: mov dword ptr [rsp + 0x290], 0xc31
0x100271328: vmovups ymmword ptr [rsp + 0x1f0], ymm1
0x100271331: vmovaps ymmword ptr [rsp + 0x1e0], ymm1
0x10027133a: vmovaps ymmword ptr [rsp + 0x1c0], ymm1
0x100271343: vmovaps ymmword ptr [rsp + 0x1a0], ymm1
0x10027134c: vmovaps ymmword ptr [rsp + 0x180], ymm1
0x100271355: vmovaps ymmword ptr [rsp + 0x160], ymm1
0x10027135e: vmovaps ymmword ptr [rsp + 0x140], ymm1
0x100271367: vmovaps ymmword ptr [rsp + 0x120], ymm1
0x100271370: vmovaps ymmword ptr [rsp + 0x100], ymm1
0x100271379: vmovaps ymmword ptr [rsp + 0xe0], ymm1
0x100271382: vmovaps ymmword ptr [rsp + 0xc0], ymm1
0x10027138b: vmovaps ymmword ptr [rsp + 0xa0], ymm1
0x100271394: vmovaps ymmword ptr [rsp + 0x80], ymm1
0x10027139d: vmovaps ymmword ptr [rsp + 0x60], ymm1
0x1002713a3: lea rsi, [rip + 0x90b91b] ; 0x100b7ccc5 DuskCreatureHit
0x1002713aa: lea rdx, [rsp + 0x220]
0x1002713b2: lea rcx, [rsp + 0x60]
0x1002713b7: mov rdi, qword ptr [rbp + 0x18]
0x1002713bb: vzeroupper 
0x1002713be: call 0x1006018a0 ; 0x1006018a0
0x1002713c3: mov byte ptr [rbx + 0x174], 1
0x1002713ca: mov rax, qword ptr [rip + 0x99c507] ; 0x100c0d8d8
0x1002713d1: mov rax, qword ptr [rax]
0x1002713d4: cmp rax, qword ptr [rsp + 0x2a0]
0x1002713dc: jne 0x1002713ed
0x1002713de: lea rsp, [rbp - 0x28]
0x1002713e2: pop rbx
0x1002713e3: pop r12
0x1002713e5: pop r13
0x1002713e7: pop r14
0x1002713e9: pop r15
0x1002713eb: pop rbp
0x1002713ec: ret 
0x1002713ed: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1002713f2: nop word ptr cs:[rax + rax]
