0x1001b26b0: push rbp
0x1001b26b1: mov rbp, rsp
0x1001b26b4: push r14
0x1001b26b6: push rbx
0x1001b26b7: sub rsp, 0x10
0x1001b26bb: mov r14, rcx
0x1001b26be: mov rax, rdx
0x1001b26c1: mov rcx, rsi
0x1001b26c4: mov qword ptr [rbp - 0x18], 0
0x1001b26cc: mov rbx, qword ptr [rdi]
0x1001b26cf: lea rsi, [rbp - 0x18]
0x1001b26d3: mov rdx, rcx
0x1001b26d6: mov rcx, rax
0x1001b26d9: call qword ptr [rbx + 0x40]
0x1001b26dc: mov rax, qword ptr [rbp - 0x18]
0x1001b26e0: test rax, rax
0x1001b26e3: je 0x1001b26f1
0x1001b26e5: add rax, r14
0x1001b26e8: add rsp, 0x10
0x1001b26ec: pop rbx
0x1001b26ed: pop r14
0x1001b26ef: pop rbp
0x1001b26f0: ret 
0x1001b26f1: lea rdi, [rip + 0x9f09c4] ; 0x100ba30bc t
0x1001b26f8: lea rsi, [rip + 0x9aaed9] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x1001b26ff: mov edx, 0x3a9
0x1001b2704: mov ecx, 3
0x1001b2709: call 0x1007e5f70 ; 0x1007e5f70
0x1001b270e: ud2 
