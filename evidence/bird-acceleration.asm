0x1001a0060: push rbp
0x1001a0061: mov rbp, rsp
0x1001a0064: push r15
0x1001a0066: push r14
0x1001a0068: push r13
0x1001a006a: push r12
0x1001a006c: push rbx
0x1001a006d: sub rsp, 0xd8
0x1001a0074: mov r15, rdx
0x1001a0077: mov rbx, rsi
0x1001a007a: mov r14, rdi
0x1001a007d: mov byte ptr [rbx + 0x21], 0
0x1001a0081: mov rax, qword ptr [r15 + 0x160]
0x1001a0088: lea rcx, [rip + 0x1e5b041] ; 0x101ffb0d0
0x1001a008f: cmp byte ptr [rcx], 0
0x1001a0092: je 0x1001a00a1
0x1001a0094: lea rcx, [rip + 0xb184a5] ; 0x100cb8540
0x1001a009b: vmovss xmm0, dword ptr [rcx]
0x1001a009f: jmp 0x1001a00a9 ; 0x1001a00a9
0x1001a00a1: vmovss xmm0, dword ptr [rip + 0x905017] ; 0x100aa50c0
0x1001a00a9: vmulss xmm0, xmm0, dword ptr [rax + 0x20]
0x1001a00ae: vmulss xmm3, xmm0, dword ptr [rax + 0x14]
0x1001a00b3: vmovss xmm4, dword ptr [rip + 0x9069e1] ; 0x100aa6a9c
0x1001a00bb: mov rax, qword ptr [rbx + 0x10]
0x1001a00bf: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x1001a00c4: vmovaps xmmword ptr [rbp - 0xa0], xmm0
0x1001a00cc: vmovups ymm1, ymmword ptr [rax + 0x20]
0x1001a00d1: vmovups ymm2, ymmword ptr [rax + 0x30]
0x1001a00d6: vmovups ymmword ptr [rbp - 0x80], ymm2
0x1001a00db: vmovups ymmword ptr [rbp - 0x90], ymm1
0x1001a00e3: vmovaps xmm1, xmmword ptr [rax + 0x50]
0x1001a00e8: vmovaps xmmword ptr [rbp - 0x60], xmm1
0x1001a00ed: mov ecx, dword ptr [rax + 0x68]
0x1001a00f0: mov dword ptr [rbp - 0x48], ecx
0x1001a00f3: mov rax, qword ptr [rax + 0x60]
0x1001a00f7: mov qword ptr [rbp - 0x50], rax
0x1001a00fb: vmulps xmm1, xmm1, xmm1
0x1001a00ff: vmovshdup xmm2, xmm1
0x1001a0103: vaddss xmm2, xmm1, xmm2
0x1001a0107: vpermilpd xmm1, xmm1, 1
0x1001a010d: vaddss xmm1, xmm1, xmm2
0x1001a0111: vsqrtss xmm7, xmm1, xmm1
0x1001a0115: cmp qword ptr [rbx + 0x18], 0
0x1001a011a: vmovss dword ptr [rbp - 0x30], xmm7
0x1001a011f: je 0x1001a0157
0x1001a0121: mov rsi, qword ptr [r15 + 0x138]
0x1001a0128: lea rdx, [rbp - 0xa0]
0x1001a012f: mov rdi, rbx
0x1001a0132: vmovaps xmm0, xmm7
0x1001a0136: vmovss dword ptr [rbp - 0x2c], xmm3
0x1001a013b: vzeroupper 
0x1001a013e: call 0x1001a0450 ; 0x1001a0450
0x1001a0143: vmovss xmm4, dword ptr [rip + 0x906951] ; 0x100aa6a9c
0x1001a014b: vmovss xmm3, dword ptr [rbp - 0x2c]
0x1001a0150: vmovss xmm7, dword ptr [rbp - 0x30]
0x1001a0155: jmp 0x1001a017a ; 0x1001a017a
0x1001a0157: vmovaps xmm1, xmmword ptr [rbx + 0x30]
0x1001a015c: vsubps xmm0, xmm1, xmm0
0x1001a0160: vmulps xmm0, xmm0, xmm0
0x1001a0164: vmovshdup xmm1, xmm0
0x1001a0168: vaddss xmm1, xmm0, xmm1
0x1001a016c: vpermilpd xmm0, xmm0, 1
0x1001a0172: vaddss xmm0, xmm0, xmm1
0x1001a0176: vsqrtss xmm0, xmm0, xmm0
0x1001a017a: vmaxss xmm1, xmm4, xmm3
0x1001a017e: vmovss xmm2, dword ptr [rip + 0x90691a] ; 0x100aa6aa0
0x1001a0186: mov eax, dword ptr [rbx + 0x24]
0x1001a0189: mov dword ptr [rbx + 0x28], eax
0x1001a018c: cmp byte ptr [rbx + 0x48], 0
0x1001a0190: je 0x1001a01dd
0x1001a0192: vmovss xmm4, dword ptr [rbp - 0x50]
0x1001a0197: vmulss xmm3, xmm4, dword ptr [rip + 0x908431] ; 0x100aa85d0
0x1001a019f: vsubss xmm5, xmm3, xmm4
0x1001a01a3: vucomiss xmm5, dword ptr [rip + 0x907719] ; 0x100aa78c4
0x1001a01ab: vmovss xmm3, dword ptr [rip + 0x904f0d] ; 0x100aa50c0
0x1001a01b3: ja 0x1001a01c7
0x1001a01b5: vmovss xmm6, dword ptr [rip + 0x909413] ; 0x100aa95d0
0x1001a01bd: vucomiss xmm6, xmm5
0x1001a01c1: vmovaps xmm6, xmm3
0x1001a01c5: jbe 0x1001a01cf
0x1001a01c7: vsubss xmm0, xmm0, xmm4
0x1001a01cb: vdivss xmm6, xmm0, xmm5
0x1001a01cf: vxorps xmm0, xmm0, xmm0
0x1001a01d3: vmaxss xmm0, xmm0, xmm6
0x1001a01d7: vminss xmm0, xmm3, xmm0
0x1001a01db: jmp 0x1001a01e1 ; 0x1001a01e1
0x1001a01dd: vxorps xmm0, xmm0, xmm0
0x1001a01e1: vminss xmm1, xmm2, xmm1
0x1001a01e5: lea r13, [rbp - 0x90]
0x1001a01ec: vmovss dword ptr [rbx + 0x24], xmm0
0x1001a01f1: vucomiss xmm7, dword ptr [rip + 0x9043bf] ; 0x100aa45b8
0x1001a01f9: vmovss dword ptr [rbp - 0x2c], xmm1
0x1001a01fe: jbe 0x1001a0236
0x1001a0200: mov rax, qword ptr [rbx + 8]
0x1001a0204: mov rax, qword ptr [rax + 0x28]
0x1001a0208: test rax, rax
0x1001a020b: je 0x1001a0236
0x1001a020d: mov rax, qword ptr [rbx + 0x10]
0x1001a0211: mov rsi, qword ptr [rax + 0x78]
0x1001a0215: lea rdx, [rbp - 0xa0]
0x1001a021c: mov rdi, rbx
0x1001a021f: vmovss xmm0, dword ptr [rbp - 0x30]
0x1001a0224: vmovss xmm1, dword ptr [rbp - 0x2c]
0x1001a0229: vzeroupper 
0x1001a022c: call 0x1001a06a0 ; 0x1001a06a0
0x1001a0231: vmovss xmm0, dword ptr [rbx + 0x24]
0x1001a0236: lea r12, [rbx + 0x90]
0x1001a023d: vmovaps xmm1, xmmword ptr [rbp - 0xa0]
0x1001a0245: vmovaps xmm2, xmmword ptr [rbp - 0x60]
0x1001a024a: vmovaps xmmword ptr [rbp - 0x100], xmm1
0x1001a0252: vmovups ymm1, ymmword ptr [r13]
0x1001a0258: vmovups ymm3, ymmword ptr [r13 + 0x10]
0x1001a025e: vmovups ymmword ptr [rbp - 0xe0], ymm3
0x1001a0266: vmovups ymmword ptr [rbp - 0xf0], ymm1
0x1001a026e: vmovaps xmmword ptr [rbp - 0xc0], xmm2
0x1001a0276: mov eax, dword ptr [r13 + 0x48]
0x1001a027a: mov dword ptr [rbp - 0xa8], eax
0x1001a0280: mov rax, qword ptr [r13 + 0x40]
0x1001a0284: mov qword ptr [rbp - 0xb0], rax
0x1001a028b: mov rax, qword ptr [rbx + 0x10]
0x1001a028f: mov r13, qword ptr [rax + 0x78]
0x1001a0293: vmovss xmm1, dword ptr [rip + 0x907555] ; 0x100aa77f0
0x1001a029b: vzeroupper 
0x1001a029e: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x1001a02a3: vmovss xmm1, dword ptr [rip + 0x904e15] ; 0x100aa50c0
0x1001a02ab: vsubss xmm0, xmm1, xmm0
0x1001a02af: vmulss xmm1, xmm0, dword ptr [r13 + 0x20]
0x1001a02b5: lea rsi, [rbp - 0x100]
0x1001a02bc: mov rdi, r12
0x1001a02bf: vmovss xmm0, dword ptr [rbp - 0x2c]
0x1001a02c4: call 0x10062e690 ; 0x10062e690
0x1001a02c9: mov rdi, qword ptr [rbx + 0x40]
0x1001a02cd: test rdi, rdi
0x1001a02d0: je 0x1001a0365
0x1001a02d6: mov rax, qword ptr [rbx + 0x10]
0x1001a02da: mov r15, qword ptr [rax + 0x78]
0x1001a02de: lea rsi, [rbp - 0xa0]
0x1001a02e5: lea rdx, [rbp - 0x40]
0x1001a02e9: call 0x10055d820 ; 0x10055d820
0x1001a02ee: vucomiss xmm0, dword ptr [rip + 0x908366] ; 0x100aa865c
0x1001a02f6: jae 0x1001a03de
0x1001a02fc: vmovss xmm0, dword ptr [rbp - 0x2c]
0x1001a0301: vmulss xmm0, xmm0, dword ptr [r15 + 0x1c]
0x1001a0307: vmulss xmm2, xmm0, dword ptr [rip + 0x909361] ; 0x100aa9670
0x1001a030f: mov rsi, qword ptr [rbx + 0x40]
0x1001a0313: vmovss xmm0, dword ptr [rip + 0x9075a1] ; 0x100aa78bc
0x1001a031b: vmovss xmm1, dword ptr [rip + 0x904295] ; 0x100aa45b8
0x1001a0323: mov edx, 1
0x1001a0328: mov rdi, r12
0x1001a032b: call 0x100630020 ; 0x100630020
0x1001a0330: mov rax, qword ptr [rbx + 8]
0x1001a0334: mov rsi, qword ptr [rbx + 0x10]
0x1001a0338: vmovss xmm0, dword ptr [rax + 0x70]
0x1001a033d: vmovss xmm2, dword ptr [rax + 0x48]
0x1001a0342: vmovss xmm1, dword ptr [rax + 0x40]
0x1001a0347: vmovss xmm3, dword ptr [rax + 0x44]
0x1001a034c: vmovss xmm4, dword ptr [rax + 0x4c]
0x1001a0351: lea rdx, [rip + 0x6388] ; 0x1001a66e0
0x1001a0358: mov rdi, r12
0x1001a035b: call 0x10062f800 ; 0x10062f800
0x1001a0360: jmp 0x1001a03e6 ; 0x1001a03e6
0x1001a0365: mov rax, qword ptr [rbx + 0x50]
0x1001a0369: test rax, rax
0x1001a036c: je 0x1001a03a6
0x1001a036e: mov rcx, qword ptr [rbx + 8]
0x1001a0372: cmp rax, qword ptr [rcx + 0x38]
0x1001a0376: je 0x1001a03a6
0x1001a0378: mov rax, qword ptr [rbx + 0x10]
0x1001a037c: mov rsi, qword ptr [rax + 0x78]
0x1001a0380: mov rdx, qword ptr [r15 + 0x280]
0x1001a0387: mov rcx, qword ptr [r15 + 0x3c8]
0x1001a038e: lea r8, [rbp - 0xa0]
0x1001a0395: mov rdi, rbx
0x1001a0398: vmovss xmm0, dword ptr [rbp - 0x2c]
0x1001a039d: call 0x1001a08e0 ; 0x1001a08e0
0x1001a03a2: test al, al
0x1001a03a4: je 0x1001a03e6
0x1001a03a6: mov rax, qword ptr [rbx + 0x10]
0x1001a03aa: mov rsi, qword ptr [rax + 0x78]
0x1001a03ae: lea r13, [rbp - 0xa0]
0x1001a03b5: mov rdi, rbx
0x1001a03b8: mov rdx, r13
0x1001a03bb: vmovss xmm0, dword ptr [rbp - 0x30]
0x1001a03c0: call 0x1001a0d20 ; 0x1001a0d20
0x1001a03c5: mov rsi, qword ptr [r15 + 0x280]
0x1001a03cc: mov rdi, rbx
0x1001a03cf: mov rdx, r13
0x1001a03d2: vmovss xmm0, dword ptr [rbp - 0x2c]
0x1001a03d7: call 0x1001a0e70 ; 0x1001a0e70
0x1001a03dc: jmp 0x1001a03e6 ; 0x1001a03e6
0x1001a03de: mov qword ptr [rbx + 0x40], 0
0x1001a03e6: vxorps xmm0, xmm0, xmm0
0x1001a03ea: vmovlps qword ptr [r14], xmm0
0x1001a03ef: mov dword ptr [r14 + 8], 0
0x1001a03f7: mov rax, qword ptr [rbx + 8]
0x1001a03fb: vmovss xmm0, dword ptr [rax + 0x68]
0x1001a0400: vandps xmm0, xmm0, xmmword ptr [rip + 0x907508] ; 0x100aa7910
0x1001a0408: vmovss xmm1, dword ptr [rip + 0x9074b4] ; 0x100aa78c4
0x1001a0410: xor edx, edx
0x1001a0412: vucomiss xmm1, xmm0
0x1001a0416: setb dl
0x1001a0419: lea rdi, [rbp - 0x40]
0x1001a041d: mov rsi, r12
0x1001a0420: call 0x10062e700 ; 0x10062e700
0x1001a0425: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001a042a: vmovaps xmmword ptr [r14], xmm0
0x1001a042f: mov rax, r14
0x1001a0432: add rsp, 0xd8
0x1001a0439: pop rbx
0x1001a043a: pop r12
0x1001a043c: pop r13
0x1001a043e: pop r14
0x1001a0440: pop r15
0x1001a0442: pop rbp
0x1001a0443: ret 
0x1001a0444: nop word ptr cs:[rax + rax]
