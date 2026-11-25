0x100258f00: push rbp
0x100258f01: mov rbp, rsp
0x100258f04: push r15
0x100258f06: push r14
0x100258f08: push rbx
0x100258f09: sub rsp, 0xa8
0x100258f10: mov rbx, rdx
0x100258f13: mov r14, rsi
0x100258f16: mov r15, rdi
0x100258f19: mov rax, qword ptr [rip + 0x9b49b8] ; 0x100c0d8d8
0x100258f20: mov rax, qword ptr [rax]
0x100258f23: mov qword ptr [rbp - 0x20], rax
0x100258f27: mov eax, dword ptr [rbx]
0x100258f29: vxorps xmm0, xmm0, xmm0
0x100258f2d: lea edx, [rax - 1]
0x100258f30: vxorps xmm4, xmm4, xmm4
0x100258f34: cmp edx, 0xa
0x100258f37: ja 0x100258f98
0x100258f39: mov rcx, qword ptr [r15 + 8]
0x100258f3d: lea rsi, [rip + 0x280] ; 0x1002591c4
0x100258f44: movsxd rdx, dword ptr [rsi + rdx*4]
0x100258f48: add rdx, rsi
0x100258f4b: vxorps xmm4, xmm4, xmm4
0x100258f4f: jmp rdx
0x100258f51: add rcx, 0x20
0x100258f55: jmp 0x100258f94 ; 0x100258f94
0x100258f57: add rcx, 0x30
0x100258f5b: jmp 0x100258f94 ; 0x100258f94
0x100258f5d: add rcx, 0x40
0x100258f61: jmp 0x100258f94 ; 0x100258f94
0x100258f63: add rcx, 0x50
0x100258f67: jmp 0x100258f94 ; 0x100258f94
0x100258f69: add rcx, 0x60
0x100258f6d: jmp 0x100258f94 ; 0x100258f94
0x100258f6f: add rcx, 0x70
0x100258f73: jmp 0x100258f94 ; 0x100258f94
0x100258f75: sub rcx, -0x80
0x100258f79: jmp 0x100258f94 ; 0x100258f94
0x100258f7b: add rcx, 0x90
0x100258f82: jmp 0x100258f94 ; 0x100258f94
0x100258f84: add rcx, 0xa0
0x100258f8b: jmp 0x100258f94 ; 0x100258f94
0x100258f8d: add rcx, 0xb0
0x100258f94: vmovaps xmm4, xmmword ptr [rcx]
0x100258f98: vmovss xmm3, dword ptr [rbx + 0x30]
0x100258f9d: vmovaps xmmword ptr [rbp - 0xa0], xmm3
0x100258fa5: vxorps xmm1, xmm1, xmm1
0x100258fa9: vcmpeqss xmm1, xmm3, xmm1
0x100258fae: vmovss xmm2, dword ptr [rip + 0x84e902] ; 0x100aa78b8
0x100258fb6: vandps xmm2, xmm1, xmm2
0x100258fba: vandnps xmm1, xmm1, xmm3
0x100258fbe: vorps xmm1, xmm1, xmm2
0x100258fc2: vmovshdup xmm2, xmm4
0x100258fc6: vaddss xmm2, xmm2, xmm2
0x100258fca: vsubss xmm1, xmm2, xmm1
0x100258fce: vdivss xmm1, xmm1, xmm2
0x100258fd2: vmovss xmm2, dword ptr [r15 + rax*4 + 0x94]
0x100258fdc: vinsertps xmm1, xmm2, xmm1, 0x10
0x100258fe2: vmaxps xmm0, xmm0, xmm1
0x100258fe6: vmovaps xmm1, xmmword ptr [rip + 0x851562] ; 0x100aaa550
0x100258fee: vminps xmm0, xmm1, xmm0
0x100258ff2: vmulss xmm1, xmm0, xmm0
0x100258ff6: vmovss xmm2, dword ptr [rip + 0x84daa6] ; 0x100aa6aa4
0x100258ffe: vmulss xmm3, xmm0, xmm2
0x100259002: vmovaps xmm7, xmm4
0x100259006: vmovaps xmmword ptr [rbp - 0xc0], xmm7
0x10025900e: vmovss xmm4, dword ptr [rip + 0x850666] ; 0x100aa967c
0x100259016: vaddss xmm3, xmm3, xmm4
0x10025901a: vmulss xmm3, xmm0, xmm3
0x10025901e: vmovss xmm5, dword ptr [rip + 0x84e7b6] ; 0x100aa77dc
0x100259026: vaddss xmm3, xmm3, xmm5
0x10025902a: vmovshdup xmm6, xmm0
0x10025902e: vblendps xmm1, xmm1, xmm0, 2
0x100259034: vmulps xmm1, xmm0, xmm1
0x100259038: vblendps xmm0, xmm3, xmm0, 2
0x10025903e: vmulps xmm0, xmm1, xmm0
0x100259042: vmulss xmm1, xmm6, xmm2
0x100259046: vaddss xmm1, xmm1, xmm4
0x10025904a: vmulss xmm1, xmm6, xmm1
0x10025904e: vaddss xmm1, xmm1, xmm5
0x100259052: vinsertps xmm1, xmm7, xmm1, 0x10
0x100259058: vmulps xmm0, xmm1, xmm0
0x10025905c: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x100259064: mov rax, qword ptr [rbx + 0x10]
0x100259068: mov qword ptr [rbp - 0x30], rax
0x10025906c: vmovaps xmm0, xmmword ptr [rbx]
0x100259070: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x100259075: vmovaps xmm0, xmmword ptr [rbx + 0x20]
0x10025907a: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x100259082: mov eax, dword ptr [r15 + 0x40]
0x100259086: lea ecx, [rax + 1]
0x100259089: mov dword ptr [r15 + 0x40], ecx
0x10025908d: mov ecx, eax
0x10025908f: shl ecx, 0xd
0x100259092: xor ecx, eax
0x100259094: mov eax, ecx
0x100259096: imul eax, eax
0x100259099: imul eax, eax, 0x3d73
0x10025909f: add eax, 0xc0ae5
0x1002590a4: imul eax, ecx
0x1002590a7: add eax, 0x5208dd0d
0x1002590ac: and eax, 0x7fffffff
0x1002590b1: vcvtsi2ss xmm0, xmm8, eax
0x1002590b5: vmulss xmm0, xmm0, dword ptr [rip + 0x8557bf] ; 0x100aae87c
0x1002590bd: vmovss xmm1, dword ptr [rip + 0x84bffb] ; 0x100aa50c0
0x1002590c5: vaddss xmm0, xmm0, xmm1
0x1002590c9: vaddss xmm0, xmm0, xmm1
0x1002590cd: vmulss xmm0, xmm0, dword ptr [rip + 0x84b4e3] ; 0x100aa45b8
0x1002590d5: vsubss xmm1, xmm0, xmm1
0x1002590d9: vaddss xmm0, xmm0, xmm1
0x1002590dd: call 0x100aa2588 ; 0x100aa2588 _asinf
0x1002590e2: vmulss xmm0, xmm0, dword ptr [rip + 0x84b4ce] ; 0x100aa45b8
0x1002590ea: vcvtss2sd xmm0, xmm0, xmm0
0x1002590ee: vmulsd xmm0, xmm0, qword ptr [rip + 0x855b8a] ; 0x100aaec80
0x1002590f6: vaddsd xmm0, xmm0, qword ptr [rip + 0x84cdb2] ; 0x100aa5eb0
0x1002590fe: vcvtsd2ss xmm0, xmm0, xmm0
0x100259102: vmovsldup xmm1, xmmword ptr [rbp - 0xc0]
0x10025910a: vblendps xmm0, xmm1, xmm0, 1
0x100259110: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x90]
0x100259118: vmovshdup xmm1, xmm0
0x10025911c: vaddss xmm0, xmm0, xmm1
0x100259120: vmovss dword ptr [rbp - 0x90], xmm0
0x100259128: mov rax, qword ptr [rbx + 0x10]
0x10025912c: mov qword ptr [rbp - 0x70], rax
0x100259130: vmovaps xmm0, xmmword ptr [rbx]
0x100259134: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x100259139: vmovaps xmm0, xmmword ptr [rbx + 0x20]
0x10025913e: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x100259143: vmovaps xmm0, xmmword ptr [rbp - 0xa0]
0x10025914b: vmovss dword ptr [rbp - 0x50], xmm0
0x100259150: lea rsi, [rbp - 0x80]
0x100259154: mov rdi, r15
0x100259157: call 0x100258790 ; 0x100258790
0x10025915c: vmulss xmm0, xmm0, dword ptr [rbp - 0x90]
0x100259164: vucomiss xmm0, dword ptr [r14 + 0x40]
0x10025916a: jb 0x1002591a0
0x10025916c: vmovss dword ptr [r14 + 0x40], xmm0
0x100259172: mov rax, qword ptr [rbp - 0x30]
0x100259176: mov qword ptr [r14 + 0x10], rax
0x10025917a: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10025917f: vmovaps xmmword ptr [r14], xmm0
0x100259184: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x10025918c: vmovaps xmmword ptr [r14 + 0x20], xmm0
0x100259192: vmovaps xmm0, xmmword ptr [rbp - 0xa0]
0x10025919a: vmovss dword ptr [r14 + 0x30], xmm0
0x1002591a0: mov rax, qword ptr [rip + 0x9b4731] ; 0x100c0d8d8
0x1002591a7: mov rax, qword ptr [rax]
0x1002591aa: cmp rax, qword ptr [rbp - 0x20]
0x1002591ae: jne 0x1002591be
0x1002591b0: add rsp, 0xa8
0x1002591b7: pop rbx
0x1002591b8: pop r14
0x1002591ba: pop r15
0x1002591bc: pop rbp
0x1002591bd: ret 
0x1002591be: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1002591c3: nop 
