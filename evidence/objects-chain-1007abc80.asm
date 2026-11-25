0x1007abc80: push rbp
0x1007abc81: mov rbp, rsp
0x1007abc84: push r15
0x1007abc86: push r14
0x1007abc88: push r12
0x1007abc8a: push rbx
0x1007abc8b: mov r15, rdi
0x1007abc8e: mov r14, qword ptr [rip + 0x189bfdb] ; 0x102047c70
0x1007abc95: test sil, sil
0x1007abc98: je 0x1007abcb1
0x1007abc9a: add r14, 0x68
0x1007abc9e: mov rdi, r14
0x1007abca1: mov rsi, r15
0x1007abca4: pop rbx
0x1007abca5: pop r12
0x1007abca7: pop r14
0x1007abca9: pop r15
0x1007abcab: pop rbp
0x1007abcac: jmp 0x1007af9a0 ; 0x1007af9a0
0x1007abcb1: mov rbx, qword ptr [r14 + 0x70]
0x1007abcb5: add r14, 0x70
0x1007abcb9: test rbx, rbx
0x1007abcbc: je 0x1007abd08
0x1007abcbe: mov r12, r14
0x1007abcc1: nop word ptr cs:[rax + rax]
0x1007abcd0: mov rdi, qword ptr [rbx + 0x20]
0x1007abcd4: mov rsi, r15
0x1007abcd7: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007abcdc: lea rcx, [rbx + 8]
0x1007abce0: test eax, eax
0x1007abce2: cmovns rcx, rbx
0x1007abce6: cmovns r12, rbx
0x1007abcea: mov rbx, qword ptr [rcx]
0x1007abced: test rbx, rbx
0x1007abcf0: jne 0x1007abcd0
0x1007abcf2: cmp r12, r14
0x1007abcf5: je 0x1007abd08
0x1007abcf7: mov rsi, qword ptr [r12 + 0x20]
0x1007abcfc: mov rdi, r15
0x1007abcff: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007abd04: test eax, eax
0x1007abd06: jns 0x1007abd0b
0x1007abd08: mov r12, r14
0x1007abd0b: cmp r14, r12
0x1007abd0e: je 0x1007abd17
0x1007abd10: mov rax, qword ptr [r12 + 0x28]
0x1007abd15: jmp 0x1007abd19 ; 0x1007abd19
0x1007abd17: xor eax, eax
0x1007abd19: pop rbx
0x1007abd1a: pop r12
0x1007abd1c: pop r14
0x1007abd1e: pop r15
0x1007abd20: pop rbp
0x1007abd21: ret 
0x1007abd22: nop word ptr cs:[rax + rax]
