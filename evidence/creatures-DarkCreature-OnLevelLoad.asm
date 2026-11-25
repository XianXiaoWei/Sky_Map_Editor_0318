0x10026c210: push rbp
0x10026c211: mov rbp, rsp
0x10026c214: push r15
0x10026c216: push r14
0x10026c218: push r13
0x10026c21a: push r12
0x10026c21c: push rbx
0x10026c21d: sub rsp, 0x18
0x10026c221: mov r14, r9
0x10026c224: mov r15, r8
0x10026c227: mov qword ptr [rbp - 0x38], rcx
0x10026c22b: mov qword ptr [rbp - 0x30], rdx
0x10026c22f: mov rdx, rsi
0x10026c232: mov r13, rdi
0x10026c235: mov rbx, qword ptr [rbp + 0x18]
0x10026c239: cmp dword ptr [r13 + 0xc], 0
0x10026c23e: je 0x10026c288
0x10026c240: xor r12d, r12d
0x10026c243: mov qword ptr [rbp - 0x40], r13
0x10026c247: nop word ptr [rax + rax]
0x10026c250: mov eax, r12d
0x10026c253: imul rax, rax, 0x2f0
0x10026c25a: lea rdi, [r13 + rax + 0x10]
0x10026c25f: mov esi, r12d
0x10026c262: mov r13, rdx
0x10026c265: mov r8, r15
0x10026c268: mov r9, r14
0x10026c26b: push rbx
0x10026c26c: push qword ptr [rbp + 0x10]
0x10026c26f: call 0x10026c670 ; 0x10026c670
0x10026c274: mov rdx, r13
0x10026c277: mov r13, qword ptr [rbp - 0x40]
0x10026c27b: add rsp, 0x10
0x10026c27f: inc r12d
0x10026c282: cmp r12d, dword ptr [r13 + 0xc]
0x10026c286: jb 0x10026c250
0x10026c288: cmp dword ptr [r13 + 0x1790], 0
0x10026c290: mov r14, qword ptr [rbp - 0x38]
0x10026c294: mov r15, qword ptr [rbp - 0x30]
0x10026c298: mov r12, rbx
0x10026c29b: je 0x10026c2ca
0x10026c29d: xor ebx, ebx
0x10026c29f: nop 
0x10026c2a0: mov eax, ebx
0x10026c2a2: imul rax, rax, 0x110
0x10026c2a9: lea rdi, [r13 + rax + 0x17a0]
0x10026c2b1: mov rsi, r15
0x10026c2b4: mov rdx, r14
0x10026c2b7: mov rcx, r12
0x10026c2ba: call 0x1005b7530 ; 0x1005b7530
0x10026c2bf: inc ebx
0x10026c2c1: cmp ebx, dword ptr [r13 + 0x1790]
0x10026c2c8: jb 0x10026c2a0
0x10026c2ca: cmp dword ptr [r13 + 0x5ba0], 0
0x10026c2d2: je 0x10026c301
0x10026c2d4: xor ebx, ebx
0x10026c2d6: nop word ptr cs:[rax + rax]
0x10026c2e0: mov eax, ebx
0x10026c2e2: imul rax, rax, 0x270
0x10026c2e9: lea rdi, [r13 + rax + 0x5bb0]
0x10026c2f1: call 0x1005b7e70 ; 0x1005b7e70
0x10026c2f6: inc ebx
0x10026c2f8: cmp ebx, dword ptr [r13 + 0x5ba0]
0x10026c2ff: jb 0x10026c2e0
0x10026c301: add rsp, 0x18
0x10026c305: pop rbx
0x10026c306: pop r12
0x10026c308: pop r13
0x10026c30a: pop r14
0x10026c30c: pop r15
0x10026c30e: pop rbp
0x10026c30f: ret 
