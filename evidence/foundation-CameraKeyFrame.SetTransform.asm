0x1001ddf60: push rbp
0x1001ddf61: mov rbp, rsp
0x1001ddf64: vmovaps xmm0, xmmword ptr [rsi]
0x1001ddf68: vmovaps xmmword ptr [rdi + 0x10], xmm0
0x1001ddf6d: vmovaps xmm0, xmmword ptr [rsi + 0x10]
0x1001ddf72: vmovaps xmmword ptr [rdi + 0x20], xmm0
0x1001ddf77: vmovaps xmm0, xmmword ptr [rsi + 0x20]
0x1001ddf7c: vmovaps xmmword ptr [rdi + 0x30], xmm0
0x1001ddf81: vmovaps xmm0, xmmword ptr [rsi + 0x30]
0x1001ddf86: vmovaps xmmword ptr [rdi + 0x40], xmm0
0x1001ddf8b: pop rbp
0x1001ddf8c: ret 
0x1001ddf8d: nop dword ptr [rax]
