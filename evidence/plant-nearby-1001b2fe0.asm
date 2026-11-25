0x1001b2fe0: push rbp
0x1001b2fe1: mov rbp, rsp
0x1001b2fe4: push r14
0x1001b2fe6: push rbx
0x1001b2fe7: sub rsp, 0x10
0x1001b2feb: mov r14, rcx
0x1001b2fee: mov rax, rdx
0x1001b2ff1: mov rcx, rsi
0x1001b2ff4: mov qword ptr [rbp - 0x18], 0
0x1001b2ffc: mov rbx, qword ptr [rdi]
0x1001b2fff: lea rsi, [rbp - 0x18]
0x1001b3003: mov rdx, rcx
0x1001b3006: mov rcx, rax
0x1001b3009: call qword ptr [rbx + 0x40]
0x1001b300c: mov rax, qword ptr [rbp - 0x18]
0x1001b3010: test rax, rax
0x1001b3013: je 0x1001b3021
0x1001b3015: add rax, r14
0x1001b3018: add rsp, 0x10
0x1001b301c: pop rbx
0x1001b301d: pop r14
0x1001b301f: pop rbp
0x1001b3020: ret 
0x1001b3021: lea rdi, [rip + 0x9f0094] ; 0x100ba30bc t
0x1001b3028: lea rsi, [rip + 0x9aa5a9] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x1001b302f: mov edx, 0x3a9
0x1001b3034: mov ecx, 3
0x1001b3039: call 0x1007e5f70 ; 0x1007e5f70
0x1001b303e: ud2 
