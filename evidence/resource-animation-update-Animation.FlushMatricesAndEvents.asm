0x10009a980: push rbp
0x10009a981: mov rbp, rsp
0x10009a984: push r15
0x10009a986: push r14
0x10009a988: push r13
0x10009a98a: push r12
0x10009a98c: push rbx
0x10009a98d: sub rsp, 0x88
0x10009a994: vmovss dword ptr [rbp - 0x2c], xmm0
0x10009a999: mov r14, rdi
0x10009a99c: test sil, sil
0x10009a99f: jne 0x10009aa8d
0x10009a9a5: mov rsi, qword ptr [r14 + 0x5838]
0x10009a9ac: lea rdi, [rbp - 0x70]
0x10009a9b0: call 0x1007f26e0 ; 0x1007f26e0
0x10009a9b5: mov rax, qword ptr [r14 + 0x5840]
0x10009a9bc: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x10009a9c1: vmovaps xmmword ptr [rax], xmm0
0x10009a9c5: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x10009a9ca: vmovaps xmmword ptr [rax + 0x10], xmm0
0x10009a9cf: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x10009a9d4: vmovaps xmmword ptr [rax + 0x20], xmm0
0x10009a9d9: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10009a9de: vmovaps xmmword ptr [rax + 0x30], xmm0
0x10009a9e3: mov rax, qword ptr [r14 + 0x6018]
0x10009a9ea: cmp dword ptr [rax + 0x54], 0
0x10009a9ee: jle 0x10009aa8d
0x10009a9f4: xor ebx, ebx
0x10009a9f6: mov r13d, 0xf0
0x10009a9fc: lea r12, [rbp - 0xb0]
0x10009aa03: xor r15d, r15d
0x10009aa06: nop word ptr cs:[rax + rax]
0x10009aa10: inc r15
0x10009aa13: mov rsi, qword ptr [r14 + 0x5838]
0x10009aa1a: add rsi, r13
0x10009aa1d: mov rdi, r12
0x10009aa20: call 0x1007f26e0 ; 0x1007f26e0
0x10009aa25: mov rax, qword ptr [r14 + 0x6018]
0x10009aa2c: mov rdx, qword ptr [rax + 0x68]
0x10009aa30: add rdx, rbx
0x10009aa33: lea rdi, [rbp - 0x70]
0x10009aa37: mov rsi, r12
0x10009aa3a: call 0x100076df0 ; 0x100076df0
0x10009aa3f: mov rax, qword ptr [r14 + 0x5840]
0x10009aa46: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x10009aa4b: vmovaps xmmword ptr [rax + rbx + 0x40], xmm0
0x10009aa51: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x10009aa56: vmovaps xmmword ptr [rax + rbx + 0x50], xmm0
0x10009aa5c: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x10009aa61: vmovaps xmmword ptr [rax + rbx + 0x60], xmm0
0x10009aa67: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10009aa6c: vmovaps xmmword ptr [rax + rbx + 0x70], xmm0
0x10009aa72: mov rax, qword ptr [r14 + 0x6018]
0x10009aa79: movsxd rax, dword ptr [rax + 0x54]
0x10009aa7d: add rbx, 0x40
0x10009aa81: add r13, 0xf0
0x10009aa88: cmp r15, rax
0x10009aa8b: jl 0x10009aa10
0x10009aa8d: mov dword ptr [r14 + 0x5860], 0
0x10009aa98: mov eax, dword ptr [r14 + 0xc]
0x10009aa9c: test eax, eax
0x10009aa9e: jle 0x10009aaef
0x10009aaa0: lea rbx, [r14 + 0x4298]
0x10009aaa7: xor r15d, r15d
0x10009aaaa: vxorps xmm0, xmm0, xmm0
0x10009aaae: nop 
0x10009aab0: cmp dword ptr [rbx + 4], -1
0x10009aab4: je 0x10009aae0
0x10009aab6: cmp dword ptr [rbx + 8], -1
0x10009aaba: je 0x10009aae0
0x10009aabc: vucomiss xmm0, dword ptr [rbx + 0x54]
0x10009aac1: jb 0x10009aae0
0x10009aac3: mov edx, 1
0x10009aac8: mov rdi, r14
0x10009aacb: mov rsi, rbx
0x10009aace: call 0x10009b960 ; 0x10009b960
0x10009aad3: vxorps xmm0, xmm0, xmm0
0x10009aad7: mov eax, dword ptr [r14 + 0xc]
0x10009aadb: nop dword ptr [rax + rax]
0x10009aae0: inc r15
0x10009aae3: movsxd rcx, eax
0x10009aae6: add rbx, 0x70
0x10009aaea: cmp r15, rcx
0x10009aaed: jl 0x10009aab0
0x10009aaef: mov eax, dword ptr [r14 + 8]
0x10009aaf3: test eax, eax
0x10009aaf5: jle 0x10009ab5f
0x10009aaf7: lea rbx, [r14 + 0x4c]
0x10009aafb: xor r15d, r15d
0x10009aafe: vmovss xmm1, dword ptr [rip + 0xa0daaa] ; 0x100aa85b0
0x10009ab06: nop word ptr cs:[rax + rax]
0x10009ab10: cmp dword ptr [rbx - 0x30], -1
0x10009ab14: je 0x10009ab50
0x10009ab16: cmp dword ptr [rbx - 0x2c], -1
0x10009ab1a: je 0x10009ab50
0x10009ab1c: vmovss xmm0, dword ptr [rbx - 0x20]
0x10009ab21: vucomiss xmm0, xmm1
0x10009ab25: jb 0x10009ab50
0x10009ab27: cmp dword ptr [rbx], -1
0x10009ab2a: je 0x10009ab50
0x10009ab2c: lea rsi, [rbx - 0x34]
0x10009ab30: xor edx, edx
0x10009ab32: mov rdi, r14
0x10009ab35: call 0x10009b960 ; 0x10009b960
0x10009ab3a: vmovss xmm1, dword ptr [rip + 0xa0da6e] ; 0x100aa85b0
0x10009ab42: mov eax, dword ptr [r14 + 8]
0x10009ab46: nop word ptr cs:[rax + rax]
0x10009ab50: inc r15
0x10009ab53: movsxd rcx, eax
0x10009ab56: add rbx, 0x70
0x10009ab5a: cmp r15, rcx
0x10009ab5d: jl 0x10009ab10
0x10009ab5f: cmp dword ptr [r14 + 0x5a10], 0
0x10009ab67: jne 0x10009ab73
0x10009ab69: cmp dword ptr [r14 + 0x5860], 0
0x10009ab71: jle 0x10009ab84
0x10009ab73: lea rdi, [r14 + 0x5870]
0x10009ab7a: vmovss xmm0, dword ptr [rbp - 0x2c]
0x10009ab7f: call 0x1000e8030 ; 0x1000e8030
0x10009ab84: cmp dword ptr [r14 + 0x6000], 0
0x10009ab8c: je 0x10009ab9f
0x10009ab8e: lea rdi, [r14 + 0x5bd0]
0x10009ab95: vmovss xmm0, dword ptr [rbp - 0x2c]
0x10009ab9a: call 0x100092a70 ; 0x100092a70
0x10009ab9f: mov edi, dword ptr [r14 + 8]
0x10009aba3: xor eax, eax
0x10009aba5: mov edx, 0
0x10009abaa: test edi, edi
0x10009abac: jle 0x10009ac11
0x10009abae: lea rcx, [r14 + 0x78]
0x10009abb2: xor esi, esi
0x10009abb4: xor edx, edx
0x10009abb6: nop word ptr cs:[rax + rax]
0x10009abc0: cmp byte ptr [rcx], 0
0x10009abc3: je 0x10009ac02
0x10009abc5: movsxd rdx, edx
0x10009abc8: imul rdi, rdx, 0x70
0x10009abcc: vmovups ymm0, ymmword ptr [rcx - 0x60]
0x10009abd1: vmovups ymm1, ymmword ptr [rcx - 0x40]
0x10009abd6: vmovups ymm2, ymmword ptr [rcx - 0x20]
0x10009abdb: vmovups ymm3, ymmword ptr [rcx - 0x10]
0x10009abe0: vmovups ymmword ptr [r14 + rdi + 0x68], ymm3
0x10009abe7: vmovups ymmword ptr [r14 + rdi + 0x58], ymm2
0x10009abee: vmovups ymmword ptr [r14 + rdi + 0x38], ymm1
0x10009abf5: vmovups ymmword ptr [r14 + rdi + 0x18], ymm0
0x10009abfc: inc edx
0x10009abfe: mov edi, dword ptr [r14 + 8]
0x10009ac02: inc rsi
0x10009ac05: movsxd rbx, edi
0x10009ac08: add rcx, 0x70
0x10009ac0c: cmp rsi, rbx
0x10009ac0f: jl 0x10009abc0
0x10009ac11: mov dword ptr [r14 + 8], edx
0x10009ac15: mov esi, dword ptr [r14 + 0xc]
0x10009ac19: test esi, esi
0x10009ac1b: jle 0x10009ac8c
0x10009ac1d: lea rcx, [r14 + 0x4298]
0x10009ac24: xor edx, edx
0x10009ac26: xor eax, eax
0x10009ac28: nop dword ptr [rax + rax]
0x10009ac30: cmp byte ptr [rcx + 0x60], 0
0x10009ac34: je 0x10009ac7d
0x10009ac36: cdqe 
0x10009ac38: imul rsi, rax, 0x70
0x10009ac3c: vmovups ymm0, ymmword ptr [rcx]
0x10009ac40: vmovups ymm1, ymmword ptr [rcx + 0x20]
0x10009ac45: vmovups ymm2, ymmword ptr [rcx + 0x40]
0x10009ac4a: vmovups ymm3, ymmword ptr [rcx + 0x50]
0x10009ac4f: vmovups ymmword ptr [r14 + rsi + 0x42e8], ymm3
0x10009ac59: vmovups ymmword ptr [r14 + rsi + 0x42d8], ymm2
0x10009ac63: vmovups ymmword ptr [r14 + rsi + 0x42b8], ymm1
0x10009ac6d: vmovups ymmword ptr [r14 + rsi + 0x4298], ymm0
0x10009ac77: inc eax
0x10009ac79: mov esi, dword ptr [r14 + 0xc]
0x10009ac7d: inc rdx
0x10009ac80: movsxd rdi, esi
0x10009ac83: add rcx, 0x70
0x10009ac87: cmp rdx, rdi
0x10009ac8a: jl 0x10009ac30
0x10009ac8c: mov dword ptr [r14 + 0xc], eax
0x10009ac90: mov esi, dword ptr [r14 + 0x10]
0x10009ac94: test esi, esi
0x10009ac96: jle 0x10009ad0f
0x10009ac98: lea rax, [r14 + 0x4998]
0x10009ac9f: xor edx, edx
0x10009aca1: xor ecx, ecx
0x10009aca3: nop word ptr cs:[rax + rax]
0x10009acb0: cmp byte ptr [rax + 0x60], 0
0x10009acb4: je 0x10009acfe
0x10009acb6: movsxd rcx, ecx
0x10009acb9: imul rsi, rcx, 0x70
0x10009acbd: vmovups ymm0, ymmword ptr [rax]
0x10009acc1: vmovups ymm1, ymmword ptr [rax + 0x20]
0x10009acc6: vmovups ymm2, ymmword ptr [rax + 0x40]
0x10009accb: vmovups ymm3, ymmword ptr [rax + 0x50]
0x10009acd0: vmovups ymmword ptr [r14 + rsi + 0x49e8], ymm3
0x10009acda: vmovups ymmword ptr [r14 + rsi + 0x49d8], ymm2
0x10009ace4: vmovups ymmword ptr [r14 + rsi + 0x49b8], ymm1
0x10009acee: vmovups ymmword ptr [r14 + rsi + 0x4998], ymm0
0x10009acf8: inc ecx
0x10009acfa: mov esi, dword ptr [r14 + 0x10]
0x10009acfe: inc rdx
0x10009ad01: movsxd rdi, esi
0x10009ad04: add rax, 0x70
0x10009ad08: cmp rdx, rdi
0x10009ad0b: jl 0x10009acb0
0x10009ad0d: jmp 0x10009ad11 ; 0x10009ad11
0x10009ad0f: xor ecx, ecx
0x10009ad11: mov dword ptr [r14 + 0x10], ecx
0x10009ad15: vzeroupper 
0x10009ad18: call 0x1002acd30 ; 0x1002acd30
0x10009ad1d: test rax, rax
0x10009ad20: je 0x10009ad44
0x10009ad22: cmp byte ptr [rip + 0x1cd978f], 0 ; 0x101d744b8
0x10009ad29: je 0x10009ad33
0x10009ad2b: mov rdi, r14
0x10009ad2e: call 0x10009c000 ; 0x10009c000
0x10009ad33: cmp byte ptr [rip + 0x1cd97ee], 0 ; 0x101d74528
0x10009ad3a: je 0x10009ad44
0x10009ad3c: mov rdi, r14
0x10009ad3f: call 0x10009c3a0 ; 0x10009c3a0
0x10009ad44: add rsp, 0x88
0x10009ad4b: pop rbx
0x10009ad4c: pop r12
0x10009ad4e: pop r13
0x10009ad50: pop r14
0x10009ad52: pop r15
0x10009ad54: pop rbp
0x10009ad55: ret 
0x10009ad56: nop word ptr cs:[rax + rax]
