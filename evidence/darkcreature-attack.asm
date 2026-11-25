0x100270960: push rbp
0x100270961: mov rbp, rsp
0x100270964: push r15
0x100270966: push r14
0x100270968: push r13
0x10027096a: push r12
0x10027096c: push rbx
0x10027096d: and rsp, 0xffffffffffffffe0
0x100270971: sub rsp, 0x2c0
0x100270978: mov r14, r8
0x10027097b: mov r15, rcx
0x10027097e: mov r12, rsi
0x100270981: mov rbx, rdi
0x100270984: mov rax, qword ptr [rip + 0x99cf4d] ; 0x100c0d8d8
0x10027098b: mov rax, qword ptr [rax]
0x10027098e: mov qword ptr [rsp + 0x2a0], rax
0x100270996: cmp byte ptr [rbx + 0x174], 0
0x10027099d: vmovaps xmmword ptr [rsp + 0x30], xmm0
0x1002709a3: je 0x100270a8c
0x1002709a9: vmovss xmm0, dword ptr [rbx + 0x170]
0x1002709b1: vdivss xmm0, xmm0, dword ptr [rip + 0x837307] ; 0x100aa7cc0
0x1002709b9: vmovaps xmm1, xmmword ptr [rbx + 0x160]
0x1002709c1: vsubps xmm2, xmm1, xmmword ptr [rbx + 0x150]
0x1002709c9: vxorps ymm3, ymm3, ymm3
0x1002709cd: vblendps xmm3, xmm2, xmm3, 2
0x1002709d3: vmulps xmm4, xmm3, xmm3
0x1002709d7: vmovshdup xmm5, xmm4
0x1002709db: vaddss xmm5, xmm4, xmm5
0x1002709df: vpermilpd xmm4, xmm4, 1
0x1002709e5: vaddss xmm4, xmm4, xmm5
0x1002709e9: vsqrtss xmm4, xmm4, xmm4
0x1002709ed: vucomiss xmm4, dword ptr [rip + 0x836ecf] ; 0x100aa78c4
0x1002709f5: jbe 0x100270a0b
0x1002709f7: vxorps xmm3, xmm3, xmm3
0x1002709fb: vblendps xmm2, xmm2, xmm3, 2
0x100270a01: vpermilps xmm3, xmm4, 0xc0
0x100270a07: vdivps xmm3, xmm2, xmm3
0x100270a0b: vmulps xmm2, xmm3, xmmword ptr [rip + 0x8374bd] ; 0x100aa7ed0
0x100270a13: vaddps xmm2, xmm2, xmmword ptr [rip + 0x843f45] ; 0x100ab4960
0x100270a1b: vaddps xmm1, xmm1, xmm2
0x100270a1f: vmovaps xmmword ptr [rsp + 0x60], xmm1
0x100270a25: vaddss xmm0, xmm0, dword ptr [rip + 0x837bf3] ; 0x100aa8620
0x100270a2d: vaddss xmm0, xmm0, xmm0
0x100270a31: vxorps xmm1, xmm1, xmm1
0x100270a35: vmaxss xmm1, xmm1, xmm0
0x100270a39: vmovss xmm0, dword ptr [rip + 0x83467f] ; 0x100aa50c0
0x100270a41: vminss xmm1, xmm0, xmm1
0x100270a45: vsubss xmm2, xmm0, xmm1
0x100270a49: vmulss xmm2, xmm2, dword ptr [rip + 0x837f7b] ; 0x100aa89cc
0x100270a51: vmulss xmm1, xmm1, dword ptr [rip + 0x843eb3] ; 0x100ab490c
0x100270a59: vaddss xmm1, xmm1, xmm2
0x100270a5d: vmovss dword ptr [rbx + 0x100], xmm1
0x100270a65: lea rsi, [rbx + 0x60]
0x100270a69: lea rdi, [rsp + 0x40]
0x100270a6e: lea rdx, [rsp + 0x60]
0x100270a73: vzeroupper 
0x100270a76: call 0x10062cb10 ; 0x10062cb10
0x100270a7b: vbroadcastss xmm0, dword ptr [rbx + 0x100]
0x100270a84: vmulps xmm0, xmm0, xmmword ptr [rsp + 0x40]
0x100270a8a: jmp 0x100270ae9 ; 0x100270ae9
0x100270a8c: vmovaps xmm1, xmmword ptr [rip + 0x843edc] ; 0x100ab4970
0x100270a94: vmulps xmm2, xmm1, xmmword ptr [rbx + 0x1c0]
0x100270a9c: vpermilps xmm1, xmm0, 0xc0
0x100270aa2: vmulps xmm0, xmm1, xmm2
0x100270aa6: vaddps xmm0, xmm0, xmmword ptr [rbx + 0x1b0]
0x100270aae: vsubps xmm0, xmm0, xmmword ptr [rip + 0x836e3a] ; 0x100aa78f0
0x100270ab6: lea rdx, [rbx + 0x160]
0x100270abd: vmovaps xmmword ptr [rbx + 0x160], xmm0
0x100270ac5: lea rsi, [rbx + 0x60]
0x100270ac9: lea rdi, [rsp + 0x50]
0x100270ace: vmovss xmm0, dword ptr [rip + 0x8345ea] ; 0x100aa50c0
0x100270ad6: call 0x10062cb10 ; 0x10062cb10
0x100270adb: vmovaps xmm0, xmmword ptr [rip + 0x843e8d] ; 0x100ab4970
0x100270ae3: vmulps xmm0, xmm0, xmmword ptr [rsp + 0x50]
0x100270ae9: vaddps xmm0, xmm0, xmmword ptr [rbx + 0xc0]
0x100270af1: vmovaps xmmword ptr [rbx + 0xc0], xmm0
0x100270af9: mov rdi, qword ptr [rbx + 0x270]
0x100270b00: test rdi, rdi
0x100270b03: je 0x100270bbf
0x100270b09: mov r13, qword ptr [rbx + 0x278]
0x100270b10: test r13, r13
0x100270b13: je 0x100270bbf
0x100270b19: mov rax, qword ptr [rdi]
0x100270b1c: call qword ptr [rax]
0x100270b1e: cmp r13, rax
0x100270b21: jne 0x100270bbf
0x100270b27: mov rdi, qword ptr [rbx + 0x270]
0x100270b2e: mov rax, qword ptr [rdi]
0x100270b31: call qword ptr [rax + 0x10]
0x100270b34: test al, al
0x100270b36: je 0x100270bbf
0x100270b3c: vxorps ymm0, ymm0, ymm0
0x100270b40: vmovaps ymmword ptr [rsp + 0xc0], ymm0
0x100270b49: vmovaps ymmword ptr [rsp + 0xa0], ymm0
0x100270b52: vmovaps ymmword ptr [rsp + 0x80], ymm0
0x100270b5b: vmovaps ymmword ptr [rsp + 0x60], ymm0
0x100270b61: vmovaps xmm0, xmmword ptr [rbx + 0x60]
0x100270b66: vmovaps xmmword ptr [rsp + 0x70], xmm0
0x100270b6c: mov dword ptr [rsp + 0xd0], 0x20
0x100270b77: mov rdi, qword ptr [rbx + 0x270]
0x100270b7e: test rdi, rdi
0x100270b81: je 0x100270db1
0x100270b87: mov r13, qword ptr [rbx + 0x278]
0x100270b8e: test r13, r13
0x100270b91: je 0x100270db1
0x100270b97: mov rax, qword ptr [rdi]
0x100270b9a: vzeroupper 
0x100270b9d: call qword ptr [rax]
0x100270b9f: cmp r13, rax
0x100270ba2: jne 0x100270db1
0x100270ba8: mov rdi, qword ptr [rbx + 0x270]
0x100270baf: mov rax, qword ptr [rdi]
0x100270bb2: lea rsi, [rsp + 0x60]
0x100270bb7: call qword ptr [rax + 0x68]
0x100270bba: jmp 0x100270db1 ; 0x100270db1
0x100270bbf: cmp byte ptr [rbx + 0x2c1], 0
0x100270bc6: jne 0x100270db1
0x100270bcc: vmovaps xmm0, xmmword ptr [rbx + 0x60]
0x100270bd1: vsubps xmm1, xmm0, xmmword ptr [rbx + 0x160]
0x100270bd9: vmulps xmm1, xmm1, xmm1
0x100270bdd: vmovshdup xmm2, xmm1
0x100270be1: vaddss xmm2, xmm1, xmm2
0x100270be5: vpermilpd xmm1, xmm1, 1
0x100270beb: vaddss xmm1, xmm1, xmm2
0x100270bef: vsqrtss xmm1, xmm1, xmm1
0x100270bf3: vaddss xmm1, xmm1, dword ptr [rip + 0x837aa9] ; 0x100aa86a4
0x100270bfb: vdivss xmm1, xmm1, dword ptr [rip + 0x837a69] ; 0x100aa866c
0x100270c03: vxorps xmm2, xmm2, xmm2
0x100270c07: vmaxss xmm1, xmm2, xmm1
0x100270c0b: vmovss xmm2, dword ptr [rip + 0x8344ad] ; 0x100aa50c0
0x100270c13: vminss xmm1, xmm2, xmm1
0x100270c17: vsubss xmm2, xmm2, xmm1
0x100270c1b: vmulss xmm2, xmm2, dword ptr [rip + 0x8385b9] ; 0x100aa91dc
0x100270c23: vmulss xmm1, xmm1, dword ptr [rip + 0x83398d] ; 0x100aa45b8
0x100270c2b: vaddss xmm1, xmm1, xmm2
0x100270c2f: vmovss dword ptr [rsp + 0x2c], xmm1
0x100270c35: vxorps ymm1, ymm1, ymm1
0x100270c39: vmovaps ymmword ptr [rsp + 0x220], ymm1
0x100270c42: vmovaps ymmword ptr [rsp + 0x260], ymm1
0x100270c4b: vmovaps ymmword ptr [rsp + 0x280], ymm1
0x100270c54: vmovaps ymmword ptr [rsp + 0x240], ymm1
0x100270c5d: mov byte ptr [rsp + 0x22d], 1
0x100270c65: mov dword ptr [rsp + 0x220], 0x3f800000
0x100270c70: vmovaps xmmword ptr [rsp + 0x230], xmm0
0x100270c79: movabs rax, 0x42c8000041f00000
0x100270c83: mov qword ptr [rsp + 0x268], rax
0x100270c8b: mov dword ptr [rsp + 0x290], 0xc31
0x100270c96: vmovups ymmword ptr [rsp + 0x1f0], ymm1
0x100270c9f: vmovaps ymmword ptr [rsp + 0x1e0], ymm1
0x100270ca8: vmovaps ymmword ptr [rsp + 0x1c0], ymm1
0x100270cb1: vmovaps ymmword ptr [rsp + 0x1a0], ymm1
0x100270cba: vmovaps ymmword ptr [rsp + 0x180], ymm1
0x100270cc3: vmovaps ymmword ptr [rsp + 0x160], ymm1
0x100270ccc: vmovaps ymmword ptr [rsp + 0x140], ymm1
0x100270cd5: vmovaps ymmword ptr [rsp + 0x120], ymm1
0x100270cde: vmovaps ymmword ptr [rsp + 0x100], ymm1
0x100270ce7: vmovaps ymmword ptr [rsp + 0xe0], ymm1
0x100270cf0: vmovaps ymmword ptr [rsp + 0xc0], ymm1
0x100270cf9: vmovaps ymmword ptr [rsp + 0xa0], ymm1
0x100270d02: vmovaps ymmword ptr [rsp + 0x80], ymm1
0x100270d0b: vmovaps ymmword ptr [rsp + 0x60], ymm1
0x100270d11: lea rsi, [rip + 0x90bf9a] ; 0x100b7ccb2 DuskCreatureAttack
0x100270d18: lea rdx, [rsp + 0x220]
0x100270d20: lea rcx, [rsp + 0x60]
0x100270d25: mov rdi, qword ptr [rbp + 0x10]
0x100270d29: vzeroupper 
0x100270d2c: call 0x1006018a0 ; 0x1006018a0
0x100270d31: mov r13, rdx
0x100270d34: mov qword ptr [rbx + 0x270], rax
0x100270d3b: mov qword ptr [rbx + 0x278], r13
0x100270d42: vxorps ymm0, ymm0, ymm0
0x100270d46: vmovaps ymmword ptr [rsp + 0x60], ymm0
0x100270d4c: vmovaps ymmword ptr [rsp + 0xc0], ymm0
0x100270d55: vmovaps ymmword ptr [rsp + 0xa0], ymm0
0x100270d5e: vmovaps ymmword ptr [rsp + 0x80], ymm0
0x100270d67: vmovss xmm0, dword ptr [rsp + 0x2c]
0x100270d6d: vmovss dword ptr [rsp + 0x64], xmm0
0x100270d73: mov dword ptr [rsp + 0xd0], 2
0x100270d7e: test rax, rax
0x100270d81: je 0x100270daa
0x100270d83: test r13, r13
0x100270d86: je 0x100270daa
0x100270d88: mov rcx, qword ptr [rax]
0x100270d8b: mov rdi, rax
0x100270d8e: vzeroupper 
0x100270d91: call qword ptr [rcx]
0x100270d93: cmp r13, rax
0x100270d96: jne 0x100270daa
0x100270d98: mov rdi, qword ptr [rbx + 0x270]
0x100270d9f: mov rax, qword ptr [rdi]
0x100270da2: lea rsi, [rsp + 0x60]
0x100270da7: call qword ptr [rax + 0x68]
0x100270daa: mov byte ptr [rbx + 0x2c1], 1
0x100270db1: vmovaps xmm6, xmmword ptr [rsp + 0x30]
0x100270db7: vpermilps xmm0, xmm6, 0xc0
0x100270dbd: vmulps xmm1, xmm0, xmmword ptr [rbx + 0xc0]
0x100270dc5: vaddps xmm1, xmm1, xmmword ptr [rbx + 0xa0]
0x100270dcd: vmovss xmm2, dword ptr [rbx + 0xb4]
0x100270dd5: vmulps xmm3, xmm1, xmm1
0x100270dd9: vmovshdup xmm4, xmm3
0x100270ddd: vaddss xmm4, xmm3, xmm4
0x100270de1: vpermilpd xmm3, xmm3, 1
0x100270de7: vaddss xmm3, xmm3, xmm4
0x100270deb: vsqrtss xmm3, xmm3, xmm3
0x100270def: vmovss xmm4, dword ptr [rip + 0x835ca5] ; 0x100aa6a9c
0x100270df7: vmaxss xmm5, xmm4, xmm3
0x100270dfb: vcmpunordss xmm3, xmm3, xmm3
0x100270e00: vandnps xmm5, xmm3, xmm5
0x100270e04: vandps xmm3, xmm3, xmm4
0x100270e08: vorps xmm3, xmm5, xmm3
0x100270e0c: vdivss xmm2, xmm2, xmm3
0x100270e10: vmovss xmm3, dword ptr [rip + 0x8342a8] ; 0x100aa50c0
0x100270e18: vminss xmm4, xmm3, xmm2
0x100270e1c: vcmpunordss xmm2, xmm2, xmm2
0x100270e21: vandnps xmm4, xmm2, xmm4
0x100270e25: vandps xmm2, xmm2, xmm3
0x100270e29: vorps xmm2, xmm4, xmm2
0x100270e2d: vpermilps xmm2, xmm2, 0xc0
0x100270e33: vmulps xmm1, xmm1, xmm2
0x100270e37: vmulps xmm0, xmm0, xmm1
0x100270e3b: vaddps xmm0, xmm0, xmmword ptr [rbx + 0x60]
0x100270e40: vmovaps xmm1, xmmword ptr [rbx + 0x160]
0x100270e48: vsubps xmm0, xmm1, xmm0
0x100270e4c: vmulps xmm0, xmm0, xmm0
0x100270e50: vmovshdup xmm1, xmm0
0x100270e54: vaddss xmm1, xmm0, xmm1
0x100270e58: vpermilpd xmm0, xmm0, 1
0x100270e5e: vaddss xmm0, xmm0, xmm1
0x100270e62: vmovss xmm1, dword ptr [rip + 0x836e56] ; 0x100aa7cc0
0x100270e6a: vucomiss xmm1, xmm0
0x100270e6e: jbe 0x100270eac
0x100270e70: cmp byte ptr [rbx + 0x174], 0
0x100270e77: jne 0x100270eac
0x100270e79: mov rax, qword ptr [rbp + 0x18]
0x100270e7d: lea rsi, [rbx + 0x160]
0x100270e84: mov qword ptr [rsp + 0x10], rax
0x100270e89: mov rax, qword ptr [rbp + 0x10]
0x100270e8d: mov qword ptr [rsp + 8], rax
0x100270e92: mov rdi, rbx
0x100270e95: mov rdx, r12
0x100270e98: mov r8, r15
0x100270e9b: mov r9, r14
0x100270e9e: vzeroupper 
0x100270ea1: call 0x100270fd0 ; 0x100270fd0
0x100270ea6: vmovaps xmm6, xmmword ptr [rsp + 0x30]
0x100270eac: vaddss xmm0, xmm6, dword ptr [rbx + 0x170]
0x100270eb4: vmovss dword ptr [rbx + 0x170], xmm0
0x100270ebc: vucomiss xmm0, dword ptr [rip + 0x836dfc] ; 0x100aa7cc0
0x100270ec4: jbe 0x100270eda
0x100270ec6: mov dword ptr [rbx + 0x100], 0x41480000
0x100270ed0: mov dword ptr [rbx + 0x2e0], 3
0x100270eda: mov rax, qword ptr [rip + 0x99c9f7] ; 0x100c0d8d8
0x100270ee1: mov rax, qword ptr [rax]
0x100270ee4: cmp rax, qword ptr [rsp + 0x2a0]
0x100270eec: jne 0x100270f00
0x100270eee: lea rsp, [rbp - 0x28]
0x100270ef2: pop rbx
0x100270ef3: pop r12
0x100270ef5: pop r13
0x100270ef7: pop r14
0x100270ef9: pop r15
0x100270efb: pop rbp
0x100270efc: vzeroupper 
0x100270eff: ret 
0x100270f00: vzeroupper 
0x100270f03: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100270f08: nop dword ptr [rax + rax]
