0x1007191a0: push rbp
0x1007191a1: mov rbp, rsp
0x1007191a4: mov rax, qword ptr [rdi + 0x38]
0x1007191a8: mov rcx, qword ptr [rdi + 0x40]
0x1007191ac: vmovss xmm0, dword ptr [rax + 0x10]
0x1007191b1: vmulss xmm0, xmm0, dword ptr [rcx + 0x10]
0x1007191b6: mov rax, qword ptr [rdi + 0x48]
0x1007191ba: vmovss dword ptr [rax + 0x10], xmm0
0x1007191bf: pop rbp
0x1007191c0: ret 
0x1007191c1: nop word ptr cs:[rax + rax]
