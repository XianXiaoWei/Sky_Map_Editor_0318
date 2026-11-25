0x10060a400: push rbp
0x10060a401: mov rbp, rsp
0x10060a404: vmovaps xmm0, xmmword ptr [rsi]
0x10060a408: vmovaps xmmword ptr [rdi + 0x80], xmm0
0x10060a410: vmovaps xmm0, xmmword ptr [rsi + 0x10]
0x10060a415: vmovaps xmmword ptr [rdi + 0x90], xmm0
0x10060a41d: vmovaps xmm0, xmmword ptr [rsi + 0x20]
0x10060a422: vmovaps xmmword ptr [rdi + 0xa0], xmm0
0x10060a42a: vmovaps xmm0, xmmword ptr [rsi + 0x30]
0x10060a42f: vmovaps xmmword ptr [rdi + 0xb0], xmm0
0x10060a437: pop rbp
0x10060a438: ret 
0x10060a439: nop dword ptr [rax]
