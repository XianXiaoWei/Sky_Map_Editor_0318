0x1004039a0: push rbp
0x1004039a1: mov rbp, rsp
0x1004039a4: push r15
0x1004039a6: push r14
0x1004039a8: push r12
0x1004039aa: push rbx
0x1004039ab: sub rsp, 0x10
0x1004039af: mov r15, r9
0x1004039b2: mov rbx, rdx
0x1004039b5: mov r12, rsi
0x1004039b8: mov r14, rdi
0x1004039bb: cmp dword ptr [rbp + 0x10], 1
0x1004039bf: jne 0x100403a1a
0x1004039c1: call 0x1007abbf0 ; 0x1007abbf0
0x1004039c6: add rbx, r12
0x1004039c9: test r14b, 1
0x1004039cd: je 0x1004039d7
0x1004039cf: mov rax, qword ptr [rbx]
0x1004039d2: mov r14, qword ptr [rax + r14 - 1]
0x1004039d7: mov r12, qword ptr [r15]
0x1004039da: mov r15, qword ptr [r15 + 8]
0x1004039de: mov byte ptr [rbp - 0x21], 0
0x1004039e2: mov byte ptr [rbp - 0x22], 0
0x1004039e6: lea rdi, [rbp - 0x22]
0x1004039ea: call 0x1007abbd0 ; 0x1007abbd0
0x1004039ef: mov r8, qword ptr [rax]
0x1004039f2: lea rsi, [rbp - 0x21]
0x1004039f6: mov rdi, rax
0x1004039f9: mov rdx, r12
0x1004039fc: mov rcx, r15
0x1004039ff: call qword ptr [r8 + 0x40]
0x100403a03: movzx esi, byte ptr [rbp - 0x21]
0x100403a07: mov rdi, rbx
0x100403a0a: call r14
0x100403a0d: add rsp, 0x10
0x100403a11: pop rbx
0x100403a12: pop r12
0x100403a14: pop r14
0x100403a16: pop r15
0x100403a18: pop rbp
0x100403a19: ret 
0x100403a1a: lea rdi, [rip + 0x759bdf] ; 0x100b5d600 1 == argCount
0x100403a21: lea rsi, [rip + 0x759bb0] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x100403a28: mov edx, 0x23d
0x100403a2d: mov ecx, 3
0x100403a32: call 0x1007e5f70 ; 0x1007e5f70
0x100403a37: ud2 
0x100403a39: nop dword ptr [rax]
