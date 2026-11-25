0x1004d2050: push rbp
0x1004d2051: mov rbp, rsp
0x1004d2054: push r15
0x1004d2056: push r14
0x1004d2058: push rbx
0x1004d2059: sub rsp, 0x28
0x1004d205d: mov qword ptr [rbp - 0x30], rdi
0x1004d2061: mov byte ptr [rbp - 0x19], 1
0x1004d2065: mov r14b, 1
0x1004d2068: test rdi, rdi
0x1004d206b: je 0x1004d210e
0x1004d2071: mov edi, dword ptr [rdi]
0x1004d2073: call 0x1007abd30 ; 0x1007abd30
0x1004d2078: mov rcx, qword ptr [rax]
0x1004d207b: mov rdi, rax
0x1004d207e: call qword ptr [rcx + 0x68]
0x1004d2081: test rax, rax
0x1004d2084: jne 0x1004d208b
0x1004d2086: call 0x1007abc60 ; 0x1007abc60
0x1004d208b: movzx edx, byte ptr [rip + 0x80108e] ; 0x100cd3120
0x1004d2092: lea rsi, [rip + 0x6a11da] ; 0x100b73273 GetEnabled
0x1004d2099: mov rdi, rax
0x1004d209c: call 0x1004d2330 ; 0x1004d2330
0x1004d20a1: mov rbx, rax
0x1004d20a4: test rbx, rbx
0x1004d20a7: je 0x1004d210e
0x1004d20a9: call 0x1007abc10 ; 0x1007abc10
0x1004d20ae: mov r15, rax
0x1004d20b1: mov byte ptr [rbp - 0x28], 0
0x1004d20b5: lea rdi, [rbp - 0x28]
0x1004d20b9: call 0x1007abbd0 ; 0x1007abbd0
0x1004d20be: mov r14, rax
0x1004d20c1: mov qword ptr [rbp - 0x28], 0
0x1004d20c9: call qword ptr [rbx + 0x58]
0x1004d20cc: mov r8, qword ptr [rax]
0x1004d20cf: lea rsi, [rbp - 0x28]
0x1004d20d3: lea rdx, [rbp - 0x30]
0x1004d20d7: mov rdi, rax
0x1004d20da: mov rcx, r15
0x1004d20dd: call qword ptr [r8 + 0x40]
0x1004d20e1: mov rdx, qword ptr [rbp - 0x28]
0x1004d20e5: test rdx, rdx
0x1004d20e8: je 0x1004d211c
0x1004d20ea: mov rdi, qword ptr [rbx + 0x38]
0x1004d20ee: mov rsi, qword ptr [rbx + 0x40]
0x1004d20f2: mov dword ptr [rsp], 0
0x1004d20f9: lea rcx, [rbp - 0x19]
0x1004d20fd: xor r9d, r9d
0x1004d2100: mov r8, r14
0x1004d2103: call qword ptr [rbx + 0x48]
0x1004d2106: cmp byte ptr [rbp - 0x19], 0
0x1004d210a: setne r14b
0x1004d210e: mov eax, r14d
0x1004d2111: add rsp, 0x28
0x1004d2115: pop rbx
0x1004d2116: pop r14
0x1004d2118: pop r15
0x1004d211a: pop rbp
0x1004d211b: ret 
0x1004d211c: lea rdi, [rip + 0x6a5d53] ; 0x100b77e76 c
0x1004d2123: lea rsi, [rip + 0x68b4ae] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x1004d212a: mov edx, 0x443
0x1004d212f: mov ecx, 3
0x1004d2134: call 0x1007e5f70 ; 0x1007e5f70
0x1004d2139: ud2 
0x1004d213b: nop dword ptr [rax + rax]
