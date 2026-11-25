0x100721ce0: push rbp
0x100721ce1: mov rbp, rsp
0x100721ce4: push r15
0x100721ce6: push r14
0x100721ce8: push r13
0x100721cea: push r12
0x100721cec: push rbx
0x100721ced: sub rsp, 0x348
0x100721cf4: mov r12, r8
0x100721cf7: mov r15, rsi
0x100721cfa: mov rax, qword ptr [rip + 0x4ebbd7] ; 0x100c0d8d8
0x100721d01: mov rax, qword ptr [rax]
0x100721d04: mov qword ptr [rbp - 0x30], rax
0x100721d08: vstmxcsr dword ptr [rbp - 0x70]
0x100721d0d: mov eax, dword ptr [rbp - 0x70]
0x100721d10: mov dword ptr [rbp - 0xd4], eax
0x100721d16: or eax, 0xe040
0x100721d1b: mov dword ptr [rbp - 0xb0], eax
0x100721d21: vldmxcsr dword ptr [rbp - 0xb0]
0x100721d29: cmp byte ptr [rip + 0x191a160], 0 ; 0x10203be90
0x100721d30: jne 0x100722cae
0x100721d36: mov rax, qword ptr [rdi + 0x10]
0x100721d3a: test rax, rax
0x100721d3d: je 0x100722cae
0x100721d43: cmp dword ptr [rdi + 0x218], 0
0x100721d4a: mov bl, byte ptr [rip + 0x191a1b8] ; 0x10203bf08
0x100721d50: jne 0x100721d5b
0x100721d52: cmp bl, 1
0x100721d55: jne 0x100722cae
0x100721d5b: mov byte ptr [rbp - 0xc1], bl
0x100721d61: mov qword ptr [rbp - 0x118], rdi
0x100721d68: mov qword ptr [rbp - 0xd0], rdx
0x100721d6f: mov dword ptr [rbp - 0xc8], ecx
0x100721d75: and ecx, 0xfffffffc
0x100721d78: mov qword ptr [rbp - 0x120], rcx
0x100721d7f: je 0x100722876
0x100721d85: vmovupd xmm0, xmmword ptr [rax + 0x140]
0x100721d8d: vmovupd xmm1, xmmword ptr [rax + 0x150]
0x100721d95: vmovupd xmm2, xmmword ptr [rax + 0x160]
0x100721d9d: vmovupd xmm3, xmmword ptr [rax + 0x170]
0x100721da5: vbroadcastss xmm4, dword ptr [rax + 0x180]
0x100721dae: vmovaps xmmword ptr [rbp - 0x260], xmm4
0x100721db6: vbroadcastss xmm4, dword ptr [rax + 0x194]
0x100721dbf: vmovaps xmmword ptr [rbp - 0x250], xmm4
0x100721dc7: vbroadcastss xmm4, dword ptr [rax + 0x1a8]
0x100721dd0: vmovaps xmmword ptr [rbp - 0x180], xmm4
0x100721dd8: vbroadcastss xmm4, dword ptr [rax + 0x1b8]
0x100721de1: vmovaps xmmword ptr [rbp - 0x170], xmm4
0x100721de9: vmovddup xmm4, xmm0
0x100721ded: vpermilps xmm5, xmm4, 0
0x100721df3: vmovaps xmmword ptr [rbp - 0x240], xmm5
0x100721dfb: vmovddup xmm5, xmm1
0x100721dff: vpermilps xmm6, xmm5, 0
0x100721e05: vmovaps xmmword ptr [rbp - 0x230], xmm6
0x100721e0d: vmovddup xmm6, xmm2
0x100721e11: vpermilps xmm7, xmm6, 0
0x100721e17: vmovaps xmmword ptr [rbp - 0x220], xmm7
0x100721e1f: vpermilps xmm4, xmm4, 0x55
0x100721e25: vmovaps xmmword ptr [rbp - 0x210], xmm4
0x100721e2d: vpermilps xmm4, xmm5, 0x55
0x100721e33: vmovaps xmmword ptr [rbp - 0x200], xmm4
0x100721e3b: vpermilps xmm4, xmm6, 0x55
0x100721e41: vmovaps xmmword ptr [rbp - 0x1f0], xmm4
0x100721e49: vpermilps xmm0, xmm0, 0xaa
0x100721e4f: vmovaps xmmword ptr [rbp - 0x1e0], xmm0
0x100721e57: vpermilps xmm0, xmm1, 0xaa
0x100721e5d: vmovaps xmmword ptr [rbp - 0x1d0], xmm0
0x100721e65: vpermilps xmm0, xmm2, 0xaa
0x100721e6b: vmovaps xmmword ptr [rbp - 0x1c0], xmm0
0x100721e73: vmovddup xmm0, xmm3
0x100721e77: vpermilps xmm1, xmm0, 0
0x100721e7d: vmovaps xmmword ptr [rbp - 0x1b0], xmm1
0x100721e85: vpermilps xmm0, xmm0, 0x55
0x100721e8b: vmovaps xmmword ptr [rbp - 0x1a0], xmm0
0x100721e93: vpermilps xmm0, xmm3, 0xaa
0x100721e99: vmovaps xmmword ptr [rbp - 0x190], xmm0
0x100721ea1: mov eax, dword ptr [rbp - 0x120]
0x100721ea7: mov qword ptr [rbp - 0x148], rax
0x100721eae: xor r11d, r11d
0x100721eb1: xor r13d, r13d
0x100721eb4: vmovdqa xmm9, xmmword ptr [rip + 0x38f744] ; 0x100ab1600
0x100721ebc: nop dword ptr [rax]
0x100721ec0: mov rdx, r13
0x100721ec3: shl rdx, 4
0x100721ec7: mov rax, rdx
0x100721eca: mov rcx, rdx
0x100721ecd: vmovss xmm0, dword ptr [r15 + rdx]
0x100721ed3: vmovss xmm1, dword ptr [r15 + rdx + 4]
0x100721eda: vmovss xmm2, dword ptr [r15 + rdx + 8]
0x100721ee1: mov rsi, qword ptr [rbp - 0xd0]
0x100721ee8: vmovss xmm3, dword ptr [rsi + rdx]
0x100721eed: vmovss xmm4, dword ptr [rsi + rdx + 4]
0x100721ef3: vmovss xmm5, dword ptr [rsi + rdx + 8]
0x100721ef9: or rdx, 0x10
0x100721efd: or rax, 0x20
0x100721f01: or rcx, 0x30
0x100721f05: vinsertps xmm0, xmm0, dword ptr [r15 + rdx], 0x10
0x100721f0c: vinsertps xmm0, xmm0, dword ptr [r15 + rax], 0x20
0x100721f13: vinsertps xmm6, xmm0, dword ptr [r15 + rcx], 0x30
0x100721f1a: vinsertps xmm1, xmm1, dword ptr [r15 + rdx + 4], 0x10
0x100721f22: vinsertps xmm1, xmm1, dword ptr [r15 + rax + 4], 0x20
0x100721f2a: vinsertps xmm7, xmm1, dword ptr [r15 + rcx + 4], 0x30
0x100721f32: vinsertps xmm2, xmm2, dword ptr [r15 + rdx + 8], 0x10
0x100721f3a: vinsertps xmm2, xmm2, dword ptr [r15 + rax + 8], 0x20
0x100721f42: vinsertps xmm13, xmm2, dword ptr [r15 + rcx + 8], 0x30
0x100721f4a: vinsertps xmm3, xmm3, dword ptr [rsi + rdx], 0x10
0x100721f51: vinsertps xmm3, xmm3, dword ptr [rsi + rax], 0x20
0x100721f58: vinsertps xmm14, xmm3, dword ptr [rsi + rcx], 0x30
0x100721f5f: vinsertps xmm4, xmm4, dword ptr [rsi + rdx + 4], 0x10
0x100721f67: vinsertps xmm4, xmm4, dword ptr [rsi + rax + 4], 0x20
0x100721f6f: vinsertps xmm15, xmm4, dword ptr [rsi + rcx + 4], 0x30
0x100721f77: vinsertps xmm5, xmm5, dword ptr [rsi + rdx + 8], 0x10
0x100721f7f: vinsertps xmm5, xmm5, dword ptr [rsi + rax + 8], 0x20
0x100721f87: vinsertps xmm10, xmm5, dword ptr [rsi + rcx + 8], 0x30
0x100721f8f: vmovaps xmm0, xmmword ptr [rbp - 0x240]
0x100721f97: vmovaps xmm1, xmm6
0x100721f9b: vmovaps xmmword ptr [rbp - 0xf0], xmm1
0x100721fa3: vmulps xmm6, xmm0, xmm1
0x100721fa7: vmovaps xmm2, xmmword ptr [rbp - 0x230]
0x100721faf: vmovaps xmm4, xmm7
0x100721fb3: vmovaps xmmword ptr [rbp - 0x100], xmm4
0x100721fbb: vmulps xmm8, xmm2, xmm4
0x100721fbf: vmovaps xmm3, xmmword ptr [rbp - 0x220]
0x100721fc7: vmulps xmm12, xmm3, xmm13
0x100721fcc: vmovaps xmm5, xmmword ptr [rbp - 0x210]
0x100721fd4: vmulps xmm1, xmm5, xmm1
0x100721fd8: vmovaps xmmword ptr [rbp - 0x140], xmm1
0x100721fe0: vmovaps xmm7, xmmword ptr [rbp - 0x200]
0x100721fe8: vmulps xmm1, xmm7, xmm4
0x100721fec: vmovaps xmmword ptr [rbp - 0x110], xmm1
0x100721ff4: vmulps xmm1, xmm0, xmm14
0x100721ff9: vmulps xmm2, xmm2, xmm15
0x100721ffe: vmulps xmm3, xmm3, xmm10
0x100722003: vminps xmm4, xmm6, xmm1
0x100722007: vminps xmm11, xmm8, xmm2
0x10072200b: vaddps xmm4, xmm4, xmm11
0x100722010: vminps xmm0, xmm12, xmm3
0x100722014: vaddps xmm0, xmm4, xmm0
0x100722018: vmovaps xmmword ptr [rbp - 0x130], xmm0
0x100722020: vmovaps xmm0, xmmword ptr [rbp - 0x1f0]
0x100722028: vmulps xmm11, xmm0, xmm13
0x10072202d: vmovaps xmmword ptr [rbp - 0x280], xmm11
0x100722035: vmaxps xmm1, xmm6, xmm1
0x100722039: vmulps xmm6, xmm5, xmm14
0x10072203e: vmaxps xmm2, xmm8, xmm2
0x100722042: vmulps xmm7, xmm7, xmm15
0x100722047: vaddps xmm1, xmm1, xmm2
0x10072204b: vmulps xmm4, xmm0, xmm10
0x100722050: vmaxps xmm3, xmm12, xmm3
0x100722054: vaddps xmm0, xmm1, xmm3
0x100722058: vmovaps xmmword ptr [rbp - 0x290], xmm0
0x100722060: vmovaps xmm1, xmmword ptr [rbp - 0x140]
0x100722068: vminps xmm3, xmm1, xmm6
0x10072206c: vmovaps xmm2, xmmword ptr [rbp - 0x110]
0x100722074: vminps xmm0, xmm2, xmm7
0x100722078: vaddps xmm0, xmm3, xmm0
0x10072207c: vminps xmm3, xmm11, xmm4
0x100722080: vaddps xmm0, xmm0, xmm3
0x100722084: vmovaps xmmword ptr [rbp - 0x270], xmm0
0x10072208c: vmaxps xmm8, xmm1, xmm6
0x100722090: vmovaps xmm5, xmmword ptr [rbp - 0x1e0]
0x100722098: vmulps xmm6, xmm5, xmmword ptr [rbp - 0xf0]
0x1007220a0: vmovaps xmm0, xmmword ptr [rbp - 0x1d0]
0x1007220a8: vmulps xmm3, xmm0, xmmword ptr [rbp - 0x100]
0x1007220b0: vmovaps xmm1, xmmword ptr [rbp - 0x1c0]
0x1007220b8: vmulps xmm12, xmm1, xmm13
0x1007220bd: vmulps xmm14, xmm5, xmm14
0x1007220c2: vmulps xmm15, xmm0, xmm15
0x1007220c7: vmulps xmm13, xmm1, xmm10
0x1007220cc: vmovaps xmm0, xmmword ptr [rbp - 0x1b0]
0x1007220d4: vaddps xmm10, xmm0, xmmword ptr [rbp - 0x130]
0x1007220dc: vaddps xmm11, xmm0, xmmword ptr [rbp - 0x290]
0x1007220e4: vmovaps xmm1, xmmword ptr [rbp - 0x1a0]
0x1007220ec: vaddps xmm5, xmm1, xmmword ptr [rbp - 0x270]
0x1007220f4: vmaxps xmm0, xmm2, xmm7
0x1007220f8: vaddps xmm0, xmm8, xmm0
0x1007220fc: vmovaps xmm2, xmmword ptr [rbp - 0x280]
0x100722104: vmaxps xmm2, xmm2, xmm4
0x100722108: vaddps xmm0, xmm0, xmm2
0x10072210c: vaddps xmm8, xmm1, xmm0
0x100722110: vmaxps xmm0, xmm6, xmm14
0x100722115: vmaxps xmm2, xmm3, xmm15
0x10072211a: vaddps xmm0, xmm0, xmm2
0x10072211e: vmaxps xmm2, xmm12, xmm13
0x100722123: vaddps xmm0, xmm0, xmm2
0x100722127: vmovaps xmm2, xmmword ptr [rbp - 0x190]
0x10072212f: vaddps xmm4, xmm2, xmm0
0x100722133: vminps xmm0, xmm6, xmm14
0x100722138: vminps xmm1, xmm3, xmm15
0x10072213d: vaddps xmm0, xmm0, xmm1
0x100722141: vminps xmm1, xmm12, xmm13
0x100722146: vmovaps xmm3, xmm5
0x10072214a: vaddps xmm0, xmm0, xmm1
0x10072214e: vaddps xmm0, xmm2, xmm0
0x100722152: vxorps xmm14, xmm14, xmm14
0x100722157: vcmpltps xmm1, xmm14, xmm0
0x10072215c: vmovaps xmm5, xmmword ptr [rbp - 0x260]
0x100722164: vmovaps xmmword ptr [rbp - 0x100], xmm11
0x10072216c: vmulps xmm12, xmm5, xmm11
0x100722171: vcmpltps xmm2, xmm12, xmm0
0x100722176: vorps xmm1, xmm1, xmm2
0x10072217a: vmovaps xmm6, xmmword ptr [rbp - 0x250]
0x100722182: vmulps xmm13, xmm6, xmm8
0x100722187: vcmpltps xmm7, xmm13, xmm0
0x10072218c: vmovaps xmmword ptr [rbp - 0x110], xmm10
0x100722194: vmulps xmm2, xmm5, xmm10
0x100722199: vxorps xmm0, xmm0, xmmword ptr [rip + 0x38575f] ; 0x100aa7900
0x1007221a1: vcmpltps xmm5, xmm0, xmm2
0x1007221a6: vorps xmm5, xmm7, xmm5
0x1007221aa: vorps xmm1, xmm1, xmm5
0x1007221ae: vmovaps xmm10, xmm3
0x1007221b2: vmulps xmm7, xmm6, xmm3
0x1007221b6: vcmpltps xmm5, xmm0, xmm7
0x1007221bb: vorps xmm15, xmm1, xmm5
0x1007221bf: vcmpltps xmm14, xmm14, xmm4
0x1007221c4: vorps xmm3, xmm15, xmm14
0x1007221c9: vpshufd xmm1, xmm3, 0xee
0x1007221ce: vpand xmm1, xmm3, xmm1
0x1007221d2: vmovd eax, xmm1
0x1007221d6: vpextrd ecx, xmm1, 1
0x1007221dc: test eax, ecx
0x1007221de: je 0x100722220
0x1007221e0: lea rax, [r12 + r13*4]
0x1007221e4: vandnps xmm0, xmm15, xmm14
0x1007221e9: vpslld xmm0, xmm0, 0x1f
0x1007221ee: vpsrad xmm0, xmm0, 0x1f
0x1007221f3: test al, 0xf
0x1007221f5: je 0x1007227b0
0x1007221fb: vmovdqu xmmword ptr [rax], xmm0
0x1007221ff: add r13, 4
0x100722203: cmp r13, qword ptr [rbp - 0x148]
0x10072220a: jb 0x100721ec0
0x100722210: jmp 0x100722876 ; 0x100722876
0x100722215: nop word ptr cs:[rax + rax]
0x100722220: vmovaps xmm11, xmmword ptr [rbp - 0x100]
0x100722228: cmp byte ptr [rbp - 0xc1], 0
0x10072222f: jne 0x1007227ca
0x100722235: vxorps xmm1, xmm4, xmmword ptr [rip + 0x3856c3] ; 0x100aa7900
0x10072223d: vrcpps xmm1, xmm1
0x100722241: vmulps xmm5, xmm1, xmm4
0x100722245: vmovaps xmmword ptr [rbp - 0xf0], xmm3
0x10072224d: vmovaps xmm3, xmmword ptr [rip + 0x396feb] ; 0x100ab9240
0x100722255: vaddps xmm5, xmm5, xmm3
0x100722259: vmulps xmm1, xmm1, xmm5
0x10072225d: vmulps xmm5, xmm1, xmm4
0x100722261: vaddps xmm5, xmm5, xmm3
0x100722265: vmulps xmm5, xmm1, xmm5
0x100722269: vrcpps xmm1, xmm0
0x10072226d: vmulps xmm6, xmm1, xmm0
0x100722271: vsubps xmm6, xmm3, xmm6
0x100722275: vmulps xmm1, xmm1, xmm6
0x100722279: vmulps xmm0, xmm1, xmm0
0x10072227d: vsubps xmm0, xmm3, xmm0
0x100722281: vmulps xmm6, xmm1, xmm0
0x100722285: vxorps xmm1, xmm1, xmm1
0x100722289: vcmpltps xmm0, xmm11, xmm1
0x10072228e: vblendvps xmm0, xmm5, xmm6, xmm0
0x100722294: vmulps xmm12, xmm12, xmm0
0x100722298: vmovaps xmm0, xmmword ptr [rbp - 0x110]
0x1007222a0: vcmpltps xmm0, xmm0, xmm1
0x1007222a5: vblendvps xmm0, xmm6, xmm5, xmm0
0x1007222ab: vmulps xmm11, xmm2, xmm0
0x1007222af: vcmpltps xmm0, xmm8, xmm1
0x1007222b4: vblendvps xmm0, xmm5, xmm6, xmm0
0x1007222ba: vmulps xmm8, xmm13, xmm0
0x1007222be: vcmpltps xmm2, xmm10, xmm1
0x1007222c3: vblendvps xmm2, xmm6, xmm5, xmm2
0x1007222c9: vmulps xmm2, xmm7, xmm2
0x1007222cd: vmulps xmm3, xmm4, xmmword ptr [rbp - 0x180]
0x1007222d5: vaddps xmm3, xmm3, xmmword ptr [rbp - 0x170]
0x1007222dd: vmulps xmm0, xmm3, xmm5
0x1007222e1: vmovaps xmmword ptr [rbp - 0x100], xmm0
0x1007222e9: vsubps xmm3, xmm12, xmm11
0x1007222ee: mov rdi, qword ptr [rbp - 0x118]
0x1007222f5: vbroadcastss xmm5, dword ptr [rdi + 0xd8]
0x1007222fe: vmovdqa xmm4, xmmword ptr [rip + 0x38678a] ; 0x100aa8a90
0x100722306: vpblendw xmm6, xmm5, xmm4, 0xaa
0x10072230c: vpsrld xmm5, xmm5, 0x10
0x100722311: vmovdqa xmm7, xmmword ptr [rip + 0x386787] ; 0x100aa8aa0
0x100722319: vpblendw xmm5, xmm5, xmm7, 0xaa
0x10072231f: vmovaps xmm0, xmmword ptr [rip + 0x386789] ; 0x100aa8ab0
0x100722327: vaddps xmm5, xmm5, xmm0
0x10072232b: vaddps xmm5, xmm6, xmm5
0x10072232f: vmulps xmm3, xmm5, xmm3
0x100722333: vbroadcastss xmm5, dword ptr [rdi + 0x128]
0x10072233c: vpblendw xmm6, xmm5, xmm4, 0xaa
0x100722342: vpsrld xmm5, xmm5, 0x10
0x100722347: vpblendw xmm5, xmm5, xmm7, 0xaa
0x10072234d: vaddps xmm5, xmm5, xmm0
0x100722351: vaddps xmm5, xmm6, xmm5
0x100722355: vsubps xmm6, xmm8, xmm2
0x100722359: vmulps xmm5, xmm5, xmm6
0x10072235d: vmaxps xmm3, xmm3, xmm5
0x100722361: vpsrad xmm3, xmm3, 0x17
0x100722366: vpaddq xmm3, xmm3, xmmword ptr [rip + 0x3b7532] ; 0x100ad98a0
0x10072236e: vpmaxsd xmm3, xmm3, xmm1
0x100722373: mov eax, dword ptr [rdi + 0x218]
0x100722379: dec eax
0x10072237b: vmovd xmm5, eax
0x10072237f: vpshufd xmm5, xmm5, 0
0x100722384: vpminsd xmm0, xmm3, xmm5
0x100722389: vmovd eax, xmm0
0x10072238d: cdqe 
0x10072238f: vpextrd ecx, xmm0, 1
0x100722395: movsxd rcx, ecx
0x100722398: vpextrd edx, xmm0, 2
0x10072239e: movsxd rdx, edx
0x1007223a1: vmovdqa xmmword ptr [rbp - 0x130], xmm0
0x1007223a9: vpextrd esi, xmm0, 3
0x1007223af: movsxd rsi, esi
0x1007223b2: vmovss xmm3, dword ptr [rdi + rax*4 + 0x178]
0x1007223bb: vinsertps xmm3, xmm3, dword ptr [rdi + rcx*4 + 0x178], 0x10
0x1007223c6: vinsertps xmm3, xmm3, dword ptr [rdi + rdx*4 + 0x178], 0x20
0x1007223d1: vinsertps xmm3, xmm3, dword ptr [rdi + rsi*4 + 0x178], 0x30
0x1007223dc: vmovaps xmm0, xmmword ptr [rip + 0x3872dc] ; 0x100aa96c0
0x1007223e4: vmovaps xmm6, xmm0
0x1007223e8: vmulps xmm4, xmm11, xmm6
0x1007223ec: vaddps xmm4, xmm4, xmm6
0x1007223f0: vmulps xmm4, xmm3, xmm4
0x1007223f4: vmulps xmm1, xmm12, xmm6
0x1007223f8: vaddps xmm1, xmm1, xmm6
0x1007223fc: vmulps xmm1, xmm3, xmm1
0x100722400: vmovss xmm3, dword ptr [rdi + rax*4 + 0x1c8]
0x100722409: vinsertps xmm3, xmm3, dword ptr [rdi + rcx*4 + 0x1c8], 0x10
0x100722414: vinsertps xmm3, xmm3, dword ptr [rdi + rdx*4 + 0x1c8], 0x20
0x10072241f: vinsertps xmm3, xmm3, dword ptr [rdi + rsi*4 + 0x1c8], 0x30
0x10072242a: vmulps xmm2, xmm2, xmm6
0x10072242e: vaddps xmm2, xmm2, xmm6
0x100722432: vmulps xmm5, xmm2, xmm3
0x100722436: vmulps xmm0, xmm8, xmm6
0x10072243a: vaddps xmm0, xmm0, xmm6
0x10072243e: vmulps xmm0, xmm0, xmm3
0x100722442: vmovd xmm2, dword ptr [rdi + rax*4 + 0xd8]
0x10072244b: vpinsrd xmm2, xmm2, dword ptr [rdi + rcx*4 + 0xd8], 1
0x100722456: vpinsrd xmm2, xmm2, dword ptr [rdi + rdx*4 + 0xd8], 2
0x100722461: vpinsrd xmm2, xmm2, dword ptr [rdi + rsi*4 + 0xd8], 3
0x10072246c: vcvtps2dq xmm3, xmm4
0x100722470: vcvtps2dq xmm1, xmm1
0x100722474: vpcmpeqd xmm4, xmm4, xmm4
0x100722478: vpaddd xmm2, xmm2, xmm4
0x10072247c: vpminsd xmm3, xmm3, xmm2
0x100722481: vmovdqa xmmword ptr [rbp - 0x110], xmm3
0x100722489: vpminsd xmm1, xmm1, xmm2
0x10072248e: vmovdqa xmmword ptr [rbp - 0x140], xmm1
0x100722496: vmovd xmm1, dword ptr [rdi + rax*4 + 0x128]
0x10072249f: vpinsrd xmm1, xmm1, dword ptr [rdi + rcx*4 + 0x128], 1
0x1007224aa: vpinsrd xmm1, xmm1, dword ptr [rdi + rdx*4 + 0x128], 2
0x1007224b5: vpinsrd xmm1, xmm1, dword ptr [rdi + rsi*4 + 0x128], 3
0x1007224c0: vcvtps2dq xmm3, xmm5
0x1007224c4: vcvtps2dq xmm0, xmm0
0x1007224c8: vpaddd xmm1, xmm1, xmm4
0x1007224cc: vpminsd xmm12, xmm3, xmm1
0x1007224d1: vmovaps xmm2, xmmword ptr [rbp - 0xf0]
0x1007224d9: vpminsd xmm0, xmm0, xmm1
0x1007224de: xor eax, eax
0x1007224e0: vmovaps xmmword ptr [rbp - 0x360], xmm2
0x1007224e8: mov ecx, eax
0x1007224ea: and ecx, 3
0x1007224ed: cmp dword ptr [rbp + rcx*4 - 0x360], 0
0x1007224f5: je 0x100722530
0x1007224f7: vmovdqa xmmword ptr [rbp - 0x350], xmm15
0x1007224ff: mov edx, eax
0x100722501: and edx, 3
0x100722504: mov ecx, dword ptr [rbp + rdx*4 - 0x350]
0x10072250b: not ecx
0x10072250d: vmovdqa xmmword ptr [rbp - 0x340], xmm14
0x100722515: and ecx, dword ptr [rbp + rdx*4 - 0x340]
0x10072251c: jmp 0x10072277c ; 0x10072277c
0x100722521: nop word ptr cs:[rax + rax]
0x100722530: vmovaps xmm11, xmm15
0x100722535: vmovaps xmm15, xmm14
0x10072253a: vpxor xmm1, xmm1, xmm1
0x10072253e: vpcmpgtd xmm4, xmm12, xmm1
0x100722542: vmovdqa xmm3, xmmword ptr [rbp - 0x140]
0x10072254a: vpcmpgtd xmm5, xmm3, xmm1
0x10072254e: vmovdqa xmm2, xmmword ptr [rbp - 0x110]
0x100722556: vpcmpgtd xmm6, xmm2, xmm1
0x10072255a: vmovdqa xmmword ptr [rbp - 0x2f0], xmm6
0x100722562: mov ecx, eax
0x100722564: and ecx, 3
0x100722567: vmovdqa xmmword ptr [rbp - 0x330], xmm2
0x10072256f: test byte ptr [rbp + rcx*4 - 0x2f0], 1
0x100722577: mov r8d, dword ptr [rbp + rcx*4 - 0x330]
0x10072257f: cmove r8d, r11d
0x100722583: vmovdqa xmmword ptr [rbp - 0x2e0], xmm5
0x10072258b: vmovdqa xmmword ptr [rbp - 0x320], xmm3
0x100722593: test byte ptr [rbp + rcx*4 - 0x2e0], 1
0x10072259b: mov r9d, dword ptr [rbp + rcx*4 - 0x320]
0x1007225a3: cmove r9d, r11d
0x1007225a7: vmovdqa xmmword ptr [rbp - 0x2d0], xmm4
0x1007225af: vmovdqa xmmword ptr [rbp - 0x310], xmm12
0x1007225b7: test byte ptr [rbp + rcx*4 - 0x2d0], 1
0x1007225bf: vpcmpgtd xmm4, xmm0, xmm1
0x1007225c3: mov r10d, dword ptr [rbp + rcx*4 - 0x310]
0x1007225cb: cmove r10d, r11d
0x1007225cf: vmovdqa xmmword ptr [rbp - 0x2c0], xmm4
0x1007225d7: vmovdqa xmmword ptr [rbp - 0x300], xmm0
0x1007225df: test byte ptr [rbp + rcx*4 - 0x2c0], 1
0x1007225e7: mov edi, dword ptr [rbp + rcx*4 - 0x300]
0x1007225ee: cmove edi, r11d
0x1007225f2: mov ecx, r10d
0x1007225f5: and ecx, 0x7ffffffe
0x1007225fb: mov esi, edi
0x1007225fd: and esi, 0x7ffffffe
0x100722603: cmp ecx, esi
0x100722605: ja 0x100722721
0x10072260b: mov ebx, r8d
0x10072260e: and ebx, 0x7ffffffe
0x100722614: vmovdqa xmm2, xmmword ptr [rbp - 0x130]
0x10072261c: vmovdqa xmmword ptr [rbp - 0x2b0], xmm2
0x100722624: mov edx, r9d
0x100722627: and edx, 0x7ffffffe
0x10072262d: cmp ebx, edx
0x10072262f: ja 0x100722721
0x100722635: vmovd xmm1, r8d
0x10072263a: vpshufd xmm4, xmm1, 0
0x10072263f: vmovd xmm1, r9d
0x100722644: vpshufd xmm8, xmm1, 0
0x100722649: vmovd xmm1, r10d
0x10072264e: vpshufd xmm5, xmm1, 0
0x100722653: vmovd xmm1, edi
0x100722657: vpshufd xmm6, xmm1, 0
0x10072265c: vmovdqa xmm1, xmmword ptr [rip + 0x3b724c] ; 0x100ad98b0
0x100722664: vmovdqa xmm2, xmm1
0x100722668: vpand xmm1, xmm5, xmm2
0x10072266c: vpor xmm7, xmm1, xmmword ptr [rip + 0x3b721c] ; 0x100ad9890
0x100722674: mov edi, eax
0x100722676: and edi, 3
0x100722679: movsxd r14, dword ptr [rbp + rdi*4 - 0x2b0]
0x100722681: vpand xmm1, xmm4, xmm2
0x100722685: vpor xmm10, xmm1, xmmword ptr [rip + 0x3b71f3] ; 0x100ad9880 -> 0x100000000 __mh_execute_header
0x10072268d: mov rdi, qword ptr [rbp - 0x118]
0x100722694: mov r8d, dword ptr [rdi + r14*4 + 0xd8]
0x10072269c: add r8d, r8d
0x10072269f: shr r10d, 1
0x1007226a2: imul r10d, r8d
0x1007226a6: lea r9d, [r10 + rbx*2]
0x1007226aa: mov r10, qword ptr [rdi + r14*8 + 0x38]
0x1007226af: vpxor xmm1, xmm1, xmm1
0x1007226b3: nop word ptr cs:[rax + rax]
0x1007226c0: movsxd rdi, r9d
0x1007226c3: lea rdi, [r10 + rdi*4]
0x1007226c7: vpsubd xmm2, xmm7, xmm5
0x1007226cb: vpsubd xmm3, xmm6, xmm7
0x1007226cf: vpor xmm13, xmm2, xmm3
0x1007226d3: mov r14d, ebx
0x1007226d6: vmovdqa xmm14, xmm10
0x1007226db: nop dword ptr [rax + rax]
0x1007226e0: vpsubd xmm2, xmm14, xmm4
0x1007226e4: vpsubd xmm3, xmm8, xmm14
0x1007226e9: vpor xmm3, xmm13, xmm3
0x1007226ed: vpor xmm2, xmm3, xmm2
0x1007226f1: vpsrad xmm2, xmm2, 0x1f
0x1007226f6: vmaxps xmm3, xmm1, xmmword ptr [rdi]
0x1007226fa: vpblendvb xmm1, xmm3, xmm1, xmm2
0x100722700: vpaddd xmm14, xmm14, xmm9
0x100722705: add r14d, 2
0x100722709: add rdi, 0x10
0x10072270d: cmp r14d, edx
0x100722710: jbe 0x1007226e0
0x100722712: vpaddd xmm7, xmm7, xmm9
0x100722717: add ecx, 2
0x10072271a: add r9d, r8d
0x10072271d: cmp ecx, esi
0x10072271f: jbe 0x1007226c0
0x100722721: vpermilpd xmm2, xmm1, 3
0x100722727: vmovddup xmm1, xmm1
0x10072272b: vmovshdup xmm3, xmm2
0x10072272f: vmaxss xmm2, xmm3, xmm2
0x100722733: vmovshdup xmm3, xmm1
0x100722737: vmaxss xmm1, xmm3, xmm1
0x10072273b: vmaxss xmm1, xmm1, xmm2
0x10072273f: vmovaps xmm2, xmmword ptr [rbp - 0x100]
0x100722747: vmovaps xmmword ptr [rbp - 0x2a0], xmm2
0x10072274f: mov ecx, eax
0x100722751: and ecx, 3
0x100722754: vucomiss xmm1, dword ptr [rbp + rcx*4 - 0x2a0]
0x10072275d: mov ecx, 0
0x100722762: mov edx, 0xffffffff
0x100722767: cmovae ecx, edx
0x10072276a: vmovaps xmm14, xmm15
0x10072276f: vmovaps xmm15, xmm11
0x100722774: vmovaps xmm2, xmmword ptr [rbp - 0xf0]
0x10072277c: lea rdx, [rax + r13]
0x100722780: mov dword ptr [r12 + rdx*4], ecx
0x100722784: inc rax
0x100722787: cmp rax, 4
0x10072278b: jne 0x1007224e0
0x100722791: add r13, 4
0x100722795: cmp r13, qword ptr [rbp - 0x148]
0x10072279c: jb 0x100721ec0
0x1007227a2: jmp 0x100722876 ; 0x100722876
0x1007227a7: nop word ptr [rax + rax]
0x1007227b0: vmovdqa xmmword ptr [rax], xmm0
0x1007227b4: add r13, 4
0x1007227b8: cmp r13, qword ptr [rbp - 0x148]
0x1007227bf: jb 0x100721ec0
0x1007227c5: jmp 0x100722876 ; 0x100722876
0x1007227ca: vmovd edx, xmm3
0x1007227ce: mov eax, 0xffffffff
0x1007227d3: mov ecx, 0xffffffff
0x1007227d8: test edx, edx
0x1007227da: je 0x1007227e8
0x1007227dc: vmovd edx, xmm15
0x1007227e0: not edx
0x1007227e2: vmovd ecx, xmm14
0x1007227e6: and ecx, edx
0x1007227e8: mov dword ptr [r12 + r13*4], ecx
0x1007227ec: vpextrd ecx, xmm3, 1
0x1007227f2: test ecx, ecx
0x1007227f4: je 0x100722806
0x1007227f6: vpextrd ecx, xmm15, 1
0x1007227fc: not ecx
0x1007227fe: vpextrd eax, xmm14, 1
0x100722804: and eax, ecx
0x100722806: mov rcx, r13
0x100722809: or rcx, 1
0x10072280d: mov dword ptr [r12 + rcx*4], eax
0x100722811: vpextrd edx, xmm3, 2
0x100722817: mov eax, 0xffffffff
0x10072281c: mov ecx, 0xffffffff
0x100722821: test edx, edx
0x100722823: je 0x100722835
0x100722825: vpextrd edx, xmm15, 2
0x10072282b: not edx
0x10072282d: vpextrd ecx, xmm14, 2
0x100722833: and ecx, edx
0x100722835: mov rdx, r13
0x100722838: or rdx, 2
0x10072283c: mov dword ptr [r12 + rdx*4], ecx
0x100722840: vpextrd ecx, xmm3, 3
0x100722846: test ecx, ecx
0x100722848: je 0x10072285a
0x10072284a: vpextrd ecx, xmm15, 3
0x100722850: not ecx
0x100722852: vpextrd eax, xmm14, 3
0x100722858: and eax, ecx
0x10072285a: mov rcx, r13
0x10072285d: or rcx, 3
0x100722861: mov dword ptr [r12 + rcx*4], eax
0x100722865: add r13, 4
0x100722869: cmp r13, qword ptr [rbp - 0x148]
0x100722870: jb 0x100721ec0
0x100722876: mov r14d, dword ptr [rbp - 0xc8]
0x10072287d: mov r13, qword ptr [rbp - 0x120]
0x100722884: cmp r13d, r14d
0x100722887: je 0x100722b94
0x10072288d: mov ebx, r13d
0x100722890: mov qword ptr [rbp - 0x100], rbx
0x100722897: shl rbx, 4
0x10072289b: lea rsi, [r15 + rbx]
0x10072289f: mov eax, dword ptr [rbp - 0xc8]
0x1007228a5: mov r14d, eax
0x1007228a8: sub r14d, r13d
0x1007228ab: mov qword ptr [rbp - 0xf0], r14
0x1007228b2: shl r14, 4
0x1007228b6: lea rdi, [rbp - 0x70]
0x1007228ba: mov rdx, r14
0x1007228bd: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1007228c2: add rbx, qword ptr [rbp - 0xd0]
0x1007228c9: lea rdi, [rbp - 0xb0]
0x1007228d0: mov rsi, rbx
0x1007228d3: mov qword ptr [rbp - 0x110], r14
0x1007228da: mov rdx, r14
0x1007228dd: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1007228e2: mov rdx, qword ptr [rbp - 0xf0]
0x1007228e9: mov r14d, dword ptr [rbp - 0xc8]
0x1007228f0: cmp r14d, r13d
0x1007228f3: mov rdi, qword ptr [rbp - 0x118]
0x1007228fa: je 0x1007229c8
0x100722900: mov r8d, edx
0x100722903: and r8d, 1
0x100722907: cmp edx, 1
0x10072290a: jne 0x10072291f
0x10072290c: xor eax, eax
0x10072290e: mov r10, qword ptr [rbp - 0xd0]
0x100722915: test r8, r8
0x100722918: jne 0x100722990
0x10072291a: jmp 0x1007229b8 ; 0x1007229b8
0x10072291f: mov r9, rdx
0x100722922: sub r9, r8
0x100722925: lea rsi, [rbp - 0x60]
0x100722929: lea rdx, [rbp - 0xa0]
0x100722930: xor eax, eax
0x100722932: mov r10, qword ptr [rbp - 0xd0]
0x100722939: mov r11, qword ptr [rbp - 0x100]
0x100722940: lea rbx, [r11 + rax]
0x100722944: mov ecx, ebx
0x100722946: shl rcx, 4
0x10072294a: vmovaps xmm0, xmmword ptr [r15 + rcx]
0x100722950: vmovaps xmmword ptr [rsi - 0x10], xmm0
0x100722955: vmovaps xmm0, xmmword ptr [r10 + rcx]
0x10072295b: vmovaps xmmword ptr [rdx - 0x10], xmm0
0x100722960: inc ebx
0x100722962: shl rbx, 4
0x100722966: vmovaps xmm0, xmmword ptr [r15 + rbx]
0x10072296c: vmovaps xmmword ptr [rsi], xmm0
0x100722970: vmovaps xmm0, xmmword ptr [r10 + rbx]
0x100722976: vmovaps xmmword ptr [rdx], xmm0
0x10072297a: add rax, 2
0x10072297e: add rsi, 0x20
0x100722982: add rdx, 0x20
0x100722986: cmp r9, rax
0x100722989: jne 0x100722940
0x10072298b: test r8, r8
0x10072298e: je 0x1007229b8
0x100722990: lea ecx, [r13 + rax]
0x100722995: shl rcx, 4
0x100722999: shl rax, 4
0x10072299d: vmovaps xmm0, xmmword ptr [r15 + rcx]
0x1007229a3: vmovaps xmmword ptr [rbp + rax - 0x70], xmm0
0x1007229a9: vmovaps xmm0, xmmword ptr [r10 + rcx]
0x1007229af: vmovaps xmmword ptr [rbp + rax - 0xb0], xmm0
0x1007229b8: mov rdx, qword ptr [rbp - 0xf0]
0x1007229bf: cmp edx, 3
0x1007229c2: ja 0x100722a60
0x1007229c8: lea ecx, [rdx - 1]
0x1007229cb: shl rcx, 4
0x1007229cf: lea rax, [rbp + rcx - 0x70]
0x1007229d4: lea rcx, [rbp + rcx - 0xb0]
0x1007229dc: mov rbx, rdx
0x1007229df: test dl, 1
0x1007229e2: je 0x100722a06
0x1007229e4: vmovaps xmm0, xmmword ptr [rax]
0x1007229e8: mov rsi, qword ptr [rbp - 0x110]
0x1007229ef: vmovaps xmmword ptr [rbp + rsi - 0x70], xmm0
0x1007229f5: vmovaps xmm0, xmmword ptr [rcx]
0x1007229f9: vmovaps xmmword ptr [rbp + rsi - 0xb0], xmm0
0x100722a02: lea rbx, [rdx + 1]
0x100722a06: cmp edx, 3
0x100722a09: je 0x100722a60
0x100722a0b: mov edx, 4
0x100722a10: sub rdx, rbx
0x100722a13: shl rbx, 4
0x100722a17: lea rsi, [rbp + rbx - 0x60]
0x100722a1c: lea rbx, [rbp + rbx - 0xa0]
0x100722a24: nop word ptr cs:[rax + rax]
0x100722a30: vmovaps xmm0, xmmword ptr [rax]
0x100722a34: vmovaps xmmword ptr [rsi - 0x10], xmm0
0x100722a39: vmovaps xmm0, xmmword ptr [rcx]
0x100722a3d: vmovaps xmmword ptr [rbx - 0x10], xmm0
0x100722a42: vmovaps xmm0, xmmword ptr [rax]
0x100722a46: vmovaps xmmword ptr [rsi], xmm0
0x100722a4a: vmovaps xmm0, xmmword ptr [rcx]
0x100722a4e: vmovaps xmmword ptr [rbx], xmm0
0x100722a52: add rsi, 0x20
0x100722a56: add rbx, 0x20
0x100722a5a: add rdx, -2
0x100722a5e: jne 0x100722a30
0x100722a60: lea rsi, [rbp - 0x70]
0x100722a64: lea rdx, [rbp - 0xb0]
0x100722a6b: lea r8, [rbp - 0xc0]
0x100722a72: mov ecx, 4
0x100722a77: call 0x100721ce0 ; 0x100721ce0
0x100722a7c: mov r8, qword ptr [rbp - 0xf0]
0x100722a83: test r8d, r8d
0x100722a86: mov rbx, qword ptr [rbp - 0x100]
0x100722a8d: je 0x100722b94
0x100722a93: cmp r8d, 0x1f
0x100722a97: ja 0x100722a9d
0x100722a99: xor ecx, ecx
0x100722a9b: jmp 0x100722b17 ; 0x100722b17
0x100722a9d: lea rax, [r8 - 1]
0x100722aa1: xor ecx, ecx
0x100722aa3: mov edx, r13d
0x100722aa6: add edx, eax
0x100722aa8: jb 0x100722b17
0x100722aaa: shr rax, 0x20
0x100722aae: jne 0x100722b17
0x100722ab0: mov eax, r8d
0x100722ab3: and eax, 0x1f
0x100722ab6: mov rcx, r8
0x100722ab9: sub rcx, rax
0x100722abc: lea rdx, [rbp - 0x60]
0x100722ac0: mov rsi, rcx
0x100722ac3: nop word ptr cs:[rax + rax]
0x100722ad0: vmovups ymm0, ymmword ptr [rdx - 0x60]
0x100722ad5: vmovups ymm1, ymmword ptr [rdx - 0x40]
0x100722ada: vmovups ymm2, ymmword ptr [rdx - 0x20]
0x100722adf: vmovups ymm3, ymmword ptr [rdx]
0x100722ae3: mov edi, r13d
0x100722ae6: vmovups ymmword ptr [r12 + rdi*4], ymm0
0x100722aec: vmovups ymmword ptr [r12 + rdi*4 + 0x20], ymm1
0x100722af3: vmovups ymmword ptr [r12 + rdi*4 + 0x40], ymm2
0x100722afa: vmovups ymmword ptr [r12 + rdi*4 + 0x60], ymm3
0x100722b01: sub rdx, -0x80
0x100722b05: add r13d, 0x20
0x100722b09: add rsi, -0x20
0x100722b0d: jne 0x100722ad0
0x100722b0f: test eax, eax
0x100722b11: je 0x100722b94
0x100722b17: mov edx, r8d
0x100722b1a: sub edx, ecx
0x100722b1c: lea rax, [r8 - 1]
0x100722b20: sub rax, rcx
0x100722b23: and rdx, 3
0x100722b27: je 0x100722b46
0x100722b29: neg rdx
0x100722b2c: nop dword ptr [rax]
0x100722b30: mov esi, dword ptr [rbp + rcx*4 - 0xc0]
0x100722b37: lea edi, [rbx + rcx]
0x100722b3a: mov dword ptr [r12 + rdi*4], esi
0x100722b3e: inc rcx
0x100722b41: inc rdx
0x100722b44: jne 0x100722b30
0x100722b46: cmp rax, 3
0x100722b4a: jb 0x100722b94
0x100722b4c: nop dword ptr [rax]
0x100722b50: mov eax, dword ptr [rbp + rcx*4 - 0xc0]
0x100722b57: lea rdx, [rbx + rcx]
0x100722b5b: mov esi, edx
0x100722b5d: mov dword ptr [r12 + rsi*4], eax
0x100722b61: mov eax, dword ptr [rbp + rcx*4 - 0xbc]
0x100722b68: lea esi, [rdx + 1]
0x100722b6b: mov dword ptr [r12 + rsi*4], eax
0x100722b6f: mov eax, dword ptr [rbp + rcx*4 - 0xb8]
0x100722b76: lea esi, [rdx + 2]
0x100722b79: mov dword ptr [r12 + rsi*4], eax
0x100722b7d: mov eax, dword ptr [rbp + rcx*4 - 0xb4]
0x100722b84: add edx, 3
0x100722b87: mov dword ptr [r12 + rdx*4], eax
0x100722b8b: add rcx, 4
0x100722b8f: cmp r8, rcx
0x100722b92: jne 0x100722b50
0x100722b94: cmp byte ptr [rip + 0x191959d], 0 ; 0x10203c138
0x100722b9b: je 0x100722c7b
0x100722ba1: vzeroupper 
0x100722ba4: call 0x1002b9810 ; 0x1002b9810
0x100722ba9: mov qword ptr [rbp - 0xf0], rax
0x100722bb0: test r14d, r14d
0x100722bb3: mov rcx, qword ptr [rbp - 0xd0]
0x100722bba: je 0x100722c7b
0x100722bc0: mov r13d, r14d
0x100722bc3: xor ebx, ebx
0x100722bc5: nop word ptr cs:[rax + rax]
0x100722bd0: cmp dword ptr [r12 + rbx*4], 0
0x100722bd5: je 0x100722c67
0x100722bdb: vmovaps xmm0, xmmword ptr [r15]
0x100722be0: vextractps dword ptr [rbp - 0xb8], xmm0, 2
0x100722bea: vmovlps qword ptr [rbp - 0xc0], xmm0
0x100722bf2: mov r14, rcx
0x100722bf5: vmovaps xmm0, xmmword ptr [rcx]
0x100722bf9: vextractps dword ptr [rbp - 0x158], xmm0, 2
0x100722c03: vmovlps qword ptr [rbp - 0x160], xmm0
0x100722c0b: vmovaps xmm0, xmmword ptr [rip + 0x3b6cad] ; 0x100ad98c0
0x100722c13: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x100722c1b: lea rdi, [rbp - 0x70]
0x100722c1f: lea rsi, [rbp - 0xb0]
0x100722c26: vmovss xmm0, dword ptr [rip + 0x38598a] ; 0x100aa85b8
0x100722c2e: call 0x10077d310 ; 0x10077d310
0x100722c33: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x100722c38: vmovaps xmmword ptr [rbp - 0x370], xmm0
0x100722c40: xor r8d, r8d
0x100722c43: mov rdi, qword ptr [rbp - 0xf0]
0x100722c4a: lea rsi, [rbp - 0xc0]
0x100722c51: lea rdx, [rbp - 0x160]
0x100722c58: lea rcx, [rbp - 0x370]
0x100722c5f: call 0x1002bbea0 ; 0x1002bbea0
0x100722c64: mov rcx, r14
0x100722c67: add r15, 0x10
0x100722c6b: add rcx, 0x10
0x100722c6f: inc rbx
0x100722c72: cmp rbx, r13
0x100722c75: jb 0x100722bd0
0x100722c7b: mov eax, dword ptr [rbp - 0xd4]
0x100722c81: mov dword ptr [rbp - 0x70], eax
0x100722c84: vldmxcsr dword ptr [rbp - 0x70]
0x100722c89: mov rax, qword ptr [rip + 0x4eac48] ; 0x100c0d8d8
0x100722c90: mov rax, qword ptr [rax]
0x100722c93: cmp rax, qword ptr [rbp - 0x30]
0x100722c97: jne 0x100722cc3
0x100722c99: add rsp, 0x348
0x100722ca0: pop rbx
0x100722ca1: pop r12
0x100722ca3: pop r13
0x100722ca5: pop r14
0x100722ca7: pop r15
0x100722ca9: pop rbp
0x100722caa: vzeroupper 
0x100722cad: ret 
0x100722cae: mov edx, ecx
0x100722cb0: shl rdx, 2
0x100722cb4: mov esi, 0xff
0x100722cb9: mov rdi, r12
0x100722cbc: call 0x100aa2900 ; 0x100aa2900 _memset
0x100722cc1: jmp 0x100722c7b ; 0x100722c7b
0x100722cc3: vzeroupper 
0x100722cc6: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100722ccb: jmp 0x100722ccf ; 0x100722ccf
0x100722ccd: jmp 0x100722ccf ; 0x100722ccf
0x100722ccf: mov rdi, rax
0x100722cd2: mov eax, dword ptr [rbp - 0xd4]
0x100722cd8: mov dword ptr [rbp - 0xc0], eax
0x100722cde: vldmxcsr dword ptr [rbp - 0xc0]
0x100722ce6: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100722ceb: nop dword ptr [rax + rax]
