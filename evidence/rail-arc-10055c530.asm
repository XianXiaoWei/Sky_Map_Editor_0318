0x10055c530: push rbp
0x10055c531: mov rbp, rsp
0x10055c534: push r14
0x10055c536: push rbx
0x10055c537: mov rbx, rsi
0x10055c53a: mov r14, rdi
0x10055c53d: test rbx, rbx
0x10055c540: je 0x10055c575
0x10055c542: cmp byte ptr [rbx + 0xe8], 0
0x10055c549: je 0x10055c575
0x10055c54b: mov rdi, rbx
0x10055c54e: call 0x10055d200 ; 0x10055d200
0x10055c553: mov byte ptr [rbx + 0xe8], 0
0x10055c55a: mov dword ptr [rbx + 0xec], 0
0x10055c564: mov rax, qword ptr [r14 + 0xa010]
0x10055c56b: mov qword ptr [rbx], rax
0x10055c56e: mov qword ptr [r14 + 0xa010], rbx
0x10055c575: pop rbx
0x10055c576: pop r14
0x10055c578: pop rbp
0x10055c579: ret 
0x10055c57a: nop word ptr [rax + rax]
