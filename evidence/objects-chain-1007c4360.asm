0x1007c4360: push rbp
0x1007c4361: mov rbp, rsp
0x1007c4364: push r15
0x1007c4366: push r14
0x1007c4368: push r12
0x1007c436a: push rbx
0x1007c436b: sub rsp, 0x10
0x1007c436f: mov r15, rsi
0x1007c4372: mov qword ptr [rbp - 0x28], rdx
0x1007c4376: add rdi, 0x428
0x1007c437d: lea rsi, [rbp - 0x28]
0x1007c4381: call 0x1007c5970 ; 0x1007c5970
0x1007c4386: mov rbx, rax
0x1007c4389: mov r12, rdx
0x1007c438c: xor r14d, r14d
0x1007c438f: cmp rbx, r12
0x1007c4392: je 0x1007c4432
0x1007c4398: nop dword ptr [rax + rax]
0x1007c43a0: mov rax, qword ptr [rbx + 0x28]
0x1007c43a4: test rax, rax
0x1007c43a7: je 0x1007c43c0
0x1007c43a9: mov edi, dword ptr [rax + 8]
0x1007c43ac: call 0x1007abd30 ; 0x1007abd30
0x1007c43b1: jmp 0x1007c43c5 ; 0x1007c43c5
0x1007c43b3: nop word ptr cs:[rax + rax]
0x1007c43c0: call 0x1007abbf0 ; 0x1007abbf0
0x1007c43c5: mov rcx, qword ptr [rax]
0x1007c43c8: mov rdi, rax
0x1007c43cb: call qword ptr [rcx + 0x68]
0x1007c43ce: test rax, rax
0x1007c43d1: jne 0x1007c43d8
0x1007c43d3: call 0x1007abc60 ; 0x1007abc60
0x1007c43d8: cmp rax, r15
0x1007c43db: je 0x1007c442e
0x1007c43dd: mov rcx, qword ptr [rbx + 8]
0x1007c43e1: test rcx, rcx
0x1007c43e4: je 0x1007c4400
0x1007c43e6: nop word ptr cs:[rax + rax]
0x1007c43f0: mov rax, rcx
0x1007c43f3: mov rcx, qword ptr [rax]
0x1007c43f6: test rcx, rcx
0x1007c43f9: jne 0x1007c43f0
0x1007c43fb: jmp 0x1007c4420 ; 0x1007c4420
0x1007c43fd: nop dword ptr [rax]
0x1007c4400: mov rax, qword ptr [rbx + 0x10]
0x1007c4404: cmp qword ptr [rax], rbx
0x1007c4407: je 0x1007c4420
0x1007c4409: add rbx, 0x10
0x1007c440d: nop dword ptr [rax]
0x1007c4410: mov rcx, qword ptr [rbx]
0x1007c4413: mov rax, qword ptr [rcx + 0x10]
0x1007c4417: cmp qword ptr [rax], rcx
0x1007c441a: lea rbx, [rcx + 0x10]
0x1007c441e: jne 0x1007c4410
0x1007c4420: mov rbx, rax
0x1007c4423: cmp rax, r12
0x1007c4426: jne 0x1007c43a0
0x1007c442c: jmp 0x1007c4432 ; 0x1007c4432
0x1007c442e: mov r14, qword ptr [rbx + 0x28]
0x1007c4432: mov rax, r14
0x1007c4435: add rsp, 0x10
0x1007c4439: pop rbx
0x1007c443a: pop r12
0x1007c443c: pop r14
0x1007c443e: pop r15
0x1007c4440: pop rbp
0x1007c4441: ret 
0x1007c4442: nop word ptr cs:[rax + rax]
