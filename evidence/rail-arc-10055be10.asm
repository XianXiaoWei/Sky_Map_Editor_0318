0x10055bd90: push rbp
0x10055bd91: mov rbp, rsp
0x10055bd94: push r15
0x10055bd96: push r14
0x10055bd98: push r13
0x10055bd9a: push r12
0x10055bd9c: push rbx
0x10055bd9d: sub rsp, 0x168
0x10055bda4: mov r14, rcx
0x10055bda7: mov r12, rdx
0x10055bdaa: mov r15, rdi
0x10055bdad: cmp byte ptr [rip + 0x79071c], 0 ; 0x100cec4d0
0x10055bdb4: je 0x10055c3dd
0x10055bdba: cmp byte ptr [r12 + 0x1390], 0
0x10055bdc3: je 0x10055c3dd
0x10055bdc9: mov rdi, r14
0x10055bdcc: call 0x1000ff210 ; 0x1000ff210
0x10055bdd1: test rax, rax
0x10055bdd4: je 0x10055c3dd
0x10055bdda: mov rdi, r14
0x10055bddd: call 0x1000fc260 ; 0x1000fc260
0x10055bde2: mov rax, qword ptr [rax + 0x18]
0x10055bde6: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x10055bdeb: vmovaps xmmword ptr [rbp - 0x190], xmm0
0x10055bdf3: vmovss xmm1, dword ptr [rip + 0x5492c5] ; 0x100aa50c0
0x10055bdfb: lea r13, [rbp - 0x170]
0x10055be02: mov ebx, 0
0x10055be07: mov r14, r12
0x10055be0a: mov qword ptr [rbp - 0x80], r14
0x10055be0e: mov qword ptr [rbp - 0x50], r15
0x10055be12: nop word ptr cs:[rax + rax]
0x10055be20: mov rax, rbx
0x10055be23: shl rax, 8
0x10055be27: cmp byte ptr [r15 + rax + 0xf8], 0
0x10055be30: je 0x10055c3cd
0x10055be36: mov qword ptr [rbp - 0x58], rbx
0x10055be3a: mov rbx, rax
0x10055be3d: lea r12, [r15 + rbx + 0x10]
0x10055be42: vmovss xmm0, dword ptr [r15 + rbx + 0x28]
0x10055be49: vdivss xmm0, xmm0, dword ptr [rip + 0x54be6b] ; 0x100aa7cbc
0x10055be51: vmaxss xmm0, xmm1, xmm0
0x10055be55: vmovss xmm1, dword ptr [rip + 0x54b993] ; 0x100aa77f0
0x10055be5d: vminss xmm0, xmm1, xmm0
0x10055be61: vmulss xmm0, xmm0, dword ptr [rip + 0x54be57] ; 0x100aa7cc0
0x10055be69: mov eax, dword ptr [r15 + rbx + 0x38]
0x10055be6e: vcvtsi2ss xmm1, xmm4, rax
0x10055be73: vmulss xmm0, xmm0, xmm1
0x10055be77: vcvttss2si rax, xmm0
0x10055be7c: mov qword ptr [rbp - 0x78], rax
0x10055be80: mov rdi, r12
0x10055be83: lea rsi, [rbp - 0x190]
0x10055be8a: lea rdx, [rbp - 0x180]
0x10055be91: call 0x10055d820 ; 0x10055d820
0x10055be96: vmovaps xmm0, xmmword ptr [rip + 0x56f972] ; 0x100acb810 333>333>333>
0x10055be9e: vmovaps xmm2, xmm0
0x10055bea2: vmovaps xmm1, xmmword ptr [rbp - 0x110]
0x10055beaa: vblendps xmm1, xmm2, xmm1, 8
0x10055beb0: vmovaps xmm0, xmmword ptr [rbp - 0x180]
0x10055beb8: vmovaps xmmword ptr [rbp - 0x110], xmm1
0x10055bec0: vsubps xmm1, xmm0, xmm1
0x10055bec4: vmovaps xmmword ptr [rbp - 0x170], xmm1
0x10055becc: vmovaps xmm1, xmmword ptr [rbp - 0xc0]
0x10055bed4: vblendps xmm1, xmm2, xmm1, 8
0x10055beda: vmovaps xmmword ptr [rbp - 0xc0], xmm1
0x10055bee2: vaddps xmm0, xmm1, xmm0
0x10055bee6: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x10055beeb: xor r8d, r8d
0x10055beee: mov rdi, r14
0x10055bef1: mov rsi, r13
0x10055bef4: lea rdx, [rbp - 0x40]
0x10055bef8: lea rcx, [rip + 0x1ae3731] ; 0x10203f630
0x10055beff: call 0x1002bbea0 ; 0x1002bbea0
0x10055bf04: mov qword ptr [rbp - 0x60], rbx
0x10055bf08: mov rbx, qword ptr [r15 + rbx + 0xa0]
0x10055bf10: vmovaps xmm0, xmmword ptr [rbx]
0x10055bf14: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x10055bf1c: mov rax, qword ptr [rbp - 0x78]
0x10055bf20: mov r13, rax
0x10055bf23: test eax, eax
0x10055bf25: je 0x10055c181
0x10055bf2b: mov eax, r13d
0x10055bf2e: vcvtsi2ss xmm0, xmm4, rax
0x10055bf33: vmovss xmm1, dword ptr [rip + 0x549185] ; 0x100aa50c0
0x10055bf3b: vmovss dword ptr [rbp - 0x48], xmm0
0x10055bf40: vdivss xmm0, xmm1, xmm0
0x10055bf44: vmovss dword ptr [rbp - 0x44], xmm0
0x10055bf49: mov rax, qword ptr [rbp - 0x50]
0x10055bf4d: mov rcx, qword ptr [rbp - 0x60]
0x10055bf51: vmovaps xmm0, xmmword ptr [rax + rcx + 0x40]
0x10055bf57: vmovaps xmmword ptr [rbp - 0x120], xmm0
0x10055bf5f: lea rax, [rax + rcx + 0x3c]
0x10055bf64: mov qword ptr [rbp - 0x88], rax
0x10055bf6b: mov r15d, 1
0x10055bf71: jmp 0x10055bf90 ; 0x10055bf90
0x10055bf73: nop word ptr cs:[rax + rax]
0x10055bf80: mov rbx, qword ptr [r12 + 0x90]
0x10055bf88: vmovss xmm1, dword ptr [rip + 0x549130] ; 0x100aa50c0
0x10055bf90: mov eax, r15d
0x10055bf93: vcvtsi2ss xmm8, xmm9, rax
0x10055bf98: vmulss xmm0, xmm8, dword ptr [rbp - 0x44]
0x10055bf9d: mov r14d, dword ptr [r12 + 0x28]
0x10055bfa2: mov rax, qword ptr [rbp - 0x88]
0x10055bfa9: cmp byte ptr [rax], 0
0x10055bfac: je 0x10055c020
0x10055bfae: vmovss dword ptr [rbp - 0x70], xmm8
0x10055bfb3: call 0x100aa2744 ; 0x100aa2744 _fmodf
0x10055bfb8: vmovss xmm8, dword ptr [rbp - 0x70]
0x10055bfbd: vmovss xmm1, dword ptr [rip + 0x5490fb] ; 0x100aa50c0
0x10055bfc5: vaddss xmm3, xmm0, xmm1
0x10055bfc9: vcmpltss xmm2, xmm0, dword ptr [rip + 0x54b112] ; 0x100aa70e4
0x10055bfd2: vblendvps xmm0, xmm0, xmm3, xmm2
0x10055bfd8: mov eax, r14d
0x10055bfdb: vcvtsi2ss xmm3, xmm9, rax
0x10055bfe0: vmulss xmm2, xmm0, xmm3
0x10055bfe4: vcvttss2si rsi, xmm2
0x10055bfe9: lea ecx, [r14 - 1]
0x10055bfed: lea eax, [rsi + 1]
0x10055bff0: cmp ecx, esi
0x10055bff2: mov edi, 0
0x10055bff7: cmove eax, edi
0x10055bffa: test esi, esi
0x10055bffc: mov ecx, esi
0x10055bffe: cmove ecx, r14d
0x10055c002: dec ecx
0x10055c004: add r14d, -2
0x10055c008: lea edx, [rax + 1]
0x10055c00b: cmp r14d, esi
0x10055c00e: cmove edx, edi
0x10055c011: mov r14d, esi
0x10055c014: jmp 0x10055c05c ; 0x10055c05c
0x10055c016: nop word ptr cs:[rax + rax]
0x10055c020: vminss xmm0, xmm1, xmm0
0x10055c024: lea edx, [r14 - 1]
0x10055c028: vcvtsi2ss xmm3, xmm9, rdx
0x10055c02d: vmulss xmm2, xmm0, xmm3
0x10055c031: vcvttss2si rax, xmm2
0x10055c036: add r14d, -2
0x10055c03a: cmp edx, eax
0x10055c03c: cmovne r14d, eax
0x10055c040: lea eax, [r14 + 1]
0x10055c044: lea ecx, [r14 - 1]
0x10055c048: test r14d, r14d
0x10055c04b: cmove ecx, r14d
0x10055c04f: xor esi, esi
0x10055c051: cmp eax, edx
0x10055c053: setne sil
0x10055c057: lea edx, [r14 + rsi + 1]
0x10055c05c: vmulss xmm0, xmm0, xmm3
0x10055c060: mov esi, r14d
0x10055c063: vcvtsi2ss xmm2, xmm9, rsi
0x10055c068: vsubss xmm0, xmm0, xmm2
0x10055c06c: mov ecx, ecx
0x10055c06e: shl rcx, 4
0x10055c072: vmovaps xmm6, xmmword ptr [rbx + rcx]
0x10055c077: shl rsi, 4
0x10055c07b: vmovaps xmm2, xmmword ptr [rbx + rsi]
0x10055c080: mov eax, eax
0x10055c082: shl rax, 4
0x10055c086: vmovaps xmm3, xmmword ptr [rbx + rax]
0x10055c08b: mov eax, edx
0x10055c08d: shl rax, 4
0x10055c091: vaddps xmm4, xmm6, xmm6
0x10055c095: vmulps xmm5, xmm2, xmmword ptr [rip + 0x54b6e3] ; 0x100aa7780
0x10055c09d: vsubps xmm4, xmm4, xmm5
0x10055c0a1: vmulps xmm5, xmm3, xmmword ptr [rip + 0x54bea7] ; 0x100aa7f50
0x10055c0a9: vaddps xmm4, xmm4, xmm5
0x10055c0ad: vmovaps xmm5, xmmword ptr [rip + 0x54bfcb] ; 0x100aa8080
0x10055c0b5: vmovaps xmm7, xmm5
0x10055c0b9: vmulps xmm5, xmm2, xmm7
0x10055c0bd: vsubps xmm5, xmm5, xmm6
0x10055c0c1: vsubps xmm6, xmm3, xmm6
0x10055c0c5: vmulps xmm3, xmm3, xmm7
0x10055c0c9: vsubps xmm3, xmm5, xmm3
0x10055c0cd: vmovaps xmm5, xmmword ptr [rbx + rax]
0x10055c0d2: vsubps xmm4, xmm4, xmm5
0x10055c0d6: vaddps xmm3, xmm5, xmm3
0x10055c0da: vpermilps xmm0, xmm0, 0xc0
0x10055c0e0: vmulps xmm3, xmm0, xmm3
0x10055c0e4: vaddps xmm3, xmm4, xmm3
0x10055c0e8: vmulps xmm3, xmm0, xmm3
0x10055c0ec: vaddps xmm3, xmm6, xmm3
0x10055c0f0: vmulps xmm0, xmm0, xmm3
0x10055c0f4: vaddps xmm2, xmm2, xmm2
0x10055c0f8: vaddps xmm0, xmm2, xmm0
0x10055c0fc: vmulps xmm0, xmm0, xmmword ptr [rip + 0x54b56c] ; 0x100aa7670
0x10055c104: vmovaps xmmword ptr [rbp - 0xa0], xmm0
0x10055c10c: vdivss xmm0, xmm8, dword ptr [rbp - 0x48]
0x10055c111: vsubss xmm1, xmm1, xmm0
0x10055c115: vmulss xmm1, xmm1, dword ptr [rip + 0x54849b] ; 0x100aa45b8
0x10055c11d: vaddss xmm0, xmm0, xmm1
0x10055c121: vpermilps xmm0, xmm0, 0xc0
0x10055c127: vmovaps xmm1, xmmword ptr [rbp - 0x120]
0x10055c12f: vmulps xmm0, xmm1, xmm0
0x10055c133: vblendps xmm0, xmm0, xmm1, 8
0x10055c139: vmovaps xmmword ptr [rbp - 0x170], xmm0
0x10055c141: xor r8d, r8d
0x10055c144: mov r14, qword ptr [rbp - 0x80]
0x10055c148: mov rdi, r14
0x10055c14b: lea rsi, [rbp - 0xb0]
0x10055c152: lea rdx, [rbp - 0xa0]
0x10055c159: lea rcx, [rbp - 0x170]
0x10055c160: call 0x1002b9d50 ; 0x1002b9d50
0x10055c165: vmovaps xmm0, xmmword ptr [rbp - 0xa0]
0x10055c16d: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x10055c175: inc r15d
0x10055c178: cmp r15d, r13d
0x10055c17b: jbe 0x10055bf80
0x10055c181: mov eax, dword ptr [r12 + 0x28]
0x10055c186: test eax, eax
0x10055c188: lea r13, [rbp - 0x170]
0x10055c18f: lea r15, [rip + 0x1ae348a] ; 0x10203f620
0x10055c196: je 0x10055c1db
0x10055c198: xor ebx, ebx
0x10055c19a: nop word ptr [rax + rax]
0x10055c1a0: mov ecx, ebx
0x10055c1a2: vcvtsi2ss xmm0, xmm9, rcx
0x10055c1a7: dec eax
0x10055c1a9: vcvtsi2ss xmm1, xmm9, rax
0x10055c1ae: vdivss xmm0, xmm0, xmm1
0x10055c1b2: mov rdi, r13
0x10055c1b5: mov rsi, r12
0x10055c1b8: call 0x100560b40 ; 0x100560b40
0x10055c1bd: mov ecx, 1
0x10055c1c2: mov rdi, r14
0x10055c1c5: mov rsi, r13
0x10055c1c8: mov rdx, r15
0x10055c1cb: call 0x1002bc290 ; 0x1002bc290
0x10055c1d0: inc ebx
0x10055c1d2: mov eax, dword ptr [r12 + 0x28]
0x10055c1d7: cmp ebx, eax
0x10055c1d9: jb 0x10055c1a0
0x10055c1db: mov rax, qword ptr [r12 + 0x90]
0x10055c1e3: vmovaps xmm0, xmmword ptr [rip + 0x54d105] ; 0x100aa92f0
0x10055c1eb: vmovaps xmm2, xmm0
0x10055c1ef: vmovaps xmm1, xmmword ptr [rbp - 0xd0]
0x10055c1f7: vblendps xmm1, xmm2, xmm1, 8
0x10055c1fd: vmovaps xmm0, xmmword ptr [rax]
0x10055c201: vmovaps xmmword ptr [rbp - 0xd0], xmm1
0x10055c209: vsubps xmm0, xmm0, xmm1
0x10055c20d: vmovaps xmmword ptr [rbp - 0x170], xmm0
0x10055c215: vmovaps xmm0, xmmword ptr [rbp - 0xe0]
0x10055c21d: vblendps xmm0, xmm2, xmm0, 8
0x10055c223: vmovaps xmmword ptr [rbp - 0xe0], xmm0
0x10055c22b: vaddps xmm0, xmm0, xmmword ptr [rax]
0x10055c22f: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x10055c234: vmovaps xmm0, xmmword ptr [r15]
0x10055c239: vmulps xmm1, xmm0, xmmword ptr [rip + 0x54b42f] ; 0x100aa7670
0x10055c241: vblendps xmm0, xmm1, xmm0, 8
0x10055c247: vmovaps xmmword ptr [rbp - 0x130], xmm0
0x10055c24f: xor r8d, r8d
0x10055c252: mov rdi, r14
0x10055c255: mov rsi, r13
0x10055c258: lea rbx, [rbp - 0x40]
0x10055c25c: mov rdx, rbx
0x10055c25f: lea rcx, [rbp - 0x130]
0x10055c266: call 0x1002bbea0 ; 0x1002bbea0
0x10055c26b: mov eax, dword ptr [r12 + 0x28]
0x10055c270: dec eax
0x10055c272: mov rcx, qword ptr [r12 + 0x90]
0x10055c27a: shl rax, 4
0x10055c27e: vmovaps xmm1, xmmword ptr [rbp - 0xf0]
0x10055c286: vmovaps xmm2, xmmword ptr [rip + 0x54d062] ; 0x100aa92f0
0x10055c28e: vblendps xmm1, xmm2, xmm1, 8
0x10055c294: vmovaps xmm0, xmmword ptr [rcx + rax]
0x10055c299: vmovaps xmmword ptr [rbp - 0xf0], xmm1
0x10055c2a1: vsubps xmm0, xmm0, xmm1
0x10055c2a5: vmovaps xmmword ptr [rbp - 0x170], xmm0
0x10055c2ad: vmovaps xmm0, xmmword ptr [rbp - 0x100]
0x10055c2b5: vblendps xmm0, xmm2, xmm0, 8
0x10055c2bb: vmovaps xmmword ptr [rbp - 0x100], xmm0
0x10055c2c3: vaddps xmm0, xmm0, xmmword ptr [rcx + rax]
0x10055c2c8: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x10055c2cd: xor r8d, r8d
0x10055c2d0: mov rdi, r14
0x10055c2d3: mov rsi, r13
0x10055c2d6: mov rdx, rbx
0x10055c2d9: lea r12, [rip + 0x1ae3330] ; 0x10203f610
0x10055c2e0: mov rcx, r12
0x10055c2e3: call 0x1002bbea0 ; 0x1002bbea0
0x10055c2e8: mov r15, qword ptr [rbp - 0x50]
0x10055c2ec: mov rax, qword ptr [rbp - 0x60]
0x10055c2f0: vmovaps xmm0, xmmword ptr [r15 + rax + 0x90]
0x10055c2fa: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x10055c2ff: vmovaps xmm2, xmmword ptr [r15 + rax + 0x70]
0x10055c306: vmulps xmm0, xmm2, xmm2
0x10055c30a: vmovshdup xmm1, xmm0
0x10055c30e: vaddss xmm1, xmm0, xmm1
0x10055c312: vpermilpd xmm0, xmm0, 1
0x10055c318: vaddss xmm0, xmm0, xmm1
0x10055c31c: vsqrtss xmm0, xmm0, xmm0
0x10055c320: vucomiss xmm0, dword ptr [rip + 0x54b59c] ; 0x100aa78c4
0x10055c328: jbe 0x10055c340
0x10055c32a: vpermilps xmm0, xmm0, 0xc0
0x10055c330: vdivps xmm2, xmm2, xmm0
0x10055c334: vmovaps xmmword ptr [rbp - 0x70], xmm2
0x10055c339: mov rbx, qword ptr [rbp - 0x58]
0x10055c33d: jmp 0x10055c349 ; 0x10055c349
0x10055c33f: nop 
0x10055c340: mov rbx, qword ptr [rbp - 0x58]
0x10055c344: vmovaps xmmword ptr [rbp - 0x70], xmm2
0x10055c349: call 0x1002b9810 ; 0x1002b9810
0x10055c34e: vmovaps xmm3, xmmword ptr [rbp - 0x70]
0x10055c353: vmulps xmm0, xmm3, xmm3
0x10055c357: vmovshdup xmm1, xmm0
0x10055c35b: vaddss xmm1, xmm0, xmm1
0x10055c35f: vpermilpd xmm0, xmm0, 1
0x10055c365: vaddss xmm0, xmm0, xmm1
0x10055c369: vsqrtss xmm0, xmm0, xmm0
0x10055c36d: vmovss xmm1, dword ptr [rip + 0x54a727] ; 0x100aa6a9c
0x10055c375: vmovaps xmm2, xmm1
0x10055c379: vmaxss xmm1, xmm2, xmm0
0x10055c37d: vcmpunordss xmm0, xmm0, xmm0
0x10055c382: vandnps xmm1, xmm0, xmm1
0x10055c386: vandps xmm0, xmm0, xmm2
0x10055c38a: vorps xmm0, xmm1, xmm0
0x10055c38e: vpermilps xmm0, xmm0, 0xc0
0x10055c394: vdivps xmm0, xmm3, xmm0
0x10055c398: vmulps xmm0, xmm0, xmmword ptr [rip + 0x54b2d0] ; 0x100aa7670
0x10055c3a0: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x40]
0x10055c3a5: vmovaps xmmword ptr [rbp - 0x170], xmm0
0x10055c3ad: mov r8d, 1
0x10055c3b3: mov rdi, rax
0x10055c3b6: lea rsi, [rbp - 0x40]
0x10055c3ba: mov rdx, r13
0x10055c3bd: mov rcx, r12
0x10055c3c0: call 0x1002b9d50 ; 0x1002b9d50
0x10055c3c5: vmovss xmm1, dword ptr [rip + 0x548cf3] ; 0x100aa50c0
0x10055c3cd: inc rbx
0x10055c3d0: cmp rbx, 0xa0
0x10055c3d7: jne 0x10055be20
0x10055c3dd: add rsp, 0x168
0x10055c3e4: pop rbx
0x10055c3e5: pop r12
0x10055c3e7: pop r13
0x10055c3e9: pop r14
0x10055c3eb: pop r15
0x10055c3ed: pop rbp
0x10055c3ee: ret 
0x10055c3ef: nop 
