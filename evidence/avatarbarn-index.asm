0x1001031d0: push rbp
0x1001031d1: mov rbp, rsp
0x1001031d4: movsxd rax, esi
0x1001031d7: imul rax, rax, 0x2230
0x1001031de: lea rax, [rdi + rax + 0x20]
0x1001031e3: pop rbp
0x1001031e4: ret 
0x1001031e5: nop word ptr cs:[rax + rax]
