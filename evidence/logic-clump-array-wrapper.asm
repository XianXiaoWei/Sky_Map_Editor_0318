0x10022c840: push rbp
0x10022c841: mov rbp, rsp
0x10022c844: push r15
0x10022c846: push r14
0x10022c848: push r12
0x10022c84a: push rbx
0x10022c84b: sub rsp, 0x10
0x10022c84f: mov r15, r9
0x10022c852: mov rbx, rdx
0x10022c855: mov r12, rsi
0x10022c858: mov r14, rdi
0x10022c85b: cmp dword ptr [rbp + 0x10], 1
0x10022c85f: jne 0x10022c8bf
0x10022c861: call 0x1007abbf0 ; 0x1007abbf0
0x10022c866: add rbx, r12
0x10022c869: test r14b, 1
0x10022c86d: je 0x10022c877
0x10022c86f: mov rax, qword ptr [rbx]
0x10022c872: mov r14, qword ptr [rax + r14 - 1]
0x10022c877: mov r12, qword ptr [r15]
0x10022c87a: mov r15, qword ptr [r15 + 8]
0x10022c87e: mov dword ptr [rbp - 0x24], 0
0x10022c885: mov dword ptr [rbp - 0x28], 0
0x10022c88c: lea rdi, [rbp - 0x28]
0x10022c890: call 0x1007abaf0 ; 0x1007abaf0
0x10022c895: mov r8, qword ptr [rax]
0x10022c898: lea rsi, [rbp - 0x24]
0x10022c89c: mov rdi, rax
0x10022c89f: mov rdx, r12
0x10022c8a2: mov rcx, r15
0x10022c8a5: call qword ptr [r8 + 0x40]
0x10022c8a9: mov esi, dword ptr [rbp - 0x24]
0x10022c8ac: mov rdi, rbx
0x10022c8af: call r14
0x10022c8b2: add rsp, 0x10
0x10022c8b6: pop rbx
0x10022c8b7: pop r12
0x10022c8b9: pop r14
0x10022c8bb: pop r15
0x10022c8bd: pop rbp
0x10022c8be: ret 
0x10022c8bf: lea rdi, [rip + 0x930d3a] ; 0x100b5d600 1 == argCount
0x10022c8c6: lea rsi, [rip + 0x930d0b] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x10022c8cd: mov edx, 0x23d
0x10022c8d2: mov ecx, 3
0x10022c8d7: call 0x1007e5f70 ; 0x1007e5f70
0x10022c8dc: ud2 
0x10022c8de: nop 
