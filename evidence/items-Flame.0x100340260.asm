0x100340260: push rbp
0x100340261: mov rbp, rsp
0x100340264: push r15
0x100340266: push r14
0x100340268: push r12
0x10034026a: push rbx
0x10034026b: sub rsp, 0x30
0x10034026f: vmovaps xmm5, xmm1
0x100340273: vmovaps xmm6, xmm0
0x100340277: mov r14, rcx
0x10034027a: mov rbx, rdx
0x10034027d: mov r15, rsi
0x100340280: cmp byte ptr [rbx + 0x13f], 0
0x100340287: je 0x1003404b4
0x10034028d: inc dword ptr [rip + 0x9eb951] ; 0x100d2bbe4
0x100340293: vmovss xmm0, dword ptr [r15 + 0x108]
0x10034029c: vmovss xmm1, dword ptr [rip + 0x76b570] ; 0x100aab814
0x1003402a4: vcmpunordss xmm2, xmm0, xmm0
0x1003402a9: vandps xmm3, xmm2, xmm1
0x1003402ad: vmaxss xmm0, xmm1, xmm0
0x1003402b1: vandnps xmm0, xmm2, xmm0
0x1003402b5: vorps xmm0, xmm0, xmm3
0x1003402b9: vmovss xmm2, dword ptr [rbx + 0x108]
0x1003402c1: vcmpunordss xmm3, xmm2, xmm2
0x1003402c6: vandps xmm4, xmm3, xmm1
0x1003402ca: vmaxss xmm1, xmm1, xmm2
0x1003402ce: vandnps xmm1, xmm3, xmm1
0x1003402d2: vorps xmm1, xmm1, xmm4
0x1003402d6: vaddss xmm7, xmm0, xmm1
0x1003402da: vmulss xmm4, xmm7, dword ptr [rip + 0x7679de] ; 0x100aa7cc0
0x1003402e2: vmovaps xmm0, xmmword ptr [rbx + 0xc0]
0x1003402ea: vsubps xmm1, xmm0, xmmword ptr [r15 + 0xc0]
0x1003402f3: vmovshdup xmm2, xmm1
0x1003402f7: vandps xmm2, xmm2, xmmword ptr [rip + 0x767611] ; 0x100aa7910
0x1003402ff: vaddss xmm2, xmm2, dword ptr [rip + 0x768ecd] ; 0x100aa91d4
0x100340307: vxorps xmm3, xmm3, xmm3
0x10034030b: vmaxss xmm2, xmm2, xmm3
0x10034030f: vinsertps xmm1, xmm1, xmm2, 0x10
0x100340315: vmulps xmm1, xmm1, xmm1
0x100340319: vmovshdup xmm2, xmm1
0x10034031d: vaddss xmm2, xmm1, xmm2
0x100340321: vpermilpd xmm1, xmm1, 1
0x100340327: vaddss xmm3, xmm1, xmm2
0x10034032b: cmp qword ptr [r15 + 0x198], rbx
0x100340332: jne 0x10034035e
0x100340334: mov eax, dword ptr [r15 + 0x1a0]
0x10034033b: cmp eax, dword ptr [rbx + 0x150]
0x100340341: jne 0x10034035e
0x100340343: vmulss xmm1, xmm4, dword ptr [rip + 0x7682e5] ; 0x100aa8630
0x10034034b: vmulss xmm1, xmm1, xmm1
0x10034034f: vminss xmm2, xmm1, xmm3
0x100340353: vcmpunordss xmm3, xmm3, xmm3
0x100340358: vblendvps xmm3, xmm2, xmm1, xmm3
0x10034035e: test r8b, r8b
0x100340361: je 0x1003403a1
0x100340363: mov rax, qword ptr [r9 + 0xe8]
0x10034036a: test rax, rax
0x10034036d: je 0x1003403b7
0x10034036f: mov ecx, dword ptr [rax + 0x150]
0x100340375: xor r12d, r12d
0x100340378: cmp ecx, dword ptr [r9 + 0xf0]
0x10034037f: cmovne rax, r12
0x100340383: vmovaps xmm4, xmm7
0x100340387: cmp rax, rbx
0x10034038a: je 0x1003403cf
0x10034038c: lea rax, [rip + 0x1a9e505] ; 0x101dde898
0x100340393: cmp byte ptr [rax], 0
0x100340396: je 0x10034042b
0x10034039c: jmp 0x1003404c1 ; 0x1003404c1
0x1003403a1: xor r12d, r12d
0x1003403a4: vmulss xmm0, xmm4, xmm4
0x1003403a8: vucomiss xmm0, xmm3
0x1003403ac: ja 0x100340435
0x1003403b2: jmp 0x1003404b4 ; 0x1003404b4
0x1003403b7: xor r12d, r12d
0x1003403ba: vmovaps xmm4, xmm7
0x1003403be: lea rax, [rip + 0x1a9e4d3] ; 0x101dde898
0x1003403c5: cmp byte ptr [rax], 0
0x1003403c8: je 0x10034042b
0x1003403ca: jmp 0x1003404c1 ; 0x1003404c1
0x1003403cf: vmovss xmm1, dword ptr [r9 + 0xfc]
0x1003403d8: vaddss xmm1, xmm1, dword ptr [rip + 0x768240] ; 0x100aa8620
0x1003403e0: vmulss xmm1, xmm1, dword ptr [rip + 0x7641d0] ; 0x100aa45b8
0x1003403e8: vxorps xmm2, xmm2, xmm2
0x1003403ec: vmaxss xmm1, xmm2, xmm1
0x1003403f0: vmovss xmm2, dword ptr [rip + 0x764cc8] ; 0x100aa50c0
0x1003403f8: vminss xmm1, xmm2, xmm1
0x1003403fc: vaddss xmm8, xmm7, xmm7
0x100340400: vmulss xmm4, xmm7, dword ptr [rip + 0x768dc0] ; 0x100aa91c8
0x100340408: vsubss xmm2, xmm2, xmm1
0x10034040c: vmulss xmm2, xmm8, xmm2
0x100340410: vmulss xmm1, xmm4, xmm1
0x100340414: vaddss xmm4, xmm1, xmm2
0x100340418: mov r12b, 1
0x10034041b: lea rax, [rip + 0x1a9e476] ; 0x101dde898
0x100340422: cmp byte ptr [rax], 0
0x100340425: jne 0x1003404c1
0x10034042b: vmulss xmm0, xmm4, xmm4
0x10034042f: vucomiss xmm0, xmm3
0x100340433: jbe 0x1003404b4
0x100340435: vmovss xmm0, dword ptr [rbx + 0x110]
0x10034043d: vxorps xmm1, xmm1, xmm1
0x100340441: vucomiss xmm0, xmm1
0x100340445: vsqrtss xmm0, xmm3, xmm3
0x100340449: jbe 0x100340496
0x10034044b: movzx ecx, r12b
0x10034044f: mov rsi, rbx
0x100340452: mov rdx, r15
0x100340455: vmovss dword ptr [rbp - 0x24], xmm0
0x10034045a: vmovss xmm0, dword ptr [rbp - 0x24]
0x10034045f: vmovaps xmm1, xmm7
0x100340463: mov r8, r14
0x100340466: vmovaps xmm2, xmm6
0x10034046a: vmovaps xmm3, xmm5
0x10034046e: vmovss dword ptr [rbp - 0x30], xmm5
0x100340473: vmovss dword ptr [rbp - 0x2c], xmm6
0x100340478: vmovss dword ptr [rbp - 0x28], xmm7
0x10034047d: call 0x10033f9d0 ; 0x10033f9d0
0x100340482: vmovss xmm0, dword ptr [rbp - 0x24]
0x100340487: vmovss xmm7, dword ptr [rbp - 0x28]
0x10034048c: vmovss xmm6, dword ptr [rbp - 0x2c]
0x100340491: vmovss xmm5, dword ptr [rbp - 0x30]
0x100340496: movzx ecx, r12b
0x10034049a: mov rsi, r15
0x10034049d: mov rdx, rbx
0x1003404a0: vmovaps xmm1, xmm7
0x1003404a4: mov r8, r14
0x1003404a7: vmovaps xmm2, xmm6
0x1003404ab: vmovaps xmm3, xmm5
0x1003404af: call 0x10033f9d0 ; 0x10033f9d0
0x1003404b4: add rsp, 0x30
0x1003404b8: pop rbx
0x1003404b9: pop r12
0x1003404bb: pop r14
0x1003404bd: pop r15
0x1003404bf: pop rbp
0x1003404c0: ret 
0x1003404c1: vaddss xmm1, xmm4, dword ptr [rip + 0x764bf7] ; 0x100aa50c0
0x1003404c9: vmulss xmm1, xmm1, xmm1
0x1003404cd: vucomiss xmm1, xmm3
0x1003404d1: jbe 0x10034042b
0x1003404d7: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1003404dc: vmovss dword ptr [rbp - 0x30], xmm5
0x1003404e1: vmovss dword ptr [rbp - 0x2c], xmm6
0x1003404e6: vmovss dword ptr [rbp - 0x28], xmm7
0x1003404eb: vmovaps xmmword ptr [rbp - 0x40], xmm3
0x1003404f0: vmovss dword ptr [rbp - 0x24], xmm4
0x1003404f5: call 0x1002b9810 ; 0x1002b9810
0x1003404fa: lea rdx, [rip + 0x1cff12f] ; 0x10203f630
0x100340501: lea rsi, [rbp - 0x50]
0x100340505: mov ecx, 1
0x10034050a: mov rdi, rax
0x10034050d: vmovss xmm0, dword ptr [rbp - 0x24]
0x100340512: call 0x1002bb510 ; 0x1002bb510
0x100340517: vmovss xmm4, dword ptr [rbp - 0x24]
0x10034051c: vmovaps xmm3, xmmword ptr [rbp - 0x40]
0x100340521: vmovss xmm7, dword ptr [rbp - 0x28]
0x100340526: vmovss xmm6, dword ptr [rbp - 0x2c]
0x10034052b: vmovss xmm5, dword ptr [rbp - 0x30]
0x100340530: vmulss xmm0, xmm4, xmm4
0x100340534: vucomiss xmm0, xmm3
0x100340538: ja 0x100340435
0x10034053e: jmp 0x1003404b4 ; 0x1003404b4
0x100340543: nop word ptr cs:[rax + rax]
