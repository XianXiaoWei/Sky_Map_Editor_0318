0x10032fd60: push rbp
0x10032fd61: mov rbp, rsp
0x10032fd64: push r15
0x10032fd66: push r14
0x10032fd68: push r12
0x10032fd6a: push rbx
0x10032fd6b: sub rsp, 0x10
0x10032fd6f: mov r15, r9
0x10032fd72: mov rbx, rdx
0x10032fd75: mov r12, rsi
0x10032fd78: mov r14, rdi
0x10032fd7b: cmp dword ptr [rbp + 0x10], 1
0x10032fd7f: jne 0x10032fdda
0x10032fd81: call 0x1007abbf0 ; 0x1007abbf0
0x10032fd86: add rbx, r12
0x10032fd89: test r14b, 1
0x10032fd8d: je 0x10032fd97
0x10032fd8f: mov rax, qword ptr [rbx]
0x10032fd92: mov r14, qword ptr [rax + r14 - 1]
0x10032fd97: mov r12, qword ptr [r15]
0x10032fd9a: mov r15, qword ptr [r15 + 8]
0x10032fd9e: mov byte ptr [rbp - 0x21], 0
0x10032fda2: mov byte ptr [rbp - 0x22], 0
0x10032fda6: lea rdi, [rbp - 0x22]
0x10032fdaa: call 0x1007abbd0 ; 0x1007abbd0
0x10032fdaf: mov r8, qword ptr [rax]
0x10032fdb2: lea rsi, [rbp - 0x21]
0x10032fdb6: mov rdi, rax
0x10032fdb9: mov rdx, r12
0x10032fdbc: mov rcx, r15
0x10032fdbf: call qword ptr [r8 + 0x40]
0x10032fdc3: movzx esi, byte ptr [rbp - 0x21]
0x10032fdc7: mov rdi, rbx
0x10032fdca: call r14
0x10032fdcd: add rsp, 0x10
0x10032fdd1: pop rbx
0x10032fdd2: pop r12
0x10032fdd4: pop r14
0x10032fdd6: pop r15
0x10032fdd8: pop rbp
0x10032fdd9: ret 
0x10032fdda: lea rdi, [rip + 0x82d81f] ; 0x100b5d600 1 == argCount
0x10032fde1: lea rsi, [rip + 0x82d7f0] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x10032fde8: mov edx, 0x23d
0x10032fded: mov ecx, 3
0x10032fdf2: call 0x1007e5f70 ; 0x1007e5f70
0x10032fdf7: ud2 
0x10032fdf9: nop dword ptr [rax]
