0x100722ee0: push rbp
0x100722ee1: mov rbp, rsp
0x100722ee4: push rbx
0x100722ee5: push rax
0x100722ee6: mov rbx, rsi
0x100722ee9: call 0x1007abc10 ; 0x1007abc10
0x100722eee: mov eax, dword ptr [rax + 0x38]
0x100722ef1: mov dword ptr [rbx], eax
0x100722ef3: call 0x1007b0280 ; 0x1007b0280
0x100722ef8: mov rax, qword ptr [rip + 0x1918cf9] ; 0x10203bbf8
0x100722eff: mov eax, dword ptr [rax + 0x38]
0x100722f02: mov dword ptr [rbx], eax
0x100722f04: mov qword ptr [rbx + 0x10], 0
0x100722f0c: mov dword ptr [rbx + 0x218], 0
0x100722f16: vxorps xmm0, xmm0, xmm0
0x100722f1a: vmovups xmmword ptr [rbx + 0x20], xmm0
0x100722f1f: vmovups xmmword ptr [rbx + 0x220], xmm0
0x100722f27: mov rax, rbx
0x100722f2a: add rsp, 8
0x100722f2e: pop rbx
0x100722f2f: pop rbp
0x100722f30: ret 
0x100722f31: nop word ptr cs:[rax + rax]
