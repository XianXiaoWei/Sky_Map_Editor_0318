0x100266f50: push rbp
0x100266f51: mov rbp, rsp
0x100266f54: push rbx
0x100266f55: push rax
0x100266f56: mov rbx, rsi
0x100266f59: mov rdi, rbx
0x100266f5c: call 0x10032eea0 ; 0x10032eea0
0x100266f61: mov qword ptr [rbx + 0x38], 0
0x100266f69: mov qword ptr [rbx + 0x50], 0
0x100266f71: mov rax, qword ptr [rip + 0x1b7fbe8] ; 0x101de6b60
0x100266f78: mov eax, dword ptr [rax + 0x38]
0x100266f7b: mov dword ptr [rbx + 8], eax
0x100266f7e: lea rax, [rip + 0x9acef3] ; 0x100c13e78
0x100266f85: mov qword ptr [rbx], rax
0x100266f88: mov rax, rbx
0x100266f8b: add rsp, 8
0x100266f8f: pop rbx
0x100266f90: pop rbp
0x100266f91: ret 
