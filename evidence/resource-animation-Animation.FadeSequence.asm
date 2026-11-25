0x100096d50: push rbp
0x100096d51: mov rbp, rsp
0x100096d54: push r15
0x100096d56: push r14
0x100096d58: push rbx
0x100096d59: sub rsp, 0x98
0x100096d60: mov r15d, esi
0x100096d63: mov r14, rdi
0x100096d66: mov rax, qword ptr [rip + 0xb76b6b] ; 0x100c0d8d8
0x100096d6d: mov rax, qword ptr [rax]
0x100096d70: mov qword ptr [rbp - 0x20], rax
0x100096d74: cmp r15d, 1
0x100096d78: jne 0x100096eb9
0x100096d7e: test dl, dl
0x100096d80: jne 0x100096eb9
0x100096d86: mov edx, dword ptr [r14 + 0xc]
0x100096d8a: test rdx, rdx
0x100096d8d: je 0x100096fcb
0x100096d93: mov ecx, edx
0x100096d95: and ecx, 1
0x100096d98: cmp edx, 1
0x100096d9b: jne 0x100096dfa
0x100096d9d: xor esi, esi
0x100096d9f: xor r8d, r8d
0x100096da2: test rcx, rcx
0x100096da5: je 0x100096e7e
0x100096dab: imul rcx, rsi, 0x70
0x100096daf: cmp dword ptr [r14 + rcx + 0x42a4], 0
0x100096db8: js 0x100096e7e
0x100096dbe: vmovss xmm2, dword ptr [r14 + rcx + 0x42ac]
0x100096dc8: vucomiss xmm2, dword ptr [rip + 0xa0fccc] ; 0x100aa6a9c
0x100096dd0: jbe 0x100096e7e
0x100096dd6: lea rcx, [r14 + rcx + 0x4298]
0x100096dde: mov edx, r8d
0x100096de1: inc r8d
0x100096de4: mov qword ptr [rbp + rdx*8 - 0xa0], rcx
0x100096dec: test r8d, r8d
0x100096def: jne 0x100096e83
0x100096df5: jmp 0x100096eab ; 0x100096eab
0x100096dfa: sub rdx, rcx
0x100096dfd: lea rdi, [r14 + 0x4298]
0x100096e04: xor esi, esi
0x100096e06: vmovss xmm3, dword ptr [rip + 0xa0fc8e] ; 0x100aa6a9c
0x100096e0e: xor r8d, r8d
0x100096e11: nop word ptr cs:[rax + rax]
0x100096e20: cmp dword ptr [rdi + 0xc], 0
0x100096e24: js 0x100096e3f
0x100096e26: vmovss xmm2, dword ptr [rdi + 0x14]
0x100096e2b: vucomiss xmm2, xmm3
0x100096e2f: jbe 0x100096e3f
0x100096e31: mov ebx, r8d
0x100096e34: inc r8d
0x100096e37: mov qword ptr [rbp + rbx*8 - 0xa0], rdi
0x100096e3f: cmp dword ptr [rdi + 0x7c], 0
0x100096e43: js 0x100096e65
0x100096e45: vmovss xmm2, dword ptr [rdi + 0x84]
0x100096e4d: vucomiss xmm2, xmm3
0x100096e51: jbe 0x100096e65
0x100096e53: lea rax, [rdi + 0x70]
0x100096e57: mov ebx, r8d
0x100096e5a: inc r8d
0x100096e5d: mov qword ptr [rbp + rbx*8 - 0xa0], rax
0x100096e65: add rsi, 2
0x100096e69: add rdi, 0xe0
0x100096e70: cmp rdx, rsi
0x100096e73: jne 0x100096e20
0x100096e75: test rcx, rcx
0x100096e78: jne 0x100096dab
0x100096e7e: test r8d, r8d
0x100096e81: je 0x100096eab
0x100096e83: mov edi, r8d
0x100096e86: lea rdx, [rdi - 1]
0x100096e8a: mov ecx, edi
0x100096e8c: and ecx, 3
0x100096e8f: cmp rdx, 3
0x100096e93: jae 0x100096f43
0x100096e99: xor esi, esi
0x100096e9b: xor edx, edx
0x100096e9d: test rcx, rcx
0x100096ea0: jne 0x100096f96
0x100096ea6: jmp 0x100096fc2 ; 0x100096fc2
0x100096eab: xor r8d, r8d
0x100096eae: xor edx, edx
0x100096eb0: cmp edx, r8d
0x100096eb3: je 0x100096fcb
0x100096eb9: mov edx, 1
0x100096ebe: mov rdi, r14
0x100096ec1: mov esi, r15d
0x100096ec4: vmovss dword ptr [rbp - 0xa8], xmm1
0x100096ecc: vmovss dword ptr [rbp - 0xa4], xmm0
0x100096ed4: call 0x100096b60 ; 0x100096b60
0x100096ed9: vmovss xmm2, dword ptr [rip + 0xa0e1df] ; 0x100aa50c0
0x100096ee1: vdivss xmm4, xmm2, dword ptr [rbp - 0xa4]
0x100096ee9: sub rsp, 8
0x100096eed: vmovss xmm5, dword ptr [rip + 0xa0fbb7] ; 0x100aa6aac
0x100096ef5: mov esi, 0
0x100096efa: mov edx, 0
0x100096eff: vxorps xmm0, xmm0, xmm0
0x100096f03: vxorps xmm1, xmm1, xmm1
0x100096f07: mov r8d, 0xffffffff
0x100096f0d: mov r9d, 1
0x100096f13: mov rdi, r14
0x100096f16: mov ecx, r15d
0x100096f19: vmovss xmm3, dword ptr [rbp - 0xa8]
0x100096f21: push -1
0x100096f23: push 0
0x100096f25: push 0
0x100096f27: push -1
0x100096f29: push -1
0x100096f2b: push 0
0x100096f2d: push 1
0x100096f2f: push 1
0x100096f31: push 0
0x100096f33: call 0x100095c70 ; 0x100095c70
0x100096f38: add rsp, 0x50
0x100096f3c: mov al, 1
0x100096f3e: jmp 0x100096fcd ; 0x100096fcd
0x100096f43: sub rdi, rcx
0x100096f46: xor esi, esi
0x100096f48: xor edx, edx
0x100096f4a: nop word ptr [rax + rax]
0x100096f50: mov rbx, qword ptr [rbp + rsi*8 - 0xa0]
0x100096f58: mov rax, qword ptr [rbp + rsi*8 - 0x98]
0x100096f60: movzx ebx, byte ptr [rbx + 0x62]
0x100096f64: add ebx, edx
0x100096f66: movzx eax, byte ptr [rax + 0x62]
0x100096f6a: add eax, ebx
0x100096f6c: mov rdx, qword ptr [rbp + rsi*8 - 0x90]
0x100096f74: movzx ebx, byte ptr [rdx + 0x62]
0x100096f78: add ebx, eax
0x100096f7a: mov rax, qword ptr [rbp + rsi*8 - 0x88]
0x100096f82: movzx edx, byte ptr [rax + 0x62]
0x100096f86: add edx, ebx
0x100096f88: add rsi, 4
0x100096f8c: cmp rdi, rsi
0x100096f8f: jne 0x100096f50
0x100096f91: test rcx, rcx
0x100096f94: je 0x100096fc2
0x100096f96: lea rsi, [rbp + rsi*8 - 0xa0]
0x100096f9e: neg rcx
0x100096fa1: nop word ptr cs:[rax + rax]
0x100096fb0: mov rdi, qword ptr [rsi]
0x100096fb3: movzx edi, byte ptr [rdi + 0x62]
0x100096fb7: add edx, edi
0x100096fb9: add rsi, 8
0x100096fbd: inc rcx
0x100096fc0: jne 0x100096fb0
0x100096fc2: cmp edx, r8d
0x100096fc5: jne 0x100096eb9
0x100096fcb: xor eax, eax
0x100096fcd: mov rcx, qword ptr [rip + 0xb76904] ; 0x100c0d8d8
0x100096fd4: mov rcx, qword ptr [rcx]
0x100096fd7: cmp rcx, qword ptr [rbp - 0x20]
0x100096fdb: jne 0x100096feb
0x100096fdd: add rsp, 0x98
0x100096fe4: pop rbx
0x100096fe5: pop r14
0x100096fe7: pop r15
0x100096fe9: pop rbp
0x100096fea: ret 
0x100096feb: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
