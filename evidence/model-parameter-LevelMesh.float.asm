0x1003ffe90: push rbp
0x1003ffe91: mov rbp, rsp
0x1003ffe94: push rbx
0x1003ffe95: push rax
0x1003ffe96: vmovss dword ptr [rbp - 0x10], xmm1
0x1003ffe9b: vmovss dword ptr [rbp - 0xc], xmm0
0x1003ffea0: mov rbx, rdi
0x1003ffea3: xor ecx, ecx
0x1003ffea5: call 0x100400c80 ; 0x100400c80
0x1003ffeaa: vmovss xmm1, dword ptr [rax + 0x74]
0x1003ffeaf: vmovss xmm0, dword ptr [rip + 0x6a5209] ; 0x100aa50c0
0x1003ffeb7: vxorps xmm2, xmm2, xmm2
0x1003ffebb: vucomiss xmm1, xmm2
0x1003ffebf: vmovaps xmm2, xmm0
0x1003ffec3: jbe 0x1003ffece
0x1003ffec5: vmovss xmm2, dword ptr [rax + 0x70]
0x1003ffeca: vdivss xmm2, xmm2, xmm1
0x1003ffece: vsubss xmm0, xmm0, xmm2
0x1003ffed2: vmulss xmm0, xmm0, dword ptr [rax + 0x60]
0x1003ffed7: vmulss xmm1, xmm2, dword ptr [rax + 0x30]
0x1003ffedc: vaddss xmm0, xmm0, xmm1
0x1003ffee0: vmovss dword ptr [rax + 0x60], xmm0
0x1003ffee5: vmovss xmm0, dword ptr [rbp - 0xc]
0x1003ffeea: vmovss dword ptr [rax + 0x30], xmm0
0x1003ffeef: mov dword ptr [rax + 0x70], 0
0x1003ffef6: vmovss xmm0, dword ptr [rbp - 0x10]
0x1003ffefb: vmovss dword ptr [rax + 0x74], xmm0
0x1003fff00: mov byte ptr [rax + 0x78], 1
0x1003fff04: mov byte ptr [rbx + 0xa32], 1
0x1003fff0b: add rsp, 8
0x1003fff0f: pop rbx
0x1003fff10: pop rbp
0x1003fff11: ret 
0x1003fff12: nop word ptr cs:[rax + rax]
