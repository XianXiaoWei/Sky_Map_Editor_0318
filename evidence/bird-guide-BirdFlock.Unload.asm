0x10019bd00: push rbp
0x10019bd01: mov rbp, rsp
0x10019bd04: push r14
0x10019bd06: push rbx
0x10019bd07: mov rbx, rdi
0x10019bd0a: mov rdi, qword ptr [rbx + 0xa0]
0x10019bd11: test rdi, rdi
0x10019bd14: je 0x10019bd3c
0x10019bd16: mov rsi, qword ptr [rbx + 0x88]
0x10019bd1d: test rsi, rsi
0x10019bd20: je 0x10019bd27
0x10019bd22: call 0x100795a70 ; 0x100795a70
0x10019bd27: mov rsi, qword ptr [rbx + 0x68]
0x10019bd2b: test rsi, rsi
0x10019bd2e: je 0x10019bd3c
0x10019bd30: mov rdi, qword ptr [rbx + 0xa0]
0x10019bd37: call 0x100795a70 ; 0x100795a70
0x10019bd3c: mov qword ptr [rbx + 0x88], 0
0x10019bd47: mov qword ptr [rbx + 0x68], 0
0x10019bd4f: mov rdi, qword ptr [rbx + 0xa8]
0x10019bd56: test rdi, rdi
0x10019bd59: je 0x10019bdba
0x10019bd5b: mov r14, qword ptr [rbx + 0xb0]
0x10019bd62: test r14, r14
0x10019bd65: je 0x10019bdba
0x10019bd67: mov rax, qword ptr [rdi]
0x10019bd6a: call qword ptr [rax]
0x10019bd6c: cmp r14, rax
0x10019bd6f: jne 0x10019bdba
0x10019bd71: mov rdi, qword ptr [rbx + 0xa8]
0x10019bd78: mov rax, qword ptr [rdi]
0x10019bd7b: call qword ptr [rax + 0x10]
0x10019bd7e: test al, al
0x10019bd80: je 0x10019bdba
0x10019bd82: mov rdi, qword ptr [rbx + 0xa8]
0x10019bd89: test rdi, rdi
0x10019bd8c: je 0x10019bdba
0x10019bd8e: mov r14, qword ptr [rbx + 0xb0]
0x10019bd95: test r14, r14
0x10019bd98: je 0x10019bdba
0x10019bd9a: mov rax, qword ptr [rdi]
0x10019bd9d: call qword ptr [rax]
0x10019bd9f: cmp r14, rax
0x10019bda2: jne 0x10019bdba
0x10019bda4: mov rdi, qword ptr [rbx + 0xa8]
0x10019bdab: mov rax, qword ptr [rdi]
0x10019bdae: mov rax, qword ptr [rax + 0x30]
0x10019bdb2: xor esi, esi
0x10019bdb4: pop rbx
0x10019bdb5: pop r14
0x10019bdb7: pop rbp
0x10019bdb8: jmp rax
0x10019bdba: pop rbx
0x10019bdbb: pop r14
0x10019bdbd: pop rbp
0x10019bdbe: ret 
0x10019bdbf: nop 
