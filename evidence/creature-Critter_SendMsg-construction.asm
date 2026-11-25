0x1002669d0: push rbp
0x1002669d1: mov rbp, rsp
0x1002669d4: push rbx
0x1002669d5: push rax
0x1002669d6: mov rbx, rsi
0x1002669d9: mov rdi, rbx
0x1002669dc: call 0x10032eea0 ; 0x10032eea0
0x1002669e1: mov qword ptr [rbx + 0x38], 0
0x1002669e9: mov qword ptr [rbx + 0x50], 0
0x1002669f1: mov rax, qword ptr [rip + 0x1b7fec8] ; 0x101de68c0
0x1002669f8: mov eax, dword ptr [rax + 0x38]
0x1002669fb: mov dword ptr [rbx + 8], eax
0x1002669fe: lea rax, [rip + 0x9ad353] ; 0x100c13d58
0x100266a05: mov qword ptr [rbx], rax
0x100266a08: mov rax, rbx
0x100266a0b: add rsp, 8
0x100266a0f: pop rbx
0x100266a10: pop rbp
0x100266a11: ret 
