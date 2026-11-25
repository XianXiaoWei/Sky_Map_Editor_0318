0x1001d2fe0: push rbp
0x1001d2fe1: mov rbp, rsp
0x1001d2fe4: push rbx
0x1001d2fe5: sub rsp, 0x88
0x1001d2fec: mov rbx, rdi
0x1001d2fef: vmovaps xmm0, xmmword ptr [rsi + 0xb40]
0x1001d2ff7: vxorps xmm1, xmm1, xmm1
0x1001d2ffb: vblendps xmm2, xmm1, xmm0, 1
0x1001d3001: vblendps xmm3, xmm1, xmm0, 2
0x1001d3007: vblendps xmm0, xmm1, xmm0, 4
0x1001d300d: vmovaps xmmword ptr [rbp - 0x90], xmm2
0x1001d3015: vmovaps xmmword ptr [rbp - 0x80], xmm3
0x1001d301a: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x1001d301f: vmovaps xmm0, xmmword ptr [rip + 0x8d59d9] ; 0x100aa8a00
0x1001d3027: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1001d302c: mov rax, qword ptr [rsi + 0xb30]
0x1001d3033: vmovaps xmm0, xmmword ptr [rax + 0x120]
0x1001d303b: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1001d3040: vmovaps xmm0, xmmword ptr [rax + 0x130]
0x1001d3048: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1001d304d: vmovaps xmm0, xmmword ptr [rax + 0x140]
0x1001d3055: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x1001d305a: vmovaps xmm0, xmmword ptr [rax + 0x150]
0x1001d3062: vmovaps xmmword ptr [rbp - 0x20], xmm0
0x1001d3067: lea rsi, [rbp - 0x90]
0x1001d306e: lea rdx, [rbp - 0x50]
0x1001d3072: call 0x100076df0 ; 0x100076df0
0x1001d3077: mov rax, rbx
0x1001d307a: add rsp, 0x88
0x1001d3081: pop rbx
0x1001d3082: pop rbp
0x1001d3083: ret 
0x1001d3084: nop word ptr cs:[rax + rax]
