0x10027b6e0: push rbp
0x10027b6e1: mov rbp, rsp
0x10027b6e4: vmovss xmm1, dword ptr [rip + 0x8399c4] ; 0x100ab50b0
0x10027b6ec: vmaxss xmm1, xmm1, xmm0
0x10027b6f0: vmovss xmm2, dword ptr [rip + 0x8299c8] ; 0x100aa50c0
0x10027b6f8: vminss xmm1, xmm2, xmm1
0x10027b6fc: vmovss dword ptr [rdi + 0xd0], xmm1
0x10027b704: mov eax, dword ptr [rdi + 0x20]
0x10027b707: vmovss dword ptr [rsi + rax*4 + 0x930], xmm0
0x10027b710: pop rbp
0x10027b711: ret 
0x10027b712: nop word ptr cs:[rax + rax]

