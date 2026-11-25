0x1001b2c90: push rbp
0x1001b2c91: mov rbp, rsp
0x1001b2c94: test rsi, rsi
0x1001b2c97: je 0x1001b2ca3
0x1001b2c99: mov rax, qword ptr [rsi]
0x1001b2c9c: mov rdi, rsi
0x1001b2c9f: pop rbp
0x1001b2ca0: jmp qword ptr [rax + 8]
0x1001b2ca3: pop rbp
0x1001b2ca4: ret 
0x1001b2ca5: nop word ptr cs:[rax + rax]
