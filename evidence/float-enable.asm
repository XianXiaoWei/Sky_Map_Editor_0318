0x100717f80: push rbp
0x100717f81: mov rbp, rsp
0x100717f84: push r15
0x100717f86: push r14
0x100717f88: push r13
0x100717f8a: push r12
0x100717f8c: push rbx
0x100717f8d: sub rsp, 0x18
0x100717f91: mov r12, rdi
0x100717f94: mov rax, qword ptr [r12 + 0x40]
0x100717f99: cmp dword ptr [rax + 0x10], 0
0x100717f9d: je 0x10071801c
0x100717f9f: xor ebx, ebx
0x100717fa1: lea r14, [rbp - 0x38]
0x100717fa5: lea r15, [rbp - 0x40]
0x100717fa9: nop dword ptr [rax]
0x100717fb0: mov rcx, qword ptr [r12 + 0x38]
0x100717fb5: vmovss xmm0, dword ptr [rcx + 0x10]
0x100717fba: vmovss dword ptr [rbp - 0x2c], xmm0
0x100717fbf: mov rax, qword ptr [rax + 8]
0x100717fc3: mov ecx, ebx
0x100717fc5: mov rax, qword ptr [rax + rcx*8]
0x100717fc9: mov qword ptr [rbp - 0x40], rax
0x100717fcd: call 0x1007abc10 ; 0x1007abc10
0x100717fd2: mov r13, rax
0x100717fd5: mov qword ptr [rbp - 0x38], 0
0x100717fdd: call 0x1007abc10 ; 0x1007abc10
0x100717fe2: mov r8, qword ptr [rax]
0x100717fe5: mov rdi, rax
0x100717fe8: mov rsi, r14
0x100717feb: mov rdx, r15
0x100717fee: mov rcx, r13
0x100717ff1: call qword ptr [r8 + 0x40]
0x100717ff5: mov rdi, qword ptr [rbp - 0x38]
0x100717ff9: test rdi, rdi
0x100717ffc: je 0x10071802b
0x100717ffe: vcvttss2si eax, dword ptr [rbp - 0x2c]
0x100718003: xor esi, esi
0x100718005: cmp ebx, eax
0x100718007: setl sil
0x10071800b: call 0x1004d1f60 ; 0x1004d1f60
0x100718010: inc ebx
0x100718012: mov rax, qword ptr [r12 + 0x40]
0x100718017: cmp ebx, dword ptr [rax + 0x10]
0x10071801a: jb 0x100717fb0
0x10071801c: add rsp, 0x18
0x100718020: pop rbx
0x100718021: pop r12
0x100718023: pop r13
0x100718025: pop r14
0x100718027: pop r15
0x100718029: pop rbp
0x10071802a: ret 
0x10071802b: lea rdi, [rip + 0x449ac6] ; 0x100b61af8 ret
0x100718032: lea rsi, [rip + 0x44992a] ; 0x100b61963 ./Clump.h
0x100718039: mov edx, 0x47
0x10071803e: mov ecx, 3
0x100718043: call 0x1007e5f70 ; 0x1007e5f70
0x100718048: ud2 
0x10071804a: nop word ptr [rax + rax]
