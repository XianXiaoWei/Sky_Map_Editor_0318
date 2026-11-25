0x1007c0cc0: push rbp
0x1007c0cc1: mov rbp, rsp
0x1007c0cc4: push r14
0x1007c0cc6: push rbx
0x1007c0cc7: mov r14, rdi
0x1007c0cca: cmp dword ptr [r14 + 0x164], 0
0x1007c0cd2: js 0x1007c0d87
0x1007c0cd8: mov dword ptr [r14 + 0x164], 0xffffffff
0x1007c0ce3: mov rax, qword ptr [r14 + 0x158]
0x1007c0cea: mov rax, qword ptr [rax + 8]
0x1007c0cee: cmp dword ptr [rax + 0x48], 0
0x1007c0cf2: je 0x1007c0d58
0x1007c0cf4: xor ebx, ebx
0x1007c0cf6: nop word ptr cs:[rax + rax]
0x1007c0d00: mov eax, ebx
0x1007c0d02: lea rax, [rax + rax*4]
0x1007c0d06: lea rdi, [r14 + rax*8 + 0x198]
0x1007c0d0e: call 0x100794f80 ; 0x100794f80
0x1007c0d13: inc ebx
0x1007c0d15: mov rax, qword ptr [r14 + 0x158]
0x1007c0d1c: mov rax, qword ptr [rax + 8]
0x1007c0d20: mov eax, dword ptr [rax + 0x48]
0x1007c0d23: cmp ebx, eax
0x1007c0d25: jb 0x1007c0d00
0x1007c0d27: test eax, eax
0x1007c0d29: je 0x1007c0d58
0x1007c0d2b: xor ebx, ebx
0x1007c0d2d: nop dword ptr [rax]
0x1007c0d30: mov rdi, qword ptr [rip + 0x18875a1] ; 0x1020482d8
0x1007c0d37: mov eax, ebx
0x1007c0d39: mov rsi, qword ptr [r14 + rax*8 + 0x168]
0x1007c0d41: call 0x100795a70 ; 0x100795a70
0x1007c0d46: inc ebx
0x1007c0d48: mov rax, qword ptr [r14 + 0x158]
0x1007c0d4f: mov rax, qword ptr [rax + 8]
0x1007c0d53: cmp ebx, dword ptr [rax + 0x48]
0x1007c0d56: jb 0x1007c0d30
0x1007c0d58: call 0x1007c1470 ; 0x1007c1470
0x1007c0d5d: mov rcx, qword ptr [rax]
0x1007c0d60: mov esi, dword ptr [r14 + 0x160]
0x1007c0d67: mov rdi, rax
0x1007c0d6a: call qword ptr [rcx + 0xd8]
0x1007c0d70: mov rdi, qword ptr [rip + 0x1887561] ; 0x1020482d8
0x1007c0d77: mov rsi, qword ptr [r14 + 0x148]
0x1007c0d7e: pop rbx
0x1007c0d7f: pop r14
0x1007c0d81: pop rbp
0x1007c0d82: jmp 0x100795a70 ; 0x100795a70
0x1007c0d87: lea rdi, [rip + 0x3e35a2] ; 0x100ba4330 m_pipeline >= 0
0x1007c0d8e: lea rsi, [rip + 0x3e3274] ; 0x100ba4009 RenderPipeline.cpp
0x1007c0d95: lea r8, [rip + 0x3e35a4] ; 0x100ba4340 Pipeline has already been freed
0x1007c0d9c: mov edx, 0x1ef
0x1007c0da1: mov ecx, 4
0x1007c0da6: xor eax, eax
0x1007c0da8: call 0x1007e6030 ; 0x1007e6030
0x1007c0dad: ud2 
0x1007c0daf: nop 

