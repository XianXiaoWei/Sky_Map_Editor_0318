0x100591c60: push rbp
0x100591c61: mov rbp, rsp
0x100591c64: test rsi, rsi
0x100591c67: je 0x100591c73
0x100591c69: mov rax, qword ptr [rsi]
0x100591c6c: mov rdi, rsi
0x100591c6f: pop rbp
0x100591c70: jmp qword ptr [rax + 8]
0x100591c73: pop rbp
0x100591c74: ret 
0x100591c75: nop word ptr cs:[rax + rax]
