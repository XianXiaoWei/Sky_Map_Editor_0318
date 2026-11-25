0x1001b2720: push rbp
0x1001b2721: mov rbp, rsp
0x1001b2724: push r15
0x1001b2726: push r14
0x1001b2728: push rbx
0x1001b2729: push rax
0x1001b272a: mov rbx, rdx
0x1001b272d: mov r14, rsi
0x1001b2730: mov r15, rdi
0x1001b2733: cmp dword ptr [rbp + 0x10], 0
0x1001b2737: jne 0x1001b2761
0x1001b2739: call 0x1007abbf0 ; 0x1007abbf0
0x1001b273e: add rbx, r14
0x1001b2741: test r15b, 1
0x1001b2745: mov rcx, r15
0x1001b2748: je 0x1001b2752
0x1001b274a: mov rax, qword ptr [rbx]
0x1001b274d: mov rcx, qword ptr [rax + rcx - 1]
0x1001b2752: mov rdi, rbx
0x1001b2755: add rsp, 8
0x1001b2759: pop rbx
0x1001b275a: pop r14
0x1001b275c: pop r15
0x1001b275e: pop rbp
0x1001b275f: jmp rcx
0x1001b2761: lea rdi, [rip + 0x9aaeb4] ; 0x100b5d61c 0 == argCount
0x1001b2768: lea rsi, [rip + 0x9aae69] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x1001b276f: mov edx, 0x23d
0x1001b2774: mov ecx, 3
0x1001b2779: call 0x1007e5f70 ; 0x1007e5f70
0x1001b277e: ud2 
