0x1001480d0: push rbp
0x1001480d1: mov rbp, rsp
0x1001480d4: mov byte ptr [rdi + 0xbc8], 0
0x1001480db: mov qword ptr [rdi], 0
0x1001480e2: mov byte ptr [rdi + 0xc60], 0
0x1001480e9: vmovaps xmm0, xmmword ptr [rsi]
0x1001480ed: vmovaps xmmword ptr [rdi + 0x10], xmm0
0x1001480f2: vmovaps xmm1, xmmword ptr [rsi]
0x1001480f6: vmovaps xmmword ptr [rdi + 0x20], xmm1
0x1001480fb: vmovss xmm1, dword ptr [rdi + 0xe4]
0x100148103: lea rax, [rip + 0x979752] ; 0x100ac185c
0x10014810a: vmulss xmm1, xmm1, dword ptr [rax]
0x10014810e: vxorps xmm1, xmm1, xmmword ptr [rip + 0x95f7ea] ; 0x100aa7900
0x100148116: lea rax, [rip + 0x1ebc0d3] ; 0x1020041f0
0x10014811d: vpermilps xmm1, xmm1, 0xc0
0x100148123: vmulps xmm1, xmm1, xmmword ptr [rax]
0x100148127: vaddps xmm1, xmm1, xmmword ptr [rsi]
0x10014812b: vmovaps xmmword ptr [rdi + 0x130], xmm1
0x100148133: vxorps xmm1, xmm1, xmm1
0x100148137: vmovaps xmmword ptr [rdi + 0x50], xmm1
0x10014813c: mov dword ptr [rdi + 0xc70], 0
0x100148146: mov byte ptr [rdi + 0x120], 1
0x10014814d: vmovaps xmmword ptr [rdi + 0xc80], xmm0
0x100148155: pop rbp
0x100148156: ret 
0x100148157: nop word ptr [rax + rax]
