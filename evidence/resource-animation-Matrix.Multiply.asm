0x100076df0: push rbp
0x100076df1: mov rbp, rsp
0x100076df4: vmovaps xmm3, xmmword ptr [rsi]
0x100076df8: vmovaps xmm2, xmmword ptr [rsi + 0x10]
0x100076dfd: vmovaps xmm1, xmmword ptr [rsi + 0x20]
0x100076e02: vmovaps xmm8, xmmword ptr [rsi + 0x30]
0x100076e07: vmovaps xmm5, xmmword ptr [rdx]
0x100076e0b: vmovaps xmm6, xmmword ptr [rdx + 0x10]
0x100076e10: vmovaps xmm7, xmmword ptr [rdx + 0x20]
0x100076e15: vmovaps xmm4, xmmword ptr [rdx + 0x30]
0x100076e1a: vpermilps xmm0, xmm5, 0
0x100076e20: vmulps xmm9, xmm3, xmm0
0x100076e24: vpermilps xmm0, xmm5, 0x55
0x100076e2a: vmulps xmm0, xmm0, xmm2
0x100076e2e: vaddps xmm9, xmm9, xmm0
0x100076e32: vpermilps xmm0, xmm5, 0xaa
0x100076e38: vmulps xmm0, xmm0, xmm1
0x100076e3c: vaddps xmm0, xmm9, xmm0
0x100076e40: vpermilps xmm5, xmm5, 0xff
0x100076e46: vmulps xmm5, xmm5, xmm8
0x100076e4b: vaddps xmm9, xmm0, xmm5
0x100076e4f: vpermilps xmm0, xmm6, 0
0x100076e55: vmulps xmm0, xmm3, xmm0
0x100076e59: vpermilps xmm5, xmm6, 0x55
0x100076e5f: vmulps xmm5, xmm2, xmm5
0x100076e63: vaddps xmm0, xmm0, xmm5
0x100076e67: vpermilps xmm5, xmm6, 0xaa
0x100076e6d: vmulps xmm5, xmm1, xmm5
0x100076e71: vaddps xmm0, xmm5, xmm0
0x100076e75: vpermilps xmm5, xmm6, 0xff
0x100076e7b: vmulps xmm5, xmm8, xmm5
0x100076e7f: vaddps xmm0, xmm5, xmm0
0x100076e83: vpermilps xmm5, xmm7, 0
0x100076e89: vmulps xmm5, xmm3, xmm5
0x100076e8d: vpermilps xmm6, xmm7, 0x55
0x100076e93: vmulps xmm6, xmm2, xmm6
0x100076e97: vaddps xmm5, xmm5, xmm6
0x100076e9b: vpermilps xmm6, xmm7, 0xaa
0x100076ea1: vmulps xmm6, xmm1, xmm6
0x100076ea5: vaddps xmm5, xmm6, xmm5
0x100076ea9: vpermilps xmm6, xmm7, 0xff
0x100076eaf: vmulps xmm6, xmm8, xmm6
0x100076eb3: vaddps xmm5, xmm6, xmm5
0x100076eb7: vpermilps xmm6, xmm4, 0
0x100076ebd: vmulps xmm3, xmm3, xmm6
0x100076ec1: vpermilps xmm6, xmm4, 0x55
0x100076ec7: vmulps xmm2, xmm2, xmm6
0x100076ecb: vaddps xmm2, xmm3, xmm2
0x100076ecf: vpermilps xmm3, xmm4, 0xaa
0x100076ed5: vmulps xmm1, xmm1, xmm3
0x100076ed9: vaddps xmm1, xmm1, xmm2
0x100076edd: vpermilps xmm2, xmm4, 0xff
0x100076ee3: vmulps xmm2, xmm8, xmm2
0x100076ee7: vaddps xmm1, xmm2, xmm1
0x100076eeb: vmovaps xmmword ptr [rdi], xmm9
0x100076eef: vmovaps xmmword ptr [rdi + 0x10], xmm0
0x100076ef4: vmovaps xmmword ptr [rdi + 0x20], xmm5
0x100076ef9: vmovaps xmmword ptr [rdi + 0x30], xmm1
0x100076efe: mov rax, rdi
0x100076f01: pop rbp
0x100076f02: ret 
0x100076f03: nop word ptr cs:[rax + rax]
