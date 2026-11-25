0x10046a690: push rbp
0x10046a691: mov rbp, rsp
0x10046a694: push r15
0x10046a696: push r14
0x10046a698: push r13
0x10046a69a: push r12
0x10046a69c: push rbx
0x10046a69d: sub rsp, 0xc8
0x10046a6a4: mov qword ptr [rbp - 0xa8], rdx
0x10046a6ab: mov r15, rsi
0x10046a6ae: mov r13, rdi
0x10046a6b1: mov rax, qword ptr [r15 + 0x160]
0x10046a6b8: lea rdx, [rip + 0x1b90a11] ; 0x101ffb0d0
0x10046a6bf: cmp byte ptr [rdx], 0
0x10046a6c2: je 0x10046a6d1
0x10046a6c4: lea rdx, [rip + 0x84de75] ; 0x100cb8540
0x10046a6cb: vmovss xmm0, dword ptr [rdx]
0x10046a6cf: jmp 0x10046a6d9 ; 0x10046a6d9
0x10046a6d1: vmovss xmm0, dword ptr [rip + 0x63a9e7] ; 0x100aa50c0
0x10046a6d9: vmulss xmm0, xmm0, dword ptr [rax + 0x20]
0x10046a6de: vmulss xmm1, xmm0, dword ptr [rax + 0x14]
0x10046a6e3: test cl, cl
0x10046a6e5: je 0x10046a7ab
0x10046a6eb: mov dword ptr [rbp - 0x34], 0
0x10046a6f2: mov byte ptr [r13 + 0x224], 0
0x10046a6fa: cmp qword ptr [r13 + 8], 0
0x10046a6ff: je 0x10046a7cc
0x10046a705: cmp dword ptr [r13 + 0x22c], 0
0x10046a70d: jne 0x10046a74e
0x10046a70f: mov rax, qword ptr [r13 + 0x28]
0x10046a713: mov rax, qword ptr [rax]
0x10046a716: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x10046a71b: vmovaps xmmword ptr [r13 + 0x1e0], xmm0
0x10046a724: vmovaps xmm0, xmmword ptr [rax + 0x20]
0x10046a729: vmovaps xmmword ptr [r13 + 0x1f0], xmm0
0x10046a732: vmovaps xmm0, xmmword ptr [rax + 0x30]
0x10046a737: vmovaps xmmword ptr [r13 + 0x200], xmm0
0x10046a740: vmovaps xmm0, xmmword ptr [rax + 0x40]
0x10046a745: vmovaps xmmword ptr [r13 + 0x210], xmm0
0x10046a74e: cmp byte ptr [r13 + 0x225], 0
0x10046a756: je 0x10046a7cc
0x10046a758: mov rdi, qword ptr [r13 + 0x68]
0x10046a75c: test rdi, rdi
0x10046a75f: je 0x10046a7cc
0x10046a761: vmovss dword ptr [rbp - 0x30], xmm1
0x10046a766: call 0x100098b20 ; 0x100098b20
0x10046a76b: mov rdi, rax
0x10046a76e: call 0x1007f2ea0 ; 0x1007f2ea0
0x10046a773: vmovss xmm1, dword ptr [rbp - 0x30]
0x10046a778: test rax, rax
0x10046a77b: jne 0x10046a7cc
0x10046a77d: mov rdi, qword ptr [r13 + 0x68]
0x10046a781: call 0x100098b20 ; 0x100098b20
0x10046a786: lea rsi, [r13 + 0x160]
0x10046a78d: xor edx, edx
0x10046a78f: mov rdi, rax
0x10046a792: call 0x1007f34c0 ; 0x1007f34c0
0x10046a797: vmovss xmm1, dword ptr [rbp - 0x30]
0x10046a79c: cmp byte ptr [r13 + 0x227], 0
0x10046a7a4: jne 0x10046a7da
0x10046a7a6: jmp 0x10046a963 ; 0x10046a963
0x10046a7ab: cmp byte ptr [r13 + 0x224], 0
0x10046a7b3: sete al
0x10046a7b6: mov dword ptr [rbp - 0x34], eax
0x10046a7b9: mov byte ptr [r13 + 0x224], 0
0x10046a7c1: cmp qword ptr [r13 + 8], 0
0x10046a7c6: jne 0x10046a705
0x10046a7cc: cmp byte ptr [r13 + 0x227], 0
0x10046a7d4: je 0x10046a963
0x10046a7da: mov rdi, qword ptr [r13 + 0x68]
0x10046a7de: test rdi, rdi
0x10046a7e1: je 0x10046a963
0x10046a7e7: vmovss xmm0, dword ptr [rip + 0x63c2ad] ; 0x100aa6a9c
0x10046a7ef: vmaxss xmm0, xmm0, xmm1
0x10046a7f3: vmovss xmm1, dword ptr [rip + 0x63c2a5] ; 0x100aa6aa0
0x10046a7fb: vminss xmm0, xmm1, xmm0
0x10046a7ff: vmovss dword ptr [rbp - 0x30], xmm0
0x10046a804: call 0x100098b20 ; 0x100098b20
0x10046a809: mov rdi, rax
0x10046a80c: call 0x1007f2ea0 ; 0x1007f2ea0
0x10046a811: test rax, rax
0x10046a814: je 0x10046a8b6
0x10046a81a: mov rdi, qword ptr [r13 + 0x68]
0x10046a81e: call 0x100098b20 ; 0x100098b20
0x10046a823: lea rdi, [rbp - 0x80]
0x10046a827: mov rsi, rax
0x10046a82a: call 0x1007f26e0 ; 0x1007f26e0
0x10046a82f: cmp byte ptr [r13 + 0x32e], 0
0x10046a837: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x10046a83c: je 0x10046a87b
0x10046a83e: vmovaps xmmword ptr [r13 + 0x240], xmm0
0x10046a847: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x10046a84c: vmovaps xmmword ptr [r13 + 0x250], xmm0
0x10046a855: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x10046a85a: vmovaps xmmword ptr [r13 + 0x260], xmm0
0x10046a863: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x10046a868: vmovaps xmmword ptr [r13 + 0x270], xmm0
0x10046a871: mov byte ptr [r13 + 0x280], 1
0x10046a879: jmp 0x10046a8b6 ; 0x10046a8b6
0x10046a87b: vmovaps xmmword ptr [r13 + 0x160], xmm0
0x10046a884: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x10046a889: vmovaps xmmword ptr [r13 + 0x170], xmm0
0x10046a892: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x10046a897: vmovaps xmmword ptr [r13 + 0x180], xmm0
0x10046a8a0: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x10046a8a5: vmovaps xmmword ptr [r13 + 0x190], xmm0
0x10046a8ae: mov byte ptr [r13 + 0x225], 1
0x10046a8b6: mov rdi, qword ptr [r13 + 0x68]
0x10046a8ba: movzx r14d, byte ptr [rbp - 0x34]
0x10046a8bf: vmovss xmm0, dword ptr [rbp - 0x30]
0x10046a8c4: mov esi, r14d
0x10046a8c7: call 0x100098be0 ; 0x100098be0
0x10046a8cc: mov rdi, qword ptr [r13 + 0x68]
0x10046a8d0: vmovss xmm0, dword ptr [rbp - 0x30]
0x10046a8d5: mov esi, r14d
0x10046a8d8: call 0x100099680 ; 0x100099680
0x10046a8dd: mov rdi, qword ptr [r13 + 0x68]
0x10046a8e1: vmovss xmm0, dword ptr [rbp - 0x30]
0x10046a8e6: mov esi, r14d
0x10046a8e9: call 0x100099ea0 ; 0x100099ea0
0x10046a8ee: mov rdi, qword ptr [r13 + 0x68]
0x10046a8f2: vmovss xmm0, dword ptr [rbp - 0x30]
0x10046a8f7: mov esi, r14d
0x10046a8fa: call 0x10009a980 ; 0x10009a980
0x10046a8ff: mov rax, qword ptr [r13 + 0x3b0]
0x10046a906: test rax, rax
0x10046a909: je 0x10046a933
0x10046a90b: lea rbx, [r13 + 0x3b0]
0x10046a912: mov rdi, qword ptr [r13 + 0x3b8]
0x10046a919: call rax
0x10046a91b: vxorps xmm0, xmm0, xmm0
0x10046a91f: vmovaps xmmword ptr [rbx], xmm0
0x10046a923: mov rdi, qword ptr [r13 + 0x68]
0x10046a927: xor esi, esi
0x10046a929: vmovss xmm0, dword ptr [rbp - 0x30]
0x10046a92e: call 0x10009a980 ; 0x10009a980
0x10046a933: mov rdi, qword ptr [r13 + 0x80]
0x10046a93a: test rdi, rdi
0x10046a93d: je 0x10046a963
0x10046a93f: mov rsi, qword ptr [r15 + 0x160]
0x10046a946: movzx edx, byte ptr [r13 + 0x348]
0x10046a94e: call 0x10034d360 ; 0x10034d360
0x10046a953: mov rdi, qword ptr [r13 + 0x68]
0x10046a957: xor esi, esi
0x10046a959: vmovss xmm0, dword ptr [rbp - 0x30]
0x10046a95e: call 0x10009a980 ; 0x10009a980
0x10046a963: cmp byte ptr [r13 + 0x225], 0
0x10046a96b: je 0x10046a9fa
0x10046a971: lea rsi, [r13 + 0x160]
0x10046a978: lea rdi, [rbp - 0x80]
0x10046a97c: call 0x10078a620 ; 0x10078a620
0x10046a981: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x10046a986: vmovaps xmm1, xmmword ptr [rbp - 0x70]
0x10046a98b: vmovaps xmm2, xmmword ptr [rbp - 0x60]
0x10046a990: vmovaps xmm3, xmmword ptr [rbp - 0x50]
0x10046a995: vmovaps xmmword ptr [r13 + 0x1d0], xmm3
0x10046a99e: vmulps xmm3, xmm0, xmm0
0x10046a9a2: vmovshdup xmm4, xmm3
0x10046a9a6: vaddss xmm4, xmm3, xmm4
0x10046a9aa: vpermilpd xmm3, xmm3, 1
0x10046a9b0: vaddss xmm3, xmm3, xmm4
0x10046a9b4: vsqrtss xmm3, xmm3, xmm3
0x10046a9b8: vmovss dword ptr [r13 + 0x220], xmm3
0x10046a9c1: vmovss xmm4, dword ptr [rip + 0x63a6f7] ; 0x100aa50c0
0x10046a9c9: vdivss xmm3, xmm4, xmm3
0x10046a9cd: vpermilps xmm3, xmm3, 0
0x10046a9d3: vmulps xmm0, xmm0, xmm3
0x10046a9d7: vmovaps xmmword ptr [r13 + 0x1a0], xmm0
0x10046a9e0: vmulps xmm0, xmm3, xmm1
0x10046a9e4: vmovaps xmmword ptr [r13 + 0x1b0], xmm0
0x10046a9ed: vmulps xmm0, xmm3, xmm2
0x10046a9f1: vmovaps xmmword ptr [r13 + 0x1c0], xmm0
0x10046a9fa: mov rsi, qword ptr [r13 + 0x50]
0x10046a9fe: test rsi, rsi
0x10046aa01: je 0x10046aaa9
0x10046aa07: mov eax, 0x40
0x10046aa0c: cmp byte ptr [r13 + 0x32b], 0
0x10046aa14: jne 0x10046aa33
0x10046aa16: cmp byte ptr [r13 + 0x32d], 0
0x10046aa1e: je 0x10046aa2e
0x10046aa20: movzx eax, byte ptr [r13 + 0x32c]
0x10046aa28: lea eax, [rax + rax + 2]
0x10046aa2c: jmp 0x10046aa33 ; 0x10046aa33
0x10046aa2e: mov eax, 0x20
0x10046aa33: mov dword ptr [rsi + 0x20], eax
0x10046aa36: mov al, byte ptr [rsi + 0x18e]
0x10046aa3c: cmp byte ptr [r13 + 0x227], 0
0x10046aa44: je 0x10046aa5c
0x10046aa46: test al, al
0x10046aa48: setne cl
0x10046aa4b: cmp byte ptr [r13 + 0x229], 0
0x10046aa53: setne al
0x10046aa56: cmp cl, al
0x10046aa58: jne 0x10046aa62
0x10046aa5a: jmp 0x10046aa75 ; 0x10046aa75
0x10046aa5c: test al, al
0x10046aa5e: je 0x10046aa75
0x10046aa60: xor eax, eax
0x10046aa62: mov rdi, qword ptr [r15 + 0x138]
0x10046aa69: movzx edx, al
0x10046aa6c: call 0x100779310 ; 0x100779310
0x10046aa71: mov rsi, qword ptr [r13 + 0x50]
0x10046aa75: cmp byte ptr [r13 + 0x225], 0
0x10046aa7d: mov rdi, qword ptr [r15 + 0x138]
0x10046aa84: je 0x10046b39c
0x10046aa8a: lea rdx, [r13 + 0x240]
0x10046aa91: lea rax, [r13 + 0x160]
0x10046aa98: cmp byte ptr [r13 + 0x32e], 0
0x10046aaa0: cmove rdx, rax
0x10046aaa4: call 0x100779320 ; 0x100779320
0x10046aaa9: mov qword ptr [rbp - 0x88], r15
0x10046aab0: cmp dword ptr [r13 + 0x8c], 0
0x10046aab8: je 0x10046b320
0x10046aabe: lea rax, [r13 + 0x160]
0x10046aac5: mov qword ptr [rbp - 0x30], rax
0x10046aac9: lea rax, [r13 + 0x120]
0x10046aad0: mov qword ptr [rbp - 0x40], rax
0x10046aad4: xor eax, eax
0x10046aad6: mov qword ptr [rbp - 0x98], rax
0x10046aadd: xor r15d, r15d
0x10046aae0: cmp byte ptr [r13 + 0x225], 0
0x10046aae8: je 0x10046aee0
0x10046aaee: cmp qword ptr [r13 + 8], 0
0x10046aaf3: je 0x10046aee0
0x10046aaf9: mov r12d, 1
0x10046aaff: mov ecx, r15d
0x10046ab02: shl r12d, cl
0x10046ab05: mov r14d, r15d
0x10046ab08: mov eax, dword ptr [r13 + 0x22c]
0x10046ab0f: bt eax, r15d
0x10046ab13: mov rax, qword ptr [r13 + 0x28]
0x10046ab17: mov rbx, qword ptr [rax + r14*8]
0x10046ab1b: jae 0x10046ab6b
0x10046ab1d: lea rdi, [rbp - 0x80]
0x10046ab21: mov rsi, qword ptr [rbp - 0x30]
0x10046ab25: mov rdx, qword ptr [rbp - 0x40]
0x10046ab29: call 0x100076df0 ; 0x100076df0
0x10046ab2e: cmp byte ptr [rbx + 0x52a], 1
0x10046ab35: je 0x10046b3bb
0x10046ab3b: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x10046ab40: vmovaps xmmword ptr [rbx + 0x50], xmm0
0x10046ab45: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x10046ab4a: vmovaps xmmword ptr [rbx + 0x60], xmm0
0x10046ab4f: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x10046ab54: vmovaps xmmword ptr [rbx + 0x70], xmm0
0x10046ab59: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x10046ab5e: vmovaps xmmword ptr [rbx + 0x80], xmm0
0x10046ab66: jmp 0x10046ac00 ; 0x10046ac00
0x10046ab6b: cmp byte ptr [rbx + 0x52a], 1
0x10046ab72: je 0x10046b3d7
0x10046ab78: vmovaps xmm0, xmmword ptr [r13 + 0x160]
0x10046ab81: vmovaps xmmword ptr [rbx + 0x10], xmm0
0x10046ab86: vmovaps xmm0, xmmword ptr [r13 + 0x170]
0x10046ab8f: vmovaps xmmword ptr [rbx + 0x20], xmm0
0x10046ab94: vmovaps xmm0, xmmword ptr [r13 + 0x180]
0x10046ab9d: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x10046aba2: vmovaps xmm0, xmmword ptr [r13 + 0x190]
0x10046abab: vmovaps xmmword ptr [rbx + 0x40], xmm0
0x10046abb0: mov rax, qword ptr [r13 + 0x28]
0x10046abb4: mov rax, qword ptr [rax + r14*8]
0x10046abb8: cmp byte ptr [rax + 0x52a], 1
0x10046abbf: je 0x10046b3bb
0x10046abc5: vmovaps xmm0, xmmword ptr [r13 + 0x120]
0x10046abce: vmovaps xmmword ptr [rax + 0x50], xmm0
0x10046abd3: vmovaps xmm0, xmmword ptr [r13 + 0x130]
0x10046abdc: vmovaps xmmword ptr [rax + 0x60], xmm0
0x10046abe1: vmovaps xmm0, xmmword ptr [r13 + 0x140]
0x10046abea: vmovaps xmmword ptr [rax + 0x70], xmm0
0x10046abef: vmovaps xmm0, xmmword ptr [r13 + 0x150]
0x10046abf8: vmovaps xmmword ptr [rax + 0x80], xmm0
0x10046ac00: mov rax, qword ptr [r13 + 0x30]
0x10046ac04: mov rbx, qword ptr [rax + r14*8]
0x10046ac08: test dword ptr [r13 + 0x22c], r12d
0x10046ac0f: je 0x10046ac5f
0x10046ac11: lea rdi, [rbp - 0x80]
0x10046ac15: mov rsi, qword ptr [rbp - 0x30]
0x10046ac19: mov rdx, qword ptr [rbp - 0x40]
0x10046ac1d: call 0x100076df0 ; 0x100076df0
0x10046ac22: cmp byte ptr [rbx + 0x52a], 1
0x10046ac29: je 0x10046b3bb
0x10046ac2f: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x10046ac34: vmovaps xmmword ptr [rbx + 0x50], xmm0
0x10046ac39: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x10046ac3e: vmovaps xmmword ptr [rbx + 0x60], xmm0
0x10046ac43: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x10046ac48: vmovaps xmmword ptr [rbx + 0x70], xmm0
0x10046ac4d: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x10046ac52: vmovaps xmmword ptr [rbx + 0x80], xmm0
0x10046ac5a: jmp 0x10046acf4 ; 0x10046acf4
0x10046ac5f: cmp byte ptr [rbx + 0x52a], 1
0x10046ac66: je 0x10046b3d7
0x10046ac6c: vmovaps xmm0, xmmword ptr [r13 + 0x160]
0x10046ac75: vmovaps xmmword ptr [rbx + 0x10], xmm0
0x10046ac7a: vmovaps xmm0, xmmword ptr [r13 + 0x170]
0x10046ac83: vmovaps xmmword ptr [rbx + 0x20], xmm0
0x10046ac88: vmovaps xmm0, xmmword ptr [r13 + 0x180]
0x10046ac91: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x10046ac96: vmovaps xmm0, xmmword ptr [r13 + 0x190]
0x10046ac9f: vmovaps xmmword ptr [rbx + 0x40], xmm0
0x10046aca4: mov rax, qword ptr [r13 + 0x30]
0x10046aca8: mov rax, qword ptr [rax + r14*8]
0x10046acac: cmp byte ptr [rax + 0x52a], 1
0x10046acb3: je 0x10046b3bb
0x10046acb9: vmovaps xmm0, xmmword ptr [r13 + 0x120]
0x10046acc2: vmovaps xmmword ptr [rax + 0x50], xmm0
0x10046acc7: vmovaps xmm0, xmmword ptr [r13 + 0x130]
0x10046acd0: vmovaps xmmword ptr [rax + 0x60], xmm0
0x10046acd5: vmovaps xmm0, xmmword ptr [r13 + 0x140]
0x10046acde: vmovaps xmmword ptr [rax + 0x70], xmm0
0x10046ace3: vmovaps xmm0, xmmword ptr [r13 + 0x150]
0x10046acec: vmovaps xmmword ptr [rax + 0x80], xmm0
0x10046acf4: mov rax, qword ptr [r13 + 0x38]
0x10046acf8: mov rbx, qword ptr [rax + r14*8]
0x10046acfc: test dword ptr [r13 + 0x22c], r12d
0x10046ad03: je 0x10046ad53
0x10046ad05: lea rdi, [rbp - 0x80]
0x10046ad09: mov rsi, qword ptr [rbp - 0x30]
0x10046ad0d: mov rdx, qword ptr [rbp - 0x40]
0x10046ad11: call 0x100076df0 ; 0x100076df0
0x10046ad16: cmp byte ptr [rbx + 0x52a], 1
0x10046ad1d: je 0x10046b3bb
0x10046ad23: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x10046ad28: vmovaps xmmword ptr [rbx + 0x50], xmm0
0x10046ad2d: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x10046ad32: vmovaps xmmword ptr [rbx + 0x60], xmm0
0x10046ad37: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x10046ad3c: vmovaps xmmword ptr [rbx + 0x70], xmm0
0x10046ad41: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x10046ad46: vmovaps xmmword ptr [rbx + 0x80], xmm0
0x10046ad4e: jmp 0x10046ade8 ; 0x10046ade8
0x10046ad53: cmp byte ptr [rbx + 0x52a], 1
0x10046ad5a: je 0x10046b3d7
0x10046ad60: vmovaps xmm0, xmmword ptr [r13 + 0x160]
0x10046ad69: vmovaps xmmword ptr [rbx + 0x10], xmm0
0x10046ad6e: vmovaps xmm0, xmmword ptr [r13 + 0x170]
0x10046ad77: vmovaps xmmword ptr [rbx + 0x20], xmm0
0x10046ad7c: vmovaps xmm0, xmmword ptr [r13 + 0x180]
0x10046ad85: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x10046ad8a: vmovaps xmm0, xmmword ptr [r13 + 0x190]
0x10046ad93: vmovaps xmmword ptr [rbx + 0x40], xmm0
0x10046ad98: mov rax, qword ptr [r13 + 0x38]
0x10046ad9c: mov rax, qword ptr [rax + r14*8]
0x10046ada0: cmp byte ptr [rax + 0x52a], 1
0x10046ada7: je 0x10046b3bb
0x10046adad: vmovaps xmm0, xmmword ptr [r13 + 0x120]
0x10046adb6: vmovaps xmmword ptr [rax + 0x50], xmm0
0x10046adbb: vmovaps xmm0, xmmword ptr [r13 + 0x130]
0x10046adc4: vmovaps xmmword ptr [rax + 0x60], xmm0
0x10046adc9: vmovaps xmm0, xmmword ptr [r13 + 0x140]
0x10046add2: vmovaps xmmword ptr [rax + 0x70], xmm0
0x10046add7: vmovaps xmm0, xmmword ptr [r13 + 0x150]
0x10046ade0: vmovaps xmmword ptr [rax + 0x80], xmm0
0x10046ade8: mov rax, qword ptr [r13 + 0x40]
0x10046adec: mov rbx, qword ptr [rax + r14*8]
0x10046adf0: test dword ptr [r13 + 0x22c], r12d
0x10046adf7: je 0x10046ae47
0x10046adf9: lea rdi, [rbp - 0x80]
0x10046adfd: mov rsi, qword ptr [rbp - 0x30]
0x10046ae01: mov rdx, qword ptr [rbp - 0x40]
0x10046ae05: call 0x100076df0 ; 0x100076df0
0x10046ae0a: cmp byte ptr [rbx + 0x52a], 1
0x10046ae11: je 0x10046b3bb
0x10046ae17: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x10046ae1c: vmovaps xmmword ptr [rbx + 0x50], xmm0
0x10046ae21: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x10046ae26: vmovaps xmmword ptr [rbx + 0x60], xmm0
0x10046ae2b: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x10046ae30: vmovaps xmmword ptr [rbx + 0x70], xmm0
0x10046ae35: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x10046ae3a: vmovaps xmmword ptr [rbx + 0x80], xmm0
0x10046ae42: jmp 0x10046aee0 ; 0x10046aee0
0x10046ae47: cmp byte ptr [rbx + 0x52a], 1
0x10046ae4e: je 0x10046b3d7
0x10046ae54: vmovaps xmm0, xmmword ptr [r13 + 0x160]
0x10046ae5d: vmovaps xmmword ptr [rbx + 0x10], xmm0
0x10046ae62: vmovaps xmm0, xmmword ptr [r13 + 0x170]
0x10046ae6b: vmovaps xmmword ptr [rbx + 0x20], xmm0
0x10046ae70: vmovaps xmm0, xmmword ptr [r13 + 0x180]
0x10046ae79: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x10046ae7e: vmovaps xmm0, xmmword ptr [r13 + 0x190]
0x10046ae87: vmovaps xmmword ptr [rbx + 0x40], xmm0
0x10046ae8c: mov rax, qword ptr [r13 + 0x40]
0x10046ae90: mov rax, qword ptr [rax + r14*8]
0x10046ae94: cmp byte ptr [rax + 0x52a], 1
0x10046ae9b: je 0x10046b3bb
0x10046aea1: vmovaps xmm0, xmmword ptr [r13 + 0x120]
0x10046aeaa: vmovaps xmmword ptr [rax + 0x50], xmm0
0x10046aeaf: vmovaps xmm0, xmmword ptr [r13 + 0x130]
0x10046aeb8: vmovaps xmmword ptr [rax + 0x60], xmm0
0x10046aebd: vmovaps xmm0, xmmword ptr [r13 + 0x140]
0x10046aec6: vmovaps xmmword ptr [rax + 0x70], xmm0
0x10046aecb: vmovaps xmm0, xmmword ptr [r13 + 0x150]
0x10046aed4: vmovaps xmmword ptr [rax + 0x80], xmm0
0x10046aedc: nop dword ptr [rax]
0x10046aee0: cmp byte ptr [r13 + 0x227], 0
0x10046aee8: sete al
0x10046aeeb: or al, byte ptr [rbp - 0x34]
0x10046aeee: jne 0x10046b310
0x10046aef4: mov ebx, dword ptr [r13 + 0x22c]
0x10046aefb: mov r12d, dword ptr [r13 + 0x230]
0x10046af02: mov r14d, 1
0x10046af08: mov ecx, r15d
0x10046af0b: shl r14d, cl
0x10046af0e: cmp r15d, dword ptr [r13 + 0x90]
0x10046af15: jne 0x10046afc0
0x10046af1b: test ebx, r14d
0x10046af1e: je 0x10046af84
0x10046af20: cmp byte ptr [rip + 0x1b9c831], 0 ; 0x102007758
0x10046af27: je 0x10046afe9
0x10046af2d: mov rdi, qword ptr [rbp - 0x98]
0x10046af34: mov eax, edi
0x10046af36: lea rax, [rax + rax*4]
0x10046af3a: lea rcx, [r13 + rax*8 + 0xd0]
0x10046af42: mov qword ptr [r13 + rax*8 + 0xe8], r13
0x10046af4a: mov rdx, qword ptr [rbp - 0x88]
0x10046af51: mov qword ptr [r13 + rax*8 + 0xe0], rdx
0x10046af59: mov dword ptr [r13 + rax*8 + 0xf0], r15d
0x10046af61: mov rsi, qword ptr [rbp - 0xa8]
0x10046af68: mov eax, dword ptr [rsi + 0x4000]
0x10046af6e: lea edx, [rax + 1]
0x10046af71: mov dword ptr [rsi + 0x4000], edx
0x10046af77: mov qword ptr [rsi + rax*8], rcx
0x10046af7b: inc edi
0x10046af7d: mov qword ptr [rbp - 0x98], rdi
0x10046af84: cmp dword ptr [r13 + 0x354], 0
0x10046af8c: je 0x10046b005
0x10046af8e: mov rax, qword ptr [r13 + 0x40]
0x10046af92: mov ecx, r15d
0x10046af95: mov rax, qword ptr [rax + rcx*8]
0x10046af99: cmp byte ptr [rax + 0x538], 0
0x10046afa0: setne al
0x10046afa3: test r12d, r14d
0x10046afa6: jne 0x10046b00c
0x10046afa8: test al, al
0x10046afaa: je 0x10046b310
0x10046afb0: jmp 0x10046b00c ; 0x10046b00c
0x10046afb2: nop word ptr cs:[rax + rax]
0x10046afc0: vmovss xmm0, dword ptr [r13 + 0x98]
0x10046afc9: vucomiss xmm0, dword ptr [rip + 0x63c113] ; 0x100aa70e4
0x10046afd1: jbe 0x10046b310
0x10046afd7: cmp r15d, dword ptr [r13 + 0x94]
0x10046afde: je 0x10046af1b
0x10046afe4: jmp 0x10046b310 ; 0x10046b310
0x10046afe9: mov rdi, r13
0x10046afec: mov esi, r15d
0x10046afef: mov rdx, qword ptr [rbp - 0x88]
0x10046aff6: call 0x1004654b0 ; 0x1004654b0
0x10046affb: cmp dword ptr [r13 + 0x354], 0
0x10046b003: jne 0x10046af8e
0x10046b005: xor eax, eax
0x10046b007: test r12d, r14d
0x10046b00a: je 0x10046afa8
0x10046b00c: mov dword ptr [rbp - 0x90], eax
0x10046b012: mov rax, qword ptr [rbp - 0x88]
0x10046b019: mov rsi, qword ptr [rax + 0x70]
0x10046b01d: lea rdi, [rbp - 0x80]
0x10046b021: call 0x10076be90 ; 0x10076be90
0x10046b026: test ebx, r14d
0x10046b029: jne 0x10046b07f
0x10046b02b: lea rdi, [rbp - 0xf0]
0x10046b032: mov rsi, qword ptr [rbp - 0x30]
0x10046b036: call 0x100076940 ; 0x100076940
0x10046b03b: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x10046b040: vpermilps xmm1, xmm0, 0
0x10046b046: vmulps xmm1, xmm1, xmmword ptr [rbp - 0xf0]
0x10046b04e: vpermilps xmm2, xmm0, 0x55
0x10046b054: vmulps xmm2, xmm2, xmmword ptr [rbp - 0xe0]
0x10046b05c: vaddps xmm1, xmm1, xmm2
0x10046b060: vpermilps xmm0, xmm0, 0xaa
0x10046b066: vmulps xmm0, xmm0, xmmword ptr [rbp - 0xd0]
0x10046b06e: vaddps xmm0, xmm1, xmm0
0x10046b072: vaddps xmm0, xmm0, xmmword ptr [rbp - 0xc0]
0x10046b07a: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x10046b07f: mov rax, qword ptr [r13 + 8]
0x10046b083: mov ecx, r15d
0x10046b086: mov qword ptr [rbp - 0xa0], rcx
0x10046b08d: mov rax, qword ptr [rax + rcx*8]
0x10046b091: mov rcx, qword ptr [rax]
0x10046b094: mov r8, qword ptr [rcx + 0x48]
0x10046b098: movsxd r9, dword ptr [rax + 0x10]
0x10046b09c: test r12d, r14d
0x10046b09f: vmovaps xmm2, xmmword ptr [rip + 0x63cfd9] ; 0x100aa8080
0x10046b0a7: je 0x10046b213
0x10046b0ad: imul rax, r9, 0xb8
0x10046b0b4: movsxd rcx, dword ptr [r8 + rax + 0x38]
0x10046b0b9: imul r14, rcx, 0x55555556
0x10046b0c0: mov rdx, r14
0x10046b0c3: shr rdx, 0x3f
0x10046b0c7: shr r14, 0x20
0x10046b0cb: add r14d, edx
0x10046b0ce: mov rdx, qword ptr [r13 + 0x48]
0x10046b0d2: mov r12, qword ptr [rbp - 0xa0]
0x10046b0d9: mov rdi, qword ptr [rdx + r12*8]
0x10046b0dd: lea ecx, [rcx + 2]
0x10046b0e0: mov dword ptr [rbp - 0x8c], ecx
0x10046b0e6: cmp ecx, 5
0x10046b0e9: mov qword ptr [rbp - 0xb0], r8
0x10046b0f0: jae 0x10046b0fc
0x10046b0f2: mov rbx, r9
0x10046b0f5: xor esi, esi
0x10046b0f7: jmp 0x10046b186 ; 0x10046b186
0x10046b0fc: mov r8, qword ptr [r8 + rax + 0x60]
0x10046b101: mov esi, r14d
0x10046b104: lea rcx, [rdi + 0xc]
0x10046b108: mov rdx, rsi
0x10046b10b: nop dword ptr [rax + rax]
0x10046b110: mov ebx, dword ptr [rcx - 0xc]
0x10046b113: mov eax, dword ptr [rcx - 8]
0x10046b116: shl rbx, 4
0x10046b11a: vmovsd xmm0, qword ptr [r8 + rbx]
0x10046b120: vinsertps xmm0, xmm0, dword ptr [r8 + rbx + 8], 0x20
0x10046b128: shl rax, 4
0x10046b12c: vmovsd xmm1, qword ptr [r8 + rax]
0x10046b132: vinsertps xmm1, xmm1, dword ptr [r8 + rax + 8], 0x20
0x10046b13a: vaddps xmm0, xmm0, xmm1
0x10046b13e: mov eax, dword ptr [rcx - 4]
0x10046b141: shl rax, 4
0x10046b145: vmovsd xmm1, qword ptr [r8 + rax]
0x10046b14b: vinsertps xmm1, xmm1, dword ptr [r8 + rax + 8], 0x20
0x10046b153: vaddps xmm0, xmm0, xmm1
0x10046b157: vdivps xmm0, xmm0, xmm2
0x10046b15b: vsubps xmm0, xmm0, xmmword ptr [rbp - 0x80]
0x10046b160: vmulps xmm0, xmm0, xmm0
0x10046b164: vmovshdup xmm1, xmm0
0x10046b168: vaddss xmm1, xmm0, xmm1
0x10046b16c: vpermilpd xmm0, xmm0, 1
0x10046b172: vaddss xmm0, xmm0, xmm1
0x10046b176: vmovss dword ptr [rcx], xmm0
0x10046b17a: add rcx, 0x10
0x10046b17e: dec rdx
0x10046b181: jne 0x10046b110
0x10046b183: mov rbx, r9
0x10046b186: shl rsi, 4
0x10046b18a: add rsi, rdi
0x10046b18d: call 0x10046f080 ; 0x10046f080
0x10046b192: mov rax, qword ptr [r13 + 0x10]
0x10046b196: mov rdi, qword ptr [rax + r12*8]
0x10046b19a: cmp dword ptr [rdi + 0x250], 2
0x10046b1a1: jne 0x10046b3ff
0x10046b1a7: cmp dword ptr [rdi + 0x240], 4
0x10046b1ae: jne 0x10046b41e
0x10046b1b4: mov rax, qword ptr [r13 + 0x48]
0x10046b1b8: mov r12, qword ptr [rax + r12*8]
0x10046b1bc: mov byte ptr [rdi + 0x238], 1
0x10046b1c3: add rdi, 0x248
0x10046b1ca: call 0x100795060 ; 0x100795060
0x10046b1cf: cmp dword ptr [rbp - 0x8c], 5
0x10046b1d6: mov r8, qword ptr [rbp - 0xb0]
0x10046b1dd: mov r9, rbx
0x10046b1e0: jb 0x10046b213
0x10046b1e2: mov ecx, r14d
0x10046b1e5: xor edx, edx
0x10046b1e7: xor esi, esi
0x10046b1e9: nop dword ptr [rax]
0x10046b1f0: mov edi, edx
0x10046b1f2: mov ebx, dword ptr [r12 + 8]
0x10046b1f7: mov dword ptr [rax + rdi*4 + 8], ebx
0x10046b1fb: mov rbx, qword ptr [r12]
0x10046b1ff: mov qword ptr [rax + rdi*4], rbx
0x10046b203: inc rsi
0x10046b206: add rdx, 3
0x10046b20a: add r12, 0x10
0x10046b20e: cmp rsi, rcx
0x10046b211: jb 0x10046b1f0
0x10046b213: cmp byte ptr [rbp - 0x90], 0
0x10046b21a: je 0x10046b310
0x10046b220: mov rax, qword ptr [r13 + 8]
0x10046b224: mov rcx, qword ptr [r13 + 0x10]
0x10046b228: mov rbx, qword ptr [rbp - 0xa0]
0x10046b22f: mov rdi, qword ptr [rcx + rbx*8]
0x10046b233: imul rcx, r9, 0xb8
0x10046b23a: mov rdx, qword ptr [r8 + rcx + 0x60]
0x10046b23f: mov rax, qword ptr [rax + rbx*8]
0x10046b243: mov rsi, qword ptr [rax]
0x10046b246: movsxd rax, dword ptr [rax + 0x10]
0x10046b24a: imul rcx, rax, 0xb8
0x10046b251: add rcx, qword ptr [rsi + 0x48]
0x10046b255: mov esi, 2
0x10046b25a: lea r8, [rbp - 0x80]
0x10046b25e: call 0x10046b520 ; 0x10046b520
0x10046b263: mov rax, qword ptr [r13 + 0x40]
0x10046b267: mov rdi, qword ptr [rax + rbx*8]
0x10046b26b: cmp byte ptr [rdi + 0x538], 0
0x10046b272: je 0x10046b43d
0x10046b278: vmovaps xmm0, xmmword ptr [r13 + 0x160]
0x10046b281: vmovaps xmm1, xmmword ptr [r13 + 0x170]
0x10046b28a: vmovaps xmm2, xmmword ptr [r13 + 0x180]
0x10046b293: vmulps xmm0, xmm0, xmm0
0x10046b297: vmulps xmm1, xmm1, xmm1
0x10046b29b: vmulps xmm2, xmm2, xmm2
0x10046b29f: vpermilpd xmm3, xmm0, 1
0x10046b2a5: vmovshdup xmm4, xmm0
0x10046b2a9: vaddss xmm0, xmm0, xmm4
0x10046b2ad: vaddss xmm0, xmm3, xmm0
0x10046b2b1: vsqrtss xmm0, xmm0, xmm0
0x10046b2b5: vpermilpd xmm3, xmm1, 1
0x10046b2bb: vmovshdup xmm4, xmm1
0x10046b2bf: vaddss xmm1, xmm1, xmm4
0x10046b2c3: vaddss xmm1, xmm3, xmm1
0x10046b2c7: vsqrtss xmm1, xmm1, xmm1
0x10046b2cb: vaddss xmm0, xmm0, xmm1
0x10046b2cf: vpermilpd xmm1, xmm2, 1
0x10046b2d5: vmovshdup xmm3, xmm2
0x10046b2d9: vaddss xmm2, xmm2, xmm3
0x10046b2dd: vaddss xmm1, xmm1, xmm2
0x10046b2e1: vsqrtss xmm1, xmm1, xmm1
0x10046b2e5: vaddss xmm0, xmm0, xmm1
0x10046b2e9: vmulss xmm0, xmm0, dword ptr [rip + 0x63d367] ; 0x100aa8658
0x10046b2f1: add rdi, 0x270
0x10046b2f8: vmulss xmm0, xmm0, dword ptr [r13 + 0x364]
0x10046b301: lea rsi, [rip + 0x71ec3c] ; 0x100b89f44 u_pointScale
0x10046b308: call 0x1007be530 ; 0x1007be530
0x10046b30d: nop dword ptr [rax]
0x10046b310: inc r15d
0x10046b313: cmp r15d, dword ptr [r13 + 0x8c]
0x10046b31a: jb 0x10046aae0
0x10046b320: mov byte ptr [r13 + 0x225], 0
0x10046b328: cmp byte ptr [r13 + 0x280], 0
0x10046b330: je 0x10046b38a
0x10046b332: vmovaps xmm0, xmmword ptr [r13 + 0x240]
0x10046b33b: vmovaps xmm1, xmmword ptr [r13 + 0x250]
0x10046b344: vmovaps xmm2, xmmword ptr [r13 + 0x260]
0x10046b34d: vmovaps xmm3, xmmword ptr [r13 + 0x270]
0x10046b356: vmovaps xmmword ptr [r13 + 0x160], xmm0
0x10046b35f: vmovaps xmmword ptr [r13 + 0x170], xmm1
0x10046b368: vmovaps xmmword ptr [r13 + 0x180], xmm2
0x10046b371: vmovaps xmmword ptr [r13 + 0x190], xmm3
0x10046b37a: mov byte ptr [r13 + 0x225], 1
0x10046b382: mov byte ptr [r13 + 0x280], 0
0x10046b38a: add rsp, 0xc8
0x10046b391: pop rbx
0x10046b392: pop r12
0x10046b394: pop r13
0x10046b396: pop r14
0x10046b398: pop r15
0x10046b39a: pop rbp
0x10046b39b: ret 
0x10046b39c: call 0x100779370 ; 0x100779370
0x10046b3a1: mov qword ptr [rbp - 0x88], r15
0x10046b3a8: cmp dword ptr [r13 + 0x8c], 0
0x10046b3b0: jne 0x10046aabe
0x10046b3b6: jmp 0x10046b320 ; 0x10046b320
0x10046b3bb: lea rdi, [rip + 0x6f6eaf] ; 0x100b62271 !m_queued
0x10046b3c2: lea rsi, [rip + 0x6f6eb2] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x10046b3c9: lea r8, [rip + 0x6f6ec7] ; 0x100b62297 VertexRender has already been committed!
0x10046b3d0: mov edx, 0x8d
0x10046b3d5: jmp 0x10046b3f1 ; 0x10046b3f1
0x10046b3d7: lea rdi, [rip + 0x6f6e93] ; 0x100b62271 !m_queued
0x10046b3de: lea rsi, [rip + 0x6f6e96] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x10046b3e5: lea r8, [rip + 0x6f6eab] ; 0x100b62297 VertexRender has already been committed!
0x10046b3ec: mov edx, 0x8c
0x10046b3f1: mov ecx, 4
0x10046b3f6: xor eax, eax
0x10046b3f8: call 0x1007e6030 ; 0x1007e6030
0x10046b3fd: ud2 
0x10046b3ff: lea rdi, [rip + 0x71ecf3] ; 0x100b8a0f9 m_indexBuffers[ idx ].mb.GetUsage() == Bind_Dynamic
0x10046b406: lea rsi, [rip + 0x6f6e6e] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x10046b40d: mov edx, 0x11e
0x10046b412: mov ecx, 3
0x10046b417: call 0x1007e5f70 ; 0x1007e5f70
0x10046b41c: ud2 
0x10046b41e: lea rdi, [rip + 0x71ed08] ; 0x100b8a12d sizeof( IndexType ) == m_indexBuffers[ idx ].idxSize
0x10046b425: lea rsi, [rip + 0x6f6e4f] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x10046b42c: mov edx, 0x11f
0x10046b431: mov ecx, 3
0x10046b436: call 0x1007e5f70 ; 0x1007e5f70
0x10046b43b: ud2 
0x10046b43d: lea rdi, [rip + 0x70b8a6] ; 0x100b76cea IsInitialized()
0x10046b444: lea rsi, [rip + 0x6f6e30] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x10046b44b: mov edx, 0xa8
0x10046b450: mov ecx, 3
0x10046b455: call 0x1007e5f70 ; 0x1007e5f70
0x10046b45a: ud2 
0x10046b45c: nop dword ptr [rax]
