0x100194a90: push rbp
0x100194a91: mov rbp, rsp
0x100194a94: push r14
0x100194a96: push rbx
0x100194a97: mov r14, rdi
0x100194a9a: lea rdi, [r14 + 0x6c838]
0x100194aa1: call 0x1007f5250 ; 0x1007f5250
0x100194aa6: cmp dword ptr [r14 + 0x6c830], 0
0x100194aae: je 0x100194ae1
0x100194ab0: xor ebx, ebx
0x100194ab2: nop word ptr cs:[rax + rax]
0x100194ac0: mov eax, ebx
0x100194ac2: imul rax, rax, 0x3540
0x100194ac9: lea rdi, [r14 + rax + 0x6cc70]
0x100194ad1: call 0x1007f6b80 ; 0x1007f6b80
0x100194ad6: inc ebx
0x100194ad8: cmp ebx, dword ptr [r14 + 0x6c830]
0x100194adf: jb 0x100194ac0
0x100194ae1: mov eax, dword ptr [r14 + 0x20018]
0x100194ae8: test eax, eax
0x100194aea: je 0x100194b2c
0x100194aec: xor ebx, ebx
0x100194aee: nop 
0x100194af0: mov rcx, qword ptr [r14 + 0x20020]
0x100194af7: mov ebx, ebx
0x100194af9: lea rdx, [rbx + rbx*2]
0x100194afd: shl rdx, 7
0x100194b01: cmp byte ptr [rcx + rdx + 0xbc], 0
0x100194b09: je 0x100194b26
0x100194b0b: mov rdi, qword ptr [r14 + 0xa2088]
0x100194b12: mov rsi, qword ptr [rcx + rdx + 0xd0]
0x100194b1a: call 0x100779200 ; 0x100779200
0x100194b1f: mov eax, dword ptr [r14 + 0x20018]
0x100194b26: inc ebx
0x100194b28: cmp ebx, eax
0x100194b2a: jb 0x100194af0
0x100194b2c: cmp dword ptr [r14 + 0x20010], 0
0x100194b34: je 0x100194b61
0x100194b36: xor ebx, ebx
0x100194b38: nop dword ptr [rax + rax]
0x100194b40: mov eax, ebx
0x100194b42: lea rax, [rax + rax*2]
0x100194b46: shl rax, 6
0x100194b4a: lea rdi, [r14 + rax + 0x10]
0x100194b4f: mov rax, qword ptr [r14 + rax + 0x10]
0x100194b54: call qword ptr [rax]
0x100194b56: inc ebx
0x100194b58: cmp ebx, dword ptr [r14 + 0x20010]
0x100194b5f: jb 0x100194b40
0x100194b61: cmp dword ptr [r14 + 0x20014], 0
0x100194b69: je 0x100194b93
0x100194b6b: xor ebx, ebx
0x100194b6d: nop dword ptr [rax]
0x100194b70: mov eax, ebx
0x100194b72: shl rax, 7
0x100194b76: lea rdi, [r14 + rax + 0x18010]
0x100194b7e: mov rax, qword ptr [r14 + rax + 0x18010]
0x100194b86: call qword ptr [rax]
0x100194b88: inc ebx
0x100194b8a: cmp ebx, dword ptr [r14 + 0x20014]
0x100194b91: jb 0x100194b70
0x100194b93: mov qword ptr [r14 + 0x20010], 0
0x100194b9e: pop rbx
0x100194b9f: pop r14
0x100194ba1: pop rbp
0x100194ba2: ret 
0x100194ba3: nop word ptr cs:[rax + rax]
