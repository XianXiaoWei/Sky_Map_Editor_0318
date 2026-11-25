0x10058abf0: push rbp
0x10058abf1: mov rbp, rsp
0x10058abf4: push rbx
0x10058abf5: push rax
0x10058abf6: mov rbx, rsi
0x10058abf9: mov rdi, rbx
0x10058abfc: call 0x10032eea0 ; 0x10032eea0
0x10058ac01: mov rax, qword ptr [rip + 0x1a94430] ; 0x10201f038
0x10058ac08: mov eax, dword ptr [rax + 0x38]
0x10058ac0b: mov dword ptr [rbx + 8], eax
0x10058ac0e: lea rax, [rip + 0x68e6eb] ; 0x100c19300
0x10058ac15: mov qword ptr [rbx], rax
0x10058ac18: mov qword ptr [rbx + 0x38], 0
0x10058ac20: mov rax, rbx
0x10058ac23: add rsp, 8
0x10058ac27: pop rbx
0x10058ac28: pop rbp
0x10058ac29: ret 
0x10058ac2a: nop word ptr [rax + rax]
