0x1007175d0: push rbp
0x1007175d1: mov rbp, rsp
0x1007175d4: push rbx
0x1007175d5: push rax
0x1007175d6: mov rbx, rsi
0x1007175d9: mov rdi, rbx
0x1007175dc: call 0x10032eea0 ; 0x10032eea0
0x1007175e1: mov rax, qword ptr [rip + 0x1923768] ; 0x10203ad50
0x1007175e8: mov eax, dword ptr [rax + 0x38]
0x1007175eb: mov dword ptr [rbx + 8], eax
0x1007175ee: mov rax, qword ptr [rip + 0x4f5f43] ; 0x100c0d538
0x1007175f5: add rax, 0x10
0x1007175f9: mov qword ptr [rbx], rax
0x1007175fc: mov rax, rbx
0x1007175ff: add rsp, 8
0x100717603: pop rbx
0x100717604: pop rbp
0x100717605: ret 
0x100717606: nop word ptr cs:[rax + rax]
