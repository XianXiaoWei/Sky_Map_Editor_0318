0x1001ad500: push rbp
0x1001ad501: mov rbp, rsp
0x1001ad504: vmovaps xmm0, xmmword ptr [rsi]
0x1001ad508: vmovaps xmmword ptr [rdi + 0x10], xmm0
0x1001ad50d: vmovaps xmm0, xmmword ptr [rsi + 0x10]
0x1001ad512: vmovaps xmmword ptr [rdi + 0x20], xmm0
0x1001ad517: vmovaps xmm0, xmmword ptr [rsi + 0x20]
0x1001ad51c: vmovaps xmmword ptr [rdi + 0x30], xmm0
0x1001ad521: vmovaps xmm0, xmmword ptr [rsi + 0x30]
0x1001ad526: vmovaps xmmword ptr [rdi + 0x40], xmm0
0x1001ad52b: pop rbp
0x1001ad52c: ret 
0x1001ad52d: nop dword ptr [rax]
