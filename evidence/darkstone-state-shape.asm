0x10027d909: vmovss xmm0, dword ptr [rip + 0x8277af] ; 0x100aa50c0
0x10027d911: vsubss xmm0, xmm0, xmm2
0x10027d915: vcvtss2sd xmm0, xmm0, xmm0
0x10027d919: vmulsd xmm0, xmm0, qword ptr [rip + 0x82cc6f] ; 0x100aaa590
0x10027d921: vcvtss2sd xmm1, xmm2, xmm2
0x10027d925: vaddsd xmm0, xmm0, xmm1
0x10027d929: vcvtsd2ss xmm0, xmm0, xmm0
0x10027d92d: vmovaps xmm1, xmmword ptr [r13 + 0x70]
0x10027d933: cmp qword ptr [rbp + 0x40], 0
0x10027d938: jne 0x10027d98b
0x10027d93a: mov al, byte ptr [r13 + 0xdc]
0x10027d941: test al, al
0x10027d943: jne 0x10027d98b
0x10027d945: mov eax, dword ptr [rsp + 0x70]
0x10027d949: vmovss xmm2, dword ptr [rip + 0x826c67] ; 0x100aa45b8
0x10027d951: vmulss xmm3, xmm1, xmm2
0x10027d955: vmovshdup xmm4, xmm1
0x10027d959: vmulss xmm4, xmm4, dword ptr [rip + 0x829793] ; 0x100aa70f4
0x10027d961: vinsertps xmm3, xmm3, xmm4, 0x10
0x10027d967: vpermilpd xmm4, xmm1, 1
0x10027d96d: vmulss xmm2, xmm4, xmm2
0x10027d971: vinsertps xmm2, xmm3, xmm2, 0x20
0x10027d977: vsubps xmm1, xmm1, xmm2
0x10027d97b: vpermilps xmm0, xmm0, 0xc0
0x10027d981: vmulps xmm0, xmm0, xmm1
0x10027d985: vaddps xmm0, xmm2, xmm0
0x10027d989: jmp 0x10027d999 ; 0x10027d999
0x10027d98b: mov eax, dword ptr [rsp + 0x70]
0x10027d98f: vpermilps xmm0, xmm0, 0xc0
0x10027d995: vmulps xmm0, xmm0, xmm1
0x10027d999: vmovaps xmmword ptr [rsp + 0xa0], xmm0
0x10027d9a2: mov dword ptr [rsp + 0x70], eax
0x10027d9a6: vmovaps xmmword ptr [r13 + 0xc0], xmm0
