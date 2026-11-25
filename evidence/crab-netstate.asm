0x10025ead0: push rbp
0x10025ead1: mov rbp, rsp
0x10025ead4: push r15
0x10025ead6: push r14
0x10025ead8: push r12
0x10025eada: push rbx
0x10025eadb: sub rsp, 0x60
0x10025eadf: mov r14, rsi
0x10025eae2: mov rbx, rdi
0x10025eae5: mov rax, qword ptr [rip + 0x9aedec] ; 0x100c0d8d8
0x10025eaec: mov rax, qword ptr [rax]
0x10025eaef: mov qword ptr [rbp - 0x28], rax
0x10025eaf3: mov eax, dword ptr [rbx + 0x130]
0x10025eaf9: mov dword ptr [r14], eax
0x10025eafc: mov al, byte ptr [rbx + 0x594]
0x10025eb02: mov byte ptr [r14 + 4], al
0x10025eb06: mov rax, qword ptr [rbx + 0x150]
0x10025eb0d: mov qword ptr [rbp - 0x60], rax
0x10025eb11: vmovaps xmm0, xmmword ptr [rbx + 0x140]
0x10025eb19: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x10025eb1e: vmovaps xmm0, xmmword ptr [rbx + 0x160]
0x10025eb26: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x10025eb2b: mov eax, dword ptr [rbx + 0x170]
0x10025eb31: mov dword ptr [rbp - 0x40], eax
0x10025eb34: mov eax, dword ptr [rbp - 0x70]
0x10025eb37: mov byte ptr [r14 + 0xc], al
0x10025eb3b: cmp eax, 9
0x10025eb3e: jne 0x10025eb53
0x10025eb40: mov byte ptr [r14 + 0xd], 2
0x10025eb45: movzx eax, word ptr [rbp - 0x60]
0x10025eb49: mov word ptr [r14 + 0x14], ax
0x10025eb4e: jmp 0x10025ec53 ; 0x10025ec53
0x10025eb53: cmp qword ptr [rbp - 0x68], 0
0x10025eb58: je 0x10025ebc9
0x10025eb5a: lea r15, [rbp - 0x68]
0x10025eb5e: call 0x1007abc10 ; 0x1007abc10
0x10025eb63: mov qword ptr [rbp - 0x78], 0
0x10025eb6b: mov rdi, qword ptr [rip + 0x1b870ee] ; 0x101de5c60
0x10025eb72: mov r8, qword ptr [rdi]
0x10025eb75: lea rsi, [rbp - 0x78]
0x10025eb79: mov rdx, r15
0x10025eb7c: mov rcx, rax
0x10025eb7f: call qword ptr [r8 + 0x40]
0x10025eb83: cmp qword ptr [rbp - 0x78], 0
0x10025eb88: je 0x10025ebde
0x10025eb8a: mov byte ptr [r14 + 0xd], 1
0x10025eb8f: call 0x1007abc10 ; 0x1007abc10
0x10025eb94: mov qword ptr [rbp - 0x78], 0
0x10025eb9c: mov rdi, qword ptr [rip + 0x1b870bd] ; 0x101de5c60
0x10025eba3: mov r8, qword ptr [rdi]
0x10025eba6: lea rsi, [rbp - 0x78]
0x10025ebaa: mov rdx, r15
0x10025ebad: mov rcx, rax
0x10025ebb0: call qword ptr [r8 + 0x40]
0x10025ebb4: mov rax, qword ptr [rbp - 0x78]
0x10025ebb8: movzx eax, byte ptr [rax + 0x594]
0x10025ebbf: mov word ptr [r14 + 0x14], ax
0x10025ebc4: jmp 0x10025ec53 ; 0x10025ec53
0x10025ebc9: mov byte ptr [r14 + 0xd], 3
0x10025ebce: vsubps xmm0, xmm0, xmmword ptr [rbx + 0x120]
0x10025ebd6: vmovaps xmmword ptr [r14 + 0x20], xmm0
0x10025ebdc: jmp 0x10025ec53 ; 0x10025ec53
0x10025ebde: call 0x1007abc10 ; 0x1007abc10
0x10025ebe3: mov r12, rax
0x10025ebe6: mov qword ptr [rbp - 0x78], 0
0x10025ebee: call 0x1000f8400 ; 0x1000f8400
0x10025ebf3: mov r8, qword ptr [rax]
0x10025ebf6: lea rsi, [rbp - 0x78]
0x10025ebfa: mov rdi, rax
0x10025ebfd: mov rdx, r15
0x10025ec00: mov rcx, r12
0x10025ec03: call qword ptr [r8 + 0x40]
0x10025ec07: cmp qword ptr [rbp - 0x78], 0
0x10025ec0c: mov byte ptr [r14 + 0xd], 0
0x10025ec11: je 0x10025ec4c
0x10025ec13: call 0x1007abc10 ; 0x1007abc10
0x10025ec18: mov r12, rax
0x10025ec1b: mov qword ptr [rbp - 0x78], 0
0x10025ec23: call 0x1000f8400 ; 0x1000f8400
0x10025ec28: mov r8, qword ptr [rax]
0x10025ec2b: lea rsi, [rbp - 0x78]
0x10025ec2f: mov rdi, rax
0x10025ec32: mov rdx, r15
0x10025ec35: mov rcx, r12
0x10025ec38: call qword ptr [r8 + 0x40]
0x10025ec3c: mov rax, qword ptr [rbp - 0x78]
0x10025ec40: mov eax, dword ptr [rax + 0xe0]
0x10025ec46: mov dword ptr [r14 + 0x10], eax
0x10025ec4a: jmp 0x10025ec53 ; 0x10025ec53
0x10025ec4c: mov word ptr [r14 + 0x14], 0xffff
0x10025ec53: vmovups ymm0, ymmword ptr [rbx + 0x184]
0x10025ec5b: vmovups ymm1, ymmword ptr [rbx + 0x194]
0x10025ec63: vmovups ymmword ptr [r14 + 0x40], ymm1
0x10025ec69: vmovups ymmword ptr [r14 + 0x30], ymm0
0x10025ec6f: vmovaps xmm0, xmmword ptr [rbx + 0x10]
0x10025ec74: vaddps xmm0, xmm0, xmmword ptr [rbx + 0x50]
0x10025ec79: vmovaps xmmword ptr [r14 + 0x60], xmm0
0x10025ec7f: mov eax, dword ptr [rbx + 0x500]
0x10025ec85: cmp eax, dword ptr [rip + 0xacc725] ; 0x100d2b3b0
0x10025ec8b: setne byte ptr [r14 + 0x70]
0x10025ec90: mov dword ptr [r14 + 0x74], eax
0x10025ec94: mov rax, qword ptr [rip + 0x9aec3d] ; 0x100c0d8d8
0x10025ec9b: mov rax, qword ptr [rax]
0x10025ec9e: cmp rax, qword ptr [rbp - 0x28]
0x10025eca2: jne 0x10025ecb4
0x10025eca4: add rsp, 0x60
0x10025eca8: pop rbx
0x10025eca9: pop r12
0x10025ecab: pop r14
0x10025ecad: pop r15
0x10025ecaf: pop rbp
0x10025ecb0: vzeroupper 
0x10025ecb3: ret 
0x10025ecb4: vzeroupper 
0x10025ecb7: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10025ecbc: nop dword ptr [rax]
