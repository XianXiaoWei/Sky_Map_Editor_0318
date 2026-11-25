0x10078d250: push rbp
0x10078d251: mov rbp, rsp
0x10078d254: vmovaps xmm5, xmmword ptr [rsi]
0x10078d258: vmovaps xmm9, xmmword ptr [rsi + 0x10]
0x10078d25d: vmovaps xmm8, xmmword ptr [rsi + 0x20]
0x10078d262: vmovaps xmm10, xmmword ptr [rsi + 0x30]
0x10078d267: vmulps xmm1, xmm5, xmm5
0x10078d26b: vmovshdup xmm2, xmm1
0x10078d26f: vaddss xmm2, xmm1, xmm2
0x10078d273: vpermilpd xmm1, xmm1, 1
0x10078d279: vaddss xmm1, xmm1, xmm2
0x10078d27d: vsqrtss xmm3, xmm1, xmm1
0x10078d281: vmulps xmm1, xmm9, xmm9
0x10078d286: vmovshdup xmm2, xmm1
0x10078d28a: vaddss xmm2, xmm1, xmm2
0x10078d28e: vpermilpd xmm1, xmm1, 1
0x10078d294: vaddss xmm1, xmm1, xmm2
0x10078d298: vsqrtss xmm4, xmm1, xmm1
0x10078d29c: vmulps xmm1, xmm8, xmm8
0x10078d2a1: vmovshdup xmm2, xmm1
0x10078d2a5: vaddss xmm2, xmm1, xmm2
0x10078d2a9: vpermilpd xmm1, xmm1, 1
0x10078d2af: vaddss xmm1, xmm1, xmm2
0x10078d2b3: vucomiss xmm3, dword ptr [rip + 0x31a609] ; 0x100aa78c4
0x10078d2bb: ja 0x10078d319
0x10078d2bd: vsqrtss xmm2, xmm1, xmm1
0x10078d2c1: vucomiss xmm4, dword ptr [rip + 0x31a5fb] ; 0x100aa78c4
0x10078d2c9: ja 0x10078d331
0x10078d2cb: vucomiss xmm2, dword ptr [rip + 0x31a5f1] ; 0x100aa78c4
0x10078d2d3: jbe 0x10078d2df
0x10078d2d5: vpermilps xmm1, xmm2, 0xc0
0x10078d2db: vdivps xmm8, xmm8, xmm1
0x10078d2df: vmovaps xmm1, xmmword ptr [rdi]
0x10078d2e3: vsubps xmm7, xmm1, xmm10
0x10078d2e8: vmovaps xmmword ptr [rdx], xmm10
0x10078d2ec: vmulps xmm1, xmm5, xmm7
0x10078d2f0: vmovshdup xmm6, xmm1
0x10078d2f4: vaddss xmm6, xmm1, xmm6
0x10078d2f8: vpermilpd xmm1, xmm1, 1
0x10078d2fe: vaddss xmm1, xmm1, xmm6
0x10078d302: vucomiss xmm1, xmm3
0x10078d306: jbe 0x10078d347
0x10078d308: vaddss xmm6, xmm3, xmm0
0x10078d30c: vucomiss xmm1, xmm6
0x10078d310: setbe al
0x10078d313: vmovaps xmm1, xmm3
0x10078d317: jmp 0x10078d36a ; 0x10078d36a
0x10078d319: vpermilps xmm2, xmm3, 0xc0
0x10078d31f: vdivps xmm5, xmm5, xmm2
0x10078d323: vsqrtss xmm2, xmm1, xmm1
0x10078d327: vucomiss xmm4, dword ptr [rip + 0x31a595] ; 0x100aa78c4
0x10078d32f: jbe 0x10078d2cb
0x10078d331: vpermilps xmm1, xmm4, 0xc0
0x10078d337: vdivps xmm9, xmm9, xmm1
0x10078d33b: vucomiss xmm2, dword ptr [rip + 0x31a581] ; 0x100aa78c4
0x10078d343: ja 0x10078d2d5
0x10078d345: jmp 0x10078d2df ; 0x10078d2df
0x10078d347: vxorps xmm6, xmm1, xmmword ptr [rip + 0x31a5b1] ; 0x100aa7900
0x10078d34f: mov al, 1
0x10078d351: vucomiss xmm6, xmm3
0x10078d355: jbe 0x10078d36a
0x10078d357: vaddss xmm1, xmm3, xmm0
0x10078d35b: vucomiss xmm6, xmm1
0x10078d35f: setbe al
0x10078d362: vxorps xmm1, xmm3, xmmword ptr [rip + 0x31a596] ; 0x100aa7900
0x10078d36a: vpermilps xmm1, xmm1, 0xc0
0x10078d370: vmulps xmm1, xmm5, xmm1
0x10078d374: vaddps xmm1, xmm10, xmm1
0x10078d378: vmovaps xmmword ptr [rdx], xmm1
0x10078d37c: vmulps xmm3, xmm9, xmm7
0x10078d380: vmovshdup xmm5, xmm3
0x10078d384: vaddss xmm5, xmm3, xmm5
0x10078d388: vpermilpd xmm3, xmm3, 1
0x10078d38e: vaddss xmm3, xmm3, xmm5
0x10078d392: vucomiss xmm3, xmm4
0x10078d396: jbe 0x10078d3a7
0x10078d398: vaddss xmm5, xmm4, xmm0
0x10078d39c: vucomiss xmm3, xmm5
0x10078d3a0: setbe cl
0x10078d3a3: and al, cl
0x10078d3a5: jmp 0x10078d3d0 ; 0x10078d3d0
0x10078d3a7: vxorps xmm5, xmm3, xmmword ptr [rip + 0x31a551] ; 0x100aa7900
0x10078d3af: vucomiss xmm5, xmm4
0x10078d3b3: jbe 0x10078d3cc
0x10078d3b5: vaddss xmm3, xmm4, xmm0
0x10078d3b9: vucomiss xmm5, xmm3
0x10078d3bd: setbe cl
0x10078d3c0: and al, cl
0x10078d3c2: vxorps xmm4, xmm4, xmmword ptr [rip + 0x31a536] ; 0x100aa7900
0x10078d3ca: jmp 0x10078d3d0 ; 0x10078d3d0
0x10078d3cc: vmovaps xmm4, xmm3
0x10078d3d0: vpermilps xmm3, xmm4, 0xc0
0x10078d3d6: vmulps xmm3, xmm9, xmm3
0x10078d3da: vaddps xmm1, xmm1, xmm3
0x10078d3de: vmovaps xmmword ptr [rdx], xmm1
0x10078d3e2: vmulps xmm3, xmm8, xmm7
0x10078d3e6: vmovshdup xmm4, xmm3
0x10078d3ea: vaddss xmm4, xmm3, xmm4
0x10078d3ee: vpermilpd xmm3, xmm3, 1
0x10078d3f4: vaddss xmm3, xmm3, xmm4
0x10078d3f8: vucomiss xmm3, xmm2
0x10078d3fc: jbe 0x10078d40d
0x10078d3fe: vaddss xmm0, xmm2, xmm0
0x10078d402: vucomiss xmm3, xmm0
0x10078d406: setbe cl
0x10078d409: and al, cl
0x10078d40b: jmp 0x10078d436 ; 0x10078d436
0x10078d40d: vxorps xmm4, xmm3, xmmword ptr [rip + 0x31a4eb] ; 0x100aa7900
0x10078d415: vucomiss xmm4, xmm2
0x10078d419: jbe 0x10078d432
0x10078d41b: vaddss xmm0, xmm2, xmm0
0x10078d41f: vucomiss xmm4, xmm0
0x10078d423: setbe cl
0x10078d426: and al, cl
0x10078d428: vxorps xmm2, xmm2, xmmword ptr [rip + 0x31a4d0] ; 0x100aa7900
0x10078d430: jmp 0x10078d436 ; 0x10078d436
0x10078d432: vmovaps xmm2, xmm3
0x10078d436: vpermilps xmm0, xmm2, 0xc0
0x10078d43c: vmulps xmm0, xmm8, xmm0
0x10078d440: vaddps xmm0, xmm1, xmm0
0x10078d444: vmovaps xmmword ptr [rdx], xmm0
0x10078d448: pop rbp
0x10078d449: ret 
0x10078d44a: nop word ptr [rax + rax]
