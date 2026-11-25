0x100146d00: push rbp
0x100146d01: mov rbp, rsp
0x100146d04: push rbx
0x100146d05: sub rsp, 0x38
0x100146d09: mov rbx, rdi
0x100146d0c: vmovaps xmm2, xmmword ptr [rdx]
0x100146d10: vmulps xmm0, xmm2, xmm2
0x100146d14: vmovshdup xmm1, xmm0
0x100146d18: vaddss xmm1, xmm0, xmm1
0x100146d1c: vpermilpd xmm0, xmm0, 1
0x100146d22: vaddss xmm0, xmm0, xmm1
0x100146d26: vsqrtss xmm0, xmm0, xmm0
0x100146d2a: vmovaps xmm3, xmmword ptr [rsi]
0x100146d2e: vxorps xmm1, xmm1, xmm1
0x100146d32: vucomiss xmm0, xmm1
0x100146d36: jne 0x100146d68
0x100146d38: jp 0x100146d68
0x100146d3a: vmovaps xmm1, xmmword ptr [rcx]
0x100146d3e: vpermilps xmm0, xmm3, 0xd2
0x100146d44: vmulps xmm0, xmm0, xmm1
0x100146d48: vmovaps xmmword ptr [rbp - 0x30], xmm1
0x100146d4d: vpermilps xmm1, xmm1, 0xd2
0x100146d53: vmulps xmm1, xmm3, xmm1
0x100146d57: vsubps xmm0, xmm0, xmm1
0x100146d5b: vpermilps xmm0, xmm0, 0xd2
0x100146d61: vmovaps xmmword ptr [rbp - 0x20], xmm0
0x100146d66: jmp 0x100146d76 ; 0x100146d76
0x100146d68: vmovaps xmm0, xmmword ptr [rcx]
0x100146d6c: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x100146d71: vmovaps xmmword ptr [rbp - 0x20], xmm2
0x100146d76: vpermilpd xmm1, xmm3, 1
0x100146d7c: vmovaps xmm0, xmm3
0x100146d80: vmovaps xmmword ptr [rbp - 0x40], xmm3
0x100146d85: call 0x100aa25a0 ; 0x100aa25a0 _atan2f
0x100146d8a: vmovss dword ptr [rbx], xmm0
0x100146d8e: vmovshdup xmm0, xmmword ptr [rbp - 0x40]
0x100146d93: vmovss xmm1, dword ptr [rip + 0x95e329] ; 0x100aa50c4
0x100146d9b: vmaxss xmm0, xmm1, xmm0
0x100146d9f: vmovss xmm1, dword ptr [rip + 0x95e319] ; 0x100aa50c0
0x100146da7: vminss xmm0, xmm1, xmm0
0x100146dab: call 0x100aa2588 ; 0x100aa2588 _asinf
0x100146db0: vmovss dword ptr [rbx + 4], xmm0
0x100146db5: vmovshdup xmm0, xmmword ptr [rbp - 0x20]
0x100146dba: vxorps xmm0, xmm0, xmmword ptr [rip + 0x960b3e] ; 0x100aa7900
0x100146dc2: vmovshdup xmm1, xmmword ptr [rbp - 0x30]
0x100146dc7: call 0x100aa25a0 ; 0x100aa25a0 _atan2f
0x100146dcc: vmovss dword ptr [rbx + 8], xmm0
0x100146dd1: mov rax, rbx
0x100146dd4: add rsp, 0x38
0x100146dd8: pop rbx
0x100146dd9: pop rbp
0x100146dda: ret 
0x100146ddb: nop dword ptr [rax + rax]
