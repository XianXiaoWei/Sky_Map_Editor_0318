0x10032f5b0: push rbp
0x10032f5b1: mov rbp, rsp
0x10032f5b4: push r14
0x10032f5b6: push rbx
0x10032f5b7: mov r14, rdx
0x10032f5ba: mov rbx, rsi
0x10032f5bd: mov rax, rdi
0x10032f5c0: cmp byte ptr [rbx + 0x20], 0
0x10032f5c4: jne 0x10032f5df
0x10032f5c6: mov byte ptr [rbx + 0x20], 1
0x10032f5ca: mov rcx, qword ptr [rbx]
0x10032f5cd: add rax, 0x85098
0x10032f5d3: mov rdi, rbx
0x10032f5d6: mov rsi, r14
0x10032f5d9: mov rdx, rax
0x10032f5dc: call qword ptr [rcx + 0x10]
0x10032f5df: cmp byte ptr [rbx + 0x21], 0
0x10032f5e3: je 0x10032f5fd
0x10032f5e5: cmp byte ptr [rbx + 0x23], 0
0x10032f5e9: mov word ptr [rbx + 0x21], 0
0x10032f5ef: je 0x10032f633
0x10032f5f1: mov rax, qword ptr [rbx]
0x10032f5f4: mov rdi, rbx
0x10032f5f7: mov rsi, r14
0x10032f5fa: call qword ptr [rax + 0x38]
0x10032f5fd: cmp byte ptr [rbx + 0x23], 0
0x10032f601: je 0x10032f66b
0x10032f603: cmp byte ptr [rbx + 0x22], 0
0x10032f607: je 0x10032f64b
0x10032f609: mov word ptr [rbx + 0x21], 0
0x10032f60f: mov byte ptr [rbx + 0x23], 0
0x10032f613: mov rax, qword ptr [rbx]
0x10032f616: mov rdi, rbx
0x10032f619: mov rsi, r14
0x10032f61c: call qword ptr [rax + 0x40]
0x10032f61f: cmp byte ptr [rbx + 0x25], 0
0x10032f623: je 0x10032f66b
0x10032f625: mov rdi, rbx
0x10032f628: call 0x10032ef60 ; 0x10032ef60
0x10032f62d: mov byte ptr [rbx + 0x24], 0
0x10032f631: jmp 0x10032f66b ; 0x10032f66b
0x10032f633: mov byte ptr [rbx + 0x23], 1
0x10032f637: mov rax, qword ptr [rbx]
0x10032f63a: mov rdi, rbx
0x10032f63d: mov rsi, r14
0x10032f640: call qword ptr [rax + 0x30]
0x10032f643: cmp byte ptr [rbx + 0x23], 0
0x10032f647: jne 0x10032f603
0x10032f649: jmp 0x10032f66b ; 0x10032f66b
0x10032f64b: mov qword ptr [rbx + 0x30], 0
0x10032f653: mov rax, qword ptr [rbx]
0x10032f656: mov rdi, rbx
0x10032f659: mov rsi, r14
0x10032f65c: call qword ptr [rax + 0x48]
0x10032f65f: cmp byte ptr [rbx + 0x23], 0
0x10032f663: je 0x10032f66b
0x10032f665: cmp byte ptr [rbx + 0x22], 0
0x10032f669: jne 0x10032f609
0x10032f66b: pop rbx
0x10032f66c: pop r14
0x10032f66e: pop rbp
0x10032f66f: ret 
