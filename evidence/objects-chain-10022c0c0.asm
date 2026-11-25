0x10022c0c0: push rbp
0x10022c0c1: mov rbp, rsp
0x10022c0c4: push r14
0x10022c0c6: push rbx
0x10022c0c7: mov rbx, rsi
0x10022c0ca: mov r14, rdi
0x10022c0cd: test rbx, rbx
0x10022c0d0: je 0x10022c10e
0x10022c0d2: cmp byte ptr [rbx + 0x14], 0
0x10022c0d6: je 0x10022c10e
0x10022c0d8: mov rdi, qword ptr [rbx + 0x18]
0x10022c0dc: test rdi, rdi
0x10022c0df: je 0x10022c0ea
0x10022c0e1: mov rsi, qword ptr [rbx + 8]
0x10022c0e5: call 0x100795a70 ; 0x100795a70
0x10022c0ea: mov qword ptr [rbx + 8], 0
0x10022c0f2: mov dword ptr [rbx + 0x10], 0
0x10022c0f9: mov byte ptr [rbx + 0x14], 0
0x10022c0fd: mov rax, qword ptr [r14 + 0x2a068]
0x10022c104: mov qword ptr [rbx], rax
0x10022c107: mov qword ptr [r14 + 0x2a068], rbx
0x10022c10e: pop rbx
0x10022c10f: pop r14
0x10022c111: pop rbp
0x10022c112: ret 
0x10022c113: nop word ptr cs:[rax + rax]
