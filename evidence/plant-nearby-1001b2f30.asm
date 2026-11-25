0x1001b2f30: push rbp
0x1001b2f31: mov rbp, rsp
0x1001b2f34: test rsi, rsi
0x1001b2f37: je 0x1001b2f43
0x1001b2f39: mov rax, qword ptr [rsi]
0x1001b2f3c: mov rdi, rsi
0x1001b2f3f: pop rbp
0x1001b2f40: jmp qword ptr [rax + 8]
0x1001b2f43: pop rbp
0x1001b2f44: ret 
0x1001b2f45: nop word ptr cs:[rax + rax]
