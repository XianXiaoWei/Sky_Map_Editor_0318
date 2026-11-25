0x100095170: push rbp
0x100095171: mov rbp, rsp
0x100095174: push r15
0x100095176: push r14
0x100095178: push r13
0x10009517a: push r12
0x10009517c: push rbx
0x10009517d: sub rsp, 0x18
0x100095181: mov rbx, rdx
0x100095184: lea r13, [rip + 0x1d3d96d] ; 0x101dd2af8
0x10009518b: mov r14d, dword ptr [r13]
0x10009518f: test r14, r14
0x100095192: je 0x1000951ff
0x100095194: mov qword ptr [rbp - 0x30], rdi
0x100095198: mov qword ptr [rbp - 0x38], rsi
0x10009519c: xor r15d, r15d
0x10009519f: nop 
0x1000951a0: mov r12, qword ptr [r13 + r15*8 + 8]
0x1000951a5: mov rdi, qword ptr [r12]
0x1000951a9: mov rsi, rbx
0x1000951ac: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1000951b1: test eax, eax
0x1000951b3: je 0x1000951bf
0x1000951b5: inc r15
0x1000951b8: cmp r15, r14
0x1000951bb: jb 0x1000951a0
0x1000951bd: jmp 0x1000951ff ; 0x1000951ff
0x1000951bf: cmp dword ptr [r12 + 8], 0
0x1000951c5: je 0x1000951ff
0x1000951c7: xor ebx, ebx
0x1000951c9: mov r14, qword ptr [rbp - 0x38]
0x1000951cd: mov r15, qword ptr [rbp - 0x30]
0x1000951d1: nop word ptr cs:[rax + rax]
0x1000951e0: mov eax, ebx
0x1000951e2: mov rdx, qword ptr [r12 + rax*8 + 0x10]
0x1000951e7: xor ecx, ecx
0x1000951e9: mov rdi, r15
0x1000951ec: mov rsi, r14
0x1000951ef: call 0x1000942e0 ; 0x1000942e0
0x1000951f4: inc ebx
0x1000951f6: cmp ebx, dword ptr [r12 + 8]
0x1000951fb: jb 0x1000951e0
0x1000951fd: jmp 0x100095201 ; 0x100095201
0x1000951ff: xor ebx, ebx
0x100095201: mov eax, ebx
0x100095203: add rsp, 0x18
0x100095207: pop rbx
0x100095208: pop r12
0x10009520a: pop r13
0x10009520c: pop r14
0x10009520e: pop r15
0x100095210: pop rbp
0x100095211: ret 
0x100095212: nop word ptr cs:[rax + rax]
