0x1006e4bf0: push rbp
0x1006e4bf1: mov rbp, rsp
0x1006e4bf4: push rbx
0x1006e4bf5: push rax
0x1006e4bf6: mov rbx, rdi
0x1006e4bf9: mov rdi, qword ptr [rbx + 0x1110]
0x1006e4c00: test rdi, rdi
0x1006e4c03: je 0x1006e4c15
0x1006e4c05: call 0x1004740a0 ; 0x1004740a0
0x1006e4c0a: mov qword ptr [rbx + 0x1110], 0
0x1006e4c15: add rsp, 8
0x1006e4c19: pop rbx
0x1006e4c1a: pop rbp
0x1006e4c1b: ret 
0x1006e4c1c: nop dword ptr [rax]
