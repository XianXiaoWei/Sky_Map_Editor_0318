0x10027ae30: push rbp
0x10027ae31: mov rbp, rsp
0x10027ae34: push r15
0x10027ae36: push r14
0x10027ae38: push r13
0x10027ae3a: push r12
0x10027ae3c: push rbx
0x10027ae3d: sub rsp, 0x168
0x10027ae44: mov qword ptr [rbp - 0x58], r9
0x10027ae48: mov qword ptr [rbp - 0x50], rdi
0x10027ae4c: mov qword ptr [rbp - 0x88], rcx
0x10027ae53: mov eax, dword ptr [rcx]
0x10027ae55: mov dword ptr [rbp - 0x34], r8d
0x10027ae59: cmp eax, r8d
0x10027ae5c: jae 0x10027b0d9
0x10027ae62: mov ebx, dword ptr [rbp - 0x34]
0x10027ae65: xor r13d, r13d
0x10027ae68: mov qword ptr [rbp - 0x40], rdx
0x10027ae6c: mov qword ptr [rbp - 0x60], rbx
0x10027ae70: mov r12d, eax
0x10027ae73: vmovss xmm0, dword ptr [rip + 0x82ca3d] ; 0x100aa78b8
0x10027ae7b: vmovaps xmm1, xmm0
0x10027ae7f: nop 
0x10027ae80: vmovss dword ptr [rbp - 0x30], xmm1
0x10027ae85: mov rbx, qword ptr [rdx + r12*8]
0x10027ae89: mov rax, qword ptr [rsi]
0x10027ae8c: lea rdi, [rbp - 0x110]
0x10027ae93: mov r15, rsi
0x10027ae96: call qword ptr [rax + 0x18]
0x10027ae99: vmovaps xmm0, xmmword ptr [rbp - 0xe0]
0x10027aea1: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x10027aea6: mov rax, qword ptr [rbx]
0x10027aea9: lea r14, [rbp - 0x190]
0x10027aeb0: mov rdi, r14
0x10027aeb3: mov rsi, rbx
0x10027aeb6: call qword ptr [rax + 0x28]
0x10027aeb9: lea rdi, [rbp - 0x80]
0x10027aebd: mov rsi, r14
0x10027aec0: call 0x10078ce10 ; 0x10078ce10
0x10027aec5: vmovss dword ptr [rbp - 0x2c], xmm0
0x10027aeca: mov rax, qword ptr [rbx]
0x10027aecd: lea rdi, [rbp - 0xd0]
0x10027aed4: mov rsi, rbx
0x10027aed7: call qword ptr [rax + 0x18]
0x10027aeda: vmovaps xmm0, xmmword ptr [rbp - 0xa0]
0x10027aee2: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x10027aee7: mov rax, qword ptr [r15]
0x10027aeea: lea rbx, [rbp - 0x150]
0x10027aef1: mov rdi, rbx
0x10027aef4: mov rsi, r15
0x10027aef7: call qword ptr [rax + 0x28]
0x10027aefa: lea rdi, [rbp - 0x70]
0x10027aefe: mov rsi, rbx
0x10027af01: call 0x10078ce10 ; 0x10078ce10
0x10027af06: vmovss xmm1, dword ptr [rbp - 0x30]
0x10027af0b: mov rbx, qword ptr [rbp - 0x60]
0x10027af0f: mov rsi, r15
0x10027af12: mov rdx, qword ptr [rbp - 0x40]
0x10027af16: vmovss xmm2, dword ptr [rbp - 0x2c]
0x10027af1b: vminss xmm0, xmm2, xmm0
0x10027af1f: vucomiss xmm1, xmm0
0x10027af23: cmova r13d, r12d
0x10027af27: vminss xmm1, xmm0, xmm1
0x10027af2b: inc r12
0x10027af2e: cmp rbx, r12
0x10027af31: jne 0x10027ae80
0x10027af37: vucomiss xmm1, dword ptr [rip + 0x82c1a5] ; 0x100aa70e4
0x10027af3f: ja 0x10027b0d9
0x10027af45: mov r8d, r13d
0x10027af48: mov r12, qword ptr [rdx + r8*8]
0x10027af4c: cmp qword ptr [rbp - 0x50], 0
0x10027af51: je 0x10027b064
0x10027af57: mov qword ptr [rbp - 0x90], r8
0x10027af5e: vmovss dword ptr [rbp - 0x30], xmm1
0x10027af63: mov dword ptr [rbp - 0x44], r13d
0x10027af67: mov r13, qword ptr [rbp - 0x50]
0x10027af6b: vmovss xmm0, dword ptr [rip + 0x82c945] ; 0x100aa78b8
0x10027af73: vmovaps xmm1, xmm0
0x10027af77: nop word ptr [rax + rax]
0x10027af80: vmovss dword ptr [rbp - 0x2c], xmm1
0x10027af85: mov rax, qword ptr [r13]
0x10027af89: lea rdi, [rbp - 0x110]
0x10027af90: mov rsi, r13
0x10027af93: call qword ptr [rax + 0x18]
0x10027af96: vmovaps xmm0, xmmword ptr [rbp - 0xe0]
0x10027af9e: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x10027afa3: mov rax, qword ptr [r12]
0x10027afa7: lea rbx, [rbp - 0x190]
0x10027afae: mov rdi, rbx
0x10027afb1: mov rsi, r12
0x10027afb4: call qword ptr [rax + 0x28]
0x10027afb7: lea rdi, [rbp - 0x80]
0x10027afbb: mov rsi, rbx
0x10027afbe: call 0x10078ce10 ; 0x10078ce10
0x10027afc3: vmovss dword ptr [rbp - 0x48], xmm0
0x10027afc8: mov rax, qword ptr [r12]
0x10027afcc: lea rdi, [rbp - 0xd0]
0x10027afd3: mov rsi, r12
0x10027afd6: call qword ptr [rax + 0x18]
0x10027afd9: vmovaps xmm0, xmmword ptr [rbp - 0xa0]
0x10027afe1: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x10027afe6: mov rax, qword ptr [r13]
0x10027afea: lea r14, [rbp - 0x150]
0x10027aff1: mov rdi, r14
0x10027aff4: mov rsi, r13
0x10027aff7: call qword ptr [rax + 0x28]
0x10027affa: lea rdi, [rbp - 0x70]
0x10027affe: mov rsi, r14
0x10027b001: call 0x10078ce10 ; 0x10078ce10
0x10027b006: vmovss xmm1, dword ptr [rbp - 0x2c]
0x10027b00b: vmovss xmm2, dword ptr [rbp - 0x48]
0x10027b010: vminss xmm0, xmm2, xmm0
0x10027b014: vminss xmm1, xmm0, xmm1
0x10027b018: mov eax, dword ptr [r13 + 0xe0]
0x10027b01f: imul rcx, rax, 0x1a0
0x10027b026: mov rdx, qword ptr [rbp - 0x58]
0x10027b02a: cmp dword ptr [rdx + 0x1b220], eax
0x10027b030: lea r13, [rdx + rcx + 0x1220]
0x10027b038: ja 0x10027af80
0x10027b03e: vmovss xmm0, dword ptr [rbp - 0x30]
0x10027b043: vucomiss xmm0, xmm1
0x10027b047: mov rdx, qword ptr [rbp - 0x40]
0x10027b04b: mov rsi, r15
0x10027b04e: mov r13d, dword ptr [rbp - 0x44]
0x10027b052: ja 0x10027b0d9
0x10027b058: test rsi, rsi
0x10027b05b: mov r8, qword ptr [rbp - 0x90]
0x10027b062: je 0x10027b06f
0x10027b064: mov eax, dword ptr [rsi + 0x20]
0x10027b067: mov dword ptr [r12 + 0xe0], eax
0x10027b06f: mov eax, dword ptr [rsi + 0x104]
0x10027b075: cmp rax, 8
0x10027b079: jae 0x10027b0eb
0x10027b07b: mov ecx, dword ptr [r12 + 0x20]
0x10027b080: lea edi, [rax + 1]
0x10027b083: mov dword ptr [rsi + 0x104], edi
0x10027b089: mov dword ptr [rsi + rax*4 + 0xe4], ecx
0x10027b090: mov rbx, qword ptr [rbp - 0x88]
0x10027b097: mov eax, dword ptr [rbx]
0x10027b099: mov rcx, qword ptr [rdx + rax*8]
0x10027b09d: mov rdi, qword ptr [rdx + r8*8]
0x10027b0a1: mov qword ptr [rdx + rax*8], rdi
0x10027b0a5: mov qword ptr [rdx + r8*8], rcx
0x10027b0a9: lea eax, [rax + 1]
0x10027b0ac: mov dword ptr [rbx], eax
0x10027b0ae: mov rdi, rsi
0x10027b0b1: mov rsi, r12
0x10027b0b4: mov rcx, rbx
0x10027b0b7: mov r8d, dword ptr [rbp - 0x34]
0x10027b0bb: mov r9, qword ptr [rbp - 0x58]
0x10027b0bf: call 0x10027ae30 ; 0x10027ae30
0x10027b0c4: mov rsi, r15
0x10027b0c7: mov rdx, qword ptr [rbp - 0x40]
0x10027b0cb: mov eax, dword ptr [rbx]
0x10027b0cd: mov rbx, qword ptr [rbp - 0x60]
0x10027b0d1: cmp eax, ebx
0x10027b0d3: jb 0x10027ae70
0x10027b0d9: add rsp, 0x168
0x10027b0e0: pop rbx
0x10027b0e1: pop r12
0x10027b0e3: pop r13
0x10027b0e5: pop r14
0x10027b0e7: pop r15
0x10027b0e9: pop rbp
0x10027b0ea: ret 
0x10027b0eb: lea rdi, [rip + 0x90207e] ; 0x100b7d170 m_childCount < kMaxChildCount
0x10027b0f2: lea rsi, [rip + 0x901e3d] ; 0x100b7cf36 Darkstone.cpp
0x10027b0f9: lea r8, [rip + 0x90208e] ; 0x100b7d18e Darkstone has more children than supported
0x10027b100: mov edx, 0x4f7
0x10027b105: mov ecx, 4
0x10027b10a: xor eax, eax
0x10027b10c: call 0x1007e6030 ; 0x1007e6030
0x10027b111: ud2 
0x10027b113: nop word ptr cs:[rax + rax]
