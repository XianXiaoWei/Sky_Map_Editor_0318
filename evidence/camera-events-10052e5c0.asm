0x10052e5c0: push rbp
0x10052e5c1: mov rbp, rsp
0x10052e5c4: mov rax, qword ptr [rdi + 0xe8]
0x10052e5cb: test rax, rax
0x10052e5ce: je 0x10052e5e0
0x10052e5d0: mov rax, qword ptr [rax + 0x10]
0x10052e5d4: test rax, rax
0x10052e5d7: je 0x10052e5e0
0x10052e5d9: mov byte ptr [rax + 0xe0], 0
0x10052e5e0: pop rbp
0x10052e5e1: ret 
0x10052e5e2: nop word ptr cs:[rax + rax]
