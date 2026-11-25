0x1001b2a10: push rbp
0x1001b2a11: mov rbp, rsp
0x1001b2a14: push r15
0x1001b2a16: push r14
0x1001b2a18: push r12
0x1001b2a1a: push rbx
0x1001b2a1b: sub rsp, 0x10
0x1001b2a1f: mov r15, r9
0x1001b2a22: mov rbx, rdx
0x1001b2a25: mov r12, rsi
0x1001b2a28: mov r14, rdi
0x1001b2a2b: cmp dword ptr [rbp + 0x10], 1
0x1001b2a2f: jne 0x1001b2a7e
0x1001b2a31: call 0x1007abbf0 ; 0x1007abbf0
0x1001b2a36: add rbx, r12
0x1001b2a39: test r14b, 1
0x1001b2a3d: je 0x1001b2a47
0x1001b2a3f: mov rax, qword ptr [rbx]
0x1001b2a42: mov r14, qword ptr [rax + r14 - 1]
0x1001b2a47: mov rdx, qword ptr [r15]
0x1001b2a4a: mov rcx, qword ptr [r15 + 8]
0x1001b2a4e: mov qword ptr [rbp - 0x28], 0
0x1001b2a56: mov rdi, qword ptr [rip + 0x1c283a3] ; 0x101ddae00
0x1001b2a5d: mov rax, qword ptr [rdi]
0x1001b2a60: lea rsi, [rbp - 0x28]
0x1001b2a64: call qword ptr [rax + 0x40]
0x1001b2a67: mov rsi, qword ptr [rbp - 0x28]
0x1001b2a6b: mov rdi, rbx
0x1001b2a6e: call r14
0x1001b2a71: add rsp, 0x10
0x1001b2a75: pop rbx
0x1001b2a76: pop r12
0x1001b2a78: pop r14
0x1001b2a7a: pop r15
0x1001b2a7c: pop rbp
0x1001b2a7d: ret 
0x1001b2a7e: lea rdi, [rip + 0x9aab7b] ; 0x100b5d600 1 == argCount
0x1001b2a85: lea rsi, [rip + 0x9aab4c] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x1001b2a8c: mov edx, 0x23d
0x1001b2a91: mov ecx, 3
0x1001b2a96: call 0x1007e5f70 ; 0x1007e5f70
0x1001b2a9b: ud2 
0x1001b2a9d: nop dword ptr [rax]
