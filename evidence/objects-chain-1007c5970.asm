0x1007c5970: push rbp
0x1007c5971: mov rbp, rsp
0x1007c5974: push r15
0x1007c5976: push r14
0x1007c5978: push r13
0x1007c597a: push r12
0x1007c597c: push rbx
0x1007c597d: push rax
0x1007c597e: mov r15, rdi
0x1007c5981: mov rbx, qword ptr [r15 + 8]
0x1007c5985: add r15, 8
0x1007c5989: test rbx, rbx
0x1007c598c: je 0x1007c59db
0x1007c598e: mov r14, qword ptr [rsi]
0x1007c5991: nop word ptr cs:[rax + rax]
0x1007c59a0: mov r12, qword ptr [rbx + 0x20]
0x1007c59a4: mov rdi, r14
0x1007c59a7: mov rsi, r12
0x1007c59aa: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007c59af: test eax, eax
0x1007c59b1: jns 0x1007c59c0
0x1007c59b3: mov r15, rbx
0x1007c59b6: mov rbx, qword ptr [rbx]
0x1007c59b9: test rbx, rbx
0x1007c59bc: jne 0x1007c59a0
0x1007c59be: jmp 0x1007c59db ; 0x1007c59db
0x1007c59c0: mov rdi, r12
0x1007c59c3: mov rsi, r14
0x1007c59c6: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007c59cb: test eax, eax
0x1007c59cd: jns 0x1007c59f3
0x1007c59cf: add rbx, 8
0x1007c59d3: mov rbx, qword ptr [rbx]
0x1007c59d6: test rbx, rbx
0x1007c59d9: jne 0x1007c59a0
0x1007c59db: mov r12, r15
0x1007c59de: mov rax, r12
0x1007c59e1: mov rdx, r15
0x1007c59e4: add rsp, 8
0x1007c59e8: pop rbx
0x1007c59e9: pop r12
0x1007c59eb: pop r13
0x1007c59ed: pop r14
0x1007c59ef: pop r15
0x1007c59f1: pop rbp
0x1007c59f2: ret 
0x1007c59f3: mov r13, qword ptr [rbx]
0x1007c59f6: mov r12, rbx
0x1007c59f9: test r13, r13
0x1007c59fc: je 0x1007c5a22
0x1007c59fe: nop 
0x1007c5a00: mov rdi, qword ptr [r13 + 0x20]
0x1007c5a04: mov rsi, r14
0x1007c5a07: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007c5a0c: lea rcx, [r13 + 8]
0x1007c5a10: test eax, eax
0x1007c5a12: cmovns rcx, r13
0x1007c5a16: cmovns r12, r13
0x1007c5a1a: mov r13, qword ptr [rcx]
0x1007c5a1d: test r13, r13
0x1007c5a20: jne 0x1007c5a00
0x1007c5a22: mov rbx, qword ptr [rbx + 8]
0x1007c5a26: test rbx, rbx
0x1007c5a29: je 0x1007c59de
0x1007c5a2b: nop dword ptr [rax + rax]
0x1007c5a30: mov rsi, qword ptr [rbx + 0x20]
0x1007c5a34: mov rdi, r14
0x1007c5a37: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007c5a3c: lea rcx, [rbx + 8]
0x1007c5a40: test eax, eax
0x1007c5a42: cmovs rcx, rbx
0x1007c5a46: cmovs r15, rbx
0x1007c5a4a: mov rbx, qword ptr [rcx]
0x1007c5a4d: test rbx, rbx
0x1007c5a50: jne 0x1007c5a30
0x1007c5a52: jmp 0x1007c59de ; 0x1007c59de
0x1007c5a54: nop word ptr cs:[rax + rax]
