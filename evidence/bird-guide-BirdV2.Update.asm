0x1001a2260: push rbp
0x1001a2261: mov rbp, rsp
0x1001a2264: push r15
0x1001a2266: push r14
0x1001a2268: push r13
0x1001a226a: push r12
0x1001a226c: push rbx
0x1001a226d: sub rsp, 0xc8
0x1001a2274: mov r14, rsi
0x1001a2277: mov rbx, rdi
0x1001a227a: mov rdi, qword ptr [rbx + 0x3a0]
0x1001a2281: movzx esi, byte ptr [rbx + 0xd0]
0x1001a2288: call 0x1004636d0 ; 0x1004636d0
0x1001a228d: cmp byte ptr [rbx + 0xd0], 0
0x1001a2294: je 0x1001a2731
0x1001a229a: mov rax, qword ptr [r14 + 0x160]
0x1001a22a1: lea r13, [rip + 0x1e58e28] ; 0x101ffb0d0
0x1001a22a8: cmp byte ptr [r13], 0
0x1001a22ad: lea rcx, [rip + 0xb1628c] ; 0x100cb8540
0x1001a22b4: je 0x1001a22bc
0x1001a22b6: vmovss xmm0, dword ptr [rcx]
0x1001a22ba: jmp 0x1001a22c4 ; 0x1001a22c4
0x1001a22bc: vmovss xmm0, dword ptr [rip + 0x902dfc] ; 0x100aa50c0
0x1001a22c4: vmulss xmm0, xmm0, dword ptr [rax + 0x20]
0x1001a22c9: vmulss xmm0, xmm0, dword ptr [rax + 0x14]
0x1001a22ce: vmovss xmm1, dword ptr [rip + 0x9047c6] ; 0x100aa6a9c
0x1001a22d6: vmaxss xmm0, xmm1, xmm0
0x1001a22da: vmovss xmm1, dword ptr [rip + 0x9047be] ; 0x100aa6aa0
0x1001a22e2: vminss xmm0, xmm1, xmm0
0x1001a22e6: lea r15, [rbx + 0x50c]
0x1001a22ed: mov rdi, qword ptr [rbx + 0xf8]
0x1001a22f4: test rdi, rdi
0x1001a22f7: vmovss dword ptr [rbp - 0x2c], xmm0
0x1001a22fc: je 0x1001a2370
0x1001a22fe: mov rax, qword ptr [rdi]
0x1001a2301: call qword ptr [rax + 0x10]
0x1001a2304: vmovss xmm0, dword ptr [rbp - 0x2c]
0x1001a2309: test al, al
0x1001a230b: jne 0x1001a2370
0x1001a230d: vmovss xmm1, dword ptr [rbx + 0x104]
0x1001a2315: vxorps xmm2, xmm2, xmm2
0x1001a2319: vucomiss xmm1, dword ptr [rip + 0x902297] ; 0x100aa45b8
0x1001a2321: jbe 0x1001a235d
0x1001a2323: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001a2328: vcvtsi2ss xmm0, xmm3, eax
0x1001a232c: vmulss xmm3, xmm0, dword ptr [rip + 0x904dbc] ; 0x100aa70f0
0x1001a2334: vmovss xmm1, dword ptr [rip + 0x902d84] ; 0x100aa50c0
0x1001a233c: vsubss xmm1, xmm1, xmm3
0x1001a2340: vxorps xmm2, xmm2, xmm2
0x1001a2344: vmulss xmm1, xmm1, xmm2
0x1001a2348: vmovss xmm0, dword ptr [rbp - 0x2c]
0x1001a234d: vaddss xmm2, xmm3, xmm1
0x1001a2351: vmulss xmm1, xmm2, dword ptr [rip + 0x905497] ; 0x100aa77f0
0x1001a2359: vmulss xmm2, xmm2, xmm1
0x1001a235d: vmovss dword ptr [rbx + 0x50c], xmm2
0x1001a2365: mov qword ptr [rbx + 0xf8], 0
0x1001a2370: lea r12, [rbx + 0xe0]
0x1001a2377: vmovss xmm1, dword ptr [r15]
0x1001a237c: vsubss xmm2, xmm1, xmm0
0x1001a2380: vmovss dword ptr [r15], xmm2
0x1001a2385: vxorps xmm1, xmm1, xmm1
0x1001a2389: vucomiss xmm1, xmm2
0x1001a238d: jbe 0x1001a23bf
0x1001a238f: mov rdi, r12
0x1001a2392: mov rsi, r15
0x1001a2395: call 0x1001a2770 ; 0x1001a2770
0x1001a239a: vmovss xmm0, dword ptr [rbp - 0x2c]
0x1001a239f: test al, al
0x1001a23a1: jne 0x1001a23bf
0x1001a23a3: mov rdi, qword ptr [r14 + 0x280]
0x1001a23aa: call 0x1000fc260 ; 0x1000fc260
0x1001a23af: mov rdi, rbx
0x1001a23b2: mov rsi, rax
0x1001a23b5: call 0x1001a29d0 ; 0x1001a29d0
0x1001a23ba: vmovss xmm0, dword ptr [rbp - 0x2c]
0x1001a23bf: mov dword ptr [rbp - 0x30], 0
0x1001a23c6: mov rdx, qword ptr [rbx + 0x78]
0x1001a23ca: cmp byte ptr [rdx + 0x3d], 0
0x1001a23ce: je 0x1001a244f
0x1001a23d0: cmp byte ptr [rbx + 0x71], 0
0x1001a23d4: jne 0x1001a244f
0x1001a23d6: mov eax, dword ptr [rdx + 0x30]
0x1001a23d9: dec eax
0x1001a23db: cmp eax, 3
0x1001a23de: jb 0x1001a244f
0x1001a23e0: mov rsi, qword ptr [r14 + 0x70]
0x1001a23e4: mov eax, dword ptr [rip + 0xae7b7e] ; 0x100c89f68
0x1001a23ea: inc eax
0x1001a23ec: mov dword ptr [rip + 0xae7b76], eax ; 0x100c89f68
0x1001a23f2: add eax, dword ptr [rbx + 0x74]
0x1001a23f5: mov ecx, 0xcccccccd
0x1001a23fa: imul rcx, rax
0x1001a23fe: shr rcx, 0x23
0x1001a2402: add ecx, ecx
0x1001a2404: lea ecx, [rcx + rcx*4]
0x1001a2407: cmp eax, ecx
0x1001a2409: je 0x1001a244f
0x1001a240b: lea rdi, [rbp - 0x80]
0x1001a240f: call 0x10076be90 ; 0x10076be90
0x1001a2414: vmovaps xmm0, xmmword ptr [rbx + 0x10]
0x1001a2419: vsubps xmm0, xmm0, xmmword ptr [rbp - 0x80]
0x1001a241e: vmulps xmm0, xmm0, xmm0
0x1001a2422: vmovshdup xmm1, xmm0
0x1001a2426: vaddss xmm1, xmm0, xmm1
0x1001a242a: vpermilpd xmm0, xmm0, 1
0x1001a2430: vaddss xmm0, xmm0, xmm1
0x1001a2434: vmovss xmm1, dword ptr [rip + 0x90b50c] ; 0x100aad948
0x1001a243c: vucomiss xmm1, xmm0
0x1001a2440: jbe 0x1001a2743
0x1001a2446: mov rdx, qword ptr [rbx + 0x78]
0x1001a244a: vmovss xmm0, dword ptr [rbp - 0x2c]
0x1001a244f: mov qword ptr [rbp - 0x38], r15
0x1001a2453: mov r15, r13
0x1001a2456: lea r13, [rbx + 0x10]
0x1001a245a: mov rax, qword ptr [r14 + 0x138]
0x1001a2461: mov qword ptr [rsp], rax
0x1001a2465: lea r9, [rbp - 0x30]
0x1001a2469: mov rdi, rbx
0x1001a246c: mov rsi, r12
0x1001a246f: mov rcx, r13
0x1001a2472: mov r8, r14
0x1001a2475: call 0x1001a2f30 ; 0x1001a2f30
0x1001a247a: mov rax, qword ptr [rbx + 0x3a0]
0x1001a2481: mov rdx, qword ptr [rax + 0x68]
0x1001a2485: vmovss xmm0, dword ptr [rbp - 0x30]
0x1001a248a: mov rax, qword ptr [r14 + 0x160]
0x1001a2491: cmp byte ptr [r15], 0
0x1001a2495: je 0x1001a24a4
0x1001a2497: lea rcx, [rip + 0xb160a2] ; 0x100cb8540
0x1001a249e: vmovss xmm1, dword ptr [rcx]
0x1001a24a2: jmp 0x1001a24ac ; 0x1001a24ac
0x1001a24a4: vmovss xmm1, dword ptr [rip + 0x902c14] ; 0x100aa50c0
0x1001a24ac: vmulss xmm1, xmm1, dword ptr [rax + 0x20]
0x1001a24b1: vmulss xmm1, xmm1, dword ptr [rax + 0x28]
0x1001a24b6: vmovss xmm2, dword ptr [rip + 0x9045de] ; 0x100aa6a9c
0x1001a24be: vmaxss xmm1, xmm2, xmm1
0x1001a24c2: vmovss xmm2, dword ptr [rip + 0x9045d6] ; 0x100aa6aa0
0x1001a24ca: vminss xmm1, xmm2, xmm1
0x1001a24ce: mov rdi, rbx
0x1001a24d1: mov rsi, r12
0x1001a24d4: mov r15, rdx
0x1001a24d7: mov rcx, r13
0x1001a24da: call 0x1001a34c0 ; 0x1001a34c0
0x1001a24df: mov rax, qword ptr [rbx]
0x1001a24e2: lea rdi, [rbp - 0x80]
0x1001a24e6: mov rsi, rbx
0x1001a24e9: call qword ptr [rax + 0x18]
0x1001a24ec: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x1001a24f1: vpermilps xmm1, xmm0, 0xe7
0x1001a24f7: vucomiss xmm1, xmm1
0x1001a24fb: jp 0x1001a274e
0x1001a2501: vmovshdup xmm1, xmm0
0x1001a2505: vucomiss xmm0, xmm1
0x1001a2509: jp 0x1001a274e
0x1001a250f: vpermilpd xmm0, xmm0, 1
0x1001a2515: vucomiss xmm0, xmm0
0x1001a2519: jp 0x1001a274e
0x1001a251f: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x1001a2524: vpermilps xmm1, xmm0, 0xe7
0x1001a252a: vucomiss xmm1, xmm1
0x1001a252e: jp 0x1001a274e
0x1001a2534: vmovshdup xmm1, xmm0
0x1001a2538: vucomiss xmm0, xmm1
0x1001a253c: jp 0x1001a274e
0x1001a2542: vpermilpd xmm0, xmm0, 1
0x1001a2548: vucomiss xmm0, xmm0
0x1001a254c: jp 0x1001a274e
0x1001a2552: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x1001a2557: vpermilps xmm1, xmm0, 0xe7
0x1001a255d: vucomiss xmm1, xmm1
0x1001a2561: jp 0x1001a274e
0x1001a2567: vmovshdup xmm1, xmm0
0x1001a256b: vucomiss xmm0, xmm1
0x1001a256f: jp 0x1001a274e
0x1001a2575: vpermilpd xmm0, xmm0, 1
0x1001a257b: vucomiss xmm0, xmm0
0x1001a257f: jp 0x1001a274e
0x1001a2585: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x1001a258a: vpermilps xmm1, xmm0, 0xe7
0x1001a2590: vucomiss xmm1, xmm1
0x1001a2594: jp 0x1001a274e
0x1001a259a: vmovshdup xmm1, xmm0
0x1001a259e: vucomiss xmm0, xmm1
0x1001a25a2: jp 0x1001a274e
0x1001a25a8: vpermilpd xmm0, xmm0, 1
0x1001a25ae: vucomiss xmm0, xmm0
0x1001a25b2: jp 0x1001a274e
0x1001a25b8: mov rdi, rbx
0x1001a25bb: mov rsi, r12
0x1001a25be: mov rdx, r15
0x1001a25c1: call 0x1001a3980 ; 0x1001a3980
0x1001a25c6: mov rsi, qword ptr [r14 + 0x70]
0x1001a25ca: lea rdi, [rbp - 0x80]
0x1001a25ce: call 0x10076be90 ; 0x10076be90
0x1001a25d3: vmovaps xmm0, xmmword ptr [rbx + 0x10]
0x1001a25d8: vsubps xmm0, xmm0, xmmword ptr [rbp - 0x80]
0x1001a25dd: vmulps xmm0, xmm0, xmm0
0x1001a25e1: vmovshdup xmm1, xmm0
0x1001a25e5: vaddss xmm1, xmm0, xmm1
0x1001a25e9: vpermilpd xmm0, xmm0, 1
0x1001a25ef: vaddss xmm0, xmm0, xmm1
0x1001a25f3: vmovss xmm1, dword ptr [rip + 0x90b345] ; 0x100aad940
0x1001a25fb: vucomiss xmm1, xmm0
0x1001a25ff: jbe 0x1001a2626
0x1001a2601: mov rdi, qword ptr [r14 + 0x4d0]
0x1001a2608: mov rax, qword ptr [rbx + 0x78]
0x1001a260c: vmovss xmm0, dword ptr [rax + 0x18]
0x1001a2611: vmulss xmm0, xmm0, dword ptr [rip + 0x90601b] ; 0x100aa8634
0x1001a2619: mov edx, 1
0x1001a261e: mov rsi, r13
0x1001a2621: call 0x1004162e0 ; 0x1004162e0
0x1001a2626: mov rcx, qword ptr [r14 + 0x280]
0x1001a262d: mov r8, qword ptr [r14 + 0x380]
0x1001a2634: mov rdi, rbx
0x1001a2637: mov rsi, r12
0x1001a263a: mov rdx, r13
0x1001a263d: call 0x1001a3ad0 ; 0x1001a3ad0
0x1001a2642: vmovaps xmm0, xmmword ptr [rbx + 0x10]
0x1001a2647: vmovaps xmmword ptr [rbp - 0xe0], xmm0
0x1001a264f: vmovups ymm0, ymmword ptr [rbx + 0x20]
0x1001a2654: vmovups ymm1, ymmword ptr [rbx + 0x30]
0x1001a2659: vmovups ymmword ptr [rbp - 0xc0], ymm1
0x1001a2661: vmovups ymmword ptr [rbp - 0xd0], ymm0
0x1001a2669: vmovaps xmm0, xmmword ptr [rbx + 0x50]
0x1001a266e: vmovaps xmmword ptr [rbp - 0xa0], xmm0
0x1001a2676: mov eax, dword ptr [rbx + 0x68]
0x1001a2679: mov dword ptr [rbp - 0x88], eax
0x1001a267f: mov rax, qword ptr [rbx + 0x60]
0x1001a2683: mov qword ptr [rbp - 0x90], rax
0x1001a268a: mov rcx, qword ptr [r14 + 0x280]
0x1001a2691: lea rsi, [rbp - 0xe0]
0x1001a2698: mov rdi, r12
0x1001a269b: mov rdx, qword ptr [rbp - 0x38]
0x1001a269f: vmovss xmm0, dword ptr [rbp - 0x2c]
0x1001a26a4: vzeroupper 
0x1001a26a7: call 0x1001a4520 ; 0x1001a4520
0x1001a26ac: mov rcx, qword ptr [r14 + 0x280]
0x1001a26b3: mov rdi, rbx
0x1001a26b6: mov rsi, r15
0x1001a26b9: mov rdx, r13
0x1001a26bc: call 0x1001a4820 ; 0x1001a4820
0x1001a26c1: mov rdi, rbx
0x1001a26c4: call 0x1001a4a70 ; 0x1001a4a70
0x1001a26c9: cmp byte ptr [rbx + 0x71], 0
0x1001a26cd: je 0x1001a26f5
0x1001a26cf: mov rsi, qword ptr [r14 + 0x3b8]
0x1001a26d6: mov rdx, qword ptr [r14 + 0x450]
0x1001a26dd: mov rdi, rbx
0x1001a26e0: vmovss xmm0, dword ptr [rbp - 0x2c]
0x1001a26e5: call 0x1001a4e90 ; 0x1001a4e90
0x1001a26ea: mov rdi, rbx
0x1001a26ed: mov rsi, r13
0x1001a26f0: call 0x1001a5270 ; 0x1001a5270
0x1001a26f5: vmovss xmm0, dword ptr [rbp - 0x2c]
0x1001a26fa: mov r15, qword ptr [rbp - 0x38]
0x1001a26fe: mov rdx, qword ptr [r14 + 0x280]
0x1001a2705: mov rcx, qword ptr [r14 + 0x3c8]
0x1001a270c: mov rdi, rbx
0x1001a270f: mov rsi, r13
0x1001a2712: mov r8, r15
0x1001a2715: call 0x1001a5770 ; 0x1001a5770
0x1001a271a: lea rax, [rip + 0x1c439ef] ; 0x101de6110
0x1001a2721: cmp byte ptr [rax], 0
0x1001a2724: je 0x1001a2731
0x1001a2726: mov rdi, rbx
0x1001a2729: mov rsi, r13
0x1001a272c: call 0x1001a59d0 ; 0x1001a59d0
0x1001a2731: add rsp, 0xc8
0x1001a2738: pop rbx
0x1001a2739: pop r12
0x1001a273b: pop r13
0x1001a273d: pop r14
0x1001a273f: pop r15
0x1001a2741: pop rbp
0x1001a2742: ret 
0x1001a2743: lea r13, [rbx + 0x10]
0x1001a2747: vmovss xmm0, dword ptr [rbp - 0x2c]
0x1001a274c: jmp 0x1001a26fe ; 0x1001a26fe
0x1001a274e: lea rdi, [rip + 0x9d55ba] ; 0x100b77d0f !isNan( GetTransform() )
0x1001a2755: lea rsi, [rip + 0x9d5527] ; 0x100b77c83 BirdV2.cpp
0x1001a275c: mov edx, 0x6d6
0x1001a2761: mov ecx, 3
0x1001a2766: call 0x1007e5f70 ; 0x1007e5f70
0x1001a276b: ud2 
0x1001a276d: nop dword ptr [rax]
