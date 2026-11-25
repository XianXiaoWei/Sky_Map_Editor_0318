0x10022c720: push rbp
0x10022c721: mov rbp, rsp
0x10022c724: push r15
0x10022c726: push r14
0x10022c728: push r12
0x10022c72a: push rbx
0x10022c72b: sub rsp, 0x10
0x10022c72f: mov r15, r9
0x10022c732: mov rbx, rdx
0x10022c735: mov r12, rsi
0x10022c738: mov r14, rdi
0x10022c73b: cmp dword ptr [rbp + 0x10], 1
0x10022c73f: jne 0x10022c79a
0x10022c741: call 0x1007abbf0 ; 0x1007abbf0
0x10022c746: add rbx, r12
0x10022c749: test r14b, 1
0x10022c74d: je 0x10022c757
0x10022c74f: mov rax, qword ptr [rbx]
0x10022c752: mov r14, qword ptr [rax + r14 - 1]
0x10022c757: mov r12, qword ptr [r15]
0x10022c75a: mov r15, qword ptr [r15 + 8]
0x10022c75e: mov byte ptr [rbp - 0x21], 0
0x10022c762: mov byte ptr [rbp - 0x22], 0
0x10022c766: lea rdi, [rbp - 0x22]
0x10022c76a: call 0x1007abbd0 ; 0x1007abbd0
0x10022c76f: mov r8, qword ptr [rax]
0x10022c772: lea rsi, [rbp - 0x21]
0x10022c776: mov rdi, rax
0x10022c779: mov rdx, r12
0x10022c77c: mov rcx, r15
0x10022c77f: call qword ptr [r8 + 0x40]
0x10022c783: movzx esi, byte ptr [rbp - 0x21]
0x10022c787: mov rdi, rbx
0x10022c78a: call r14
0x10022c78d: add rsp, 0x10
0x10022c791: pop rbx
0x10022c792: pop r12
0x10022c794: pop r14
0x10022c796: pop r15
0x10022c798: pop rbp
0x10022c799: ret 
0x10022c79a: lea rdi, [rip + 0x930e5f] ; 0x100b5d600 1 == argCount
0x10022c7a1: lea rsi, [rip + 0x930e30] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x10022c7a8: mov edx, 0x23d
0x10022c7ad: mov ecx, 3
0x10022c7b2: call 0x1007e5f70 ; 0x1007e5f70
0x10022c7b7: ud2 
0x10022c7b9: nop dword ptr [rax]
