0x10005aa10: push rbp
0x10005aa11: mov rbp, rsp
0x10005aa14: push r15
0x10005aa16: push r14
0x10005aa18: push r13
0x10005aa1a: push r12
0x10005aa1c: push rbx
0x10005aa1d: sub rsp, 0x968
0x10005aa24: mov r15, rcx
0x10005aa27: mov r13, rdx
0x10005aa2a: mov qword ptr [rbp - 0x860], rsi
0x10005aa31: mov r14, rdi
0x10005aa34: mov r12, qword ptr [rbp + 0x28]
0x10005aa38: mov rax, qword ptr [rip + 0xbb2e99] ; 0x100c0d8d8
0x10005aa3f: mov rax, qword ptr [rax]
0x10005aa42: mov qword ptr [rbp - 0x30], rax
0x10005aa46: vmovss xmm0, dword ptr [rip + 0xc1e9b2] ; 0x100c79400
0x10005aa4e: vmulss xmm0, xmm0, dword ptr [r14 + 0x280]
0x10005aa57: vmovss dword ptr [r14 + 0x280], xmm0
0x10005aa60: vpermilps xmm0, xmm0, 0xc0
0x10005aa66: vmulps xmm0, xmm0, xmmword ptr [r14 + 0x270]
0x10005aa6f: vdivps xmm0, xmm0, xmmword ptr [rip + 0xa4d479] ; 0x100aa7ef0
0x10005aa77: vmovaps xmmword ptr [r14 + 0x2a0], xmm0
0x10005aa80: cmp byte ptr [rip + 0x1d14081], 0 ; 0x101d6eb08
0x10005aa87: je 0x10005aacf
0x10005aa89: mov byte ptr [r14 + 0x110], 0
0x10005aa91: mov dword ptr [r14 + 0xb0], 0
0x10005aa9c: mov dword ptr [r14 + 0x204], 0x466a6000
0x10005aaa7: vmovaps xmm0, xmmword ptr [rip + 0xa4d451] ; 0x100aa7f00
0x10005aaaf: vmovups xmmword ptr [r14 + 0x1f4], xmm0
0x10005aab8: mov dword ptr [r14 + 0x20c], 0x3f800000
0x10005aac3: mov byte ptr [rip + 0x1d149ae], 0 ; 0x101d6f478
0x10005aaca: jmp 0x10005ac1a ; 0x10005ac1a
0x10005aacf: cmp byte ptr [rip + 0x1d140a2], 0 ; 0x101d6eb78
0x10005aad6: je 0x10005abf3
0x10005aadc: mov al, byte ptr [rip + 0x1d14106] ; 0x101d6ebe8
0x10005aae2: mov byte ptr [r14 + 0x110], al
0x10005aae9: mov ecx, dword ptr [rip + 0xc1e8f1] ; 0x100c793e0
0x10005aaef: mov dword ptr [r14 + 0x200], ecx
0x10005aaf6: vmovss xmm0, dword ptr [rip + 0xc1e8e6] ; 0x100c793e4
0x10005aafe: vmovss dword ptr [r14 + 0x204], xmm0
0x10005ab07: vmovd xmm1, ecx
0x10005ab0b: vsubss xmm0, xmm0, xmm1
0x10005ab0f: vmovss xmm1, dword ptr [rip + 0xa4a5a9] ; 0x100aa50c0
0x10005ab17: vdivss xmm0, xmm1, xmm0
0x10005ab1b: vmovss dword ptr [r14 + 0x20c], xmm0
0x10005ab24: mov ecx, dword ptr [rip + 0xc1e8be] ; 0x100c793e8
0x10005ab2a: mov dword ptr [r14 + 0x208], ecx
0x10005ab31: mov ecx, dword ptr [rip + 0xc1e8b5] ; 0x100c793ec
0x10005ab37: mov dword ptr [r14 + 0x210], ecx
0x10005ab3e: mov ecx, dword ptr [rip + 0x1d14354] ; 0x101d6ee98
0x10005ab44: mov dword ptr [r14 + 0x214], ecx
0x10005ab4b: mov ecx, dword ptr [rip + 0xc1e89f] ; 0x100c793f0
0x10005ab51: mov dword ptr [r14 + 0xb0], ecx
0x10005ab58: vmovss xmm0, dword ptr [rip + 0xc1e894] ; 0x100c793f4
0x10005ab60: vmulss xmm0, xmm0, dword ptr [rip + 0xa4da48] ; 0x100aa85b0
0x10005ab68: vmovss dword ptr [r14 + 0x1f4], xmm0
0x10005ab71: vmovss xmm0, dword ptr [rip + 0xc1e87f] ; 0x100c793f8
0x10005ab79: vxorps xmm1, xmm1, xmm1
0x10005ab7d: vcmpneqss xmm1, xmm0, xmm1
0x10005ab82: vandps xmm0, xmm1, xmm0
0x10005ab86: vmovss xmm2, dword ptr [rip + 0xa4da26] ; 0x100aa85b4
0x10005ab8e: vandnps xmm1, xmm1, xmm2
0x10005ab92: vorps xmm0, xmm1, xmm0
0x10005ab96: vmovss dword ptr [r14 + 0x1f8], xmm0
0x10005ab9f: mov ecx, dword ptr [rip + 0xc1e857] ; 0x100c793fc
0x10005aba5: mov dword ptr [r14 + 0x1fc], ecx
0x10005abac: mov ecx, dword ptr [rip + 0xc1e856] ; 0x100c79408
0x10005abb2: mov dword ptr [r14 + 0x34], ecx
0x10005abb6: mov ecx, dword ptr [rip + 0x1d1469c] ; 0x101d6f258
0x10005abbc: mov dword ptr [r14 + 0x30], ecx
0x10005abc0: mov ecx, dword ptr [rip + 0xc1e83e] ; 0x100c79404
0x10005abc6: mov dword ptr [r14 + 0x3c], ecx
0x10005abca: mov ecx, dword ptr [rip + 0x1d14718] ; 0x101d6f2e8
0x10005abd0: mov dword ptr [r14 + 0x40], ecx
0x10005abd4: mov ecx, dword ptr [rip + 0xc1e832] ; 0x100c7940c
0x10005abda: mov dword ptr [r14 + 0x44], ecx
0x10005abde: mov ecx, dword ptr [rip + 0xc1e82c] ; 0x100c79410
0x10005abe4: mov dword ptr [r14 + 0x254], ecx
0x10005abeb: mov byte ptr [rip + 0x1d14887], al ; 0x101d6f478
0x10005abf1: jmp 0x10005ac1a ; 0x10005ac1a
0x10005abf3: vmovss xmm0, dword ptr [r14 + 0x204]
0x10005abfc: vsubss xmm0, xmm0, dword ptr [r14 + 0x200]
0x10005ac05: vmovss xmm1, dword ptr [rip + 0xa4a4b3] ; 0x100aa50c0
0x10005ac0d: vdivss xmm0, xmm1, xmm0
0x10005ac11: vmovss dword ptr [r14 + 0x20c], xmm0
0x10005ac1a: lea rbx, [rbp - 0x990]
0x10005ac21: mov rdi, rbx
0x10005ac24: mov rsi, r15
0x10005ac27: call 0x10076be90 ; 0x10076be90
0x10005ac2c: mov rdi, r12
0x10005ac2f: mov rsi, rbx
0x10005ac32: call 0x1004d6140 ; 0x1004d6140
0x10005ac37: test al, al
0x10005ac39: mov qword ptr [rbp - 0x888], r15
0x10005ac40: je 0x10005ace8
0x10005ac46: mov dword ptr [r14 + 0x240], 0x3f800000
0x10005ac51: vmovaps xmm0, xmmword ptr [rip + 0xa4d327] ; 0x100aa7f80 fff?
0x10005ac59: vmovaps xmmword ptr [r14 + 0x230], xmm0
0x10005ac62: movabs rax, 0x3ecccccd3ecccccd
0x10005ac6c: mov qword ptr [r14 + 0x248], rax
0x10005ac73: vmovaps xmm0, xmmword ptr [r14 + 0x20]
0x10005ac79: vmulps xmm1, xmm0, xmmword ptr [rip + 0xa4d30f] ; 0x100aa7f90
0x10005ac81: vblendps xmm0, xmm1, xmm0, 8
0x10005ac87: vmovaps xmmword ptr [r14 + 0x20], xmm0
0x10005ac8d: mov dword ptr [r14 + 0x3c], 0x3e4ccccd
0x10005ac95: vmovaps xmm0, xmmword ptr [rip + 0xa4d303] ; 0x100aa7fa0
0x10005ac9d: vmovups xmmword ptr [r14 + 0x1f4], xmm0
0x10005aca6: mov qword ptr [r14 + 0x204], 0x42c80000
0x10005acb1: mov dword ptr [r14 + 0x20c], 0x3c23d70a
0x10005acbc: lea rdi, [rbp - 0x980]
0x10005acc3: mov rsi, r15
0x10005acc6: call 0x10076be90 ; 0x10076be90
0x10005accb: mov eax, dword ptr [rbp - 0x97c]
0x10005acd1: mov dword ptr [r14 + 0x210], eax
0x10005acd8: mov dword ptr [r14 + 0x214], 0x3e4ccccd
0x10005ace3: jmp 0x10005b38a ; 0x10005b38a
0x10005ace8: vmovss xmm0, dword ptr [r13 + 0x14]
0x10005acee: vmovss xmm1, dword ptr [r13 + 0x20]
0x10005acf4: lea rax, [rip + 0x1fa03d5] ; 0x101ffb0d0
0x10005acfb: cmp byte ptr [rax], 0
0x10005acfe: vmovss xmm3, dword ptr [rip + 0xa4a3ba] ; 0x100aa50c0
0x10005ad06: vmovaps xmm2, xmm3
0x10005ad0a: je 0x10005ad17
0x10005ad0c: lea rax, [rip + 0xc5d82d] ; 0x100cb8540
0x10005ad13: vmovss xmm2, dword ptr [rax]
0x10005ad17: vmulss xmm1, xmm1, xmm2
0x10005ad1b: vmulss xmm0, xmm0, xmm1
0x10005ad1f: vmovss xmm1, dword ptr [rip + 0xa4bd75] ; 0x100aa6a9c
0x10005ad27: vmaxss xmm0, xmm1, xmm0
0x10005ad2b: vmovss xmm1, dword ptr [rip + 0xa4bd6d] ; 0x100aa6aa0
0x10005ad33: xor eax, eax
0x10005ad35: cmp byte ptr [r14 + 0x97098], 0
0x10005ad3d: vminss xmm0, xmm1, xmm0
0x10005ad41: vmovss dword ptr [rbp - 0x850], xmm0
0x10005ad49: sete cl
0x10005ad4c: vxorps xmm0, xmm0, xmm0
0x10005ad50: je 0x10005ad56
0x10005ad52: vmovaps xmm0, xmm3
0x10005ad56: vmovss dword ptr [rbp - 0x870], xmm0
0x10005ad5e: mov al, cl
0x10005ad60: lea rcx, [rip + 0xa4d951] ; 0x100aa86b8
0x10005ad67: vmovss xmm0, dword ptr [rcx + rax*4]
0x10005ad6c: call 0x100aa2858 ; 0x100aa2858 _logf
0x10005ad71: vcvtss2sd xmm0, xmm0, xmm0
0x10005ad75: vdivsd xmm0, xmm0, qword ptr [rip + 0xa4d943] ; 0x100aa86c0
0x10005ad7d: vcvtsd2ss xmm0, xmm0, xmm0
0x10005ad81: vmulss xmm0, xmm0, dword ptr [rbp - 0x850]
0x10005ad89: call 0x100aa2708 ; 0x100aa2708 _expf
0x10005ad8e: vmovss xmm3, dword ptr [rip + 0xa4a32a] ; 0x100aa50c0
0x10005ad96: vsubss xmm0, xmm3, xmm0
0x10005ad9a: vxorps xmm2, xmm2, xmm2
0x10005ad9e: vmaxss xmm0, xmm2, xmm0
0x10005ada2: vminss xmm0, xmm3, xmm0
0x10005ada6: vsubss xmm1, xmm3, xmm0
0x10005adaa: vmulss xmm1, xmm1, dword ptr [r14 + 0x9709c]
0x10005adb3: vmulss xmm0, xmm0, dword ptr [rbp - 0x870]
0x10005adbb: vaddss xmm0, xmm0, xmm1
0x10005adbf: vmaxss xmm0, xmm2, xmm0
0x10005adc3: vminss xmm1, xmm3, xmm0
0x10005adc7: vmovss dword ptr [r14 + 0x9709c], xmm1
0x10005add0: vucomiss xmm1, dword ptr [rip + 0xa4d7d8] ; 0x100aa85b0
0x10005add8: jbe 0x10005b377
0x10005adde: vmovss xmm0, dword ptr [rip + 0xa4a2da] ; 0x100aa50c0
0x10005ade6: vsubss xmm0, xmm0, xmm1
0x10005adea: vmovaps xmmword ptr [rbp - 0x850], xmm0
0x10005adf2: vmulss xmm0, xmm0, dword ptr [r14 + 0x254]
0x10005adfb: vmovaps xmmword ptr [rbp - 0x870], xmm1
0x10005ae03: vmulss xmm1, xmm1, dword ptr [rip + 0xa4c9e1] ; 0x100aa77ec
0x10005ae0b: vaddss xmm0, xmm1, xmm0
0x10005ae0f: vmovss dword ptr [r14 + 0x254], xmm0
0x10005ae18: vmovaps xmm0, xmmword ptr [rip + 0xa4d0f0] ; 0x100aa7f10
0x10005ae20: vmovaps xmmword ptr [rbp - 0x880], xmm0
0x10005ae28: lea rdi, [rbp - 0x830]
0x10005ae2f: lea rsi, [rbp - 0x880]
0x10005ae36: vmovss xmm0, dword ptr [rip + 0xa4d77a] ; 0x100aa85b8
0x10005ae3e: call 0x10077d310 ; 0x10077d310
0x10005ae43: vpermilps xmm0, xmmword ptr [rbp - 0x870], 0xc0
0x10005ae4d: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x830]
0x10005ae55: vpermilps xmm1, xmmword ptr [rbp - 0x850], 0xc0
0x10005ae5f: vmulps xmm1, xmm1, xmmword ptr [r14 + 0x230]
0x10005ae68: vaddps xmm0, xmm0, xmm1
0x10005ae6c: vmovaps xmmword ptr [r14 + 0x230], xmm0
0x10005ae75: vmovss xmm0, dword ptr [r14 + 0x9709c]
0x10005ae7e: vmovss xmm1, dword ptr [rip + 0xa4a23a] ; 0x100aa50c0
0x10005ae86: vsubss xmm1, xmm1, xmm0
0x10005ae8a: vmulss xmm2, xmm1, dword ptr [r14 + 0x240]
0x10005ae93: vmulss xmm3, xmm0, dword ptr [rip + 0xa4d721] ; 0x100aa85bc
0x10005ae9b: vaddss xmm2, xmm3, xmm2
0x10005ae9f: vmovss dword ptr [r14 + 0x240], xmm2
0x10005aea8: vmulss xmm2, xmm1, dword ptr [r14 + 0x244]
0x10005aeb1: vxorps xmm3, xmm3, xmm3
0x10005aeb5: vmulss xmm3, xmm0, xmm3
0x10005aeb9: vaddss xmm2, xmm3, xmm2
0x10005aebd: vmovss dword ptr [r14 + 0x244], xmm2
0x10005aec6: vmulss xmm2, xmm1, dword ptr [r14 + 0x1f4]
0x10005aecf: vmulss xmm3, xmm0, dword ptr [rip + 0xa4d6dd] ; 0x100aa85b4
0x10005aed7: vaddss xmm2, xmm3, xmm2
0x10005aedb: vmovss dword ptr [r14 + 0x1f4], xmm2
0x10005aee4: vmulss xmm2, xmm1, dword ptr [r14 + 0x1f8]
0x10005aeed: vmulss xmm3, xmm0, dword ptr [rip + 0xa4c8f3] ; 0x100aa77e8
0x10005aef5: vaddss xmm2, xmm3, xmm2
0x10005aef9: vmovss dword ptr [r14 + 0x1f8], xmm2
0x10005af02: vmulss xmm1, xmm1, dword ptr [r14 + 0x1fc]
0x10005af0b: vmulss xmm0, xmm0, dword ptr [rip + 0xa4d6ad] ; 0x100aa85c0
0x10005af13: vaddss xmm0, xmm0, xmm1
0x10005af17: vmovss dword ptr [r14 + 0x1fc], xmm0
0x10005af20: movabs rax, 0x3a04655e00000000
0x10005af2a: mov qword ptr [r14 + 0x208], rax
0x10005af31: movabs rax, 0x44fa000041a00000
0x10005af3b: mov qword ptr [r14 + 0x200], rax
0x10005af42: lea rdi, [rbp - 0x970]
0x10005af49: mov rsi, qword ptr [rbp - 0x888]
0x10005af50: call 0x10076be90 ; 0x10076be90
0x10005af55: mov eax, dword ptr [rbp - 0x96c]
0x10005af5b: mov dword ptr [r14 + 0x210], eax
0x10005af62: vmovaps xmm0, xmmword ptr [rip + 0xa4cfb6] ; 0x100aa7f20
0x10005af6a: vmovaps xmmword ptr [rbp - 0x880], xmm0
0x10005af72: lea rdi, [rbp - 0x830]
0x10005af79: lea rsi, [rbp - 0x880]
0x10005af80: vmovss xmm0, dword ptr [rip + 0xa4d630] ; 0x100aa85b8
0x10005af88: call 0x10077d310 ; 0x10077d310
0x10005af8d: vmovaps xmm0, xmmword ptr [rip + 0xa4cf9b] ; 0x100aa7f30
0x10005af95: vmovaps xmmword ptr [rbp - 0x880], xmm0
0x10005af9d: lea rdi, [rbp - 0x830]
0x10005afa4: lea rsi, [rbp - 0x880]
0x10005afab: vmovss xmm0, dword ptr [rip + 0xa4d605] ; 0x100aa85b8
0x10005afb3: call 0x10077d310 ; 0x10077d310
0x10005afb8: vmovaps xmm0, xmmword ptr [rbp - 0x830]
0x10005afc0: vmulps xmm1, xmm0, xmmword ptr [rip + 0xa4cf78] ; 0x100aa7f40
0x10005afc8: vblendps xmm0, xmm1, xmm0, 8
0x10005afce: vmovaps xmmword ptr [rbp - 0x8a0], xmm0
0x10005afd6: lea rdi, [rbp - 0x830]
0x10005afdd: vmovss xmm0, dword ptr [rip + 0xa4d5df] ; 0x100aa85c4
0x10005afe5: vmovss xmm1, dword ptr [rip + 0xa4d5db] ; 0x100aa85c8
0x10005afed: vmovss xmm2, dword ptr [rip + 0xa4c0ff] ; 0x100aa70f4
0x10005aff5: vmovss xmm3, dword ptr [rip + 0xa4a0c3] ; 0x100aa50c0
0x10005affd: call 0x10077d540 ; 0x10077d540
0x10005b002: vmovaps xmm0, xmmword ptr [rbp - 0x830]
0x10005b00a: vmulps xmm1, xmm0, xmmword ptr [rip + 0xa4cf3e] ; 0x100aa7f50
0x10005b012: vblendps xmm0, xmm1, xmm0, 8
0x10005b018: movabs rax, 0x44228000c2f00000
0x10005b022: mov qword ptr [r14 + 0x200], rax
0x10005b029: movabs rax, 0x3dcccccd3e99999a
0x10005b033: mov qword ptr [r14 + 0x210], rax
0x10005b03a: mov dword ptr [r14 + 0x208], 0x3f800000
0x10005b045: vmovss xmm1, dword ptr [r14 + 0x9709c]
0x10005b04e: vxorps xmm6, xmm6, xmm6
0x10005b052: vmaxss xmm2, xmm6, xmm1
0x10005b056: vmovss xmm5, dword ptr [rip + 0xa4a062] ; 0x100aa50c0
0x10005b05e: vminss xmm2, xmm5, xmm2
0x10005b062: vmovaps xmm3, xmmword ptr [r14 + 0x20]
0x10005b068: vsubps xmm4, xmm0, xmm3
0x10005b06c: vpermilps xmm2, xmm2, 0
0x10005b072: vmulps xmm2, xmm4, xmm2
0x10005b076: vaddps xmm2, xmm3, xmm2
0x10005b07a: vmovaps xmmword ptr [r14 + 0x20], xmm2
0x10005b080: vsubss xmm2, xmm5, xmm1
0x10005b084: vmulss xmm3, xmm2, dword ptr [r14 + 0x3c]
0x10005b08a: vmulss xmm4, xmm1, dword ptr [rip + 0xa4c756] ; 0x100aa77e8
0x10005b092: vaddss xmm3, xmm4, xmm3
0x10005b096: vmovss dword ptr [r14 + 0x3c], xmm3
0x10005b09c: vmulss xmm3, xmm2, dword ptr [r14 + 0x38]
0x10005b0a2: vmulss xmm1, xmm1, xmm6
0x10005b0a6: vaddss xmm1, xmm1, xmm3
0x10005b0aa: vmovss dword ptr [r14 + 0x38], xmm1
0x10005b0b0: mov dword ptr [r14 + 0x280], 0x3dcccccd
0x10005b0bb: vmulps xmm0, xmm0, xmmword ptr [r14 + 0x270]
0x10005b0c4: vmovaps xmmword ptr [r14 + 0x270], xmm0
0x10005b0cd: vmulps xmm0, xmm0, xmmword ptr [rip + 0xa4ce8b] ; 0x100aa7f60
0x10005b0d5: vmovaps xmmword ptr [r14 + 0x2a0], xmm0
0x10005b0de: vmulss xmm0, xmm2, xmm2
0x10005b0e2: vmovaps xmm3, xmm5
0x10005b0e6: vsubss xmm0, xmm3, xmm0
0x10005b0ea: vmulss xmm0, xmm0, dword ptr [rip + 0xa4d4da] ; 0x100aa85cc
0x10005b0f2: vaddss xmm0, xmm0, dword ptr [rip + 0xa4d4d6] ; 0x100aa85d0
0x10005b0fa: vmovss dword ptr [rbp - 0x870], xmm0
0x10005b102: lea rdi, [rbp - 0x830]
0x10005b109: vmovss xmm1, dword ptr [rip + 0xa4d4c3] ; 0x100aa85d4
0x10005b111: vmovss xmm2, dword ptr [rip + 0xa4d4bf] ; 0x100aa85d8
0x10005b119: vmovss xmm0, dword ptr [rip + 0xa4d4a3] ; 0x100aa85c4
0x10005b121: call 0x10077d540 ; 0x10077d540
0x10005b126: vxorps xmm0, xmm0, xmm0
0x10005b12a: vmaxss xmm0, xmm0, dword ptr [rbp - 0x870]
0x10005b132: vmovss xmm3, dword ptr [rip + 0xa49f86] ; 0x100aa50c0
0x10005b13a: vminss xmm0, xmm3, xmm0
0x10005b13e: vmovaps xmm1, xmmword ptr [rbp - 0x830]
0x10005b146: vmovaps xmm2, xmmword ptr [r14 + 0xc0]
0x10005b14f: vsubps xmm1, xmm1, xmm2
0x10005b153: vpermilps xmm0, xmm0, 0
0x10005b159: vmovaps xmmword ptr [rbp - 0x850], xmm0
0x10005b161: vmulps xmm0, xmm0, xmm1
0x10005b165: vaddps xmm0, xmm2, xmm0
0x10005b169: vmovaps xmmword ptr [r14 + 0xc0], xmm0
0x10005b172: lea rdi, [rbp - 0x830]
0x10005b179: vmovss xmm0, dword ptr [rip + 0xa4d45b] ; 0x100aa85dc
0x10005b181: vmovss xmm1, dword ptr [rip + 0xa4d457] ; 0x100aa85e0
0x10005b189: vmovss xmm2, dword ptr [rip + 0xa4d453] ; 0x100aa85e4
0x10005b191: call 0x10077d540 ; 0x10077d540
0x10005b196: vmovaps xmm0, xmmword ptr [rbp - 0x830]
0x10005b19e: vmovaps xmm1, xmmword ptr [r14 + 0xd0]
0x10005b1a7: vsubps xmm0, xmm0, xmm1
0x10005b1ab: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x850]
0x10005b1b3: vaddps xmm0, xmm1, xmm0
0x10005b1b7: vmovaps xmmword ptr [r14 + 0xd0], xmm0
0x10005b1c0: lea rdi, [rbp - 0x830]
0x10005b1c7: vmovss xmm0, dword ptr [rip + 0xa4d419] ; 0x100aa85e8
0x10005b1cf: vmovss xmm1, dword ptr [rip + 0xa4d415] ; 0x100aa85ec
0x10005b1d7: vmovss xmm2, dword ptr [rip + 0xa4bf15] ; 0x100aa70f4
0x10005b1df: vmovss xmm3, dword ptr [rip + 0xa49ed9] ; 0x100aa50c0
0x10005b1e7: call 0x10077d540 ; 0x10077d540
0x10005b1ec: vmovaps xmm0, xmmword ptr [rbp - 0x830]
0x10005b1f4: vmovaps xmm1, xmmword ptr [r14 + 0xe0]
0x10005b1fd: vsubps xmm0, xmm0, xmm1
0x10005b201: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x850]
0x10005b209: vaddps xmm0, xmm1, xmm0
0x10005b20d: vmovaps xmmword ptr [r14 + 0xe0], xmm0
0x10005b216: lea rdi, [rbp - 0x830]
0x10005b21d: vmovss xmm0, dword ptr [rip + 0xa4d3cb] ; 0x100aa85f0
0x10005b225: vmovss xmm1, dword ptr [rip + 0xa4d3c7] ; 0x100aa85f4
0x10005b22d: vmovss xmm2, dword ptr [rip + 0xa4d3c3] ; 0x100aa85f8
0x10005b235: vmovss xmm3, dword ptr [rip + 0xa49e83] ; 0x100aa50c0
0x10005b23d: call 0x10077d540 ; 0x10077d540
0x10005b242: vmovaps xmm0, xmmword ptr [rbp - 0x830]
0x10005b24a: vmovaps xmm1, xmmword ptr [r14 + 0xf0]
0x10005b253: vsubps xmm0, xmm0, xmm1
0x10005b257: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x850]
0x10005b25f: vaddps xmm0, xmm1, xmm0
0x10005b263: vmovaps xmmword ptr [r14 + 0xf0], xmm0
0x10005b26c: lea rdi, [rbp - 0x830]
0x10005b273: vmovss xmm2, dword ptr [rip + 0xa4d381] ; 0x100aa85fc
0x10005b27b: vmovss xmm0, dword ptr [rip + 0xa4d36d] ; 0x100aa85f0
0x10005b283: vmovss xmm1, dword ptr [rip + 0xa49e35] ; 0x100aa50c0
0x10005b28b: vmovaps xmm3, xmm1
0x10005b28f: call 0x10077d540 ; 0x10077d540
0x10005b294: vmovaps xmm0, xmmword ptr [rbp - 0x830]
0x10005b29c: vmovaps xmm1, xmmword ptr [r14 + 0x100]
0x10005b2a5: vsubps xmm0, xmm0, xmm1
0x10005b2a9: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x850]
0x10005b2b1: vaddps xmm0, xmm1, xmm0
0x10005b2b5: vmovaps xmmword ptr [r14 + 0x100], xmm0
0x10005b2be: vmovss xmm1, dword ptr [rbp - 0x870]
0x10005b2c6: vmovss xmm0, dword ptr [rip + 0xa49df2] ; 0x100aa50c0
0x10005b2ce: vsubss xmm0, xmm0, xmm1
0x10005b2d2: vmulss xmm2, xmm0, dword ptr [r14 + 0xb0]
0x10005b2db: vmovss xmm0, dword ptr [rip + 0xa4d2d1] ; 0x100aa85b4
0x10005b2e3: vmulss xmm1, xmm1, xmm0
0x10005b2e7: vaddss xmm1, xmm1, xmm2
0x10005b2eb: vmovss dword ptr [r14 + 0xb0], xmm1
0x10005b2f4: mov byte ptr [r14 + 0x97098], 0
0x10005b2fc: mov rsi, qword ptr [rbp - 0x860]
0x10005b303: mov rdi, qword ptr [rsi + 0x528]
0x10005b30a: vmovaps xmm1, xmmword ptr [rbp - 0x8a0]
0x10005b312: vmovaps xmmword ptr [rbp - 0x960], xmm1
0x10005b31a: mov rax, qword ptr [rip + 0xa4cc4f] ; 0x100aa7f70
0x10005b321: mov qword ptr [rbp - 0x940], rax
0x10005b328: mov dword ptr [rbp - 0x938], 0x41f00000
0x10005b332: vmovss xmm1, dword ptr [r14 + 0x9709c]
0x10005b33b: vmulss xmm1, xmm1, dword ptr [rip + 0xa4c97d] ; 0x100aa7cc0
0x10005b343: mov rax, qword ptr [rip + 0xa4cba6] ; 0x100aa7ef0
0x10005b34a: mov qword ptr [rbp - 0x930], rax
0x10005b351: mov dword ptr [rbp - 0x928], 0x447a0000
0x10005b35b: lea rdx, [rbp - 0x960]
0x10005b362: lea rcx, [rbp - 0x940]
0x10005b369: lea r8, [rbp - 0x930]
0x10005b370: call 0x100450780 ; 0x100450780
0x10005b375: jmp 0x10005b38a ; 0x10005b38a
0x10005b377: mov rsi, qword ptr [rbp - 0x860]
0x10005b37e: mov rdi, qword ptr [rsi + 0x528]
0x10005b385: call 0x100450af0 ; 0x100450af0
0x10005b38a: vmovss xmm0, dword ptr [r14 + 0x1fc]
0x10005b393: mov rdi, qword ptr [rbp + 0x38]
0x10005b397: call 0x100720a30 ; 0x100720a30
0x10005b39c: vmovss xmm1, dword ptr [rip + 0xa4d25c] ; 0x100aa8600
0x10005b3a4: vmulss xmm0, xmm1, dword ptr [r14 + 0x30]
0x10005b3aa: vmovss xmm2, dword ptr [rip + 0xa4d252] ; 0x100aa8604
0x10005b3b2: vdivss xmm0, xmm0, xmm2
0x10005b3b6: vmulss xmm1, xmm1, dword ptr [r14 + 0x34]
0x10005b3bc: vdivss xmm1, xmm1, xmm2
0x10005b3c0: lea rdi, [rbp - 0x950]
0x10005b3c7: call 0x100064550 ; 0x100064550
0x10005b3cc: vmovdqa xmm2, xmmword ptr [rip + 0xa4c52c] ; 0x100aa7900
0x10005b3d4: vpxor xmm0, xmm2, xmmword ptr [rbp - 0x950]
0x10005b3dc: vpshufd xmm1, xmm0, 0xf5
0x10005b3e1: vmovdqa xmmword ptr [r14 + 0x290], xmm0
0x10005b3ea: vpxor xmm0, xmm1, xmm2
0x10005b3ee: vmovss xmm1, dword ptr [rip + 0xa4d212] ; 0x100aa8608
0x10005b3f6: vmaxss xmm0, xmm1, xmm0
0x10005b3fa: vmovss xmm2, dword ptr [rip + 0xa49cbe] ; 0x100aa50c0
0x10005b402: vinsertps xmm3, xmm2, xmm0, 0x1c
0x10005b408: vmulps xmm0, xmm3, xmm3
0x10005b40c: vmovshdup xmm1, xmm0
0x10005b410: vaddss xmm1, xmm0, xmm1
0x10005b414: vpermilpd xmm0, xmm0, 1
0x10005b41a: vaddss xmm0, xmm0, xmm1
0x10005b41e: vsqrtss xmm0, xmm0, xmm0
0x10005b422: vucomiss xmm0, dword ptr [rip + 0xa4c49a] ; 0x100aa78c4
0x10005b42a: jbe 0x10005b436
0x10005b42c: vpermilps xmm0, xmm0, 0xc0
0x10005b432: vdivps xmm3, xmm3, xmm0
0x10005b436: vmovaps xmmword ptr [rbp - 0x860], xmm3
0x10005b43e: vmovshdup xmm0, xmm3
0x10005b442: vsubss xmm0, xmm2, xmm0
0x10005b446: vmovss xmm1, dword ptr [rip + 0xa4b65a] ; 0x100aa6aa8
0x10005b44e: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x10005b453: vmovss dword ptr [r14 + 0xc70], xmm0
0x10005b45c: vmovaps xmm0, xmmword ptr [r14 + 0x20]
0x10005b462: vmovaps xmmword ptr [r14 + 0xc60], xmm0
0x10005b46b: lea r15, [r14 + 0x50]
0x10005b46f: mov r12b, 1
0x10005b472: cmp byte ptr [r14 + 0x110], 0
0x10005b47a: jne 0x10005b6e2
0x10005b480: lea rdi, [rbp - 0x830]
0x10005b487: mov rsi, qword ptr [rbp - 0x888]
0x10005b48e: call 0x10076be90 ; 0x10076be90
0x10005b493: vmovaps xmm1, xmmword ptr [r14 + 0x97080]
0x10005b49c: vmovaps xmm0, xmmword ptr [rbp - 0x830]
0x10005b4a4: vsubps xmm2, xmm1, xmm0
0x10005b4a8: vmulps xmm2, xmm2, xmm2
0x10005b4ac: vmovshdup xmm3, xmm2
0x10005b4b0: vaddss xmm3, xmm2, xmm3
0x10005b4b4: vpermilpd xmm2, xmm2, 1
0x10005b4ba: vaddss xmm2, xmm2, xmm3
0x10005b4be: vsqrtss xmm2, xmm2, xmm2
0x10005b4c2: vpermilps xmm3, xmm1, 0xe7
0x10005b4c8: vmulss xmm2, xmm2, xmm2
0x10005b4cc: vmulss xmm4, xmm3, xmm3
0x10005b4d0: vsubss xmm2, xmm2, xmm4
0x10005b4d4: vxorps xmm4, xmm4, xmm4
0x10005b4d8: vmaxss xmm4, xmm4, xmm2
0x10005b4dc: vxorps xmm6, xmm6, xmm6
0x10005b4e0: vcmpunordss xmm2, xmm2, xmm2
0x10005b4e5: vandnps xmm2, xmm2, xmm4
0x10005b4e9: vsqrtss xmm2, xmm2, xmm2
0x10005b4ed: vmovss xmm4, dword ptr [rip + 0xa4d117] ; 0x100aa860c
0x10005b4f5: vmaxss xmm5, xmm4, xmm2
0x10005b4f9: vcmpunordss xmm2, xmm2, xmm2
0x10005b4fe: vandnps xmm5, xmm2, xmm5
0x10005b502: vandps xmm2, xmm2, xmm4
0x10005b506: vorps xmm2, xmm5, xmm2
0x10005b50a: vmovaps xmm5, xmmword ptr [rbp - 0x860]
0x10005b512: vmulps xmm4, xmm5, xmmword ptr [rip + 0xa4ca96] ; 0x100aa7fb0
0x10005b51a: vaddps xmm4, xmm4, xmm0
0x10005b51e: vpermilps xmm2, xmm2, 0xc0
0x10005b524: vmulps xmm2, xmm5, xmm2
0x10005b528: vaddps xmm2, xmm0, xmm2
0x10005b52c: vsubps xmm1, xmm2, xmm1
0x10005b530: vmulps xmm1, xmm1, xmm1
0x10005b534: vmovshdup xmm2, xmm1
0x10005b538: vaddss xmm2, xmm1, xmm2
0x10005b53c: vpermilpd xmm1, xmm1, 1
0x10005b542: vaddss xmm1, xmm1, xmm2
0x10005b546: vsqrtss xmm1, xmm1, xmm1
0x10005b54a: vsubss xmm1, xmm1, xmm3
0x10005b54e: vinsertps xmm1, xmm4, xmm1, 0x10
0x10005b554: vsubps xmm1, xmm1, xmm0
0x10005b558: vmovshdup xmm3, xmm0
0x10005b55c: vmovaps xmmword ptr [rbp - 0x8c0], xmm3
0x10005b564: vmulps xmm0, xmm1, xmm1
0x10005b568: vmovshdup xmm2, xmm0
0x10005b56c: vaddss xmm2, xmm0, xmm2
0x10005b570: vpermilpd xmm0, xmm0, 1
0x10005b576: vaddss xmm0, xmm0, xmm2
0x10005b57a: vsqrtss xmm2, xmm0, xmm0
0x10005b57e: vmovss dword ptr [rbp - 0x850], xmm2
0x10005b586: vmovshdup xmm0, xmm1
0x10005b58a: vdivss xmm0, xmm0, xmm2
0x10005b58e: xor eax, eax
0x10005b590: vucomiss xmm6, xmm0
0x10005b594: seta al
0x10005b597: vandps xmm1, xmm0, xmmword ptr [rip + 0xa4c371] ; 0x100aa7910
0x10005b59f: vcmpltss xmm1, xmm1, dword ptr [rip + 0xa4c240] ; 0x100aa77e8
0x10005b5a8: lea rcx, [rip + 0xa4d119] ; 0x100aa86c8
0x10005b5af: vmovss xmm2, dword ptr [rcx + rax*4]
0x10005b5b4: vblendvps xmm0, xmm0, xmm2, xmm1
0x10005b5ba: vmovaps xmmword ptr [rbp - 0x860], xmm0
0x10005b5c2: vmovss xmm0, dword ptr [r14 + 0xb0]
0x10005b5cb: vmulss xmm0, xmm0, dword ptr [rip + 0xa4d03d] ; 0x100aa8610
0x10005b5d3: vmovss dword ptr [rbp - 0x870], xmm0
0x10005b5db: vmulss xmm0, xmm3, dword ptr [rip + 0xa4d031] ; 0x100aa8614
0x10005b5e3: call 0x100aa2702 ; 0x100aa2702 _exp2f
0x10005b5e8: vmovss dword ptr [rbp - 0x8a0], xmm0
0x10005b5f0: vmovaps xmm0, xmmword ptr [rbp - 0x860]
0x10005b5f8: vmulss xmm0, xmm0, dword ptr [rbp - 0x850]
0x10005b600: vaddss xmm0, xmm0, dword ptr [rbp - 0x8c0]
0x10005b608: vmulss xmm0, xmm0, dword ptr [rip + 0xa4d004] ; 0x100aa8614
0x10005b610: call 0x100aa2702 ; 0x100aa2702 _exp2f
0x10005b615: vmovss xmm1, dword ptr [rbp - 0x8a0]
0x10005b61d: vsubss xmm0, xmm1, xmm0
0x10005b621: vmulss xmm0, xmm0, dword ptr [rbp - 0x870]
0x10005b629: vmovaps xmm1, xmmword ptr [rbp - 0x860]
0x10005b631: vmulss xmm1, xmm1, dword ptr [rip + 0xa4cfdf] ; 0x100aa8618
0x10005b639: vdivss xmm0, xmm0, xmm1
0x10005b63d: vxorps xmm1, xmm1, xmm1
0x10005b641: vmaxss xmm0, xmm1, xmm0
0x10005b645: vmovss xmm1, dword ptr [rip + 0xa4cfcf] ; 0x100aa861c
0x10005b64d: vminss xmm0, xmm1, xmm0
0x10005b651: vmulss xmm0, xmm0, dword ptr [rip + 0xa4cfc7] ; 0x100aa8620
0x10005b659: vmulss xmm0, xmm0, dword ptr [r14 + 0xc70]
0x10005b662: call 0x100aa2702 ; 0x100aa2702 _exp2f
0x10005b667: vmovss dword ptr [rbp - 0x860], xmm0
0x10005b66f: lea rdi, [rbp - 0x830]
0x10005b676: vmovss xmm1, dword ptr [rip + 0xa4c15e] ; 0x100aa77dc
0x10005b67e: mov rsi, r14
0x10005b681: call 0x100064820 ; 0x100064820
0x10005b686: vmovss xmm0, dword ptr [rip + 0xa49a32] ; 0x100aa50c0
0x10005b68e: vminss xmm0, xmm0, dword ptr [rbp - 0x860]
0x10005b696: lea rax, [rip + 0x1fe4013] ; 0x10203f6b0
0x10005b69d: vmovaps xmm1, xmmword ptr [rax]
0x10005b6a1: vmovaps xmm2, xmmword ptr [rbp - 0x830]
0x10005b6a9: vsubps xmm1, xmm1, xmm2
0x10005b6ad: vpermilps xmm0, xmm0, 0
0x10005b6b3: vmulps xmm0, xmm0, xmm1
0x10005b6b7: vaddps xmm0, xmm2, xmm0
0x10005b6bb: vmovaps xmm1, xmmword ptr [r14 + 0x20]
0x10005b6c1: vmulps xmm0, xmm1, xmm0
0x10005b6c5: vbroadcastss xmm2, dword ptr [r14 + 0x3c]
0x10005b6cb: vmulps xmm0, xmm2, xmm0
0x10005b6cf: vblendps xmm0, xmm0, xmm1, 8
0x10005b6d5: vmovaps xmmword ptr [r14 + 0x20], xmm0
0x10005b6db: mov r12b, byte ptr [r14 + 0x110]
0x10005b6e2: mov byte ptr [rip + 0x1d13d8f], r12b ; 0x101d6f478
0x10005b6e9: lea rbx, [r14 + 0x120]
0x10005b6f0: mov edx, 0xd0
0x10005b6f5: mov rdi, rbx
0x10005b6f8: mov rsi, r15
0x10005b6fb: call 0x100aa28ee ; 0x100aa28ee _memcmp
0x10005b700: test eax, eax
0x10005b702: je 0x10005ba02
0x10005b708: mov qword ptr [rbp - 0x908], rbx
0x10005b70f: mov qword ptr [rbp - 0x8f0], r15
0x10005b716: test r12b, r12b
0x10005b719: mov qword ptr [rbp - 0x8d8], r14
0x10005b720: je 0x10005b91c
0x10005b726: lea r13, [r14 + 0xc74]
0x10005b72d: mov r12, r14
0x10005b730: lea r14, [r12 + 0x4c80]
0x10005b738: xor ebx, ebx
0x10005b73a: lea r15, [rbp - 0x830]
0x10005b741: nop word ptr cs:[rax + rax]
0x10005b750: mov eax, ebx
0x10005b752: vcvtsi2ss xmm0, xmm7, rax
0x10005b757: vdivss xmm0, xmm0, dword ptr [rip + 0xa4cec5] ; 0x100aa8624
0x10005b75f: vsqrtss xmm1, xmm0, xmm0
0x10005b763: vandps xmm1, xmm1, xmmword ptr [rip + 0xa4c1a5] ; 0x100aa7910
0x10005b76b: vcmpless xmm0, xmm0, dword ptr [rip + 0xa4ceb4] ; 0x100aa8628
0x10005b774: vandnps xmm1, xmm0, xmm1
0x10005b778: vmovss xmm2, dword ptr [rip + 0xa4ceac] ; 0x100aa862c
0x10005b780: vandps xmm0, xmm0, xmm2
0x10005b784: vorps xmm0, xmm1, xmm0
0x10005b788: vxorps xmm2, xmm2, xmm2
0x10005b78c: mov rdi, r15
0x10005b78f: mov rsi, r12
0x10005b792: vmovss xmm1, dword ptr [rip + 0xa4c042] ; 0x100aa77dc
0x10005b79a: call 0x100064a20 ; 0x100064a20
0x10005b79f: vmovaps xmm0, xmmword ptr [rbp - 0x830]
0x10005b7a7: vmovaps xmmword ptr [r14], xmm0
0x10005b7ac: inc rbx
0x10005b7af: mov rdi, r13
0x10005b7b2: lea r13, [r13 + 4]
0x10005b7b6: mov rsi, r14
0x10005b7b9: call 0x1007ec500 ; 0x1007ec500
0x10005b7be: add r14, 0x10
0x10005b7c2: cmp rbx, 0x40
0x10005b7c6: jne 0x10005b750
0x10005b7c8: lea rcx, [r12 + 0xd74]
0x10005b7d0: lea r14, [r12 + 0x4c80]
0x10005b7d8: lea rbx, [r12 + 0x5080]
0x10005b7e0: mov eax, 1
0x10005b7e5: vmovaps xmm2, xmmword ptr [rip + 0xa4c7d3] ; 0x100aa7fc0
0x10005b7ed: nop dword ptr [rax]
0x10005b7f0: mov dword ptr [rbp - 0x834], eax
0x10005b7f6: sar eax, 2
0x10005b7f9: movsxd rdi, eax
0x10005b7fc: mov rax, rdi
0x10005b7ff: neg rax
0x10005b802: mov qword ptr [rbp - 0x850], rax
0x10005b809: mov eax, edi
0x10005b80b: neg eax
0x10005b80d: cdqe 
0x10005b80f: inc rdi
0x10005b812: mov qword ptr [rbp - 0x860], rdi
0x10005b819: lea rdi, [rax - 1]
0x10005b81d: mov qword ptr [rbp - 0x8a0], rdi
0x10005b824: add rax, 0x7d
0x10005b828: mov qword ptr [rbp - 0x870], rax
0x10005b82f: xor r15d, r15d
0x10005b832: mov qword ptr [rbp - 0x8a8], rbx
0x10005b839: xor r12d, r12d
0x10005b83c: mov r13, rcx
0x10005b83f: lea rcx, [rcx + 0x100]
0x10005b846: mov qword ptr [rbp - 0x8c0], rcx
0x10005b84d: nop dword ptr [rax]
0x10005b850: mov rax, qword ptr [rbp - 0x850]
0x10005b857: lea rax, [rax + r12]
0x10005b85b: mov rdi, qword ptr [rbp - 0x860]
0x10005b862: lea ecx, [rdi + r15]
0x10005b866: mov rdx, qword ptr [rbp - 0x8a0]
0x10005b86d: lea edx, [rdx + r12]
0x10005b871: test rax, rax
0x10005b874: cmovle edx, ecx
0x10005b877: lea eax, [r12 + rdi]
0x10005b87b: mov rcx, qword ptr [rbp - 0x870]
0x10005b882: lea ecx, [rcx + r15]
0x10005b886: cmp eax, 0x3f
0x10005b889: cmovbe ecx, eax
0x10005b88c: movsxd rax, edx
0x10005b88f: shl rax, 4
0x10005b893: vmulps xmm0, xmm2, xmmword ptr [r14 + rax]
0x10005b899: vmovaps xmm1, xmmword ptr [rip + 0xa4c72f] ; 0x100aa7fd0
0x10005b8a1: vmulps xmm1, xmm1, xmmword ptr [rbx - 0x400]
0x10005b8a9: vaddps xmm0, xmm0, xmm1
0x10005b8ad: movsxd rax, ecx
0x10005b8b0: shl rax, 4
0x10005b8b4: vmulps xmm1, xmm2, xmmword ptr [r14 + rax]
0x10005b8ba: vaddps xmm0, xmm0, xmm1
0x10005b8be: vmovaps xmmword ptr [rbx], xmm0
0x10005b8c2: mov rdi, r13
0x10005b8c5: lea r13, [r13 + 4]
0x10005b8c9: mov rsi, rbx
0x10005b8cc: call 0x1007ec500 ; 0x1007ec500
0x10005b8d1: vmovaps xmm2, xmmword ptr [rip + 0xa4c6e7] ; 0x100aa7fc0
0x10005b8d9: inc r12
0x10005b8dc: add rbx, 0x10
0x10005b8e0: dec r15
0x10005b8e3: cmp r12, 0x40
0x10005b8e7: jne 0x10005b850
0x10005b8ed: add r14, 0x400
0x10005b8f4: mov eax, dword ptr [rbp - 0x834]
0x10005b8fa: inc eax
0x10005b8fc: mov rbx, qword ptr [rbp - 0x8a8]
0x10005b903: add rbx, 0x400
0x10005b90a: cmp eax, 0x40
0x10005b90d: mov rcx, qword ptr [rbp - 0x8c0]
0x10005b914: jne 0x10005b7f0
0x10005b91a: jmp 0x10005b98f ; 0x10005b98f
0x10005b91c: mov rax, r14
0x10005b91f: lea r14, [rax + 0x4c80]
0x10005b926: lea r15, [rax + 0xc74]
0x10005b92d: xor ebx, ebx
0x10005b92f: lea r13, [rbp - 0x830]
0x10005b936: nop word ptr cs:[rax + rax]
0x10005b940: mov eax, ebx
0x10005b942: vcvtsi2ss xmm0, xmm7, rax
0x10005b947: vdivss xmm0, xmm0, dword ptr [rip + 0xa4ccd5] ; 0x100aa8624
0x10005b94f: mov rdi, r13
0x10005b952: mov rsi, qword ptr [rbp - 0x8d8]
0x10005b959: vmovss xmm1, dword ptr [rip + 0xa4be7b] ; 0x100aa77dc
0x10005b961: call 0x100064820 ; 0x100064820
0x10005b966: vmovaps xmm0, xmmword ptr [rbp - 0x830]
0x10005b96e: vmovaps xmmword ptr [r14], xmm0
0x10005b973: mov rdi, r15
0x10005b976: mov rsi, r14
0x10005b979: call 0x1007ec500 ; 0x1007ec500
0x10005b97e: inc rbx
0x10005b981: add r14, 0x10
0x10005b985: add r15, 4
0x10005b989: cmp rbx, 0x40
0x10005b98d: jne 0x10005b940
0x10005b98f: mov rax, qword ptr [rbp - 0x8f0]
0x10005b996: vmovups ymm0, ymmword ptr [rax + 0xb0]
0x10005b99e: mov rcx, qword ptr [rbp - 0x908]
0x10005b9a5: vmovups ymmword ptr [rcx + 0xb0], ymm0
0x10005b9ad: vmovups ymm0, ymmword ptr [rax + 0xa0]
0x10005b9b5: vmovups ymmword ptr [rcx + 0xa0], ymm0
0x10005b9bd: vmovups ymm0, ymmword ptr [rax + 0x80]
0x10005b9c5: vmovups ymmword ptr [rcx + 0x80], ymm0
0x10005b9cd: vmovups ymm0, ymmword ptr [rax]
0x10005b9d1: vmovups ymm1, ymmword ptr [rax + 0x20]
0x10005b9d6: vmovups ymm2, ymmword ptr [rax + 0x40]
0x10005b9db: vmovups ymm3, ymmword ptr [rax + 0x60]
0x10005b9e0: vmovups ymmword ptr [rcx + 0x60], ymm3
0x10005b9e5: vmovups ymmword ptr [rcx + 0x40], ymm2
0x10005b9ea: vmovups ymmword ptr [rcx + 0x20], ymm1
0x10005b9ef: vmovups ymmword ptr [rcx], ymm0
0x10005b9f3: mov r14, qword ptr [rbp - 0x8d8]
0x10005b9fa: mov byte ptr [r14 + 0x14c80], 1
0x10005ba02: mov al, byte ptr [rip + 0xcc7408] ; 0x100d22e10
0x10005ba08: test al, al
0x10005ba0a: jne 0x10005ba2b
0x10005ba0c: lea rdi, [rip + 0xcc73fd] ; 0x100d22e10
0x10005ba13: vzeroupper 
0x10005ba16: call 0x100aa24e0 ; 0x100aa24e0 ___cxa_guard_acquire
0x10005ba1b: test eax, eax
0x10005ba1d: je 0x10005ba2b
0x10005ba1f: lea rdi, [rip + 0xcc73ea] ; 0x100d22e10
0x10005ba26: call 0x100aa24e6 ; 0x100aa24e6 ___cxa_guard_release
0x10005ba2b: mov al, byte ptr [rip + 0xcc73e7] ; 0x100d22e18
0x10005ba31: test al, al
0x10005ba33: jne 0x10005bacd
0x10005ba39: lea rbx, [rip + 0xcc63d0] ; 0x100d21e10
0x10005ba40: mov esi, 0x100
0x10005ba45: mov rdi, rbx
0x10005ba48: vzeroupper 
0x10005ba4b: call 0x100414240 ; 0x100414240
0x10005ba50: xor eax, eax
0x10005ba52: vmovss xmm0, dword ptr [rip + 0xa4be6a] ; 0x100aa78c4
0x10005ba5a: vxorps xmm1, xmm1, xmm1
0x10005ba5e: vmovaps xmm2, xmmword ptr [rip + 0xa4be9a] ; 0x100aa7900
0x10005ba66: nop word ptr cs:[rax + rax]
0x10005ba70: vmovaps xmm3, xmmword ptr [rax + rbx]
0x10005ba75: vmulps xmm4, xmm3, xmm3
0x10005ba79: vmovshdup xmm5, xmm4
0x10005ba7d: vaddss xmm5, xmm4, xmm5
0x10005ba81: vpermilpd xmm4, xmm4, 1
0x10005ba87: vaddss xmm4, xmm4, xmm5
0x10005ba8b: vsqrtss xmm4, xmm4, xmm4
0x10005ba8f: vucomiss xmm4, xmm0
0x10005ba93: jbe 0x10005ba9f
0x10005ba95: vpermilps xmm4, xmm4, 0xc0
0x10005ba9b: vdivps xmm3, xmm3, xmm4
0x10005ba9f: vmovaps xmmword ptr [rax + rbx], xmm3
0x10005baa4: vmovss xmm3, dword ptr [rax + rbx + 4]
0x10005baaa: vucomiss xmm1, xmm3
0x10005baae: jbe 0x10005baba
0x10005bab0: vxorps xmm3, xmm3, xmm2
0x10005bab4: vmovss dword ptr [rax + rbx + 4], xmm3
0x10005baba: add rax, 0x10
0x10005babe: cmp rax, 0x1000
0x10005bac4: jne 0x10005ba70
0x10005bac6: mov byte ptr [rip + 0xcc734b], 1 ; 0x100d22e18
0x10005bacd: lea rdi, [rbp - 0x920]
0x10005bad4: mov rsi, qword ptr [rbp - 0x888]
0x10005badb: vzeroupper 
0x10005bade: call 0x10076be90 ; 0x10076be90
0x10005bae3: vxorps xmm2, xmm2, xmm2
0x10005bae7: xor ebx, ebx
0x10005bae9: lea r13, [rip + 0xcc6320] ; 0x100d21e10
0x10005baf0: lea r15, [rip + 0xa4cbd1] ; 0x100aa86c8
0x10005baf7: mov r12d, 0x3f
0x10005bafd: vxorps xmm1, xmm1, xmm1
0x10005bb01: nop word ptr cs:[rax + rax]
0x10005bb10: vmovaps xmmword ptr [rbp - 0x870], xmm1
0x10005bb18: vmovaps xmmword ptr [rbp - 0x850], xmm2
0x10005bb20: lea rcx, [r13 + rbx]
0x10005bb25: lea rdi, [rbp - 0x830]
0x10005bb2c: mov rsi, r14
0x10005bb2f: lea rdx, [rbp - 0x920]
0x10005bb36: call 0x100064c60 ; 0x100064c60
0x10005bb3b: vmovaps xmm1, xmmword ptr [r14 + 0x97080]
0x10005bb44: vmovaps xmm0, xmmword ptr [rbp - 0x920]
0x10005bb4c: vsubps xmm2, xmm1, xmm0
0x10005bb50: vmulps xmm2, xmm2, xmm2
0x10005bb54: vmovshdup xmm3, xmm2
0x10005bb58: vaddss xmm3, xmm2, xmm3
0x10005bb5c: vpermilpd xmm2, xmm2, 1
0x10005bb62: vaddss xmm2, xmm2, xmm3
0x10005bb66: vsqrtss xmm2, xmm2, xmm2
0x10005bb6a: vpermilps xmm3, xmm1, 0xe7
0x10005bb70: vmulss xmm2, xmm2, xmm2
0x10005bb74: vmulss xmm4, xmm3, xmm3
0x10005bb78: vsubss xmm2, xmm2, xmm4
0x10005bb7c: vxorps xmm4, xmm4, xmm4
0x10005bb80: vmaxss xmm4, xmm4, xmm2
0x10005bb84: vxorps xmm6, xmm6, xmm6
0x10005bb88: vcmpunordss xmm2, xmm2, xmm2
0x10005bb8d: vandnps xmm2, xmm2, xmm4
0x10005bb91: vsqrtss xmm2, xmm2, xmm2
0x10005bb95: vmovss xmm4, dword ptr [rip + 0xa4ca6f] ; 0x100aa860c
0x10005bb9d: vmovaps xmm5, xmm4
0x10005bba1: vmaxss xmm4, xmm5, xmm2
0x10005bba5: vcmpunordss xmm2, xmm2, xmm2
0x10005bbaa: vandnps xmm4, xmm2, xmm4
0x10005bbae: vandps xmm2, xmm2, xmm5
0x10005bbb2: vorps xmm2, xmm4, xmm2
0x10005bbb6: vmovaps xmm5, xmmword ptr [rbx + r13]
0x10005bbbc: vmovaps xmmword ptr [rbp - 0x8a0], xmm5
0x10005bbc4: vmulps xmm4, xmm5, xmmword ptr [rip + 0xa4c3e4] ; 0x100aa7fb0
0x10005bbcc: vaddps xmm4, xmm0, xmm4
0x10005bbd0: vpermilps xmm2, xmm2, 0xc0
0x10005bbd6: vmulps xmm2, xmm2, xmm5
0x10005bbda: vaddps xmm2, xmm0, xmm2
0x10005bbde: vsubps xmm1, xmm2, xmm1
0x10005bbe2: vmulps xmm1, xmm1, xmm1
0x10005bbe6: vmovshdup xmm2, xmm1
0x10005bbea: vaddss xmm2, xmm1, xmm2
0x10005bbee: vpermilpd xmm1, xmm1, 1
0x10005bbf4: vaddss xmm1, xmm1, xmm2
0x10005bbf8: vsqrtss xmm1, xmm1, xmm1
0x10005bbfc: vsubss xmm1, xmm1, xmm3
0x10005bc00: vinsertps xmm1, xmm4, xmm1, 0x10
0x10005bc06: vsubps xmm1, xmm1, xmm0
0x10005bc0a: vmovshdup xmm3, xmm0
0x10005bc0e: vmovaps xmmword ptr [rbp - 0x8f0], xmm3
0x10005bc16: vmulps xmm0, xmm1, xmm1
0x10005bc1a: vmovshdup xmm2, xmm0
0x10005bc1e: vaddss xmm2, xmm0, xmm2
0x10005bc22: vpermilpd xmm0, xmm0, 1
0x10005bc28: vaddss xmm0, xmm0, xmm2
0x10005bc2c: vsqrtss xmm2, xmm0, xmm0
0x10005bc30: vmovss dword ptr [rbp - 0x8c0], xmm2
0x10005bc38: vmovshdup xmm0, xmm1
0x10005bc3c: vdivss xmm0, xmm0, xmm2
0x10005bc40: xor eax, eax
0x10005bc42: vucomiss xmm6, xmm0
0x10005bc46: seta al
0x10005bc49: vandps xmm1, xmm0, xmmword ptr [rip + 0xa4bcbf] ; 0x100aa7910
0x10005bc51: vcmpltss xmm1, xmm1, dword ptr [rip + 0xa4bb8e] ; 0x100aa77e8
0x10005bc5a: vmovss xmm2, dword ptr [r15 + rax*4]
0x10005bc60: vblendvps xmm0, xmm0, xmm2, xmm1
0x10005bc66: vmovaps xmmword ptr [rbp - 0x860], xmm0
0x10005bc6e: vmovss xmm0, dword ptr [rip + 0xa4c99a] ; 0x100aa8610
0x10005bc76: vmulss xmm0, xmm0, dword ptr [r14 + 0xb0]
0x10005bc7f: vmovss dword ptr [rbp - 0x8a8], xmm0
0x10005bc87: vmovss xmm0, dword ptr [rip + 0xa4c985] ; 0x100aa8614
0x10005bc8f: vmulss xmm0, xmm3, xmm0
0x10005bc93: call 0x100aa2702 ; 0x100aa2702 _exp2f
0x10005bc98: vmovss dword ptr [rbp - 0x834], xmm0
0x10005bca0: vmovss xmm0, dword ptr [rbp - 0x8c0]
0x10005bca8: vmulss xmm0, xmm0, dword ptr [rbp - 0x860]
0x10005bcb0: vaddss xmm0, xmm0, dword ptr [rbp - 0x8f0]
0x10005bcb8: vmulss xmm0, xmm0, dword ptr [rip + 0xa4c954] ; 0x100aa8614
0x10005bcc0: call 0x100aa2702 ; 0x100aa2702 _exp2f
0x10005bcc5: vmovss xmm1, dword ptr [rbp - 0x834]
0x10005bccd: vsubss xmm0, xmm1, xmm0
0x10005bcd1: vmulss xmm0, xmm0, dword ptr [rbp - 0x8a8]
0x10005bcd9: vmovaps xmm1, xmmword ptr [rbp - 0x860]
0x10005bce1: vmulss xmm1, xmm1, dword ptr [rip + 0xa4c92f] ; 0x100aa8618
0x10005bce9: vdivss xmm0, xmm0, xmm1
0x10005bced: vxorps xmm1, xmm1, xmm1
0x10005bcf1: vmaxss xmm0, xmm1, xmm0
0x10005bcf5: vmovss xmm1, dword ptr [rip + 0xa4c91f] ; 0x100aa861c
0x10005bcfd: vminss xmm0, xmm1, xmm0
0x10005bd01: vmovaps xmm1, xmmword ptr [rip + 0xa4bbf7] ; 0x100aa7900
0x10005bd09: vmovaps xmm3, xmm1
0x10005bd0d: vxorps xmm1, xmm3, xmmword ptr [r14 + 0x290]
0x10005bd16: vmulps xmm1, xmm1, xmmword ptr [rbp - 0x8a0]
0x10005bd1e: vmovshdup xmm2, xmm1
0x10005bd22: vaddss xmm2, xmm1, xmm2
0x10005bd26: vpermilpd xmm1, xmm1, 1
0x10005bd2c: vaddss xmm1, xmm1, xmm2
0x10005bd30: vmovss xmm2, dword ptr [rip + 0xa48880] ; 0x100aa45b8
0x10005bd38: vmulss xmm1, xmm1, xmm2
0x10005bd3c: vaddss xmm1, xmm1, xmm2
0x10005bd40: vmulss xmm1, xmm1, xmm1
0x10005bd44: vmulss xmm1, xmm1, dword ptr [rip + 0xa4c8e4] ; 0x100aa8630
0x10005bd4c: vaddss xmm1, xmm1, dword ptr [rip + 0xa4c8e0] ; 0x100aa8634
0x10005bd54: vmulss xmm0, xmm1, xmm0
0x10005bd58: vmulss xmm0, xmm0, dword ptr [r14 + 0xc70]
0x10005bd61: vxorps xmm0, xmm0, xmm3
0x10005bd65: call 0x100aa2702 ; 0x100aa2702 _exp2f
0x10005bd6a: vmovss xmm1, dword ptr [rip + 0xa4934e] ; 0x100aa50c0
0x10005bd72: vmovaps xmm3, xmm1
0x10005bd76: vminss xmm0, xmm3, xmm0
0x10005bd7a: vmulss xmm0, xmm0, dword ptr [rip + 0xa4c8b6] ; 0x100aa8638
0x10005bd82: vroundss xmm1, xmm0, xmm0, 9
0x10005bd88: vcvttss2si rax, xmm1
0x10005bd8d: mov ecx, eax
0x10005bd8f: vcvtsi2ss xmm1, xmm7, rcx
0x10005bd94: vsubss xmm0, xmm0, xmm1
0x10005bd98: cmp eax, 0x3f
0x10005bd9b: mov ecx, 0x3f
0x10005bda0: cmovb ecx, eax
0x10005bda3: shl rcx, 4
0x10005bda7: inc eax
0x10005bda9: cmp eax, 0x3f
0x10005bdac: cmovae eax, r12d
0x10005bdb0: shl rax, 4
0x10005bdb4: vmovaps xmm1, xmmword ptr [r14 + rax + 0x4c80]
0x10005bdbe: vmovaps xmm2, xmmword ptr [r14 + rcx + 0x4c80]
0x10005bdc8: vsubps xmm1, xmm1, xmm2
0x10005bdcc: vpermilps xmm0, xmm0, 0xc0
0x10005bdd2: vmulps xmm0, xmm1, xmm0
0x10005bdd6: vmovaps xmm1, xmmword ptr [rbp - 0x870]
0x10005bdde: vaddps xmm0, xmm2, xmm0
0x10005bde2: vmovaps xmm2, xmmword ptr [rbp - 0x850]
0x10005bdea: vinsertps xmm0, xmm0, xmm3, 0x30
0x10005bdf0: vaddps xmm1, xmm1, xmm0
0x10005bdf4: vaddps xmm2, xmm2, xmmword ptr [rbp - 0x830]
0x10005bdfc: add rbx, 0x10
0x10005be00: cmp rbx, 0x1000
0x10005be07: jne 0x10005bb10
0x10005be0d: vmovaps xmm0, xmmword ptr [rip + 0xa4c1cb] ; 0x100aa7fe0
0x10005be15: vmulps xmm1, xmm1, xmm0
0x10005be19: vmovaps xmmword ptr [r14 + 0xc30], xmm1
0x10005be22: vmulps xmm0, xmm2, xmm0
0x10005be26: vmovaps xmmword ptr [r14 + 0xc40], xmm0
0x10005be2f: vextractps dword ptr [r14 + 0xc50], xmm0, 3
0x10005be39: vmovss xmm0, dword ptr [r14 + 0x97094]
0x10005be42: vxorps xmm1, xmm1, xmm1
0x10005be46: vmaxss xmm1, xmm1, xmm0
0x10005be4a: vcmpunordss xmm0, xmm0, xmm0
0x10005be4f: vandnps xmm0, xmm0, xmm1
0x10005be53: vsqrtss xmm0, xmm0, xmm0
0x10005be57: vmovss xmm1, dword ptr [rip + 0xa49261] ; 0x100aa50c0
0x10005be5f: vsubss xmm1, xmm1, xmm0
0x10005be63: vmulss xmm2, xmm1, dword ptr [r14 + 0x240]
0x10005be6c: vmulss xmm3, xmm0, dword ptr [rip + 0xa4c780] ; 0x100aa85f4
0x10005be74: vaddss xmm2, xmm3, xmm2
0x10005be78: vmovss dword ptr [r14 + 0x240], xmm2
0x10005be81: lea rax, [rip + 0x1fe3858] ; 0x10203f6e0
0x10005be88: vpermilps xmm1, xmm1, 0xc0
0x10005be8e: vmulps xmm1, xmm1, xmmword ptr [r14 + 0x230]
0x10005be97: vpermilps xmm0, xmm0, 0xc0
0x10005be9d: vmulps xmm0, xmm0, xmmword ptr [rax]
0x10005bea1: vaddps xmm0, xmm0, xmm1
0x10005bea5: vmovaps xmmword ptr [r14 + 0x230], xmm0
0x10005beae: lea rdi, [rbp - 0x8d0]
0x10005beb5: mov rbx, qword ptr [rbp - 0x888]
0x10005bebc: mov rsi, rbx
0x10005bebf: call 0x10076be90 ; 0x10076be90
0x10005bec4: vmovaps xmm0, xmmword ptr [rbp - 0x8d0]
0x10005becc: vinsertps xmm1, xmm0, dword ptr [rip + 0xa4c766], 0x10 ; 0x100aa863c
0x10005bed6: vextractps dword ptr [rbp - 0x8c8], xmm0, 2
0x10005bee0: vmovlps qword ptr [rbp - 0x8d0], xmm1
0x10005bee8: lea rdi, [rbp - 0x830]
0x10005beef: mov rsi, rbx
0x10005bef2: call 0x10076be90 ; 0x10076be90
0x10005bef7: vbroadcastss xmm0, dword ptr [rbp - 0x82c]
0x10005bf00: vdivss xmm0, xmm0, dword ptr [rip + 0xa4c738] ; 0x100aa8640
0x10005bf08: vxorps xmm1, xmm1, xmm1
0x10005bf0c: vmaxss xmm0, xmm1, xmm0
0x10005bf10: vmovss xmm1, dword ptr [rip + 0xa491a8] ; 0x100aa50c0
0x10005bf18: vminss xmm0, xmm1, xmm0
0x10005bf1c: vsubss xmm1, xmm1, xmm0
0x10005bf20: vpermilps xmm1, xmm1, 0xc0
0x10005bf26: vmulps xmm1, xmm1, xmmword ptr [rbp - 0x8d0]
0x10005bf2e: vpermilps xmm0, xmm0, 0xc0
0x10005bf34: vmulps xmm0, xmm0, xmmword ptr [rip + 0xa4c0b4] ; 0x100aa7ff0
0x10005bf3c: vaddps xmm0, xmm0, xmm1
0x10005bf40: vmovaps xmmword ptr [rbp - 0x8d0], xmm0
0x10005bf48: vinsertps xmm0, xmm0, dword ptr [rip + 0xa4c6f2], 0x30 ; 0x100aa8644
0x10005bf52: vmovaps xmmword ptr [r14 + 0x97080], xmm0
0x10005bf5b: cmp byte ptr [rip + 0x1d12ac6], 0 ; 0x101d6ea28
0x10005bf62: je 0x10005bf6e
0x10005bf64: call 0x1002acd30 ; 0x1002acd30
0x10005bf69: test rax, rax
0x10005bf6c: jne 0x10005bf94
0x10005bf6e: mov rax, qword ptr [rip + 0xbb1963] ; 0x100c0d8d8
0x10005bf75: mov rax, qword ptr [rax]
0x10005bf78: cmp rax, qword ptr [rbp - 0x30]
0x10005bf7c: jne 0x10005c12c
0x10005bf82: add rsp, 0x968
0x10005bf89: pop rbx
0x10005bf8a: pop r12
0x10005bf8c: pop r13
0x10005bf8e: pop r14
0x10005bf90: pop r15
0x10005bf92: pop rbp
0x10005bf93: ret 
0x10005bf94: call 0x1002acd30 ; 0x1002acd30
0x10005bf99: mov rdi, rax
0x10005bf9c: call 0x1002b22c0 ; 0x1002b22c0
0x10005bfa1: call 0x1002acd30 ; 0x1002acd30
0x10005bfa6: mov rbx, rax
0x10005bfa9: vmovaps xmm0, xmmword ptr [rip + 0xa4c04f] ; 0x100aa8000
0x10005bfb1: vmovaps xmmword ptr [rbp - 0x880], xmm0
0x10005bfb9: lea rdi, [rbp - 0x830]
0x10005bfc0: lea rsi, [rbp - 0x880]
0x10005bfc7: vmovss xmm0, dword ptr [rip + 0xa4c5e9] ; 0x100aa85b8
0x10005bfcf: call 0x10077d310 ; 0x10077d310
0x10005bfd4: vmovaps xmm0, xmmword ptr [rbp - 0x830]
0x10005bfdc: vmovaps xmmword ptr [rbp - 0x880], xmm0
0x10005bfe4: lea rsi, [rip + 0xb06230] ; 0x100b6221b -LIGHTING-
0x10005bfeb: lea rdx, [rbp - 0x880]
0x10005bff2: mov rdi, rbx
0x10005bff5: call 0x1002b21b0 ; 0x1002b21b0
0x10005bffa: lea r15, [rbp - 0x430]
0x10005c001: vmovaps xmm2, xmmword ptr [r14 + 0x20]
0x10005c007: vcvtss2sd xmm0, xmm2, xmm2
0x10005c00b: vmovshdup xmm1, xmm2
0x10005c00f: vcvtss2sd xmm1, xmm1, xmm1
0x10005c013: vpermilpd xmm2, xmm2, 1
0x10005c019: vcvtss2sd xmm2, xmm2, xmm2
0x10005c01d: lea rdx, [rip + 0xb06202] ; 0x100b62226
0x10005c024: mov ebx, 0x400
0x10005c029: lea r12, [rbp - 0x830]
0x10005c030: mov esi, 0x400
0x10005c035: mov al, 3
0x10005c037: mov rdi, r12
0x10005c03a: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x10005c03f: cdqe 
0x10005c041: lea r13, [rbp + rax - 0x830]
0x10005c049: sub rbx, rax
0x10005c04c: vmovaps xmm2, xmmword ptr [r14 + 0xc40]
0x10005c055: vcvtss2sd xmm0, xmm2, xmm2
0x10005c059: vmovshdup xmm1, xmm2
0x10005c05d: vcvtss2sd xmm1, xmm1, xmm1
0x10005c061: vpermilpd xmm2, xmm2, 1
0x10005c067: vcvtss2sd xmm2, xmm2, xmm2
0x10005c06b: vmovss xmm3, dword ptr [r14 + 0xc50]
0x10005c074: vcvtss2sd xmm3, xmm3, xmm3
0x10005c078: lea rdx, [rip + 0xb061ba] ; 0x100b62239
0x10005c07f: mov al, 4
0x10005c081: mov rsi, rbx
0x10005c084: mov rdi, r13
0x10005c087: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x10005c08c: movsxd rdi, eax
0x10005c08f: add rdi, r13
0x10005c092: sub r15, rdi
0x10005c095: vmovaps xmm2, xmmword ptr [r14 + 0xc30]
0x10005c09e: vcvtss2sd xmm0, xmm2, xmm2
0x10005c0a2: vmovshdup xmm1, xmm2
0x10005c0a6: vcvtss2sd xmm1, xmm1, xmm1
0x10005c0aa: vpermilpd xmm2, xmm2, 1
0x10005c0b0: vcvtss2sd xmm2, xmm2, xmm2
0x10005c0b4: lea rdx, [rip + 0xb061a0] ; 0x100b6225b
0x10005c0bb: mov al, 3
0x10005c0bd: mov rsi, r15
0x10005c0c0: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x10005c0c5: call 0x1002acd30 ; 0x1002acd30
0x10005c0ca: mov rbx, rax
0x10005c0cd: vmovaps xmm0, xmmword ptr [rip + 0xa4bf2b] ; 0x100aa8000
0x10005c0d5: vmovaps xmmword ptr [rbp - 0x900], xmm0
0x10005c0dd: lea rdi, [rbp - 0x880]
0x10005c0e4: lea rsi, [rbp - 0x900]
0x10005c0eb: vmovss xmm0, dword ptr [rip + 0xa4c4c5] ; 0x100aa85b8
0x10005c0f3: call 0x10077d310 ; 0x10077d310
0x10005c0f8: vmovaps xmm0, xmmword ptr [rbp - 0x880]
0x10005c100: vmovaps xmmword ptr [rbp - 0x900], xmm0
0x10005c108: lea rdx, [rbp - 0x900]
0x10005c10f: mov rdi, rbx
0x10005c112: mov rsi, r12
0x10005c115: call 0x1002b21b0 ; 0x1002b21b0
0x10005c11a: call 0x1002acd30 ; 0x1002acd30
0x10005c11f: mov rdi, rax
0x10005c122: call 0x1002b22c0 ; 0x1002b22c0
0x10005c127: jmp 0x10005bf6e ; 0x10005bf6e
0x10005c12c: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10005c131: nop word ptr cs:[rax + rax]
