0x1004dfab0: push rbp
0x1004dfab1: mov rbp, rsp
0x1004dfab4: push r15
0x1004dfab6: push r14
0x1004dfab8: push r13
0x1004dfaba: push r12
0x1004dfabc: push rbx
0x1004dfabd: sub rsp, 0x1f8
0x1004dfac4: mov r14, rsi
0x1004dfac7: mov rbx, rdi
0x1004dfaca: mov rax, qword ptr [rip + 0x72de07] ; 0x100c0d8d8
0x1004dfad1: mov rax, qword ptr [rax]
0x1004dfad4: mov qword ptr [rbp - 0x30], rax
0x1004dfad8: mov rdi, qword ptr [r14 + 0x280]
0x1004dfadf: call 0x1000fe060 ; 0x1000fe060
0x1004dfae4: test al, al
0x1004dfae6: je 0x1004e0163
0x1004dfaec: mov rdi, qword ptr [r14 + 0x280]
0x1004dfaf3: lea rsi, [rbp - 0xb0]
0x1004dfafa: mov edx, 1
0x1004dfaff: call 0x1001032a0 ; 0x1001032a0
0x1004dfb04: mov dword ptr [rbp - 0xe4], eax
0x1004dfb0a: mov qword ptr [rbp - 0x110], rsp
0x1004dfb11: mov rax, qword ptr [rbx + 0x38]
0x1004dfb15: mov esi, dword ptr [rax + 0x10]
0x1004dfb18: lea rax, [rsi + 0xf]
0x1004dfb1c: movabs rcx, 0x1fffffff0
0x1004dfb26: and rcx, rax
0x1004dfb29: mov r12, rsp
0x1004dfb2c: sub r12, rcx
0x1004dfb2f: mov rsp, r12
0x1004dfb32: mov rdi, r12
0x1004dfb35: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x1004dfb3a: xor esi, esi
0x1004dfb3c: mov dword ptr [rbp - 0xb4], 0
0x1004dfb46: xor eax, eax
0x1004dfb48: mov qword ptr [rbp - 0xd8], rax
0x1004dfb4f: mov qword ptr [rbp - 0xf0], r14
0x1004dfb56: mov qword ptr [rbp - 0xe0], r12
0x1004dfb5d: mov qword ptr [rbp - 0x100], rbx
0x1004dfb64: cmp byte ptr [rbx + 0x53], 0
0x1004dfb68: mov eax, 1
0x1004dfb6d: jne 0x1004dfb95
0x1004dfb6f: jmp 0x1004dfbf0 ; 0x1004dfbf0
0x1004dfb71: nop word ptr cs:[rax + rax]
0x1004dfb80: mov rsi, qword ptr [rbp - 0xf8]
0x1004dfb87: inc rsi
0x1004dfb8a: cmp byte ptr [rbx + 0x53], 0
0x1004dfb8e: mov eax, 1
0x1004dfb93: je 0x1004dfbf0
0x1004dfb95: mov eax, eax
0x1004dfb97: cmp rsi, rax
0x1004dfb9a: jae 0x1004dff96
0x1004dfba0: vmovaps xmmword ptr [rbp - 0xd0], xmm2
0x1004dfba8: mov rdi, qword ptr [r14 + 0x280]
0x1004dfbaf: mov qword ptr [rbp - 0xf8], rsi
0x1004dfbb6: call 0x1001031d0 ; 0x1001031d0
0x1004dfbbb: mov r13, rax
0x1004dfbbe: cmp byte ptr [rbx + 0x53], 0
0x1004dfbc2: je 0x1004dfc10
0x1004dfbc4: mov rsi, qword ptr [r14 + 0x70]
0x1004dfbc8: lea rdi, [rbp - 0x150]
0x1004dfbcf: call 0x10076be90 ; 0x10076be90
0x1004dfbd4: vmovaps xmm2, xmmword ptr [rbp - 0x150]
0x1004dfbdc: jmp 0x1004dfde0 ; 0x1004dfde0
0x1004dfbe1: nop word ptr cs:[rax + rax]
0x1004dfbf0: mov rax, qword ptr [rbx + 0x48]
0x1004dfbf4: test rax, rax
0x1004dfbf7: je 0x1004dfd80
0x1004dfbfd: mov eax, dword ptr [rax + 0x10]
0x1004dfc00: mov eax, eax
0x1004dfc02: cmp rsi, rax
0x1004dfc05: jb 0x1004dfba0
0x1004dfc07: jmp 0x1004dff96 ; 0x1004dff96
0x1004dfc0c: nop dword ptr [rax]
0x1004dfc10: vmovaps xmm2, xmmword ptr [rbp - 0xd0]
0x1004dfc18: vblendps xmm2, xmm2, xmmword ptr [rip + 0x5c497e], 7 ; 0x100aa45a0
0x1004dfc22: mov rax, qword ptr [rbx + 0x48]
0x1004dfc26: test rax, rax
0x1004dfc29: je 0x1004dfda0
0x1004dfc2f: vmovaps xmmword ptr [rbp - 0xd0], xmm2
0x1004dfc37: mov ecx, dword ptr [rax + 0x10]
0x1004dfc3a: mov rdx, qword ptr [rbp - 0xf8]
0x1004dfc41: cmp rdx, rcx
0x1004dfc44: jae 0x1004e01c1
0x1004dfc4a: mov rax, qword ptr [rax + 8]
0x1004dfc4e: mov rax, qword ptr [rax + rdx*8]
0x1004dfc52: mov qword ptr [rbp - 0x1a0], rax
0x1004dfc59: call 0x1007abc10 ; 0x1007abc10
0x1004dfc5e: mov r14, rax
0x1004dfc61: mov qword ptr [rbp - 0x150], 0
0x1004dfc6c: call 0x1007abc10 ; 0x1007abc10
0x1004dfc71: mov r8, qword ptr [rax]
0x1004dfc74: mov rdi, rax
0x1004dfc77: lea r15, [rbp - 0x150]
0x1004dfc7e: mov rsi, r15
0x1004dfc81: lea rdx, [rbp - 0x1a0]
0x1004dfc88: mov rcx, r14
0x1004dfc8b: call qword ptr [r8 + 0x40]
0x1004dfc8f: mov rax, qword ptr [rbp - 0x150]
0x1004dfc96: test rax, rax
0x1004dfc99: je 0x1004e01a2
0x1004dfc9f: mov qword ptr [rbp - 0x108], rax
0x1004dfca6: call 0x1007abc10 ; 0x1007abc10
0x1004dfcab: mov r14, rax
0x1004dfcae: mov qword ptr [rbp - 0x150], 0
0x1004dfcb9: call 0x10043ccc0 ; 0x10043ccc0
0x1004dfcbe: mov r8, qword ptr [rax]
0x1004dfcc1: mov rdi, rax
0x1004dfcc4: mov rsi, r15
0x1004dfcc7: lea rdx, [rbp - 0x108]
0x1004dfcce: mov rcx, r14
0x1004dfcd1: call qword ptr [r8 + 0x40]
0x1004dfcd5: mov rax, qword ptr [rbp - 0x150]
0x1004dfcdc: test rax, rax
0x1004dfcdf: je 0x1004dfcee
0x1004dfce1: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x1004dfce6: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x1004dfcee: call 0x1007abc10 ; 0x1007abc10
0x1004dfcf3: mov r14, rax
0x1004dfcf6: mov qword ptr [rbp - 0x150], 0
0x1004dfd01: call 0x1003ffcf0 ; 0x1003ffcf0
0x1004dfd06: mov r8, qword ptr [rax]
0x1004dfd09: mov rdi, rax
0x1004dfd0c: mov rsi, r15
0x1004dfd0f: lea rdx, [rbp - 0x108]
0x1004dfd16: mov rcx, r14
0x1004dfd19: call qword ptr [r8 + 0x40]
0x1004dfd1d: mov r14, qword ptr [rbp - 0x150]
0x1004dfd24: test r14, r14
0x1004dfd27: vmovaps xmm2, xmmword ptr [rbp - 0xd0]
0x1004dfd2f: je 0x1004dfd74
0x1004dfd31: mov rax, qword ptr [r14]
0x1004dfd34: lea r12, [rbp - 0x220]
0x1004dfd3b: mov rdi, r12
0x1004dfd3e: mov rsi, r14
0x1004dfd41: call qword ptr [rax + 0x18]
0x1004dfd44: mov rax, qword ptr [r14]
0x1004dfd47: lea r13, [rbp - 0x1a0]
0x1004dfd4e: mov rdi, r13
0x1004dfd51: mov rsi, r14
0x1004dfd54: call qword ptr [rax + 0x20]
0x1004dfd57: mov rdi, r15
0x1004dfd5a: mov rsi, r12
0x1004dfd5d: mov r12, qword ptr [rbp - 0xe0]
0x1004dfd64: mov rdx, r13
0x1004dfd67: call 0x100076df0 ; 0x100076df0
0x1004dfd6c: vmovaps xmm2, xmmword ptr [rbp - 0x120]
0x1004dfd74: mov r14, qword ptr [rbp - 0xf0]
0x1004dfd7b: jmp 0x1004dfde0 ; 0x1004dfde0
0x1004dfd7d: nop dword ptr [rax]
0x1004dfd80: mov eax, 0x10
0x1004dfd85: mov eax, eax
0x1004dfd87: cmp rsi, rax
0x1004dfd8a: jb 0x1004dfba0
0x1004dfd90: jmp 0x1004dff96 ; 0x1004dff96
0x1004dfd95: nop word ptr cs:[rax + rax]
0x1004dfda0: cmp byte ptr [rbx + 0x54], 0
0x1004dfda4: je 0x1004dfdc0
0x1004dfda6: cmp byte ptr [r13 + 0x1ef8], 0
0x1004dfdae: je 0x1004dfdc0
0x1004dfdb0: mov rax, qword ptr [r13 + 0x18]
0x1004dfdb4: vmovaps xmm2, xmmword ptr [rax + 0x10]
0x1004dfdb9: jmp 0x1004dfde0 ; 0x1004dfde0
0x1004dfdbb: nop dword ptr [rax + rax]
0x1004dfdc0: cmp byte ptr [rbx + 0x55], 0
0x1004dfdc4: je 0x1004dfde0
0x1004dfdc6: cmp byte ptr [r13 + 0x1ef8], 0
0x1004dfdce: je 0x1004dff63
0x1004dfdd4: nop word ptr cs:[rax + rax]
0x1004dfde0: vmulps xmm0, xmm2, xmm2
0x1004dfde4: vmovshdup xmm1, xmm0
0x1004dfde8: vaddss xmm1, xmm0, xmm1
0x1004dfdec: vpermilpd xmm0, xmm0, 1
0x1004dfdf2: vaddss xmm0, xmm0, xmm1
0x1004dfdf6: vucomiss xmm0, dword ptr [rip + 0x5c72e6] ; 0x100aa70e4
0x1004dfdfe: jbe 0x1004dfb80
0x1004dfe04: mov rax, qword ptr [rbx + 0x38]
0x1004dfe08: mov r13d, dword ptr [rax + 0x10]
0x1004dfe0c: test r13, r13
0x1004dfe0f: je 0x1004dfb80
0x1004dfe15: vmovaps xmmword ptr [rbp - 0xd0], xmm2
0x1004dfe1d: xor r14d, r14d
0x1004dfe20: mov rax, qword ptr [rax + 8]
0x1004dfe24: mov rax, qword ptr [rax + r14*8]
0x1004dfe28: mov qword ptr [rbp - 0x1a0], rax
0x1004dfe2f: call 0x1007abc10 ; 0x1007abc10
0x1004dfe34: mov r15, rax
0x1004dfe37: mov qword ptr [rbp - 0x150], 0
0x1004dfe42: call 0x10043ccc0 ; 0x10043ccc0
0x1004dfe47: mov rbx, qword ptr [rax]
0x1004dfe4a: mov rdi, rax
0x1004dfe4d: lea rsi, [rbp - 0x150]
0x1004dfe54: lea rdx, [rbp - 0x1a0]
0x1004dfe5b: mov rcx, r15
0x1004dfe5e: call qword ptr [rbx + 0x40]
0x1004dfe61: mov rbx, qword ptr [rbp - 0x150]
0x1004dfe68: test rbx, rbx
0x1004dfe6b: je 0x1004e01a2
0x1004dfe71: cmp byte ptr [rbx + 0x40], 0
0x1004dfe75: vmovaps xmm2, xmmword ptr [rbp - 0xd0]
0x1004dfe7d: je 0x1004dff20
0x1004dfe83: vmovaps xmmword ptr [rbp - 0x160], xmm2
0x1004dfe8b: mov rax, qword ptr [rbx]
0x1004dfe8e: lea r12, [rbp - 0x1e0]
0x1004dfe95: mov rdi, r12
0x1004dfe98: mov rsi, rbx
0x1004dfe9b: call qword ptr [rax + 0x18]
0x1004dfe9e: mov rax, qword ptr [rbx]
0x1004dfea1: lea r15, [rbp - 0x1a0]
0x1004dfea8: mov rdi, r15
0x1004dfeab: mov rsi, rbx
0x1004dfeae: call qword ptr [rax + 0x20]
0x1004dfeb1: lea rbx, [rbp - 0x150]
0x1004dfeb8: mov rdi, rbx
0x1004dfebb: mov rsi, r12
0x1004dfebe: mov rdx, r15
0x1004dfec1: call 0x100076df0 ; 0x100076df0
0x1004dfec6: lea rdi, [rbp - 0x160]
0x1004dfecd: vmovss xmm0, dword ptr [rip + 0x5c86db] ; 0x100aa85b0
0x1004dfed5: mov rsi, rbx
0x1004dfed8: call 0x10078d450 ; 0x10078d450
0x1004dfedd: test al, al
0x1004dfedf: mov rbx, qword ptr [rbp - 0x100]
0x1004dfee6: je 0x1004dff03
0x1004dfee8: inc dword ptr [rbp - 0xb4]
0x1004dfeee: mov rax, qword ptr [rbp - 0xe0]
0x1004dfef5: mov byte ptr [rax + r14], 1
0x1004dfefa: mov al, 1
0x1004dfefc: mov qword ptr [rbp - 0xd8], rax
0x1004dff03: vmovaps xmm2, xmmword ptr [rbp - 0xd0]
0x1004dff0b: inc r14
0x1004dff0e: cmp r14, r13
0x1004dff11: jb 0x1004dff2f
0x1004dff13: jmp 0x1004dff50 ; 0x1004dff50
0x1004dff15: nop word ptr cs:[rax + rax]
0x1004dff20: mov rbx, qword ptr [rbp - 0x100]
0x1004dff27: inc r14
0x1004dff2a: cmp r14, r13
0x1004dff2d: jae 0x1004dff50
0x1004dff2f: mov rax, qword ptr [rbx + 0x38]
0x1004dff33: mov ecx, dword ptr [rax + 0x10]
0x1004dff36: cmp r14, rcx
0x1004dff39: jb 0x1004dfe20
0x1004dff3f: jmp 0x1004e01c1 ; 0x1004e01c1
0x1004dff44: nop word ptr cs:[rax + rax]
0x1004dff50: mov r12, qword ptr [rbp - 0xe0]
0x1004dff57: mov r14, qword ptr [rbp - 0xf0]
0x1004dff5e: jmp 0x1004dfb80 ; 0x1004dfb80
0x1004dff63: mov rdi, r13
0x1004dff66: vmovaps xmmword ptr [rbp - 0xd0], xmm2
0x1004dff6e: call 0x1000fe050 ; 0x1000fe050
0x1004dff73: vmovaps xmm2, xmmword ptr [rbp - 0xd0]
0x1004dff7b: test al, al
0x1004dff7d: jne 0x1004dfdb0
0x1004dff83: cmp byte ptr [r13 + 0x21b3], 0
0x1004dff8b: jne 0x1004dfdb0
0x1004dff91: jmp 0x1004dfde0 ; 0x1004dfde0
0x1004dff96: cmp byte ptr [rbx + 0x5d], 0
0x1004dff9a: je 0x1004dffb7
0x1004dff9c: mov rax, qword ptr [rbx + 0x38]
0x1004dffa0: mov eax, dword ptr [rax + 0x10]
0x1004dffa3: test rax, rax
0x1004dffa6: je 0x1004dffdb
0x1004dffa8: cmp eax, 0xf
0x1004dffab: ja 0x1004dffef
0x1004dffad: xor ecx, ecx
0x1004dffaf: xor r15d, r15d
0x1004dffb2: jmp 0x1004e0080 ; 0x1004e0080
0x1004dffb7: cmp byte ptr [rbx + 0x56], 0
0x1004dffbb: je 0x1004e00b3
0x1004dffc1: xor r15d, r15d
0x1004dffc4: mov eax, dword ptr [rbp - 0xe4]
0x1004dffca: cmp dword ptr [rbp - 0xb4], eax
0x1004dffd0: jge 0x1004e00c7
0x1004dffd6: jmp 0x1004e00f7 ; 0x1004e00f7
0x1004dffdb: xor r15d, r15d
0x1004dffde: xor eax, eax
0x1004dffe0: cmp byte ptr [rbx + 0x50], 0
0x1004dffe4: jne 0x1004e0096
0x1004dffea: jmp 0x1004e00a3 ; 0x1004e00a3
0x1004dffef: mov edx, eax
0x1004dfff1: and edx, 0xf
0x1004dfff4: mov rcx, rax
0x1004dfff7: sub rcx, rdx
0x1004dfffa: lea rsi, [r12 + 0xc]
0x1004dffff: vxorps xmm0, xmm0, xmm0
0x1004e0003: mov rdi, rcx
0x1004e0006: vxorps xmm1, xmm1, xmm1
0x1004e000a: vxorps xmm2, xmm2, xmm2
0x1004e000e: vpxor xmm3, xmm3, xmm3
0x1004e0012: nop word ptr cs:[rax + rax]
0x1004e0020: vpmovzxbd xmm4, dword ptr [rsi - 0xc]
0x1004e0026: vpaddd xmm0, xmm0, xmm4
0x1004e002a: vpmovzxbd xmm4, dword ptr [rsi - 8]
0x1004e0030: vpaddd xmm1, xmm1, xmm4
0x1004e0034: vpmovzxbd xmm4, dword ptr [rsi - 4]
0x1004e003a: vpaddd xmm2, xmm2, xmm4
0x1004e003e: vpmovzxbd xmm4, dword ptr [rsi]
0x1004e0043: vpaddd xmm3, xmm3, xmm4
0x1004e0047: add rsi, 0x10
0x1004e004b: add rdi, -0x10
0x1004e004f: jne 0x1004e0020
0x1004e0051: vpaddd xmm0, xmm1, xmm0
0x1004e0055: vpaddd xmm0, xmm2, xmm0
0x1004e0059: vpaddd xmm0, xmm3, xmm0
0x1004e005d: vpshufd xmm1, xmm0, 0x4e
0x1004e0062: vpaddd xmm0, xmm0, xmm1
0x1004e0066: vphaddd xmm0, xmm0, xmm0
0x1004e006b: vmovd r15d, xmm0
0x1004e0070: test edx, edx
0x1004e0072: je 0x1004e0090
0x1004e0074: nop word ptr cs:[rax + rax]
0x1004e0080: movzx edx, byte ptr [r12 + rcx]
0x1004e0085: add r15d, edx
0x1004e0088: inc rcx
0x1004e008b: cmp rcx, rax
0x1004e008e: jb 0x1004e0080
0x1004e0090: cmp byte ptr [rbx + 0x50], 0
0x1004e0094: je 0x1004e00a3
0x1004e0096: cmp r15d, eax
0x1004e0099: jne 0x1004e00f7
0x1004e009b: cmp dword ptr [rbx + 0x64], r15d
0x1004e009f: jb 0x1004e00cf
0x1004e00a1: jmp 0x1004e00f7 ; 0x1004e00f7
0x1004e00a3: test r15d, r15d
0x1004e00a6: jne 0x1004e00f7
0x1004e00a8: xor r15d, r15d
0x1004e00ab: cmp dword ptr [rbx + 0x64], 0
0x1004e00af: jg 0x1004e00cf
0x1004e00b1: jmp 0x1004e00f7 ; 0x1004e00f7
0x1004e00b3: cmp byte ptr [rbx + 0x5c], 0
0x1004e00b7: je 0x1004e00db
0x1004e00b9: mov eax, dword ptr [rbx + 0x58]
0x1004e00bc: xor r15d, r15d
0x1004e00bf: cmp dword ptr [rbp - 0xb4], eax
0x1004e00c5: jl 0x1004e00f7
0x1004e00c7: xor r15d, r15d
0x1004e00ca: cmp dword ptr [rbx + 0x60], eax
0x1004e00cd: jge 0x1004e00f7
0x1004e00cf: mov al, byte ptr [rbx + 0x52]
0x1004e00d2: lea r14, [rbx + 0x68]
0x1004e00d6: mov byte ptr [rbx + 0x68], al
0x1004e00d9: jmp 0x1004e0101 ; 0x1004e0101
0x1004e00db: mov al, byte ptr [rbx + 0x50]
0x1004e00de: mov rcx, qword ptr [rbp - 0xd8]
0x1004e00e5: and cl, 1
0x1004e00e8: xor r15d, r15d
0x1004e00eb: cmp al, cl
0x1004e00ed: jne 0x1004e00f7
0x1004e00ef: xor r15d, r15d
0x1004e00f2: cmp al, byte ptr [rbx + 0x5e]
0x1004e00f5: jne 0x1004e00cf
0x1004e00f7: cmp byte ptr [rbx + 0x68], 0
0x1004e00fb: je 0x1004e0143
0x1004e00fd: lea r14, [rbx + 0x68]
0x1004e0101: mov rdi, qword ptr [rbx + 0x40]
0x1004e0105: mov esi, 1
0x1004e010a: call 0x1004d1f60 ; 0x1004d1f60
0x1004e010f: cmp byte ptr [rbx + 0x68], 0
0x1004e0113: je 0x1004e0135
0x1004e0115: cmp byte ptr [rbx + 0x5d], 0
0x1004e0119: mov al, byte ptr [rbx + 0x50]
0x1004e011c: je 0x1004e0182
0x1004e011e: test al, al
0x1004e0120: je 0x1004e0192
0x1004e0122: mov rax, qword ptr [rbx + 0x38]
0x1004e0126: mov ecx, dword ptr [rbp - 0xb4]
0x1004e012c: cmp ecx, dword ptr [rax + 0x10]
0x1004e012f: jae 0x1004e0135
0x1004e0131: mov byte ptr [r14], 0
0x1004e0135: cmp byte ptr [rbx + 0x51], 0
0x1004e0139: je 0x1004e0143
0x1004e013b: mov rdi, rbx
0x1004e013e: call 0x10032ef60 ; 0x10032ef60
0x1004e0143: mov rax, qword ptr [rbp - 0xd8]
0x1004e014a: and al, 1
0x1004e014c: mov byte ptr [rbx + 0x5e], al
0x1004e014f: mov eax, dword ptr [rbp - 0xb4]
0x1004e0155: mov dword ptr [rbx + 0x60], eax
0x1004e0158: mov dword ptr [rbx + 0x64], r15d
0x1004e015c: mov rsp, qword ptr [rbp - 0x110]
0x1004e0163: mov rax, qword ptr [rip + 0x72d76e] ; 0x100c0d8d8
0x1004e016a: mov rax, qword ptr [rax]
0x1004e016d: cmp rax, qword ptr [rbp - 0x30]
0x1004e0171: jne 0x1004e019d
0x1004e0173: lea rsp, [rbp - 0x28]
0x1004e0177: pop rbx
0x1004e0178: pop r12
0x1004e017a: pop r13
0x1004e017c: pop r14
0x1004e017e: pop r15
0x1004e0180: pop rbp
0x1004e0181: ret 
0x1004e0182: mov rcx, qword ptr [rbp - 0xd8]
0x1004e0189: and cl, 1
0x1004e018c: cmp al, cl
0x1004e018e: jne 0x1004e0131
0x1004e0190: jmp 0x1004e0135 ; 0x1004e0135
0x1004e0192: cmp dword ptr [rbp - 0xb4], 0
0x1004e0199: jg 0x1004e0131
0x1004e019b: jmp 0x1004e0135 ; 0x1004e0135
0x1004e019d: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1004e01a2: lea rdi, [rip + 0x68194f] ; 0x100b61af8 ret
0x1004e01a9: lea rsi, [rip + 0x6817b3] ; 0x100b61963 ./Clump.h
0x1004e01b0: mov edx, 0x47
0x1004e01b5: mov ecx, 3
0x1004e01ba: call 0x1007e5f70 ; 0x1007e5f70
0x1004e01bf: ud2 
0x1004e01c1: lea rdi, [rip + 0x681790] ; 0x100b61958 idx < size
0x1004e01c8: lea rsi, [rip + 0x681794] ; 0x100b61963 ./Clump.h
0x1004e01cf: mov edx, 0x36
0x1004e01d4: mov ecx, 3
0x1004e01d9: call 0x1007e5f70 ; 0x1007e5f70
0x1004e01de: ud2 
