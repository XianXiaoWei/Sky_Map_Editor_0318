0x1002674a0: push rbp
0x1002674a1: mov rbp, rsp
0x1002674a4: push rbx
0x1002674a5: push rax
0x1002674a6: mov rbx, rsi
0x1002674a9: mov rdi, rbx
0x1002674ac: call 0x10032eea0 ; 0x10032eea0
0x1002674b1: mov rax, qword ptr [rip + 0x1b7f928] ; 0x101de6de0
0x1002674b8: mov eax, dword ptr [rax + 0x38]
0x1002674bb: mov dword ptr [rbx + 8], eax
0x1002674be: lea rax, [rip + 0x9aca63] ; 0x100c13f28  e&
0x1002674c5: mov qword ptr [rbx], rax
0x1002674c8: mov rax, rbx
0x1002674cb: add rsp, 8
0x1002674cf: pop rbx
0x1002674d0: pop rbp
0x1002674d1: ret 
