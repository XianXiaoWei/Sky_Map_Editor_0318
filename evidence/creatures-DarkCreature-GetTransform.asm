0x10026c540: push rbp
0x10026c541: mov rbp, rsp
0x10026c544: vmovaps xmm0, xmmword ptr [rsi + 0x60]
0x10026c549: vxorps xmm1, xmm1, xmm1
0x10026c54d: vblendps xmm2, xmm1, xmmword ptr [rsi + 0x70], 7
0x10026c554: vblendps xmm3, xmm1, xmmword ptr [rsi + 0x80], 7
0x10026c55e: vblendps xmm1, xmm1, xmmword ptr [rsi + 0x90], 7
0x10026c568: vinsertps xmm0, xmm0, dword ptr [rip + 0x838b4e], 0x30 ; 0x100aa50c0
0x10026c572: vbroadcastss ymm4, dword ptr [rsi + 0xd0]
0x10026c57b: vmulps xmm2, xmm2, xmm4
0x10026c57f: vbroadcastss ymm4, dword ptr [rsi + 0xd4]
0x10026c588: vmulps xmm3, xmm3, xmm4
0x10026c58c: vbroadcastss ymm4, dword ptr [rsi + 0xd8]
0x10026c595: vmulps xmm1, xmm1, xmm4
0x10026c599: vmovaps xmmword ptr [rdi], xmm2
0x10026c59d: vmovaps xmmword ptr [rdi + 0x10], xmm3
0x10026c5a2: vmovaps xmmword ptr [rdi + 0x20], xmm1
0x10026c5a7: vmovaps xmmword ptr [rdi + 0x30], xmm0
0x10026c5ac: mov rax, rdi
0x10026c5af: pop rbp
0x10026c5b0: vzeroupper 
0x10026c5b3: ret 
0x10026c5b4: nop word ptr cs:[rax + rax]
