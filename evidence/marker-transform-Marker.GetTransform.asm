0x10043e2d0: push rbp
0x10043e2d1: mov rbp, rsp
0x10043e2d4: vmovaps xmm4, xmmword ptr [rsi + 0x20]
0x10043e2d9: vmovshdup xmm5, xmm4
0x10043e2dd: vpermilpd xmm0, xmm4, 1
0x10043e2e3: vpermilps xmm6, xmm4, 0xe7
0x10043e2e9: vaddss xmm2, xmm5, xmm5
0x10043e2ed: vaddss xmm7, xmm0, xmm0
0x10043e2f1: vmulss xmm13, xmm4, xmm2
0x10043e2f5: vmulss xmm9, xmm4, xmm7
0x10043e2f9: vmulss xmm8, xmm5, xmm2
0x10043e2fd: vmulss xmm10, xmm6, xmm2
0x10043e301: vmulss xmm14, xmm0, xmm7
0x10043e305: vmulss xmm3, xmm6, xmm7
0x10043e309: vmovss xmm11, dword ptr [rip + 0x666daf] ; 0x100aa50c0
0x10043e311: vsubss xmm0, xmm11, xmm8
0x10043e316: vsubss xmm0, xmm0, xmm14
0x10043e31b: vaddss xmm1, xmm13, xmm3
0x10043e31f: vsubss xmm2, xmm9, xmm10
0x10043e324: vinsertps xmm0, xmm0, xmm1, 0x10
0x10043e32a: vinsertps xmm12, xmm0, xmm2, 0x20
0x10043e330: vmulps xmm0, xmm12, xmm12
0x10043e335: vmovshdup xmm1, xmm0
0x10043e339: vaddss xmm1, xmm0, xmm1
0x10043e33d: vpermilpd xmm0, xmm0, 1
0x10043e343: vaddss xmm0, xmm0, xmm1
0x10043e347: vsqrtss xmm0, xmm0, xmm0
0x10043e34b: vucomiss xmm0, dword ptr [rip + 0x669571] ; 0x100aa78c4
0x10043e353: jbe 0x10043e35f
0x10043e355: vpermilps xmm0, xmm0, 0xc0
0x10043e35b: vdivps xmm12, xmm12, xmm0
0x10043e35f: vaddss xmm0, xmm4, xmm4
0x10043e363: vmulss xmm1, xmm4, xmm0
0x10043e367: vmulss xmm6, xmm6, xmm0
0x10043e36b: vmulss xmm5, xmm5, xmm7
0x10043e36f: vsubss xmm0, xmm13, xmm3
0x10043e373: vsubss xmm1, xmm11, xmm1
0x10043e377: vsubss xmm2, xmm1, xmm14
0x10043e37c: vaddss xmm3, xmm5, xmm6
0x10043e380: vinsertps xmm0, xmm0, xmm2, 0x10
0x10043e386: vinsertps xmm4, xmm0, xmm3, 0x20
0x10043e38c: vmulps xmm0, xmm4, xmm4
0x10043e390: vmovshdup xmm2, xmm0
0x10043e394: vaddss xmm2, xmm0, xmm2
0x10043e398: vpermilpd xmm0, xmm0, 1
0x10043e39e: vaddss xmm0, xmm0, xmm2
0x10043e3a2: vsqrtss xmm0, xmm0, xmm0
0x10043e3a6: vucomiss xmm0, dword ptr [rip + 0x669516] ; 0x100aa78c4
0x10043e3ae: jbe 0x10043e3ba
0x10043e3b0: vpermilps xmm0, xmm0, 0xc0
0x10043e3b6: vdivps xmm4, xmm4, xmm0
0x10043e3ba: vaddss xmm0, xmm9, xmm10
0x10043e3bf: vsubss xmm2, xmm5, xmm6
0x10043e3c3: vsubss xmm1, xmm1, xmm8
0x10043e3c8: vinsertps xmm0, xmm0, xmm2, 0x10
0x10043e3ce: vinsertps xmm0, xmm0, xmm1, 0x20
0x10043e3d4: vxorps xmm1, xmm0, xmmword ptr [rip + 0x669524] ; 0x100aa7900
0x10043e3dc: vmulps xmm0, xmm0, xmm0
0x10043e3e0: vmovshdup xmm2, xmm0
0x10043e3e4: vaddss xmm2, xmm0, xmm2
0x10043e3e8: vpermilpd xmm0, xmm0, 1
0x10043e3ee: vaddss xmm0, xmm0, xmm2
0x10043e3f2: vsqrtss xmm0, xmm0, xmm0
0x10043e3f6: vucomiss xmm0, dword ptr [rip + 0x6694c6] ; 0x100aa78c4
0x10043e3fe: jbe 0x10043e40a
0x10043e400: vpermilps xmm0, xmm0, 0xc0
0x10043e406: vdivps xmm1, xmm1, xmm0
0x10043e40a: vxorps xmm0, xmm1, xmmword ptr [rip + 0x6694ee] ; 0x100aa7900
0x10043e412: vxorps xmm1, xmm1, xmm1
0x10043e416: vblendps xmm2, xmm12, xmm1, 8
0x10043e41c: vblendps xmm3, xmm4, xmm1, 8
0x10043e422: vblendps xmm0, xmm0, xmm1, 8
0x10043e428: vmovaps xmm1, xmmword ptr [rsi + 0x10]
0x10043e42d: vinsertps xmm1, xmm1, dword ptr [rip + 0x666c89], 0x30 ; 0x100aa50c0
0x10043e437: vbroadcastss ymm4, dword ptr [rsi + 0x30]
0x10043e43d: vmulps xmm2, xmm2, xmm4
0x10043e441: vbroadcastss ymm4, dword ptr [rsi + 0x34]
0x10043e447: vmulps xmm3, xmm3, xmm4
0x10043e44b: vbroadcastss ymm4, dword ptr [rsi + 0x38]
0x10043e451: vmulps xmm0, xmm4, xmm0
0x10043e455: vmovaps xmmword ptr [rdi], xmm2
0x10043e459: vmovaps xmmword ptr [rdi + 0x10], xmm3
0x10043e45e: vmovaps xmmword ptr [rdi + 0x20], xmm0
0x10043e463: vmovaps xmmword ptr [rdi + 0x30], xmm1
0x10043e468: mov rax, rdi
0x10043e46b: pop rbp
0x10043e46c: vzeroupper 
0x10043e46f: ret 
