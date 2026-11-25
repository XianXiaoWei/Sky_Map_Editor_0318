0x1001a0e70: push rbp
0x1001a0e71: mov rbp, rsp
0x1001a0e74: push r15
0x1001a0e76: push r14
0x1001a0e78: push r13
0x1001a0e7a: push r12
0x1001a0e7c: push rbx
0x1001a0e7d: sub rsp, 0xa8
0x1001a0e84: mov r14, rdx
0x1001a0e87: mov r13, rsi
0x1001a0e8a: mov r15, rdi
0x1001a0e8d: lea rax, [r15 + 0x90]
0x1001a0e94: mov qword ptr [rbp - 0x48], rax
0x1001a0e98: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x1001a0e9d: vpermilps xmm0, xmm0, 0xc0
0x1001a0ea3: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1001a0ea8: xor ebx, ebx
0x1001a0eaa: nop word ptr [rax + rax]
0x1001a0eb0: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1001a0eb5: mov rdi, r13
0x1001a0eb8: mov esi, ebx
0x1001a0eba: call 0x1001031d0 ; 0x1001031d0
0x1001a0ebf: mov r12, rax
0x1001a0ec2: mov rdi, r12
0x1001a0ec5: call 0x1000fe050 ; 0x1000fe050
0x1001a0eca: test al, al
0x1001a0ecc: je 0x1001a10a1
0x1001a0ed2: cmp byte ptr [r15 + 0x48], 0
0x1001a0ed7: je 0x1001a0f0e
0x1001a0ed9: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x1001a0ede: vucomiss xmm0, dword ptr [rip + 0x9076ce] ; 0x100aa85b4
0x1001a0ee6: vxorps xmm4, xmm4, xmm4
0x1001a0eea: vmovaps xmm1, xmmword ptr [rbp - 0x40]
0x1001a0eef: jbe 0x1001a0fd3
0x1001a0ef5: mov rax, qword ptr [r12 + 0x18]
0x1001a0efa: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x1001a0eff: vsubps xmm1, xmm0, xmmword ptr [rax + 0x20]
0x1001a0f04: vdivps xmm1, xmm1, xmmword ptr [rbp - 0x60]
0x1001a0f09: jmp 0x1001a0fe3 ; 0x1001a0fe3
0x1001a0f0e: mov rsi, qword ptr [r12 + 0x18]
0x1001a0f13: cmp byte ptr [rsi + 0xbb0], 0
0x1001a0f1a: je 0x1001a10a1
0x1001a0f20: vmovaps xmm1, xmmword ptr [r14]
0x1001a0f25: vmovaps xmm2, xmmword ptr [rsi + 0x10]
0x1001a0f2a: vsubps xmm0, xmm1, xmm2
0x1001a0f2e: vmulps xmm0, xmm0, xmm0
0x1001a0f32: vmovshdup xmm3, xmm0
0x1001a0f36: vaddss xmm3, xmm0, xmm3
0x1001a0f3a: vpermilpd xmm0, xmm0, 1
0x1001a0f40: vaddss xmm0, xmm0, xmm3
0x1001a0f44: vmovss xmm3, dword ptr [rip + 0x90c9f4] ; 0x100aad940
0x1001a0f4c: vucomiss xmm3, xmm0
0x1001a0f50: jbe 0x1001a10a1
0x1001a0f56: vsubps xmm2, xmm2, xmm1
0x1001a0f5a: vmovaps xmm3, xmmword ptr [r15 + 0x30]
0x1001a0f60: vsubps xmm1, xmm3, xmm1
0x1001a0f64: vmulps xmm1, xmm2, xmm1
0x1001a0f68: vmovshdup xmm2, xmm1
0x1001a0f6c: vaddss xmm2, xmm1, xmm2
0x1001a0f70: vpermilpd xmm1, xmm1, 1
0x1001a0f76: vaddss xmm1, xmm1, xmm2
0x1001a0f7a: vxorps xmm2, xmm2, xmm2
0x1001a0f7e: vucomiss xmm1, xmm2
0x1001a0f82: vxorps xmm1, xmm1, xmm1
0x1001a0f86: jbe 0x1001a10a1
0x1001a0f8c: add rsi, 0x10
0x1001a0f90: vsqrtss xmm0, xmm0, xmm0
0x1001a0f94: vdivss xmm0, xmm0, dword ptr [rip + 0x906150] ; 0x100aa70ec
0x1001a0f9c: vmaxss xmm0, xmm1, xmm0
0x1001a0fa0: vmovss xmm1, dword ptr [rip + 0x904118] ; 0x100aa50c0
0x1001a0fa8: vminss xmm0, xmm1, xmm0
0x1001a0fac: vsubss xmm0, xmm1, xmm0
0x1001a0fb0: vmulss xmm0, xmm0, xmm0
0x1001a0fb4: mov rax, qword ptr [r15 + 8]
0x1001a0fb8: vmulss xmm0, xmm0, dword ptr [rax + 0x7c]
0x1001a0fbd: mov rdi, qword ptr [rbp - 0x48]
0x1001a0fc1: vmovss xmm1, dword ptr [rip + 0x906827] ; 0x100aa77f0
0x1001a0fc9: call 0x10062f710 ; 0x10062f710
0x1001a0fce: jmp 0x1001a10a1 ; 0x1001a10a1
0x1001a0fd3: vblendps xmm1, xmm4, xmm1, 8
0x1001a0fd9: mov rax, qword ptr [r12 + 0x18]
0x1001a0fde: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x1001a0fe3: vmovaps xmmword ptr [rbp - 0x40], xmm1
0x1001a0fe8: vmovaps xmm1, xmmword ptr [rbp - 0x40]
0x1001a0fed: vsubps xmm1, xmm1, xmmword ptr [r14 + 0x40]
0x1001a0ff3: vmulps xmm1, xmm1, xmm1
0x1001a0ff7: vmovshdup xmm2, xmm1
0x1001a0ffb: vaddss xmm2, xmm1, xmm2
0x1001a0fff: vpermilpd xmm1, xmm1, 1
0x1001a1005: vaddss xmm1, xmm1, xmm2
0x1001a1009: vsqrtss xmm1, xmm1, xmm1
0x1001a100d: vmulss xmm1, xmm1, dword ptr [rip + 0x9060df] ; 0x100aa70f4
0x1001a1015: vxorps xmm2, xmm2, xmm2
0x1001a1019: vmaxss xmm1, xmm2, xmm1
0x1001a101d: vmovss xmm3, dword ptr [rip + 0x90409b] ; 0x100aa50c0
0x1001a1025: vminss xmm1, xmm3, xmm1
0x1001a1029: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x1001a1031: mov rax, qword ptr [rip + 0xa6cad0] ; 0x100c0db08
0x1001a1038: vmovups ymm0, ymmword ptr [rax]
0x1001a103c: vmovups ymm2, ymmword ptr [rax + 0x10]
0x1001a1041: lea rax, [rbp - 0xc0]
0x1001a1048: vmovups ymmword ptr [rax + 0x10], ymm2
0x1001a104d: vmovups ymmword ptr [rax], ymm0
0x1001a1051: vmovlps qword ptr [rbp - 0x90], xmm4
0x1001a1059: mov dword ptr [rbp - 0x88], 0
0x1001a1063: mov eax, dword ptr [r14 + 0x50]
0x1001a1067: mov dword ptr [rbp - 0x80], eax
0x1001a106a: mov qword ptr [rbp - 0x7c], 0x3f800000
0x1001a1072: mov rax, qword ptr [r15 + 8]
0x1001a1076: vmulss xmm0, xmm1, dword ptr [rax + 0x80]
0x1001a107e: mov rdi, qword ptr [rbp - 0x48]
0x1001a1082: lea rsi, [rbp - 0xd0]
0x1001a1089: vmovss xmm1, dword ptr [rip + 0x90675f] ; 0x100aa77f0
0x1001a1091: vmovss xmm2, dword ptr [rip + 0x905a0b] ; 0x100aa6aa4
0x1001a1099: vzeroupper 
0x1001a109c: call 0x10062f540 ; 0x10062f540
0x1001a10a1: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001a10a6: inc ebx
0x1001a10a8: cmp ebx, 0x10
0x1001a10ab: jne 0x1001a0eb0
0x1001a10b1: add rsp, 0xa8
0x1001a10b8: pop rbx
0x1001a10b9: pop r12
0x1001a10bb: pop r13
0x1001a10bd: pop r14
0x1001a10bf: pop r15
0x1001a10c1: pop rbp
0x1001a10c2: ret 
0x1001a10c3: nop word ptr cs:[rax + rax]
