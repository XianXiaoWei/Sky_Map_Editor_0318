0x100221b70: push rbp
0x100221b71: mov rbp, rsp
0x100221b74: push rbx
0x100221b75: push rax
0x100221b76: mov rbx, rsi
0x100221b79: call 0x1007abc10 ; 0x1007abc10
0x100221b7e: mov eax, dword ptr [rax + 0x38]
0x100221b81: mov dword ptr [rbx + 8], eax
0x100221b84: call 0x10074a170 ; 0x10074a170
0x100221b89: mov eax, dword ptr [rax + 0x38]
0x100221b8c: mov dword ptr [rbx + 8], eax
0x100221b8f: mov rax, qword ptr [rip + 0x9ebada] ; 0x100c0d670
0x100221b96: add rax, 0x10
0x100221b9a: mov qword ptr [rbx], rax
0x100221b9d: call 0x100407ab0 ; 0x100407ab0
0x100221ba2: mov rax, qword ptr [rip + 0x1bc06f7] ; 0x101de22a0
0x100221ba9: mov eax, dword ptr [rax + 0x38]
0x100221bac: mov dword ptr [rbx + 8], eax
0x100221baf: lea rax, [rip + 0x9f18fa] ; 0x100c134b0
0x100221bb6: mov qword ptr [rbx], rax
0x100221bb9: vxorps xmm0, xmm0, xmm0
0x100221bbd: vmovups xmmword ptr [rbx + 0x58], xmm0
0x100221bc2: mov qword ptr [rbx + 0x68], 0
0x100221bca: mov rax, rbx
0x100221bcd: add rsp, 8
0x100221bd1: pop rbx
0x100221bd2: pop rbp
0x100221bd3: ret 
