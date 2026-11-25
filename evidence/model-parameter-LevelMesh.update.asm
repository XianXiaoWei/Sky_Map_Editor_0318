0x100402060: push rbp
0x100402061: mov rbp, rsp
0x100402064: push r15
0x100402066: push r14
0x100402068: push r13
0x10040206a: push r12
0x10040206c: push rbx
0x10040206d: sub rsp, 0x238
0x100402074: mov qword ptr [rbp - 0x248], rsi
0x10040207b: vmovss dword ptr [rbp - 0x22c], xmm0
0x100402083: mov r14, rdi
0x100402086: mov rax, qword ptr [rip + 0x80b84b] ; 0x100c0d8d8
0x10040208d: mov rax, qword ptr [rax]
0x100402090: mov qword ptr [rbp - 0x30], rax
0x100402094: cmp byte ptr [r14 + 0xa30], 0
0x10040209c: je 0x100402133
0x1004020a2: mov rdi, qword ptr [r14 + 0x228]
0x1004020a9: test rdi, rdi
0x1004020ac: je 0x100402146
0x1004020b2: lea rsi, [r14 + 0x10]
0x1004020b6: call 0x100463750 ; 0x100463750
0x1004020bb: mov rdi, qword ptr [r14 + 0x228]
0x1004020c2: mov al, byte ptr [r14 + 0xd0]
0x1004020c9: test rdi, rdi
0x1004020cc: je 0x100402667
0x1004020d2: movzx ebx, al
0x1004020d5: mov esi, ebx
0x1004020d7: call 0x1004636d0 ; 0x1004636d0
0x1004020dc: test bl, bl
0x1004020de: jne 0x1004020e8
0x1004020e0: mov byte ptr [r14 + 0xa55], 1
0x1004020e8: mov rdi, r14
0x1004020eb: call 0x100402710 ; 0x100402710
0x1004020f0: mov rdi, qword ptr [r14 + 0x228]
0x1004020f7: call 0x100466fc0 ; 0x100466fc0
0x1004020fc: mov byte ptr [r14 + 0xa30], 0
0x100402104: mov ecx, dword ptr [r14 + 0x220]
0x10040210b: test rcx, rcx
0x10040210e: je 0x1004021e7
0x100402114: lea rdx, [rcx - 1]
0x100402118: mov eax, ecx
0x10040211a: and eax, 3
0x10040211d: cmp rdx, 3
0x100402121: jae 0x100402152
0x100402123: xor edx, edx
0x100402125: test rax, rax
0x100402128: jne 0x1004021ba
0x10040212e: jmp 0x1004021e7 ; 0x1004021e7
0x100402133: cmp byte ptr [r14 + 0xa32], 0
0x10040213b: jne 0x1004021ef
0x100402141: jmp 0x100402645 ; 0x100402645
0x100402146: cmp byte ptr [r14 + 0xd0], 0
0x10040214e: jne 0x1004020e8
0x100402150: jmp 0x1004020e0 ; 0x1004020e0
0x100402152: sub rcx, rax
0x100402155: xor edx, edx
0x100402157: nop word ptr [rax + rax]
0x100402160: mov rsi, qword ptr [r14 + rdx*8 + 0x1a0]
0x100402168: mov byte ptr [rsi + 0x78], 1
0x10040216c: mov dword ptr [rsi + 0x5c], 0xffffffff
0x100402173: mov rsi, qword ptr [r14 + rdx*8 + 0x1a8]
0x10040217b: mov byte ptr [rsi + 0x78], 1
0x10040217f: mov dword ptr [rsi + 0x5c], 0xffffffff
0x100402186: mov rsi, qword ptr [r14 + rdx*8 + 0x1b0]
0x10040218e: mov byte ptr [rsi + 0x78], 1
0x100402192: mov dword ptr [rsi + 0x5c], 0xffffffff
0x100402199: mov rsi, qword ptr [r14 + rdx*8 + 0x1b8]
0x1004021a1: mov byte ptr [rsi + 0x78], 1
0x1004021a5: mov dword ptr [rsi + 0x5c], 0xffffffff
0x1004021ac: add rdx, 4
0x1004021b0: cmp rcx, rdx
0x1004021b3: jne 0x100402160
0x1004021b5: test rax, rax
0x1004021b8: je 0x1004021e7
0x1004021ba: lea rcx, [r14 + rdx*8 + 0x1a0]
0x1004021c2: neg rax
0x1004021c5: nop word ptr cs:[rax + rax]
0x1004021d0: mov rdx, qword ptr [rcx]
0x1004021d3: mov byte ptr [rdx + 0x78], 1
0x1004021d7: mov dword ptr [rdx + 0x5c], 0xffffffff
0x1004021de: add rcx, 8
0x1004021e2: inc rax
0x1004021e5: jne 0x1004021d0
0x1004021e7: mov byte ptr [r14 + 0xa32], 1
0x1004021ef: mov byte ptr [r14 + 0xa32], 0
0x1004021f7: mov ecx, dword ptr [r14 + 0x220]
0x1004021fe: test ecx, ecx
0x100402200: je 0x100402645
0x100402206: lea rax, [r14 + 0xb8]
0x10040220d: mov qword ptr [rbp - 0x258], rax
0x100402214: lea rax, [r14 + 0xb9]
0x10040221b: mov qword ptr [rbp - 0x250], rax
0x100402222: xor r15d, r15d
0x100402225: mov rax, qword ptr [rip + 0x808354] ; 0x100c0a580
0x10040222c: add rax, 8
0x100402230: mov qword ptr [rbp - 0x228], rax
0x100402237: nop word ptr [rax + rax]
0x100402240: movsxd r12, r15d
0x100402243: mov r13, qword ptr [r14 + r12*8 + 0x1a0]
0x10040224b: cmp byte ptr [r13 + 0x78], 0
0x100402250: je 0x100402533
0x100402256: mov edx, dword ptr [r13 + 0x5c]
0x10040225a: cmp edx, -1
0x10040225d: jne 0x10040229a
0x10040225f: mov rdi, qword ptr [r14 + 0x228]
0x100402266: mov esi, dword ptr [r13 + 0x58]
0x10040226a: lea rax, [r13 + 8]
0x10040226e: test byte ptr [r13 + 8], 1
0x100402273: mov qword ptr [rbp - 0x260], rax
0x10040227a: jne 0x100402282
0x10040227c: lea rdx, [rax + 1]
0x100402280: jmp 0x100402286 ; 0x100402286
0x100402282: mov rdx, qword ptr [r13 + 0x18]
0x100402286: call 0x1004666a0 ; 0x1004666a0
0x10040228b: mov edx, eax
0x10040228d: mov dword ptr [r13 + 0x5c], edx
0x100402291: cmp edx, -1
0x100402294: je 0x1004023ce
0x10040229a: vmovss xmm0, dword ptr [rbp - 0x22c]
0x1004022a2: vaddss xmm0, xmm0, dword ptr [r13 + 0x70]
0x1004022a8: vxorps xmm3, xmm3, xmm3
0x1004022ac: vmaxss xmm0, xmm3, xmm0
0x1004022b0: vmovss xmm1, dword ptr [r13 + 0x74]
0x1004022b6: vminss xmm2, xmm1, xmm0
0x1004022ba: vmovss dword ptr [r13 + 0x70], xmm2
0x1004022c0: vucomiss xmm1, xmm3
0x1004022c4: vmovss xmm0, dword ptr [rip + 0x6a2df4] ; 0x100aa50c0
0x1004022cc: jbe 0x1004022d2
0x1004022ce: vdivss xmm0, xmm2, xmm1
0x1004022d2: mov r9d, dword ptr [r13 + 0x20]
0x1004022d6: cmp r9d, 2
0x1004022da: je 0x10040236c
0x1004022e0: cmp r9d, 1
0x1004022e4: je 0x100402320
0x1004022e6: test r9d, r9d
0x1004022e9: jne 0x100402679
0x1004022ef: mov rdi, qword ptr [r14 + 0x228]
0x1004022f6: mov esi, dword ptr [r13 + 0x58]
0x1004022fa: vmovss xmm1, dword ptr [rip + 0x6a2dbe] ; 0x100aa50c0
0x100402302: vsubss xmm1, xmm1, xmm0
0x100402306: vmulss xmm1, xmm1, dword ptr [r13 + 0x60]
0x10040230c: vmulss xmm0, xmm0, dword ptr [r13 + 0x30]
0x100402312: vaddss xmm0, xmm1, xmm0
0x100402316: call 0x100466710 ; 0x100466710
0x10040231b: jmp 0x100402504 ; 0x100402504
0x100402320: mov rdi, qword ptr [r14 + 0x228]
0x100402327: mov esi, dword ptr [r13 + 0x58]
0x10040232b: vmovss xmm1, dword ptr [rip + 0x6a2d8d] ; 0x100aa50c0
0x100402333: vsubss xmm1, xmm1, xmm0
0x100402337: vpermilps xmm1, xmm1, 0
0x10040233d: vmulps xmm1, xmm1, xmmword ptr [r13 + 0x60]
0x100402343: vpermilps xmm0, xmm0, 0
0x100402349: vmulps xmm0, xmm0, xmmword ptr [r13 + 0x30]
0x10040234f: vaddps xmm0, xmm1, xmm0
0x100402353: vmovaps xmmword ptr [rbp - 0x220], xmm0
0x10040235b: lea rcx, [rbp - 0x220]
0x100402362: call 0x1004669b0 ; 0x1004669b0
0x100402367: jmp 0x100402504 ; 0x100402504
0x10040236c: lea rdi, [rbp - 0x220]
0x100402373: call 0x1007c2530 ; 0x1007c2530
0x100402378: test byte ptr [r13 + 0x40], 1
0x10040237d: jne 0x100402388
0x10040237f: lea rbx, [r13 + 0x40]
0x100402383: inc rbx
0x100402386: jmp 0x10040238c ; 0x10040238c
0x100402388: mov rbx, qword ptr [r13 + 0x50]
0x10040238c: cmp byte ptr [rbx], 0
0x10040238f: lea rax, [rip + 0x75ee91] ; 0x100b61227 Black
0x100402396: cmove rbx, rax
0x10040239a: call 0x10079ac90 ; 0x10079ac90
0x10040239f: mov rdi, qword ptr [rbp - 0x248]
0x1004023a6: mov rsi, rax
0x1004023a9: mov rdx, rbx
0x1004023ac: call 0x1007c4360 ; 0x1007c4360
0x1004023b1: test rax, rax
0x1004023b4: je 0x1004024a7
0x1004023ba: mov rdi, rax
0x1004023bd: lea rsi, [rbp - 0x220]
0x1004023c4: call 0x1007c2310 ; 0x1007c2310
0x1004023c9: jmp 0x1004024bf ; 0x1004024bf
0x1004023ce: mov rax, qword ptr [rip + 0x80814b] ; 0x100c0a520
0x1004023d5: mov rcx, rax
0x1004023d8: lea rax, [rcx + 0x18]
0x1004023dc: mov qword ptr [rbp - 0x220], rax
0x1004023e3: lea rax, [rcx + 0x40]
0x1004023e7: mov qword ptr [rbp - 0xd0], rax
0x1004023ee: lea rdi, [rbp - 0xd0]
0x1004023f5: lea r15, [rbp - 0x218]
0x1004023fc: mov rsi, r15
0x1004023ff: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x100402404: mov qword ptr [rbp - 0x48], 0
0x10040240c: mov dword ptr [rbp - 0x40], 0xffffffff
0x100402413: mov rax, qword ptr [rip + 0x80b1ae] ; 0x100c0d5c8
0x10040241a: lea rbx, [rax + 0x18]
0x10040241e: mov qword ptr [rbp - 0x220], rbx
0x100402425: lea rax, [rax + 0x40]
0x100402429: mov qword ptr [rbp - 0x240], rax
0x100402430: mov qword ptr [rbp - 0xd0], rax
0x100402437: mov edx, 4
0x10040243c: mov rdi, r15
0x10040243f: lea rsi, [rip + 0x75ec00] ; 0x100b61046 LevelMesh
0x100402446: call 0x1007a56a0 ; 0x1007a56a0
0x10040244b: mov qword ptr [rbp - 0x238], rbx
0x100402452: mov rax, qword ptr [r14]
0x100402455: mov rdi, r14
0x100402458: call qword ptr [rax + 0x38]
0x10040245b: mov rbx, rax
0x10040245e: mov rdi, rbx
0x100402461: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x100402466: lea rdi, [rbp - 0x220]
0x10040246d: mov rsi, rbx
0x100402470: mov rdx, rax
0x100402473: call 0x100011930 ; 0x100011930
0x100402478: mov edx, 0x27
0x10040247d: mov rdi, rax
0x100402480: lea rsi, [rip + 0x7850e5] ; 0x100b8756c  has invalid shader uniform specified: 
0x100402487: call 0x100011930 ; 0x100011930
0x10040248c: mov rbx, rax
0x10040248f: mov rdi, qword ptr [rbp - 0x260]
0x100402496: test byte ptr [rdi], 1
0x100402499: jne 0x100402544
0x10040249f: inc rdi
0x1004024a2: jmp 0x100402548 ; 0x100402548
0x1004024a7: call 0x10079ac90 ; 0x10079ac90
0x1004024ac: mov rsi, qword ptr [rax + 8]
0x1004024b0: mov rdi, qword ptr [rbp - 0x248]
0x1004024b7: mov rdx, rbx
0x1004024ba: call 0x1007c4640 ; 0x1007c4640
0x1004024bf: mov rdi, qword ptr [r14 + 0x228]
0x1004024c6: mov esi, dword ptr [r13 + 0x58]
0x1004024ca: mov edx, dword ptr [r13 + 0x5c]
0x1004024ce: mov rax, qword ptr [rbp - 0x220]
0x1004024d5: test rax, rax
0x1004024d8: je 0x1004024ee
0x1004024da: mov rax, qword ptr [rax + 0x10]
0x1004024de: lea rcx, [rax + 0xb0]
0x1004024e5: test rax, rax
0x1004024e8: cmove rcx, rax
0x1004024ec: jmp 0x1004024f0 ; 0x1004024f0
0x1004024ee: xor ecx, ecx
0x1004024f0: xor r8d, r8d
0x1004024f3: call 0x100466e30 ; 0x100466e30
0x1004024f8: lea rdi, [rbp - 0x220]
0x1004024ff: call 0x1007c2570 ; 0x1007c2570
0x100402504: vmovss xmm0, dword ptr [r13 + 0x74]
0x10040250a: vucomiss xmm0, dword ptr [r13 + 0x70]
0x100402510: seta al
0x100402513: seta byte ptr [r13 + 0x78]
0x100402518: cmp byte ptr [r14 + 0xa32], 0
0x100402520: setne cl
0x100402523: or cl, al
0x100402525: mov byte ptr [r14 + 0xa32], cl
0x10040252c: mov ecx, dword ptr [r14 + 0x220]
0x100402533: inc r15d
0x100402536: cmp r15d, ecx
0x100402539: jb 0x100402240
0x10040253f: jmp 0x100402645 ; 0x100402645
0x100402544: mov rdi, qword ptr [r13 + 0x18]
0x100402548: mov r13, rdi
0x10040254b: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x100402550: mov rdi, rbx
0x100402553: mov rsi, r13
0x100402556: mov rdx, rax
0x100402559: call 0x100011930 ; 0x100011930
0x10040255e: mov edx, 0xd
0x100402563: mov rdi, rax
0x100402566: lea rsi, [rip + 0x785027] ; 0x100b87594  for shader: 
0x10040256d: call 0x100011930 ; 0x100011930
0x100402572: mov rbx, rax
0x100402575: mov rax, qword ptr [rbp - 0x258]
0x10040257c: test byte ptr [rax], 1
0x10040257f: mov r15, qword ptr [rbp - 0x250]
0x100402586: je 0x10040258f
0x100402588: mov r15, qword ptr [r14 + 0xc8]
0x10040258f: mov rdi, r15
0x100402592: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x100402597: mov rdi, rbx
0x10040259a: mov rsi, r15
0x10040259d: mov rdx, rax
0x1004025a0: lea r15, [rbp - 0x218]
0x1004025a7: call 0x100011930 ; 0x100011930
0x1004025ac: mov edx, 0x12
0x1004025b1: mov rdi, rax
0x1004025b4: lea rsi, [rip + 0x784fe7] ; 0x100b875a2 . Ignoring change.
0x1004025bb: call 0x100011930 ; 0x100011930
0x1004025c0: mov rax, qword ptr [rbp - 0x238]
0x1004025c7: mov qword ptr [rbp - 0x220], rax
0x1004025ce: mov rax, qword ptr [rbp - 0x240]
0x1004025d5: mov qword ptr [rbp - 0xd0], rax
0x1004025dc: mov rdi, r15
0x1004025df: call 0x1007a58d0 ; 0x1007a58d0
0x1004025e4: lea rdi, [rbp - 0x220]
0x1004025eb: mov rsi, qword ptr [rbp - 0x228]
0x1004025f2: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1004025f7: lea rdi, [rbp - 0xd0]
0x1004025fe: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100402603: mov ecx, dword ptr [r14 + 0x220]
0x10040260a: dec ecx
0x10040260c: mov rax, qword ptr [r14 + r12*8 + 0x1a0]
0x100402614: mov rdx, qword ptr [r14 + rcx*8 + 0x1a0]
0x10040261c: mov qword ptr [r14 + r12*8 + 0x1a0], rdx
0x100402624: mov qword ptr [r14 + rcx*8 + 0x1a0], rax
0x10040262c: mov dword ptr [r14 + 0x220], ecx
0x100402633: dec r12d
0x100402636: mov r15d, r12d
0x100402639: inc r15d
0x10040263c: cmp r15d, ecx
0x10040263f: jb 0x100402240
0x100402645: mov rax, qword ptr [rip + 0x80b28c] ; 0x100c0d8d8
0x10040264c: mov rax, qword ptr [rax]
0x10040264f: cmp rax, qword ptr [rbp - 0x30]
0x100402653: jne 0x100402674
0x100402655: add rsp, 0x238
0x10040265c: pop rbx
0x10040265d: pop r12
0x10040265f: pop r13
0x100402661: pop r14
0x100402663: pop r15
0x100402665: pop rbp
0x100402666: ret 
0x100402667: test al, al
0x100402669: jne 0x1004020e8
0x10040266f: jmp 0x1004020e0 ; 0x1004020e0
0x100402674: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100402679: lea rdi, [rip + 0x7a09ac] ; 0x100ba302c false
0x100402680: lea rsi, [rip + 0x784dae] ; 0x100b87435 LevelMesh.cpp
0x100402687: lea r8, [rip + 0x784f27] ; 0x100b875b5 Unknown LevelMeshShaderParam valueType: %i
0x10040268e: mov edx, 0x29f
0x100402693: mov ecx, 4
0x100402698: xor eax, eax
0x10040269a: call 0x1007e6030 ; 0x1007e6030
0x10040269f: ud2 
0x1004026a1: mov rbx, rax
0x1004026a4: jmp 0x1004026d2 ; 0x1004026d2
0x1004026a6: mov rbx, rax
0x1004026a9: jmp 0x1004026e5 ; 0x1004026e5
0x1004026ab: mov rbx, rax
0x1004026ae: mov rax, qword ptr [rbp - 0x238]
0x1004026b5: mov qword ptr [rbp - 0x220], rax
0x1004026bc: mov rax, qword ptr [rbp - 0x240]
0x1004026c3: mov qword ptr [rbp - 0xd0], rax
0x1004026ca: mov rdi, r15
0x1004026cd: call 0x1007a58d0 ; 0x1007a58d0
0x1004026d2: lea rdi, [rbp - 0x220]
0x1004026d9: mov rsi, qword ptr [rbp - 0x228]
0x1004026e0: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1004026e5: lea rdi, [rbp - 0xd0]
0x1004026ec: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1004026f1: mov rdi, rbx
0x1004026f4: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1004026f9: mov rbx, rax
0x1004026fc: lea rdi, [rbp - 0x220]
0x100402703: call 0x1007c2570 ; 0x1007c2570
0x100402708: mov rdi, rbx
0x10040270b: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
