0x10077d4b0: push rbp
0x10077d4b1: mov rbp, rsp
0x10077d4b4: push rbx
0x10077d4b5: sub rsp, 0x38
0x10077d4b9: mov rbx, rdi
0x10077d4bc: vmaxss xmm0, xmm0, dword ptr [rip + 0x32ea8c] ; 0x100aabf50
0x10077d4c4: vmovss xmm1, dword ptr [rip + 0x327bf4] ; 0x100aa50c0
0x10077d4cc: vdivss xmm1, xmm1, xmm0
0x10077d4d0: vmovss dword ptr [rbp - 0xc], xmm1
0x10077d4d5: vmovaps xmm0, xmmword ptr [rsi]
0x10077d4d9: vmovaps xmmword ptr [rbp - 0x20], xmm0
0x10077d4de: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x10077d4e3: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x10077d4e8: vmovshdup xmm0, xmmword ptr [rbp - 0x20]
0x10077d4ed: vmovss xmm1, dword ptr [rbp - 0xc]
0x10077d4f2: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x10077d4f7: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x10077d4fc: vpermilpd xmm0, xmmword ptr [rbp - 0x20], 1
0x10077d503: vmovss xmm1, dword ptr [rbp - 0xc]
0x10077d508: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x10077d50d: vmovaps xmm1, xmmword ptr [rbp - 0x40]
0x10077d512: vinsertps xmm1, xmm1, dword ptr [rbp - 0x30], 0x10
0x10077d519: vinsertps xmm0, xmm1, xmm0, 0x20
0x10077d51f: vblendps xmm0, xmm0, xmmword ptr [rbp - 0x20], 8
0x10077d526: vmovaps xmmword ptr [rbx], xmm0
0x10077d52a: mov rax, rbx
0x10077d52d: add rsp, 0x38
0x10077d531: pop rbx
0x10077d532: pop rbp
0x10077d533: ret 
0x10077d534: nop word ptr cs:[rax + rax]

