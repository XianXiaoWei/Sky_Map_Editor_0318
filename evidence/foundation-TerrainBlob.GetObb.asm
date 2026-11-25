0x1006aea00: push rbp
0x1006aea01: mov rbp, rsp
0x1006aea04: vmovaps xmm0, xmmword ptr [rsi + 0x210]
0x1006aea0c: vmovaps xmmword ptr [rdi], xmm0
0x1006aea10: vmovaps xmm0, xmmword ptr [rsi + 0x220]
0x1006aea18: vmovaps xmmword ptr [rdi + 0x10], xmm0
0x1006aea1d: vmovaps xmm0, xmmword ptr [rsi + 0x230]
0x1006aea25: vmovaps xmmword ptr [rdi + 0x20], xmm0
0x1006aea2a: vmovaps xmm0, xmmword ptr [rsi + 0x240]
0x1006aea32: vmovaps xmmword ptr [rdi + 0x30], xmm0
0x1006aea37: mov rax, rdi
0x1006aea3a: pop rbp
0x1006aea3b: ret 
0x1006aea3c: nop dword ptr [rax]
