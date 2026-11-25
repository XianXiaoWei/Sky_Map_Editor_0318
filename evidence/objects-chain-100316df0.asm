0x100316df0: push rbp
0x100316df1: mov rbp, rsp
0x100316df4: push r15
0x100316df6: push r14
0x100316df8: push r12
0x100316dfa: push rbx
0x100316dfb: sub rsp, 0x10
0x100316dff: mov r15, r9
0x100316e02: mov rbx, rdx
0x100316e05: mov r12, rsi
0x100316e08: mov r14, rdi
0x100316e0b: cmp dword ptr [rbp + 0x10], 1
0x100316e0f: jne 0x100316e66
0x100316e11: call 0x1007abbf0 ; 0x1007abbf0
0x100316e16: add rbx, r12
0x100316e19: test r14b, 1
0x100316e1d: je 0x100316e27
0x100316e1f: mov rax, qword ptr [rbx]
0x100316e22: mov r14, qword ptr [rax + r14 - 1]
0x100316e27: mov r12, qword ptr [r15]
0x100316e2a: mov r15, qword ptr [r15 + 8]
0x100316e2e: mov qword ptr [rbp - 0x28], 0
0x100316e36: call 0x100375c20 ; 0x100375c20
0x100316e3b: mov r8, qword ptr [rax]
0x100316e3e: lea rsi, [rbp - 0x28]
0x100316e42: mov rdi, rax
0x100316e45: mov rdx, r12
0x100316e48: mov rcx, r15
0x100316e4b: call qword ptr [r8 + 0x40]
0x100316e4f: mov rsi, qword ptr [rbp - 0x28]
0x100316e53: mov rdi, rbx
0x100316e56: call r14
0x100316e59: add rsp, 0x10
0x100316e5d: pop rbx
0x100316e5e: pop r12
0x100316e60: pop r14
0x100316e62: pop r15
0x100316e64: pop rbp
0x100316e65: ret 
0x100316e66: lea rdi, [rip + 0x846793] ; 0x100b5d600 1 == argCount
0x100316e6d: lea rsi, [rip + 0x846764] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x100316e74: mov edx, 0x23d
0x100316e79: mov ecx, 3
0x100316e7e: call 0x1007e5f70 ; 0x1007e5f70
0x100316e83: ud2 
0x100316e85: nop word ptr cs:[rax + rax]
