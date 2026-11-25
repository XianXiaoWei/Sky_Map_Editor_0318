0x100323f40: push rbp
0x100323f41: mov rbp, rsp
0x100323f44: vmovaps xmm0, xmmword ptr [rsi]
0x100323f48: vmovaps xmmword ptr [rdi + 0x10], xmm0
0x100323f4d: vmovaps xmm0, xmmword ptr [rsi + 0x10]
0x100323f52: vmovaps xmmword ptr [rdi + 0x20], xmm0
0x100323f57: vmovaps xmm0, xmmword ptr [rsi + 0x20]
0x100323f5c: vmovaps xmmword ptr [rdi + 0x30], xmm0
0x100323f61: vmovaps xmm0, xmmword ptr [rsi + 0x30]
0x100323f66: vmovaps xmmword ptr [rdi + 0x40], xmm0
0x100323f6b: pop rbp
0x100323f6c: ret 
0x100323f6d: nop dword ptr [rax]
