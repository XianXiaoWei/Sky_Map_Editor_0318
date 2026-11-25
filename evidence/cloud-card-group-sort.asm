0x100222830: push rbp
0x100222831: mov rbp, rsp
0x100222834: push r15
0x100222836: push r14
0x100222838: push r13
0x10022283a: push r12
0x10022283c: push rbx
0x10022283d: sub rsp, 0x48
0x100222841: mov r14, rsi
0x100222844: mov r12, rdi
0x100222847: mov rax, qword ptr [rip + 0x9eb08a] ; 0x100c0d8d8
0x10022284e: mov rax, qword ptr [rax]
0x100222851: mov qword ptr [rbp - 0x30], rax
0x100222855: jmp 0x100222870 ; 0x100222870
0x100222857: mov rdi, r15
0x10022285a: sub rdi, -0x80
0x10022285e: mov rsi, r14
0x100222861: vzeroupper 
0x100222864: call 0x100222830 ; 0x100222830
0x100222869: mov r14, r15
0x10022286c: nop dword ptr [rax]
0x100222870: lea rax, [r14 - 0x80]
0x100222874: mov qword ptr [rbp - 0x68], rax
0x100222878: lea rax, [r14 - 0x100]
0x10022287f: mov qword ptr [rbp - 0x70], rax
0x100222883: mov rbx, r12
0x100222886: jmp 0x1002228a0 ; 0x1002228a0
0x100222888: mov rdi, r12
0x10022288b: mov rsi, r15
0x10022288e: vzeroupper 
0x100222891: call 0x100222830 ; 0x100222830
0x100222896: sub r15, -0x80
0x10022289a: mov rbx, r15
0x10022289d: nop dword ptr [rax]
0x1002228a0: mov r12, rbx
0x1002228a3: mov rcx, r14
0x1002228a6: sub rcx, r12
0x1002228a9: mov rax, rcx
0x1002228ac: sar rax, 7
0x1002228b0: cmp rax, 5
0x1002228b4: jbe 0x100222e19
0x1002228ba: cmp rcx, 0x37f
0x1002228c1: mov r15, qword ptr [rbp - 0x68]
0x1002228c5: jle 0x100222ef7
0x1002228cb: mov rbx, rax
0x1002228ce: shr rbx, 0x3f
0x1002228d2: add rbx, rax
0x1002228d5: sar rbx, 1
0x1002228d8: shl rbx, 7
0x1002228dc: lea r13, [r12 + rbx]
0x1002228e0: cmp rcx, 0x1f381
0x1002228e7: jl 0x100222920
0x1002228e9: mov rcx, rax
0x1002228ec: sar rcx, 0x3f
0x1002228f0: shr rcx, 0x3e
0x1002228f4: add rcx, rax
0x1002228f7: shl rcx, 5
0x1002228fb: and rcx, 0xffffffffffffff80
0x1002228ff: lea rsi, [r12 + rcx]
0x100222903: add rcx, r13
0x100222906: mov rdi, r12
0x100222909: mov rdx, r13
0x10022290c: mov r8, r15
0x10022290f: vzeroupper 
0x100222912: call 0x100223740 ; 0x100223740
0x100222917: jmp 0x100222931 ; 0x100222931
0x100222919: nop dword ptr [rax]
0x100222920: mov rdi, r12
0x100222923: mov rsi, r13
0x100222926: mov rdx, r15
0x100222929: vzeroupper 
0x10022292c: call 0x100223420 ; 0x100223420
0x100222931: mov edx, dword ptr [r12 + 0x20]
0x100222936: mov esi, dword ptr [r12 + rbx + 0x20]
0x10022293b: cmp edx, esi
0x10022293d: jae 0x100222950
0x10022293f: mov rcx, r15
0x100222942: jmp 0x100222a55 ; 0x100222a55
0x100222947: nop word ptr [rax + rax]
0x100222950: mov rdi, qword ptr [rbp - 0x70]
0x100222954: mov rcx, rdi
0x100222957: cmp r12, rdi
0x10022295a: je 0x10022296e
0x10022295c: nop dword ptr [rax]
0x100222960: cmp dword ptr [rcx + 0x20], esi
0x100222963: jb 0x1002229a7
0x100222965: add rcx, -0x80
0x100222969: cmp r12, rcx
0x10022296c: jne 0x100222960
0x10022296e: mov rax, r12
0x100222971: sub rax, -0x80
0x100222975: cmp edx, dword ptr [r14 - 0x60]
0x100222979: jb 0x100222d22
0x10022297f: cmp rax, r15
0x100222982: je 0x10022307b
0x100222988: lea rax, [r12 + 0x100]
0x100222990: cmp edx, dword ptr [rax - 0x60]
0x100222993: jb 0x100222c82
0x100222999: sub rax, -0x80
0x10022299d: cmp r14, rax
0x1002229a0: jne 0x100222990
0x1002229a2: jmp 0x10022307b ; 0x10022307b
0x1002229a7: mov edx, dword ptr [r12 + 0x20]
0x1002229ac: mov dword ptr [rbp - 0x40], edx
0x1002229af: vmovups ymm0, ymmword ptr [r12]
0x1002229b5: vmovups ymmword ptr [rbp - 0x60], ymm0
0x1002229ba: vmovaps xmm0, xmmword ptr [r12 + 0x30]
0x1002229c1: vmovaps xmm1, xmmword ptr [r12 + 0x40]
0x1002229c8: vmovaps xmm2, xmmword ptr [r12 + 0x50]
0x1002229cf: vmovaps xmm3, xmmword ptr [r12 + 0x60]
0x1002229d6: vmovaps xmm4, xmmword ptr [r12 + 0x70]
0x1002229dd: mov edx, dword ptr [rcx + 0x20]
0x1002229e0: mov dword ptr [r12 + 0x20], edx
0x1002229e5: vmovups ymm5, ymmword ptr [rcx]
0x1002229e9: vmovups ymmword ptr [r12], ymm5
0x1002229ef: vmovaps xmm5, xmmword ptr [rcx + 0x30]
0x1002229f4: vmovaps xmmword ptr [r12 + 0x30], xmm5
0x1002229fb: vmovaps xmm5, xmmword ptr [rcx + 0x40]
0x100222a00: vmovaps xmmword ptr [r12 + 0x40], xmm5
0x100222a07: vmovaps xmm5, xmmword ptr [rcx + 0x50]
0x100222a0c: vmovaps xmmword ptr [r12 + 0x50], xmm5
0x100222a13: vmovaps xmm5, xmmword ptr [rcx + 0x60]
0x100222a18: vmovaps xmmword ptr [r12 + 0x60], xmm5
0x100222a1f: vmovaps xmm5, xmmword ptr [rcx + 0x70]
0x100222a24: vmovaps xmmword ptr [r12 + 0x70], xmm5
0x100222a2b: mov edx, dword ptr [rbp - 0x40]
0x100222a2e: mov dword ptr [rcx + 0x20], edx
0x100222a31: vmovups ymm5, ymmword ptr [rbp - 0x60]
0x100222a36: vmovups ymmword ptr [rcx], ymm5
0x100222a3a: vmovaps xmmword ptr [rcx + 0x30], xmm0
0x100222a3f: vmovaps xmmword ptr [rcx + 0x40], xmm1
0x100222a44: vmovaps xmmword ptr [rcx + 0x50], xmm2
0x100222a49: vmovaps xmmword ptr [rcx + 0x60], xmm3
0x100222a4e: vmovaps xmmword ptr [rcx + 0x70], xmm4
0x100222a53: inc eax
0x100222a55: mov r15, r12
0x100222a58: sub r15, -0x80
0x100222a5c: cmp r15, rcx
0x100222a5f: jb 0x100222bd9
0x100222a65: cmp r15, r13
0x100222a68: je 0x100222c30
0x100222a6e: mov ecx, dword ptr [r13 + 0x20]
0x100222a72: cmp ecx, dword ptr [r15 + 0x20]
0x100222a76: jae 0x100222c30
0x100222a7c: mov ecx, dword ptr [r15 + 0x20]
0x100222a80: mov dword ptr [rbp - 0x40], ecx
0x100222a83: vmovups ymm0, ymmword ptr [r15]
0x100222a88: vmovups ymmword ptr [rbp - 0x60], ymm0
0x100222a8d: vmovaps xmm0, xmmword ptr [r15 + 0x30]
0x100222a93: vmovaps xmm1, xmmword ptr [r15 + 0x40]
0x100222a99: vmovaps xmm2, xmmword ptr [r15 + 0x50]
0x100222a9f: vmovaps xmm3, xmmword ptr [r15 + 0x60]
0x100222aa5: vmovaps xmm4, xmmword ptr [r15 + 0x70]
0x100222aab: mov ecx, dword ptr [r13 + 0x20]
0x100222aaf: mov dword ptr [r15 + 0x20], ecx
0x100222ab3: vmovups ymm5, ymmword ptr [r13]
0x100222ab9: vmovups ymmword ptr [r15], ymm5
0x100222abe: vmovaps xmm5, xmmword ptr [r13 + 0x30]
0x100222ac4: vmovaps xmmword ptr [r15 + 0x30], xmm5
0x100222aca: vmovaps xmm5, xmmword ptr [r13 + 0x40]
0x100222ad0: vmovaps xmmword ptr [r15 + 0x40], xmm5
0x100222ad6: vmovaps xmm5, xmmword ptr [r13 + 0x50]
0x100222adc: vmovaps xmmword ptr [r15 + 0x50], xmm5
0x100222ae2: vmovaps xmm5, xmmword ptr [r13 + 0x60]
0x100222ae8: vmovaps xmmword ptr [r15 + 0x60], xmm5
0x100222aee: vmovaps xmm5, xmmword ptr [r13 + 0x70]
0x100222af4: vmovaps xmmword ptr [r15 + 0x70], xmm5
0x100222afa: mov ecx, dword ptr [rbp - 0x40]
0x100222afd: mov dword ptr [r13 + 0x20], ecx
0x100222b01: vmovups ymm5, ymmword ptr [rbp - 0x60]
0x100222b06: vmovups ymmword ptr [r13], ymm5
0x100222b0c: vmovaps xmmword ptr [r13 + 0x30], xmm0
0x100222b12: vmovaps xmmword ptr [r13 + 0x40], xmm1
0x100222b18: vmovaps xmmword ptr [r13 + 0x50], xmm2
0x100222b1e: vmovaps xmmword ptr [r13 + 0x60], xmm3
0x100222b24: vmovaps xmmword ptr [r13 + 0x70], xmm4
0x100222b2a: inc eax
0x100222b2c: test eax, eax
0x100222b2e: je 0x100222c34
0x100222b34: jmp 0x100222c68 ; 0x100222c68
0x100222b39: nop dword ptr [rax]
0x100222b40: mov esi, dword ptr [rdx + 0x20]
0x100222b43: mov dword ptr [rbp - 0x40], esi
0x100222b46: vmovups ymm0, ymmword ptr [rdx]
0x100222b4a: vmovups ymmword ptr [rbp - 0x60], ymm0
0x100222b4f: vmovaps xmm0, xmmword ptr [rdx + 0x30]
0x100222b54: vmovaps xmm1, xmmword ptr [rdx + 0x40]
0x100222b59: vmovaps xmm2, xmmword ptr [rdx + 0x50]
0x100222b5e: vmovaps xmm3, xmmword ptr [rdx + 0x60]
0x100222b63: vmovaps xmm4, xmmword ptr [rdx + 0x70]
0x100222b68: mov esi, dword ptr [rcx + 0x20]
0x100222b6b: mov dword ptr [rdx + 0x20], esi
0x100222b6e: vmovups ymm5, ymmword ptr [rcx]
0x100222b72: vmovups ymmword ptr [rdx], ymm5
0x100222b76: vmovaps xmm5, xmmword ptr [rcx + 0x30]
0x100222b7b: vmovaps xmmword ptr [rdx + 0x30], xmm5
0x100222b80: vmovaps xmm5, xmmword ptr [rcx + 0x40]
0x100222b85: vmovaps xmmword ptr [rdx + 0x40], xmm5
0x100222b8a: vmovaps xmm5, xmmword ptr [rcx + 0x50]
0x100222b8f: vmovaps xmmword ptr [rdx + 0x50], xmm5
0x100222b94: vmovaps xmm5, xmmword ptr [rcx + 0x60]
0x100222b99: vmovaps xmmword ptr [rdx + 0x60], xmm5
0x100222b9e: vmovaps xmm5, xmmword ptr [rcx + 0x70]
0x100222ba3: vmovaps xmmword ptr [rdx + 0x70], xmm5
0x100222ba8: mov esi, dword ptr [rbp - 0x40]
0x100222bab: mov dword ptr [rcx + 0x20], esi
0x100222bae: vmovups ymm5, ymmword ptr [rbp - 0x60]
0x100222bb3: vmovups ymmword ptr [rcx], ymm5
0x100222bb7: vmovaps xmmword ptr [rcx + 0x30], xmm0
0x100222bbc: vmovaps xmmword ptr [rcx + 0x40], xmm1
0x100222bc1: vmovaps xmmword ptr [rcx + 0x50], xmm2
0x100222bc6: vmovaps xmmword ptr [rcx + 0x60], xmm3
0x100222bcb: vmovaps xmmword ptr [rcx + 0x70], xmm4
0x100222bd0: inc eax
0x100222bd2: cmp r13, rdx
0x100222bd5: cmove r13, rcx
0x100222bd9: mov esi, dword ptr [r13 + 0x20]
0x100222bdd: add r15, -0x80
0x100222be1: mov rdx, r15
0x100222be4: nop word ptr cs:[rax + rax]
0x100222bf0: mov rdi, rdx
0x100222bf3: sub rdx, -0x80
0x100222bf7: cmp dword ptr [rdi + 0xa0], esi
0x100222bfd: jb 0x100222bf0
0x100222bff: mov r15, rdx
0x100222c02: sub r15, -0x80
0x100222c06: nop word ptr cs:[rax + rax]
0x100222c10: cmp dword ptr [rcx - 0x60], esi
0x100222c13: lea rcx, [rcx - 0x80]
0x100222c17: jae 0x100222c10
0x100222c19: cmp rdx, rcx
0x100222c1c: jbe 0x100222b40
0x100222c22: mov r15, rdx
0x100222c25: cmp r15, r13
0x100222c28: jne 0x100222a6e
0x100222c2e: nop 
0x100222c30: test eax, eax
0x100222c32: jne 0x100222c68
0x100222c34: mov rdi, r12
0x100222c37: mov rsi, r15
0x100222c3a: vzeroupper 
0x100222c3d: call 0x100223d00 ; 0x100223d00
0x100222c42: mov r13d, eax
0x100222c45: mov rbx, r15
0x100222c48: sub rbx, -0x80
0x100222c4c: mov rdi, rbx
0x100222c4f: mov rsi, r14
0x100222c52: call 0x100223d00 ; 0x100223d00
0x100222c57: test al, al
0x100222c59: jne 0x100222e08
0x100222c5f: test r13b, r13b
0x100222c62: jne 0x1002228a0
0x100222c68: mov rax, r15
0x100222c6b: sub rax, r12
0x100222c6e: mov rcx, r14
0x100222c71: sub rcx, r15
0x100222c74: cmp rax, rcx
0x100222c77: jl 0x100222888
0x100222c7d: jmp 0x100222857 ; 0x100222857
0x100222c82: mov ecx, dword ptr [rax - 0x60]
0x100222c85: mov dword ptr [rbp - 0x40], ecx
0x100222c88: vmovups ymm0, ymmword ptr [rax - 0x80]
0x100222c8d: vmovups ymmword ptr [rbp - 0x60], ymm0
0x100222c92: vmovaps xmm0, xmmword ptr [rax - 0x50]
0x100222c97: vmovaps xmm1, xmmword ptr [rax - 0x40]
0x100222c9c: vmovaps xmm2, xmmword ptr [rax - 0x30]
0x100222ca1: vmovaps xmm3, xmmword ptr [rax - 0x20]
0x100222ca6: vmovaps xmm4, xmmword ptr [rax - 0x10]
0x100222cab: mov ecx, dword ptr [r15 + 0x20]
0x100222caf: mov dword ptr [rax - 0x60], ecx
0x100222cb2: vmovups ymm5, ymmword ptr [r15]
0x100222cb7: vmovups ymmword ptr [rax - 0x80], ymm5
0x100222cbc: vmovaps xmm5, xmmword ptr [r14 - 0x50]
0x100222cc2: vmovaps xmmword ptr [rax - 0x50], xmm5
0x100222cc7: vmovaps xmm5, xmmword ptr [r14 - 0x40]
0x100222ccd: vmovaps xmmword ptr [rax - 0x40], xmm5
0x100222cd2: vmovaps xmm5, xmmword ptr [r14 - 0x30]
0x100222cd8: vmovaps xmmword ptr [rax - 0x30], xmm5
0x100222cdd: vmovaps xmm5, xmmword ptr [r14 - 0x20]
0x100222ce3: vmovaps xmmword ptr [rax - 0x20], xmm5
0x100222ce8: vmovaps xmm5, xmmword ptr [r14 - 0x10]
0x100222cee: vmovaps xmmword ptr [rax - 0x10], xmm5
0x100222cf3: mov ecx, dword ptr [rbp - 0x40]
0x100222cf6: mov dword ptr [r15 + 0x20], ecx
0x100222cfa: vmovups ymm5, ymmword ptr [rbp - 0x60]
0x100222cff: vmovups ymmword ptr [r15], ymm5
0x100222d04: vmovaps xmmword ptr [r14 - 0x50], xmm0
0x100222d0a: vmovaps xmmword ptr [r14 - 0x40], xmm1
0x100222d10: vmovaps xmmword ptr [r14 - 0x30], xmm2
0x100222d16: vmovaps xmmword ptr [r14 - 0x20], xmm3
0x100222d1c: vmovaps xmmword ptr [r14 - 0x10], xmm4
0x100222d22: cmp rax, r15
0x100222d25: jne 0x100222dd0
0x100222d2b: jmp 0x10022307b ; 0x10022307b
0x100222d30: mov edx, dword ptr [rax - 0x60]
0x100222d33: mov dword ptr [rbp - 0x40], edx
0x100222d36: vmovups ymm0, ymmword ptr [rax - 0x80]
0x100222d3b: vmovups ymmword ptr [rbp - 0x60], ymm0
0x100222d40: vmovaps xmm0, xmmword ptr [rax - 0x50]
0x100222d45: vmovaps xmm1, xmmword ptr [rax - 0x40]
0x100222d4a: vmovaps xmm2, xmmword ptr [rax - 0x30]
0x100222d4f: vmovaps xmm3, xmmword ptr [rax - 0x20]
0x100222d54: vmovaps xmm4, xmmword ptr [rax - 0x10]
0x100222d59: mov edx, dword ptr [r15 + 0x20]
0x100222d5d: mov dword ptr [rax - 0x60], edx
0x100222d60: vmovups ymm5, ymmword ptr [r15]
0x100222d65: vmovups ymmword ptr [rax - 0x80], ymm5
0x100222d6a: vmovaps xmm5, xmmword ptr [r15 + 0x30]
0x100222d70: vmovaps xmmword ptr [rax - 0x50], xmm5
0x100222d75: vmovaps xmm5, xmmword ptr [r15 + 0x40]
0x100222d7b: vmovaps xmmword ptr [rax - 0x40], xmm5
0x100222d80: vmovaps xmm5, xmmword ptr [r15 + 0x50]
0x100222d86: vmovaps xmmword ptr [rax - 0x30], xmm5
0x100222d8b: vmovaps xmm5, xmmword ptr [r15 + 0x60]
0x100222d91: vmovaps xmmword ptr [rax - 0x20], xmm5
0x100222d96: vmovaps xmm5, xmmword ptr [r15 + 0x70]
0x100222d9c: vmovaps xmmword ptr [rax - 0x10], xmm5
0x100222da1: mov edx, dword ptr [rbp - 0x40]
0x100222da4: mov dword ptr [r15 + 0x20], edx
0x100222da8: vmovups ymm5, ymmword ptr [rbp - 0x60]
0x100222dad: vmovups ymmword ptr [r15], ymm5
0x100222db2: vmovaps xmmword ptr [r15 + 0x30], xmm0
0x100222db8: vmovaps xmmword ptr [r15 + 0x40], xmm1
0x100222dbe: vmovaps xmmword ptr [r15 + 0x50], xmm2
0x100222dc4: vmovaps xmmword ptr [r15 + 0x60], xmm3
0x100222dca: vmovaps xmmword ptr [r15 + 0x70], xmm4
0x100222dd0: mov edx, dword ptr [r12 + 0x20]
0x100222dd5: nop word ptr cs:[rax + rax]
0x100222de0: mov rsi, rax
0x100222de3: sub rax, -0x80
0x100222de7: cmp edx, dword ptr [rsi + 0x20]
0x100222dea: jae 0x100222de0
0x100222dec: lea rbx, [rax - 0x80]
0x100222df0: cmp edx, dword ptr [r15 - 0x60]
0x100222df4: lea r15, [r15 - 0x80]
0x100222df8: jb 0x100222df0
0x100222dfa: cmp rbx, r15
0x100222dfd: jb 0x100222d30
0x100222e03: jmp 0x1002228a0 ; 0x1002228a0
0x100222e08: mov r14, r15
0x100222e0b: test r13b, r13b
0x100222e0e: je 0x100222870
0x100222e14: jmp 0x10022307b ; 0x10022307b
0x100222e19: lea rcx, [rip + 0x5e4] ; 0x100223404
0x100222e20: movsxd rax, dword ptr [rcx + rax*4]
0x100222e24: add rax, rcx
0x100222e27: mov rbx, qword ptr [rbp - 0x68]
0x100222e2b: jmp rax
0x100222e2d: mov eax, dword ptr [r14 - 0x60]
0x100222e31: cmp eax, dword ptr [r12 + 0x20]
0x100222e36: jae 0x10022307b
0x100222e3c: mov eax, dword ptr [r12 + 0x20]
0x100222e41: mov dword ptr [rbp - 0x40], eax
0x100222e44: vmovups ymm0, ymmword ptr [r12]
0x100222e4a: vmovups ymmword ptr [rbp - 0x60], ymm0
0x100222e4f: vmovaps xmm0, xmmword ptr [r12 + 0x30]
0x100222e56: vmovaps xmm1, xmmword ptr [r12 + 0x40]
0x100222e5d: vmovaps xmm2, xmmword ptr [r12 + 0x50]
0x100222e64: vmovaps xmm3, xmmword ptr [r12 + 0x60]
0x100222e6b: vmovaps xmm4, xmmword ptr [r12 + 0x70]
0x100222e72: mov eax, dword ptr [rbx + 0x20]
0x100222e75: mov dword ptr [r12 + 0x20], eax
0x100222e7a: vmovups ymm5, ymmword ptr [rbx]
0x100222e7e: vmovups ymmword ptr [r12], ymm5
0x100222e84: vmovaps xmm5, xmmword ptr [r14 - 0x50]
0x100222e8a: vmovaps xmmword ptr [r12 + 0x30], xmm5
0x100222e91: vmovaps xmm5, xmmword ptr [r14 - 0x40]
0x100222e97: vmovaps xmmword ptr [r12 + 0x40], xmm5
0x100222e9e: vmovaps xmm5, xmmword ptr [r14 - 0x30]
0x100222ea4: vmovaps xmmword ptr [r12 + 0x50], xmm5
0x100222eab: vmovaps xmm5, xmmword ptr [r14 - 0x20]
0x100222eb1: vmovaps xmmword ptr [r12 + 0x60], xmm5
0x100222eb8: vmovaps xmm5, xmmword ptr [r14 - 0x10]
0x100222ebe: vmovaps xmmword ptr [r12 + 0x70], xmm5
0x100222ec5: mov eax, dword ptr [rbp - 0x40]
0x100222ec8: mov dword ptr [rbx + 0x20], eax
0x100222ecb: vmovups ymm5, ymmword ptr [rbp - 0x60]
0x100222ed0: vmovups ymmword ptr [rbx], ymm5
0x100222ed4: vmovaps xmmword ptr [r14 - 0x50], xmm0
0x100222eda: vmovaps xmmword ptr [r14 - 0x40], xmm1
0x100222ee0: vmovaps xmmword ptr [r14 - 0x30], xmm2
0x100222ee6: vmovaps xmmword ptr [r14 - 0x20], xmm3
0x100222eec: vmovaps xmmword ptr [r14 - 0x10], xmm4
0x100222ef2: jmp 0x10022307b ; 0x10022307b
0x100222ef7: lea rbx, [r12 + 0x100]
0x100222eff: mov rsi, r12
0x100222f02: sub rsi, -0x80
0x100222f06: mov rdi, r12
0x100222f09: mov rdx, rbx
0x100222f0c: vzeroupper 
0x100222f0f: call 0x100223420 ; 0x100223420
0x100222f14: lea rcx, [r12 + 0x180]
0x100222f1c: cmp rcx, r14
0x100222f1f: je 0x10022307b
0x100222f25: xor eax, eax
0x100222f27: nop word ptr [rax + rax]
0x100222f30: mov rdx, rbx
0x100222f33: mov rbx, rcx
0x100222f36: mov ecx, dword ptr [rbx + 0x20]
0x100222f39: cmp ecx, dword ptr [rdx + 0x20]
0x100222f3c: jae 0x100223067
0x100222f42: vmovups ymm0, ymmword ptr [rbx]
0x100222f46: vmovups ymmword ptr [rbp - 0x60], ymm0
0x100222f4b: vmovaps xmm0, xmmword ptr [rbx + 0x30]
0x100222f50: vmovaps xmm1, xmmword ptr [rbx + 0x40]
0x100222f55: vmovaps xmm2, xmmword ptr [rbx + 0x50]
0x100222f5a: vmovaps xmm3, xmmword ptr [rbx + 0x60]
0x100222f5f: vmovaps xmm4, xmmword ptr [rbx + 0x70]
0x100222f64: mov rsi, rax
0x100222f67: nop word ptr [rax + rax]
0x100222f70: mov rdx, rsi
0x100222f73: mov esi, dword ptr [r12 + rdx + 0x120]
0x100222f7b: mov dword ptr [r12 + rdx + 0x1a0], esi
0x100222f83: vmovups ymm5, ymmword ptr [r12 + rdx + 0x100]
0x100222f8d: vmovups ymmword ptr [r12 + rdx + 0x180], ymm5
0x100222f97: vmovaps xmm5, xmmword ptr [r12 + rdx + 0x130]
0x100222fa1: vmovaps xmmword ptr [r12 + rdx + 0x1b0], xmm5
0x100222fab: vmovaps xmm5, xmmword ptr [r12 + rdx + 0x140]
0x100222fb5: vmovaps xmmword ptr [r12 + rdx + 0x1c0], xmm5
0x100222fbf: vmovaps xmm5, xmmword ptr [r12 + rdx + 0x150]
0x100222fc9: vmovaps xmmword ptr [r12 + rdx + 0x1d0], xmm5
0x100222fd3: vmovaps xmm5, xmmword ptr [r12 + rdx + 0x160]
0x100222fdd: vmovaps xmmword ptr [r12 + rdx + 0x1e0], xmm5
0x100222fe7: vmovaps xmm5, xmmword ptr [r12 + rdx + 0x170]
0x100222ff1: vmovaps xmmword ptr [r12 + rdx + 0x1f0], xmm5
0x100222ffb: cmp rdx, -0x100
0x100223002: je 0x100223020
0x100223004: lea rsi, [rdx - 0x80]
0x100223008: cmp ecx, dword ptr [r12 + rdx + 0xa0]
0x100223010: jb 0x100222f70
0x100223016: lea rsi, [r12 + rsi + 0x180]
0x10022301e: jmp 0x100223023 ; 0x100223023
0x100223020: mov rsi, r12
0x100223023: vmovups ymm5, ymmword ptr [rbp - 0x60]
0x100223028: vmovups ymmword ptr [r12 + rdx + 0x100], ymm5
0x100223032: mov dword ptr [rsi + 0x20], ecx
0x100223035: vmovaps xmmword ptr [r12 + rdx + 0x130], xmm0
0x10022303f: vmovaps xmmword ptr [r12 + rdx + 0x140], xmm1
0x100223049: vmovaps xmmword ptr [r12 + rdx + 0x150], xmm2
0x100223053: vmovaps xmmword ptr [r12 + rdx + 0x160], xmm3
0x10022305d: vmovaps xmmword ptr [r12 + rdx + 0x170], xmm4
0x100223067: mov rcx, rbx
0x10022306a: sub rcx, -0x80
0x10022306e: sub rax, -0x80
0x100223072: cmp rcx, r14
0x100223075: jne 0x100222f30
0x10022307b: mov rax, qword ptr [rip + 0x9ea856] ; 0x100c0d8d8
0x100223082: mov rax, qword ptr [rax]
0x100223085: cmp rax, qword ptr [rbp - 0x30]
0x100223089: jne 0x1002233fb
0x10022308f: add rsp, 0x48
0x100223093: pop rbx
0x100223094: pop r12
0x100223096: pop r13
0x100223098: pop r14
0x10022309a: pop r15
0x10022309c: pop rbp
0x10022309d: vzeroupper 
0x1002230a0: ret 
0x1002230a1: mov rax, qword ptr [rip + 0x9ea830] ; 0x100c0d8d8
0x1002230a8: mov rax, qword ptr [rax]
0x1002230ab: cmp rax, qword ptr [rbp - 0x30]
0x1002230af: jne 0x1002233fb
0x1002230b5: mov rsi, r12
0x1002230b8: sub rsi, -0x80
0x1002230bc: mov rdi, r12
0x1002230bf: mov rdx, rbx
0x1002230c2: add rsp, 0x48
0x1002230c6: pop rbx
0x1002230c7: pop r12
0x1002230c9: pop r13
0x1002230cb: pop r14
0x1002230cd: pop r15
0x1002230cf: pop rbp
0x1002230d0: vzeroupper 
0x1002230d3: jmp 0x100223420 ; 0x100223420
0x1002230d8: mov r13, r12
0x1002230db: sub r13, -0x80
0x1002230df: lea r15, [r12 + 0x100]
0x1002230e7: mov rdi, r12
0x1002230ea: mov rsi, r13
0x1002230ed: mov rdx, r15
0x1002230f0: vzeroupper 
0x1002230f3: call 0x100223420 ; 0x100223420
0x1002230f8: mov eax, dword ptr [r14 - 0x60]
0x1002230fc: cmp eax, dword ptr [r12 + 0x120]
0x100223104: jae 0x10022307b
0x10022310a: mov eax, dword ptr [r15 + 0x20]
0x10022310e: mov dword ptr [rbp - 0x40], eax
0x100223111: vmovups ymm0, ymmword ptr [r15]
0x100223116: vmovups ymmword ptr [rbp - 0x60], ymm0
0x10022311b: vmovaps xmm0, xmmword ptr [r12 + 0x130]
0x100223125: vmovaps xmm1, xmmword ptr [r12 + 0x140]
0x10022312f: vmovaps xmm2, xmmword ptr [r12 + 0x150]
0x100223139: vmovaps xmm3, xmmword ptr [r12 + 0x160]
0x100223143: vmovaps xmm4, xmmword ptr [r12 + 0x170]
0x10022314d: mov eax, dword ptr [rbx + 0x20]
0x100223150: mov dword ptr [r15 + 0x20], eax
0x100223154: vmovups ymm5, ymmword ptr [rbx]
0x100223158: vmovups ymmword ptr [r15], ymm5
0x10022315d: vmovaps xmm5, xmmword ptr [r14 - 0x50]
0x100223163: vmovaps xmmword ptr [r12 + 0x130], xmm5
0x10022316d: vmovaps xmm5, xmmword ptr [r14 - 0x40]
0x100223173: vmovaps xmmword ptr [r12 + 0x140], xmm5
0x10022317d: vmovaps xmm5, xmmword ptr [r14 - 0x30]
0x100223183: vmovaps xmmword ptr [r12 + 0x150], xmm5
0x10022318d: vmovaps xmm5, xmmword ptr [r14 - 0x20]
0x100223193: vmovaps xmmword ptr [r12 + 0x160], xmm5
0x10022319d: vmovaps xmm5, xmmword ptr [r14 - 0x10]
0x1002231a3: vmovaps xmmword ptr [r12 + 0x170], xmm5
0x1002231ad: mov eax, dword ptr [rbp - 0x40]
0x1002231b0: mov dword ptr [rbx + 0x20], eax
0x1002231b3: vmovups ymm5, ymmword ptr [rbp - 0x60]
0x1002231b8: vmovups ymmword ptr [rbx], ymm5
0x1002231bc: vmovaps xmmword ptr [r14 - 0x50], xmm0
0x1002231c2: vmovaps xmmword ptr [r14 - 0x40], xmm1
0x1002231c8: vmovaps xmmword ptr [r14 - 0x30], xmm2
0x1002231ce: vmovaps xmmword ptr [r14 - 0x20], xmm3
0x1002231d4: vmovaps xmmword ptr [r14 - 0x10], xmm4
0x1002231da: mov eax, dword ptr [r12 + 0x120]
0x1002231e2: cmp eax, dword ptr [r12 + 0xa0]
0x1002231ea: jae 0x10022307b
0x1002231f0: mov eax, dword ptr [r13 + 0x20]
0x1002231f4: mov dword ptr [rbp - 0x40], eax
0x1002231f7: vmovups ymm0, ymmword ptr [r13]
0x1002231fd: vmovups ymmword ptr [rbp - 0x60], ymm0
0x100223202: vmovaps xmm5, xmmword ptr [r12 + 0xb0]
0x10022320c: vmovaps xmm6, xmmword ptr [r12 + 0xc0]
0x100223216: vmovaps xmm7, xmmword ptr [r12 + 0xd0]
0x100223220: vmovaps xmm0, xmmword ptr [r12 + 0xe0]
0x10022322a: vmovaps xmm1, xmmword ptr [r12 + 0xf0]
0x100223234: mov eax, dword ptr [r15 + 0x20]
0x100223238: mov dword ptr [r13 + 0x20], eax
0x10022323c: vmovups ymm2, ymmword ptr [r15]
0x100223241: vmovups ymmword ptr [r13], ymm2
0x100223247: vmovaps xmm8, xmmword ptr [r12 + 0x130]
0x100223251: vmovaps xmm9, xmmword ptr [r12 + 0x140]
0x10022325b: vmovaps xmm2, xmmword ptr [r12 + 0x150]
0x100223265: vmovaps xmm3, xmmword ptr [r12 + 0x160]
0x10022326f: vmovaps xmmword ptr [r12 + 0xb0], xmm8
0x100223279: vmovaps xmmword ptr [r12 + 0xc0], xmm9
0x100223283: vmovaps xmmword ptr [r12 + 0xd0], xmm2
0x10022328d: vmovaps xmmword ptr [r12 + 0xe0], xmm3
0x100223297: vmovaps xmm4, xmmword ptr [r12 + 0x170]
0x1002232a1: vmovaps xmmword ptr [r12 + 0xf0], xmm4
0x1002232ab: mov eax, dword ptr [rbp - 0x40]
0x1002232ae: mov dword ptr [r15 + 0x20], eax
0x1002232b2: vmovups ymm10, ymmword ptr [rbp - 0x60]
0x1002232b7: vmovups ymmword ptr [r15], ymm10
0x1002232bc: vmovaps xmmword ptr [r12 + 0x130], xmm5
0x1002232c6: vmovaps xmmword ptr [r12 + 0x140], xmm6
0x1002232d0: vmovaps xmmword ptr [r12 + 0x150], xmm7
0x1002232da: vmovaps xmmword ptr [r12 + 0x160], xmm0
0x1002232e4: vmovaps xmmword ptr [r12 + 0x170], xmm1
0x1002232ee: mov eax, dword ptr [r12 + 0xa0]
0x1002232f6: cmp eax, dword ptr [r12 + 0x20]
0x1002232fb: jae 0x10022307b
0x100223301: mov eax, dword ptr [r12 + 0x20]
0x100223306: mov dword ptr [rbp - 0x40], eax
0x100223309: vmovups ymm0, ymmword ptr [r12]
0x10022330f: vmovups ymmword ptr [rbp - 0x60], ymm0
0x100223314: vmovaps xmm0, xmmword ptr [r12 + 0x30]
0x10022331b: vmovaps xmm1, xmmword ptr [r12 + 0x40]
0x100223322: vmovaps xmm5, xmmword ptr [r12 + 0x50]
0x100223329: vmovaps xmm6, xmmword ptr [r12 + 0x60]
0x100223330: vmovaps xmm7, xmmword ptr [r12 + 0x70]
0x100223337: vmovups ymm10, ymmword ptr [r13]
0x10022333d: vmovups ymmword ptr [r12], ymm10
0x100223343: mov eax, dword ptr [r13 + 0x20]
0x100223347: mov dword ptr [r12 + 0x20], eax
0x10022334c: vmovaps xmmword ptr [r12 + 0x30], xmm8
0x100223353: vmovaps xmmword ptr [r12 + 0x40], xmm9
0x10022335a: vmovaps xmmword ptr [r12 + 0x50], xmm2
0x100223361: vmovaps xmmword ptr [r12 + 0x60], xmm3
0x100223368: vmovaps xmmword ptr [r12 + 0x70], xmm4
0x10022336f: mov eax, dword ptr [rbp - 0x40]
0x100223372: mov dword ptr [r13 + 0x20], eax
0x100223376: vmovups ymm2, ymmword ptr [rbp - 0x60]
0x10022337b: vmovups ymmword ptr [r13], ymm2
0x100223381: vmovaps xmmword ptr [r12 + 0xb0], xmm0
0x10022338b: vmovaps xmmword ptr [r12 + 0xc0], xmm1
0x100223395: vmovaps xmmword ptr [r12 + 0xd0], xmm5
0x10022339f: vmovaps xmmword ptr [r12 + 0xe0], xmm6
0x1002233a9: vmovaps xmmword ptr [r12 + 0xf0], xmm7
0x1002233b3: jmp 0x10022307b ; 0x10022307b
0x1002233b8: mov rax, qword ptr [rip + 0x9ea519] ; 0x100c0d8d8
0x1002233bf: mov rax, qword ptr [rax]
0x1002233c2: cmp rax, qword ptr [rbp - 0x30]
0x1002233c6: jne 0x1002233fb
0x1002233c8: mov rsi, r12
0x1002233cb: sub rsi, -0x80
0x1002233cf: lea rcx, [r12 + 0x180]
0x1002233d7: lea rdx, [r12 + 0x100]
0x1002233df: mov rdi, r12
0x1002233e2: mov r8, rbx
0x1002233e5: add rsp, 0x48
0x1002233e9: pop rbx
0x1002233ea: pop r12
0x1002233ec: pop r13
0x1002233ee: pop r14
0x1002233f0: pop r15
0x1002233f2: pop rbp
0x1002233f3: vzeroupper 
0x1002233f6: jmp 0x100223740 ; 0x100223740
0x1002233fb: vzeroupper 
0x1002233fe: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100223403: nop 
0x100223404: ja 0x100223402
