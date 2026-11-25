0x10062cb10: push rbp
0x10062cb11: mov rbp, rsp
0x10062cb14: vmovaps xmm1, xmmword ptr [rdx]
0x10062cb18: vsubps xmm1, xmm1, xmmword ptr [rsi]
0x10062cb1c: vmulps xmm2, xmm1, xmm1
0x10062cb20: vmovshdup xmm3, xmm2
0x10062cb24: vaddss xmm3, xmm2, xmm3
0x10062cb28: vpermilpd xmm2, xmm2, 1
0x10062cb2e: vaddss xmm2, xmm2, xmm3
0x10062cb32: vsqrtss xmm2, xmm2, xmm2
0x10062cb36: vucomiss xmm2, dword ptr [rip + 0x47ad86] ; 0x100aa78c4
0x10062cb3e: jbe 0x10062cb4a
0x10062cb40: vpermilps xmm2, xmm2, 0xc0
0x10062cb46: vdivps xmm1, xmm1, xmm2
0x10062cb4a: vbroadcastss xmm2, dword ptr [rsi + 0x54]
0x10062cb50: vmulps xmm1, xmm1, xmm2
0x10062cb54: vpermilps xmm0, xmm0, 0xc0
0x10062cb5a: vmulps xmm0, xmm0, xmm1
0x10062cb5e: vsubps xmm0, xmm0, xmmword ptr [rsi + 0x40]
0x10062cb63: vmovaps xmmword ptr [rdi], xmm0
0x10062cb67: mov rax, rdi
0x10062cb6a: pop rbp
0x10062cb6b: ret 
0x10062cb6c: nop dword ptr [rax]
