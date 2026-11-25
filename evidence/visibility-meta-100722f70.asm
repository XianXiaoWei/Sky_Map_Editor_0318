0x100722f70: push rbp
0x100722f71: mov rbp, rsp
0x100722f74: push r14
0x100722f76: push rbx
0x100722f77: sub rsp, 0x10
0x100722f7b: mov r14, rcx
0x100722f7e: mov rax, rdx
0x100722f81: mov rcx, rsi
0x100722f84: mov qword ptr [rbp - 0x18], 0
0x100722f8c: mov rbx, qword ptr [rdi]
0x100722f8f: lea rsi, [rbp - 0x18]
0x100722f93: mov rdx, rcx
0x100722f96: mov rcx, rax
0x100722f99: call qword ptr [rbx + 0x40]
0x100722f9c: mov rax, qword ptr [rbp - 0x18]
0x100722fa0: test rax, rax
0x100722fa3: je 0x100722fb1
0x100722fa5: add rax, r14
0x100722fa8: add rsp, 0x10
0x100722fac: pop rbx
0x100722fad: pop r14
0x100722faf: pop rbp
0x100722fb0: ret 
0x100722fb1: lea rdi, [rip + 0x480104] ; 0x100ba30bc t
0x100722fb8: lea rsi, [rip + 0x43a619] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x100722fbf: mov edx, 0x3a9
0x100722fc4: mov ecx, 3
0x100722fc9: call 0x1007e5f70 ; 0x1007e5f70
0x100722fce: ud2 
