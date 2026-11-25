0x1006ad3f0: push rbp
0x1006ad3f1: mov rbp, rsp
0x1006ad3f4: mov rsi, qword ptr [rdi + 0x10]
0x1006ad3f8: mov rax, qword ptr [rsi + 0x1a8]
0x1006ad3ff: mov edx, dword ptr [rdi + 0x18]
0x1006ad402: movzx ecx, word ptr [rdi + 0x1c]
0x1006ad406: mov rdi, qword ptr [rdi + 0x20]
0x1006ad40a: cmp cx, word ptr [rax + rdx*2]
0x1006ad40e: jge 0x1006ad416
0x1006ad410: pop rbp
0x1006ad411: jmp 0x1006a81d0 ; 0x1006a81d0
0x1006ad416: pop rbp
0x1006ad417: jmp 0x1006a88c0 ; 0x1006a88c0
0x1006ad41c: nop dword ptr [rax]
