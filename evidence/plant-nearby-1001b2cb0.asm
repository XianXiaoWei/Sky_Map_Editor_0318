0x1001b2cb0: push rbp
0x1001b2cb1: mov rbp, rsp
0x1001b2cb4: push rbx
0x1001b2cb5: push rax
0x1001b2cb6: mov rbx, rsi
0x1001b2cb9: call 0x1007abc10 ; 0x1007abc10
0x1001b2cbe: mov eax, dword ptr [rax + 0x38]
0x1001b2cc1: mov dword ptr [rbx + 8], eax
0x1001b2cc4: call 0x1004b1530 ; 0x1004b1530
0x1001b2cc9: mov rax, qword ptr [rip + 0x1c288d0] ; 0x101ddb5a0
0x1001b2cd0: mov eax, dword ptr [rax + 0x38]
0x1001b2cd3: mov dword ptr [rbx + 8], eax
0x1001b2cd6: lea rax, [rip + 0xa5fbb3] ; 0x100c12890
0x1001b2cdd: mov qword ptr [rbx], rax
0x1001b2ce0: mov dword ptr [rbx + 0x1c], 0
0x1001b2ce7: mov rax, rbx
0x1001b2cea: add rsp, 8
0x1001b2cee: pop rbx
0x1001b2cef: pop rbp
0x1001b2cf0: ret 
0x1001b2cf1: nop word ptr cs:[rax + rax]
