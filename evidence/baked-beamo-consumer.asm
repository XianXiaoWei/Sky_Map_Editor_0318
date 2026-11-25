0x100195050: push rbp
0x100195051: mov rbp, rsp
0x100195054: push r15
0x100195056: push r14
0x100195058: push r13
0x10019505a: push r12
0x10019505c: push rbx
0x10019505d: and rsp, 0xffffffffffffffe0
0x100195061: sub rsp, 0x360
0x100195068: mov rbx, rsp
0x10019506b: mov qword ptr [rbx + 8], r9
0x10019506f: mov r14, r8
0x100195072: mov r13, rdx
0x100195075: mov qword ptr [rbx + 0x18], rsi
0x100195079: mov r12, rdi
0x10019507c: mov rax, qword ptr [rip + 0xa78855] ; 0x100c0d8d8
0x100195083: mov rax, qword ptr [rax]
0x100195086: mov qword ptr [rbx + 0x340], rax
0x10019508d: lea rdi, [rbx + 0x120]
0x100195094: call 0x1007c2530 ; 0x1007c2530
0x100195099: call 0x1003f10c0 ; 0x1003f10c0
0x10019509e: mov r15, qword ptr [rbp + 0x18]
0x1001950a2: mov rdi, r13
0x1001950a5: mov rsi, rax
0x1001950a8: mov rdx, r15
0x1001950ab: call 0x1007c4360 ; 0x1007c4360
0x1001950b0: test rax, rax
0x1001950b3: je 0x1001950c6
0x1001950b5: lea rsi, [rbx + 0x120]
0x1001950bc: mov rdi, rax
0x1001950bf: call 0x1007c2310 ; 0x1007c2310
0x1001950c4: jmp 0x1001950da ; 0x1001950da
0x1001950c6: call 0x1003f10c0 ; 0x1003f10c0
0x1001950cb: mov rsi, qword ptr [rax + 8]
0x1001950cf: mov rdi, r13
0x1001950d2: mov rdx, r15
0x1001950d5: call 0x1007c4640 ; 0x1007c4640
0x1001950da: mov dword ptr [r12 + 0x6c830], 0
0x1001950e6: mov eax, dword ptr [r12 + 0x20014]
0x1001950ee: add eax, dword ptr [r12 + 0x20010]
0x1001950f6: mov dword ptr [r12 + 0x20018], eax
0x1001950fe: vxorps xmm1, xmm1, xmm1
0x100195102: mov qword ptr [rbx + 0x10], r12
0x100195106: je 0x100195d10
0x10019510c: mov qword ptr [rbx + 0x38], r13
0x100195110: mov qword ptr [rbx + 0x58], r14
0x100195114: xor r14d, r14d
0x100195117: nop word ptr [rax + rax]
0x100195120: mov r15, r12
0x100195123: mov r13, qword ptr [r15 + 0x20020]
0x10019512a: mov r14d, r14d
0x10019512d: lea r12, [r14 + r14*2]
0x100195131: mov qword ptr [rbx + 0x20], r12
0x100195135: shl r12, 7
0x100195139: vxorps ymm0, ymm0, ymm0
0x10019513d: vmovups ymmword ptr [r13 + r12 + 0x160], ymm0
0x100195147: vmovups ymmword ptr [r13 + r12 + 0x140], ymm0
0x100195151: vmovups ymmword ptr [r13 + r12 + 0x120], ymm0
0x10019515b: vmovups ymmword ptr [r13 + r12 + 0x100], ymm0
0x100195165: vmovups ymmword ptr [r13 + r12 + 0xe0], ymm0
0x10019516f: vmovups ymmword ptr [r13 + r12 + 0xc0], ymm0
0x100195179: vmovups ymmword ptr [r13 + r12 + 0xa0], ymm0
0x100195183: vmovups ymmword ptr [r13 + r12 + 0x80], ymm0
0x10019518d: vmovups ymmword ptr [r13 + r12 + 0x60], ymm0
0x100195194: vmovups ymmword ptr [r13 + r12 + 0x40], ymm0
0x10019519b: vmovups ymmword ptr [r13 + r12 + 0x20], ymm0
0x1001951a2: vmovups ymmword ptr [r13 + r12], ymm0
0x1001951a9: vzeroupper 
0x1001951ac: call 0x1007abc10 ; 0x1007abc10
0x1001951b1: lea rax, [r13 + r12]
0x1001951b6: mov rcx, qword ptr [rip + 0x1c43a83] ; 0x101dd8c40
0x1001951bd: mov ecx, dword ptr [rcx + 0x38]
0x1001951c0: mov dword ptr [rax], ecx
0x1001951c2: mov qword ptr [r13 + r12 + 0xc0], 0
0x1001951ce: mov dword ptr [r13 + r12 + 0xc8], 0x10001
0x1001951da: mov word ptr [r13 + r12 + 0xcd], 0x101
0x1001951e5: mov eax, dword ptr [r15 + 0x20010]
0x1001951ec: cmp r14d, eax
0x1001951ef: jae 0x100195290
0x1001951f5: mov rcx, qword ptr [rbx + 0x20]
0x1001951f9: shl rcx, 6
0x1001951fd: lea rax, [r15 + rcx + 0x10]
0x100195202: mov qword ptr [r13 + r12 + 8], rax
0x100195207: mov qword ptr [rbx + 0x20], rax
0x10019520b: mov qword ptr [r13 + r12 + 0x10], rax
0x100195210: mov rax, qword ptr [rbx + 8]
0x100195214: movzx eax, byte ptr [rax + 0xd]
0x100195218: xor al, 1
0x10019521a: mov byte ptr [r13 + r12 + 0xbc], al
0x100195222: mov esi, dword ptr [r15 + rcx + 0x80]
0x10019522a: mov r15, rcx
0x10019522d: mov rdi, qword ptr [rbx + 0x18]
0x100195231: call 0x100408960 ; 0x100408960
0x100195236: mov qword ptr [r13 + r12 + 0xd8], rax
0x10019523e: mov rcx, qword ptr [rbx + 0x10]
0x100195242: movzx eax, byte ptr [rcx + r15 + 0x95]
0x10019524b: mov byte ptr [r13 + r12 + 0xf4], al
0x100195253: mov esi, dword ptr [rcx + r15 + 0x84]
0x10019525b: test esi, esi
0x10019525d: je 0x100195318
0x100195263: mov rdi, qword ptr [rbx + 0x18]
0x100195267: call 0x100408960 ; 0x100408960
0x10019526c: mov qword ptr [r13 + r12 + 0xe0], rax
0x100195274: test rax, rax
0x100195277: jne 0x100195318
0x10019527d: jmp 0x1001964b6 ; 0x1001964b6
0x100195282: nop word ptr cs:[rax + rax]
0x100195290: mov ecx, r14d
0x100195293: sub ecx, eax
0x100195295: shl rcx, 7
0x100195299: lea rax, [r15 + rcx + 0x18010]
0x1001952a1: mov qword ptr [rbx + 0x20], rax
0x1001952a5: mov qword ptr [r13 + r12 + 8], rax
0x1001952aa: mov qword ptr [r13 + r12 + 0x10], 0
0x1001952b3: mov byte ptr [r13 + r12 + 0xf4], 0
0x1001952bc: mov byte ptr [r13 + r12 + 0xbc], 0
0x1001952c5: vmovss xmm0, dword ptr [r15 + rcx + 0x18084]
0x1001952cf: vxorps xmm1, xmm1, xmm1
0x1001952d3: vcmpltss xmm1, xmm1, xmm0
0x1001952d8: vandps xmm0, xmm1, xmm0
0x1001952dc: vmovss xmm2, dword ptr [rip + 0x9125d4] ; 0x100aa78b8
0x1001952e4: vandnps xmm1, xmm1, xmm2
0x1001952e8: vorps xmm0, xmm1, xmm0
0x1001952ec: vmovss dword ptr [r13 + r12 + 0xb4], xmm0
0x1001952f6: mov esi, dword ptr [r15 + rcx + 0x18080]
0x1001952fe: mov rdi, qword ptr [rbx + 0x18]
0x100195302: call 0x100408960 ; 0x100408960
0x100195307: mov qword ptr [r13 + r12 + 0xd8], rax
0x10019530f: test rax, rax
0x100195312: je 0x10019647e
0x100195318: inc r14d
0x10019531b: mov r12, qword ptr [rbx + 0x10]
0x10019531f: mov eax, dword ptr [r12 + 0x20018]
0x100195327: cmp r14d, eax
0x10019532a: jb 0x100195120
0x100195330: test eax, eax
0x100195332: vxorps xmm1, xmm1, xmm1
0x100195336: je 0x100195d10
0x10019533c: lea r15, [rbx + 0x90]
0x100195343: mov rax, qword ptr [rip + 0xa75236] ; 0x100c0a580
0x10019534a: add rax, 8
0x10019534e: mov qword ptr [rbx + 0x60], rax
0x100195352: xor ecx, ecx
0x100195354: mov r12, qword ptr [r12 + 0x20020]
0x10019535c: mov ecx, ecx
0x10019535e: mov qword ptr [rbx + 0x50], rcx
0x100195362: lea r13, [rcx + rcx*2]
0x100195366: shl r13, 7
0x10019536a: mov rax, qword ptr [r12 + r13 + 0x10]
0x10019536f: mov qword ptr [rbx + 8], rax
0x100195373: mov rdi, r15
0x100195376: call 0x1007c2530 ; 0x1007c2530
0x10019537b: mov qword ptr [rbx + 0x20], r12
0x10019537f: mov rdi, qword ptr [r12 + r13 + 8]
0x100195384: mov rax, qword ptr [rdi]
0x100195387: call qword ptr [rax + 0x38]
0x10019538a: mov r15, rax
0x10019538d: lea r12, [rbx + 0x148]
0x100195394: call 0x1004559d0 ; 0x1004559d0
0x100195399: mov rdi, qword ptr [rbx + 0x38]
0x10019539d: mov rsi, rax
0x1001953a0: mov rdx, r15
0x1001953a3: call 0x1007c4360 ; 0x1007c4360
0x1001953a8: test rax, rax
0x1001953ab: je 0x1001954f1
0x1001953b1: mov rdi, rax
0x1001953b4: lea rsi, [rbx + 0x90]
0x1001953bb: call 0x1007c2310 ; 0x1007c2310
0x1001953c0: mov rax, qword ptr [rbx + 0x90]
0x1001953c7: test rax, rax
0x1001953ca: je 0x100196534
0x1001953d0: mov rax, qword ptr [rax + 0x10]
0x1001953d4: test rax, rax
0x1001953d7: je 0x100196534
0x1001953dd: lea rcx, [rax + 0xa8]
0x1001953e4: mov rdx, qword ptr [rbx + 0x20]
0x1001953e8: mov qword ptr [rdx + r13 + 0x18], rcx
0x1001953ed: cmp dword ptr [rax + 0xe8], 5
0x1001953f4: jae 0x100196556
0x1001953fa: lea rax, [rdx + r13 + 8]
0x1001953ff: mov qword ptr [rbx + 0x30], rax
0x100195403: mov rdi, qword ptr [rax]
0x100195406: mov rax, qword ptr [rdi]
0x100195409: call qword ptr [rax + 0x30]
0x10019540c: lea rdi, [rbx + 0x120]
0x100195413: mov esi, eax
0x100195415: lea rdx, [rbx + 0x40]
0x100195419: call 0x1003f68d0 ; 0x1003f68d0
0x10019541e: mov r8, qword ptr [rbx + 0x20]
0x100195422: lea r14, [r8 + r13 + 0x18]
0x100195427: test al, al
0x100195429: je 0x10019543e
0x10019542b: mov rax, qword ptr [rbx + 0x40]
0x10019542f: mov eax, dword ptr [rax + 0x1c]
0x100195432: mov rcx, qword ptr [r14]
0x100195435: cmp eax, dword ptr [rcx + 0x40]
0x100195438: sete dil
0x10019543c: jmp 0x100195440 ; 0x100195440
0x10019543e: xor edi, edi
0x100195440: lea r15, [rbx + 0x90]
0x100195447: mov rax, qword ptr [rbx + 8]
0x10019544b: lea r9, [r8 + r13 + 0xb8]
0x100195453: mov dword ptr [r8 + r13 + 0xb8], 0
0x10019545f: test rax, rax
0x100195462: je 0x100195522
0x100195468: vmovss xmm0, dword ptr [rax + 0xa0]
0x100195470: xor ecx, ecx
0x100195472: vucomiss xmm0, dword ptr [rip + 0x911c6a] ; 0x100aa70e4
0x10019547a: jne 0x100195482
0x10019547c: jnp 0x10019559f
0x100195482: mov rdx, qword ptr [r14]
0x100195485: cmp dword ptr [rdx + 0x40], 0
0x100195489: je 0x10019559f
0x10019548f: vxorps xmm0, xmm0, xmm0
0x100195493: vucomiss xmm0, dword ptr [rax + 0x90]
0x10019549b: jb 0x1001954b0
0x10019549d: mov rcx, qword ptr [rdx + 0x48]
0x1001954a1: mov ecx, dword ptr [rcx]
0x1001954a3: mov dword ptr [rax + 0x90], ecx
0x1001954a9: mov ecx, dword ptr [r9]
0x1001954ac: test ecx, ecx
0x1001954ae: jne 0x1001954b5
0x1001954b0: mov ecx, 1
0x1001954b5: mov dword ptr [r9], ecx
0x1001954b8: xor esi, esi
0x1001954ba: test dil, dil
0x1001954bd: je 0x10019559c
0x1001954c3: mov rdi, qword ptr [rbx + 0x40]
0x1001954c7: test rdi, rdi
0x1001954ca: je 0x10019559c
0x1001954d0: mov rsi, qword ptr [rdi + 0x28]
0x1001954d4: cmp qword ptr [rsi + 0x10], 0
0x1001954d9: je 0x10019559a
0x1001954df: mov esi, dword ptr [rsi]
0x1001954e1: mov rdx, qword ptr [rdx + 0x48]
0x1001954e5: cmp esi, dword ptr [rdx + 0x34]
0x1001954e8: sete sil
0x1001954ec: jmp 0x10019559c ; 0x10019559c
0x1001954f1: call 0x1004559d0 ; 0x1004559d0
0x1001954f6: mov rdi, qword ptr [rbx + 0x38]
0x1001954fa: mov rsi, rax
0x1001954fd: lea rdx, [rip + 0x9e1f28] ; 0x100b7742c UnitCube
0x100195504: call 0x1007c4360 ; 0x1007c4360
0x100195509: test rax, rax
0x10019550c: je 0x10019557c
0x10019550e: mov rdi, rax
0x100195511: lea rsi, [rbx + 0x90]
0x100195518: call 0x1007c2310 ; 0x1007c2310
0x10019551d: jmp 0x1001953c0 ; 0x1001953c0
0x100195522: mov rcx, qword ptr [r14]
0x100195525: mov edx, dword ptr [rcx + 0x40]
0x100195528: test edx, edx
0x10019552a: je 0x100195660
0x100195530: mov dword ptr [r9], 1
0x100195537: xor esi, esi
0x100195539: test dil, dil
0x10019553c: je 0x10019561c
0x100195542: mov rdi, qword ptr [rbx + 0x40]
0x100195546: test rdi, rdi
0x100195549: je 0x10019561c
0x10019554f: mov rsi, qword ptr [rdi + 0x28]
0x100195553: cmp qword ptr [rsi + 0x10], 0
0x100195558: je 0x10019561a
0x10019555e: mov esi, dword ptr [rsi]
0x100195560: mov rdi, qword ptr [rcx + 0x48]
0x100195564: cmp esi, dword ptr [rdi + 0x34]
0x100195567: sete sil
0x10019556b: mov dil, sil
0x10019556e: cmp edx, 1
0x100195571: ja 0x100195624
0x100195577: jmp 0x100195660 ; 0x100195660
0x10019557c: call 0x1004559d0 ; 0x1004559d0
0x100195581: mov rsi, qword ptr [rax + 8]
0x100195585: mov rdi, qword ptr [rbx + 0x38]
0x100195589: lea rdx, [rip + 0x9e1e9c] ; 0x100b7742c UnitCube
0x100195590: call 0x1007c4640 ; 0x1007c4640
0x100195595: jmp 0x1001953c0 ; 0x1001953c0
0x10019559a: xor esi, esi
0x10019559c: mov dil, sil
0x10019559f: vmovss xmm0, dword ptr [rax + 0xa4]
0x1001955a7: vucomiss xmm0, dword ptr [rip + 0x911b35] ; 0x100aa70e4
0x1001955af: jne 0x1001955b7
0x1001955b1: jnp 0x100195660
0x1001955b7: mov rdx, qword ptr [r14]
0x1001955ba: cmp dword ptr [rdx + 0x40], 2
0x1001955be: jb 0x100195660
0x1001955c4: vxorps xmm0, xmm0, xmm0
0x1001955c8: vucomiss xmm0, dword ptr [rax + 0x94]
0x1001955d0: jb 0x1001955e5
0x1001955d2: mov rcx, qword ptr [rdx + 0x48]
0x1001955d6: mov ecx, dword ptr [rcx + 0xb8]
0x1001955dc: mov dword ptr [rax + 0x94], ecx
0x1001955e2: mov ecx, dword ptr [r9]
0x1001955e5: cmp ecx, 2
0x1001955e8: mov esi, 2
0x1001955ed: cmovbe ecx, esi
0x1001955f0: mov dword ptr [r9], ecx
0x1001955f3: test dil, dil
0x1001955f6: mov edi, 0
0x1001955fb: je 0x100195660
0x1001955fd: mov rax, qword ptr [rbx + 0x40]
0x100195601: test rax, rax
0x100195604: je 0x100195660
0x100195606: mov rax, qword ptr [rax + 0x28]
0x10019560a: cmp qword ptr [rax + 0x28], 0
0x10019560f: je 0x100195659
0x100195611: mov eax, dword ptr [rax + 0x18]
0x100195614: mov rcx, qword ptr [rdx + 0x48]
0x100195618: jmp 0x10019564d ; 0x10019564d
0x10019561a: xor esi, esi
0x10019561c: mov dil, sil
0x10019561f: cmp edx, 1
0x100195622: jbe 0x100195660
0x100195624: mov dword ptr [r9], 2
0x10019562b: xor edi, edi
0x10019562d: test sil, sil
0x100195630: je 0x100195660
0x100195632: mov rax, qword ptr [rbx + 0x40]
0x100195636: test rax, rax
0x100195639: je 0x100195660
0x10019563b: mov rax, qword ptr [rax + 0x28]
0x10019563f: cmp qword ptr [rax + 0x28], 0
0x100195644: je 0x100195659
0x100195646: mov eax, dword ptr [rax + 0x18]
0x100195649: mov rcx, qword ptr [rcx + 0x48]
0x10019564d: cmp eax, dword ptr [rcx + 0xec]
0x100195653: sete dil
0x100195657: jmp 0x100195660 ; 0x100195660
0x100195659: xor edi, edi
0x10019565b: nop dword ptr [rax + rax]
0x100195660: mov rax, qword ptr [rbx + 0x40]
0x100195664: mov dword ptr [rbx + 0x68], edi
0x100195667: test dil, dil
0x10019566a: mov ecx, 0
0x10019566f: cmove rax, rcx
0x100195673: mov qword ptr [r8 + r13 + 0x20], rax
0x100195678: jne 0x10019579b
0x10019567e: mov rax, qword ptr [rip + 0xa74e9b] ; 0x100c0a520
0x100195685: mov rcx, rax
0x100195688: lea rax, [rcx + 0x18]
0x10019568c: mov qword ptr [rbx + 0x140], rax
0x100195693: lea rax, [rcx + 0x40]
0x100195697: mov qword ptr [rbx + 0x290], rax
0x10019569e: lea rdi, [rbx + 0x290]
0x1001956a5: mov rsi, r12
0x1001956a8: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1001956ad: mov qword ptr [rbx + 0x318], 0
0x1001956b8: mov dword ptr [rbx + 0x320], 0xffffffff
0x1001956c2: mov rax, qword ptr [rip + 0xa77eff] ; 0x100c0d5c8
0x1001956c9: lea r15, [rax + 0x18]
0x1001956cd: mov qword ptr [rbx + 0x140], r15
0x1001956d4: lea rax, [rax + 0x40]
0x1001956d8: mov qword ptr [rbx + 0x80], rax
0x1001956df: mov qword ptr [rbx + 0x290], rax
0x1001956e6: mov edx, 1
0x1001956eb: mov rdi, r12
0x1001956ee: lea rsi, [rip + 0x9e1ba6] ; 0x100b7729b Beamo
0x1001956f5: call 0x1007a56a0 ; 0x1007a56a0
0x1001956fa: mov qword ptr [rbx + 0x70], r15
0x1001956fe: mov edx, 0xe
0x100195703: lea rdi, [rbx + 0x140]
0x10019570a: lea rsi, [rip + 0x9e1e5e] ; 0x100b7756f Unbaked beamo 
0x100195711: call 0x100011930 ; 0x100011930
0x100195716: mov r15, rax
0x100195719: mov rax, qword ptr [rbx + 0x10]
0x10019571d: mov rax, qword ptr [rax + 0x20020]
0x100195724: mov rdi, qword ptr [rax + r13 + 8]
0x100195729: mov rax, qword ptr [rdi]
0x10019572c: call qword ptr [rax + 0x38]
0x10019572f: mov r12, rax
0x100195732: mov rdi, r12
0x100195735: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x10019573a: mov rdi, r15
0x10019573d: mov rsi, r12
0x100195740: mov rdx, rax
0x100195743: call 0x100011930 ; 0x100011930
0x100195748: mov rax, qword ptr [rbx + 0x70]
0x10019574c: mov qword ptr [rbx + 0x140], rax
0x100195753: mov rax, qword ptr [rbx + 0x80]
0x10019575a: mov qword ptr [rbx + 0x290], rax
0x100195761: lea rdi, [rbx + 0x148]
0x100195768: call 0x1007a58d0 ; 0x1007a58d0
0x10019576d: lea rdi, [rbx + 0x140]
0x100195774: mov rsi, qword ptr [rbx + 0x60]
0x100195778: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10019577d: lea rdi, [rbx + 0x290]
0x100195784: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100195789: mov rax, qword ptr [rbx + 0x18]
0x10019578d: mov byte ptr [rax + 0x8f34], 1
0x100195794: lea r15, [rbx + 0x90]
0x10019579b: mov rax, qword ptr [r14]
0x10019579e: mov rax, qword ptr [rax + 0x48]
0x1001957a2: vmovss xmm0, dword ptr [rax + 0xc]
0x1001957a7: vmovaps xmmword ptr [rbx + 0x80], xmm0
0x1001957af: vmovsd xmm0, qword ptr [rax + 4]
0x1001957b4: vmovaps xmmword ptr [rbx + 0x70], xmm0
0x1001957b9: vmovsd xmm0, qword ptr [rax + 0x10]
0x1001957be: vinsertps xmm0, xmm0, dword ptr [rax + 0x18], 0x20
0x1001957c5: vmovaps xmmword ptr [rbx + 0xd0], xmm0
0x1001957cd: mov rax, qword ptr [rbx + 0x30]
0x1001957d1: mov rsi, qword ptr [rax]
0x1001957d4: mov rax, qword ptr [rsi]
0x1001957d7: lea r12, [rbx + 0x140]
0x1001957de: mov rdi, r12
0x1001957e1: call qword ptr [rax + 0x18]
0x1001957e4: vmovaps xmm0, xmmword ptr [rbx + 0x70]
0x1001957e9: vinsertps xmm0, xmm0, dword ptr [rbx + 0x80], 0x20
0x1001957f3: vmovaps xmm5, xmmword ptr [rbx + 0xc0]
0x1001957fb: vblendps xmm5, xmm0, xmm5, 8
0x100195801: vmovaps xmm6, xmmword ptr [rbx + 0xb0]
0x100195809: vblendps xmm6, xmm6, xmmword ptr [rbx + 0xd0], 7
0x100195813: mov rdi, r12
0x100195816: mov r14, qword ptr [rbx + 0x20]
0x10019581a: lea r12, [r14 + r13 + 0x30]
0x10019581f: vmovaps xmm0, xmmword ptr [rbx + 0x140]
0x100195827: vmovaps xmmword ptr [r14 + r13 + 0x30], xmm0
0x10019582e: vmovaps xmm1, xmmword ptr [rbx + 0x150]
0x100195836: vmovaps xmmword ptr [r14 + r13 + 0x40], xmm1
0x10019583d: vmovaps xmm2, xmmword ptr [rbx + 0x160]
0x100195845: vmovaps xmmword ptr [r14 + r13 + 0x50], xmm2
0x10019584c: vmovaps xmm3, xmmword ptr [rbx + 0x170]
0x100195854: vmovaps xmmword ptr [r14 + r13 + 0x60], xmm3
0x10019585b: vsubps xmm3, xmm6, xmm5
0x10019585f: vpermilps xmm4, xmm3, 0
0x100195865: vmulps xmm0, xmm4, xmm0
0x100195869: vpermilps xmm4, xmm3, 0x55
0x10019586f: vmulps xmm1, xmm4, xmm1
0x100195873: vaddps xmm0, xmm0, xmm1
0x100195877: vpermilps xmm1, xmm3, 0xaa
0x10019587d: vmulps xmm1, xmm1, xmm2
0x100195881: vaddps xmm0, xmm0, xmm1
0x100195885: vmulps xmm0, xmm0, xmm0
0x100195889: vpermilpd xmm1, xmm0, 1
0x10019588f: vaddps xmm0, xmm0, xmm1
0x100195893: vmovshdup xmm1, xmm0
0x100195897: vaddss xmm0, xmm0, xmm1
0x10019589b: vsqrtss xmm0, xmm0, xmm0
0x10019589f: vmulss xmm0, xmm0, dword ptr [rip + 0x90ed11] ; 0x100aa45b8
0x1001958a7: vmovss dword ptr [r14 + r13 + 0xb0], xmm0
0x1001958b1: vmovaps xmmword ptr [rbx + 0xc0], xmm5
0x1001958b9: vmovaps xmmword ptr [rbx + 0xb0], xmm6
0x1001958c1: vaddps xmm0, xmm5, xmm6
0x1001958c5: vmovaps xmm1, xmmword ptr [rip + 0x911da3] ; 0x100aa7670
0x1001958cd: vmulps xmm0, xmm0, xmm1
0x1001958d1: vinsertps xmm0, xmm0, dword ptr [rip + 0x90f7e5], 0x30 ; 0x100aa50c0
0x1001958db: vmulps xmm1, xmm3, xmm1
0x1001958df: vpermilps xmm2, xmm1, 0
0x1001958e5: vmovss xmm3, dword ptr [rip + 0x90f7d3] ; 0x100aa50c0
0x1001958ed: vmulps xmm2, xmm2, xmm3
0x1001958f1: vpermilps xmm3, xmm1, 0x55
0x1001958f7: vmulps xmm3, xmm3, xmmword ptr [rip + 0x9127a1] ; 0x100aa80a0
0x1001958ff: vpermilps xmm1, xmm1, 0xaa
0x100195905: vmulps xmm1, xmm1, xmmword ptr [rip + 0x913123] ; 0x100aa8a30
0x10019590d: vmovaps xmmword ptr [rbx + 0xe0], xmm2
0x100195915: vmovaps xmmword ptr [rbx + 0xf0], xmm3
0x10019591d: vmovaps xmmword ptr [rbx + 0x100], xmm1
0x100195925: vmovaps xmmword ptr [rbx + 0x110], xmm0
0x10019592d: mov rsi, r12
0x100195930: lea rdx, [rbx + 0xe0]
0x100195937: call 0x100076df0 ; 0x100076df0
0x10019593c: vmovaps xmm0, xmmword ptr [rbx + 0x140]
0x100195944: vmovaps xmmword ptr [r14 + r13 + 0x70], xmm0
0x10019594b: vmovaps xmm0, xmmword ptr [rbx + 0x150]
0x100195953: vmovaps xmmword ptr [r14 + r13 + 0x80], xmm0
0x10019595d: vmovaps xmm0, xmmword ptr [rbx + 0x160]
0x100195965: vmovaps xmmword ptr [r14 + r13 + 0x90], xmm0
0x10019596f: vmovaps xmm0, xmmword ptr [rbx + 0x170]
0x100195977: vmovaps xmmword ptr [r14 + r13 + 0xa0], xmm0
0x100195981: mov rdx, qword ptr [rbx + 8]
0x100195985: test rdx, rdx
0x100195988: mov rcx, r14
0x10019598b: mov esi, dword ptr [rbx + 0x68]
0x10019598e: je 0x1001959ed
0x100195990: vmovss xmm0, dword ptr [rdx + 0x98]
0x100195998: vxorps xmm1, xmm1, xmm1
0x10019599c: vucomiss xmm1, xmm0
0x1001959a0: jb 0x1001959c2
0x1001959a2: lea rax, [rcx + r13 + 0xb0]
0x1001959aa: vmovss xmm0, dword ptr [rip + 0x917c1e] ; 0x100aad5d0
0x1001959b2: vmulss xmm0, xmm0, dword ptr [rax]
0x1001959b6: vaddss xmm0, xmm0, xmm0
0x1001959ba: vmovss dword ptr [rdx + 0x98], xmm0
0x1001959c2: vxorps xmm1, xmm1, xmm1
0x1001959c6: vcmpneqss xmm1, xmm1, dword ptr [rdx + 0xa8]
0x1001959cf: vandps xmm0, xmm1, xmm0
0x1001959d3: vmovss xmm2, dword ptr [rip + 0x911edd] ; 0x100aa78b8
0x1001959db: vandnps xmm1, xmm1, xmm2
0x1001959df: vorps xmm0, xmm1, xmm0
0x1001959e3: vmovss dword ptr [rcx + r13 + 0xb4], xmm0
0x1001959ed: cmp byte ptr [rcx + r13 + 0xbc], 0
0x1001959f6: je 0x100195bc5
0x1001959fc: mov rax, qword ptr [rbx + 0x90]
0x100195a03: test rax, rax
0x100195a06: je 0x100196578
0x100195a0c: mov rax, qword ptr [rax + 0x10]
0x100195a10: test rax, rax
0x100195a13: je 0x100196578
0x100195a19: mov r14d, dword ptr [rax + 0x110]
0x100195a20: vxorps ymm0, ymm0, ymm0
0x100195a24: vmovups ymmword ptr [rbx + 0x150], ymm0
0x100195a2c: vmovaps ymmword ptr [rbx + 0x140], ymm0
0x100195a34: movabs rax, 0x3f800000ffffffff
0x100195a3e: mov qword ptr [rbx + 0x170], rax
0x100195a45: test sil, sil
0x100195a48: je 0x100195a72
0x100195a4a: lea rax, [rcx + r13 + 0x20]
0x100195a4f: mov rax, qword ptr [rax]
0x100195a52: mov rax, qword ptr [rax + 0x28]
0x100195a56: mov rax, qword ptr [rax + 8]
0x100195a5a: mov qword ptr [rbx + 0x140], rax
0x100195a61: movabs rax, 0xc0000001c
0x100195a6b: mov qword ptr [rbx + 0x148], rax
0x100195a72: mov rsi, qword ptr [rcx + r13 + 0xd8]
0x100195a7a: add rsi, 0xd0
0x100195a81: lea rdi, [rbx + 0xe0]
0x100195a88: vmovss xmm0, dword ptr [rip + 0x912b28] ; 0x100aa85b8
0x100195a90: mov r15, rcx
0x100195a93: vzeroupper 
0x100195a96: call 0x10077d4b0 ; 0x10077d4b0
0x100195a9b: mov dword ptr [rbx + 8], r14d
0x100195a9f: lea r14, [r15 + r13 + 0xd8]
0x100195aa7: vmovaps xmm0, xmmword ptr [rip + 0x917ac1] ; 0x100aad570
0x100195aaf: vmovaps xmm1, xmm0
0x100195ab3: vmulps xmm0, xmm1, xmmword ptr [rbx + 0xe0]
0x100195abb: vmaxps xmm0, xmm0, xmmword ptr [rip + 0x90eadd] ; 0x100aa45a0
0x100195ac3: vminps xmm0, xmm0, xmm1
0x100195ac7: vcvttps2dq xmm0, xmm0
0x100195acb: vpextrb eax, xmm0, 0
0x100195ad1: vpextrb ecx, xmm0, 4
0x100195ad7: vpextrb edx, xmm0, 8
0x100195add: vpextrd esi, xmm0, 3
0x100195ae3: shl esi, 0x18
0x100195ae6: shl edx, 0x10
0x100195ae9: or edx, eax
0x100195aeb: or edx, esi
0x100195aed: shl ecx, 8
0x100195af0: or ecx, edx
0x100195af2: mov dword ptr [r15 + r13 + 0xf8], ecx
0x100195afa: mov rax, qword ptr [r14]
0x100195afd: lea rcx, [rax + 0x21]
0x100195b01: mov qword ptr [rbx + 0x160], rcx
0x100195b08: mov qword ptr [rbx + 0x168], 0x19
0x100195b13: cmp byte ptr [rax + 0x20], 0
0x100195b17: je 0x100195b33
0x100195b19: lea rax, [r15 + r13 + 0xf8]
0x100195b21: mov qword ptr [rbx + 0x150], rax
0x100195b28: mov qword ptr [rbx + 0x158], 0x1c
0x100195b33: mov dword ptr [rbx + 0x170], 2
0x100195b3d: mov rax, qword ptr [rbx + 0x30]
0x100195b41: mov rdi, qword ptr [rax]
0x100195b44: mov rax, qword ptr [rdi]
0x100195b47: call qword ptr [rax + 0x40]
0x100195b4a: vmovd dword ptr [rbx + 0x174], xmm0
0x100195b52: lea rax, [r15 + r13]
0x100195b56: lea r8, [r15 + r13 + 0xc0]
0x100195b5e: mov qword ptr [r15 + r13 + 0xc0], rax
0x100195b66: mov word ptr [r15 + r13 + 0xc8], 1
0x100195b71: mov byte ptr [r15 + r13 + 0xca], 1
0x100195b7a: mov word ptr [r15 + r13 + 0xcd], 0x101
0x100195b85: mov rax, qword ptr [r14]
0x100195b88: movzx ecx, byte ptr [rax + 0x22]
0x100195b8c: mov byte ptr [r15 + r13 + 0xcb], cl
0x100195b94: movzx eax, byte ptr [rax + 0x23]
0x100195b98: mov byte ptr [r15 + r13 + 0xcc], al
0x100195ba0: mov rdi, qword ptr [rbx + 0x58]
0x100195ba4: mov esi, dword ptr [rbx + 8]
0x100195ba7: mov rdx, r12
0x100195baa: lea rcx, [rbx + 0x140]
0x100195bb1: call 0x100778fd0 ; 0x100778fd0
0x100195bb6: mov qword ptr [r15 + r13 + 0xd0], rax
0x100195bbe: lea r15, [rbx + 0x90]
0x100195bc5: mov rdi, r15
0x100195bc8: call 0x1007c2570 ; 0x1007c2570
0x100195bcd: mov rcx, qword ptr [rbx + 0x50]
0x100195bd1: inc ecx
0x100195bd3: mov r12, qword ptr [rbx + 0x10]
0x100195bd7: mov eax, dword ptr [r12 + 0x20018]
0x100195bdf: cmp ecx, eax
0x100195be1: jb 0x100195354
0x100195be7: vxorps xmm1, xmm1, xmm1
0x100195beb: test eax, eax
0x100195bed: je 0x100195d10
0x100195bf3: mov r8d, eax
0x100195bf6: and r8d, 1
0x100195bfa: cmp eax, 1
0x100195bfd: jne 0x100195c0b
0x100195bff: xor edx, edx
0x100195c01: test r8, r8
0x100195c04: jne 0x100195c77
0x100195c06: jmp 0x100195ca9 ; 0x100195ca9
0x100195c0b: mov r9, rax
0x100195c0e: sub r9, r8
0x100195c11: lea rdi, [r12 + 0x69840]
0x100195c19: xor ecx, ecx
0x100195c1b: xor edx, edx
0x100195c1d: mov rsi, qword ptr [r12 + 0x20020]
0x100195c25: vmovaps xmm0, xmmword ptr [rsi + rcx + 0xa0]
0x100195c2e: vinsertps xmm0, xmm0, dword ptr [rsi + rcx + 0xb0], 0x30
0x100195c39: vmovaps xmmword ptr [rdi - 0x10], xmm0
0x100195c3e: mov rsi, qword ptr [r12 + 0x20020]
0x100195c46: vmovaps xmm0, xmmword ptr [rsi + rcx + 0x220]
0x100195c4f: vinsertps xmm0, xmm0, dword ptr [rsi + rcx + 0x230], 0x30
0x100195c5a: vmovaps xmmword ptr [rdi], xmm0
0x100195c5e: add rdx, 2
0x100195c62: add rcx, 0x300
0x100195c69: add rdi, 0x20
0x100195c6d: cmp r9, rdx
0x100195c70: jne 0x100195c1d
0x100195c72: test r8, r8
0x100195c75: je 0x100195ca9
0x100195c77: mov rcx, qword ptr [r12 + 0x20020]
0x100195c7f: lea rsi, [rdx + rdx*2]
0x100195c83: shl rsi, 7
0x100195c87: vmovaps xmm0, xmmword ptr [rcx + rsi + 0xa0]
0x100195c90: vinsertps xmm0, xmm0, dword ptr [rcx + rsi + 0xb0], 0x30
0x100195c9b: shl rdx, 4
0x100195c9f: vmovaps xmmword ptr [r12 + rdx + 0x69830], xmm0
0x100195ca9: test eax, eax
0x100195cab: je 0x100195d10
0x100195cad: mov r8, qword ptr [r12 + 0x20020]
0x100195cb5: vxorps xmm1, xmm1, xmm1
0x100195cb9: xor edx, edx
0x100195cbb: lea rcx, [rdx + rdx*2]
0x100195cbf: shl rcx, 7
0x100195cc3: mov rcx, qword ptr [r8 + rcx + 0x18]
0x100195cc8: mov esi, dword ptr [rcx + 0x40]
0x100195ccb: test rsi, rsi
0x100195cce: je 0x100195d08
0x100195cd0: mov rdi, qword ptr [rcx + 0x48]
0x100195cd4: vpmovzxdq xmm0, qword ptr [rdi + 0x34]
0x100195cda: vpaddq xmm1, xmm0, xmm1
0x100195cde: cmp esi, 1
0x100195ce1: je 0x100195d08
0x100195ce3: add rdi, 0xec
0x100195cea: mov ecx, 1
0x100195cef: nop 
0x100195cf0: vpmovzxdq xmm0, qword ptr [rdi]
0x100195cf5: vpaddq xmm1, xmm0, xmm1
0x100195cf9: inc rcx
0x100195cfc: add rdi, 0xb8
0x100195d03: cmp rcx, rsi
0x100195d06: jb 0x100195cf0
0x100195d08: inc rdx
0x100195d0b: cmp rdx, rax
0x100195d0e: jne 0x100195cbb
0x100195d10: lea r14, [r12 + 0x6c838]
0x100195d18: vmovaps xmmword ptr [rbx + 0x20], xmm1
0x100195d1d: vmovd edx, xmm1
0x100195d21: lea rsi, [rip + 0x9e1856] ; 0x100b7757e Beamos
0x100195d28: mov rdi, r14
0x100195d2b: call 0x1007f53c0 ; 0x1007f53c0
0x100195d30: vmovaps ymm0, ymmword ptr [rip + 0x9178a8] ; 0x100aad5e0
0x100195d38: vmovups ymmword ptr [rbx + 0x140], ymm0
0x100195d40: lea rcx, [rbx + 0x160]
0x100195d47: vmovaps ymm0, ymmword ptr [rip + 0x9178b1] ; 0x100aad600
0x100195d4f: vmovups ymmword ptr [rbx + 0x160], ymm0
0x100195d57: sub rsp, 0x10
0x100195d5b: mov qword ptr [rsp + 8], 0
0x100195d64: mov dword ptr [rsp], 0
0x100195d6b: lea rdx, [rbx + 0x140]
0x100195d72: mov esi, 0
0x100195d77: mov r8d, 8
0x100195d7d: mov r9d, 1
0x100195d83: mov rdi, r14
0x100195d86: vzeroupper 
0x100195d89: call 0x1007f5430 ; 0x1007f5430
0x100195d8e: add rsp, 0x10
0x100195d92: vmovdqa xmm0, xmmword ptr [rbx + 0x20]
0x100195d97: vpextrd r15d, xmm0, 2
0x100195d9d: lea r8d, [r15 + r15*2]
0x100195da1: mov esi, 0
0x100195da6: mov edx, 9
0x100195dab: mov ecx, 1
0x100195db0: xor r9d, r9d
0x100195db3: mov rdi, r14
0x100195db6: call 0x1007f55d0 ; 0x1007f55d0
0x100195dbb: lea r13, [r12 + 0x6c980]
0x100195dc3: mov rdi, r13
0x100195dc6: call 0x1007950d0 ; 0x1007950d0
0x100195dcb: mov qword ptr [rbx + 0x30], rax
0x100195dcf: mov qword ptr [rbx + 0x80], r13
0x100195dd6: mov qword ptr [rbx + 0x68], r14
0x100195dda: lea rdi, [r12 + 0x6ca80]
0x100195de2: mov qword ptr [rbx + 0x70], rdi
0x100195de6: call 0x1007950d0 ; 0x1007950d0
0x100195deb: mov qword ptr [rbx + 0x50], rax
0x100195def: mov qword ptr [rbx + 0x40], 0
0x100195df7: mov dword ptr [rbx + 0x48], r15d
0x100195dfb: mov qword ptr [rbx + 0x20], r15
0x100195dff: lea edx, [r15 + r15]
0x100195e03: mov dword ptr [rbx + 0x4c], edx
0x100195e06: mov eax, dword ptr [r12 + 0x20018]
0x100195e0e: test eax, eax
0x100195e10: je 0x100195f27
0x100195e16: mov rcx, qword ptr [rbx + 0x10]
0x100195e1a: mov r13, qword ptr [rcx + 0x20020]
0x100195e21: xor esi, esi
0x100195e23: xor edi, edi
0x100195e25: xor r14d, r14d
0x100195e28: mov r14d, r14d
0x100195e2b: lea rcx, [r14 + r14*2]
0x100195e2f: shl rcx, 7
0x100195e33: mov qword ptr [rbx + 0x58], rcx
0x100195e37: mov rcx, qword ptr [r13 + rcx + 0x18]
0x100195e3c: cmp dword ptr [rcx + 0x40], 0
0x100195e40: je 0x100195f1b
0x100195e46: xor r15d, r15d
0x100195e49: nop dword ptr [rax]
0x100195e50: mov dword ptr [rbx + 0x38], esi
0x100195e53: mov dword ptr [rbx + 8], edx
0x100195e56: mov r12d, edi
0x100195e59: mov rax, qword ptr [rbx + 0x58]
0x100195e5d: lea rdi, [r13 + rax]
0x100195e62: mov rsi, qword ptr [r13 + rax + 0x20]
0x100195e67: sub rsp, 0x10
0x100195e6b: mov rax, qword ptr [rbx + 0x50]
0x100195e6f: mov qword ptr [rsp], rax
0x100195e73: mov rdx, qword ptr [rbp + 0x10]
0x100195e77: mov ecx, r15d
0x100195e7a: lea r8, [rbx + 0x40]
0x100195e7e: mov r9, qword ptr [rbx + 0x30]
0x100195e82: call 0x100197ab0 ; 0x100197ab0
0x100195e87: add rsp, 0x10
0x100195e8b: mov rcx, rax
0x100195e8e: shr rcx, 0x20
0x100195e92: mov esi, r15d
0x100195e95: mov rdi, r14
0x100195e98: shl rdi, 7
0x100195e9c: lea r8, [rdi + rdi*2]
0x100195ea0: add r13, r8
0x100195ea3: shl rsi, 4
0x100195ea7: vmovdqu xmm0, xmmword ptr [rbx + 0x40]
0x100195eac: vmovdqu xmmword ptr [rsi + r13 + 0xfc], xmm0
0x100195eb6: mov qword ptr [rsi + r13 + 0x13c], rax
0x100195ebe: mov qword ptr [rsi + r13 + 0x144], rdx
0x100195ec6: mov edi, r12d
0x100195ec9: add edi, eax
0x100195ecb: mov dword ptr [rbx + 0x40], edi
0x100195ece: mov esi, dword ptr [rbx + 0x38]
0x100195ed1: add esi, ecx
0x100195ed3: mov dword ptr [rbx + 0x44], esi
0x100195ed6: mov rax, qword ptr [rbx + 0x20]
0x100195eda: add eax, edx
0x100195edc: mov qword ptr [rbx + 0x20], rax
0x100195ee0: mov dword ptr [rbx + 0x48], eax
0x100195ee3: shr rdx, 0x20
0x100195ee7: mov r12d, dword ptr [rbx + 8]
0x100195eeb: add r12d, edx
0x100195eee: mov edx, r12d
0x100195ef1: mov dword ptr [rbx + 0x4c], edx
0x100195ef4: inc r15d
0x100195ef7: mov rax, qword ptr [rbx + 0x10]
0x100195efb: mov r13, qword ptr [rax + 0x20020]
0x100195f02: mov rax, qword ptr [r13 + r8 + 0x18]
0x100195f07: cmp r15d, dword ptr [rax + 0x40]
0x100195f0b: jb 0x100195e50
0x100195f11: mov rax, qword ptr [rbx + 0x10]
0x100195f15: mov eax, dword ptr [rax + 0x20018]
0x100195f1b: inc r14d
0x100195f1e: cmp r14d, eax
0x100195f21: jb 0x100195e28
0x100195f27: mov rdi, qword ptr [rbx + 0x80]
0x100195f2e: call 0x100795120 ; 0x100795120
0x100195f33: mov rdi, qword ptr [rbx + 0x70]
0x100195f37: call 0x100795120 ; 0x100795120
0x100195f3c: mov rdi, qword ptr [rbx + 0x68]
0x100195f40: call 0x1007f5690 ; 0x1007f5690
0x100195f45: mov qword ptr [rbx + 0x60], rsp
0x100195f49: mov rax, qword ptr [rbx + 0x18]
0x100195f4d: mov r12d, dword ptr [rax + 0x8f30]
0x100195f54: lea rax, [r12*8]
0x100195f5c: lea rcx, [rax + rax*2 + 0xf]
0x100195f61: movabs rdx, 0x3ffffffff0
0x100195f6b: and rdx, rcx
0x100195f6e: mov rdi, rsp
0x100195f71: sub rdi, rdx
0x100195f74: mov rsp, rdi
0x100195f77: lea rdx, [rax + rax*2]
0x100195f7b: mov esi, 0xff
0x100195f80: mov qword ptr [rbx + 0x20], rdi
0x100195f84: call 0x100aa2900 ; 0x100aa2900 _memset
0x100195f89: mov r13, qword ptr [rbx + 0x10]
0x100195f8d: mov r10d, dword ptr [r13 + 0x20018]
0x100195f94: test r10, r10
0x100195f97: je 0x100196086
0x100195f9d: mov rcx, qword ptr [rbx + 0x20]
0x100195fa1: lea r14, [rcx + r12*8]
0x100195fa5: mov rax, r12
0x100195fa8: shl rax, 4
0x100195fac: add rax, rcx
0x100195faf: lea r9, [rax + r12*4]
0x100195fb3: mov r11d, dword ptr [r13 + 0x20010]
0x100195fba: mov edi, 0xf0
0x100195fbf: add rdi, qword ptr [r13 + 0x20020]
0x100195fc6: xor r8d, r8d
0x100195fc9: xor edx, edx
0x100195fcb: jmp 0x100196010 ; 0x100196010
0x100195fcd: nop dword ptr [rax]
0x100195fd0: mov esi, dword ptr [r13 + 0x6c830]
0x100195fd7: lea ecx, [rsi + 1]
0x100195fda: mov dword ptr [r13 + 0x6c830], ecx
0x100195fe1: mov dword ptr [r14 + rax*4], esi
0x100195fe5: mov ecx, dword ptr [r9 + rax*4]
0x100195fe9: cmp ecx, -1
0x100195fec: jne 0x100196072
0x100195ff2: mov ecx, dword ptr [r13 + 0x6c830]
0x100195ff9: lea esi, [rcx + 1]
0x100195ffc: mov dword ptr [r13 + 0x6c830], esi
0x100196003: mov dword ptr [r9 + rax*4], ecx
0x100196007: mov esi, dword ptr [r14 + rax*4]
0x10019600b: jmp 0x100196072 ; 0x100196072
0x10019600d: nop dword ptr [rax]
0x100196010: cmp rdx, r11
0x100196013: mov rax, r12
0x100196016: cmovb rax, r8
0x10019601a: mov rcx, qword ptr [rbx + 0x20]
0x10019601e: lea r15, [rcx + rax*4]
0x100196022: mov rcx, qword ptr [rdi - 0x18]
0x100196026: mov esi, dword ptr [rcx + 0xe0]
0x10019602c: mov ecx, dword ptr [r15 + rsi*4]
0x100196030: cmp ecx, -1
0x100196033: jne 0x10019604a
0x100196035: mov ecx, dword ptr [r13 + 0x6c830]
0x10019603c: lea eax, [rcx + 1]
0x10019603f: mov dword ptr [r13 + 0x6c830], eax
0x100196046: mov dword ptr [r15 + rsi*4], ecx
0x10019604a: mov dword ptr [rdi - 8], ecx
0x10019604d: mov rax, qword ptr [rdi - 0x10]
0x100196051: test rax, rax
0x100196054: je 0x100196077
0x100196056: mov eax, dword ptr [rax + 0xe0]
0x10019605c: mov esi, dword ptr [r14 + rax*4]
0x100196060: cmp esi, -1
0x100196063: je 0x100195fd0
0x100196069: mov ecx, dword ptr [r9 + rax*4]
0x10019606d: cmp ecx, -1
0x100196070: je 0x100195ff2
0x100196072: mov dword ptr [rdi - 4], esi
0x100196075: mov dword ptr [rdi], ecx
0x100196077: inc rdx
0x10019607a: add rdi, 0x180
0x100196081: cmp rdx, r10
0x100196084: jb 0x100196010
0x100196086: cmp dword ptr [r13 + 0x6c830], 0x10
0x10019608e: jae 0x100196616
0x100196094: lea rdx, [r12 + r12]
0x100196098: mov rax, qword ptr [rbx + 0x18]
0x10019609c: mov eax, dword ptr [rax + 0x8f30]
0x1001960a2: xor esi, esi
0x1001960a4: mov r8d, 0xffffffff
0x1001960aa: test eax, eax
0x1001960ac: mov eax, 0
0x1001960b1: je 0x10019643a
0x1001960b7: mov rax, rdx
0x1001960ba: imul rax, rsi
0x1001960be: mov rcx, qword ptr [rbx + 0x20]
0x1001960c2: lea r9, [rcx + rax*4]
0x1001960c6: xor edi, edi
0x1001960c8: mov qword ptr [rbx + 0x30], r12
0x1001960cc: mov qword ptr [rbx + 0xb0], rdx
0x1001960d3: mov qword ptr [rbx + 0x50], rsi
0x1001960d7: mov qword ptr [rbx + 0xc0], r9
0x1001960de: mov edi, edi
0x1001960e0: imul rdx, rdi, 0x6f0
0x1001960e7: mov rax, qword ptr [rbx + 0x18]
0x1001960eb: lea rsi, [rax + rdx + 0x2058]
0x1001960f3: mov qword ptr [rbx + 8], rsi
0x1001960f7: mov qword ptr [rbx + 0x38], rdx
0x1001960fb: lea rcx, [rax + rdx + 0x2059]
0x100196103: xor esi, esi
0x100196105: mov qword ptr [rbx + 0x70], rdi
0x100196109: mov qword ptr [rbx + 0xd0], rcx
0x100196110: mov rax, rsi
0x100196113: imul rax, r12
0x100196117: lea rax, [r9 + rax*4]
0x10019611b: mov r14d, dword ptr [rax + rdi*4]
0x10019611f: cmp r14, r8
0x100196122: je 0x10019640e
0x100196128: mov qword ptr [rbx + 0x80], rsi
0x10019612f: mov rax, qword ptr [rbx + 8]
0x100196133: test byte ptr [rax], 1
0x100196136: mov rsi, qword ptr [rax + 0x10]
0x10019613a: cmove rsi, rcx
0x10019613e: mov edx, 0x100
0x100196143: lea rdi, [rbx + 0x140]
0x10019614a: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x10019614f: cmp qword ptr [rbx + 0x50], 2
0x100196154: jne 0x100196177
0x100196156: lea rdi, [rbx + 0x140]
0x10019615d: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x100196162: mov word ptr [rbx + rax + 0x144], 0x61
0x10019616c: mov dword ptr [rbx + rax + 0x140], 0x68706c41
0x100196177: lea rdi, [rbx + 0xe0]
0x10019617e: call 0x1007c2530 ; 0x1007c2530
0x100196183: mov r15, qword ptr [r13 + 0xa2078]
0x10019618a: call 0x1007d1100 ; 0x1007d1100
0x10019618f: mov rdi, r15
0x100196192: mov rsi, rax
0x100196195: lea rdx, [rbx + 0x140]
0x10019619c: call 0x1007c4360 ; 0x1007c4360
0x1001961a1: mov r12, rax
0x1001961a4: test r12, r12
0x1001961a7: je 0x1001961de
0x1001961a9: mov rdi, r12
0x1001961ac: lea rsi, [rbx + 0xe0]
0x1001961b3: call 0x1007c2310 ; 0x1007c2310
0x1001961b8: mov rax, qword ptr [rbx + 0xe0]
0x1001961bf: test rax, rax
0x1001961c2: je 0x1001961e3
0x1001961c4: mov r15, qword ptr [rax + 0x10]
0x1001961c8: test byte ptr [r15 + 0xe8], 1
0x1001961d0: jne 0x1001961f0
0x1001961d2: add r15, 0xe8
0x1001961d9: inc r15
0x1001961dc: jmp 0x1001961f7 ; 0x1001961f7
0x1001961de: xor r15d, r15d
0x1001961e1: jmp 0x1001961f7 ; 0x1001961f7
0x1001961e3: xor r15d, r15d
0x1001961e6: test byte ptr [r15 + 0xe8], 1
0x1001961ee: je 0x1001961d2
0x1001961f0: mov r15, qword ptr [r15 + 0xf8]
0x1001961f7: mov rdi, qword ptr [r13 + 0xa2080]
0x1001961fe: mov rsi, r15
0x100196201: call 0x10017e8d0 ; 0x10017e8d0
0x100196206: test r12, r12
0x100196209: je 0x1001965e7
0x10019620f: test r15, r15
0x100196212: mov r12, qword ptr [rbx + 0x30]
0x100196216: je 0x100196502
0x10019621c: cmp byte ptr [r15], 0
0x100196220: je 0x100196502
0x100196226: test rax, rax
0x100196229: je 0x1001965bc
0x10019622f: imul r14, r14, 0x3540
0x100196236: lea rdi, [r13 + r14 + 0x6cc70]
0x10019623e: mov rcx, qword ptr [rbx + 0xe0]
0x100196245: test rcx, rcx
0x100196248: je 0x100196250
0x10019624a: mov rdx, qword ptr [rcx + 0x10]
0x10019624e: jmp 0x100196252 ; 0x100196252
0x100196250: xor edx, edx
0x100196252: add rdx, 0x100
0x100196259: mov r8d, 2
0x10019625f: mov rsi, qword ptr [rbx + 0x68]
0x100196263: mov rcx, rax
0x100196266: call 0x1007f5e90 ; 0x1007f5e90
0x10019626b: cmp byte ptr [r13 + r14 + 0x6d1a8], 0
0x100196274: je 0x10019659a
0x10019627a: mov rax, qword ptr [rbx + 8]
0x10019627e: cmp dword ptr [rax + 0x98], 0
0x100196285: je 0x1001963e3
0x10019628b: lea rax, [r13 + r14 + 0x6cee0]
0x100196293: mov qword ptr [rbx + 0x58], rax
0x100196297: xor r14d, r14d
0x10019629a: nop word ptr [rax + rax]
0x1001962a0: mov eax, r14d
0x1001962a3: mov rcx, qword ptr [rbx + 0x18]
0x1001962a7: mov rdx, qword ptr [rbx + 0x38]
0x1001962ab: lea rcx, [rcx + rdx]
0x1001962af: mov r15, qword ptr [rcx + rax*8 + 0x2070]
0x1001962b7: cmp byte ptr [r15 + 0x20], 1
0x1001962bc: jne 0x1001962f0
0x1001962be: lea rdi, [rbx + 0x90]
0x1001962c5: call 0x1007c2530 ; 0x1007c2530
0x1001962ca: mov r12, qword ptr [r13 + 0xa2078]
0x1001962d1: test byte ptr [r15 + 0x40], 1
0x1001962d6: jne 0x100196320
0x1001962d8: lea r13, [r15 + 0x40]
0x1001962dc: inc r13
0x1001962df: jmp 0x100196324 ; 0x100196324
0x1001962e1: nop word ptr cs:[rax + rax]
0x1001962f0: test byte ptr [r15 + 8], 1
0x1001962f5: jne 0x100196300
0x1001962f7: lea rsi, [r15 + 8]
0x1001962fb: inc rsi
0x1001962fe: jmp 0x100196304 ; 0x100196304
0x100196300: mov rsi, qword ptr [r15 + 0x18]
0x100196304: add r15, 0x30
0x100196308: mov rdi, qword ptr [rbx + 0x58]
0x10019630c: mov rdx, r15
0x10019630f: call 0x1007be690 ; 0x1007be690
0x100196314: jmp 0x1001963b4 ; 0x1001963b4
0x100196319: nop dword ptr [rax]
0x100196320: mov r13, qword ptr [r15 + 0x50]
0x100196324: call 0x10079ac90 ; 0x10079ac90
0x100196329: mov rdi, r12
0x10019632c: mov rsi, rax
0x10019632f: mov rdx, r13
0x100196332: call 0x1007c4360 ; 0x1007c4360
0x100196337: test rax, rax
0x10019633a: je 0x1001963ca
0x100196340: mov rdi, rax
0x100196343: lea rsi, [rbx + 0x90]
0x10019634a: call 0x1007c2310 ; 0x1007c2310
0x10019634f: test byte ptr [r15 + 8], 1
0x100196354: jne 0x100196380
0x100196356: add r15, 8
0x10019635a: inc r15
0x10019635d: mov rax, qword ptr [rbx + 0x90]
0x100196364: test rax, rax
0x100196367: je 0x100196390
0x100196369: mov rax, qword ptr [rax + 0x10]
0x10019636d: lea rdx, [rax + 0xb0]
0x100196374: test rax, rax
0x100196377: cmove rdx, rax
0x10019637b: jmp 0x100196392 ; 0x100196392
0x10019637d: nop dword ptr [rax]
0x100196380: mov r15, qword ptr [r15 + 0x18]
0x100196384: mov rax, qword ptr [rbx + 0x90]
0x10019638b: test rax, rax
0x10019638e: jne 0x100196369
0x100196390: xor edx, edx
0x100196392: xor ecx, ecx
0x100196394: mov rdi, qword ptr [rbx + 0x58]
0x100196398: mov rsi, r15
0x10019639b: call 0x1007be8b0 ; 0x1007be8b0
0x1001963a0: lea rdi, [rbx + 0x90]
0x1001963a7: call 0x1007c2570 ; 0x1007c2570
0x1001963ac: mov r13, qword ptr [rbx + 0x10]
0x1001963b0: mov r12, qword ptr [rbx + 0x30]
0x1001963b4: inc r14d
0x1001963b7: mov rax, qword ptr [rbx + 8]
0x1001963bb: cmp r14d, dword ptr [rax + 0x98]
0x1001963c2: jb 0x1001962a0
0x1001963c8: jmp 0x1001963e3 ; 0x1001963e3
0x1001963ca: call 0x10079ac90 ; 0x10079ac90
0x1001963cf: mov rsi, qword ptr [rax + 8]
0x1001963d3: mov rdi, r12
0x1001963d6: mov rdx, r13
0x1001963d9: call 0x1007c4640 ; 0x1007c4640
0x1001963de: jmp 0x10019634f ; 0x10019634f
0x1001963e3: lea rdi, [rbx + 0xe0]
0x1001963ea: call 0x1007c2570 ; 0x1007c2570
0x1001963ef: mov r8d, 0xffffffff
0x1001963f5: mov r9, qword ptr [rbx + 0xc0]
0x1001963fc: mov rdi, qword ptr [rbx + 0x70]
0x100196400: mov rcx, qword ptr [rbx + 0xd0]
0x100196407: mov rsi, qword ptr [rbx + 0x80]
0x10019640e: inc rsi
0x100196411: cmp rsi, 2
0x100196415: jb 0x100196110
0x10019641b: inc edi
0x10019641d: mov rax, qword ptr [rbx + 0x18]
0x100196421: mov eax, dword ptr [rax + 0x8f30]
0x100196427: cmp edi, eax
0x100196429: mov rdx, qword ptr [rbx + 0xb0]
0x100196430: mov rsi, qword ptr [rbx + 0x50]
0x100196434: jb 0x1001960de
0x10019643a: inc rsi
0x10019643d: cmp rsi, 3
0x100196441: jb 0x1001960aa
0x100196447: mov rsp, qword ptr [rbx + 0x60]
0x10019644b: lea rdi, [rbx + 0x120]
0x100196452: call 0x1007c2570 ; 0x1007c2570
0x100196457: mov rax, qword ptr [rip + 0xa7747a] ; 0x100c0d8d8
0x10019645e: mov rax, qword ptr [rax]
0x100196461: cmp rax, qword ptr [rbx + 0x340]
0x100196468: jne 0x100196479
0x10019646a: lea rsp, [rbp - 0x28]
0x10019646e: pop rbx
0x10019646f: pop r12
0x100196471: pop r13
0x100196473: pop r14
0x100196475: pop r15
0x100196477: pop rbp
0x100196478: ret 
0x100196479: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10019647e: mov rdi, qword ptr [rbx + 0x20]
0x100196482: mov rax, qword ptr [rdi]
0x100196485: call qword ptr [rax + 0x38]
0x100196488: mov r9, rax
0x10019648b: lea rdi, [rip + 0x9e1044] ; 0x100b774d6 ref.material
0x100196492: lea rsi, [rip + 0x9e0df8] ; 0x100b77291 Beamo.cpp
0x100196499: lea r8, [rip + 0x9e1043] ; 0x100b774e3 LevelMaterial does not exist for BeamoDecal %s, probablyneed to export, reload the level, and try again
0x1001964a0: mov edx, 0x25b
0x1001964a5: mov ecx, 4
0x1001964aa: xor eax, eax
0x1001964ac: call 0x1007e6030 ; 0x1007e6030
0x1001964b1: jmp 0x10019663c ; 0x10019663c
0x1001964b6: mov rdi, qword ptr [rbx + 0x20]
0x1001964ba: mov rax, qword ptr [rdi]
0x1001964bd: call qword ptr [rax + 0x38]
0x1001964c0: mov r9, rax
0x1001964c3: mov rax, qword ptr [rbx + 0x10]
0x1001964c7: mov eax, dword ptr [rax + r15 + 0x60]
0x1001964cc: sub rsp, 0x10
0x1001964d0: mov dword ptr [rsp], eax
0x1001964d3: lea rdi, [rip + 0x9e0f7d] ; 0x100b77457 ref.materialSecondary
0x1001964da: lea rsi, [rip + 0x9e0db0] ; 0x100b77291 Beamo.cpp
0x1001964e1: lea r8, [rip + 0x9e0f85] ; 0x100b7746d LevelMaterial does not exist for Beamo %s (%u), probably need to export, reload the level, and try again
0x1001964e8: mov edx, 0x24e
0x1001964ed: mov ecx, 4
0x1001964f2: xor eax, eax
0x1001964f4: call 0x1007e6030 ; 0x1007e6030
0x1001964f9: add rsp, 0x10
0x1001964fd: jmp 0x10019663c ; 0x10019663c
0x100196502: lea rdi, [rip + 0x9e052b] ; 0x100b76a34 renderlistName && renderlistName[0]
0x100196509: lea rsi, [rip + 0x9e0d81] ; 0x100b77291 Beamo.cpp
0x100196510: lea r8, [rip + 0x9e0541] ; 0x100b76a58 Shader %s is missing a RenderList group
0x100196517: lea r9, [rbx + 0x140]
0x10019651e: mov edx, 0x303
0x100196523: mov ecx, 4
0x100196528: xor eax, eax
0x10019652a: call 0x1007e6030 ; 0x1007e6030
0x10019652f: jmp 0x10019663c ; 0x10019663c
0x100196534: lea rdi, [rip + 0x9cf92a] ; 0x100b65e65 Observed()
0x10019653b: lea rsi, [rip + 0x9cf92e] ; 0x100b65e70 ./Mesh.h
0x100196542: mov edx, 0x6d
0x100196547: mov ecx, 3
0x10019654c: call 0x1007e5f70 ; 0x1007e5f70
0x100196551: jmp 0x10019663c ; 0x10019663c
0x100196556: lea rdi, [rip + 0x9e0fee] ; 0x100b7754b ref.mesh->lodCount <= kMaxBeamoLods
0x10019655d: lea rsi, [rip + 0x9e0d2d] ; 0x100b77291 Beamo.cpp
0x100196564: mov edx, 0x26a
0x100196569: mov ecx, 3
0x10019656e: call 0x1007e5f70 ; 0x1007e5f70
0x100196573: jmp 0x10019663c ; 0x10019663c
0x100196578: lea rdi, [rip + 0x9cf8e6] ; 0x100b65e65 Observed()
0x10019657f: lea rsi, [rip + 0x9cf8ea] ; 0x100b65e70 ./Mesh.h
0x100196586: mov edx, 0x6e
0x10019658b: mov ecx, 3
0x100196590: call 0x1007e5f70 ; 0x1007e5f70
0x100196595: jmp 0x10019663c ; 0x10019663c
0x10019659a: lea rdi, [rip + 0x9e0749] ; 0x100b76cea IsInitialized()
0x1001965a1: lea rsi, [rip + 0x9cbcd3] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1001965a8: mov edx, 0xa8
0x1001965ad: mov ecx, 3
0x1001965b2: call 0x1007e5f70 ; 0x1007e5f70
0x1001965b7: jmp 0x10019663c ; 0x10019663c
0x1001965bc: lea rdi, [rip + 0x9e04bd] ; 0x100b76a80 renderList
0x1001965c3: lea rsi, [rip + 0x9e0cc7] ; 0x100b77291 Beamo.cpp
0x1001965ca: lea r8, [rip + 0x9e04ba] ; 0x100b76a8b No RenderList called %s
0x1001965d1: mov edx, 0x304
0x1001965d6: mov ecx, 4
0x1001965db: xor eax, eax
0x1001965dd: mov r9, r15
0x1001965e0: call 0x1007e6030 ; 0x1007e6030
0x1001965e5: jmp 0x10019663c ; 0x10019663c
0x1001965e7: lea rdi, [rip + 0x9e0426] ; 0x100b76a14 foundShader
0x1001965ee: lea rsi, [rip + 0x9e0c9c] ; 0x100b77291 Beamo.cpp
0x1001965f5: lea r8, [rip + 0x9e0424] ; 0x100b76a20 No shader called %s
0x1001965fc: lea r9, [rbx + 0x140]
0x100196603: mov edx, 0x302
0x100196608: mov ecx, 4
0x10019660d: xor eax, eax
0x10019660f: call 0x1007e6030 ; 0x1007e6030
0x100196614: jmp 0x10019663c ; 0x10019663c
0x100196616: lea rdi, [rip + 0x9e0f68] ; 0x100b77585 m_renderCount < LevelModelBarn::kMaxLevelMaterials
0x10019661d: lea rsi, [rip + 0x9e0c6d] ; 0x100b77291 Beamo.cpp
0x100196624: lea r8, [rip + 0x9e0f8d] ; 0x100b775b8 Too many beamo renders
0x10019662b: mov edx, 0x336
0x100196630: mov ecx, 4
0x100196635: xor eax, eax
0x100196637: call 0x1007e6030 ; 0x1007e6030
0x10019663c: ud2 
0x10019663e: jmp 0x10019671c ; 0x10019671c
0x100196643: jmp 0x1001966e3 ; 0x1001966e3
0x100196648: jmp 0x1001966e8 ; 0x1001966e8
0x10019664d: jmp 0x1001966e8 ; 0x1001966e8
0x100196652: jmp 0x1001966e3 ; 0x1001966e3
0x100196657: jmp 0x10019671c ; 0x10019671c
0x10019665c: jmp 0x10019671c ; 0x10019671c
0x100196661: jmp 0x10019671c ; 0x10019671c
0x100196666: jmp 0x10019671c ; 0x10019671c
0x10019666b: jmp 0x10019671c ; 0x10019671c
0x100196670: jmp 0x10019671c ; 0x10019671c
0x100196675: jmp 0x10019671c ; 0x10019671c
0x10019667a: mov r14, rax
0x10019667d: jmp 0x1001966bd ; 0x1001966bd
0x10019667f: mov r14, rax
0x100196682: jmp 0x1001966cd ; 0x1001966cd
0x100196684: jmp 0x1001966e8 ; 0x1001966e8
0x100196686: jmp 0x1001966e8 ; 0x1001966e8
0x100196688: jmp 0x1001966e8 ; 0x1001966e8
0x10019668a: jmp 0x1001966e8 ; 0x1001966e8
0x10019668c: jmp 0x1001966e3 ; 0x1001966e3
0x10019668e: jmp 0x1001966e3 ; 0x1001966e3
0x100196690: jmp 0x10019671c ; 0x10019671c
0x100196695: mov r14, rax
0x100196698: mov rax, qword ptr [rbx + 0x70]
0x10019669c: mov qword ptr [rbx + 0x140], rax
0x1001966a3: mov rax, qword ptr [rbx + 0x80]
0x1001966aa: mov qword ptr [rbx + 0x290], rax
0x1001966b1: lea rdi, [rbx + 0x148]
0x1001966b8: call 0x1007a58d0 ; 0x1007a58d0
0x1001966bd: lea rdi, [rbx + 0x140]
0x1001966c4: mov rsi, qword ptr [rbx + 0x60]
0x1001966c8: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1001966cd: lea rdi, [rbx + 0x290]
0x1001966d4: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1001966d9: jmp 0x1001966eb ; 0x1001966eb
0x1001966db: jmp 0x10019671c ; 0x10019671c
0x1001966dd: jmp 0x1001966e8 ; 0x1001966e8
0x1001966df: jmp 0x1001966e3 ; 0x1001966e3
0x1001966e1: jmp 0x1001966e3 ; 0x1001966e3
0x1001966e3: mov r14, rax
0x1001966e6: jmp 0x100196708 ; 0x100196708
0x1001966e8: mov r14, rax
0x1001966eb: lea rdi, [rbx + 0x90]
0x1001966f2: call 0x1007c2570 ; 0x1007c2570
0x1001966f7: jmp 0x10019671f ; 0x10019671f
0x1001966f9: mov r14, rax
0x1001966fc: lea rdi, [rbx + 0x90]
0x100196703: call 0x1007c2570 ; 0x1007c2570
0x100196708: lea rdi, [rbx + 0xe0]
0x10019670f: call 0x1007c2570 ; 0x1007c2570
0x100196714: jmp 0x10019671f ; 0x10019671f
0x100196716: jmp 0x10019671c ; 0x10019671c
0x100196718: jmp 0x10019671c ; 0x10019671c
0x10019671a: jmp 0x10019671c ; 0x10019671c
0x10019671c: mov r14, rax
0x10019671f: lea rdi, [rbx + 0x120]
0x100196726: call 0x1007c2570 ; 0x1007c2570
0x10019672b: mov rdi, r14
0x10019672e: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100196733: nop word ptr cs:[rax + rax]
