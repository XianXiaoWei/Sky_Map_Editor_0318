0x10046ca30: push rbp
0x10046ca31: mov rbp, rsp
0x10046ca34: push r15
0x10046ca36: push r14
0x10046ca38: push r13
0x10046ca3a: push r12
0x10046ca3c: push rbx
0x10046ca3d: and rsp, 0xffffffffffffffe0
0x10046ca41: sub rsp, 0x240
0x10046ca48: mov qword ptr [rsp + 0xd8], r9
0x10046ca50: mov r12, r8
0x10046ca53: mov r13d, ecx
0x10046ca56: mov r14, rdx
0x10046ca59: mov r15, rsi
0x10046ca5c: mov rbx, rdi
0x10046ca5f: mov rax, qword ptr [rip + 0x7a0e72] ; 0x100c0d8d8
0x10046ca66: mov rax, qword ptr [rax]
0x10046ca69: mov qword ptr [rsp + 0x220], rax
0x10046ca71: cmp qword ptr [rbp + 0x10], 0
0x10046ca76: je 0x10046cc73
0x10046ca7c: vxorps ymm0, ymm0, ymm0
0x10046ca80: vmovaps ymmword ptr [rsp + 0x140], ymm0
0x10046ca89: vmovaps ymmword ptr [rsp + 0x120], ymm0
0x10046ca92: vmovaps ymmword ptr [rsp + 0x100], ymm0
0x10046ca9b: vmovaps ymmword ptr [rsp + 0xe0], ymm0
0x10046caa4: mov rdi, r15
0x10046caa7: vzeroupper 
0x10046caaa: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x10046caaf: inc eax
0x10046cab1: cmp eax, 0x41
0x10046cab4: jae 0x10046cc54
0x10046caba: lea rdi, [rsp + 0xe0]
0x10046cac2: mov rsi, r15
0x10046cac5: call 0x100aa2c5a ; 0x100aa2c5a _strcpy
0x10046caca: mov rdi, r14
0x10046cacd: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x10046cad2: inc eax
0x10046cad4: cmp eax, 0x41
0x10046cad7: jae 0x10046cc54
0x10046cadd: lea rdi, [rsp + 0x120]
0x10046cae5: mov rsi, r14
0x10046cae8: call 0x100aa2c5a ; 0x100aa2c5a _strcpy
0x10046caed: mov dword ptr [rsp + 0x160], r13d
0x10046caf5: mov dword ptr [rsp + 0x164], 1
0x10046cb00: mov qword ptr [rsp + 0x168], r12
0x10046cb08: mov rax, qword ptr [rsp + 0xd8]
0x10046cb10: mov qword ptr [rsp + 0x170], rax
0x10046cb18: vmovups ymm0, ymmword ptr [rsp + 0x158]
0x10046cb21: vmovups ymmword ptr [rsp + 0x1f8], ymm0
0x10046cb2a: vmovaps ymm0, ymmword ptr [rsp + 0xe0]
0x10046cb33: vmovaps ymm1, ymmword ptr [rsp + 0x100]
0x10046cb3c: vmovaps ymm2, ymmword ptr [rsp + 0x120]
0x10046cb45: vmovaps ymm3, ymmword ptr [rsp + 0x140]
0x10046cb4e: vmovaps ymmword ptr [rsp + 0x1e0], ymm3
0x10046cb57: vmovaps ymmword ptr [rsp + 0x1c0], ymm2
0x10046cb60: vmovaps ymmword ptr [rsp + 0x1a0], ymm1
0x10046cb69: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x10046cb72: mov eax, dword ptr [rbx + 0xf8010]
0x10046cb78: cmp rax, 0x400
0x10046cb7e: jae 0x10046cc92
0x10046cb84: lea ecx, [rax + 1]
0x10046cb87: mov dword ptr [rbx + 0xf8010], ecx
0x10046cb8d: imul rax, rax, 0x3e0
0x10046cb94: lea r14, [rbx + rax + 0x10]
0x10046cb99: mov rcx, qword ptr [rbx + 0xfd260]
0x10046cba0: mov rdx, qword ptr [rbx + 0xfd250]
0x10046cba7: mov r8, qword ptr [rbx + 0xfd258]
0x10046cbae: vmovaps xmm0, xmmword ptr [rbx + 0xfd270]
0x10046cbb6: vmovaps xmm1, xmmword ptr [rbx + 0xfd290]
0x10046cbbe: vmovups ymm2, ymmword ptr [rsp + 0x1f8]
0x10046cbc7: vmovups ymmword ptr [rsp + 0x78], ymm2
0x10046cbcd: vmovaps ymm2, ymmword ptr [rsp + 0x180]
0x10046cbd6: vmovaps ymm3, ymmword ptr [rsp + 0x1a0]
0x10046cbdf: vmovaps ymm4, ymmword ptr [rsp + 0x1c0]
0x10046cbe8: vmovaps ymm5, ymmword ptr [rsp + 0x1e0]
0x10046cbf1: vmovups ymmword ptr [rsp + 0x60], ymm5
0x10046cbf7: vmovups ymmword ptr [rsp + 0x40], ymm4
0x10046cbfd: vmovups ymmword ptr [rsp + 0x20], ymm3
0x10046cc03: vmovups ymmword ptr [rsp], ymm2
0x10046cc08: vmovups xmmword ptr [rsp + 0xb8], xmm1
0x10046cc11: vmovups xmmword ptr [rsp + 0x98], xmm0
0x10046cc1a: mov rdi, r14
0x10046cc1d: mov rsi, qword ptr [rbp + 0x10]
0x10046cc21: vzeroupper 
0x10046cc24: call 0x100467330 ; 0x100467330
0x10046cc29: mov rax, qword ptr [rip + 0x7a0ca8] ; 0x100c0d8d8
0x10046cc30: mov rax, qword ptr [rax]
0x10046cc33: cmp rax, qword ptr [rsp + 0x220]
0x10046cc3b: jne 0x10046cc4f
0x10046cc3d: mov rax, r14
0x10046cc40: lea rsp, [rbp - 0x28]
0x10046cc44: pop rbx
0x10046cc45: pop r12
0x10046cc47: pop r13
0x10046cc49: pop r14
0x10046cc4b: pop r15
0x10046cc4d: pop rbp
0x10046cc4e: ret 
0x10046cc4f: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10046cc54: lea rdi, [rip + 0x6f8201] ; 0x100b64e5c len + 1 <= N
0x10046cc5b: lea rsi, [rip + 0x6f8207] ; 0x100b64e69 ../../../Code/Base/FixedString.h
0x10046cc62: mov edx, 0x30
0x10046cc67: mov ecx, 3
0x10046cc6c: call 0x1007e5f70 ; 0x1007e5f70
0x10046cc71: ud2 
0x10046cc73: lea rdi, [rip + 0x71d447] ; 0x100b8a0c1 options
0x10046cc7a: lea rsi, [rip + 0x71cd10] ; 0x100b89991 Model.cpp
0x10046cc81: mov edx, 0x853
0x10046cc86: mov ecx, 3
0x10046cc8b: call 0x1007e5f70 ; 0x1007e5f70
0x10046cc90: ud2 
0x10046cc92: lea rdi, [rip + 0x71d430] ; 0x100b8a0c9 m_numModels < kMaxModels
0x10046cc99: lea rsi, [rip + 0x71ccf1] ; 0x100b89991 Model.cpp
0x10046cca0: mov edx, 0x886
0x10046cca5: mov ecx, 3
0x10046ccaa: vzeroupper 
0x10046ccad: call 0x1007e5f70 ; 0x1007e5f70
0x10046ccb2: ud2 
0x10046ccb4: nop word ptr cs:[rax + rax]
