0x100402a80: push rbp
0x100402a81: mov rbp, rsp
0x100402a84: mov rax, qword ptr [rdi + 0x228]
0x100402a8b: add rdi, 0xd0
0x100402a92: test rax, rax
0x100402a95: lea rax, [rax + 0x227]
0x100402a9c: cmove rax, rdi
0x100402aa0: mov al, byte ptr [rax]
0x100402aa2: pop rbp
0x100402aa3: ret 
0x100402aa4: nop word ptr cs:[rax + rax]
