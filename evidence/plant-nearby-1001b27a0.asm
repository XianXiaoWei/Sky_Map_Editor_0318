0x1001b27a0: push rbp
0x1001b27a1: mov rbp, rsp
0x1001b27a4: push r15
0x1001b27a6: push r14
0x1001b27a8: push r12
0x1001b27aa: push rbx
0x1001b27ab: sub rsp, 0x10
0x1001b27af: mov r15, r9
0x1001b27b2: mov rbx, rdx
0x1001b27b5: mov r12, rsi
0x1001b27b8: mov r14, rdi
0x1001b27bb: cmp dword ptr [rbp + 0x10], 1
0x1001b27bf: jne 0x1001b2816
0x1001b27c1: call 0x1007abbf0 ; 0x1007abbf0
0x1001b27c6: add rbx, r12
0x1001b27c9: test r14b, 1
0x1001b27cd: je 0x1001b27d7
0x1001b27cf: mov rax, qword ptr [rbx]
0x1001b27d2: mov r14, qword ptr [rax + r14 - 1]
0x1001b27d7: mov r12, qword ptr [r15]
0x1001b27da: mov r15, qword ptr [r15 + 8]
0x1001b27de: mov qword ptr [rbp - 0x28], 0
0x1001b27e6: call 0x100375c20 ; 0x100375c20
0x1001b27eb: mov r8, qword ptr [rax]
0x1001b27ee: lea rsi, [rbp - 0x28]
0x1001b27f2: mov rdi, rax
0x1001b27f5: mov rdx, r12
0x1001b27f8: mov rcx, r15
0x1001b27fb: call qword ptr [r8 + 0x40]
0x1001b27ff: mov rsi, qword ptr [rbp - 0x28]
0x1001b2803: mov rdi, rbx
0x1001b2806: call r14
0x1001b2809: add rsp, 0x10
0x1001b280d: pop rbx
0x1001b280e: pop r12
0x1001b2810: pop r14
0x1001b2812: pop r15
0x1001b2814: pop rbp
0x1001b2815: ret 
0x1001b2816: lea rdi, [rip + 0x9aade3] ; 0x100b5d600 1 == argCount
0x1001b281d: lea rsi, [rip + 0x9aadb4] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x1001b2824: mov edx, 0x23d
0x1001b2829: mov ecx, 3
0x1001b282e: call 0x1007e5f70 ; 0x1007e5f70
0x1001b2833: ud2 
0x1001b2835: nop word ptr cs:[rax + rax]
