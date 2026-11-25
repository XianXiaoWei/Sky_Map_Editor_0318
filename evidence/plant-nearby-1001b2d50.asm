0x1001b2d50: push rbp
0x1001b2d51: mov rbp, rsp
0x1001b2d54: push r14
0x1001b2d56: push rbx
0x1001b2d57: sub rsp, 0x10
0x1001b2d5b: mov r14, rcx
0x1001b2d5e: mov rax, rdx
0x1001b2d61: mov rcx, rsi
0x1001b2d64: mov qword ptr [rbp - 0x18], 0
0x1001b2d6c: mov rbx, qword ptr [rdi]
0x1001b2d6f: lea rsi, [rbp - 0x18]
0x1001b2d73: mov rdx, rcx
0x1001b2d76: mov rcx, rax
0x1001b2d79: call qword ptr [rbx + 0x40]
0x1001b2d7c: mov rax, qword ptr [rbp - 0x18]
0x1001b2d80: test rax, rax
0x1001b2d83: je 0x1001b2d91
0x1001b2d85: add rax, r14
0x1001b2d88: add rsp, 0x10
0x1001b2d8c: pop rbx
0x1001b2d8d: pop r14
0x1001b2d8f: pop rbp
0x1001b2d90: ret 
0x1001b2d91: lea rdi, [rip + 0x9f0324] ; 0x100ba30bc t
0x1001b2d98: lea rsi, [rip + 0x9aa839] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x1001b2d9f: mov edx, 0x3a9
0x1001b2da4: mov ecx, 3
0x1001b2da9: call 0x1007e5f70 ; 0x1007e5f70
0x1001b2dae: ud2 
