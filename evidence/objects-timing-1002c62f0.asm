0x1002c62f0: push rbp
0x1002c62f1: mov rbp, rsp
0x1002c62f4: push rbx
0x1002c62f5: push rax
0x1002c62f6: mov rbx, rsi
0x1002c62f9: mov rdi, rbx
0x1002c62fc: call 0x10032eea0 ; 0x10032eea0
0x1002c6301: mov rax, qword ptr [rip + 0x1b276f0] ; 0x101ded9f8
0x1002c6308: mov eax, dword ptr [rax + 0x38]
0x1002c630b: mov dword ptr [rbx + 8], eax
0x1002c630e: mov rax, qword ptr [rip + 0x94714b] ; 0x100c0d460
0x1002c6315: add rax, 0x10
0x1002c6319: mov qword ptr [rbx], rax
0x1002c631c: mov dword ptr [rbx + 0x38], 0
0x1002c6323: mov qword ptr [rbx + 0x40], 0
0x1002c632b: mov rax, rbx
0x1002c632e: add rsp, 8
0x1002c6332: pop rbx
0x1002c6333: pop rbp
0x1002c6334: ret 
0x1002c6335: nop word ptr cs:[rax + rax]
