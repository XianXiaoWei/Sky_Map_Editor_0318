0x1007c41e0: push rbp
0x1007c41e1: mov rbp, rsp
0x1007c41e4: push r15
0x1007c41e6: push r14
0x1007c41e8: push r12
0x1007c41ea: push rbx
0x1007c41eb: sub rsp, 0x20
0x1007c41ef: mov r12, rsi
0x1007c41f2: mov r15, rdi
0x1007c41f5: test byte ptr [r12 + 0x10], 1
0x1007c41fb: lea rax, [r12 + 0x11]
0x1007c4200: cmovne rax, qword ptr [r12 + 0x20]
0x1007c4206: mov qword ptr [rbp - 0x28], rax
0x1007c420a: lea r14, [r15 + 0x428]
0x1007c4211: lea rsi, [rbp - 0x28]
0x1007c4215: mov rdi, r14
0x1007c4218: call 0x1007c5970 ; 0x1007c5970
0x1007c421d: mov rbx, rax
0x1007c4220: cmp rbx, rdx
0x1007c4223: je 0x1007c4288
0x1007c4225: nop word ptr cs:[rax + rax]
0x1007c4230: mov rax, qword ptr [rbx + 8]
0x1007c4234: cmp qword ptr [rbx + 0x28], r12
0x1007c4238: je 0x1007c42cd
0x1007c423e: test rax, rax
0x1007c4241: je 0x1007c4260
0x1007c4243: nop word ptr cs:[rax + rax]
0x1007c4250: mov rcx, rax
0x1007c4253: mov rax, qword ptr [rcx]
0x1007c4256: test rax, rax
0x1007c4259: jne 0x1007c4250
0x1007c425b: jmp 0x1007c4280 ; 0x1007c4280
0x1007c425d: nop dword ptr [rax]
0x1007c4260: mov rcx, qword ptr [rbx + 0x10]
0x1007c4264: cmp qword ptr [rcx], rbx
0x1007c4267: je 0x1007c4280
0x1007c4269: add rbx, 0x10
0x1007c426d: nop dword ptr [rax]
0x1007c4270: mov rax, qword ptr [rbx]
0x1007c4273: mov rcx, qword ptr [rax + 0x10]
0x1007c4277: cmp qword ptr [rcx], rax
0x1007c427a: lea rbx, [rax + 0x10]
0x1007c427e: jne 0x1007c4270
0x1007c4280: mov rbx, rcx
0x1007c4283: cmp rcx, rdx
0x1007c4286: jne 0x1007c4230
0x1007c4288: add r12, 8
0x1007c428c: mov qword ptr [rbp - 0x30], r12
0x1007c4290: lea rdi, [rbp - 0x30]
0x1007c4294: call 0x1004d10f0 ; 0x1004d10f0
0x1007c4299: mov r9, qword ptr [rax + 8]
0x1007c429d: mov rax, qword ptr [rbp - 0x28]
0x1007c42a1: mov qword ptr [rsp], rax
0x1007c42a5: lea rdi, [rip + 0x3ded80] ; 0x100ba302c false
0x1007c42ac: lea rsi, [rip + 0x3e02db] ; 0x100ba458e Resource.cpp
0x1007c42b3: lea r8, [rip + 0x3e065c] ; 0x100ba4916
0x1007c42ba: mov edx, 0x1b5
0x1007c42bf: mov ecx, 4
0x1007c42c4: xor eax, eax
0x1007c42c6: call 0x1007e6030 ; 0x1007e6030
0x1007c42cb: ud2 
0x1007c42cd: test rax, rax
0x1007c42d0: je 0x1007c42ed
0x1007c42d2: nop word ptr cs:[rax + rax]
0x1007c42e0: mov rcx, rax
0x1007c42e3: mov rax, qword ptr [rcx]
0x1007c42e6: test rax, rax
0x1007c42e9: jne 0x1007c42e0
0x1007c42eb: jmp 0x1007c4310 ; 0x1007c4310
0x1007c42ed: mov rcx, qword ptr [rbx + 0x10]
0x1007c42f1: cmp qword ptr [rcx], rbx
0x1007c42f4: je 0x1007c4310
0x1007c42f6: lea rax, [rbx + 0x10]
0x1007c42fa: nop word ptr [rax + rax]
0x1007c4300: mov rax, qword ptr [rax]
0x1007c4303: mov rcx, qword ptr [rax + 0x10]
0x1007c4307: cmp qword ptr [rcx], rax
0x1007c430a: lea rax, [rax + 0x10]
0x1007c430e: jne 0x1007c4300
0x1007c4310: cmp qword ptr [r14], rbx
0x1007c4313: jne 0x1007c4318
0x1007c4315: mov qword ptr [r14], rcx
0x1007c4318: dec qword ptr [r15 + 0x438]
0x1007c431f: mov rdi, qword ptr [r15 + 0x430]
0x1007c4326: mov rsi, rbx
0x1007c4329: call 0x1007c5a60 ; 0x1007c5a60
0x1007c432e: call 0x1007e50d0 ; 0x1007e50d0
0x1007c4333: mov rdi, rax
0x1007c4336: mov rsi, rbx
0x1007c4339: call 0x1007e5db0 ; 0x1007e5db0
0x1007c433e: add rsp, 0x20
0x1007c4342: pop rbx
0x1007c4343: pop r12
0x1007c4345: pop r14
0x1007c4347: pop r15
0x1007c4349: pop rbp
0x1007c434a: ret 
0x1007c434b: mov rdi, rax
0x1007c434e: call 0x100011bf0 ; 0x100011bf0
0x1007c4353: nop word ptr cs:[rax + rax]
