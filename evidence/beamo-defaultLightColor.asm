0x10077d310: push rbp
0x10077d311: mov rbp, rsp
0x10077d314: push rbx
0x10077d315: sub rsp, 0x38
0x10077d319: vmovaps xmm1, xmm0
0x10077d31d: vmovss dword ptr [rbp - 0xc], xmm1
0x10077d322: mov rbx, rdi
0x10077d325: vmovaps xmm0, xmmword ptr [rsi]
0x10077d329: vmovaps xmmword ptr [rbp - 0x20], xmm0
0x10077d32e: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x10077d333: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x10077d338: vmovshdup xmm0, xmmword ptr [rbp - 0x20]
0x10077d33d: vmovss xmm1, dword ptr [rbp - 0xc]
0x10077d342: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x10077d347: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x10077d34c: vpermilpd xmm0, xmmword ptr [rbp - 0x20], 1
0x10077d353: vmovss xmm1, dword ptr [rbp - 0xc]
0x10077d358: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x10077d35d: vmovaps xmm1, xmmword ptr [rbp - 0x40]
0x10077d362: vinsertps xmm1, xmm1, dword ptr [rbp - 0x30], 0x10
0x10077d369: vinsertps xmm0, xmm1, xmm0, 0x20
0x10077d36f: vblendps xmm0, xmm0, xmmword ptr [rbp - 0x20], 8
0x10077d376: vmovaps xmmword ptr [rbx], xmm0
0x10077d37a: mov rax, rbx
0x10077d37d: add rsp, 0x38
0x10077d381: pop rbx
0x10077d382: pop rbp
0x10077d383: ret 
0x10077d384: nop word ptr cs:[rax + rax]
