0x10055b880: mov ecx, dword ptr [rsi + 0x28]
0x10055b883: cmp rcx, 1
0x10055b887: jbe 0x10055b9e0
0x10055b88d: cmp byte ptr [rsi + 0xe0], 0
0x10055b894: je 0x10055b959
0x10055b89a: mov rdx, qword ptr [rsi + 0x90]
0x10055b8a1: lea r8, [rsi + 0xd0]
0x10055b8a8: vmovaps xmm0, xmmword ptr [rdx]
0x10055b8ac: vmovaps xmmword ptr [rsi + 0xd0], xmm0
0x10055b8b4: lea rax, [rsi + 0xc0]
0x10055b8bb: vmovaps xmmword ptr [rsi + 0xc0], xmm0
0x10055b8c3: vmovshdup xmm1, xmm0
0x10055b8c7: vpermilpd xmm2, xmm0, 1
0x10055b8cd: dec rcx
0x10055b8d0: add rdx, 0x18
0x10055b8d4: vmovapd xmm3, xmm2
0x10055b8d8: vmovaps xmm4, xmm1
0x10055b8dc: vmovaps xmm5, xmm0
0x10055b8e0: vmovss xmm6, dword ptr [rdx - 8]
0x10055b8e5: vminss xmm5, xmm6, xmm5
0x10055b8e9: vmovss dword ptr [rsi + 0xc0], xmm5
0x10055b8f1: vmovss xmm6, dword ptr [rdx - 4]
0x10055b8f6: vminss xmm4, xmm6, xmm4
0x10055b8fa: vmovss dword ptr [rsi + 0xc4], xmm4
0x10055b902: vmovss xmm6, dword ptr [rdx]
0x10055b906: vminss xmm3, xmm6, xmm3
0x10055b90a: vmovss dword ptr [rsi + 0xc8], xmm3
0x10055b912: vmovss xmm6, dword ptr [rdx - 8]
0x10055b917: vmaxss xmm0, xmm6, xmm0
0x10055b91b: vmovss dword ptr [rsi + 0xd0], xmm0
0x10055b923: vmovss xmm6, dword ptr [rdx - 4]
0x10055b928: vmaxss xmm1, xmm6, xmm1
0x10055b92c: vmovss dword ptr [rsi + 0xd4], xmm1
0x10055b934: vmovss xmm6, dword ptr [rdx]
0x10055b938: vmaxss xmm2, xmm6, xmm2
0x10055b93c: vmovss dword ptr [rsi + 0xd8], xmm2
0x10055b944: add rdx, 0x10
0x10055b948: dec rcx
0x10055b94b: jne 0x10055b8e0
0x10055b94d: mov byte ptr [rsi + 0xe0], 0
0x10055b954: mov rsi, r8
0x10055b957: jmp 0x10055b967 ; 0x10055b967
0x10055b959: lea rax, [rsi + 0xc0]
0x10055b960: add rsi, 0xd0
0x10055b967: vmovaps xmm0, xmmword ptr [rsi]
0x10055b96b: vaddps xmm1, xmm0, xmmword ptr [rax]
0x10055b96f: vmulps xmm1, xmm1, xmmword ptr [rip + 0x54bcf9] ; 0x100aa7670
0x10055b977: vsubps xmm0, xmm0, xmm1
0x10055b97b: vpermilps xmm2, xmm0, 0xc0
0x10055b981: vmovss xmm3, dword ptr [rip + 0x549737] ; 0x100aa50c0
0x10055b989: vmulps xmm2, xmm2, xmm3
0x10055b98d: vpermilps xmm3, xmm0, 0xd5
0x10055b993: vmulps xmm3, xmm3, xmmword ptr [rip + 0x54c705] ; 0x100aa80a0
0x10055b99b: vpermilps xmm0, xmm0, 0xea
0x10055b9a1: vmulps xmm0, xmm0, xmmword ptr [rip + 0x54d087] ; 0x100aa8a30
0x10055b9a9: vxorps xmm4, xmm4, xmm4
0x10055b9ad: vblendps xmm2, xmm2, xmm4, 8
0x10055b9b3: vmovaps xmmword ptr [rdi], xmm2
0x10055b9b7: vblendps xmm2, xmm3, xmm4, 8
0x10055b9bd: vmovaps xmmword ptr [rdi + 0x10], xmm2
0x10055b9c2: vblendps xmm0, xmm0, xmm4, 8
0x10055b9c8: vmovaps xmmword ptr [rdi + 0x20], xmm0
0x10055b9cd: vinsertps xmm0, xmm1, dword ptr [rip + 0x5496e9], 0x30 ; 0x100aa50c0
0x10055b9d7: vmovaps xmmword ptr [rdi + 0x30], xmm0
0x10055b9dc: mov rax, rdi
0x10055b9df: ret 
0x10055b9e0: push rbp
0x10055b9e1: mov rbp, rsp
0x10055b9e4: lea rdi, [rip + 0x635e29] ; 0x100b91814 numPoints > 1
0x10055b9eb: lea rsi, [rip + 0x635d3a] ; 0x100b9172c Rail.cpp
0x10055b9f2: mov edx, 0x42b
0x10055b9f7: mov ecx, 3
0x10055b9fc: call 0x1007e5f70 ; 0x1007e5f70
0x10055ba01: ud2 
0x10055ba03: nop word ptr cs:[rax + rax]
