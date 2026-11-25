0x10043fb70: push rbp
0x10043fb71: mov rbp, rsp
0x10043fb74: push r15
0x10043fb76: push r14
0x10043fb78: push r13
0x10043fb7a: push r12
0x10043fb7c: push rbx
0x10043fb7d: sub rsp, 0x58
0x10043fb81: mov r14, rsi
0x10043fb84: mov rbx, rdi
0x10043fb87: call 0x100443f50 ; 0x100443f50
0x10043fb8c: mov eax, dword ptr [rbx + 0xc]
0x10043fb8f: cmp rax, 0x1e
0x10043fb93: jae 0x1004433ab
0x10043fb99: lea ecx, [rax + 1]
0x10043fb9c: mov dword ptr [rbx + 0xc], ecx
0x10043fb9f: imul r15, rax, 0x1a0
0x10043fba6: mov byte ptr [rbx + r15 + 0x10], 1
0x10043fbac: mov dword ptr [rbx + r15 + 0x14], eax
0x10043fbb1: mov dword ptr [rbx + 0x30d4], eax
0x10043fbb7: lea r12, [rip + 0x749269] ; 0x100b88e27 RockFaceSh
0x10043fbbe: mov qword ptr [rbx + r15 + 0x18], r12
0x10043fbc3: lea rax, [rip + 0x74928a] ; 0x100b88e54 u_sideGeoTexture
0x10043fbca: vmovq xmm0, rax
0x10043fbcf: lea rax, [rip + 0x74925c] ; 0x100b88e32 u_topGeoTexture
0x10043fbd6: vmovq xmm1, rax
0x10043fbdb: vpunpcklqdq xmm0, xmm1, xmm0
0x10043fbdf: vmovdqa xmmword ptr [rbp - 0x50], xmm0
0x10043fbe4: vmovdqu xmmword ptr [rbx + r15 + 0x78], xmm0
0x10043fbeb: lea rax, [rip + 0x749250] ; 0x100b88e42 RockHeightCliffSh
0x10043fbf2: vmovq xmm0, rax
0x10043fbf7: vpshufd xmm0, xmm0, 0x44
0x10043fbfc: vmovdqu xmmword ptr [rbx + r15 + 0x98], xmm0
0x10043fc06: lea rdi, [rbp - 0x40]
0x10043fc0a: vmovss xmm0, dword ptr [rip + 0x68218e] ; 0x100ac1da0
0x10043fc12: vmovd xmm1, dword ptr [rip + 0x6654a6] ; 0x100aa50c0
0x10043fc1a: vmovdqa xmm2, xmm1
0x10043fc1e: vmovdqa xmm3, xmm1
0x10043fc22: call 0x10077d540 ; 0x10077d540
0x10043fc27: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10043fc2c: vmovaps xmmword ptr [rbx + r15 + 0x30], xmm0
0x10043fc33: mov eax, dword ptr [rbx + 0xc]
0x10043fc36: cmp rax, 0x1e
0x10043fc3a: jae 0x1004433ab
0x10043fc40: lea ecx, [rax + 1]
0x10043fc43: mov dword ptr [rbx + 0xc], ecx
0x10043fc46: imul r15, rax, 0x1a0
0x10043fc4d: mov byte ptr [rbx + r15 + 0x10], 0x10
0x10043fc53: mov dword ptr [rbx + r15 + 0x14], eax
0x10043fc58: mov dword ptr [rbx + 0x3110], eax
0x10043fc5e: mov qword ptr [rbx + r15 + 0x18], r12
0x10043fc63: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x10043fc68: vmovups xmmword ptr [rbx + r15 + 0x78], xmm0
0x10043fc6f: lea rax, [rip + 0x7491ef] ; 0x100b88e65 CliffSh
0x10043fc76: vmovq xmm0, rax
0x10043fc7b: vpshufd xmm0, xmm0, 0x44
0x10043fc80: vmovdqa xmmword ptr [rbp - 0x60], xmm0
0x10043fc85: vmovdqu xmmword ptr [rbx + r15 + 0x98], xmm0
0x10043fc8f: lea rdi, [rbp - 0x40]
0x10043fc93: vmovss xmm0, dword ptr [rip + 0x682109] ; 0x100ac1da4
0x10043fc9b: vmovd xmm1, dword ptr [rip + 0x667451] ; 0x100aa70f4
0x10043fca3: vmovd xmm2, dword ptr [rip + 0x668939] ; 0x100aa85e4
0x10043fcab: vmovd xmm3, dword ptr [rip + 0x66540d] ; 0x100aa50c0
0x10043fcb3: call 0x10077d540 ; 0x10077d540
0x10043fcb8: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10043fcbd: lea r12, [rbx + r15 + 0x30]
0x10043fcc2: vmovaps xmmword ptr [rbx + r15 + 0x30], xmm0
0x10043fcc9: lea rsi, [rip + 0x74919d] ; 0x100b88e6d Prairie_ButterflyFields2
0x10043fcd0: mov rdi, r14
0x10043fcd3: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10043fcd8: test eax, eax
0x10043fcda: jne 0x10043fd10
0x10043fcdc: lea rdi, [rbp - 0x40]
0x10043fce0: vmovss xmm0, dword ptr [rip + 0x6820bc] ; 0x100ac1da4
0x10043fce8: vmovd xmm1, dword ptr [rip + 0x6688e0] ; 0x100aa85d0
0x10043fcf0: vmovd xmm2, dword ptr [rip + 0x6673fc] ; 0x100aa70f4
0x10043fcf8: vmovd xmm3, dword ptr [rip + 0x6653c0] ; 0x100aa50c0
0x10043fd00: call 0x10077d540 ; 0x10077d540
0x10043fd05: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10043fd0a: vmovaps xmmword ptr [r12], xmm0
0x10043fd10: lea rsi, [rip + 0x73b79c] ; 0x100b7b4b3 Prairie_NestAndKeeper
0x10043fd17: mov rdi, r14
0x10043fd1a: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10043fd1f: test eax, eax
0x10043fd21: jne 0x10043fd57
0x10043fd23: lea rdi, [rbp - 0x40]
0x10043fd27: vmovss xmm0, dword ptr [rip + 0x682075] ; 0x100ac1da4
0x10043fd2f: vmovd xmm1, dword ptr [rip + 0x6673bd] ; 0x100aa70f4
0x10043fd37: vmovd xmm2, dword ptr [rip + 0x66d25d] ; 0x100aacf9c
0x10043fd3f: vmovd xmm3, dword ptr [rip + 0x665379] ; 0x100aa50c0
0x10043fd47: call 0x10077d540 ; 0x10077d540
0x10043fd4c: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10043fd51: vmovaps xmmword ptr [r12], xmm0
0x10043fd57: lea rsi, [rip + 0x73b786] ; 0x100b7b4e4 RainMid
0x10043fd5e: mov rdi, r14
0x10043fd61: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10043fd66: test eax, eax
0x10043fd68: jne 0x10043fd96
0x10043fd6a: lea rdi, [rbp - 0x40]
0x10043fd6e: vmovd xmm2, dword ptr [rip + 0x668852] ; 0x100aa85c8
0x10043fd76: vmovd xmm3, dword ptr [rip + 0x665342] ; 0x100aa50c0
0x10043fd7e: vxorps xmm0, xmm0, xmm0
0x10043fd82: vpxor xmm1, xmm1, xmm1
0x10043fd86: call 0x10077d540 ; 0x10077d540
0x10043fd8b: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10043fd90: vmovaps xmmword ptr [r12], xmm0
0x10043fd96: mov dword ptr [rbx + r15 + 0x6c], 0x3e800000
0x10043fd9f: movabs r12, 0x3f80000000000000
0x10043fda9: mov qword ptr [rbx + r15 + 0x64], r12
0x10043fdae: mov eax, dword ptr [rbx + 0x3110]
0x10043fdb4: imul rax, rax, 0x1a0
0x10043fdbb: cmp byte ptr [rbx + rax + 0x10], 0x10
0x10043fdc0: jne 0x1004433fe
0x10043fdc6: lea r15, [rbx + 0xc]
0x10043fdca: mov ecx, dword ptr [r15]
0x10043fdcd: cmp rcx, 0x1e
0x10043fdd1: vmovaps xmm4, xmmword ptr [rbp - 0x50]
0x10043fdd6: jae 0x1004433ab
0x10043fddc: lea rdi, [rbx + rax + 0x10]
0x10043fde1: lea esi, [rcx + 1]
0x10043fde4: mov dword ptr [rbx + 0xc], esi
0x10043fde7: imul r13, rcx, 0x1a0
0x10043fdee: mov byte ptr [rbx + r13 + 0x10], 0x12
0x10043fdf4: mov dword ptr [rbx + r13 + 0x14], ecx
0x10043fdf9: mov dword ptr [rbx + 0x3118], ecx
0x10043fdff: mov dl, byte ptr [rdi + 0x10]
0x10043fe02: mov byte ptr [rbx + r13 + 0x20], dl
0x10043fe07: vmovaps xmm0, xmmword ptr [rdi]
0x10043fe0b: vmovaps xmmword ptr [rbx + r13 + 0x10], xmm0
0x10043fe12: vmovaps xmm0, xmmword ptr [rbx + rax + 0x30]
0x10043fe18: vmovaps xmmword ptr [rbx + r13 + 0x30], xmm0
0x10043fe1f: vmovaps xmm0, xmmword ptr [rbx + rax + 0x40]
0x10043fe25: vmovaps xmmword ptr [rbx + r13 + 0x40], xmm0
0x10043fe2c: vmovaps xmm0, xmmword ptr [rbx + rax + 0x50]
0x10043fe32: vmovaps xmmword ptr [rbx + r13 + 0x50], xmm0
0x10043fe39: vmovups ymm0, ymmword ptr [rbx + rax + 0x60]
0x10043fe3f: vmovups ymm1, ymmword ptr [rbx + rax + 0x80]
0x10043fe48: vmovups ymm2, ymmword ptr [rbx + rax + 0xa0]
0x10043fe51: vmovups ymm3, ymmword ptr [rbx + rax + 0xb8]
0x10043fe5a: vmovups ymmword ptr [rbx + r13 + 0xb8], ymm3
0x10043fe64: vmovups ymmword ptr [rbx + r13 + 0xa0], ymm2
0x10043fe6e: vmovups ymmword ptr [rbx + r13 + 0x80], ymm1
0x10043fe78: vmovups ymmword ptr [rbx + r13 + 0x60], ymm0
0x10043fe7f: vmovaps xmm0, xmmword ptr [rbx + rax + 0xe0]
0x10043fe88: vmovaps xmmword ptr [rbx + r13 + 0xe0], xmm0
0x10043fe92: vmovaps xmm0, xmmword ptr [rbx + rax + 0xf0]
0x10043fe9b: vmovaps xmmword ptr [rbx + r13 + 0xf0], xmm0
0x10043fea5: vmovaps xmm0, xmmword ptr [rbx + rax + 0x100]
0x10043feae: vmovaps xmmword ptr [rbx + r13 + 0x100], xmm0
0x10043feb8: vmovaps xmm0, xmmword ptr [rbx + rax + 0x110]
0x10043fec1: vmovaps xmmword ptr [rbx + r13 + 0x110], xmm0
0x10043fecb: vmovups ymm0, ymmword ptr [rbx + rax + 0x120]
0x10043fed4: vmovups ymmword ptr [rbx + r13 + 0x120], ymm0
0x10043fede: vmovaps xmm0, xmmword ptr [rbx + rax + 0x140]
0x10043fee7: vmovaps xmmword ptr [rbx + r13 + 0x140], xmm0
0x10043fef1: vmovaps xmm0, xmmword ptr [rbx + rax + 0x150]
0x10043fefa: vmovaps xmmword ptr [rbx + r13 + 0x150], xmm0
0x10043ff04: vmovaps xmm0, xmmword ptr [rbx + rax + 0x160]
0x10043ff0d: vmovaps xmmword ptr [rbx + r13 + 0x160], xmm0
0x10043ff17: vmovaps xmm0, xmmword ptr [rbx + rax + 0x170]
0x10043ff20: vmovaps xmmword ptr [rbx + r13 + 0x170], xmm0
0x10043ff2a: vmovups ymm0, ymmword ptr [rbx + rax + 0x180]
0x10043ff33: vmovups ymm1, ymmword ptr [rbx + rax + 0x190]
0x10043ff3c: vmovups ymmword ptr [rbx + r13 + 0x190], ymm1
0x10043ff46: vmovups ymmword ptr [rbx + r13 + 0x180], ymm0
0x10043ff50: mov byte ptr [rbx + r13 + 0x10], 0x12
0x10043ff56: mov dword ptr [rbx + r13 + 0x14], ecx
0x10043ff5b: vmovups xmmword ptr [rbx + r13 + 0x78], xmm4
0x10043ff62: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x10043ff67: vmovups xmmword ptr [rbx + r13 + 0x98], xmm0
0x10043ff71: lea rdi, [rbp - 0x40]
0x10043ff75: vmovss xmm0, dword ptr [rip + 0x681e2b] ; 0x100ac1da8
0x10043ff7d: vmovd xmm1, dword ptr [rip + 0x6725c3] ; 0x100ab2548
0x10043ff85: vmovd xmm2, dword ptr [rip + 0x66925f] ; 0x100aa91ec
0x10043ff8d: vmovd xmm3, dword ptr [rip + 0x66512b] ; 0x100aa50c0
0x10043ff95: vzeroupper 
0x10043ff98: call 0x10077d540 ; 0x10077d540
0x10043ff9d: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10043ffa2: vmovaps xmmword ptr [rbx + r13 + 0x30], xmm0
0x10043ffa9: mov dword ptr [rbx + r13 + 0x6c], 0x3e800000
0x10043ffb2: mov qword ptr [rbx + r13 + 0x64], r12
0x10043ffb7: lea rsi, [rip + 0x724d67] ; 0x100b64d25 SunsetEnd
0x10043ffbe: mov rdi, r14
0x10043ffc1: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10043ffc6: test eax, eax
0x10043ffc8: je 0x10043ffdd
0x10043ffca: lea rsi, [rip + 0x732c7f] ; 0x100b72c50 Dawn
0x10043ffd1: mov rdi, r14
0x10043ffd4: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10043ffd9: test eax, eax
0x10043ffdb: jne 0x100440016
0x10043ffdd: lea r13, [rbx + r13 + 0x30]
0x10043ffe2: lea rdi, [rbp - 0x40]
0x10043ffe6: vmovss xmm0, dword ptr [rip + 0x681dba] ; 0x100ac1da8
0x10043ffee: vmovd xmm1, dword ptr [rip + 0x6677fe] ; 0x100aa77f4
0x10043fff6: vmovd xmm2, dword ptr [rip + 0x6691c6] ; 0x100aa91c4
0x10043fffe: vmovd xmm3, dword ptr [rip + 0x6650ba] ; 0x100aa50c0
0x100440006: call 0x10077d540 ; 0x10077d540
0x10044000b: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100440010: vmovaps xmmword ptr [r13], xmm0
0x100440016: mov eax, dword ptr [rbx + 0x3110]
0x10044001c: imul rax, rax, 0x1a0
0x100440023: cmp byte ptr [rbx + rax + 0x10], 0x10
0x100440028: jne 0x1004433fe
0x10044002e: mov ecx, dword ptr [r15]
0x100440031: cmp rcx, 0x1e
0x100440035: vmovaps xmm4, xmmword ptr [rbp - 0x50]
0x10044003a: jae 0x1004433ab
0x100440040: lea rdx, [rbx + rax + 0x10]
0x100440045: lea esi, [rcx + 1]
0x100440048: mov dword ptr [rbx + 0xc], esi
0x10044004b: imul r13, rcx, 0x1a0
0x100440052: mov byte ptr [rbx + r13 + 0x10], 0x11
0x100440058: mov dword ptr [rbx + r13 + 0x14], ecx
0x10044005d: mov dword ptr [rbx + 0x3114], ecx
0x100440063: mov esi, dword ptr [rbx + r13 + 0x14]
0x100440068: mov cl, byte ptr [rdx + 0x10]
0x10044006b: mov byte ptr [rbx + r13 + 0x20], cl
0x100440070: vmovaps xmm0, xmmword ptr [rdx]
0x100440074: vmovaps xmmword ptr [rbx + r13 + 0x10], xmm0
0x10044007b: vmovaps xmm0, xmmword ptr [rbx + rax + 0x30]
0x100440081: vmovaps xmmword ptr [rbx + r13 + 0x30], xmm0
0x100440088: vmovaps xmm0, xmmword ptr [rbx + rax + 0x40]
0x10044008e: vmovaps xmmword ptr [rbx + r13 + 0x40], xmm0
0x100440095: vmovaps xmm0, xmmword ptr [rbx + rax + 0x50]
0x10044009b: vmovaps xmmword ptr [rbx + r13 + 0x50], xmm0
0x1004400a2: vmovups ymm0, ymmword ptr [rbx + rax + 0x60]
0x1004400a8: vmovups ymm1, ymmword ptr [rbx + rax + 0x80]
0x1004400b1: vmovups ymm2, ymmword ptr [rbx + rax + 0xa0]
0x1004400ba: vmovups ymm3, ymmword ptr [rbx + rax + 0xb8]
0x1004400c3: vmovups ymmword ptr [rbx + r13 + 0xb8], ymm3
0x1004400cd: vmovups ymmword ptr [rbx + r13 + 0xa0], ymm2
0x1004400d7: vmovups ymmword ptr [rbx + r13 + 0x80], ymm1
0x1004400e1: vmovups ymmword ptr [rbx + r13 + 0x60], ymm0
0x1004400e8: vmovaps xmm0, xmmword ptr [rbx + rax + 0xe0]
0x1004400f1: vmovaps xmmword ptr [rbx + r13 + 0xe0], xmm0
0x1004400fb: vmovaps xmm0, xmmword ptr [rbx + rax + 0xf0]
0x100440104: vmovaps xmmword ptr [rbx + r13 + 0xf0], xmm0
0x10044010e: vmovaps xmm0, xmmword ptr [rbx + rax + 0x100]
0x100440117: vmovaps xmmword ptr [rbx + r13 + 0x100], xmm0
0x100440121: vmovaps xmm0, xmmword ptr [rbx + rax + 0x110]
0x10044012a: vmovaps xmmword ptr [rbx + r13 + 0x110], xmm0
0x100440134: vmovups ymm0, ymmword ptr [rbx + rax + 0x120]
0x10044013d: vmovups ymmword ptr [rbx + r13 + 0x120], ymm0
0x100440147: vmovaps xmm0, xmmword ptr [rbx + rax + 0x140]
0x100440150: vmovaps xmmword ptr [rbx + r13 + 0x140], xmm0
0x10044015a: vmovaps xmm0, xmmword ptr [rbx + rax + 0x150]
0x100440163: vmovaps xmmword ptr [rbx + r13 + 0x150], xmm0
0x10044016d: vmovaps xmm0, xmmword ptr [rbx + rax + 0x160]
0x100440176: vmovaps xmmword ptr [rbx + r13 + 0x160], xmm0
0x100440180: vmovaps xmm0, xmmword ptr [rbx + rax + 0x170]
0x100440189: vmovaps xmmword ptr [rbx + r13 + 0x170], xmm0
0x100440193: vmovups ymm0, ymmword ptr [rbx + rax + 0x180]
0x10044019c: vmovups ymm1, ymmword ptr [rbx + rax + 0x190]
0x1004401a5: vmovups ymmword ptr [rbx + r13 + 0x190], ymm1
0x1004401af: vmovups ymmword ptr [rbx + r13 + 0x180], ymm0
0x1004401b9: mov byte ptr [rbx + r13 + 0x10], 0x11
0x1004401bf: mov dword ptr [rbx + r13 + 0x14], esi
0x1004401c4: vmovups xmmword ptr [rbx + r13 + 0x78], xmm4
0x1004401cb: lea rax, [rip + 0x748cb4] ; 0x100b88e86 SoilSh
0x1004401d2: vmovq xmm0, rax
0x1004401d7: vpshufd xmm0, xmm0, 0x44
0x1004401dc: vmovdqa xmmword ptr [rbp - 0x70], xmm0
0x1004401e1: vmovdqu xmmword ptr [rbx + r13 + 0x98], xmm0
0x1004401eb: lea rdi, [rbp - 0x40]
0x1004401ef: vmovss xmm0, dword ptr [rip + 0x681bb1] ; 0x100ac1da8
0x1004401f7: vmovd xmm1, dword ptr [rip + 0x672349] ; 0x100ab2548
0x1004401ff: vmovd xmm2, dword ptr [rip + 0x6683a9] ; 0x100aa85b0
0x100440207: vmovd xmm3, dword ptr [rip + 0x664eb1] ; 0x100aa50c0
0x10044020f: vzeroupper 
0x100440212: call 0x10077d540 ; 0x10077d540
0x100440217: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10044021c: vmovaps xmmword ptr [rbx + r13 + 0x30], xmm0
0x100440223: movabs rax, 0x3ee666663f666666
0x10044022d: mov qword ptr [rbx + r13 + 0x68], rax
0x100440232: mov eax, dword ptr [rbx + 0x3114]
0x100440238: imul rdx, rax, 0x1a0
0x10044023f: cmp byte ptr [rbx + rdx + 0x10], 0x11
0x100440244: jne 0x10044348b
0x10044024a: mov ecx, dword ptr [r15]
0x10044024d: cmp rcx, 0x1e
0x100440251: jae 0x1004433ab
0x100440257: lea rdi, [rbx + rdx + 0x10]
0x10044025c: lea r8d, [rcx + 1]
0x100440260: mov dword ptr [rbx + 0xc], r8d
0x100440264: imul rsi, rcx, 0x1a0
0x10044026b: mov byte ptr [rbx + rsi + 0x10], 0x1b
0x100440270: mov dword ptr [rbx + rsi + 0x14], ecx
0x100440274: mov dword ptr [rbx + 0x313c], ecx
0x10044027a: mov al, byte ptr [rdi + 0x10]
0x10044027d: mov byte ptr [rbx + rsi + 0x20], al
0x100440281: vmovaps xmm0, xmmword ptr [rdi]
0x100440285: vmovaps xmmword ptr [rbx + rsi + 0x10], xmm0
0x10044028b: vmovaps xmm0, xmmword ptr [rbx + rdx + 0x30]
0x100440291: vmovaps xmmword ptr [rbx + rsi + 0x30], xmm0
0x100440297: vmovaps xmm0, xmmword ptr [rbx + rdx + 0x40]
0x10044029d: vmovaps xmmword ptr [rbx + rsi + 0x40], xmm0
0x1004402a3: vmovaps xmm0, xmmword ptr [rbx + rdx + 0x50]
0x1004402a9: vmovaps xmmword ptr [rbx + rsi + 0x50], xmm0
0x1004402af: vmovups ymm0, ymmword ptr [rbx + rdx + 0x60]
0x1004402b5: vmovups ymm1, ymmword ptr [rbx + rdx + 0x80]
0x1004402be: vmovdqu ymm2, ymmword ptr [rbx + rdx + 0xa0]
0x1004402c7: vmovdqu ymm3, ymmword ptr [rbx + rdx + 0xb8]
0x1004402d0: vmovdqu ymmword ptr [rbx + rsi + 0xb8], ymm3
0x1004402d9: vmovdqu ymmword ptr [rbx + rsi + 0xa0], ymm2
0x1004402e2: vmovups ymmword ptr [rbx + rsi + 0x80], ymm1
0x1004402eb: vmovups ymmword ptr [rbx + rsi + 0x60], ymm0
0x1004402f1: vmovaps xmm0, xmmword ptr [rbx + rdx + 0xe0]
0x1004402fa: vmovaps xmmword ptr [rbx + rsi + 0xe0], xmm0
0x100440303: vmovaps xmm0, xmmword ptr [rbx + rdx + 0xf0]
0x10044030c: vmovaps xmmword ptr [rbx + rsi + 0xf0], xmm0
0x100440315: vmovaps xmm0, xmmword ptr [rbx + rdx + 0x100]
0x10044031e: vmovaps xmmword ptr [rbx + rsi + 0x100], xmm0
0x100440327: vmovaps xmm0, xmmword ptr [rbx + rdx + 0x110]
0x100440330: vmovaps xmmword ptr [rbx + rsi + 0x110], xmm0
0x100440339: vmovups ymm0, ymmword ptr [rbx + rdx + 0x120]
0x100440342: vmovups ymmword ptr [rbx + rsi + 0x120], ymm0
0x10044034b: vmovaps xmm0, xmmword ptr [rbx + rdx + 0x140]
0x100440354: vmovaps xmmword ptr [rbx + rsi + 0x140], xmm0
0x10044035d: vmovaps xmm0, xmmword ptr [rbx + rdx + 0x150]
0x100440366: vmovaps xmmword ptr [rbx + rsi + 0x150], xmm0
0x10044036f: vmovaps xmm0, xmmword ptr [rbx + rdx + 0x160]
0x100440378: vmovaps xmmword ptr [rbx + rsi + 0x160], xmm0
0x100440381: vmovaps xmm0, xmmword ptr [rbx + rdx + 0x170]
0x10044038a: vmovaps xmmword ptr [rbx + rsi + 0x170], xmm0
0x100440393: vmovups ymm0, ymmword ptr [rbx + rdx + 0x180]
0x10044039c: vmovdqu ymm1, ymmword ptr [rbx + rdx + 0x190]
0x1004403a5: vmovdqu ymmword ptr [rbx + rsi + 0x190], ymm1
0x1004403ae: vmovups ymmword ptr [rbx + rsi + 0x180], ymm0
0x1004403b7: mov byte ptr [rbx + rsi + 0x10], 0x1b
0x1004403bc: mov dword ptr [rbx + rsi + 0x14], ecx
0x1004403c0: lea rax, [rip + 0x748ac6] ; 0x100b88e8d RockFaceRainSh
0x1004403c7: mov qword ptr [rbx + rsi + 0x18], rax
0x1004403cc: vmovaps xmm4, xmmword ptr [rbp - 0x50]
0x1004403d1: vmovups xmmword ptr [rbx + rsi + 0x78], xmm4
0x1004403d7: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x1004403dc: vmovups xmmword ptr [rbx + rsi + 0x98], xmm0
0x1004403e5: movabs rax, 0x3ee666663e800000
0x1004403ef: mov qword ptr [rbx + rsi + 0x68], rax
0x1004403f4: mov eax, dword ptr [rbx + 0x3110]
0x1004403fa: imul rdx, rax, 0x1a0
0x100440401: cmp byte ptr [rbx + rdx + 0x10], 0x10
0x100440406: jne 0x1004433fe
0x10044040c: cmp r8d, 0x1e
0x100440410: jae 0x1004433ab
0x100440416: lea rax, [rbx + rdx + 0x10]
0x10044041b: lea ecx, [rcx + 2]
0x10044041e: mov dword ptr [rbx + 0xc], ecx
0x100440421: mov ecx, r8d
0x100440424: imul r13, rcx, 0x1a0
0x10044042b: mov byte ptr [rbx + r13 + 0x10], 0x14
0x100440431: mov dword ptr [rbx + r13 + 0x14], r8d
0x100440436: mov dword ptr [rbx + 0x3120], r8d
0x10044043d: mov cl, byte ptr [rax + 0x10]
0x100440440: mov byte ptr [rbx + r13 + 0x20], cl
0x100440445: vmovaps xmm0, xmmword ptr [rax]
0x100440449: vmovaps xmmword ptr [rbx + r13 + 0x10], xmm0
0x100440450: vmovaps xmm0, xmmword ptr [rbx + rdx + 0x30]
0x100440456: vmovaps xmmword ptr [rbx + r13 + 0x30], xmm0
0x10044045d: vmovaps xmm0, xmmword ptr [rbx + rdx + 0x40]
0x100440463: vmovaps xmmword ptr [rbx + r13 + 0x40], xmm0
0x10044046a: vmovaps xmm0, xmmword ptr [rbx + rdx + 0x50]
0x100440470: vmovaps xmmword ptr [rbx + r13 + 0x50], xmm0
0x100440477: vmovups ymm0, ymmword ptr [rbx + rdx + 0x60]
0x10044047d: vmovups ymm1, ymmword ptr [rbx + rdx + 0x80]
0x100440486: vmovups ymm2, ymmword ptr [rbx + rdx + 0xa0]
0x10044048f: vmovups ymm3, ymmword ptr [rbx + rdx + 0xb8]
0x100440498: vmovups ymmword ptr [rbx + r13 + 0xb8], ymm3
0x1004404a2: vmovups ymmword ptr [rbx + r13 + 0xa0], ymm2
0x1004404ac: vmovups ymmword ptr [rbx + r13 + 0x80], ymm1
0x1004404b6: vmovups ymmword ptr [rbx + r13 + 0x60], ymm0
0x1004404bd: vmovaps xmm0, xmmword ptr [rbx + rdx + 0xe0]
0x1004404c6: vmovaps xmmword ptr [rbx + r13 + 0xe0], xmm0
0x1004404d0: vmovaps xmm0, xmmword ptr [rbx + rdx + 0xf0]
0x1004404d9: vmovaps xmmword ptr [rbx + r13 + 0xf0], xmm0
0x1004404e3: vmovaps xmm0, xmmword ptr [rbx + rdx + 0x100]
0x1004404ec: vmovaps xmmword ptr [rbx + r13 + 0x100], xmm0
0x1004404f6: vmovaps xmm0, xmmword ptr [rbx + rdx + 0x110]
0x1004404ff: vmovaps xmmword ptr [rbx + r13 + 0x110], xmm0
0x100440509: vmovups ymm0, ymmword ptr [rbx + rdx + 0x120]
0x100440512: vmovups ymmword ptr [rbx + r13 + 0x120], ymm0
0x10044051c: vmovaps xmm0, xmmword ptr [rbx + rdx + 0x140]
0x100440525: vmovaps xmmword ptr [rbx + r13 + 0x140], xmm0
0x10044052f: vmovaps xmm0, xmmword ptr [rbx + rdx + 0x150]
0x100440538: vmovaps xmmword ptr [rbx + r13 + 0x150], xmm0
0x100440542: vmovaps xmm0, xmmword ptr [rbx + rdx + 0x160]
0x10044054b: vmovaps xmmword ptr [rbx + r13 + 0x160], xmm0
0x100440555: vmovaps xmm0, xmmword ptr [rbx + rdx + 0x170]
0x10044055e: vmovaps xmmword ptr [rbx + r13 + 0x170], xmm0
0x100440568: vmovups ymm0, ymmword ptr [rbx + rdx + 0x180]
0x100440571: vmovdqu ymm1, ymmword ptr [rbx + rdx + 0x190]
0x10044057a: vmovdqu ymmword ptr [rbx + r13 + 0x190], ymm1
0x100440584: vmovups ymmword ptr [rbx + r13 + 0x180], ymm0
0x10044058e: mov byte ptr [rbx + r13 + 0x10], 0x14
0x100440594: mov dword ptr [rbx + r13 + 0x14], r8d
0x100440599: vmovups xmmword ptr [rbx + r13 + 0x78], xmm4
0x1004405a0: lea rax, [rip + 0x7488f5] ; 0x100b88e9c WallSh
0x1004405a7: vmovq xmm0, rax
0x1004405ac: vmovdqa xmmword ptr [rbp - 0x80], xmm0
0x1004405b1: vpshufd xmm0, xmm0, 0x44
0x1004405b6: vmovdqa xmmword ptr [rbp - 0x70], xmm0
0x1004405bb: vmovdqu xmmword ptr [rbx + r13 + 0x98], xmm0
0x1004405c5: lea rdi, [rbp - 0x40]
0x1004405c9: vmovss xmm0, dword ptr [rip + 0x6817db] ; 0x100ac1dac
0x1004405d1: vmovd xmm2, dword ptr [rip + 0x668057] ; 0x100aa8630
0x1004405d9: vmovd xmm3, dword ptr [rip + 0x664adf] ; 0x100aa50c0
0x1004405e1: vpxor xmm1, xmm1, xmm1
0x1004405e5: vzeroupper 
0x1004405e8: call 0x10077d540 ; 0x10077d540
0x1004405ed: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1004405f2: vmovaps xmmword ptr [rbx + r13 + 0x30], xmm0
0x1004405f9: mov dword ptr [rbx + r13 + 0x6c], 0x3e800000
0x100440602: movabs rax, 0x3f7333333dcccccd
0x10044060c: mov qword ptr [rbx + r13 + 0x64], rax
0x100440611: mov eax, dword ptr [rbx + 0x3120]
0x100440617: imul rax, rax, 0x1a0
0x10044061e: cmp byte ptr [rbx + rax + 0x10], 0x14
0x100440623: jne 0x1004433cd
0x100440629: mov ecx, dword ptr [r15]
0x10044062c: cmp rcx, 0x1e
0x100440630: jae 0x1004433ab
0x100440636: lea rdi, [rbx + rax + 0x10]
0x10044063b: lea esi, [rcx + 1]
0x10044063e: mov dword ptr [rbx + 0xc], esi
0x100440641: imul r13, rcx, 0x1a0
0x100440648: mov byte ptr [rbx + r13 + 0x10], 0x13
0x10044064e: mov dword ptr [rbx + r13 + 0x14], ecx
0x100440653: mov dword ptr [rbx + 0x311c], ecx
0x100440659: mov dl, byte ptr [rdi + 0x10]
0x10044065c: mov byte ptr [rbx + r13 + 0x20], dl
0x100440661: vmovaps xmm0, xmmword ptr [rdi]
0x100440665: vmovaps xmmword ptr [rbx + r13 + 0x10], xmm0
0x10044066c: vmovaps xmm0, xmmword ptr [rbx + rax + 0x30]
0x100440672: vmovaps xmmword ptr [rbx + r13 + 0x30], xmm0
0x100440679: vmovaps xmm0, xmmword ptr [rbx + rax + 0x40]
0x10044067f: vmovaps xmmword ptr [rbx + r13 + 0x40], xmm0
0x100440686: vmovaps xmm0, xmmword ptr [rbx + rax + 0x50]
0x10044068c: vmovaps xmmword ptr [rbx + r13 + 0x50], xmm0
0x100440693: vmovups ymm0, ymmword ptr [rbx + rax + 0x60]
0x100440699: vmovups ymm1, ymmword ptr [rbx + rax + 0x80]
0x1004406a2: vmovups ymm2, ymmword ptr [rbx + rax + 0xa0]
0x1004406ab: vmovups ymm3, ymmword ptr [rbx + rax + 0xb8]
0x1004406b4: vmovups ymmword ptr [rbx + r13 + 0xb8], ymm3
0x1004406be: vmovups ymmword ptr [rbx + r13 + 0xa0], ymm2
0x1004406c8: vmovups ymmword ptr [rbx + r13 + 0x80], ymm1
0x1004406d2: vmovups ymmword ptr [rbx + r13 + 0x60], ymm0
0x1004406d9: vmovaps xmm0, xmmword ptr [rbx + rax + 0xe0]
0x1004406e2: vmovaps xmmword ptr [rbx + r13 + 0xe0], xmm0
0x1004406ec: vmovaps xmm0, xmmword ptr [rbx + rax + 0xf0]
0x1004406f5: vmovaps xmmword ptr [rbx + r13 + 0xf0], xmm0
0x1004406ff: vmovaps xmm0, xmmword ptr [rbx + rax + 0x100]
0x100440708: vmovaps xmmword ptr [rbx + r13 + 0x100], xmm0
0x100440712: vmovaps xmm0, xmmword ptr [rbx + rax + 0x110]
0x10044071b: vmovaps xmmword ptr [rbx + r13 + 0x110], xmm0
0x100440725: vmovups ymm0, ymmword ptr [rbx + rax + 0x120]
0x10044072e: vmovups ymmword ptr [rbx + r13 + 0x120], ymm0
0x100440738: vmovaps xmm0, xmmword ptr [rbx + rax + 0x140]
0x100440741: vmovaps xmmword ptr [rbx + r13 + 0x140], xmm0
0x10044074b: vmovaps xmm0, xmmword ptr [rbx + rax + 0x150]
0x100440754: vmovaps xmmword ptr [rbx + r13 + 0x150], xmm0
0x10044075e: vmovaps xmm0, xmmword ptr [rbx + rax + 0x160]
0x100440767: vmovaps xmmword ptr [rbx + r13 + 0x160], xmm0
0x100440771: vmovaps xmm0, xmmword ptr [rbx + rax + 0x170]
0x10044077a: vmovaps xmmword ptr [rbx + r13 + 0x170], xmm0
0x100440784: vmovups ymm0, ymmword ptr [rbx + rax + 0x180]
0x10044078d: vmovdqu ymm1, ymmword ptr [rbx + rax + 0x190]
0x100440796: vmovdqu ymmword ptr [rbx + r13 + 0x190], ymm1
0x1004407a0: vmovups ymmword ptr [rbx + r13 + 0x180], ymm0
0x1004407aa: mov byte ptr [rbx + r13 + 0x10], 0x13
0x1004407b0: mov dword ptr [rbx + r13 + 0x14], ecx
0x1004407b5: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x1004407ba: vmovups xmmword ptr [rbx + r13 + 0x78], xmm0
0x1004407c1: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x1004407c6: vmovups xmmword ptr [rbx + r13 + 0x98], xmm0
0x1004407d0: lea rdi, [rbp - 0x40]
0x1004407d4: vmovss xmm0, dword ptr [rip + 0x6815d0] ; 0x100ac1dac
0x1004407dc: vmovd xmm2, dword ptr [rip + 0x666910] ; 0x100aa70f4
0x1004407e4: vmovd xmm3, dword ptr [rip + 0x6648d4] ; 0x100aa50c0
0x1004407ec: vpxor xmm1, xmm1, xmm1
0x1004407f0: vzeroupper 
0x1004407f3: call 0x10077d540 ; 0x10077d540
0x1004407f8: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1004407fd: vmovaps xmmword ptr [rbx + r13 + 0x30], xmm0
0x100440804: movabs rax, 0x3ee666663f800000
0x10044080e: mov qword ptr [rbx + r13 + 0x68], rax
0x100440813: mov eax, dword ptr [rbx + 0x3110]
0x100440819: imul rax, rax, 0x1a0
0x100440820: cmp byte ptr [rbx + rax + 0x10], 0x10
0x100440825: jne 0x1004433fe
0x10044082b: mov ecx, dword ptr [r15]
0x10044082e: cmp rcx, 0x1e
0x100440832: jae 0x1004433ab
0x100440838: lea rdi, [rbx + rax + 0x10]
0x10044083d: lea esi, [rcx + 1]
0x100440840: mov dword ptr [rbx + 0xc], esi
0x100440843: imul r13, rcx, 0x1a0
0x10044084a: mov byte ptr [rbx + r13 + 0x10], 0x15
0x100440850: mov dword ptr [rbx + r13 + 0x14], ecx
0x100440855: mov dword ptr [rbx + 0x3124], ecx
0x10044085b: mov dl, byte ptr [rdi + 0x10]
0x10044085e: mov byte ptr [rbx + r13 + 0x20], dl
0x100440863: vmovaps xmm0, xmmword ptr [rdi]
0x100440867: vmovaps xmmword ptr [rbx + r13 + 0x10], xmm0
0x10044086e: vmovaps xmm0, xmmword ptr [rbx + rax + 0x30]
0x100440874: vmovaps xmmword ptr [rbx + r13 + 0x30], xmm0
0x10044087b: vmovaps xmm0, xmmword ptr [rbx + rax + 0x40]
0x100440881: vmovaps xmmword ptr [rbx + r13 + 0x40], xmm0
0x100440888: vmovaps xmm0, xmmword ptr [rbx + rax + 0x50]
0x10044088e: vmovaps xmmword ptr [rbx + r13 + 0x50], xmm0
0x100440895: vmovups ymm0, ymmword ptr [rbx + rax + 0x60]
0x10044089b: vmovups ymm1, ymmword ptr [rbx + rax + 0x80]
0x1004408a4: vmovups ymm2, ymmword ptr [rbx + rax + 0xa0]
0x1004408ad: vmovups ymm3, ymmword ptr [rbx + rax + 0xb8]
0x1004408b6: vmovups ymmword ptr [rbx + r13 + 0xb8], ymm3
0x1004408c0: vmovups ymmword ptr [rbx + r13 + 0xa0], ymm2
0x1004408ca: vmovups ymmword ptr [rbx + r13 + 0x80], ymm1
0x1004408d4: vmovups ymmword ptr [rbx + r13 + 0x60], ymm0
0x1004408db: vmovaps xmm0, xmmword ptr [rbx + rax + 0xe0]
0x1004408e4: vmovaps xmmword ptr [rbx + r13 + 0xe0], xmm0
0x1004408ee: vmovaps xmm0, xmmword ptr [rbx + rax + 0xf0]
0x1004408f7: vmovaps xmmword ptr [rbx + r13 + 0xf0], xmm0
0x100440901: vmovaps xmm0, xmmword ptr [rbx + rax + 0x100]
0x10044090a: vmovaps xmmword ptr [rbx + r13 + 0x100], xmm0
0x100440914: vmovaps xmm0, xmmword ptr [rbx + rax + 0x110]
0x10044091d: vmovaps xmmword ptr [rbx + r13 + 0x110], xmm0
0x100440927: vmovups ymm0, ymmword ptr [rbx + rax + 0x120]
0x100440930: vmovups ymmword ptr [rbx + r13 + 0x120], ymm0
0x10044093a: vmovaps xmm0, xmmword ptr [rbx + rax + 0x140]
0x100440943: vmovaps xmmword ptr [rbx + r13 + 0x140], xmm0
0x10044094d: vmovaps xmm0, xmmword ptr [rbx + rax + 0x150]
0x100440956: vmovaps xmmword ptr [rbx + r13 + 0x150], xmm0
0x100440960: vmovaps xmm0, xmmword ptr [rbx + rax + 0x160]
0x100440969: vmovaps xmmword ptr [rbx + r13 + 0x160], xmm0
0x100440973: vmovaps xmm0, xmmword ptr [rbx + rax + 0x170]
0x10044097c: vmovaps xmmword ptr [rbx + r13 + 0x170], xmm0
0x100440986: vmovups ymm0, ymmword ptr [rbx + rax + 0x180]
0x10044098f: vmovups ymm1, ymmword ptr [rbx + rax + 0x190]
0x100440998: vmovups ymmword ptr [rbx + r13 + 0x190], ymm1
0x1004409a2: vmovups ymmword ptr [rbx + r13 + 0x180], ymm0
0x1004409ac: mov byte ptr [rbx + r13 + 0x10], 0x15
0x1004409b2: mov dword ptr [rbx + r13 + 0x14], ecx
0x1004409b7: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x1004409bc: vmovups xmmword ptr [rbx + r13 + 0x78], xmm0
0x1004409c3: lea rax, [rip + 0x7484d9] ; 0x100b88ea3 GoldSh
0x1004409ca: vmovq xmm0, rax
0x1004409cf: vpshufd xmm0, xmm0, 0x44
0x1004409d4: vmovdqu xmmword ptr [rbx + r13 + 0x98], xmm0
0x1004409de: lea rdi, [rbp - 0x40]
0x1004409e2: vmovss xmm0, dword ptr [rip + 0x6813c2] ; 0x100ac1dac
0x1004409ea: vmovd xmm2, dword ptr [rip + 0x667c3e] ; 0x100aa8630
0x1004409f2: vmovd xmm1, dword ptr [rip + 0x6646c6] ; 0x100aa50c0
0x1004409fa: vmovdqa xmm3, xmm1
0x1004409fe: vzeroupper 
0x100440a01: call 0x10077d540 ; 0x10077d540
0x100440a06: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100440a0b: vmovaps xmmword ptr [rbx + r13 + 0x30], xmm0
0x100440a12: mov dword ptr [rbx + r13 + 0x6c], 0x3f800000
0x100440a1b: movabs rax, 0x3d4ccccd3f800000
0x100440a25: mov qword ptr [rbx + r13 + 0x64], rax
0x100440a2a: mov eax, dword ptr [rbx + 0x3110]
0x100440a30: imul rax, rax, 0x1a0
0x100440a37: cmp byte ptr [rbx + rax + 0x10], 0x10
0x100440a3c: jne 0x1004433fe
0x100440a42: mov ecx, dword ptr [r15]
0x100440a45: cmp rcx, 0x1e
0x100440a49: jae 0x1004433ab
0x100440a4f: lea rdi, [rbx + rax + 0x10]
0x100440a54: lea esi, [rcx + 1]
0x100440a57: mov dword ptr [rbx + 0xc], esi
0x100440a5a: imul r13, rcx, 0x1a0
0x100440a61: mov byte ptr [rbx + r13 + 0x10], 0x16
0x100440a67: mov dword ptr [rbx + r13 + 0x14], ecx
0x100440a6c: mov dword ptr [rbx + 0x3128], ecx
0x100440a72: mov dl, byte ptr [rdi + 0x10]
0x100440a75: mov byte ptr [rbx + r13 + 0x20], dl
0x100440a7a: vmovaps xmm0, xmmword ptr [rdi]
0x100440a7e: vmovaps xmmword ptr [rbx + r13 + 0x10], xmm0
0x100440a85: vmovaps xmm0, xmmword ptr [rbx + rax + 0x30]
0x100440a8b: vmovaps xmmword ptr [rbx + r13 + 0x30], xmm0
0x100440a92: vmovaps xmm0, xmmword ptr [rbx + rax + 0x40]
0x100440a98: vmovaps xmmword ptr [rbx + r13 + 0x40], xmm0
0x100440a9f: vmovaps xmm0, xmmword ptr [rbx + rax + 0x50]
0x100440aa5: vmovaps xmmword ptr [rbx + r13 + 0x50], xmm0
0x100440aac: vmovups ymm0, ymmword ptr [rbx + rax + 0x60]
0x100440ab2: vmovups ymm1, ymmword ptr [rbx + rax + 0x80]
0x100440abb: vmovups ymm2, ymmword ptr [rbx + rax + 0xa0]
0x100440ac4: vmovups ymm3, ymmword ptr [rbx + rax + 0xb8]
0x100440acd: vmovups ymmword ptr [rbx + r13 + 0xb8], ymm3
0x100440ad7: vmovups ymmword ptr [rbx + r13 + 0xa0], ymm2
0x100440ae1: vmovups ymmword ptr [rbx + r13 + 0x80], ymm1
0x100440aeb: vmovups ymmword ptr [rbx + r13 + 0x60], ymm0
0x100440af2: vmovaps xmm0, xmmword ptr [rbx + rax + 0xe0]
0x100440afb: vmovaps xmmword ptr [rbx + r13 + 0xe0], xmm0
0x100440b05: vmovaps xmm0, xmmword ptr [rbx + rax + 0xf0]
0x100440b0e: vmovaps xmmword ptr [rbx + r13 + 0xf0], xmm0
0x100440b18: vmovaps xmm0, xmmword ptr [rbx + rax + 0x100]
0x100440b21: vmovaps xmmword ptr [rbx + r13 + 0x100], xmm0
0x100440b2b: vmovaps xmm0, xmmword ptr [rbx + rax + 0x110]
0x100440b34: vmovaps xmmword ptr [rbx + r13 + 0x110], xmm0
0x100440b3e: vmovups ymm0, ymmword ptr [rbx + rax + 0x120]
0x100440b47: vmovups ymmword ptr [rbx + r13 + 0x120], ymm0
0x100440b51: vmovaps xmm0, xmmword ptr [rbx + rax + 0x140]
0x100440b5a: vmovaps xmmword ptr [rbx + r13 + 0x140], xmm0
0x100440b64: vmovaps xmm0, xmmword ptr [rbx + rax + 0x150]
0x100440b6d: vmovaps xmmword ptr [rbx + r13 + 0x150], xmm0
0x100440b77: vmovaps xmm0, xmmword ptr [rbx + rax + 0x160]
0x100440b80: vmovaps xmmword ptr [rbx + r13 + 0x160], xmm0
0x100440b8a: vmovaps xmm0, xmmword ptr [rbx + rax + 0x170]
0x100440b93: vmovaps xmmword ptr [rbx + r13 + 0x170], xmm0
0x100440b9d: vmovups ymm0, ymmword ptr [rbx + rax + 0x180]
0x100440ba6: vmovups ymm1, ymmword ptr [rbx + rax + 0x190]
0x100440baf: vmovups ymmword ptr [rbx + r13 + 0x190], ymm1
0x100440bb9: vmovups ymmword ptr [rbx + r13 + 0x180], ymm0
0x100440bc3: mov byte ptr [rbx + r13 + 0x10], 0x16
0x100440bc9: mov dword ptr [rbx + r13 + 0x14], ecx
0x100440bce: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x100440bd3: vmovups xmmword ptr [rbx + r13 + 0x78], xmm0
0x100440bda: lea rax, [rip + 0x7482c9] ; 0x100b88eaa GlacierSh
0x100440be1: vmovq xmm0, rax
0x100440be6: vpshufd xmm0, xmm0, 0x44
0x100440beb: vmovdqu xmmword ptr [rbx + r13 + 0x98], xmm0
0x100440bf5: lea rdi, [rbp - 0x40]
0x100440bf9: vmovss xmm0, dword ptr [rip + 0x6811af] ; 0x100ac1db0
0x100440c01: vmovd xmm1, dword ptr [rip + 0x6639af] ; 0x100aa45b8
0x100440c09: vmovd xmm3, dword ptr [rip + 0x6644af] ; 0x100aa50c0
0x100440c11: vmovdqa xmm2, xmm1
0x100440c15: vzeroupper 
0x100440c18: call 0x10077d540 ; 0x10077d540
0x100440c1d: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100440c22: vmovaps xmmword ptr [rbx + r13 + 0x30], xmm0
0x100440c29: mov dword ptr [rbx + r13 + 0x6c], 0x3e000000
0x100440c32: movabs rax, 0x3dcccccd3f000000
0x100440c3c: mov qword ptr [rbx + r13 + 0x64], rax
0x100440c41: mov eax, dword ptr [rbx + 0x3120]
0x100440c47: imul rax, rax, 0x1a0
0x100440c4e: cmp byte ptr [rbx + rax + 0x10], 0x14
0x100440c53: jne 0x1004433cd
0x100440c59: mov ecx, dword ptr [r15]
0x100440c5c: cmp rcx, 0x1e
0x100440c60: jae 0x1004433ab
0x100440c66: lea rdi, [rbx + rax + 0x10]
0x100440c6b: lea esi, [rcx + 1]
0x100440c6e: mov dword ptr [rbx + 0xc], esi
0x100440c71: imul r13, rcx, 0x1a0
0x100440c78: mov byte ptr [rbx + r13 + 0x10], 0x17
0x100440c7e: mov dword ptr [rbx + r13 + 0x14], ecx
0x100440c83: mov dword ptr [rbx + 0x312c], ecx
0x100440c89: mov dl, byte ptr [rdi + 0x10]
0x100440c8c: mov byte ptr [rbx + r13 + 0x20], dl
0x100440c91: vmovaps xmm0, xmmword ptr [rdi]
0x100440c95: vmovaps xmmword ptr [rbx + r13 + 0x10], xmm0
0x100440c9c: vmovaps xmm0, xmmword ptr [rbx + rax + 0x30]
0x100440ca2: vmovaps xmmword ptr [rbx + r13 + 0x30], xmm0
0x100440ca9: vmovaps xmm0, xmmword ptr [rbx + rax + 0x40]
0x100440caf: vmovaps xmmword ptr [rbx + r13 + 0x40], xmm0
0x100440cb6: vmovaps xmm0, xmmword ptr [rbx + rax + 0x50]
0x100440cbc: vmovaps xmmword ptr [rbx + r13 + 0x50], xmm0
0x100440cc3: vmovups ymm0, ymmword ptr [rbx + rax + 0x60]
0x100440cc9: vmovups ymm1, ymmword ptr [rbx + rax + 0x80]
0x100440cd2: vmovups ymm2, ymmword ptr [rbx + rax + 0xa0]
0x100440cdb: vmovups ymm3, ymmword ptr [rbx + rax + 0xb8]
0x100440ce4: vmovups ymmword ptr [rbx + r13 + 0xb8], ymm3
0x100440cee: vmovups ymmword ptr [rbx + r13 + 0xa0], ymm2
0x100440cf8: vmovups ymmword ptr [rbx + r13 + 0x80], ymm1
0x100440d02: vmovups ymmword ptr [rbx + r13 + 0x60], ymm0
0x100440d09: vmovaps xmm0, xmmword ptr [rbx + rax + 0xe0]
0x100440d12: vmovaps xmmword ptr [rbx + r13 + 0xe0], xmm0
0x100440d1c: vmovaps xmm0, xmmword ptr [rbx + rax + 0xf0]
0x100440d25: vmovaps xmmword ptr [rbx + r13 + 0xf0], xmm0
0x100440d2f: vmovaps xmm0, xmmword ptr [rbx + rax + 0x100]
0x100440d38: vmovaps xmmword ptr [rbx + r13 + 0x100], xmm0
0x100440d42: vmovaps xmm0, xmmword ptr [rbx + rax + 0x110]
0x100440d4b: vmovaps xmmword ptr [rbx + r13 + 0x110], xmm0
0x100440d55: vmovups ymm0, ymmword ptr [rbx + rax + 0x120]
0x100440d5e: vmovups ymmword ptr [rbx + r13 + 0x120], ymm0
0x100440d68: vmovaps xmm0, xmmword ptr [rbx + rax + 0x140]
0x100440d71: vmovaps xmmword ptr [rbx + r13 + 0x140], xmm0
0x100440d7b: vmovaps xmm0, xmmword ptr [rbx + rax + 0x150]
0x100440d84: vmovaps xmmword ptr [rbx + r13 + 0x150], xmm0
0x100440d8e: vmovaps xmm0, xmmword ptr [rbx + rax + 0x160]
0x100440d97: vmovaps xmmword ptr [rbx + r13 + 0x160], xmm0
0x100440da1: vmovaps xmm0, xmmword ptr [rbx + rax + 0x170]
0x100440daa: vmovaps xmmword ptr [rbx + r13 + 0x170], xmm0
0x100440db4: vmovups ymm0, ymmword ptr [rbx + rax + 0x180]
0x100440dbd: vmovdqu ymm1, ymmword ptr [rbx + rax + 0x190]
0x100440dc6: vmovdqu ymmword ptr [rbx + r13 + 0x190], ymm1
0x100440dd0: vmovups ymmword ptr [rbx + r13 + 0x180], ymm0
0x100440dda: mov byte ptr [rbx + r13 + 0x10], 0x17
0x100440de0: mov dword ptr [rbx + r13 + 0x14], ecx
0x100440de5: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x100440dea: vmovups xmmword ptr [rbx + r13 + 0x78], xmm0
0x100440df1: lea rax, [rip + 0x7480bc] ; 0x100b88eb4 TileCeilingSh
0x100440df8: vmovq xmm0, rax
0x100440dfd: vpshufd xmm0, xmm0, 0x44
0x100440e02: vmovdqu xmmword ptr [rbx + r13 + 0x98], xmm0
0x100440e0c: lea rdi, [rbp - 0x40]
0x100440e10: vmovss xmm0, dword ptr [rip + 0x6677e8] ; 0x100aa8600
0x100440e18: vmovd xmm2, dword ptr [rip + 0x663798] ; 0x100aa45b8
0x100440e20: vmovd xmm3, dword ptr [rip + 0x664298] ; 0x100aa50c0
0x100440e28: vpxor xmm1, xmm1, xmm1
0x100440e2c: vzeroupper 
0x100440e2f: call 0x10077d540 ; 0x10077d540
0x100440e34: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100440e39: vmovaps xmmword ptr [rbx + r13 + 0x30], xmm0
0x100440e40: mov dword ptr [rbx + r13 + 0x6c], 0x3f000000
0x100440e49: mov qword ptr [rbx + r13 + 0x64], r12
0x100440e4e: mov eax, dword ptr [rbx + 0x3120]
0x100440e54: imul rax, rax, 0x1a0
0x100440e5b: cmp byte ptr [rbx + rax + 0x10], 0x14
0x100440e60: jne 0x1004433cd
0x100440e66: mov ecx, dword ptr [r15]
0x100440e69: cmp rcx, 0x1e
0x100440e6d: jae 0x1004433ab
0x100440e73: lea rdi, [rbx + rax + 0x10]
0x100440e78: lea esi, [rcx + 1]
0x100440e7b: mov dword ptr [rbx + 0xc], esi
0x100440e7e: imul r13, rcx, 0x1a0
0x100440e85: mov byte ptr [rbx + r13 + 0x10], 0x18
0x100440e8b: mov dword ptr [rbx + r13 + 0x14], ecx
0x100440e90: mov dword ptr [rbx + 0x3130], ecx
0x100440e96: mov dl, byte ptr [rdi + 0x10]
0x100440e99: mov byte ptr [rbx + r13 + 0x20], dl
0x100440e9e: vmovaps xmm0, xmmword ptr [rdi]
0x100440ea2: vmovaps xmmword ptr [rbx + r13 + 0x10], xmm0
0x100440ea9: vmovaps xmm0, xmmword ptr [rbx + rax + 0x30]
0x100440eaf: vmovaps xmmword ptr [rbx + r13 + 0x30], xmm0
0x100440eb6: vmovaps xmm0, xmmword ptr [rbx + rax + 0x40]
0x100440ebc: vmovaps xmmword ptr [rbx + r13 + 0x40], xmm0
0x100440ec3: vmovaps xmm0, xmmword ptr [rbx + rax + 0x50]
0x100440ec9: vmovaps xmmword ptr [rbx + r13 + 0x50], xmm0
0x100440ed0: vmovups ymm0, ymmword ptr [rbx + rax + 0x60]
0x100440ed6: vmovups ymm1, ymmword ptr [rbx + rax + 0x80]
0x100440edf: vmovups ymm2, ymmword ptr [rbx + rax + 0xa0]
0x100440ee8: vmovups ymm3, ymmword ptr [rbx + rax + 0xb8]
0x100440ef1: vmovups ymmword ptr [rbx + r13 + 0xb8], ymm3
0x100440efb: vmovups ymmword ptr [rbx + r13 + 0xa0], ymm2
0x100440f05: vmovups ymmword ptr [rbx + r13 + 0x80], ymm1
0x100440f0f: vmovups ymmword ptr [rbx + r13 + 0x60], ymm0
0x100440f16: vmovaps xmm0, xmmword ptr [rbx + rax + 0xe0]
0x100440f1f: vmovaps xmmword ptr [rbx + r13 + 0xe0], xmm0
0x100440f29: vmovaps xmm0, xmmword ptr [rbx + rax + 0xf0]
0x100440f32: vmovaps xmmword ptr [rbx + r13 + 0xf0], xmm0
0x100440f3c: vmovaps xmm0, xmmword ptr [rbx + rax + 0x100]
0x100440f45: vmovaps xmmword ptr [rbx + r13 + 0x100], xmm0
0x100440f4f: vmovaps xmm0, xmmword ptr [rbx + rax + 0x110]
0x100440f58: vmovaps xmmword ptr [rbx + r13 + 0x110], xmm0
0x100440f62: vmovups ymm0, ymmword ptr [rbx + rax + 0x120]
0x100440f6b: vmovups ymmword ptr [rbx + r13 + 0x120], ymm0
0x100440f75: vmovaps xmm0, xmmword ptr [rbx + rax + 0x140]
0x100440f7e: vmovaps xmmword ptr [rbx + r13 + 0x140], xmm0
0x100440f88: vmovaps xmm0, xmmword ptr [rbx + rax + 0x150]
0x100440f91: vmovaps xmmword ptr [rbx + r13 + 0x150], xmm0
0x100440f9b: vmovaps xmm0, xmmword ptr [rbx + rax + 0x160]
0x100440fa4: vmovaps xmmword ptr [rbx + r13 + 0x160], xmm0
0x100440fae: vmovaps xmm0, xmmword ptr [rbx + rax + 0x170]
0x100440fb7: vmovaps xmmword ptr [rbx + r13 + 0x170], xmm0
0x100440fc1: vmovups ymm0, ymmword ptr [rbx + rax + 0x180]
0x100440fca: vmovups ymm1, ymmword ptr [rbx + rax + 0x190]
0x100440fd3: vmovups ymmword ptr [rbx + r13 + 0x190], ymm1
0x100440fdd: vmovups ymmword ptr [rbx + r13 + 0x180], ymm0
0x100440fe7: mov byte ptr [rbx + r13 + 0x10], 0x18
0x100440fed: mov dword ptr [rbx + r13 + 0x14], ecx
0x100440ff2: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x100440ff7: vmovups xmmword ptr [rbx + r13 + 0x78], xmm0
0x100440ffe: lea rax, [rip + 0x747ebd] ; 0x100b88ec2 TileFloorSh
0x100441005: vmovq xmm0, rax
0x10044100a: vmovdqa xmmword ptr [rbp - 0x60], xmm0
0x10044100f: vpunpcklqdq xmm0, xmm0, xmmword ptr [rbp - 0x80]
0x100441014: vmovdqu xmmword ptr [rbx + r13 + 0x98], xmm0
0x10044101e: lea rdi, [rbp - 0x40]
0x100441022: vmovss xmm0, dword ptr [rip + 0x680d7a] ; 0x100ac1da4
0x10044102a: vmovd xmm1, dword ptr [rip + 0x6660c2] ; 0x100aa70f4
0x100441032: vmovd xmm2, dword ptr [rip + 0x66758e] ; 0x100aa85c8
0x10044103a: vmovd xmm3, dword ptr [rip + 0x66407e] ; 0x100aa50c0
0x100441042: vzeroupper 
0x100441045: call 0x10077d540 ; 0x10077d540
0x10044104a: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10044104f: vmovaps xmmword ptr [rbx + r13 + 0x30], xmm0
0x100441056: movabs rax, 0x3f8000003dcccccd
0x100441060: mov qword ptr [rbx + r13 + 0x64], rax
0x100441065: mov dword ptr [rbx + r13 + 0x6c], 0x3e800000
0x10044106e: mov eax, dword ptr [rbx + 0x3120]
0x100441074: imul rax, rax, 0x1a0
0x10044107b: cmp byte ptr [rbx + rax + 0x10], 0x14
0x100441080: jne 0x1004433cd
0x100441086: mov ecx, dword ptr [r15]
0x100441089: cmp rcx, 0x1e
0x10044108d: jae 0x1004433ab
0x100441093: lea rdx, [rbx + rax + 0x10]
0x100441098: lea esi, [rcx + 1]
0x10044109b: mov dword ptr [rbx + 0xc], esi
0x10044109e: imul r13, rcx, 0x1a0
0x1004410a5: mov byte ptr [rbx + r13 + 0x10], 0x19
0x1004410ab: mov dword ptr [rbx + r13 + 0x14], ecx
0x1004410b0: mov dword ptr [rbx + 0x3134], ecx
0x1004410b6: mov esi, dword ptr [rbx + r13 + 0x14]
0x1004410bb: mov cl, byte ptr [rdx + 0x10]
0x1004410be: mov byte ptr [rbx + r13 + 0x20], cl
0x1004410c3: vmovaps xmm0, xmmword ptr [rdx]
0x1004410c7: vmovaps xmmword ptr [rbx + r13 + 0x10], xmm0
0x1004410ce: vmovaps xmm0, xmmword ptr [rbx + rax + 0x30]
0x1004410d4: vmovaps xmmword ptr [rbx + r13 + 0x30], xmm0
0x1004410db: vmovaps xmm0, xmmword ptr [rbx + rax + 0x40]
0x1004410e1: vmovaps xmmword ptr [rbx + r13 + 0x40], xmm0
0x1004410e8: vmovaps xmm0, xmmword ptr [rbx + rax + 0x50]
0x1004410ee: vmovaps xmmword ptr [rbx + r13 + 0x50], xmm0
0x1004410f5: vmovups ymm0, ymmword ptr [rbx + rax + 0x60]
0x1004410fb: vmovups ymm1, ymmword ptr [rbx + rax + 0x80]
0x100441104: vmovups ymm2, ymmword ptr [rbx + rax + 0xa0]
0x10044110d: vmovups ymm3, ymmword ptr [rbx + rax + 0xb8]
0x100441116: vmovups ymmword ptr [rbx + r13 + 0xb8], ymm3
0x100441120: vmovups ymmword ptr [rbx + r13 + 0xa0], ymm2
0x10044112a: vmovups ymmword ptr [rbx + r13 + 0x80], ymm1
0x100441134: vmovups ymmword ptr [rbx + r13 + 0x60], ymm0
0x10044113b: vmovaps xmm0, xmmword ptr [rbx + rax + 0xe0]
0x100441144: vmovaps xmmword ptr [rbx + r13 + 0xe0], xmm0
0x10044114e: vmovaps xmm0, xmmword ptr [rbx + rax + 0xf0]
0x100441157: vmovaps xmmword ptr [rbx + r13 + 0xf0], xmm0
0x100441161: vmovaps xmm0, xmmword ptr [rbx + rax + 0x100]
0x10044116a: vmovaps xmmword ptr [rbx + r13 + 0x100], xmm0
0x100441174: vmovaps xmm0, xmmword ptr [rbx + rax + 0x110]
0x10044117d: vmovaps xmmword ptr [rbx + r13 + 0x110], xmm0
0x100441187: vmovups ymm0, ymmword ptr [rbx + rax + 0x120]
0x100441190: vmovups ymmword ptr [rbx + r13 + 0x120], ymm0
0x10044119a: vmovaps xmm0, xmmword ptr [rbx + rax + 0x140]
0x1004411a3: vmovaps xmmword ptr [rbx + r13 + 0x140], xmm0
0x1004411ad: vmovaps xmm0, xmmword ptr [rbx + rax + 0x150]
0x1004411b6: vmovaps xmmword ptr [rbx + r13 + 0x150], xmm0
0x1004411c0: vmovaps xmm0, xmmword ptr [rbx + rax + 0x160]
0x1004411c9: vmovaps xmmword ptr [rbx + r13 + 0x160], xmm0
0x1004411d3: vmovaps xmm0, xmmword ptr [rbx + rax + 0x170]
0x1004411dc: vmovaps xmmword ptr [rbx + r13 + 0x170], xmm0
0x1004411e6: vmovups ymm0, ymmword ptr [rbx + rax + 0x180]
0x1004411ef: vmovups ymm1, ymmword ptr [rbx + rax + 0x190]
0x1004411f8: vmovups ymmword ptr [rbx + r13 + 0x190], ymm1
0x100441202: vmovups ymmword ptr [rbx + r13 + 0x180], ymm0
0x10044120c: mov byte ptr [rbx + r13 + 0x10], 0x19
0x100441212: mov dword ptr [rbx + r13 + 0x14], esi
0x100441217: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x10044121c: vmovups xmmword ptr [rbx + r13 + 0x78], xmm0
0x100441223: lea rax, [rip + 0x747ca4] ; 0x100b88ece WallBrickBigSh
0x10044122a: vmovq xmm0, rax
0x10044122f: vmovdqa xmm1, xmmword ptr [rbp - 0x60]
0x100441234: vpunpcklqdq xmm0, xmm1, xmm0
0x100441238: vmovdqu xmmword ptr [rbx + r13 + 0x98], xmm0
0x100441242: lea rdi, [rbp - 0x40]
0x100441246: vmovss xmm0, dword ptr [rip + 0x6673b2] ; 0x100aa8600
0x10044124e: vmovd xmm2, dword ptr [rip + 0x663362] ; 0x100aa45b8
0x100441256: vmovd xmm3, dword ptr [rip + 0x663e62] ; 0x100aa50c0
0x10044125e: vpxor xmm1, xmm1, xmm1
0x100441262: vzeroupper 
0x100441265: call 0x10077d540 ; 0x10077d540
0x10044126a: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10044126f: vmovaps xmmword ptr [rbx + r13 + 0x30], xmm0
0x100441276: mov dword ptr [rbx + r13 + 0x6c], 0x3e19999a
0x10044127f: movabs rax, 0x3f40000000000000
0x100441289: mov qword ptr [rbx + r13 + 0x64], rax
0x10044128e: mov eax, dword ptr [rbx + 0x3120]
0x100441294: imul rax, rax, 0x1a0
0x10044129b: cmp byte ptr [rbx + rax + 0x10], 0x14
0x1004412a0: jne 0x1004433cd
0x1004412a6: mov ecx, dword ptr [r15]
0x1004412a9: cmp rcx, 0x1e
0x1004412ad: jae 0x1004433ab
0x1004412b3: lea rdi, [rbx + rax + 0x10]
0x1004412b8: lea esi, [rcx + 1]
0x1004412bb: mov dword ptr [rbx + 0xc], esi
0x1004412be: imul r13, rcx, 0x1a0
0x1004412c5: mov byte ptr [rbx + r13 + 0x10], 0x1a
0x1004412cb: mov dword ptr [rbx + r13 + 0x14], ecx
0x1004412d0: mov dword ptr [rbx + 0x3138], ecx
0x1004412d6: mov dl, byte ptr [rdi + 0x10]
0x1004412d9: mov byte ptr [rbx + r13 + 0x20], dl
0x1004412de: vmovaps xmm0, xmmword ptr [rdi]
0x1004412e2: vmovaps xmmword ptr [rbx + r13 + 0x10], xmm0
0x1004412e9: vmovaps xmm0, xmmword ptr [rbx + rax + 0x30]
0x1004412ef: vmovaps xmmword ptr [rbx + r13 + 0x30], xmm0
0x1004412f6: vmovaps xmm0, xmmword ptr [rbx + rax + 0x40]
0x1004412fc: vmovaps xmmword ptr [rbx + r13 + 0x40], xmm0
0x100441303: vmovaps xmm0, xmmword ptr [rbx + rax + 0x50]
0x100441309: vmovaps xmmword ptr [rbx + r13 + 0x50], xmm0
0x100441310: vmovups ymm0, ymmword ptr [rbx + rax + 0x60]
0x100441316: vmovups ymm1, ymmword ptr [rbx + rax + 0x80]
0x10044131f: vmovups ymm2, ymmword ptr [rbx + rax + 0xa0]
0x100441328: vmovups ymm3, ymmword ptr [rbx + rax + 0xb8]
0x100441331: vmovups ymmword ptr [rbx + r13 + 0xb8], ymm3
0x10044133b: vmovups ymmword ptr [rbx + r13 + 0xa0], ymm2
0x100441345: vmovups ymmword ptr [rbx + r13 + 0x80], ymm1
0x10044134f: vmovups ymmword ptr [rbx + r13 + 0x60], ymm0
0x100441356: vmovaps xmm0, xmmword ptr [rbx + rax + 0xe0]
0x10044135f: vmovaps xmmword ptr [rbx + r13 + 0xe0], xmm0
0x100441369: vmovaps xmm0, xmmword ptr [rbx + rax + 0xf0]
0x100441372: vmovaps xmmword ptr [rbx + r13 + 0xf0], xmm0
0x10044137c: vmovaps xmm0, xmmword ptr [rbx + rax + 0x100]
0x100441385: vmovaps xmmword ptr [rbx + r13 + 0x100], xmm0
0x10044138f: vmovaps xmm0, xmmword ptr [rbx + rax + 0x110]
0x100441398: vmovaps xmmword ptr [rbx + r13 + 0x110], xmm0
0x1004413a2: vmovups ymm0, ymmword ptr [rbx + rax + 0x120]
0x1004413ab: vmovups ymmword ptr [rbx + r13 + 0x120], ymm0
0x1004413b5: vmovaps xmm0, xmmword ptr [rbx + rax + 0x140]
0x1004413be: vmovaps xmmword ptr [rbx + r13 + 0x140], xmm0
0x1004413c8: vmovaps xmm0, xmmword ptr [rbx + rax + 0x150]
0x1004413d1: vmovaps xmmword ptr [rbx + r13 + 0x150], xmm0
0x1004413db: vmovaps xmm0, xmmword ptr [rbx + rax + 0x160]
0x1004413e4: vmovaps xmmword ptr [rbx + r13 + 0x160], xmm0
0x1004413ee: vmovaps xmm0, xmmword ptr [rbx + rax + 0x170]
0x1004413f7: vmovaps xmmword ptr [rbx + r13 + 0x170], xmm0
0x100441401: vmovups ymm0, ymmword ptr [rbx + rax + 0x180]
0x10044140a: vmovups ymm1, ymmword ptr [rbx + rax + 0x190]
0x100441413: vmovups ymmword ptr [rbx + r13 + 0x190], ymm1
0x10044141d: vmovups ymmword ptr [rbx + r13 + 0x180], ymm0
0x100441427: mov byte ptr [rbx + r13 + 0x10], 0x1a
0x10044142d: mov dword ptr [rbx + r13 + 0x14], ecx
0x100441432: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x100441437: vmovups xmmword ptr [rbx + r13 + 0x78], xmm0
0x10044143e: lea rax, [rip + 0x747a98] ; 0x100b88edd WallBrickSh
0x100441445: vmovq xmm0, rax
0x10044144a: vpshufd xmm0, xmm0, 0x44
0x10044144f: vmovdqu xmmword ptr [rbx + r13 + 0x98], xmm0
0x100441459: lea rdi, [rbp - 0x40]
0x10044145d: vmovss xmm0, dword ptr [rip + 0x68093f] ; 0x100ac1da4
0x100441465: vmovd xmm1, dword ptr [rip + 0x665c87] ; 0x100aa70f4
0x10044146d: vmovd xmm2, dword ptr [rip + 0x66716f] ; 0x100aa85e4
0x100441475: vmovd xmm3, dword ptr [rip + 0x663c43] ; 0x100aa50c0
0x10044147d: vzeroupper 
0x100441480: call 0x10077d540 ; 0x10077d540
0x100441485: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10044148a: vmovaps xmmword ptr [rbx + r13 + 0x30], xmm0
0x100441491: mov dword ptr [rbx + r13 + 0x6c], 0x3e4ccccd
0x10044149a: mov qword ptr [rbx + r13 + 0x64], r12
0x10044149f: mov eax, dword ptr [rbx + 0x3110]
0x1004414a5: imul rax, rax, 0x1a0
0x1004414ac: cmp byte ptr [rbx + rax + 0x10], 0x10
0x1004414b1: jne 0x1004433fe
0x1004414b7: mov ecx, dword ptr [r15]
0x1004414ba: cmp rcx, 0x1e
0x1004414be: jae 0x1004433ab
0x1004414c4: lea rdi, [rbx + rax + 0x10]
0x1004414c9: lea esi, [rcx + 1]
0x1004414cc: mov dword ptr [rbx + 0xc], esi
0x1004414cf: imul r12, rcx, 0x1a0
0x1004414d6: mov byte ptr [rbx + r12 + 0x10], 0x1c
0x1004414dc: mov dword ptr [rbx + r12 + 0x14], ecx
0x1004414e1: mov dword ptr [rbx + 0x3140], ecx
0x1004414e7: mov dl, byte ptr [rdi + 0x10]
0x1004414ea: mov byte ptr [rbx + r12 + 0x20], dl
0x1004414ef: vmovaps xmm0, xmmword ptr [rdi]
0x1004414f3: vmovaps xmmword ptr [rbx + r12 + 0x10], xmm0
0x1004414fa: vmovaps xmm0, xmmword ptr [rbx + rax + 0x30]
0x100441500: vmovaps xmmword ptr [rbx + r12 + 0x30], xmm0
0x100441507: vmovaps xmm0, xmmword ptr [rbx + rax + 0x40]
0x10044150d: vmovaps xmmword ptr [rbx + r12 + 0x40], xmm0
0x100441514: vmovaps xmm0, xmmword ptr [rbx + rax + 0x50]
0x10044151a: vmovaps xmmword ptr [rbx + r12 + 0x50], xmm0
0x100441521: vmovups ymm0, ymmword ptr [rbx + rax + 0x60]
0x100441527: vmovups ymm1, ymmword ptr [rbx + rax + 0x80]
0x100441530: vmovups ymm2, ymmword ptr [rbx + rax + 0xa0]
0x100441539: vmovups ymm3, ymmword ptr [rbx + rax + 0xb8]
0x100441542: vmovups ymmword ptr [rbx + r12 + 0xb8], ymm3
0x10044154c: vmovups ymmword ptr [rbx + r12 + 0xa0], ymm2
0x100441556: vmovups ymmword ptr [rbx + r12 + 0x80], ymm1
0x100441560: vmovups ymmword ptr [rbx + r12 + 0x60], ymm0
0x100441567: vmovaps xmm0, xmmword ptr [rbx + rax + 0xe0]
0x100441570: vmovaps xmmword ptr [rbx + r12 + 0xe0], xmm0
0x10044157a: vmovaps xmm0, xmmword ptr [rbx + rax + 0xf0]
0x100441583: vmovaps xmmword ptr [rbx + r12 + 0xf0], xmm0
0x10044158d: vmovaps xmm0, xmmword ptr [rbx + rax + 0x100]
0x100441596: vmovaps xmmword ptr [rbx + r12 + 0x100], xmm0
0x1004415a0: vmovaps xmm0, xmmword ptr [rbx + rax + 0x110]
0x1004415a9: vmovaps xmmword ptr [rbx + r12 + 0x110], xmm0
0x1004415b3: vmovups ymm0, ymmword ptr [rbx + rax + 0x120]
0x1004415bc: vmovups ymmword ptr [rbx + r12 + 0x120], ymm0
0x1004415c6: vmovaps xmm0, xmmword ptr [rbx + rax + 0x140]
0x1004415cf: vmovaps xmmword ptr [rbx + r12 + 0x140], xmm0
0x1004415d9: vmovaps xmm0, xmmword ptr [rbx + rax + 0x150]
0x1004415e2: vmovaps xmmword ptr [rbx + r12 + 0x150], xmm0
0x1004415ec: vmovaps xmm0, xmmword ptr [rbx + rax + 0x160]
0x1004415f5: vmovaps xmmword ptr [rbx + r12 + 0x160], xmm0
0x1004415ff: vmovaps xmm0, xmmword ptr [rbx + rax + 0x170]
0x100441608: vmovaps xmmword ptr [rbx + r12 + 0x170], xmm0
0x100441612: vmovups ymm0, ymmword ptr [rbx + rax + 0x180]
0x10044161b: vmovups ymm1, ymmword ptr [rbx + rax + 0x190]
0x100441624: vmovups ymmword ptr [rbx + r12 + 0x190], ymm1
0x10044162e: vmovups ymmword ptr [rbx + r12 + 0x180], ymm0
0x100441638: mov byte ptr [rbx + r12 + 0x10], 0x1c
0x10044163e: mov dword ptr [rbx + r12 + 0x14], ecx
0x100441643: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x100441648: vmovups xmmword ptr [rbx + r12 + 0x78], xmm0
0x10044164f: lea rax, [rip + 0x747893] ; 0x100b88ee9 CliffWetSh
0x100441656: vmovq xmm0, rax
0x10044165b: vpshufd xmm0, xmm0, 0x44
0x100441660: vmovdqu xmmword ptr [rbx + r12 + 0x98], xmm0
0x10044166a: mov dword ptr [rbx + r12 + 0x68], 0x3e800000
0x100441673: lea rdi, [rbp - 0x40]
0x100441677: vmovss xmm0, dword ptr [rip + 0x666f81] ; 0x100aa8600
0x10044167f: vmovd xmm1, dword ptr [rip + 0x68072d] ; 0x100ac1db4
0x100441687: vmovd xmm2, dword ptr [rip + 0x666159] ; 0x100aa77e8
0x10044168f: vmovd xmm3, dword ptr [rip + 0x663a29] ; 0x100aa50c0
0x100441697: vzeroupper 
0x10044169a: call 0x10077d540 ; 0x10077d540
0x10044169f: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1004416a4: vmovaps xmmword ptr [rbx + r12 + 0x30], xmm0
0x1004416ab: mov dword ptr [rbx + r12 + 0x6c], 0x3e800000
0x1004416b4: mov eax, dword ptr [rbx + 0x3120]
0x1004416ba: imul rax, rax, 0x1a0
0x1004416c1: cmp byte ptr [rbx + rax + 0x10], 0x14
0x1004416c6: jne 0x1004433cd
0x1004416cc: mov ecx, dword ptr [r15]
0x1004416cf: cmp rcx, 0x1e
0x1004416d3: jae 0x1004433ab
0x1004416d9: lea rdi, [rbx + rax + 0x10]
0x1004416de: lea esi, [rcx + 1]
0x1004416e1: mov dword ptr [rbx + 0xc], esi
0x1004416e4: imul r12, rcx, 0x1a0
0x1004416eb: mov byte ptr [rbx + r12 + 0x10], 0x1d
0x1004416f1: mov dword ptr [rbx + r12 + 0x14], ecx
0x1004416f6: mov dword ptr [rbx + 0x3144], ecx
0x1004416fc: mov dl, byte ptr [rdi + 0x10]
0x1004416ff: mov byte ptr [rbx + r12 + 0x20], dl
0x100441704: vmovaps xmm0, xmmword ptr [rdi]
0x100441708: vmovaps xmmword ptr [rbx + r12 + 0x10], xmm0
0x10044170f: vmovaps xmm0, xmmword ptr [rbx + rax + 0x30]
0x100441715: vmovaps xmmword ptr [rbx + r12 + 0x30], xmm0
0x10044171c: vmovaps xmm0, xmmword ptr [rbx + rax + 0x40]
0x100441722: vmovaps xmmword ptr [rbx + r12 + 0x40], xmm0
0x100441729: vmovaps xmm0, xmmword ptr [rbx + rax + 0x50]
0x10044172f: vmovaps xmmword ptr [rbx + r12 + 0x50], xmm0
0x100441736: vmovups ymm0, ymmword ptr [rbx + rax + 0x60]
0x10044173c: vmovups ymm1, ymmword ptr [rbx + rax + 0x80]
0x100441745: vmovups ymm2, ymmword ptr [rbx + rax + 0xa0]
0x10044174e: vmovups ymm3, ymmword ptr [rbx + rax + 0xb8]
0x100441757: vmovups ymmword ptr [rbx + r12 + 0xb8], ymm3
0x100441761: vmovups ymmword ptr [rbx + r12 + 0xa0], ymm2
0x10044176b: vmovups ymmword ptr [rbx + r12 + 0x80], ymm1
0x100441775: vmovups ymmword ptr [rbx + r12 + 0x60], ymm0
0x10044177c: vmovaps xmm0, xmmword ptr [rbx + rax + 0xe0]
0x100441785: vmovaps xmmword ptr [rbx + r12 + 0xe0], xmm0
0x10044178f: vmovaps xmm0, xmmword ptr [rbx + rax + 0xf0]
0x100441798: vmovaps xmmword ptr [rbx + r12 + 0xf0], xmm0
0x1004417a2: vmovaps xmm0, xmmword ptr [rbx + rax + 0x100]
0x1004417ab: vmovaps xmmword ptr [rbx + r12 + 0x100], xmm0
0x1004417b5: vmovaps xmm0, xmmword ptr [rbx + rax + 0x110]
0x1004417be: vmovaps xmmword ptr [rbx + r12 + 0x110], xmm0
0x1004417c8: vmovups ymm0, ymmword ptr [rbx + rax + 0x120]
0x1004417d1: vmovups ymmword ptr [rbx + r12 + 0x120], ymm0
0x1004417db: vmovaps xmm0, xmmword ptr [rbx + rax + 0x140]
0x1004417e4: vmovaps xmmword ptr [rbx + r12 + 0x140], xmm0
0x1004417ee: vmovaps xmm0, xmmword ptr [rbx + rax + 0x150]
0x1004417f7: vmovaps xmmword ptr [rbx + r12 + 0x150], xmm0
0x100441801: vmovaps xmm0, xmmword ptr [rbx + rax + 0x160]
0x10044180a: vmovaps xmmword ptr [rbx + r12 + 0x160], xmm0
0x100441814: vmovaps xmm0, xmmword ptr [rbx + rax + 0x170]
0x10044181d: vmovaps xmmword ptr [rbx + r12 + 0x170], xmm0
0x100441827: vmovups ymm0, ymmword ptr [rbx + rax + 0x180]
0x100441830: vmovdqu ymm1, ymmword ptr [rbx + rax + 0x190]
0x100441839: vmovdqu ymmword ptr [rbx + r12 + 0x190], ymm1
0x100441843: vmovups ymmword ptr [rbx + r12 + 0x180], ymm0
0x10044184d: mov byte ptr [rbx + r12 + 0x10], 0x1d
0x100441853: mov dword ptr [rbx + r12 + 0x14], ecx
0x100441858: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x10044185d: vmovups xmmword ptr [rbx + r12 + 0x78], xmm0
0x100441864: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x100441869: vmovups xmmword ptr [rbx + r12 + 0x98], xmm0
0x100441873: lea rdi, [rbp - 0x40]
0x100441877: vmovss xmm0, dword ptr [rip + 0x68052d] ; 0x100ac1dac
0x10044187f: vmovd xmm2, dword ptr [rip + 0x666da9] ; 0x100aa8630
0x100441887: vmovd xmm3, dword ptr [rip + 0x663831] ; 0x100aa50c0
0x10044188f: vpxor xmm1, xmm1, xmm1
0x100441893: vzeroupper 
0x100441896: call 0x10077d540 ; 0x10077d540
0x10044189b: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1004418a0: vmovaps xmmword ptr [rbx + r12 + 0x30], xmm0
0x1004418a7: movabs rax, 0x3f73333300000000
0x1004418b1: mov qword ptr [rbx + r12 + 0x64], rax
0x1004418b6: mov dword ptr [rbx + r12 + 0x6c], 0x3f800000
0x1004418bf: mov eax, dword ptr [rbx + 0x3120]
0x1004418c5: imul rax, rax, 0x1a0
0x1004418cc: cmp byte ptr [rbx + rax + 0x10], 0x14
0x1004418d1: jne 0x1004433cd
0x1004418d7: mov ecx, dword ptr [r15]
0x1004418da: cmp rcx, 0x1e
0x1004418de: jae 0x1004433ab
0x1004418e4: lea rdi, [rbx + rax + 0x10]
0x1004418e9: lea esi, [rcx + 1]
0x1004418ec: mov dword ptr [rbx + 0xc], esi
0x1004418ef: imul r12, rcx, 0x1a0
0x1004418f6: mov byte ptr [rbx + r12 + 0x10], 0x1e
0x1004418fc: mov dword ptr [rbx + r12 + 0x14], ecx
0x100441901: mov dword ptr [rbx + 0x3148], ecx
0x100441907: mov dl, byte ptr [rdi + 0x10]
0x10044190a: mov byte ptr [rbx + r12 + 0x20], dl
0x10044190f: vmovaps xmm0, xmmword ptr [rdi]
0x100441913: vmovaps xmmword ptr [rbx + r12 + 0x10], xmm0
0x10044191a: vmovaps xmm0, xmmword ptr [rbx + rax + 0x30]
0x100441920: vmovaps xmmword ptr [rbx + r12 + 0x30], xmm0
0x100441927: vmovaps xmm0, xmmword ptr [rbx + rax + 0x40]
0x10044192d: vmovaps xmmword ptr [rbx + r12 + 0x40], xmm0
0x100441934: vmovaps xmm0, xmmword ptr [rbx + rax + 0x50]
0x10044193a: vmovaps xmmword ptr [rbx + r12 + 0x50], xmm0
0x100441941: vmovups ymm0, ymmword ptr [rbx + rax + 0x60]
0x100441947: vmovups ymm1, ymmword ptr [rbx + rax + 0x80]
0x100441950: vmovups ymm2, ymmword ptr [rbx + rax + 0xa0]
0x100441959: vmovups ymm3, ymmword ptr [rbx + rax + 0xb8]
0x100441962: vmovups ymmword ptr [rbx + r12 + 0xb8], ymm3
0x10044196c: vmovups ymmword ptr [rbx + r12 + 0xa0], ymm2
0x100441976: vmovups ymmword ptr [rbx + r12 + 0x80], ymm1
0x100441980: vmovups ymmword ptr [rbx + r12 + 0x60], ymm0
0x100441987: vmovaps xmm0, xmmword ptr [rbx + rax + 0xe0]
0x100441990: vmovaps xmmword ptr [rbx + r12 + 0xe0], xmm0
0x10044199a: vmovaps xmm0, xmmword ptr [rbx + rax + 0xf0]
0x1004419a3: vmovaps xmmword ptr [rbx + r12 + 0xf0], xmm0
0x1004419ad: vmovaps xmm0, xmmword ptr [rbx + rax + 0x100]
0x1004419b6: vmovaps xmmword ptr [rbx + r12 + 0x100], xmm0
0x1004419c0: vmovaps xmm0, xmmword ptr [rbx + rax + 0x110]
0x1004419c9: vmovaps xmmword ptr [rbx + r12 + 0x110], xmm0
0x1004419d3: vmovups ymm0, ymmword ptr [rbx + rax + 0x120]
0x1004419dc: vmovups ymmword ptr [rbx + r12 + 0x120], ymm0
0x1004419e6: vmovaps xmm0, xmmword ptr [rbx + rax + 0x140]
0x1004419ef: vmovaps xmmword ptr [rbx + r12 + 0x140], xmm0
0x1004419f9: vmovaps xmm0, xmmword ptr [rbx + rax + 0x150]
0x100441a02: vmovaps xmmword ptr [rbx + r12 + 0x150], xmm0
0x100441a0c: vmovaps xmm0, xmmword ptr [rbx + rax + 0x160]
0x100441a15: vmovaps xmmword ptr [rbx + r12 + 0x160], xmm0
0x100441a1f: vmovaps xmm0, xmmword ptr [rbx + rax + 0x170]
0x100441a28: vmovaps xmmword ptr [rbx + r12 + 0x170], xmm0
0x100441a32: vmovups ymm0, ymmword ptr [rbx + rax + 0x180]
0x100441a3b: vmovdqu ymm1, ymmword ptr [rbx + rax + 0x190]
0x100441a44: vmovdqu ymmword ptr [rbx + r12 + 0x190], ymm1
0x100441a4e: vmovups ymmword ptr [rbx + r12 + 0x180], ymm0
0x100441a58: mov byte ptr [rbx + r12 + 0x10], 0x1e
0x100441a5e: mov dword ptr [rbx + r12 + 0x14], ecx
0x100441a63: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x100441a68: vmovups xmmword ptr [rbx + r12 + 0x78], xmm0
0x100441a6f: lea rax, [rip + 0x74747e] ; 0x100b88ef4 WoodSh
0x100441a76: vmovq xmm0, rax
0x100441a7b: vpshufd xmm0, xmm0, 0x44
0x100441a80: vmovdqu xmmword ptr [rbx + r12 + 0x98], xmm0
0x100441a8a: lea rdi, [rbp - 0x40]
0x100441a8e: vmovss xmm0, dword ptr [rip + 0x680316] ; 0x100ac1dac
0x100441a96: vmovd xmm2, dword ptr [rip + 0x667726] ; 0x100aa91c4
0x100441a9e: vmovd xmm3, dword ptr [rip + 0x66361a] ; 0x100aa50c0
0x100441aa6: vpxor xmm1, xmm1, xmm1
0x100441aaa: vzeroupper 
0x100441aad: call 0x10077d540 ; 0x10077d540
0x100441ab2: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100441ab7: vmovaps xmmword ptr [rbx + r12 + 0x30], xmm0
0x100441abe: movabs rax, 0x3f26666600000000
0x100441ac8: mov qword ptr [rbx + r12 + 0x64], rax
0x100441acd: mov dword ptr [rbx + r12 + 0x6c], 0x3dcccccd
0x100441ad6: lea rsi, [rip + 0x739a07] ; 0x100b7b4e4 RainMid
0x100441add: mov rdi, r14
0x100441ae0: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x100441ae5: test eax, eax
0x100441ae7: jne 0x100441b23
0x100441ae9: lea r12, [rbx + r12 + 0x30]
0x100441aee: lea rdi, [rbp - 0x40]
0x100441af2: vmovd xmm2, dword ptr [rip + 0x67743a] ; 0x100ab8f34
0x100441afa: vmovd xmm3, dword ptr [rip + 0x6635be] ; 0x100aa50c0
0x100441b02: vxorps xmm0, xmm0, xmm0
0x100441b06: vpxor xmm1, xmm1, xmm1
0x100441b0a: call 0x10077d540 ; 0x10077d540
0x100441b0f: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100441b14: vmovaps xmmword ptr [r12], xmm0
0x100441b1a: mov dword ptr [r12 + 0x38], 0x3e800000
0x100441b23: mov eax, dword ptr [rbx + 0x3120]
0x100441b29: imul rcx, rax, 0x1a0
0x100441b30: cmp byte ptr [rbx + rcx + 0x10], 0x14
0x100441b35: jne 0x1004433cd
0x100441b3b: mov r8d, dword ptr [r15]
0x100441b3e: cmp r8, 0x1e
0x100441b42: jae 0x1004433ab
0x100441b48: lea rdi, [rbx + rcx + 0x10]
0x100441b4d: lea edx, [r8 + 1]
0x100441b51: mov dword ptr [rbx + 0xc], edx
0x100441b54: imul rsi, r8, 0x1a0
0x100441b5b: mov byte ptr [rbx + rsi + 0x10], 0x1f
0x100441b60: mov dword ptr [rbx + rsi + 0x14], r8d
0x100441b65: mov dword ptr [rbx + 0x314c], r8d
0x100441b6c: mov al, byte ptr [rdi + 0x10]
0x100441b6f: mov byte ptr [rbx + rsi + 0x20], al
0x100441b73: vmovaps xmm0, xmmword ptr [rdi]
0x100441b77: vmovaps xmmword ptr [rbx + rsi + 0x10], xmm0
0x100441b7d: vmovaps xmm0, xmmword ptr [rbx + rcx + 0x30]
0x100441b83: vmovaps xmmword ptr [rbx + rsi + 0x30], xmm0
0x100441b89: vmovaps xmm0, xmmword ptr [rbx + rcx + 0x40]
0x100441b8f: vmovaps xmmword ptr [rbx + rsi + 0x40], xmm0
0x100441b95: vmovaps xmm0, xmmword ptr [rbx + rcx + 0x50]
0x100441b9b: vmovaps xmmword ptr [rbx + rsi + 0x50], xmm0
0x100441ba1: vmovups ymm0, ymmword ptr [rbx + rcx + 0x60]
0x100441ba7: vmovups ymm1, ymmword ptr [rbx + rcx + 0x80]
0x100441bb0: vmovdqu ymm2, ymmword ptr [rbx + rcx + 0xa0]
0x100441bb9: vmovdqu ymm3, ymmword ptr [rbx + rcx + 0xb8]
0x100441bc2: vmovdqu ymmword ptr [rbx + rsi + 0xb8], ymm3
0x100441bcb: vmovdqu ymmword ptr [rbx + rsi + 0xa0], ymm2
0x100441bd4: vmovups ymmword ptr [rbx + rsi + 0x80], ymm1
0x100441bdd: vmovups ymmword ptr [rbx + rsi + 0x60], ymm0
0x100441be3: vmovaps xmm0, xmmword ptr [rbx + rcx + 0xe0]
0x100441bec: vmovaps xmmword ptr [rbx + rsi + 0xe0], xmm0
0x100441bf5: vmovaps xmm0, xmmword ptr [rbx + rcx + 0xf0]
0x100441bfe: vmovaps xmmword ptr [rbx + rsi + 0xf0], xmm0
0x100441c07: vmovaps xmm0, xmmword ptr [rbx + rcx + 0x100]
0x100441c10: vmovaps xmmword ptr [rbx + rsi + 0x100], xmm0
0x100441c19: vmovaps xmm0, xmmword ptr [rbx + rcx + 0x110]
0x100441c22: vmovaps xmmword ptr [rbx + rsi + 0x110], xmm0
0x100441c2b: vmovups ymm0, ymmword ptr [rbx + rcx + 0x120]
0x100441c34: vmovups ymmword ptr [rbx + rsi + 0x120], ymm0
0x100441c3d: vmovaps xmm0, xmmword ptr [rbx + rcx + 0x140]
0x100441c46: vmovaps xmmword ptr [rbx + rsi + 0x140], xmm0
0x100441c4f: vmovaps xmm0, xmmword ptr [rbx + rcx + 0x150]
0x100441c58: vmovaps xmmword ptr [rbx + rsi + 0x150], xmm0
0x100441c61: vmovaps xmm0, xmmword ptr [rbx + rcx + 0x160]
0x100441c6a: vmovaps xmmword ptr [rbx + rsi + 0x160], xmm0
0x100441c73: vmovaps xmm0, xmmword ptr [rbx + rcx + 0x170]
0x100441c7c: vmovaps xmmword ptr [rbx + rsi + 0x170], xmm0
0x100441c85: vmovups ymm0, ymmword ptr [rbx + rcx + 0x180]
0x100441c8e: vmovdqu ymm1, ymmword ptr [rbx + rcx + 0x190]
0x100441c97: vmovdqu ymmword ptr [rbx + rsi + 0x190], ymm1
0x100441ca0: vmovups ymmword ptr [rbx + rsi + 0x180], ymm0
0x100441ca9: mov byte ptr [rbx + rsi + 0x10], 0x1f
0x100441cae: mov dword ptr [rbx + rsi + 0x14], r8d
0x100441cb3: mov eax, dword ptr [rbx + 0x3120]
0x100441cb9: imul rsi, rax, 0x1a0
0x100441cc0: cmp byte ptr [rbx + rsi + 0x10], 0x14
0x100441cc5: jne 0x1004433cd
0x100441ccb: cmp edx, 0x1e
0x100441cce: jae 0x1004433ab
0x100441cd4: lea rax, [rbx + rsi + 0x10]
0x100441cd9: lea r9d, [r8 + 2]
0x100441cdd: mov dword ptr [rbx + 0xc], r9d
0x100441ce1: mov edi, edx
0x100441ce3: imul rdi, rdi, 0x1a0
0x100441cea: mov byte ptr [rbx + rdi + 0x10], 2
0x100441cef: mov dword ptr [rbx + rdi + 0x14], edx
0x100441cf3: mov dword ptr [rbx + 0x30d8], edx
0x100441cf9: mov cl, byte ptr [rax + 0x10]
0x100441cfc: mov byte ptr [rbx + rdi + 0x20], cl
0x100441d00: vmovaps xmm0, xmmword ptr [rax]
0x100441d04: vmovaps xmmword ptr [rbx + rdi + 0x10], xmm0
0x100441d0a: vmovaps xmm0, xmmword ptr [rbx + rsi + 0x30]
0x100441d10: vmovaps xmmword ptr [rbx + rdi + 0x30], xmm0
0x100441d16: vmovaps xmm0, xmmword ptr [rbx + rsi + 0x40]
0x100441d1c: vmovaps xmmword ptr [rbx + rdi + 0x40], xmm0
0x100441d22: vmovaps xmm0, xmmword ptr [rbx + rsi + 0x50]
0x100441d28: vmovaps xmmword ptr [rbx + rdi + 0x50], xmm0
0x100441d2e: vmovups ymm0, ymmword ptr [rbx + rsi + 0x60]
0x100441d34: vmovups ymm1, ymmword ptr [rbx + rsi + 0x80]
0x100441d3d: vmovdqu ymm2, ymmword ptr [rbx + rsi + 0xa0]
0x100441d46: vmovdqu ymm3, ymmword ptr [rbx + rsi + 0xb8]
0x100441d4f: vmovdqu ymmword ptr [rbx + rdi + 0xb8], ymm3
0x100441d58: vmovdqu ymmword ptr [rbx + rdi + 0xa0], ymm2
0x100441d61: vmovups ymmword ptr [rbx + rdi + 0x80], ymm1
0x100441d6a: vmovups ymmword ptr [rbx + rdi + 0x60], ymm0
0x100441d70: vmovaps xmm0, xmmword ptr [rbx + rsi + 0xe0]
0x100441d79: vmovaps xmmword ptr [rbx + rdi + 0xe0], xmm0
0x100441d82: vmovaps xmm0, xmmword ptr [rbx + rsi + 0xf0]
0x100441d8b: vmovaps xmmword ptr [rbx + rdi + 0xf0], xmm0
0x100441d94: vmovaps xmm0, xmmword ptr [rbx + rsi + 0x100]
0x100441d9d: vmovaps xmmword ptr [rbx + rdi + 0x100], xmm0
0x100441da6: vmovaps xmm0, xmmword ptr [rbx + rsi + 0x110]
0x100441daf: vmovaps xmmword ptr [rbx + rdi + 0x110], xmm0
0x100441db8: vmovups ymm0, ymmword ptr [rbx + rsi + 0x120]
0x100441dc1: vmovups ymmword ptr [rbx + rdi + 0x120], ymm0
0x100441dca: vmovaps xmm0, xmmword ptr [rbx + rsi + 0x140]
0x100441dd3: vmovaps xmmword ptr [rbx + rdi + 0x140], xmm0
0x100441ddc: vmovaps xmm0, xmmword ptr [rbx + rsi + 0x150]
0x100441de5: vmovaps xmmword ptr [rbx + rdi + 0x150], xmm0
0x100441dee: vmovaps xmm0, xmmword ptr [rbx + rsi + 0x160]
0x100441df7: vmovaps xmmword ptr [rbx + rdi + 0x160], xmm0
0x100441e00: vmovaps xmm0, xmmword ptr [rbx + rsi + 0x170]
0x100441e09: vmovaps xmmword ptr [rbx + rdi + 0x170], xmm0
0x100441e12: vmovups ymm0, ymmword ptr [rbx + rsi + 0x180]
0x100441e1b: vmovdqu ymm1, ymmword ptr [rbx + rsi + 0x190]
0x100441e24: vmovdqu ymmword ptr [rbx + rdi + 0x190], ymm1
0x100441e2d: vmovups ymmword ptr [rbx + rdi + 0x180], ymm0
0x100441e36: mov byte ptr [rbx + rdi + 0x10], 2
0x100441e3b: mov dword ptr [rbx + rdi + 0x14], edx
0x100441e3f: mov eax, dword ptr [rbx + 0x3120]
0x100441e45: imul rsi, rax, 0x1a0
0x100441e4c: cmp byte ptr [rbx + rsi + 0x10], 0x14
0x100441e51: jne 0x1004433cd
0x100441e57: cmp r9d, 0x1e
0x100441e5b: jae 0x1004433ab
0x100441e61: lea rax, [rbx + rsi + 0x10]
0x100441e66: lea edx, [r8 + 3]
0x100441e6a: mov dword ptr [rbx + 0xc], edx
0x100441e6d: mov ecx, r9d
0x100441e70: imul rdi, rcx, 0x1a0
0x100441e77: mov byte ptr [rbx + rdi + 0x10], 3
0x100441e7c: mov dword ptr [rbx + rdi + 0x14], r9d
0x100441e81: mov dword ptr [rbx + 0x30dc], r9d
0x100441e88: mov cl, byte ptr [rax + 0x10]
0x100441e8b: mov byte ptr [rbx + rdi + 0x20], cl
0x100441e8f: vmovaps xmm0, xmmword ptr [rax]
0x100441e93: vmovaps xmmword ptr [rbx + rdi + 0x10], xmm0
0x100441e99: vmovaps xmm0, xmmword ptr [rbx + rsi + 0x30]
0x100441e9f: vmovaps xmmword ptr [rbx + rdi + 0x30], xmm0
0x100441ea5: vmovaps xmm0, xmmword ptr [rbx + rsi + 0x40]
0x100441eab: vmovaps xmmword ptr [rbx + rdi + 0x40], xmm0
0x100441eb1: vmovaps xmm0, xmmword ptr [rbx + rsi + 0x50]
0x100441eb7: vmovaps xmmword ptr [rbx + rdi + 0x50], xmm0
0x100441ebd: vmovups ymm0, ymmword ptr [rbx + rsi + 0x60]
0x100441ec3: vmovups ymm1, ymmword ptr [rbx + rsi + 0x80]
0x100441ecc: vmovdqu ymm2, ymmword ptr [rbx + rsi + 0xa0]
0x100441ed5: vmovdqu ymm3, ymmword ptr [rbx + rsi + 0xb8]
0x100441ede: vmovdqu ymmword ptr [rbx + rdi + 0xb8], ymm3
0x100441ee7: vmovdqu ymmword ptr [rbx + rdi + 0xa0], ymm2
0x100441ef0: vmovups ymmword ptr [rbx + rdi + 0x80], ymm1
0x100441ef9: vmovups ymmword ptr [rbx + rdi + 0x60], ymm0
0x100441eff: vmovaps xmm0, xmmword ptr [rbx + rsi + 0xe0]
0x100441f08: vmovaps xmmword ptr [rbx + rdi + 0xe0], xmm0
0x100441f11: vmovaps xmm0, xmmword ptr [rbx + rsi + 0xf0]
0x100441f1a: vmovaps xmmword ptr [rbx + rdi + 0xf0], xmm0
0x100441f23: vmovaps xmm0, xmmword ptr [rbx + rsi + 0x100]
0x100441f2c: vmovaps xmmword ptr [rbx + rdi + 0x100], xmm0
0x100441f35: vmovaps xmm0, xmmword ptr [rbx + rsi + 0x110]
0x100441f3e: vmovaps xmmword ptr [rbx + rdi + 0x110], xmm0
0x100441f47: vmovups ymm0, ymmword ptr [rbx + rsi + 0x120]
0x100441f50: vmovups ymmword ptr [rbx + rdi + 0x120], ymm0
0x100441f59: vmovaps xmm0, xmmword ptr [rbx + rsi + 0x140]
0x100441f62: vmovaps xmmword ptr [rbx + rdi + 0x140], xmm0
0x100441f6b: vmovaps xmm0, xmmword ptr [rbx + rsi + 0x150]
0x100441f74: vmovaps xmmword ptr [rbx + rdi + 0x150], xmm0
0x100441f7d: vmovaps xmm0, xmmword ptr [rbx + rsi + 0x160]
0x100441f86: vmovaps xmmword ptr [rbx + rdi + 0x160], xmm0
0x100441f8f: vmovaps xmm0, xmmword ptr [rbx + rsi + 0x170]
0x100441f98: vmovaps xmmword ptr [rbx + rdi + 0x170], xmm0
0x100441fa1: vmovups ymm0, ymmword ptr [rbx + rsi + 0x180]
0x100441faa: vmovdqu ymm1, ymmword ptr [rbx + rsi + 0x190]
0x100441fb3: vmovdqu ymmword ptr [rbx + rdi + 0x190], ymm1
0x100441fbc: vmovups ymmword ptr [rbx + rdi + 0x180], ymm0
0x100441fc5: mov byte ptr [rbx + rdi + 0x10], 3
0x100441fca: mov dword ptr [rbx + rdi + 0x14], r9d
0x100441fcf: cmp edx, 0x1e
0x100441fd2: jae 0x1004433ab
0x100441fd8: lea eax, [r8 + 4]
0x100441fdc: mov dword ptr [rbx + 0xc], eax
0x100441fdf: mov eax, edx
0x100441fe1: imul r13, rax, 0x1a0
0x100441fe8: mov byte ptr [rbx + r13 + 0x10], 0x20
0x100441fee: mov dword ptr [rbx + r13 + 0x14], edx
0x100441ff3: mov dword ptr [rbx + 0x3150], edx
0x100441ff9: lea rax, [rip + 0x746efb] ; 0x100b88efb SandSh
0x100442000: mov qword ptr [rbx + r13 + 0x18], rax
0x100442005: lea rax, [rip + 0x746ef6] ; 0x100b88f02 u_normalTex
0x10044200c: mov qword ptr [rbx + r13 + 0x78], rax
0x100442011: lea rax, [rip + 0x734b2d] ; 0x100b76b45 Noise3Ch
0x100442018: mov qword ptr [rbx + r13 + 0x98], rax
0x100442020: lea rcx, [rip + 0x746ee7] ; 0x100b88f0e u_grassMaskTexture
0x100442027: mov qword ptr [rbx + r13 + 0x88], rcx
0x10044202f: mov qword ptr [rbx + r13 + 0xa8], rax
0x100442037: lea rdi, [rbp - 0x40]
0x10044203b: vmovss xmm0, dword ptr [rip + 0x66c9c5] ; 0x100aaea08
0x100442043: vmovd xmm1, dword ptr [rip + 0x66657d] ; 0x100aa85c8
0x10044204b: vmovd xmm2, dword ptr [rip + 0x667171] ; 0x100aa91c4
0x100442053: vmovd xmm3, dword ptr [rip + 0x663065] ; 0x100aa50c0
0x10044205b: vzeroupper 
0x10044205e: call 0x10077d540 ; 0x10077d540
0x100442063: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100442068: lea r12, [rbx + r13 + 0x30]
0x10044206d: vmovaps xmmword ptr [rbx + r13 + 0x30], xmm0
0x100442074: movabs rax, 0x3e8000003f000000
0x10044207e: mov qword ptr [rbx + r13 + 0x68], rax
0x100442083: lea rsi, [rip + 0x73945a] ; 0x100b7b4e4 RainMid
0x10044208a: mov rdi, r14
0x10044208d: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x100442092: test eax, eax
0x100442094: jne 0x1004420c2
0x100442096: lea rdi, [rbp - 0x40]
0x10044209a: vmovd xmm2, dword ptr [rip + 0x666592] ; 0x100aa8634
0x1004420a2: vmovd xmm3, dword ptr [rip + 0x663016] ; 0x100aa50c0
0x1004420aa: vxorps xmm0, xmm0, xmm0
0x1004420ae: vpxor xmm1, xmm1, xmm1
0x1004420b2: call 0x10077d540 ; 0x10077d540
0x1004420b7: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1004420bc: vmovaps xmmword ptr [r12], xmm0
0x1004420c2: lea rsi, [rip + 0x730b87] ; 0x100b72c50 Dawn
0x1004420c9: mov rdi, r14
0x1004420cc: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1004420d1: test eax, eax
0x1004420d3: jne 0x100442109
0x1004420d5: lea rdi, [rbp - 0x40]
0x1004420d9: vmovss xmm0, dword ptr [rip + 0x66c927] ; 0x100aaea08
0x1004420e1: vmovd xmm1, dword ptr [rip + 0x66651f] ; 0x100aa8608
0x1004420e9: vmovd xmm2, dword ptr [rip + 0x6670d3] ; 0x100aa91c4
0x1004420f1: vmovd xmm3, dword ptr [rip + 0x662fc7] ; 0x100aa50c0
0x1004420f9: call 0x10077d540 ; 0x10077d540
0x1004420fe: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100442103: vmovaps xmmword ptr [r12], xmm0
0x100442109: mov eax, dword ptr [rbx + 0x3150]
0x10044210f: imul rax, rax, 0x1a0
0x100442116: cmp byte ptr [rbx + rax + 0x10], 0x20
0x10044211b: jne 0x10044342f
0x100442121: mov edi, dword ptr [r15]
0x100442124: cmp rdi, 0x1e
0x100442128: jae 0x1004433ab
0x10044212e: lea rsi, [rbx + rax + 0x10]
0x100442133: lea edx, [rdi + 1]
0x100442136: mov dword ptr [rbx + 0xc], edx
0x100442139: imul rdx, rdi, 0x1a0
0x100442140: mov byte ptr [rbx + rdx + 0x10], 0x22
0x100442145: mov dword ptr [rbx + rdx + 0x14], edi
0x100442149: mov dword ptr [rbx + 0x3158], edi
0x10044214f: mov cl, byte ptr [rsi + 0x10]
0x100442152: mov byte ptr [rbx + rdx + 0x20], cl
0x100442156: vmovaps xmm0, xmmword ptr [rsi]
0x10044215a: vmovaps xmmword ptr [rbx + rdx + 0x10], xmm0
0x100442160: vmovaps xmm0, xmmword ptr [rbx + rax + 0x30]
0x100442166: lea r12, [rbx + rdx + 0x30]
0x10044216b: vmovaps xmmword ptr [rbx + rdx + 0x30], xmm0
0x100442171: vmovaps xmm0, xmmword ptr [rbx + rax + 0x40]
0x100442177: vmovaps xmmword ptr [rbx + rdx + 0x40], xmm0
0x10044217d: vmovaps xmm0, xmmword ptr [rbx + rax + 0x50]
0x100442183: vmovaps xmmword ptr [rbx + rdx + 0x50], xmm0
0x100442189: vmovups ymm0, ymmword ptr [rbx + rax + 0x60]
0x10044218f: vmovups ymm1, ymmword ptr [rbx + rax + 0x80]
0x100442198: vmovdqu ymm2, ymmword ptr [rbx + rax + 0xa0]
0x1004421a1: vmovdqu ymm3, ymmword ptr [rbx + rax + 0xb8]
0x1004421aa: vmovdqu ymmword ptr [rbx + rdx + 0xb8], ymm3
0x1004421b3: vmovdqu ymmword ptr [rbx + rdx + 0xa0], ymm2
0x1004421bc: vmovups ymmword ptr [rbx + rdx + 0x80], ymm1
0x1004421c5: vmovups ymmword ptr [rbx + rdx + 0x60], ymm0
0x1004421cb: vmovaps xmm0, xmmword ptr [rbx + rax + 0xe0]
0x1004421d4: vmovaps xmmword ptr [rbx + rdx + 0xe0], xmm0
0x1004421dd: vmovaps xmm0, xmmword ptr [rbx + rax + 0xf0]
0x1004421e6: vmovaps xmmword ptr [rbx + rdx + 0xf0], xmm0
0x1004421ef: vmovaps xmm0, xmmword ptr [rbx + rax + 0x100]
0x1004421f8: vmovaps xmmword ptr [rbx + rdx + 0x100], xmm0
0x100442201: vmovaps xmm0, xmmword ptr [rbx + rax + 0x110]
0x10044220a: vmovaps xmmword ptr [rbx + rdx + 0x110], xmm0
0x100442213: vmovups ymm0, ymmword ptr [rbx + rax + 0x120]
0x10044221c: vmovups ymmword ptr [rbx + rdx + 0x120], ymm0
0x100442225: vmovaps xmm0, xmmword ptr [rbx + rax + 0x140]
0x10044222e: vmovaps xmmword ptr [rbx + rdx + 0x140], xmm0
0x100442237: vmovaps xmm0, xmmword ptr [rbx + rax + 0x150]
0x100442240: vmovaps xmmword ptr [rbx + rdx + 0x150], xmm0
0x100442249: vmovaps xmm0, xmmword ptr [rbx + rax + 0x160]
0x100442252: vmovaps xmmword ptr [rbx + rdx + 0x160], xmm0
0x10044225b: vmovaps xmm0, xmmword ptr [rbx + rax + 0x170]
0x100442264: vmovaps xmmword ptr [rbx + rdx + 0x170], xmm0
0x10044226d: vmovups ymm0, ymmword ptr [rbx + rax + 0x180]
0x100442276: vmovdqu ymm1, ymmword ptr [rbx + rax + 0x190]
0x10044227f: vmovdqu ymmword ptr [rbx + rdx + 0x190], ymm1
0x100442288: vmovups ymmword ptr [rbx + rdx + 0x180], ymm0
0x100442291: mov byte ptr [rbx + rdx + 0x10], 0x22
0x100442296: mov dword ptr [rbx + rdx + 0x14], edi
0x10044229a: lea rsi, [rip + 0x7309af] ; 0x100b72c50 Dawn
0x1004422a1: mov rdi, r14
0x1004422a4: vzeroupper 
0x1004422a7: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1004422ac: test eax, eax
0x1004422ae: jne 0x1004422e4
0x1004422b0: lea rdi, [rbp - 0x40]
0x1004422b4: vmovss xmm0, dword ptr [rip + 0x6795b0] ; 0x100abb86c
0x1004422bc: vmovd xmm1, dword ptr [rip + 0x665524] ; 0x100aa77e8
0x1004422c4: vmovd xmm2, dword ptr [rip + 0x6761cc] ; 0x100ab8498
0x1004422cc: vmovd xmm3, dword ptr [rip + 0x662dec] ; 0x100aa50c0
0x1004422d4: call 0x10077d540 ; 0x10077d540
0x1004422d9: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1004422de: vmovaps xmmword ptr [r12], xmm0
0x1004422e4: lea rsi, [rip + 0x746b82] ; 0x100b88e6d Prairie_ButterflyFields2
0x1004422eb: mov rdi, r14
0x1004422ee: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1004422f3: test eax, eax
0x1004422f5: jne 0x10044232b
0x1004422f7: lea rdi, [rbp - 0x40]
0x1004422fb: vmovss xmm0, dword ptr [rip + 0x66c705] ; 0x100aaea08
0x100442303: vmovd xmm1, dword ptr [rip + 0x6662c5] ; 0x100aa85d0
0x10044230b: vmovd xmm2, dword ptr [rip + 0x6622a5] ; 0x100aa45b8
0x100442313: vmovd xmm3, dword ptr [rip + 0x662da5] ; 0x100aa50c0
0x10044231b: call 0x10077d540 ; 0x10077d540
0x100442320: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100442325: vmovaps xmmword ptr [r12], xmm0
0x10044232b: mov eax, dword ptr [rbx + 0x3150]
0x100442331: imul rax, rax, 0x1a0
0x100442338: cmp byte ptr [rbx + rax + 0x10], 0x20
0x10044233d: jne 0x10044342f
0x100442343: mov ecx, dword ptr [r15]
0x100442346: cmp rcx, 0x1e
0x10044234a: jae 0x1004433ab
0x100442350: lea rdi, [rbx + rax + 0x10]
0x100442355: lea esi, [rcx + 1]
0x100442358: mov dword ptr [rbx + 0xc], esi
0x10044235b: imul r12, rcx, 0x1a0
0x100442362: mov byte ptr [rbx + r12 + 0x10], 0x23
0x100442368: mov dword ptr [rbx + r12 + 0x14], ecx
0x10044236d: mov dword ptr [rbx + 0x315c], ecx
0x100442373: mov dl, byte ptr [rdi + 0x10]
0x100442376: mov byte ptr [rbx + r12 + 0x20], dl
0x10044237b: vmovaps xmm0, xmmword ptr [rdi]
0x10044237f: vmovaps xmmword ptr [rbx + r12 + 0x10], xmm0
0x100442386: vmovaps xmm0, xmmword ptr [rbx + rax + 0x30]
0x10044238c: vmovaps xmmword ptr [rbx + r12 + 0x30], xmm0
0x100442393: vmovaps xmm0, xmmword ptr [rbx + rax + 0x40]
0x100442399: vmovaps xmmword ptr [rbx + r12 + 0x40], xmm0
0x1004423a0: vmovaps xmm0, xmmword ptr [rbx + rax + 0x50]
0x1004423a6: vmovaps xmmword ptr [rbx + r12 + 0x50], xmm0
0x1004423ad: vmovups ymm0, ymmword ptr [rbx + rax + 0x60]
0x1004423b3: vmovups ymm1, ymmword ptr [rbx + rax + 0x80]
0x1004423bc: vmovups ymm2, ymmword ptr [rbx + rax + 0xa0]
0x1004423c5: vmovups ymm3, ymmword ptr [rbx + rax + 0xb8]
0x1004423ce: vmovups ymmword ptr [rbx + r12 + 0xb8], ymm3
0x1004423d8: vmovups ymmword ptr [rbx + r12 + 0xa0], ymm2
0x1004423e2: vmovups ymmword ptr [rbx + r12 + 0x80], ymm1
0x1004423ec: vmovups ymmword ptr [rbx + r12 + 0x60], ymm0
0x1004423f3: vmovaps xmm0, xmmword ptr [rbx + rax + 0xe0]
0x1004423fc: vmovaps xmmword ptr [rbx + r12 + 0xe0], xmm0
0x100442406: vmovaps xmm0, xmmword ptr [rbx + rax + 0xf0]
0x10044240f: vmovaps xmmword ptr [rbx + r12 + 0xf0], xmm0
0x100442419: vmovaps xmm0, xmmword ptr [rbx + rax + 0x100]
0x100442422: vmovaps xmmword ptr [rbx + r12 + 0x100], xmm0
0x10044242c: vmovaps xmm0, xmmword ptr [rbx + rax + 0x110]
0x100442435: vmovaps xmmword ptr [rbx + r12 + 0x110], xmm0
0x10044243f: vmovups ymm0, ymmword ptr [rbx + rax + 0x120]
0x100442448: vmovups ymmword ptr [rbx + r12 + 0x120], ymm0
0x100442452: vmovaps xmm0, xmmword ptr [rbx + rax + 0x140]
0x10044245b: vmovaps xmmword ptr [rbx + r12 + 0x140], xmm0
0x100442465: vmovaps xmm0, xmmword ptr [rbx + rax + 0x150]
0x10044246e: vmovaps xmmword ptr [rbx + r12 + 0x150], xmm0
0x100442478: vmovaps xmm0, xmmword ptr [rbx + rax + 0x160]
0x100442481: vmovaps xmmword ptr [rbx + r12 + 0x160], xmm0
0x10044248b: vmovaps xmm0, xmmword ptr [rbx + rax + 0x170]
0x100442494: vmovaps xmmword ptr [rbx + r12 + 0x170], xmm0
0x10044249e: vmovups ymm0, ymmword ptr [rbx + rax + 0x180]
0x1004424a7: vmovdqu ymm1, ymmword ptr [rbx + rax + 0x190]
0x1004424b0: vmovdqu ymmword ptr [rbx + r12 + 0x190], ymm1
0x1004424ba: vmovups ymmword ptr [rbx + r12 + 0x180], ymm0
0x1004424c4: mov byte ptr [rbx + r12 + 0x10], 0x23
0x1004424ca: mov dword ptr [rbx + r12 + 0x14], ecx
0x1004424cf: lea rdi, [rbp - 0x40]
0x1004424d3: vmovss xmm0, dword ptr [rip + 0x66c52d] ; 0x100aaea08
0x1004424db: vmovd xmm2, dword ptr [rip + 0x666111] ; 0x100aa85f4
0x1004424e3: vmovd xmm3, dword ptr [rip + 0x662bd5] ; 0x100aa50c0
0x1004424eb: vpxor xmm1, xmm1, xmm1
0x1004424ef: vzeroupper 
0x1004424f2: call 0x10077d540 ; 0x10077d540
0x1004424f7: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1004424fc: vmovaps xmmword ptr [rbx + r12 + 0x30], xmm0
0x100442503: mov eax, dword ptr [rbx + 0x3150]
0x100442509: imul rax, rax, 0x1a0
0x100442510: cmp byte ptr [rbx + rax + 0x10], 0x20
0x100442515: jne 0x10044342f
0x10044251b: mov ecx, dword ptr [r15]
0x10044251e: cmp rcx, 0x1e
0x100442522: jae 0x1004433ab
0x100442528: lea rdi, [rbx + rax + 0x10]
0x10044252d: lea esi, [rcx + 1]
0x100442530: mov dword ptr [rbx + 0xc], esi
0x100442533: imul r12, rcx, 0x1a0
0x10044253a: mov byte ptr [rbx + r12 + 0x10], 0x24
0x100442540: mov dword ptr [rbx + r12 + 0x14], ecx
0x100442545: mov dword ptr [rbx + 0x3160], ecx
0x10044254b: mov dl, byte ptr [rdi + 0x10]
0x10044254e: mov byte ptr [rbx + r12 + 0x20], dl
0x100442553: vmovaps xmm0, xmmword ptr [rdi]
0x100442557: vmovaps xmmword ptr [rbx + r12 + 0x10], xmm0
0x10044255e: vmovaps xmm0, xmmword ptr [rbx + rax + 0x30]
0x100442564: vmovaps xmmword ptr [rbx + r12 + 0x30], xmm0
0x10044256b: vmovaps xmm0, xmmword ptr [rbx + rax + 0x40]
0x100442571: vmovaps xmmword ptr [rbx + r12 + 0x40], xmm0
0x100442578: vmovaps xmm0, xmmword ptr [rbx + rax + 0x50]
0x10044257e: vmovaps xmmword ptr [rbx + r12 + 0x50], xmm0
0x100442585: vmovups ymm0, ymmword ptr [rbx + rax + 0x60]
0x10044258b: vmovups ymm1, ymmword ptr [rbx + rax + 0x80]
0x100442594: vmovups ymm2, ymmword ptr [rbx + rax + 0xa0]
0x10044259d: vmovups ymm3, ymmword ptr [rbx + rax + 0xb8]
0x1004425a6: vmovups ymmword ptr [rbx + r12 + 0xb8], ymm3
0x1004425b0: vmovups ymmword ptr [rbx + r12 + 0xa0], ymm2
0x1004425ba: vmovups ymmword ptr [rbx + r12 + 0x80], ymm1
0x1004425c4: vmovups ymmword ptr [rbx + r12 + 0x60], ymm0
0x1004425cb: vmovaps xmm0, xmmword ptr [rbx + rax + 0xe0]
0x1004425d4: vmovaps xmmword ptr [rbx + r12 + 0xe0], xmm0
0x1004425de: vmovaps xmm0, xmmword ptr [rbx + rax + 0xf0]
0x1004425e7: vmovaps xmmword ptr [rbx + r12 + 0xf0], xmm0
0x1004425f1: vmovaps xmm0, xmmword ptr [rbx + rax + 0x100]
0x1004425fa: vmovaps xmmword ptr [rbx + r12 + 0x100], xmm0
0x100442604: vmovaps xmm0, xmmword ptr [rbx + rax + 0x110]
0x10044260d: vmovaps xmmword ptr [rbx + r12 + 0x110], xmm0
0x100442617: vmovups ymm0, ymmword ptr [rbx + rax + 0x120]
0x100442620: vmovups ymmword ptr [rbx + r12 + 0x120], ymm0
0x10044262a: vmovaps xmm0, xmmword ptr [rbx + rax + 0x140]
0x100442633: vmovaps xmmword ptr [rbx + r12 + 0x140], xmm0
0x10044263d: vmovaps xmm0, xmmword ptr [rbx + rax + 0x150]
0x100442646: vmovaps xmmword ptr [rbx + r12 + 0x150], xmm0
0x100442650: vmovaps xmm0, xmmword ptr [rbx + rax + 0x160]
0x100442659: vmovaps xmmword ptr [rbx + r12 + 0x160], xmm0
0x100442663: vmovaps xmm0, xmmword ptr [rbx + rax + 0x170]
0x10044266c: vmovaps xmmword ptr [rbx + r12 + 0x170], xmm0
0x100442676: vmovups ymm0, ymmword ptr [rbx + rax + 0x180]
0x10044267f: vmovups ymm1, ymmword ptr [rbx + rax + 0x190]
0x100442688: vmovups ymmword ptr [rbx + r12 + 0x190], ymm1
0x100442692: vmovups ymmword ptr [rbx + r12 + 0x180], ymm0
0x10044269c: mov byte ptr [rbx + r12 + 0x10], 0x24
0x1004426a2: mov dword ptr [rbx + r12 + 0x14], ecx
0x1004426a7: lea rdi, [rbp - 0x40]
0x1004426ab: vmovss xmm0, dword ptr [rip + 0x6791f5] ; 0x100abb8a8
0x1004426b3: vmovd xmm1, dword ptr [rip + 0x66512d] ; 0x100aa77e8
0x1004426bb: vmovd xmm2, dword ptr [rip + 0x666b01] ; 0x100aa91c4
0x1004426c3: vmovd xmm3, dword ptr [rip + 0x6629f5] ; 0x100aa50c0
0x1004426cb: vzeroupper 
0x1004426ce: call 0x10077d540 ; 0x10077d540
0x1004426d3: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1004426d8: vmovaps xmmword ptr [rbx + r12 + 0x30], xmm0
0x1004426df: mov eax, dword ptr [rbx + 0x3150]
0x1004426e5: imul rax, rax, 0x1a0
0x1004426ec: cmp byte ptr [rbx + rax + 0x10], 0x20
0x1004426f1: jne 0x10044342f
0x1004426f7: mov ecx, dword ptr [r15]
0x1004426fa: cmp rcx, 0x1e
0x1004426fe: jae 0x1004433ab
0x100442704: lea rdx, [rbx + rax + 0x10]
0x100442709: lea esi, [rcx + 1]
0x10044270c: mov dword ptr [rbx + 0xc], esi
0x10044270f: imul r12, rcx, 0x1a0
0x100442716: mov byte ptr [rbx + r12 + 0x10], 0x21
0x10044271c: mov dword ptr [rbx + r12 + 0x14], ecx
0x100442721: mov dword ptr [rbx + 0x3154], ecx
0x100442727: mov esi, dword ptr [rbx + r12 + 0x14]
0x10044272c: mov cl, byte ptr [rdx + 0x10]
0x10044272f: mov byte ptr [rbx + r12 + 0x20], cl
0x100442734: vmovaps xmm0, xmmword ptr [rdx]
0x100442738: vmovaps xmmword ptr [rbx + r12 + 0x10], xmm0
0x10044273f: vmovaps xmm0, xmmword ptr [rbx + rax + 0x30]
0x100442745: vmovaps xmmword ptr [rbx + r12 + 0x30], xmm0
0x10044274c: vmovaps xmm0, xmmword ptr [rbx + rax + 0x40]
0x100442752: vmovaps xmmword ptr [rbx + r12 + 0x40], xmm0
0x100442759: vmovaps xmm0, xmmword ptr [rbx + rax + 0x50]
0x10044275f: vmovaps xmmword ptr [rbx + r12 + 0x50], xmm0
0x100442766: vmovups ymm0, ymmword ptr [rbx + rax + 0x60]
0x10044276c: vmovups ymm1, ymmword ptr [rbx + rax + 0x80]
0x100442775: vmovups ymm2, ymmword ptr [rbx + rax + 0xa0]
0x10044277e: vmovups ymm3, ymmword ptr [rbx + rax + 0xb8]
0x100442787: vmovups ymmword ptr [rbx + r12 + 0xb8], ymm3
0x100442791: vmovups ymmword ptr [rbx + r12 + 0xa0], ymm2
0x10044279b: vmovups ymmword ptr [rbx + r12 + 0x80], ymm1
0x1004427a5: vmovups ymmword ptr [rbx + r12 + 0x60], ymm0
0x1004427ac: vmovaps xmm0, xmmword ptr [rbx + rax + 0xe0]
0x1004427b5: vmovaps xmmword ptr [rbx + r12 + 0xe0], xmm0
0x1004427bf: vmovaps xmm0, xmmword ptr [rbx + rax + 0xf0]
0x1004427c8: vmovaps xmmword ptr [rbx + r12 + 0xf0], xmm0
0x1004427d2: vmovaps xmm0, xmmword ptr [rbx + rax + 0x100]
0x1004427db: vmovaps xmmword ptr [rbx + r12 + 0x100], xmm0
0x1004427e5: vmovaps xmm0, xmmword ptr [rbx + rax + 0x110]
0x1004427ee: vmovaps xmmword ptr [rbx + r12 + 0x110], xmm0
0x1004427f8: vmovups ymm0, ymmword ptr [rbx + rax + 0x120]
0x100442801: vmovups ymmword ptr [rbx + r12 + 0x120], ymm0
0x10044280b: vmovaps xmm0, xmmword ptr [rbx + rax + 0x140]
0x100442814: vmovaps xmmword ptr [rbx + r12 + 0x140], xmm0
0x10044281e: vmovaps xmm0, xmmword ptr [rbx + rax + 0x150]
0x100442827: vmovaps xmmword ptr [rbx + r12 + 0x150], xmm0
0x100442831: vmovaps xmm0, xmmword ptr [rbx + rax + 0x160]
0x10044283a: vmovaps xmmword ptr [rbx + r12 + 0x160], xmm0
0x100442844: vmovaps xmm0, xmmword ptr [rbx + rax + 0x170]
0x10044284d: vmovaps xmmword ptr [rbx + r12 + 0x170], xmm0
0x100442857: vmovups ymm0, ymmword ptr [rbx + rax + 0x180]
0x100442860: vmovups ymm1, ymmword ptr [rbx + rax + 0x190]
0x100442869: vmovups ymmword ptr [rbx + r12 + 0x190], ymm1
0x100442873: vmovups ymmword ptr [rbx + r12 + 0x180], ymm0
0x10044287d: mov byte ptr [rbx + r12 + 0x10], 0x21
0x100442883: mov dword ptr [rbx + r12 + 0x14], esi
0x100442888: lea rax, [rip + 0x746692] ; 0x100b88f21 SandRainSh
0x10044288f: mov qword ptr [rbx + r12 + 0x18], rax
0x100442894: lea rdi, [rbp - 0x40]
0x100442898: vmovss xmm0, dword ptr [rip + 0x66c168] ; 0x100aaea08
0x1004428a0: vmovd xmm1, dword ptr [rip + 0x665d60] ; 0x100aa8608
0x1004428a8: vmovd xmm2, dword ptr [rip + 0x665d20] ; 0x100aa85d0
0x1004428b0: vmovd xmm3, dword ptr [rip + 0x662808] ; 0x100aa50c0
0x1004428b8: vzeroupper 
0x1004428bb: call 0x10077d540 ; 0x10077d540
0x1004428c0: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1004428c5: vmovaps xmmword ptr [rbx + r12 + 0x30], xmm0
0x1004428cc: lea rsi, [rip + 0x738c11] ; 0x100b7b4e4 RainMid
0x1004428d3: mov rdi, r14
0x1004428d6: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1004428db: test eax, eax
0x1004428dd: je 0x1004428e6
0x1004428df: lea rax, [rbx + r12 + 0x68]
0x1004428e4: jmp 0x100442925 ; 0x100442925
0x1004428e6: lea r13, [rbx + r12 + 0x30]
0x1004428eb: lea rdi, [rbp - 0x40]
0x1004428ef: vmovd xmm2, dword ptr [rip + 0x67f4c1] ; 0x100ac1db8
0x1004428f7: vmovd xmm3, dword ptr [rip + 0x6627c1] ; 0x100aa50c0
0x1004428ff: vxorps xmm0, xmm0, xmm0
0x100442903: vpxor xmm1, xmm1, xmm1
0x100442907: call 0x10077d540 ; 0x10077d540
0x10044290c: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100442911: vmovaps xmmword ptr [r13], xmm0
0x100442917: lea rax, [rbx + r12 + 0x68]
0x10044291c: mov dword ptr [rbx + r12 + 0x68], 0
0x100442925: mov dword ptr [rax], 0
0x10044292b: mov eax, dword ptr [r15]
0x10044292e: cmp rax, 0x1e
0x100442932: jae 0x1004433ab
0x100442938: lea ecx, [rax + 1]
0x10044293b: mov dword ptr [rbx + 0xc], ecx
0x10044293e: imul r13, rax, 0x1a0
0x100442945: mov byte ptr [rbx + r13 + 0x10], 0x30
0x10044294b: mov dword ptr [rbx + r13 + 0x14], eax
0x100442950: mov dword ptr [rbx + 0x3190], eax
0x100442956: lea rax, [rip + 0x7465cf] ; 0x100b88f2c GrassSh
0x10044295d: mov qword ptr [rbx + r13 + 0x18], rax
0x100442962: lea rax, [rip + 0x7465e8] ; 0x100b88f51 u_grassNorm2Tex
0x100442969: vmovq xmm0, rax
0x10044296e: lea rax, [rip + 0x7465bf] ; 0x100b88f34 u_grassNorm1Tex
0x100442975: vmovq xmm1, rax
0x10044297a: vpunpcklqdq xmm0, xmm1, xmm0
0x10044297e: vmovdqu xmmword ptr [rbx + r13 + 0x78], xmm0
0x100442985: lea rax, [rip + 0x73f317] ; 0x100b81ca3 GrassNorTex1
0x10044298c: vmovq xmm0, rax
0x100442991: lea rax, [rip + 0x7465ac] ; 0x100b88f44 GrassNorTex0
0x100442998: vmovq xmm1, rax
0x10044299d: vpunpcklqdq xmm0, xmm1, xmm0
0x1004429a1: vmovdqu xmmword ptr [rbx + r13 + 0x98], xmm0
0x1004429ab: lea rax, [rip + 0x7465af] ; 0x100b88f61 u_grassMaskTex
0x1004429b2: mov qword ptr [rbx + r13 + 0x88], rax
0x1004429ba: lea rax, [rip + 0x7465af] ; 0x100b88f70 GrassMask
0x1004429c1: mov qword ptr [rbx + r13 + 0xa8], rax
0x1004429c9: lea rdi, [rbp - 0x40]
0x1004429cd: vmovss xmm0, dword ptr [rip + 0x67f3e7] ; 0x100ac1dbc
0x1004429d5: vmovd xmm1, dword ptr [rip + 0x6667e7] ; 0x100aa91c4
0x1004429dd: vmovd xmm2, dword ptr [rip + 0x66470f] ; 0x100aa70f4
0x1004429e5: vmovd xmm3, dword ptr [rip + 0x6626d3] ; 0x100aa50c0
0x1004429ed: call 0x10077d540 ; 0x10077d540
0x1004429f2: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1004429f7: lea r12, [rbx + r13 + 0x30]
0x1004429fc: vmovaps xmmword ptr [rbx + r13 + 0x30], xmm0
0x100442a03: mov dword ptr [rbx + r13 + 0x6c], 0x3f800000
0x100442a0c: movabs rax, 0x3f4ccccd3d99999a
0x100442a16: mov qword ptr [rbx + r13 + 0x64], rax
0x100442a1b: lea rsi, [rip + 0x738a91] ; 0x100b7b4b3 Prairie_NestAndKeeper
0x100442a22: mov rdi, r14
0x100442a25: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x100442a2a: test eax, eax
0x100442a2c: jne 0x100442a62
0x100442a2e: lea rdi, [rbp - 0x40]
0x100442a32: vmovss xmm0, dword ptr [rip + 0x67f382] ; 0x100ac1dbc
0x100442a3a: vmovd xmm1, dword ptr [rip + 0x666782] ; 0x100aa91c4
0x100442a42: vmovd xmm2, dword ptr [rip + 0x665bea] ; 0x100aa8634
0x100442a4a: vmovd xmm3, dword ptr [rip + 0x66266e] ; 0x100aa50c0
0x100442a52: call 0x10077d540 ; 0x10077d540
0x100442a57: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100442a5c: vmovaps xmmword ptr [r12], xmm0
0x100442a62: lea rsi, [rip + 0x746404] ; 0x100b88e6d Prairie_ButterflyFields2
0x100442a69: mov rdi, r14
0x100442a6c: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x100442a71: test eax, eax
0x100442a73: jne 0x100442aa9
0x100442a75: lea rdi, [rbp - 0x40]
0x100442a79: vmovss xmm0, dword ptr [rip + 0x67f33f] ; 0x100ac1dc0
0x100442a81: vmovd xmm1, dword ptr [rip + 0x66673b] ; 0x100aa91c4
0x100442a89: vmovd xmm2, dword ptr [rip + 0x665ba3] ; 0x100aa8634
0x100442a91: vmovd xmm3, dword ptr [rip + 0x662627] ; 0x100aa50c0
0x100442a99: call 0x10077d540 ; 0x10077d540
0x100442a9e: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100442aa3: vmovaps xmmword ptr [r12], xmm0
0x100442aa9: lea rsi, [rip + 0x7301a0] ; 0x100b72c50 Dawn
0x100442ab0: mov rdi, r14
0x100442ab3: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x100442ab8: test eax, eax
0x100442aba: jne 0x100442af0
0x100442abc: lea rdi, [rbp - 0x40]
0x100442ac0: vmovss xmm0, dword ptr [rip + 0x66bf40] ; 0x100aaea08
0x100442ac8: vmovd xmm1, dword ptr [rip + 0x664d24] ; 0x100aa77f4
0x100442ad0: vmovd xmm2, dword ptr [rip + 0x66a4bc] ; 0x100aacf94
0x100442ad8: vmovd xmm3, dword ptr [rip + 0x6625e0] ; 0x100aa50c0
0x100442ae0: call 0x10077d540 ; 0x10077d540
0x100442ae5: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100442aea: vmovaps xmmword ptr [r12], xmm0
0x100442af0: lea rsi, [rip + 0x7389ed] ; 0x100b7b4e4 RainMid
0x100442af7: mov rdi, r14
0x100442afa: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x100442aff: test eax, eax
0x100442b01: jne 0x100442b37
0x100442b03: lea rdi, [rbp - 0x40]
0x100442b07: vmovss xmm0, dword ptr [rip + 0x678d99] ; 0x100abb8a8
0x100442b0f: vmovd xmm1, dword ptr [rip + 0x665ab9] ; 0x100aa85d0
0x100442b17: vmovd xmm2, dword ptr [rip + 0x6666cd] ; 0x100aa91ec
0x100442b1f: vmovd xmm3, dword ptr [rip + 0x662599] ; 0x100aa50c0
0x100442b27: call 0x10077d540 ; 0x10077d540
0x100442b2c: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100442b31: vmovaps xmmword ptr [r12], xmm0
0x100442b37: mov eax, dword ptr [rbx + 0x3190]
0x100442b3d: imul rax, rax, 0x1a0
0x100442b44: cmp byte ptr [rbx + rax + 0x10], 0x30
0x100442b49: jne 0x10044345d
0x100442b4f: mov ecx, dword ptr [r15]
0x100442b52: cmp rcx, 0x1e
0x100442b56: jae 0x1004433ab
0x100442b5c: lea rdi, [rbx + rax + 0x10]
0x100442b61: lea esi, [rcx + 1]
0x100442b64: mov dword ptr [rbx + 0xc], esi
0x100442b67: imul r12, rcx, 0x1a0
0x100442b6e: mov byte ptr [rbx + r12 + 0x10], 0x32
0x100442b74: mov dword ptr [rbx + r12 + 0x14], ecx
0x100442b79: mov dword ptr [rbx + 0x3198], ecx
0x100442b7f: mov dl, byte ptr [rdi + 0x10]
0x100442b82: mov byte ptr [rbx + r12 + 0x20], dl
0x100442b87: vmovaps xmm0, xmmword ptr [rdi]
0x100442b8b: vmovaps xmmword ptr [rbx + r12 + 0x10], xmm0
0x100442b92: vmovaps xmm0, xmmword ptr [rbx + rax + 0x30]
0x100442b98: lea r13, [rbx + r12 + 0x30]
0x100442b9d: vmovaps xmmword ptr [rbx + r12 + 0x30], xmm0
0x100442ba4: vmovaps xmm0, xmmword ptr [rbx + rax + 0x40]
0x100442baa: vmovaps xmmword ptr [rbx + r12 + 0x40], xmm0
0x100442bb1: vmovaps xmm0, xmmword ptr [rbx + rax + 0x50]
0x100442bb7: vmovaps xmmword ptr [rbx + r12 + 0x50], xmm0
0x100442bbe: vmovups ymm0, ymmword ptr [rbx + rax + 0x60]
0x100442bc4: vmovups ymm1, ymmword ptr [rbx + rax + 0x80]
0x100442bcd: vmovdqu ymm2, ymmword ptr [rbx + rax + 0xa0]
0x100442bd6: vmovdqu ymm3, ymmword ptr [rbx + rax + 0xb8]
0x100442bdf: vmovdqu ymmword ptr [rbx + r12 + 0xb8], ymm3
0x100442be9: vmovdqu ymmword ptr [rbx + r12 + 0xa0], ymm2
0x100442bf3: vmovups ymmword ptr [rbx + r12 + 0x80], ymm1
0x100442bfd: vmovups ymmword ptr [rbx + r12 + 0x60], ymm0
0x100442c04: vmovaps xmm0, xmmword ptr [rbx + rax + 0xe0]
0x100442c0d: vmovaps xmmword ptr [rbx + r12 + 0xe0], xmm0
0x100442c17: vmovaps xmm0, xmmword ptr [rbx + rax + 0xf0]
0x100442c20: vmovaps xmmword ptr [rbx + r12 + 0xf0], xmm0
0x100442c2a: vmovaps xmm0, xmmword ptr [rbx + rax + 0x100]
0x100442c33: vmovaps xmmword ptr [rbx + r12 + 0x100], xmm0
0x100442c3d: vmovaps xmm0, xmmword ptr [rbx + rax + 0x110]
0x100442c46: vmovaps xmmword ptr [rbx + r12 + 0x110], xmm0
0x100442c50: vmovups ymm0, ymmword ptr [rbx + rax + 0x120]
0x100442c59: vmovups ymmword ptr [rbx + r12 + 0x120], ymm0
0x100442c63: vmovaps xmm0, xmmword ptr [rbx + rax + 0x140]
0x100442c6c: vmovaps xmmword ptr [rbx + r12 + 0x140], xmm0
0x100442c76: vmovaps xmm0, xmmword ptr [rbx + rax + 0x150]
0x100442c7f: vmovaps xmmword ptr [rbx + r12 + 0x150], xmm0
0x100442c89: vmovaps xmm0, xmmword ptr [rbx + rax + 0x160]
0x100442c92: vmovaps xmmword ptr [rbx + r12 + 0x160], xmm0
0x100442c9c: vmovaps xmm0, xmmword ptr [rbx + rax + 0x170]
0x100442ca5: vmovaps xmmword ptr [rbx + r12 + 0x170], xmm0
0x100442caf: vmovups ymm0, ymmword ptr [rbx + rax + 0x180]
0x100442cb8: vmovdqu ymm1, ymmword ptr [rbx + rax + 0x190]
0x100442cc1: vmovdqu ymmword ptr [rbx + r12 + 0x190], ymm1
0x100442ccb: vmovups ymmword ptr [rbx + r12 + 0x180], ymm0
0x100442cd5: mov byte ptr [rbx + r12 + 0x10], 0x32
0x100442cdb: mov dword ptr [rbx + r12 + 0x14], ecx
0x100442ce0: lea rsi, [rip + 0x72ff69] ; 0x100b72c50 Dawn
0x100442ce7: mov rdi, r14
0x100442cea: vzeroupper 
0x100442ced: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x100442cf2: test eax, eax
0x100442cf4: jne 0x100442d2a
0x100442cf6: lea rdi, [rbp - 0x40]
0x100442cfa: vmovss xmm0, dword ptr [rip + 0x678ba6] ; 0x100abb8a8
0x100442d02: vmovd xmm1, dword ptr [rip + 0x6658c6] ; 0x100aa85d0
0x100442d0a: vmovd xmm2, dword ptr [rip + 0x6664da] ; 0x100aa91ec
0x100442d12: vmovd xmm3, dword ptr [rip + 0x6623a6] ; 0x100aa50c0
0x100442d1a: call 0x10077d540 ; 0x10077d540
0x100442d1f: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100442d24: vmovaps xmmword ptr [r13], xmm0
0x100442d2a: lea rsi, [rip + 0x74613c] ; 0x100b88e6d Prairie_ButterflyFields2
0x100442d31: mov rdi, r14
0x100442d34: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x100442d39: test eax, eax
0x100442d3b: jne 0x100442d71
0x100442d3d: lea rdi, [rbp - 0x40]
0x100442d41: vmovss xmm0, dword ptr [rip + 0x67f07b] ; 0x100ac1dc4
0x100442d49: vmovd xmm1, dword ptr [rip + 0x666473] ; 0x100aa91c4
0x100442d51: vmovd xmm2, dword ptr [rip + 0x666493] ; 0x100aa91ec
0x100442d59: vmovd xmm3, dword ptr [rip + 0x66235f] ; 0x100aa50c0
0x100442d61: call 0x10077d540 ; 0x10077d540
0x100442d66: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100442d6b: vmovaps xmmword ptr [r13], xmm0
0x100442d71: movabs rax, 0x3f19999a00000000
0x100442d7b: mov qword ptr [rbx + r12 + 0x64], rax
0x100442d80: mov eax, dword ptr [rbx + 0x3190]
0x100442d86: imul rax, rax, 0x1a0
0x100442d8d: cmp byte ptr [rbx + rax + 0x10], 0x30
0x100442d92: jne 0x10044345d
0x100442d98: mov ecx, dword ptr [r15]
0x100442d9b: cmp rcx, 0x1e
0x100442d9f: jae 0x1004433ab
0x100442da5: lea rdx, [rbx + rax + 0x10]
0x100442daa: lea esi, [rcx + 1]
0x100442dad: mov dword ptr [rbx + 0xc], esi
0x100442db0: imul r12, rcx, 0x1a0
0x100442db7: mov byte ptr [rbx + r12 + 0x10], 0x31
0x100442dbd: mov dword ptr [rbx + r12 + 0x14], ecx
0x100442dc2: mov dword ptr [rbx + 0x3194], ecx
0x100442dc8: mov esi, dword ptr [rbx + r12 + 0x14]
0x100442dcd: mov cl, byte ptr [rdx + 0x10]
0x100442dd0: mov byte ptr [rbx + r12 + 0x20], cl
0x100442dd5: vmovaps xmm0, xmmword ptr [rdx]
0x100442dd9: vmovaps xmmword ptr [rbx + r12 + 0x10], xmm0
0x100442de0: vmovaps xmm0, xmmword ptr [rbx + rax + 0x30]
0x100442de6: vmovaps xmmword ptr [rbx + r12 + 0x30], xmm0
0x100442ded: vmovaps xmm0, xmmword ptr [rbx + rax + 0x40]
0x100442df3: vmovaps xmmword ptr [rbx + r12 + 0x40], xmm0
0x100442dfa: vmovaps xmm0, xmmword ptr [rbx + rax + 0x50]
0x100442e00: vmovaps xmmword ptr [rbx + r12 + 0x50], xmm0
0x100442e07: vmovups ymm0, ymmword ptr [rbx + rax + 0x60]
0x100442e0d: vmovups ymm1, ymmword ptr [rbx + rax + 0x80]
0x100442e16: vmovups ymm2, ymmword ptr [rbx + rax + 0xa0]
0x100442e1f: vmovups ymm3, ymmword ptr [rbx + rax + 0xb8]
0x100442e28: vmovups ymmword ptr [rbx + r12 + 0xb8], ymm3
0x100442e32: vmovups ymmword ptr [rbx + r12 + 0xa0], ymm2
0x100442e3c: vmovups ymmword ptr [rbx + r12 + 0x80], ymm1
0x100442e46: vmovups ymmword ptr [rbx + r12 + 0x60], ymm0
0x100442e4d: vmovaps xmm0, xmmword ptr [rbx + rax + 0xe0]
0x100442e56: vmovaps xmmword ptr [rbx + r12 + 0xe0], xmm0
0x100442e60: vmovaps xmm0, xmmword ptr [rbx + rax + 0xf0]
0x100442e69: vmovaps xmmword ptr [rbx + r12 + 0xf0], xmm0
0x100442e73: vmovaps xmm0, xmmword ptr [rbx + rax + 0x100]
0x100442e7c: vmovaps xmmword ptr [rbx + r12 + 0x100], xmm0
0x100442e86: vmovaps xmm0, xmmword ptr [rbx + rax + 0x110]
0x100442e8f: vmovaps xmmword ptr [rbx + r12 + 0x110], xmm0
0x100442e99: vmovups ymm0, ymmword ptr [rbx + rax + 0x120]
0x100442ea2: vmovups ymmword ptr [rbx + r12 + 0x120], ymm0
0x100442eac: vmovaps xmm0, xmmword ptr [rbx + rax + 0x140]
0x100442eb5: vmovaps xmmword ptr [rbx + r12 + 0x140], xmm0
0x100442ebf: vmovaps xmm0, xmmword ptr [rbx + rax + 0x150]
0x100442ec8: vmovaps xmmword ptr [rbx + r12 + 0x150], xmm0
0x100442ed2: vmovaps xmm0, xmmword ptr [rbx + rax + 0x160]
0x100442edb: vmovaps xmmword ptr [rbx + r12 + 0x160], xmm0
0x100442ee5: vmovaps xmm0, xmmword ptr [rbx + rax + 0x170]
0x100442eee: vmovaps xmmword ptr [rbx + r12 + 0x170], xmm0
0x100442ef8: vmovups ymm0, ymmword ptr [rbx + rax + 0x180]
0x100442f01: vmovups ymm1, ymmword ptr [rbx + rax + 0x190]
0x100442f0a: vmovups ymmword ptr [rbx + r12 + 0x190], ymm1
0x100442f14: vmovups ymmword ptr [rbx + r12 + 0x180], ymm0
0x100442f1e: mov byte ptr [rbx + r12 + 0x10], 0x31
0x100442f24: mov dword ptr [rbx + r12 + 0x14], esi
0x100442f29: lea rdi, [rbp - 0x40]
0x100442f2d: vmovss xmm0, dword ptr [rip + 0x67ee93] ; 0x100ac1dc8
0x100442f35: vmovd xmm1, dword ptr [rip + 0x6656f7] ; 0x100aa8634
0x100442f3d: vmovd xmm2, dword ptr [rip + 0x6641af] ; 0x100aa70f4
0x100442f45: vmovd xmm3, dword ptr [rip + 0x662173] ; 0x100aa50c0
0x100442f4d: vzeroupper 
0x100442f50: call 0x10077d540 ; 0x10077d540
0x100442f55: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100442f5a: vmovaps xmmword ptr [rbx + r12 + 0x30], xmm0
0x100442f61: mov dword ptr [rbx + r12 + 0x64], 0x3e800000
0x100442f6a: mov eax, dword ptr [rbx + 0x3190]
0x100442f70: imul rax, rax, 0x1a0
0x100442f77: cmp byte ptr [rbx + rax + 0x10], 0x30
0x100442f7c: jne 0x10044345d
0x100442f82: mov ecx, dword ptr [r15]
0x100442f85: cmp rcx, 0x1e
0x100442f89: jae 0x1004433ab
0x100442f8f: lea rdi, [rbx + rax + 0x10]
0x100442f94: lea esi, [rcx + 1]
0x100442f97: mov dword ptr [rbx + 0xc], esi
0x100442f9a: imul r12, rcx, 0x1a0
0x100442fa1: mov byte ptr [rbx + r12 + 0x10], 0x33
0x100442fa7: mov dword ptr [rbx + r12 + 0x14], ecx
0x100442fac: mov dword ptr [rbx + 0x319c], ecx
0x100442fb2: mov dl, byte ptr [rdi + 0x10]
0x100442fb5: mov byte ptr [rbx + r12 + 0x20], dl
0x100442fba: vmovaps xmm0, xmmword ptr [rdi]
0x100442fbe: vmovaps xmmword ptr [rbx + r12 + 0x10], xmm0
0x100442fc5: vmovaps xmm0, xmmword ptr [rbx + rax + 0x30]
0x100442fcb: vmovaps xmmword ptr [rbx + r12 + 0x30], xmm0
0x100442fd2: vmovaps xmm0, xmmword ptr [rbx + rax + 0x40]
0x100442fd8: vmovaps xmmword ptr [rbx + r12 + 0x40], xmm0
0x100442fdf: vmovaps xmm0, xmmword ptr [rbx + rax + 0x50]
0x100442fe5: vmovaps xmmword ptr [rbx + r12 + 0x50], xmm0
0x100442fec: vmovups ymm0, ymmword ptr [rbx + rax + 0x60]
0x100442ff2: vmovups ymm1, ymmword ptr [rbx + rax + 0x80]
0x100442ffb: vmovups ymm2, ymmword ptr [rbx + rax + 0xa0]
0x100443004: vmovups ymm3, ymmword ptr [rbx + rax + 0xb8]
0x10044300d: vmovups ymmword ptr [rbx + r12 + 0xb8], ymm3
0x100443017: vmovups ymmword ptr [rbx + r12 + 0xa0], ymm2
0x100443021: vmovups ymmword ptr [rbx + r12 + 0x80], ymm1
0x10044302b: vmovups ymmword ptr [rbx + r12 + 0x60], ymm0
0x100443032: vmovaps xmm0, xmmword ptr [rbx + rax + 0xe0]
0x10044303b: vmovaps xmmword ptr [rbx + r12 + 0xe0], xmm0
0x100443045: vmovaps xmm0, xmmword ptr [rbx + rax + 0xf0]
0x10044304e: vmovaps xmmword ptr [rbx + r12 + 0xf0], xmm0
0x100443058: vmovaps xmm0, xmmword ptr [rbx + rax + 0x100]
0x100443061: vmovaps xmmword ptr [rbx + r12 + 0x100], xmm0
0x10044306b: vmovaps xmm0, xmmword ptr [rbx + rax + 0x110]
0x100443074: vmovaps xmmword ptr [rbx + r12 + 0x110], xmm0
0x10044307e: vmovups ymm0, ymmword ptr [rbx + rax + 0x120]
0x100443087: vmovups ymmword ptr [rbx + r12 + 0x120], ymm0
0x100443091: vmovaps xmm0, xmmword ptr [rbx + rax + 0x140]
0x10044309a: vmovaps xmmword ptr [rbx + r12 + 0x140], xmm0
0x1004430a4: vmovaps xmm0, xmmword ptr [rbx + rax + 0x150]
0x1004430ad: vmovaps xmmword ptr [rbx + r12 + 0x150], xmm0
0x1004430b7: vmovaps xmm0, xmmword ptr [rbx + rax + 0x160]
0x1004430c0: vmovaps xmmword ptr [rbx + r12 + 0x160], xmm0
0x1004430ca: vmovaps xmm0, xmmword ptr [rbx + rax + 0x170]
0x1004430d3: vmovaps xmmword ptr [rbx + r12 + 0x170], xmm0
0x1004430dd: vmovups ymm0, ymmword ptr [rbx + rax + 0x180]
0x1004430e6: vmovups ymm1, ymmword ptr [rbx + rax + 0x190]
0x1004430ef: vmovups ymmword ptr [rbx + r12 + 0x190], ymm1
0x1004430f9: vmovups ymmword ptr [rbx + r12 + 0x180], ymm0
0x100443103: mov byte ptr [rbx + r12 + 0x10], 0x33
0x100443109: mov dword ptr [rbx + r12 + 0x14], ecx
0x10044310e: lea rdi, [rbp - 0x40]
0x100443112: vmovss xmm0, dword ptr [rip + 0x67eca2] ; 0x100ac1dbc
0x10044311a: vmovd xmm1, dword ptr [rip + 0x6660a2] ; 0x100aa91c4
0x100443122: vmovd xmm2, dword ptr [rip + 0x663fca] ; 0x100aa70f4
0x10044312a: vmovd xmm3, dword ptr [rip + 0x661f8e] ; 0x100aa50c0
0x100443132: vzeroupper 
0x100443135: call 0x10077d540 ; 0x10077d540
0x10044313a: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10044313f: vmovaps xmmword ptr [rbx + r12 + 0x30], xmm0
0x100443146: movabs rax, 0x3f19999a3e800000
0x100443150: mov qword ptr [rbx + r12 + 0x64], rax
0x100443155: lea rsi, [rip + 0x738318] ; 0x100b7b474 SkyHub2
0x10044315c: mov rdi, r14
0x10044315f: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x100443164: test eax, eax
0x100443166: jne 0x10044319c
0x100443168: lea r14, [rbx + r12 + 0x30]
0x10044316d: lea rdi, [rbp - 0x40]
0x100443171: vmovss xmm0, dword ptr [rip + 0x67ec53] ; 0x100ac1dcc
0x100443179: vmovd xmm1, dword ptr [rip + 0x666043] ; 0x100aa91c4
0x100443181: vmovd xmm3, dword ptr [rip + 0x661f37] ; 0x100aa50c0
0x100443189: vmovdqa xmm2, xmm1
0x10044318d: call 0x10077d540 ; 0x10077d540
0x100443192: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100443197: vmovaps xmmword ptr [r14], xmm0
0x10044319c: mov eax, dword ptr [rbx + 0x3190]
0x1004431a2: imul rdx, rax, 0x1a0
0x1004431a9: cmp byte ptr [rbx + rdx + 0x10], 0x30
0x1004431ae: jne 0x10044345d
0x1004431b4: mov eax, dword ptr [r15]
0x1004431b7: cmp rax, 0x1e
0x1004431bb: jae 0x1004433ab
0x1004431c1: lea rdi, [rbx + rdx + 0x10]
0x1004431c6: lea r8d, [rax + 1]
0x1004431ca: mov dword ptr [rbx + 0xc], r8d
0x1004431ce: imul rsi, rax, 0x1a0
0x1004431d5: mov byte ptr [rbx + rsi + 0x10], 0x34
0x1004431da: mov dword ptr [rbx + rsi + 0x14], eax
0x1004431de: mov dword ptr [rbx + 0x31a0], eax
0x1004431e4: mov cl, byte ptr [rdi + 0x10]
0x1004431e7: mov byte ptr [rbx + rsi + 0x20], cl
0x1004431eb: vmovaps xmm0, xmmword ptr [rdi]
0x1004431ef: vmovaps xmmword ptr [rbx + rsi + 0x10], xmm0
0x1004431f5: vmovaps xmm0, xmmword ptr [rbx + rdx + 0x30]
0x1004431fb: vmovaps xmmword ptr [rbx + rsi + 0x30], xmm0
0x100443201: vmovaps xmm0, xmmword ptr [rbx + rdx + 0x40]
0x100443207: vmovaps xmmword ptr [rbx + rsi + 0x40], xmm0
0x10044320d: vmovaps xmm0, xmmword ptr [rbx + rdx + 0x50]
0x100443213: vmovaps xmmword ptr [rbx + rsi + 0x50], xmm0
0x100443219: vmovups ymm0, ymmword ptr [rbx + rdx + 0x60]
0x10044321f: vmovups ymm1, ymmword ptr [rbx + rdx + 0x80]
0x100443228: vmovdqu ymm2, ymmword ptr [rbx + rdx + 0xa0]
0x100443231: vmovdqu ymm3, ymmword ptr [rbx + rdx + 0xb8]
0x10044323a: vmovdqu ymmword ptr [rbx + rsi + 0xb8], ymm3
0x100443243: vmovdqu ymmword ptr [rbx + rsi + 0xa0], ymm2
0x10044324c: vmovups ymmword ptr [rbx + rsi + 0x80], ymm1
0x100443255: vmovups ymmword ptr [rbx + rsi + 0x60], ymm0
0x10044325b: vmovaps xmm0, xmmword ptr [rbx + rdx + 0xe0]
0x100443264: vmovaps xmmword ptr [rbx + rsi + 0xe0], xmm0
0x10044326d: vmovaps xmm0, xmmword ptr [rbx + rdx + 0xf0]
0x100443276: vmovaps xmmword ptr [rbx + rsi + 0xf0], xmm0
0x10044327f: vmovaps xmm0, xmmword ptr [rbx + rdx + 0x100]
0x100443288: vmovaps xmmword ptr [rbx + rsi + 0x100], xmm0
0x100443291: vmovaps xmm0, xmmword ptr [rbx + rdx + 0x110]
0x10044329a: vmovaps xmmword ptr [rbx + rsi + 0x110], xmm0
0x1004432a3: vmovups ymm0, ymmword ptr [rbx + rdx + 0x120]
0x1004432ac: vmovups ymmword ptr [rbx + rsi + 0x120], ymm0
0x1004432b5: vmovaps xmm0, xmmword ptr [rbx + rdx + 0x140]
0x1004432be: vmovaps xmmword ptr [rbx + rsi + 0x140], xmm0
0x1004432c7: vmovaps xmm0, xmmword ptr [rbx + rdx + 0x150]
0x1004432d0: vmovaps xmmword ptr [rbx + rsi + 0x150], xmm0
0x1004432d9: vmovaps xmm0, xmmword ptr [rbx + rdx + 0x160]
0x1004432e2: vmovaps xmmword ptr [rbx + rsi + 0x160], xmm0
0x1004432eb: vmovaps xmm0, xmmword ptr [rbx + rdx + 0x170]
0x1004432f4: vmovaps xmmword ptr [rbx + rsi + 0x170], xmm0
0x1004432fd: vmovups ymm0, ymmword ptr [rbx + rdx + 0x180]
0x100443306: vmovdqu ymm1, ymmword ptr [rbx + rdx + 0x190]
0x10044330f: vmovdqu ymmword ptr [rbx + rsi + 0x190], ymm1
0x100443318: vmovups ymmword ptr [rbx + rsi + 0x180], ymm0
0x100443321: mov byte ptr [rbx + rsi + 0x10], 0x34
0x100443326: mov dword ptr [rbx + rsi + 0x14], eax
0x10044332a: cmp r8d, 0x1e
0x10044332e: jae 0x1004433ab
0x100443330: lea eax, [rax + 2]
0x100443333: mov dword ptr [rbx + 0xc], eax
0x100443336: mov eax, r8d
0x100443339: imul r14, rax, 0x1a0
0x100443340: mov byte ptr [rbx + r14 + 0x10], 0x50
0x100443346: mov dword ptr [rbx + r14 + 0x14], r8d
0x10044334b: mov dword ptr [rbx + 0x3210], r8d
0x100443352: lea rax, [rip + 0x745c21] ; 0x100b88f7a CloudSh
0x100443359: mov qword ptr [rbx + r14 + 0x18], rax
0x10044335e: lea rdi, [rbp - 0x40]
0x100443362: vmovss xmm0, dword ptr [rip + 0x668562] ; 0x100aab8cc
0x10044336a: vmovss xmm2, dword ptr [rip + 0x6652be] ; 0x100aa8630
0x100443372: vmovss xmm3, dword ptr [rip + 0x661d46] ; 0x100aa50c0
0x10044337a: vpxor xmm1, xmm1, xmm1
0x10044337e: vzeroupper 
0x100443381: call 0x10077d540 ; 0x10077d540
0x100443386: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10044338b: vmovaps xmmword ptr [rbx + r14 + 0x30], xmm0
0x100443392: cmp dword ptr [rbx + 0xc], 0x1e
0x100443396: jne 0x1004434b9
0x10044339c: add rsp, 0x58
0x1004433a0: pop rbx
0x1004433a1: pop r12
0x1004433a3: pop r13
0x1004433a5: pop r14
0x1004433a7: pop r15
0x1004433a9: pop rbp
0x1004433aa: ret 
0x1004433ab: lea rdi, [rip + 0x745a00] ; 0x100b88db2 m_count < kMaterial_Count
0x1004433b2: lea rsi, [rip + 0x7459b0] ; 0x100b88d69 MaterialDefs.cpp
0x1004433b9: mov edx, 0x68
0x1004433be: mov ecx, 3
0x1004433c3: vzeroupper 
0x1004433c6: call 0x1007e5f70 ; 0x1007e5f70
0x1004433cb: ud2 
0x1004433cd: lea rdi, [rip + 0x745970] ; 0x100b88d44 m_defs[ index ].material == material
0x1004433d4: lea rsi, [rip + 0x74598e] ; 0x100b88d69 MaterialDefs.cpp
0x1004433db: lea r8, [rip + 0x745998] ; 0x100b88d7a MaterialDef for "%u" not found.
0x1004433e2: mov edx, 0x56
0x1004433e7: mov ecx, 4
0x1004433ec: mov r9d, 0x14
0x1004433f2: xor eax, eax
0x1004433f4: vzeroupper 
0x1004433f7: call 0x1007e6030 ; 0x1007e6030
0x1004433fc: ud2 
0x1004433fe: lea rdi, [rip + 0x74593f] ; 0x100b88d44 m_defs[ index ].material == material
0x100443405: lea rsi, [rip + 0x74595d] ; 0x100b88d69 MaterialDefs.cpp
0x10044340c: lea r8, [rip + 0x745967] ; 0x100b88d7a MaterialDef for "%u" not found.
0x100443413: mov edx, 0x56
0x100443418: mov ecx, 4
0x10044341d: mov r9d, 0x10
0x100443423: xor eax, eax
0x100443425: vzeroupper 
0x100443428: call 0x1007e6030 ; 0x1007e6030
0x10044342d: ud2 
0x10044342f: lea rdi, [rip + 0x74590e] ; 0x100b88d44 m_defs[ index ].material == material
0x100443436: lea rsi, [rip + 0x74592c] ; 0x100b88d69 MaterialDefs.cpp
0x10044343d: lea r8, [rip + 0x745936] ; 0x100b88d7a MaterialDef for "%u" not found.
0x100443444: mov edx, 0x56
0x100443449: mov ecx, 4
0x10044344e: mov r9d, 0x20
0x100443454: xor eax, eax
0x100443456: call 0x1007e6030 ; 0x1007e6030
0x10044345b: ud2 
0x10044345d: lea rdi, [rip + 0x7458e0] ; 0x100b88d44 m_defs[ index ].material == material
0x100443464: lea rsi, [rip + 0x7458fe] ; 0x100b88d69 MaterialDefs.cpp
0x10044346b: lea r8, [rip + 0x745908] ; 0x100b88d7a MaterialDef for "%u" not found.
0x100443472: mov edx, 0x56
0x100443477: mov ecx, 4
0x10044347c: mov r9d, 0x30
0x100443482: xor eax, eax
0x100443484: call 0x1007e6030 ; 0x1007e6030
0x100443489: ud2 
0x10044348b: lea rdi, [rip + 0x7458b2] ; 0x100b88d44 m_defs[ index ].material == material
0x100443492: lea rsi, [rip + 0x7458d0] ; 0x100b88d69 MaterialDefs.cpp
0x100443499: lea r8, [rip + 0x7458da] ; 0x100b88d7a MaterialDef for "%u" not found.
0x1004434a0: mov edx, 0x56
0x1004434a5: mov ecx, 4
0x1004434aa: mov r9d, 0x11
0x1004434b0: xor eax, eax
0x1004434b2: call 0x1007e6030 ; 0x1007e6030
0x1004434b7: ud2 
0x1004434b9: lea rdi, [rip + 0x745ac2] ; 0x100b88f82 m_count == kMaterial_Count
0x1004434c0: lea rsi, [rip + 0x7458a2] ; 0x100b88d69 MaterialDefs.cpp
0x1004434c7: lea r8, [rip + 0x745acf] ; 0x100b88f9d kMaterialCount mismatch. Don't forget to update kMaterial_Count after adding/removing a Material
0x1004434ce: mov edx, 0x236
0x1004434d3: mov ecx, 4
0x1004434d8: xor eax, eax
0x1004434da: call 0x1007e6030 ; 0x1007e6030
0x1004434df: ud2 
0x1004434e1: nop word ptr cs:[rax + rax]
