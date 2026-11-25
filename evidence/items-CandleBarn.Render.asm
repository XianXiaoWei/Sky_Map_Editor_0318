0x1001ea220: push rbp
0x1001ea221: mov rbp, rsp
0x1001ea224: push r15
0x1001ea226: push r14
0x1001ea228: push r13
0x1001ea22a: push r12
0x1001ea22c: push rbx
0x1001ea22d: sub rsp, 0xb8
0x1001ea234: mov rbx, rdi
0x1001ea237: mov qword ptr [rbp - 0x58], rsi
0x1001ea23b: mov rax, qword ptr [rsi + 0x70]
0x1001ea23f: vmovaps xmm0, xmmword ptr [rax + 0x1c0]
0x1001ea247: vmovaps xmm6, xmmword ptr [rax + 0x1d0]
0x1001ea24f: vmovapd xmm1, xmmword ptr [rax + 0x1e0]
0x1001ea257: vmovaps xmm2, xmmword ptr [rax + 0x1f0]
0x1001ea25f: vinsertps xmm3, xmm0, xmm6, 0x1c
0x1001ea265: vunpcklpd xmm3, xmm3, xmm1
0x1001ea269: vinsertps xmm3, xmm3, xmm2, 0x30
0x1001ea26f: vinsertps xmm4, xmm6, xmm0, 0x4c
0x1001ea275: vunpckhps xmm5, xmm0, xmm6
0x1001ea279: vblendpd xmm5, xmm1, xmm5, 1
0x1001ea27f: vshufps xmm6, xmm6, xmm0, 0x33
0x1001ea284: vshufps xmm0, xmm6, xmm0, 0xe2
0x1001ea289: vinsertps xmm0, xmm0, xmm1, 0xe8
0x1001ea28f: vblendps xmm0, xmm0, xmm2, 8
0x1001ea295: vaddps xmm8, xmm0, xmm3
0x1001ea299: vmulps xmm6, xmm8, xmm8
0x1001ea29e: vmovshdup xmm7, xmm6
0x1001ea2a2: vaddss xmm7, xmm6, xmm7
0x1001ea2a6: vpermilpd xmm6, xmm6, 1
0x1001ea2ac: vaddss xmm7, xmm6, xmm7
0x1001ea2b0: vxorps xmm6, xmm6, xmm6
0x1001ea2b4: vucomiss xmm7, xmm6
0x1001ea2b8: jbe 0x1001ea2c8
0x1001ea2ba: vsqrtss xmm7, xmm7, xmm7
0x1001ea2be: vpermilps xmm7, xmm7, 0
0x1001ea2c4: vdivps xmm8, xmm8, xmm7
0x1001ea2c8: vinsertps xmm4, xmm4, xmm1, 0x68
0x1001ea2ce: vinsertps xmm1, xmm5, xmm2, 0xb0
0x1001ea2d4: vsubps xmm7, xmm0, xmm3
0x1001ea2d8: vmulps xmm3, xmm7, xmm7
0x1001ea2dc: vmovshdup xmm5, xmm3
0x1001ea2e0: vaddss xmm5, xmm3, xmm5
0x1001ea2e4: vpermilpd xmm3, xmm3, 1
0x1001ea2ea: vaddss xmm3, xmm3, xmm5
0x1001ea2ee: vucomiss xmm3, xmm6
0x1001ea2f2: jbe 0x1001ea302
0x1001ea2f4: vsqrtss xmm3, xmm3, xmm3
0x1001ea2f8: vpermilps xmm3, xmm3, 0
0x1001ea2fe: vdivps xmm7, xmm7, xmm3
0x1001ea302: vinsertps xmm2, xmm4, xmm2, 0x70
0x1001ea308: vaddps xmm5, xmm0, xmm1
0x1001ea30c: vmulps xmm3, xmm5, xmm5
0x1001ea310: vmovshdup xmm4, xmm3
0x1001ea314: vaddss xmm4, xmm3, xmm4
0x1001ea318: vpermilpd xmm3, xmm3, 1
0x1001ea31e: vaddss xmm4, xmm3, xmm4
0x1001ea322: vxorps xmm3, xmm3, xmm3
0x1001ea326: vucomiss xmm4, xmm3
0x1001ea32a: jbe 0x1001ea33a
0x1001ea32c: vsqrtss xmm4, xmm4, xmm4
0x1001ea330: vpermilps xmm4, xmm4, 0
0x1001ea336: vdivps xmm5, xmm5, xmm4
0x1001ea33a: vmovaps xmmword ptr [rbp - 0x90], xmm5
0x1001ea342: vaddps xmm6, xmm0, xmm2
0x1001ea346: vmulps xmm4, xmm6, xmm6
0x1001ea34a: vmovshdup xmm5, xmm4
0x1001ea34e: vaddss xmm5, xmm4, xmm5
0x1001ea352: vpermilpd xmm4, xmm4, 1
0x1001ea358: vaddss xmm4, xmm4, xmm5
0x1001ea35c: vucomiss xmm4, xmm3
0x1001ea360: jbe 0x1001ea370
0x1001ea362: vsqrtss xmm3, xmm4, xmm4
0x1001ea366: vpermilps xmm3, xmm3, 0
0x1001ea36c: vdivps xmm6, xmm6, xmm3
0x1001ea370: vmovaps xmm4, xmm6
0x1001ea374: vsubps xmm5, xmm0, xmm2
0x1001ea378: vmulps xmm2, xmm5, xmm5
0x1001ea37c: vmovshdup xmm3, xmm2
0x1001ea380: vaddss xmm3, xmm2, xmm3
0x1001ea384: vpermilpd xmm2, xmm2, 1
0x1001ea38a: vaddss xmm3, xmm2, xmm3
0x1001ea38e: vxorps xmm2, xmm2, xmm2
0x1001ea392: vucomiss xmm3, xmm2
0x1001ea396: jbe 0x1001ea3a6
0x1001ea398: vsqrtss xmm3, xmm3, xmm3
0x1001ea39c: vpermilps xmm3, xmm3, 0
0x1001ea3a2: vdivps xmm5, xmm5, xmm3
0x1001ea3a6: vsubps xmm3, xmm0, xmm1
0x1001ea3aa: vmulps xmm0, xmm3, xmm3
0x1001ea3ae: vmovshdup xmm1, xmm0
0x1001ea3b2: vaddss xmm1, xmm0, xmm1
0x1001ea3b6: vpermilpd xmm0, xmm0, 1
0x1001ea3bc: vaddss xmm0, xmm0, xmm1
0x1001ea3c0: vucomiss xmm0, xmm2
0x1001ea3c4: vmovaps xmmword ptr [rbp - 0xd0], xmm8
0x1001ea3cc: vmovaps xmmword ptr [rbp - 0xc0], xmm7
0x1001ea3d4: vmovaps xmmword ptr [rbp - 0xb0], xmm4
0x1001ea3dc: vmovaps xmmword ptr [rbp - 0xa0], xmm5
0x1001ea3e4: jbe 0x1001ea3f4
0x1001ea3e6: vsqrtss xmm0, xmm0, xmm0
0x1001ea3ea: vpermilps xmm0, xmm0, 0
0x1001ea3f0: vdivps xmm3, xmm3, xmm0
0x1001ea3f4: vmovaps xmmword ptr [rbp - 0x80], xmm3
0x1001ea3f9: mov r14d, dword ptr [rbx + 0xf988]
0x1001ea400: call 0x1007c6c20 ; 0x1007c6c20
0x1001ea405: shl r14, 3
0x1001ea409: lea r12, [rip + 0x1e5e740] ; 0x102048b50
0x1001ea410: mov rdx, qword ptr [r12]
0x1001ea414: mov ecx, 8
0x1001ea419: mov rdi, rax
0x1001ea41c: mov rsi, r14
0x1001ea41f: call 0x100795530 ; 0x100795530
0x1001ea424: mov r13, rax
0x1001ea427: mov r15d, dword ptr [rbx + 0xf988]
0x1001ea42e: call 0x1007c6c20 ; 0x1007c6c20
0x1001ea433: shl r15, 2
0x1001ea437: mov rdx, qword ptr [r12]
0x1001ea43b: mov ecx, 4
0x1001ea440: mov rdi, rax
0x1001ea443: mov rsi, r15
0x1001ea446: call 0x100795530 ; 0x100795530
0x1001ea44b: mov qword ptr [rbp - 0x38], rax
0x1001ea44f: mov r15d, dword ptr [rbx + 0xf988]
0x1001ea456: call 0x1007c6c20 ; 0x1007c6c20
0x1001ea45b: shl r15, 4
0x1001ea45f: mov rdx, qword ptr [r12]
0x1001ea463: mov ecx, 0x10
0x1001ea468: mov rdi, rax
0x1001ea46b: mov rsi, r15
0x1001ea46e: call 0x100795530 ; 0x100795530
0x1001ea473: mov edi, dword ptr [rbx + 0xf980]
0x1001ea479: xor r14d, r14d
0x1001ea47c: mov r12d, 0
0x1001ea482: test rdi, rdi
0x1001ea485: je 0x1001ea4b7
0x1001ea487: mov rdx, qword ptr [rbx + 0xf990]
0x1001ea48e: xor r12d, r12d
0x1001ea491: nop word ptr cs:[rax + rax]
0x1001ea4a0: mov ecx, r12d
0x1001ea4a3: shr ecx, 5
0x1001ea4a6: mov ecx, dword ptr [rdx + rcx*4]
0x1001ea4a9: bt ecx, r12d
0x1001ea4ad: jb 0x1001ea4b7
0x1001ea4af: inc r12d
0x1001ea4b2: cmp r12d, edi
0x1001ea4b5: jb 0x1001ea4a0
0x1001ea4b7: cmp edi, r12d
0x1001ea4ba: mov qword ptr [rbp - 0x30], rax
0x1001ea4be: je 0x1001ea79b
0x1001ea4c4: mov qword ptr [rbp - 0x48], r13
0x1001ea4c8: cmp edi, r12d
0x1001ea4cb: jbe 0x1001ea764
0x1001ea4d1: mov rax, rdi
0x1001ea4d4: shl rax, 0x20
0x1001ea4d8: mov r14d, r12d
0x1001ea4db: or r14, rax
0x1001ea4de: mov dword ptr [rbp - 0x3c], 0
0x1001ea4e5: movabs r13, 0xffffffff00000000
0x1001ea4ef: mov qword ptr [rbp - 0x50], rdi
0x1001ea4f3: nop word ptr cs:[rax + rax]
0x1001ea500: mov rax, qword ptr [rbx + 0xf990]
0x1001ea507: mov rcx, r14
0x1001ea50a: shr rcx, 3
0x1001ea50e: and ecx, 0x1ffffffc
0x1001ea514: mov eax, dword ptr [rax + rcx]
0x1001ea517: bt eax, r12d
0x1001ea51b: jae 0x1001ea8fc
0x1001ea521: mov r15, qword ptr [rbx + 0xf998]
0x1001ea528: mov eax, r14d
0x1001ea52b: imul rax, rax, 0x570
0x1001ea532: cmp byte ptr [r15 + rax + 0x568], 0
0x1001ea53b: je 0x1001ea54b
0x1001ea53d: mov cl, byte ptr [rip + 0xaa5dfd] ; 0x100c90340
0x1001ea543: test cl, cl
0x1001ea545: jne 0x1001ea710
0x1001ea54b: add r15, rax
0x1001ea54e: vmovaps xmm0, xmmword ptr [r15]
0x1001ea553: vmovaps xmmword ptr [rbp - 0xe0], xmm0
0x1001ea55b: mov rax, qword ptr [rbp - 0x58]
0x1001ea55f: mov rsi, qword ptr [rax + 0x70]
0x1001ea563: lea rdi, [rbp - 0x70]
0x1001ea567: call 0x10076be90 ; 0x10076be90
0x1001ea56c: vmovaps xmm3, xmmword ptr [rbp - 0xe0]
0x1001ea574: vpermilps xmm1, xmm3, 0xe7
0x1001ea57a: vmulss xmm0, xmm1, dword ptr [rip + 0x8bd26e] ; 0x100aa77f0
0x1001ea582: vxorps xmm2, xmm2, xmm2
0x1001ea586: vmaxss xmm0, xmm2, xmm0
0x1001ea58a: vmovss xmm2, dword ptr [rip + 0x8bab2e] ; 0x100aa50c0
0x1001ea592: vminss xmm0, xmm2, xmm0
0x1001ea596: vsubss xmm2, xmm2, xmm0
0x1001ea59a: vmulss xmm2, xmm2, dword ptr [rip + 0x8bd716] ; 0x100aa7cb8
0x1001ea5a2: vmulss xmm0, xmm0, dword ptr [rip + 0x8c5386] ; 0x100aaf930
0x1001ea5aa: vaddss xmm0, xmm0, xmm2
0x1001ea5ae: vsubps xmm2, xmm3, xmmword ptr [rbp - 0x70]
0x1001ea5b3: vmulps xmm2, xmm2, xmm2
0x1001ea5b7: vmovshdup xmm3, xmm2
0x1001ea5bb: vaddss xmm3, xmm2, xmm3
0x1001ea5bf: vpermilpd xmm2, xmm2, 1
0x1001ea5c5: vaddss xmm2, xmm2, xmm3
0x1001ea5c9: vmulss xmm0, xmm0, xmm0
0x1001ea5cd: vucomiss xmm2, xmm0
0x1001ea5d1: vmovaps xmm5, xmmword ptr [rbp - 0x90]
0x1001ea5d9: jbe 0x1001ea5f0
0x1001ea5db: mov rdi, qword ptr [rbp - 0x50]
0x1001ea5df: jmp 0x1001ea710 ; 0x1001ea710
0x1001ea5e4: nop word ptr cs:[rax + rax]
0x1001ea5f0: vmovaps xmm0, xmmword ptr [r15]
0x1001ea5f5: vinsertps xmm2, xmm0, dword ptr [rip + 0x8baac1], 0x30 ; 0x100aa50c0
0x1001ea5ff: vxorps xmm1, xmm1, xmmword ptr [rip + 0x8bd2f9] ; 0x100aa7900
0x1001ea607: vmulps xmm3, xmm2, xmmword ptr [rbp - 0xd0]
0x1001ea60f: vpermilpd xmm4, xmm3, 1
0x1001ea615: vaddps xmm3, xmm3, xmm4
0x1001ea619: vmovshdup xmm4, xmm3
0x1001ea61d: vaddss xmm3, xmm3, xmm4
0x1001ea621: vucomiss xmm1, xmm3
0x1001ea625: vmovaps xmm3, xmmword ptr [rbp - 0xc0]
0x1001ea62d: mov rdi, qword ptr [rbp - 0x50]
0x1001ea631: ja 0x1001ea710
0x1001ea637: vmulps xmm3, xmm2, xmm3
0x1001ea63b: vpermilpd xmm4, xmm3, 1
0x1001ea641: vaddps xmm3, xmm3, xmm4
0x1001ea645: vmovshdup xmm4, xmm3
0x1001ea649: vaddss xmm3, xmm3, xmm4
0x1001ea64d: vucomiss xmm1, xmm3
0x1001ea651: ja 0x1001ea710
0x1001ea657: vmulps xmm3, xmm2, xmm5
0x1001ea65b: vpermilpd xmm4, xmm3, 1
0x1001ea661: vaddps xmm3, xmm3, xmm4
0x1001ea665: vmovshdup xmm4, xmm3
0x1001ea669: vaddss xmm3, xmm3, xmm4
0x1001ea66d: vucomiss xmm1, xmm3
0x1001ea671: ja 0x1001ea710
0x1001ea677: vmulps xmm3, xmm2, xmmword ptr [rbp - 0xb0]
0x1001ea67f: vpermilpd xmm4, xmm3, 1
0x1001ea685: vaddps xmm3, xmm3, xmm4
0x1001ea689: vmovshdup xmm4, xmm3
0x1001ea68d: vaddss xmm3, xmm3, xmm4
0x1001ea691: vucomiss xmm1, xmm3
0x1001ea695: ja 0x1001ea710
0x1001ea697: vmulps xmm3, xmm2, xmmword ptr [rbp - 0xa0]
0x1001ea69f: vpermilpd xmm4, xmm3, 1
0x1001ea6a5: vaddps xmm3, xmm3, xmm4
0x1001ea6a9: vmovshdup xmm4, xmm3
0x1001ea6ad: vaddss xmm3, xmm3, xmm4
0x1001ea6b1: vucomiss xmm1, xmm3
0x1001ea6b5: ja 0x1001ea710
0x1001ea6b7: vmulps xmm2, xmm2, xmmword ptr [rbp - 0x80]
0x1001ea6bc: vpermilpd xmm3, xmm2, 1
0x1001ea6c2: vaddps xmm2, xmm2, xmm3
0x1001ea6c6: vmovshdup xmm3, xmm2
0x1001ea6ca: vaddss xmm2, xmm2, xmm3
0x1001ea6ce: vucomiss xmm1, xmm2
0x1001ea6d2: ja 0x1001ea710
0x1001ea6d4: mov esi, dword ptr [rbp - 0x3c]
0x1001ea6d7: mov eax, esi
0x1001ea6d9: mov rcx, rax
0x1001ea6dc: shl rcx, 4
0x1001ea6e0: mov rdx, qword ptr [rbp - 0x30]
0x1001ea6e4: vmovaps xmmword ptr [rdx + rcx], xmm0
0x1001ea6e9: mov rcx, qword ptr [rbp - 0x48]
0x1001ea6ed: mov qword ptr [rcx + rax*8], r15
0x1001ea6f1: mov rcx, qword ptr [rbp - 0x38]
0x1001ea6f5: mov dword ptr [rcx + rax*4], 0xffffffff
0x1001ea6fc: inc esi
0x1001ea6fe: mov dword ptr [rbp - 0x3c], esi
0x1001ea701: nop word ptr cs:[rax + rax]
0x1001ea710: mov rax, r14
0x1001ea713: shr rax, 0x20
0x1001ea717: inc r12d
0x1001ea71a: nop word ptr [rax + rax]
0x1001ea720: mov rcx, r12
0x1001ea723: and r14, r13
0x1001ea726: or r14, rcx
0x1001ea729: cmp ecx, eax
0x1001ea72b: jae 0x1001ea751
0x1001ea72d: cmp dword ptr [rbx + 0xf980], ecx
0x1001ea733: jbe 0x1001ea8d4
0x1001ea739: mov rdx, qword ptr [rbx + 0xf990]
0x1001ea740: mov esi, ecx
0x1001ea742: shr esi, 5
0x1001ea745: mov edx, dword ptr [rdx + rsi*4]
0x1001ea748: lea r12, [rcx + 1]
0x1001ea74c: bt edx, ecx
0x1001ea74f: jae 0x1001ea720
0x1001ea751: cmp edi, ecx
0x1001ea753: je 0x1001ea78f
0x1001ea755: cmp dword ptr [rbx + 0xf980], ecx
0x1001ea75b: mov r12d, ecx
0x1001ea75e: ja 0x1001ea500
0x1001ea764: lea rdi, [rip + 0x9897fe] ; 0x100b73f69 idx < kCapacity
0x1001ea76b: lea rsi, [rip + 0x989807] ; 0x100b73f79 ../../../Code/Base/ObjectPool.h
0x1001ea772: lea r8, [rip + 0x989820] ; 0x100b73f99 ObjectPool attempted to access out of bounds
0x1001ea779: mov edx, 0x6b
0x1001ea77e: mov ecx, 4
0x1001ea783: xor eax, eax
0x1001ea785: call 0x1007e6030 ; 0x1007e6030
0x1001ea78a: jmp 0x1001ea8fa ; 0x1001ea8fa
0x1001ea78f: mov r13, qword ptr [rbp - 0x48]
0x1001ea793: mov rax, qword ptr [rbp - 0x30]
0x1001ea797: mov r14d, dword ptr [rbp - 0x3c]
0x1001ea79b: mov rcx, qword ptr [rbp - 0x58]
0x1001ea79f: mov rdi, qword ptr [rcx + 0x2b8]
0x1001ea7a6: xor r8d, r8d
0x1001ea7a9: mov rsi, rax
0x1001ea7ac: mov edx, r14d
0x1001ea7af: mov r12, qword ptr [rbp - 0x38]
0x1001ea7b3: mov rcx, r12
0x1001ea7b6: call 0x100720dd0 ; 0x100720dd0
0x1001ea7bb: test r14d, r14d
0x1001ea7be: je 0x1001ea891
0x1001ea7c4: mov r15d, r14d
0x1001ea7c7: xor ebx, ebx
0x1001ea7c9: lea r14, [rbp - 0x70]
0x1001ea7cd: nop dword ptr [rax]
0x1001ea7d0: cmp dword ptr [r12 + rbx*4], 0
0x1001ea7d5: je 0x1001ea885
0x1001ea7db: mov rdi, qword ptr [r13 + rbx*8]
0x1001ea7e0: mov rax, qword ptr [rdi + 0x10]
0x1001ea7e4: vmovss xmm0, dword ptr [rax + 0x108]
0x1001ea7ec: vmovss xmm1, dword ptr [rip + 0x8bddbc] ; 0x100aa85b0
0x1001ea7f4: vmovaps xmm2, xmm1
0x1001ea7f8: vmaxss xmm1, xmm2, xmm0
0x1001ea7fc: vcmpunordss xmm0, xmm0, xmm0
0x1001ea801: vandnps xmm1, xmm0, xmm1
0x1001ea805: vandps xmm0, xmm0, xmm2
0x1001ea809: vorps xmm0, xmm1, xmm0
0x1001ea80d: vmovss xmm1, dword ptr [rip + 0x8bc8df] ; 0x100aa70f4
0x1001ea815: vmulss xmm1, xmm1, dword ptr [rax + 0x10c]
0x1001ea81d: vmovss xmm2, dword ptr [rip + 0x8ba89b] ; 0x100aa50c0
0x1001ea825: vaddss xmm1, xmm1, xmm2
0x1001ea829: vmulss xmm0, xmm0, xmm1
0x1001ea82d: vmulss xmm0, xmm0, dword ptr [rax + 0x114]
0x1001ea835: vmulss xmm0, xmm0, dword ptr [rip + 0x8bcf9f] ; 0x100aa77dc
0x1001ea83d: vminss xmm0, xmm0, xmm2
0x1001ea841: mov rax, qword ptr [rdi + 0x18]
0x1001ea845: vmovaps xmm1, xmmword ptr [rax + 0x50]
0x1001ea84a: vinsertps xmm0, xmm1, xmm0, 0x30
0x1001ea850: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x1001ea855: cmp byte ptr [rdi + 0x558], 0
0x1001ea85c: je 0x1001ea924
0x1001ea862: mov esi, dword ptr [rdi + 0x564]
0x1001ea868: add rdi, 0x290
0x1001ea86f: mov rdx, r14
0x1001ea872: call 0x1007be290 ; 0x1007be290
0x1001ea877: mov rdi, qword ptr [r13 + rbx*8]
0x1001ea87c: add rdi, 0x20
0x1001ea880: call 0x1007f6540 ; 0x1007f6540
0x1001ea885: inc rbx
0x1001ea888: cmp rbx, r15
0x1001ea88b: jb 0x1001ea7d0
0x1001ea891: call 0x1007c6c20 ; 0x1007c6c20
0x1001ea896: mov rdi, rax
0x1001ea899: mov rsi, qword ptr [rbp - 0x30]
0x1001ea89d: call 0x100795a70 ; 0x100795a70
0x1001ea8a2: call 0x1007c6c20 ; 0x1007c6c20
0x1001ea8a7: mov rdi, rax
0x1001ea8aa: mov rsi, r12
0x1001ea8ad: call 0x100795a70 ; 0x100795a70
0x1001ea8b2: call 0x1007c6c20 ; 0x1007c6c20
0x1001ea8b7: mov rdi, rax
0x1001ea8ba: mov rsi, r13
0x1001ea8bd: call 0x100795a70 ; 0x100795a70
0x1001ea8c2: add rsp, 0xb8
0x1001ea8c9: pop rbx
0x1001ea8ca: pop r12
0x1001ea8cc: pop r13
0x1001ea8ce: pop r14
0x1001ea8d0: pop r15
0x1001ea8d2: pop rbp
0x1001ea8d3: ret 
0x1001ea8d4: lea rdi, [rip + 0x98968e] ; 0x100b73f69 idx < kCapacity
0x1001ea8db: lea rsi, [rip + 0x989697] ; 0x100b73f79 ../../../Code/Base/ObjectPool.h
0x1001ea8e2: lea r8, [rip + 0x9896b0] ; 0x100b73f99 ObjectPool attempted to access out of bounds
0x1001ea8e9: mov edx, 0x39
0x1001ea8ee: mov ecx, 4
0x1001ea8f3: xor eax, eax
0x1001ea8f5: call 0x1007e6030 ; 0x1007e6030
0x1001ea8fa: ud2 
0x1001ea8fc: lea rdi, [rip + 0x9896c3] ; 0x100b73fc6 Allocated( idx )
0x1001ea903: lea rsi, [rip + 0x98966f] ; 0x100b73f79 ../../../Code/Base/ObjectPool.h
0x1001ea90a: lea r8, [rip + 0x9896c6] ; 0x100b73fd7 ObjectPool attempted to access unallocated slot
0x1001ea911: mov edx, 0x6c
0x1001ea916: mov ecx, 4
0x1001ea91b: xor eax, eax
0x1001ea91d: call 0x1007e6030 ; 0x1007e6030
0x1001ea922: jmp 0x1001ea8fa ; 0x1001ea8fa
0x1001ea924: lea rdi, [rip + 0x98c3bf] ; 0x100b76cea IsInitialized()
0x1001ea92b: lea rsi, [rip + 0x977949] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1001ea932: mov edx, 0xa8
0x1001ea937: mov ecx, 3
0x1001ea93c: call 0x1007e5f70 ; 0x1007e5f70
0x1001ea941: jmp 0x1001ea8fa ; 0x1001ea8fa
0x1001ea943: mov r14, rax
0x1001ea946: mov r12, qword ptr [rbp - 0x38]
0x1001ea94a: jmp 0x1001ea988 ; 0x1001ea988
0x1001ea94c: jmp 0x1001ea978 ; 0x1001ea978
0x1001ea94e: jmp 0x1001ea978 ; 0x1001ea978
0x1001ea950: jmp 0x1001ea985 ; 0x1001ea985
0x1001ea952: mov rdi, rax
0x1001ea955: call 0x100011bf0 ; 0x100011bf0
0x1001ea95a: mov rdi, rax
0x1001ea95d: call 0x100011bf0 ; 0x100011bf0
0x1001ea962: mov rdi, rax
0x1001ea965: call 0x100011bf0 ; 0x100011bf0
0x1001ea96a: mov r14, rax
0x1001ea96d: mov r12, qword ptr [rbp - 0x38]
0x1001ea971: jmp 0x1001ea99c ; 0x1001ea99c
0x1001ea973: mov r14, rax
0x1001ea976: jmp 0x1001ea9ac ; 0x1001ea9ac
0x1001ea978: mov r14, rax
0x1001ea97b: mov r13, qword ptr [rbp - 0x48]
0x1001ea97f: mov r12, qword ptr [rbp - 0x38]
0x1001ea983: jmp 0x1001ea988 ; 0x1001ea988
0x1001ea985: mov r14, rax
0x1001ea988: mov rbx, qword ptr [rbp - 0x30]
0x1001ea98c: call 0x1007c6c20 ; 0x1007c6c20
0x1001ea991: mov rdi, rax
0x1001ea994: mov rsi, rbx
0x1001ea997: call 0x100795a70 ; 0x100795a70
0x1001ea99c: call 0x1007c6c20 ; 0x1007c6c20
0x1001ea9a1: mov rdi, rax
0x1001ea9a4: mov rsi, r12
0x1001ea9a7: call 0x100795a70 ; 0x100795a70
0x1001ea9ac: call 0x1007c6c20 ; 0x1007c6c20
0x1001ea9b1: mov rdi, rax
0x1001ea9b4: mov rsi, r13
0x1001ea9b7: call 0x100795a70 ; 0x100795a70
0x1001ea9bc: mov rdi, r14
0x1001ea9bf: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1001ea9c4: mov rdi, rax
0x1001ea9c7: call 0x100011bf0 ; 0x100011bf0
0x1001ea9cc: mov rdi, rax
0x1001ea9cf: call 0x100011bf0 ; 0x100011bf0
0x1001ea9d4: mov rdi, rax
0x1001ea9d7: call 0x100011bf0 ; 0x100011bf0
0x1001ea9dc: nop dword ptr [rax]
