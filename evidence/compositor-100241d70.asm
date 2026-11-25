0x100241d70: push rbp
0x100241d71: mov rbp, rsp
0x100241d74: push r15
0x100241d76: push r14
0x100241d78: push rbx
0x100241d79: push rax
0x100241d7a: mov rbx, rdi
0x100241d7d: mov rdi, qword ptr [rbx + 0x1c8]
0x100241d84: mov rax, qword ptr [rdi]
0x100241d87: call qword ptr [rax + 0xd8]
0x100241d8d: test al, al
0x100241d8f: je 0x100241e00
0x100241d91: lea rdi, [rbx + 0x1d0]
0x100241d98: lea rsi, [rbx + 0x1b800]
0x100241d9f: lea rdx, [rip + 0x9399da] ; 0x100b7b780 rtScreenshot
0x100241da6: xor ecx, ecx
0x100241da8: call 0x100241f70 ; 0x100241f70
0x100241dad: mov r14, rax
0x100241db0: mov qword ptr [rbp - 0x20], 0
0x100241db8: mov rdi, qword ptr [rbx + 0x1c8]
0x100241dbf: mov rax, qword ptr [rdi]
0x100241dc2: lea rsi, [rbp - 0x20]
0x100241dc6: call qword ptr [rax + 0xc0]
0x100241dcc: mov r15, rax
0x100241dcf: test r15, r15
0x100241dd2: je 0x100241e00
0x100241dd4: call 0x1007c1470 ; 0x1007c1470
0x100241dd9: mov r8, qword ptr [rax]
0x100241ddc: mov esi, dword ptr [r14]
0x100241ddf: mov rcx, qword ptr [rbp - 0x20]
0x100241de3: mov rdi, rax
0x100241de6: mov rdx, r15
0x100241de9: call qword ptr [r8 + 0x130]
0x100241df0: mov rdi, qword ptr [rbx + 0x1c8]
0x100241df7: mov rax, qword ptr [rdi]
0x100241dfa: call qword ptr [rax + 0xc8]
0x100241e00: add rsp, 8
0x100241e04: pop rbx
0x100241e05: pop r14
0x100241e07: pop r15
0x100241e09: pop rbp
0x100241e0a: ret 
0x100241e0b: nop dword ptr [rax + rax]
