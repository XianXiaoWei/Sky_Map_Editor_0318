0x100328670: push rbp
0x100328671: mov rbp, rsp
0x100328674: push r14
0x100328676: push rbx
0x100328677: sub rsp, 0x50
0x10032867b: mov rbx, rdi
0x10032867e: vmovaps xmm1, xmmword ptr [rbx + 0x10]
0x100328683: vmovaps xmm2, xmmword ptr [rbx + 0x20]
0x100328688: vmovaps xmm3, xmmword ptr [rbx + 0x30]
0x10032868d: vmovaps xmm4, xmmword ptr [rbx + 0x40]
0x100328692: vmovaps xmmword ptr [rbx + 0x70], xmm1
0x100328697: vmovaps xmmword ptr [rbx + 0x80], xmm2
0x10032869f: vmovaps xmmword ptr [rbx + 0x90], xmm3
0x1003286a7: vmovaps xmmword ptr [rbx + 0xa0], xmm4
0x1003286af: vmovss dword ptr [rbx + 0x64], xmm0
0x1003286b4: mov eax, dword ptr [rbx + 0xb4]
0x1003286ba: test eax, eax
0x1003286bc: je 0x1003286c6
0x1003286be: dec eax
0x1003286c0: mov dword ptr [rbx + 0xb4], eax
0x1003286c6: cmp byte ptr [rbx + 0x5c], 0
0x1003286ca: je 0x100328714
0x1003286cc: vmovss xmm1, dword ptr [rbx + 0x54]
0x1003286d1: vmovss xmm2, dword ptr [rbx + 0x60]
0x1003286d6: vsubss xmm2, xmm2, xmm0
0x1003286da: vxorps xmm0, xmm0, xmm0
0x1003286de: vmaxss xmm3, xmm0, xmm2
0x1003286e2: vcmpunordss xmm2, xmm2, xmm2
0x1003286e7: vandnps xmm2, xmm2, xmm3
0x1003286eb: vmovss dword ptr [rbx + 0x60], xmm2
0x1003286f0: vucomiss xmm2, xmm0
0x1003286f4: jne 0x100328702
0x1003286f6: jp 0x100328702
0x1003286f8: vucomiss xmm1, xmm0
0x1003286fc: jbe 0x100328702
0x1003286fe: mov byte ptr [rbx + 0x5c], 0
0x100328702: cmp byte ptr [rip + 0x1acacdf], 0 ; 0x101df33e8
0x100328709: je 0x100328714
0x10032870b: mov rax, qword ptr [rbx]
0x10032870e: mov rdi, rbx
0x100328711: call qword ptr [rax + 0x10]
0x100328714: cmp byte ptr [rbx + 0xb0], 0
0x10032871b: je 0x1003287ca
0x100328721: lea r14, [rbx + 0x10]
0x100328725: mov byte ptr [rbx + 0xb0], 0
0x10032872c: lea rdi, [rbp - 0x20]
0x100328730: mov rsi, r14
0x100328733: call 0x100789f00 ; 0x100789f00
0x100328738: vmovss xmm0, dword ptr [rbp - 0x20]
0x10032873d: vmovss xmm1, dword ptr [rbp - 0x1c]
0x100328742: vsubss xmm2, xmm0, xmm1
0x100328746: vandps xmm3, xmm2, xmmword ptr [rip + 0x77f1c2] ; 0x100aa7910
0x10032874e: vmovss xmm2, dword ptr [rip + 0x77e346] ; 0x100aa6a9c
0x100328756: vucomiss xmm2, xmm3
0x10032875a: jae 0x100328760
0x10032875c: xor eax, eax
0x10032875e: jmp 0x100328774 ; 0x100328774
0x100328760: vsubss xmm1, xmm1, dword ptr [rbp - 0x18]
0x100328765: vandps xmm1, xmm1, xmmword ptr [rip + 0x77f1a3] ; 0x100aa7910
0x10032876d: vucomiss xmm2, xmm1
0x100328771: setae al
0x100328774: mov byte ptr [rbx + 0x110], al
0x10032877a: vmulss xmm0, xmm0, dword ptr [rip + 0x77be36] ; 0x100aa45b8
0x100328782: vmovss dword ptr [rbx + 0x114], xmm0
0x10032878a: lea rdi, [rbp - 0x60]
0x10032878e: mov rsi, r14
0x100328791: call 0x100076940 ; 0x100076940
0x100328796: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x10032879b: vmovaps xmmword ptr [rbx + 0xd0], xmm0
0x1003287a3: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x1003287a8: vmovaps xmmword ptr [rbx + 0xe0], xmm0
0x1003287b0: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1003287b5: vmovaps xmmword ptr [rbx + 0xf0], xmm0
0x1003287bd: vmovaps xmm0, xmmword ptr [rbp - 0x30]
0x1003287c2: vmovaps xmmword ptr [rbx + 0x100], xmm0
0x1003287ca: add rsp, 0x50
0x1003287ce: pop rbx
0x1003287cf: pop r14
0x1003287d1: pop rbp
0x1003287d2: ret 
0x1003287d3: nop word ptr cs:[rax + rax]
