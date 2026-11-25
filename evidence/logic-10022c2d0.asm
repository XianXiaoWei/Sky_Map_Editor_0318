0x10022c2d0: push rbp
0x10022c2d1: mov rbp, rsp
0x10022c2d4: push rbx
0x10022c2d5: push rax
0x10022c2d6: mov rbx, rsi
0x10022c2d9: call 0x1007abc10 ; 0x1007abc10
0x10022c2de: mov rax, qword ptr [rip + 0x1bb69a3] ; 0x101de2c88
0x10022c2e5: mov eax, dword ptr [rax + 0x38]
0x10022c2e8: mov dword ptr [rbx], eax
0x10022c2ea: mov qword ptr [rbx + 8], 0
0x10022c2f2: mov dword ptr [rbx + 0x10], 0
0x10022c2f9: mov qword ptr [rbx + 0x18], 0
0x10022c301: mov rax, rbx
0x10022c304: add rsp, 8
0x10022c308: pop rbx
0x10022c309: pop rbp
0x10022c30a: ret 
0x10022c30b: nop dword ptr [rax + rax]
