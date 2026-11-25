0x10022bd60: push rbp
0x10022bd61: mov rbp, rsp
0x10022bd64: push rbx
0x10022bd65: push rax
0x10022bd66: mov rbx, rdi
0x10022bd69: mov rdi, qword ptr [rbx + 0x18]
0x10022bd6d: test rdi, rdi
0x10022bd70: je 0x10022bd7b
0x10022bd72: mov rsi, qword ptr [rbx + 8]
0x10022bd76: call 0x100795a70 ; 0x100795a70
0x10022bd7b: mov qword ptr [rbx + 8], 0
0x10022bd83: mov dword ptr [rbx + 0x10], 0
0x10022bd8a: add rsp, 8
0x10022bd8e: pop rbx
0x10022bd8f: pop rbp
0x10022bd90: ret 
0x10022bd91: nop word ptr cs:[rax + rax]
