0x10076dc80: push rbp
0x10076dc81: mov rbp, rsp
0x10076dc84: vmovaps xmm0, xmmword ptr [rsi + 0xc0]
0x10076dc8c: vmovaps xmm1, xmmword ptr [rsi + 0xd0]
0x10076dc94: vmovapd xmm2, xmmword ptr [rsi + 0xe0]
0x10076dc9c: vmovaps xmm3, xmmword ptr [rsi + 0xf0]
0x10076dca4: vinsertps xmm4, xmm0, xmm1, 0x1c
0x10076dcaa: vunpcklpd xmm4, xmm4, xmm2
0x10076dcae: vinsertps xmm5, xmm1, xmm0, 0x4c
0x10076dcb4: vshufps xmm5, xmm5, xmm2, 0xd4
0x10076dcb9: vunpckhps xmm0, xmm0, xmm1
0x10076dcbd: vblendpd xmm0, xmm2, xmm0, 1
0x10076dcc3: vpermilps xmm1, xmm3, 0xc0
0x10076dcc9: vmulps xmm1, xmm1, xmm4
0x10076dccd: vpermilps xmm2, xmm3, 0xd5
0x10076dcd3: vmulps xmm2, xmm2, xmm5
0x10076dcd7: vpermilps xmm3, xmm3, 0xea
0x10076dcdd: vmulps xmm3, xmm3, xmm0
0x10076dce1: vaddps xmm2, xmm2, xmm3
0x10076dce5: vaddps xmm1, xmm1, xmm2
0x10076dce9: vxorps xmm1, xmm1, xmmword ptr [rip + 0x339c0f] ; 0x100aa7900
0x10076dcf1: vxorps xmm2, xmm2, xmm2
0x10076dcf5: vblendps xmm3, xmm4, xmm2, 8
0x10076dcfb: vmovaps xmmword ptr [rdi], xmm3
0x10076dcff: vblendps xmm3, xmm5, xmm2, 8
0x10076dd05: vmovaps xmmword ptr [rdi + 0x10], xmm3
0x10076dd0a: vblendps xmm0, xmm0, xmm2, 8
0x10076dd10: vmovaps xmmword ptr [rdi + 0x20], xmm0
0x10076dd15: vinsertps xmm0, xmm1, dword ptr [rip + 0x3373a1], 0x30 ; 0x100aa50c0
0x10076dd1f: vmovaps xmmword ptr [rdi + 0x30], xmm0
0x10076dd24: mov rax, rdi
0x10076dd27: pop rbp
0x10076dd28: ret 
0x10076dd29: nop dword ptr [rax]
