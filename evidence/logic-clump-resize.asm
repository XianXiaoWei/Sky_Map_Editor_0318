0x10022c340: push rbp
0x10022c341: mov rbp, rsp
0x10022c344: push r14
0x10022c346: push rbx
0x10022c347: sub rsp, 0x10
0x10022c34b: mov r14, rcx
0x10022c34e: mov rax, rdx
0x10022c351: mov rcx, rsi
0x10022c354: mov qword ptr [rbp - 0x18], 0
0x10022c35c: mov rbx, qword ptr [rdi]
0x10022c35f: lea rsi, [rbp - 0x18]
0x10022c363: mov rdx, rcx
0x10022c366: mov rcx, rax
0x10022c369: call qword ptr [rbx + 0x40]
0x10022c36c: mov rax, qword ptr [rbp - 0x18]
0x10022c370: test rax, rax
0x10022c373: je 0x10022c381
0x10022c375: add rax, r14
0x10022c378: add rsp, 0x10
0x10022c37c: pop rbx
0x10022c37d: pop r14
0x10022c37f: pop rbp
0x10022c380: ret 
0x10022c381: lea rdi, [rip + 0x976d34] ; 0x100ba30bc t
0x10022c388: lea rsi, [rip + 0x931249] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x10022c38f: mov edx, 0x3a9
0x10022c394: mov ecx, 3
0x10022c399: call 0x1007e5f70 ; 0x1007e5f70
0x10022c39e: ud2 
