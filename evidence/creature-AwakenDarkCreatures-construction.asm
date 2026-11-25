0x100273b40: push rbp
0x100273b41: mov rbp, rsp
0x100273b44: push rbx
0x100273b45: push rax
0x100273b46: mov rbx, rsi
0x100273b49: mov rdi, rbx
0x100273b4c: call 0x10032eea0 ; 0x10032eea0
0x100273b51: mov rax, qword ptr [rip + 0x1b73c88] ; 0x101de77e0
0x100273b58: mov eax, dword ptr [rax + 0x38]
0x100273b5b: mov dword ptr [rbx + 8], eax
0x100273b5e: mov rax, qword ptr [rip + 0x99968b] ; 0x100c0d1f0
0x100273b65: add rax, 0x10
0x100273b69: mov qword ptr [rbx], rax
0x100273b6c: mov qword ptr [rbx + 0x38], 0
0x100273b74: mov rax, rbx
0x100273b77: add rsp, 8
0x100273b7b: pop rbx
0x100273b7c: pop rbp
0x100273b7d: ret 
