0x1001b28c0: push rbp
0x1001b28c1: mov rbp, rsp
0x1001b28c4: push r15
0x1001b28c6: push r14
0x1001b28c8: push r13
0x1001b28ca: push r12
0x1001b28cc: push rbx
0x1001b28cd: sub rsp, 0x18
0x1001b28d1: mov r15, r8
0x1001b28d4: mov rbx, rdx
0x1001b28d7: mov r12, rdi
0x1001b28da: cmp dword ptr [rbp + 0x10], 1
0x1001b28de: jne 0x1001b2952
0x1001b28e0: add rbx, rsi
0x1001b28e3: test r12b, 1
0x1001b28e7: mov qword ptr [rbp - 0x38], rcx
0x1001b28eb: je 0x1001b28f5
0x1001b28ed: mov rax, qword ptr [rbx]
0x1001b28f0: mov r12, qword ptr [rax + r12 - 1]
0x1001b28f5: mov r13, qword ptr [r9]
0x1001b28f8: mov r14, qword ptr [r9 + 8]
0x1001b28fc: mov qword ptr [rbp - 0x30], 0
0x1001b2904: call 0x1007abc30 ; 0x1007abc30
0x1001b2909: mov r8, qword ptr [rax]
0x1001b290c: lea rsi, [rbp - 0x30]
0x1001b2910: mov rdi, rax
0x1001b2913: mov rdx, r13
0x1001b2916: mov rcx, r14
0x1001b2919: call qword ptr [r8 + 0x40]
0x1001b291d: mov rsi, qword ptr [rbp - 0x30]
0x1001b2921: mov rdi, rbx
0x1001b2924: call r12
0x1001b2927: mov qword ptr [rbp - 0x30], rax
0x1001b292b: mov rax, qword ptr [r15]
0x1001b292e: mov rcx, qword ptr [rip + 0x1c284cb] ; 0x101ddae00
0x1001b2935: lea rdx, [rbp - 0x30]
0x1001b2939: mov rdi, r15
0x1001b293c: mov rsi, qword ptr [rbp - 0x38]
0x1001b2940: call qword ptr [rax + 0x40]
0x1001b2943: add rsp, 0x18
0x1001b2947: pop rbx
0x1001b2948: pop r12
0x1001b294a: pop r13
0x1001b294c: pop r14
0x1001b294e: pop r15
0x1001b2950: pop rbp
0x1001b2951: ret 
0x1001b2952: lea rdi, [rip + 0x9aaca7] ; 0x100b5d600 1 == argCount
0x1001b2959: lea rsi, [rip + 0x9aac78] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x1001b2960: mov edx, 0x23d
0x1001b2965: mov ecx, 3
0x1001b296a: call 0x1007e5f70 ; 0x1007e5f70
0x1001b296f: ud2 
0x1001b2971: nop word ptr cs:[rax + rax]
