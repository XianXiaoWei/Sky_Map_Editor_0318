0x1001a9cb0: push rbp
0x1001a9cb1: mov rbp, rsp
0x1001a9cb4: push rbx
0x1001a9cb5: push rax
0x1001a9cb6: mov rbx, rsi
0x1001a9cb9: mov rdi, rbx
0x1001a9cbc: call 0x10032eea0 ; 0x10032eea0
0x1001a9cc1: mov rax, qword ptr [rip + 0x1c30e68] ; 0x101ddab30
0x1001a9cc8: mov eax, dword ptr [rax + 0x38]
0x1001a9ccb: mov dword ptr [rbx + 8], eax
0x1001a9cce: mov rax, qword ptr [rip + 0xa60abb] ; 0x100c0a790
0x1001a9cd5: add rax, 0x10
0x1001a9cd9: mov qword ptr [rbx], rax
0x1001a9cdc: mov rax, rbx
0x1001a9cdf: add rsp, 8
0x1001a9ce3: pop rbx
0x1001a9ce4: pop rbp
0x1001a9ce5: ret 
