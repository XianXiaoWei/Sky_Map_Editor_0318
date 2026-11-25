0x100591d10: push rbp
0x100591d11: mov rbp, rsp
0x100591d14: push r14
0x100591d16: push rbx
0x100591d17: sub rsp, 0x10
0x100591d1b: mov r14, rcx
0x100591d1e: mov rax, rdx
0x100591d21: mov rcx, rsi
0x100591d24: mov qword ptr [rbp - 0x18], 0
0x100591d2c: mov rbx, qword ptr [rdi]
0x100591d2f: lea rsi, [rbp - 0x18]
0x100591d33: mov rdx, rcx
0x100591d36: mov rcx, rax
0x100591d39: call qword ptr [rbx + 0x40]
0x100591d3c: mov rax, qword ptr [rbp - 0x18]
0x100591d40: test rax, rax
0x100591d43: je 0x100591d51
0x100591d45: add rax, r14
0x100591d48: add rsp, 0x10
0x100591d4c: pop rbx
0x100591d4d: pop r14
0x100591d4f: pop rbp
0x100591d50: ret 
0x100591d51: lea rdi, [rip + 0x611364] ; 0x100ba30bc t
0x100591d58: lea rsi, [rip + 0x5cb879] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x100591d5f: mov edx, 0x3a9
0x100591d64: mov ecx, 3
0x100591d69: call 0x1007e5f70 ; 0x1007e5f70
0x100591d6e: ud2 
