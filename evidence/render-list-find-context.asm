0x1007ba080: push rbp
0x1007ba081: mov rbp, rsp
0x1007ba084: cmp byte ptr [rdi + 0x3c], 0
0x1007ba088: je 0x1007ba0b6
0x1007ba08a: test rsi, rsi
0x1007ba08d: je 0x1007ba099
0x1007ba08f: lea rax, [rdi + 0xc0]
0x1007ba096: mov qword ptr [rsi], rax
0x1007ba099: test rdx, rdx
0x1007ba09c: je 0x1007ba0a5
0x1007ba09e: lea rax, [rdi + 0x40]
0x1007ba0a2: mov qword ptr [rdx], rax
0x1007ba0a5: mov al, 1
0x1007ba0a7: test rcx, rcx
0x1007ba0aa: je 0x1007ba0b4
0x1007ba0ac: mov dl, byte ptr [rdi + 0xe0]
0x1007ba0b2: mov byte ptr [rcx], dl
0x1007ba0b4: pop rbp
0x1007ba0b5: ret 
0x1007ba0b6: xor eax, eax
0x1007ba0b8: pop rbp
0x1007ba0b9: ret 
0x1007ba0ba: nop word ptr [rax + rax]

