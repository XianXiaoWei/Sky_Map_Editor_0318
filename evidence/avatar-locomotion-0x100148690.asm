0x100148690: push rbp
0x100148691: mov rbp, rsp
0x100148694: mov eax, dword ptr [rdi + 0x730]
0x10014869a: cmp rax, 0x20
0x10014869e: je 0x1001486f1
0x1001486a0: vmovaps xmm2, xmmword ptr [rsi]
0x1001486a4: vsubps xmm3, xmm2, xmmword ptr [rdi + 0x10]
0x1001486a9: vmulps xmm3, xmm3, xmm3
0x1001486ad: vmovshdup xmm4, xmm3
0x1001486b1: vaddss xmm4, xmm3, xmm4
0x1001486b5: vpermilpd xmm3, xmm3, 1
0x1001486bb: vaddss xmm3, xmm3, xmm4
0x1001486bf: vucomiss xmm3, dword ptr [rip + 0x963121] ; 0x100aab7e8
0x1001486c7: ja 0x1001486f1
0x1001486c9: lea ecx, [rax + 1]
0x1001486cc: mov dword ptr [rdi + 0x730], ecx
0x1001486d2: shl rax, 5
0x1001486d6: vmovaps xmmword ptr [rdi + rax + 0x330], xmm2
0x1001486df: vmovss dword ptr [rdi + rax + 0x340], xmm0
0x1001486e8: vmovss dword ptr [rdi + rax + 0x344], xmm1
0x1001486f1: pop rbp
0x1001486f2: ret 
0x1001486f3: nop word ptr cs:[rax + rax]

