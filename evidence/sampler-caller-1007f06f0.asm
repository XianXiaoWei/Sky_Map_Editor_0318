0x1007f06f0: push rbp
0x1007f06f1: mov rbp, rsp
0x1007f06f4: push r15
0x1007f06f6: push r14
0x1007f06f8: push r13
0x1007f06fa: push r12
0x1007f06fc: push rbx
0x1007f06fd: sub rsp, 0x28
0x1007f0701: mov r15d, r9d
0x1007f0704: mov r13d, r8d
0x1007f0707: mov r14d, ecx
0x1007f070a: mov r12d, edx
0x1007f070d: mov rbx, rdi
0x1007f0710: lea rdi, [rbx + 0x50]
0x1007f0714: mov edx, 0x1b
0x1007f0719: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1007f071e: mov dword ptr [rbx + 0x10], r12d
0x1007f0722: mov dword ptr [rbx + 0x14], r14d
0x1007f0726: cmp r13d, 1
0x1007f072a: mov eax, 1
0x1007f072f: cmova eax, r13d
0x1007f0733: mov dword ptr [rbx + 0x18], eax
0x1007f0736: mov byte ptr [rbx + 0x2c], 1
0x1007f073a: test r12d, r12d
0x1007f073d: je 0x1007f0807
0x1007f0743: test r14d, r14d
0x1007f0746: je 0x1007f0807
0x1007f074c: test eax, eax
0x1007f074e: je 0x1007f0807
0x1007f0754: cmp byte ptr [rip + 0x1858cfd], 0 ; 0x102049458
0x1007f075b: jne 0x1007f07c6
0x1007f075d: mov byte ptr [rip + 0x1858cf4], 1 ; 0x102049458
0x1007f0764: movabs rax, 0x3e8fffffc18
0x1007f076e: mov qword ptr [rbp - 0x38], rax
0x1007f0772: mov dword ptr [rbp - 0x30], 1
0x1007f0779: movabs rax, 0x200000002
0x1007f0783: mov qword ptr [rbp - 0x50], rax
0x1007f0787: vxorps xmm0, xmm0, xmm0
0x1007f078b: vmovups xmmword ptr [rbp - 0x48], xmm0
0x1007f0790: mov r13, qword ptr [rip + 0x1858d01] ; 0x102049498
0x1007f0797: vmovups ymm0, ymmword ptr [rbp - 0x50]
0x1007f079c: vmovups ymmword ptr [r13], ymm0
0x1007f07a2: mov dword ptr [r13 + 0x20], 1
0x1007f07aa: vzeroupper 
0x1007f07ad: call 0x1007c1470 ; 0x1007c1470
0x1007f07b2: mov rcx, qword ptr [rax]
0x1007f07b5: lea rsi, [rbp - 0x50]
0x1007f07b9: mov rdi, rax
0x1007f07bc: call qword ptr [rcx + 0x100]
0x1007f07c2: mov dword ptr [r13 + 0x24], eax
0x1007f07c6: mov rax, qword ptr [rip + 0x1858ccb] ; 0x102049498
0x1007f07cd: mov qword ptr [rbx + 8], rax
0x1007f07d1: test r15d, r15d
0x1007f07d4: mov eax, 1
0x1007f07d9: cmovne eax, r15d
0x1007f07dd: mov dword ptr [rbx + 0x1c], eax
0x1007f07e0: cmp eax, 2
0x1007f07e3: jb 0x1007f07f8
0x1007f07e5: lea eax, [r12 - 1]
0x1007f07ea: test eax, r12d
0x1007f07ed: jne 0x1007f0826
0x1007f07ef: lea eax, [r14 - 1]
0x1007f07f3: test eax, r14d
0x1007f07f6: jne 0x1007f0826
0x1007f07f8: add rsp, 0x28
0x1007f07fc: pop rbx
0x1007f07fd: pop r12
0x1007f07ff: pop r13
0x1007f0801: pop r14
0x1007f0803: pop r15
0x1007f0805: pop rbp
0x1007f0806: ret 
0x1007f0807: lea rdi, [rip + 0x3b6fdf] ; 0x100ba77ed m_width > 0 && m_height > 0 && m_depth > 0
0x1007f080e: lea rsi, [rip + 0x3b6dc5] ; 0x100ba75da Texture.cpp
0x1007f0815: mov edx, 0x14b
0x1007f081a: mov ecx, 3
0x1007f081f: call 0x1007e5f70 ; 0x1007e5f70
0x1007f0824: ud2 
0x1007f0826: lea rdi, [rip + 0x3b6feb] ; 0x100ba7818 Math::IsPowOfTwo( width ) && Math::IsPowOfTwo( height )
0x1007f082d: lea rsi, [rip + 0x3b6da6] ; 0x100ba75da Texture.cpp
0x1007f0834: mov edx, 0x15f
0x1007f0839: mov ecx, 3
0x1007f083e: call 0x1007e5f70 ; 0x1007e5f70
0x1007f0843: ud2 
0x1007f0845: nop word ptr cs:[rax + rax]
