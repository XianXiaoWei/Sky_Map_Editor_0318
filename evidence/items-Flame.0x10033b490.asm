0x10033b490: push rbp
0x10033b491: mov rbp, rsp
0x10033b494: push rbx
0x10033b495: and rsp, 0xffffffffffffffe0
0x10033b499: sub rsp, 0x260
0x10033b4a0: mov rbx, rdi
0x10033b4a3: mov rax, qword ptr [rip + 0x8d242e]
0x10033b4aa: mov rax, qword ptr [rax]
0x10033b4ad: mov qword ptr [rsp + 0x240], rax
0x10033b4b5: cmp qword ptr [rbx + 0x100], 0
0x10033b4bd: je 0x10033b5bb
0x10033b4c3: mov rdi, qword ptr [rbx + 0x148]
0x10033b4ca: vxorps ymm0, ymm0, ymm0
0x10033b4ce: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x10033b4d7: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x10033b4e0: vmovaps ymmword ptr [rsp + 0x1e0], ymm0
0x10033b4e9: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x10033b4f2: vmovaps xmm1, xmmword ptr [rbx + 0xc0]
0x10033b4fa: mov byte ptr [rsp + 0x1cd], 1
0x10033b502: mov dword ptr [rsp + 0x1c0], 0x3f800000
0x10033b50d: vmovaps xmmword ptr [rsp + 0x1d0], xmm1
0x10033b516: movabs rax, 0x4170000041200000
0x10033b520: mov qword ptr [rsp + 0x208], rax
0x10033b528: mov dword ptr [rsp + 0x21c], 0
0x10033b533: mov dword ptr [rsp + 0x230], 0x8c31
0x10033b53e: vmovups ymmword ptr [rsp + 0x190], ymm0
0x10033b547: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x10033b550: vmovaps ymmword ptr [rsp + 0x160], ymm0
0x10033b559: vmovaps ymmword ptr [rsp + 0x140], ymm0
0x10033b562: vmovaps ymmword ptr [rsp + 0x120], ymm0
0x10033b56b: vmovaps ymmword ptr [rsp + 0x100], ymm0
0x10033b574: vmovaps ymmword ptr [rsp + 0xe0], ymm0
0x10033b57d: vmovaps ymmword ptr [rsp + 0xc0], ymm0
0x10033b586: vmovaps ymmword ptr [rsp + 0xa0], ymm0
0x10033b58f: vmovaps ymmword ptr [rsp + 0x80], ymm0
0x10033b598: vmovaps ymmword ptr [rsp + 0x60], ymm0
0x10033b59e: vmovaps ymmword ptr [rsp + 0x40], ymm0
0x10033b5a4: vmovaps ymmword ptr [rsp + 0x20], ymm0
0x10033b5aa: vmovaps ymmword ptr [rsp], ymm0
0x10033b5af: lea rsi, [rip + 0x846100]
0x10033b5b6: jmp 0x10033be3f
0x10033b5bb: mov eax, dword ptr [rbx + 0xbc]
0x10033b5c1: lea ecx, [rax - 2]
0x10033b5c4: cmp ecx, 5
0x10033b5c7: ja 0x10033b6ff
0x10033b5cd: lea rax, [rip + 0x990]
0x10033b5d4: movsxd rcx, dword ptr [rax + rcx*4]
0x10033b5d8: add rcx, rax
0x10033b5db: jmp rcx
0x10033b5dd: mov rdi, qword ptr [rbx + 0x148]
0x10033b5e4: vxorps ymm1, ymm1, ymm1
0x10033b5e8: vmovaps ymmword ptr [rsp + 0x220], ymm1
0x10033b5f1: vmovaps ymmword ptr [rsp + 0x200], ymm1
0x10033b5fa: vmovaps ymmword ptr [rsp + 0x1e0], ymm1
0x10033b603: vmovaps ymmword ptr [rsp + 0x1c0], ymm1
0x10033b60c: vmovaps xmm0, xmmword ptr [rbx + 0xc0]
0x10033b614: mov eax, dword ptr [rbx + 0xa8]
0x10033b61a: mov byte ptr [rsp + 0x1cd], 1
0x10033b622: mov dword ptr [rsp + 0x1c0], 0x3f800000
0x10033b62d: vmovaps xmmword ptr [rsp + 0x1d0], xmm0
0x10033b636: mov dword ptr [rsp + 0x208], 0x40400000
0x10033b641: mov dword ptr [rsp + 0x20c], eax
0x10033b648: mov dword ptr [rsp + 0x21c], 0
0x10033b653: mov dword ptr [rsp + 0x230], 0x8c31
0x10033b65e: vmovups ymmword ptr [rsp + 0x18c], ymm1
0x10033b667: vmovaps ymmword ptr [rsp + 0x180], ymm1
0x10033b670: vmovaps ymmword ptr [rsp + 0x160], ymm1
0x10033b679: vmovaps ymmword ptr [rsp + 0x140], ymm1
0x10033b682: vmovaps ymmword ptr [rsp + 0x120], ymm1
0x10033b68b: vmovaps ymmword ptr [rsp + 0x100], ymm1
0x10033b694: vmovaps ymmword ptr [rsp + 0xe0], ymm1
0x10033b69d: vmovaps ymmword ptr [rsp + 0xc0], ymm1
0x10033b6a6: vmovaps ymmword ptr [rsp + 0xa0], ymm1
0x10033b6af: vmovaps ymmword ptr [rsp + 0x80], ymm1
0x10033b6b8: vmovaps ymmword ptr [rsp + 0x60], ymm1
0x10033b6be: vmovaps ymmword ptr [rsp + 0x40], ymm1
0x10033b6c4: vmovaps ymmword ptr [rsp + 0x20], ymm1
0x10033b6ca: vmovaps ymmword ptr [rsp], ymm1
0x10033b6cf: mov eax, dword ptr [rbx + 0xac]
0x10033b6d5: mov byte ptr [rsp], 0x57
0x10033b6d9: mov dword ptr [rsp + 0x20], eax
0x10033b6dd: mov dword ptr [rsp + 0x1a0], 1
0x10033b6e8: mov dword ptr [rsp + 0x1ac], 1
0x10033b6f3: lea rsi, [rip + 0x845fec]
0x10033b6fa: jmp 0x10033ba90
0x10033b6ff: mov rdi, qword ptr [rbx + 0x148]
0x10033b706: vxorps ymm0, ymm0, ymm0
0x10033b70a: cmp eax, 1
0x10033b70d: jne 0x10033be71
0x10033b713: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x10033b71c: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x10033b725: vmovaps ymmword ptr [rsp + 0x1e0], ymm0
0x10033b72e: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x10033b737: vmovaps xmm0, xmmword ptr [rbx + 0xc0]
0x10033b73f: vmovss xmm1, dword ptr [rbx + 0xa8]
0x10033b747: vaddss xmm1, xmm1, xmm1
0x10033b74b: mov byte ptr [rsp + 0x1cd], 1
0x10033b753: mov dword ptr [rsp + 0x1c0], 0x3f800000
0x10033b75e: vmovaps xmmword ptr [rsp + 0x1d0], xmm0
0x10033b767: mov dword ptr [rsp + 0x208], 0x40400000
0x10033b772: vmovss dword ptr [rsp + 0x20c], xmm1
0x10033b77b: mov dword ptr [rsp + 0x21c], 0
0x10033b786: mov dword ptr [rsp + 0x230], 0x8c31
0x10033b791: vxorps ymm0, ymm0, ymm0
0x10033b795: vmovups ymmword ptr [rsp + 0x18c], ymm0
0x10033b79e: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x10033b7a7: vmovaps ymmword ptr [rsp + 0x160], ymm0
0x10033b7b0: vmovaps ymmword ptr [rsp + 0x140], ymm0
0x10033b7b9: vmovaps ymmword ptr [rsp + 0x120], ymm0
0x10033b7c2: vmovaps ymmword ptr [rsp + 0x100], ymm0
0x10033b7cb: vmovaps ymmword ptr [rsp + 0xe0], ymm0
0x10033b7d4: vmovaps ymmword ptr [rsp + 0xc0], ymm0
0x10033b7dd: vmovaps ymmword ptr [rsp + 0xa0], ymm0
0x10033b7e6: vmovaps ymmword ptr [rsp + 0x80], ymm0
0x10033b7ef: vmovaps ymmword ptr [rsp + 0x60], ymm0
0x10033b7f5: vmovaps ymmword ptr [rsp + 0x40], ymm0
0x10033b7fb: vmovaps ymmword ptr [rsp + 0x20], ymm0
0x10033b801: vmovaps ymmword ptr [rsp], ymm0
0x10033b806: mov eax, dword ptr [rbx + 0xac]
0x10033b80c: mov byte ptr [rsp], 0x32
0x10033b810: mov dword ptr [rsp + 0x20], eax
0x10033b814: mov dword ptr [rsp + 0x1a0], 1
0x10033b81f: mov dword ptr [rsp + 0x1ac], 1
0x10033b82a: lea rsi, [rip + 0x845ebe]
0x10033b831: lea rdx, [rsp + 0x1c0]
0x10033b839: mov rcx, rsp
0x10033b83c: vzeroupper 
0x10033b83f: call 0x1006018a0
0x10033b844: mov rdi, qword ptr [rbx + 0x148]
0x10033b84b: vxorps ymm1, ymm1, ymm1
0x10033b84f: vmovaps ymmword ptr [rsp + 0x220], ymm1
0x10033b858: vmovaps ymmword ptr [rsp + 0x200], ymm1
0x10033b861: vmovaps ymmword ptr [rsp + 0x1e0], ymm1
0x10033b86a: vmovaps ymmword ptr [rsp + 0x1c0], ymm1
0x10033b873: vmovaps xmm0, xmmword ptr [rbx + 0xc0]
0x10033b87b: mov eax, dword ptr [rbx + 0xa8]
0x10033b881: mov byte ptr [rsp + 0x1cd], 1
0x10033b889: mov dword ptr [rsp + 0x1c0], 0x3f000000
0x10033b894: jmp 0x10033bd72
0x10033b899: mov rdi, qword ptr [rbx + 0x148]
0x10033b8a0: vxorps ymm1, ymm1, ymm1
0x10033b8a4: vmovaps ymmword ptr [rsp + 0x220], ymm1
0x10033b8ad: vmovaps ymmword ptr [rsp + 0x200], ymm1
0x10033b8b6: vmovaps ymmword ptr [rsp + 0x1e0], ymm1
0x10033b8bf: vmovaps ymmword ptr [rsp + 0x1c0], ymm1
0x10033b8c8: vmovaps xmm0, xmmword ptr [rbx + 0xc0]
0x10033b8d0: mov eax, dword ptr [rbx + 0xa8]
0x10033b8d6: mov byte ptr [rsp + 0x1cd], 1
0x10033b8de: mov dword ptr [rsp + 0x1c0], 0x3f800000
0x10033b8e9: vmovaps xmmword ptr [rsp + 0x1d0], xmm0
0x10033b8f2: mov dword ptr [rsp + 0x208], 0x40400000
0x10033b8fd: mov dword ptr [rsp + 0x20c], eax
0x10033b904: mov dword ptr [rsp + 0x21c], 0
0x10033b90f: mov dword ptr [rsp + 0x230], 0x8c31
0x10033b91a: vmovups ymmword ptr [rsp + 0x190], ymm1
0x10033b923: vmovaps ymmword ptr [rsp + 0x180], ymm1
0x10033b92c: vmovaps ymmword ptr [rsp + 0x160], ymm1
0x10033b935: vmovaps ymmword ptr [rsp + 0x140], ymm1
0x10033b93e: vmovaps ymmword ptr [rsp + 0x120], ymm1
0x10033b947: vmovaps ymmword ptr [rsp + 0x100], ymm1
0x10033b950: vmovaps ymmword ptr [rsp + 0xe0], ymm1
0x10033b959: vmovaps ymmword ptr [rsp + 0xc0], ymm1
0x10033b962: vmovaps ymmword ptr [rsp + 0xa0], ymm1
0x10033b96b: vmovaps ymmword ptr [rsp + 0x80], ymm1
0x10033b974: vmovaps ymmword ptr [rsp + 0x60], ymm1
0x10033b97a: vmovaps ymmword ptr [rsp + 0x40], ymm1
0x10033b980: vmovaps ymmword ptr [rsp + 0x20], ymm1
0x10033b986: vmovaps ymmword ptr [rsp], ymm1
0x10033b98b: lea rsi, [rip + 0x825e9e]
0x10033b992: jmp 0x10033ba90
0x10033b997: mov rdi, qword ptr [rbx + 0x148]
0x10033b99e: vxorps ymm1, ymm1, ymm1
0x10033b9a2: vmovaps ymmword ptr [rsp + 0x220], ymm1
0x10033b9ab: vmovaps ymmword ptr [rsp + 0x200], ymm1
0x10033b9b4: vmovaps ymmword ptr [rsp + 0x1e0], ymm1
0x10033b9bd: vmovaps ymmword ptr [rsp + 0x1c0], ymm1
0x10033b9c6: vmovaps xmm0, xmmword ptr [rbx + 0xc0]
0x10033b9ce: mov eax, dword ptr [rbx + 0xa8]
0x10033b9d4: mov byte ptr [rsp + 0x1cd], 1
0x10033b9dc: mov dword ptr [rsp + 0x1c0], 0x3f800000
0x10033b9e7: vmovaps xmmword ptr [rsp + 0x1d0], xmm0
0x10033b9f0: mov dword ptr [rsp + 0x208], 0x40400000
0x10033b9fb: mov dword ptr [rsp + 0x20c], eax
0x10033ba02: mov dword ptr [rsp + 0x21c], 0
0x10033ba0d: mov dword ptr [rsp + 0x230], 0x8c31
0x10033ba18: vmovups ymmword ptr [rsp + 0x190], ymm1
0x10033ba21: vmovaps ymmword ptr [rsp + 0x180], ymm1
0x10033ba2a: vmovaps ymmword ptr [rsp + 0x160], ymm1
0x10033ba33: vmovaps ymmword ptr [rsp + 0x140], ymm1
0x10033ba3c: vmovaps ymmword ptr [rsp + 0x120], ymm1
0x10033ba45: vmovaps ymmword ptr [rsp + 0x100], ymm1
0x10033ba4e: vmovaps ymmword ptr [rsp + 0xe0], ymm1
0x10033ba57: vmovaps ymmword ptr [rsp + 0xc0], ymm1
0x10033ba60: vmovaps ymmword ptr [rsp + 0xa0], ymm1
0x10033ba69: vmovaps ymmword ptr [rsp + 0x80], ymm1
0x10033ba72: vmovaps ymmword ptr [rsp + 0x60], ymm1
0x10033ba78: vmovaps ymmword ptr [rsp + 0x40], ymm1
0x10033ba7e: vmovaps ymmword ptr [rsp + 0x20], ymm1
0x10033ba84: vmovaps ymmword ptr [rsp], ymm1
0x10033ba89: lea rsi, [rip + 0x845c48]
0x10033ba90: lea rdx, [rsp + 0x1c0]
0x10033ba98: mov rcx, rsp
0x10033ba9b: vzeroupper 
0x10033ba9e: call 0x1006018a0
0x10033baa3: mov rdi, qword ptr [rbx + 0x148]
0x10033baaa: vxorps ymm1, ymm1, ymm1
0x10033baae: vmovaps ymmword ptr [rsp + 0x220], ymm1
0x10033bab7: vmovaps ymmword ptr [rsp + 0x200], ymm1
0x10033bac0: vmovaps ymmword ptr [rsp + 0x1e0], ymm1
0x10033bac9: vmovaps ymmword ptr [rsp + 0x1c0], ymm1
0x10033bad2: vmovaps xmm0, xmmword ptr [rbx + 0xc0]
0x10033bada: mov eax, dword ptr [rbx + 0xa8]
0x10033bae0: mov byte ptr [rsp + 0x1cd], 1
0x10033bae8: mov dword ptr [rsp + 0x1c0], 0x3e99999a
0x10033baf3: jmp 0x10033bd72
0x10033baf8: mov rdi, qword ptr [rbx + 0x148]
0x10033baff: vxorps ymm0, ymm0, ymm0
0x10033bb03: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x10033bb0c: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x10033bb15: vmovaps ymmword ptr [rsp + 0x1e0], ymm0
0x10033bb1e: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x10033bb27: vmovaps xmm0, xmmword ptr [rbx + 0xc0]
0x10033bb2f: vmovss xmm1, dword ptr [rbx + 0xa8]
0x10033bb37: vmulss xmm1, xmm1, dword ptr [rip + 0x76c181]
0x10033bb3f: mov byte ptr [rsp + 0x1cd], 1
0x10033bb47: mov dword ptr [rsp + 0x1c0], 0x3f800000
0x10033bb52: vmovaps xmmword ptr [rsp + 0x1d0], xmm0
0x10033bb5b: mov dword ptr [rsp + 0x208], 0x40400000
0x10033bb66: vmovss dword ptr [rsp + 0x20c], xmm1
0x10033bb6f: mov dword ptr [rsp + 0x21c], 0
0x10033bb7a: mov dword ptr [rsp + 0x230], 0x8c31
0x10033bb85: vxorps ymm0, ymm0, ymm0
0x10033bb89: vmovups ymmword ptr [rsp + 0x190], ymm0
0x10033bb92: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x10033bb9b: vmovaps ymmword ptr [rsp + 0x160], ymm0
0x10033bba4: vmovaps ymmword ptr [rsp + 0x140], ymm0
0x10033bbad: vmovaps ymmword ptr [rsp + 0x120], ymm0
0x10033bbb6: vmovaps ymmword ptr [rsp + 0x100], ymm0
0x10033bbbf: vmovaps ymmword ptr [rsp + 0xe0], ymm0
0x10033bbc8: vmovaps ymmword ptr [rsp + 0xc0], ymm0
0x10033bbd1: vmovaps ymmword ptr [rsp + 0xa0], ymm0
0x10033bbda: vmovaps ymmword ptr [rsp + 0x80], ymm0
0x10033bbe3: vmovaps ymmword ptr [rsp + 0x60], ymm0
0x10033bbe9: vmovaps ymmword ptr [rsp + 0x40], ymm0
0x10033bbef: vmovaps ymmword ptr [rsp + 0x20], ymm0
0x10033bbf5: vmovaps ymmword ptr [rsp], ymm0
0x10033bbfa: lea rsi, [rip + 0x845acd]
0x10033bc01: jmp 0x10033bd0f
0x10033bc06: mov rdi, qword ptr [rbx + 0x148]
0x10033bc0d: vxorps ymm0, ymm0, ymm0
0x10033bc11: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x10033bc1a: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x10033bc23: vmovaps ymmword ptr [rsp + 0x1e0], ymm0
0x10033bc2c: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x10033bc35: vmovaps xmm0, xmmword ptr [rbx + 0xc0]
0x10033bc3d: vmovss xmm1, dword ptr [rbx + 0xa8]
0x10033bc45: vmulss xmm1, xmm1, dword ptr [rip + 0x76c073]
0x10033bc4d: mov byte ptr [rsp + 0x1cd], 1
0x10033bc55: mov dword ptr [rsp + 0x1c0], 0x3f800000
0x10033bc60: vmovaps xmmword ptr [rsp + 0x1d0], xmm0
0x10033bc69: mov dword ptr [rsp + 0x208], 0x40400000
0x10033bc74: vmovss dword ptr [rsp + 0x20c], xmm1
0x10033bc7d: mov dword ptr [rsp + 0x21c], 0
0x10033bc88: mov dword ptr [rsp + 0x230], 0x8c31
0x10033bc93: vxorps ymm0, ymm0, ymm0
0x10033bc97: vmovups ymmword ptr [rsp + 0x190], ymm0
0x10033bca0: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x10033bca9: vmovaps ymmword ptr [rsp + 0x160], ymm0
0x10033bcb2: vmovaps ymmword ptr [rsp + 0x140], ymm0
0x10033bcbb: vmovaps ymmword ptr [rsp + 0x120], ymm0
0x10033bcc4: vmovaps ymmword ptr [rsp + 0x100], ymm0
0x10033bccd: vmovaps ymmword ptr [rsp + 0xe0], ymm0
0x10033bcd6: vmovaps ymmword ptr [rsp + 0xc0], ymm0
0x10033bcdf: vmovaps ymmword ptr [rsp + 0xa0], ymm0
0x10033bce8: vmovaps ymmword ptr [rsp + 0x80], ymm0
0x10033bcf1: vmovaps ymmword ptr [rsp + 0x60], ymm0
0x10033bcf7: vmovaps ymmword ptr [rsp + 0x40], ymm0
0x10033bcfd: vmovaps ymmword ptr [rsp + 0x20], ymm0
0x10033bd03: vmovaps ymmword ptr [rsp], ymm0
0x10033bd08: lea rsi, [rip + 0x8459b3]
0x10033bd0f: lea rdx, [rsp + 0x1c0]
0x10033bd17: mov rcx, rsp
0x10033bd1a: vzeroupper 
0x10033bd1d: call 0x1006018a0
0x10033bd22: mov rdi, qword ptr [rbx + 0x148]
0x10033bd29: vxorps ymm1, ymm1, ymm1
0x10033bd2d: vmovaps ymmword ptr [rsp + 0x220], ymm1
0x10033bd36: vmovaps ymmword ptr [rsp + 0x200], ymm1
0x10033bd3f: vmovaps ymmword ptr [rsp + 0x1e0], ymm1
0x10033bd48: vmovaps ymmword ptr [rsp + 0x1c0], ymm1
0x10033bd51: vmovaps xmm0, xmmword ptr [rbx + 0xc0]
0x10033bd59: mov eax, dword ptr [rbx + 0xa8]
0x10033bd5f: mov byte ptr [rsp + 0x1cd], 1
0x10033bd67: mov dword ptr [rsp + 0x1c0], 0x3f800000
0x10033bd72: vmovaps xmmword ptr [rsp + 0x1d0], xmm0
0x10033bd7b: mov dword ptr [rsp + 0x208], 0x40400000
0x10033bd86: mov dword ptr [rsp + 0x20c], eax
0x10033bd8d: mov dword ptr [rsp + 0x21c], 0
0x10033bd98: mov dword ptr [rsp + 0x230], 0x8c31
0x10033bda3: vmovups ymmword ptr [rsp + 0x18c], ymm1
0x10033bdac: vmovaps ymmword ptr [rsp + 0x180], ymm1
0x10033bdb5: vmovaps ymmword ptr [rsp + 0x160], ymm1
0x10033bdbe: vmovaps ymmword ptr [rsp + 0x140], ymm1
0x10033bdc7: vmovaps ymmword ptr [rsp + 0x120], ymm1
0x10033bdd0: vmovaps ymmword ptr [rsp + 0x100], ymm1
0x10033bdd9: vmovaps ymmword ptr [rsp + 0xe0], ymm1
0x10033bde2: vmovaps ymmword ptr [rsp + 0xc0], ymm1
0x10033bdeb: vmovaps ymmword ptr [rsp + 0xa0], ymm1
0x10033bdf4: vmovaps ymmword ptr [rsp + 0x80], ymm1
0x10033bdfd: vmovaps ymmword ptr [rsp + 0x60], ymm1
0x10033be03: vmovaps ymmword ptr [rsp + 0x40], ymm1
0x10033be09: vmovaps ymmword ptr [rsp + 0x20], ymm1
0x10033be0f: vmovaps ymmword ptr [rsp], ymm1
0x10033be14: mov eax, dword ptr [rbx + 0xac]
0x10033be1a: mov byte ptr [rsp], 0x32
0x10033be1e: mov dword ptr [rsp + 0x20], eax
0x10033be22: mov dword ptr [rsp + 0x1a0], 1
0x10033be2d: mov dword ptr [rsp + 0x1ac], 1
0x10033be38: lea rsi, [rip + 0x828afe]
0x10033be3f: lea rdx, [rsp + 0x1c0]
0x10033be47: mov rcx, rsp
0x10033be4a: vzeroupper 
0x10033be4d: call 0x1006018a0
0x10033be52: mov rax, qword ptr [rip + 0x8d1a7f]
0x10033be59: mov rax, qword ptr [rax]
0x10033be5c: cmp rax, qword ptr [rsp + 0x240]
0x10033be64: jne 0x10033bf5d
0x10033be6a: lea rsp, [rbp - 8]
0x10033be6e: pop rbx
0x10033be6f: pop rbp
0x10033be70: ret 
0x10033be71: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x10033be7a: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x10033be83: vmovaps ymmword ptr [rsp + 0x1e0], ymm0
0x10033be8c: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x10033be95: vmovaps xmm1, xmmword ptr [rbx + 0xc0]
0x10033be9d: mov eax, dword ptr [rbx + 0xa8]
0x10033bea3: mov byte ptr [rsp + 0x1cd], 1
0x10033beab: mov dword ptr [rsp + 0x1c0], 0x3f800000
0x10033beb6: vmovaps xmmword ptr [rsp + 0x1d0], xmm1
0x10033bebf: mov dword ptr [rsp + 0x208], 0x40400000
0x10033beca: mov dword ptr [rsp + 0x20c], eax
0x10033bed1: mov dword ptr [rsp + 0x21c], 0x3f800000
0x10033bedc: mov dword ptr [rsp + 0x230], 0x8c31
0x10033bee7: vmovups ymmword ptr [rsp + 0x18c], ymm0
0x10033bef0: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x10033bef9: vmovaps ymmword ptr [rsp + 0x160], ymm0
0x10033bf02: vmovaps ymmword ptr [rsp + 0x140], ymm0
0x10033bf0b: vmovaps ymmword ptr [rsp + 0x120], ymm0
0x10033bf14: vmovaps ymmword ptr [rsp + 0x100], ymm0
0x10033bf1d: vmovaps ymmword ptr [rsp + 0xe0], ymm0
0x10033bf26: vmovaps ymmword ptr [rsp + 0xc0], ymm0
0x10033bf2f: vmovaps ymmword ptr [rsp + 0xa0], ymm0
0x10033bf38: vmovaps ymmword ptr [rsp + 0x80], ymm0
0x10033bf41: vmovaps ymmword ptr [rsp + 0x60], ymm0
0x10033bf47: vmovaps ymmword ptr [rsp + 0x40], ymm0
0x10033bf4d: vmovaps ymmword ptr [rsp + 0x20], ymm0
0x10033bf53: vmovaps ymmword ptr [rsp], ymm0
0x10033bf58: jmp 0x10033be14
0x10033bf5d: call 0x100aa251c
0x10033bf62: nop 
0x10033bf64: jns 0x10033bf5c