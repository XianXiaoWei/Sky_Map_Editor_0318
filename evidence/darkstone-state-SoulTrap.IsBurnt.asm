0x10027b310: push rbp
0x10027b311: mov rbp, rsp
0x10027b314: mov rdx, qword ptr [rdi + 0x40]
0x10027b318: xor eax, eax
0x10027b31a: test rdx, rdx
0x10027b31d: je 0x10027b49d
0x10027b323: mov rcx, qword ptr [rdi + 8]
0x10027b327: mov ecx, dword ptr [rcx + 0x10]
0x10027b32a: test rcx, rcx
0x10027b32d: je 0x10027b498
0x10027b333: cmp ecx, 0xf
0x10027b336: ja 0x10027b341
0x10027b338: xor edi, edi
0x10027b33a: xor eax, eax
0x10027b33c: jmp 0x10027b45f ; 0x10027b45f
0x10027b341: mov r8d, ecx
0x10027b344: and r8d, 0xf
0x10027b348: mov rdi, rcx
0x10027b34b: sub rdi, r8
0x10027b34e: lea rax, [rdx + 0x1930]
0x10027b355: vpxor xmm0, xmm0, xmm0
0x10027b359: vmovaps xmm8, xmmword ptr [rip + 0x839d7f] ; 0x100ab50e0
0x10027b361: mov rsi, rdi
0x10027b364: vpxor xmm2, xmm2, xmm2
0x10027b368: vpxor xmm3, xmm3, xmm3
0x10027b36c: vpxor xmm4, xmm4, xmm4
0x10027b370: vmovss xmm5, dword ptr [rax - 0x1860]
0x10027b378: vinsertps xmm5, xmm5, dword ptr [rax - 0x16c0], 0x10
0x10027b382: vinsertps xmm5, xmm5, dword ptr [rax - 0x1520], 0x20
0x10027b38c: vinsertps xmm5, xmm5, dword ptr [rax - 0x1380], 0x30
0x10027b396: vmovss xmm6, dword ptr [rax - 0x11e0]
0x10027b39e: vinsertps xmm6, xmm6, dword ptr [rax - 0x1040], 0x10
0x10027b3a8: vinsertps xmm6, xmm6, dword ptr [rax - 0xea0], 0x20
0x10027b3b2: vinsertps xmm6, xmm6, dword ptr [rax - 0xd00], 0x30
0x10027b3bc: vmovss xmm7, dword ptr [rax - 0xb60]
0x10027b3c4: vinsertps xmm7, xmm7, dword ptr [rax - 0x9c0], 0x10
0x10027b3ce: vinsertps xmm7, xmm7, dword ptr [rax - 0x820], 0x20
0x10027b3d8: vinsertps xmm7, xmm7, dword ptr [rax - 0x680], 0x30
0x10027b3e2: vmovss xmm1, dword ptr [rax - 0x4e0]
0x10027b3ea: vinsertps xmm1, xmm1, dword ptr [rax - 0x340], 0x10
0x10027b3f4: vinsertps xmm1, xmm1, dword ptr [rax - 0x1a0], 0x20
0x10027b3fe: vinsertps xmm1, xmm1, dword ptr [rax], 0x30
0x10027b404: vcmpleps xmm5, xmm5, xmm8
0x10027b40a: vpsubd xmm0, xmm0, xmm5
0x10027b40e: vcmpleps xmm5, xmm6, xmm8
0x10027b414: vpsubd xmm2, xmm2, xmm5
0x10027b418: vcmpleps xmm5, xmm7, xmm8
0x10027b41e: vpsubd xmm3, xmm3, xmm5
0x10027b422: vcmpleps xmm1, xmm1, xmm8
0x10027b428: vpsubd xmm4, xmm4, xmm1
0x10027b42c: add rax, 0x1a00
0x10027b432: add rsi, -0x10
0x10027b436: jne 0x10027b370
0x10027b43c: vpaddd xmm0, xmm2, xmm0
0x10027b440: vpaddd xmm0, xmm3, xmm0
0x10027b444: vpaddd xmm0, xmm4, xmm0
0x10027b448: vpshufd xmm1, xmm0, 0x4e
0x10027b44d: vpaddd xmm0, xmm0, xmm1
0x10027b451: vphaddd xmm0, xmm0, xmm0
0x10027b456: vmovd eax, xmm0
0x10027b45a: test r8d, r8d
0x10027b45d: je 0x10027b498
0x10027b45f: imul rsi, rdi, 0x1a0
0x10027b466: lea rdx, [rdx + rsi + 0xd0]
0x10027b46e: mov rsi, rcx
0x10027b471: sub rsi, rdi
0x10027b474: vmovd xmm0, dword ptr [rip + 0x833404] ; 0x100aae880
0x10027b47c: nop dword ptr [rax]
0x10027b480: xor edi, edi
0x10027b482: vucomiss xmm0, dword ptr [rdx]
0x10027b486: setae dil
0x10027b48a: add eax, edi
0x10027b48c: add rdx, 0x1a0
0x10027b493: dec rsi
0x10027b496: jne 0x10027b480
0x10027b498: cmp eax, ecx
0x10027b49a: sete al
0x10027b49d: pop rbp
0x10027b49e: ret 
0x10027b49f: nop 

