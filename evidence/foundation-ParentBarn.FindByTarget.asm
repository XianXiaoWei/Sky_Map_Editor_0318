0x100523c00: push rbp
0x100523c01: mov rbp, rsp
0x100523c04: xor ecx, ecx
0x100523c06: xor eax, eax
0x100523c08: nop dword ptr [rax + rax]
0x100523c10: cmp qword ptr [rdi + rcx + 0x18], rsi
0x100523c15: je 0x100523c40
0x100523c17: cmp qword ptr [rdi + rcx + 0xa8], rsi
0x100523c1f: je 0x100523c58
0x100523c21: add rcx, 0x120
0x100523c28: cmp rcx, 0x4800
0x100523c2f: jne 0x100523c10
0x100523c31: jmp 0x100523c79 ; 0x100523c79
0x100523c33: nop word ptr cs:[rax + rax]
0x100523c40: lea r8, [rdi + rcx + 0x10]
0x100523c45: mov r9d, eax
0x100523c48: inc eax
0x100523c4a: mov qword ptr [rdx + r9*8], r8
0x100523c4e: cmp qword ptr [rdi + rcx + 0xa8], rsi
0x100523c56: jne 0x100523c21
0x100523c58: lea r8, [rdi + rcx + 0xa0]
0x100523c60: mov r9d, eax
0x100523c63: inc eax
0x100523c65: mov qword ptr [rdx + r9*8], r8
0x100523c69: add rcx, 0x120
0x100523c70: cmp rcx, 0x4800
0x100523c77: jne 0x100523c10
0x100523c79: pop rbp
0x100523c7a: ret 
0x100523c7b: nop dword ptr [rax + rax]
