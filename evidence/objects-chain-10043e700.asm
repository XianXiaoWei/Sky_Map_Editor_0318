0x10043e700: push rbp
0x10043e701: mov rbp, rsp
0x10043e704: push r15
0x10043e706: push r14
0x10043e708: push r12
0x10043e70a: push rbx
0x10043e70b: sub rsp, 0x10
0x10043e70f: mov r15, r9
0x10043e712: mov rbx, rdx
0x10043e715: mov r12, rsi
0x10043e718: mov r14, rdi
0x10043e71b: cmp dword ptr [rbp + 0x10], 1
0x10043e71f: jne 0x10043e77a
0x10043e721: call 0x1007abbf0 ; 0x1007abbf0
0x10043e726: add rbx, r12
0x10043e729: test r14b, 1
0x10043e72d: je 0x10043e737
0x10043e72f: mov rax, qword ptr [rbx]
0x10043e732: mov r14, qword ptr [rax + r14 - 1]
0x10043e737: mov r12, qword ptr [r15]
0x10043e73a: mov r15, qword ptr [r15 + 8]
0x10043e73e: mov byte ptr [rbp - 0x21], 0
0x10043e742: mov byte ptr [rbp - 0x22], 0
0x10043e746: lea rdi, [rbp - 0x22]
0x10043e74a: call 0x1007abbd0 ; 0x1007abbd0
0x10043e74f: mov r8, qword ptr [rax]
0x10043e752: lea rsi, [rbp - 0x21]
0x10043e756: mov rdi, rax
0x10043e759: mov rdx, r12
0x10043e75c: mov rcx, r15
0x10043e75f: call qword ptr [r8 + 0x40]
0x10043e763: movzx esi, byte ptr [rbp - 0x21]
0x10043e767: mov rdi, rbx
0x10043e76a: call r14
0x10043e76d: add rsp, 0x10
0x10043e771: pop rbx
0x10043e772: pop r12
0x10043e774: pop r14
0x10043e776: pop r15
0x10043e778: pop rbp
0x10043e779: ret 
0x10043e77a: lea rdi, [rip + 0x71ee7f] ; 0x100b5d600 1 == argCount
0x10043e781: lea rsi, [rip + 0x71ee50] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x10043e788: mov edx, 0x23d
0x10043e78d: mov ecx, 3
0x10043e792: call 0x1007e5f70 ; 0x1007e5f70
0x10043e797: ud2 
0x10043e799: nop dword ptr [rax]
