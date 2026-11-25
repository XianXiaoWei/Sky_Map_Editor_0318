0x10032b8b0: push rbp
0x10032b8b1: mov rbp, rsp
0x10032b8b4: push r15
0x10032b8b6: push r14
0x10032b8b8: push r12
0x10032b8ba: push rbx
0x10032b8bb: sub rsp, 0x10
0x10032b8bf: mov r15, r9
0x10032b8c2: mov rbx, rdx
0x10032b8c5: mov r12, rsi
0x10032b8c8: mov r14, rdi
0x10032b8cb: cmp dword ptr [rbp + 0x10], 1
0x10032b8cf: jne 0x10032b926
0x10032b8d1: call 0x1007abbf0 ; 0x1007abbf0
0x10032b8d6: add rbx, r12
0x10032b8d9: test r14b, 1
0x10032b8dd: je 0x10032b8e7
0x10032b8df: mov rax, qword ptr [rbx]
0x10032b8e2: mov r14, qword ptr [rax + r14 - 1]
0x10032b8e7: mov r12, qword ptr [r15]
0x10032b8ea: mov r15, qword ptr [r15 + 8]
0x10032b8ee: mov qword ptr [rbp - 0x28], 0
0x10032b8f6: call 0x100375c20 ; 0x100375c20
0x10032b8fb: mov r8, qword ptr [rax]
0x10032b8fe: lea rsi, [rbp - 0x28]
0x10032b902: mov rdi, rax
0x10032b905: mov rdx, r12
0x10032b908: mov rcx, r15
0x10032b90b: call qword ptr [r8 + 0x40]
0x10032b90f: mov rsi, qword ptr [rbp - 0x28]
0x10032b913: mov rdi, rbx
0x10032b916: call r14
0x10032b919: add rsp, 0x10
0x10032b91d: pop rbx
0x10032b91e: pop r12
0x10032b920: pop r14
0x10032b922: pop r15
0x10032b924: pop rbp
0x10032b925: ret 
0x10032b926: lea rdi, [rip + 0x831cd3] ; 0x100b5d600 1 == argCount
0x10032b92d: lea rsi, [rip + 0x831ca4] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x10032b934: mov edx, 0x23d
0x10032b939: mov ecx, 3
0x10032b93e: call 0x1007e5f70 ; 0x1007e5f70
0x10032b943: ud2 
0x10032b945: nop word ptr cs:[rax + rax]
