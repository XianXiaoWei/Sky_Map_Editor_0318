0x1003784a0: push rbp
0x1003784a1: mov rbp, rsp
0x1003784a4: push r15
0x1003784a6: push r14
0x1003784a8: push r13
0x1003784aa: push r12
0x1003784ac: push rbx
0x1003784ad: sub rsp, 0x328
0x1003784b4: mov r15, rsi
0x1003784b7: mov rbx, rdi
0x1003784ba: mov rax, qword ptr [rip + 0x895417] ; 0x100c0d8d8
0x1003784c1: mov rax, qword ptr [rax]
0x1003784c4: mov qword ptr [rbp - 0x30], rax
0x1003784c8: mov rdi, r15
0x1003784cb: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1003784d0: cmp rax, 0x20
0x1003784d4: jae 0x100378a2d
0x1003784da: lea r13, [rbx + 0x1378]
0x1003784e1: vxorps ymm0, ymm0, ymm0
0x1003784e5: vmovups ymmword ptr [rbx + 0x1378], ymm0
0x1003784ed: mov rdi, r13
0x1003784f0: mov rsi, r15
0x1003784f3: vzeroupper 
0x1003784f6: call 0x100aa2c5a ; 0x100aa2c5a _strcpy
0x1003784fb: mov byte ptr [rbx + 0x1398], 0
0x100378502: mov rdi, qword ptr [rbx + 0x30]
0x100378506: mov rax, qword ptr [rdi]
0x100378509: mov rsi, qword ptr [rbx + 0x610]
0x100378510: call qword ptr [rax + 0x20]
0x100378513: lea rdi, [rbp - 0xc8]
0x10037851a: lea r14, [rbp - 0x210]
0x100378521: mov rax, qword ptr [rip + 0x891ff8] ; 0x100c0a520
0x100378528: lea rcx, [rax + 0x18]
0x10037852c: mov qword ptr [rbp - 0x338], rcx
0x100378533: mov qword ptr [rbp - 0x218], rcx
0x10037853a: add rax, 0x40
0x10037853e: mov qword ptr [rbp - 0x340], rax
0x100378545: mov qword ptr [rbp - 0xc8], rax
0x10037854c: mov rsi, r14
0x10037854f: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x100378554: mov qword ptr [rbp - 0x40], 0
0x10037855c: mov dword ptr [rbp - 0x38], 0xffffffff
0x100378563: mov r15, qword ptr [rip + 0x89505e] ; 0x100c0d5c8
0x10037856a: lea rax, [r15 + 0x18]
0x10037856e: mov qword ptr [rbp - 0x330], rax
0x100378575: mov qword ptr [rbp - 0x218], rax
0x10037857c: add r15, 0x40
0x100378580: mov qword ptr [rbp - 0xc8], r15
0x100378587: lea rsi, [rip + 0x80b5d8] ; 0x100b83b66 Session
0x10037858e: mov edx, 2
0x100378593: mov rdi, r14
0x100378596: call 0x1007a56a0 ; 0x1007a56a0
0x10037859b: mov qword ptr [rbp - 0x348], r13
0x1003785a2: lea rsi, [rip + 0x80b5c5] ; 0x100b83b6e -------------------------------------------------------------------
0x1003785a9: lea rdi, [rbp - 0x218]
0x1003785b0: mov edx, 0x43
0x1003785b5: call 0x100011930 ; 0x100011930
0x1003785ba: mov r12, qword ptr [rbp - 0x330]
0x1003785c1: mov qword ptr [rbp - 0x218], r12
0x1003785c8: mov qword ptr [rbp - 0xc8], r15
0x1003785cf: mov rdi, r14
0x1003785d2: call 0x1007a58d0 ; 0x1007a58d0
0x1003785d7: mov rsi, qword ptr [rip + 0x891fa2] ; 0x100c0a580
0x1003785de: add rsi, 8
0x1003785e2: lea rdi, [rbp - 0x218]
0x1003785e9: mov qword ptr [rbp - 0x328], rsi
0x1003785f0: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1003785f5: lea rdi, [rbp - 0xc8]
0x1003785fc: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100378601: lea rdi, [rbp - 0xc8]
0x100378608: lea r13, [rbp - 0x210]
0x10037860f: mov rax, qword ptr [rbp - 0x338]
0x100378616: mov qword ptr [rbp - 0x218], rax
0x10037861d: mov rax, qword ptr [rbp - 0x340]
0x100378624: mov qword ptr [rbp - 0xc8], rax
0x10037862b: mov rsi, r13
0x10037862e: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x100378633: mov qword ptr [rbp - 0x40], 0
0x10037863b: mov dword ptr [rbp - 0x38], 0xffffffff
0x100378642: mov qword ptr [rbp - 0x218], r12
0x100378649: mov qword ptr [rbp - 0xc8], r15
0x100378650: lea rsi, [rip + 0x80b50f] ; 0x100b83b66 Session
0x100378657: mov edx, 2
0x10037865c: mov rdi, r13
0x10037865f: call 0x1007a56a0 ; 0x1007a56a0
0x100378664: lea rsi, [rip + 0x80b547] ; 0x100b83bb2 Level load: 
0x10037866b: lea rdi, [rbp - 0x218]
0x100378672: mov edx, 0xc
0x100378677: call 0x100011930 ; 0x100011930
0x10037867c: mov r14, rax
0x10037867f: mov r12, qword ptr [rbx + 0x610]
0x100378686: mov rdi, r12
0x100378689: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x10037868e: mov rdi, r14
0x100378691: mov rsi, r12
0x100378694: mov rdx, rax
0x100378697: call 0x100011930 ; 0x100011930
0x10037869c: mov r14, qword ptr [rbp - 0x330]
0x1003786a3: mov qword ptr [rbp - 0x218], r14
0x1003786aa: mov qword ptr [rbp - 0xc8], r15
0x1003786b1: mov rdi, r13
0x1003786b4: call 0x1007a58d0 ; 0x1007a58d0
0x1003786b9: lea rdi, [rbp - 0x218]
0x1003786c0: mov rsi, qword ptr [rbp - 0x328]
0x1003786c7: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1003786cc: lea rdi, [rbp - 0xc8]
0x1003786d3: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1003786d8: lea r12, [rbp - 0xc8]
0x1003786df: lea r13, [rbp - 0x210]
0x1003786e6: mov rax, qword ptr [rbp - 0x338]
0x1003786ed: mov qword ptr [rbp - 0x218], rax
0x1003786f4: mov rax, qword ptr [rbp - 0x340]
0x1003786fb: mov qword ptr [rbp - 0xc8], rax
0x100378702: mov rdi, r12
0x100378705: mov rsi, r13
0x100378708: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x10037870d: mov qword ptr [rbp - 0x40], 0
0x100378715: mov dword ptr [rbp - 0x38], 0xffffffff
0x10037871c: mov qword ptr [rbp - 0x218], r14
0x100378723: mov qword ptr [rbp - 0xc8], r15
0x10037872a: lea rsi, [rip + 0x80b435] ; 0x100b83b66 Session
0x100378731: mov edx, 2
0x100378736: mov rdi, r13
0x100378739: call 0x1007a56a0 ; 0x1007a56a0
0x10037873e: lea rsi, [rip + 0x80b429] ; 0x100b83b6e -------------------------------------------------------------------
0x100378745: lea rdi, [rbp - 0x218]
0x10037874c: mov edx, 0x43
0x100378751: call 0x100011930 ; 0x100011930
0x100378756: mov qword ptr [rbp - 0x218], r14
0x10037875d: mov qword ptr [rbp - 0xc8], r15
0x100378764: mov rdi, r13
0x100378767: call 0x1007a58d0 ; 0x1007a58d0
0x10037876c: lea rdi, [rbp - 0x218]
0x100378773: mov rsi, qword ptr [rbp - 0x328]
0x10037877a: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10037877f: mov rdi, r12
0x100378782: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100378787: mov rax, qword ptr [rbx + 0xa0]
0x10037878e: mov byte ptr [rax + 0x20], 0
0x100378792: mov rdi, qword ptr [rbx + 0xe8]
0x100378799: call 0x100795650 ; 0x100795650
0x10037879e: mov rax, qword ptr [rbx + 0x68]
0x1003787a2: mov byte ptr [rax + 8], 0
0x1003787a6: mov rdi, qword ptr [rbx + 0x130]
0x1003787ad: mov r12, qword ptr [rbp - 0x348]
0x1003787b4: mov rsi, r12
0x1003787b7: call 0x10043fb70 ; 0x10043fb70
0x1003787bc: mov rcx, qword ptr [rbx + 0x610]
0x1003787c3: lea rdx, [rip + 0x80b3f5] ; 0x100b83bbf Data/Levels/%s/Resources.lua
0x1003787ca: lea r14, [rbp - 0x320]
0x1003787d1: mov esi, 0x100
0x1003787d6: xor eax, eax
0x1003787d8: mov rdi, r14
0x1003787db: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x1003787e0: mov rdi, qword ptr [rbx + 0x140]
0x1003787e7: mov rsi, qword ptr [rbx + 0x18]
0x1003787eb: mov rcx, qword ptr [rbx + 0xe8]
0x1003787f2: mov rdx, r14
0x1003787f5: call 0x1007c38b0 ; 0x1007c38b0
0x1003787fa: test al, al
0x1003787fc: jne 0x10037883a
0x1003787fe: lea rdi, [rip + 0x800df6] ; 0x100b795fb success
0x100378805: lea rsi, [rip + 0x80a665] ; 0x100b82e71 Game.cpp
0x10037880c: lea r8, [rip + 0x80af73] ; 0x100b83786 ResourceScript "%s" failed
0x100378813: lea r9, [rbp - 0x320]
0x10037881a: mov edx, 0x5da
0x10037881f: mov ecx, 4
0x100378824: xor eax, eax
0x100378826: call 0x1007e6030 ; 0x1007e6030
0x10037882b: ud2 
0x10037882d: nop dword ptr [rax]
0x100378830: mov esi, 1
0x100378835: call 0x1007c3d20 ; 0x1007c3d20
0x10037883a: mov rdi, qword ptr [rbx + 0x140]
0x100378841: cmp qword ptr [rdi + 0x4c0], 0
0x100378849: jne 0x100378830
0x10037884b: mov rsi, qword ptr [rbx + 0x330]
0x100378852: cmp dword ptr [rsi + 0x15b8], 0
0x100378859: mov r14, qword ptr [rbp - 0x330]
0x100378860: je 0x100378885
0x100378862: lea r15, [rbx + 0x13b8]
0x100378869: test byte ptr [rsi + 0xd8], 1
0x100378870: jne 0x100378958
0x100378876: add rsi, 0xd8
0x10037887d: inc rsi
0x100378880: jmp 0x10037895f ; 0x10037895f
0x100378885: lea r12, [rbp - 0xc8]
0x10037888c: lea r13, [rbp - 0x210]
0x100378893: mov rax, qword ptr [rbp - 0x338]
0x10037889a: mov qword ptr [rbp - 0x218], rax
0x1003788a1: mov rax, qword ptr [rbp - 0x340]
0x1003788a8: mov qword ptr [rbp - 0xc8], rax
0x1003788af: mov rdi, r12
0x1003788b2: mov rsi, r13
0x1003788b5: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1003788ba: mov qword ptr [rbp - 0x40], 0
0x1003788c2: mov dword ptr [rbp - 0x38], 0xffffffff
0x1003788c9: mov qword ptr [rbp - 0x218], r14
0x1003788d0: mov qword ptr [rbp - 0xc8], r15
0x1003788d7: lea rsi, [rip + 0x80a571] ; 0x100b82e4f Game
0x1003788de: mov edx, 1
0x1003788e3: mov rdi, r13
0x1003788e6: call 0x1007a56a0 ; 0x1007a56a0
0x1003788eb: lea rsi, [rip + 0x80b2ea] ; 0x100b83bdc LevelParameters not found, defaulting to WorldEmpty
0x1003788f2: lea rdi, [rbp - 0x218]
0x1003788f9: mov edx, 0x33
0x1003788fe: call 0x100011930 ; 0x100011930
0x100378903: mov qword ptr [rbp - 0x218], r14
0x10037890a: mov qword ptr [rbp - 0xc8], r15
0x100378911: mov rdi, r13
0x100378914: call 0x1007a58d0 ; 0x1007a58d0
0x100378919: lea rdi, [rbp - 0x218]
0x100378920: mov rsi, qword ptr [rbp - 0x328]
0x100378927: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10037892c: mov rdi, r12
0x10037892f: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100378934: lea r15, [rbx + 0x13b8]
0x10037893b: lea rsi, [rip + 0x802b0d] ; 0x100b7b44f WorldEmpty
0x100378942: mov edx, 0x20
0x100378947: mov rdi, r15
0x10037894a: call 0x100aa2c78 ; 0x100aa2c78 _strlcpy
0x10037894f: mov r12, qword ptr [rbp - 0x348]
0x100378956: jmp 0x10037896c ; 0x10037896c
0x100378958: mov rsi, qword ptr [rsi + 0xe8]
0x10037895f: mov edx, 0x20
0x100378964: mov rdi, r15
0x100378967: call 0x100aa2c78 ; 0x100aa2c78 _strlcpy
0x10037896c: lea rdi, [rip + 0x80b29d] ; 0x100b83c10 CurrentLevel
0x100378973: mov rsi, r12
0x100378976: call 0x100780960 ; 0x100780960
0x10037897b: lea rdi, [rip + 0x80b29b] ; 0x100b83c1d CurrentWorld
0x100378982: mov rsi, r15
0x100378985: call 0x100780960 ; 0x100780960
0x10037898a: mov rax, qword ptr [rbx + 0x338]
0x100378991: mov byte ptr [rax + 0x8f34], 0
0x100378998: mov rdi, qword ptr [rbx + 0x1068]
0x10037899f: mov edx, dword ptr [rbx + 0x1560]
0x1003789a5: lea rsi, [rip + 0x80ae99] ; 0x100b83845 OnLevelLoadEarly
0x1003789ac: xor ecx, ecx
0x1003789ae: call 0x1007b1b40 ; 0x1007b1b40
0x1003789b3: mov rdi, qword ptr [rbx + 0x1068]
0x1003789ba: mov edx, dword ptr [rbx + 0x1560]
0x1003789c0: lea rsi, [rip + 0x7e807e] ; 0x100b60a45 OnLevelLoad
0x1003789c7: xor ecx, ecx
0x1003789c9: call 0x1007b1b40 ; 0x1007b1b40
0x1003789ce: mov rdi, qword ptr [rbx + 0x1068]
0x1003789d5: mov edx, dword ptr [rbx + 0x1560]
0x1003789db: lea rsi, [rip + 0x7ec328] ; 0x100b64d0a OnLevelLoadLate
0x1003789e2: xor ecx, ecx
0x1003789e4: call 0x1007b1b40 ; 0x1007b1b40
0x1003789e9: mov rax, qword ptr [rbx + 0xa0]
0x1003789f0: mov byte ptr [rax + 0x20], 1
0x1003789f4: call 0x100793130 ; 0x100793130
0x1003789f9: call 0x1007a5960 ; 0x1007a5960
0x1003789fe: movsx edi, al
0x100378a01: call 0x1007a5ac0 ; 0x1007a5ac0
0x100378a06: mov rax, qword ptr [rip + 0x894ecb] ; 0x100c0d8d8
0x100378a0d: mov rax, qword ptr [rax]
0x100378a10: cmp rax, qword ptr [rbp - 0x30]
0x100378a14: jne 0x100378a28
0x100378a16: add rsp, 0x328
0x100378a1d: pop rbx
0x100378a1e: pop r12
0x100378a20: pop r13
0x100378a22: pop r14
0x100378a24: pop r15
0x100378a26: pop rbp
0x100378a27: ret 
0x100378a28: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100378a2d: lea rdi, [rip + 0x80b108] ; 0x100b83b3c strlen( levelName ) < kLevelNameMaxLength
0x100378a34: lea rsi, [rip + 0x80a436] ; 0x100b82e71 Game.cpp
0x100378a3b: mov edx, 0x5c5
0x100378a40: mov ecx, 3
0x100378a45: call 0x1007e5f70 ; 0x1007e5f70
0x100378a4a: ud2 
0x100378a4c: jmp 0x100378a63 ; 0x100378a63
0x100378a4e: jmp 0x100378a7e ; 0x100378a7e
0x100378a50: mov rbx, rax
0x100378a53: mov rdi, r12
0x100378a56: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100378a5b: mov rdi, rbx
0x100378a5e: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100378a63: mov rbx, rax
0x100378a66: mov qword ptr [rbp - 0x218], r14
0x100378a6d: mov qword ptr [rbp - 0xc8], r15
0x100378a74: mov rdi, r13
0x100378a77: call 0x1007a58d0 ; 0x1007a58d0
0x100378a7c: jmp 0x100378a81 ; 0x100378a81
0x100378a7e: mov rbx, rax
0x100378a81: lea rdi, [rbp - 0x218]
0x100378a88: mov rsi, qword ptr [rbp - 0x328]
0x100378a8f: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x100378a94: mov rdi, r12
0x100378a97: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100378a9c: mov rdi, rbx
0x100378a9f: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100378aa4: mov rbx, rax
0x100378aa7: mov rdi, r12
0x100378aaa: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100378aaf: mov rdi, rbx
0x100378ab2: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100378ab7: mov rbx, rax
0x100378aba: jmp 0x100378b1f ; 0x100378b1f
0x100378abc: mov rbx, rax
0x100378abf: jmp 0x100378b32 ; 0x100378b32
0x100378ac1: mov rbx, rax
0x100378ac4: mov rax, qword ptr [rbp - 0x330]
0x100378acb: mov qword ptr [rbp - 0x218], rax
0x100378ad2: mov qword ptr [rbp - 0xc8], r15
0x100378ad9: mov rdi, r14
0x100378adc: call 0x1007a58d0 ; 0x1007a58d0
0x100378ae1: jmp 0x100378ae6 ; 0x100378ae6
0x100378ae3: mov rbx, rax
0x100378ae6: mov rsi, qword ptr [rip + 0x891a93] ; 0x100c0a580
0x100378aed: add rsi, 8
0x100378af1: lea rdi, [rbp - 0x218]
0x100378af8: jmp 0x100378b2d ; 0x100378b2d
0x100378afa: mov rbx, rax
0x100378afd: jmp 0x100378b32 ; 0x100378b32
0x100378aff: mov rbx, rax
0x100378b02: mov rax, qword ptr [rbp - 0x330]
0x100378b09: mov qword ptr [rbp - 0x218], rax
0x100378b10: mov qword ptr [rbp - 0xc8], r15
0x100378b17: mov rdi, r13
0x100378b1a: call 0x1007a58d0 ; 0x1007a58d0
0x100378b1f: lea rdi, [rbp - 0x218]
0x100378b26: mov rsi, qword ptr [rbp - 0x328]
0x100378b2d: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x100378b32: lea rdi, [rbp - 0xc8]
0x100378b39: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100378b3e: mov rdi, rbx
0x100378b41: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100378b46: nop word ptr cs:[rax + rax]
