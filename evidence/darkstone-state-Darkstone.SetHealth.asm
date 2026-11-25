0x10027e3d0: push rbp
0x10027e3d1: mov rbp, rsp
0x10027e3d4: vmovss xmm1, dword ptr [rip + 0x836cd4] ; 0x100ab50b0
0x10027e3dc: vmaxss xmm0, xmm1, xmm0
0x10027e3e0: vmovss xmm1, dword ptr [rip + 0x826cd8] ; 0x100aa50c0
0x10027e3e8: vminss xmm0, xmm1, xmm0
0x10027e3ec: vmovss dword ptr [rdi + 0xd0], xmm0
0x10027e3f4: pop rbp
0x10027e3f5: ret 
0x10027e3f6: nop word ptr cs:[rax + rax]

