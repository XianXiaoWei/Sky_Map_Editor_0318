0x10043e1b0: push rbp
0x10043e1b1: mov rbp, rsp
0x10043e1b4: push rbx
0x10043e1b5: push rax
0x10043e1b6: mov rbx, rsi
0x10043e1b9: call 0x1007abc10 ; 0x1007abc10
0x10043e1be: mov eax, dword ptr [rax + 0x38]
0x10043e1c1: mov dword ptr [rbx + 8], eax
0x10043e1c4: call 0x10074a170 ; 0x10074a170
0x10043e1c9: mov rax, qword ptr [rip + 0x1bc63e8] ; 0x1020045b8
0x10043e1d0: mov eax, dword ptr [rax + 0x38]
0x10043e1d3: mov dword ptr [rbx + 8], eax
0x10043e1d6: mov rax, qword ptr [rip + 0x7cf2b3] ; 0x100c0d490
0x10043e1dd: add rax, 0x10
0x10043e1e1: mov qword ptr [rbx], rax
0x10043e1e4: mov rax, rbx
0x10043e1e7: add rsp, 8
0x10043e1eb: pop rbx
0x10043e1ec: pop rbp
0x10043e1ed: ret 
0x10043e1ee: nop 
