0x10052b1a0: push rbp
0x10052b1a1: mov rbp, rsp
0x10052b1a4: push r15
0x10052b1a6: push r14
0x10052b1a8: push r13
0x10052b1aa: push r12
0x10052b1ac: push rbx
0x10052b1ad: sub rsp, 0x18
0x10052b1b1: mov r12, rdi
0x10052b1b4: mov rax, qword ptr [r12 + 0x38]
0x10052b1b9: mov r13d, dword ptr [rax + 0x10]
0x10052b1bd: test r13, r13
0x10052b1c0: je 0x10052b24e
0x10052b1c6: dec r13
0x10052b1c9: xor r14d, r14d
0x10052b1cc: nop dword ptr [rax]
0x10052b1d0: mov rax, qword ptr [rax + 8]
0x10052b1d4: mov rax, qword ptr [rax + r14*8]
0x10052b1d8: mov qword ptr [rbp - 0x38], rax
0x10052b1dc: call 0x1007abc10 ; 0x1007abc10
0x10052b1e1: mov r15, rax
0x10052b1e4: mov qword ptr [rbp - 0x30], 0
0x10052b1ec: call 0x1002d9a80 ; 0x1002d9a80
0x10052b1f1: mov rbx, qword ptr [rax]
0x10052b1f4: mov rdi, rax
0x10052b1f7: lea rsi, [rbp - 0x30]
0x10052b1fb: lea rdx, [rbp - 0x38]
0x10052b1ff: mov rcx, r15
0x10052b202: call qword ptr [rbx + 0x40]
0x10052b205: mov rax, qword ptr [rbp - 0x30]
0x10052b209: test rax, rax
0x10052b20c: je 0x10052b25d
0x10052b20e: mov rcx, qword ptr [r12 + 0x40]
0x10052b213: mov qword ptr [rax + 0x190], rcx
0x10052b21a: cmp r13, r14
0x10052b21d: je 0x10052b24e
0x10052b21f: inc r14
0x10052b222: mov rax, qword ptr [r12 + 0x38]
0x10052b227: mov ecx, dword ptr [rax + 0x10]
0x10052b22a: cmp r14, rcx
0x10052b22d: jb 0x10052b1d0
0x10052b22f: lea rdi, [rip + 0x636722] ; 0x100b61958 idx < size
0x10052b236: lea rsi, [rip + 0x636726] ; 0x100b61963 ./Clump.h
0x10052b23d: mov edx, 0x36
0x10052b242: mov ecx, 3
0x10052b247: call 0x1007e5f70 ; 0x1007e5f70
0x10052b24c: ud2 
0x10052b24e: add rsp, 0x18
0x10052b252: pop rbx
0x10052b253: pop r12
0x10052b255: pop r13
0x10052b257: pop r14
0x10052b259: pop r15
0x10052b25b: pop rbp
0x10052b25c: ret 
0x10052b25d: lea rdi, [rip + 0x636894] ; 0x100b61af8 ret
0x10052b264: lea rsi, [rip + 0x6366f8] ; 0x100b61963 ./Clump.h
0x10052b26b: mov edx, 0x47
0x10052b270: mov ecx, 3
0x10052b275: call 0x1007e5f70 ; 0x1007e5f70
0x10052b27a: ud2 
0x10052b27c: nop dword ptr [rax]
