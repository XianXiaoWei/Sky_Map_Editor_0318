0x100133f30: push rbp
0x100133f31: mov rbp, rsp
0x100133f34: mov rcx, qword ptr [rdi + 0x10]
0x100133f38: test rcx, rcx
0x100133f3b: je 0x100133f4e
0x100133f3d: mov edx, dword ptr [rcx + 0xc4]
0x100133f43: xor eax, eax
0x100133f45: cmp edx, dword ptr [rdi + 0x18]
0x100133f48: cmove rax, rcx
0x100133f4c: pop rbp
0x100133f4d: ret 
0x100133f4e: xor eax, eax
0x100133f50: pop rbp
0x100133f51: ret 
0x100133f52: nop word ptr cs:[rax + rax]
