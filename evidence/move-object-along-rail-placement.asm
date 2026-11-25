0x100486f40: push rbp
0x100486f41: mov rbp, rsp
0x100486f44: push rbx
0x100486f45: push rax
0x100486f46: mov rbx, rsi
0x100486f49: mov rdi, rbx
0x100486f4c: call 0x10032eea0 ; 0x10032eea0
0x100486f51: mov rax, qword ptr [rip + 0x1b82428] ; 0x102009380
0x100486f58: mov eax, dword ptr [rax + 0x38]
0x100486f5b: mov dword ptr [rbx + 8], eax
0x100486f5e: lea rax, [rip + 0x7902ab] ; 0x100c17210 `mH
0x100486f65: mov qword ptr [rbx], rax
0x100486f68: mov word ptr [rbx + 0x74], 0
0x100486f6e: mov dword ptr [rbx + 0xf0], 0xffffffff
0x100486f78: mov rax, rbx
0x100486f7b: add rsp, 8
0x100486f7f: pop rbx
0x100486f80: pop rbp
0x100486f81: ret 
0x100486f82: nop word ptr cs:[rax + rax]
