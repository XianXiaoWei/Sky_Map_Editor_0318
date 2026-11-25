0x10032b9d0: push rbp
0x10032b9d1: mov rbp, rsp
0x10032b9d4: push r15
0x10032b9d6: push r14
0x10032b9d8: push r12
0x10032b9da: push rbx
0x10032b9db: sub rsp, 0x10
0x10032b9df: mov r15, r9
0x10032b9e2: mov rbx, rdx
0x10032b9e5: mov r12, rsi
0x10032b9e8: mov r14, rdi
0x10032b9eb: cmp dword ptr [rbp + 0x10], 1
0x10032b9ef: jne 0x10032ba46
0x10032b9f1: call 0x1007abbf0 ; 0x1007abbf0
0x10032b9f6: add rbx, r12
0x10032b9f9: test r14b, 1
0x10032b9fd: je 0x10032ba07
0x10032b9ff: mov rax, qword ptr [rbx]
0x10032ba02: mov r14, qword ptr [rax + r14 - 1]
0x10032ba07: mov r12, qword ptr [r15]
0x10032ba0a: mov r15, qword ptr [r15 + 8]
0x10032ba0e: mov qword ptr [rbp - 0x28], 0
0x10032ba16: call 0x10058e660 ; 0x10058e660
0x10032ba1b: mov r8, qword ptr [rax]
0x10032ba1e: lea rsi, [rbp - 0x28]
0x10032ba22: mov rdi, rax
0x10032ba25: mov rdx, r12
0x10032ba28: mov rcx, r15
0x10032ba2b: call qword ptr [r8 + 0x40]
0x10032ba2f: mov rsi, qword ptr [rbp - 0x28]
0x10032ba33: mov rdi, rbx
0x10032ba36: call r14
0x10032ba39: add rsp, 0x10
0x10032ba3d: pop rbx
0x10032ba3e: pop r12
0x10032ba40: pop r14
0x10032ba42: pop r15
0x10032ba44: pop rbp
0x10032ba45: ret 
0x10032ba46: lea rdi, [rip + 0x831bb3] ; 0x100b5d600 1 == argCount
0x10032ba4d: lea rsi, [rip + 0x831b84] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x10032ba54: mov edx, 0x23d
0x10032ba59: mov ecx, 3
0x10032ba5e: call 0x1007e5f70 ; 0x1007e5f70
0x10032ba63: ud2 
0x10032ba65: nop word ptr cs:[rax + rax]
