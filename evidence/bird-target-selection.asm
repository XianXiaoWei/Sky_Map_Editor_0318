0x1001a2770: push rbp
0x1001a2771: mov rbp, rsp
0x1001a2774: push r15
0x1001a2776: push r14
0x1001a2778: push r13
0x1001a277a: push r12
0x1001a277c: push rbx
0x1001a277d: sub rsp, 0x78
0x1001a2781: mov r14, rsi
0x1001a2784: mov rbx, rdi
0x1001a2787: mov rax, qword ptr [rip + 0xa6b14a] ; 0x100c0d8d8
0x1001a278e: mov rax, qword ptr [rax]
0x1001a2791: mov qword ptr [rbp - 0x30], rax
0x1001a2795: mov r12, qword ptr [rbx + 8]
0x1001a2799: cmp qword ptr [r12 + 0x18], 0
0x1001a279f: je 0x1001a2954
0x1001a27a5: vmovss xmm0, dword ptr [r12 + 0x84]
0x1001a27af: vmovss dword ptr [rbp - 0x38], xmm0
0x1001a27b4: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001a27b9: vcvtsi2ss xmm0, xmm1, eax
0x1001a27bd: vmulss xmm0, xmm0, dword ptr [rip + 0x90492b] ; 0x100aa70f0
0x1001a27c5: vmovss xmm1, dword ptr [rbp - 0x38]
0x1001a27ca: vucomiss xmm1, xmm0
0x1001a27ce: jbe 0x1001a2954
0x1001a27d4: mov rdx, rsp
0x1001a27d7: mov rax, qword ptr [r12 + 0x18]
0x1001a27dc: mov esi, dword ptr [rax + 0x10]
0x1001a27df: lea rax, [rsi*8 + 0xf]
0x1001a27e7: movabs rcx, 0xffffffff0
0x1001a27f1: and rcx, rax
0x1001a27f4: mov rax, rsp
0x1001a27f7: sub rax, rcx
0x1001a27fa: mov qword ptr [rbp - 0x48], rax
0x1001a27fe: mov rsp, rax
0x1001a2801: xor r15d, r15d
0x1001a2804: mov qword ptr [rbp - 0x38], rsi
0x1001a2808: test rsi, rsi
0x1001a280b: je 0x1001a2960
0x1001a2811: mov qword ptr [rbp - 0x50], rbx
0x1001a2815: mov qword ptr [rbp - 0x40], rdx
0x1001a2819: mov qword ptr [rbp - 0x58], r14
0x1001a281d: xor r13d, r13d
0x1001a2820: mov rax, qword ptr [r12 + 0x18]
0x1001a2825: mov ecx, dword ptr [rax + 0x10]
0x1001a2828: cmp r13, rcx
0x1001a282b: jae 0x1001a298a
0x1001a2831: mov rax, qword ptr [rax + 8]
0x1001a2835: mov rax, qword ptr [rax + r13*8]
0x1001a2839: mov qword ptr [rbp - 0x60], rax
0x1001a283d: call 0x1007abc10 ; 0x1007abc10
0x1001a2842: mov r14, rax
0x1001a2845: mov qword ptr [rbp - 0xa0], 0
0x1001a2850: call 0x10043ccc0 ; 0x10043ccc0
0x1001a2855: mov rbx, qword ptr [rax]
0x1001a2858: mov rdi, rax
0x1001a285b: lea rsi, [rbp - 0xa0]
0x1001a2862: lea rdx, [rbp - 0x60]
0x1001a2866: mov rcx, r14
0x1001a2869: call qword ptr [rbx + 0x40]
0x1001a286c: mov r14, qword ptr [rbp - 0xa0]
0x1001a2873: test r14, r14
0x1001a2876: je 0x1001a29a9
0x1001a287c: mov rax, qword ptr [r14]
0x1001a287f: mov rdi, r14
0x1001a2882: call qword ptr [rax + 0x10]
0x1001a2885: test al, al
0x1001a2887: je 0x1001a2897
0x1001a2889: mov eax, r15d
0x1001a288c: mov rcx, qword ptr [rbp - 0x48]
0x1001a2890: mov qword ptr [rcx + rax*8], r14
0x1001a2894: inc r15d
0x1001a2897: inc r13
0x1001a289a: cmp r13, qword ptr [rbp - 0x38]
0x1001a289e: jb 0x1001a2820
0x1001a28a0: test r15d, r15d
0x1001a28a3: je 0x1001a2959
0x1001a28a9: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001a28ae: vcvtsi2ss xmm0, xmm2, eax
0x1001a28b2: vmulss xmm0, xmm0, dword ptr [rip + 0x904836] ; 0x100aa70f0
0x1001a28ba: vmulss xmm0, xmm0, dword ptr [rip + 0x90867e] ; 0x100aaaf40
0x1001a28c2: vcvttss2si eax, xmm0
0x1001a28c6: imul r15d, eax
0x1001a28ca: movsxd rax, r15d
0x1001a28cd: imul rax, rax, 0x14f8b589
0x1001a28d4: mov rcx, rax
0x1001a28d7: shr rcx, 0x3f
0x1001a28db: sar rax, 0x2d
0x1001a28df: add eax, ecx
0x1001a28e1: cdqe 
0x1001a28e3: mov rcx, qword ptr [rbp - 0x48]
0x1001a28e7: mov rsi, qword ptr [rcx + rax*8]
0x1001a28eb: mov rax, qword ptr [rsi]
0x1001a28ee: lea rdi, [rbp - 0xa0]
0x1001a28f5: call qword ptr [rax + 0x18]
0x1001a28f8: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x1001a28fd: mov rax, qword ptr [rbp - 0x50]
0x1001a2901: vmovaps xmmword ptr [rax + 0x30], xmm0
0x1001a2906: mov byte ptr [rax + 0x20], 1
0x1001a290a: mov byte ptr [rax + 0x48], 1
0x1001a290e: mov qword ptr [rax + 0x18], 0
0x1001a2916: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001a291b: vcvtsi2ss xmm0, xmm2, eax
0x1001a291f: vmulss xmm0, xmm0, dword ptr [rip + 0x9047c9] ; 0x100aa70f0
0x1001a2927: vmovss xmm1, dword ptr [rip + 0x902791] ; 0x100aa50c0
0x1001a292f: vsubss xmm1, xmm1, xmm0
0x1001a2933: vmulss xmm1, xmm1, dword ptr [rip + 0x90b011] ; 0x100aad94c
0x1001a293b: vmulss xmm0, xmm0, dword ptr [rip + 0x90b00d] ; 0x100aad950
0x1001a2943: vaddss xmm0, xmm0, xmm1
0x1001a2947: mov rax, qword ptr [rbp - 0x58]
0x1001a294b: vmovss dword ptr [rax], xmm0
0x1001a294f: mov r15b, 1
0x1001a2952: jmp 0x1001a295c ; 0x1001a295c
0x1001a2954: xor r15d, r15d
0x1001a2957: jmp 0x1001a2963 ; 0x1001a2963
0x1001a2959: xor r15d, r15d
0x1001a295c: mov rdx, qword ptr [rbp - 0x40]
0x1001a2960: mov rsp, rdx
0x1001a2963: mov rax, qword ptr [rip + 0xa6af6e] ; 0x100c0d8d8
0x1001a296a: mov rax, qword ptr [rax]
0x1001a296d: cmp rax, qword ptr [rbp - 0x30]
0x1001a2971: jne 0x1001a2985
0x1001a2973: mov eax, r15d
0x1001a2976: lea rsp, [rbp - 0x28]
0x1001a297a: pop rbx
0x1001a297b: pop r12
0x1001a297d: pop r13
0x1001a297f: pop r14
0x1001a2981: pop r15
0x1001a2983: pop rbp
0x1001a2984: ret 
0x1001a2985: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1001a298a: lea rdi, [rip + 0x9befc7] ; 0x100b61958 idx < size
0x1001a2991: lea rsi, [rip + 0x9befcb] ; 0x100b61963 ./Clump.h
0x1001a2998: mov edx, 0x36
0x1001a299d: mov ecx, 3
0x1001a29a2: call 0x1007e5f70 ; 0x1007e5f70
0x1001a29a7: ud2 
0x1001a29a9: lea rdi, [rip + 0x9bf148] ; 0x100b61af8 ret
0x1001a29b0: lea rsi, [rip + 0x9befac] ; 0x100b61963 ./Clump.h
0x1001a29b7: mov edx, 0x47
0x1001a29bc: mov ecx, 3
0x1001a29c1: call 0x1007e5f70 ; 0x1007e5f70
0x1001a29c6: ud2 
0x1001a29c8: nop dword ptr [rax + rax]
