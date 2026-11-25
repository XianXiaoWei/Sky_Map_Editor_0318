0x10062f540: cmp byte ptr [rdi + 0x10], 0
0x10062f544: je 0x10062f63c
0x10062f54a: vandps xmm4, xmm0, xmmword ptr [rip + 0x4783be] ; 0x100aa7910
0x10062f552: vmovss xmm5, dword ptr [rip + 0x47836a] ; 0x100aa78c4
0x10062f55a: vucomiss xmm5, xmm4
0x10062f55e: jae 0x10062f63b
0x10062f564: vmovaps xmm4, xmmword ptr [rdi + 0x20]
0x10062f569: vmovaps xmm5, xmmword ptr [rsi]
0x10062f56d: vsubss xmm6, xmm2, xmm1
0x10062f571: vucomiss xmm6, dword ptr [rip + 0x47834b] ; 0x100aa78c4
0x10062f579: vmovss xmm9, dword ptr [rip + 0x475b3f] ; 0x100aa50c0
0x10062f581: ja 0x10062f595
0x10062f583: vmovss xmm7, dword ptr [rip + 0x47a045] ; 0x100aa95d0
0x10062f58b: vucomiss xmm7, xmm6
0x10062f58f: vmovaps xmm7, xmm9
0x10062f593: jbe 0x10062f5bb
0x10062f595: vsubps xmm7, xmm4, xmm5
0x10062f599: vmulps xmm7, xmm7, xmm7
0x10062f59d: vpermilpd xmm8, xmm7, 1
0x10062f5a3: vmovshdup xmm2, xmm7
0x10062f5a7: vaddss xmm2, xmm7, xmm2
0x10062f5ab: vaddss xmm2, xmm8, xmm2
0x10062f5af: vsqrtss xmm2, xmm2, xmm2
0x10062f5b3: vsubss xmm1, xmm2, xmm1
0x10062f5b7: vdivss xmm7, xmm1, xmm6
0x10062f5bb: vxorps xmm1, xmm1, xmm1
0x10062f5bf: vmaxss xmm1, xmm1, xmm7
0x10062f5c3: vminss xmm1, xmm9, xmm1
0x10062f5c7: vsubss xmm1, xmm9, xmm1
0x10062f5cb: vpermilps xmm2, xmm3, 0xc0
0x10062f5d1: vmulps xmm2, xmm2, xmmword ptr [rsi + 0x40]
0x10062f5d6: vaddps xmm2, xmm5, xmm2
0x10062f5da: vsubps xmm2, xmm2, xmm4
0x10062f5de: vmulps xmm3, xmm2, xmm2
0x10062f5e2: vmovshdup xmm4, xmm3
0x10062f5e6: vaddss xmm4, xmm3, xmm4
0x10062f5ea: vpermilpd xmm3, xmm3, 1
0x10062f5f0: vaddss xmm3, xmm3, xmm4
0x10062f5f4: vsqrtss xmm3, xmm3, xmm3
0x10062f5f8: vucomiss xmm3, dword ptr [rip + 0x4782c4] ; 0x100aa78c4
0x10062f600: jbe 0x10062f60c
0x10062f602: vpermilps xmm3, xmm3, 0xc0
0x10062f608: vdivps xmm2, xmm2, xmm3
0x10062f60c: vbroadcastss xmm3, dword ptr [rdi + 0x74]
0x10062f612: vmulps xmm2, xmm2, xmm3
0x10062f616: vmovaps xmm3, xmmword ptr [rdi + 0x60]
0x10062f61b: vsubps xmm2, xmm3, xmm2
0x10062f61f: vpermilps xmm1, xmm1, 0xc0
0x10062f625: vmulps xmm1, xmm1, xmm2
0x10062f629: vpermilps xmm0, xmm0, 0xc0
0x10062f62f: vmulps xmm0, xmm0, xmm1
0x10062f633: vaddps xmm0, xmm0, xmmword ptr [rdi]
0x10062f637: vmovaps xmmword ptr [rdi], xmm0
0x10062f63b: ret 
0x10062f63c: push rbp
0x10062f63d: mov rbp, rsp
0x10062f640: lea rdi, [rip + 0x56805a] ; 0x100b976a1 m_accum
0x10062f647: lea rsi, [rip + 0x56805b] ; 0x100b976a9 SteeringBehaviors.cpp
0x10062f64e: mov edx, 0x1e8
0x10062f653: mov ecx, 3
0x10062f658: call 0x1007e5f70 ; 0x1007e5f70
0x10062f65d: ud2 
0x10062f65f: nop 
