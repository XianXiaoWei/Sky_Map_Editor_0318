0x10025ee60: push rbp
0x10025ee61: mov rbp, rsp
0x10025ee64: push r15
0x10025ee66: push r14
0x10025ee68: push r13
0x10025ee6a: push r12
0x10025ee6c: push rbx
0x10025ee6d: sub rsp, 0x98
0x10025ee74: mov r14, rsi
0x10025ee77: mov r15, rdi
0x10025ee7a: mov rax, qword ptr [rip + 0x9aea57] ; 0x100c0d8d8
0x10025ee81: mov rax, qword ptr [rax]
0x10025ee84: mov qword ptr [rbp - 0x30], rax
0x10025ee88: mov ebx, dword ptr [r15 + 0x410]
0x10025ee8f: test ebx, ebx
0x10025ee91: je 0x10025ef93
0x10025ee97: mov rax, qword ptr [rdx + 0x178]
0x10025ee9e: mov rax, qword ptr [rax + 0x20]
0x10025eea2: mov r13d, dword ptr [rax + 0x7d18]
0x10025eea9: lea rsi, [rbp - 0xb4]
0x10025eeb0: xor r12d, r12d
0x10025eeb3: xor edx, edx
0x10025eeb5: mov rdi, r14
0x10025eeb8: mov ecx, ebx
0x10025eeba: call 0x10076ad40 ; 0x10076ad40
0x10025eebf: cmp dword ptr [rbp - 0xb4], 0
0x10025eec6: je 0x10025ef93
0x10025eecc: nop dword ptr [rax]
0x10025eed0: mov dword ptr [rbp - 0xa0], 0
0x10025eeda: mov dword ptr [rbp - 0x3c], 0
0x10025eee1: mov dword ptr [rbp - 0xa8], ebx
0x10025eee7: lea rdi, [rbp - 0xb0]
0x10025eeee: mov rsi, r14
0x10025eef1: vzeroupper 
0x10025eef4: call 0x1002582b0 ; 0x1002582b0
0x10025eef9: movzx eax, byte ptr [rbp - 0xac]
0x10025ef00: cmp ebx, eax
0x10025ef02: jbe 0x10025efc0
0x10025ef08: mov rax, qword ptr [r15 + rax*8 + 0x10]
0x10025ef0d: cmp dword ptr [rax + 0x598], r13d
0x10025ef14: je 0x10025ef83
0x10025ef16: mov rcx, qword ptr [rbp - 0xa2]
0x10025ef1d: mov qword ptr [rax + 0x51e], rcx
0x10025ef24: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x10025ef2c: vmovaps xmmword ptr [rax + 0x510], xmm0
0x10025ef34: vmovaps xmm0, xmmword ptr [rbp - 0x90]
0x10025ef3c: vmovaps xmmword ptr [rax + 0x530], xmm0
0x10025ef44: lea rcx, [rbp - 0x80]
0x10025ef48: vmovups ymm0, ymmword ptr [rcx]
0x10025ef4c: vmovups ymm1, ymmword ptr [rcx + 0x10]
0x10025ef51: vmovups ymmword ptr [rax + 0x550], ymm1
0x10025ef59: vmovups ymmword ptr [rax + 0x540], ymm0
0x10025ef61: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x10025ef66: vmovaps xmmword ptr [rax + 0x570], xmm0
0x10025ef6e: mov rcx, qword ptr [rbp - 0x40]
0x10025ef72: mov qword ptr [rax + 0x580], rcx
0x10025ef79: mov dword ptr [rax + 0x590], 0
0x10025ef83: inc r12d
0x10025ef86: cmp r12d, dword ptr [rbp - 0xb4]
0x10025ef8d: jb 0x10025eed0
0x10025ef93: mov rax, qword ptr [rip + 0x9ae93e] ; 0x100c0d8d8
0x10025ef9a: mov rax, qword ptr [rax]
0x10025ef9d: cmp rax, qword ptr [rbp - 0x30]
0x10025efa1: jne 0x10025efb8
0x10025efa3: add rsp, 0x98
0x10025efaa: pop rbx
0x10025efab: pop r12
0x10025efad: pop r13
0x10025efaf: pop r14
0x10025efb1: pop r15
0x10025efb3: pop rbp
0x10025efb4: vzeroupper 
0x10025efb7: ret 
0x10025efb8: vzeroupper 
0x10025efbb: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10025efc0: lea rdi, [rip + 0x9199a9] ; 0x100b78970 netState.critterIdx < numCritters
0x10025efc7: lea rsi, [rip + 0x9199c4] ; 0x100b78992 ./CritterV2.h
0x10025efce: mov edx, 0x98
0x10025efd3: mov ecx, 3
0x10025efd8: call 0x1007e5f70 ; 0x1007e5f70
0x10025efdd: ud2 
0x10025efdf: nop 
