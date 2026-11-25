0x1007f6a50: push rbp
0x1007f6a51: mov rbp, rsp
0x1007f6a54: mov eax, 0xffffffff
0x1007f6a59: cmp byte ptr [rdi + 0x538], 0
0x1007f6a60: je 0x1007f6a70
0x1007f6a62: mov rcx, qword ptr [rdi + 0x4f8]
0x1007f6a69: test rcx, rcx
0x1007f6a6c: je 0x1007f6a70
0x1007f6a6e: mov eax, dword ptr [rcx]
0x1007f6a70: pop rbp
0x1007f6a71: ret 
0x1007f6a72: nop word ptr cs:[rax + rax]
