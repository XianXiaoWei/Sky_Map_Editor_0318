0x100266c90: push rbp
0x100266c91: mov rbp, rsp
0x100266c94: push rbx
0x100266c95: push rax
0x100266c96: mov rbx, rsi
0x100266c99: mov rdi, rbx
0x100266c9c: call 0x10032eea0 ; 0x10032eea0
0x100266ca1: mov qword ptr [rbx + 0x38], 0
0x100266ca9: mov qword ptr [rbx + 0x50], 0
0x100266cb1: mov rax, qword ptr [rip + 0x1b7fc88] ; 0x101de6940
0x100266cb8: mov eax, dword ptr [rax + 0x38]
0x100266cbb: mov dword ptr [rbx + 8], eax
0x100266cbe: lea rax, [rip + 0x9ad123] ; 0x100c13de8
0x100266cc5: mov qword ptr [rbx], rax
0x100266cc8: mov rax, rbx
0x100266ccb: add rsp, 8
0x100266ccf: pop rbx
0x100266cd0: pop rbp
0x100266cd1: ret 
