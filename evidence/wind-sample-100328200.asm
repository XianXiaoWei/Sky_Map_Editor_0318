0x100328200: push rbp
0x100328201: mov rbp, rsp
0x100328204: push r15
0x100328206: push r14
0x100328208: push r13
0x10032820a: push r12
0x10032820c: push rbx
0x10032820d: sub rsp, 0xd8
0x100328214: mov r13, rdx
0x100328217: mov r15, rsi
0x10032821a: mov r12, rdi
0x10032821d: vxorps xmm0, xmm0, xmm0
0x100328221: vmovaps xmmword ptr [rbp - 0xa0], xmm0
0x100328229: cmp dword ptr [r15 + 0x48c0], 0
0x100328231: vxorps xmm2, xmm2, xmm2
0x100328235: vxorps xmm1, xmm1, xmm1
0x100328239: vxorps xmm0, xmm0, xmm0
0x10032823d: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x100328242: vxorps xmm0, xmm0, xmm0
0x100328246: je 0x100328523
0x10032824c: mov qword ptr [rbp - 0x38], r13
0x100328250: mov qword ptr [rbp - 0xa8], r12
0x100328257: vxorps xmm0, xmm0, xmm0
0x10032825b: vmovss dword ptr [rbp - 0x50], xmm0
0x100328260: mov ebx, 0
0x100328265: mov r13d, 0
0x10032826b: mov dword ptr [rbp - 0x2c], 0
0x100328272: mov dword ptr [rbp - 0x3c], 0
0x100328279: mov edi, 0
0x10032827e: vxorps xmm0, xmm0, xmm0
0x100328282: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x100328287: vxorps xmm0, xmm0, xmm0
0x10032828b: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x100328290: mov r14d, edi
0x100328293: mov r13d, r13d
0x100328296: imul r12, r13, 0xd0
0x10032829d: lea rsi, [r15 + r12 + 0x48d0]
0x1003282a5: mov rax, qword ptr [rbp - 0x38]
0x1003282a9: vmovaps xmm0, xmmword ptr [rax]
0x1003282ad: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1003282b2: xor ecx, ecx
0x1003282b4: lea rdi, [rbp - 0x90]
0x1003282bb: mov qword ptr [rbp - 0xc0], rsi
0x1003282c2: lea rdx, [rbp - 0x60]
0x1003282c6: call 0x100328810 ; 0x100328810
0x1003282cb: vmovaps xmm0, xmmword ptr [rbp - 0x90]
0x1003282d3: vmulps xmm0, xmm0, xmm0
0x1003282d7: vmovshdup xmm1, xmm0
0x1003282db: vaddss xmm1, xmm0, xmm1
0x1003282df: vpermilpd xmm0, xmm0, 1
0x1003282e5: vaddss xmm0, xmm0, xmm1
0x1003282e9: vandps xmm0, xmm0, xmmword ptr [rip + 0x77f61f] ; 0x100aa7910
0x1003282f1: vmovss xmm1, dword ptr [rip + 0x77e7a3] ; 0x100aa6a9c
0x1003282f9: vucomiss xmm1, xmm0
0x1003282fd: jae 0x100328320
0x1003282ff: mov eax, dword ptr [r15 + r12 + 0x4930]
0x100328307: mov edi, r14d
0x10032830a: cmp eax, edi
0x10032830c: jge 0x100328330
0x10032830e: vxorps xmm2, xmm2, xmm2
0x100328312: jmp 0x1003284a2 ; 0x1003284a2
0x100328317: nop word ptr [rax + rax]
0x100328320: vxorps xmm2, xmm2, xmm2
0x100328324: mov edi, r14d
0x100328327: jmp 0x1003284a2 ; 0x1003284a2
0x10032832c: nop dword ptr [rax]
0x100328330: cmp eax, ebx
0x100328332: jle 0x10032837a
0x100328334: vmovaps xmm0, xmmword ptr [rbp - 0xe0]
0x10032833c: vblendps xmm0, xmm0, xmmword ptr [rip + 0x77c25a], 7 ; 0x100aa45a0
0x100328346: vxorps xmm1, xmm1, xmm1
0x10032834a: mov dword ptr [rbp - 0x3c], 0
0x100328351: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x100328356: vmovaps xmmword ptr [rbp - 0xe0], xmm0
0x10032835e: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x100328363: mov edi, eax
0x100328365: mov dword ptr [rbp - 0x2c], 0
0x10032836c: mov ebx, eax
0x10032836e: cmp eax, ebx
0x100328370: mov dword ptr [rbp - 0x40], ebx
0x100328373: je 0x1003283d9
0x100328375: jmp 0x100328444 ; 0x100328444
0x10032837a: cmp eax, edi
0x10032837c: setg dl
0x10032837f: cmp eax, ebx
0x100328381: setl cl
0x100328384: vmovaps xmm0, xmmword ptr [rbp - 0xd0]
0x10032838c: vblendps xmm0, xmm0, xmmword ptr [rip + 0x77c20a], 7 ; 0x100aa45a0
0x100328396: vmovaps xmm1, xmm0
0x10032839a: and cl, dl
0x10032839c: jne 0x1003283a3
0x10032839e: vmovaps xmm1, xmmword ptr [rbp - 0x70]
0x1003283a3: vmovaps xmmword ptr [rbp - 0x70], xmm1
0x1003283a8: cmovne edi, eax
0x1003283ab: mov edx, 0
0x1003283b0: mov esi, dword ptr [rbp - 0x2c]
0x1003283b3: cmovne esi, edx
0x1003283b6: mov dword ptr [rbp - 0x2c], esi
0x1003283b9: test cl, cl
0x1003283bb: vmovss xmm1, dword ptr [rbp - 0x50]
0x1003283c0: jne 0x1003283ca
0x1003283c2: vmovaps xmm0, xmmword ptr [rbp - 0xd0]
0x1003283ca: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x1003283d2: cmp eax, ebx
0x1003283d4: mov dword ptr [rbp - 0x40], ebx
0x1003283d7: jne 0x100328444
0x1003283d9: lea r14, [r15 + r12 + 0x4930]
0x1003283e1: mov dword ptr [rbp - 0x90], 0
0x1003283eb: inc dword ptr [rbp - 0x3c]
0x1003283ee: mov rax, qword ptr [rbp - 0x38]
0x1003283f2: vmovaps xmm0, xmmword ptr [rax]
0x1003283f6: vmovaps xmmword ptr [rbp - 0x100], xmm0
0x1003283fe: mov ebx, edi
0x100328400: lea rdi, [rbp - 0x60]
0x100328404: mov rsi, qword ptr [rbp - 0xc0]
0x10032840b: lea rdx, [rbp - 0x100]
0x100328412: lea rcx, [rbp - 0x90]
0x100328419: vmovss dword ptr [rbp - 0x50], xmm1
0x10032841e: call 0x100328810 ; 0x100328810
0x100328423: mov edi, ebx
0x100328425: vmovss xmm1, dword ptr [rbp - 0x50]
0x10032842a: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x10032842f: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x60]
0x100328434: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x100328439: vaddss xmm1, xmm1, dword ptr [rbp - 0x90]
0x100328441: mov eax, dword ptr [r14]
0x100328444: vmovss dword ptr [rbp - 0x50], xmm1
0x100328449: cmp eax, edi
0x10032844b: jne 0x10032849b
0x10032844d: mov dword ptr [rbp - 0x90], 0
0x100328457: inc dword ptr [rbp - 0x2c]
0x10032845a: mov rax, qword ptr [rbp - 0x38]
0x10032845e: vmovaps xmm0, xmmword ptr [rax]
0x100328462: vmovaps xmmword ptr [rbp - 0xf0], xmm0
0x10032846a: mov ebx, edi
0x10032846c: lea rdi, [rbp - 0x60]
0x100328470: mov rsi, qword ptr [rbp - 0xc0]
0x100328477: lea rdx, [rbp - 0xf0]
0x10032847e: lea rcx, [rbp - 0x90]
0x100328485: call 0x100328810 ; 0x100328810
0x10032848a: mov edi, ebx
0x10032848c: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x100328491: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x60]
0x100328496: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x10032849b: vxorps xmm2, xmm2, xmm2
0x10032849f: mov ebx, dword ptr [rbp - 0x40]
0x1003284a2: inc r13d
0x1003284a5: cmp r13d, dword ptr [r15 + 0x48c0]
0x1003284ac: jb 0x100328290
0x1003284b2: mov eax, dword ptr [rbp - 0x3c]
0x1003284b5: test eax, eax
0x1003284b7: jle 0x1003284e6
0x1003284b9: vcvtsi2ss xmm0, xmm3, eax
0x1003284bd: vmovd xmm1, eax
0x1003284c1: vpshufd xmm1, xmm1, 0xc0
0x1003284c6: vcvtdq2ps xmm1, xmm1
0x1003284ca: vmovaps xmm3, xmmword ptr [rbp - 0x80]
0x1003284cf: vdivps xmm3, xmm3, xmm1
0x1003284d3: vmovaps xmmword ptr [rbp - 0x80], xmm3
0x1003284d8: vmovss xmm1, dword ptr [rbp - 0x50]
0x1003284dd: vdivss xmm1, xmm1, xmm0
0x1003284e1: vmovss dword ptr [rbp - 0x50], xmm1
0x1003284e6: mov r12, qword ptr [rbp - 0xa8]
0x1003284ed: mov r13, qword ptr [rbp - 0x38]
0x1003284f1: cmp dword ptr [rbp - 0x2c], 0
0x1003284f5: jle 0x100328519
0x1003284f7: vmovd xmm0, dword ptr [rbp - 0x2c]
0x1003284fc: vpshufd xmm0, xmm0, 0xc0
0x100328501: vcvtdq2ps xmm0, xmm0
0x100328505: vmovaps xmm1, xmmword ptr [rbp - 0x70]
0x10032850a: vdivps xmm1, xmm1, xmm0
0x10032850e: vmovaps xmm0, xmm1
0x100328512: vmovss xmm1, dword ptr [rbp - 0x50]
0x100328517: jmp 0x100328523 ; 0x100328523
0x100328519: vmovss xmm1, dword ptr [rbp - 0x50]
0x10032851e: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x100328523: vmovaps xmm3, xmmword ptr [r15 + 0x30]
0x100328529: vmovaps xmmword ptr [rbp - 0xc0], xmm3
0x100328531: vmovaps xmm3, xmm0
0x100328535: vmovss xmm0, dword ptr [rip + 0x77cb83] ; 0x100aa50c0
0x10032853d: vsubss xmm0, xmm0, xmm1
0x100328541: vpermilps xmm0, xmm0, 0xc0
0x100328547: vmulps xmm0, xmm0, xmm3
0x10032854b: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x100328550: mov ebx, 0xc0
0x100328555: lea r14, [rbp - 0x60]
0x100328559: nop dword ptr [rax]
0x100328560: cmp byte ptr [r15 + rbx + 0x5c], 0
0x100328566: je 0x1003285bc
0x100328568: lea rsi, [r15 + rbx]
0x10032856c: mov rax, qword ptr [r15 + rbx]
0x100328570: mov rdi, r14
0x100328573: mov rdx, r13
0x100328576: vmovss dword ptr [rbp - 0x38], xmm2
0x10032857b: call qword ptr [rax + 0x18]
0x10032857e: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x100328583: vmulps xmm1, xmm0, xmm0
0x100328587: vmovshdup xmm2, xmm1
0x10032858b: vaddss xmm2, xmm1, xmm2
0x10032858f: vpermilpd xmm1, xmm1, 1
0x100328595: vaddss xmm1, xmm1, xmm2
0x100328599: vmovss xmm2, dword ptr [rbp - 0x38]
0x10032859e: vsqrtss xmm1, xmm1, xmm1
0x1003285a2: vucomiss xmm1, xmm2
0x1003285a6: ja 0x1003285b0
0x1003285a8: vmovaps xmm0, xmmword ptr [rbp - 0xa0]
0x1003285b0: vmaxss xmm2, xmm1, xmm2
0x1003285b4: vmovaps xmmword ptr [rbp - 0xa0], xmm0
0x1003285bc: cmp byte ptr [r15 + rbx + 0x245c], 0
0x1003285c5: je 0x100328623
0x1003285c7: lea rsi, [r15 + rbx + 0x2400]
0x1003285cf: mov rax, qword ptr [r15 + rbx + 0x2400]
0x1003285d7: mov rdi, r14
0x1003285da: mov rdx, r13
0x1003285dd: vmovss dword ptr [rbp - 0x38], xmm2
0x1003285e2: call qword ptr [rax + 0x18]
0x1003285e5: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x1003285ea: vmulps xmm1, xmm0, xmm0
0x1003285ee: vmovshdup xmm2, xmm1
0x1003285f2: vaddss xmm2, xmm1, xmm2
0x1003285f6: vpermilpd xmm1, xmm1, 1
0x1003285fc: vaddss xmm1, xmm1, xmm2
0x100328600: vmovss xmm2, dword ptr [rbp - 0x38]
0x100328605: vsqrtss xmm1, xmm1, xmm1
0x100328609: vucomiss xmm1, xmm2
0x10032860d: ja 0x100328617
0x10032860f: vmovaps xmm0, xmmword ptr [rbp - 0xa0]
0x100328617: vmaxss xmm2, xmm1, xmm2
0x10032861b: vmovaps xmmword ptr [rbp - 0xa0], xmm0
0x100328623: add rbx, 0x120
0x10032862a: cmp rbx, 0x24c0
0x100328631: jne 0x100328560
0x100328637: vmovaps xmm0, xmmword ptr [rbp - 0xc0]
0x10032863f: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x80]
0x100328644: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x50]
0x100328649: vaddps xmm0, xmm0, xmmword ptr [rbp - 0xa0]
0x100328651: vmovaps xmmword ptr [r12], xmm0
0x100328657: mov rax, r12
0x10032865a: add rsp, 0xd8
0x100328661: pop rbx
0x100328662: pop r12
0x100328664: pop r13
0x100328666: pop r14
0x100328668: pop r15
0x10032866a: pop rbp
0x10032866b: ret 
0x10032866c: nop dword ptr [rax]
