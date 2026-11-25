0x1001234d0: push rbp
0x1001234d1: mov rbp, rsp
0x1001234d4: push r15
0x1001234d6: push r14
0x1001234d8: push r13
0x1001234da: push r12
0x1001234dc: push rbx
0x1001234dd: and rsp, 0xffffffffffffffe0
0x1001234e1: sub rsp, 0xe20
0x1001234e8: mov qword ptr [rsp + 0x100], r9
0x1001234f0: mov qword ptr [rsp + 0xa8], r8
0x1001234f8: mov r13, rcx
0x1001234fb: mov dword ptr [rsp + 0x1d0], edx
0x100123502: mov r14, rsi
0x100123505: mov r12, rdi
0x100123508: mov rax, qword ptr [rip + 0xaea3c9] ; 0x100c0d8d8
0x10012350f: mov rax, qword ptr [rax]
0x100123512: mov qword ptr [rsp + 0xe00], rax
0x10012351a: mov rax, qword ptr [r14 + 0x10]
0x10012351e: mov qword ptr [rsp + 0x170], rax
0x100123526: mov rax, qword ptr [r14 + 0x18]
0x10012352a: mov qword ptr [rsp + 0x40], rax
0x10012352f: mov rax, qword ptr [r14 + 0x20]
0x100123533: mov qword ptr [rsp + 0x28], rax
0x100123538: mov rax, qword ptr [r14 + 0x30]
0x10012353c: mov qword ptr [rsp + 0xd0], rax
0x100123544: mov r15, qword ptr [r14 + 0x70]
0x100123548: mov rax, qword ptr [r14 + 0x98]
0x10012354f: mov qword ptr [rsp + 0x160], rax
0x100123557: lea rax, [rip + 0x1ed7b72] ; 0x101ffb0d0
0x10012355e: cmp byte ptr [rax], 0
0x100123561: mov rax, qword ptr [r14 + 0x50]
0x100123565: mov qword ptr [rsp + 0x90], rax
0x10012356d: vmovss xmm0, dword ptr [r13 + 0x14]
0x100123573: vmovss xmm1, dword ptr [r13 + 0x20]
0x100123579: vmovss xmm2, dword ptr [rip + 0x981b3f] ; 0x100aa50c0
0x100123581: mov rax, qword ptr [r14 + 0x28]
0x100123585: mov qword ptr [rsp + 0x30], rax
0x10012358a: je 0x100123597
0x10012358c: lea rax, [rip + 0xb94fad] ; 0x100cb8540
0x100123593: vmovss xmm2, dword ptr [rax]
0x100123597: vmulss xmm1, xmm1, xmm2
0x10012359b: vmulss xmm0, xmm0, xmm1
0x10012359f: vmovss xmm1, dword ptr [rip + 0x9834f5] ; 0x100aa6a9c
0x1001235a7: vmaxss xmm0, xmm1, xmm0
0x1001235ab: vmovss dword ptr [rsp], xmm0
0x1001235b0: mov rbx, qword ptr [rsp + 0x28]
0x1001235b5: mov rsi, qword ptr [rbx + 0x258]
0x1001235bc: lea rdi, [rsp + 0x290]
0x1001235c4: call 0x1007f26b0 ; 0x1007f26b0
0x1001235c9: mov rsi, qword ptr [rbx + 0x260]
0x1001235d0: lea rdi, [rsp + 0x280]
0x1001235d8: call 0x1007f26b0 ; 0x1007f26b0
0x1001235dd: mov rsi, qword ptr [rbx + 0x288]
0x1001235e4: lea rdi, [rsp + 0x570]
0x1001235ec: call 0x1007f26b0 ; 0x1007f26b0
0x1001235f1: mov rsi, qword ptr [rbx + 0x298]
0x1001235f8: lea rdi, [rsp + 0x560]
0x100123600: call 0x1007f26b0 ; 0x1007f26b0
0x100123605: mov rsi, qword ptr [rbx + 0x268]
0x10012360c: lea rdi, [rsp + 0x550]
0x100123614: call 0x1007f26b0 ; 0x1007f26b0
0x100123619: mov rsi, qword ptr [rbx + 0x270]
0x100123620: lea rdi, [rsp + 0x540]
0x100123628: call 0x1007f26b0 ; 0x1007f26b0
0x10012362d: mov byte ptr [rsp + 0x358], 1
0x100123635: vxorps xmm0, xmm0, xmm0
0x100123639: vmovups xmmword ptr [rsp + 0x360], xmm0
0x100123642: movabs rax, 0xffffffef00000001
0x10012364c: mov qword ptr [rsp + 0x350], rax
0x100123654: mov rax, qword ptr [rsp + 0x40]
0x100123659: vmovaps xmm0, xmmword ptr [rax + 0x150]
0x100123661: vmovaps xmmword ptr [rsp + 0x10], xmm0
0x100123667: cmp byte ptr [r14 + 0x1ef8], 0
0x10012366f: je 0x10012369f
0x100123671: mov rdi, qword ptr [rbp + 0x98]
0x100123678: call 0x1006e9ff0 ; 0x1006e9ff0
0x10012367d: cmp eax, 0xb
0x100123680: mov rbx, qword ptr [rsp + 0xd0]
0x100123688: jne 0x10012369b
0x10012368a: mov rdi, qword ptr [rbp + 0x90]
0x100123691: mov rax, qword ptr [rdi]
0x100123694: call qword ptr [rax + 0x38]
0x100123697: test al, al
0x100123699: jne 0x1001236b1
0x10012369b: xor eax, eax
0x10012369d: jmp 0x1001236c8 ; 0x1001236c8
0x10012369f: cmp byte ptr [r14 + 0xd68], 0
0x1001236a7: mov rbx, qword ptr [rsp + 0xd0]
0x1001236af: je 0x10012369b
0x1001236b1: mov rdi, qword ptr [r14 + 0x70]
0x1001236b5: lea rdx, [rip + 0xa50c4e] ; 0x100b7430a CharSkyKid_Horn_TuneBand
0x1001236bc: mov esi, 6
0x1001236c1: call 0x100157030 ; 0x100157030
0x1001236c6: mov al, 1
0x1001236c8: vmovss xmm0, dword ptr [rip + 0x9833d0] ; 0x100aa6aa0
0x1001236d0: vminss xmm2, xmm0, dword ptr [rsp]
0x1001236d5: mov byte ptr [r12], al
0x1001236d9: mov rdi, qword ptr [r12 + 0x1050]
0x1001236e1: test rdi, rdi
0x1001236e4: vmovaps xmmword ptr [rsp + 0x60], xmm2
0x1001236ea: je 0x1001238a1
0x1001236f0: vmovss xmm0, dword ptr [r12 + 0x105c]
0x1001236fa: vxorps xmm1, xmm1, xmm1
0x1001236fe: vucomiss xmm0, xmm1
0x100123702: jbe 0x10012373e
0x100123704: vmovss xmm0, dword ptr [r12 + 0x1060]
0x10012370e: vmulss xmm0, xmm0, dword ptr [rip + 0x9840ba] ; 0x100aa77d0
0x100123716: vaddss xmm0, xmm0, dword ptr [rip + 0x9819a2] ; 0x100aa50c0
0x10012371e: lea rax, [r12 + 0x1058]
0x100123726: vmulss xmm1, xmm2, dword ptr [rip + 0x9880b2] ; 0x100aab7e0
0x10012372e: vaddss xmm1, xmm1, dword ptr [r12 + 0x1058]
0x100123738: vmaxss xmm0, xmm0, xmm1
0x10012373c: jmp 0x10012377a ; 0x10012377a
0x10012373e: lea rax, [r12 + 0x1058]
0x100123746: vmulss xmm0, xmm2, dword ptr [rip + 0x984e82] ; 0x100aa85d0
0x10012374e: vaddss xmm0, xmm0, dword ptr [r12 + 0x1058]
0x100123758: vucomiss xmm0, dword ptr [rip + 0x981960] ; 0x100aa50c0
0x100123760: jbe 0x10012377a
0x100123762: mov dword ptr [rax], 0x3f800000
0x100123768: cmp byte ptr [rdi + 0x227], 0
0x10012376f: jne 0x100123894
0x100123775: jmp 0x1001238a1 ; 0x1001238a1
0x10012377a: vmovss dword ptr [rax], xmm0
0x10012377e: vucomiss xmm0, dword ptr [rip + 0x98193a] ; 0x100aa50c0
0x100123786: mov al, byte ptr [rdi + 0x227]
0x10012378c: jae 0x100123890
0x100123792: test al, al
0x100123794: jne 0x1001237b2
0x100123796: mov esi, 1
0x10012379b: call 0x1004636d0 ; 0x1004636d0
0x1001237a0: mov rdi, qword ptr [r12 + 0x1050]
0x1001237a8: vmovss xmm0, dword ptr [r12 + 0x1058]
0x1001237b2: lea rdx, [rip + 0xa5031c] ; 0x100b73ad5 u_alphaFade
0x1001237b9: xor esi, esi
0x1001237bb: call 0x1004667c0 ; 0x1004667c0
0x1001237c0: vmovss xmm1, dword ptr [r12 + 0x1060]
0x1001237ca: vmovaps xmmword ptr [rsp + 0xe0], xmm1
0x1001237d3: vmovss xmm0, dword ptr [rip + 0x9818e5] ; 0x100aa50c0
0x1001237db: vinsertps xmm0, xmm1, xmm0, 0x10
0x1001237e1: vinsertps xmm0, xmm0, xmm1, 0x20
0x1001237e7: vmovaps xmmword ptr [rsp], xmm0
0x1001237ec: mov rax, qword ptr [r14 + 0x20]
0x1001237f0: mov rsi, qword ptr [rax + 0x288]
0x1001237f7: lea rdi, [rsp + 0x580]
0x1001237ff: call 0x1007f26b0 ; 0x1007f26b0
0x100123804: vmovaps xmm2, xmmword ptr [rsp + 0xe0]
0x10012380d: vmovaps xmmword ptr [rsp + 0x600], xmm2
0x100123816: vxorps xmm0, xmm0, xmm0
0x10012381a: vmovaps xmm3, xmmword ptr [rsp]
0x10012381f: vblendps xmm1, xmm3, xmm0, 0xd
0x100123825: vmovaps xmmword ptr [rsp + 0x610], xmm1
0x10012382e: vblendps xmm0, xmm3, xmm0, 0xb
0x100123834: vmovaps xmmword ptr [rsp + 0x620], xmm0
0x10012383d: vmovaps xmm0, xmmword ptr [rsp + 0x580]
0x100123846: vmovss xmm1, dword ptr [rip + 0x981872] ; 0x100aa50c0
0x10012384e: vinsertps xmm1, xmm0, xmm1, 0x30
0x100123854: vmovaps xmmword ptr [rsp + 0x630], xmm1
0x10012385d: vucomiss xmm2, xmm2
0x100123861: jp 0x10012389b
0x100123863: vmovshdup xmm1, xmm0
0x100123867: vucomiss xmm0, xmm1
0x10012386b: jp 0x10012389b
0x10012386d: vpermilpd xmm0, xmm0, 1
0x100123873: vucomiss xmm0, xmm0
0x100123877: jp 0x10012389b
0x100123879: mov rdi, qword ptr [r12 + 0x1050]
0x100123881: lea rsi, [rsp + 0x600]
0x100123889: call 0x100463750 ; 0x100463750
0x10012388e: jmp 0x10012389b ; 0x10012389b
0x100123890: test al, al
0x100123892: je 0x1001238a1
0x100123894: xor esi, esi
0x100123896: call 0x1004636d0 ; 0x1004636d0
0x10012389b: vmovaps xmm2, xmmword ptr [rsp + 0x60]
0x1001238a1: lea rax, [rsp + 0x340]
0x1001238a9: mov qword ptr [rsp + 0x348], rax
0x1001238b1: mov dword ptr [rsp + 0x340], 0
0x1001238bc: vmovss xmm0, dword ptr [r12 + 0x105c]
0x1001238c6: vsubss xmm0, xmm0, xmm2
0x1001238ca: vxorps xmm3, xmm3, xmm3
0x1001238ce: vmaxss xmm0, xmm3, xmm0
0x1001238d2: vmovss dword ptr [r12 + 0x105c], xmm0
0x1001238dc: cmp qword ptr [r12 + 0x1038], 0
0x1001238e5: je 0x100123929
0x1001238e7: mov rdi, r14
0x1001238ea: call 0x100100330 ; 0x100100330
0x1001238ef: test al, al
0x1001238f1: jne 0x100123910
0x1001238f3: mov rdi, r14
0x1001238f6: call 0x1000fe050 ; 0x1000fe050
0x1001238fb: test al, al
0x1001238fd: je 0x100123910
0x1001238ff: mov rax, qword ptr [r14 + 0xb0]
0x100123906: cmp byte ptr [rax + 0x1a], 0
0x10012390a: je 0x1001264b1
0x100123910: mov rdi, qword ptr [r12 + 0x1038]
0x100123918: xor esi, esi
0x10012391a: call 0x1004636d0 ; 0x1004636d0
0x10012391f: vmovaps xmm2, xmmword ptr [rsp + 0x60]
0x100123925: vxorps xmm3, xmm3, xmm3
0x100123929: vmulss xmm0, xmm2, dword ptr [rip + 0x983173] ; 0x100aa6aa4
0x100123931: cmp byte ptr [rbx + 0x4c], 0
0x100123935: je 0x100123944
0x100123937: vmovss xmm1, dword ptr [rbx + 0x20]
0x10012393c: vmulss xmm3, xmm1, dword ptr [rip + 0x984d1c] ; 0x100aa8660
0x100123944: vmovss xmm1, dword ptr [rip + 0x981774] ; 0x100aa50c0
0x10012394c: vmovaps xmmword ptr [rsp + 0xe0], xmm1
0x100123955: vsubss xmm1, xmm1, xmm0
0x100123959: vmulss xmm1, xmm1, dword ptr [r12 + 0x24]
0x100123960: vmulss xmm0, xmm0, xmm3
0x100123964: vaddss xmm0, xmm0, xmm1
0x100123968: vmovss dword ptr [r12 + 0x24], xmm0
0x10012396f: mov r13, qword ptr [rsp + 0x28]
0x100123974: mov rsi, qword ptr [r13 + 0x300]
0x10012397b: lea rdi, [rsp + 0x2c0]
0x100123983: call 0x1007f26b0 ; 0x1007f26b0
0x100123988: mov rsi, qword ptr [r13 + 0x308]
0x10012398f: lea rdi, [rsp + 0x500]
0x100123997: call 0x1007f26b0 ; 0x1007f26b0
0x10012399c: cmp byte ptr [rip + 0xb5f416], 0 ; 0x100c82db9
0x1001239a3: je 0x1001239e9
0x1001239a5: mov rax, qword ptr [rsp + 0x40]
0x1001239aa: vmovaps xmm0, xmmword ptr [rax + 0x50]
0x1001239af: vmulps xmm0, xmm0, xmm0
0x1001239b3: vmovshdup xmm1, xmm0
0x1001239b7: vaddss xmm1, xmm0, xmm1
0x1001239bb: vpermilpd xmm0, xmm0, 1
0x1001239c1: vaddss xmm0, xmm0, xmm1
0x1001239c5: vucomiss xmm0, dword ptr [rip + 0x9816f3] ; 0x100aa50c0
0x1001239cd: jbe 0x1001239e9
0x1001239cf: mov rax, qword ptr [rsp + 0x40]
0x1001239d4: cmp byte ptr [rax + 0xbb0], 0
0x1001239db: je 0x1001239e9
0x1001239dd: mov rdi, r14
0x1001239e0: call 0x100100330 ; 0x100100330
0x1001239e5: test al, al
0x1001239e7: je 0x100123a16
0x1001239e9: mov dword ptr [r12 + 0x358], 0
0x1001239f5: vmovaps xmm1, xmmword ptr [rsp + 0x60]
0x1001239fb: cmp byte ptr [r14 + 0x21b0], 0
0x100123a03: je 0x100123c23
0x100123a09: vmovss xmm0, dword ptr [rip + 0x983097] ; 0x100aa6aa8
0x100123a11: jmp 0x100123c39 ; 0x100123c39
0x100123a16: vmovss xmm2, dword ptr [r12 + 0x358]
0x100123a20: vmovss xmm1, dword ptr [r12 + 0x35c]
0x100123a2a: vmulss xmm0, xmm1, dword ptr [rip + 0x984ba6] ; 0x100aa85d8
0x100123a32: mov dword ptr [r12 + 0x35c], 0x3f800000
0x100123a3e: vdivss xmm1, xmm2, dword ptr [rip + 0x983062] ; 0x100aa6aa8
0x100123a46: vxorps xmm5, xmm5, xmm5
0x100123a4a: vmaxss xmm1, xmm5, xmm1
0x100123a4e: vmovss xmm4, dword ptr [rip + 0x98166a] ; 0x100aa50c0
0x100123a56: vminss xmm1, xmm4, xmm1
0x100123a5a: vsubss xmm2, xmm4, xmm1
0x100123a5e: vmulss xmm2, xmm2, dword ptr [rip + 0x987d7e] ; 0x100aab7e4
0x100123a66: vmulss xmm1, xmm1, dword ptr [rip + 0x9874de] ; 0x100aaaf4c
0x100123a6e: vaddss xmm1, xmm1, xmm2
0x100123a72: mov rax, qword ptr [rsp + 0x40]
0x100123a77: vmovaps xmm2, xmmword ptr [rax + 0x50]
0x100123a7c: vmulps xmm2, xmm2, xmm2
0x100123a80: vmovshdup xmm3, xmm2
0x100123a84: vaddss xmm3, xmm2, xmm3
0x100123a88: vpermilpd xmm2, xmm2, 1
0x100123a8e: vaddss xmm2, xmm2, xmm3
0x100123a92: vsqrtss xmm2, xmm2, xmm2
0x100123a96: vaddss xmm2, xmm2, dword ptr [rip + 0x981626] ; 0x100aa50c4
0x100123a9e: vdivss xmm1, xmm2, xmm1
0x100123aa2: vminss xmm2, xmm4, xmm1
0x100123aa6: vcmpunordss xmm1, xmm1, xmm1
0x100123aab: vandnps xmm2, xmm1, xmm2
0x100123aaf: vandps xmm1, xmm1, xmm4
0x100123ab3: vorps xmm1, xmm2, xmm1
0x100123ab7: vmulss xmm1, xmm1, xmm1
0x100123abb: vminss xmm1, xmm4, xmm1
0x100123abf: vmulss xmm2, xmm1, xmm1
0x100123ac3: vmulss xmm2, xmm1, xmm2
0x100123ac7: vmulss xmm3, xmm1, dword ptr [rip + 0x982fd5] ; 0x100aa6aa4
0x100123acf: vaddss xmm3, xmm3, dword ptr [rip + 0x985ba5] ; 0x100aa967c
0x100123ad7: vmulss xmm1, xmm1, xmm3
0x100123adb: vaddss xmm1, xmm1, dword ptr [rip + 0x983cf9] ; 0x100aa77dc
0x100123ae3: vmulss xmm1, xmm2, xmm1
0x100123ae7: vmulss xmm1, xmm1, dword ptr [rip + 0x984b05] ; 0x100aa85f4
0x100123aef: cmp byte ptr [r14 + 0x1ef8], 0
0x100123af7: mov qword ptr [rsp + 0x78], r15
0x100123afc: je 0x100123b1f
0x100123afe: mov rax, qword ptr [rsp + 0x160]
0x100123b06: vmovss xmm2, dword ptr [rax + 0x74]
0x100123b0b: vxorps xmm2, xmm2, xmmword ptr [rip + 0x983ded] ; 0x100aa7900
0x100123b13: vmaxss xmm2, xmm5, xmm2
0x100123b17: vminss xmm2, xmm4, xmm2
0x100123b1b: vmulss xmm1, xmm1, xmm2
0x100123b1f: lea rax, [rip + 0x1f1bb8a] ; 0x10203f6b0
0x100123b26: vmovaps xmm2, xmmword ptr [rax]
0x100123b2a: vinsertps xmm1, xmm2, xmm1, 0x30
0x100123b30: vmovaps xmmword ptr [rsp + 0x600], xmm1
0x100123b39: mov rdi, qword ptr [r12 + 0x348]
0x100123b41: vmovaps xmm1, xmmword ptr [rsp + 0x2c0]
0x100123b4a: vmovaps xmmword ptr [rsp + 0x4f0], xmm1
0x100123b53: mov rbx, qword ptr [rsp + 0x30]
0x100123b58: vmovss xmm1, dword ptr [rbx + 0x10cad0]
0x100123b60: mov r13, qword ptr [rip + 0x986d59] ; 0x100aaa8c0
0x100123b67: mov qword ptr [rsp + 0x320], r13
0x100123b6f: mov dword ptr [rsp + 0x328], 0x3f800000
0x100123b7a: lea rsi, [rsp + 0x4f0]
0x100123b82: lea r15, [rsp + 0x600]
0x100123b8a: lea rcx, [rsp + 0x320]
0x100123b92: mov rdx, r15
0x100123b95: vmovss dword ptr [rsp], xmm0
0x100123b9a: call 0x1006d3790 ; 0x1006d3790
0x100123b9f: mov rdi, qword ptr [r12 + 0x350]
0x100123ba7: vmovaps xmm0, xmmword ptr [rsp + 0x500]
0x100123bb0: vmovaps xmmword ptr [rsp + 0x4e0], xmm0
0x100123bb9: vmovss xmm1, dword ptr [rbx + 0x10cad0]
0x100123bc1: mov qword ptr [rsp + 0x310], r13
0x100123bc9: mov dword ptr [rsp + 0x318], 0x3f800000
0x100123bd4: lea rsi, [rsp + 0x4e0]
0x100123bdc: lea rcx, [rsp + 0x310]
0x100123be4: vmovss xmm0, dword ptr [rsp]
0x100123be9: mov rdx, r15
0x100123bec: call 0x1006d3790 ; 0x1006d3790
0x100123bf1: vmovaps xmm1, xmmword ptr [rsp + 0x60]
0x100123bf7: vaddss xmm0, xmm1, dword ptr [r12 + 0x358]
0x100123c01: vmovss dword ptr [r12 + 0x358], xmm0
0x100123c0b: mov r13, qword ptr [rsp + 0x28]
0x100123c10: mov r15, qword ptr [rsp + 0x78]
0x100123c15: cmp byte ptr [r14 + 0x21b0], 0
0x100123c1d: jne 0x100123a09
0x100123c23: vmovss xmm0, dword ptr [r12 + 0x1040]
0x100123c2d: vsubss xmm0, xmm0, xmm1
0x100123c31: vxorps xmm1, xmm1, xmm1
0x100123c35: vmaxss xmm0, xmm0, xmm1
0x100123c39: vmovss dword ptr [r12 + 0x1040], xmm0
0x100123c43: vdivss xmm0, xmm0, dword ptr [rip + 0x982e5d] ; 0x100aa6aa8
0x100123c4b: vxorps xmm1, xmm1, xmm1
0x100123c4f: vmaxss xmm0, xmm1, xmm0
0x100123c53: vmovss xmm1, dword ptr [rip + 0x981465] ; 0x100aa50c0
0x100123c5b: vminss xmm0, xmm1, xmm0
0x100123c5f: vmulss xmm1, xmm0, xmm0
0x100123c63: vmulss xmm1, xmm0, xmm1
0x100123c67: vmulss xmm2, xmm0, dword ptr [rip + 0x982e35] ; 0x100aa6aa4
0x100123c6f: vaddss xmm2, xmm2, dword ptr [rip + 0x985a05] ; 0x100aa967c
0x100123c77: vmulss xmm0, xmm0, xmm2
0x100123c7b: vaddss xmm0, xmm0, dword ptr [rip + 0x983b59] ; 0x100aa77dc
0x100123c83: vmulss xmm0, xmm1, xmm0
0x100123c87: vmovss dword ptr [r12 + 0x1044], xmm0
0x100123c91: mov rax, qword ptr [r14 + 0x30]
0x100123c95: vmovss xmm1, dword ptr [rip + 0x984913] ; 0x100aa85b0
0x100123c9d: vucomiss xmm1, dword ptr [rax + 0x28]
0x100123ca2: jbe 0x100123cbd
0x100123ca4: mov esi, 1
0x100123ca9: xor edx, edx
0x100123cab: mov rdi, r15
0x100123cae: call 0x100156fb0 ; 0x100156fb0
0x100123cb3: vmovss xmm0, dword ptr [r12 + 0x1044]
0x100123cbd: vucomiss xmm0, dword ptr [rip + 0x984997] ; 0x100aa865c
0x100123cc5: jbe 0x100123d23
0x100123cc7: lea rdx, [rip + 0xa50655] ; 0x100b74323 CharSkyKid_Body_Ghost
0x100123cce: xor esi, esi
0x100123cd0: mov rdi, r15
0x100123cd3: call 0x100157030 ; 0x100157030
0x100123cd8: mov esi, 3
0x100123cdd: xor edx, edx
0x100123cdf: mov rdi, r15
0x100123ce2: call 0x100156fb0 ; 0x100156fb0
0x100123ce7: mov esi, 4
0x100123cec: xor edx, edx
0x100123cee: mov rdi, r15
0x100123cf1: call 0x100156fb0 ; 0x100156fb0
0x100123cf6: mov esi, 6
0x100123cfb: xor edx, edx
0x100123cfd: mov rdi, r15
0x100123d00: call 0x100156fb0 ; 0x100156fb0
0x100123d05: mov esi, 2
0x100123d0a: xor edx, edx
0x100123d0c: mov rdi, r15
0x100123d0f: call 0x100156fb0 ; 0x100156fb0
0x100123d14: mov esi, 8
0x100123d19: xor edx, edx
0x100123d1b: mov rdi, r15
0x100123d1e: call 0x100156fb0 ; 0x100156fb0
0x100123d23: mov rsi, qword ptr [rbp + 0x20]
0x100123d27: movabs rax, 0x3e19999a3e19999a
0x100123d31: mov qword ptr [r12 + 4], rax
0x100123d36: mov al, byte ptr [r14 + 0x21b6]
0x100123d3d: test al, al
0x100123d3f: je 0x100123dbf
0x100123d41: cmp byte ptr [rsp + 0x1d0], 0
0x100123d49: jne 0x100123dbf
0x100123d4b: lea rdi, [rsp + 0x4d0]
0x100123d53: call 0x10076be90 ; 0x10076be90
0x100123d58: vmovaps xmm0, xmmword ptr [rsp + 0x4d0]
0x100123d61: mov rax, qword ptr [rsp + 0x40]
0x100123d66: vsubps xmm0, xmm0, xmmword ptr [rax + 0x10]
0x100123d6b: vmulps xmm0, xmm0, xmm0
0x100123d6f: vmovshdup xmm1, xmm0
0x100123d73: vaddss xmm1, xmm0, xmm1
0x100123d77: vpermilpd xmm0, xmm0, 1
0x100123d7d: vaddss xmm0, xmm0, xmm1
0x100123d81: vucomiss xmm0, dword ptr [rip + 0x987a5f] ; 0x100aab7e8
0x100123d89: jbe 0x100123dc8
0x100123d8b: mov ecx, dword ptr [r12 + 0x250]
0x100123d93: test rcx, rcx
0x100123d96: je 0x10012bd17
0x100123d9c: lea rdx, [rcx - 1]
0x100123da0: mov eax, ecx
0x100123da2: and eax, 7
0x100123da5: cmp rdx, 7
0x100123da9: jae 0x1001249e7
0x100123daf: xor edx, edx
0x100123db1: test rax, rax
0x100123db4: jne 0x100124a84
0x100123dba: jmp 0x10012bd17 ; 0x10012bd17
0x100123dbf: test al, al
0x100123dc1: mov rax, qword ptr [rsp + 0x40]
0x100123dc6: je 0x100123d8b
0x100123dc8: vxorps xmm2, xmm2, xmm2
0x100123dcc: vmaxss xmm0, xmm2, dword ptr [rax + 0x1c0]
0x100123dd4: vmovss xmm1, dword ptr [rip + 0x9812e4] ; 0x100aa50c0
0x100123ddc: vminss xmm0, xmm1, xmm0
0x100123de0: vucomiss xmm0, xmm2
0x100123de4: mov qword ptr [rsp + 0x58], r12
0x100123de9: mov qword ptr [rsp + 0x88], r14
0x100123df1: jbe 0x100123f4a
0x100123df7: mov rax, r13
0x100123dfa: mov r13d, dword ptr [r12 + 0x18]
0x100123dff: mov rsi, qword ptr [rax + 0x248]
0x100123e06: mov rbx, r12
0x100123e09: lea r12, [rsp + 0x530]
0x100123e11: mov rdi, r12
0x100123e14: call 0x1007f26b0 ; 0x1007f26b0
0x100123e19: mov r14, qword ptr [rip + 0x984280] ; 0x100aa80a0
0x100123e20: mov qword ptr [rsp + 0x300], r14
0x100123e28: mov dword ptr [rsp + 0x308], 0
0x100123e33: cmp byte ptr [rbx + 0x20], 0
0x100123e37: vxorps xmm0, xmm0, xmm0
0x100123e3b: je 0x100123e45
0x100123e3d: vmovss xmm0, dword ptr [rip + 0x98476b] ; 0x100aa85b0
0x100123e45: mov rax, qword ptr [rsp + 0x40]
0x100123e4a: vxorps xmm1, xmm1, xmm1
0x100123e4e: vmaxss xmm1, xmm1, dword ptr [rax + 0x1c0]
0x100123e56: vmovss xmm2, dword ptr [rip + 0x981262] ; 0x100aa50c0
0x100123e5e: vminss xmm1, xmm2, xmm1
0x100123e62: vmovaps xmm2, xmmword ptr [rip + 0x987816] ; 0x100aab680
0x100123e6a: vinsertps xmm1, xmm2, xmm1, 0x30
0x100123e70: vmovaps xmmword ptr [rsp + 0x600], xmm1
0x100123e79: lea rcx, [rsp + 0x300]
0x100123e81: lea r8, [rsp + 0x600]
0x100123e89: mov rdi, qword ptr [rbp + 0x68]
0x100123e8d: mov esi, r13d
0x100123e90: mov rdx, r12
0x100123e93: call 0x1006a0fd0 ; 0x1006a0fd0
0x100123e98: mov rbx, qword ptr [rsp + 0x58]
0x100123e9d: mov r13d, dword ptr [rbx + 0x1c]
0x100123ea1: mov rax, qword ptr [rsp + 0x28]
0x100123ea6: mov rsi, qword ptr [rax + 0x250]
0x100123ead: lea r12, [rsp + 0x520]
0x100123eb5: mov rdi, r12
0x100123eb8: call 0x1007f26b0 ; 0x1007f26b0
0x100123ebd: mov qword ptr [rsp + 0x2f0], r14
0x100123ec5: mov dword ptr [rsp + 0x2f8], 0
0x100123ed0: cmp byte ptr [rbx + 0x20], 0
0x100123ed4: vxorps xmm0, xmm0, xmm0
0x100123ed8: je 0x100123ee2
0x100123eda: vmovss xmm0, dword ptr [rip + 0x9846ce] ; 0x100aa85b0
0x100123ee2: mov rax, qword ptr [rsp + 0x58]
0x100123ee7: lea r14, [rax + 0x20]
0x100123eeb: mov rbx, qword ptr [rsp + 0x40]
0x100123ef0: vxorps xmm1, xmm1, xmm1
0x100123ef4: vmaxss xmm1, xmm1, dword ptr [rbx + 0x1c0]
0x100123efc: vmovss xmm2, dword ptr [rip + 0x9811bc] ; 0x100aa50c0
0x100123f04: vminss xmm1, xmm2, xmm1
0x100123f08: vmovaps xmm2, xmmword ptr [rip + 0x987770] ; 0x100aab680
0x100123f10: vinsertps xmm1, xmm2, xmm1, 0x30
0x100123f16: vmovaps xmmword ptr [rsp + 0x600], xmm1
0x100123f1f: lea rcx, [rsp + 0x2f0]
0x100123f27: lea r8, [rsp + 0x600]
0x100123f2f: mov rdi, qword ptr [rbp + 0x68]
0x100123f33: mov esi, r13d
0x100123f36: mov rdx, r12
0x100123f39: mov r12, rax
0x100123f3c: call 0x1006a0fd0 ; 0x1006a0fd0
0x100123f41: mov al, 1
0x100123f43: mov r13, qword ptr [rsp + 0x28]
0x100123f48: jmp 0x100123f56 ; 0x100123f56
0x100123f4a: lea r14, [r12 + 0x20]
0x100123f4f: xor eax, eax
0x100123f51: mov rbx, qword ptr [rsp + 0x40]
0x100123f56: mov byte ptr [r14], al
0x100123f59: vmovaps xmm0, xmmword ptr [rbx + 0xb60]
0x100123f61: vmovaps xmmword ptr [rsp + 0x580], xmm0
0x100123f6a: vmovaps xmm0, xmmword ptr [rbx + 0xb70]
0x100123f72: vmovaps xmmword ptr [rsp + 0x590], xmm0
0x100123f7b: vmovaps xmm0, xmmword ptr [rbx + 0xb80]
0x100123f83: vmovaps xmmword ptr [rsp + 0x5a0], xmm0
0x100123f8c: vmovaps xmm0, xmmword ptr [rbx + 0xb90]
0x100123f94: vmovaps xmmword ptr [rsp + 0x5b0], xmm0
0x100123f9d: lea rdi, [rsp + 0x600]
0x100123fa5: lea rsi, [rsp + 0x580]
0x100123fad: call 0x100076940 ; 0x100076940
0x100123fb2: vmovaps xmm5, xmmword ptr [rsp + 0x290]
0x100123fbb: vmovaps xmm0, xmmword ptr [rsp + 0x600]
0x100123fc4: vmovaps xmm1, xmmword ptr [rsp + 0x610]
0x100123fcd: vmovaps xmm2, xmmword ptr [rsp + 0x620]
0x100123fd6: vmovaps xmm3, xmmword ptr [rsp + 0x630]
0x100123fdf: vmovaps xmmword ptr [rsp + 0x1c0], xmm3
0x100123fe8: vpermilps xmm3, xmm5, 0
0x100123fee: vmulps xmm3, xmm3, xmm0
0x100123ff2: vpermilps xmm4, xmm5, 0x55
0x100123ff8: vmulps xmm4, xmm4, xmm1
0x100123ffc: vaddps xmm3, xmm3, xmm4
0x100124000: vmovaps xmmword ptr [rsp + 0xc0], xmm3
0x100124009: vpermilps xmm3, xmm5, 0xaa
0x10012400f: vmulps xmm3, xmm3, xmm2
0x100124013: vmovaps xmmword ptr [rsp + 0x120], xmm3
0x10012401c: vmovaps xmm4, xmmword ptr [rsp + 0x280]
0x100124025: vpermilps xmm3, xmm4, 0
0x10012402b: vmulps xmm0, xmm0, xmm3
0x10012402f: vpermilps xmm3, xmm4, 0x55
0x100124035: vmulps xmm1, xmm1, xmm3
0x100124039: vaddps xmm0, xmm0, xmm1
0x10012403d: vmovaps xmmword ptr [rsp + 0x190], xmm0
0x100124046: vpermilps xmm0, xmm4, 0xaa
0x10012404c: vmulps xmm0, xmm2, xmm0
0x100124050: vmovaps xmmword ptr [rsp + 0x210], xmm0
0x100124059: vmovaps xmm0, xmmword ptr [r13 + 0x4b0]
0x100124062: vmovaps xmmword ptr [rsp + 0x30], xmm0
0x100124068: vmovaps xmm0, xmmword ptr [r13 + 0x4c0]
0x100124071: vmovaps xmmword ptr [rsp + 0x140], xmm0
0x10012407a: vmovaps xmm0, xmmword ptr [rbx + 0x140]
0x100124082: vmovaps xmmword ptr [rsp + 0x110], xmm0
0x10012408b: vmovaps xmmword ptr [rsp + 0x180], xmm0
0x100124094: vmovaps xmm0, xmmword ptr [rbx + 0x50]
0x100124099: vmulps xmm0, xmm0, xmm0
0x10012409d: vmovaps xmmword ptr [rsp + 0x2b0], xmm0
0x1001240a6: vmovshdup xmm0, xmm0
0x1001240aa: vmovaps xmmword ptr [rsp + 0x2a0], xmm0
0x1001240b3: vmovaps xmmword ptr [rsp], xmm5
0x1001240b8: vmovaps xmmword ptr [rsp + 0x270], xmm5
0x1001240c1: vmovaps xmmword ptr [rsp + 0x130], xmm4
0x1001240ca: vmovaps xmmword ptr [rsp + 0x1f0], xmm4
0x1001240d3: vmovaps xmm0, xmmword ptr [rip + 0x985205] ; 0x100aa92e0
0x1001240db: vmovaps xmmword ptr [rsp + 0x580], xmm0
0x1001240e4: lea rsi, [rsp + 0x290]
0x1001240ec: lea rdx, [rsp + 0x580]
0x1001240f4: vmovss xmm0, dword ptr [rip + 0x9836f8] ; 0x100aa77f4
0x1001240fc: lea rcx, [rsp + 0x350]
0x100124104: lea r8, [rsp + 0x220]
0x10012410c: mov rdi, qword ptr [rsp + 0xa8]
0x100124114: call 0x100776a90 ; 0x100776a90
0x100124119: test al, al
0x10012411b: je 0x10012415b
0x10012411d: vbroadcastss xmm0, dword ptr [rsp + 0x294]
0x100124127: vsubss xmm0, xmm0, dword ptr [rsp + 0x224]
0x100124130: vmovss dword ptr [r12 + 4], xmm0
0x100124137: vmovaps xmm0, xmmword ptr [rsp + 0x220]
0x100124140: vmovaps xmm1, xmmword ptr [rsp + 0x230]
0x100124149: vmovaps xmmword ptr [rsp + 0x110], xmm1
0x100124152: vmovaps xmmword ptr [rsp + 0x270], xmm0
0x10012415b: vmovaps xmm0, xmmword ptr [rsp + 0x120]
0x100124164: vaddps xmm0, xmm0, xmmword ptr [rsp + 0xc0]
0x10012416d: vmovaps xmmword ptr [rsp + 0xc0], xmm0
0x100124176: vmovaps xmm0, xmmword ptr [rsp + 0x210]
0x10012417f: vaddps xmm0, xmm0, xmmword ptr [rsp + 0x190]
0x100124188: vmovaps xmmword ptr [rsp + 0x120], xmm0
0x100124191: vmovaps xmm0, xmmword ptr [rsp + 0x2b0]
0x10012419a: vaddss xmm1, xmm0, dword ptr [rsp + 0x2a0]
0x1001241a3: vmovss dword ptr [rsp + 0x190], xmm1
0x1001241ac: vpermilpd xmm0, xmm0, 1
0x1001241b2: vmovapd xmmword ptr [rsp + 0x210], xmm0
0x1001241bb: vmovaps xmm0, xmmword ptr [rip + 0x98511d] ; 0x100aa92e0
0x1001241c3: vmovaps xmmword ptr [rsp + 0x580], xmm0
0x1001241cc: lea rsi, [rsp + 0x280]
0x1001241d4: lea rbx, [rsp + 0x580]
0x1001241dc: vmovss xmm0, dword ptr [rip + 0x983610] ; 0x100aa77f4
0x1001241e4: lea rcx, [rsp + 0x350]
0x1001241ec: lea r8, [rsp + 0x220]
0x1001241f4: mov rdi, qword ptr [rsp + 0xa8]
0x1001241fc: mov rdx, rbx
0x1001241ff: vmovss dword ptr [rsp + 0x84], xmm0
0x100124208: call 0x100776a90 ; 0x100776a90
0x10012420d: test al, al
0x10012420f: je 0x10012424f
0x100124211: vbroadcastss xmm0, dword ptr [rsp + 0x284]
0x10012421b: vsubss xmm0, xmm0, dword ptr [rsp + 0x224]
0x100124224: vmovss dword ptr [r12 + 8], xmm0
0x10012422b: vmovaps xmm0, xmmword ptr [rsp + 0x220]
0x100124234: vmovaps xmm1, xmmword ptr [rsp + 0x230]
0x10012423d: vmovaps xmmword ptr [rsp + 0x180], xmm1
0x100124246: vmovaps xmmword ptr [rsp + 0x1f0], xmm0
0x10012424f: vmovaps xmm0, xmmword ptr [rsp + 0x1c0]
0x100124258: vaddps xmm3, xmm0, xmmword ptr [rsp + 0xc0]
0x100124261: vaddps xmm1, xmm0, xmmword ptr [rsp + 0x120]
0x10012426a: vmovaps xmm0, xmmword ptr [rsp + 0x210]
0x100124273: vaddss xmm2, xmm0, dword ptr [rsp + 0x190]
0x10012427c: vmovss xmm0, dword ptr [rip + 0x983570] ; 0x100aa77f4
0x100124284: vucomiss xmm0, dword ptr [r12 + 4]
0x10012428b: vmovaps xmm6, xmmword ptr [rsp + 0x60]
0x100124291: jbe 0x1001242b4
0x100124293: lea r14, [r12 + 0x14]
0x100124298: mov byte ptr [r12 + 0x14], 1
0x10012429e: lea rdx, [r12 + 0xc]
0x1001242a3: vmovss xmm4, dword ptr [r12 + 0xc]
0x1001242aa: vmulss xmm0, xmm6, dword ptr [rip + 0x98753a] ; 0x100aab7ec
0x1001242b2: jmp 0x1001242e5 ; 0x1001242e5
0x1001242b4: mov rax, qword ptr [rsp + 0x40]
0x1001242b9: mov al, byte ptr [rax + 0xbc1]
0x1001242bf: lea r14, [r12 + 0x14]
0x1001242c4: lea rdx, [r12 + 0xc]
0x1001242c9: mov byte ptr [r12 + 0x14], al
0x1001242ce: vmovss xmm4, dword ptr [r12 + 0xc]
0x1001242d5: vmulss xmm0, xmm6, dword ptr [rip + 0x98750f] ; 0x100aab7ec
0x1001242dd: vmovaps xmm5, xmm0
0x1001242e1: test al, al
0x1001242e3: je 0x1001242e9
0x1001242e5: vmovaps xmm5, xmm6
0x1001242e9: mov qword ptr [rsp + 0x78], r15
0x1001242ee: vaddss xmm4, xmm4, xmm5
0x1001242f2: vsubps xmm3, xmm3, xmmword ptr [rsp]
0x1001242f7: vpermilps xmm5, xmm6, 0xc0
0x1001242fd: vmovaps xmmword ptr [rsp + 0x1c0], xmm5
0x100124306: vsubps xmm1, xmm1, xmmword ptr [rsp + 0x130]
0x10012430f: vsqrtss xmm2, xmm2, xmm2
0x100124313: vxorps xmm5, xmm5, xmm5
0x100124317: vmaxss xmm4, xmm5, xmm4
0x10012431b: vmovss xmm5, dword ptr [rip + 0x980295] ; 0x100aa45b8
0x100124323: vminss xmm4, xmm5, xmm4
0x100124327: vmovss dword ptr [r12 + 0xc], xmm4
0x10012432e: vmovss xmm4, dword ptr [rip + 0x9834be] ; 0x100aa77f4
0x100124336: vucomiss xmm4, dword ptr [r12 + 8]
0x10012433d: jbe 0x100124355
0x10012433f: mov rax, r12
0x100124342: lea r12, [rax + 0x15]
0x100124346: mov byte ptr [rax + 0x15], 1
0x10012434a: lea r13, [rax + 0x10]
0x10012434e: vmovss xmm4, dword ptr [rax + 0x10]
0x100124353: jmp 0x100124377 ; 0x100124377
0x100124355: mov rax, qword ptr [rsp + 0x40]
0x10012435a: mov al, byte ptr [rax + 0xbc1]
0x100124360: mov rcx, r12
0x100124363: lea r12, [rcx + 0x15]
0x100124367: lea r13, [rcx + 0x10]
0x10012436b: mov byte ptr [rcx + 0x15], al
0x10012436e: vmovss xmm4, dword ptr [rcx + 0x10]
0x100124373: test al, al
0x100124375: je 0x10012437b
0x100124377: vmovaps xmm0, xmm6
0x10012437b: vaddss xmm0, xmm4, xmm0
0x10012437f: vmovaps xmm4, xmmword ptr [rsp + 0x1c0]
0x100124388: vdivps xmm3, xmm3, xmm4
0x10012438c: vdivps xmm1, xmm1, xmm4
0x100124390: vmulss xmm4, xmm2, dword ptr [rip + 0x984e2c] ; 0x100aa91c4
0x100124398: vxorps xmm2, xmm2, xmm2
0x10012439c: vmaxss xmm0, xmm2, xmm0
0x1001243a0: vmovss xmm2, dword ptr [rip + 0x980210] ; 0x100aa45b8
0x1001243a8: vminss xmm0, xmm2, xmm0
0x1001243ac: mov rcx, qword ptr [rsp + 0x58]
0x1001243b1: vmovss dword ptr [rcx + 0x10], xmm0
0x1001243b6: vmovups ymm0, ymmword ptr [rcx + 0x258]
0x1001243be: vmovups ymmword ptr [rsp + 0x580], ymm0
0x1001243c7: mov rax, qword ptr [rcx + 0x278]
0x1001243ce: mov qword ptr [rsp + 0x5a0], rax
0x1001243d6: mov rax, qword ptr [rcx + 0x280]
0x1001243dd: mov qword ptr [rsp + 0x5a8], rax
0x1001243e5: vmovaps xmm11, xmmword ptr [rsp + 0x270]
0x1001243ee: vmovaps xmm2, xmmword ptr [rsp + 0x110]
0x1001243f7: vmulps xmm0, xmm2, xmm2
0x1001243fb: vmovshdup xmm5, xmm0
0x1001243ff: vaddss xmm5, xmm0, xmm5
0x100124403: vpermilpd xmm0, xmm0, 1
0x100124409: vaddss xmm0, xmm0, xmm5
0x10012440d: vsqrtss xmm0, xmm0, xmm0
0x100124411: vucomiss xmm0, dword ptr [rip + 0x9834ab] ; 0x100aa78c4
0x100124419: jbe 0x100124425
0x10012441b: vpermilps xmm0, xmm0, 0xc0
0x100124421: vdivps xmm2, xmm2, xmm0
0x100124425: vmovss xmm0, dword ptr [rip + 0x980c93] ; 0x100aa50c0
0x10012442d: vmovaps xmm5, xmmword ptr [rsp + 0x10]
0x100124433: vinsertps xmm0, xmm5, xmm0, 0x30
0x100124439: vmovaps xmmword ptr [rsp], xmm0
0x10012443e: vaddps xmm0, xmm3, xmmword ptr [rsp + 0x30]
0x100124444: vmovaps xmmword ptr [rsp + 0x30], xmm0
0x10012444a: vaddps xmm0, xmm1, xmmword ptr [rsp + 0x140]
0x100124453: vmovaps xmmword ptr [rsp + 0x10], xmm0
0x100124459: vaddss xmm12, xmm4, dword ptr [rip + 0x980157] ; 0x100aa45b8
0x100124461: lea rax, [rsp + 0x5b0]
0x100124469: vxorps xmm8, xmm2, xmmword ptr [rip + 0x98348f] ; 0x100aa7900
0x100124471: vmulps xmm0, xmm2, xmm2
0x100124475: vmovshdup xmm3, xmm0
0x100124479: vaddss xmm3, xmm0, xmm3
0x10012447d: vpermilpd xmm0, xmm0, 1
0x100124483: vaddss xmm0, xmm0, xmm3
0x100124487: vsqrtss xmm14, xmm0, xmm0
0x10012448b: vpermilps xmm0, xmm14, 0xc0
0x100124491: vdivps xmm13, xmm8, xmm0
0x100124495: vmovaps xmm6, xmmword ptr [rip + 0x9871f3] ; 0x100aab690
0x10012449d: vmulps xmm0, xmm2, xmm6
0x1001244a1: vmovshdup xmm5, xmm0
0x1001244a5: vaddss xmm5, xmm0, xmm5
0x1001244a9: vpermilpd xmm0, xmm0, 1
0x1001244af: vaddss xmm0, xmm0, xmm5
0x1001244b3: vaddss xmm0, xmm0, dword ptr [rip + 0x980c05] ; 0x100aa50c0
0x1001244bb: vaddss xmm0, xmm0, xmm0
0x1001244bf: vmovss xmm4, dword ptr [rip + 0x980bfd] ; 0x100aa50c4
0x1001244c7: vmulps xmm5, xmm2, xmm4
0x1001244cb: vpermilps xmm2, xmm2, 0xd2
0x1001244d1: vmulps xmm2, xmm2, xmm6
0x1001244d5: vsubps xmm2, xmm5, xmm2
0x1001244d9: vpermilps xmm2, xmm2, 0xd2
0x1001244df: vmovss xmm3, dword ptr [rip + 0x9833dd] ; 0x100aa78c4
0x1001244e7: vmovaps xmm15, xmmword ptr [rip + 0x9871b1] ; 0x100aab6a0
0x1001244ef: vsqrtss xmm0, xmm0, xmm0
0x1001244f3: vmovss xmm1, dword ptr [rip + 0x980bc5] ; 0x100aa50c0
0x1001244fb: vdivss xmm5, xmm1, xmm0
0x1001244ff: vpermilps xmm5, xmm5, 0xc0
0x100124505: vmulps xmm2, xmm2, xmm5
0x100124509: vmulss xmm0, xmm0, dword ptr [rip + 0x9800a7] ; 0x100aa45b8
0x100124511: vinsertps xmm10, xmm2, xmm0, 0x30
0x100124517: vxorps xmm9, xmm9, xmm9
0x10012451c: nop dword ptr [rax]
0x100124520: vucomiss xmm14, xmm3
0x100124524: mov rcx, qword ptr [rbx]
0x100124527: vmovaps xmmword ptr [rcx + 0x20], xmm11
0x10012452c: vmovaps xmm2, xmm13
0x100124530: ja 0x100124536
0x100124532: vmovaps xmm2, xmm8
0x100124536: vmulps xmm0, xmm2, xmm6
0x10012453a: vmovshdup xmm2, xmm0
0x10012453e: vaddss xmm2, xmm0, xmm2
0x100124542: vpermilpd xmm0, xmm0, 1
0x100124548: vaddss xmm0, xmm0, xmm2
0x10012454c: vaddss xmm0, xmm0, xmm4
0x100124550: vandps xmm0, xmm0, xmmword ptr [rip + 0x9833b8] ; 0x100aa7910
0x100124558: vucomiss xmm3, xmm0
0x10012455c: vmovaps xmm2, xmm15
0x100124560: jae 0x100124566
0x100124562: vmovaps xmm2, xmm10
0x100124566: vmovaps xmmword ptr [rcx + 0x30], xmm2
0x10012456b: vpermilps xmm0, xmm2, 0xe7
0x100124571: vucomiss xmm0, xmm0
0x100124575: jp 0x10012bd65
0x10012457b: vmovshdup xmm0, xmm2
0x10012457f: vucomiss xmm2, xmm0
0x100124583: jp 0x10012bd65
0x100124589: vpermilpd xmm0, xmm2, 1
0x10012458f: vucomiss xmm0, xmm0
0x100124593: jp 0x10012bd65
0x100124599: cmp byte ptr [r14], 0
0x10012459d: vmovaps xmm2, xmmword ptr [rsp + 0x30]
0x1001245a3: je 0x1001245ab
0x1001245a5: vblendps xmm2, xmm9, xmm7, 8
0x1001245ab: vmovaps xmmword ptr [rcx + 0xc0], xmm2
0x1001245b3: mov byte ptr [rcx + 0x18b], 1
0x1001245ba: cmp byte ptr [r14], 0
0x1001245be: vxorps xmm5, xmm5, xmm5
0x1001245c2: je 0x1001245c8
0x1001245c4: vmovaps xmm5, xmm12
0x1001245c8: vmovss dword ptr [rcx + 0x84], xmm5
0x1001245d0: vmovaps xmm0, xmmword ptr [rsp]
0x1001245d5: vmovaps xmmword ptr [rcx + 0x120], xmm0
0x1001245dd: vmovaps xmmword ptr [rcx + 0x110], xmm0
0x1001245e5: mov dword ptr [rcx + 0x80], 0
0x1001245ef: mov rcx, qword ptr [rbx + 8]
0x1001245f3: vmovaps xmm0, xmmword ptr [rsp + 0x1f0]
0x1001245fc: vmovaps xmmword ptr [rcx + 0x20], xmm0
0x100124601: vmovaps xmm7, xmmword ptr [rsp + 0x180]
0x10012460a: vmulps xmm0, xmm7, xmm7
0x10012460e: vmovshdup xmm5, xmm0
0x100124612: vaddss xmm5, xmm0, xmm5
0x100124616: vpermilpd xmm0, xmm0, 1
0x10012461c: vaddss xmm0, xmm0, xmm5
0x100124620: vsqrtss xmm5, xmm0, xmm0
0x100124624: vucomiss xmm5, xmm3
0x100124628: jbe 0x100124634
0x10012462a: vpermilps xmm0, xmm5, 0xc0
0x100124630: vdivps xmm7, xmm7, xmm0
0x100124634: vxorps xmm5, xmm7, xmmword ptr [rip + 0x9832c4] ; 0x100aa7900
0x10012463c: vmulps xmm0, xmm7, xmm7
0x100124640: vmovshdup xmm1, xmm0
0x100124644: vaddss xmm1, xmm0, xmm1
0x100124648: vpermilpd xmm0, xmm0, 1
0x10012464e: vaddss xmm0, xmm0, xmm1
0x100124652: vsqrtss xmm0, xmm0, xmm0
0x100124656: vucomiss xmm0, xmm3
0x10012465a: jbe 0x100124666
0x10012465c: vpermilps xmm0, xmm0, 0xc0
0x100124662: vdivps xmm5, xmm5, xmm0
0x100124666: vmulps xmm0, xmm5, xmm6
0x10012466a: vmovshdup xmm1, xmm0
0x10012466e: vaddss xmm1, xmm0, xmm1
0x100124672: vpermilpd xmm0, xmm0, 1
0x100124678: vaddss xmm0, xmm0, xmm1
0x10012467c: vaddss xmm0, xmm0, xmm4
0x100124680: vandps xmm0, xmm0, xmmword ptr [rip + 0x983288] ; 0x100aa7910
0x100124688: vucomiss xmm3, xmm0
0x10012468c: vmovaps xmm5, xmm15
0x100124690: jae 0x1001246f0
0x100124692: vmulps xmm0, xmm7, xmm6
0x100124696: vmovshdup xmm1, xmm0
0x10012469a: vaddss xmm1, xmm0, xmm1
0x10012469e: vpermilpd xmm0, xmm0, 1
0x1001246a4: vaddss xmm0, xmm0, xmm1
0x1001246a8: vmovss xmm1, dword ptr [rip + 0x980a10] ; 0x100aa50c0
0x1001246b0: vaddss xmm0, xmm0, xmm1
0x1001246b4: vaddss xmm0, xmm0, xmm0
0x1001246b8: vsqrtss xmm0, xmm0, xmm0
0x1001246bc: vdivss xmm1, xmm1, xmm0
0x1001246c0: vmulps xmm5, xmm7, xmm4
0x1001246c4: vpermilps xmm7, xmm7, 0xd2
0x1001246ca: vmulps xmm7, xmm7, xmm6
0x1001246ce: vsubps xmm5, xmm5, xmm7
0x1001246d2: vpermilps xmm5, xmm5, 0xd2
0x1001246d8: vpermilps xmm1, xmm1, 0xc0
0x1001246de: vmulps xmm1, xmm5, xmm1
0x1001246e2: vmulss xmm0, xmm0, dword ptr [rip + 0x97fece] ; 0x100aa45b8
0x1001246ea: vinsertps xmm5, xmm1, xmm0, 0x30
0x1001246f0: vmovaps xmmword ptr [rcx + 0x30], xmm5
0x1001246f5: vpermilps xmm0, xmm5, 0xe7
0x1001246fb: vucomiss xmm0, xmm0
0x1001246ff: jp 0x10012bd65
0x100124705: vmovshdup xmm0, xmm5
0x100124709: vucomiss xmm5, xmm0
0x10012470d: jp 0x10012bd65
0x100124713: vpermilpd xmm0, xmm5, 1
0x100124719: vucomiss xmm0, xmm0
0x10012471d: jp 0x10012bd65
0x100124723: cmp byte ptr [r12], 0
0x100124728: vmovaps xmm7, xmmword ptr [rsp + 0x10]
0x10012472e: je 0x100124736
0x100124730: vblendps xmm7, xmm9, xmm2, 8
0x100124736: vmovaps xmmword ptr [rcx + 0xc0], xmm7
0x10012473e: mov byte ptr [rcx + 0x18b], 1
0x100124745: cmp byte ptr [r12], 0
0x10012474a: vxorps xmm2, xmm2, xmm2
0x10012474e: je 0x100124754
0x100124750: vmovaps xmm2, xmm12
0x100124754: vmovss dword ptr [rcx + 0x84], xmm2
0x10012475c: vmovaps xmm0, xmmword ptr [rsp]
0x100124761: vmovaps xmmword ptr [rcx + 0x120], xmm0
0x100124769: vmovaps xmmword ptr [rcx + 0x110], xmm0
0x100124771: mov dword ptr [rcx + 0x80], 0
0x10012477b: add rbx, 0x10
0x10012477f: cmp rbx, rax
0x100124782: jne 0x100124520
0x100124788: mov r15, rdx
0x10012478b: mov rax, qword ptr [rsp + 0x40]
0x100124790: movzx ebx, byte ptr [rax + 0x160]
0x100124797: mov edi, ebx
0x100124799: vzeroupper 
0x10012479c: call 0x10043fb60 ; 0x10043fb60
0x1001247a1: xor ecx, ecx
0x1001247a3: cmp al, 2
0x1001247a5: sete dl
0x1001247a8: cmp ebx, 0x23
0x1001247ab: jne 0x1001247b7
0x1001247ad: vmovss xmm8, dword ptr [rip + 0x983e1b] ; 0x100aa85d0
0x1001247b5: jmp 0x1001247c5 ; 0x1001247c5
0x1001247b7: mov cl, dl
0x1001247b9: lea rdx, [rip + 0x987088] ; 0x100aab848
0x1001247c0: vmovss xmm8, dword ptr [rdx + rcx*4]
0x1001247c5: mov rdi, qword ptr [rsp + 0x40]
0x1001247ca: movzx ecx, byte ptr [rdi + 0xbc1]
0x1001247d1: xor edx, edx
0x1001247d3: test rcx, rcx
0x1001247d6: setne dl
0x1001247d9: lea rsi, [rip + 0x987070] ; 0x100aab850
0x1001247e0: vmovss xmm6, dword ptr [rsi + rdx*4]
0x1001247e5: lea rsi, [rip + 0x98706c] ; 0x100aab858
0x1001247ec: vmovss xmm13, dword ptr [rsi + rdx*4]
0x1001247f1: lea rdx, [rip + 0x987068] ; 0x100aab860
0x1001247f8: vmovss xmm15, dword ptr [rdx + rcx*4]
0x1001247fd: vmovaps xmm0, xmmword ptr [rsp + 0x30]
0x100124803: vmulps xmm2, xmm0, xmm0
0x100124807: vmovshdup xmm3, xmm2
0x10012480b: vaddss xmm3, xmm2, xmm3
0x10012480f: vpermilpd xmm2, xmm2, 1
0x100124815: vaddss xmm2, xmm2, xmm3
0x100124819: vsqrtss xmm2, xmm2, xmm2
0x10012481d: vmovss xmm0, dword ptr [rip + 0x983e73] ; 0x100aa8698
0x100124825: vaddss xmm2, xmm2, xmm0
0x100124829: vmovss xmm3, dword ptr [rip + 0x985c5f] ; 0x100aaa490
0x100124831: vdivss xmm2, xmm2, xmm3
0x100124835: vxorps xmm4, xmm4, xmm4
0x100124839: vmaxss xmm2, xmm4, xmm2
0x10012483d: vmovss xmm5, dword ptr [rip + 0x98087b] ; 0x100aa50c0
0x100124845: vmovaps xmm1, xmm5
0x100124849: vminss xmm2, xmm1, xmm2
0x10012484d: vsubss xmm7, xmm1, xmm2
0x100124851: vmulss xmm7, xmm7, xmm4
0x100124855: vaddss xmm2, xmm2, xmm7
0x100124859: vmovaps xmm5, xmmword ptr [rsp + 0x10]
0x10012485f: vmulps xmm7, xmm5, xmm5
0x100124863: vmovshdup xmm5, xmm7
0x100124867: vaddss xmm5, xmm7, xmm5
0x10012486b: vpermilpd xmm7, xmm7, 1
0x100124871: vaddss xmm5, xmm7, xmm5
0x100124875: vsqrtss xmm5, xmm5, xmm5
0x100124879: vaddss xmm5, xmm5, xmm0
0x10012487d: vdivss xmm3, xmm5, xmm3
0x100124881: vmaxss xmm3, xmm4, xmm3
0x100124885: vminss xmm3, xmm1, xmm3
0x100124889: vsubss xmm5, xmm1, xmm3
0x10012488d: vmulss xmm4, xmm5, xmm4
0x100124891: vaddss xmm4, xmm3, xmm4
0x100124895: vmovss xmm12, dword ptr [rip + 0x983027] ; 0x100aa78c4
0x10012489d: vmovaps xmm14, xmmword ptr [rip + 0x986deb] ; 0x100aab690
0x1001248a5: je 0x1001248f6
0x1001248a7: vmovaps xmm3, xmmword ptr [rsp + 0x290]
0x1001248b0: vinsertps xmm3, xmm3, dword ptr [rsp + 0x284], 0xc
0x1001248bb: vbroadcastss xmm5, dword ptr [rdi + 0x134]
0x1001248c4: vsubps xmm3, xmm3, xmm5
0x1001248c8: vaddps xmm3, xmm3, xmmword ptr [rip + 0x986de0] ; 0x100aab6b0
0x1001248d0: vdivps xmm3, xmm3, xmmword ptr [rip + 0x986de8] ; 0x100aab6c0
0x1001248d8: vxorps xmm5, xmm5, xmm5
0x1001248dc: vmaxps xmm3, xmm5, xmm3
0x1001248e0: vmovaps xmm5, xmmword ptr [rip + 0x985c68] ; 0x100aaa550
0x1001248e8: vminps xmm3, xmm5, xmm3
0x1001248ec: vaddps xmm9, xmm3, xmmword ptr [rip + 0x986ddc] ; 0x100aab6d0
0x1001248f4: jmp 0x1001248fe ; 0x1001248fe
0x1001248f6: vmovaps xmm9, xmmword ptr [rip + 0x985c52] ; 0x100aaa550
0x1001248fe: mov rdx, qword ptr [rsp + 0x58]
0x100124903: mov r9, qword ptr [rdx + 0x278]
0x10012490a: vmulss xmm5, xmm13, xmm2
0x10012490e: vmovss xmm3, dword ptr [rip + 0x983cba] ; 0x100aa85d0
0x100124916: vaddss xmm5, xmm5, xmm3
0x10012491a: vmovss dword ptr [r9 + 0x8c], xmm5
0x100124923: mov r8, qword ptr [rdx + 0x280]
0x10012492a: vmulss xmm5, xmm13, xmm4
0x10012492e: vaddss xmm5, xmm5, xmm3
0x100124932: vmovss dword ptr [r8 + 0x8c], xmm5
0x10012493b: mov r10, qword ptr [rdx + 0x258]
0x100124942: vmulss xmm5, xmm6, xmm2
0x100124946: vaddss xmm5, xmm5, xmm3
0x10012494a: vmovss dword ptr [r10 + 0x8c], xmm5
0x100124953: mov rsi, qword ptr [rdx + 0x260]
0x10012495a: vmulss xmm5, xmm6, xmm4
0x10012495e: vmovaps xmmword ptr [rsp + 0x200], xmm3
0x100124967: vaddss xmm5, xmm5, xmm3
0x10012496b: vmovss dword ptr [rsi + 0x8c], xmm5
0x100124973: mov rcx, qword ptr [rdx + 0x268]
0x10012497a: vmulss xmm5, xmm15, xmm2
0x10012497e: vmovss xmm0, dword ptr [rip + 0x984022] ; 0x100aa89a8
0x100124986: vaddss xmm5, xmm5, xmm0
0x10012498a: vmovss dword ptr [rcx + 0x8c], xmm5
0x100124992: mov rdx, qword ptr [rdx + 0x270]
0x100124999: vmulss xmm5, xmm15, xmm4
0x10012499d: vmulss xmm5, xmm8, xmm5
0x1001249a1: vaddss xmm5, xmm5, xmm0
0x1001249a5: vmovss dword ptr [rdx + 0x8c], xmm5
0x1001249ad: vmovss xmm0, dword ptr [rip + 0x98070b] ; 0x100aa50c0
0x1001249b5: vucomiss xmm0, dword ptr [rdi + 0xbac]
0x1001249bd: jbe 0x100124c10
0x1001249c3: vxorps xmm8, xmm8, xmm8
0x1001249c8: cmp bl, 0x16
0x1001249cb: je 0x100124aab
0x1001249d1: cmp bl, 0x15
0x1001249d4: jne 0x100124acc
0x1001249da: vmovss xmm11, dword ptr [rip + 0x9832de] ; 0x100aa7cc0
0x1001249e2: jmp 0x100124ab3 ; 0x100124ab3
0x1001249e7: sub rcx, rax
0x1001249ea: xor edx, edx
0x1001249ec: nop dword ptr [rax]
0x1001249f0: mov rsi, qword ptr [r12 + rdx*8 + 0x50]
0x1001249f5: mov dword ptr [rsi + 0x80], 0
0x1001249ff: mov rsi, qword ptr [r12 + rdx*8 + 0x58]
0x100124a04: mov dword ptr [rsi + 0x80], 0
0x100124a0e: mov rsi, qword ptr [r12 + rdx*8 + 0x60]
0x100124a13: mov dword ptr [rsi + 0x80], 0
0x100124a1d: mov rsi, qword ptr [r12 + rdx*8 + 0x68]
0x100124a22: mov dword ptr [rsi + 0x80], 0
0x100124a2c: mov rsi, qword ptr [r12 + rdx*8 + 0x70]
0x100124a31: mov dword ptr [rsi + 0x80], 0
0x100124a3b: mov rsi, qword ptr [r12 + rdx*8 + 0x78]
0x100124a40: mov dword ptr [rsi + 0x80], 0
0x100124a4a: mov rsi, qword ptr [r12 + rdx*8 + 0x80]
0x100124a52: mov dword ptr [rsi + 0x80], 0
0x100124a5c: mov rsi, qword ptr [r12 + rdx*8 + 0x88]
0x100124a64: mov dword ptr [rsi + 0x80], 0
0x100124a6e: add rdx, 8
0x100124a72: cmp rcx, rdx
0x100124a75: jne 0x1001249f0
0x100124a7b: test rax, rax
0x100124a7e: je 0x10012bd17
0x100124a84: lea rcx, [r12 + rdx*8 + 0x50]
0x100124a89: neg rax
0x100124a8c: nop dword ptr [rax]
0x100124a90: mov rdx, qword ptr [rcx]
0x100124a93: mov dword ptr [rdx + 0x80], 0
0x100124a9d: add rcx, 8
0x100124aa1: inc rax
0x100124aa4: jne 0x100124a90
0x100124aa6: jmp 0x10012bd17 ; 0x10012bd17
0x100124aab: vmovss xmm11, dword ptr [rip + 0x98060d] ; 0x100aa50c0
0x100124ab3: vxorps xmm7, xmm7, xmm7
0x100124ab7: vxorps xmm10, xmm10, xmm10
0x100124abc: mov rdi, qword ptr [rsp + 0x40]
0x100124ac1: cmp byte ptr [rdi + 0x1b3], 0
0x100124ac8: jne 0x100124b30
0x100124aca: jmp 0x100124b34 ; 0x100124b34
0x100124acc: mov ebx, eax
0x100124ace: and bl, 0xfe
0x100124ad1: vxorps xmm7, xmm7, xmm7
0x100124ad5: cmp al, 3
0x100124ad7: je 0x100124b09
0x100124ad9: vmovss xmm7, dword ptr [rip + 0x981fcb] ; 0x100aa6aac
0x100124ae1: vmovss xmm11, dword ptr [rip + 0x9805d7] ; 0x100aa50c0
0x100124ae9: vmovaps xmm10, xmm11
0x100124aee: jne 0x100124b18
0x100124af0: cmp bl, 2
0x100124af3: je 0x100124b22
0x100124af5: vmovaps xmm7, xmm11
0x100124af9: mov rdi, qword ptr [rsp + 0x40]
0x100124afe: cmp byte ptr [rdi + 0x1b3], 0
0x100124b05: jne 0x100124b30
0x100124b07: jmp 0x100124b34 ; 0x100124b34
0x100124b09: vmovss xmm11, dword ptr [rip + 0x9805af] ; 0x100aa50c0
0x100124b11: vmovaps xmm10, xmm11
0x100124b16: je 0x100124af0
0x100124b18: vxorps xmm10, xmm10, xmm10
0x100124b1d: cmp bl, 2
0x100124b20: jne 0x100124af5
0x100124b22: mov rdi, qword ptr [rsp + 0x40]
0x100124b27: cmp byte ptr [rdi + 0x1b3], 0
0x100124b2e: je 0x100124b34
0x100124b30: vxorps xmm7, xmm7, xmm7
0x100124b34: vcmpltss xmm3, xmm8, dword ptr [r15]
0x100124b3a: vmovss xmm5, dword ptr [rip + 0x98057e] ; 0x100aa50c0
0x100124b42: vandps xmm3, xmm3, xmm5
0x100124b46: vmulss xmm3, xmm2, xmm3
0x100124b4a: vcmpltss xmm2, xmm8, dword ptr [r13]
0x100124b51: vandps xmm2, xmm2, xmm5
0x100124b55: vmulss xmm2, xmm4, xmm2
0x100124b59: vmovaps xmm4, xmmword ptr [rdi + 0x50]
0x100124b5e: vmulps xmm4, xmm4, xmm4
0x100124b62: vmovshdup xmm6, xmm4
0x100124b66: vaddss xmm6, xmm4, xmm6
0x100124b6a: vpermilpd xmm4, xmm4, 1
0x100124b70: vaddss xmm4, xmm4, xmm6
0x100124b74: vsqrtss xmm4, xmm4, xmm4
0x100124b78: lea rax, [rip + 0x99cc69] ; 0x100ac17e8 fff@
0x100124b7f: vdivss xmm4, xmm4, dword ptr [rax]
0x100124b83: vmaxss xmm4, xmm5, xmm4
0x100124b87: vmovshdup xmm5, xmm9
0x100124b8c: vmulss xmm5, xmm5, xmm3
0x100124b90: vmulss xmm5, xmm15, xmm5
0x100124b94: vmulss xmm5, xmm5, xmm4
0x100124b98: vmulss xmm5, xmm7, xmm5
0x100124b9c: vmovss dword ptr [rcx + 0x80], xmm5
0x100124ba4: vmulss xmm5, xmm9, xmm2
0x100124ba8: vmulss xmm1, xmm15, xmm5
0x100124bac: vmulss xmm1, xmm1, xmm4
0x100124bb0: vmulss xmm1, xmm7, xmm1
0x100124bb4: vmovss dword ptr [rdx + 0x80], xmm1
0x100124bbc: vmulss xmm1, xmm11, xmm3
0x100124bc0: vmovss dword ptr [r10 + 0x80], xmm1
0x100124bc9: vmulss xmm1, xmm11, xmm2
0x100124bcd: vmovss dword ptr [rsi + 0x80], xmm1
0x100124bd5: movsx eax, byte ptr [r14]
0x100124bd9: vcvtsi2ss xmm1, xmm13, eax
0x100124bdd: vmulss xmm1, xmm3, xmm1
0x100124be1: vmulss xmm1, xmm13, xmm1
0x100124be5: vmulss xmm1, xmm10, xmm1
0x100124be9: vmovss dword ptr [r9 + 0x80], xmm1
0x100124bf2: movsx eax, byte ptr [r12]
0x100124bf7: vcvtsi2ss xmm1, xmm13, eax
0x100124bfb: vmulss xmm1, xmm2, xmm1
0x100124bff: vmulss xmm0, xmm13, xmm1
0x100124c03: vmulss xmm0, xmm10, xmm0
0x100124c07: vmovss dword ptr [r8 + 0x80], xmm0
0x100124c10: cmp byte ptr [rdi + 0xbb0], 0
0x100124c17: mov rbx, rdi
0x100124c1a: jne 0x100124c29
0x100124c1c: cmp byte ptr [rbx + 0x1b3], 0
0x100124c23: je 0x10012605a
0x100124c29: vmovaps xmm0, xmmword ptr [rbx + 0x60]
0x100124c2e: vpermilps xmm1, xmm0, 0xd2
0x100124c34: vmulps xmm1, xmm1, xmmword ptr [rip + 0x983464] ; 0x100aa80a0
0x100124c3c: vmulps xmm2, xmm0, xmmword ptr [rip + 0x983dec] ; 0x100aa8a30
0x100124c44: vsubps xmm5, xmm1, xmm2
0x100124c48: vpermilps xmm4, xmm5, 0xd2
0x100124c4e: mov r12, qword ptr [rsp + 0x58]
0x100124c53: mov rax, qword ptr [r12 + 0x288]
0x100124c5b: vaddps xmm0, xmm0, xmmword ptr [rbx + 0x70]
0x100124c60: vsubps xmm0, xmm0, xmm4
0x100124c64: vmulps xmm1, xmm0, xmm0
0x100124c68: vmovshdup xmm2, xmm1
0x100124c6c: vaddss xmm2, xmm1, xmm2
0x100124c70: vpermilpd xmm1, xmm1, 1
0x100124c76: vaddss xmm1, xmm1, xmm2
0x100124c7a: vsqrtss xmm1, xmm1, xmm1
0x100124c7e: vucomiss xmm1, dword ptr [rip + 0x982c3e] ; 0x100aa78c4
0x100124c86: mov r13, qword ptr [rbp + 0x60]
0x100124c8a: jbe 0x100124c96
0x100124c8c: vpermilps xmm1, xmm1, 0xc0
0x100124c92: vdivps xmm0, xmm0, xmm1
0x100124c96: vmulps xmm1, xmm0, xmm0
0x100124c9a: vmovshdup xmm2, xmm1
0x100124c9e: vaddss xmm2, xmm1, xmm2
0x100124ca2: vpermilpd xmm1, xmm1, 1
0x100124ca8: vaddss xmm1, xmm1, xmm2
0x100124cac: vsqrtss xmm1, xmm1, xmm1
0x100124cb0: vucomiss xmm1, dword ptr [rip + 0x982c0c] ; 0x100aa78c4
0x100124cb8: jbe 0x100124cc4
0x100124cba: vpermilps xmm1, xmm1, 0xc0
0x100124cc0: vdivps xmm0, xmm0, xmm1
0x100124cc4: vxorps xmm1, xmm0, xmmword ptr [rip + 0x982c34] ; 0x100aa7900
0x100124ccc: vmulps xmm2, xmm0, xmm0
0x100124cd0: vmovshdup xmm3, xmm2
0x100124cd4: vaddss xmm3, xmm2, xmm3
0x100124cd8: vpermilpd xmm2, xmm2, 1
0x100124cde: vaddss xmm2, xmm2, xmm3
0x100124ce2: vsqrtss xmm2, xmm2, xmm2
0x100124ce6: vucomiss xmm2, dword ptr [rip + 0x982bd6] ; 0x100aa78c4
0x100124cee: jbe 0x100124cfa
0x100124cf0: vpermilps xmm2, xmm2, 0xc0
0x100124cf6: vdivps xmm1, xmm1, xmm2
0x100124cfa: vmulps xmm1, xmm1, xmmword ptr [rip + 0x98698e] ; 0x100aab690
0x100124d02: vmovshdup xmm2, xmm1
0x100124d06: vaddss xmm2, xmm1, xmm2
0x100124d0a: vpermilpd xmm1, xmm1, 1
0x100124d10: vaddss xmm1, xmm1, xmm2
0x100124d14: vaddss xmm1, xmm1, dword ptr [rip + 0x9803a8] ; 0x100aa50c4
0x100124d1c: vandps xmm1, xmm1, xmmword ptr [rip + 0x982bec] ; 0x100aa7910
0x100124d24: vucomiss xmm12, xmm1
0x100124d28: jae 0x100124d94
0x100124d2a: vmulps xmm1, xmm0, xmm14
0x100124d2f: vmovshdup xmm2, xmm1
0x100124d33: vaddss xmm2, xmm1, xmm2
0x100124d37: vpermilpd xmm1, xmm1, 1
0x100124d3d: vaddss xmm1, xmm1, xmm2
0x100124d41: vmovss xmm2, dword ptr [rip + 0x980377] ; 0x100aa50c0
0x100124d49: vaddss xmm1, xmm1, xmm2
0x100124d4d: vaddss xmm1, xmm1, xmm1
0x100124d51: vsqrtss xmm1, xmm1, xmm1
0x100124d55: vdivss xmm2, xmm2, xmm1
0x100124d59: vmovss xmm3, dword ptr [rip + 0x980363] ; 0x100aa50c4
0x100124d61: vmulps xmm3, xmm0, xmm3
0x100124d65: vpermilps xmm0, xmm0, 0xd2
0x100124d6b: vmulps xmm0, xmm0, xmm14
0x100124d70: vsubps xmm0, xmm3, xmm0
0x100124d74: vpermilps xmm0, xmm0, 0xd2
0x100124d7a: vpermilps xmm2, xmm2, 0xc0
0x100124d80: vmulps xmm0, xmm0, xmm2
0x100124d84: vmulss xmm1, xmm1, dword ptr [rip + 0x97f82c] ; 0x100aa45b8
0x100124d8c: vinsertps xmm0, xmm0, xmm1, 0x30
0x100124d92: jmp 0x100124d9c ; 0x100124d9c
0x100124d94: vmovaps xmm0, xmmword ptr [rip + 0x986904] ; 0x100aab6a0
0x100124d9c: vmovaps xmmword ptr [rax + 0x30], xmm0
0x100124da1: vpermilps xmm1, xmm0, 0xe7
0x100124da7: vucomiss xmm1, xmm1
0x100124dab: jp 0x10012bd65
0x100124db1: vmovshdup xmm1, xmm0
0x100124db5: vucomiss xmm0, xmm1
0x100124db9: jp 0x10012bd65
0x100124dbf: vpermilpd xmm0, xmm0, 1
0x100124dc5: vucomiss xmm0, xmm0
0x100124dc9: jp 0x10012bd65
0x100124dcf: mov rax, qword ptr [r12 + 0x290]
0x100124dd7: vmovaps xmm0, xmmword ptr [rbx + 0x60]
0x100124ddc: vaddps xmm0, xmm0, xmmword ptr [rbx + 0x70]
0x100124de1: vaddps xmm0, xmm4, xmm0
0x100124de5: vmulps xmm1, xmm0, xmm0
0x100124de9: vmovshdup xmm2, xmm1
0x100124ded: vaddss xmm2, xmm1, xmm2
0x100124df1: vpermilpd xmm1, xmm1, 1
0x100124df7: vaddss xmm1, xmm1, xmm2
0x100124dfb: vsqrtss xmm1, xmm1, xmm1
0x100124dff: vucomiss xmm1, dword ptr [rip + 0x982abd] ; 0x100aa78c4
0x100124e07: jbe 0x100124e13
0x100124e09: vpermilps xmm1, xmm1, 0xc0
0x100124e0f: vdivps xmm0, xmm0, xmm1
0x100124e13: vmulps xmm1, xmm0, xmm0
0x100124e17: vmovshdup xmm2, xmm1
0x100124e1b: vaddss xmm2, xmm1, xmm2
0x100124e1f: vpermilpd xmm1, xmm1, 1
0x100124e25: vaddss xmm1, xmm1, xmm2
0x100124e29: vsqrtss xmm1, xmm1, xmm1
0x100124e2d: vucomiss xmm1, dword ptr [rip + 0x982a8f] ; 0x100aa78c4
0x100124e35: jbe 0x100124e41
0x100124e37: vpermilps xmm1, xmm1, 0xc0
0x100124e3d: vdivps xmm0, xmm0, xmm1
0x100124e41: vxorps xmm1, xmm0, xmmword ptr [rip + 0x982ab7] ; 0x100aa7900
0x100124e49: vmulps xmm2, xmm0, xmm0
0x100124e4d: vmovshdup xmm3, xmm2
0x100124e51: vaddss xmm3, xmm2, xmm3
0x100124e55: vpermilpd xmm2, xmm2, 1
0x100124e5b: vaddss xmm2, xmm2, xmm3
0x100124e5f: vsqrtss xmm2, xmm2, xmm2
0x100124e63: vucomiss xmm2, dword ptr [rip + 0x982a59] ; 0x100aa78c4
0x100124e6b: jbe 0x100124e77
0x100124e6d: vpermilps xmm2, xmm2, 0xc0
0x100124e73: vdivps xmm1, xmm1, xmm2
0x100124e77: vmulps xmm1, xmm1, xmmword ptr [rip + 0x986811] ; 0x100aab690
0x100124e7f: vmovshdup xmm2, xmm1
0x100124e83: vaddss xmm2, xmm1, xmm2
0x100124e87: vpermilpd xmm1, xmm1, 1
0x100124e8d: vaddss xmm1, xmm1, xmm2
0x100124e91: vaddss xmm1, xmm1, dword ptr [rip + 0x98022b] ; 0x100aa50c4
0x100124e99: vandps xmm1, xmm1, xmmword ptr [rip + 0x982a6f] ; 0x100aa7910
0x100124ea1: vucomiss xmm12, xmm1
0x100124ea5: jae 0x100124f11
0x100124ea7: vmulps xmm1, xmm0, xmm14
0x100124eac: vmovshdup xmm2, xmm1
0x100124eb0: vaddss xmm2, xmm1, xmm2
0x100124eb4: vpermilpd xmm1, xmm1, 1
0x100124eba: vaddss xmm1, xmm1, xmm2
0x100124ebe: vmovss xmm2, dword ptr [rip + 0x9801fa] ; 0x100aa50c0
0x100124ec6: vaddss xmm1, xmm1, xmm2
0x100124eca: vaddss xmm1, xmm1, xmm1
0x100124ece: vsqrtss xmm1, xmm1, xmm1
0x100124ed2: vdivss xmm2, xmm2, xmm1
0x100124ed6: vmovss xmm3, dword ptr [rip + 0x9801e6] ; 0x100aa50c4
0x100124ede: vmulps xmm3, xmm0, xmm3
0x100124ee2: vpermilps xmm0, xmm0, 0xd2
0x100124ee8: vmulps xmm0, xmm0, xmm14
0x100124eed: vsubps xmm0, xmm3, xmm0
0x100124ef1: vpermilps xmm0, xmm0, 0xd2
0x100124ef7: vpermilps xmm2, xmm2, 0xc0
0x100124efd: vmulps xmm0, xmm0, xmm2
0x100124f01: vmulss xmm1, xmm1, dword ptr [rip + 0x97f6af] ; 0x100aa45b8
0x100124f09: vinsertps xmm0, xmm0, xmm1, 0x30
0x100124f0f: jmp 0x100124f19 ; 0x100124f19
0x100124f11: vmovaps xmm0, xmmword ptr [rip + 0x986787] ; 0x100aab6a0
0x100124f19: vmovaps xmmword ptr [rsp + 0x30], xmm5
0x100124f1f: vmovaps xmmword ptr [rsp + 0x10], xmm4
0x100124f25: vmovaps xmmword ptr [rax + 0x30], xmm0
0x100124f2a: vpermilps xmm1, xmm0, 0xe7
0x100124f30: vucomiss xmm1, xmm1
0x100124f34: jp 0x10012bd65
0x100124f3a: vmovshdup xmm1, xmm0
0x100124f3e: vucomiss xmm0, xmm1
0x100124f42: jp 0x10012bd65
0x100124f48: vpermilpd xmm0, xmm0, 1
0x100124f4e: vucomiss xmm0, xmm0
0x100124f52: jp 0x10012bd65
0x100124f58: lea rdi, [rsp + 0x580]
0x100124f60: mov rsi, rbx
0x100124f63: call 0x1001477a0 ; 0x1001477a0
0x100124f68: vmovaps xmm0, xmmword ptr [rsp + 0x580]
0x100124f71: vmulps xmm0, xmm0, xmm0
0x100124f75: vmovshdup xmm1, xmm0
0x100124f79: vaddss xmm1, xmm0, xmm1
0x100124f7d: vpermilpd xmm0, xmm0, 1
0x100124f83: vaddss xmm0, xmm0, xmm1
0x100124f87: vsqrtss xmm0, xmm0, xmm0
0x100124f8b: lea rax, [rip + 0x99c80a] ; 0x100ac179c
0x100124f92: vminss xmm0, xmm0, dword ptr [rax]
0x100124f96: lea rax, [rsp + 0x330]
0x100124f9e: mov qword ptr [rsp + 0x338], rax
0x100124fa6: mov dword ptr [rsp + 0x330], 0
0x100124fb1: vmovss xmm1, dword ptr [rbx + 0x14]
0x100124fb6: vbroadcastss xmm2, dword ptr [rbx + 0x134]
0x100124fbf: vxorps xmm3, xmm3, xmm3
0x100124fc3: vmaxss xmm2, xmm3, xmm2
0x100124fc7: vsubss xmm1, xmm1, xmm2
0x100124fcb: vandps xmm1, xmm1, xmmword ptr [rip + 0x98293d] ; 0x100aa7910
0x100124fd3: vmulss xmm1, xmm1, dword ptr [rip + 0x9827f5] ; 0x100aa77d0
0x100124fdb: vaddss xmm1, xmm1, dword ptr [rip + 0x9800dd] ; 0x100aa50c0
0x100124fe3: vmaxss xmm1, xmm3, xmm1
0x100124fe7: vmulss xmm1, xmm1, xmm1
0x100124feb: vmulss xmm5, xmm0, xmm1
0x100124fef: cmp byte ptr [rbx + 0x1b3], 0
0x100124ff6: jne 0x100125005
0x100124ff8: cmp byte ptr [rbx + 0x1b4], 0
0x100124fff: je 0x100126098
0x100125005: mov rax, qword ptr [rbp + 0x38]
0x100125009: cmp byte ptr [rax + 0x1391], 0
0x100125010: je 0x10012505d
0x100125012: vmovaps xmm0, xmmword ptr [rip + 0x9866c6] ; 0x100aab6e0
0x10012501a: vmovaps xmmword ptr [rsp + 0xb0], xmm0
0x100125023: lea rdi, [rsp + 0x580]
0x10012502b: lea rsi, [rsp + 0xb0]
0x100125033: vmovss xmm0, dword ptr [rip + 0x98357d] ; 0x100aa85b8
0x10012503b: vmovss dword ptr [rsp + 0x140], xmm5
0x100125044: call 0x10077d310 ; 0x10077d310
0x100125049: vmovss xmm5, dword ptr [rsp + 0x140]
0x100125052: vmovaps xmm0, xmmword ptr [rsp + 0x580]
0x10012505b: jmp 0x100125068 ; 0x100125068
0x10012505d: lea rax, [rip + 0x1f1a64c] ; 0x10203f6b0
0x100125064: vmovaps xmm0, xmmword ptr [rax]
0x100125068: mov rax, qword ptr [r12 + 0x288]
0x100125070: vmovaps xmmword ptr [rax + 0x120], xmm0
0x100125078: vmovaps xmmword ptr [rax + 0x110], xmm0
0x100125080: mov rax, qword ptr [r12 + 0x290]
0x100125088: vmovaps xmmword ptr [rax + 0x120], xmm0
0x100125090: vmovaps xmmword ptr [rax + 0x110], xmm0
0x100125098: vmovaps xmm1, xmmword ptr [rsp + 0x10]
0x10012509e: vmovdqa xmm4, xmmword ptr [rsp + 0x30]
0x1001250a4: vmovaps xmm0, xmmword ptr [rbx + 0x70]
0x1001250a9: vmovaps xmm6, xmmword ptr [rbx + 0x130]
0x1001250b1: vmulps xmm1, xmm1, xmm0
0x1001250b5: vmovshdup xmm2, xmm1
0x1001250b9: vaddss xmm2, xmm1, xmm2
0x1001250bd: vpermilpd xmm1, xmm1, 1
0x1001250c3: vaddss xmm1, xmm1, xmm2
0x1001250c7: vmovss xmm2, dword ptr [rip + 0x97f4e9] ; 0x100aa45b8
0x1001250cf: vmulss xmm1, xmm1, xmm2
0x1001250d3: vmovss xmm3, dword ptr [rip + 0x97ffe5] ; 0x100aa50c0
0x1001250db: vaddss xmm1, xmm1, xmm3
0x1001250df: vmulss xmm1, xmm5, xmm1
0x1001250e3: vmovss dword ptr [rsp + 0x30], xmm1
0x1001250e9: vpxor xmm1, xmm4, xmmword ptr [rip + 0x98280f] ; 0x100aa7900
0x1001250f1: vpshufd xmm1, xmm1, 0xd2
0x1001250f6: vmovdqa xmmword ptr [rsp + 0x130], xmm1
0x1001250ff: vmulps xmm0, xmm1, xmm0
0x100125103: vmovshdup xmm1, xmm0
0x100125107: vaddss xmm1, xmm0, xmm1
0x10012510b: vpermilpd xmm0, xmm0, 1
0x100125111: vaddss xmm0, xmm0, xmm1
0x100125115: vmulss xmm0, xmm0, xmm2
0x100125119: vaddss xmm0, xmm0, xmm3
0x10012511d: vmulss xmm0, xmm5, xmm0
0x100125121: vmovss dword ptr [rsp + 0x140], xmm0
0x10012512a: vmulss xmm0, xmm5, dword ptr [rip + 0x9834a6] ; 0x100aa85d8
0x100125132: vmovaps xmmword ptr [rsp + 0x120], xmm0
0x10012513b: vmovaps xmmword ptr [rsp + 0xc0], xmm6
0x100125144: vmovaps xmmword ptr [rsp + 0x4c0], xmm6
0x10012514d: lea rsi, [rsp + 0x4c0]
0x100125155: mov rdi, qword ptr [rbp + 0x38]
0x100125159: call 0x1004d6680 ; 0x1004d6680
0x10012515e: vxorps xmm1, xmm1, xmm1
0x100125162: vucomiss xmm0, xmm1
0x100125166: jbe 0x100125185
0x100125168: vmovaps xmm2, xmmword ptr [rsp + 0xc0]
0x100125171: vmovshdup xmm1, xmm2
0x100125175: vaddss xmm0, xmm1, xmm0
0x100125179: vinsertps xmm2, xmm2, xmm0, 0x10
0x10012517f: vmovaps xmm4, xmm2
0x100125183: jmp 0x10012518e ; 0x10012518e
0x100125185: vmovaps xmm4, xmmword ptr [rsp + 0xc0]
0x10012518e: mov rax, qword ptr [r12 + 0x288]
0x100125196: vpermilps xmm0, xmmword ptr [rsp + 0x120], 0xc0
0x1001251a1: vmovaps xmm1, xmmword ptr [rsp + 0x10]
0x1001251a7: vmulps xmm0, xmm1, xmm0
0x1001251ab: vmulps xmm1, xmm1, xmmword ptr [rbx + 0x70]
0x1001251b0: vmovshdup xmm2, xmm1
0x1001251b4: vaddss xmm2, xmm1, xmm2
0x1001251b8: vpermilpd xmm1, xmm1, 1
0x1001251be: vaddss xmm1, xmm1, xmm2
0x1001251c2: vmovss xmm2, dword ptr [rip + 0x97f3ee] ; 0x100aa45b8
0x1001251ca: vmovaps xmm3, xmm2
0x1001251ce: vmulss xmm1, xmm1, xmm3
0x1001251d2: vmovss xmm2, dword ptr [rip + 0x97fee6] ; 0x100aa50c0
0x1001251da: vmovaps xmm5, xmm2
0x1001251de: vaddss xmm1, xmm1, xmm5
0x1001251e2: vpermilps xmm1, xmm1, 0xc0
0x1001251e8: vmulps xmm1, xmm0, xmm1
0x1001251ec: vsubps xmm1, xmm4, xmm1
0x1001251f0: vmovaps xmmword ptr [rax + 0x20], xmm1
0x1001251f5: mov rax, qword ptr [r12 + 0x290]
0x1001251fd: vmovaps xmm1, xmmword ptr [rsp + 0x130]
0x100125206: vmulps xmm1, xmm1, xmmword ptr [rbx + 0x70]
0x10012520b: vmovshdup xmm2, xmm1
0x10012520f: vaddss xmm2, xmm1, xmm2
0x100125213: vpermilpd xmm1, xmm1, 1
0x100125219: vaddss xmm1, xmm1, xmm2
0x10012521d: vmulss xmm1, xmm1, xmm3
0x100125221: vaddss xmm1, xmm1, xmm5
0x100125225: vpermilps xmm1, xmm1, 0xc0
0x10012522b: vmulps xmm0, xmm0, xmm1
0x10012522f: vaddps xmm0, xmm4, xmm0
0x100125233: vmovaps xmmword ptr [rax + 0x20], xmm0
0x100125238: mov rax, qword ptr [r12 + 0x288]
0x100125240: vmovss xmm0, dword ptr [rsp + 0x30]
0x100125246: vmovss dword ptr [rax + 0x80], xmm0
0x10012524e: vmovss dword ptr [rax + 0x84], xmm0
0x100125256: vmovss dword ptr [rax + 0x9c], xmm0
0x10012525e: vmovss dword ptr [rax + 0x90], xmm0
0x100125266: mov rax, qword ptr [r12 + 0x290]
0x10012526e: vmovss xmm0, dword ptr [rsp + 0x140]
0x100125277: vmovss dword ptr [rax + 0x80], xmm0
0x10012527f: vmovss dword ptr [rax + 0x84], xmm0
0x100125287: vmovss dword ptr [rax + 0x9c], xmm0
0x10012528f: vmovss dword ptr [rax + 0x90], xmm0
0x100125297: mov rax, qword ptr [rsp + 0xd0]
0x10012529f: vmovss xmm0, dword ptr [rax + 0x88]
0x1001252a7: vmovss xmm1, dword ptr [rax + 0x8c]
0x1001252af: vcmpunordss xmm2, xmm1, xmm1
0x1001252b4: vmaxss xmm1, xmm0, xmm1
0x1001252b8: vblendvps xmm0, xmm1, xmm0, xmm2
0x1001252be: vdivss xmm0, xmm0, dword ptr [rip + 0x982526] ; 0x100aa77ec
0x1001252c6: vxorps xmm1, xmm1, xmm1
0x1001252ca: vmaxss xmm0, xmm1, xmm0
0x1001252ce: vminss xmm0, xmm5, xmm0
0x1001252d2: vmovss dword ptr [rsp + 0x10], xmm0
0x1001252d8: vmovss xmm1, dword ptr [r12 + 0x1034]
0x1001252e2: vmovss dword ptr [rsp + 0x30], xmm1
0x1001252e8: xor eax, eax
0x1001252ea: vucomiss xmm0, xmm1
0x1001252ee: seta al
0x1001252f1: lea rcx, [rip + 0x986570] ; 0x100aab868
0x1001252f8: vmovss xmm0, dword ptr [rcx + rax*4]
0x1001252fd: call 0x100aa2858 ; 0x100aa2858 _logf
0x100125302: vcvtss2sd xmm0, xmm0, xmm0
0x100125306: vdivsd xmm0, xmm0, qword ptr [rip + 0x9833b2] ; 0x100aa86c0
0x10012530e: vcvtsd2ss xmm0, xmm0, xmm0
0x100125312: vmulss xmm0, xmm0, dword ptr [rsp + 0x60]
0x100125318: call 0x100aa2708 ; 0x100aa2708 _expf
0x10012531d: vmovss xmm2, dword ptr [rip + 0x97fd9b] ; 0x100aa50c0
0x100125325: vsubss xmm0, xmm2, xmm0
0x100125329: vxorps xmm1, xmm1, xmm1
0x10012532d: vmaxss xmm0, xmm1, xmm0
0x100125331: vminss xmm0, xmm2, xmm0
0x100125335: vsubss xmm1, xmm2, xmm0
0x100125339: vmulss xmm1, xmm1, dword ptr [rsp + 0x30]
0x10012533f: vmulss xmm0, xmm0, dword ptr [rsp + 0x10]
0x100125345: vaddss xmm0, xmm0, xmm1
0x100125349: vmovss dword ptr [r12 + 0x1034], xmm0
0x100125353: vxorps xmm0, xmm0, xmm0
0x100125357: vmovaps xmmword ptr [rsp + 0x30], xmm0
0x10012535d: xor ebx, ebx
0x10012535f: vxorps xmm4, xmm4, xmm4
0x100125363: nop word ptr cs:[rax + rax]
0x100125370: vmovaps xmmword ptr [rsp + 0x10], xmm4
0x100125376: mov rdi, qword ptr [rbp + 0x58]
0x10012537a: mov esi, ebx
0x10012537c: call 0x1001031d0 ; 0x1001031d0
0x100125381: mov r15, rax
0x100125384: mov rdi, r15
0x100125387: call 0x1000fe050 ; 0x1000fe050
0x10012538c: test al, al
0x10012538e: je 0x10012539c
0x100125390: mov rdi, r15
0x100125393: call 0x100100330 ; 0x100100330
0x100125398: test al, al
0x10012539a: je 0x1001253c0
0x10012539c: mov r15, qword ptr [rsp + 0x90]
0x1001253a4: vmovaps xmm4, xmmword ptr [rsp + 0x10]
0x1001253aa: inc ebx
0x1001253ac: cmp ebx, 0x10
0x1001253af: jne 0x100125370
0x1001253b1: jmp 0x1001254b9 ; 0x1001254b9
0x1001253b6: nop word ptr cs:[rax + rax]
0x1001253c0: cmp r15, qword ptr [rsp + 0x88]
0x1001253c8: vmovaps xmm4, xmmword ptr [rsp + 0x10]
0x1001253ce: je 0x1001254a6
0x1001253d4: movzx eax, byte ptr [r15 + 0x21b0]
0x1001253dc: test al, al
0x1001253de: jne 0x1001254a6
0x1001253e4: mov rcx, qword ptr [rsp + 0x88]
0x1001253ec: cmp byte ptr [rcx + 0x1ef8], 0
0x1001253f3: jne 0x100125403
0x1001253f5: cmp byte ptr [r15 + 0x1ef8], 0
0x1001253fd: je 0x1001254a6
0x100125403: mov rax, qword ptr [r15 + 0x18]
0x100125407: mov rcx, qword ptr [rcx + 0x18]
0x10012540b: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x100125410: vsubps xmm0, xmm0, xmmword ptr [rcx + 0x10]
0x100125415: vmulps xmm1, xmm0, xmm0
0x100125419: vmovshdup xmm2, xmm1
0x10012541d: vaddss xmm2, xmm1, xmm2
0x100125421: vpermilpd xmm1, xmm1, 1
0x100125427: vaddss xmm1, xmm1, xmm2
0x10012542b: vsqrtss xmm3, xmm1, xmm1
0x10012542f: vaddss xmm1, xmm3, dword ptr [rip + 0x983db9] ; 0x100aa91f0
0x100125437: vdivss xmm1, xmm1, dword ptr [rip + 0x9863b5] ; 0x100aab7f4
0x10012543f: vxorps xmm2, xmm2, xmm2
0x100125443: vmaxss xmm1, xmm2, xmm1
0x100125447: vmovss xmm2, dword ptr [rip + 0x97fc71] ; 0x100aa50c0
0x10012544f: vminss xmm1, xmm2, xmm1
0x100125453: vmulss xmm2, xmm1, dword ptr [rip + 0x984195] ; 0x100aa95f0
0x10012545b: vmulss xmm1, xmm2, xmm2
0x10012545f: vucomiss xmm3, dword ptr [rip + 0x98245d] ; 0x100aa78c4
0x100125467: jbe 0x100125473
0x100125469: vpermilps xmm3, xmm3, 0xc0
0x10012546f: vdivps xmm0, xmm0, xmm3
0x100125473: mov r15, qword ptr [rsp + 0x90]
0x10012547b: vaddss xmm4, xmm4, xmm2
0x10012547f: vpermilps xmm1, xmm1, 0xc0
0x100125485: vmulps xmm0, xmm1, xmm0
0x100125489: vmovaps xmm1, xmmword ptr [rsp + 0x30]
0x10012548f: vaddps xmm1, xmm1, xmm0
0x100125493: vmovaps xmmword ptr [rsp + 0x30], xmm1
0x100125499: inc ebx
0x10012549b: cmp ebx, 0x10
0x10012549e: jne 0x100125370
0x1001254a4: jmp 0x1001254b9 ; 0x1001254b9
0x1001254a6: mov r15, qword ptr [rsp + 0x90]
0x1001254ae: inc ebx
0x1001254b0: cmp ebx, 0x10
0x1001254b3: jne 0x100125370
0x1001254b9: vxorps xmm0, xmm0, xmm0
0x1001254bd: vucomiss xmm4, xmm0
0x1001254c1: jbe 0x1001254d9
0x1001254c3: vpermilps xmm1, xmm4, 0xc0
0x1001254c9: vmovaps xmm2, xmmword ptr [rsp + 0x30]
0x1001254cf: vdivps xmm2, xmm2, xmm1
0x1001254d3: vmovaps xmmword ptr [rsp + 0x30], xmm2
0x1001254d9: mov rbx, qword ptr [rsp + 0x40]
0x1001254de: vmovaps xmm2, xmmword ptr [rsp + 0x60]
0x1001254e4: vmovss xmm1, dword ptr [r12 + 0x1034]
0x1001254ee: vmovss dword ptr [rsp + 0x10], xmm1
0x1001254f4: vmaxss xmm0, xmm0, xmm1
0x1001254f8: vmovss xmm1, dword ptr [rip + 0x97fbc0] ; 0x100aa50c0
0x100125500: vminss xmm0, xmm1, xmm0
0x100125504: vsubss xmm3, xmm1, xmm0
0x100125508: vmulss xmm3, xmm3, dword ptr [rip + 0x983cdc] ; 0x100aa91ec
0x100125510: vmulss xmm0, xmm0, dword ptr [rip + 0x9862e0] ; 0x100aab7f8
0x100125518: vaddss xmm0, xmm0, xmm3
0x10012551c: vmulss xmm0, xmm0, dword ptr [rip + 0x9830ac] ; 0x100aa85d0
0x100125524: vmulss xmm0, xmm2, xmm0
0x100125528: vaddss xmm0, xmm0, dword ptr [r12 + 0x1030]
0x100125532: call 0x100aa2744 ; 0x100aa2744 _fmodf
0x100125537: vmovss dword ptr [r12 + 0x1030], xmm0
0x100125541: mov rax, qword ptr [rsp + 0x88]
0x100125549: cmp byte ptr [rax + 0x1ef8], 0
0x100125550: jne 0x100125581
0x100125552: mov rdi, qword ptr [rbp + 0x58]
0x100125556: call 0x1000fc260 ; 0x1000fc260
0x10012555b: mov rax, qword ptr [rax + 0x60]
0x10012555f: mov eax, dword ptr [rax + 0x1030]
0x100125565: mov dword ptr [r12 + 0x1030], eax
0x10012556d: vmovd xmm0, eax
0x100125571: vmovss xmm1, dword ptr [r12 + 0x1034]
0x10012557b: vmovss dword ptr [rsp + 0x10], xmm1
0x100125581: vmulss xmm0, xmm0, dword ptr [rip + 0x98342f] ; 0x100aa89b8
0x100125589: call 0x100aa2bca ; 0x100aa2bca _sinf
0x10012558e: vmulss xmm0, xmm0, dword ptr [rip + 0x98305e] ; 0x100aa85f4
0x100125596: vaddss xmm0, xmm0, dword ptr [rip + 0x97f01a] ; 0x100aa45b8
0x10012559e: vxorps xmm2, xmm2, xmm2
0x1001255a2: vmaxss xmm0, xmm2, xmm0
0x1001255a6: vmovss xmm1, dword ptr [rip + 0x97fb12] ; 0x100aa50c0
0x1001255ae: vminss xmm0, xmm1, xmm0
0x1001255b2: vmulss xmm0, xmm0, dword ptr [rip + 0x983012] ; 0x100aa85cc
0x1001255ba: vaddss xmm0, xmm0, dword ptr [rip + 0x98300e] ; 0x100aa85d0
0x1001255c2: vmovss xmm3, dword ptr [rsp + 0x10]
0x1001255c8: vmulss xmm0, xmm3, xmm0
0x1001255cc: vmovss dword ptr [r12 + 0x1014], xmm0
0x1001255d6: vmovaps xmm1, xmmword ptr [rsp + 0x30]
0x1001255dc: vmulps xmm1, xmm1, xmmword ptr [rip + 0x98610c] ; 0x100aab6f0
0x1001255e4: vmovaps xmmword ptr [r12 + 0x1020], xmm1
0x1001255ee: mov rax, qword ptr [rsp + 0xd0]
0x1001255f6: vmovss xmm1, dword ptr [rax + 8]
0x1001255fb: vucomiss xmm1, dword ptr [rip + 0x98572d] ; 0x100aaad30
0x100125603: vmovaps xmm1, xmm3
0x100125607: jbe 0x1001256f1
0x10012560d: mov rax, qword ptr [rsp + 0x88]
0x100125615: mov rax, qword ptr [rax + 0x10]
0x100125619: cmp byte ptr [rax + 0x1b0], 0
0x100125620: jne 0x1001256f1
0x100125626: vmulss xmm1, xmm1, dword ptr [rip + 0x983002] ; 0x100aa8630
0x10012562e: vxorps xmm2, xmm2, xmm2
0x100125632: vmaxss xmm1, xmm2, xmm1
0x100125636: vmovss xmm3, dword ptr [rip + 0x97fa82] ; 0x100aa50c0
0x10012563e: vminss xmm1, xmm3, xmm1
0x100125642: vsubss xmm4, xmm3, xmm1
0x100125646: vmulss xmm0, xmm1, xmm0
0x10012564a: vaddss xmm0, xmm4, xmm0
0x10012564e: mov rax, qword ptr [rsp + 0xd0]
0x100125656: vmulss xmm0, xmm0, dword ptr [rax + 0x48]
0x10012565b: vmovss dword ptr [rsp + 0x10], xmm0
0x100125661: vmovss xmm0, dword ptr [rax + 0x20]
0x100125666: vmulss xmm0, xmm0, dword ptr [rip + 0x982ff2] ; 0x100aa8660
0x10012566e: vmaxss xmm0, xmm2, xmm0
0x100125672: vminss xmm0, xmm3, xmm0
0x100125676: lea rax, [rip + 0x1edec73] ; 0x1020042f0
0x10012567d: vmovaps xmm1, xmmword ptr [rax]
0x100125681: lea rax, [rip + 0x1edec48] ; 0x1020042d0
0x100125688: vmovaps xmm2, xmmword ptr [rax]
0x10012568c: vsubps xmm1, xmm1, xmm2
0x100125690: vpermilps xmm0, xmm0, 0
0x100125696: vmulps xmm0, xmm1, xmm0
0x10012569a: vaddps xmm0, xmm2, xmm0
0x10012569e: vmovaps xmmword ptr [rsp + 0x600], xmm0
0x1001256a7: mov rax, qword ptr [rsp + 0x28]
0x1001256ac: mov rsi, qword ptr [rax + 0x368]
0x1001256b3: lea rbx, [rsp + 0x580]
0x1001256bb: mov rdi, rbx
0x1001256be: call 0x1007f26b0 ; 0x1007f26b0
0x1001256c3: lea rsi, [rsp + 0x600]
0x1001256cb: vmovss xmm0, dword ptr [rip + 0x982119] ; 0x100aa77ec
0x1001256d3: vxorps xmm2, xmm2, xmm2
0x1001256d7: mov rdi, r13
0x1001256da: mov rdx, rbx
0x1001256dd: mov rbx, qword ptr [rsp + 0x40]
0x1001256e2: vmovss xmm1, dword ptr [rsp + 0x10]
0x1001256e8: call 0x100416140 ; 0x100416140
0x1001256ed: vxorps xmm2, xmm2, xmm2
0x1001256f1: vmaxss xmm0, xmm2, dword ptr [rbx + 0x1c0]
0x1001256f9: vmovss xmm1, dword ptr [rip + 0x97f9bf] ; 0x100aa50c0
0x100125701: vminss xmm0, xmm1, xmm0
0x100125705: vucomiss xmm0, xmm2
0x100125709: jbe 0x100125780
0x10012570b: mov rax, qword ptr [rsp + 0x28]
0x100125710: mov rsi, qword ptr [rax + 0x368]
0x100125717: lea rbx, [rsp + 0x600]
0x10012571f: mov rdi, rbx
0x100125722: call 0x1007f26b0 ; 0x1007f26b0
0x100125727: vxorps xmm0, xmm0, xmm0
0x10012572b: mov rax, qword ptr [rsp + 0x40]
0x100125730: vmaxss xmm0, xmm0, dword ptr [rax + 0x1c0]
0x100125738: vmovss xmm1, dword ptr [rip + 0x97f980] ; 0x100aa50c0
0x100125740: vminss xmm0, xmm1, xmm0
0x100125744: vmulss xmm1, xmm0, xmm0
0x100125748: vmovaps xmm0, xmmword ptr [rip + 0x985fb0] ; 0x100aab700
0x100125750: vmovaps xmmword ptr [rsp + 0x580], xmm0
0x100125759: vmulss xmm0, xmm1, dword ptr [rip + 0x97ee57] ; 0x100aa45b8
0x100125761: vmulss xmm1, xmm1, dword ptr [rip + 0x982073] ; 0x100aa77dc
0x100125769: lea rsi, [rsp + 0x580]
0x100125771: vxorps xmm2, xmm2, xmm2
0x100125775: mov rdi, r13
0x100125778: mov rdx, rbx
0x10012577b: call 0x100416140 ; 0x100416140
0x100125780: mov r14, qword ptr [rsp + 0x28]
0x100125785: vmovss xmm0, dword ptr [r14 + 0x30]
0x10012578b: vmovss dword ptr [rsp + 0x30], xmm0
0x100125791: cmp byte ptr [r12 + 0x1048], 0
0x10012579a: jne 0x100125811
0x10012579c: mov rax, qword ptr [rsp + 0x88]
0x1001257a4: mov rdi, qword ptr [rax + 0x80]
0x1001257ab: lea rsi, [rsp + 0x600]
0x1001257b3: lea rcx, [rsp + 0x580]
0x1001257bb: mov edx, 0x40
0x1001257c0: call 0x1001149e0 ; 0x1001149e0
0x1001257c5: cmp dword ptr [rsp + 0x580], 0
0x1001257cd: je 0x10012580c
0x1001257cf: xor ebx, ebx
0x1001257d1: nop word ptr cs:[rax + rax]
0x1001257e0: mov eax, ebx
0x1001257e2: shl rax, 5
0x1001257e6: lea rsi, [rsp + rax + 0x600]
0x1001257ee: vmovss xmm0, dword ptr [rsp + rax + 0x610]
0x1001257f7: xor edx, edx
0x1001257f9: mov rdi, r13
0x1001257fc: call 0x1004162e0 ; 0x1004162e0
0x100125801: inc ebx
0x100125803: cmp ebx, dword ptr [rsp + 0x580]
0x10012580a: jb 0x1001257e0
0x10012580c: mov r14, qword ptr [rsp + 0x28]
0x100125811: mov rbx, qword ptr [r12 + 0x2b0]
0x100125819: mov dword ptr [rbx + 0x94], 0x3f800000
0x100125823: mov rsi, qword ptr [r14 + 0x288]
0x10012582a: lea rdi, [rsp + 0x4b0]
0x100125832: call 0x1007f26b0 ; 0x1007f26b0
0x100125837: mov byte ptr [rbx + 0x188], 1
0x10012583e: mov byte ptr [rbx + 0xae], 1
0x100125845: vmovaps xmm0, xmmword ptr [rsp + 0x4b0]
0x10012584e: vmovaps xmmword ptr [rbx + 0x160], xmm0
0x100125856: mov rbx, qword ptr [r12 + 0x2b0]
0x10012585e: mov rsi, qword ptr [r14 + 0x288]
0x100125865: lea rdi, [rsp + 0x4a0]
0x10012586d: call 0x1007f26b0 ; 0x1007f26b0
0x100125872: vmovaps xmm0, xmmword ptr [rsp + 0x4a0]
0x10012587b: vsubps xmm0, xmm0, xmmword ptr [r12 + 0x30]
0x100125882: vmulps xmm1, xmm0, xmm0
0x100125886: vmovshdup xmm2, xmm1
0x10012588a: vaddss xmm2, xmm1, xmm2
0x10012588e: vpermilpd xmm1, xmm1, 1
0x100125894: vaddss xmm1, xmm1, xmm2
0x100125898: vsqrtss xmm1, xmm1, xmm1
0x10012589c: vucomiss xmm1, dword ptr [rip + 0x982020] ; 0x100aa78c4
0x1001258a4: jbe 0x1001258b0
0x1001258a6: vpermilps xmm1, xmm1, 0xc0
0x1001258ac: vdivps xmm0, xmm0, xmm1
0x1001258b0: mov r13, qword ptr [rsp + 0x88]
0x1001258b8: vmovss xmm4, dword ptr [rip + 0x982004] ; 0x100aa78c4
0x1001258c0: vmovaps xmm5, xmmword ptr [rip + 0x985dc8] ; 0x100aab690
0x1001258c8: vmulps xmm1, xmm0, xmm0
0x1001258cc: vmovshdup xmm2, xmm1
0x1001258d0: vaddss xmm2, xmm1, xmm2
0x1001258d4: vpermilpd xmm1, xmm1, 1
0x1001258da: vaddss xmm1, xmm1, xmm2
0x1001258de: vsqrtss xmm1, xmm1, xmm1
0x1001258e2: vucomiss xmm1, dword ptr [rip + 0x981fda] ; 0x100aa78c4
0x1001258ea: jbe 0x1001258f6
0x1001258ec: vpermilps xmm1, xmm1, 0xc0
0x1001258f2: vdivps xmm0, xmm0, xmm1
0x1001258f6: vxorps xmm1, xmm0, xmmword ptr [rip + 0x982002] ; 0x100aa7900
0x1001258fe: vmulps xmm2, xmm0, xmm0
0x100125902: vmovshdup xmm3, xmm2
0x100125906: vaddss xmm3, xmm2, xmm3
0x10012590a: vpermilpd xmm2, xmm2, 1
0x100125910: vaddss xmm2, xmm2, xmm3
0x100125914: vsqrtss xmm2, xmm2, xmm2
0x100125918: vucomiss xmm2, dword ptr [rip + 0x981fa4] ; 0x100aa78c4
0x100125920: jbe 0x10012592c
0x100125922: vpermilps xmm2, xmm2, 0xc0
0x100125928: vdivps xmm1, xmm1, xmm2
0x10012592c: vmulps xmm1, xmm1, xmmword ptr [rip + 0x985d5c] ; 0x100aab690
0x100125934: vmovshdup xmm2, xmm1
0x100125938: vaddss xmm2, xmm1, xmm2
0x10012593c: vpermilpd xmm1, xmm1, 1
0x100125942: vaddss xmm1, xmm1, xmm2
0x100125946: vaddss xmm1, xmm1, dword ptr [rip + 0x97f776] ; 0x100aa50c4
0x10012594e: vandps xmm1, xmm1, xmmword ptr [rip + 0x981fba] ; 0x100aa7910
0x100125956: vucomiss xmm4, xmm1
0x10012595a: jae 0x1001259c4
0x10012595c: vmulps xmm1, xmm0, xmm5
0x100125960: vmovshdup xmm2, xmm1
0x100125964: vaddss xmm2, xmm1, xmm2
0x100125968: vpermilpd xmm1, xmm1, 1
0x10012596e: vaddss xmm1, xmm1, xmm2
0x100125972: vmovss xmm2, dword ptr [rip + 0x97f746] ; 0x100aa50c0
0x10012597a: vaddss xmm1, xmm1, xmm2
0x10012597e: vaddss xmm1, xmm1, xmm1
0x100125982: vsqrtss xmm1, xmm1, xmm1
0x100125986: vdivss xmm2, xmm2, xmm1
0x10012598a: vmovss xmm3, dword ptr [rip + 0x97f732] ; 0x100aa50c4
0x100125992: vmulps xmm3, xmm0, xmm3
0x100125996: vpermilps xmm0, xmm0, 0xd2
0x10012599c: vmulps xmm0, xmm0, xmm5
0x1001259a0: vsubps xmm0, xmm3, xmm0
0x1001259a4: vpermilps xmm0, xmm0, 0xd2
0x1001259aa: vpermilps xmm2, xmm2, 0xc0
0x1001259b0: vmulps xmm0, xmm0, xmm2
0x1001259b4: vmulss xmm1, xmm1, dword ptr [rip + 0x97ebfc] ; 0x100aa45b8
0x1001259bc: vinsertps xmm0, xmm0, xmm1, 0x30
0x1001259c2: jmp 0x1001259cc ; 0x1001259cc
0x1001259c4: vmovaps xmm0, xmmword ptr [rip + 0x985cd4] ; 0x100aab6a0
0x1001259cc: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x1001259d1: vpermilps xmm1, xmm0, 0xe7
0x1001259d7: vucomiss xmm1, xmm1
0x1001259db: jp 0x10012bd65
0x1001259e1: vmovshdup xmm1, xmm0
0x1001259e5: vucomiss xmm0, xmm1
0x1001259e9: jp 0x10012bd65
0x1001259ef: vpermilpd xmm0, xmm0, 1
0x1001259f5: vucomiss xmm0, xmm0
0x1001259f9: jp 0x10012bd65
0x1001259ff: vmovaps xmm0, xmmword ptr [r12 + 0x30]
0x100125a06: vmulps xmm0, xmm0, xmm0
0x100125a0a: vmovshdup xmm1, xmm0
0x100125a0e: vaddss xmm1, xmm0, xmm1
0x100125a12: vpermilpd xmm0, xmm0, 1
0x100125a18: vaddss xmm1, xmm0, xmm1
0x100125a1c: vxorps xmm0, xmm0, xmm0
0x100125a20: vucomiss xmm1, xmm0
0x100125a24: jbe 0x100125c13
0x100125a2a: vmovss xmm1, dword ptr [r12 + 0x40]
0x100125a31: vaddss xmm1, xmm1, dword ptr [rip + 0x982be7] ; 0x100aa8620
0x100125a39: vdivss xmm1, xmm1, dword ptr [rip + 0x985dbb] ; 0x100aab7fc
0x100125a41: vmaxss xmm0, xmm0, xmm1
0x100125a45: vmovss xmm1, dword ptr [rip + 0x97f673] ; 0x100aa50c0
0x100125a4d: vminss xmm0, xmm1, xmm0
0x100125a51: mov rax, qword ptr [r12 + 0x2b0]
0x100125a59: vmovss dword ptr [rax + 0x80], xmm0
0x100125a61: vmovaps xmm0, xmmword ptr [r12 + 0x30]
0x100125a68: vmovaps xmmword ptr [rax + 0x20], xmm0
0x100125a6d: mov rbx, qword ptr [r12 + 0x2b0]
0x100125a75: mov r14, qword ptr [rsp + 0x28]
0x100125a7a: mov rsi, qword ptr [r14 + 0x288]
0x100125a81: lea rdi, [rsp + 0x490]
0x100125a89: call 0x1007f26b0 ; 0x1007f26b0
0x100125a8e: mov byte ptr [rbx + 0x188], 1
0x100125a95: mov byte ptr [rbx + 0xae], 1
0x100125a9c: vmovaps xmm0, xmmword ptr [rsp + 0x490]
0x100125aa5: vmovaps xmmword ptr [rbx + 0x160], xmm0
0x100125aad: mov rbx, qword ptr [r12 + 0x2b0]
0x100125ab5: mov rsi, qword ptr [r14 + 0x288]
0x100125abc: lea rdi, [rsp + 0x480]
0x100125ac4: call 0x1007f26b0 ; 0x1007f26b0
0x100125ac9: vmovaps xmm0, xmmword ptr [rsp + 0x480]
0x100125ad2: vsubps xmm0, xmm0, xmmword ptr [r12 + 0x30]
0x100125ad9: vmulps xmm1, xmm0, xmm0
0x100125add: vmovshdup xmm2, xmm1
0x100125ae1: vaddss xmm2, xmm1, xmm2
0x100125ae5: vpermilpd xmm1, xmm1, 1
0x100125aeb: vaddss xmm1, xmm1, xmm2
0x100125aef: vsqrtss xmm1, xmm1, xmm1
0x100125af3: vucomiss xmm1, dword ptr [rip + 0x981dc9] ; 0x100aa78c4
0x100125afb: jbe 0x100125b07
0x100125afd: vpermilps xmm1, xmm1, 0xc0
0x100125b03: vdivps xmm0, xmm0, xmm1
0x100125b07: vmulps xmm1, xmm0, xmm0
0x100125b0b: vmovshdup xmm2, xmm1
0x100125b0f: vaddss xmm2, xmm1, xmm2
0x100125b13: vpermilpd xmm1, xmm1, 1
0x100125b19: vaddss xmm1, xmm1, xmm2
0x100125b1d: vsqrtss xmm1, xmm1, xmm1
0x100125b21: vucomiss xmm1, dword ptr [rip + 0x981d9b] ; 0x100aa78c4
0x100125b29: vmovss xmm4, dword ptr [rip + 0x981d93] ; 0x100aa78c4
0x100125b31: vmovaps xmm5, xmmword ptr [rip + 0x985b57] ; 0x100aab690
0x100125b39: jbe 0x100125b45
0x100125b3b: vpermilps xmm1, xmm1, 0xc0
0x100125b41: vdivps xmm0, xmm0, xmm1
0x100125b45: vxorps xmm1, xmm0, xmmword ptr [rip + 0x981db3] ; 0x100aa7900
0x100125b4d: vmulps xmm2, xmm0, xmm0
0x100125b51: vmovshdup xmm3, xmm2
0x100125b55: vaddss xmm3, xmm2, xmm3
0x100125b59: vpermilpd xmm2, xmm2, 1
0x100125b5f: vaddss xmm2, xmm2, xmm3
0x100125b63: vsqrtss xmm2, xmm2, xmm2
0x100125b67: vucomiss xmm2, dword ptr [rip + 0x981d55] ; 0x100aa78c4
0x100125b6f: jbe 0x100125b7b
0x100125b71: vpermilps xmm2, xmm2, 0xc0
0x100125b77: vdivps xmm1, xmm1, xmm2
0x100125b7b: vmulps xmm1, xmm1, xmmword ptr [rip + 0x985b0d] ; 0x100aab690
0x100125b83: vmovshdup xmm2, xmm1
0x100125b87: vaddss xmm2, xmm1, xmm2
0x100125b8b: vpermilpd xmm1, xmm1, 1
0x100125b91: vaddss xmm1, xmm1, xmm2
0x100125b95: vaddss xmm1, xmm1, dword ptr [rip + 0x97f527] ; 0x100aa50c4
0x100125b9d: vandps xmm1, xmm1, xmmword ptr [rip + 0x981d6b] ; 0x100aa7910
0x100125ba5: vucomiss xmm4, xmm1
0x100125ba9: jae 0x100125c27
0x100125bab: vmulps xmm1, xmm0, xmm5
0x100125baf: vmovshdup xmm2, xmm1
0x100125bb3: vaddss xmm2, xmm1, xmm2
0x100125bb7: vpermilpd xmm1, xmm1, 1
0x100125bbd: vaddss xmm1, xmm1, xmm2
0x100125bc1: vmovss xmm2, dword ptr [rip + 0x97f4f7] ; 0x100aa50c0
0x100125bc9: vaddss xmm1, xmm1, xmm2
0x100125bcd: vaddss xmm1, xmm1, xmm1
0x100125bd1: vsqrtss xmm1, xmm1, xmm1
0x100125bd5: vdivss xmm2, xmm2, xmm1
0x100125bd9: vmovss xmm3, dword ptr [rip + 0x97f4e3] ; 0x100aa50c4
0x100125be1: vmulps xmm3, xmm0, xmm3
0x100125be5: vpermilps xmm0, xmm0, 0xd2
0x100125beb: vmulps xmm0, xmm0, xmm5
0x100125bef: vsubps xmm0, xmm3, xmm0
0x100125bf3: vpermilps xmm0, xmm0, 0xd2
0x100125bf9: vpermilps xmm2, xmm2, 0xc0
0x100125bff: vmulps xmm0, xmm0, xmm2
0x100125c03: vmulss xmm1, xmm1, dword ptr [rip + 0x97e9ad] ; 0x100aa45b8
0x100125c0b: vinsertps xmm0, xmm0, xmm1, 0x30
0x100125c11: jmp 0x100125c2f ; 0x100125c2f
0x100125c13: mov rax, qword ptr [r12 + 0x2b0]
0x100125c1b: mov dword ptr [rax + 0x80], 0
0x100125c25: jmp 0x100125c6d ; 0x100125c6d
0x100125c27: vmovaps xmm0, xmmword ptr [rip + 0x985a71] ; 0x100aab6a0
0x100125c2f: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x100125c34: vpermilps xmm1, xmm0, 0xe7
0x100125c3a: vucomiss xmm1, xmm1
0x100125c3e: jp 0x10012bd65
0x100125c44: vmovshdup xmm1, xmm0
0x100125c48: vucomiss xmm0, xmm1
0x100125c4c: jp 0x10012bd65
0x100125c52: vpermilpd xmm0, xmm0, 1
0x100125c58: vucomiss xmm0, xmm0
0x100125c5c: jp 0x10012bd65
0x100125c62: vxorpd xmm0, xmm0, xmm0
0x100125c66: vmovapd xmmword ptr [r12 + 0x30], xmm0
0x100125c6d: mov r14, qword ptr [r12 + 0x2a8]
0x100125c75: mov rbx, qword ptr [rsp + 0x28]
0x100125c7a: mov rsi, qword ptr [rbx + 0x258]
0x100125c81: lea rdi, [rsp + 0x600]
0x100125c89: call 0x1007f26b0 ; 0x1007f26b0
0x100125c8e: mov rsi, qword ptr [rbx + 0x260]
0x100125c95: lea rdi, [rsp + 0x580]
0x100125c9d: call 0x1007f26b0 ; 0x1007f26b0
0x100125ca2: vmovaps xmm0, xmmword ptr [rsp + 0x600]
0x100125cab: vaddps xmm0, xmm0, xmmword ptr [rsp + 0x580]
0x100125cb4: vmulps xmm0, xmm0, xmmword ptr [rip + 0x9819b4] ; 0x100aa7670
0x100125cbc: vmovaps xmmword ptr [r14 + 0x20], xmm0
0x100125cc2: mov rax, qword ptr [r12 + 0x2a8]
0x100125cca: mov rsi, qword ptr [rsp + 0x40]
0x100125ccf: vmovaps xmm0, xmmword ptr [rsi + 0x140]
0x100125cd7: vmulps xmm1, xmm0, xmm0
0x100125cdb: vmovshdup xmm2, xmm1
0x100125cdf: vaddss xmm2, xmm1, xmm2
0x100125ce3: vpermilpd xmm1, xmm1, 1
0x100125ce9: vaddss xmm1, xmm1, xmm2
0x100125ced: vsqrtss xmm1, xmm1, xmm1
0x100125cf1: vucomiss xmm1, dword ptr [rip + 0x981bcb] ; 0x100aa78c4
0x100125cf9: jbe 0x100125d07
0x100125cfb: vpermilps xmm1, xmm1, 0xc0
0x100125d01: vdivps xmm0, xmm0, xmm1
0x100125d05: jmp 0x100125d14 ; 0x100125d14
0x100125d07: vmovaps xmm0, xmmword ptr [rsi + 0x60]
0x100125d0c: vxorps xmm0, xmm0, xmmword ptr [rip + 0x981bec] ; 0x100aa7900
0x100125d14: vmulps xmm1, xmm0, xmm0
0x100125d18: vmovshdup xmm2, xmm1
0x100125d1c: vaddss xmm2, xmm1, xmm2
0x100125d20: vpermilpd xmm1, xmm1, 1
0x100125d26: vaddss xmm1, xmm1, xmm2
0x100125d2a: vsqrtss xmm1, xmm1, xmm1
0x100125d2e: vucomiss xmm1, dword ptr [rip + 0x981b8e] ; 0x100aa78c4
0x100125d36: vmovss xmm4, dword ptr [rip + 0x981b86] ; 0x100aa78c4
0x100125d3e: vmovaps xmm5, xmmword ptr [rip + 0x98594a] ; 0x100aab690
0x100125d46: jbe 0x100125d52
0x100125d48: vpermilps xmm1, xmm1, 0xc0
0x100125d4e: vdivps xmm0, xmm0, xmm1
0x100125d52: vxorps xmm1, xmm0, xmmword ptr [rip + 0x981ba6] ; 0x100aa7900
0x100125d5a: vmulps xmm2, xmm0, xmm0
0x100125d5e: vmovshdup xmm3, xmm2
0x100125d62: vaddss xmm3, xmm2, xmm3
0x100125d66: vpermilpd xmm2, xmm2, 1
0x100125d6c: vaddss xmm2, xmm2, xmm3
0x100125d70: vsqrtss xmm2, xmm2, xmm2
0x100125d74: vucomiss xmm2, dword ptr [rip + 0x981b48] ; 0x100aa78c4
0x100125d7c: jbe 0x100125d88
0x100125d7e: vpermilps xmm2, xmm2, 0xc0
0x100125d84: vdivps xmm1, xmm1, xmm2
0x100125d88: vmulps xmm1, xmm1, xmmword ptr [rip + 0x985900] ; 0x100aab690
0x100125d90: vmovshdup xmm2, xmm1
0x100125d94: vaddss xmm2, xmm1, xmm2
0x100125d98: vpermilpd xmm1, xmm1, 1
0x100125d9e: vaddss xmm1, xmm1, xmm2
0x100125da2: vaddss xmm1, xmm1, dword ptr [rip + 0x97f31a] ; 0x100aa50c4
0x100125daa: vandps xmm1, xmm1, xmmword ptr [rip + 0x981b5e] ; 0x100aa7910
0x100125db2: vucomiss xmm4, xmm1
0x100125db6: jae 0x100125e20
0x100125db8: vmulps xmm1, xmm0, xmm5
0x100125dbc: vmovshdup xmm2, xmm1
0x100125dc0: vaddss xmm2, xmm1, xmm2
0x100125dc4: vpermilpd xmm1, xmm1, 1
0x100125dca: vaddss xmm1, xmm1, xmm2
0x100125dce: vmovss xmm2, dword ptr [rip + 0x97f2ea] ; 0x100aa50c0
0x100125dd6: vaddss xmm1, xmm1, xmm2
0x100125dda: vaddss xmm1, xmm1, xmm1
0x100125dde: vsqrtss xmm1, xmm1, xmm1
0x100125de2: vdivss xmm2, xmm2, xmm1
0x100125de6: vmovss xmm3, dword ptr [rip + 0x97f2d6] ; 0x100aa50c4
0x100125dee: vmulps xmm3, xmm0, xmm3
0x100125df2: vpermilps xmm0, xmm0, 0xd2
0x100125df8: vmulps xmm0, xmm0, xmm5
0x100125dfc: vsubps xmm0, xmm3, xmm0
0x100125e00: vpermilps xmm0, xmm0, 0xd2
0x100125e06: vpermilps xmm2, xmm2, 0xc0
0x100125e0c: vmulps xmm0, xmm0, xmm2
0x100125e10: vmulss xmm1, xmm1, dword ptr [rip + 0x97e7a0] ; 0x100aa45b8
0x100125e18: vinsertps xmm0, xmm0, xmm1, 0x30
0x100125e1e: jmp 0x100125e28 ; 0x100125e28
0x100125e20: vmovaps xmm0, xmmword ptr [rip + 0x985878] ; 0x100aab6a0
0x100125e28: vmovaps xmmword ptr [rax + 0x30], xmm0
0x100125e2d: vpermilps xmm1, xmm0, 0xe7
0x100125e33: vucomiss xmm1, xmm1
0x100125e37: jp 0x10012bd65
0x100125e3d: vmovshdup xmm1, xmm0
0x100125e41: vucomiss xmm0, xmm1
0x100125e45: jp 0x10012bd65
0x100125e4b: vpermilpd xmm0, xmm0, 1
0x100125e51: vucomiss xmm0, xmm0
0x100125e55: jp 0x10012bd65
0x100125e5b: mov rax, qword ptr [r12 + 0x2a8]
0x100125e63: vmovapd xmm0, xmmword ptr [rsp]
0x100125e68: vmovapd xmmword ptr [rax + 0x120], xmm0
0x100125e70: vmovapd xmmword ptr [rax + 0x110], xmm0
0x100125e78: cmp byte ptr [rsi + 0xbb1], 0
0x100125e7f: setne cl
0x100125e82: mov al, byte ptr [rsi + 0xbb0]
0x100125e88: test al, al
0x100125e8a: setne dl
0x100125e8d: cmp cl, dl
0x100125e8f: je 0x100125e9e
0x100125e91: cmp byte ptr [rsi + 0x1b3], 0
0x100125e98: je 0x100126002
0x100125e9e: mov rax, qword ptr [r12 + 0x2a8]
0x100125ea6: mov dword ptr [rax + 0x80], 0
0x100125eb0: cmp byte ptr [rsi + 0x1b2], 0
0x100125eb7: je 0x100126127
0x100125ebd: cmp byte ptr [rsi + 0xbb0], 0
0x100125ec4: jne 0x100126127
0x100125eca: mov rax, qword ptr [r12 + 0x2a8]
0x100125ed2: vmovaps xmm0, xmmword ptr [rsi + 0x130]
0x100125eda: vmovaps xmmword ptr [rax + 0x20], xmm0
0x100125edf: mov rax, qword ptr [r12 + 0x2a8]
0x100125ee7: vmovaps xmm0, xmmword ptr [rsi + 0x140]
0x100125eef: vmulps xmm1, xmm0, xmm0
0x100125ef3: vmovshdup xmm2, xmm1
0x100125ef7: vaddss xmm2, xmm1, xmm2
0x100125efb: vpermilpd xmm1, xmm1, 1
0x100125f01: vaddss xmm1, xmm1, xmm2
0x100125f05: vsqrtss xmm1, xmm1, xmm1
0x100125f09: vucomiss xmm1, dword ptr [rip + 0x9819b3] ; 0x100aa78c4
0x100125f11: jbe 0x100125f1d
0x100125f13: vpermilps xmm1, xmm1, 0xc0
0x100125f19: vdivps xmm0, xmm0, xmm1
0x100125f1d: vmovss xmm4, dword ptr [rip + 0x98199f] ; 0x100aa78c4
0x100125f25: vxorps xmm1, xmm0, xmmword ptr [rip + 0x9819d3] ; 0x100aa7900
0x100125f2d: vmulps xmm2, xmm0, xmm0
0x100125f31: vmovshdup xmm3, xmm2
0x100125f35: vaddss xmm3, xmm2, xmm3
0x100125f39: vpermilpd xmm2, xmm2, 1
0x100125f3f: vaddss xmm2, xmm2, xmm3
0x100125f43: vsqrtss xmm2, xmm2, xmm2
0x100125f47: vucomiss xmm2, dword ptr [rip + 0x981975] ; 0x100aa78c4
0x100125f4f: vmovaps xmm5, xmmword ptr [rip + 0x985739] ; 0x100aab690
0x100125f57: jbe 0x100125f63
0x100125f59: vpermilps xmm2, xmm2, 0xc0
0x100125f5f: vdivps xmm1, xmm1, xmm2
0x100125f63: vmulps xmm1, xmm1, xmmword ptr [rip + 0x985725] ; 0x100aab690
0x100125f6b: vmovshdup xmm2, xmm1
0x100125f6f: vaddss xmm2, xmm1, xmm2
0x100125f73: vpermilpd xmm1, xmm1, 1
0x100125f79: vaddss xmm1, xmm1, xmm2
0x100125f7d: vaddss xmm1, xmm1, dword ptr [rip + 0x97f13f] ; 0x100aa50c4
0x100125f85: vandps xmm1, xmm1, xmmword ptr [rip + 0x981983] ; 0x100aa7910
0x100125f8d: vucomiss xmm4, xmm1
0x100125f91: jae 0x1001260da
0x100125f97: vmulps xmm1, xmm0, xmm5
0x100125f9b: vmovshdup xmm2, xmm1
0x100125f9f: vaddss xmm2, xmm1, xmm2
0x100125fa3: vpermilpd xmm1, xmm1, 1
0x100125fa9: vaddss xmm1, xmm1, xmm2
0x100125fad: vmovss xmm2, dword ptr [rip + 0x97f10b] ; 0x100aa50c0
0x100125fb5: vaddss xmm1, xmm1, xmm2
0x100125fb9: vaddss xmm1, xmm1, xmm1
0x100125fbd: vsqrtss xmm1, xmm1, xmm1
0x100125fc1: vdivss xmm2, xmm2, xmm1
0x100125fc5: vmovss xmm3, dword ptr [rip + 0x97f0f7] ; 0x100aa50c4
0x100125fcd: vmulps xmm3, xmm0, xmm3
0x100125fd1: vpermilps xmm0, xmm0, 0xd2
0x100125fd7: vmulps xmm0, xmm0, xmm5
0x100125fdb: vsubps xmm0, xmm3, xmm0
0x100125fdf: vpermilps xmm0, xmm0, 0xd2
0x100125fe5: vpermilps xmm2, xmm2, 0xc0
0x100125feb: vmulps xmm0, xmm0, xmm2
0x100125fef: vmulss xmm1, xmm1, dword ptr [rip + 0x97e5c1] ; 0x100aa45b8
0x100125ff7: vinsertps xmm0, xmm0, xmm1, 0x30
0x100125ffd: jmp 0x1001260e2 ; 0x1001260e2
0x100126002: mov rcx, qword ptr [r12 + 0x2a8]
0x10012600a: movzx eax, al
0x10012600d: lea rdx, [rip + 0x98585c] ; 0x100aab870
0x100126014: vmovss xmm0, dword ptr [rdx + rax*4]
0x100126019: vmovss dword ptr [rcx + 0x80], xmm0
0x100126021: lea rdx, [rip + 0x9817d0] ; 0x100aa77f8
0x100126028: vmovss xmm0, dword ptr [rdx + rax*4]
0x10012602d: vmovss dword ptr [rcx + 0x84], xmm0
0x100126035: vxorpd xmm0, xmm0, xmm0
0x100126039: vmovapd xmmword ptr [rcx + 0xc0], xmm0
0x100126041: mov byte ptr [rcx + 0x18b], 1
0x100126048: cmp byte ptr [rsi + 0x1b2], 0
0x10012604f: jne 0x100125ebd
0x100126055: jmp 0x100126127 ; 0x100126127
0x10012605a: mov r12, qword ptr [rsp + 0x58]
0x10012605f: mov rax, qword ptr [r12 + 0x288]
0x100126067: mov dword ptr [rax + 0x80], 0
0x100126071: mov rax, qword ptr [r12 + 0x290]
0x100126079: mov dword ptr [rax + 0x80], 0
0x100126083: vmovss xmm0, dword ptr [rip + 0x97f035] ; 0x100aa50c0
0x10012608b: vmovaps xmm5, xmm0
0x10012608f: mov r13, qword ptr [rbp + 0x60]
0x100126093: jmp 0x100125297 ; 0x100125297
0x100126098: mov rax, qword ptr [r12 + 0x288]
0x1001260a0: vmovaps xmm0, xmmword ptr [rsp]
0x1001260a5: vmovaps xmmword ptr [rax + 0x120], xmm0
0x1001260ad: vmovaps xmmword ptr [rax + 0x110], xmm0
0x1001260b5: mov rax, qword ptr [r12 + 0x290]
0x1001260bd: vmovaps xmmword ptr [rax + 0x120], xmm0
0x1001260c5: vmovaps xmmword ptr [rax + 0x110], xmm0
0x1001260cd: vmulss xmm5, xmm5, dword ptr [rip + 0x98571b] ; 0x100aab7f0
0x1001260d5: jmp 0x100125098 ; 0x100125098
0x1001260da: vmovaps xmm0, xmmword ptr [rip + 0x9855be] ; 0x100aab6a0
0x1001260e2: vmovaps xmmword ptr [rax + 0x30], xmm0
0x1001260e7: vpermilps xmm1, xmm0, 0xe7
0x1001260ed: vucomiss xmm1, xmm1
0x1001260f1: jp 0x10012bd65
0x1001260f7: vmovshdup xmm1, xmm0
0x1001260fb: vucomiss xmm0, xmm1
0x1001260ff: jp 0x10012bd65
0x100126105: vpermilpd xmm0, xmm0, 1
0x10012610b: vucomiss xmm0, xmm0
0x10012610f: jp 0x10012bd65
0x100126115: mov rax, qword ptr [r12 + 0x2a8]
0x10012611d: mov dword ptr [rax + 0x80], 0
0x100126127: mov rbx, qword ptr [r13 + 0x20]
0x10012612b: mov rsi, qword ptr [rbx + 0x258]
0x100126132: lea rdi, [rsp + 0x600]
0x10012613a: call 0x1007f26b0 ; 0x1007f26b0
0x10012613f: mov rsi, qword ptr [rbx + 0x260]
0x100126146: lea rdi, [rsp + 0x580]
0x10012614e: call 0x1007f26b0 ; 0x1007f26b0
0x100126153: vmovaps xmm0, xmmword ptr [rsp + 0x600]
0x10012615c: vaddps xmm0, xmm0, xmmword ptr [rsp + 0x580]
0x100126165: vmulps xmm0, xmm0, xmmword ptr [rip + 0x981503] ; 0x100aa7670
0x10012616d: vmovaps xmmword ptr [rsp + 0x470], xmm0
0x100126176: lea rsi, [rsp + 0x470]
0x10012617e: mov rbx, qword ptr [rbp + 0x38]
0x100126182: mov rdi, rbx
0x100126185: call 0x1004d6680 ; 0x1004d6680
0x10012618a: vmovss dword ptr [r12 + 0x100c], xmm0
0x100126194: mov r14b, byte ptr [rbx + 0x1391]
0x10012619b: cmp byte ptr [r13 + 0x1ef8], 0
0x1001261a3: je 0x1001262cd
0x1001261a9: mov rbx, qword ptr [r13 + 0x20]
0x1001261ad: mov rsi, qword ptr [rbx + 0x258]
0x1001261b4: lea rdi, [rsp + 0x600]
0x1001261bc: call 0x1007f26b0 ; 0x1007f26b0
0x1001261c1: mov rsi, qword ptr [rbx + 0x260]
0x1001261c8: lea rdi, [rsp + 0x580]
0x1001261d0: call 0x1007f26b0 ; 0x1007f26b0
0x1001261d5: vbroadcastss xmm0, dword ptr [rsp + 0x604]
0x1001261df: vmovaps xmmword ptr [rsp], xmm0
0x1001261e4: vbroadcastss xmm0, dword ptr [rsp + 0x584]
0x1001261ee: vmovaps xmmword ptr [rsp + 0x10], xmm0
0x1001261f4: lea rsi, [rip + 0xa4d0f3] ; 0x100b732ee StormEnd
0x1001261fb: mov rdi, qword ptr [rbp + 0x88]
0x100126202: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x100126207: test eax, eax
0x100126209: jne 0x10012623c
0x10012620b: vmovaps xmm0, xmmword ptr [rsp + 0x10]
0x100126211: vaddss xmm0, xmm0, dword ptr [rsp]
0x100126216: vmulss xmm0, xmm0, dword ptr [rip + 0x97e39a] ; 0x100aa45b8
0x10012621e: vcmpltss xmm0, xmm0, dword ptr [rip + 0x9815c1] ; 0x100aa77e8
0x100126227: vmovss xmm1, dword ptr [rip + 0x97ee91] ; 0x100aa50c0
0x10012622f: vandnps xmm0, xmm0, xmm1
0x100126233: vmovaps xmmword ptr [rsp + 0xe0], xmm0
0x10012623c: mov rbx, qword ptr [rsp + 0x40]
0x100126241: vmovss xmm0, dword ptr [r12 + 0x100c]
0x10012624b: vmovss xmm1, dword ptr [rip + 0x9855ad] ; 0x100aab800
0x100126253: vucomiss xmm1, xmm0
0x100126257: jbe 0x10012628b
0x100126259: vxorps xmm1, xmm1, xmm1
0x10012625d: vucomiss xmm0, xmm1
0x100126261: jbe 0x10012628b
0x100126263: vmovss xmm2, dword ptr [r12 + 0x1010]
0x10012626d: vucomiss xmm2, xmm1
0x100126271: jne 0x10012628b
0x100126273: jp 0x10012628b
0x100126275: test r14b, r14b
0x100126278: lea rax, [rip + 0xa4e0ba] ; 0x100b74339 SplashInShallowMud
0x10012627f: lea rsi, [rip + 0xa4e0c6] ; 0x100b7434c SplashInShallow
0x100126286: jmp 0x1001268a6 ; 0x1001268a6
0x10012628b: vucomiss xmm0, dword ptr [rip + 0x98556d] ; 0x100aab800
0x100126293: jb 0x10012636c
0x100126299: vmovss xmm1, dword ptr [r12 + 0x1010]
0x1001262a3: vxorps xmm2, xmm2, xmm2
0x1001262a7: vucomiss xmm1, xmm2
0x1001262ab: jne 0x10012636c
0x1001262b1: jp 0x10012636c
0x1001262b7: test r14b, r14b
0x1001262ba: lea rax, [rip + 0xa4e09b] ; 0x100b7435c SplashInDeepMud
0x1001262c1: lea rsi, [rip + 0xa4e0a4] ; 0x100b7436c SplashInDeep
0x1001262c8: jmp 0x1001268a6 ; 0x1001268a6
0x1001262cd: vmovss xmm1, dword ptr [rip + 0x98552b] ; 0x100aab800
0x1001262d5: vucomiss xmm1, xmm0
0x1001262d9: jbe 0x1001263c0
0x1001262df: vxorps xmm1, xmm1, xmm1
0x1001262e3: vucomiss xmm0, xmm1
0x1001262e7: jbe 0x1001263c0
0x1001262ed: vmovss xmm2, dword ptr [r12 + 0x1010]
0x1001262f7: vucomiss xmm2, xmm1
0x1001262fb: jne 0x1001263c0
0x100126301: jp 0x1001263c0
0x100126307: test r14b, r14b
0x10012630a: lea rax, [rip + 0xa4e0ac] ; 0x100b743bd SplashInShallowMudRemote
0x100126311: lea rsi, [rip + 0xa4e0be] ; 0x100b743d6 SplashInShallowRemote
0x100126318: cmovne rsi, rax
0x10012631c: vxorps ymm0, ymm0, ymm0
0x100126320: vmovaps ymmword ptr [rsp + 0x580], ymm0
0x100126329: vmovaps ymmword ptr [rsp + 0x5e0], ymm0
0x100126332: vmovaps ymmword ptr [rsp + 0x5c0], ymm0
0x10012633b: vmovaps ymmword ptr [rsp + 0x5a0], ymm0
0x100126344: mov byte ptr [rsp + 0x58d], 1
0x10012634c: mov dword ptr [rsp + 0x580], 0x3f800000
0x100126357: mov dword ptr [rsp + 0x5f0], 0x11
0x100126362: mov rbx, qword ptr [rsp + 0x40]
0x100126367: jmp 0x100126494 ; 0x100126494
0x10012636c: vxorps xmm1, xmm1, xmm1
0x100126370: vucomiss xmm0, xmm1
0x100126374: jne 0x100126a26
0x10012637a: jp 0x100126a26
0x100126380: vmovss xmm0, dword ptr [r12 + 0x1010]
0x10012638a: vucomiss xmm0, dword ptr [rip + 0x982e46] ; 0x100aa91d8
0x100126392: jbe 0x100126887
0x100126398: vmovss xmm1, dword ptr [rip + 0x981448] ; 0x100aa77e8
0x1001263a0: vucomiss xmm1, xmm0
0x1001263a4: jbe 0x100126887
0x1001263aa: test r14b, r14b
0x1001263ad: lea rax, [rip + 0xa4dfc5] ; 0x100b74379 SplashOutShallowMud
0x1001263b4: lea rsi, [rip + 0xa4dfd2] ; 0x100b7438d SplashOutShallow
0x1001263bb: jmp 0x1001268a6 ; 0x1001268a6
0x1001263c0: vucomiss xmm0, dword ptr [rip + 0x985438] ; 0x100aab800
0x1001263c8: mov rbx, qword ptr [rsp + 0x40]
0x1001263cd: jb 0x1001263fb
0x1001263cf: vmovss xmm1, dword ptr [r12 + 0x1010]
0x1001263d9: vxorps xmm2, xmm2, xmm2
0x1001263dd: vucomiss xmm1, xmm2
0x1001263e1: jne 0x1001263fb
0x1001263e3: jp 0x1001263fb
0x1001263e5: test r14b, r14b
0x1001263e8: lea rax, [rip + 0xa4dffd] ; 0x100b743ec SplashInDeepMudRemote
0x1001263ef: lea rsi, [rip + 0xa4e00c] ; 0x100b74402 SplashInDeepRemote
0x1001263f6: jmp 0x100126913 ; 0x100126913
0x1001263fb: vxorps xmm1, xmm1, xmm1
0x1001263ff: vucomiss xmm0, xmm1
0x100126403: jne 0x100126a26
0x100126409: jp 0x100126a26
0x10012640f: vmovss xmm0, dword ptr [r12 + 0x1010]
0x100126419: vucomiss xmm0, dword ptr [rip + 0x982db7] ; 0x100aa91d8
0x100126421: jbe 0x1001268f4
0x100126427: vmovss xmm1, dword ptr [rip + 0x9813b9] ; 0x100aa77e8
0x10012642f: vucomiss xmm1, xmm0
0x100126433: jbe 0x1001268f4
0x100126439: test r14b, r14b
0x10012643c: lea rax, [rip + 0xa4dfd2] ; 0x100b74415 SplashOutShallowMudRemote
0x100126443: lea rsi, [rip + 0xa4dfe5] ; 0x100b7442f SplashOutShallowRemote
0x10012644a: cmovne rsi, rax
0x10012644e: vxorps ymm0, ymm0, ymm0
0x100126452: vmovaps ymmword ptr [rsp + 0x580], ymm0
0x10012645b: vmovaps ymmword ptr [rsp + 0x5e0], ymm0
0x100126464: vmovaps ymmword ptr [rsp + 0x5c0], ymm0
0x10012646d: vmovaps ymmword ptr [rsp + 0x5a0], ymm0
0x100126476: mov byte ptr [rsp + 0x58d], 1
0x10012647e: mov dword ptr [rsp + 0x580], 0x3f800000
0x100126489: mov dword ptr [rsp + 0x5f0], 0x11
0x100126494: vmovaps xmm1, xmmword ptr [rbx + 0x10]
0x100126499: vmovaps xmmword ptr [rsp + 0x590], xmm1
0x1001264a2: movabs rax, 0x4120000040000000
0x1001264ac: jmp 0x100126975 ; 0x100126975
0x1001264b1: cmp byte ptr [r14 + 0x21b1], 0
0x1001264b9: je 0x100123910
0x1001264bf: mov rax, qword ptr [r14 + 0xa8]
0x1001264c6: mov rax, qword ptr [rax + 0x210]
0x1001264cd: cmp byte ptr [rax + 0xc], 0
0x1001264d1: jne 0x100123910
0x1001264d7: mov qword ptr [rsp + 0x78], r15
0x1001264dc: mov rdi, qword ptr [r12 + 0x1038]
0x1001264e4: movzx esi, byte ptr [r14 + 0x21b6]
0x1001264ec: call 0x1004636d0 ; 0x1004636d0
0x1001264f1: mov rax, qword ptr [rsp + 0x28]
0x1001264f6: mov rsi, qword ptr [rax + 0x368]
0x1001264fd: lea r15, [rsp + 0x600]
0x100126505: mov rdi, r15
0x100126508: call 0x1007f26e0 ; 0x1007f26e0
0x10012650d: lea rdi, [rsp + 0x2c0]
0x100126515: mov rsi, r15
0x100126518: call 0x100789f00 ; 0x100789f00
0x10012651d: vmovaps xmm0, xmmword ptr [rsp + 0x2c0]
0x100126526: vmulss xmm1, xmm0, dword ptr [rip + 0x97e08a] ; 0x100aa45b8
0x10012652e: vmovaps xmmword ptr [rsp], xmm1
0x100126533: vmovshdup xmm0, xmm0
0x100126537: vmulss xmm0, xmm0, dword ptr [rip + 0x983f69] ; 0x100aaa4a8
0x10012653f: vmovaps xmmword ptr [rsp + 0xe0], xmm0
0x100126548: vmovaps xmm0, xmmword ptr [rsp + 0x600]
0x100126551: vmovaps xmm1, xmmword ptr [rsp + 0x610]
0x10012655a: vmovaps xmm2, xmmword ptr [rsp + 0x620]
0x100126563: vmovaps xmmword ptr [rsp + 0x220], xmm0
0x10012656c: vmovaps xmmword ptr [rsp + 0x230], xmm1
0x100126575: vmovaps xmmword ptr [rsp + 0x240], xmm2
0x10012657e: lea rdi, [rsp + 0x580]
0x100126586: lea rsi, [rsp + 0x220]
0x10012658e: vmovss xmm0, dword ptr [rip + 0x98132e] ; 0x100aa78c4
0x100126596: call 0x10078a070 ; 0x10078a070
0x10012659b: vpermilps xmm0, xmmword ptr [rsp + 0xe0], 0xc0
0x1001265a6: vmovaps xmm2, xmmword ptr [rsp + 0x220]
0x1001265af: vmovaps xmm3, xmmword ptr [rsp + 0x230]
0x1001265b8: vmovaps xmm4, xmmword ptr [rsp + 0x240]
0x1001265c1: vmulps xmm0, xmm0, xmm3
0x1001265c5: vaddps xmm0, xmm0, xmmword ptr [rsp + 0x630]
0x1001265ce: vpermilps xmm1, xmmword ptr [rsp], 0xc0
0x1001265d5: vmulps xmm1, xmm1, xmm2
0x1001265d9: vaddps xmm8, xmm0, xmm1
0x1001265dd: vmovaps xmm5, xmmword ptr [rip + 0x98505b] ; 0x100aab640
0x1001265e5: vmulps xmm6, xmm2, xmm5
0x1001265e9: vxorps xmm1, xmm1, xmm1
0x1001265ed: vmulps xmm7, xmm3, xmm1
0x1001265f1: vaddps xmm6, xmm7, xmm6
0x1001265f5: vmulps xmm0, xmm4, xmm1
0x1001265f9: vaddps xmm6, xmm0, xmm6
0x1001265fd: vmulps xmm2, xmm2, xmm1
0x100126601: vmulps xmm3, xmm3, xmm5
0x100126605: vaddps xmm3, xmm3, xmm2
0x100126609: vaddps xmm0, xmm0, xmm3
0x10012660d: vaddps xmm2, xmm7, xmm2
0x100126611: vmulps xmm3, xmm4, xmm5
0x100126615: vaddps xmm2, xmm3, xmm2
0x100126619: vmovaps xmm5, xmmword ptr [rip + 0x98502f] ; 0x100aab650
0x100126621: vmulps xmm3, xmm6, xmm5
0x100126625: vmulps xmm4, xmm0, xmm1
0x100126629: vaddps xmm3, xmm4, xmm3
0x10012662d: vsubps xmm3, xmm3, xmm2
0x100126631: vmulps xmm7, xmm6, xmm1
0x100126635: vaddps xmm0, xmm0, xmm7
0x100126639: vmulps xmm7, xmm2, xmm1
0x10012663d: vaddps xmm0, xmm7, xmm0
0x100126641: vaddps xmm4, xmm4, xmm6
0x100126645: vmulps xmm2, xmm2, xmm5
0x100126649: vaddps xmm2, xmm2, xmm4
0x10012664d: vmulps xmm4, xmm0, xmm1
0x100126651: vaddps xmm4, xmm4, xmm3
0x100126655: vmulps xmm6, xmm2, xmm1
0x100126659: vaddps xmm4, xmm6, xmm4
0x10012665d: vmovshdup xmm6, xmm4
0x100126661: vmulps xmm7, xmm3, xmm1
0x100126665: vmulps xmm3, xmm0, xmm5
0x100126669: vaddps xmm3, xmm3, xmm7
0x10012666d: vaddps xmm3, xmm2, xmm3
0x100126671: vsubps xmm0, xmm7, xmm0
0x100126675: vmulps xmm2, xmm2, xmm5
0x100126679: vaddps xmm2, xmm2, xmm0
0x10012667d: vinsertf128 ymm0, ymm4, xmm3, 1
0x100126683: vmovups ymmword ptr [rsp + 0x220], ymm0
0x10012668c: vmovaps xmmword ptr [rsp + 0x240], xmm2
0x100126695: vblendps xmm0, xmm4, xmm1, 8
0x10012669b: vmovaps xmmword ptr [rsp + 0x580], xmm0
0x1001266a4: vblendps xmm0, xmm3, xmm1, 8
0x1001266aa: vmovaps xmmword ptr [rsp + 0x590], xmm0
0x1001266b3: vblendps xmm0, xmm2, xmm1, 8
0x1001266b9: vmovaps xmmword ptr [rsp + 0x5a0], xmm0
0x1001266c2: vinsertps xmm0, xmm8, dword ptr [rip + 0x97e9f4], 0x30 ; 0x100aa50c0
0x1001266cc: vmovaps xmmword ptr [rsp + 0x5b0], xmm0
0x1001266d5: vucomiss xmm4, xmm6
0x1001266d9: jp 0x100126742
0x1001266db: vpermilpd xmm0, xmm4, 1
0x1001266e1: vucomiss xmm0, xmm0
0x1001266e5: jp 0x100126742
0x1001266e7: vmovshdup xmm0, xmm3
0x1001266eb: vucomiss xmm3, xmm0
0x1001266ef: jp 0x100126742
0x1001266f1: vpermilpd xmm0, xmm3, 1
0x1001266f7: vucomiss xmm0, xmm0
0x1001266fb: jp 0x100126742
0x1001266fd: vmovshdup xmm0, xmm2
0x100126701: vucomiss xmm2, xmm0
0x100126705: jp 0x100126742
0x100126707: vpermilpd xmm0, xmm2, 1
0x10012670d: vucomiss xmm0, xmm0
0x100126711: jp 0x100126742
0x100126713: vmovshdup xmm0, xmm8
0x100126718: vucomiss xmm8, xmm0
0x10012671c: jp 0x100126742
0x10012671e: vpermilpd xmm0, xmm8, 1
0x100126724: vucomiss xmm0, xmm0
0x100126728: jp 0x100126742
0x10012672a: mov rdi, qword ptr [r12 + 0x1038]
0x100126732: lea rsi, [rsp + 0x580]
0x10012673a: vzeroupper 
0x10012673d: call 0x100463750 ; 0x100463750
0x100126742: mov rdi, rbx
0x100126745: mov rsi, r13
0x100126748: vzeroupper 
0x10012674b: call 0x10011fd70 ; 0x10011fd70
0x100126750: vmovaps xmmword ptr [rsp], xmm0
0x100126755: mov r15, qword ptr [r12 + 0x1038]
0x10012675d: vmovaps xmm0, xmmword ptr [rip + 0x984efb] ; 0x100aab660
0x100126765: vmovaps xmmword ptr [rsp + 0x110], xmm0
0x10012676e: lea rdi, [rsp + 0xb0]
0x100126776: lea rsi, [rsp + 0x110]
0x10012677e: vmovss xmm0, dword ptr [rip + 0x981e32] ; 0x100aa85b8
0x100126786: call 0x10077d310 ; 0x10077d310
0x10012678b: vmovaps xmm0, xmmword ptr [rsp + 0xb0]
0x100126794: vmovaps xmmword ptr [rsp + 0xe0], xmm0
0x10012679d: vmovaps xmm0, xmmword ptr [rip + 0x984ecb] ; 0x100aab670
0x1001267a5: vmovaps xmmword ptr [rsp + 0x110], xmm0
0x1001267ae: lea rdi, [rsp + 0xb0]
0x1001267b6: lea rsi, [rsp + 0x110]
0x1001267be: vmovss xmm0, dword ptr [rip + 0x981df2] ; 0x100aa85b8
0x1001267c6: call 0x10077d310 ; 0x10077d310
0x1001267cb: vmovaps xmm0, xmmword ptr [rsp + 0xb0]
0x1001267d4: vmulps xmm0, xmm0, xmmword ptr [rip + 0x982ed4] ; 0x100aa96b0
0x1001267dc: vmovaps xmm2, xmmword ptr [rsp + 0xe0]
0x1001267e5: vsubps xmm0, xmm0, xmm2
0x1001267e9: vpermilps xmm1, xmmword ptr [rsp], 0
0x1001267f0: vmulps xmm0, xmm1, xmm0
0x1001267f4: vaddps xmm0, xmm2, xmm0
0x1001267f8: vmovaps xmmword ptr [rsp + 0xb0], xmm0
0x100126801: lea rdx, [rip + 0xa3dfe9] ; 0x100b647f1 u_diffuseColor
0x100126808: lea rcx, [rsp + 0xb0]
0x100126810: xor esi, esi
0x100126812: mov rdi, r15
0x100126815: call 0x100466a50 ; 0x100466a50
0x10012681a: vmovss xmm0, dword ptr [rip + 0x97e89e] ; 0x100aa50c0
0x100126822: vmovaps xmm1, xmmword ptr [rsp]
0x100126827: vucomiss xmm0, xmm1
0x10012682b: vmovaps xmm0, xmm1
0x10012682f: vmovaps xmm2, xmmword ptr [rsp + 0x60]
0x100126835: mov r15, qword ptr [rsp + 0x78]
0x10012683a: vxorps xmm3, xmm3, xmm3
0x10012683e: jbe 0x100123929
0x100126844: mov rax, qword ptr [r14 + 0x38]
0x100126848: vmulss xmm0, xmm0, dword ptr [rip + 0x980f8c] ; 0x100aa77dc
0x100126850: cmp byte ptr [rax + 0x3f4], 0
0x100126857: je 0x100126861
0x100126859: vmaxss xmm0, xmm0, dword ptr [rax + 0x3f0]
0x100126861: vmovss dword ptr [rax + 0x3f0], xmm0
0x100126869: mov byte ptr [rax + 0x3f4], 1
0x100126870: vmulss xmm0, xmm2, dword ptr [rip + 0x98022c] ; 0x100aa6aa4
0x100126878: cmp byte ptr [rbx + 0x4c], 0
0x10012687c: jne 0x100123937
0x100126882: jmp 0x100123944 ; 0x100123944
0x100126887: vucomiss xmm0, dword ptr [rip + 0x980f59] ; 0x100aa77e8
0x10012688f: jb 0x100126a26
0x100126895: test r14b, r14b
0x100126898: lea rax, [rip + 0xa4daff] ; 0x100b7439e SplashOutDeepMud
0x10012689f: lea rsi, [rip + 0xa4db09] ; 0x100b743af SplashOutDeep
0x1001268a6: cmovne rsi, rax
0x1001268aa: vxorps ymm0, ymm0, ymm0
0x1001268ae: vmovaps ymmword ptr [rsp + 0x580], ymm0
0x1001268b7: vmovaps ymmword ptr [rsp + 0x5e0], ymm0
0x1001268c0: vmovaps ymmword ptr [rsp + 0x5c0], ymm0
0x1001268c9: vmovaps ymmword ptr [rsp + 0x5a0], ymm0
0x1001268d2: vmovaps xmm1, xmmword ptr [rsp + 0xe0]
0x1001268db: vmovss dword ptr [rsp + 0x580], xmm1
0x1001268e4: mov dword ptr [rsp + 0x5f0], 0x11
0x1001268ef: jmp 0x100126988 ; 0x100126988
0x1001268f4: vucomiss xmm0, dword ptr [rip + 0x980eec] ; 0x100aa77e8
0x1001268fc: jb 0x100126a26
0x100126902: test r14b, r14b
0x100126905: lea rax, [rip + 0xa4db3a] ; 0x100b74446 SplashOutDeepMudRemote
0x10012690c: lea rsi, [rip + 0xa4db4a] ; 0x100b7445d SplashOutDeepRemote
0x100126913: cmovne rsi, rax
0x100126917: vxorps ymm0, ymm0, ymm0
0x10012691b: vmovaps ymmword ptr [rsp + 0x580], ymm0
0x100126924: vmovaps ymmword ptr [rsp + 0x5e0], ymm0
0x10012692d: vmovaps ymmword ptr [rsp + 0x5c0], ymm0
0x100126936: vmovaps ymmword ptr [rsp + 0x5a0], ymm0
0x10012693f: mov byte ptr [rsp + 0x58d], 1
0x100126947: mov dword ptr [rsp + 0x580], 0x3f800000
0x100126952: mov dword ptr [rsp + 0x5f0], 0x11
0x10012695d: vmovaps xmm1, xmmword ptr [rbx + 0x10]
0x100126962: vmovaps xmmword ptr [rsp + 0x590], xmm1
0x10012696b: movabs rax, 0x4170000040400000
0x100126975: mov qword ptr [rsp + 0x5c8], rax
0x10012697d: mov dword ptr [rsp + 0x5f0], 0xc31
0x100126988: vmovups ymmword ptr [rsp + 0x790], ymm0
0x100126991: vmovaps ymmword ptr [rsp + 0x780], ymm0
0x10012699a: vmovaps ymmword ptr [rsp + 0x760], ymm0
0x1001269a3: vmovaps ymmword ptr [rsp + 0x740], ymm0
0x1001269ac: vmovaps ymmword ptr [rsp + 0x720], ymm0
0x1001269b5: vmovaps ymmword ptr [rsp + 0x700], ymm0
0x1001269be: vmovaps ymmword ptr [rsp + 0x6e0], ymm0
0x1001269c7: vmovaps ymmword ptr [rsp + 0x6c0], ymm0
0x1001269d0: vmovaps ymmword ptr [rsp + 0x6a0], ymm0
0x1001269d9: vmovaps ymmword ptr [rsp + 0x680], ymm0
0x1001269e2: vmovaps ymmword ptr [rsp + 0x660], ymm0
0x1001269eb: vmovaps ymmword ptr [rsp + 0x640], ymm0
0x1001269f4: vmovaps ymmword ptr [rsp + 0x620], ymm0
0x1001269fd: vmovaps ymmword ptr [rsp + 0x600], ymm0
0x100126a06: lea rdx, [rsp + 0x580]
0x100126a0e: lea rcx, [rsp + 0x600]
0x100126a16: mov rdi, qword ptr [rsp + 0x100]
0x100126a1e: vzeroupper 
0x100126a21: call 0x1006018a0 ; 0x1006018a0
0x100126a26: mov eax, dword ptr [r12 + 0x100c]
0x100126a2e: mov dword ptr [r12 + 0x1010], eax
0x100126a36: lea rbx, [rbx + 0x10]
0x100126a3a: lea rdi, [rsp + 0x180]
0x100126a42: mov r14, qword ptr [rbp + 0x30]
0x100126a46: mov rsi, r14
0x100126a49: mov rdx, rbx
0x100126a4c: call 0x100328200 ; 0x100328200
0x100126a51: vmovapd xmm0, xmmword ptr [rsp + 0x180]
0x100126a5a: vmovapd xmmword ptr [rsp], xmm0
0x100126a5f: lea rdi, [rsp + 0x600]
0x100126a67: mov rsi, r14
0x100126a6a: mov rdx, rbx
0x100126a6d: call 0x100328200 ; 0x100328200
0x100126a72: cmp byte ptr [rsp + 0x1d0], 0
0x100126a7a: mov r14, qword ptr [rsp + 0x170]
0x100126a82: je 0x100127137
0x100126a88: vmovaps xmm0, xmmword ptr [rsp]
0x100126a8d: vmulps xmm0, xmm0, xmm0
0x100126a91: vmovshdup xmm1, xmm0
0x100126a95: vaddss xmm1, xmm0, xmm1
0x100126a99: vpermilpd xmm0, xmm0, 1
0x100126a9f: vaddss xmm0, xmm0, xmm1
0x100126aa3: vsqrtss xmm0, xmm0, xmm0
0x100126aa7: vmovaps xmmword ptr [rsp], xmm0
0x100126aac: mov rbx, qword ptr [rsp + 0x40]
0x100126ab1: vmovaps xmm0, xmmword ptr [rbx + 0x50]
0x100126ab6: vsubps xmm0, xmm0, xmmword ptr [rsp + 0x600]
0x100126abf: vmulps xmm0, xmm0, xmm0
0x100126ac3: vmovshdup xmm1, xmm0
0x100126ac7: vaddss xmm1, xmm0, xmm1
0x100126acb: vpermilpd xmm0, xmm0, 1
0x100126ad1: vaddss xmm0, xmm0, xmm1
0x100126ad5: vsqrtss xmm0, xmm0, xmm0
0x100126ad9: vmovaps xmmword ptr [rsp + 0x10], xmm0
0x100126adf: lea rsi, [rip + 0xa3b922] ; 0x100b62408 Storm
0x100126ae6: mov r14, qword ptr [rbp + 0x88]
0x100126aed: mov rdi, r14
0x100126af0: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x100126af5: test eax, eax
0x100126af7: je 0x100126da9
0x100126afd: lea rsi, [rip + 0xa4c7ea] ; 0x100b732ee StormEnd
0x100126b04: mov rdi, r14
0x100126b07: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x100126b0c: test eax, eax
0x100126b0e: je 0x100126da9
0x100126b14: vmovss xmm0, dword ptr [rbx + 0x14]
0x100126b19: vaddss xmm0, xmm0, dword ptr [rip + 0x984ce3] ; 0x100aab804
0x100126b21: vmovaps xmm1, xmmword ptr [rsp + 0x10]
0x100126b27: vinsertps xmm0, xmm1, xmm0, 0x10
0x100126b2d: vdivps xmm0, xmm0, xmmword ptr [rip + 0x984bdb] ; 0x100aab710
0x100126b35: vmovss xmm1, dword ptr [rip + 0x9805b7] ; 0x100aa70f4
0x100126b3d: vmaxps xmm0, xmm1, xmm0
0x100126b41: vmovaps xmm1, xmmword ptr [rip + 0x984bd7] ; 0x100aab720
0x100126b49: vminps xmm0, xmm1, xmm0
0x100126b4d: vmovshdup xmm1, xmm0
0x100126b51: vmulss xmm1, xmm0, xmm1
0x100126b55: mov rax, qword ptr [r12 + 0x298]
0x100126b5d: vmovss dword ptr [rax + 0x80], xmm1
0x100126b65: mov dword ptr [rax + 0x8c], 0x3fc00000
0x100126b6f: vmovss xmm0, dword ptr [rip + 0x97e549] ; 0x100aa50c0
0x100126b77: vmovaps xmm3, xmmword ptr [rsp]
0x100126b7c: vcmpltss xmm2, xmm0, xmm3
0x100126b81: vandps xmm2, xmm2, xmm3
0x100126b85: vmovss dword ptr [rax + 0x84], xmm2
0x100126b8d: vxorps xmm2, xmm2, xmm2
0x100126b91: vmovaps xmmword ptr [rax + 0xc0], xmm2
0x100126b99: mov byte ptr [rax + 0x18b], 1
0x100126ba0: mov rax, qword ptr [r12 + 0x298]
0x100126ba8: vdivss xmm1, xmm0, xmm1
0x100126bac: vminss xmm1, xmm0, xmm1
0x100126bb0: vmovss dword ptr [rax + 0x90], xmm1
0x100126bb8: vucomiss xmm3, dword ptr [rip + 0x980c28] ; 0x100aa77e8
0x100126bc0: vmovss xmm5, dword ptr [rip + 0x980cfc] ; 0x100aa78c4
0x100126bc8: vmovaps xmm6, xmmword ptr [rip + 0x984ac0] ; 0x100aab690
0x100126bd0: vmovaps xmm4, xmmword ptr [rip + 0x982708] ; 0x100aa92e0
0x100126bd8: mov r14, qword ptr [rsp + 0x170]
0x100126be0: jbe 0x100126c19
0x100126be2: vmovaps xmm4, xmmword ptr [rsp + 0x180]
0x100126beb: vmulps xmm1, xmm4, xmm4
0x100126bef: vmovshdup xmm2, xmm1
0x100126bf3: vaddss xmm2, xmm1, xmm2
0x100126bf7: vpermilpd xmm1, xmm1, 1
0x100126bfd: vaddss xmm1, xmm1, xmm2
0x100126c01: vsqrtss xmm1, xmm1, xmm1
0x100126c05: vucomiss xmm1, dword ptr [rip + 0x980cb7] ; 0x100aa78c4
0x100126c0d: jbe 0x100126c19
0x100126c0f: vpermilps xmm1, xmm1, 0xc0
0x100126c15: vdivps xmm4, xmm4, xmm1
0x100126c19: cmp byte ptr [rbx + 0xbb0], 0
0x100126c20: jne 0x100126cae
0x100126c26: vmovaps xmm1, xmmword ptr [rbx + 0x140]
0x100126c2e: vmulps xmm2, xmm4, xmm1
0x100126c32: vmovshdup xmm3, xmm2
0x100126c36: vaddss xmm3, xmm2, xmm3
0x100126c3a: vpermilpd xmm2, xmm2, 1
0x100126c40: vaddss xmm2, xmm2, xmm3
0x100126c44: vxorps xmm3, xmm3, xmm3
0x100126c48: vucomiss xmm3, xmm2
0x100126c4c: jbe 0x100126cae
0x100126c4e: vpermilps xmm2, xmm2, 0xc0
0x100126c54: vmulps xmm1, xmm1, xmm2
0x100126c58: vsubps xmm1, xmm4, xmm1
0x100126c5c: vmulps xmm2, xmm4, xmm4
0x100126c60: vmovshdup xmm3, xmm2
0x100126c64: vaddss xmm3, xmm2, xmm3
0x100126c68: vpermilpd xmm2, xmm2, 1
0x100126c6e: vaddss xmm2, xmm2, xmm3
0x100126c72: vsqrtss xmm2, xmm2, xmm2
0x100126c76: vmulps xmm3, xmm1, xmm1
0x100126c7a: vmovshdup xmm4, xmm3
0x100126c7e: vaddss xmm4, xmm3, xmm4
0x100126c82: vpermilpd xmm3, xmm3, 1
0x100126c88: vaddss xmm3, xmm3, xmm4
0x100126c8c: vsqrtss xmm3, xmm3, xmm3
0x100126c90: vucomiss xmm3, dword ptr [rip + 0x980c2c] ; 0x100aa78c4
0x100126c98: jbe 0x100126ca4
0x100126c9a: vpermilps xmm3, xmm3, 0xc0
0x100126ca0: vdivps xmm1, xmm1, xmm3
0x100126ca4: vpermilps xmm2, xmm2, 0xc0
0x100126caa: vmulps xmm4, xmm2, xmm1
0x100126cae: vmulps xmm1, xmm4, xmm4
0x100126cb2: vmovshdup xmm2, xmm1
0x100126cb6: vaddss xmm2, xmm1, xmm2
0x100126cba: vpermilpd xmm1, xmm1, 1
0x100126cc0: vaddss xmm1, xmm1, xmm2
0x100126cc4: vsqrtss xmm1, xmm1, xmm1
0x100126cc8: vucomiss xmm1, dword ptr [rip + 0x980bf4] ; 0x100aa78c4
0x100126cd0: jbe 0x100126cdc
0x100126cd2: vpermilps xmm1, xmm1, 0xc0
0x100126cd8: vdivps xmm4, xmm4, xmm1
0x100126cdc: vxorps xmm1, xmm4, xmmword ptr [rip + 0x980c1c] ; 0x100aa7900
0x100126ce4: vmulps xmm2, xmm4, xmm4
0x100126ce8: vmovshdup xmm3, xmm2
0x100126cec: vaddss xmm3, xmm2, xmm3
0x100126cf0: vpermilpd xmm2, xmm2, 1
0x100126cf6: vaddss xmm2, xmm2, xmm3
0x100126cfa: vsqrtss xmm2, xmm2, xmm2
0x100126cfe: vucomiss xmm2, dword ptr [rip + 0x980bbe] ; 0x100aa78c4
0x100126d06: jbe 0x100126d12
0x100126d08: vpermilps xmm2, xmm2, 0xc0
0x100126d0e: vdivps xmm1, xmm1, xmm2
0x100126d12: vmulps xmm1, xmm1, xmmword ptr [rip + 0x984976] ; 0x100aab690
0x100126d1a: vmovshdup xmm2, xmm1
0x100126d1e: vaddss xmm2, xmm1, xmm2
0x100126d22: vpermilpd xmm1, xmm1, 1
0x100126d28: vaddss xmm1, xmm1, xmm2
0x100126d2c: vaddss xmm1, xmm1, dword ptr [rip + 0x97e390] ; 0x100aa50c4
0x100126d34: vandps xmm1, xmm1, xmmword ptr [rip + 0x980bd4] ; 0x100aa7910
0x100126d3c: vucomiss xmm5, xmm1
0x100126d40: jae 0x1001270ea
0x100126d46: vmulps xmm1, xmm4, xmm6
0x100126d4a: vmovshdup xmm2, xmm1
0x100126d4e: vaddss xmm2, xmm1, xmm2
0x100126d52: vpermilpd xmm1, xmm1, 1
0x100126d58: vaddss xmm1, xmm1, xmm2
0x100126d5c: vaddss xmm1, xmm1, xmm0
0x100126d60: vaddss xmm1, xmm1, xmm1
0x100126d64: vsqrtss xmm1, xmm1, xmm1
0x100126d68: vdivss xmm0, xmm0, xmm1
0x100126d6c: vmovss xmm2, dword ptr [rip + 0x97e350] ; 0x100aa50c4
0x100126d74: vmulps xmm2, xmm4, xmm2
0x100126d78: vpermilps xmm3, xmm4, 0xd2
0x100126d7e: vmulps xmm3, xmm3, xmm6
0x100126d82: vsubps xmm2, xmm2, xmm3
0x100126d86: vpermilps xmm2, xmm2, 0xd2
0x100126d8c: vpermilps xmm0, xmm0, 0xc0
0x100126d92: vmulps xmm0, xmm2, xmm0
0x100126d96: vmulss xmm1, xmm1, dword ptr [rip + 0x97d81a] ; 0x100aa45b8
0x100126d9e: vinsertps xmm0, xmm0, xmm1, 0x30
0x100126da4: jmp 0x1001270f2 ; 0x1001270f2
0x100126da9: vmovaps xmm0, xmmword ptr [rsp + 0x10]
0x100126daf: vdivss xmm0, xmm0, dword ptr [rip + 0x980a39] ; 0x100aa77f0
0x100126db7: vmovss xmm1, dword ptr [rip + 0x980335] ; 0x100aa70f4
0x100126dbf: vmaxss xmm0, xmm1, xmm0
0x100126dc3: vmovss xmm1, dword ptr [rip + 0x980ef5] ; 0x100aa7cc0
0x100126dcb: vminss xmm4, xmm1, xmm0
0x100126dcf: mov rax, qword ptr [r12 + 0x2a0]
0x100126dd7: vmovss xmm0, dword ptr [r12 + 0x1008]
0x100126de1: vmulss xmm1, xmm4, dword ptr [rip + 0x980a03] ; 0x100aa77ec
0x100126de9: vxorps xmm2, xmm2, xmm2
0x100126ded: vcmpnless xmm2, xmm2, xmm0
0x100126df2: vblendvps xmm1, xmm0, xmm1, xmm2
0x100126df8: vmulss xmm1, xmm1, dword ptr [rip + 0x97d7b8] ; 0x100aa45b8
0x100126e00: vmovss dword ptr [rax + 0x80], xmm1
0x100126e08: vaddss xmm0, xmm0, dword ptr [rip + 0x982874] ; 0x100aa9684
0x100126e10: vmovss dword ptr [rax + 0x84], xmm0
0x100126e18: vmovss xmm0, dword ptr [rip + 0x97e2a0] ; 0x100aa50c0
0x100126e20: vdivss xmm1, xmm0, xmm4
0x100126e24: vminss xmm1, xmm0, xmm1
0x100126e28: vmovss dword ptr [rax + 0x90], xmm1
0x100126e30: vmovaps xmm1, xmmword ptr [rsp]
0x100126e35: vucomiss xmm1, dword ptr [rip + 0x9809ab] ; 0x100aa77e8
0x100126e3d: jbe 0x100126e88
0x100126e3f: vmovaps xmm1, xmmword ptr [rsp + 0x180]
0x100126e48: vmulps xmm2, xmm1, xmm1
0x100126e4c: vmovshdup xmm3, xmm2
0x100126e50: vaddss xmm3, xmm2, xmm3
0x100126e54: vpermilpd xmm2, xmm2, 1
0x100126e5a: vaddss xmm2, xmm2, xmm3
0x100126e5e: vsqrtss xmm2, xmm2, xmm2
0x100126e62: vucomiss xmm2, dword ptr [rip + 0x980a5a] ; 0x100aa78c4
0x100126e6a: vmovss xmm5, dword ptr [rip + 0x980a52] ; 0x100aa78c4
0x100126e72: vmovaps xmm6, xmmword ptr [rip + 0x984816] ; 0x100aab690
0x100126e7a: jbe 0x100126ea0
0x100126e7c: vpermilps xmm2, xmm2, 0xc0
0x100126e82: vdivps xmm1, xmm1, xmm2
0x100126e86: jmp 0x100126ea0 ; 0x100126ea0
0x100126e88: vmovaps xmm1, xmmword ptr [rip + 0x982450] ; 0x100aa92e0
0x100126e90: vmovss xmm5, dword ptr [rip + 0x980a2c] ; 0x100aa78c4
0x100126e98: vmovaps xmm6, xmmword ptr [rip + 0x9847f0] ; 0x100aab690
0x100126ea0: vmulps xmm2, xmm1, xmm1
0x100126ea4: vmovshdup xmm3, xmm2
0x100126ea8: vaddss xmm3, xmm2, xmm3
0x100126eac: vpermilpd xmm2, xmm2, 1
0x100126eb2: vaddss xmm2, xmm2, xmm3
0x100126eb6: vsqrtss xmm2, xmm2, xmm2
0x100126eba: vucomiss xmm2, dword ptr [rip + 0x980a02] ; 0x100aa78c4
0x100126ec2: vmovss dword ptr [rsp + 0x10], xmm4
0x100126ec8: jbe 0x100126ed4
0x100126eca: vpermilps xmm2, xmm2, 0xc0
0x100126ed0: vdivps xmm1, xmm1, xmm2
0x100126ed4: vxorps xmm2, xmm1, xmmword ptr [rip + 0x980a24] ; 0x100aa7900
0x100126edc: vmulps xmm3, xmm1, xmm1
0x100126ee0: vmovshdup xmm4, xmm3
0x100126ee4: vaddss xmm4, xmm3, xmm4
0x100126ee8: vpermilpd xmm3, xmm3, 1
0x100126eee: vaddss xmm3, xmm3, xmm4
0x100126ef2: vsqrtss xmm3, xmm3, xmm3
0x100126ef6: vucomiss xmm3, dword ptr [rip + 0x9809c6] ; 0x100aa78c4
0x100126efe: jbe 0x100126f0a
0x100126f00: vpermilps xmm3, xmm3, 0xc0
0x100126f06: vdivps xmm2, xmm2, xmm3
0x100126f0a: vmulps xmm2, xmm2, xmmword ptr [rip + 0x98477e] ; 0x100aab690
0x100126f12: vmovshdup xmm3, xmm2
0x100126f16: vaddss xmm3, xmm2, xmm3
0x100126f1a: vpermilpd xmm2, xmm2, 1
0x100126f20: vaddss xmm2, xmm2, xmm3
0x100126f24: vaddss xmm2, xmm2, dword ptr [rip + 0x97e198] ; 0x100aa50c4
0x100126f2c: vandps xmm2, xmm2, xmmword ptr [rip + 0x9809dc] ; 0x100aa7910
0x100126f34: vucomiss xmm5, xmm2
0x100126f38: jae 0x100126f9a
0x100126f3a: vmulps xmm2, xmm1, xmm6
0x100126f3e: vmovshdup xmm3, xmm2
0x100126f42: vaddss xmm3, xmm2, xmm3
0x100126f46: vpermilpd xmm2, xmm2, 1
0x100126f4c: vaddss xmm2, xmm2, xmm3
0x100126f50: vaddss xmm2, xmm2, xmm0
0x100126f54: vaddss xmm2, xmm2, xmm2
0x100126f58: vsqrtss xmm2, xmm2, xmm2
0x100126f5c: vdivss xmm0, xmm0, xmm2
0x100126f60: vmovss xmm3, dword ptr [rip + 0x97e15c] ; 0x100aa50c4
0x100126f68: vmulps xmm3, xmm1, xmm3
0x100126f6c: vpermilps xmm1, xmm1, 0xd2
0x100126f72: vmulps xmm1, xmm1, xmm6
0x100126f76: vsubps xmm1, xmm3, xmm1
0x100126f7a: vpermilps xmm1, xmm1, 0xd2
0x100126f80: vpermilps xmm0, xmm0, 0xc0
0x100126f86: vmulps xmm0, xmm1, xmm0
0x100126f8a: vmulss xmm1, xmm2, dword ptr [rip + 0x97d626] ; 0x100aa45b8
0x100126f92: vinsertps xmm0, xmm0, xmm1, 0x30
0x100126f98: jmp 0x100126fa2 ; 0x100126fa2
0x100126f9a: vmovaps xmm0, xmmword ptr [rip + 0x9846fe] ; 0x100aab6a0
0x100126fa2: vmovaps xmmword ptr [rax + 0x30], xmm0
0x100126fa7: vpermilps xmm1, xmm0, 0xe7
0x100126fad: vucomiss xmm1, xmm1
0x100126fb1: jp 0x10012bd65
0x100126fb7: vmovshdup xmm1, xmm0
0x100126fbb: vucomiss xmm0, xmm1
0x100126fbf: jp 0x10012bd65
0x100126fc5: vpermilpd xmm0, xmm0, 1
0x100126fcb: vucomiss xmm0, xmm0
0x100126fcf: jp 0x10012bd65
0x100126fd5: mov rbx, qword ptr [r12 + 0x2a0]
0x100126fdd: vmovaps xmm0, xmmword ptr [rsp + 0x180]
0x100126fe6: vmulps xmm0, xmm0, xmmword ptr [rip + 0x9808f2] ; 0x100aa78e0
0x100126fee: vmulps xmm0, xmm0, xmmword ptr [rip + 0x98305a] ; 0x100aaa050
0x100126ff6: vmovaps xmmword ptr [rsp], xmm0
0x100126ffb: lea rdi, [rsp + 0x460]
0x100127003: mov rsi, qword ptr [rbp + 0x20]
0x100127007: call 0x10076bef0 ; 0x10076bef0
0x10012700c: vmovaps xmm0, xmmword ptr [rsp + 0x460]
0x100127015: vmulps xmm0, xmm0, xmmword ptr [rip + 0x984713] ; 0x100aab730
0x10012701d: vaddps xmm0, xmm0, xmmword ptr [rsp]
0x100127022: vmovaps xmmword ptr [rbx + 0x50], xmm0
0x100127027: mov rbx, qword ptr [r12 + 0x2a0]
0x10012702f: lea r14, [rip + 0xa3b3d2] ; 0x100b62408 Storm
0x100127036: mov r13, qword ptr [rbp + 0x88]
0x10012703d: mov rdi, r13
0x100127040: mov rsi, r14
0x100127043: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x100127048: xor ecx, ecx
0x10012704a: test eax, eax
0x10012704c: sete cl
0x10012704f: lea rax, [rip + 0x984822] ; 0x100aab878
0x100127056: vmovss xmm0, dword ptr [rax + rcx*4]
0x10012705b: vmovss dword ptr [rbx + 0x180], xmm0
0x100127063: lea rax, [rip + 0x1edd286] ; 0x1020042f0
0x10012706a: vmovaps xmm0, xmmword ptr [rax]
0x10012706e: vmovaps xmmword ptr [rbx + 0x120], xmm0
0x100127076: vmovaps xmmword ptr [rbx + 0x110], xmm0
0x10012707e: mov rbx, qword ptr [r12 + 0x2a0]
0x100127086: mov rdi, r13
0x100127089: mov rsi, r14
0x10012708c: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x100127091: xor ecx, ecx
0x100127093: test eax, eax
0x100127095: sete cl
0x100127098: vmovss xmm0, dword ptr [rip + 0x98074c] ; 0x100aa77ec
0x1001270a0: vmaxss xmm0, xmm0, dword ptr [rsp + 0x10]
0x1001270a6: lea rax, [rip + 0x9847d3] ; 0x100aab880
0x1001270ad: vmulss xmm0, xmm0, dword ptr [rax + rcx*4]
0x1001270b2: vmovss dword ptr [rbx + 0x8c], xmm0
0x1001270ba: mov rax, qword ptr [r12 + 0x298]
0x1001270c2: mov dword ptr [rax + 0x80], 0
0x1001270cc: mov dword ptr [r12 + 0x1008], 0xbf800000
0x1001270d8: mov r14, qword ptr [rsp + 0x170]
0x1001270e0: mov r13, qword ptr [rsp + 0x88]
0x1001270e8: jmp 0x100127137 ; 0x100127137
0x1001270ea: vmovaps xmm0, xmmword ptr [rip + 0x9845ae] ; 0x100aab6a0
0x1001270f2: vmovaps xmmword ptr [rax + 0x30], xmm0
0x1001270f7: vpermilps xmm1, xmm0, 0xe7
0x1001270fd: vucomiss xmm1, xmm1
0x100127101: jp 0x10012bd65
0x100127107: vmovshdup xmm1, xmm0
0x10012710b: vucomiss xmm0, xmm1
0x10012710f: jp 0x10012bd65
0x100127115: vpermilpd xmm0, xmm0, 1
0x10012711b: vucomiss xmm0, xmm0
0x10012711f: jp 0x10012bd65
0x100127125: mov rax, qword ptr [r12 + 0x2a0]
0x10012712d: mov dword ptr [rax + 0x80], 0
0x100127137: lea rbx, [rsp + 0x600]
0x10012713f: mov rdi, rbx
0x100127142: mov rsi, r15
0x100127145: call 0x10035c9d0 ; 0x10035c9d0
0x10012714a: mov rdi, rbx
0x10012714d: call 0x10035bbb0 ; 0x10035bbb0
0x100127152: test al, al
0x100127154: je 0x100127175
0x100127156: mov rdi, r15
0x100127159: call 0x10035ca00 ; 0x10035ca00
0x10012715e: mov rbx, rax
0x100127161: cmp dword ptr [rbx + 0x48], 0
0x100127165: je 0x1001271c6
0x100127167: mov rax, qword ptr [rsp + 0x28]
0x10012716c: mov rsi, qword ptr [rax + 0x250]
0x100127173: jmp 0x1001271d2 ; 0x1001271d2
0x100127175: lea rbx, [rsp + 0x600]
0x10012717d: mov rdi, rbx
0x100127180: mov rsi, r15
0x100127183: call 0x10035c9d0 ; 0x10035c9d0
0x100127188: mov rdi, rbx
0x10012718b: call 0x10035bbb0 ; 0x10035bbb0
0x100127190: test al, al
0x100127192: mov rbx, qword ptr [rsp + 0x160]
0x10012719a: jne 0x100127291
0x1001271a0: cmp dword ptr [r12 + 0x360], 3
0x1001271a9: je 0x100127291
0x1001271af: mov rax, qword ptr [r12 + 0x2b0]
0x1001271b7: mov dword ptr [rax + 0x80], 0
0x1001271c1: jmp 0x100127291 ; 0x100127291
0x1001271c6: mov rax, qword ptr [rsp + 0x28]
0x1001271cb: mov rsi, qword ptr [rax + 0x248]
0x1001271d2: lea rdi, [rsp + 0x600]
0x1001271da: call 0x1007f26b0 ; 0x1007f26b0
0x1001271df: mov rdi, rbx
0x1001271e2: call 0x10035bb10 ; 0x10035bb10
0x1001271e7: test rax, rax
0x1001271ea: je 0x100127202
0x1001271ec: cmp dword ptr [rbx + 0x30], 0
0x1001271f0: mov rax, qword ptr [rax]
0x1001271f3: mov rax, qword ptr [rax + 0x20]
0x1001271f7: je 0x10012722e
0x1001271f9: mov rsi, qword ptr [rax + 0x250]
0x100127200: jmp 0x100127235 ; 0x100127235
0x100127202: mov rdi, rbx
0x100127205: call 0x10012f150 ; 0x10012f150
0x10012720a: lea rsi, [rax + 0x40]
0x10012720e: lea rdi, [rsp + 0x580]
0x100127216: call 0x1007f26b0 ; 0x1007f26b0
0x10012721b: vmovapd xmm0, xmmword ptr [rsp + 0x580]
0x100127224: mov rbx, qword ptr [rsp + 0x160]
0x10012722c: jmp 0x100127253 ; 0x100127253
0x10012722e: mov rsi, qword ptr [rax + 0x248]
0x100127235: lea rdi, [rsp + 0x580]
0x10012723d: call 0x1007f26b0 ; 0x1007f26b0
0x100127242: mov rbx, qword ptr [rsp + 0x160]
0x10012724a: vmovapd xmm0, xmmword ptr [rsp + 0x580]
0x100127253: mov rax, qword ptr [r12 + 0x2b0]
0x10012725b: mov dword ptr [rax + 0x80], 0
0x100127265: vmovaps xmm1, xmmword ptr [rsp + 0x600]
0x10012726e: vmovaps xmmword ptr [rax + 0x20], xmm1
0x100127273: mov rax, qword ptr [r12 + 0x2b0]
0x10012727b: mov byte ptr [rax + 0x188], 1
0x100127282: mov byte ptr [rax + 0xae], 1
0x100127289: vmovapd xmmword ptr [rax + 0x160], xmm0
0x100127291: mov rdi, rbx
0x100127294: call 0x100111f30 ; 0x100111f30
0x100127299: test al, al
0x10012729b: je 0x1001273c0
0x1001272a1: vmovaps xmm0, xmmword ptr [rbx + 0x20]
0x1001272a6: vsubps xmm0, xmm0, xmmword ptr [rbx + 0x10]
0x1001272ab: vmovaps xmmword ptr [rsp + 0x10], xmm0
0x1001272b1: mov rdi, rbx
0x1001272b4: call 0x100111f50 ; 0x100111f50
0x1001272b9: vmulss xmm0, xmm0, dword ptr [rip + 0x97d2f7] ; 0x100aa45b8
0x1001272c1: vmovss dword ptr [rsp], xmm0
0x1001272c6: mov rdi, rbx
0x1001272c9: call 0x100111f50 ; 0x100111f50
0x1001272ce: vmovss xmm5, dword ptr [rsp]
0x1001272d3: vaddss xmm0, xmm0, xmm0
0x1001272d7: vsubss xmm0, xmm0, xmm5
0x1001272db: vucomiss xmm0, dword ptr [rip + 0x9805e1] ; 0x100aa78c4
0x1001272e3: vmovss xmm4, dword ptr [rip + 0x97ddd5] ; 0x100aa50c0
0x1001272eb: ja 0x1001272ff
0x1001272ed: vmovss xmm1, dword ptr [rip + 0x9822db] ; 0x100aa95d0
0x1001272f5: vucomiss xmm1, xmm0
0x1001272f9: vmovaps xmm1, xmm4
0x1001272fd: jbe 0x100127327
0x1001272ff: vmovaps xmm1, xmmword ptr [rsp + 0x10]
0x100127305: vmulps xmm1, xmm1, xmm1
0x100127309: vpermilpd xmm2, xmm1, 1
0x10012730f: vmovshdup xmm3, xmm1
0x100127313: vaddss xmm1, xmm1, xmm3
0x100127317: vaddss xmm1, xmm2, xmm1
0x10012731b: vsqrtss xmm1, xmm1, xmm1
0x10012731f: vsubss xmm1, xmm1, xmm5
0x100127323: vdivss xmm1, xmm1, xmm0
0x100127327: vxorps xmm0, xmm0, xmm0
0x10012732b: vmaxss xmm0, xmm0, xmm1
0x10012732f: vminss xmm0, xmm4, xmm0
0x100127333: vmovss dword ptr [rsp], xmm0
0x100127338: vmovss xmm1, dword ptr [r12 + 0x334]
0x100127342: vmovss dword ptr [rsp + 0x10], xmm1
0x100127348: xor eax, eax
0x10012734a: vucomiss xmm0, xmm1
0x10012734e: seta al
0x100127351: lea rcx, [rip + 0x984530] ; 0x100aab888
0x100127358: vmovss xmm0, dword ptr [rcx + rax*4]
0x10012735d: call 0x100aa2858 ; 0x100aa2858 _logf
0x100127362: vcvtss2sd xmm0, xmm0, xmm0
0x100127366: vdivsd xmm0, xmm0, qword ptr [rip + 0x981352] ; 0x100aa86c0
0x10012736e: vcvtsd2ss xmm0, xmm0, xmm0
0x100127372: vmulss xmm0, xmm0, dword ptr [rsp + 0x60]
0x100127378: call 0x100aa2708 ; 0x100aa2708 _expf
0x10012737d: vmovss xmm1, dword ptr [rip + 0x97dd3b] ; 0x100aa50c0
0x100127385: vsubss xmm0, xmm1, xmm0
0x100127389: vsubss xmm1, xmm1, xmm0
0x10012738d: vmulss xmm1, xmm1, dword ptr [rsp + 0x10]
0x100127393: vmulss xmm0, xmm0, dword ptr [rsp]
0x100127398: vaddss xmm0, xmm0, xmm1
0x10012739c: vmovss dword ptr [r12 + 0x334], xmm0
0x1001273a6: vaddss xmm0, xmm0, xmm0
0x1001273aa: vxorps xmm1, xmm1, xmm1
0x1001273ae: vmaxss xmm0, xmm1, xmm0
0x1001273b2: vmovss xmm1, dword ptr [rip + 0x980432] ; 0x100aa77ec
0x1001273ba: vminss xmm0, xmm1, xmm0
0x1001273be: jmp 0x1001273e0 ; 0x1001273e0
0x1001273c0: vmovaps xmm0, xmmword ptr [rsp + 0x60]
0x1001273c6: vmulss xmm0, xmm0, dword ptr [rip + 0x98441e] ; 0x100aab7ec
0x1001273ce: vaddss xmm0, xmm0, dword ptr [r12 + 0x338]
0x1001273d8: vxorps xmm1, xmm1, xmm1
0x1001273dc: vmaxss xmm0, xmm0, xmm1
0x1001273e0: vmovss dword ptr [r12 + 0x338], xmm0
0x1001273ea: vandps xmm0, xmm0, xmmword ptr [rip + 0x98051e] ; 0x100aa7910
0x1001273f2: vmovss xmm1, dword ptr [rip + 0x9804ca] ; 0x100aa78c4
0x1001273fa: vucomiss xmm1, xmm0
0x1001273fe: jb 0x10012740c
0x100127400: mov dword ptr [r12 + 0x334], 0
0x10012740c: mov rbx, qword ptr [r12 + 0x340]
0x100127414: mov rax, qword ptr [rsp + 0x28]
0x100127419: mov rsi, qword ptr [rax + 0x288]
0x100127420: lea rdi, [rsp + 0x450]
0x100127428: call 0x1007f26b0 ; 0x1007f26b0
0x10012742d: vmovaps xmm0, xmmword ptr [rsp + 0x450]
0x100127436: vmovaps xmmword ptr [rbx + 0x20], xmm0
0x10012743b: mov rax, qword ptr [r12 + 0x340]
0x100127443: mov rcx, qword ptr [rsp + 0x40]
0x100127448: vmovaps xmm0, xmmword ptr [rcx + 0x60]
0x10012744d: vmulps xmm1, xmm0, xmm0
0x100127451: vmovshdup xmm2, xmm1
0x100127455: vaddss xmm2, xmm1, xmm2
0x100127459: vpermilpd xmm1, xmm1, 1
0x10012745f: vaddss xmm1, xmm1, xmm2
0x100127463: vsqrtss xmm1, xmm1, xmm1
0x100127467: vucomiss xmm1, dword ptr [rip + 0x980455] ; 0x100aa78c4
0x10012746f: jbe 0x10012747b
0x100127471: vpermilps xmm1, xmm1, 0xc0
0x100127477: vdivps xmm0, xmm0, xmm1
0x10012747b: vmovaps xmm4, xmmword ptr [rip + 0x98420d] ; 0x100aab690
0x100127483: vxorps xmm1, xmm0, xmmword ptr [rip + 0x980475] ; 0x100aa7900
0x10012748b: vmulps xmm2, xmm0, xmm0
0x10012748f: vmovshdup xmm3, xmm2
0x100127493: vaddss xmm3, xmm2, xmm3
0x100127497: vpermilpd xmm2, xmm2, 1
0x10012749d: vaddss xmm2, xmm2, xmm3
0x1001274a1: vsqrtss xmm2, xmm2, xmm2
0x1001274a5: vucomiss xmm2, dword ptr [rip + 0x980417] ; 0x100aa78c4
0x1001274ad: vmovss xmm3, dword ptr [rip + 0x98040f] ; 0x100aa78c4
0x1001274b5: jbe 0x1001274c1
0x1001274b7: vpermilps xmm2, xmm2, 0xc0
0x1001274bd: vdivps xmm1, xmm1, xmm2
0x1001274c1: vmulps xmm1, xmm1, xmmword ptr [rip + 0x9841c7] ; 0x100aab690
0x1001274c9: vmovshdup xmm2, xmm1
0x1001274cd: vaddss xmm2, xmm1, xmm2
0x1001274d1: vpermilpd xmm1, xmm1, 1
0x1001274d7: vaddss xmm1, xmm1, xmm2
0x1001274db: vaddss xmm1, xmm1, dword ptr [rip + 0x97dbe1] ; 0x100aa50c4
0x1001274e3: vandps xmm1, xmm1, xmmword ptr [rip + 0x980425] ; 0x100aa7910
0x1001274eb: vucomiss xmm3, xmm1
0x1001274ef: jae 0x100127559
0x1001274f1: vmulps xmm1, xmm0, xmm4
0x1001274f5: vmovshdup xmm2, xmm1
0x1001274f9: vaddss xmm2, xmm1, xmm2
0x1001274fd: vpermilpd xmm1, xmm1, 1
0x100127503: vaddss xmm1, xmm1, xmm2
0x100127507: vmovss xmm2, dword ptr [rip + 0x97dbb1] ; 0x100aa50c0
0x10012750f: vaddss xmm1, xmm1, xmm2
0x100127513: vaddss xmm1, xmm1, xmm1
0x100127517: vsqrtss xmm1, xmm1, xmm1
0x10012751b: vdivss xmm2, xmm2, xmm1
0x10012751f: vmovss xmm3, dword ptr [rip + 0x97db9d] ; 0x100aa50c4
0x100127527: vmulps xmm3, xmm0, xmm3
0x10012752b: vpermilps xmm0, xmm0, 0xd2
0x100127531: vmulps xmm0, xmm0, xmm4
0x100127535: vsubps xmm0, xmm3, xmm0
0x100127539: vpermilps xmm0, xmm0, 0xd2
0x10012753f: vpermilps xmm2, xmm2, 0xc0
0x100127545: vmulps xmm0, xmm0, xmm2
0x100127549: vmulss xmm1, xmm1, dword ptr [rip + 0x97d067] ; 0x100aa45b8
0x100127551: vinsertps xmm0, xmm0, xmm1, 0x30
0x100127557: jmp 0x100127561 ; 0x100127561
0x100127559: vmovaps xmm0, xmmword ptr [rip + 0x98413f] ; 0x100aab6a0
0x100127561: vmovaps xmmword ptr [rax + 0x30], xmm0
0x100127566: vpermilps xmm1, xmm0, 0xe7
0x10012756c: vucomiss xmm1, xmm1
0x100127570: jp 0x10012bd65
0x100127576: vmovshdup xmm1, xmm0
0x10012757a: vucomiss xmm0, xmm1
0x10012757e: jp 0x10012bd65
0x100127584: vpermilpd xmm0, xmm0, 1
0x10012758a: vucomiss xmm0, xmm0
0x10012758e: jp 0x10012bd65
0x100127594: mov rax, qword ptr [r12 + 0x340]
0x10012759c: mov dword ptr [rax + 0x80], 0
0x1001275a6: vmovss xmm0, dword ptr [r12 + 0x334]
0x1001275b0: vmulss xmm0, xmm0, xmm0
0x1001275b4: vmovss xmm2, dword ptr [rip + 0x97db04] ; 0x100aa50c0
0x1001275bc: vminss xmm0, xmm2, xmm0
0x1001275c0: vsubss xmm1, xmm2, xmm0
0x1001275c4: vmulss xmm1, xmm1, dword ptr [rip + 0x97cfec] ; 0x100aa45b8
0x1001275cc: vmulss xmm0, xmm0, dword ptr [rip + 0x984234] ; 0x100aab808
0x1001275d4: vaddss xmm0, xmm0, xmm1
0x1001275d8: vmovss dword ptr [rax + 0x8c], xmm0
0x1001275e0: vpermilps xmm0, xmm2, 0xc0
0x1001275e6: vinsertps xmm0, xmm0, dword ptr [r12 + 0x338], 0x30
0x1001275f1: vmovaps xmmword ptr [rax + 0x110], xmm0
0x1001275f9: lea rax, [rip + 0x1cc6b38] ; 0x101dee138
0x100127600: cmp byte ptr [rax], 0
0x100127603: je 0x100127878
0x100127609: mov rbx, qword ptr [r13 + 0x50]
0x10012760d: lea r15, [rsp + 0x600]
0x100127615: mov rdi, r15
0x100127618: mov rsi, rbx
0x10012761b: call 0x10035cef0 ; 0x10035cef0
0x100127620: mov rdi, r15
0x100127623: mov rsi, rbx
0x100127626: call 0x10035bca0 ; 0x10035bca0
0x10012762b: test al, al
0x10012762d: je 0x100127878
0x100127633: mov rax, qword ptr [r13 + 0x18]
0x100127637: cmp dword ptr [rax + 0xc70], 2
0x10012763e: jb 0x100127878
0x100127644: movzx edi, byte ptr [rax + 0x160]
0x10012764b: call 0x10043fb60 ; 0x10043fb60
0x100127650: cmp al, 2
0x100127652: jne 0x100127878
0x100127658: mov rdx, qword ptr [r13 + 0x18]
0x10012765c: vmovaps xmm1, xmmword ptr [rdx + 0x130]
0x100127664: vmovss xmm0, dword ptr [rdx + 0x14]
0x100127669: vmovshdup xmm2, xmm1
0x10012766d: vmovaps xmmword ptr [rsp], xmm2
0x100127672: vsubss xmm0, xmm0, xmm2
0x100127676: vaddss xmm0, xmm0, dword ptr [rip + 0x98418e] ; 0x100aab80c
0x10012767e: vdivss xmm0, xmm0, dword ptr [rip + 0x9838d6] ; 0x100aaaf5c
0x100127686: vxorps xmm2, xmm2, xmm2
0x10012768a: vmaxss xmm0, xmm2, xmm0
0x10012768e: vmovss xmm7, dword ptr [rip + 0x97da2a] ; 0x100aa50c0
0x100127696: vminss xmm0, xmm7, xmm0
0x10012769a: vucomiss xmm0, xmm2
0x10012769e: jbe 0x10012774d
0x1001276a4: vmovaps xmm4, xmmword ptr [rdx + 0x50]
0x1001276a9: add rdx, 0x50
0x1001276ad: lea rax, [rip + 0x99a0e8] ; 0x100ac179c
0x1001276b4: vmovss xmm3, dword ptr [rax]
0x1001276b8: lea rax, [rip + 0x99a115] ; 0x100ac17d4
0x1001276bf: vmovss xmm2, dword ptr [rax]
0x1001276c3: vsubss xmm3, xmm3, xmm2
0x1001276c7: vucomiss xmm3, dword ptr [rip + 0x9801f5] ; 0x100aa78c4
0x1001276cf: ja 0x1001276e3
0x1001276d1: vmovss xmm5, dword ptr [rip + 0x981ef7] ; 0x100aa95d0
0x1001276d9: vucomiss xmm5, xmm3
0x1001276dd: vmovaps xmm5, xmm7
0x1001276e1: jbe 0x100127705
0x1001276e3: vmulps xmm4, xmm4, xmm4
0x1001276e7: vpermilpd xmm5, xmm4, 1
0x1001276ed: vmovshdup xmm6, xmm4
0x1001276f1: vaddss xmm4, xmm4, xmm6
0x1001276f5: vaddss xmm4, xmm5, xmm4
0x1001276f9: vsqrtss xmm4, xmm4, xmm4
0x1001276fd: vsubss xmm2, xmm4, xmm2
0x100127701: vdivss xmm5, xmm2, xmm3
0x100127705: vxorps xmm2, xmm2, xmm2
0x100127709: vmaxss xmm2, xmm2, xmm5
0x10012770d: vminss xmm2, xmm7, xmm2
0x100127711: vmulss xmm2, xmm2, dword ptr [rip + 0x9800d3] ; 0x100aa77ec
0x100127719: vaddss xmm2, xmm2, dword ptr [rip + 0x97ce97] ; 0x100aa45b8
0x100127721: vmulss xmm0, xmm0, xmm2
0x100127725: vaddps xmm1, xmm1, xmmword ptr [rip + 0x9812e3] ; 0x100aa8a10
0x10012772d: vmovaps xmmword ptr [rsp + 0x600], xmm1
0x100127736: lea rsi, [rsp + 0x600]
0x10012773e: vxorps xmm1, xmm1, xmm1
0x100127742: xor ecx, ecx
0x100127744: mov rdi, qword ptr [rbp + 0x48]
0x100127748: call 0x1002ca910 ; 0x1002ca910
0x10012774d: cmp byte ptr [r13 + 0x1ef8], 0
0x100127755: je 0x100127878
0x10012775b: mov rax, qword ptr [r13 + 0x18]
0x10012775f: cmp byte ptr [rax + 0xbb0], 0
0x100127766: jne 0x100127878
0x10012776c: mov rax, qword ptr [r13 + 0x20]
0x100127770: mov rsi, qword ptr [rax + 0x258]
0x100127777: lea rdi, [rsp + 0x440]
0x10012777f: call 0x1007f26b0 ; 0x1007f26b0
0x100127784: vmovss xmm0, dword ptr [rsp + 0x444]
0x10012778d: vsubss xmm0, xmm0, dword ptr [rsp]
0x100127792: vmovss xmm1, dword ptr [rip + 0x98004e] ; 0x100aa77e8
0x10012779a: vucomiss xmm1, xmm0
0x10012779e: jbe 0x1001277f2
0x1001277a0: mov rax, qword ptr [r13 + 0x20]
0x1001277a4: mov rsi, qword ptr [rax + 0x258]
0x1001277ab: lea rbx, [rsp + 0x600]
0x1001277b3: mov rdi, rbx
0x1001277b6: call 0x1007f26b0 ; 0x1007f26b0
0x1001277bb: mov rax, qword ptr [r13 + 0x20]
0x1001277bf: vmovaps xmm0, xmmword ptr [rax + 0x4b0]
0x1001277c7: vmovaps xmmword ptr [rsp + 0x580], xmm0
0x1001277d0: lea rdx, [rsp + 0x580]
0x1001277d8: vmovss xmm0, dword ptr [rip + 0x980e18] ; 0x100aa85f8
0x1001277e0: vxorps xmm1, xmm1, xmm1
0x1001277e4: xor ecx, ecx
0x1001277e6: mov rsi, rbx
0x1001277e9: mov rdi, qword ptr [rbp + 0x48]
0x1001277ed: call 0x1002ca910 ; 0x1002ca910
0x1001277f2: mov rax, qword ptr [r13 + 0x20]
0x1001277f6: mov rsi, qword ptr [rax + 0x260]
0x1001277fd: lea rdi, [rsp + 0x430]
0x100127805: call 0x1007f26b0 ; 0x1007f26b0
0x10012780a: vmovss xmm0, dword ptr [rsp + 0x434]
0x100127813: vsubss xmm0, xmm0, dword ptr [rsp]
0x100127818: vmovss xmm1, dword ptr [rip + 0x97ffc8] ; 0x100aa77e8
0x100127820: vucomiss xmm1, xmm0
0x100127824: jbe 0x100127878
0x100127826: mov rax, qword ptr [r13 + 0x20]
0x10012782a: mov rsi, qword ptr [rax + 0x260]
0x100127831: lea rbx, [rsp + 0x600]
0x100127839: mov rdi, rbx
0x10012783c: call 0x1007f26b0 ; 0x1007f26b0
0x100127841: mov rax, qword ptr [r13 + 0x20]
0x100127845: vmovaps xmm0, xmmword ptr [rax + 0x4c0]
0x10012784d: vmovaps xmmword ptr [rsp + 0x580], xmm0
0x100127856: lea rdx, [rsp + 0x580]
0x10012785e: vmovss xmm0, dword ptr [rip + 0x980d92] ; 0x100aa85f8
0x100127866: vxorps xmm1, xmm1, xmm1
0x10012786a: xor ecx, ecx
0x10012786c: mov rdi, qword ptr [rbp + 0x48]
0x100127870: mov rsi, rbx
0x100127873: call 0x1002ca910 ; 0x1002ca910
0x100127878: mov rdi, r14
0x10012787b: call 0x1000f4950 ; 0x1000f4950
0x100127880: mov rbx, qword ptr [r12 + 0x2b8]
0x100127888: vxorps xmm0, xmm0, xmm0
0x10012788c: test al, al
0x10012788e: je 0x1001279dd
0x100127894: lea rdi, [rsp + 0x420]
0x10012789c: mov rsi, r14
0x10012789f: call 0x1000f4b00 ; 0x1000f4b00
0x1001278a4: vmovaps xmm0, xmmword ptr [rsp + 0x420]
0x1001278ad: vmovaps xmmword ptr [rbx + 0x20], xmm0
0x1001278b2: mov rax, qword ptr [r12 + 0x2b8]
0x1001278ba: mov rcx, qword ptr [rsp + 0x40]
0x1001278bf: vmovaps xmm0, xmmword ptr [rcx + 0x60]
0x1001278c4: vmulps xmm1, xmm0, xmm0
0x1001278c8: vmovshdup xmm2, xmm1
0x1001278cc: vaddss xmm2, xmm1, xmm2
0x1001278d0: vpermilpd xmm1, xmm1, 1
0x1001278d6: vaddss xmm1, xmm1, xmm2
0x1001278da: vsqrtss xmm1, xmm1, xmm1
0x1001278de: vucomiss xmm1, dword ptr [rip + 0x97ffde] ; 0x100aa78c4
0x1001278e6: mov r15, qword ptr [rsp + 0x78]
0x1001278eb: jbe 0x1001278f7
0x1001278ed: vpermilps xmm1, xmm1, 0xc0
0x1001278f3: vdivps xmm0, xmm0, xmm1
0x1001278f7: vmovss xmm4, dword ptr [rip + 0x97ffc5] ; 0x100aa78c4
0x1001278ff: vmovaps xmm5, xmmword ptr [rip + 0x983d89] ; 0x100aab690
0x100127907: vxorps xmm1, xmm0, xmmword ptr [rip + 0x97fff1] ; 0x100aa7900
0x10012790f: vmulps xmm2, xmm0, xmm0
0x100127913: vmovshdup xmm3, xmm2
0x100127917: vaddss xmm3, xmm2, xmm3
0x10012791b: vpermilpd xmm2, xmm2, 1
0x100127921: vaddss xmm2, xmm2, xmm3
0x100127925: vsqrtss xmm2, xmm2, xmm2
0x100127929: vucomiss xmm2, dword ptr [rip + 0x97ff93] ; 0x100aa78c4
0x100127931: mov r14, qword ptr [rbp + 0x40]
0x100127935: jbe 0x100127941
0x100127937: vpermilps xmm2, xmm2, 0xc0
0x10012793d: vdivps xmm1, xmm1, xmm2
0x100127941: vmulps xmm1, xmm1, xmmword ptr [rip + 0x983d47] ; 0x100aab690
0x100127949: vmovshdup xmm2, xmm1
0x10012794d: vaddss xmm2, xmm1, xmm2
0x100127951: vpermilpd xmm1, xmm1, 1
0x100127957: vaddss xmm1, xmm1, xmm2
0x10012795b: vaddss xmm1, xmm1, dword ptr [rip + 0x97d761] ; 0x100aa50c4
0x100127963: vandps xmm1, xmm1, xmmword ptr [rip + 0x97ffa5] ; 0x100aa7910
0x10012796b: vucomiss xmm4, xmm1
0x10012796f: jae 0x100127a0f
0x100127975: vmulps xmm1, xmm0, xmm5
0x100127979: vmovshdup xmm2, xmm1
0x10012797d: vaddss xmm2, xmm1, xmm2
0x100127981: vpermilpd xmm1, xmm1, 1
0x100127987: vaddss xmm1, xmm1, xmm2
0x10012798b: vmovss xmm2, dword ptr [rip + 0x97d72d] ; 0x100aa50c0
0x100127993: vaddss xmm1, xmm1, xmm2
0x100127997: vaddss xmm1, xmm1, xmm1
0x10012799b: vsqrtss xmm1, xmm1, xmm1
0x10012799f: vdivss xmm2, xmm2, xmm1
0x1001279a3: vmovss xmm3, dword ptr [rip + 0x97d719] ; 0x100aa50c4
0x1001279ab: vmulps xmm3, xmm0, xmm3
0x1001279af: vpermilps xmm0, xmm0, 0xd2
0x1001279b5: vmulps xmm0, xmm0, xmm5
0x1001279b9: vsubps xmm0, xmm3, xmm0
0x1001279bd: vpermilps xmm0, xmm0, 0xd2
0x1001279c3: vpermilps xmm2, xmm2, 0xc0
0x1001279c9: vmulps xmm0, xmm0, xmm2
0x1001279cd: vmulss xmm1, xmm1, dword ptr [rip + 0x97cbe3] ; 0x100aa45b8
0x1001279d5: vinsertps xmm0, xmm0, xmm1, 0x30
0x1001279db: jmp 0x100127a17 ; 0x100127a17
0x1001279dd: mov r15, qword ptr [rsp + 0x78]
0x1001279e2: mov r14, qword ptr [rbp + 0x40]
0x1001279e6: vmovss dword ptr [rbx + 0x80], xmm0
0x1001279ee: cmp byte ptr [r12 + 0x2c1], 0
0x1001279f7: je 0x100127aea
0x1001279fd: mov word ptr [r12 + 0x2c0], 0
0x100127a08: xor eax, eax
0x100127a0a: jmp 0x100127b3b ; 0x100127b3b
0x100127a0f: vmovaps xmm0, xmmword ptr [rip + 0x983c89] ; 0x100aab6a0
0x100127a17: vmovaps xmmword ptr [rax + 0x30], xmm0
0x100127a1c: vpermilps xmm1, xmm0, 0xe7
0x100127a22: vucomiss xmm1, xmm1
0x100127a26: jp 0x10012bd65
0x100127a2c: vmovshdup xmm1, xmm0
0x100127a30: vucomiss xmm0, xmm1
0x100127a34: jp 0x10012bd65
0x100127a3a: vpermilpd xmm0, xmm0, 1
0x100127a40: vucomiss xmm0, xmm0
0x100127a44: jp 0x10012bd65
0x100127a4a: mov rbx, qword ptr [r12 + 0x2b8]
0x100127a52: mov dword ptr [rbx + 0x9c], 0x3ccccccd
0x100127a5c: movabs rax, 0x3f4000003ecccccd
0x100127a66: mov qword ptr [rbx + 0x88], rax
0x100127a6d: mov dword ptr [rbx + 0x178], 0
0x100127a77: mov rax, qword ptr [rsp + 0x40]
0x100127a7c: vmovaps xmm0, xmmword ptr [rax + 0x50]
0x100127a81: vmulps xmm0, xmm0, xmm0
0x100127a85: vmovshdup xmm1, xmm0
0x100127a89: vaddss xmm1, xmm0, xmm1
0x100127a8d: vpermilpd xmm0, xmm0, 1
0x100127a93: vaddss xmm0, xmm0, xmm1
0x100127a97: vsqrtss xmm0, xmm0, xmm0
0x100127a9b: vdivss xmm0, xmm0, dword ptr [rip + 0x97fd4d] ; 0x100aa77f0
0x100127aa3: vxorps xmm1, xmm1, xmm1
0x100127aa7: vmaxss xmm0, xmm1, xmm0
0x100127aab: vmovss xmm2, dword ptr [rip + 0x97d60d] ; 0x100aa50c0
0x100127ab3: vminss xmm0, xmm2, xmm0
0x100127ab7: vsubss xmm2, xmm2, xmm0
0x100127abb: vmulss xmm1, xmm2, xmm1
0x100127abf: vmulss xmm0, xmm0, dword ptr [rip + 0x97fd21] ; 0x100aa77e8
0x100127ac7: vaddss xmm0, xmm0, xmm1
0x100127acb: vaddss xmm0, xmm0, dword ptr [rip + 0x983d3d] ; 0x100aab810
0x100127ad3: vmovss dword ptr [rbx + 0x80], xmm0
0x100127adb: cmp byte ptr [r12 + 0x2c1], 0
0x100127ae4: jne 0x1001279fd
0x100127aea: vmovss xmm0, dword ptr [r14 + 0xc]
0x100127af0: vucomiss xmm0, dword ptr [rip + 0x97fcf0] ; 0x100aa77e8
0x100127af8: jbe 0x100127b33
0x100127afa: mov rax, qword ptr [rsp + 0x28]
0x100127aff: mov rsi, qword ptr [rax + 0x298]
0x100127b06: lea rbx, [rsp + 0x510]
0x100127b0e: mov rdi, rbx
0x100127b11: call 0x1007f26b0 ; 0x1007f26b0
0x100127b16: mov rdi, r14
0x100127b19: mov rsi, qword ptr [rsp + 0xa8]
0x100127b21: mov rdx, rbx
0x100127b24: call 0x100567830 ; 0x100567830
0x100127b29: mov byte ptr [r12 + 0x2c0], al
0x100127b31: jmp 0x100127b3b ; 0x100127b3b
0x100127b33: mov al, byte ptr [r12 + 0x2c0]
0x100127b3b: vmovss xmm0, dword ptr [r14 + 0xc]
0x100127b41: vmulss xmm0, xmm0, dword ptr [r14 + 0x14]
0x100127b47: movzx eax, al
0x100127b4a: vcvtsi2ss xmm1, xmm8, eax
0x100127b4e: vmulss xmm0, xmm0, xmm1
0x100127b52: mov r14, qword ptr [r12 + 0x2c8]
0x100127b5a: mov rbx, qword ptr [rsp + 0x28]
0x100127b5f: vmovaps xmm1, xmmword ptr [rbx + 0x4d0]
0x100127b67: vmulps xmm1, xmm1, xmm1
0x100127b6b: vmovshdup xmm2, xmm1
0x100127b6f: vaddss xmm2, xmm1, xmm2
0x100127b73: vpermilpd xmm1, xmm1, 1
0x100127b79: vaddss xmm1, xmm1, xmm2
0x100127b7d: vsqrtss xmm1, xmm1, xmm1
0x100127b81: vmovss xmm3, dword ptr [rip + 0x97d537] ; 0x100aa50c0
0x100127b89: vaddss xmm1, xmm1, xmm3
0x100127b8d: vmulss xmm1, xmm0, xmm1
0x100127b91: vmovss dword ptr [r14 + 0x80], xmm1
0x100127b9a: mov rax, qword ptr [r12 + 0x2d0]
0x100127ba2: vmovaps xmm1, xmmword ptr [rbx + 0x4e0]
0x100127baa: vmulps xmm1, xmm1, xmm1
0x100127bae: vmovshdup xmm2, xmm1
0x100127bb2: vaddss xmm2, xmm1, xmm2
0x100127bb6: vpermilpd xmm1, xmm1, 1
0x100127bbc: vaddss xmm1, xmm1, xmm2
0x100127bc0: vsqrtss xmm1, xmm1, xmm1
0x100127bc4: vaddss xmm1, xmm1, xmm3
0x100127bc8: vmulss xmm1, xmm0, xmm1
0x100127bcc: vmovss dword ptr [rax + 0x80], xmm1
0x100127bd4: mov rax, qword ptr [r12 + 0x2d8]
0x100127bdc: vmovaps xmm1, xmmword ptr [rbx + 0x4f0]
0x100127be4: vmulps xmm1, xmm1, xmm1
0x100127be8: vmovshdup xmm2, xmm1
0x100127bec: vaddss xmm2, xmm1, xmm2
0x100127bf0: vpermilpd xmm1, xmm1, 1
0x100127bf6: vaddss xmm1, xmm1, xmm2
0x100127bfa: vsqrtss xmm1, xmm1, xmm1
0x100127bfe: vaddss xmm1, xmm1, xmm3
0x100127c02: vmulss xmm1, xmm0, xmm1
0x100127c06: vmovss dword ptr [rax + 0x80], xmm1
0x100127c0e: vxorps xmm1, xmm1, xmm1
0x100127c12: vucomiss xmm0, xmm1
0x100127c16: jbe 0x100128100
0x100127c1c: mov rsi, qword ptr [rbx + 0x310]
0x100127c23: lea rdi, [rsp + 0x410]
0x100127c2b: call 0x1007f26b0 ; 0x1007f26b0
0x100127c30: vmovaps xmm0, xmmword ptr [rsp + 0x410]
0x100127c39: vmovaps xmmword ptr [r14 + 0x20], xmm0
0x100127c3f: mov r14, qword ptr [r12 + 0x2d0]
0x100127c47: mov rsi, qword ptr [rbx + 0x318]
0x100127c4e: lea rdi, [rsp + 0x400]
0x100127c56: call 0x1007f26b0 ; 0x1007f26b0
0x100127c5b: vmovaps xmm0, xmmword ptr [rsp + 0x400]
0x100127c64: vmovaps xmmword ptr [r14 + 0x20], xmm0
0x100127c6a: mov r14, qword ptr [r12 + 0x2d8]
0x100127c72: mov rsi, qword ptr [rbx + 0x298]
0x100127c79: lea rdi, [rsp + 0x3f0]
0x100127c81: call 0x1007f26b0 ; 0x1007f26b0
0x100127c86: vmovaps xmm0, xmmword ptr [rsp + 0x3f0]
0x100127c8f: vmovaps xmmword ptr [r14 + 0x20], xmm0
0x100127c95: vmovss xmm0, dword ptr [r15 + 0x14bc]
0x100127c9e: vmulss xmm0, xmm0, dword ptr [rip + 0x9819da] ; 0x100aa9680
0x100127ca6: vaddss xmm0, xmm0, dword ptr [rip + 0x97d412] ; 0x100aa50c0
0x100127cae: vsqrtss xmm0, xmm0, xmm0
0x100127cb2: vmulss xmm0, xmm0, dword ptr [rip + 0x983b5a] ; 0x100aab814
0x100127cba: mov rax, qword ptr [r12 + 0x2c8]
0x100127cc2: vmovss dword ptr [rax + 0x9c], xmm0
0x100127cca: mov rcx, qword ptr [r12 + 0x2d0]
0x100127cd2: vmovss dword ptr [rcx + 0x9c], xmm0
0x100127cda: mov rcx, qword ptr [r12 + 0x2d8]
0x100127ce2: vmovss dword ptr [rcx + 0x9c], xmm0
0x100127cea: vmovaps xmm0, xmmword ptr [rsp + 0x180]
0x100127cf3: vaddps xmm1, xmm0, xmmword ptr [rip + 0x983a45] ; 0x100aab740
0x100127cfb: vmulps xmm0, xmm1, xmm1
0x100127cff: vmovshdup xmm2, xmm0
0x100127d03: vaddss xmm2, xmm0, xmm2
0x100127d07: vpermilpd xmm0, xmm0, 1
0x100127d0d: vaddss xmm0, xmm0, xmm2
0x100127d11: vsqrtss xmm0, xmm0, xmm0
0x100127d15: vucomiss xmm0, dword ptr [rip + 0x97fba7] ; 0x100aa78c4
0x100127d1d: jbe 0x100127d29
0x100127d1f: vpermilps xmm0, xmm0, 0xc0
0x100127d25: vdivps xmm1, xmm1, xmm0
0x100127d29: vmovss xmm6, dword ptr [rip + 0x97fb93] ; 0x100aa78c4
0x100127d31: mov rcx, qword ptr [rbp + 0x40]
0x100127d35: vxorps xmm0, xmm1, xmmword ptr [rip + 0x97fbc3] ; 0x100aa7900
0x100127d3d: vmulps xmm1, xmm1, xmm1
0x100127d41: vmovshdup xmm2, xmm1
0x100127d45: vaddss xmm2, xmm1, xmm2
0x100127d49: vpermilpd xmm1, xmm1, 1
0x100127d4f: vaddss xmm1, xmm1, xmm2
0x100127d53: vsqrtss xmm1, xmm1, xmm1
0x100127d57: vucomiss xmm1, dword ptr [rip + 0x97fb65] ; 0x100aa78c4
0x100127d5f: vmovaps xmm2, xmm0
0x100127d63: vmovaps xmm7, xmmword ptr [rip + 0x983925] ; 0x100aab690
0x100127d6b: jbe 0x100127d77
0x100127d6d: vpermilps xmm2, xmm1, 0xc0
0x100127d73: vdivps xmm2, xmm0, xmm2
0x100127d77: vxorps xmm3, xmm2, xmmword ptr [rip + 0x97fb81] ; 0x100aa7900
0x100127d7f: vmulps xmm4, xmm2, xmm2
0x100127d83: vmovshdup xmm5, xmm4
0x100127d87: vaddss xmm5, xmm4, xmm5
0x100127d8b: vpermilpd xmm4, xmm4, 1
0x100127d91: vaddss xmm4, xmm4, xmm5
0x100127d95: vsqrtss xmm4, xmm4, xmm4
0x100127d99: vucomiss xmm4, dword ptr [rip + 0x97fb23] ; 0x100aa78c4
0x100127da1: jbe 0x100127dad
0x100127da3: vpermilps xmm4, xmm4, 0xc0
0x100127da9: vdivps xmm3, xmm3, xmm4
0x100127dad: vmulps xmm3, xmm3, xmmword ptr [rip + 0x9838db] ; 0x100aab690
0x100127db5: vmovshdup xmm4, xmm3
0x100127db9: vaddss xmm4, xmm3, xmm4
0x100127dbd: vpermilpd xmm3, xmm3, 1
0x100127dc3: vaddss xmm3, xmm3, xmm4
0x100127dc7: vaddss xmm3, xmm3, dword ptr [rip + 0x97d2f5] ; 0x100aa50c4
0x100127dcf: vandps xmm3, xmm3, xmmword ptr [rip + 0x97fb39] ; 0x100aa7910
0x100127dd7: vucomiss xmm6, xmm3
0x100127ddb: jae 0x100127e45
0x100127ddd: vmulps xmm3, xmm2, xmm7
0x100127de1: vmovshdup xmm4, xmm3
0x100127de5: vaddss xmm4, xmm3, xmm4
0x100127de9: vpermilpd xmm3, xmm3, 1
0x100127def: vaddss xmm3, xmm3, xmm4
0x100127df3: vmovss xmm4, dword ptr [rip + 0x97d2c5] ; 0x100aa50c0
0x100127dfb: vaddss xmm3, xmm3, xmm4
0x100127dff: vaddss xmm3, xmm3, xmm3
0x100127e03: vsqrtss xmm3, xmm3, xmm3
0x100127e07: vdivss xmm4, xmm4, xmm3
0x100127e0b: vmovss xmm5, dword ptr [rip + 0x97d2b1] ; 0x100aa50c4
0x100127e13: vmulps xmm5, xmm2, xmm5
0x100127e17: vpermilps xmm2, xmm2, 0xd2
0x100127e1d: vmulps xmm2, xmm2, xmm7
0x100127e21: vsubps xmm2, xmm5, xmm2
0x100127e25: vpermilps xmm2, xmm2, 0xd2
0x100127e2b: vpermilps xmm4, xmm4, 0xc0
0x100127e31: vmulps xmm2, xmm2, xmm4
0x100127e35: vmulss xmm3, xmm3, dword ptr [rip + 0x97c77b] ; 0x100aa45b8
0x100127e3d: vinsertps xmm2, xmm2, xmm3, 0x30
0x100127e43: jmp 0x100127e4d ; 0x100127e4d
0x100127e45: vmovaps xmm2, xmmword ptr [rip + 0x983853] ; 0x100aab6a0
0x100127e4d: vmovaps xmmword ptr [rax + 0x30], xmm2
0x100127e52: vpermilps xmm3, xmm2, 0xe7
0x100127e58: vucomiss xmm3, xmm3
0x100127e5c: jp 0x10012bd65
0x100127e62: vmovshdup xmm3, xmm2
0x100127e66: vucomiss xmm2, xmm3
0x100127e6a: jp 0x10012bd65
0x100127e70: vpermilpd xmm2, xmm2, 1
0x100127e76: vucomiss xmm2, xmm2
0x100127e7a: jp 0x10012bd65
0x100127e80: vucomiss xmm1, dword ptr [rip + 0x97fa3c] ; 0x100aa78c4
0x100127e88: mov rax, qword ptr [r12 + 0x2d0]
0x100127e90: vmovaps xmm2, xmm0
0x100127e94: jbe 0x100127ea0
0x100127e96: vpermilps xmm2, xmm1, 0xc0
0x100127e9c: vdivps xmm2, xmm0, xmm2
0x100127ea0: vxorps xmm3, xmm2, xmmword ptr [rip + 0x97fa58] ; 0x100aa7900
0x100127ea8: vmulps xmm4, xmm2, xmm2
0x100127eac: vmovshdup xmm5, xmm4
0x100127eb0: vaddss xmm5, xmm4, xmm5
0x100127eb4: vpermilpd xmm4, xmm4, 1
0x100127eba: vaddss xmm4, xmm4, xmm5
0x100127ebe: vsqrtss xmm4, xmm4, xmm4
0x100127ec2: vucomiss xmm4, dword ptr [rip + 0x97f9fa] ; 0x100aa78c4
0x100127eca: jbe 0x100127ed6
0x100127ecc: vpermilps xmm4, xmm4, 0xc0
0x100127ed2: vdivps xmm3, xmm3, xmm4
0x100127ed6: vmulps xmm3, xmm3, xmmword ptr [rip + 0x9837b2] ; 0x100aab690
0x100127ede: vmovshdup xmm4, xmm3
0x100127ee2: vaddss xmm4, xmm3, xmm4
0x100127ee6: vpermilpd xmm3, xmm3, 1
0x100127eec: vaddss xmm3, xmm3, xmm4
0x100127ef0: vaddss xmm3, xmm3, dword ptr [rip + 0x97d1cc] ; 0x100aa50c4
0x100127ef8: vandps xmm3, xmm3, xmmword ptr [rip + 0x97fa10] ; 0x100aa7910
0x100127f00: vucomiss xmm6, xmm3
0x100127f04: jae 0x100127f6e
0x100127f06: vmulps xmm3, xmm2, xmm7
0x100127f0a: vmovshdup xmm4, xmm3
0x100127f0e: vaddss xmm4, xmm3, xmm4
0x100127f12: vpermilpd xmm3, xmm3, 1
0x100127f18: vaddss xmm3, xmm3, xmm4
0x100127f1c: vmovss xmm4, dword ptr [rip + 0x97d19c] ; 0x100aa50c0
0x100127f24: vaddss xmm3, xmm3, xmm4
0x100127f28: vaddss xmm3, xmm3, xmm3
0x100127f2c: vsqrtss xmm3, xmm3, xmm3
0x100127f30: vdivss xmm4, xmm4, xmm3
0x100127f34: vmovss xmm5, dword ptr [rip + 0x97d188] ; 0x100aa50c4
0x100127f3c: vmulps xmm5, xmm2, xmm5
0x100127f40: vpermilps xmm2, xmm2, 0xd2
0x100127f46: vmulps xmm2, xmm2, xmm7
0x100127f4a: vsubps xmm2, xmm5, xmm2
0x100127f4e: vpermilps xmm2, xmm2, 0xd2
0x100127f54: vpermilps xmm4, xmm4, 0xc0
0x100127f5a: vmulps xmm2, xmm2, xmm4
0x100127f5e: vmulss xmm3, xmm3, dword ptr [rip + 0x97c652] ; 0x100aa45b8
0x100127f66: vinsertps xmm2, xmm2, xmm3, 0x30
0x100127f6c: jmp 0x100127f76 ; 0x100127f76
0x100127f6e: vmovaps xmm2, xmmword ptr [rip + 0x98372a] ; 0x100aab6a0
0x100127f76: vmovaps xmmword ptr [rax + 0x30], xmm2
0x100127f7b: vpermilps xmm3, xmm2, 0xe7
0x100127f81: vucomiss xmm3, xmm3
0x100127f85: jp 0x10012bd65
0x100127f8b: vmovshdup xmm3, xmm2
0x100127f8f: vucomiss xmm2, xmm3
0x100127f93: jp 0x10012bd65
0x100127f99: vpermilpd xmm2, xmm2, 1
0x100127f9f: vucomiss xmm2, xmm2
0x100127fa3: jp 0x10012bd65
0x100127fa9: vucomiss xmm1, dword ptr [rip + 0x97f913] ; 0x100aa78c4
0x100127fb1: mov rax, qword ptr [r12 + 0x2d8]
0x100127fb9: jbe 0x100127fc5
0x100127fbb: vpermilps xmm1, xmm1, 0xc0
0x100127fc1: vdivps xmm0, xmm0, xmm1
0x100127fc5: vxorps xmm1, xmm0, xmmword ptr [rip + 0x97f933] ; 0x100aa7900
0x100127fcd: vmulps xmm2, xmm0, xmm0
0x100127fd1: vmovshdup xmm3, xmm2
0x100127fd5: vaddss xmm3, xmm2, xmm3
0x100127fd9: vpermilpd xmm2, xmm2, 1
0x100127fdf: vaddss xmm2, xmm2, xmm3
0x100127fe3: vsqrtss xmm2, xmm2, xmm2
0x100127fe7: vucomiss xmm2, dword ptr [rip + 0x97f8d5] ; 0x100aa78c4
0x100127fef: jbe 0x100127ffb
0x100127ff1: vpermilps xmm2, xmm2, 0xc0
0x100127ff7: vdivps xmm1, xmm1, xmm2
0x100127ffb: vmulps xmm1, xmm1, xmmword ptr [rip + 0x98368d] ; 0x100aab690
0x100128003: vmovshdup xmm2, xmm1
0x100128007: vaddss xmm2, xmm1, xmm2
0x10012800b: vpermilpd xmm1, xmm1, 1
0x100128011: vaddss xmm1, xmm1, xmm2
0x100128015: vaddss xmm1, xmm1, dword ptr [rip + 0x97d0a7] ; 0x100aa50c4
0x10012801d: vandps xmm1, xmm1, xmmword ptr [rip + 0x97f8eb] ; 0x100aa7910
0x100128025: vucomiss xmm6, xmm1
0x100128029: jae 0x100128093
0x10012802b: vmulps xmm1, xmm0, xmm7
0x10012802f: vmovshdup xmm2, xmm1
0x100128033: vaddss xmm2, xmm1, xmm2
0x100128037: vpermilpd xmm1, xmm1, 1
0x10012803d: vaddss xmm1, xmm1, xmm2
0x100128041: vmovss xmm2, dword ptr [rip + 0x97d077] ; 0x100aa50c0
0x100128049: vaddss xmm1, xmm1, xmm2
0x10012804d: vaddss xmm1, xmm1, xmm1
0x100128051: vsqrtss xmm1, xmm1, xmm1
0x100128055: vdivss xmm2, xmm2, xmm1
0x100128059: vmovss xmm3, dword ptr [rip + 0x97d063] ; 0x100aa50c4
0x100128061: vmulps xmm3, xmm0, xmm3
0x100128065: vpermilps xmm0, xmm0, 0xd2
0x10012806b: vmulps xmm0, xmm0, xmm7
0x10012806f: vsubps xmm0, xmm3, xmm0
0x100128073: vpermilps xmm0, xmm0, 0xd2
0x100128079: vpermilps xmm2, xmm2, 0xc0
0x10012807f: vmulps xmm0, xmm0, xmm2
0x100128083: vmulss xmm1, xmm1, dword ptr [rip + 0x97c52d] ; 0x100aa45b8
0x10012808b: vinsertps xmm0, xmm0, xmm1, 0x30
0x100128091: jmp 0x10012809b ; 0x10012809b
0x100128093: vmovaps xmm0, xmmword ptr [rip + 0x983605] ; 0x100aab6a0
0x10012809b: vmovaps xmmword ptr [rax + 0x30], xmm0
0x1001280a0: vpermilps xmm1, xmm0, 0xe7
0x1001280a6: vucomiss xmm1, xmm1
0x1001280aa: jp 0x10012bd65
0x1001280b0: vmovshdup xmm1, xmm0
0x1001280b4: vucomiss xmm0, xmm1
0x1001280b8: jp 0x10012bd65
0x1001280be: vpermilpd xmm0, xmm0, 1
0x1001280c4: vucomiss xmm0, xmm0
0x1001280c8: jp 0x10012bd65
0x1001280ce: mov rax, qword ptr [r12 + 0x2c8]
0x1001280d6: mov ecx, dword ptr [rcx + 0x14]
0x1001280d9: mov dword ptr [rax + 0x84], ecx
0x1001280df: mov rax, qword ptr [r12 + 0x2d0]
0x1001280e7: mov dword ptr [rax + 0x84], ecx
0x1001280ed: mov rax, qword ptr [r12 + 0x2d8]
0x1001280f5: mov dword ptr [rax + 0x84], ecx
0x1001280fb: mov rbx, qword ptr [rsp + 0x28]
0x100128100: vmovaps xmm0, xmmword ptr [r12 + 0x370]
0x10012810a: vmulps xmm0, xmm0, xmm0
0x10012810e: vmovshdup xmm1, xmm0
0x100128112: vaddss xmm1, xmm0, xmm1
0x100128116: vpermilpd xmm0, xmm0, 1
0x10012811c: vaddss xmm0, xmm0, xmm1
0x100128120: vmovss dword ptr [rsp], xmm0
0x100128125: mov rsi, qword ptr [rbx + 0x368]
0x10012812c: lea rbx, [rsp + 0x270]
0x100128134: mov rdi, rbx
0x100128137: call 0x1007f26b0 ; 0x1007f26b0
0x10012813c: mov rsi, qword ptr [r12 + 0x368]
0x100128144: test rsi, rsi
0x100128147: je 0x1001281d2
0x10012814d: lea rdi, [rsp + 0x600]
0x100128155: call 0x1004d1e40 ; 0x1004d1e40
0x10012815a: vmovaps xmm0, xmmword ptr [rsp + 0x630]
0x100128163: vmovaps xmmword ptr [rsp + 0x10], xmm0
0x100128169: mov rsi, qword ptr [r12 + 0x368]
0x100128171: lea rdi, [rsp + 0x580]
0x100128179: call 0x1004d2140 ; 0x1004d2140
0x10012817e: vmovaps xmm0, xmmword ptr [rsp + 0x590]
0x100128187: vmulps xmm0, xmm0, xmm0
0x10012818b: vpermilpd xmm1, xmm0, 1
0x100128191: vaddps xmm0, xmm0, xmm1
0x100128195: vmovshdup xmm1, xmm0
0x100128199: vaddss xmm0, xmm0, xmm1
0x10012819d: vsqrtss xmm0, xmm0, xmm0
0x1001281a1: vpermilps xmm0, xmm0, 0xc0
0x1001281a7: vmulps xmm0, xmm0, xmmword ptr [rip + 0x97fef1] ; 0x100aa80a0
0x1001281af: vmulps xmm0, xmm0, xmmword ptr [rip + 0x97f4b9] ; 0x100aa7670
0x1001281b7: vaddps xmm1, xmm0, xmmword ptr [rsp + 0x10]
0x1001281bd: vmovaps xmm8, xmmword ptr [rsp + 0x60]
0x1001281c3: mov rbx, qword ptr [rsp + 0xd0]
0x1001281cb: vmovss xmm12, dword ptr [rsp]
0x1001281d0: jmp 0x100128201 ; 0x100128201
0x1001281d2: lea rax, [r12 + 0x370]
0x1001281da: vxorps xmm0, xmm0, xmm0
0x1001281de: vmovss xmm2, dword ptr [rsp]
0x1001281e3: vucomiss xmm2, xmm0
0x1001281e7: cmova rbx, rax
0x1001281eb: vmovaps xmm1, xmmword ptr [rbx]
0x1001281ef: vmovaps xmm8, xmmword ptr [rsp + 0x60]
0x1001281f5: mov rbx, qword ptr [rsp + 0xd0]
0x1001281fd: vmovaps xmm12, xmm2
0x100128201: vxorps xmm0, xmm0, xmm0
0x100128205: vucomiss xmm12, xmm0
0x100128209: mov rax, qword ptr [r12 + 0x2e0]
0x100128211: vmovaps xmmword ptr [rax + 0x20], xmm1
0x100128216: mov rax, qword ptr [r12 + 0x2e0]
0x10012821e: vmovaps xmm11, xmmword ptr [rsp + 0x270]
0x100128227: mov byte ptr [rax + 0x188], 1
0x10012822e: mov byte ptr [rax + 0xae], 1
0x100128235: vmovaps xmmword ptr [rax + 0x160], xmm11
0x10012823d: mov rax, qword ptr [r12 + 0x2e0]
0x100128245: vmovss xmm9, dword ptr [rip + 0x97f677] ; 0x100aa78c4
0x10012824d: vmovaps xmm10, xmmword ptr [rip + 0x98343b] ; 0x100aab690
0x100128255: vmovss xmm0, dword ptr [rip + 0x97ce63] ; 0x100aa50c0
0x10012825d: ja 0x10012827e
0x10012825f: mov rcx, qword ptr [r12 + 0x368]
0x100128267: test rcx, rcx
0x10012826a: jne 0x10012827e
0x10012826c: vmovapd xmm1, xmmword ptr [rip + 0x98294c] ; 0x100aaabc0
0x100128274: vmovapd xmmword ptr [rax + 0x30], xmm1
0x100128279: jmp 0x1001283e9 ; 0x1001283e9
0x10012827e: vsubps xmm1, xmm11, xmm1
0x100128282: vmulps xmm2, xmm1, xmm1
0x100128286: vmovshdup xmm3, xmm2
0x10012828a: vaddss xmm3, xmm2, xmm3
0x10012828e: vpermilpd xmm2, xmm2, 1
0x100128294: vaddss xmm2, xmm2, xmm3
0x100128298: vsqrtss xmm2, xmm2, xmm2
0x10012829c: vucomiss xmm2, dword ptr [rip + 0x97f620] ; 0x100aa78c4
0x1001282a4: jbe 0x1001282b0
0x1001282a6: vpermilps xmm2, xmm2, 0xc0
0x1001282ac: vdivps xmm1, xmm1, xmm2
0x1001282b0: vmulps xmm2, xmm1, xmm1
0x1001282b4: vmovshdup xmm3, xmm2
0x1001282b8: vaddss xmm3, xmm2, xmm3
0x1001282bc: vpermilpd xmm2, xmm2, 1
0x1001282c2: vaddss xmm2, xmm2, xmm3
0x1001282c6: vsqrtss xmm2, xmm2, xmm2
0x1001282ca: vucomiss xmm2, dword ptr [rip + 0x97f5f2] ; 0x100aa78c4
0x1001282d2: jbe 0x1001282de
0x1001282d4: vpermilps xmm2, xmm2, 0xc0
0x1001282da: vdivps xmm1, xmm1, xmm2
0x1001282de: vxorps xmm2, xmm1, xmmword ptr [rip + 0x97f61a] ; 0x100aa7900
0x1001282e6: vmulps xmm3, xmm1, xmm1
0x1001282ea: vmovshdup xmm4, xmm3
0x1001282ee: vaddss xmm4, xmm3, xmm4
0x1001282f2: vpermilpd xmm3, xmm3, 1
0x1001282f8: vaddss xmm3, xmm3, xmm4
0x1001282fc: vsqrtss xmm3, xmm3, xmm3
0x100128300: vucomiss xmm3, dword ptr [rip + 0x97f5bc] ; 0x100aa78c4
0x100128308: jbe 0x100128314
0x10012830a: vpermilps xmm3, xmm3, 0xc0
0x100128310: vdivps xmm2, xmm2, xmm3
0x100128314: vmulps xmm2, xmm2, xmmword ptr [rip + 0x983374] ; 0x100aab690
0x10012831c: vmovshdup xmm3, xmm2
0x100128320: vaddss xmm3, xmm2, xmm3
0x100128324: vpermilpd xmm2, xmm2, 1
0x10012832a: vaddss xmm2, xmm2, xmm3
0x10012832e: vaddss xmm2, xmm2, dword ptr [rip + 0x97cd8e] ; 0x100aa50c4
0x100128336: vandps xmm2, xmm2, xmmword ptr [rip + 0x97f5d2] ; 0x100aa7910
0x10012833e: vucomiss xmm9, xmm2
0x100128342: jae 0x1001283ae
0x100128344: vmulps xmm2, xmm1, xmm10
0x100128349: vmovshdup xmm3, xmm2
0x10012834d: vaddss xmm3, xmm2, xmm3
0x100128351: vpermilpd xmm2, xmm2, 1
0x100128357: vaddss xmm2, xmm2, xmm3
0x10012835b: vmovss xmm3, dword ptr [rip + 0x97cd5d] ; 0x100aa50c0
0x100128363: vaddss xmm2, xmm2, xmm3
0x100128367: vaddss xmm2, xmm2, xmm2
0x10012836b: vsqrtss xmm2, xmm2, xmm2
0x10012836f: vdivss xmm3, xmm3, xmm2
0x100128373: vmovss xmm4, dword ptr [rip + 0x97cd49] ; 0x100aa50c4
0x10012837b: vmulps xmm4, xmm1, xmm4
0x10012837f: vpermilps xmm1, xmm1, 0xd2
0x100128385: vmulps xmm1, xmm1, xmm10
0x10012838a: vsubps xmm1, xmm4, xmm1
0x10012838e: vpermilps xmm1, xmm1, 0xd2
0x100128394: vpermilps xmm3, xmm3, 0xc0
0x10012839a: vmulps xmm1, xmm1, xmm3
0x10012839e: vmulss xmm2, xmm2, dword ptr [rip + 0x97c212] ; 0x100aa45b8
0x1001283a6: vinsertps xmm1, xmm1, xmm2, 0x30
0x1001283ac: jmp 0x1001283b6 ; 0x1001283b6
0x1001283ae: vmovaps xmm1, xmmword ptr [rip + 0x9832ea] ; 0x100aab6a0
0x1001283b6: vmovaps xmmword ptr [rax + 0x30], xmm1
0x1001283bb: vpermilps xmm2, xmm1, 0xe7
0x1001283c1: vucomiss xmm2, xmm2
0x1001283c5: jp 0x10012bd65
0x1001283cb: vmovshdup xmm2, xmm1
0x1001283cf: vucomiss xmm1, xmm2
0x1001283d3: jp 0x10012bd65
0x1001283d9: vpermilpd xmm1, xmm1, 1
0x1001283df: vucomiss xmm1, xmm1
0x1001283e3: jp 0x10012bd65
0x1001283e9: vmovss xmm2, dword ptr [rbx + 8]
0x1001283ee: vmovss xmm4, dword ptr [rbx + 0x28]
0x1001283f3: vxorps xmm3, xmm3, xmm3
0x1001283f7: vucomiss xmm2, xmm4
0x1001283fb: vxorpd xmm1, xmm1, xmm1
0x1001283ff: ja 0x10012843e
0x100128401: vsubss xmm1, xmm0, xmm2
0x100128405: vxorps xmm5, xmm5, xmm5
0x100128409: vmaxss xmm1, xmm5, xmm1
0x10012840d: vminss xmm1, xmm0, xmm1
0x100128411: vsubss xmm6, xmm0, xmm1
0x100128415: vmovss xmm7, dword ptr [rip + 0x97f3d3] ; 0x100aa77f0
0x10012841d: vmulss xmm1, xmm1, xmm7
0x100128421: vaddss xmm1, xmm6, xmm1
0x100128425: vmovss xmm6, dword ptr [rbx + 0x20]
0x10012842a: vxorps xmm6, xmm6, xmmword ptr [rip + 0x97f4ce] ; 0x100aa7900
0x100128432: vmaxss xmm5, xmm5, xmm6
0x100128436: vminss xmm5, xmm7, xmm5
0x10012843a: vmulss xmm1, xmm1, xmm5
0x10012843e: vucomiss xmm12, xmm3
0x100128442: seta al
0x100128445: cmp qword ptr [r12 + 0x368], 0
0x10012844e: setne cl
0x100128451: or cl, al
0x100128453: vmovaps xmm5, xmm0
0x100128457: jne 0x10012845d
0x100128459: vxorps xmm5, xmm5, xmm5
0x10012845d: jne 0x100128467
0x10012845f: vmovss xmm0, dword ptr [rip + 0x980d5d] ; 0x100aa91c4
0x100128467: vucomiss xmm2, xmm4
0x10012846b: mov rax, qword ptr [r12 + 0x2e0]
0x100128473: vmovss dword ptr [rax + 0x80], xmm5
0x10012847b: vmovss dword ptr [rax + 0x90], xmm0
0x100128483: lea rcx, [rip + 0x1f17226] ; 0x10203f6b0
0x10012848a: vmovaps xmm2, xmmword ptr [rcx]
0x10012848e: ja 0x1001284a0
0x100128490: vmovaps xmm4, xmm2
0x100128494: jbe 0x1001284aa
0x100128496: vmovaps xmm5, xmmword ptr [rip + 0x9832c2] ; 0x100aab760
0x10012849e: jmp 0x1001284ae ; 0x1001284ae
0x1001284a0: vmovaps xmm4, xmmword ptr [rip + 0x9832a8] ; 0x100aab750
0x1001284a8: ja 0x100128496
0x1001284aa: vmovaps xmm5, xmm2
0x1001284ae: vmovaps xmmword ptr [rax + 0x110], xmm4
0x1001284b6: mov rax, qword ptr [r12 + 0x2e0]
0x1001284be: vmovaps xmmword ptr [rax + 0x120], xmm5
0x1001284c6: vmovaps xmm4, xmmword ptr [r12 + 0x380]
0x1001284d0: vmulps xmm5, xmm4, xmm4
0x1001284d4: vmovshdup xmm6, xmm5
0x1001284d8: vaddss xmm6, xmm5, xmm6
0x1001284dc: vpermilpd xmm5, xmm5, 1
0x1001284e2: vaddss xmm5, xmm5, xmm6
0x1001284e6: vucomiss xmm5, xmm3
0x1001284ea: jbe 0x1001286b7
0x1001284f0: mov rax, qword ptr [r12 + 0x2e0]
0x1001284f8: lea rcx, [rip + 0x999345] ; 0x100ac1844
0x1001284ff: vmovss xmm3, dword ptr [rcx]
0x100128503: vsubps xmm4, xmm11, xmm4
0x100128507: vmulps xmm5, xmm4, xmm4
0x10012850b: vmovshdup xmm6, xmm5
0x10012850f: vaddss xmm6, xmm5, xmm6
0x100128513: vpermilpd xmm5, xmm5, 1
0x100128519: vaddss xmm5, xmm5, xmm6
0x10012851d: vsqrtss xmm5, xmm5, xmm5
0x100128521: vucomiss xmm5, dword ptr [rip + 0x97f39b] ; 0x100aa78c4
0x100128529: jbe 0x100128535
0x10012852b: vpermilps xmm5, xmm5, 0xc0
0x100128531: vdivps xmm4, xmm4, xmm5
0x100128535: vpermilps xmm5, xmm3, 0xc0
0x10012853b: vmulps xmm4, xmm5, xmm4
0x10012853f: vaddps xmm4, xmm11, xmm4
0x100128543: vmovaps xmmword ptr [rax + 0x20], xmm4
0x100128548: mov rax, qword ptr [r12 + 0x2e0]
0x100128550: vmovaps xmm4, xmmword ptr [r12 + 0x380]
0x10012855a: mov byte ptr [rax + 0x188], 1
0x100128561: mov byte ptr [rax + 0xae], 1
0x100128568: vmovaps xmmword ptr [rax + 0x160], xmm4
0x100128570: mov rax, qword ptr [r12 + 0x2e0]
0x100128578: vmovaps xmm4, xmmword ptr [r12 + 0x380]
0x100128582: vsubps xmm4, xmm4, xmm11
0x100128587: vmulps xmm5, xmm4, xmm4
0x10012858b: vmovshdup xmm6, xmm5
0x10012858f: vaddss xmm6, xmm5, xmm6
0x100128593: vpermilpd xmm5, xmm5, 1
0x100128599: vaddss xmm5, xmm5, xmm6
0x10012859d: vsqrtss xmm5, xmm5, xmm5
0x1001285a1: vucomiss xmm5, dword ptr [rip + 0x97f31b] ; 0x100aa78c4
0x1001285a9: jbe 0x1001285b5
0x1001285ab: vpermilps xmm5, xmm5, 0xc0
0x1001285b1: vdivps xmm4, xmm4, xmm5
0x1001285b5: vmulps xmm5, xmm4, xmm4
0x1001285b9: vmovshdup xmm6, xmm5
0x1001285bd: vaddss xmm6, xmm5, xmm6
0x1001285c1: vpermilpd xmm5, xmm5, 1
0x1001285c7: vaddss xmm5, xmm5, xmm6
0x1001285cb: vsqrtss xmm5, xmm5, xmm5
0x1001285cf: vucomiss xmm5, dword ptr [rip + 0x97f2ed] ; 0x100aa78c4
0x1001285d7: jbe 0x1001285e3
0x1001285d9: vpermilps xmm5, xmm5, 0xc0
0x1001285df: vdivps xmm4, xmm4, xmm5
0x1001285e3: vxorps xmm5, xmm4, xmmword ptr [rip + 0x97f315] ; 0x100aa7900
0x1001285eb: vmulps xmm6, xmm4, xmm4
0x1001285ef: vmovshdup xmm7, xmm6
0x1001285f3: vaddss xmm7, xmm6, xmm7
0x1001285f7: vpermilpd xmm6, xmm6, 1
0x1001285fd: vaddss xmm6, xmm6, xmm7
0x100128601: vsqrtss xmm6, xmm6, xmm6
0x100128605: vucomiss xmm6, dword ptr [rip + 0x97f2b7] ; 0x100aa78c4
0x10012860d: jbe 0x100128619
0x10012860f: vpermilps xmm6, xmm6, 0xc0
0x100128615: vdivps xmm5, xmm5, xmm6
0x100128619: vmulps xmm5, xmm5, xmmword ptr [rip + 0x98306f] ; 0x100aab690
0x100128621: vmovshdup xmm6, xmm5
0x100128625: vaddss xmm6, xmm5, xmm6
0x100128629: vpermilpd xmm5, xmm5, 1
0x10012862f: vaddss xmm5, xmm5, xmm6
0x100128633: vaddss xmm5, xmm5, dword ptr [rip + 0x97ca89] ; 0x100aa50c4
0x10012863b: vandps xmm5, xmm5, xmmword ptr [rip + 0x97f2cd] ; 0x100aa7910
0x100128643: vucomiss xmm9, xmm5
0x100128647: jae 0x1001286d6
0x10012864d: vmulps xmm5, xmm4, xmm10
0x100128652: vmovshdup xmm6, xmm5
0x100128656: vaddss xmm6, xmm5, xmm6
0x10012865a: vpermilpd xmm5, xmm5, 1
0x100128660: vaddss xmm5, xmm5, xmm6
0x100128664: vmovss xmm6, dword ptr [rip + 0x97ca54] ; 0x100aa50c0
0x10012866c: vaddss xmm5, xmm5, xmm6
0x100128670: vaddss xmm5, xmm5, xmm5
0x100128674: vsqrtss xmm5, xmm5, xmm5
0x100128678: vdivss xmm6, xmm6, xmm5
0x10012867c: vmovss xmm7, dword ptr [rip + 0x97ca40] ; 0x100aa50c4
0x100128684: vmulps xmm7, xmm4, xmm7
0x100128688: vpermilps xmm4, xmm4, 0xd2
0x10012868e: vmulps xmm4, xmm4, xmm10
0x100128693: vsubps xmm4, xmm7, xmm4
0x100128697: vpermilps xmm4, xmm4, 0xd2
0x10012869d: vpermilps xmm6, xmm6, 0xc0
0x1001286a3: vmulps xmm4, xmm4, xmm6
0x1001286a7: vmulss xmm5, xmm5, dword ptr [rip + 0x97bf09] ; 0x100aa45b8
0x1001286af: vinsertps xmm4, xmm4, xmm5, 0x30
0x1001286b5: jmp 0x1001286de ; 0x1001286de
0x1001286b7: vmovaps xmmword ptr [r12 + 0x380], xmm11
0x1001286c1: lea rax, [rip + 0x99917c] ; 0x100ac1844
0x1001286c8: vmovss xmm3, dword ptr [rax]
0x1001286cc: vxorpd xmm1, xmm1, xmm1
0x1001286d0: vmovaps xmm4, xmm11
0x1001286d4: jmp 0x10012873b ; 0x10012873b
0x1001286d6: vmovaps xmm4, xmmword ptr [rip + 0x982fc2] ; 0x100aab6a0
0x1001286de: vmovaps xmmword ptr [rax + 0x30], xmm4
0x1001286e3: vpermilps xmm5, xmm4, 0xe7
0x1001286e9: vucomiss xmm5, xmm5
0x1001286ed: jp 0x10012bd65
0x1001286f3: vmovshdup xmm5, xmm4
0x1001286f7: vucomiss xmm4, xmm5
0x1001286fb: jp 0x10012bd65
0x100128701: vpermilpd xmm4, xmm4, 1
0x100128707: vucomiss xmm4, xmm4
0x10012870b: jp 0x10012bd65
0x100128711: mov rax, qword ptr [r12 + 0x2e0]
0x100128719: vmovss dword ptr [rax + 0x80], xmm1
0x100128721: vmovaps xmm4, xmmword ptr [rip + 0x983037] ; 0x100aab760
0x100128729: vmovaps xmmword ptr [rax + 0x120], xmm4
0x100128731: vmovaps xmm4, xmmword ptr [r12 + 0x380]
0x10012873b: mov rax, qword ptr [r12 + 0x2e8]
0x100128743: vsubps xmm4, xmm11, xmm4
0x100128747: vmulps xmm5, xmm4, xmm4
0x10012874b: vmovshdup xmm6, xmm5
0x10012874f: vaddss xmm6, xmm5, xmm6
0x100128753: vpermilpd xmm5, xmm5, 1
0x100128759: vaddss xmm5, xmm5, xmm6
0x10012875d: vsqrtss xmm5, xmm5, xmm5
0x100128761: vucomiss xmm5, dword ptr [rip + 0x97f15b] ; 0x100aa78c4
0x100128769: jbe 0x100128775
0x10012876b: vpermilps xmm5, xmm5, 0xc0
0x100128771: vdivps xmm4, xmm4, xmm5
0x100128775: vpermilps xmm3, xmm3, 0xc0
0x10012877b: vmulps xmm3, xmm3, xmm4
0x10012877f: vaddps xmm3, xmm11, xmm3
0x100128783: vmovaps xmmword ptr [rax + 0x20], xmm3
0x100128788: mov rax, qword ptr [r12 + 0x2e8]
0x100128790: vmovaps xmm3, xmmword ptr [r12 + 0x380]
0x10012879a: mov byte ptr [rax + 0x188], 1
0x1001287a1: mov byte ptr [rax + 0xae], 1
0x1001287a8: vmovaps xmmword ptr [rax + 0x160], xmm3
0x1001287b0: mov rax, qword ptr [r12 + 0x2e8]
0x1001287b8: vmovaps xmm3, xmmword ptr [r12 + 0x380]
0x1001287c2: vsubps xmm3, xmm3, xmm11
0x1001287c7: vmulps xmm4, xmm3, xmm3
0x1001287cb: vmovshdup xmm5, xmm4
0x1001287cf: vaddss xmm5, xmm4, xmm5
0x1001287d3: vpermilpd xmm4, xmm4, 1
0x1001287d9: vaddss xmm4, xmm4, xmm5
0x1001287dd: vsqrtss xmm4, xmm4, xmm4
0x1001287e1: vucomiss xmm4, dword ptr [rip + 0x97f0db] ; 0x100aa78c4
0x1001287e9: jbe 0x1001287f5
0x1001287eb: vpermilps xmm4, xmm4, 0xc0
0x1001287f1: vdivps xmm3, xmm3, xmm4
0x1001287f5: vmulps xmm4, xmm3, xmm3
0x1001287f9: vmovshdup xmm5, xmm4
0x1001287fd: vaddss xmm5, xmm4, xmm5
0x100128801: vpermilpd xmm4, xmm4, 1
0x100128807: vaddss xmm4, xmm4, xmm5
0x10012880b: vsqrtss xmm4, xmm4, xmm4
0x10012880f: vucomiss xmm4, dword ptr [rip + 0x97f0ad] ; 0x100aa78c4
0x100128817: jbe 0x100128823
0x100128819: vpermilps xmm4, xmm4, 0xc0
0x10012881f: vdivps xmm3, xmm3, xmm4
0x100128823: vxorps xmm4, xmm3, xmmword ptr [rip + 0x97f0d5] ; 0x100aa7900
0x10012882b: vmulps xmm5, xmm3, xmm3
0x10012882f: vmovshdup xmm6, xmm5
0x100128833: vaddss xmm6, xmm5, xmm6
0x100128837: vpermilpd xmm5, xmm5, 1
0x10012883d: vaddss xmm5, xmm5, xmm6
0x100128841: vsqrtss xmm5, xmm5, xmm5
0x100128845: vucomiss xmm5, dword ptr [rip + 0x97f077] ; 0x100aa78c4
0x10012884d: jbe 0x100128859
0x10012884f: vpermilps xmm5, xmm5, 0xc0
0x100128855: vdivps xmm4, xmm4, xmm5
0x100128859: vmulps xmm4, xmm4, xmmword ptr [rip + 0x982e2f] ; 0x100aab690
0x100128861: vmovshdup xmm5, xmm4
0x100128865: vaddss xmm5, xmm4, xmm5
0x100128869: vpermilpd xmm4, xmm4, 1
0x10012886f: vaddss xmm4, xmm4, xmm5
0x100128873: vaddss xmm4, xmm4, dword ptr [rip + 0x97c849] ; 0x100aa50c4
0x10012887b: vandps xmm4, xmm4, xmmword ptr [rip + 0x97f08d] ; 0x100aa7910
0x100128883: vucomiss xmm9, xmm4
0x100128887: jae 0x1001288f3
0x100128889: vmulps xmm4, xmm3, xmm10
0x10012888e: vmovshdup xmm5, xmm4
0x100128892: vaddss xmm5, xmm4, xmm5
0x100128896: vpermilpd xmm4, xmm4, 1
0x10012889c: vaddss xmm4, xmm4, xmm5
0x1001288a0: vmovss xmm5, dword ptr [rip + 0x97c818] ; 0x100aa50c0
0x1001288a8: vaddss xmm4, xmm4, xmm5
0x1001288ac: vaddss xmm4, xmm4, xmm4
0x1001288b0: vsqrtss xmm4, xmm4, xmm4
0x1001288b4: vdivss xmm5, xmm5, xmm4
0x1001288b8: vmovss xmm6, dword ptr [rip + 0x97c804] ; 0x100aa50c4
0x1001288c0: vmulps xmm6, xmm3, xmm6
0x1001288c4: vpermilps xmm3, xmm3, 0xd2
0x1001288ca: vmulps xmm3, xmm3, xmm10
0x1001288cf: vsubps xmm3, xmm6, xmm3
0x1001288d3: vpermilps xmm3, xmm3, 0xd2
0x1001288d9: vpermilps xmm5, xmm5, 0xc0
0x1001288df: vmulps xmm3, xmm3, xmm5
0x1001288e3: vmulss xmm4, xmm4, dword ptr [rip + 0x97bccd] ; 0x100aa45b8
0x1001288eb: vinsertps xmm3, xmm3, xmm4, 0x30
0x1001288f1: jmp 0x1001288fb ; 0x1001288fb
0x1001288f3: vmovaps xmm3, xmmword ptr [rip + 0x982da5] ; 0x100aab6a0
0x1001288fb: vmovaps xmmword ptr [rax + 0x30], xmm3
0x100128900: vpermilps xmm4, xmm3, 0xe7
0x100128906: vucomiss xmm4, xmm4
0x10012890a: jp 0x10012bd65
0x100128910: vmovshdup xmm4, xmm3
0x100128914: vucomiss xmm3, xmm4
0x100128918: jp 0x10012bd65
0x10012891e: vpermilpd xmm3, xmm3, 1
0x100128924: vucomiss xmm3, xmm3
0x100128928: jp 0x10012bd65
0x10012892e: mov rax, qword ptr [r12 + 0x2e8]
0x100128936: vmulss xmm3, xmm1, dword ptr [rip + 0x97fc8e] ; 0x100aa85cc
0x10012893e: vaddss xmm4, xmm3, dword ptr [rip + 0x97fc8a] ; 0x100aa85d0
0x100128946: vxorps xmm3, xmm3, xmm3
0x10012894a: vcmpltss xmm5, xmm3, xmm1
0x10012894f: vandps xmm4, xmm5, xmm4
0x100128953: vmovss dword ptr [rax + 0x80], xmm4
0x10012895b: vmovss dword ptr [rax + 0x84], xmm1
0x100128963: vmulps xmm1, xmm2, xmmword ptr [rip + 0x97ee15] ; 0x100aa7780
0x10012896b: vblendps xmm1, xmm1, xmm2, 8
0x100128971: vmovaps xmmword ptr [rax + 0x120], xmm1
0x100128979: vmovaps xmmword ptr [rax + 0x110], xmm1
0x100128981: mov rax, qword ptr [r12 + 0x2e8]
0x100128989: vmovss xmm1, dword ptr [rbx + 0x28]
0x10012898e: vucomiss xmm1, xmm3
0x100128992: jbe 0x1001289b1
0x100128994: vmovss xmm2, dword ptr [rbx + 8]
0x100128999: vdivss xmm1, xmm2, xmm1
0x10012899d: vxorps xmm2, xmm2, xmm2
0x1001289a1: vmaxss xmm1, xmm2, xmm1
0x1001289a5: vmovss xmm2, dword ptr [rip + 0x97c713] ; 0x100aa50c0
0x1001289ad: vminss xmm3, xmm2, xmm1
0x1001289b1: vmovss xmm0, dword ptr [rip + 0x97c707] ; 0x100aa50c0
0x1001289b9: vsubss xmm1, xmm0, xmm3
0x1001289bd: vmovss dword ptr [rsp + 0x10], xmm0
0x1001289c3: vaddss xmm1, xmm1, xmm0
0x1001289c7: vmovss dword ptr [rax + 0x8c], xmm1
0x1001289cf: cmp byte ptr [r12 + 0x390], 0
0x1001289d8: je 0x100128a40
0x1001289da: vmovss xmm1, dword ptr [rbx + 8]
0x1001289df: vucomiss xmm1, dword ptr [rip + 0x982349] ; 0x100aaad30
0x1001289e7: ja 0x100128a40
0x1001289e9: vmovaps xmmword ptr [rsp + 0x3e0], xmm11
0x1001289f2: mov rax, qword ptr [rip + 0x97f6a7] ; 0x100aa80a0
0x1001289f9: mov qword ptr [rsp + 0x2e0], rax
0x100128a01: mov dword ptr [rsp + 0x2e8], 0
0x100128a0c: lea rax, [rip + 0x1cc72ed] ; 0x101defd00
0x100128a13: mov rcx, qword ptr [rax]
0x100128a16: vmovss xmm0, dword ptr [rip + 0x9807a6] ; 0x100aa91c4
0x100128a1e: lea rsi, [rsp + 0x3e0]
0x100128a26: lea rdx, [rsp + 0x2e0]
0x100128a2e: xor r8d, r8d
0x100128a31: mov rdi, qword ptr [rbp + 0x10]
0x100128a35: call 0x1002de9e0 ; 0x1002de9e0
0x100128a3a: vmovaps xmm8, xmmword ptr [rsp + 0x60]
0x100128a40: vmovss xmm0, dword ptr [rbx + 8]
0x100128a45: vucomiss xmm0, dword ptr [rip + 0x9822e3] ; 0x100aaad30
0x100128a4d: seta byte ptr [r12 + 0x390]
0x100128a56: mov qword ptr [r12 + 0x368], 0
0x100128a62: vxorps xmm0, xmm0, xmm0
0x100128a66: vmovaps xmmword ptr [r12 + 0x370], xmm0
0x100128a70: vmovaps xmmword ptr [r12 + 0x380], xmm0
0x100128a7a: vmovss xmm0, dword ptr [r12 + 0x330]
0x100128a84: vsubss xmm0, xmm0, xmm8
0x100128a89: vxorps xmm1, xmm1, xmm1
0x100128a8d: vmaxss xmm1, xmm1, xmm0
0x100128a91: vcmpunordss xmm0, xmm0, xmm0
0x100128a96: vandnps xmm0, xmm0, xmm1
0x100128a9a: vmovss dword ptr [r12 + 0x330], xmm0
0x100128aa4: vmovss xmm0, dword ptr [rip + 0x981e94] ; 0x100aaa940
0x100128aac: vucomiss xmm0, dword ptr [rbx + 8]
0x100128ab1: jae 0x100128b3b
0x100128ab7: mov rax, qword ptr [r13 + 0x78]
0x100128abb: vmovss xmm0, dword ptr [rax + 0x34]
0x100128ac0: vmulss xmm0, xmm0, xmm0
0x100128ac4: vmulss xmm0, xmm0, dword ptr [rip + 0x97fae4] ; 0x100aa85b0
0x100128acc: vmovss xmm1, dword ptr [rip + 0x97fae0] ; 0x100aa85b4
0x100128ad4: vminss xmm0, xmm1, xmm0
0x100128ad8: lea rbx, [r12 + 0x398]
0x100128ae0: vmovss xmm1, dword ptr [r12 + 0x398]
0x100128aea: vmovss xmm2, dword ptr [r12 + 0x39c]
0x100128af4: vmaxss xmm3, xmm0, xmm1
0x100128af8: vcmpunordss xmm1, xmm1, xmm1
0x100128afd: vblendvps xmm0, xmm3, xmm0, xmm1
0x100128b03: vmovaps xmmword ptr [rsp], xmm0
0x100128b08: vmovss dword ptr [r12 + 0x398], xmm0
0x100128b12: vmovss xmm0, dword ptr [rip + 0x97df8e] ; 0x100aa6aa8
0x100128b1a: vcmpunordss xmm1, xmm2, xmm2
0x100128b1f: vandps xmm3, xmm1, xmm0
0x100128b23: vmaxss xmm0, xmm0, xmm2
0x100128b27: vandnps xmm0, xmm1, xmm0
0x100128b2b: vorps xmm0, xmm0, xmm3
0x100128b2f: vmovss dword ptr [r12 + 0x39c], xmm0
0x100128b39: jmp 0x100128b5c ; 0x100128b5c
0x100128b3b: vmovss xmm0, dword ptr [r12 + 0x398]
0x100128b45: vmovaps xmmword ptr [rsp], xmm0
0x100128b4a: vmovss xmm0, dword ptr [r12 + 0x39c]
0x100128b54: lea rbx, [r12 + 0x398]
0x100128b5c: vdivss xmm0, xmm0, dword ptr [rip + 0x97f154] ; 0x100aa7cb8
0x100128b64: vxorps xmm1, xmm1, xmm1
0x100128b68: vmaxss xmm0, xmm1, xmm0
0x100128b6c: vmovss xmm1, dword ptr [rip + 0x97c54c] ; 0x100aa50c0
0x100128b74: vminss xmm0, xmm1, xmm0
0x100128b78: vsubss xmm0, xmm1, xmm0
0x100128b7c: call 0x100aa2858 ; 0x100aa2858 _logf
0x100128b81: vcvtss2sd xmm0, xmm0, xmm0
0x100128b85: vdivsd xmm0, xmm0, qword ptr [rip + 0x97fb33] ; 0x100aa86c0
0x100128b8d: vcvtsd2ss xmm0, xmm0, xmm0
0x100128b91: vmulss xmm0, xmm0, dword ptr [rsp + 0x60]
0x100128b97: call 0x100aa2708 ; 0x100aa2708 _expf
0x100128b9c: vmovss xmm1, dword ptr [rip + 0x97c51c] ; 0x100aa50c0
0x100128ba4: vsubss xmm0, xmm1, xmm0
0x100128ba8: vsubss xmm1, xmm1, xmm0
0x100128bac: vmulss xmm1, xmm1, dword ptr [r12 + 0x394]
0x100128bb6: vmovaps xmm3, xmmword ptr [rsp]
0x100128bbb: vmulss xmm0, xmm0, xmm3
0x100128bbf: vaddss xmm0, xmm1, xmm0
0x100128bc3: vmovss dword ptr [r12 + 0x394], xmm0
0x100128bcd: cmp byte ptr [r13 + 0x21c0], 0
0x100128bd5: je 0x100128bf8
0x100128bd7: vmovss xmm0, dword ptr [rip + 0x97fa29] ; 0x100aa8608
0x100128bdf: vcmpunordss xmm1, xmm3, xmm3
0x100128be4: vandps xmm2, xmm1, xmm0
0x100128be8: vmaxss xmm0, xmm0, xmm3
0x100128bec: vandnps xmm0, xmm1, xmm0
0x100128bf0: vorps xmm0, xmm0, xmm2
0x100128bf4: vmovss dword ptr [rbx], xmm0
0x100128bf8: mov dword ptr [r12 + 0x398], 0
0x100128c04: vmovss xmm0, dword ptr [r12 + 0x3a8]
0x100128c0e: vdivss xmm0, xmm0, dword ptr [rip + 0x97f0a2] ; 0x100aa7cb8
0x100128c16: vxorps xmm1, xmm1, xmm1
0x100128c1a: vmaxss xmm0, xmm1, xmm0
0x100128c1e: vmovss xmm1, dword ptr [rip + 0x97c49a] ; 0x100aa50c0
0x100128c26: vminss xmm0, xmm1, xmm0
0x100128c2a: vsubss xmm0, xmm1, xmm0
0x100128c2e: call 0x100aa2858 ; 0x100aa2858 _logf
0x100128c33: vcvtss2sd xmm0, xmm0, xmm0
0x100128c37: vdivsd xmm0, xmm0, qword ptr [rip + 0x97fa81] ; 0x100aa86c0
0x100128c3f: vcvtsd2ss xmm0, xmm0, xmm0
0x100128c43: vmulss xmm0, xmm0, dword ptr [rsp + 0x60]
0x100128c49: call 0x100aa2708 ; 0x100aa2708 _expf
0x100128c4e: vmovss xmm1, dword ptr [rip + 0x97c46a] ; 0x100aa50c0
0x100128c56: vsubss xmm0, xmm1, xmm0
0x100128c5a: vsubss xmm1, xmm1, xmm0
0x100128c5e: vmulss xmm1, xmm1, dword ptr [r12 + 0x3a0]
0x100128c68: vmulss xmm0, xmm0, dword ptr [r12 + 0x3a4]
0x100128c72: vaddss xmm0, xmm1, xmm0
0x100128c76: vmovss dword ptr [r12 + 0x3a0], xmm0
0x100128c80: mov dword ptr [r12 + 0x3a4], 0
0x100128c8c: mov rax, qword ptr [r12 + 0x2f8]
0x100128c94: mov dword ptr [rax + 0x80], 0
0x100128c9e: mov rax, qword ptr [r12 + 0x300]
0x100128ca6: mov dword ptr [rax + 0x80], 0
0x100128cb0: cmp byte ptr [rip + 0xb5a104], 0 ; 0x100c82dbb
0x100128cb7: je 0x1001290ac
0x100128cbd: mov rdi, qword ptr [r13 + 0x10]
0x100128cc1: call 0x1000f4810 ; 0x1000f4810
0x100128cc6: test al, al
0x100128cc8: je 0x1001290ac
0x100128cce: mov rsi, qword ptr [r13 + 0x10]
0x100128cd2: lea rdi, [rsp + 0x1b0]
0x100128cda: call 0x1000f4830 ; 0x1000f4830
0x100128cdf: mov eax, dword ptr [rsp + 0x1b0]
0x100128ce6: cmp eax, dword ptr [rip + 0xbfab74] ; 0x100d23860
0x100128cec: je 0x1001290ac
0x100128cf2: mov rsi, qword ptr [r13 + 0x10]
0x100128cf6: lea rbx, [rsp + 0x2d8]
0x100128cfe: mov rdi, rbx
0x100128d01: call 0x1000f4830 ; 0x1000f4830
0x100128d06: mov rdi, qword ptr [rbp + 0x58]
0x100128d0a: mov rsi, rbx
0x100128d0d: call 0x100101e20 ; 0x100101e20
0x100128d12: mov rbx, rax
0x100128d15: test rbx, rbx
0x100128d18: je 0x100128d70
0x100128d1a: mov rsi, qword ptr [rbx + 0x10]
0x100128d1e: lea rdi, [rsp + 0x1a8]
0x100128d26: call 0x1000f4830 ; 0x1000f4830
0x100128d2b: mov eax, dword ptr [rsp + 0x1a8]
0x100128d32: xor r14d, r14d
0x100128d35: cmp eax, dword ptr [r13 + 0xe0]
0x100128d3c: sete r15b
0x100128d40: mov rdi, qword ptr [r13 + 0x50]
0x100128d44: mov rsi, rbx
0x100128d47: call 0x10012e890 ; 0x10012e890
0x100128d4c: vxorps xmm0, xmm0, xmm0
0x100128d50: vmovss dword ptr [rsp + 0x10], xmm0
0x100128d56: test al, al
0x100128d58: jne 0x100128d70
0x100128d5a: mov r14b, r15b
0x100128d5d: lea rax, [rip + 0x982b2c] ; 0x100aab890
0x100128d64: vmovss xmm0, dword ptr [rax + r14*4]
0x100128d6a: vmovss dword ptr [rsp + 0x10], xmm0
0x100128d70: mov rax, qword ptr [rsp + 0x28]
0x100128d75: mov rsi, qword ptr [rax + 0x298]
0x100128d7c: lea rdi, [rsp + 0x600]
0x100128d84: call 0x1007f26b0 ; 0x1007f26b0
0x100128d89: mov rsi, qword ptr [r13 + 0x10]
0x100128d8d: lea rdi, [rsp + 0x580]
0x100128d95: call 0x1000f4860 ; 0x1000f4860
0x100128d9a: vmovaps xmm1, xmmword ptr [rsp + 0x580]
0x100128da3: vmovaps xmm2, xmmword ptr [rsp + 0x600]
0x100128dac: vsubps xmm0, xmm1, xmm2
0x100128db0: vmulps xmm3, xmm0, xmm0
0x100128db4: vmovshdup xmm4, xmm3
0x100128db8: vaddss xmm4, xmm3, xmm4
0x100128dbc: vpermilpd xmm3, xmm3, 1
0x100128dc2: vaddss xmm3, xmm3, xmm4
0x100128dc6: vsqrtss xmm3, xmm3, xmm3
0x100128dca: vucomiss xmm3, dword ptr [rip + 0x97eaf2] ; 0x100aa78c4
0x100128dd2: jbe 0x100128dde
0x100128dd4: vpermilps xmm3, xmm3, 0xc0
0x100128dda: vdivps xmm0, xmm0, xmm3
0x100128dde: vmovss xmm7, dword ptr [rip + 0x97eade] ; 0x100aa78c4
0x100128de6: vmovaps xmm8, xmmword ptr [rip + 0x9828a2] ; 0x100aab690
0x100128dee: mov rax, qword ptr [r12 + 0x2f8]
0x100128df6: vmovaps xmmword ptr [rax + 0x20], xmm2
0x100128dfb: mov rax, qword ptr [r12 + 0x2f8]
0x100128e03: vmulps xmm2, xmm0, xmm0
0x100128e07: vmovshdup xmm3, xmm2
0x100128e0b: vaddss xmm3, xmm2, xmm3
0x100128e0f: vpermilpd xmm2, xmm2, 1
0x100128e15: vaddss xmm2, xmm2, xmm3
0x100128e19: vsqrtss xmm2, xmm2, xmm2
0x100128e1d: vucomiss xmm2, dword ptr [rip + 0x97ea9f] ; 0x100aa78c4
0x100128e25: vmovaps xmm3, xmm0
0x100128e29: jbe 0x100128e35
0x100128e2b: vpermilps xmm3, xmm2, 0xc0
0x100128e31: vdivps xmm3, xmm0, xmm3
0x100128e35: vxorps xmm4, xmm3, xmmword ptr [rip + 0x97eac3] ; 0x100aa7900
0x100128e3d: vmulps xmm5, xmm3, xmm3
0x100128e41: vmovshdup xmm6, xmm5
0x100128e45: vaddss xmm6, xmm5, xmm6
0x100128e49: vpermilpd xmm5, xmm5, 1
0x100128e4f: vaddss xmm5, xmm5, xmm6
0x100128e53: vsqrtss xmm5, xmm5, xmm5
0x100128e57: vucomiss xmm5, dword ptr [rip + 0x97ea65] ; 0x100aa78c4
0x100128e5f: jbe 0x100128e6b
0x100128e61: vpermilps xmm5, xmm5, 0xc0
0x100128e67: vdivps xmm4, xmm4, xmm5
0x100128e6b: vmulps xmm4, xmm4, xmmword ptr [rip + 0x98281d] ; 0x100aab690
0x100128e73: vmovshdup xmm5, xmm4
0x100128e77: vaddss xmm5, xmm4, xmm5
0x100128e7b: vpermilpd xmm4, xmm4, 1
0x100128e81: vaddss xmm4, xmm4, xmm5
0x100128e85: vaddss xmm4, xmm4, dword ptr [rip + 0x97c237] ; 0x100aa50c4
0x100128e8d: vandps xmm4, xmm4, xmmword ptr [rip + 0x97ea7b] ; 0x100aa7910
0x100128e95: vucomiss xmm7, xmm4
0x100128e99: jae 0x100128f05
0x100128e9b: vmulps xmm4, xmm3, xmm8
0x100128ea0: vmovshdup xmm5, xmm4
0x100128ea4: vaddss xmm5, xmm4, xmm5
0x100128ea8: vpermilpd xmm4, xmm4, 1
0x100128eae: vaddss xmm4, xmm4, xmm5
0x100128eb2: vmovss xmm5, dword ptr [rip + 0x97c206] ; 0x100aa50c0
0x100128eba: vaddss xmm4, xmm4, xmm5
0x100128ebe: vaddss xmm4, xmm4, xmm4
0x100128ec2: vsqrtss xmm4, xmm4, xmm4
0x100128ec6: vdivss xmm5, xmm5, xmm4
0x100128eca: vmovss xmm6, dword ptr [rip + 0x97c1f2] ; 0x100aa50c4
0x100128ed2: vmulps xmm6, xmm3, xmm6
0x100128ed6: vpermilps xmm3, xmm3, 0xd2
0x100128edc: vmulps xmm3, xmm3, xmm8
0x100128ee1: vsubps xmm3, xmm6, xmm3
0x100128ee5: vpermilps xmm3, xmm3, 0xd2
0x100128eeb: vpermilps xmm5, xmm5, 0xc0
0x100128ef1: vmulps xmm3, xmm3, xmm5
0x100128ef5: vmulss xmm4, xmm4, dword ptr [rip + 0x97b6bb] ; 0x100aa45b8
0x100128efd: vinsertps xmm3, xmm3, xmm4, 0x30
0x100128f03: jmp 0x100128f0d ; 0x100128f0d
0x100128f05: vmovaps xmm3, xmmword ptr [rip + 0x982793] ; 0x100aab6a0
0x100128f0d: vmovaps xmmword ptr [rax + 0x30], xmm3
0x100128f12: vpermilps xmm4, xmm3, 0xe7
0x100128f18: vucomiss xmm4, xmm4
0x100128f1c: jp 0x10012bd65
0x100128f22: vmovshdup xmm4, xmm3
0x100128f26: vucomiss xmm3, xmm4
0x100128f2a: jp 0x10012bd65
0x100128f30: vpermilpd xmm3, xmm3, 1
0x100128f36: vucomiss xmm3, xmm3
0x100128f3a: jp 0x10012bd65
0x100128f40: vucomiss xmm2, dword ptr [rip + 0x97e97c] ; 0x100aa78c4
0x100128f48: mov rax, qword ptr [r12 + 0x2f8]
0x100128f50: vmovss xmm3, dword ptr [rsp + 0x10]
0x100128f56: vmovss dword ptr [rax + 0x80], xmm3
0x100128f5e: mov rax, qword ptr [r12 + 0x300]
0x100128f66: vmulps xmm3, xmm0, xmmword ptr [rip + 0x97e702] ; 0x100aa7670
0x100128f6e: vsubps xmm1, xmm1, xmm3
0x100128f72: vmovaps xmmword ptr [rax + 0x20], xmm1
0x100128f77: mov rax, qword ptr [r12 + 0x300]
0x100128f7f: jbe 0x100128f8b
0x100128f81: vpermilps xmm1, xmm2, 0xc0
0x100128f87: vdivps xmm0, xmm0, xmm1
0x100128f8b: vxorps xmm1, xmm0, xmmword ptr [rip + 0x97e96d] ; 0x100aa7900
0x100128f93: vmulps xmm2, xmm0, xmm0
0x100128f97: vmovshdup xmm3, xmm2
0x100128f9b: vaddss xmm3, xmm2, xmm3
0x100128f9f: vpermilpd xmm2, xmm2, 1
0x100128fa5: vaddss xmm2, xmm2, xmm3
0x100128fa9: vsqrtss xmm2, xmm2, xmm2
0x100128fad: vucomiss xmm2, dword ptr [rip + 0x97e90f] ; 0x100aa78c4
0x100128fb5: jbe 0x100128fc1
0x100128fb7: vpermilps xmm2, xmm2, 0xc0
0x100128fbd: vdivps xmm1, xmm1, xmm2
0x100128fc1: vmulps xmm1, xmm1, xmmword ptr [rip + 0x9826c7] ; 0x100aab690
0x100128fc9: vmovshdup xmm2, xmm1
0x100128fcd: vaddss xmm2, xmm1, xmm2
0x100128fd1: vpermilpd xmm1, xmm1, 1
0x100128fd7: vaddss xmm1, xmm1, xmm2
0x100128fdb: vaddss xmm1, xmm1, dword ptr [rip + 0x97c0e1] ; 0x100aa50c4
0x100128fe3: vandps xmm1, xmm1, xmmword ptr [rip + 0x97e925] ; 0x100aa7910
0x100128feb: vucomiss xmm7, xmm1
0x100128fef: jae 0x10012905b
0x100128ff1: vmulps xmm1, xmm0, xmm8
0x100128ff6: vmovshdup xmm2, xmm1
0x100128ffa: vaddss xmm2, xmm1, xmm2
0x100128ffe: vpermilpd xmm1, xmm1, 1
0x100129004: vaddss xmm1, xmm1, xmm2
0x100129008: vmovss xmm2, dword ptr [rip + 0x97c0b0] ; 0x100aa50c0
0x100129010: vaddss xmm1, xmm1, xmm2
0x100129014: vaddss xmm1, xmm1, xmm1
0x100129018: vsqrtss xmm1, xmm1, xmm1
0x10012901c: vdivss xmm2, xmm2, xmm1
0x100129020: vmovss xmm3, dword ptr [rip + 0x97c09c] ; 0x100aa50c4
0x100129028: vmulps xmm3, xmm0, xmm3
0x10012902c: vpermilps xmm0, xmm0, 0xd2
0x100129032: vmulps xmm0, xmm0, xmm8
0x100129037: vsubps xmm0, xmm3, xmm0
0x10012903b: vpermilps xmm0, xmm0, 0xd2
0x100129041: vpermilps xmm2, xmm2, 0xc0
0x100129047: vmulps xmm0, xmm0, xmm2
0x10012904b: vmulss xmm1, xmm1, dword ptr [rip + 0x97b565] ; 0x100aa45b8
0x100129053: vinsertps xmm0, xmm0, xmm1, 0x30
0x100129059: jmp 0x100129063 ; 0x100129063
0x10012905b: vmovaps xmm0, xmmword ptr [rip + 0x98263d] ; 0x100aab6a0
0x100129063: vmovaps xmmword ptr [rax + 0x30], xmm0
0x100129068: vpermilps xmm1, xmm0, 0xe7
0x10012906e: vucomiss xmm1, xmm1
0x100129072: jp 0x10012bd65
0x100129078: vmovshdup xmm1, xmm0
0x10012907c: vucomiss xmm0, xmm1
0x100129080: jp 0x10012bd65
0x100129086: vpermilpd xmm0, xmm0, 1
0x10012908c: vucomiss xmm0, xmm0
0x100129090: jp 0x10012bd65
0x100129096: mov rax, qword ptr [r12 + 0x300]
0x10012909e: vmovss xmm0, dword ptr [rsp + 0x10]
0x1001290a4: vmovss dword ptr [rax + 0x80], xmm0
0x1001290ac: cmp byte ptr [rip + 0xbfa8e5], 0 ; 0x100d23998
0x1001290b3: mov rbx, qword ptr [rsp + 0x40]
0x1001290b8: je 0x100129e0a
0x1001290be: mov rdi, qword ptr [r13 + 0x80]
0x1001290c5: lea rsi, [rsp + 0x600]
0x1001290cd: lea rcx, [rsp + 0x15c]
0x1001290d5: mov edx, 0x20
0x1001290da: call 0x100114af0 ; 0x100114af0
0x1001290df: mov r13, qword ptr [r12 + 0x308]
0x1001290e7: lea rax, [rip + 0x1f165c2] ; 0x10203f6b0
0x1001290ee: vmovaps xmm0, xmmword ptr [rax]
0x1001290f2: vmovaps xmmword ptr [r13 + 0x120], xmm0
0x1001290fb: vmovaps xmmword ptr [r13 + 0x110], xmm0
0x100129104: mov dword ptr [r13 + 0x8c], 0x3f800000
0x10012910f: mov dword ptr [r13 + 0x80], 0
0x10012911a: mov r14, qword ptr [rsp + 0x28]
0x10012911f: mov rsi, qword ptr [r14 + 0x288]
0x100129126: lea rdi, [rsp + 0x1f0]
0x10012912e: call 0x1007f26b0 ; 0x1007f26b0
0x100129133: mov rsi, qword ptr [r14 + 0x298]
0x10012913a: lea rdi, [rsp + 0x3d0]
0x100129142: call 0x1007f26b0 ; 0x1007f26b0
0x100129147: vmovaps xmm0, xmmword ptr [rsp + 0x3d0]
0x100129150: vsubps xmm2, xmm0, xmmword ptr [rsp + 0x1f0]
0x100129159: vmulps xmm0, xmm2, xmm2
0x10012915d: vmovshdup xmm1, xmm0
0x100129161: vaddss xmm1, xmm0, xmm1
0x100129165: vpermilpd xmm0, xmm0, 1
0x10012916b: vaddss xmm0, xmm0, xmm1
0x10012916f: vsqrtss xmm0, xmm0, xmm0
0x100129173: vucomiss xmm0, dword ptr [rip + 0x97e749] ; 0x100aa78c4
0x10012917b: jbe 0x100129187
0x10012917d: vpermilps xmm0, xmm0, 0xc0
0x100129183: vdivps xmm2, xmm2, xmm0
0x100129187: vmovaps xmmword ptr [rsp + 0xc0], xmm2
0x100129190: mov rdi, qword ptr [rsp + 0x28]
0x100129195: call 0x10016e070 ; 0x10016e070
0x10012919a: cmp dword ptr [rsp + 0x15c], 0
0x1001291a2: je 0x100129dfd
0x1001291a8: vmovaps xmm1, xmmword ptr [rsp + 0xc0]
0x1001291b1: vmulps xmm1, xmm1, xmm1
0x1001291b5: vmovshdup xmm2, xmm1
0x1001291b9: vaddss xmm2, xmm1, xmm2
0x1001291bd: vpermilpd xmm1, xmm1, 1
0x1001291c3: vaddss xmm1, xmm1, xmm2
0x1001291c7: vmulss xmm0, xmm0, dword ptr [rip + 0x97e61d] ; 0x100aa77ec
0x1001291cf: vmovss dword ptr [rsp + 0x120], xmm0
0x1001291d8: vmovss xmm2, dword ptr [rip + 0x97bee0] ; 0x100aa50c0
0x1001291e0: vdivss xmm0, xmm2, dword ptr [rsp + 0x30]
0x1001291e6: vxorps xmm3, xmm3, xmm3
0x1001291ea: vmaxss xmm0, xmm3, xmm0
0x1001291ee: vminss xmm0, xmm2, xmm0
0x1001291f2: vmovss dword ptr [rsp + 0x190], xmm0
0x1001291fb: xor r14d, r14d
0x1001291fe: lea r15, [rsp + 0xfc]
0x100129206: vsqrtss xmm0, xmm1, xmm1
0x10012920a: vmovaps xmmword ptr [rsp + 0x130], xmm0
0x100129213: nop word ptr cs:[rax + rax]
0x100129220: mov r12d, r14d
0x100129223: shl r12, 5
0x100129227: vmovaps xmm0, xmmword ptr [rsp + r12 + 0x600]
0x100129231: vsubps xmm3, xmm0, xmmword ptr [rsp + 0x1f0]
0x10012923a: vmovaps xmm1, xmmword ptr [rbx + 0x80]
0x100129242: vmulps xmm2, xmm1, xmmword ptr [rip + 0x980e06] ; 0x100aaa050
0x10012924a: vmovaps xmmword ptr [rsp], xmm3
0x10012924f: vmulps xmm1, xmm3, xmm1
0x100129253: vmovshdup xmm3, xmm1
0x100129257: vaddss xmm3, xmm1, xmm3
0x10012925b: vpermilpd xmm1, xmm1, 1
0x100129261: vaddss xmm1, xmm1, xmm3
0x100129265: vpermilps xmm1, xmm1, 0xc0
0x10012926b: vmulps xmm1, xmm2, xmm1
0x10012926f: vaddps xmm0, xmm0, xmm1
0x100129273: vmovaps xmmword ptr [rsp + 0x580], xmm0
0x10012927c: xor r8d, r8d
0x10012927f: mov rdi, qword ptr [rbp + 0x50]
0x100129283: lea rsi, [rsp + 0x580]
0x10012928b: mov rdx, r15
0x10012928e: lea rcx, [rsp + 0x1e0]
0x100129296: call 0x1002149c0 ; 0x1002149c0
0x10012929b: vmovaps xmm9, xmmword ptr [rsp + 0x1e0]
0x1001292a4: vxorps xmm13, xmm9, xmmword ptr [rip + 0x97e654] ; 0x100aa7900
0x1001292ac: vmovaps xmmword ptr [rsp + 0x1e0], xmm13
0x1001292b5: vmovss xmm0, dword ptr [rip + 0x97ff17] ; 0x100aa91d4
0x1001292bd: vaddss xmm0, xmm0, dword ptr [rsp + 0xfc]
0x1001292c6: vmovss dword ptr [rsp + 0xfc], xmm0
0x1001292cf: vmovss xmm1, dword ptr [rsp + r12 + 0x610]
0x1001292d9: vmovss xmm7, dword ptr [rip + 0x97e5e3] ; 0x100aa78c4
0x1001292e1: vucomiss xmm1, xmm7
0x1001292e5: vmovss xmm15, dword ptr [rip + 0x97bdd3] ; 0x100aa50c0
0x1001292ed: vmovss xmm5, dword ptr [rip + 0x9802db] ; 0x100aa95d0
0x1001292f5: ja 0x100129301
0x1001292f7: vucomiss xmm5, xmm1
0x1001292fb: vmovaps xmm2, xmm15
0x1001292ff: jbe 0x100129309
0x100129301: vaddss xmm2, xmm0, xmm1
0x100129305: vdivss xmm2, xmm2, xmm1
0x100129309: vmulss xmm3, xmm1, dword ptr [rip + 0x97e4db] ; 0x100aa77ec
0x100129311: vaddss xmm3, xmm3, dword ptr [rip + 0x97e9a7] ; 0x100aa7cc0
0x100129319: vaddss xmm3, xmm1, xmm3
0x10012931d: vucomiss xmm3, xmm7
0x100129321: ja 0x10012932e
0x100129323: vucomiss xmm5, xmm3
0x100129327: vmovaps xmm10, xmm15
0x10012932c: jbe 0x100129336
0x10012932e: vaddss xmm4, xmm0, xmm1
0x100129332: vdivss xmm10, xmm4, xmm3
0x100129336: vaddss xmm3, xmm1, dword ptr [rip + 0x97e4ae] ; 0x100aa77ec
0x10012933e: vaddss xmm3, xmm1, xmm3
0x100129342: vucomiss xmm3, xmm7
0x100129346: vmovaps xmm4, xmmword ptr [rsp]
0x10012934b: ja 0x100129357
0x10012934d: vucomiss xmm5, xmm3
0x100129351: vmovaps xmm5, xmm15
0x100129355: jbe 0x10012935f
0x100129357: vaddss xmm0, xmm0, xmm1
0x10012935b: vdivss xmm5, xmm0, xmm3
0x10012935f: vmovss dword ptr [rsp + 0x30], xmm5
0x100129365: vmovaps xmm0, xmmword ptr [rsp + 0x130]
0x10012936e: vucomiss xmm0, xmm7
0x100129372: vmovaps xmm1, xmmword ptr [rsp + 0xc0]
0x10012937b: vmovaps xmm14, xmm1
0x10012937f: jbe 0x100129390
0x100129381: vpermilps xmm0, xmmword ptr [rsp + 0x130], 0xc0
0x10012938c: vdivps xmm14, xmm1, xmm0
0x100129390: vmulps xmm0, xmm4, xmm4
0x100129394: vmovshdup xmm1, xmm0
0x100129398: vaddss xmm1, xmm0, xmm1
0x10012939c: vpermilpd xmm0, xmm0, 1
0x1001293a2: vaddss xmm0, xmm0, xmm1
0x1001293a6: vsqrtss xmm5, xmm0, xmm0
0x1001293aa: vucomiss xmm5, xmm7
0x1001293ae: vmovaps xmm8, xmm4
0x1001293b2: jbe 0x1001293be
0x1001293b4: vpermilps xmm0, xmm5, 0xc0
0x1001293ba: vdivps xmm8, xmm4, xmm0
0x1001293be: vmulps xmm0, xmm9, xmm9
0x1001293c3: vmovshdup xmm1, xmm0
0x1001293c7: vaddss xmm1, xmm0, xmm1
0x1001293cb: vpermilpd xmm0, xmm0, 1
0x1001293d1: vaddss xmm0, xmm0, xmm1
0x1001293d5: vsqrtss xmm6, xmm0, xmm0
0x1001293d9: vucomiss xmm6, xmm7
0x1001293dd: vmovaps xmm1, xmm9
0x1001293e1: jbe 0x1001293ed
0x1001293e3: vpermilps xmm0, xmm6, 0xc0
0x1001293e9: vdivps xmm1, xmm9, xmm0
0x1001293ed: vucomiss xmm5, xmm7
0x1001293f1: vmovaps xmm3, xmm4
0x1001293f5: jbe 0x100129401
0x1001293f7: vpermilps xmm0, xmm5, 0xc0
0x1001293fd: vdivps xmm3, xmm4, xmm0
0x100129401: vxorps xmm0, xmm0, xmm0
0x100129405: vmaxss xmm2, xmm0, xmm2
0x100129409: vucomiss xmm6, xmm7
0x10012940d: vmovaps xmm11, xmm9
0x100129412: jbe 0x10012941e
0x100129414: vpermilps xmm0, xmm6, 0xc0
0x10012941a: vdivps xmm11, xmm9, xmm0
0x10012941e: vmovaps xmmword ptr [rsp + 0x90], xmm9
0x100129427: vminss xmm9, xmm15, xmm2
0x10012942b: vucomiss xmm5, xmm7
0x10012942f: vmovaps xmm2, xmm4
0x100129433: jbe 0x10012943f
0x100129435: vpermilps xmm2, xmm5, 0xc0
0x10012943b: vdivps xmm2, xmm4, xmm2
0x10012943f: vmovaps xmm0, xmmword ptr [rbx + 0x80]
0x100129447: vmulps xmm5, xmm4, xmm0
0x10012944b: vmovshdup xmm6, xmm5
0x10012944f: vaddss xmm6, xmm5, xmm6
0x100129453: vpermilpd xmm5, xmm5, 1
0x100129459: vaddss xmm5, xmm5, xmm6
0x10012945d: vmovss xmm4, dword ptr [rip + 0x97b153] ; 0x100aa45b8
0x100129465: vmulss xmm5, xmm5, xmm4
0x100129469: vdivss xmm5, xmm5, dword ptr [rsp + 0x120]
0x100129472: vaddss xmm5, xmm5, xmm4
0x100129476: vxorps xmm6, xmm6, xmm6
0x10012947a: vmaxss xmm5, xmm6, xmm5
0x10012947e: vminss xmm12, xmm15, xmm5
0x100129482: vmovaps xmmword ptr [rsp], xmm13
0x100129487: vmovaps xmmword ptr [rsp + 0x10], xmm0
0x10012948d: vmulps xmm5, xmm13, xmm0
0x100129491: vmovshdup xmm4, xmm5
0x100129495: vaddss xmm4, xmm5, xmm4
0x100129499: vpermilpd xmm5, xmm5, 1
0x10012949f: vmovaps xmm7, xmm15
0x1001294a3: vaddss xmm15, xmm5, xmm4
0x1001294a7: vsubss xmm4, xmm7, xmm12
0x1001294ac: vcmpltss xmm5, xmm15, xmm6
0x1001294b1: vblendvps xmm0, xmm4, xmm12, xmm5
0x1001294b7: vsubss xmm4, xmm7, xmm0
0x1001294bb: vmulss xmm13, xmm4, dword ptr [rip + 0x98235d] ; 0x100aab820
0x1001294c3: vaddss xmm4, xmm9, xmm13
0x1001294c8: vmaxss xmm4, xmm6, xmm4
0x1001294cc: vminss xmm4, xmm7, xmm4
0x1001294d0: vucomiss xmm4, xmm6
0x1001294d4: jbe 0x100129dec
0x1001294da: vmovaps xmmword ptr [rsp + 0xd0], xmm0
0x1001294e3: vmulps xmm4, xmm14, xmm8
0x1001294e8: vmulps xmm1, xmm1, xmm3
0x1001294ec: vmovshdup xmm3, xmm4
0x1001294f0: vaddss xmm3, xmm4, xmm3
0x1001294f4: vpermilpd xmm4, xmm4, 1
0x1001294fa: vaddss xmm3, xmm4, xmm3
0x1001294fe: vmovshdup xmm4, xmm1
0x100129502: vmulss xmm3, xmm3, dword ptr [rip + 0x97e2e6] ; 0x100aa77f0
0x10012950a: vaddss xmm4, xmm1, xmm4
0x10012950e: vpermilpd xmm1, xmm1, 1
0x100129514: vaddss xmm1, xmm1, xmm4
0x100129518: vmovss xmm4, dword ptr [rip + 0x97b098] ; 0x100aa45b8
0x100129520: vmovaps xmm7, xmm4
0x100129524: vaddss xmm3, xmm3, xmm7
0x100129528: vxorps xmm5, xmm5, xmm5
0x10012952c: vmaxss xmm3, xmm5, xmm3
0x100129530: vmovss xmm4, dword ptr [rip + 0x97bb88] ; 0x100aa50c0
0x100129538: vmovaps xmm6, xmm4
0x10012953c: vminss xmm3, xmm6, xmm3
0x100129540: vsubss xmm4, xmm6, xmm3
0x100129544: vmulss xmm4, xmm4, dword ptr [rip + 0x97f45c] ; 0x100aa89a8
0x10012954c: vaddss xmm3, xmm3, xmm4
0x100129550: vmulss xmm1, xmm1, xmm7
0x100129554: vaddss xmm1, xmm1, xmm7
0x100129558: vmaxss xmm1, xmm5, xmm1
0x10012955c: vminss xmm1, xmm6, xmm1
0x100129560: vmaxss xmm4, xmm5, xmm10
0x100129565: vminss xmm4, xmm6, xmm4
0x100129569: vmulss xmm3, xmm4, xmm3
0x10012956d: vsubss xmm4, xmm6, xmm1
0x100129571: vmovss xmm0, dword ptr [rip + 0x97f0b7] ; 0x100aa8630
0x100129579: vmovaps xmm8, xmm0
0x10012957d: vmulss xmm4, xmm4, xmm8
0x100129582: vaddss xmm1, xmm1, xmm4
0x100129586: vmaxss xmm4, xmm5, dword ptr [rsp + 0x30]
0x10012958c: vminss xmm4, xmm6, xmm4
0x100129590: vmulss xmm1, xmm3, xmm1
0x100129594: vmulps xmm0, xmm11, xmm2
0x100129598: vmovshdup xmm2, xmm0
0x10012959c: vaddss xmm2, xmm0, xmm2
0x1001295a0: vpermilpd xmm0, xmm0, 1
0x1001295a6: vaddss xmm0, xmm0, xmm2
0x1001295aa: vmulss xmm0, xmm0, xmm7
0x1001295ae: vaddss xmm0, xmm0, xmm7
0x1001295b2: vmaxss xmm0, xmm5, xmm0
0x1001295b6: vminss xmm0, xmm6, xmm0
0x1001295ba: vsubss xmm2, xmm6, xmm0
0x1001295be: vmulss xmm2, xmm2, xmm8
0x1001295c3: vaddss xmm0, xmm0, xmm2
0x1001295c7: vmulss xmm0, xmm4, xmm0
0x1001295cb: vmovaps xmm3, xmmword ptr [rbx + 0x50]
0x1001295d0: vmulps xmm2, xmm3, xmm3
0x1001295d4: vmovshdup xmm4, xmm2
0x1001295d8: vaddss xmm4, xmm2, xmm4
0x1001295dc: vpermilpd xmm2, xmm2, 1
0x1001295e2: vaddss xmm4, xmm2, xmm4
0x1001295e6: vinsertps xmm2, xmm1, xmm0, 0x10
0x1001295ec: vmovaps xmm0, xmmword ptr [rip + 0x98217c] ; 0x100aab770
0x1001295f4: vmulps xmm0, xmm0, xmmword ptr [rbx + 0x60]
0x1001295f9: vaddps xmm1, xmm3, xmm0
0x1001295fd: vmulps xmm0, xmm1, xmm1
0x100129601: vmovshdup xmm3, xmm0
0x100129605: vaddss xmm3, xmm0, xmm3
0x100129609: vpermilpd xmm0, xmm0, 1
0x10012960f: vaddss xmm7, xmm0, xmm3
0x100129613: vsqrtss xmm0, xmm4, xmm4
0x100129617: vmovsldup xmm3, xmm13
0x10012961c: vsqrtss xmm4, xmm7, xmm7
0x100129620: vucomiss xmm4, dword ptr [rip + 0x97e29c] ; 0x100aa78c4
0x100129628: jbe 0x100129634
0x10012962a: vpermilps xmm4, xmm4, 0xc0
0x100129630: vdivps xmm1, xmm1, xmm4
0x100129634: vmovaps xmm11, xmmword ptr [rsp]
0x100129639: vaddss xmm0, xmm0, dword ptr [rip + 0x9821d7] ; 0x100aab818
0x100129641: vaddps xmm2, xmm2, xmm3
0x100129645: vpermilps xmm3, xmm1, 0xd2
0x10012964b: vmulps xmm3, xmm3, xmm11
0x100129650: vpermilps xmm4, xmm11, 0xd2
0x100129656: vmulps xmm1, xmm4, xmm1
0x10012965a: vsubps xmm3, xmm3, xmm1
0x10012965e: vpermilps xmm1, xmm3, 0xd2
0x100129664: vmulps xmm3, xmm3, xmm3
0x100129668: vpermilpd xmm4, xmm3, 1
0x10012966e: vaddss xmm4, xmm4, xmm3
0x100129672: vmovshdup xmm3, xmm3
0x100129676: vaddss xmm3, xmm3, xmm4
0x10012967a: vsqrtss xmm3, xmm3, xmm3
0x10012967e: vucomiss xmm3, dword ptr [rip + 0x97e23e] ; 0x100aa78c4
0x100129686: vmovaps xmm10, xmmword ptr [rsp + 0x10]
0x10012968c: jbe 0x100129698
0x10012968e: vpermilps xmm3, xmm3, 0xc0
0x100129694: vdivps xmm1, xmm1, xmm3
0x100129698: vaddss xmm3, xmm12, dword ptr [rip + 0x97ef80] ; 0x100aa8620
0x1001296a0: vdivss xmm4, xmm0, dword ptr [rip + 0x982174] ; 0x100aab81c
0x1001296a8: vxorps xmm0, xmm0, xmm0
0x1001296ac: vmaxps xmm5, xmm0, xmm2
0x1001296b0: vucomiss xmm15, dword ptr [rip + 0x97da2c] ; 0x100aa70e4
0x1001296b8: ja 0x1001296c0
0x1001296ba: vmovaps xmm0, xmm1
0x1001296be: jmp 0x1001296c8 ; 0x1001296c8
0x1001296c0: vxorps xmm0, xmm1, xmmword ptr [rip + 0x97e238] ; 0x100aa7900
0x1001296c8: vmovss xmm12, dword ptr [rip + 0x97e1f4] ; 0x100aa78c4
0x1001296d0: vmovss xmm14, dword ptr [rip + 0x97b9e8] ; 0x100aa50c0
0x1001296d8: vandps xmm2, xmm3, xmmword ptr [rip + 0x97e230] ; 0x100aa7910
0x1001296e0: vxorps xmm3, xmm3, xmm3
0x1001296e4: vmaxss xmm3, xmm3, xmm4
0x1001296e8: vmovaps xmm4, xmmword ptr [rip + 0x980e60] ; 0x100aaa550
0x1001296f0: vminps xmm13, xmm4, xmm5
0x1001296f4: vaddps xmm4, xmm1, xmm1
0x1001296f8: vmulps xmm1, xmm1, xmm0
0x1001296fc: vmovshdup xmm5, xmm1
0x100129700: vaddss xmm5, xmm1, xmm5
0x100129704: vpermilpd xmm1, xmm1, 1
0x10012970a: vaddss xmm1, xmm1, xmm5
0x10012970e: vpermilps xmm1, xmm1, 0xc0
0x100129714: vmovaps xmm8, xmm10
0x100129719: ja 0x100129723
0x10012971b: vxorps xmm8, xmm10, xmmword ptr [rip + 0x97e1dd] ; 0x100aa7900
0x100129723: vmulps xmm1, xmm4, xmm1
0x100129727: vaddss xmm2, xmm2, xmm2
0x10012972b: vminss xmm3, xmm14, xmm3
0x10012972f: vmovss dword ptr [rsp + 0xa8], xmm3
0x100129738: vcvtss2sd xmm3, xmm13, xmm13
0x10012973d: vaddsd xmm3, xmm3, xmm3
0x100129741: vaddsd xmm3, xmm3, qword ptr [rip + 0x98214f] ; 0x100aab898
0x100129749: vcvtsd2ss xmm3, xmm3, xmm3
0x10012974d: vpermilps xmm3, xmm3, 0xc0
0x100129753: vmulps xmm3, xmm3, xmm8
0x100129758: vmovaps xmm4, xmmword ptr [rbx + 0x70]
0x10012975d: vsubps xmm4, xmm4, xmm3
0x100129761: vmulps xmm3, xmm4, xmm4
0x100129765: vmovshdup xmm5, xmm3
0x100129769: vaddss xmm5, xmm3, xmm5
0x10012976d: vpermilpd xmm3, xmm3, 1
0x100129773: vaddss xmm3, xmm3, xmm5
0x100129777: vsqrtss xmm3, xmm3, xmm3
0x10012977b: vucomiss xmm3, xmm12
0x100129780: jbe 0x10012978c
0x100129782: vpermilps xmm3, xmm3, 0xc0
0x100129788: vdivps xmm4, xmm4, xmm3
0x10012978c: vsubps xmm3, xmm0, xmm1
0x100129790: vmovshdup xmm1, xmm13
0x100129795: vmovaps xmmword ptr [rsp + 0x170], xmm1
0x10012979e: vmulss xmm1, xmm1, dword ptr [rip + 0x97d94e] ; 0x100aa70f4
0x1001297a6: vaddss xmm1, xmm1, dword ptr [rip + 0x97e03a] ; 0x100aa77e8
0x1001297ae: vmovss xmm5, dword ptr [rip + 0x97fa0e] ; 0x100aa91c4
0x1001297b6: vmovaps xmm6, xmm5
0x1001297ba: vmulss xmm5, xmm13, xmm6
0x1001297be: vaddss xmm5, xmm5, xmm1
0x1001297c2: vmovss xmm1, dword ptr [rsp + 0xa8]
0x1001297cb: vmulss xmm1, xmm1, xmm1
0x1001297cf: vmulss xmm1, xmm1, xmm6
0x1001297d3: vaddss xmm5, xmm1, xmm5
0x1001297d7: vminss xmm2, xmm14, xmm2
0x1001297db: vsubss xmm7, xmm14, xmm2
0x1001297df: vmulss xmm6, xmm2, dword ptr [rip + 0x97ede5] ; 0x100aa85cc
0x1001297e7: vaddss xmm6, xmm7, xmm6
0x1001297eb: vmulss xmm5, xmm6, xmm5
0x1001297ef: vpermilps xmm5, xmm5, 0xc0
0x1001297f5: vmulps xmm5, xmm5, xmm11
0x1001297fa: vaddps xmm9, xmm5, xmm0
0x1001297fe: vmulps xmm0, xmm9, xmm9
0x100129803: vmovshdup xmm6, xmm0
0x100129807: vaddss xmm6, xmm0, xmm6
0x10012980b: vpermilpd xmm0, xmm0, 1
0x100129811: vaddss xmm0, xmm0, xmm6
0x100129815: vsqrtss xmm0, xmm0, xmm0
0x100129819: vucomiss xmm0, xmm12
0x10012981e: jbe 0x10012982a
0x100129820: vpermilps xmm0, xmm0, 0xc0
0x100129826: vdivps xmm9, xmm9, xmm0
0x10012982a: vaddps xmm3, xmm5, xmm3
0x10012982e: vmulps xmm0, xmm3, xmm3
0x100129832: vmovshdup xmm5, xmm0
0x100129836: vaddss xmm5, xmm0, xmm5
0x10012983a: vpermilpd xmm0, xmm0, 1
0x100129840: vaddss xmm0, xmm0, xmm5
0x100129844: vsqrtss xmm0, xmm0, xmm0
0x100129848: vucomiss xmm0, xmm12
0x10012984d: jbe 0x100129859
0x10012984f: vpermilps xmm0, xmm0, 0xc0
0x100129855: vdivps xmm3, xmm3, xmm0
0x100129859: vmulps xmm0, xmm8, xmmword ptr [rip + 0x97e82f] ; 0x100aa8090
0x100129861: vmulps xmm5, xmm13, xmmword ptr [rip + 0x981f17] ; 0x100aab780
0x100129869: vmovshdup xmm6, xmm5
0x10012986d: vaddss xmm6, xmm6, dword ptr [rip + 0x97df73] ; 0x100aa77e8
0x100129875: vaddss xmm5, xmm5, xmm6
0x100129879: vaddss xmm1, xmm1, xmm5
0x10012987d: vmulss xmm5, xmm7, dword ptr [rip + 0x97ed47] ; 0x100aa85cc
0x100129885: vaddss xmm2, xmm2, xmm5
0x100129889: vmulss xmm1, xmm2, xmm1
0x10012988d: vpermilps xmm1, xmm1, 0xc0
0x100129893: vmulps xmm1, xmm1, xmm11
0x100129898: vaddps xmm0, xmm1, xmm0
0x10012989c: vmulps xmm2, xmm0, xmm0
0x1001298a0: vmovshdup xmm5, xmm2
0x1001298a4: vaddss xmm5, xmm2, xmm5
0x1001298a8: vpermilpd xmm2, xmm2, 1
0x1001298ae: vaddss xmm2, xmm2, xmm5
0x1001298b2: vsqrtss xmm2, xmm2, xmm2
0x1001298b6: vucomiss xmm2, xmm12
0x1001298bb: jbe 0x1001298c7
0x1001298bd: vpermilps xmm2, xmm2, 0xc0
0x1001298c3: vdivps xmm0, xmm0, xmm2
0x1001298c7: vmulps xmm2, xmm4, xmmword ptr [rip + 0x97e7c1] ; 0x100aa8090
0x1001298cf: vaddps xmm1, xmm1, xmm2
0x1001298d3: vmulps xmm2, xmm1, xmm1
0x1001298d7: vmovshdup xmm4, xmm2
0x1001298db: vaddss xmm4, xmm2, xmm4
0x1001298df: vpermilpd xmm2, xmm2, 1
0x1001298e5: vaddss xmm2, xmm2, xmm4
0x1001298e9: vsqrtss xmm2, xmm2, xmm2
0x1001298ed: vucomiss xmm2, xmm12
0x1001298f2: jbe 0x1001298fe
0x1001298f4: vpermilps xmm2, xmm2, 0xc0
0x1001298fa: vdivps xmm1, xmm1, xmm2
0x1001298fe: vmovss xmm2, dword ptr [rip + 0x97f8e6] ; 0x100aa91ec
0x100129906: vucomiss xmm2, dword ptr [rsp + 0xd0]
0x10012990f: jbe 0x100129940
0x100129911: vmovaps xmmword ptr [rsp + 0x260], xmm0
0x10012991a: vmovaps xmmword ptr [rsp + 0x250], xmm0
0x100129923: vsubss xmm4, xmm14, xmm13
0x100129928: vxorps xmm2, xmm2, xmm2
0x10012992c: vmovss dword ptr [rsp + 0x160], xmm14
0x100129935: jmp 0x1001299f0 ; 0x1001299f0
0x10012993a: nop word ptr [rax + rax]
0x100129940: vsubss xmm4, xmm14, xmm13
0x100129945: vpermilps xmm0, xmm4, 0xc0
0x10012994b: vmulps xmm0, xmm0, xmm9
0x100129950: vpermilps xmm2, xmm13, 0xc0
0x100129956: vmulps xmm1, xmm2, xmm1
0x10012995a: vaddps xmm0, xmm0, xmm1
0x10012995e: vmulps xmm1, xmm0, xmm0
0x100129962: vmovshdup xmm2, xmm1
0x100129966: vaddss xmm2, xmm1, xmm2
0x10012996a: vpermilpd xmm1, xmm1, 1
0x100129970: vaddss xmm1, xmm1, xmm2
0x100129974: vsqrtss xmm1, xmm1, xmm1
0x100129978: vucomiss xmm1, xmm12
0x10012997d: jbe 0x100129989
0x10012997f: vpermilps xmm1, xmm1, 0xc0
0x100129985: vdivps xmm0, xmm0, xmm1
0x100129989: vmovaps xmmword ptr [rsp + 0x260], xmm0
0x100129992: vmovaps xmmword ptr [rsp + 0x250], xmm3
0x10012999b: vmulps xmm0, xmm10, xmmword ptr [rsp + 0x90]
0x1001299a4: vmovshdup xmm1, xmm0
0x1001299a8: vaddss xmm1, xmm0, xmm1
0x1001299ac: vpermilpd xmm0, xmm0, 1
0x1001299b2: vaddss xmm0, xmm0, xmm1
0x1001299b6: vxorps xmm1, xmm1, xmm1
0x1001299ba: vmaxss xmm0, xmm1, xmm0
0x1001299be: vminss xmm0, xmm14, xmm0
0x1001299c2: vmulss xmm0, xmm0, dword ptr [rip + 0x97ec56] ; 0x100aa8620
0x1001299ca: vaddss xmm0, xmm0, xmm14
0x1001299cf: vmulss xmm0, xmm0, xmm4
0x1001299d3: vaddss xmm0, xmm13, xmm0
0x1001299d7: vmovss dword ptr [rsp + 0x160], xmm0
0x1001299e0: vmovss xmm0, dword ptr [rip + 0x97ebe8] ; 0x100aa85d0
0x1001299e8: vmulss xmm0, xmm4, xmm0
0x1001299ec: vaddss xmm2, xmm13, xmm0
0x1001299f0: vmulss xmm0, xmm4, dword ptr [rip + 0x97d0ac] ; 0x100aa6aa4
0x1001299f8: vmulss xmm1, xmm13, dword ptr [rip + 0x97dddc] ; 0x100aa77dc
0x100129a00: vaddss xmm0, xmm1, xmm0
0x100129a04: vmulss xmm0, xmm0, dword ptr [rsp + 0x60]
0x100129a0a: vroundss xmm0, xmm0, xmm0, 0xa
0x100129a10: vcvttss2si r15, xmm0
0x100129a15: test r15d, r15d
0x100129a18: je 0x100129ddf
0x100129a1e: lea rbx, [rsp + r12 + 0x600]
0x100129a26: vmovaps xmm0, xmm13
0x100129a2a: vmovss xmm1, dword ptr [rip + 0x97ddba] ; 0x100aa77ec
0x100129a32: vmovaps xmmword ptr [rsp + 0x10], xmm13
0x100129a38: vmovaps xmmword ptr [rsp + 0x30], xmm4
0x100129a3e: vmovss dword ptr [rsp], xmm2
0x100129a43: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x100129a48: vmovaps xmm1, xmmword ptr [rsp + 0x30]
0x100129a4e: vmulss xmm1, xmm1, dword ptr [rip + 0x97ef52] ; 0x100aa89a8
0x100129a56: vmovaps xmm2, xmmword ptr [rsp + 0x10]
0x100129a5c: vmulss xmm2, xmm2, dword ptr [rip + 0x97f780] ; 0x100aa91e4
0x100129a64: vaddss xmm1, xmm2, xmm1
0x100129a68: vmovss xmm5, dword ptr [rsp + 0xa8]
0x100129a71: vmovss xmm2, dword ptr [rip + 0x97b647] ; 0x100aa50c0
0x100129a79: vmovaps xmm4, xmm2
0x100129a7d: vsubss xmm2, xmm4, xmm5
0x100129a81: vmulss xmm3, xmm2, dword ptr [rip + 0x9809fb] ; 0x100aaa484
0x100129a89: vaddss xmm3, xmm5, xmm3
0x100129a8d: vmulss xmm1, xmm3, xmm1
0x100129a91: vxorps xmm3, xmm3, xmm3
0x100129a95: vmovss xmm6, dword ptr [rsp]
0x100129a9a: vmaxss xmm3, xmm3, xmm6
0x100129a9e: vminss xmm3, xmm4, xmm3
0x100129aa2: vsubss xmm4, xmm4, xmm3
0x100129aa6: vmulss xmm3, xmm3, dword ptr [rip + 0x97eb1e] ; 0x100aa85cc
0x100129aae: vaddss xmm3, xmm4, xmm3
0x100129ab2: vmulss xmm1, xmm1, xmm3
0x100129ab6: vmovss dword ptr [rsp + 0xe0], xmm1
0x100129abf: vmulss xmm0, xmm0, dword ptr [rip + 0x97d631] ; 0x100aa70f8
0x100129ac7: vmovss dword ptr [rsp + 0x100], xmm0
0x100129ad0: vmulss xmm0, xmm6, dword ptr [rip + 0x97cfcc] ; 0x100aa6aa4
0x100129ad8: vmovss dword ptr [rsp + 0x78], xmm0
0x100129ade: vmulss xmm0, xmm2, dword ptr [rip + 0x97eb0e] ; 0x100aa85f4
0x100129ae6: vaddss xmm0, xmm5, xmm0
0x100129aea: vmulss xmm0, xmm0, dword ptr [rsp + 0x170]
0x100129af3: vmulss xmm0, xmm0, dword ptr [rsp + 0x190]
0x100129afc: vmovaps xmmword ptr [rsp + 0x140], xmm0
0x100129b05: nop word ptr cs:[rax + rax]
0x100129b10: vmovaps xmm1, xmmword ptr [rsp + 0x170]
0x100129b19: vsqrtss xmm0, xmm1, xmm1
0x100129b1d: vandps xmm0, xmm0, xmmword ptr [rip + 0x97ddeb] ; 0x100aa7910
0x100129b25: vmulss xmm0, xmm0, dword ptr [rip + 0x98141f] ; 0x100aaaf4c
0x100129b2d: vaddss xmm0, xmm0, dword ptr [rip + 0x97dd87] ; 0x100aa78bc
0x100129b35: vcmpless xmm1, xmm1, dword ptr [rip + 0x97eaea] ; 0x100aa8628
0x100129b3e: vmovss xmm2, dword ptr [rip + 0x97eae6] ; 0x100aa862c
0x100129b46: vandps xmm2, xmm1, xmm2
0x100129b4a: vandnps xmm0, xmm1, xmm0
0x100129b4e: vorps xmm0, xmm0, xmm2
0x100129b52: vaddss xmm0, xmm0, dword ptr [rsp + 0x100]
0x100129b5b: vaddss xmm0, xmm0, dword ptr [rsp + 0x78]
0x100129b61: vmulss xmm0, xmm0, dword ptr [rsp + 0xa8]
0x100129b6a: vmovaps xmmword ptr [rsp], xmm0
0x100129b6f: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x100129b74: vcvtsi2ss xmm0, xmm8, eax
0x100129b78: vmovss xmm1, dword ptr [rip + 0x97d570] ; 0x100aa70f0
0x100129b80: vmulss xmm0, xmm0, xmm1
0x100129b84: vmovss xmm1, dword ptr [rip + 0x97b534] ; 0x100aa50c0
0x100129b8c: vsubss xmm1, xmm1, xmm0
0x100129b90: vmulss xmm1, xmm1, dword ptr [rip + 0x97d55c] ; 0x100aa70f4
0x100129b98: vmulss xmm0, xmm0, dword ptr [rip + 0x97ea54] ; 0x100aa85f4
0x100129ba0: vaddss xmm0, xmm0, xmm1
0x100129ba4: vmovss xmm1, dword ptr [rsp + 0x160]
0x100129bad: vucomiss xmm1, xmm0
0x100129bb1: lea rax, [rsp + 0x250]
0x100129bb9: lea rcx, [rsp + 0x260]
0x100129bc1: cmova rax, rcx
0x100129bc5: vmovaps xmm0, xmmword ptr [rax]
0x100129bc9: vmovaps xmmword ptr [rsp + 0x90], xmm0
0x100129bd2: vmovaps xmm0, xmmword ptr [rbx]
0x100129bd6: vmovaps xmmword ptr [rsp + 0x10], xmm0
0x100129bdc: mov rax, qword ptr [rsp + 0x40]
0x100129be1: vmovaps xmm0, xmmword ptr [rip + 0x981ba7] ; 0x100aab790
0x100129be9: vmulps xmm0, xmm0, xmmword ptr [rax + 0x50]
0x100129bee: vmovaps xmmword ptr [rsp + 0x30], xmm0
0x100129bf4: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x100129bf9: vcvtsi2ss xmm0, xmm7, eax
0x100129bfd: vmulss xmm0, xmm0, dword ptr [rip + 0x97d4eb] ; 0x100aa70f0
0x100129c05: vmovaps xmmword ptr [rsp + 0xd0], xmm0
0x100129c0e: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x100129c13: vcvtsi2ss xmm0, xmm7, eax
0x100129c17: vmulss xmm0, xmm0, dword ptr [rip + 0x97d4d1] ; 0x100aa70f0
0x100129c1f: vmovaps xmmword ptr [rsp + 0x1d0], xmm0
0x100129c28: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x100129c2d: vcvtsi2ss xmm0, xmm7, eax
0x100129c31: vmulss xmm0, xmm0, dword ptr [rip + 0x97d4b7] ; 0x100aa70f0
0x100129c39: vmovaps xmm1, xmmword ptr [rsp + 0xd0]
0x100129c42: vinsertps xmm1, xmm1, dword ptr [rsp + 0x1d0], 0x10
0x100129c4d: vinsertps xmm0, xmm1, xmm0, 0x20
0x100129c53: vmulps xmm0, xmm0, xmmword ptr [rip + 0x97e2f5] ; 0x100aa7f50
0x100129c5b: vaddps xmm2, xmm0, xmmword ptr [rip + 0x97dc7d] ; 0x100aa78e0
0x100129c63: vmulps xmm0, xmm2, xmm2
0x100129c67: vmovshdup xmm1, xmm0
0x100129c6b: vaddss xmm1, xmm0, xmm1
0x100129c6f: vpermilpd xmm0, xmm0, 1
0x100129c75: vaddss xmm0, xmm0, xmm1
0x100129c79: vsqrtss xmm0, xmm0, xmm0
0x100129c7d: vucomiss xmm0, dword ptr [rip + 0x97dc3f] ; 0x100aa78c4
0x100129c85: jbe 0x100129c91
0x100129c87: vpermilps xmm0, xmm0, 0xc0
0x100129c8d: vdivps xmm2, xmm2, xmm0
0x100129c91: vmovaps xmmword ptr [rsp + 0xd0], xmm2
0x100129c9a: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x100129c9f: vcvtsi2ss xmm0, xmm7, eax
0x100129ca3: vmovss xmm1, dword ptr [rip + 0x97d445] ; 0x100aa70f0
0x100129cab: vmulss xmm0, xmm0, xmm1
0x100129caf: vmovss xmm1, dword ptr [rip + 0x97b409] ; 0x100aa50c0
0x100129cb7: vmovaps xmm3, xmm1
0x100129cbb: vsubss xmm1, xmm3, xmm0
0x100129cbf: vmulss xmm1, xmm1, dword ptr [rip + 0x97e8ed] ; 0x100aa85b4
0x100129cc7: vmulss xmm0, xmm0, dword ptr [rip + 0x97dbfd] ; 0x100aa78cc
0x100129ccf: vaddss xmm0, xmm0, xmm1
0x100129cd3: vpermilps xmm0, xmm0, 0xc0
0x100129cd9: vmulps xmm0, xmm0, xmmword ptr [rsp + 0xd0]
0x100129ce2: vmulps xmm0, xmm0, xmmword ptr [rip + 0x97e276] ; 0x100aa7f60
0x100129cea: vaddps xmm0, xmm0, xmmword ptr [rsp + 0x90]
0x100129cf3: vmovaps xmm2, xmmword ptr [rsp]
0x100129cf8: vpermilps xmm1, xmm2, 0xc0
0x100129cfe: vmulps xmm0, xmm1, xmm0
0x100129d02: vaddps xmm0, xmm0, xmmword ptr [rsp + 0x30]
0x100129d08: vaddss xmm1, xmm2, dword ptr [rip + 0x97f96c] ; 0x100aa967c
0x100129d10: vdivss xmm1, xmm1, dword ptr [rip + 0x981af4] ; 0x100aab80c
0x100129d18: vxorps xmm2, xmm2, xmm2
0x100129d1c: vmaxss xmm1, xmm2, xmm1
0x100129d20: vminss xmm1, xmm3, xmm1
0x100129d24: vsubss xmm2, xmm3, xmm1
0x100129d28: vmulss xmm1, xmm1, dword ptr [rip + 0x981af4] ; 0x100aab824
0x100129d30: vaddss xmm1, xmm1, xmm2
0x100129d34: mov qword ptr [rsp + 0x580], 0x3f800000
0x100129d40: mov dword ptr [rsp + 0x58c], 0x3f800000
0x100129d4b: mov byte ptr [rsp + 0x590], 0
0x100129d53: vmovaps xmm2, xmmword ptr [rip + 0x97d905] ; 0x100aa7660
0x100129d5b: vmovaps xmmword ptr [rsp + 0x5c0], xmm2
0x100129d64: vmulss xmm1, xmm1, dword ptr [rsp + 0xe0]
0x100129d6d: vmovss dword ptr [rsp + 0x588], xmm1
0x100129d76: lea rax, [rip + 0x1f15933] ; 0x10203f6b0
0x100129d7d: vmovaps xmm1, xmmword ptr [rax]
0x100129d81: vinsertps xmm1, xmm1, dword ptr [rsp + 0x140], 0x30
0x100129d8c: vmovaps xmmword ptr [rsp + 0x5b0], xmm1
0x100129d95: vmovaps xmmword ptr [rsp + 0x5a0], xmm1
0x100129d9e: vmovaps xmm1, xmmword ptr [rsp + 0x10]
0x100129da4: vmovaps xmmword ptr [rsp + 0xb0], xmm1
0x100129dad: vmovaps xmmword ptr [rsp + 0x110], xmm0
0x100129db6: mov rdi, r13
0x100129db9: lea rsi, [rsp + 0xb0]
0x100129dc1: lea rdx, [rsp + 0x110]
0x100129dc9: lea rcx, [rsp + 0x580]
0x100129dd1: call 0x1002da730 ; 0x1002da730
0x100129dd6: dec r15d
0x100129dd9: jne 0x100129b10
0x100129ddf: mov rbx, qword ptr [rsp + 0x40]
0x100129de4: lea r15, [rsp + 0xfc]
0x100129dec: inc r14d
0x100129def: cmp r14d, dword ptr [rsp + 0x15c]
0x100129df7: jb 0x100129220
0x100129dfd: mov r12, qword ptr [rsp + 0x58]
0x100129e02: mov r13, qword ptr [rsp + 0x88]
0x100129e0a: mov al, byte ptr [rip + 0xbf9cd8] ; 0x100d23ae8
0x100129e10: or al, byte ptr [rip + 0xbf9bf2] ; 0x100d23a08
0x100129e16: or al, byte ptr [rip + 0xb58f9e] ; 0x100c82dba
0x100129e1c: je 0x10012b593
0x100129e22: mov rdi, qword ptr [r13 + 0x80]
0x100129e29: lea rcx, [r12 + 0xfb0]
0x100129e31: lea rsi, [rsp + 0x600]
0x100129e39: mov edx, 0x20
0x100129e3e: mov qword ptr [rsp + 0x190], rcx
0x100129e46: call 0x100114af0 ; 0x100114af0
0x100129e4b: mov rax, qword ptr [r12 + 0x310]
0x100129e53: lea rcx, [rip + 0x1f15856] ; 0x10203f6b0
0x100129e5a: vmovaps xmm0, xmmword ptr [rcx]
0x100129e5e: vmovaps xmmword ptr [rax + 0x120], xmm0
0x100129e66: vmovaps xmmword ptr [rax + 0x110], xmm0
0x100129e6e: mov rax, qword ptr [r12 + 0x310]
0x100129e76: mov dword ptr [rax + 0x8c], 0x3f800000
0x100129e80: vmovaps xmm1, xmmword ptr [rbx + 0x50]
0x100129e85: vsubps xmm2, xmm1, xmmword ptr [r12 + 0xfc0]
0x100129e8f: vmulps xmm3, xmm2, xmm2
0x100129e93: vmovshdup xmm4, xmm3
0x100129e97: vaddss xmm4, xmm3, xmm4
0x100129e9b: vpermilpd xmm3, xmm3, 1
0x100129ea1: vaddss xmm3, xmm3, xmm4
0x100129ea5: vsqrtss xmm3, xmm3, xmm3
0x100129ea9: vmovss xmm4, dword ptr [rip + 0x97cbeb] ; 0x100aa6a9c
0x100129eb1: vmovaps xmm5, xmm4
0x100129eb5: vmaxss xmm4, xmm5, xmm3
0x100129eb9: vcmpunordss xmm3, xmm3, xmm3
0x100129ebe: vandnps xmm4, xmm3, xmm4
0x100129ec2: vandps xmm3, xmm3, xmm5
0x100129ec6: vorps xmm3, xmm4, xmm3
0x100129eca: vmovss xmm4, dword ptr [rip + 0x97d90a] ; 0x100aa77dc
0x100129ed2: vdivss xmm3, xmm4, xmm3
0x100129ed6: vmovss xmm5, dword ptr [rip + 0x97b1e2] ; 0x100aa50c0
0x100129ede: vminss xmm4, xmm5, xmm3
0x100129ee2: vcmpunordss xmm3, xmm3, xmm3
0x100129ee7: vandnps xmm4, xmm3, xmm4
0x100129eeb: vandps xmm3, xmm3, xmm5
0x100129eef: vorps xmm3, xmm4, xmm3
0x100129ef3: vpermilps xmm3, xmm3, 0xc0
0x100129ef9: vmulps xmm2, xmm2, xmm3
0x100129efd: vdivps xmm2, xmm2, xmmword ptr [rsp + 0x1c0]
0x100129f06: vmovaps xmmword ptr [r12 + 0xfc0], xmm1
0x100129f10: vmulps xmm1, xmm2, xmmword ptr [rip + 0x97f3e8] ; 0x100aa9300 fff?fff?fff?
0x100129f18: vsubps xmm1, xmm1, xmmword ptr [rip + 0x981880] ; 0x100aab7a0
0x100129f20: vmovaps xmmword ptr [rax + 0xd0], xmm1
0x100129f28: mov rax, qword ptr [r12 + 0x318]
0x100129f30: vmovaps xmmword ptr [rax + 0x120], xmm0
0x100129f38: vmovaps xmmword ptr [rax + 0x110], xmm0
0x100129f40: mov rax, qword ptr [r12 + 0x318]
0x100129f48: mov dword ptr [rax + 0x8c], 0x3f800000
0x100129f52: mov qword ptr [r12 + 0xff0], 0
0x100129f5e: mov rax, qword ptr [rsp + 0x28]
0x100129f63: lea r15, [rax + 0x840]
0x100129f6a: mov esi, 1
0x100129f6f: mov rdi, r15
0x100129f72: call 0x10009d520 ; 0x10009d520
0x100129f77: mov ebx, eax
0x100129f79: test ebx, ebx
0x100129f7b: js 0x10012a03f
0x100129f81: mov rdi, r15
0x100129f84: mov esi, ebx
0x100129f86: call 0x100098290 ; 0x100098290
0x100129f8b: lea rdi, [rip + 0xa4a4df] ; 0x100b74471 flap
0x100129f92: mov edx, 4
0x100129f97: mov rsi, rax
0x100129f9a: call 0x100aa2c8a ; 0x100aa2c8a _strncmp
0x100129f9f: test eax, eax
0x100129fa1: je 0x100129fc5
0x100129fa3: mov rdi, r15
0x100129fa6: mov esi, ebx
0x100129fa8: call 0x100098290 ; 0x100098290
0x100129fad: lea rdi, [rip + 0xa3c75d] ; 0x100b66711 jump
0x100129fb4: mov edx, 4
0x100129fb9: mov rsi, rax
0x100129fbc: call 0x100aa2c8a ; 0x100aa2c8a _strncmp
0x100129fc1: test eax, eax
0x100129fc3: jne 0x10012a03f
0x100129fc5: mov rdi, r15
0x100129fc8: mov esi, ebx
0x100129fca: call 0x1000981f0 ; 0x1000981f0
0x100129fcf: vmovaps xmm1, xmm0
0x100129fd3: vmovss dword ptr [rsp + 0x10], xmm1
0x100129fd9: vmulss xmm0, xmm1, dword ptr [rip + 0x981847] ; 0x100aab828
0x100129fe1: vmovss dword ptr [rsp], xmm0
0x100129fe6: vmulss xmm0, xmm1, dword ptr [rip + 0x97e6b6] ; 0x100aa86a4
0x100129fee: vmulss xmm0, xmm1, xmm0
0x100129ff2: call 0x100aa2708 ; 0x100aa2708 _expf
0x100129ff7: vmulss xmm0, xmm0, dword ptr [rsp]
0x100129ffc: vmovss dword ptr [r12 + 0xff0], xmm0
0x10012a006: vmovss xmm0, dword ptr [rsp + 0x10]
0x10012a00c: vaddss xmm0, xmm0, dword ptr [rip + 0x9817e8] ; 0x100aab7fc
0x10012a014: vmulss xmm0, xmm0, xmm0
0x10012a018: vmulss xmm0, xmm0, dword ptr [rip + 0x98180c] ; 0x100aab82c
0x10012a020: call 0x100aa2708 ; 0x100aa2708 _expf
0x10012a025: vaddss xmm0, xmm0, xmm0
0x10012a029: vmovss xmm1, dword ptr [rip + 0x97b08f] ; 0x100aa50c0
0x10012a031: vsubss xmm0, xmm1, xmm0
0x10012a035: vmovss dword ptr [r12 + 0xff4], xmm0
0x10012a03f: vmovss xmm0, dword ptr [r12 + 0xff0]
0x10012a049: vmovss xmm1, dword ptr [r12 + 0xff8]
0x10012a053: vucomiss xmm0, xmm1
0x10012a057: jbe 0x10012a067
0x10012a059: vmovss dword ptr [r12 + 0xff8], xmm0
0x10012a063: vmovaps xmm1, xmm0
0x10012a067: vmovss dword ptr [rsp + 0x30], xmm1
0x10012a06d: vmovss dword ptr [rsp], xmm0
0x10012a072: vmovaps xmm0, xmmword ptr [rsp + 0x60]
0x10012a078: vmulss xmm0, xmm0, dword ptr [rip + 0x98040c] ; 0x100aaa48c
0x10012a080: call 0x100aa2708 ; 0x100aa2708 _expf
0x10012a085: vmovss xmm1, dword ptr [rip + 0x97b033] ; 0x100aa50c0
0x10012a08d: vmovaps xmm2, xmm1
0x10012a091: vsubss xmm0, xmm2, xmm0
0x10012a095: vxorps xmm1, xmm1, xmm1
0x10012a099: vmaxss xmm0, xmm1, xmm0
0x10012a09d: vminss xmm0, xmm2, xmm0
0x10012a0a1: vsubss xmm2, xmm2, xmm0
0x10012a0a5: vmovss dword ptr [rsp + 0x10], xmm2
0x10012a0ab: vmulss xmm2, xmm2, dword ptr [rsp + 0x30]
0x10012a0b1: vmulss xmm0, xmm0, xmm1
0x10012a0b5: vmovss dword ptr [rsp + 0x30], xmm0
0x10012a0bb: vaddss xmm0, xmm0, xmm2
0x10012a0bf: vmovss dword ptr [r12 + 0xff8], xmm0
0x10012a0c9: vmovss xmm1, dword ptr [rip + 0x97d71f] ; 0x100aa77f0
0x10012a0d1: vmovss xmm0, dword ptr [rsp]
0x10012a0d6: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x10012a0db: vmovss dword ptr [r12 + 0xff0], xmm0
0x10012a0e5: vmovss xmm0, dword ptr [rsp + 0x10]
0x10012a0eb: vmulss xmm0, xmm0, dword ptr [r12 + 0x1000]
0x10012a0f5: vaddss xmm0, xmm0, dword ptr [rsp + 0x30]
0x10012a0fb: vmovss dword ptr [r12 + 0x1000], xmm0
0x10012a105: mov rax, qword ptr [rsp + 0x40]
0x10012a10a: vmovaps xmm0, xmmword ptr [rax + 0x50]
0x10012a10f: vmulps xmm0, xmm0, xmm0
0x10012a113: vmovshdup xmm1, xmm0
0x10012a117: vaddss xmm1, xmm0, xmm1
0x10012a11b: vpermilpd xmm0, xmm0, 1
0x10012a121: vaddss xmm0, xmm0, xmm1
0x10012a125: movzx eax, byte ptr [r12 + 0xffc]
0x10012a12e: lea rcx, [rip + 0x98176b] ; 0x100aab8a0
0x10012a135: vmovss xmm1, dword ptr [rcx + rax*4]
0x10012a13a: vucomiss xmm0, xmm1
0x10012a13e: seta byte ptr [r12 + 0xffc]
0x10012a147: test rax, rax
0x10012a14a: jne 0x10012a15e
0x10012a14c: vucomiss xmm0, xmm1
0x10012a150: jbe 0x10012a15e
0x10012a152: mov dword ptr [r12 + 0x1000], 0x3f800000
0x10012a15e: mov rbx, qword ptr [rsp + 0x28]
0x10012a163: mov rsi, qword ptr [rbx + 0x368]
0x10012a16a: lea rdi, [rsp + 0x3c0]
0x10012a172: call 0x1007f26b0 ; 0x1007f26b0
0x10012a177: mov rsi, qword ptr [rbx + 0x360]
0x10012a17e: lea rdi, [rsp + 0x580]
0x10012a186: call 0x1007f26b0 ; 0x1007f26b0
0x10012a18b: vmovaps xmm0, xmmword ptr [rsp + 0x3c0]
0x10012a194: vsubps xmm2, xmm0, xmmword ptr [rsp + 0x580]
0x10012a19d: vmulps xmm0, xmm2, xmm2
0x10012a1a1: vmovshdup xmm1, xmm0
0x10012a1a5: vaddss xmm1, xmm0, xmm1
0x10012a1a9: vpermilpd xmm0, xmm0, 1
0x10012a1af: vaddss xmm0, xmm0, xmm1
0x10012a1b3: vsqrtss xmm0, xmm0, xmm0
0x10012a1b7: vucomiss xmm0, dword ptr [rip + 0x97d705] ; 0x100aa78c4
0x10012a1bf: jbe 0x10012a1cb
0x10012a1c1: vpermilps xmm0, xmm0, 0xc0
0x10012a1c7: vdivps xmm2, xmm2, xmm0
0x10012a1cb: vmovaps xmmword ptr [rsp + 0xc0], xmm2
0x10012a1d4: mov rbx, qword ptr [rsp + 0x28]
0x10012a1d9: mov rsi, qword ptr [rbx + 0x318]
0x10012a1e0: lea rdi, [rsp + 0x3b0]
0x10012a1e8: call 0x1007f26b0 ; 0x1007f26b0
0x10012a1ed: mov rsi, qword ptr [rbx + 0x310]
0x10012a1f4: lea rdi, [rsp + 0x580]
0x10012a1fc: call 0x1007f26b0 ; 0x1007f26b0
0x10012a201: vmovaps xmm0, xmmword ptr [rsp + 0x3b0]
0x10012a20a: vsubps xmm1, xmm0, xmmword ptr [rsp + 0x580]
0x10012a213: vmulps xmm0, xmm1, xmm1
0x10012a217: vmovshdup xmm2, xmm0
0x10012a21b: vaddss xmm2, xmm0, xmm2
0x10012a21f: vpermilpd xmm0, xmm0, 1
0x10012a225: vaddss xmm0, xmm0, xmm2
0x10012a229: vsqrtss xmm0, xmm0, xmm0
0x10012a22d: vucomiss xmm0, dword ptr [rip + 0x97d68f] ; 0x100aa78c4
0x10012a235: jbe 0x10012a241
0x10012a237: vpermilps xmm0, xmm0, 0xc0
0x10012a23d: vdivps xmm1, xmm1, xmm0
0x10012a241: vmovss xmm12, dword ptr [rip + 0x97ae7b] ; 0x100aa50c4
0x10012a249: vmovaps xmm3, xmmword ptr [rsp + 0xc0]
0x10012a252: vpermilps xmm0, xmm1, 0xd2
0x10012a258: vmulps xmm2, xmm3, xmm0
0x10012a25c: vpermilps xmm0, xmm3, 0xd2
0x10012a262: vmulps xmm1, xmm0, xmm1
0x10012a266: vsubps xmm1, xmm2, xmm1
0x10012a26a: vpermilps xmm13, xmm1, 0xd2
0x10012a270: vmulps xmm1, xmm1, xmm1
0x10012a274: vpermilpd xmm2, xmm1, 1
0x10012a27a: vaddss xmm2, xmm2, xmm1
0x10012a27e: vmovshdup xmm1, xmm1
0x10012a282: vaddss xmm1, xmm1, xmm2
0x10012a286: vsqrtss xmm1, xmm1, xmm1
0x10012a28a: vucomiss xmm1, dword ptr [rip + 0x97d632] ; 0x100aa78c4
0x10012a292: jbe 0x10012a29e
0x10012a294: vpermilps xmm1, xmm1, 0xc0
0x10012a29a: vdivps xmm13, xmm13, xmm1
0x10012a29e: vmulps xmm0, xmm0, xmm13
0x10012a2a3: vpermilps xmm1, xmm13, 0xd2
0x10012a2a9: vmulps xmm1, xmm3, xmm1
0x10012a2ad: vsubps xmm0, xmm0, xmm1
0x10012a2b1: vpermilps xmm4, xmm0, 0xd2
0x10012a2b7: vmulps xmm0, xmm0, xmm0
0x10012a2bb: vpermilpd xmm1, xmm0, 1
0x10012a2c1: vaddss xmm1, xmm1, xmm0
0x10012a2c5: vmovshdup xmm0, xmm0
0x10012a2c9: vaddss xmm0, xmm0, xmm1
0x10012a2cd: vsqrtss xmm0, xmm0, xmm0
0x10012a2d1: vucomiss xmm0, dword ptr [rip + 0x97d5eb] ; 0x100aa78c4
0x10012a2d9: jbe 0x10012a2e5
0x10012a2db: vpermilps xmm0, xmm0, 0xc0
0x10012a2e1: vdivps xmm4, xmm4, xmm0
0x10012a2e5: vmovaps xmm9, xmmword ptr [rip + 0x97d613] ; 0x100aa7900
0x10012a2ed: vxorps xmm2, xmm3, xmm9
0x10012a2f2: vpermilpd xmm0, xmm4, 1
0x10012a2f8: vmovshdup xmm5, xmm13
0x10012a2fd: vpshufd xmm11, xmm2, 0xf5
0x10012a302: vpshufd xmm6, xmm2, 0x4e
0x10012a307: vaddss xmm1, xmm5, xmm4
0x10012a30b: vaddss xmm1, xmm6, xmm1
0x10012a30f: vxorps xmm8, xmm8, xmm8
0x10012a314: vucomiss xmm8, xmm1
0x10012a318: seta sil
0x10012a31c: vucomiss xmm6, xmm4
0x10012a320: seta al
0x10012a323: vucomiss xmm6, xmm5
0x10012a327: seta dl
0x10012a32a: vucomiss xmm5, xmm4
0x10012a32e: setbe bl
0x10012a331: seta dil
0x10012a335: or dil, al
0x10012a338: or bl, dl
0x10012a33a: mov ecx, edi
0x10012a33c: and cl, sil
0x10012a33f: jne 0x10012a347
0x10012a341: vmovaps xmm10, xmm4
0x10012a345: jmp 0x10012a351 ; 0x10012a351
0x10012a347: vxorps xmm10, xmm4, xmm9
0x10012a34c: vpxor xmm11, xmm11, xmm9
0x10012a351: and dl, al
0x10012a353: vxorpd xmm7, xmm0, xmm9
0x10012a358: and bl, sil
0x10012a35b: je 0x10012a362
0x10012a35d: vxorps xmm5, xmm5, xmm9
0x10012a362: xor dl, 1
0x10012a365: test bl, bl
0x10012a367: jne 0x10012a36d
0x10012a369: vmovapd xmm7, xmm0
0x10012a36d: vmovshdup xmm0, xmm4
0x10012a371: vpermilpd xmm4, xmm13, 1
0x10012a377: and dl, sil
0x10012a37a: jne 0x10012a382
0x10012a37c: vmovaps xmm1, xmm13
0x10012a380: jmp 0x10012a38c ; 0x10012a38c
0x10012a382: vxorps xmm6, xmm6, xmm9
0x10012a387: vxorps xmm1, xmm13, xmm9
0x10012a38c: vaddss xmm5, xmm10, xmm5
0x10012a390: vaddss xmm5, xmm6, xmm5
0x10012a394: vmovss xmm3, dword ptr [rip + 0x97ad24] ; 0x100aa50c0
0x10012a39c: vaddss xmm6, xmm5, xmm3
0x10012a3a0: vsqrtss xmm5, xmm6, xmm6
0x10012a3a4: vdivss xmm5, xmm3, xmm5
0x10012a3a8: vmulss xmm3, xmm5, dword ptr [rip + 0x97a208] ; 0x100aa45b8
0x10012a3b0: vsubss xmm4, xmm4, xmm11
0x10012a3b5: vmulss xmm10, xmm3, xmm4
0x10012a3b9: vsubss xmm2, xmm2, xmm7
0x10012a3bd: vmulss xmm2, xmm3, xmm2
0x10012a3c1: vsubss xmm0, xmm0, xmm1
0x10012a3c5: vmulss xmm5, xmm3, xmm0
0x10012a3c9: vmulss xmm0, xmm3, xmm6
0x10012a3cd: jne 0x10012a3ec
0x10012a3cf: vmovaps xmm1, xmm2
0x10012a3d3: vmovaps xmm2, xmm0
0x10012a3d7: mov eax, edi
0x10012a3d9: and al, sil
0x10012a3dc: je 0x10012a3ff
0x10012a3de: vmovaps xmm4, xmm2
0x10012a3e2: vmovaps xmm2, xmm5
0x10012a3e6: test dl, dl
0x10012a3e8: je 0x10012a407
0x10012a3ea: jmp 0x10012a40b ; 0x10012a40b
0x10012a3ec: vmovaps xmm1, xmm5
0x10012a3f0: vmovaps xmm5, xmm2
0x10012a3f4: vmovaps xmm2, xmm10
0x10012a3f8: mov eax, edi
0x10012a3fa: and al, sil
0x10012a3fd: jne 0x10012a3de
0x10012a3ff: vmovaps xmm4, xmm5
0x10012a403: test dl, dl
0x10012a405: jne 0x10012a40b
0x10012a407: vmovaps xmm0, xmm10
0x10012a40b: vmovaps xmm3, xmm0
0x10012a40f: and dil, sil
0x10012a412: jne 0x10012a41f
0x10012a414: vmovaps xmm3, xmm1
0x10012a418: test dil, dil
0x10012a41b: je 0x10012a424
0x10012a41d: jmp 0x10012a428 ; 0x10012a428
0x10012a41f: test dil, dil
0x10012a422: jne 0x10012a428
0x10012a424: vmovaps xmm1, xmm0
0x10012a428: vinsertps xmm0, xmm1, xmm3, 0x10
0x10012a42e: vinsertps xmm0, xmm0, xmm4, 0x20
0x10012a434: vinsertps xmm0, xmm0, xmm2, 0x30
0x10012a43a: vmovaps xmm1, xmmword ptr [r12 + 0xfd0]
0x10012a444: vmovaps xmmword ptr [r12 + 0xfd0], xmm0
0x10012a44e: vmulps xmm3, xmm1, xmm0
0x10012a452: vpermilpd xmm4, xmm3, 1
0x10012a458: vaddps xmm3, xmm3, xmm4
0x10012a45c: vmovshdup xmm4, xmm3
0x10012a460: vaddss xmm3, xmm3, xmm4
0x10012a464: vucomiss xmm8, xmm3
0x10012a468: jbe 0x10012a46f
0x10012a46a: vxorps xmm1, xmm1, xmm9
0x10012a46f: vxorps xmm3, xmm1, xmm9
0x10012a474: vblendps xmm4, xmm3, xmm1, 8
0x10012a47a: vpermilps xmm5, xmm2, 0xc0
0x10012a480: vmulps xmm5, xmm5, xmm1
0x10012a484: vpermilps xmm6, xmm1, 0xe7
0x10012a48a: vpermilps xmm1, xmm1, 0xff
0x10012a490: vmulps xmm1, xmm0, xmm1
0x10012a494: vsubps xmm1, xmm1, xmm5
0x10012a498: vpermilps xmm5, xmm0, 0xd2
0x10012a49e: vmulps xmm5, xmm5, xmm3
0x10012a4a2: vpshufd xmm3, xmm3, 0xd2
0x10012a4a7: vmulps xmm3, xmm0, xmm3
0x10012a4ab: vsubps xmm3, xmm5, xmm3
0x10012a4af: vpermilps xmm3, xmm3, 0xd2
0x10012a4b5: vaddps xmm1, xmm1, xmm3
0x10012a4b9: vmulss xmm2, xmm2, xmm6
0x10012a4bd: vmulps xmm0, xmm0, xmm4
0x10012a4c1: vmovshdup xmm3, xmm0
0x10012a4c5: vaddss xmm3, xmm0, xmm3
0x10012a4c9: vpermilpd xmm0, xmm0, 1
0x10012a4cf: vaddss xmm0, xmm0, xmm3
0x10012a4d3: vsubss xmm0, xmm2, xmm0
0x10012a4d7: vinsertps xmm1, xmm1, xmm0, 0x30
0x10012a4dd: vmulps xmm2, xmm1, xmm1
0x10012a4e1: vmovshdup xmm3, xmm2
0x10012a4e5: vaddss xmm3, xmm2, xmm3
0x10012a4e9: vpermilpd xmm2, xmm2, 1
0x10012a4ef: vaddss xmm2, xmm2, xmm3
0x10012a4f3: vsqrtss xmm2, xmm2, xmm2
0x10012a4f7: vucomiss xmm2, dword ptr [rip + 0x97d3c5] ; 0x100aa78c4
0x10012a4ff: vmovaps xmmword ptr [rsp + 0x10], xmm13
0x10012a505: jbe 0x10012a511
0x10012a507: vpermilps xmm2, xmm2, 0xc0
0x10012a50d: vdivps xmm1, xmm1, xmm2
0x10012a511: vaddps xmm1, xmm1, xmm1
0x10012a515: vmovaps xmmword ptr [rsp], xmm1
0x10012a51a: vmaxss xmm0, xmm12, xmm0
0x10012a51e: vmovss xmm1, dword ptr [rip + 0x97ab9a] ; 0x100aa50c0
0x10012a526: vminss xmm0, xmm1, xmm0
0x10012a52a: call 0x100aa2576 ; 0x100aa2576 _acosf
0x10012a52f: vpermilps xmm0, xmm0, 0xc0
0x10012a535: vmulps xmm0, xmm0, xmmword ptr [rsp]
0x10012a53a: vdivps xmm0, xmm0, xmmword ptr [rsp + 0x1c0]
0x10012a543: vmovaps xmmword ptr [rsp + 0x120], xmm0
0x10012a54c: vmulps xmm0, xmm0, xmm0
0x10012a550: vmovshdup xmm1, xmm0
0x10012a554: vaddss xmm1, xmm0, xmm1
0x10012a558: vpermilpd xmm0, xmm0, 1
0x10012a55e: vaddss xmm0, xmm0, xmm1
0x10012a562: vsqrtss xmm0, xmm0, xmm0
0x10012a566: vmovaps xmm1, xmmword ptr [r12 + 0xfe0]
0x10012a570: vmovaps xmmword ptr [rsp], xmm1
0x10012a575: vmulps xmm1, xmm1, xmm1
0x10012a579: vmovshdup xmm2, xmm1
0x10012a57d: vaddss xmm2, xmm1, xmm2
0x10012a581: vpermilpd xmm1, xmm1, 1
0x10012a587: vaddss xmm1, xmm1, xmm2
0x10012a58b: vsqrtss xmm1, xmm1, xmm1
0x10012a58f: xor eax, eax
0x10012a591: vucomiss xmm0, xmm1
0x10012a595: seta al
0x10012a598: lea rcx, [rip + 0x981309] ; 0x100aab8a8
0x10012a59f: vmovss xmm0, dword ptr [rcx + rax*4]
0x10012a5a4: call 0x100aa2858 ; 0x100aa2858 _logf
0x10012a5a9: vcvtss2sd xmm0, xmm0, xmm0
0x10012a5ad: vdivsd xmm0, xmm0, qword ptr [rip + 0x97e10b] ; 0x100aa86c0
0x10012a5b5: vcvtsd2ss xmm0, xmm0, xmm0
0x10012a5b9: vmulss xmm0, xmm0, dword ptr [rsp + 0x60]
0x10012a5bf: call 0x100aa2708 ; 0x100aa2708 _expf
0x10012a5c4: vmovss xmm2, dword ptr [rip + 0x97aaf4] ; 0x100aa50c0
0x10012a5cc: vsubss xmm0, xmm2, xmm0
0x10012a5d0: vxorps xmm1, xmm1, xmm1
0x10012a5d4: vmaxss xmm0, xmm1, xmm0
0x10012a5d8: vminss xmm0, xmm2, xmm0
0x10012a5dc: vsubss xmm1, xmm2, xmm0
0x10012a5e0: vpermilps xmm1, xmm1, 0xc0
0x10012a5e6: vmulps xmm1, xmm1, xmmword ptr [rsp]
0x10012a5eb: vpermilps xmm0, xmm0, 0xc0
0x10012a5f1: vmulps xmm0, xmm0, xmmword ptr [rsp + 0x120]
0x10012a5fa: vaddps xmm0, xmm0, xmm1
0x10012a5fe: vmovaps xmmword ptr [r12 + 0xfe0], xmm0
0x10012a608: mov rax, qword ptr [rsp + 0x28]
0x10012a60d: mov rsi, qword ptr [rax + 0x288]
0x10012a614: lea rbx, [rsp + 0x580]
0x10012a61c: mov rdi, rbx
0x10012a61f: call 0x1007f26b0 ; 0x1007f26b0
0x10012a624: lea rdx, [rsp + 0x260]
0x10012a62c: lea rcx, [rsp + 0x1f0]
0x10012a634: xor r8d, r8d
0x10012a637: mov rdi, qword ptr [rbp + 0x50]
0x10012a63b: mov rsi, rbx
0x10012a63e: call 0x1002149c0 ; 0x1002149c0
0x10012a643: vmovss xmm0, dword ptr [rsp + 0x260]
0x10012a64c: vaddss xmm1, xmm0, dword ptr [rip + 0x980904] ; 0x100aaaf58
0x10012a654: vdivss xmm1, xmm1, dword ptr [rip + 0x97eb70] ; 0x100aa91cc
0x10012a65c: vxorps xmm2, xmm2, xmm2
0x10012a660: vmaxss xmm1, xmm2, xmm1
0x10012a664: vcmpltss xmm0, xmm2, xmm0
0x10012a669: vmovss xmm2, dword ptr [rip + 0x97aa4f] ; 0x100aa50c0
0x10012a671: vminss xmm1, xmm2, xmm1
0x10012a675: vandnps xmm1, xmm0, xmm1
0x10012a679: vandps xmm0, xmm0, xmm2
0x10012a67d: vorps xmm0, xmm1, xmm0
0x10012a681: vmulss xmm0, xmm0, xmm0
0x10012a685: mov rax, r12
0x10012a688: mov r12, qword ptr [rsp + 0x40]
0x10012a68d: vmulss xmm0, xmm0, dword ptr [r12 + 0xb48]
0x10012a697: vmovss xmm1, dword ptr [rax + 0x1004]
0x10012a69f: vucomiss xmm0, xmm1
0x10012a6a3: ja 0x10012a6e2
0x10012a6a5: xor eax, eax
0x10012a6a7: vucomiss xmm1, dword ptr [rip + 0x97df59] ; 0x100aa8608
0x10012a6af: seta al
0x10012a6b2: lea rcx, [rip + 0x9811f7] ; 0x100aab8b0
0x10012a6b9: vmovaps xmm2, xmmword ptr [rsp + 0x60]
0x10012a6bf: vmulss xmm2, xmm2, dword ptr [rcx + rax*4]
0x10012a6c4: vsubss xmm3, xmm0, xmm2
0x10012a6c8: vucomiss xmm3, xmm1
0x10012a6cc: jbe 0x10012a6d4
0x10012a6ce: vaddss xmm0, xmm1, xmm2
0x10012a6d2: jmp 0x10012a6e2 ; 0x10012a6e2
0x10012a6d4: vaddss xmm3, xmm2, xmm0
0x10012a6d8: vucomiss xmm1, xmm3
0x10012a6dc: jbe 0x10012a6e2
0x10012a6de: vsubss xmm0, xmm1, xmm2
0x10012a6e2: mov rax, qword ptr [rsp + 0x58]
0x10012a6e7: vmovss dword ptr [rax + 0x1004], xmm0
0x10012a6ef: cmp dword ptr [rax + 0xfb0], 0
0x10012a6f6: je 0x10012b586
0x10012a6fc: vmovss xmm0, dword ptr [rip + 0x98110c] ; 0x100aab810
0x10012a704: vmovaps xmm1, xmmword ptr [rsp + 0x60]
0x10012a70a: vdivss xmm0, xmm0, xmm1
0x10012a70e: vmovss dword ptr [rsp + 0x1b4], xmm0
0x10012a717: vmulss xmm0, xmm1, dword ptr [rip + 0x981111] ; 0x100aab830
0x10012a71f: call 0x100aa2708 ; 0x100aa2708 _expf
0x10012a724: vmovss xmm1, dword ptr [rip + 0x97a994] ; 0x100aa50c0
0x10012a72c: vsubss xmm0, xmm1, xmm0
0x10012a730: vxorps xmm4, xmm4, xmm4
0x10012a734: vmaxss xmm0, xmm4, xmm0
0x10012a738: vminss xmm0, xmm1, xmm0
0x10012a73c: vsubss xmm1, xmm1, xmm0
0x10012a740: vpermilps xmm1, xmm1, 0xc0
0x10012a746: vmovaps xmmword ptr [rsp + 0x210], xmm1
0x10012a74f: vpermilps xmm0, xmm0, 0xc0
0x10012a755: vmovaps xmmword ptr [rsp + 0x2b0], xmm0
0x10012a75e: vpermilps xmm0, xmmword ptr [rsp + 0x120], 0xd2
0x10012a769: vmovaps xmmword ptr [rsp + 0x2a0], xmm0
0x10012a772: vmovaps xmm1, xmmword ptr [rsp + 0x10]
0x10012a778: vxorps xmm0, xmm1, xmmword ptr [rip + 0x97d180] ; 0x100aa7900
0x10012a780: vmovaps xmmword ptr [rsp + 0x3a0], xmm0
0x10012a789: vmulps xmm0, xmm1, xmmword ptr [rip + 0x98101f] ; 0x100aab7b0
0x10012a791: vmovaps xmmword ptr [rsp + 0x390], xmm0
0x10012a79a: vmovaps xmm0, xmmword ptr [rsp + 0xc0]
0x10012a7a3: vmulps xmm0, xmm0, xmmword ptr [rip + 0x97d815] ; 0x100aa7fc0
0x10012a7ab: vmovaps xmmword ptr [rsp + 0x380], xmm0
0x10012a7b4: vmovaps xmm2, xmmword ptr [rsp + 0x60]
0x10012a7ba: vmulss xmm0, xmm2, dword ptr [rip + 0x97ea1a] ; 0x100aa91dc
0x10012a7c2: vmovss dword ptr [rsp + 0x1bc], xmm0
0x10012a7cb: vmulss xmm0, xmm2, dword ptr [rip + 0x979de5] ; 0x100aa45b8
0x10012a7d3: vmovss dword ptr [rsp + 0x1b8], xmm0
0x10012a7dc: vmulps xmm0, xmm1, xmmword ptr [rip + 0x97d77c] ; 0x100aa7f60
0x10012a7e4: vmovaps xmmword ptr [rsp + 0x100], xmm0
0x10012a7ed: xor ebx, ebx
0x10012a7ef: nop 
0x10012a7f0: mov ebx, ebx
0x10012a7f2: mov r14, rbx
0x10012a7f5: shl r14, 5
0x10012a7f9: mov eax, dword ptr [rsp + r14 + 0x610]
0x10012a801: mov qword ptr [rsp + 0x78], rbx
0x10012a806: lea r13, [rbx + rbx*2]
0x10012a80a: shl r13, 5
0x10012a80e: mov rbx, qword ptr [rsp + 0x58]
0x10012a813: mov dword ptr [rbx + r13 + 0x3e0], eax
0x10012a81b: vmovaps xmm0, xmmword ptr [rsp + r14 + 0x600]
0x10012a825: vsubps xmm1, xmm0, xmmword ptr [rbx + r13 + 0x3b0]
0x10012a82f: vmovaps xmmword ptr [rbx + r13 + 0x3f0], xmm1
0x10012a839: vdivps xmm5, xmm1, xmmword ptr [rsp + 0x1c0]
0x10012a842: vmovaps xmmword ptr [rbx + r13 + 0x3b0], xmm0
0x10012a84c: vmovaps xmm2, xmmword ptr [rsp + 0x210]
0x10012a855: vmulps xmm2, xmm2, xmmword ptr [rbx + r13 + 0x3c0]
0x10012a85f: vmulps xmm3, xmm5, xmmword ptr [rsp + 0x2b0]
0x10012a868: vaddps xmm2, xmm3, xmm2
0x10012a86c: vmovaps xmmword ptr [rbx + r13 + 0x3c0], xmm2
0x10012a876: vmovaps xmmword ptr [rsp + 0x140], xmm5
0x10012a87f: vsubps xmm2, xmm5, xmmword ptr [r12 + 0x50]
0x10012a886: vsubps xmm0, xmm0, xmm1
0x10012a88a: vsubps xmm0, xmm0, xmmword ptr [r12 + 0x10]
0x10012a891: vmulps xmm1, xmm0, xmmword ptr [rsp + 0x2a0]
0x10012a89a: vpermilps xmm0, xmm0, 0xd2
0x10012a8a0: vmulps xmm0, xmm0, xmmword ptr [rsp + 0x120]
0x10012a8a9: vsubps xmm0, xmm1, xmm0
0x10012a8ad: vpermilps xmm0, xmm0, 0xd2
0x10012a8b3: vsubps xmm0, xmm2, xmm0
0x10012a8b7: vmovaps xmm2, xmmword ptr [rbx + r13 + 0x3d0]
0x10012a8c1: vmulps xmm1, xmm2, xmmword ptr [rsp + 0x3a0]
0x10012a8ca: vmovaps xmm3, xmm2
0x10012a8ce: vmovaps xmmword ptr [rsp], xmm3
0x10012a8d3: vmovshdup xmm2, xmm1
0x10012a8d7: vaddss xmm2, xmm1, xmm2
0x10012a8db: vpermilpd xmm1, xmm1, 1
0x10012a8e1: vaddss xmm1, xmm1, xmm2
0x10012a8e5: vmaxss xmm2, xmm4, xmm1
0x10012a8e9: vcmpunordss xmm1, xmm1, xmm1
0x10012a8ee: vandnps xmm1, xmm1, xmm2
0x10012a8f2: vpermilps xmm1, xmm1, 0xc0
0x10012a8f8: vmulps xmm1, xmm1, xmmword ptr [rsp + 0x390]
0x10012a901: vsubps xmm0, xmm0, xmm1
0x10012a905: vmulps xmm1, xmm0, xmmword ptr [rsp + 0xc0]
0x10012a90e: vmovshdup xmm2, xmm1
0x10012a912: vaddss xmm2, xmm1, xmm2
0x10012a916: vpermilpd xmm1, xmm1, 1
0x10012a91c: vaddss xmm1, xmm1, xmm2
0x10012a920: vpermilps xmm1, xmm1, 0xc0
0x10012a926: vmulps xmm1, xmm1, xmmword ptr [rsp + 0x380]
0x10012a92f: vsubps xmm0, xmm0, xmm1
0x10012a933: vmulps xmm1, xmm0, xmm0
0x10012a937: vmovshdup xmm2, xmm1
0x10012a93b: vaddss xmm2, xmm1, xmm2
0x10012a93f: vpermilpd xmm1, xmm1, 1
0x10012a945: vaddss xmm1, xmm1, xmm2
0x10012a949: vsqrtss xmm1, xmm1, xmm1
0x10012a94d: vaddss xmm1, xmm1, dword ptr [rip + 0x980253] ; 0x100aaaba8
0x10012a955: vdivss xmm1, xmm1, dword ptr [rip + 0x97e87f] ; 0x100aa91dc
0x10012a95d: vmaxss xmm1, xmm4, xmm1
0x10012a961: vmovss xmm2, dword ptr [rip + 0x97a757] ; 0x100aa50c0
0x10012a969: vminss xmm1, xmm2, xmm1
0x10012a96d: vpermilps xmm1, xmm1, 0xc0
0x10012a973: vmulps xmm2, xmm1, xmm0
0x10012a977: vmovaps xmmword ptr [rsp + 0x30], xmm2
0x10012a97d: vmulps xmm0, xmm3, xmm3
0x10012a981: vmovshdup xmm1, xmm0
0x10012a985: vaddss xmm1, xmm0, xmm1
0x10012a989: vpermilpd xmm0, xmm0, 1
0x10012a98f: vaddss xmm0, xmm0, xmm1
0x10012a993: vmulps xmm1, xmm2, xmm2
0x10012a997: vmovshdup xmm2, xmm1
0x10012a99b: vaddss xmm2, xmm1, xmm2
0x10012a99f: vpermilpd xmm1, xmm1, 1
0x10012a9a5: vaddss xmm1, xmm1, xmm2
0x10012a9a9: lea r15, [rsp + r14 + 0x600]
0x10012a9b1: vsqrtss xmm0, xmm0, xmm0
0x10012a9b5: vsqrtss xmm1, xmm1, xmm1
0x10012a9b9: xor eax, eax
0x10012a9bb: vmovss dword ptr [rsp + 0x10], xmm1
0x10012a9c1: vucomiss xmm0, xmm1
0x10012a9c5: seta al
0x10012a9c8: lea rcx, [rip + 0x980ee9] ; 0x100aab8b8
0x10012a9cf: vmovss xmm0, dword ptr [rcx + rax*4]
0x10012a9d4: call 0x100aa2858 ; 0x100aa2858 _logf
0x10012a9d9: vcvtss2sd xmm0, xmm0, xmm0
0x10012a9dd: vdivsd xmm0, xmm0, qword ptr [rip + 0x97dcdb] ; 0x100aa86c0
0x10012a9e5: vcvtsd2ss xmm0, xmm0, xmm0
0x10012a9e9: vmulss xmm0, xmm0, dword ptr [rsp + 0x60]
0x10012a9ef: call 0x100aa2708 ; 0x100aa2708 _expf
0x10012a9f4: vxorps xmm1, xmm1, xmm1
0x10012a9f8: vmovss xmm2, dword ptr [rip + 0x97a6c0] ; 0x100aa50c0
0x10012aa00: vsubss xmm0, xmm2, xmm0
0x10012aa04: vmaxss xmm0, xmm1, xmm0
0x10012aa08: vminss xmm0, xmm2, xmm0
0x10012aa0c: vsubss xmm1, xmm2, xmm0
0x10012aa10: vpermilps xmm1, xmm1, 0xc0
0x10012aa16: vmulps xmm1, xmm1, xmmword ptr [rsp]
0x10012aa1b: vpermilps xmm0, xmm0, 0xc0
0x10012aa21: vmulps xmm0, xmm0, xmmword ptr [rsp + 0x30]
0x10012aa27: vaddps xmm0, xmm1, xmm0
0x10012aa2b: vmovaps xmmword ptr [rbx + r13 + 0x3d0], xmm0
0x10012aa35: mov al, byte ptr [rip + 0xbf90ad] ; 0x100d23ae8
0x10012aa3b: or al, byte ptr [rip + 0xbf8fc7] ; 0x100d23a08
0x10012aa41: je 0x10012b310
0x10012aa47: xor r8d, r8d
0x10012aa4a: mov rdi, qword ptr [rbp + 0x50]
0x10012aa4e: mov rsi, r15
0x10012aa51: lea rdx, [rsp + 0x250]
0x10012aa59: lea rcx, [rsp + 0x1e0]
0x10012aa61: call 0x1002149c0 ; 0x1002149c0
0x10012aa66: vmovaps xmm0, xmmword ptr [rip + 0x97ce92] ; 0x100aa7900
0x10012aa6e: vxorps xmm0, xmm0, xmmword ptr [rsp + 0x1e0]
0x10012aa77: vmovaps xmmword ptr [rsp + 0x1e0], xmm0
0x10012aa80: vmovss xmm2, dword ptr [rsp + 0x250]
0x10012aa89: vsubss xmm0, xmm2, dword ptr [rbx + r13 + 0x400]
0x10012aa93: vdivss xmm0, xmm0, dword ptr [rsp + 0x60]
0x10012aa99: vmovss dword ptr [rbx + r13 + 0x400], xmm2
0x10012aaa3: vmovss dword ptr [rbx + r13 + 0x404], xmm0
0x10012aaad: vmovss xmm0, dword ptr [rsp + 0x10]
0x10012aab3: vaddss xmm0, xmm0, dword ptr [rip + 0x97db65] ; 0x100aa8620
0x10012aabb: vxorps xmm6, xmm6, xmm6
0x10012aabf: vmaxss xmm0, xmm6, xmm0
0x10012aac3: vmovss xmm1, dword ptr [rip + 0x97a5f5] ; 0x100aa50c0
0x10012aacb: vmovaps xmm5, xmm1
0x10012aacf: vminss xmm1, xmm5, xmm0
0x10012aad3: vmovss xmm0, dword ptr [rbx + r13 + 0x408]
0x10012aadd: vmovss dword ptr [rsp], xmm1
0x10012aae2: vmulss xmm1, xmm1, dword ptr [rip + 0x97debe] ; 0x100aa89a8
0x10012aaea: vaddss xmm1, xmm1, dword ptr [rip + 0x97e6d2] ; 0x100aa91c4
0x10012aaf2: vmulss xmm1, xmm1, xmm0
0x10012aaf6: vmovss xmm3, dword ptr [rip + 0x97dad2] ; 0x100aa85d0
0x10012aafe: vmovaps xmm4, xmm3
0x10012ab02: vmaxss xmm3, xmm4, xmm1
0x10012ab06: vcmpunordss xmm1, xmm1, xmm1
0x10012ab0b: vandnps xmm3, xmm1, xmm3
0x10012ab0f: vandps xmm1, xmm1, xmm4
0x10012ab13: vorps xmm1, xmm3, xmm1
0x10012ab17: vmulss xmm3, xmm1, dword ptr [rsp + 0x1bc]
0x10012ab20: vsubss xmm0, xmm0, xmm3
0x10012ab24: vmaxss xmm0, xmm6, xmm0
0x10012ab28: vminss xmm0, xmm5, xmm0
0x10012ab2c: vmaxss xmm3, xmm6, xmm2
0x10012ab30: vxorps xmm4, xmm4, xmm4
0x10012ab34: vminss xmm3, xmm5, xmm3
0x10012ab38: vsqrtss xmm3, xmm3, xmm3
0x10012ab3c: vmulss xmm3, xmm3, dword ptr [rsp + 0x1b8]
0x10012ab45: vaddss xmm0, xmm3, xmm0
0x10012ab49: vmaxss xmm0, xmm4, xmm0
0x10012ab4d: vminss xmm0, xmm5, xmm0
0x10012ab51: mov qword ptr [rsp + 0x130], r13
0x10012ab59: vmovss dword ptr [rbx + r13 + 0x408], xmm0
0x10012ab63: vucomiss xmm2, dword ptr [rip + 0x97db2d] ; 0x100aa8698
0x10012ab6b: jbe 0x10012ab84
0x10012ab6d: vmulss xmm2, xmm0, dword ptr [rip + 0x97da57] ; 0x100aa85cc
0x10012ab75: vmaxss xmm3, xmm2, xmm1
0x10012ab79: vcmpunordss xmm1, xmm1, xmm1
0x10012ab7e: vblendvps xmm1, xmm3, xmm2, xmm1
0x10012ab84: cmp byte ptr [rip + 0xbf8e7d], 0 ; 0x100d23a08
0x10012ab8b: je 0x10012adcc
0x10012ab91: vmovss xmm2, dword ptr [rip + 0x979a1f] ; 0x100aa45b8
0x10012ab99: vmovaps xmm3, xmm2
0x10012ab9d: vmulss xmm2, xmm1, xmm3
0x10012aba1: vmulss xmm3, xmm3, dword ptr [rsp]
0x10012aba6: vaddss xmm2, xmm3, xmm2
0x10012abaa: vxorps xmm3, xmm3, xmm3
0x10012abae: vmaxss xmm2, xmm3, xmm2
0x10012abb2: vmovss xmm3, dword ptr [rip + 0x97a506] ; 0x100aa50c0
0x10012abba: vminss xmm2, xmm3, xmm2
0x10012abbe: vsubss xmm3, xmm3, xmm2
0x10012abc2: vmulss xmm2, xmm2, dword ptr [rip + 0x97eaa6] ; 0x100aa9670
0x10012abca: vaddss xmm2, xmm3, xmm2
0x10012abce: vcvttss2si ebx, xmm2
0x10012abd2: test ebx, ebx
0x10012abd4: je 0x10012adcc
0x10012abda: vmovss xmm2, dword ptr [rip + 0x97d9ee] ; 0x100aa85d0
0x10012abe2: vucomiss xmm2, xmm1
0x10012abe6: jae 0x10012adcc
0x10012abec: lea r14, [rsp + r14 + 0x610]
0x10012abf4: mov rax, qword ptr [rsp + 0x58]
0x10012abf9: mov rcx, qword ptr [rsp + 0x130]
0x10012ac01: lea r12, [rax + rcx + 0x408]
0x10012ac09: mov eax, ebx
0x10012ac0b: vcvtsi2ss xmm2, xmm7, rax
0x10012ac10: vmovss dword ptr [rsp + 0x10], xmm2
0x10012ac16: vmovaps xmm2, xmmword ptr [rsp + 0x30]
0x10012ac1c: vmulps xmm2, xmm2, xmmword ptr [rip + 0x97de1c] ; 0x100aa8a40
0x10012ac24: vmovaps xmmword ptr [rsp + 0x30], xmm2
0x10012ac2a: vmovss xmm2, dword ptr [rip + 0x97a48e] ; 0x100aa50c0
0x10012ac32: vminss xmm1, xmm2, xmm1
0x10012ac36: vsubss xmm2, xmm2, xmm1
0x10012ac3a: vmulss xmm2, xmm2, dword ptr [rip + 0x97d9f2] ; 0x100aa8634
0x10012ac42: vaddss xmm1, xmm1, xmm2
0x10012ac46: vmovss dword ptr [rsp + 0x90], xmm1
0x10012ac4f: mov r13d, 1
0x10012ac55: jmp 0x10012ac69 ; 0x10012ac69
0x10012ac57: nop word ptr [rax + rax]
0x10012ac60: vmovss xmm0, dword ptr [r12]
0x10012ac66: inc r13d
0x10012ac69: mov eax, r13d
0x10012ac6c: vcvtsi2ss xmm1, xmm7, rax
0x10012ac71: vdivss xmm1, xmm1, dword ptr [rsp + 0x10]
0x10012ac77: vxorps xmm5, xmm5, xmm5
0x10012ac7b: vmaxss xmm0, xmm5, xmm0
0x10012ac7f: vmovss xmm2, dword ptr [rip + 0x97a439] ; 0x100aa50c0
0x10012ac87: vmovaps xmm4, xmm2
0x10012ac8b: vminss xmm0, xmm4, xmm0
0x10012ac8f: vsubss xmm2, xmm4, xmm0
0x10012ac93: vmovss xmm3, dword ptr [rip + 0x97dd0d] ; 0x100aa89a8
0x10012ac9b: vmulss xmm2, xmm2, xmm3
0x10012ac9f: vaddss xmm0, xmm0, xmm2
0x10012aca3: vsqrtss xmm2, xmm1, xmm1
0x10012aca7: vpermilps xmm2, xmm2, 0xc0
0x10012acad: vmulps xmm2, xmm2, xmmword ptr [rsp + 0x30]
0x10012acb3: vpermilps xmm0, xmm0, 0xc0
0x10012acb9: vmulps xmm0, xmm2, xmm0
0x10012acbd: mov rax, qword ptr [rsp + 0x40]
0x10012acc2: vmovaps xmm2, xmmword ptr [rip + 0x980af6] ; 0x100aab7c0
0x10012acca: vmulps xmm2, xmm2, xmmword ptr [rax + 0x50]
0x10012accf: vaddps xmm0, xmm2, xmm0
0x10012acd3: mov qword ptr [rsp + 0x580], 0x3f800000
0x10012acdf: mov dword ptr [rsp + 0x58c], 0x3f800000
0x10012acea: mov byte ptr [rsp + 0x590], 0
0x10012acf2: vsubss xmm1, xmm4, xmm1
0x10012acf6: vmulss xmm1, xmm1, dword ptr [rsp]
0x10012acfb: vmaxss xmm1, xmm5, xmm1
0x10012acff: vminss xmm1, xmm4, xmm1
0x10012ad03: vsubss xmm2, xmm4, xmm1
0x10012ad07: vmulss xmm1, xmm1, dword ptr [rip + 0x97cae1] ; 0x100aa77f0
0x10012ad0f: vaddss xmm1, xmm2, xmm1
0x10012ad13: vmovss xmm2, dword ptr [r14]
0x10012ad18: vdivss xmm2, xmm2, dword ptr [rip + 0x97cac8] ; 0x100aa77e8
0x10012ad20: vmulss xmm2, xmm2, xmm3
0x10012ad24: vaddss xmm2, xmm2, dword ptr [rip + 0x97e498] ; 0x100aa91c4
0x10012ad2c: vmulss xmm1, xmm1, xmm2
0x10012ad30: lea rax, [rip + 0x1f14979] ; 0x10203f6b0
0x10012ad37: vmovaps xmm2, xmmword ptr [rax]
0x10012ad3b: vmovaps xmm3, xmmword ptr [rip + 0x97c91d] ; 0x100aa7660
0x10012ad43: vmovaps xmmword ptr [rsp + 0x5c0], xmm3
0x10012ad4c: vmovss dword ptr [rsp + 0x588], xmm1
0x10012ad55: vdivss xmm1, xmm4, xmm1
0x10012ad59: vmulss xmm1, xmm1, dword ptr [rsp + 0x90]
0x10012ad62: vinsertps xmm1, xmm2, xmm1, 0x30
0x10012ad68: vmovaps xmmword ptr [rsp + 0x5b0], xmm1
0x10012ad71: vmovaps xmmword ptr [rsp + 0x5a0], xmm1
0x10012ad7a: vmovaps xmm1, xmmword ptr [rsp + 0x100]
0x10012ad83: vaddps xmm1, xmm1, xmmword ptr [r15]
0x10012ad88: mov rax, qword ptr [rsp + 0x58]
0x10012ad8d: mov rdi, qword ptr [rax + 0x310]
0x10012ad94: vmovaps xmmword ptr [rsp + 0xb0], xmm1
0x10012ad9d: vmovaps xmmword ptr [rsp + 0x110], xmm0
0x10012ada6: lea rsi, [rsp + 0xb0]
0x10012adae: lea rdx, [rsp + 0x110]
0x10012adb6: lea rcx, [rsp + 0x580]
0x10012adbe: call 0x1002da730 ; 0x1002da730
0x10012adc3: cmp ebx, r13d
0x10012adc6: jne 0x10012ac60
0x10012adcc: cmp byte ptr [rip + 0xbf8d15], 0 ; 0x100d23ae8
0x10012add3: je 0x10012b2f0
0x10012add9: mov rax, qword ptr [rsp + 0x58]
0x10012adde: mov r13, qword ptr [rsp + 0x130]
0x10012ade6: lea rax, [rax + r13 + 0x400]
0x10012adee: vmovss xmm0, dword ptr [rax]
0x10012adf2: vxorps xmm8, xmm8, xmm8
0x10012adf7: vmaxss xmm1, xmm8, xmm0
0x10012adfb: vcmpunordss xmm0, xmm0, xmm0
0x10012ae00: vandnps xmm9, xmm0, xmm1
0x10012ae04: vmovaps xmm7, xmmword ptr [rsp + 0x1e0]
0x10012ae0d: vxorps xmm0, xmm7, xmmword ptr [rip + 0x97caeb] ; 0x100aa7900
0x10012ae15: vmovaps xmm1, xmmword ptr [rip + 0x97d283] ; 0x100aa80a0
0x10012ae1d: vmovaps xmm6, xmmword ptr [rsp + 0x370]
0x10012ae26: vinsertps xmm6, xmm1, xmm6, 0xf5
0x10012ae2c: vsubps xmm0, xmm0, xmm6
0x10012ae30: vmovaps xmm3, xmmword ptr [rsp + 0x140]
0x10012ae39: vmulps xmm1, xmm3, xmm3
0x10012ae3d: vmovshdup xmm2, xmm1
0x10012ae41: vaddss xmm2, xmm1, xmm2
0x10012ae45: vpermilpd xmm1, xmm1, 1
0x10012ae4b: vaddss xmm1, xmm1, xmm2
0x10012ae4f: vsqrtss xmm5, xmm1, xmm1
0x10012ae53: vmovss xmm4, dword ptr [rip + 0x97ca69] ; 0x100aa78c4
0x10012ae5b: vucomiss xmm5, xmm4
0x10012ae5f: vmovaps xmm1, xmm3
0x10012ae63: mov r12, qword ptr [rsp + 0x40]
0x10012ae68: jbe 0x10012ae7d
0x10012ae6a: vpermilps xmm1, xmm5, 0xc0
0x10012ae70: vmovaps xmm2, xmmword ptr [rsp + 0x140]
0x10012ae79: vdivps xmm1, xmm2, xmm1
0x10012ae7d: vmulps xmm2, xmm0, xmm0
0x10012ae81: vmovshdup xmm3, xmm2
0x10012ae85: vaddss xmm3, xmm2, xmm3
0x10012ae89: vpermilpd xmm2, xmm2, 1
0x10012ae8f: vaddss xmm2, xmm2, xmm3
0x10012ae93: vsqrtss xmm2, xmm2, xmm2
0x10012ae97: vucomiss xmm2, xmm4
0x10012ae9b: vmovaps xmmword ptr [rsp + 0x370], xmm6
0x10012aea4: vmovaps xmmword ptr [rsp], xmm7
0x10012aea9: vmovaps xmmword ptr [rsp + 0x10], xmm5
0x10012aeaf: jbe 0x10012aebb
0x10012aeb1: vpermilps xmm2, xmm2, 0xc0
0x10012aeb7: vdivps xmm0, xmm0, xmm2
0x10012aebb: vmulps xmm0, xmm1, xmm0
0x10012aebf: vmovshdup xmm1, xmm0
0x10012aec3: vaddss xmm1, xmm0, xmm1
0x10012aec7: vpermilpd xmm0, xmm0, 1
0x10012aecd: vaddss xmm0, xmm0, xmm1
0x10012aed1: xor eax, eax
0x10012aed3: vucomiss xmm0, xmm8
0x10012aed8: seta al
0x10012aedb: xor ecx, ecx
0x10012aedd: vucomiss xmm8, xmm0
0x10012aee1: seta cl
0x10012aee4: sub eax, ecx
0x10012aee6: vcvtsi2ss xmm1, xmm10, eax
0x10012aeea: vmovss dword ptr [rsp + 0x30], xmm1
0x10012aef0: vmovaps xmm1, xmmword ptr [rip + 0x97ca18] ; 0x100aa7910
0x10012aef8: vandps xmm0, xmm0, xmm1
0x10012aefc: vmulss xmm1, xmm9, dword ptr [rip + 0x97daa4] ; 0x100aa89a8
0x10012af04: vmovss xmm2, dword ptr [rip + 0x97a1b4] ; 0x100aa50c0
0x10012af0c: vminss xmm1, xmm2, xmm1
0x10012af10: vsubss xmm2, xmm2, xmm1
0x10012af14: vmulss xmm2, xmm2, dword ptr [rip + 0x97daa8] ; 0x100aa89c4
0x10012af1c: vmulss xmm1, xmm1, dword ptr [rip + 0x97d6a8] ; 0x100aa85cc
0x10012af24: vaddss xmm1, xmm1, xmm2
0x10012af28: vmovaps xmmword ptr [rsp + 0x90], xmm9
0x10012af31: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x10012af36: vmulss xmm0, xmm0, dword ptr [rsp + 0x30]
0x10012af3c: vmulss xmm0, xmm0, dword ptr [rsp + 0x10]
0x10012af42: vmovaps xmmword ptr [rsp + 0x30], xmm0
0x10012af48: vandps xmm0, xmm0, xmmword ptr [rip + 0x97c9c0] ; 0x100aa7910
0x10012af50: vmovss xmm1, dword ptr [rip + 0x97e284] ; 0x100aa91dc
0x10012af58: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x10012af5d: vmulss xmm0, xmm0, dword ptr [rsp + 0x90]
0x10012af66: vmovss dword ptr [rsp + 0x10], xmm0
0x10012af6c: vmulss xmm0, xmm0, xmm0
0x10012af70: vxorps xmm0, xmm0, xmmword ptr [rip + 0x97c988] ; 0x100aa7900
0x10012af78: call 0x100aa2708 ; 0x100aa2708 _expf
0x10012af7d: vmovss xmm1, dword ptr [rsp + 0x10]
0x10012af83: vmulss xmm0, xmm0, xmm1
0x10012af87: vsubss xmm0, xmm1, xmm0
0x10012af8b: vmulss xmm0, xmm0, dword ptr [rip + 0x979625] ; 0x100aa45b8
0x10012af93: vmovaps xmmword ptr [rsp + 0x90], xmm0
0x10012af9c: vmovaps xmm0, xmmword ptr [rip + 0x98082c] ; 0x100aab7d0
0x10012afa4: vmulps xmm0, xmm0, xmmword ptr [r12 + 0x70]
0x10012afab: vaddps xmm3, xmm0, xmmword ptr [rsp]
0x10012afb0: vmulps xmm0, xmm3, xmm3
0x10012afb4: vmovshdup xmm1, xmm0
0x10012afb8: vaddss xmm1, xmm0, xmm1
0x10012afbc: vpermilpd xmm0, xmm0, 1
0x10012afc2: vaddss xmm0, xmm0, xmm1
0x10012afc6: vsqrtss xmm0, xmm0, xmm0
0x10012afca: vucomiss xmm0, dword ptr [rip + 0x97c8f2] ; 0x100aa78c4
0x10012afd2: jbe 0x10012afde
0x10012afd4: vpermilps xmm0, xmm0, 0xc0
0x10012afda: vdivps xmm3, xmm3, xmm0
0x10012afde: vxorps xmm0, xmm0, xmm0
0x10012afe2: vmovaps xmm1, xmmword ptr [rsp + 0x90]
0x10012afeb: vucomiss xmm1, dword ptr [rip + 0x97e1f9] ; 0x100aa91ec
0x10012aff3: vmovss xmm1, dword ptr [rip + 0x97a0c5] ; 0x100aa50c0
0x10012affb: vxorps xmm2, xmm2, xmm2
0x10012afff: jbe 0x10012b042
0x10012b001: vmovaps xmm0, xmmword ptr [rsp + 0x90]
0x10012b00a: vmulss xmm0, xmm0, dword ptr [rip + 0x9795a6] ; 0x100aa45b8
0x10012b012: vmaxss xmm0, xmm2, xmm0
0x10012b016: vminss xmm0, xmm1, xmm0
0x10012b01a: vmovss xmm1, dword ptr [rip + 0x97a09e] ; 0x100aa50c0
0x10012b022: vsubss xmm1, xmm1, xmm0
0x10012b026: vmulss xmm0, xmm0, dword ptr [rip + 0x97ba7a] ; 0x100aa6aa8
0x10012b02e: vaddss xmm0, xmm1, xmm0
0x10012b032: vmovss xmm1, dword ptr [rip + 0x97a086] ; 0x100aa50c0
0x10012b03a: vcvttss2si eax, xmm0
0x10012b03e: vcvtsi2ss xmm0, xmm10, eax
0x10012b042: vcvttss2si r14, xmm0
0x10012b047: test r14d, r14d
0x10012b04a: je 0x10012b310
0x10012b050: vmovaps xmmword ptr [rsp + 0xd0], xmm3
0x10012b059: xor eax, eax
0x10012b05b: vmovaps xmm4, xmmword ptr [rsp + 0x30]
0x10012b061: vucomiss xmm2, xmm4
0x10012b065: seta al
0x10012b068: mov ecx, r14d
0x10012b06b: vcvtsi2ss xmm0, xmm10, rcx
0x10012b070: vmovss dword ptr [rsp + 0x1d0], xmm0
0x10012b079: lea rcx, [rip + 0x980840] ; 0x100aab8c0
0x10012b080: vmovss xmm0, dword ptr [rcx + rax*4]
0x10012b085: vmovss dword ptr [rsp + 0xa8], xmm0
0x10012b08e: vmovaps xmm3, xmmword ptr [rsp + 0x90]
0x10012b097: vpermilps xmm0, xmm3, 0xc0
0x10012b09d: vmovaps xmmword ptr [rsp + 0x170], xmm0
0x10012b0a6: vcmpnltss xmm0, xmm4, xmm2
0x10012b0ab: vandps xmm0, xmm0, xmm1
0x10012b0af: vmulss xmm0, xmm0, dword ptr [rip + 0x97d8f1] ; 0x100aa89a8
0x10012b0b7: vaddss xmm0, xmm0, xmm1
0x10012b0bb: vpermilps xmm0, xmm0, 0xc0
0x10012b0c1: vmovaps xmmword ptr [rsp + 0x160], xmm0
0x10012b0ca: vmaxss xmm0, xmm2, xmm3
0x10012b0ce: vminss xmm0, xmm1, xmm0
0x10012b0d2: vsubss xmm1, xmm1, xmm0
0x10012b0d6: vmulss xmm1, xmm1, dword ptr [rip + 0x97d552] ; 0x100aa8630
0x10012b0de: vaddss xmm0, xmm0, xmm1
0x10012b0e2: vmovaps xmmword ptr [rsp + 0xe0], xmm0
0x10012b0eb: xor ebx, ebx
0x10012b0ed: mov r12, qword ptr [rsp + 0x58]
0x10012b0f2: lea r13, [rsp + 0x580]
0x10012b0fa: nop word ptr [rax + rax]
0x10012b100: inc ebx
0x10012b102: vcvtsi2ss xmm0, xmm10, rbx
0x10012b107: vdivss xmm1, xmm0, dword ptr [rsp + 0x1d0]
0x10012b110: vmovaps xmm0, xmmword ptr [r15]
0x10012b115: vmovaps xmmword ptr [rsp], xmm0
0x10012b11a: vmovaps xmmword ptr [rsp + 0x10], xmm1
0x10012b120: vmulss xmm0, xmm1, dword ptr [rsp + 0xa8]
0x10012b129: vmovaps xmmword ptr [rsp + 0x30], xmm0
0x10012b12f: mov rax, qword ptr [rsp + 0x28]
0x10012b134: mov rsi, qword ptr [rax + 0x288]
0x10012b13b: mov rdi, r13
0x10012b13e: call 0x1007f26b0 ; 0x1007f26b0
0x10012b143: vmovaps xmm0, xmmword ptr [r15]
0x10012b148: vsubps xmm0, xmm0, xmmword ptr [rsp + 0x580]
0x10012b151: vmulps xmm1, xmm0, xmm0
0x10012b155: vmovshdup xmm2, xmm1
0x10012b159: vaddss xmm2, xmm1, xmm2
0x10012b15d: vpermilpd xmm1, xmm1, 1
0x10012b163: vaddss xmm1, xmm1, xmm2
0x10012b167: vsqrtss xmm1, xmm1, xmm1
0x10012b16b: vmovss xmm3, dword ptr [rip + 0x97c751] ; 0x100aa78c4
0x10012b173: vucomiss xmm1, xmm3
0x10012b177: jbe 0x10012b183
0x10012b179: vpermilps xmm1, xmm1, 0xc0
0x10012b17f: vdivps xmm0, xmm0, xmm1
0x10012b183: vxorps xmm4, xmm4, xmm4
0x10012b187: vpermilps xmm1, xmmword ptr [rsp + 0x30], 0xc0
0x10012b18f: vmulps xmm0, xmm1, xmm0
0x10012b193: vaddps xmm0, xmm0, xmmword ptr [rsp + 0xd0]
0x10012b19c: vmulps xmm1, xmm0, xmm0
0x10012b1a0: vmovshdup xmm2, xmm1
0x10012b1a4: vaddss xmm2, xmm1, xmm2
0x10012b1a8: vpermilpd xmm1, xmm1, 1
0x10012b1ae: vaddss xmm1, xmm1, xmm2
0x10012b1b2: vsqrtss xmm1, xmm1, xmm1
0x10012b1b6: vucomiss xmm1, xmm3
0x10012b1ba: jbe 0x10012b1c6
0x10012b1bc: vpermilps xmm1, xmm1, 0xc0
0x10012b1c2: vdivps xmm0, xmm0, xmm1
0x10012b1c6: vmulps xmm0, xmm0, xmmword ptr [rsp + 0x170]
0x10012b1cf: mov rax, qword ptr [rsp + 0x40]
0x10012b1d4: vmovaps xmm1, xmmword ptr [rip + 0x97e124] ; 0x100aa9300 fff?fff?fff?
0x10012b1dc: vmulps xmm1, xmm1, xmmword ptr [rax + 0x50]
0x10012b1e1: vmovaps xmm5, xmmword ptr [rsp + 0x10]
0x10012b1e7: vpermilps xmm2, xmm5, 0xc0
0x10012b1ed: vmulps xmm0, xmm2, xmm0
0x10012b1f1: vmulps xmm0, xmm0, xmmword ptr [rsp + 0x160]
0x10012b1fa: vaddps xmm0, xmm1, xmm0
0x10012b1fe: mov qword ptr [rsp + 0x580], 0x3f800000
0x10012b20a: mov dword ptr [rsp + 0x58c], 0x3f800000
0x10012b215: mov byte ptr [rsp + 0x590], 0
0x10012b21d: lea rax, [rip + 0x1f1448c] ; 0x10203f6b0
0x10012b224: vmovaps xmm1, xmmword ptr [rax]
0x10012b228: vmovaps xmm2, xmmword ptr [rip + 0x97c430] ; 0x100aa7660
0x10012b230: vmovaps xmmword ptr [rsp + 0x5c0], xmm2
0x10012b239: vsqrtss xmm2, xmm6, dword ptr [rsp + 0x90]
0x10012b242: vmulss xmm2, xmm2, dword ptr [rip + 0x97f25e] ; 0x100aaa4a8
0x10012b24a: vmaxss xmm2, xmm4, xmm2
0x10012b24e: vmovss xmm3, dword ptr [rip + 0x979e6a] ; 0x100aa50c0
0x10012b256: vmovaps xmm4, xmm3
0x10012b25a: vminss xmm2, xmm4, xmm2
0x10012b25e: vsubss xmm3, xmm4, xmm2
0x10012b262: vaddss xmm2, xmm2, xmm2
0x10012b266: vaddss xmm2, xmm3, xmm2
0x10012b26a: vminss xmm3, xmm4, xmm5
0x10012b26e: vsubss xmm4, xmm4, xmm3
0x10012b272: vmulss xmm3, xmm3, dword ptr [rip + 0x97d3b6] ; 0x100aa8630
0x10012b27a: vaddss xmm3, xmm4, xmm3
0x10012b27e: vmulss xmm2, xmm3, xmm2
0x10012b282: vmovss dword ptr [rsp + 0x588], xmm2
0x10012b28b: vinsertps xmm1, xmm1, dword ptr [rsp + 0xe0], 0x30
0x10012b296: vmovaps xmmword ptr [rsp + 0x5b0], xmm1
0x10012b29f: vmovaps xmmword ptr [rsp + 0x5a0], xmm1
0x10012b2a8: mov rdi, qword ptr [r12 + 0x318]
0x10012b2b0: vmovaps xmm1, xmmword ptr [rsp]
0x10012b2b5: vmovaps xmmword ptr [rsp + 0xb0], xmm1
0x10012b2be: vmovaps xmmword ptr [rsp + 0x110], xmm0
0x10012b2c7: lea rsi, [rsp + 0xb0]
0x10012b2cf: lea rdx, [rsp + 0x110]
0x10012b2d7: lea r13, [rsp + 0x580]
0x10012b2df: mov rcx, r13
0x10012b2e2: call 0x1002da730 ; 0x1002da730
0x10012b2e7: cmp r14d, ebx
0x10012b2ea: jne 0x10012b100
0x10012b2f0: mov r12, qword ptr [rsp + 0x40]
0x10012b2f5: mov rbx, qword ptr [rsp + 0x78]
0x10012b2fa: mov r13, qword ptr [rsp + 0x130]
0x10012b302: cmp byte ptr [rip + 0xb57ab1], 0 ; 0x100c82dba
0x10012b309: jne 0x10012b322
0x10012b30b: jmp 0x10012b570 ; 0x10012b570
0x10012b310: mov rbx, qword ptr [rsp + 0x78]
0x10012b315: cmp byte ptr [rip + 0xb57a9e], 0 ; 0x100c82dba
0x10012b31c: je 0x10012b570
0x10012b322: mov rax, rbx
0x10012b325: mov ecx, 0xaaaaaaab
0x10012b32a: imul rax, rcx
0x10012b32e: shr rax, 0x21
0x10012b332: lea eax, [rax + rax*2]
0x10012b335: mov ecx, ebx
0x10012b337: sub ecx, eax
0x10012b339: vcvtsi2ss xmm0, xmm10, ecx
0x10012b33d: vmovss dword ptr [rsp], xmm0
0x10012b342: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10012b347: vcvtsi2ss xmm0, xmm10, eax
0x10012b34b: vmulss xmm0, xmm0, dword ptr [rip + 0x97bd9d] ; 0x100aa70f0
0x10012b353: vmulss xmm0, xmm0, dword ptr [rip + 0x9804d9] ; 0x100aab834
0x10012b35b: vroundss xmm0, xmm0, xmm0, 9
0x10012b361: vucomiss xmm0, dword ptr [rsp]
0x10012b366: jne 0x10012b570
0x10012b36c: jp 0x10012b570
0x10012b372: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10012b377: vmovss xmm0, dword ptr [rip + 0x97b71d] ; 0x100aa6a9c
0x10012b37f: mov rcx, qword ptr [rsp + 0x58]
0x10012b384: vucomiss xmm0, dword ptr [rcx + 0x1004]
0x10012b38c: jae 0x10012b570
0x10012b392: mov rcx, qword ptr [rsp + 0x58]
0x10012b397: mov ecx, dword ptr [rcx + 0xfb0]
0x10012b39d: dec ecx
0x10012b39f: cmp ebx, ecx
0x10012b3a1: je 0x10012b570
0x10012b3a7: vcvtsi2ss xmm0, xmm10, eax
0x10012b3ab: vmulss xmm0, xmm0, dword ptr [rip + 0x97bd3d] ; 0x100aa70f0
0x10012b3b3: vmulss xmm0, xmm0, dword ptr [rsp + 0x1b4]
0x10012b3bc: vmovss xmm1, dword ptr [rip + 0x97de00] ; 0x100aa91c4
0x10012b3c4: vucomiss xmm1, xmm0
0x10012b3c8: jbe 0x10012b570
0x10012b3ce: mov rax, qword ptr [rsp + 0x58]
0x10012b3d3: lea rax, [rax + r13 + 0x3f0]
0x10012b3db: vmovaps xmm0, xmmword ptr [r15]
0x10012b3e0: vsubps xmm0, xmm0, xmmword ptr [rax]
0x10012b3e4: vmovaps xmmword ptr [rsp], xmm0
0x10012b3e9: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10012b3ee: vcvtsi2ss xmm0, xmm7, eax
0x10012b3f2: vmovss xmm1, dword ptr [rip + 0x97bcf6] ; 0x100aa70f0
0x10012b3fa: vmulss xmm0, xmm0, xmm1
0x10012b3fe: vmovaps xmmword ptr [rsp + 0x10], xmm0
0x10012b404: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10012b409: vcvtsi2ss xmm0, xmm7, eax
0x10012b40d: vmulss xmm0, xmm0, dword ptr [rip + 0x97bcdb] ; 0x100aa70f0
0x10012b415: vmovaps xmmword ptr [rsp + 0x30], xmm0
0x10012b41b: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10012b420: vcvtsi2ss xmm0, xmm7, eax
0x10012b424: vmulss xmm0, xmm0, dword ptr [rip + 0x97bcc4] ; 0x100aa70f0
0x10012b42c: vmovaps xmm1, xmmword ptr [rsp + 0x10]
0x10012b432: vinsertps xmm1, xmm1, dword ptr [rsp + 0x30], 0x10
0x10012b43a: vinsertps xmm0, xmm1, xmm0, 0x20
0x10012b440: vmulps xmm0, xmm0, xmmword ptr [rip + 0x97cb08] ; 0x100aa7f50
0x10012b448: vaddps xmm2, xmm0, xmmword ptr [rip + 0x97c490] ; 0x100aa78e0
0x10012b450: vmulps xmm0, xmm2, xmm2
0x10012b454: vmovshdup xmm1, xmm0
0x10012b458: vaddss xmm1, xmm0, xmm1
0x10012b45c: vpermilpd xmm0, xmm0, 1
0x10012b462: vaddss xmm0, xmm0, xmm1
0x10012b466: vsqrtss xmm0, xmm0, xmm0
0x10012b46a: vucomiss xmm0, dword ptr [rip + 0x97c452] ; 0x100aa78c4
0x10012b472: jbe 0x10012b48e
0x10012b474: vpermilps xmm0, xmm0, 0xc0
0x10012b47a: vdivps xmm2, xmm2, xmm0
0x10012b47e: vmovaps xmmword ptr [rsp + 0x10], xmm2
0x10012b484: lea r14, [rsp + 0x580]
0x10012b48c: jmp 0x10012b49c ; 0x10012b49c
0x10012b48e: lea r14, [rsp + 0x580]
0x10012b496: vmovaps xmmword ptr [rsp + 0x10], xmm2
0x10012b49c: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10012b4a1: vcvtsi2ss xmm0, xmm7, eax
0x10012b4a5: vmulss xmm0, xmm0, dword ptr [rip + 0x97bc43] ; 0x100aa70f0
0x10012b4ad: vmovss xmm1, dword ptr [rip + 0x979c0b] ; 0x100aa50c0
0x10012b4b5: vsubss xmm1, xmm1, xmm0
0x10012b4b9: vmulss xmm1, xmm1, dword ptr [rip + 0x97d0f3] ; 0x100aa85b4
0x10012b4c1: vmulss xmm0, xmm0, dword ptr [rip + 0x97c403] ; 0x100aa78cc
0x10012b4c9: vaddss xmm0, xmm0, xmm1
0x10012b4cd: vpermilps xmm0, xmm0, 0xc0
0x10012b4d3: vmulps xmm0, xmm0, xmmword ptr [rsp + 0x10]
0x10012b4d9: vmulps xmm0, xmm0, xmmword ptr [rip + 0x97ca7f] ; 0x100aa7f60
0x10012b4e1: vaddps xmm0, xmm0, xmmword ptr [rsp]
0x10012b4e6: vmovaps xmmword ptr [rsp + 0x580], xmm0
0x10012b4ef: vmovaps xmm0, xmmword ptr [rsp + 0x140]
0x10012b4f8: vmovaps xmmword ptr [rsp + 0x590], xmm0
0x10012b501: mov rax, qword ptr [rsp + 0x58]
0x10012b506: vmovss xmm0, dword ptr [rax + 0x1004]
0x10012b50e: vmovss dword ptr [rsp], xmm0
0x10012b513: vmovss xmm1, dword ptr [rip + 0x97c2d1] ; 0x100aa77ec
0x10012b51b: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x10012b520: vxorps xmm1, xmm1, xmm1
0x10012b524: vmovss xmm3, dword ptr [rsp]
0x10012b529: vmaxss xmm1, xmm1, xmm3
0x10012b52d: vmovss xmm2, dword ptr [rip + 0x979b8b] ; 0x100aa50c0
0x10012b535: vminss xmm1, xmm2, xmm1
0x10012b539: vsubss xmm2, xmm2, xmm1
0x10012b53d: vmulss xmm0, xmm0, xmm2
0x10012b541: vmulss xmm1, xmm3, xmm1
0x10012b545: vaddss xmm0, xmm1, xmm0
0x10012b549: vmovss dword ptr [rsp + 0x5a4], xmm0
0x10012b552: mov dword ptr [rsp + 0x5a0], 0x3e774bc6
0x10012b55d: mov rdi, qword ptr [rbp + 0x18]
0x10012b561: mov rsi, r14
0x10012b564: call 0x100228a30 ; 0x100228a30
0x10012b569: nop dword ptr [rax]
0x10012b570: inc ebx
0x10012b572: mov rax, qword ptr [rsp + 0x190]
0x10012b57a: cmp ebx, dword ptr [rax]
0x10012b57c: vxorps xmm4, xmm4, xmm4
0x10012b580: jb 0x10012a7f0
0x10012b586: mov r12, qword ptr [rsp + 0x58]
0x10012b58b: mov r13, qword ptr [rsp + 0x88]
0x10012b593: lea rsi, [rsp + 0x600]
0x10012b59b: mov edx, 1
0x10012b5a0: mov rdi, qword ptr [rbp + 0x58]
0x10012b5a4: call 0x1001032a0 ; 0x1001032a0
0x10012b5a9: test eax, eax
0x10012b5ab: je 0x10012b5bc
0x10012b5ad: mov rax, qword ptr [r12 + 0x2f0]
0x10012b5b5: mov byte ptr [rax + 0xac], 0
0x10012b5bc: mov al, byte ptr [r12 + 0x1064]
0x10012b5c4: test al, al
0x10012b5c6: vmovaps xmm1, xmmword ptr [rsp + 0x60]
0x10012b5cc: vmovss xmm2, dword ptr [rip + 0x979af0] ; 0x100aa50c4
0x10012b5d4: jne 0x10012b5e5
0x10012b5d6: cmp byte ptr [r12 + 0x1065], 0
0x10012b5df: je 0x10012b6f6
0x10012b5e5: cmp qword ptr [r12 + 0x1070], 0
0x10012b5ee: je 0x10012b678
0x10012b5f4: test al, al
0x10012b5f6: je 0x10012b6f6
0x10012b5fc: vdivss xmm0, xmm1, dword ptr [rip + 0x980234] ; 0x100aab838
0x10012b604: vaddss xmm0, xmm0, dword ptr [r12 + 0x1068]
0x10012b60e: vmovss dword ptr [r12 + 0x1068], xmm0
0x10012b618: vmovss xmm6, dword ptr [rip + 0x979aa0] ; 0x100aa50c0
0x10012b620: vsubss xmm1, xmm6, xmm0
0x10012b624: vxorps xmm0, xmm0, xmm0
0x10012b628: vmaxss xmm1, xmm0, xmm1
0x10012b62c: vminss xmm1, xmm6, xmm1
0x10012b630: vmovss xmm8, dword ptr [rip + 0x97c1b0] ; 0x100aa77e8
0x10012b638: vmovss xmm3, dword ptr [rip + 0x97c1b4] ; 0x100aa77f4
0x10012b640: vucomiss xmm3, xmm1
0x10012b644: jbe 0x10012b96c
0x10012b64a: vmovss xmm6, dword ptr [rip + 0x97d03e] ; 0x100aa8690
0x10012b652: vmovss xmm4, dword ptr [rip + 0x97cfae] ; 0x100aa8608
0x10012b65a: vmovss xmm3, dword ptr [rip + 0x97f8ba] ; 0x100aaaf1c
0x10012b662: vmovaps xmmword ptr [rsp + 0x200], xmm3
0x10012b66b: vxorps xmm5, xmm5, xmm5
0x10012b66f: vmovaps xmm3, xmm8
0x10012b673: jmp 0x10012bb6e ; 0x10012bb6e
0x10012b678: xor esi, esi
0x10012b67a: mov rdi, qword ptr [rbp + 0xa0]
0x10012b681: call 0x1003edcb0 ; 0x1003edcb0
0x10012b686: mov qword ptr [r12 + 0x1070], rax
0x10012b68e: mov esi, 1
0x10012b693: mov rdi, rax
0x10012b696: call 0x1003ec550 ; 0x1003ec550
0x10012b69b: vmovss xmm2, dword ptr [rip + 0x979a21] ; 0x100aa50c4
0x10012b6a3: vmovaps xmm1, xmmword ptr [rsp + 0x60]
0x10012b6a9: mov rax, qword ptr [r12 + 0x1070]
0x10012b6b1: mov dword ptr [rax + 0xb0], 0x3ecccccd
0x10012b6bb: lea rcx, [rip + 0x1f13fee] ; 0x10203f6b0
0x10012b6c2: vmovaps xmm0, xmmword ptr [rcx]
0x10012b6c6: vmovaps xmmword ptr [rax + 0xa0], xmm0
0x10012b6ce: mov rax, qword ptr [r12 + 0x1070]
0x10012b6d6: mov word ptr [rax + 0xb8], 1
0x10012b6df: mov byte ptr [rax + 0xba], 0
0x10012b6e6: mov al, byte ptr [r12 + 0x1064]
0x10012b6ee: test al, al
0x10012b6f0: jne 0x10012b5fc
0x10012b6f6: cmp byte ptr [r12 + 0x1065], 0
0x10012b6ff: je 0x10012bd08
0x10012b705: mov byte ptr [r12 + 0x1064], 0
0x10012b70e: vdivss xmm0, xmm1, dword ptr [rip + 0x97daca] ; 0x100aa91e0
0x10012b716: vaddss xmm0, xmm0, dword ptr [r12 + 0x1068]
0x10012b720: vmovss dword ptr [r12 + 0x1068], xmm0
0x10012b72a: vxorps xmm1, xmm0, xmmword ptr [rip + 0x97c1ce] ; 0x100aa7900
0x10012b732: vxorps xmm0, xmm0, xmm0
0x10012b736: vmaxss xmm1, xmm0, xmm1
0x10012b73a: vmovss xmm3, dword ptr [rip + 0x97997e] ; 0x100aa50c0
0x10012b742: vminss xmm1, xmm3, xmm1
0x10012b746: vmovss xmm4, dword ptr [rip + 0x97c0a6] ; 0x100aa77f4
0x10012b74e: vmovss xmm5, dword ptr [rip + 0x97f452] ; 0x100aaaba8
0x10012b756: vucomiss xmm4, xmm1
0x10012b75a: jbe 0x10012b9b4
0x10012b760: vmovss xmm6, dword ptr [rip + 0x97cea0] ; 0x100aa8608
0x10012b768: vmovss xmm10, dword ptr [rip + 0x97f7ac] ; 0x100aaaf1c
0x10012b770: vmovss xmm8, dword ptr [rip + 0x97d23c] ; 0x100aa89b4
0x10012b778: vxorps xmm2, xmm2, xmm2
0x10012b77c: vmovaps xmm9, xmm5
0x10012b780: vxorps xmm7, xmm7, xmm7
0x10012b784: vsubss xmm3, xmm4, xmm2
0x10012b788: vucomiss xmm3, xmm0
0x10012b78c: jbe 0x10012b796
0x10012b78e: vsubss xmm0, xmm1, xmm2
0x10012b792: vdivss xmm0, xmm0, xmm3
0x10012b796: vxorps xmm1, xmm1, xmm1
0x10012b79a: vmaxss xmm0, xmm1, xmm0
0x10012b79e: vmovss xmm2, dword ptr [rip + 0x97991a] ; 0x100aa50c0
0x10012b7a6: vminss xmm1, xmm2, xmm0
0x10012b7aa: vsubss xmm2, xmm2, xmm1
0x10012b7ae: vmulss xmm0, xmm6, xmm2
0x10012b7b2: vmulss xmm3, xmm10, xmm1
0x10012b7b6: vaddss xmm0, xmm3, xmm0
0x10012b7ba: vmovaps xmmword ptr [rsp + 0x40], xmm0
0x10012b7c0: vmulss xmm0, xmm5, xmm2
0x10012b7c4: vmulss xmm3, xmm9, xmm1
0x10012b7c8: vaddss xmm0, xmm3, xmm0
0x10012b7cc: vmulss xmm2, xmm7, xmm2
0x10012b7d0: vmulss xmm1, xmm8, xmm1
0x10012b7d4: vaddss xmm1, xmm1, xmm2
0x10012b7d8: vmovaps xmmword ptr [rsp], xmm1
0x10012b7dd: mov rdi, qword ptr [r13 + 0x70]
0x10012b7e1: call 0x100155a90 ; 0x100155a90
0x10012b7e6: vmovss xmm0, dword ptr [r12 + 0x398]
0x10012b7f0: vmovss xmm1, dword ptr [r12 + 0x39c]
0x10012b7fa: vmovaps xmm3, xmmword ptr [rsp]
0x10012b7ff: vmaxss xmm2, xmm3, xmm0
0x10012b803: vcmpunordss xmm0, xmm0, xmm0
0x10012b808: vblendvps xmm0, xmm2, xmm3, xmm0
0x10012b80e: vmovss dword ptr [r12 + 0x398], xmm0
0x10012b818: vcmpunordss xmm0, xmm1, xmm1
0x10012b81d: vmovss xmm3, dword ptr [rip + 0x97989b] ; 0x100aa50c0
0x10012b825: vandps xmm2, xmm0, xmm3
0x10012b829: vmaxss xmm1, xmm3, xmm1
0x10012b82d: vandnps xmm0, xmm0, xmm1
0x10012b831: vorps xmm0, xmm0, xmm2
0x10012b835: vmovss dword ptr [r12 + 0x39c], xmm0
0x10012b83f: vmovaps xmm2, xmmword ptr [rsp + 0x40]
0x10012b845: vpermilps xmm0, xmm2, 0xc0
0x10012b84b: vxorps xmm1, xmm1, xmm1
0x10012b84f: vblendps xmm2, xmm1, xmm2, 1
0x10012b855: vblendps xmm3, xmm1, xmm0, 2
0x10012b85b: vblendps xmm0, xmm1, xmm0, 4
0x10012b861: vmovaps xmmword ptr [rsp + 0x580], xmm2
0x10012b86a: vmovaps xmmword ptr [rsp + 0x590], xmm3
0x10012b873: vmovaps xmmword ptr [rsp + 0x5a0], xmm0
0x10012b87c: vmovaps xmm0, xmmword ptr [rip + 0x97d17c] ; 0x100aa8a00
0x10012b884: vmovaps xmmword ptr [rsp + 0x5b0], xmm0
0x10012b88d: mov rbx, qword ptr [r13 + 0x18]
0x10012b891: mov rax, qword ptr [r13 + 0x20]
0x10012b895: mov rsi, qword ptr [rax + 0x288]
0x10012b89c: lea rdi, [rsp + 0xb0]
0x10012b8a4: call 0x1007f26b0 ; 0x1007f26b0
0x10012b8a9: vmovaps xmm0, xmmword ptr [rbx + 0x10]
0x10012b8ae: vaddps xmm0, xmm0, xmmword ptr [rsp + 0xb0]
0x10012b8b7: vmulps xmm0, xmm0, xmmword ptr [rip + 0x97bdb1] ; 0x100aa7670
0x10012b8bf: vmovss xmm1, dword ptr [rip + 0x9797f9] ; 0x100aa50c0
0x10012b8c7: vinsertps xmm0, xmm0, xmm1, 0x30
0x10012b8cd: vmovaps xmmword ptr [rsp + 0x5b0], xmm0
0x10012b8d6: mov rdi, qword ptr [r12 + 0x1070]
0x10012b8de: lea rsi, [rsp + 0x580]
0x10012b8e6: call 0x1003ec480 ; 0x1003ec480
0x10012b8eb: vmovss xmm0, dword ptr [rip + 0x9797d1] ; 0x100aa50c4
0x10012b8f3: vucomiss xmm0, dword ptr [r12 + 0x1068]
0x10012b8fd: jb 0x10012bd08
0x10012b903: mov byte ptr [r13 + 0x21b6], 0
0x10012b90b: mov dword ptr [r12 + 0x1068], 0
0x10012b917: mov byte ptr [r12 + 0x1065], 0
0x10012b920: cmp byte ptr [r12 + 0x1064], 0
0x10012b929: jne 0x10012bd17
0x10012b92f: cmp byte ptr [r12 + 0x1065], 0
0x10012b938: jne 0x10012bd17
0x10012b93e: mov rsi, qword ptr [r12 + 0x1070]
0x10012b946: test rsi, rsi
0x10012b949: je 0x10012bd17
0x10012b94f: mov rdi, qword ptr [rbp + 0xa0]
0x10012b956: call 0x1003edde0 ; 0x1003edde0
0x10012b95b: mov qword ptr [r12 + 0x1070], 0
0x10012b967: jmp 0x10012bd17 ; 0x10012bd17
0x10012b96c: vmovss xmm3, dword ptr [rip + 0x97b780] ; 0x100aa70f4
0x10012b974: vmovss dword ptr [rsp + 0x84], xmm3
0x10012b97d: vucomiss xmm3, xmm1
0x10012b981: jbe 0x10012ba09
0x10012b987: vmovss xmm6, dword ptr [rip + 0x979735] ; 0x100aa50c4
0x10012b98f: vmovss xmm4, dword ptr [rip + 0x97f585] ; 0x100aaaf1c
0x10012b997: vmovss xmm2, dword ptr [rip + 0x97f209] ; 0x100aaaba8
0x10012b99f: vmovss xmm3, dword ptr [rip + 0x97fe95] ; 0x100aab83c
0x10012b9a7: vmovss xmm5, dword ptr [rip + 0x97be45] ; 0x100aa77f4
0x10012b9af: jmp 0x10012bb6e ; 0x10012bb6e
0x10012b9b4: vmovss xmm4, dword ptr [rip + 0x97b738] ; 0x100aa70f4
0x10012b9bc: vucomiss xmm4, xmm1
0x10012b9c0: jbe 0x10012ba62
0x10012b9c6: vmovss xmm7, dword ptr [rip + 0x97cfe6] ; 0x100aa89b4
0x10012b9ce: vmovss xmm6, dword ptr [rip + 0x97f546] ; 0x100aaaf1c
0x10012b9d6: vmovss xmm10, dword ptr [rip + 0x97fe62] ; 0x100aab840
0x10012b9de: vmovss xmm9, dword ptr [rip + 0x9796de] ; 0x100aa50c4
0x10012b9e6: vmovss xmm8, dword ptr [rip + 0x97cc1a] ; 0x100aa8608
0x10012b9ee: vmovss xmm2, dword ptr [rip + 0x97bdfe] ; 0x100aa77f4
0x10012b9f6: vsubss xmm3, xmm4, xmm2
0x10012b9fa: vucomiss xmm3, xmm0
0x10012b9fe: ja 0x10012b78e
0x10012ba04: jmp 0x10012b796 ; 0x10012b796
0x10012ba09: vmovss xmm3, dword ptr [rip + 0x97cc1f] ; 0x100aa8630
0x10012ba11: vmovss xmm2, dword ptr [rip + 0x97f18f] ; 0x100aaaba8
0x10012ba19: vmovss dword ptr [rsp + 0x84], xmm3
0x10012ba22: vucomiss xmm3, xmm1
0x10012ba26: jbe 0x10012babb
0x10012ba2c: vmovss xmm8, dword ptr [rip + 0x97fe08] ; 0x100aab83c
0x10012ba34: vmovss xmm4, dword ptr [rip + 0x97cb94] ; 0x100aa85d0
0x10012ba3c: vmovss xmm3, dword ptr [rip + 0x97bda4] ; 0x100aa77e8
0x10012ba44: vmovaps xmmword ptr [rsp + 0x200], xmm3
0x10012ba4d: vxorps xmm3, xmm3, xmm3
0x10012ba51: vmovss xmm5, dword ptr [rip + 0x97b69b] ; 0x100aa70f4
0x10012ba59: vmovaps xmm6, xmm2
0x10012ba5d: jmp 0x10012bb6e ; 0x10012bb6e
0x10012ba62: vmovss xmm4, dword ptr [rip + 0x97cbc6] ; 0x100aa8630
0x10012ba6a: vucomiss xmm4, xmm1
0x10012ba6e: jbe 0x10012baed
0x10012ba70: vmovss xmm7, dword ptr [rip + 0x97cb90] ; 0x100aa8608
0x10012ba78: vmovss xmm5, dword ptr [rip + 0x979644] ; 0x100aa50c4
0x10012ba80: vmovss xmm6, dword ptr [rip + 0x97fdb8] ; 0x100aab840
0x10012ba88: vmovss xmm10, dword ptr [rip + 0x97cb40] ; 0x100aa85d0
0x10012ba90: vmovss xmm9, dword ptr [rip + 0x97cbf8] ; 0x100aa8690
0x10012ba98: vmovss xmm8, dword ptr [rip + 0x97bd48] ; 0x100aa77e8
0x10012baa0: vmovss xmm2, dword ptr [rip + 0x97b64c] ; 0x100aa70f4
0x10012baa8: vsubss xmm3, xmm4, xmm2
0x10012baac: vucomiss xmm3, xmm0
0x10012bab0: ja 0x10012b78e
0x10012bab6: jmp 0x10012b796 ; 0x10012b796
0x10012babb: vucomiss xmm6, xmm1
0x10012babf: jbe 0x10012bb3f
0x10012bac1: vmovss xmm4, dword ptr [rip + 0x97bd1f] ; 0x100aa77e8
0x10012bac9: vxorps xmm3, xmm3, xmm3
0x10012bacd: vmovss xmm5, dword ptr [rip + 0x97cb5b] ; 0x100aa8630
0x10012bad5: vxorps xmm7, xmm7, xmm7
0x10012bad9: vmovaps xmmword ptr [rsp + 0x200], xmm7
0x10012bae2: vmovss dword ptr [rsp + 0x84], xmm6
0x10012baeb: jmp 0x10012bb65 ; 0x10012bb65
0x10012baed: vmovss xmm9, dword ptr [rip + 0x97cb9b] ; 0x100aa8690
0x10012baf5: vucomiss xmm3, xmm1
0x10012baf9: jbe 0x10012bd3a
0x10012baff: vmovss xmm7, dword ptr [rip + 0x97bce1] ; 0x100aa77e8
0x10012bb07: vmovss xmm6, dword ptr [rip + 0x97cac1] ; 0x100aa85d0
0x10012bb0f: vmovss xmm10, dword ptr [rip + 0x97caf1] ; 0x100aa8608
0x10012bb17: vxorps xmm8, xmm8, xmm8
0x10012bb1c: vmovss xmm2, dword ptr [rip + 0x97cb0c] ; 0x100aa8630
0x10012bb24: vmovaps xmm4, xmm3
0x10012bb28: vmovaps xmm5, xmm9
0x10012bb2c: vsubss xmm3, xmm4, xmm2
0x10012bb30: vucomiss xmm3, xmm0
0x10012bb34: ja 0x10012b78e
0x10012bb3a: jmp 0x10012b796 ; 0x10012b796
0x10012bb3f: vxorps xmm3, xmm3, xmm3
0x10012bb43: vmovss xmm5, dword ptr [rip + 0x979575] ; 0x100aa50c0
0x10012bb4b: vxorps xmm4, xmm4, xmm4
0x10012bb4f: vmovaps xmmword ptr [rsp + 0x200], xmm4
0x10012bb58: vmovss dword ptr [rsp + 0x84], xmm5
0x10012bb61: vxorps xmm4, xmm4, xmm4
0x10012bb65: vmovaps xmm6, xmm2
0x10012bb69: vxorps xmm8, xmm8, xmm8
0x10012bb6e: vmovss xmm7, dword ptr [rsp + 0x84]
0x10012bb77: vsubss xmm7, xmm7, xmm5
0x10012bb7b: vucomiss xmm7, xmm0
0x10012bb7f: jbe 0x10012bb89
0x10012bb81: vsubss xmm0, xmm1, xmm5
0x10012bb85: vdivss xmm0, xmm0, xmm7
0x10012bb89: vxorps xmm1, xmm1, xmm1
0x10012bb8d: vmaxss xmm0, xmm1, xmm0
0x10012bb91: vmovss xmm5, dword ptr [rip + 0x979527] ; 0x100aa50c0
0x10012bb99: vminss xmm1, xmm5, xmm0
0x10012bb9d: vsubss xmm5, xmm5, xmm1
0x10012bba1: vmulss xmm0, xmm4, xmm5
0x10012bba5: vmulss xmm4, xmm1, dword ptr [rsp + 0x200]
0x10012bbae: vaddss xmm0, xmm4, xmm0
0x10012bbb2: vmovaps xmmword ptr [rsp + 0x40], xmm0
0x10012bbb8: vmulss xmm0, xmm6, xmm5
0x10012bbbc: vmulss xmm4, xmm2, xmm1
0x10012bbc0: vaddss xmm0, xmm4, xmm0
0x10012bbc4: vmulss xmm2, xmm8, xmm5
0x10012bbc8: vmulss xmm1, xmm3, xmm1
0x10012bbcc: vaddss xmm1, xmm1, xmm2
0x10012bbd0: vmovaps xmmword ptr [rsp], xmm1
0x10012bbd5: mov rdi, qword ptr [r13 + 0x70]
0x10012bbd9: call 0x100155a90 ; 0x100155a90
0x10012bbde: vmovss xmm0, dword ptr [r12 + 0x398]
0x10012bbe8: vmovss xmm1, dword ptr [r12 + 0x39c]
0x10012bbf2: vmovaps xmm3, xmmword ptr [rsp]
0x10012bbf7: vmaxss xmm2, xmm3, xmm0
0x10012bbfb: vcmpunordss xmm0, xmm0, xmm0
0x10012bc00: vblendvps xmm0, xmm2, xmm3, xmm0
0x10012bc06: vmovss dword ptr [r12 + 0x398], xmm0
0x10012bc10: vcmpunordss xmm0, xmm1, xmm1
0x10012bc15: vmovss xmm3, dword ptr [rip + 0x9794a3] ; 0x100aa50c0
0x10012bc1d: vandps xmm2, xmm0, xmm3
0x10012bc21: vmaxss xmm1, xmm3, xmm1
0x10012bc25: vandnps xmm0, xmm0, xmm1
0x10012bc29: vorps xmm0, xmm0, xmm2
0x10012bc2d: vmovss dword ptr [r12 + 0x39c], xmm0
0x10012bc37: vmovaps xmm2, xmmword ptr [rsp + 0x40]
0x10012bc3d: vpermilps xmm0, xmm2, 0xc0
0x10012bc43: vxorps xmm1, xmm1, xmm1
0x10012bc47: vblendps xmm2, xmm1, xmm2, 1
0x10012bc4d: vblendps xmm3, xmm1, xmm0, 2
0x10012bc53: vblendps xmm0, xmm1, xmm0, 4
0x10012bc59: vmovaps xmmword ptr [rsp + 0x580], xmm2
0x10012bc62: vmovaps xmmword ptr [rsp + 0x590], xmm3
0x10012bc6b: vmovaps xmmword ptr [rsp + 0x5a0], xmm0
0x10012bc74: vmovaps xmm0, xmmword ptr [rip + 0x97cd84] ; 0x100aa8a00
0x10012bc7c: vmovaps xmmword ptr [rsp + 0x5b0], xmm0
0x10012bc85: mov rbx, qword ptr [r13 + 0x18]
0x10012bc89: mov rax, qword ptr [r13 + 0x20]
0x10012bc8d: mov rsi, qword ptr [rax + 0x288]
0x10012bc94: lea rdi, [rsp + 0xb0]
0x10012bc9c: call 0x1007f26b0 ; 0x1007f26b0
0x10012bca1: vmovaps xmm0, xmmword ptr [rbx + 0x10]
0x10012bca6: vaddps xmm0, xmm0, xmmword ptr [rsp + 0xb0]
0x10012bcaf: vmulps xmm0, xmm0, xmmword ptr [rip + 0x97b9b9] ; 0x100aa7670
0x10012bcb7: vmovss xmm1, dword ptr [rip + 0x979401] ; 0x100aa50c0
0x10012bcbf: vinsertps xmm0, xmm0, xmm1, 0x30
0x10012bcc5: vmovaps xmmword ptr [rsp + 0x5b0], xmm0
0x10012bcce: mov rdi, qword ptr [r12 + 0x1070]
0x10012bcd6: lea rsi, [rsp + 0x580]
0x10012bcde: call 0x1003ec480 ; 0x1003ec480
0x10012bce3: vxorps xmm0, xmm0, xmm0
0x10012bce7: vucomiss xmm0, dword ptr [r12 + 0x1068]
0x10012bcf1: jb 0x10012bd08
0x10012bcf3: mov dword ptr [r12 + 0x1068], 0
0x10012bcff: mov byte ptr [r12 + 0x1064], 0
0x10012bd08: cmp byte ptr [r12 + 0x1064], 0
0x10012bd11: je 0x10012b92f
0x10012bd17: mov rax, qword ptr [rip + 0xae1bba] ; 0x100c0d8d8
0x10012bd1e: mov rax, qword ptr [rax]
0x10012bd21: cmp rax, qword ptr [rsp + 0xe00]
0x10012bd29: jne 0x10012bd60
0x10012bd2b: lea rsp, [rbp - 0x28]
0x10012bd2f: pop rbx
0x10012bd30: pop r12
0x10012bd32: pop r13
0x10012bd34: pop r14
0x10012bd36: pop r15
0x10012bd38: pop rbp
0x10012bd39: ret 
0x10012bd3a: vmovss xmm10, dword ptr [rip + 0x97c8c6] ; 0x100aa8608
0x10012bd42: vxorps xmm8, xmm8, xmm8
0x10012bd47: vmovss xmm2, dword ptr [rip + 0x979371] ; 0x100aa50c0
0x10012bd4f: vmovaps xmm4, xmm2
0x10012bd53: vmovaps xmm6, xmm10
0x10012bd57: vmovaps xmm5, xmm9
0x10012bd5b: jmp 0x10012b780 ; 0x10012b780
0x10012bd60: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10012bd65: lea rdi, [rip + 0xa4870a] ; 0x100b74476 !isNan( quat )
0x10012bd6c: lea rsi, [rip + 0xa48712] ; 0x100b74485 ./Emitter.h
0x10012bd73: mov edx, 0x26
0x10012bd78: mov ecx, 3
0x10012bd7d: vzeroupper 
0x10012bd80: call 0x1007e5f70 ; 0x1007e5f70
0x10012bd85: ud2 
0x10012bd87: nop word ptr [rax + rax]
