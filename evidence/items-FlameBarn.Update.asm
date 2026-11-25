0x10033d590: push rbp
0x10033d591: mov rbp, rsp
0x10033d594: push r15
0x10033d596: push r14
0x10033d598: push r13
0x10033d59a: push r12
0x10033d59c: push rbx
0x10033d59d: sub rsp, 0x3318
0x10033d5a4: mov r12, rcx
0x10033d5a7: mov r14, rdx
0x10033d5aa: mov qword ptr [rbp - 0x3178], rsi
0x10033d5b1: mov rbx, rdi
0x10033d5b4: mov qword ptr [rbp - 0x30f8], rbx
0x10033d5bb: mov rax, qword ptr [rip + 0x8d0316] ; 0x100c0d8d8
0x10033d5c2: mov rax, qword ptr [rax]
0x10033d5c5: mov qword ptr [rbp - 0x30], rax
0x10033d5c9: vxorps ymm0, ymm0, ymm0
0x10033d5cd: vmovups ymmword ptr [rip + 0x9ee613], ymm0 ; 0x100d2bbe8
0x10033d5d5: vmovups ymmword ptr [rip + 0x9ee5fb], ymm0 ; 0x100d2bbd8
0x10033d5dd: mov eax, dword ptr [rbx + 0x18]
0x10033d5e0: mov dword ptr [rip + 0x9ee5f2], eax ; 0x100d2bbd8
0x10033d5e6: lea rdi, [rbx + 0x36080]
0x10033d5ed: mov qword ptr [rbp - 0x31c8], rdi
0x10033d5f4: vzeroupper 
0x10033d5f7: call 0x100614ca0 ; 0x100614ca0
0x10033d5fc: lea rdi, [rbx + 0x36a50]
0x10033d603: mov qword ptr [rbp - 0x31c0], rdi
0x10033d60a: call 0x100614ca0 ; 0x100614ca0
0x10033d60f: lea rdi, [rbx + 0x37420]
0x10033d616: mov qword ptr [rbp - 0x31b8], rdi
0x10033d61d: call 0x100614ca0 ; 0x100614ca0
0x10033d622: lea rax, [rip + 0x1cbdaa7] ; 0x101ffb0d0
0x10033d629: cmp byte ptr [rax], 0
0x10033d62c: je 0x10033d63b
0x10033d62e: lea rax, [rip + 0x97af0b] ; 0x100cb8540
0x10033d635: vmovss xmm0, dword ptr [rax]
0x10033d639: jmp 0x10033d643 ; 0x10033d643
0x10033d63b: vmovss xmm0, dword ptr [rip + 0x767a7d] ; 0x100aa50c0
0x10033d643: mov rax, qword ptr [r14 + 0x160]
0x10033d64a: mov qword ptr [rbp - 0x3100], r14
0x10033d651: mov rdi, qword ptr [r14 + 0x280]
0x10033d658: vmulss xmm0, xmm0, dword ptr [rax + 0x20]
0x10033d65d: vmulss xmm0, xmm0, dword ptr [rax + 0x14]
0x10033d662: vmovss dword ptr [rbp - 0x30b0], xmm0
0x10033d66a: vmovss xmm0, dword ptr [rax + 0x24]
0x10033d66f: vmovss dword ptr [rbp - 0x30b4], xmm0
0x10033d677: call 0x1000fc260 ; 0x1000fc260
0x10033d67c: mov r14, rax
0x10033d67f: mov rax, qword ptr [r14]
0x10033d682: lea r15, [rbp - 0x3340]
0x10033d689: mov rdi, r15
0x10033d68c: mov rsi, r14
0x10033d68f: call qword ptr [rax + 0x18]
0x10033d692: mov rax, qword ptr [r14]
0x10033d695: lea r13, [rbp - 0x2090]
0x10033d69c: mov rdi, r13
0x10033d69f: mov rsi, r14
0x10033d6a2: call qword ptr [rax + 0x20]
0x10033d6a5: lea rdi, [rbp - 0x3300]
0x10033d6ac: mov rsi, r15
0x10033d6af: mov rdx, r13
0x10033d6b2: call 0x100076df0 ; 0x100076df0
0x10033d6b7: mov rax, qword ptr [r14 + 0x18]
0x10033d6bb: mov rcx, qword ptr [r14 + 0xa8]
0x10033d6c2: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x10033d6c7: vmovaps xmmword ptr [rbp - 0x3200], xmm0
0x10033d6cf: mov rdi, qword ptr [rcx + 0x210]
0x10033d6d6: test rdi, rdi
0x10033d6d9: mov qword ptr [rbp - 0x3128], rdi
0x10033d6e0: je 0x10033d6e9
0x10033d6e2: call 0x1003c62c0 ; 0x1003c62c0
0x10033d6e7: jmp 0x10033d6eb ; 0x10033d6eb
0x10033d6e9: xor eax, eax
0x10033d6eb: mov qword ptr [rbp - 0x30d8], rax
0x10033d6f2: mov rax, qword ptr [rbp - 0x3100]
0x10033d6f9: mov rsi, qword ptr [rax + 0x70]
0x10033d6fd: vmovaps xmm0, xmmword ptr [rsi + 0x1c0]
0x10033d705: vmovaps xmm6, xmmword ptr [rsi + 0x1d0]
0x10033d70d: vmovapd xmm1, xmmword ptr [rsi + 0x1e0]
0x10033d715: vmovaps xmm2, xmmword ptr [rsi + 0x1f0]
0x10033d71d: vinsertps xmm3, xmm0, xmm6, 0x1c
0x10033d723: vunpcklpd xmm3, xmm3, xmm1
0x10033d727: vinsertps xmm3, xmm3, xmm2, 0x30
0x10033d72d: vinsertps xmm9, xmm6, xmm0, 0x4c
0x10033d733: vunpckhps xmm5, xmm0, xmm6
0x10033d737: vblendpd xmm5, xmm1, xmm5, 1
0x10033d73d: vshufps xmm6, xmm6, xmm0, 0x33
0x10033d742: vshufps xmm0, xmm6, xmm0, 0xe2
0x10033d747: vinsertps xmm0, xmm0, xmm1, 0xe8
0x10033d74d: vblendps xmm0, xmm0, xmm2, 8
0x10033d753: vaddps xmm7, xmm0, xmm3
0x10033d757: vmulps xmm6, xmm7, xmm7
0x10033d75b: vmovshdup xmm4, xmm6
0x10033d75f: vaddss xmm4, xmm6, xmm4
0x10033d763: vpermilpd xmm6, xmm6, 1
0x10033d769: vaddss xmm6, xmm6, xmm4
0x10033d76d: vxorps xmm8, xmm8, xmm8
0x10033d772: vucomiss xmm6, xmm8
0x10033d777: mov rbx, qword ptr [rbp - 0x30f8]
0x10033d77e: jbe 0x10033d78e
0x10033d780: vsqrtss xmm4, xmm6, xmm6
0x10033d784: vpermilps xmm4, xmm4, 0
0x10033d78a: vdivps xmm7, xmm7, xmm4
0x10033d78e: vinsertps xmm4, xmm9, xmm1, 0x68
0x10033d794: vinsertps xmm1, xmm5, xmm2, 0xb0
0x10033d79a: vmovaps xmmword ptr [rbp - 0x1090], xmm7
0x10033d7a2: vsubps xmm3, xmm0, xmm3
0x10033d7a6: vmulps xmm5, xmm3, xmm3
0x10033d7aa: vmovshdup xmm6, xmm5
0x10033d7ae: vaddss xmm6, xmm5, xmm6
0x10033d7b2: vpermilpd xmm5, xmm5, 1
0x10033d7b8: vaddss xmm5, xmm5, xmm6
0x10033d7bc: vucomiss xmm5, xmm8
0x10033d7c1: jbe 0x10033d7d1
0x10033d7c3: vsqrtss xmm5, xmm5, xmm5
0x10033d7c7: vpermilps xmm5, xmm5, 0
0x10033d7cd: vdivps xmm3, xmm3, xmm5
0x10033d7d1: vinsertps xmm2, xmm4, xmm2, 0x70
0x10033d7d7: vmovaps xmmword ptr [rbp - 0x1080], xmm3
0x10033d7df: vaddps xmm4, xmm0, xmm1
0x10033d7e3: vmulps xmm3, xmm4, xmm4
0x10033d7e7: vmovshdup xmm5, xmm3
0x10033d7eb: vaddss xmm5, xmm3, xmm5
0x10033d7ef: vpermilpd xmm3, xmm3, 1
0x10033d7f5: vaddss xmm5, xmm3, xmm5
0x10033d7f9: vxorps xmm3, xmm3, xmm3
0x10033d7fd: vucomiss xmm5, xmm3
0x10033d801: jbe 0x10033d811
0x10033d803: vsqrtss xmm5, xmm5, xmm5
0x10033d807: vpermilps xmm5, xmm5, 0
0x10033d80d: vdivps xmm4, xmm4, xmm5
0x10033d811: vmovaps xmmword ptr [rbp - 0x1070], xmm4
0x10033d819: vaddps xmm4, xmm0, xmm2
0x10033d81d: vmulps xmm5, xmm4, xmm4
0x10033d821: vmovshdup xmm6, xmm5
0x10033d825: vaddss xmm6, xmm5, xmm6
0x10033d829: vpermilpd xmm5, xmm5, 1
0x10033d82f: vaddss xmm5, xmm5, xmm6
0x10033d833: vucomiss xmm5, xmm3
0x10033d837: jbe 0x10033d847
0x10033d839: vsqrtss xmm3, xmm5, xmm5
0x10033d83d: vpermilps xmm3, xmm3, 0
0x10033d843: vdivps xmm4, xmm4, xmm3
0x10033d847: vmovaps xmmword ptr [rbp - 0x1060], xmm4
0x10033d84f: vsubps xmm3, xmm0, xmm2
0x10033d853: vmulps xmm2, xmm3, xmm3
0x10033d857: vmovshdup xmm4, xmm2
0x10033d85b: vaddss xmm4, xmm2, xmm4
0x10033d85f: vpermilpd xmm2, xmm2, 1
0x10033d865: vaddss xmm4, xmm2, xmm4
0x10033d869: vxorps xmm2, xmm2, xmm2
0x10033d86d: vucomiss xmm4, xmm2
0x10033d871: jbe 0x10033d881
0x10033d873: vsqrtss xmm4, xmm4, xmm4
0x10033d877: vpermilps xmm4, xmm4, 0
0x10033d87d: vdivps xmm3, xmm3, xmm4
0x10033d881: vmovaps xmmword ptr [rbp - 0x1050], xmm3
0x10033d889: vsubps xmm0, xmm0, xmm1
0x10033d88d: vmulps xmm1, xmm0, xmm0
0x10033d891: vmovshdup xmm3, xmm1
0x10033d895: vaddss xmm3, xmm1, xmm3
0x10033d899: vpermilpd xmm1, xmm1, 1
0x10033d89f: vaddss xmm1, xmm1, xmm3
0x10033d8a3: vucomiss xmm1, xmm2
0x10033d8a7: jbe 0x10033d8b7
0x10033d8a9: vsqrtss xmm1, xmm1, xmm1
0x10033d8ad: vpermilps xmm1, xmm1, 0
0x10033d8b3: vdivps xmm0, xmm0, xmm1
0x10033d8b7: vmovaps xmmword ptr [rbp - 0x1040], xmm0
0x10033d8bf: lea rdi, [rbp - 0x32c0]
0x10033d8c6: call 0x10076be90 ; 0x10076be90
0x10033d8cb: mov edx, dword ptr [rbx + 0x10]
0x10033d8ce: test rdx, rdx
0x10033d8d1: je 0x10033eaa4
0x10033d8d7: mov rax, qword ptr [rbx + 0x20]
0x10033d8db: xor r15d, r15d
0x10033d8de: nop 
0x10033d8e0: mov ecx, r15d
0x10033d8e3: shr ecx, 5
0x10033d8e6: mov ecx, dword ptr [rax + rcx*4]
0x10033d8e9: bt ecx, r15d
0x10033d8ed: jb 0x10033d8f7
0x10033d8ef: inc r15d
0x10033d8f2: cmp r15d, edx
0x10033d8f5: jb 0x10033d8e0
0x10033d8f7: cmp edx, r15d
0x10033d8fa: je 0x10033eab0
0x10033d900: mov qword ptr [rbp - 0x31e8], r12
0x10033d907: cmp edx, r15d
0x10033d90a: jbe 0x10033ed37
0x10033d910: vmovss xmm0, dword ptr [rip + 0x769184] ; 0x100aa6a9c
0x10033d918: vmaxss xmm0, xmm0, dword ptr [rbp - 0x30b0]
0x10033d920: vmovss xmm1, dword ptr [rip + 0x769178] ; 0x100aa6aa0
0x10033d928: vminss xmm0, xmm1, xmm0
0x10033d92c: mov rax, rdx
0x10033d92f: shl rax, 0x20
0x10033d933: mov r13d, r15d
0x10033d936: or r13, rax
0x10033d939: xor eax, eax
0x10033d93b: mov qword ptr [rbp - 0x30f0], rax
0x10033d942: movabs r12, 0xffffffff00000000
0x10033d94c: mov dword ptr [rbp - 0x30d0], 0
0x10033d956: vmovss dword ptr [rbp - 0x3094], xmm0
0x10033d95e: mov qword ptr [rbp - 0x30e0], rdx
0x10033d965: nop word ptr cs:[rax + rax]
0x10033d970: mov rax, qword ptr [rbx + 0x20]
0x10033d974: mov rcx, r13
0x10033d977: shr rcx, 3
0x10033d97b: and ecx, 0x1ffffffc
0x10033d981: mov eax, dword ptr [rax + rcx]
0x10033d984: bt eax, r15d
0x10033d988: jae 0x10033ed1b
0x10033d98e: mov rbx, qword ptr [rbx + 0x28]
0x10033d992: mov eax, r13d
0x10033d995: imul r14, rax, 0x1b0
0x10033d99c: lea rdi, [rbx + r14]
0x10033d9a0: mov qword ptr [rbp - 0x30b0], rdi
0x10033d9a7: lea rsi, [rbp - 0x3300]
0x10033d9ae: mov rdx, qword ptr [rbp - 0x3100]
0x10033d9b5: call 0x10033c010 ; 0x10033c010
0x10033d9ba: cmp byte ptr [rbx + r14 + 0xb8], 0
0x10033d9c3: je 0x10033d9f0
0x10033d9c5: vmovss xmm0, dword ptr [rbx + r14 + 0xa0]
0x10033d9cf: vucomiss xmm0, dword ptr [rip + 0x76970d] ; 0x100aa70e4
0x10033d9d7: jbe 0x10033d9f0
0x10033d9d9: vmovss xmm1, dword ptr [rip + 0x7676df] ; 0x100aa50c0
0x10033d9e1: vucomiss xmm1, xmm0
0x10033d9e5: seta al
0x10033d9e8: jmp 0x10033d9f2 ; 0x10033d9f2
0x10033d9ea: nop word ptr [rax + rax]
0x10033d9f0: xor eax, eax
0x10033d9f2: mov byte ptr [rbx + r14 + 0xb7], al
0x10033d9fa: mov qword ptr [rbx + r14 + 0x120], 0
0x10033da06: mov byte ptr [rbx + r14 + 0x141], 0
0x10033da0f: mov rdi, qword ptr [rbp - 0x30b0]
0x10033da16: mov rax, qword ptr [rdi]
0x10033da19: call qword ptr [rax + 0x10]
0x10033da1c: test al, al
0x10033da1e: je 0x10033daa0
0x10033da24: vmovss xmm0, dword ptr [rbx + r14 + 0x110]
0x10033da2e: vucomiss xmm0, dword ptr [rip + 0x7696ae] ; 0x100aa70e4
0x10033da36: jbe 0x10033dbe0
0x10033da3c: inc dword ptr [rip + 0x9ee19a] ; 0x100d2bbdc
0x10033da42: mov ecx, dword ptr [rbp - 0x30d0]
0x10033da48: movsxd rax, ecx
0x10033da4b: inc ecx
0x10033da4d: mov dword ptr [rbp - 0x30d0], ecx
0x10033da53: mov rdx, qword ptr [rbp - 0x30b0]
0x10033da5a: mov qword ptr [rbp + rax*8 - 0x2090], rdx
0x10033da62: cmp rdx, qword ptr [rbp - 0x30d8]
0x10033da69: vmovss xmm3, dword ptr [rip + 0x76764f] ; 0x100aa50c0
0x10033da71: jne 0x10033daae
0x10033da73: mov rcx, qword ptr [rbp - 0x2090]
0x10033da7a: mov qword ptr [rbp - 0x2090], rdx
0x10033da81: mov qword ptr [rbp + rax*8 - 0x2090], rcx
0x10033da89: cmp byte ptr [rbx + r14 + 0xb6], 0
0x10033da92: jne 0x10033dabd
0x10033da94: jmp 0x10033db4b ; 0x10033db4b
0x10033da99: nop dword ptr [rax]
0x10033daa0: inc dword ptr [rip + 0x9ee13a] ; 0x100d2bbe0
0x10033daa6: vmovss xmm3, dword ptr [rip + 0x767612] ; 0x100aa50c0
0x10033daae: cmp byte ptr [rbx + r14 + 0xb6], 0
0x10033dab7: je 0x10033db4b
0x10033dabd: mov rax, qword ptr [rbp - 0x3100]
0x10033dac4: mov rdi, qword ptr [rax + 0x3c8]
0x10033dacb: vmovaps xmm0, xmmword ptr [rbx + r14 + 0xc0]
0x10033dad5: vmovaps xmmword ptr [rbp - 0x32b0], xmm0
0x10033dadd: vmovss xmm0, dword ptr [rbx + r14 + 0x108]
0x10033dae7: vmovss xmm1, dword ptr [rip + 0x76aac1] ; 0x100aa85b0
0x10033daef: vmovaps xmm2, xmm1
0x10033daf3: vmaxss xmm1, xmm2, xmm0
0x10033daf7: vcmpunordss xmm0, xmm0, xmm0
0x10033dafc: vandnps xmm1, xmm0, xmm1
0x10033db00: vandps xmm0, xmm0, xmm2
0x10033db04: vorps xmm0, xmm1, xmm0
0x10033db08: vmovss xmm1, dword ptr [rip + 0x7695e4] ; 0x100aa70f4
0x10033db10: vmulss xmm1, xmm1, dword ptr [rbx + r14 + 0x10c]
0x10033db1a: vaddss xmm1, xmm1, xmm3
0x10033db1e: vmulss xmm0, xmm0, xmm1
0x10033db22: xor edx, edx
0x10033db24: lea rsi, [rbp - 0x32b0]
0x10033db2b: call 0x1005a1850 ; 0x1005a1850
0x10033db30: test al, al
0x10033db32: je 0x10033db4b
0x10033db34: lea rax, [rbx + r14 + 0x10c]
0x10033db3c: mov dword ptr [rax], 0x3f800000
0x10033db42: mov byte ptr [rbx + r14 + 0x138], 1
0x10033db4b: cmp byte ptr [rbx + r14 + 0x142], 0
0x10033db54: je 0x10033db5c
0x10033db56: inc dword ptr [rip + 0x9ee0a8] ; 0x100d2bc04
0x10033db5c: lea rax, [rip + 0x1aa0d35] ; 0x101dde898
0x10033db63: cmp byte ptr [rax], 0
0x10033db66: mov rbx, qword ptr [rbp - 0x30f8]
0x10033db6d: vmovss xmm0, dword ptr [rbp - 0x3094]
0x10033db75: mov rsi, qword ptr [rbp - 0x30b0]
0x10033db7c: jne 0x10033dc58
0x10033db82: mov rcx, r13
0x10033db85: shr rcx, 0x20
0x10033db89: inc r15d
0x10033db8c: nop dword ptr [rax]
0x10033db90: mov rax, r15
0x10033db93: and r13, r12
0x10033db96: or r13, rax
0x10033db99: cmp eax, ecx
0x10033db9b: jae 0x10033dbbb
0x10033db9d: cmp dword ptr [rbx + 0x10], eax
0x10033dba0: jbe 0x10033ecf3
0x10033dba6: mov rdx, qword ptr [rbx + 0x20]
0x10033dbaa: mov esi, eax
0x10033dbac: shr esi, 5
0x10033dbaf: mov edx, dword ptr [rdx + rsi*4]
0x10033dbb2: lea r15, [rax + 1]
0x10033dbb6: bt edx, eax
0x10033dbb9: jae 0x10033db90
0x10033dbbb: mov rdx, qword ptr [rbp - 0x30e0]
0x10033dbc2: cmp edx, eax
0x10033dbc4: je 0x10033dc6d
0x10033dbca: cmp dword ptr [rbx + 0x10], eax
0x10033dbcd: mov r15d, eax
0x10033dbd0: ja 0x10033d970
0x10033dbd6: jmp 0x10033ed37 ; 0x10033ed37
0x10033dbdb: nop dword ptr [rax + rax]
0x10033dbe0: vmovaps xmm0, xmmword ptr [rbx + r14 + 0xc0]
0x10033dbea: vsubps xmm0, xmm0, xmmword ptr [rbp - 0x3200]
0x10033dbf2: vmulps xmm0, xmm0, xmm0
0x10033dbf6: vmovshdup xmm1, xmm0
0x10033dbfa: vaddss xmm1, xmm0, xmm1
0x10033dbfe: vpermilpd xmm0, xmm0, 1
0x10033dc04: vaddss xmm0, xmm0, xmm1
0x10033dc08: vmovss xmm1, dword ptr [rip + 0x76f930] ; 0x100aad540
0x10033dc10: vucomiss xmm1, xmm0
0x10033dc14: vmovss xmm3, dword ptr [rip + 0x7674a4] ; 0x100aa50c0
0x10033dc1c: jbe 0x10033daae
0x10033dc22: mov rcx, qword ptr [rbp - 0x30f0]
0x10033dc29: movsxd rax, ecx
0x10033dc2c: inc ecx
0x10033dc2e: mov qword ptr [rbp - 0x30f0], rcx
0x10033dc35: mov rcx, qword ptr [rbp - 0x30b0]
0x10033dc3c: mov qword ptr [rbp + rax*8 - 0x3090], rcx
0x10033dc44: cmp byte ptr [rbx + r14 + 0xb6], 0
0x10033dc4d: jne 0x10033dabd
0x10033dc53: jmp 0x10033db4b ; 0x10033db4b
0x10033dc58: mov rdi, rbx
0x10033dc5b: call 0x10033f720 ; 0x10033f720
0x10033dc60: vmovss xmm0, dword ptr [rbp - 0x3094]
0x10033dc68: jmp 0x10033db82 ; 0x10033db82
0x10033dc6d: mov ecx, dword ptr [rbp - 0x30d0]
0x10033dc73: test ecx, ecx
0x10033dc75: mov r14, qword ptr [rbp - 0x3100]
0x10033dc7c: jle 0x10033eab0
0x10033dc82: movsxd rax, ecx
0x10033dc85: mov qword ptr [rbp - 0x31d8], rax
0x10033dc8c: mov eax, dword ptr [rbp - 0x30f0]
0x10033dc92: mov qword ptr [rbp - 0x31d0], rax
0x10033dc99: vmovaps xmm1, xmmword ptr [rbp - 0x1090]
0x10033dca1: vmovaps xmmword ptr [rbp - 0x3280], xmm1
0x10033dca9: vmovaps xmm1, xmmword ptr [rbp - 0x1080]
0x10033dcb1: vmovaps xmmword ptr [rbp - 0x3270], xmm1
0x10033dcb9: vmovaps xmm1, xmmword ptr [rbp - 0x1070]
0x10033dcc1: vmovaps xmmword ptr [rbp - 0x3260], xmm1
0x10033dcc9: vmovaps xmm1, xmmword ptr [rbp - 0x1060]
0x10033dcd1: vmovaps xmmword ptr [rbp - 0x3250], xmm1
0x10033dcd9: vmovaps xmm1, xmmword ptr [rbp - 0x1050]
0x10033dce1: vmovaps xmmword ptr [rbp - 0x3240], xmm1
0x10033dce9: vmovaps xmm1, xmmword ptr [rbp - 0x1040]
0x10033dcf1: vmovaps xmmword ptr [rbp - 0x3230], xmm1
0x10033dcf9: mov eax, ecx
0x10033dcfb: lea rcx, [rbp - 0x2088]
0x10033dd02: mov qword ptr [rbp - 0x3180], rcx
0x10033dd09: mov qword ptr [rbp - 0x31e0], rax
0x10033dd10: dec rax
0x10033dd13: mov qword ptr [rbp - 0x30e0], rax
0x10033dd1a: xor r15d, r15d
0x10033dd1d: xor r13d, r13d
0x10033dd20: mov rbx, qword ptr [rbp - 0x30d8]
0x10033dd27: nop word ptr [rax + rax]
0x10033dd30: mov qword ptr [rbp - 0x30c0], r13
0x10033dd37: mov qword ptr [rbp - 0x30d0], r15
0x10033dd3e: mov rsi, qword ptr [rbp + r15*8 - 0x2090]
0x10033dd46: cmp rsi, rbx
0x10033dd49: sete al
0x10033dd4c: vmovaps xmm1, xmmword ptr [rsi + 0xc0]
0x10033dd54: vsubps xmm1, xmm1, xmmword ptr [rbp - 0x3200]
0x10033dd5c: vmulps xmm2, xmm1, xmm1
0x10033dd60: vmovshdup xmm1, xmm2
0x10033dd64: vaddss xmm1, xmm2, xmm1
0x10033dd68: vpermilpd xmm2, xmm2, 1
0x10033dd6e: vaddss xmm1, xmm2, xmm1
0x10033dd72: vmovss xmm2, dword ptr [rip + 0x76f7c6] ; 0x100aad540
0x10033dd7a: vucomiss xmm2, xmm1
0x10033dd7e: seta cl
0x10033dd81: cmp byte ptr [rsi + 0x13f], 0
0x10033dd88: mov qword ptr [rbp - 0x30b0], rsi
0x10033dd8f: je 0x10033df0f
0x10033dd95: or al, cl
0x10033dd97: je 0x10033df0f
0x10033dd9d: mov rax, qword ptr [rbp - 0x30d0]
0x10033dda4: inc rax
0x10033dda7: cmp rax, qword ptr [rbp - 0x31d8]
0x10033ddae: mov r12, rbx
0x10033ddb1: mov r13, r14
0x10033ddb4: mov r14, qword ptr [rbp - 0x3180]
0x10033ddbb: jge 0x10033dea0
0x10033ddc1: cmp qword ptr [rsi + 0x100], 0
0x10033ddc9: mov r15, qword ptr [rbp - 0x30e0]
0x10033ddd0: mov rbx, r14
0x10033ddd3: je 0x10033de25
0x10033ddd5: nop word ptr cs:[rax + rax]
0x10033dde0: xor r8d, r8d
0x10033dde3: cmp rsi, r12
0x10033dde6: sete r8b
0x10033ddea: mov rdx, qword ptr [rbx]
0x10033dded: mov rsi, qword ptr [rbp - 0x30b0]
0x10033ddf4: mov rcx, r13
0x10033ddf7: vmovss xmm1, dword ptr [rbp - 0x30b4]
0x10033ddff: mov r9, qword ptr [rbp - 0x3128]
0x10033de06: call 0x100340260 ; 0x100340260
0x10033de0b: mov rsi, qword ptr [rbp - 0x30b0]
0x10033de12: vmovss xmm0, dword ptr [rbp - 0x3094]
0x10033de1a: add rbx, 8
0x10033de1e: dec r15
0x10033de21: jne 0x10033dde0
0x10033de23: jmp 0x10033dea0 ; 0x10033dea0
0x10033de25: xor ebx, ebx
0x10033de27: nop word ptr [rax + rax]
0x10033de30: vmovss xmm1, dword ptr [rip + 0x767288] ; 0x100aa50c0
0x10033de38: vucomiss xmm1, dword ptr [rsi + 0x110]
0x10033de40: mov rdx, qword ptr [r14 + rbx*8]
0x10033de44: ja 0x10033de58
0x10033de46: vmovss xmm1, dword ptr [rip + 0x767272] ; 0x100aa50c0
0x10033de4e: vucomiss xmm1, dword ptr [rdx + 0x110]
0x10033de56: jbe 0x10033de8f
0x10033de58: xor r8d, r8d
0x10033de5b: cmp rsi, r12
0x10033de5e: sete r8b
0x10033de62: mov rsi, qword ptr [rbp - 0x30b0]
0x10033de69: mov rcx, r13
0x10033de6c: vmovss xmm1, dword ptr [rbp - 0x30b4]
0x10033de74: mov r9, qword ptr [rbp - 0x3128]
0x10033de7b: call 0x100340260 ; 0x100340260
0x10033de80: mov rsi, qword ptr [rbp - 0x30b0]
0x10033de87: vmovss xmm0, dword ptr [rbp - 0x3094]
0x10033de8f: inc rbx
0x10033de92: cmp qword ptr [rbp - 0x30e0], rbx
0x10033de99: jne 0x10033de30
0x10033de9b: nop dword ptr [rax + rax]
0x10033dea0: cmp dword ptr [rbp - 0x30f0], 0
0x10033dea7: mov r14, r13
0x10033deaa: mov r13, qword ptr [rbp - 0x3128]
0x10033deb1: jle 0x10033df0f
0x10033deb3: mov r15, qword ptr [rbp - 0x31d0]
0x10033deba: lea rbx, [rbp - 0x3090]
0x10033dec1: nop word ptr cs:[rax + rax]
0x10033ded0: xor r8d, r8d
0x10033ded3: cmp rsi, r12
0x10033ded6: sete r8b
0x10033deda: mov rdx, qword ptr [rbx]
0x10033dedd: mov rsi, qword ptr [rbp - 0x30b0]
0x10033dee4: mov rcx, r14
0x10033dee7: vmovss xmm1, dword ptr [rbp - 0x30b4]
0x10033deef: mov r9, r13
0x10033def2: call 0x100340260 ; 0x100340260
0x10033def7: mov rsi, qword ptr [rbp - 0x30b0]
0x10033defe: vmovss xmm0, dword ptr [rbp - 0x3094]
0x10033df06: add rbx, 8
0x10033df0a: dec r15
0x10033df0d: jne 0x10033ded0
0x10033df0f: mov dword ptr [rsi + 0x1a0], 0
0x10033df19: mov qword ptr [rsi + 0x198], 0
0x10033df24: vmovaps xmm0, xmmword ptr [rsi + 0xc0]
0x10033df2c: vmovaps xmmword ptr [rbp - 0x3170], xmm0
0x10033df34: mov rax, rsi
0x10033df37: mov rbx, qword ptr [rbp - 0x30f8]
0x10033df3e: sub rax, qword ptr [rbx + 0x28]
0x10033df42: shr rax, 4
0x10033df46: imul r12d, eax, 0x684bda13
0x10033df4d: vmovaps xmm0, xmmword ptr [rip + 0x77e92b] ; 0x100abc880
0x10033df55: vmovaps xmmword ptr [rbp - 0x3120], xmm0
0x10033df5d: lea rdi, [rbp - 0x430]
0x10033df64: lea rsi, [rbp - 0x3120]
0x10033df6b: vmovss xmm0, dword ptr [rip + 0x76a645] ; 0x100aa85b8
0x10033df73: call 0x10077d310 ; 0x10077d310
0x10033df78: mov rsi, qword ptr [rbp - 0x30b0]
0x10033df7f: vmovaps xmm0, xmmword ptr [rbp - 0x430]
0x10033df87: vmovss xmm7, dword ptr [rsi + 0x10c]
0x10033df8f: vxorps xmm4, xmm4, xmm4
0x10033df93: vmaxss xmm1, xmm4, xmm7
0x10033df97: vmovss xmm8, dword ptr [rip + 0x767121] ; 0x100aa50c0
0x10033df9f: vminss xmm1, xmm8, xmm1
0x10033dfa3: lea rax, [rip + 0x1d01706] ; 0x10203f6b0
0x10033dfaa: vmovaps xmm2, xmmword ptr [rax]
0x10033dfae: vsubps xmm0, xmm0, xmm2
0x10033dfb2: vpermilps xmm1, xmm1, 0
0x10033dfb8: vmulps xmm0, xmm0, xmm1
0x10033dfbc: vaddps xmm5, xmm2, xmm0
0x10033dfc0: vmovaps xmm10, xmmword ptr [rbp - 0x3170]
0x10033dfc8: vsubps xmm0, xmm10, xmmword ptr [rbp - 0x32c0]
0x10033dfd0: vmulps xmm0, xmm0, xmm0
0x10033dfd4: vmovshdup xmm1, xmm0
0x10033dfd8: vaddss xmm1, xmm0, xmm1
0x10033dfdc: vpermilpd xmm0, xmm0, 1
0x10033dfe2: vaddss xmm6, xmm0, xmm1
0x10033dfe6: mov r13, qword ptr [rbp - 0x30c0]
0x10033dfed: lea r15d, [r13 + 1]
0x10033dff1: cmp r15d, 0x3f
0x10033dff5: ja 0x10033e270
0x10033dffb: vmovaps xmmword ptr [rbp - 0x3140], xmm5
0x10033e003: vmovss xmm0, dword ptr [rsi + 0x108]
0x10033e00b: vcmpunordss xmm1, xmm0, xmm0
0x10033e010: vmovss xmm2, dword ptr [rip + 0x76a598] ; 0x100aa85b0
0x10033e018: vmovaps xmm3, xmm2
0x10033e01c: vandps xmm2, xmm1, xmm3
0x10033e020: vmaxss xmm0, xmm3, xmm0
0x10033e024: vandnps xmm0, xmm1, xmm0
0x10033e028: vorps xmm0, xmm0, xmm2
0x10033e02c: vmulss xmm1, xmm7, dword ptr [rip + 0x7690c0] ; 0x100aa70f4
0x10033e034: vaddss xmm1, xmm1, xmm8
0x10033e039: vmulss xmm0, xmm1, xmm0
0x10033e03d: vmaxss xmm1, xmm8, xmm0
0x10033e041: vmovss dword ptr [rbp - 0x3098], xmm6
0x10033e049: vdivss xmm1, xmm6, xmm1
0x10033e04d: vaddss xmm1, xmm1, dword ptr [rip + 0x77e807] ; 0x100abc85c
0x10033e055: vdivss xmm1, xmm1, dword ptr [rip + 0x77e803] ; 0x100abc860
0x10033e05d: vmaxss xmm1, xmm4, xmm1
0x10033e061: vminss xmm1, xmm8, xmm1
0x10033e065: vmovss dword ptr [rbp - 0x3110], xmm1
0x10033e06d: vmulss xmm0, xmm0, dword ptr [rip + 0x769767] ; 0x100aa77dc
0x10033e075: vmaxss xmm0, xmm8, xmm0
0x10033e079: vmovss xmm1, dword ptr [rip + 0x76b5ef] ; 0x100aa9670
0x10033e081: vminss xmm0, xmm1, xmm0
0x10033e085: vmovss dword ptr [rbp - 0x31a0], xmm0
0x10033e08d: imul eax, r12d, 0xc1
0x10033e094: vcvtsi2ss xmm0, xmm11, rax
0x10033e099: vaddss xmm0, xmm0, dword ptr [rbp - 0x30b4]
0x10033e0a1: vmulss xmm0, xmm0, dword ptr [rip + 0x77e7bb] ; 0x100abc864
0x10033e0a9: vmovss xmm1, dword ptr [rip + 0x766507] ; 0x100aa45b8
0x10033e0b1: vmulss xmm0, xmm0, xmm1
0x10033e0b5: vmovaps xmmword ptr [rbp - 0x3160], xmm10
0x10033e0bd: vmovss dword ptr [rbp - 0x312c], xmm7
0x10033e0c5: call 0x100aa2bca ; 0x100aa2bca _sinf
0x10033e0ca: vmulss xmm0, xmm0, dword ptr [rip + 0x76a4fe] ; 0x100aa85d0
0x10033e0d2: vmovss dword ptr [rbp - 0x30c4], xmm0
0x10033e0da: mov eax, r12d
0x10033e0dd: shl eax, 4
0x10033e0e0: add eax, r12d
0x10033e0e3: vcvtsi2ss xmm0, xmm11, rax
0x10033e0e8: vaddss xmm0, xmm0, dword ptr [rbp - 0x30b4]
0x10033e0f0: vmulss xmm0, xmm0, dword ptr [rip + 0x77e770] ; 0x100abc868
0x10033e0f8: vmulss xmm0, xmm0, dword ptr [rip + 0x7664b8] ; 0x100aa45b8
0x10033e100: call 0x100aa2bca ; 0x100aa2bca _sinf
0x10033e105: vmovss xmm1, dword ptr [rip + 0x7696db] ; 0x100aa77e8
0x10033e10d: vmulss xmm0, xmm0, xmm1
0x10033e111: vaddss xmm0, xmm0, dword ptr [rbp - 0x30c4]
0x10033e119: vmovss dword ptr [rbp - 0x30c4], xmm0
0x10033e121: imul eax, r12d, 0x78b
0x10033e128: vcvtsi2ss xmm0, xmm11, rax
0x10033e12d: vaddss xmm0, xmm0, dword ptr [rbp - 0x30b4]
0x10033e135: vmulss xmm0, xmm0, dword ptr [rip + 0x77e72f] ; 0x100abc86c
0x10033e13d: vmulss xmm0, xmm0, dword ptr [rip + 0x766473] ; 0x100aa45b8
0x10033e145: call 0x100aa2bca ; 0x100aa2bca _sinf
0x10033e14a: vmovaps xmm10, xmmword ptr [rbp - 0x3160]
0x10033e152: mov rsi, qword ptr [rbp - 0x30b0]
0x10033e159: vmovss xmm9, dword ptr [rip + 0x766457] ; 0x100aa45b8
0x10033e161: vmovss xmm8, dword ptr [rip + 0x766f57] ; 0x100aa50c0
0x10033e169: vmulss xmm0, xmm0, dword ptr [rip + 0x76a497] ; 0x100aa8608
0x10033e171: vaddss xmm0, xmm0, dword ptr [rbp - 0x30c4]
0x10033e179: vmulss xmm0, xmm0, xmm9
0x10033e17e: vaddss xmm0, xmm0, xmm8
0x10033e183: vmovss xmm1, dword ptr [rip + 0x76965d] ; 0x100aa77e8
0x10033e18b: vmulss xmm1, xmm1, dword ptr [rbp - 0x3110]
0x10033e193: vmulss xmm1, xmm1, dword ptr [rbx + 0xc]
0x10033e198: vmulss xmm1, xmm1, dword ptr [rbp - 0x31a0]
0x10033e1a0: vmulss xmm0, xmm0, xmm1
0x10033e1a4: vmulss xmm1, xmm9, dword ptr [rbp - 0x312c]
0x10033e1ac: vaddss xmm1, xmm1, xmm8
0x10033e1b1: vmulss xmm0, xmm1, xmm0
0x10033e1b5: vmulss xmm0, xmm0, dword ptr [rsi + 0x110]
0x10033e1bd: cmp qword ptr [rsi + 0x100], 0
0x10033e1c5: mov rbx, qword ptr [rbp - 0x30d8]
0x10033e1cc: jne 0x10033e21f
0x10033e1ce: test r13d, r13d
0x10033e1d1: je 0x10033e21f
0x10033e1d3: mov ecx, r13d
0x10033e1d6: lea rax, [rbp - 0x100c]
0x10033e1dd: xor edx, edx
0x10033e1df: nop 
0x10033e1e0: vmovaps xmm2, xmmword ptr [rax - 0x24]
0x10033e1e5: vsubps xmm3, xmm10, xmm2
0x10033e1e9: vmulps xmm1, xmm3, xmm3
0x10033e1ed: vmovshdup xmm4, xmm1
0x10033e1f1: vaddss xmm4, xmm1, xmm4
0x10033e1f5: vpermilpd xmm1, xmm1, 1
0x10033e1fb: vaddss xmm5, xmm1, xmm4
0x10033e1ff: vmovss xmm1, dword ptr [rax - 4]
0x10033e204: vmulss xmm4, xmm1, xmm1
0x10033e208: vmulss xmm6, xmm4, xmm9
0x10033e20d: vucomiss xmm6, xmm5
0x10033e211: ja 0x10033e287
0x10033e213: inc rdx
0x10033e216: add rax, 0x30
0x10033e21a: cmp rdx, rcx
0x10033e21d: jb 0x10033e1e0
0x10033e21f: mov edx, r12d
0x10033e222: mov eax, r13d
0x10033e225: lea rax, [rax + rax*2]
0x10033e229: shl rax, 4
0x10033e22d: vmovaps xmmword ptr [rbp + rax - 0x1030], xmm10
0x10033e236: vmovaps xmm5, xmmword ptr [rbp - 0x3140]
0x10033e23e: vmovaps xmmword ptr [rbp + rax - 0x1020], xmm5
0x10033e247: mov ecx, dword ptr [rsi + 0x118]
0x10033e24d: mov dword ptr [rbp + rax - 0x1010], ecx
0x10033e254: vmovss dword ptr [rbp + rax - 0x100c], xmm0
0x10033e25d: mov r13d, r15d
0x10033e260: jmp 0x10033e308 ; 0x10033e308
0x10033e265: nop word ptr cs:[rax + rax]
0x10033e270: mov edx, r12d
0x10033e273: mov rbx, qword ptr [rbp - 0x30d8]
0x10033e27a: vmovss xmm9, dword ptr [rip + 0x766336] ; 0x100aa45b8
0x10033e282: jmp 0x10033e314 ; 0x10033e314
0x10033e287: mov edx, r12d
0x10033e28a: vmovss xmm5, dword ptr [rsi + 0x118]
0x10033e292: vmulss xmm5, xmm5, xmm5
0x10033e296: vaddss xmm4, xmm4, xmm5
0x10033e29a: vdivss xmm4, xmm5, xmm4
0x10033e29e: vpermilps xmm5, xmm4, 0xc0
0x10033e2a4: vmulps xmm3, xmm3, xmm5
0x10033e2a8: vmulps xmm6, xmm3, xmm3
0x10033e2ac: vmovshdup xmm7, xmm6
0x10033e2b0: vaddss xmm7, xmm6, xmm7
0x10033e2b4: vpermilpd xmm6, xmm6, 1
0x10033e2ba: vaddss xmm6, xmm6, xmm7
0x10033e2be: vsqrtss xmm6, xmm6, xmm6
0x10033e2c2: vaddps xmm2, xmm2, xmm3
0x10033e2c6: vmovaps xmmword ptr [rax - 0x24], xmm2
0x10033e2cb: vsubss xmm2, xmm8, xmm4
0x10033e2cf: vpermilps xmm2, xmm2, 0xc0
0x10033e2d5: vmulps xmm2, xmm2, xmmword ptr [rax - 0x14]
0x10033e2da: vmovaps xmm7, xmmword ptr [rbp - 0x3140]
0x10033e2e2: vmulps xmm3, xmm7, xmm5
0x10033e2e6: vmovaps xmm5, xmm7
0x10033e2ea: vaddps xmm2, xmm3, xmm2
0x10033e2ee: vmovaps xmmword ptr [rax - 0x14], xmm2
0x10033e2f3: vmulss xmm0, xmm0, xmm4
0x10033e2f7: vaddss xmm0, xmm0, dword ptr [rax]
0x10033e2fb: vmovss dword ptr [rax], xmm0
0x10033e2ff: vaddss xmm0, xmm1, xmm6
0x10033e303: vmovss dword ptr [rax - 4], xmm0
0x10033e308: vxorps xmm4, xmm4, xmm4
0x10033e30c: vmovss xmm6, dword ptr [rbp - 0x3098]
0x10033e314: vmovss xmm0, dword ptr [rip + 0x77e554] ; 0x100abc870
0x10033e31c: vucomiss xmm0, xmm6
0x10033e320: mov r12, qword ptr [rbp - 0x31e8]
0x10033e327: mov r15, qword ptr [rbp - 0x30d0]
0x10033e32e: vmovss xmm3, dword ptr [rip + 0x76a32e] ; 0x100aa8664
0x10033e336: jbe 0x10033e9f0
0x10033e33c: vinsertps xmm0, xmm10, dword ptr [rip + 0x766d7a], 0x30 ; 0x100aa50c0
0x10033e346: vmulps xmm1, xmm0, xmmword ptr [rbp - 0x3280]
0x10033e34e: vpermilpd xmm2, xmm1, 1
0x10033e354: vaddps xmm1, xmm1, xmm2
0x10033e358: vmovshdup xmm2, xmm1
0x10033e35c: vaddss xmm1, xmm1, xmm2
0x10033e360: vucomiss xmm3, xmm1
0x10033e364: ja 0x10033e9f0
0x10033e36a: vmulps xmm1, xmm0, xmmword ptr [rbp - 0x3270]
0x10033e372: vpermilpd xmm2, xmm1, 1
0x10033e378: vaddps xmm1, xmm1, xmm2
0x10033e37c: vmovshdup xmm2, xmm1
0x10033e380: vaddss xmm1, xmm1, xmm2
0x10033e384: vucomiss xmm3, xmm1
0x10033e388: ja 0x10033e9f0
0x10033e38e: vmulps xmm1, xmm0, xmmword ptr [rbp - 0x3260]
0x10033e396: vpermilpd xmm2, xmm1, 1
0x10033e39c: vaddps xmm1, xmm1, xmm2
0x10033e3a0: vmovshdup xmm2, xmm1
0x10033e3a4: vaddss xmm1, xmm1, xmm2
0x10033e3a8: vucomiss xmm3, xmm1
0x10033e3ac: ja 0x10033e9f0
0x10033e3b2: vmulps xmm1, xmm0, xmmword ptr [rbp - 0x3250]
0x10033e3ba: vpermilpd xmm2, xmm1, 1
0x10033e3c0: vaddps xmm1, xmm1, xmm2
0x10033e3c4: vmovshdup xmm2, xmm1
0x10033e3c8: vaddss xmm1, xmm1, xmm2
0x10033e3cc: vucomiss xmm3, xmm1
0x10033e3d0: ja 0x10033e9f0
0x10033e3d6: vmulps xmm1, xmm0, xmmword ptr [rbp - 0x3240]
0x10033e3de: vpermilpd xmm2, xmm1, 1
0x10033e3e4: vaddps xmm1, xmm1, xmm2
0x10033e3e8: vmovshdup xmm2, xmm1
0x10033e3ec: vaddss xmm1, xmm1, xmm2
0x10033e3f0: vucomiss xmm3, xmm1
0x10033e3f4: ja 0x10033e9f0
0x10033e3fa: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x3230]
0x10033e402: vpermilpd xmm1, xmm0, 1
0x10033e408: vaddps xmm0, xmm0, xmm1
0x10033e40c: vmovshdup xmm1, xmm0
0x10033e410: vaddss xmm0, xmm0, xmm1
0x10033e414: vucomiss xmm3, xmm0
0x10033e418: ja 0x10033e9f0
0x10033e41e: lea rax, [rsi + 0xc0]
0x10033e425: mov qword ptr [rbp - 0x3160], rax
0x10033e42c: vaddss xmm0, xmm6, dword ptr [rip + 0x77e440] ; 0x100abc874
0x10033e434: vdivss xmm0, xmm0, dword ptr [rip + 0x77e43c] ; 0x100abc878
0x10033e43c: vmaxss xmm0, xmm4, xmm0
0x10033e440: vminss xmm0, xmm8, xmm0
0x10033e444: vmovss dword ptr [rbp - 0x3098], xmm0
0x10033e44c: mov rax, qword ptr [r14 + 0x160]
0x10033e453: vmovss xmm1, dword ptr [rax + 0x24]
0x10033e458: vmovss dword ptr [rbp - 0x30c0], xmm1
0x10033e460: mov dword ptr [rbp - 0x30e4], edx
0x10033e466: imul eax, edx, 0xc1
0x10033e46c: vcvtsi2ss xmm0, xmm11, rax
0x10033e471: vaddss xmm0, xmm1, xmm0
0x10033e475: vmulss xmm0, xmm0, dword ptr [rip + 0x77e3e7] ; 0x100abc864
0x10033e47d: vmulss xmm0, xmm0, xmm9
0x10033e482: vmovaps xmmword ptr [rbp - 0x3140], xmm5
0x10033e48a: call 0x100aa2bca ; 0x100aa2bca _sinf
0x10033e48f: vmulss xmm0, xmm0, dword ptr [rip + 0x76a139] ; 0x100aa85d0
0x10033e497: vmovss dword ptr [rbp - 0x3110], xmm0
0x10033e49f: mov ecx, dword ptr [rbp - 0x30e4]
0x10033e4a5: mov eax, ecx
0x10033e4a7: shl eax, 4
0x10033e4aa: add eax, ecx
0x10033e4ac: vcvtsi2ss xmm0, xmm11, rax
0x10033e4b1: vaddss xmm0, xmm0, dword ptr [rbp - 0x30c0]
0x10033e4b9: vmulss xmm0, xmm0, dword ptr [rip + 0x77e3a7] ; 0x100abc868
0x10033e4c1: vmulss xmm0, xmm0, dword ptr [rip + 0x7660ef] ; 0x100aa45b8
0x10033e4c9: call 0x100aa2bca ; 0x100aa2bca _sinf
0x10033e4ce: vmovss xmm1, dword ptr [rip + 0x769312] ; 0x100aa77e8
0x10033e4d6: vmulss xmm0, xmm0, xmm1
0x10033e4da: vaddss xmm0, xmm0, dword ptr [rbp - 0x3110]
0x10033e4e2: vmovss dword ptr [rbp - 0x3110], xmm0
0x10033e4ea: imul eax, dword ptr [rbp - 0x30e4], 0x78b
0x10033e4f4: vcvtsi2ss xmm0, xmm11, rax
0x10033e4f9: vaddss xmm0, xmm0, dword ptr [rbp - 0x30c0]
0x10033e501: vmulss xmm0, xmm0, dword ptr [rip + 0x77e363] ; 0x100abc86c
0x10033e509: vmulss xmm0, xmm0, dword ptr [rip + 0x7660a7] ; 0x100aa45b8
0x10033e511: call 0x100aa2bca ; 0x100aa2bca _sinf
0x10033e516: vmulss xmm0, xmm0, dword ptr [rip + 0x76a0ea] ; 0x100aa8608
0x10033e51e: vaddss xmm0, xmm0, dword ptr [rbp - 0x3110]
0x10033e526: vmovss xmm3, dword ptr [rip + 0x76608a] ; 0x100aa45b8
0x10033e52e: vmulss xmm0, xmm0, xmm3
0x10033e532: vmovss xmm2, dword ptr [rip + 0x766b86] ; 0x100aa50c0
0x10033e53a: vaddss xmm0, xmm0, xmm2
0x10033e53e: vmulss xmm1, xmm3, dword ptr [rbp - 0x3098]
0x10033e546: mov rax, qword ptr [rbp - 0x30f8]
0x10033e54d: vmulss xmm1, xmm1, dword ptr [rax + 0xc]
0x10033e552: vmulss xmm0, xmm1, xmm0
0x10033e556: mov rax, qword ptr [rbp - 0x30b0]
0x10033e55d: vmulss xmm1, xmm3, dword ptr [rax + 0x10c]
0x10033e565: vaddss xmm1, xmm1, xmm2
0x10033e569: vmulss xmm0, xmm1, xmm0
0x10033e56d: mov rax, qword ptr [rbp - 0x30b0]
0x10033e574: vmulss xmm1, xmm0, dword ptr [rax + 0x110]
0x10033e57c: vmovaps xmm0, xmmword ptr [rbp - 0x3220]
0x10033e584: vblendps xmm0, xmm0, xmmword ptr [rip + 0x77e302], 7 ; 0x100abc890
0x10033e58e: vmovaps xmmword ptr [rbp - 0x3220], xmm0
0x10033e596: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x3140]
0x10033e59e: vinsertps xmm0, xmm0, xmm2, 0x30
0x10033e5a4: vmovaps xmmword ptr [rbp - 0x430], xmm0
0x10033e5ac: vmovss xmm0, dword ptr [rip + 0x768b40] ; 0x100aa70f4
0x10033e5b4: mov rax, qword ptr [rbp - 0x30b0]
0x10033e5bb: vmulss xmm0, xmm0, dword ptr [rax + 0x118]
0x10033e5c3: vxorps xmm2, xmm2, xmm2
0x10033e5c7: mov rdi, r12
0x10033e5ca: lea rsi, [rbp - 0x430]
0x10033e5d1: lea rdx, [rbp - 0x3170]
0x10033e5d8: call 0x100416140 ; 0x100416140
0x10033e5dd: inc dword ptr [rip + 0x9ed61d] ; 0x100d2bc00
0x10033e5e3: mov rax, qword ptr [rbp - 0x30b0]
0x10033e5ea: vmovss xmm0, dword ptr [rax + 0x108]
0x10033e5f2: vcmpunordss xmm1, xmm0, xmm0
0x10033e5f7: vmovss xmm2, dword ptr [rip + 0x769fb1] ; 0x100aa85b0
0x10033e5ff: vmovaps xmm3, xmm2
0x10033e603: vandps xmm2, xmm1, xmm3
0x10033e607: vmaxss xmm0, xmm3, xmm0
0x10033e60b: vandnps xmm0, xmm1, xmm0
0x10033e60f: vorps xmm0, xmm0, xmm2
0x10033e613: mov rax, qword ptr [rbp - 0x30b0]
0x10033e61a: vmovss xmm1, dword ptr [rip + 0x768ad2] ; 0x100aa70f4
0x10033e622: vmulss xmm1, xmm1, dword ptr [rax + 0x10c]
0x10033e62a: vmovss xmm2, dword ptr [rip + 0x766a8e] ; 0x100aa50c0
0x10033e632: vaddss xmm1, xmm1, xmm2
0x10033e636: vmulss xmm0, xmm0, xmm1
0x10033e63a: mov rax, qword ptr [rbp - 0x30b0]
0x10033e641: vmulss xmm0, xmm0, dword ptr [rax + 0x114]
0x10033e649: vmovss dword ptr [rbp - 0x3098], xmm0
0x10033e651: vmulss xmm0, xmm0, dword ptr [rip + 0x76844b] ; 0x100aa6aa4
0x10033e659: vmovaps xmmword ptr [rbp - 0x3110], xmm0
0x10033e661: mov rsi, qword ptr [r14 + 0x2c8]
0x10033e668: lea rdi, [rbp - 0x3120]
0x10033e66f: mov rdx, qword ptr [rbp - 0x3160]
0x10033e676: call 0x100328200 ; 0x100328200
0x10033e67b: vmovaps xmm0, xmmword ptr [rbp - 0x3140]
0x10033e683: vmulps xmm0, xmm0, xmmword ptr [rip + 0x77e215] ; 0x100abc8a0
0x10033e68b: vmovshdup xmm1, xmm0
0x10033e68f: vaddss xmm1, xmm0, xmm1
0x10033e693: vpermilpd xmm0, xmm0, 1
0x10033e699: vaddss xmm0, xmm0, xmm1
0x10033e69d: vmovss xmm1, dword ptr [rip + 0x76d8ab] ; 0x100aabf50
0x10033e6a5: vmovaps xmm2, xmm1
0x10033e6a9: vmaxss xmm1, xmm2, xmm0
0x10033e6ad: vcmpunordss xmm0, xmm0, xmm0
0x10033e6b2: vandnps xmm1, xmm0, xmm1
0x10033e6b6: vandps xmm0, xmm0, xmm2
0x10033e6ba: vorps xmm0, xmm1, xmm0
0x10033e6be: vmovaps xmmword ptr [rbp - 0x3160], xmm0
0x10033e6c6: vmovaps xmm0, xmmword ptr [rbp - 0x3120]
0x10033e6ce: vmovaps xmmword ptr [rbp - 0x31a0], xmm0
0x10033e6d6: vmulps xmm0, xmm0, xmm0
0x10033e6da: vmovshdup xmm1, xmm0
0x10033e6de: vaddss xmm1, xmm0, xmm1
0x10033e6e2: vpermilpd xmm0, xmm0, 1
0x10033e6e8: vaddss xmm0, xmm0, xmm1
0x10033e6ec: vsqrtss xmm0, xmm0, xmm0
0x10033e6f0: vmaxss xmm0, xmm0, dword ptr [rip + 0x769ebc] ; 0x100aa85b4
0x10033e6f8: vmulss xmm0, xmm0, dword ptr [rbp - 0x30c0]
0x10033e700: vmulss xmm0, xmm0, dword ptr [rip + 0x7690e0] ; 0x100aa77e8
0x10033e708: call 0x100aa2bca ; 0x100aa2bca _sinf
0x10033e70d: vmovaps xmm4, xmmword ptr [rbp - 0x3110]
0x10033e715: mov rax, qword ptr [rbp - 0x30b0]
0x10033e71c: vandps xmm0, xmm0, xmmword ptr [rip + 0x7691ec] ; 0x100aa7910
0x10033e724: vmovaps xmm1, xmmword ptr [rax + 0xf0]
0x10033e72c: vsubps xmm1, xmm1, xmmword ptr [rax + 0xc0]
0x10033e734: vmovaps xmmword ptr [rbp - 0x3150], xmm1
0x10033e73c: vmovss dword ptr [rbp - 0x314c], xmm4
0x10033e744: vpermilps xmm1, xmm4, 0xc0
0x10033e74a: vmovaps xmm2, xmmword ptr [rbp - 0x31a0]
0x10033e752: vdivps xmm1, xmm2, xmm1
0x10033e756: vpshufd xmm2, xmm0, 0xc0
0x10033e75b: vmulps xmm1, xmm1, xmm2
0x10033e75f: vmulps xmm1, xmm1, xmmword ptr [rip + 0x76d329] ; 0x100aaba90
0x10033e767: vaddps xmm1, xmm1, xmmword ptr [rbp - 0x3150]
0x10033e76f: vmulps xmm2, xmm1, xmm1
0x10033e773: vmovshdup xmm3, xmm2
0x10033e777: vaddss xmm3, xmm2, xmm3
0x10033e77b: vpermilpd xmm2, xmm2, 1
0x10033e781: vaddss xmm2, xmm2, xmm3
0x10033e785: vsqrtss xmm2, xmm2, xmm2
0x10033e789: vucomiss xmm2, dword ptr [rip + 0x769133] ; 0x100aa78c4
0x10033e791: jbe 0x10033e79d
0x10033e793: vpermilps xmm2, xmm2, 0xc0
0x10033e799: vdivps xmm1, xmm1, xmm2
0x10033e79d: vmovaps xmmword ptr [rbp - 0x3150], xmm1
0x10033e7a5: vmulss xmm1, xmm0, dword ptr [rip + 0x76903b] ; 0x100aa77e8
0x10033e7ad: vmovss xmm0, dword ptr [rip + 0x76690b] ; 0x100aa50c0
0x10033e7b5: vminss xmm1, xmm1, xmm0
0x10033e7b9: vmovaps xmm2, xmmword ptr [rbp - 0x3160]
0x10033e7c1: vunpcklps xmm2, xmm2, xmm1
0x10033e7c5: vmovss xmm1, dword ptr [rax + 0xb0]
0x10033e7cd: vshufps xmm1, xmm2, xmm1, 0x14
0x10033e7d2: vmovaps xmmword ptr [rbp - 0x32a0], xmm1
0x10033e7da: vmovaps xmm1, xmmword ptr [rip + 0x77e0ce] ; 0x100abc8b0
0x10033e7e2: vmovaps xmm2, xmmword ptr [rbp - 0x3210]
0x10033e7ea: vinsertps xmm2, xmm1, xmm2, 0xf5
0x10033e7f0: vmovaps xmm1, xmmword ptr [rbp - 0x3170]
0x10033e7f8: vmovaps xmmword ptr [rbp - 0x3210], xmm2
0x10033e800: vsubps xmm1, xmm1, xmm2
0x10033e804: vmovaps xmmword ptr [rbp - 0x3190], xmm1
0x10033e80c: vxorps xmm1, xmm1, xmm1
0x10033e810: mov rdi, qword ptr [rbp - 0x31c8]
0x10033e817: lea rsi, [rbp - 0x3190]
0x10033e81e: lea rdx, [rbp - 0x3150]
0x10033e825: vmovaps xmm2, xmmword ptr [rip + 0x76bd23] ; 0x100aaa550
0x10033e82d: lea rcx, [rbp - 0x32a0]
0x10033e834: vmovss xmm3, dword ptr [rbp - 0x3098]
0x10033e83c: call 0x100614df0 ; 0x100614df0
0x10033e841: mov rax, qword ptr [rbp - 0x30b0]
0x10033e848: vmovss xmm1, dword ptr [rax + 0x11c]
0x10033e850: vxorps xmm0, xmm0, xmm0
0x10033e854: vucomiss xmm1, xmm0
0x10033e858: jbe 0x10033e9f0
0x10033e85e: vmovss dword ptr [rbp - 0x30c0], xmm1
0x10033e866: vmovss xmm0, dword ptr [rip + 0x76ad86] ; 0x100aa95f4
0x10033e86e: vmulss xmm0, xmm0, dword ptr [rax + 0x128]
0x10033e876: call 0x100aa2bca ; 0x100aa2bca _sinf
0x10033e87b: mov rcx, qword ptr [rbp - 0x30b0]
0x10033e882: vxorps xmm4, xmm4, xmm4
0x10033e886: mov al, byte ptr [rcx + 0x140]
0x10033e88c: vmovss xmm3, dword ptr [rip + 0x76682c] ; 0x100aa50c0
0x10033e894: vmovaps xmm1, xmm3
0x10033e898: test al, al
0x10033e89a: jne 0x10033e8cc
0x10033e89c: vmovss xmm1, dword ptr [rbp - 0x30c0]
0x10033e8a4: vmulss xmm1, xmm1, dword ptr [rcx + 0x110]
0x10033e8ac: vmaxss xmm2, xmm4, dword ptr [rcx + 0x10c]
0x10033e8b4: vminss xmm2, xmm3, xmm2
0x10033e8b8: vmulss xmm1, xmm1, xmm2
0x10033e8bc: vmulss xmm1, xmm1, dword ptr [rip + 0x768f24] ; 0x100aa77e8
0x10033e8c4: vmaxss xmm1, xmm4, xmm1
0x10033e8c8: vminss xmm1, xmm3, xmm1
0x10033e8cc: vmovaps xmm4, xmm3
0x10033e8d0: test al, al
0x10033e8d2: vmovss xmm2, dword ptr [rip + 0x765cde] ; 0x100aa45b8
0x10033e8da: vmovaps xmm3, xmmword ptr [rbp - 0x3140]
0x10033e8e2: jne 0x10033e8f8
0x10033e8e4: vmulss xmm0, xmm0, xmm2
0x10033e8e8: vaddss xmm0, xmm0, dword ptr [rip + 0x76c65c] ; 0x100aaaf4c
0x10033e8f0: vmulss xmm4, xmm0, dword ptr [rbp - 0x3098]
0x10033e8f8: vmovss dword ptr [rbp - 0x3098], xmm4
0x10033e900: mov qword ptr [rbp - 0x30c0], r13
0x10033e907: vpermilps xmm0, xmm3, 0xe7
0x10033e90d: vmulss xmm0, xmm0, xmm1
0x10033e911: vinsertps xmm0, xmm3, xmm0, 0x30
0x10033e917: vmovaps xmmword ptr [rbp - 0x3190], xmm0
0x10033e91f: jne 0x10033e970
0x10033e921: mov rax, qword ptr [rcx + 0x100]
0x10033e928: test rax, rax
0x10033e92b: jne 0x10033e970
0x10033e92d: vmovaps xmm0, xmmword ptr [rip + 0x76962b] ; 0x100aa7f60
0x10033e935: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x3150]
0x10033e93d: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x3170]
0x10033e945: vmovaps xmmword ptr [rbp - 0x31b0], xmm0
0x10033e94d: lea r13, [rbp - 0x3290]
0x10033e954: mov rdi, r13
0x10033e957: mov rsi, qword ptr [rbp - 0x3178]
0x10033e95e: call 0x10076bed0 ; 0x10076bed0
0x10033e963: vxorps xmm1, xmm1, xmm1
0x10033e967: mov rdi, qword ptr [rbp - 0x31c0]
0x10033e96e: jmp 0x10033e9b1 ; 0x10033e9b1
0x10033e970: vmovaps xmm0, xmmword ptr [rip + 0x7695e8] ; 0x100aa7f60
0x10033e978: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x3150]
0x10033e980: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x3170]
0x10033e988: vmovaps xmmword ptr [rbp - 0x31b0], xmm0
0x10033e990: lea r13, [rbp - 0x3290]
0x10033e997: mov rdi, r13
0x10033e99a: mov rsi, qword ptr [rbp - 0x3178]
0x10033e9a1: call 0x10076bed0 ; 0x10076bed0
0x10033e9a6: vxorps xmm1, xmm1, xmm1
0x10033e9aa: mov rdi, qword ptr [rbp - 0x31b8]
0x10033e9b1: lea rsi, [rbp - 0x31b0]
0x10033e9b8: mov rdx, r13
0x10033e9bb: vmovss xmm0, dword ptr [rip + 0x7666fd] ; 0x100aa50c0
0x10033e9c3: vmovaps xmm2, xmmword ptr [rip + 0x76bb85] ; 0x100aaa550
0x10033e9cb: lea rcx, [rbp - 0x3190]
0x10033e9d2: vmovss xmm3, dword ptr [rbp - 0x3098]
0x10033e9da: vmovaps xmm4, xmm3
0x10033e9de: call 0x100614df0 ; 0x100614df0
0x10033e9e3: mov r13, qword ptr [rbp - 0x30c0]
0x10033e9ea: nop word ptr [rax + rax]
0x10033e9f0: vmovss xmm0, dword ptr [rbp - 0x3094]
0x10033e9f8: inc r15
0x10033e9fb: add qword ptr [rbp - 0x3180], 8
0x10033ea03: dec qword ptr [rbp - 0x30e0]
0x10033ea0a: cmp r15, qword ptr [rbp - 0x31e0]
0x10033ea11: jne 0x10033dd30
0x10033ea17: test r13d, r13d
0x10033ea1a: je 0x10033eab0
0x10033ea20: mov r15d, r13d
0x10033ea23: lea rbx, [rbp - 0x1030]
0x10033ea2a: lea r14, [rbp - 0x430]
0x10033ea31: nop word ptr cs:[rax + rax]
0x10033ea40: vblendps xmm0, xmm0, xmmword ptr [rip + 0x77de76], 7 ; 0x100abc8c0
0x10033ea4a: vmovaps xmmword ptr [rbp - 0x30b0], xmm0
0x10033ea52: vmovss xmm1, dword ptr [rbx + 0x24]
0x10033ea57: vmovaps xmm0, xmmword ptr [rbp - 0x30b0]
0x10033ea5f: vmulps xmm0, xmm0, xmmword ptr [rbx + 0x10]
0x10033ea64: vinsertps xmm0, xmm0, dword ptr [rip + 0x766652], 0x30 ; 0x100aa50c0
0x10033ea6e: vmovaps xmmword ptr [rbp - 0x430], xmm0
0x10033ea76: vmovss xmm0, dword ptr [rbx + 0x20]
0x10033ea7b: vaddss xmm1, xmm1, xmm1
0x10033ea7f: vxorps xmm2, xmm2, xmm2
0x10033ea83: mov rdi, r12
0x10033ea86: mov rsi, r14
0x10033ea89: mov rdx, rbx
0x10033ea8c: call 0x100416140 ; 0x100416140
0x10033ea91: vmovaps xmm0, xmmword ptr [rbp - 0x30b0]
0x10033ea99: add rbx, 0x30
0x10033ea9d: dec r15
0x10033eaa0: jne 0x10033ea40
0x10033eaa2: jmp 0x10033eab0 ; 0x10033eab0
0x10033eaa4: xor r15d, r15d
0x10033eaa7: cmp edx, r15d
0x10033eaaa: jne 0x10033d900
0x10033eab0: cmp byte ptr [rip + 0x1ab6e11], 0 ; 0x101df58c8
0x10033eab7: je 0x10033eccc
0x10033eabd: call 0x1002acd30 ; 0x1002acd30
0x10033eac2: test rax, rax
0x10033eac5: je 0x10033eccc
0x10033eacb: call 0x1002acd30 ; 0x1002acd30
0x10033ead0: mov r14, rax
0x10033ead3: vmovaps xmm0, xmmword ptr [rip + 0x77ddf5] ; 0x100abc8d0
0x10033eadb: vmovaps xmmword ptr [rbp - 0x3120], xmm0
0x10033eae3: lea rdi, [rbp - 0x430]
0x10033eaea: lea rsi, [rbp - 0x3120]
0x10033eaf1: vmovss xmm0, dword ptr [rip + 0x769abf] ; 0x100aa85b8
0x10033eaf9: call 0x10077d310 ; 0x10077d310
0x10033eafe: vmovaps xmm0, xmmword ptr [rbp - 0x430]
0x10033eb06: vmovaps xmmword ptr [rbp - 0x3120], xmm0
0x10033eb0e: lea rdx, [rip + 0x842ccf] ; 0x100b817e4
0x10033eb15: lea rbx, [rbp - 0x430]
0x10033eb1c: mov esi, 0x400
0x10033eb21: xor eax, eax
0x10033eb23: mov rdi, rbx
0x10033eb26: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x10033eb2b: lea r15, [rbp - 0x3120]
0x10033eb32: mov rdi, r14
0x10033eb35: mov rsi, rbx
0x10033eb38: mov rdx, r15
0x10033eb3b: call 0x1002b21b0 ; 0x1002b21b0
0x10033eb40: mov ecx, dword ptr [rip + 0x9ed092] ; 0x100d2bbd8
0x10033eb46: lea rdx, [rip + 0x842cbe] ; 0x100b8180b Flame Count  : %3u
0x10033eb4d: mov esi, 0x400
0x10033eb52: xor eax, eax
0x10033eb54: mov rdi, rbx
0x10033eb57: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x10033eb5c: mov rdi, r14
0x10033eb5f: mov rsi, rbx
0x10033eb62: mov rdx, r15
0x10033eb65: call 0x1002b21b0 ; 0x1002b21b0
0x10033eb6a: mov ecx, dword ptr [rip + 0x9ed06c] ; 0x100d2bbdc
0x10033eb70: lea rdx, [rip + 0x842ca7] ; 0x100b8181e  Lit      : %3u
0x10033eb77: mov esi, 0x400
0x10033eb7c: xor eax, eax
0x10033eb7e: mov rdi, rbx
0x10033eb81: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x10033eb86: mov rdi, r14
0x10033eb89: mov rsi, rbx
0x10033eb8c: mov rdx, r15
0x10033eb8f: call 0x1002b21b0 ; 0x1002b21b0
0x10033eb94: mov ecx, dword ptr [rip + 0x9ed03e] ; 0x100d2bbd8
0x10033eb9a: sub ecx, dword ptr [rip + 0x9ed03c] ; 0x100d2bbdc
0x10033eba0: sub ecx, dword ptr [rip + 0x9ed03a] ; 0x100d2bbe0
0x10033eba6: lea rdx, [rip + 0x842c81] ; 0x100b8182e  Unlit    : %3u
0x10033ebad: mov esi, 0x400
0x10033ebb2: xor eax, eax
0x10033ebb4: mov rdi, rbx
0x10033ebb7: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x10033ebbc: mov rdi, r14
0x10033ebbf: mov rsi, rbx
0x10033ebc2: mov rdx, r15
0x10033ebc5: call 0x1002b21b0 ; 0x1002b21b0
0x10033ebca: mov ecx, dword ptr [rip + 0x9ed010] ; 0x100d2bbe0
0x10033ebd0: lea rdx, [rip + 0x842c67] ; 0x100b8183e  Disabled : %3u
0x10033ebd7: mov esi, 0x400
0x10033ebdc: xor eax, eax
0x10033ebde: mov rdi, rbx
0x10033ebe1: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x10033ebe6: mov rdi, r14
0x10033ebe9: mov rsi, rbx
0x10033ebec: mov rdx, r15
0x10033ebef: call 0x1002b21b0 ; 0x1002b21b0
0x10033ebf4: mov ecx, dword ptr [rip + 0x9ed006] ; 0x100d2bc00
0x10033ebfa: lea rdx, [rip + 0x842c4d] ; 0x100b8184e Rendered : %3u
0x10033ec01: mov esi, 0x400
0x10033ec06: xor eax, eax
0x10033ec08: mov rdi, rbx
0x10033ec0b: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x10033ec10: mov rdi, r14
0x10033ec13: mov rsi, rbx
0x10033ec16: mov rdx, r15
0x10033ec19: call 0x1002b21b0 ; 0x1002b21b0
0x10033ec1e: mov ecx, dword ptr [rip + 0x9ecfc0] ; 0x100d2bbe4
0x10033ec24: lea rdx, [rip + 0x842c32] ; 0x100b8185d Spread Tests : %3u
0x10033ec2b: mov esi, 0x400
0x10033ec30: xor eax, eax
0x10033ec32: mov rdi, rbx
0x10033ec35: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x10033ec3a: mov rdi, r14
0x10033ec3d: mov rsi, rbx
0x10033ec40: mov rdx, r15
0x10033ec43: call 0x1002b21b0 ; 0x1002b21b0
0x10033ec48: vmovsd xmm0, qword ptr [rip + 0x9ecf98] ; 0x100d2bbe8
0x10033ec50: lea rdx, [rip + 0x842c19] ; 0x100b81870 Update Flame Time   : %5.1fus
0x10033ec57: mov esi, 0x400
0x10033ec5c: mov al, 1
0x10033ec5e: mov rdi, rbx
0x10033ec61: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x10033ec66: mov rdi, r14
0x10033ec69: mov rsi, rbx
0x10033ec6c: mov rdx, r15
0x10033ec6f: call 0x1002b21b0 ; 0x1002b21b0
0x10033ec74: vmovsd xmm0, qword ptr [rip + 0x9ecf74] ; 0x100d2bbf0
0x10033ec7c: lea rdx, [rip + 0x842c0b] ; 0x100b8188e Update Spread Time  : %5.1fus
0x10033ec83: mov esi, 0x400
0x10033ec88: mov al, 1
0x10033ec8a: mov rdi, rbx
0x10033ec8d: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x10033ec92: mov rdi, r14
0x10033ec95: mov rsi, rbx
0x10033ec98: mov rdx, r15
0x10033ec9b: call 0x1002b21b0 ; 0x1002b21b0
0x10033eca0: vmovsd xmm0, qword ptr [rip + 0x9ecf50] ; 0x100d2bbf8
0x10033eca8: lea rdx, [rip + 0x842bfd] ; 0x100b818ac Update Render Time  : %5.1fus
0x10033ecaf: mov esi, 0x400
0x10033ecb4: mov al, 1
0x10033ecb6: mov rdi, rbx
0x10033ecb9: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x10033ecbe: mov rdi, r14
0x10033ecc1: mov rsi, rbx
0x10033ecc4: mov rdx, r15
0x10033ecc7: call 0x1002b21b0 ; 0x1002b21b0
0x10033eccc: mov rax, qword ptr [rip + 0x8cec05] ; 0x100c0d8d8
0x10033ecd3: mov rax, qword ptr [rax]
0x10033ecd6: cmp rax, qword ptr [rbp - 0x30]
0x10033ecda: jne 0x10033ecee
0x10033ecdc: add rsp, 0x3318
0x10033ece3: pop rbx
0x10033ece4: pop r12
0x10033ece6: pop r13
0x10033ece8: pop r14
0x10033ecea: pop r15
0x10033ecec: pop rbp
0x10033eced: ret 
0x10033ecee: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10033ecf3: lea rdi, [rip + 0x83526f] ; 0x100b73f69 idx < kCapacity
0x10033ecfa: lea rsi, [rip + 0x835278] ; 0x100b73f79 ../../../Code/Base/ObjectPool.h
0x10033ed01: lea r8, [rip + 0x835291] ; 0x100b73f99 ObjectPool attempted to access out of bounds
0x10033ed08: mov edx, 0x39
0x10033ed0d: mov ecx, 4
0x10033ed12: xor eax, eax
0x10033ed14: call 0x1007e6030 ; 0x1007e6030
0x10033ed19: ud2 
0x10033ed1b: lea rdi, [rip + 0x8352a4] ; 0x100b73fc6 Allocated( idx )
0x10033ed22: lea rsi, [rip + 0x835250] ; 0x100b73f79 ../../../Code/Base/ObjectPool.h
0x10033ed29: lea r8, [rip + 0x8352a7] ; 0x100b73fd7 ObjectPool attempted to access unallocated slot
0x10033ed30: mov edx, 0x6c
0x10033ed35: jmp 0x10033ed0d ; 0x10033ed0d
0x10033ed37: lea rdi, [rip + 0x83522b] ; 0x100b73f69 idx < kCapacity
0x10033ed3e: lea rsi, [rip + 0x835234] ; 0x100b73f79 ../../../Code/Base/ObjectPool.h
0x10033ed45: lea r8, [rip + 0x83524d] ; 0x100b73f99 ObjectPool attempted to access out of bounds
0x10033ed4c: mov edx, 0x6b
0x10033ed51: jmp 0x10033ed0d ; 0x10033ed0d
0x10033ed53: nop word ptr cs:[rax + rax]
