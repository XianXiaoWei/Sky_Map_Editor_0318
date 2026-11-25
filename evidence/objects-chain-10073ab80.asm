0x10073ab80: push rbp
0x10073ab81: mov rbp, rsp
0x10073ab84: push r14
0x10073ab86: push rbx
0x10073ab87: sub rsp, 0x40
0x10073ab8b: mov r14, rsi
0x10073ab8e: mov rbx, rdi
0x10073ab91: mov rdi, qword ptr [r14 + 0x280]
0x10073ab98: call 0x1000fe060 ; 0x1000fe060
0x10073ab9d: test al, al
0x10073ab9f: je 0x10073aec5
0x10073aba5: mov rdi, qword ptr [r14 + 0x280]
0x10073abac: call 0x1000fc260 ; 0x1000fc260
0x10073abb1: mov rsi, qword ptr [rax + 0x18]
0x10073abb5: vmovaps xmm0, xmmword ptr [rsi + 0x10]
0x10073abba: vaddps xmm0, xmm0, xmmword ptr [rbx + 0x270]
0x10073abc2: vmovaps xmmword ptr [rbx + 0x260], xmm0
0x10073abca: mov rax, qword ptr [r14 + 0x70]
0x10073abce: mov eax, dword ptr [rax + 4]
0x10073abd1: mov dword ptr [rbx + 0x2a8], eax
0x10073abd7: mov dword ptr [rbx + 0x2c0], eax
0x10073abdd: mov dword ptr [rbx + 0x2e0], eax
0x10073abe3: mov qword ptr [rbx + 0x2e4], 0
0x10073abee: mov byte ptr [rbx + 0x350], 1
0x10073abf5: add rsi, 0x40
0x10073abf9: lea rdi, [rbp - 0x50]
0x10073abfd: call 0x100147510 ; 0x100147510
0x10073ac02: vmovaps xmm3, xmmword ptr [rbp - 0x50]
0x10073ac07: vxorps xmm9, xmm3, xmmword ptr [rip + 0x36ccf1] ; 0x100aa7900
0x10073ac0f: vmulps xmm0, xmm3, xmmword ptr [rip + 0x36e629] ; 0x100aa9240
0x10073ac17: vpermilps xmm0, xmm0, 0xd2
0x10073ac1d: vmulps xmm1, xmm3, xmmword ptr [rip + 0x36ccfb] ; 0x100aa7920
0x10073ac25: vsubps xmm0, xmm0, xmm1
0x10073ac29: vpermilps xmm1, xmm0, 0xd2
0x10073ac2f: vmulps xmm0, xmm0, xmm9
0x10073ac34: vpermilps xmm0, xmm0, 0xd2
0x10073ac3a: vpermilps xmm2, xmm1, 0xd2
0x10073ac40: vmulps xmm2, xmm2, xmm3
0x10073ac44: vaddps xmm0, xmm0, xmm2
0x10073ac48: vpermilps xmm0, xmm0, 0xd2
0x10073ac4e: vxorps xmm2, xmm2, xmm2
0x10073ac52: vblendps xmm0, xmm0, xmm2, 8
0x10073ac58: vblendps xmm1, xmm1, xmm2, 8
0x10073ac5e: vblendps xmm2, xmm9, xmm2, 8
0x10073ac64: vmovaps xmmword ptr [rbp - 0x40], xmm3
0x10073ac69: vmulps xmm4, xmm3, xmmword ptr [rip + 0x38404f] ; 0x100abecc0
0x10073ac71: vmovaps xmm8, xmmword ptr [rbx + 0x260]
0x10073ac79: vaddps xmm4, xmm8, xmm4
0x10073ac7d: vinsertps xmm5, xmm4, dword ptr [rip + 0x36a439], 0x30 ; 0x100aa50c0
0x10073ac87: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x10073ac8c: vmovaps xmmword ptr [rbx + 0x40], xmm1
0x10073ac91: vmovaps xmmword ptr [rbx + 0x50], xmm2
0x10073ac96: vmovaps xmmword ptr [rbx + 0x60], xmm5
0x10073ac9b: mov eax, dword ptr [rbx + 0x2e0]
0x10073aca1: mov dword ptr [rbx + 0x24], eax
0x10073aca4: vmovaps xmmword ptr [rbx + 0x2f0], xmm4
0x10073acac: vpermilpd xmm6, xmm4, 1
0x10073acb2: vmovapd xmm5, xmmword ptr [rip + 0x36cc56] ; 0x100aa7910
0x10073acba: vandpd xmm7, xmm6, xmm5
0x10073acbe: vucomiss xmm7, dword ptr [rip + 0x36d966] ; 0x100aa862c
0x10073acc6: jae 0x10073aece
0x10073accc: vmovshdup xmm7, xmm4
0x10073acd0: vandps xmm3, xmm7, xmm5
0x10073acd4: vucomiss xmm3, dword ptr [rip + 0x36d950] ; 0x100aa862c
0x10073acdc: jae 0x10073aece
0x10073ace2: vucomiss xmm4, xmm7
0x10073ace6: jp 0x10073aece
0x10073acec: vucomiss xmm6, xmm6
0x10073acf0: jp 0x10073aece
0x10073acf6: vandps xmm3, xmm4, xmm5
0x10073acfa: vucomiss xmm3, dword ptr [rip + 0x36d92a] ; 0x100aa862c
0x10073ad02: jae 0x10073aece
0x10073ad08: vmovaps xmmword ptr [rbx + 0x300], xmm4
0x10073ad10: vmovaps xmmword ptr [rbx + 0x310], xmm0
0x10073ad18: vmovaps xmmword ptr [rbx + 0x320], xmm1
0x10073ad20: vmovaps xmmword ptr [rbx + 0x330], xmm2
0x10073ad28: vmovss xmm0, dword ptr [rip + 0x373ccc] ; 0x100aae9fc
0x10073ad30: vmovaps xmmword ptr [rbx + 0x340], xmm0
0x10073ad38: vpermilpd xmm0, xmm9, 1
0x10073ad3e: vmovapd xmm1, xmmword ptr [rip + 0x36cbba] ; 0x100aa7900
0x10073ad46: vxorpd xmm0, xmm0, xmm1
0x10073ad4a: vxorpd xmm1, xmm9, xmm1
0x10073ad4e: vmovaps xmmword ptr [rbp - 0x30], xmm9
0x10073ad53: call 0x100aa25a0 ; 0x100aa25a0 _atan2f
0x10073ad58: vmovss xmm1, dword ptr [rip + 0x36e874] ; 0x100aa95d4
0x10073ad60: vsubss xmm0, xmm1, xmm0
0x10073ad64: vmovss dword ptr [rbp - 0x14], xmm0
0x10073ad69: vmovss dword ptr [rbx + 0x298], xmm0
0x10073ad71: vmovshdup xmm0, xmmword ptr [rbp - 0x30]
0x10073ad76: vxorps xmm0, xmm0, xmmword ptr [rip + 0x36cb82] ; 0x100aa7900
0x10073ad7e: call 0x100aa2588 ; 0x100aa2588 _asinf
0x10073ad83: vmovss dword ptr [rbx + 0x290], xmm0
0x10073ad8b: vmovss xmm1, dword ptr [rbp - 0x14]
0x10073ad90: vmovss dword ptr [rbx + 0x2d4], xmm1
0x10073ad98: vmovss dword ptr [rbx + 0x2d8], xmm0
0x10073ada0: mov dword ptr [rbx + 0x2dc], 0
0x10073adaa: mov byte ptr [rbx + 0x100], 0
0x10073adb1: mov byte ptr [rbx + 0x11c], 0
0x10073adb8: mov dword ptr [rbx + 0x120], 0
0x10073adc2: mov eax, dword ptr [rip + 0x5f708c] ; 0x100d31e54
0x10073adc8: mov dword ptr [rbx + 0x130], eax
0x10073adce: vxorps xmm0, xmm0, xmm0
0x10073add2: vmovaps xmmword ptr [rbx + 0x140], xmm0
0x10073adda: mov byte ptr [rbx + 0x102], 1
0x10073ade1: mov qword ptr [rbx + 0x104], 0
0x10073adec: mov eax, 0xc2c80000
0x10073adf1: mov qword ptr [rbx + 0x10c], rax
0x10073adf8: mov word ptr [rbx + 0x114], 0
0x10073ae01: vmovaps xmm1, xmmword ptr [rbp - 0x40]
0x10073ae06: vmovaps xmmword ptr [rbx + 0x150], xmm1
0x10073ae0e: vmovaps xmmword ptr [rbx + 0x170], xmm0
0x10073ae16: mov dword ptr [rbx + 0x160], 0x42c80000
0x10073ae20: mov qword ptr [rbx + 0x3c0], 0
0x10073ae2b: mov dword ptr [rbx + 0x21c], 0
0x10073ae35: mov byte ptr [rbx + 0x220], 0
0x10073ae3c: mov word ptr [rbx + 0x1fc], 0
0x10073ae45: mov qword ptr [rbx + 0x1f4], 0
0x10073ae50: mov word ptr [rbx + 0x208], 0
0x10073ae59: mov qword ptr [rbx + 0x200], 0
0x10073ae64: mov qword ptr [rbx + 0x211], 0
0x10073ae6f: mov qword ptr [rbx + 0x20c], 0
0x10073ae7a: vmovaps xmm1, xmmword ptr [rip + 0x39f47e] ; 0x100ada300
0x10073ae82: vmovups xmmword ptr [rbx + 0x224], xmm1
0x10073ae8a: mov dword ptr [rbx + 0x234], 0x44fa0000
0x10073ae94: mov dword ptr [rbx + 0x238], 0x3f800000
0x10073ae9e: mov byte ptr [rbx + 0x1f0], 0
0x10073aea5: mov byte ptr [rbx + 0x23c], 0
0x10073aeac: vmovaps xmmword ptr [rbx + 0x390], xmm0
0x10073aeb4: mov dword ptr [rbx + 0x3a0], 0
0x10073aebe: mov byte ptr [rbx + 0x23d], 0
0x10073aec5: add rsp, 0x40
0x10073aec9: pop rbx
0x10073aeca: pop r14
0x10073aecc: pop rbp
0x10073aecd: ret 
0x10073aece: vcvtss2sd xmm0, xmm8, xmm8
0x10073aed3: vmovss xmm1, dword ptr [rbx + 0x264]
0x10073aedb: vmovss xmm2, dword ptr [rbx + 0x268]
0x10073aee3: vcvtss2sd xmm1, xmm1, xmm1
0x10073aee7: vcvtss2sd xmm2, xmm2, xmm2
0x10073aeeb: vcvtss2sd xmm3, xmm9, xmm9
0x10073aef0: vmovshdup xmm4, xmm9
0x10073aef5: vcvtss2sd xmm4, xmm4, xmm4
0x10073aef9: vpermilpd xmm5, xmm9, 1
0x10073aeff: vcvtss2sd xmm5, xmm5, xmm5
0x10073af03: lea rdi, [rip + 0x46253b] ; 0x100b9d445 !isNan( m_eyePos ) && !isInf( m_eyePos )
0x10073af0a: lea rsi, [rip + 0x46245d] ; 0x100b9d36e WhiskerCamera.cpp
0x10073af11: lea r8, [rip + 0x462556] ; 0x100b9d46e pivot = (%f, %f, %f) camForward = (%f,%f,%f)
0x10073af18: mov edx, 0x159
0x10073af1d: mov ecx, 4
0x10073af22: mov al, 6
0x10073af24: call 0x1007e6030 ; 0x1007e6030
0x10073af29: ud2 
0x10073af2b: nop dword ptr [rax + rax]
