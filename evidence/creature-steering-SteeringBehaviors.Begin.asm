0x10062e690: push rbp
0x10062e691: mov rbp, rsp
0x10062e694: vxorps xmm2, xmm2, xmm2
0x10062e698: vmovaps xmmword ptr [rdi], xmm2
0x10062e69c: mov byte ptr [rdi + 0x10], 1
0x10062e6a0: vmovss dword ptr [rdi + 0x80], xmm0
0x10062e6a8: vmovaps xmm0, xmmword ptr [rsi]
0x10062e6ac: vmovaps xmmword ptr [rdi + 0x20], xmm0
0x10062e6b1: vmovaps xmm0, xmmword ptr [rsi + 0x10]
0x10062e6b6: vmovaps xmmword ptr [rdi + 0x30], xmm0
0x10062e6bb: vmovaps xmm0, xmmword ptr [rsi + 0x20]
0x10062e6c0: vmovaps xmmword ptr [rdi + 0x40], xmm0
0x10062e6c5: vmovaps xmm0, xmmword ptr [rsi + 0x30]
0x10062e6ca: vmovaps xmmword ptr [rdi + 0x50], xmm0
0x10062e6cf: vmovaps xmm0, xmmword ptr [rsi + 0x40]
0x10062e6d4: vmovaps xmmword ptr [rdi + 0x60], xmm0
0x10062e6d9: mov eax, dword ptr [rsi + 0x58]
0x10062e6dc: mov dword ptr [rdi + 0x78], eax
0x10062e6df: mov rax, qword ptr [rsi + 0x50]
0x10062e6e3: mov qword ptr [rdi + 0x70], rax
0x10062e6e7: vmovss dword ptr [rdi + 0x84], xmm1
0x10062e6ef: pop rbp
0x10062e6f0: ret 
0x10062e6f1: nop word ptr cs:[rax + rax]
