0x1006a81d0: push rbp
0x1006a81d1: mov rbp, rsp
0x1006a81d4: push r15
0x1006a81d6: push r14
0x1006a81d8: push r13
0x1006a81da: push r12
0x1006a81dc: push rbx
0x1006a81dd: and rsp, 0xffffffffffffffe0
0x1006a81e1: sub rsp, 0x400
0x1006a81e8: mov r14d, edx
0x1006a81eb: mov r13, rsi
0x1006a81ee: mov rbx, rdi
0x1006a81f1: mov rax, qword ptr [rip + 0x5656e0] ; 0x100c0d8d8
0x1006a81f8: mov rax, qword ptr [rax]
0x1006a81fb: mov qword ptr [rsp + 0x3e0], rax
0x1006a8203: lea rsi, [rbx + 0x470]
0x1006a820a: lea rdi, [rsp + 0x88]
0x1006a8212: call 0x1007e9360 ; 0x1007e9360
0x1006a8217: mov edx, r14d
0x1006a821a: mov r12, qword ptr [r13 + 0x1a8]
0x1006a8221: mov rsi, qword ptr [r13 + 0x1b0]
0x1006a8228: movsx eax, word ptr [rsi + rdx*2]
0x1006a822c: movsx ecx, word ptr [r12 + rdx*2]
0x1006a8231: dec ecx
0x1006a8233: cmp ecx, eax
0x1006a8235: je 0x1006a87c7
0x1006a823b: mov qword ptr [rsp + 0x70], rsi
0x1006a8240: mov dword ptr [rsp + 0x4c], r14d
0x1006a8245: mov rax, rdx
0x1006a8248: shl rax, 4
0x1006a824c: mov rcx, qword ptr [r13 + 0x1a0]
0x1006a8253: vmovaps xmm0, xmmword ptr [rcx + rax]
0x1006a8258: vmovaps xmmword ptr [rsp + 0x50], xmm0
0x1006a825e: mov r15, qword ptr [r13 + 0x1c8]
0x1006a8265: vmovss xmm0, dword ptr [r13 + 0x5e0]
0x1006a826e: vmovss dword ptr [rsp + 0x30], xmm0
0x1006a8274: mov dword ptr [rsp + 0x20], 0x40000
0x1006a827c: mov dword ptr [rsp + 0x24], 0x8000
0x1006a8284: vxorps ymm0, ymm0, ymm0
0x1006a8288: vmovups ymmword ptr [rsp + 0x3ac], ymm0
0x1006a8291: vmovaps ymmword ptr [rsp + 0x3a0], ymm0
0x1006a829a: vmovaps ymmword ptr [rsp + 0x380], ymm0
0x1006a82a3: vmovaps ymmword ptr [rsp + 0x360], ymm0
0x1006a82ac: vmovaps ymmword ptr [rsp + 0x340], ymm0
0x1006a82b5: vmovaps ymmword ptr [rsp + 0x320], ymm0
0x1006a82be: vmovaps ymmword ptr [rsp + 0x300], ymm0
0x1006a82c7: vmovaps ymmword ptr [rsp + 0x2e0], ymm0
0x1006a82d0: mov r14, qword ptr [rbx + 0x3a0]
0x1006a82d7: mov qword ptr [rsp + 0x28], rbx
0x1006a82dc: lea rdi, [rbx + 0x3a8]
0x1006a82e3: mov qword ptr [rsp + 0x40], rdi
0x1006a82e8: mov rbx, rdx
0x1006a82eb: vzeroupper 
0x1006a82ee: call 0x1007e9220 ; 0x1007e9220
0x1006a82f3: imul rdi, rbx, 0x3e0
0x1006a82fa: lea rax, [r15 + rdi]
0x1006a82fe: vmovss xmm0, dword ptr [rsp + 0x30]
0x1006a8304: vmulss xmm0, xmm0, dword ptr [rip + 0x3fc2ac] ; 0x100aa45b8
0x1006a830c: vpermilps xmm0, xmm0, 0xc0
0x1006a8312: lea r9, [r14 + 0x80000]
0x1006a8319: vmovaps xmm2, xmmword ptr [rsp + 0x50]
0x1006a831f: vaddps xmm1, xmm2, xmm0
0x1006a8323: vsubps xmm2, xmm2, xmm0
0x1006a8327: movsx rcx, word ptr [r12 + rbx*2]
0x1006a832c: vcvttss2si rcx, dword ptr [r13 + rcx*4 - 4]
0x1006a8333: vmovss xmm0, dword ptr [r13 + 0x10]
0x1006a8339: vcvttss2si rdx, xmm0
0x1006a833e: mov rsi, qword ptr [rip + 0x564f63] ; 0x100c0d2a8
0x1006a8345: add rsi, 0x10
0x1006a8349: mov qword ptr [rsp + 0xc0], rsi
0x1006a8351: mov dword ptr [rsp + 0xc8], ecx
0x1006a8358: mov dword ptr [rsp + 0xcc], edx
0x1006a835f: vmovaps xmmword ptr [rsp + 0xd0], xmm2
0x1006a8368: vmovaps xmmword ptr [rsp + 0xe0], xmm1
0x1006a8371: mov rax, qword ptr [rax]
0x1006a8374: mov r8, r14
0x1006a8377: mov r14d, dword ptr [r15 + rdi + 8]
0x1006a837c: mov rcx, qword ptr [r15 + rdi + 0x10]
0x1006a8381: mov edx, dword ptr [r15 + rdi + 0x18]
0x1006a8386: mov qword ptr [rsp + 0xa0], rax
0x1006a838e: mov qword ptr [rsp + 0xa8], rcx
0x1006a8396: mov dword ptr [rsp + 0xb0], edx
0x1006a839d: mov dword ptr [rsp + 0xb4], r14d
0x1006a83a5: mov dword ptr [rsp + 0xb8], 2
0x1006a83b0: mov qword ptr [rsp + 0x30], rbx
0x1006a83b5: movsx eax, word ptr [r12 + rbx*2]
0x1006a83ba: cmp eax, 3
0x1006a83bd: mov qword ptr [rsp + 0x68], r12
0x1006a83c2: mov qword ptr [rsp + 0x80], r15
0x1006a83ca: mov qword ptr [rsp + 0x78], rdi
0x1006a83cf: mov qword ptr [rsp + 0x38], r8
0x1006a83d4: jne 0x1006a8460
0x1006a83da: mov rbx, r9
0x1006a83dd: call 0x1007c6c20 ; 0x1007c6c20
0x1006a83e2: lea esi, [r14 + r14 + 1]
0x1006a83e7: add rsi, rsi
0x1006a83ea: lea rcx, [rip + 0x19a075f] ; 0x102048b50
0x1006a83f1: mov rdx, qword ptr [rcx]
0x1006a83f4: mov ecx, 2
0x1006a83f9: mov rdi, rax
0x1006a83fc: call 0x100795530 ; 0x100795530
0x1006a8401: mov r12, rax
0x1006a8404: mov rdx, qword ptr [r13 + 0x5d8]
0x1006a840b: mov ecx, dword ptr [r13 + 0x5d0]
0x1006a8412: vmovss xmm0, dword ptr [r13 + 0x10]
0x1006a8418: lea rax, [rsp + 0x24]
0x1006a841d: mov qword ptr [rsp + 8], rax
0x1006a8422: lea rax, [rsp + 0x20]
0x1006a8427: mov qword ptr [rsp], rax
0x1006a842b: lea rdi, [rsp + 0xc0]
0x1006a8433: lea rsi, [rsp + 0xa0]
0x1006a843b: mov r8, qword ptr [rsp + 0x38]
0x1006a8440: mov r13, rbx
0x1006a8443: mov r9, r13
0x1006a8446: call 0x100aa21a4 ; 0x100aa21a4 __Z10TessellateItEbP17TessVertInterfaceRK12TessMeshInfoPKvjPT_PvPjSA_f
0x1006a844b: mov r14d, eax
0x1006a844e: call 0x1007c6c20 ; 0x1007c6c20
0x1006a8453: mov rdi, rax
0x1006a8456: mov rsi, r12
0x1006a8459: call 0x100795a70 ; 0x100795a70
0x1006a845e: jmp 0x1006a84a3 ; 0x1006a84a3
0x1006a8460: mov rdx, qword ptr [r15 + rdi + 0x20]
0x1006a8465: mov ecx, dword ptr [r15 + rdi + 0x28]
0x1006a846a: mov esi, 3
0x1006a846f: sub esi, eax
0x1006a8471: mov dword ptr [rsp + 0x10], esi
0x1006a8475: lea rax, [rsp + 0x24]
0x1006a847a: mov qword ptr [rsp + 8], rax
0x1006a847f: lea rax, [rsp + 0x20]
0x1006a8484: mov qword ptr [rsp], rax
0x1006a8488: lea rdi, [rsp + 0xc0]
0x1006a8490: lea rsi, [rsp + 0xa0]
0x1006a8498: mov r13, r9
0x1006a849b: call 0x100aa21aa ; 0x100aa21aa __Z12TessellateUpItEbP17TessVertInterfaceRK12TessMeshInfoPKvjPT_PvPjSA_jf
0x1006a84a0: mov r14d, eax
0x1006a84a3: call 0x1007c6c20 ; 0x1007c6c20
0x1006a84a8: lea rcx, [rip + 0x19a06a1] ; 0x102048b50
0x1006a84af: mov rdx, qword ptr [rcx]
0x1006a84b2: mov esi, 0x80000
0x1006a84b7: mov ecx, 2
0x1006a84bc: mov rdi, rax
0x1006a84bf: call 0x100795530 ; 0x100795530
0x1006a84c4: mov rbx, rax
0x1006a84c7: test r14b, r14b
0x1006a84ca: mov qword ptr [rsp + 0x50], rbx
0x1006a84cf: je 0x1006a8514
0x1006a84d1: mov esi, dword ptr [rsp + 0x20]
0x1006a84d5: mov rax, qword ptr [rsp + 0x28]
0x1006a84da: lea r8, [rax + 0xe10]
0x1006a84e1: mov r9d, dword ptr [rax + 0xe08]
0x1006a84e8: lea rax, [rsp + 0x2e0]
0x1006a84f0: mov qword ptr [rsp + 8], rax
0x1006a84f5: mov qword ptr [rsp], rbx
0x1006a84f9: mov ecx, 0x28
0x1006a84fe: mov rdi, qword ptr [rsp + 0x38]
0x1006a8503: mov rdx, r13
0x1006a8506: call 0x1006a7280 ; 0x1006a7280
0x1006a850b: mov dword ptr [rsp + 0x20], eax
0x1006a850f: mov qword ptr [rsp + 0x38], rbx
0x1006a8514: mov rdi, qword ptr [rsp + 0x40]
0x1006a8519: call 0x1007e9280 ; 0x1007e9280
0x1006a851e: mov qword ptr [rsp + 0x90], r13
0x1006a8526: mov eax, dword ptr [rsp + 0x20]
0x1006a852a: mov qword ptr [rsp + 0x98], rax
0x1006a8532: mov ebx, dword ptr [rsp + 0x24]
0x1006a8536: mov rax, qword ptr [rsp + 0x28]
0x1006a853b: lea r15, [rax + 0x4b8]
0x1006a8542: mov rdi, r15
0x1006a8545: call 0x10077e420 ; 0x10077e420
0x1006a854a: mov r12, rax
0x1006a854d: mov rdi, qword ptr [rsp + 0x28]
0x1006a8552: add rdi, 0x4f0
0x1006a8559: mov qword ptr [rsp + 0x28], rdi
0x1006a855e: call 0x10077e420 ; 0x10077e420
0x1006a8563: shl ebx, 3
0x1006a8566: lea r13d, [rbx + rbx*4]
0x1006a856a: add r12, -0x28
0x1006a856e: cmp r12, r13
0x1006a8571: setae cl
0x1006a8574: and r14b, cl
0x1006a8577: cmp r14b, 1
0x1006a857b: jne 0x1006a86b2
0x1006a8581: mov rcx, qword ptr [rsp + 0x98]
0x1006a8589: add ecx, ecx
0x1006a858b: add rax, -2
0x1006a858f: mov r12, rcx
0x1006a8592: cmp rax, rcx
0x1006a8595: jb 0x1006a86b2
0x1006a859b: mov rdi, qword ptr [rsp + 0x40]
0x1006a85a0: call 0x1007e91c0 ; 0x1007e91c0
0x1006a85a5: mov rax, qword ptr [rsp + 0x80]
0x1006a85ad: mov rcx, qword ptr [rsp + 0x78]
0x1006a85b2: lea rbx, [rax + rcx + 0x20]
0x1006a85b7: mov rdi, r15
0x1006a85ba: mov rsi, rbx
0x1006a85bd: call 0x10077e4b0 ; 0x10077e4b0
0x1006a85c2: mov rdi, r15
0x1006a85c5: mov rsi, rbx
0x1006a85c8: mov rdx, r13
0x1006a85cb: call 0x10077e3c0 ; 0x10077e3c0
0x1006a85d0: mov rdi, qword ptr [rbx]
0x1006a85d3: mov rsi, qword ptr [rsp + 0x90]
0x1006a85db: mov rdx, r13
0x1006a85de: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1006a85e3: mov eax, dword ptr [rsp + 0x24]
0x1006a85e7: mov rcx, qword ptr [rsp + 0x80]
0x1006a85ef: mov rdx, qword ptr [rsp + 0x78]
0x1006a85f4: mov dword ptr [rcx + rdx + 0x28], eax
0x1006a85f8: mov r14, rcx
0x1006a85fb: mov r15, rdx
0x1006a85fe: lea rbx, [rcx + rdx + 0x30]
0x1006a8603: mov rdi, qword ptr [rsp + 0x28]
0x1006a8608: mov rsi, rbx
0x1006a860b: call 0x10077e4b0 ; 0x10077e4b0
0x1006a8610: mov edx, dword ptr [rsp + 0x20]
0x1006a8614: add rdx, rdx
0x1006a8617: mov rdi, qword ptr [rsp + 0x28]
0x1006a861c: mov rsi, rbx
0x1006a861f: call 0x10077e3c0 ; 0x10077e3c0
0x1006a8624: mov rdi, qword ptr [rbx]
0x1006a8627: mov rsi, qword ptr [rsp + 0x38]
0x1006a862c: mov rdx, r12
0x1006a862f: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1006a8634: lea rax, [r14 + r15 + 0x48]
0x1006a8639: xor ecx, ecx
0x1006a863b: xor edx, edx
0x1006a863d: mov r14, qword ptr [rsp + 0x30]
0x1006a8642: mov r15, qword ptr [rsp + 0x70]
0x1006a8647: mov r12, qword ptr [rsp + 0x68]
0x1006a864c: jmp 0x1006a8679 ; 0x1006a8679
0x1006a864e: nop 
0x1006a8650: add edx, dword ptr [rsp + rcx + 0x2e0]
0x1006a8657: mov esi, edx
0x1006a8659: add rsi, rsi
0x1006a865c: add rsi, qword ptr [rbx]
0x1006a865f: mov qword ptr [rax + rcx*4 - 8], rsi
0x1006a8664: mov esi, dword ptr [rsp + rcx + 0x2e4]
0x1006a866b: mov dword ptr [rax + rcx*4], esi
0x1006a866e: add edx, dword ptr [rsp + rcx + 0x2e4]
0x1006a8675: add rcx, 8
0x1006a8679: mov esi, edx
0x1006a867b: add rsi, rsi
0x1006a867e: add rsi, qword ptr [rbx]
0x1006a8681: mov qword ptr [rax + rcx*4 - 0x18], rsi
0x1006a8686: mov esi, dword ptr [rsp + rcx + 0x2e0]
0x1006a868d: mov dword ptr [rax + rcx*4 - 0x10], esi
0x1006a8691: cmp rcx, 0xe8
0x1006a8698: jne 0x1006a8650
0x1006a869a: mov rdi, qword ptr [rsp + 0x40]
0x1006a869f: call 0x1007e9280 ; 0x1007e9280
0x1006a86a4: dec word ptr [r12 + r14*2]
0x1006a86a9: mov ax, 0xfffe
0x1006a86ad: jmp 0x1006a87ad ; 0x1006a87ad
0x1006a86b2: lea r15, [rsp + 0x248]
0x1006a86ba: lea r12, [rsp + 0x100]
0x1006a86c2: mov rax, qword ptr [rip + 0x561e57] ; 0x100c0a520
0x1006a86c9: lea rcx, [rax + 0x18]
0x1006a86cd: mov qword ptr [rsp + 0xf8], rcx
0x1006a86d5: add rax, 0x40
0x1006a86d9: mov qword ptr [rsp + 0x248], rax
0x1006a86e1: mov rdi, r15
0x1006a86e4: mov rsi, r12
0x1006a86e7: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1006a86ec: mov qword ptr [rsp + 0x2d0], 0
0x1006a86f8: mov dword ptr [rsp + 0x2d8], 0xffffffff
0x1006a8703: mov rbx, qword ptr [rip + 0x564ebe] ; 0x100c0d5c8
0x1006a870a: lea r13, [rbx + 0x18]
0x1006a870e: mov qword ptr [rsp + 0xf8], r13
0x1006a8716: add rbx, 0x40
0x1006a871a: mov qword ptr [rsp + 0x248], rbx
0x1006a8722: lea rsi, [rip + 0x4f1662] ; 0x100b99d8b Tessellation
0x1006a8729: mov edx, 1
0x1006a872e: mov rdi, r12
0x1006a8731: call 0x1007a56a0 ; 0x1007a56a0
0x1006a8736: mov r14d, dword ptr [rsp + 0x4c]
0x1006a873b: lea rsi, [rip + 0x4f1656] ; 0x100b99d98 Failed to tessellate bin 
0x1006a8742: lea rdi, [rsp + 0xf8]
0x1006a874a: mov edx, 0x19
0x1006a874f: call 0x100011930 ; 0x100011930
0x1006a8754: mov rdi, rax
0x1006a8757: mov esi, r14d
0x1006a875a: call 0x100aa23de ; 0x100aa23de __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
0x1006a875f: mov qword ptr [rsp + 0xf8], r13
0x1006a8767: mov qword ptr [rsp + 0x248], rbx
0x1006a876f: mov rdi, r12
0x1006a8772: call 0x1007a58d0 ; 0x1007a58d0
0x1006a8777: mov rsi, qword ptr [rip + 0x561e02] ; 0x100c0a580
0x1006a877e: add rsi, 8
0x1006a8782: lea rdi, [rsp + 0xf8]
0x1006a878a: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006a878f: mov rdi, r15
0x1006a8792: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a8797: mov r14, qword ptr [rsp + 0x30]
0x1006a879c: mov rax, qword ptr [rsp + 0x68]
0x1006a87a1: movzx eax, word ptr [rax + r14*2]
0x1006a87a6: dec eax
0x1006a87a8: mov r15, qword ptr [rsp + 0x70]
0x1006a87ad: mov rbx, qword ptr [rsp + 0x50]
0x1006a87b2: mov word ptr [r15 + r14*2], ax
0x1006a87b7: call 0x1007c6c20 ; 0x1007c6c20
0x1006a87bc: mov rdi, rax
0x1006a87bf: mov rsi, rbx
0x1006a87c2: call 0x100795a70 ; 0x100795a70
0x1006a87c7: lea rdi, [rsp + 0x88]
0x1006a87cf: call 0x1007e9480 ; 0x1007e9480
0x1006a87d4: mov rax, qword ptr [rip + 0x5650fd] ; 0x100c0d8d8
0x1006a87db: mov rax, qword ptr [rax]
0x1006a87de: cmp rax, qword ptr [rsp + 0x3e0]
0x1006a87e6: jne 0x1006a87f7
0x1006a87e8: lea rsp, [rbp - 0x28]
0x1006a87ec: pop rbx
0x1006a87ed: pop r12
0x1006a87ef: pop r13
0x1006a87f1: pop r14
0x1006a87f3: pop r15
0x1006a87f5: pop rbp
0x1006a87f6: ret 
0x1006a87f7: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1006a87fc: jmp 0x1006a8882 ; 0x1006a8882
0x1006a8801: mov r14, rax
0x1006a8804: jmp 0x1006a8845 ; 0x1006a8845
0x1006a8806: mov r14, rax
0x1006a8809: jmp 0x1006a885d ; 0x1006a885d
0x1006a880b: mov r14, rax
0x1006a880e: call 0x1007c6c20 ; 0x1007c6c20
0x1006a8813: mov rdi, rax
0x1006a8816: mov rsi, r12
0x1006a8819: call 0x100795a70 ; 0x100795a70
0x1006a881e: jmp 0x1006a8897 ; 0x1006a8897
0x1006a8820: mov rdi, rax
0x1006a8823: call 0x100011bf0 ; 0x100011bf0
0x1006a8828: jmp 0x1006a887d ; 0x1006a887d
0x1006a882a: mov r14, rax
0x1006a882d: mov qword ptr [rsp + 0xf8], r13
0x1006a8835: mov qword ptr [rsp + 0x248], rbx
0x1006a883d: mov rdi, r12
0x1006a8840: call 0x1007a58d0 ; 0x1007a58d0
0x1006a8845: mov rsi, qword ptr [rip + 0x561d34] ; 0x100c0a580
0x1006a884c: add rsi, 8
0x1006a8850: lea rdi, [rsp + 0xf8]
0x1006a8858: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006a885d: mov rdi, r15
0x1006a8860: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a8865: jmp 0x1006a8885 ; 0x1006a8885
0x1006a8867: mov rdi, rax
0x1006a886a: call 0x100011bf0 ; 0x100011bf0
0x1006a886f: jmp 0x1006a887d ; 0x1006a887d
0x1006a8871: jmp 0x1006a887d ; 0x1006a887d
0x1006a8873: jmp 0x1006a8882 ; 0x1006a8882
0x1006a8875: mov rdi, rax
0x1006a8878: call 0x100011bf0 ; 0x100011bf0
0x1006a887d: mov r14, rax
0x1006a8880: jmp 0x1006a8897 ; 0x1006a8897
0x1006a8882: mov r14, rax
0x1006a8885: call 0x1007c6c20 ; 0x1007c6c20
0x1006a888a: mov rdi, rax
0x1006a888d: mov rsi, qword ptr [rsp + 0x50]
0x1006a8892: call 0x100795a70 ; 0x100795a70
0x1006a8897: lea rdi, [rsp + 0x88]
0x1006a889f: call 0x1007e9480 ; 0x1007e9480
0x1006a88a4: mov rdi, r14
0x1006a88a7: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006a88ac: mov rdi, rax
0x1006a88af: call 0x100011bf0 ; 0x100011bf0
0x1006a88b4: nop word ptr cs:[rax + rax]
