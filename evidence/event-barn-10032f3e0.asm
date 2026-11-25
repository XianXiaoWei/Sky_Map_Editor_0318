0x10032f3e0: push rbp
0x10032f3e1: mov rbp, rsp
0x10032f3e4: add rdi, 0x40
0x10032f3e8: xor ecx, ecx
0x10032f3ea: nop word ptr [rax + rax]
0x10032f3f0: mov rax, qword ptr [rdi - 0x10]
0x10032f3f4: test rax, rax
0x10032f3f7: je 0x10032f3ff
0x10032f3f9: cmp word ptr [rax + 0x2c], si
0x10032f3fd: je 0x10032f420
0x10032f3ff: mov rax, qword ptr [rdi]
0x10032f402: test rax, rax
0x10032f405: je 0x10032f40d
0x10032f407: cmp word ptr [rax + 0x2c], si
0x10032f40b: je 0x10032f420
0x10032f40d: add rcx, 2
0x10032f411: add rdi, 0x20
0x10032f415: cmp rcx, 0x500
0x10032f41c: jb 0x10032f3f0
0x10032f41e: xor eax, eax
0x10032f420: pop rbp
0x10032f421: ret 
0x10032f422: nop word ptr cs:[rax + rax]
