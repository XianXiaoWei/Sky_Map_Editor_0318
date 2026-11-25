0x1001b1f00: push rbp
0x1001b1f01: mov rbp, rsp
0x1001b1f04: push r14
0x1001b1f06: push rbx
0x1001b1f07: sub rsp, 0x10
0x1001b1f0b: mov r14, rcx
0x1001b1f0e: mov rax, rdx
0x1001b1f11: mov rcx, rsi
0x1001b1f14: mov qword ptr [rbp - 0x18], 0
0x1001b1f1c: mov rbx, qword ptr [rdi]
0x1001b1f1f: lea rsi, [rbp - 0x18]
0x1001b1f23: mov rdx, rcx
0x1001b1f26: mov rcx, rax
0x1001b1f29: call qword ptr [rbx + 0x40]
0x1001b1f2c: mov rax, qword ptr [rbp - 0x18]
0x1001b1f30: test rax, rax
0x1001b1f33: je 0x1001b1f41
0x1001b1f35: add rax, r14
0x1001b1f38: add rsp, 0x10
0x1001b1f3c: pop rbx
0x1001b1f3d: pop r14
0x1001b1f3f: pop rbp
0x1001b1f40: ret 
0x1001b1f41: lea rdi, [rip + 0x9f1174] ; 0x100ba30bc t
0x1001b1f48: lea rsi, [rip + 0x9ab689] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x1001b1f4f: mov edx, 0x3a9
0x1001b1f54: mov ecx, 3
0x1001b1f59: call 0x1007e5f70 ; 0x1007e5f70
0x1001b1f5e: ud2 
