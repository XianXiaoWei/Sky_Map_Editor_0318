0x100316270: push rbp
0x100316271: mov rbp, rsp
0x100316274: mov rcx, qword ptr [rdi]
0x100316277: test rcx, rcx
0x10031627a: je 0x10031628d
0x10031627c: mov edx, dword ptr [rcx + 0x1f0]
0x100316282: xor eax, eax
0x100316284: cmp edx, dword ptr [rdi + 8]
0x100316287: cmove rax, rcx
0x10031628b: pop rbp
0x10031628c: ret 
0x10031628d: xor eax, eax
0x10031628f: pop rbp
0x100316290: ret 
0x100316291: nop word ptr cs:[rax + rax]
