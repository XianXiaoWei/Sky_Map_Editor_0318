0x100408360: push rbp
0x100408361: mov rbp, rsp
0x100408364: push r15
0x100408366: push r14
0x100408368: push r13
0x10040836a: push r12
0x10040836c: push rbx
0x10040836d: sub rsp, 0x2c8
0x100408374: mov rax, qword ptr [rip + 0x80555d] ; 0x100c0d8d8
0x10040837b: mov rax, qword ptr [rax]
0x10040837e: mov qword ptr [rbp - 0x30], rax
0x100408382: test esi, esi
0x100408384: je 0x1004088cb
0x10040838a: mov eax, esi
0x10040838c: xor ebx, ebx
0x10040838e: mov qword ptr [rbp - 0x2c0], rax
0x100408395: mov qword ptr [rbp - 0x2a8], rdi
0x10040839c: nop dword ptr [rax]
0x1004083a0: imul r12, rbx, 0x6f0
0x1004083a7: cmp byte ptr [rdi + r12 + 0x20], 0
0x1004083ad: je 0x1004083c0
0x1004083af: inc rbx
0x1004083b2: cmp rbx, rax
0x1004083b5: jb 0x1004083a0
0x1004083b7: jmp 0x1004088cb ; 0x1004088cb
0x1004083bc: nop dword ptr [rax]
0x1004083c0: mov r15, rdi
0x1004083c3: call 0x10043fb50 ; 0x10043fb50
0x1004083c8: movzx esi, byte ptr [r15 + r12 + 0x21]
0x1004083ce: mov rdi, rax
0x1004083d1: call 0x1004434f0 ; 0x1004434f0
0x1004083d6: mov qword ptr [rbp - 0x288], rax
0x1004083dd: mov r14, qword ptr [rax + 8]
0x1004083e1: vxorps xmm0, xmm0, xmm0
0x1004083e5: vmovaps xmmword ptr [rbp - 0x2a0], xmm0
0x1004083ed: mov qword ptr [rbp - 0x290], 0
0x1004083f8: mov rdi, r14
0x1004083fb: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x100408400: mov r13, rax
0x100408403: cmp r13, 0xff1
0x10040840a: jae 0x100408911
0x100408410: cmp r13, 0x17
0x100408414: mov qword ptr [rbp - 0x2c8], rbx
0x10040841b: jae 0x100408436
0x10040841d: mov eax, r13d
0x100408420: add al, al
0x100408422: mov byte ptr [rbp - 0x2a0], al
0x100408428: lea r15, [rbp - 0x29f]
0x10040842f: test r13, r13
0x100408432: jne 0x100408473
0x100408434: jmp 0x100408481 ; 0x100408481
0x100408436: mov rbx, r12
0x100408439: mov r12, r13
0x10040843c: add r12, 0x10
0x100408440: and r12, 0xfffffffffffffff0
0x100408444: call 0x1007e50d0 ; 0x1007e50d0
0x100408449: mov rdi, rax
0x10040844c: mov rsi, r12
0x10040844f: call 0x1007e5790 ; 0x1007e5790
0x100408454: mov r15, rax
0x100408457: mov qword ptr [rbp - 0x290], r15
0x10040845e: or r12, 1
0x100408462: mov qword ptr [rbp - 0x2a0], r12
0x100408469: mov r12, rbx
0x10040846c: mov qword ptr [rbp - 0x298], r13
0x100408473: mov rdi, r15
0x100408476: mov rsi, r14
0x100408479: mov rdx, r13
0x10040847c: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x100408481: mov byte ptr [r15 + r13], 0
0x100408486: movzx eax, byte ptr [rbp - 0x2a0]
0x10040848d: test al, 1
0x10040848f: jne 0x10040849e
0x100408491: mov rcx, rax
0x100408494: shr rcx, 1
0x100408497: mov esi, 0x16
0x10040849c: jmp 0x1004084b3 ; 0x1004084b3
0x10040849e: mov rsi, qword ptr [rbp - 0x2a0]
0x1004084a5: mov rcx, qword ptr [rbp - 0x298]
0x1004084ac: and rsi, 0xfffffffffffffffe
0x1004084b0: dec rsi
0x1004084b3: mov rdx, rsi
0x1004084b6: sub rdx, rcx
0x1004084b9: cmp rdx, 4
0x1004084bd: jae 0x1004084f2
0x1004084bf: mov edx, 4
0x1004084c4: sub rdx, rsi
0x1004084c7: add rdx, rcx
0x1004084ca: lea rax, [rip + 0x75dd71] ; 0x100b66242 Mesh
0x1004084d1: mov qword ptr [rsp + 8], rax
0x1004084d6: mov qword ptr [rsp], 4
0x1004084de: xor r9d, r9d
0x1004084e1: lea rdi, [rbp - 0x2a0]
0x1004084e8: mov r8, rcx
0x1004084eb: call 0x1000198c0 ; 0x1000198c0
0x1004084f0: jmp 0x100408531 ; 0x100408531
0x1004084f2: test al, 1
0x1004084f4: mov rax, qword ptr [rbp - 0x290]
0x1004084fb: lea rdx, [rbp - 0x29f]
0x100408502: cmove rax, rdx
0x100408506: mov dword ptr [rax + rcx], 0x6873654d
0x10040850d: add rcx, 4
0x100408511: test byte ptr [rbp - 0x2a0], 1
0x100408518: jne 0x100408526
0x10040851a: mov edx, ecx
0x10040851c: add dl, dl
0x10040851e: mov byte ptr [rbp - 0x2a0], dl
0x100408524: jmp 0x10040852d ; 0x10040852d
0x100408526: mov qword ptr [rbp - 0x298], rcx
0x10040852d: mov byte ptr [rax + rcx], 0
0x100408531: mov r14b, byte ptr [rbp - 0x2a0]
0x100408538: lea rax, [rbp - 0x29f]
0x10040853f: mov rcx, rax
0x100408542: mov rax, qword ptr [rcx]
0x100408545: mov rcx, qword ptr [rcx + 7]
0x100408549: mov qword ptr [rbp - 0x280], rax
0x100408550: mov qword ptr [rbp - 0x279], rcx
0x100408557: mov r15, qword ptr [rbp - 0x290]
0x10040855e: vxorps xmm0, xmm0, xmm0
0x100408562: vmovaps xmmword ptr [rbp - 0x2a0], xmm0
0x10040856a: mov qword ptr [rbp - 0x290], 0
0x100408575: mov rcx, qword ptr [rbp - 0x2a8]
0x10040857c: lea rbx, [rcx + r12 + 0x28]
0x100408581: test byte ptr [rcx + r12 + 0x28], 1
0x100408587: jne 0x100408590
0x100408589: mov word ptr [rbx], 0
0x10040858e: jmp 0x1004085a1 ; 0x1004085a1
0x100408590: mov rax, qword ptr [rcx + r12 + 0x38]
0x100408595: mov byte ptr [rax], 0
0x100408598: mov qword ptr [rcx + r12 + 0x30], 0
0x1004085a1: xor esi, esi
0x1004085a3: mov rdi, rbx
0x1004085a6: call 0x100018080 ; 0x100018080
0x1004085ab: mov byte ptr [rbx], r14b
0x1004085ae: mov rax, qword ptr [rbp - 0x280]
0x1004085b5: mov rcx, qword ptr [rbp - 0x279]
0x1004085bc: mov qword ptr [rbx + 1], rax
0x1004085c0: mov qword ptr [rbx + 8], rcx
0x1004085c4: mov rax, qword ptr [rbp - 0x2a8]
0x1004085cb: mov qword ptr [rax + r12 + 0x38], r15
0x1004085d0: mov r14, rax
0x1004085d3: mov qword ptr [rbp - 0x279], 0
0x1004085de: mov qword ptr [rbp - 0x280], 0
0x1004085e9: test byte ptr [rbp - 0x2a0], 1
0x1004085f0: je 0x100408609
0x1004085f2: mov rbx, qword ptr [rbp - 0x290]
0x1004085f9: call 0x1007e50d0 ; 0x1007e50d0
0x1004085fe: mov rdi, rax
0x100408601: mov rsi, rbx
0x100408604: call 0x1007e5db0 ; 0x1007e5db0
0x100408609: call 0x10043fb50 ; 0x10043fb50
0x10040860e: mov edx, 0x10
0x100408613: mov rdi, qword ptr [rbp - 0x288]
0x10040861a: lea rsi, [rbp - 0x270]
0x100408621: call 0x100443a70 ; 0x100443a70
0x100408626: mov qword ptr [rbp - 0x2b0], r12
0x10040862d: mov rdi, r14
0x100408630: mov dword ptr [rdi + r12 + 0xc0], eax
0x100408638: test eax, eax
0x10040863a: je 0x1004088b1
0x100408640: mov rax, qword ptr [rbp - 0x2b0]
0x100408647: lea rax, [rdi + rax + 0xc0]
0x10040864f: mov qword ptr [rbp - 0x2d8], rax
0x100408656: xor r12d, r12d
0x100408659: jmp 0x100408750 ; 0x100408750
0x10040865e: mov r15, rdi
0x100408661: cmp ecx, 0x64
0x100408664: jne 0x1004088f2
0x10040866a: mov r14, qword ptr [rax]
0x10040866d: mov byte ptr [r14 + 0x20], 1
0x100408672: mov rdi, qword ptr [rbp + r13 - 0x260]
0x10040867a: lea r13, [r14 + 0x40]
0x10040867e: mov qword ptr [rbp - 0x288], rdi
0x100408685: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x10040868a: mov rbx, rax
0x10040868d: movzx ecx, byte ptr [r14 + 0x40]
0x100408692: test cl, 1
0x100408695: jne 0x1004086b4
0x100408697: mov esi, 0x16
0x10040869c: mov rdx, rbx
0x10040869f: sub rdx, rsi
0x1004086a2: ja 0x1004086c7
0x1004086a4: test cl, 1
0x1004086a7: jne 0x1004086d1
0x1004086a9: lea r15, [r13 + 1]
0x1004086ad: test rbx, rbx
0x1004086b0: jne 0x1004086da
0x1004086b2: jmp 0x1004086ec ; 0x1004086ec
0x1004086b4: mov rsi, qword ptr [r13]
0x1004086b8: and rsi, 0xfffffffffffffffe
0x1004086bc: dec rsi
0x1004086bf: mov rdx, rbx
0x1004086c2: sub rdx, rsi
0x1004086c5: jbe 0x1004086a4
0x1004086c7: test cl, 1
0x1004086ca: jne 0x10040870a
0x1004086cc: shr rcx, 1
0x1004086cf: jmp 0x10040870e ; 0x10040870e
0x1004086d1: mov r15, qword ptr [r14 + 0x50]
0x1004086d5: test rbx, rbx
0x1004086d8: je 0x1004086ec
0x1004086da: mov rdi, r15
0x1004086dd: mov rsi, qword ptr [rbp - 0x288]
0x1004086e4: mov rdx, rbx
0x1004086e7: call 0x100aa28fa ; 0x100aa28fa _memmove
0x1004086ec: mov byte ptr [r15 + rbx], 0
0x1004086f1: test byte ptr [r13], 1
0x1004086f6: jne 0x100408734
0x1004086f8: add bl, bl
0x1004086fa: mov byte ptr [r13], bl
0x1004086fe: mov rdi, qword ptr [rbp - 0x2a8]
0x100408705: jmp 0x10040889e ; 0x10040889e
0x10040870a: mov rcx, qword ptr [r14 + 0x48]
0x10040870e: mov rax, qword ptr [rbp - 0x288]
0x100408715: mov qword ptr [rsp + 8], rax
0x10040871a: mov qword ptr [rsp], rbx
0x10040871e: xor r8d, r8d
0x100408721: mov rdi, r13
0x100408724: mov r9, rcx
0x100408727: call 0x1000198c0 ; 0x1000198c0
0x10040872c: mov rdi, r15
0x10040872f: jmp 0x10040889e ; 0x10040889e
0x100408734: mov qword ptr [r14 + 0x48], rbx
0x100408738: mov rdi, qword ptr [rbp - 0x2a8]
0x10040873f: jmp 0x10040889e ; 0x10040889e
0x100408744: nop word ptr cs:[rax + rax]
0x100408750: mov r12d, r12d
0x100408753: mov r13, r12
0x100408756: shl r13, 5
0x10040875a: mov rcx, qword ptr [rbp + r13 - 0x270]
0x100408762: mov rax, qword ptr [rbp - 0x2b0]
0x100408769: lea rax, [rdi + rax]
0x10040876d: mov qword ptr [rbp - 0x288], rax
0x100408774: mov r14, qword ptr [rax + r12*8 + 0x40]
0x100408779: lea r15, [r14 + 8]
0x10040877d: mov qword ptr [rbp - 0x2b8], rcx
0x100408784: mov rdi, rcx
0x100408787: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x10040878c: mov rbx, rax
0x10040878f: movzx ecx, byte ptr [r14 + 8]
0x100408794: test cl, 1
0x100408797: jne 0x1004087a0
0x100408799: mov esi, 0x16
0x10040879e: jmp 0x1004087aa ; 0x1004087aa
0x1004087a0: mov rsi, qword ptr [r15]
0x1004087a3: and rsi, 0xfffffffffffffffe
0x1004087a7: dec rsi
0x1004087aa: mov rdi, r15
0x1004087ad: mov rdx, rbx
0x1004087b0: sub rdx, rsi
0x1004087b3: jbe 0x1004087c0
0x1004087b5: test cl, 1
0x1004087b8: jne 0x1004087d0
0x1004087ba: shr rcx, 1
0x1004087bd: jmp 0x1004087d4 ; 0x1004087d4
0x1004087bf: nop 
0x1004087c0: test cl, 1
0x1004087c3: jne 0x100408800
0x1004087c5: lea r15, [rdi + 1]
0x1004087c9: test rbx, rbx
0x1004087cc: jne 0x100408809
0x1004087ce: jmp 0x100408829 ; 0x100408829
0x1004087d0: mov rcx, qword ptr [r14 + 0x10]
0x1004087d4: mov r14, qword ptr [rbp - 0x288]
0x1004087db: mov rax, qword ptr [rbp - 0x2b8]
0x1004087e2: mov qword ptr [rsp + 8], rax
0x1004087e7: mov qword ptr [rsp], rbx
0x1004087eb: xor r8d, r8d
0x1004087ee: mov r9, rcx
0x1004087f1: call 0x1000198c0 ; 0x1000198c0
0x1004087f6: mov rdi, qword ptr [rbp - 0x2a8]
0x1004087fd: jmp 0x100408852 ; 0x100408852
0x1004087ff: nop 
0x100408800: mov r15, qword ptr [r14 + 0x18]
0x100408804: test rbx, rbx
0x100408807: je 0x100408829
0x100408809: mov qword ptr [rbp - 0x2d0], rdi
0x100408810: mov rdi, r15
0x100408813: mov rsi, qword ptr [rbp - 0x2b8]
0x10040881a: mov rdx, rbx
0x10040881d: call 0x100aa28fa ; 0x100aa28fa _memmove
0x100408822: mov rdi, qword ptr [rbp - 0x2d0]
0x100408829: mov byte ptr [r15 + rbx], 0
0x10040882e: test byte ptr [rdi], 1
0x100408831: jne 0x100408840
0x100408833: add bl, bl
0x100408835: mov byte ptr [rdi], bl
0x100408837: jmp 0x100408844 ; 0x100408844
0x100408839: nop dword ptr [rax]
0x100408840: mov qword ptr [r14 + 0x10], rbx
0x100408844: mov rdi, qword ptr [rbp - 0x2a8]
0x10040884b: mov r14, qword ptr [rbp - 0x288]
0x100408852: lea rax, [r14 + r12*8 + 0x40]
0x100408857: mov ecx, dword ptr [rbp + r13 - 0x268]
0x10040885f: lea edx, [rcx - 1]
0x100408862: cmp edx, 8
0x100408865: jae 0x10040865e
0x10040886b: mov rax, qword ptr [rax]
0x10040886e: mov byte ptr [rax + 0x20], 0
0x100408872: mov ecx, dword ptr [rbp + r13 - 0x260]
0x10040887a: mov dword ptr [rax + 0x30], ecx
0x10040887d: mov ecx, dword ptr [rbp + r13 - 0x25c]
0x100408885: mov dword ptr [rax + 0x34], ecx
0x100408888: mov ecx, dword ptr [rbp + r13 - 0x258]
0x100408890: mov dword ptr [rax + 0x38], ecx
0x100408893: mov ecx, dword ptr [rbp + r13 - 0x254]
0x10040889b: mov dword ptr [rax + 0x3c], ecx
0x10040889e: inc r12d
0x1004088a1: mov rax, qword ptr [rbp - 0x2d8]
0x1004088a8: cmp r12d, dword ptr [rax]
0x1004088ab: jb 0x100408750
0x1004088b1: mov rax, qword ptr [rbp - 0x2c0]
0x1004088b8: mov rbx, qword ptr [rbp - 0x2c8]
0x1004088bf: inc rbx
0x1004088c2: cmp rbx, rax
0x1004088c5: jb 0x1004083a0
0x1004088cb: mov rax, qword ptr [rip + 0x805006] ; 0x100c0d8d8
0x1004088d2: mov rax, qword ptr [rax]
0x1004088d5: cmp rax, qword ptr [rbp - 0x30]
0x1004088d9: jne 0x1004088ed
0x1004088db: add rsp, 0x2c8
0x1004088e2: pop rbx
0x1004088e3: pop r12
0x1004088e5: pop r13
0x1004088e7: pop r14
0x1004088e9: pop r15
0x1004088eb: pop rbp
0x1004088ec: ret 
0x1004088ed: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1004088f2: lea rdi, [rip + 0x79a733] ; 0x100ba302c false
0x1004088f9: lea rsi, [rip + 0x77ef2e] ; 0x100b8782e LevelModel.cpp
0x100408900: mov edx, 0x8b
0x100408905: mov ecx, 3
0x10040890a: call 0x1007e5f70 ; 0x1007e5f70
0x10040890f: ud2 
0x100408911: lea rdi, [rbp - 0x2a0]
0x100408918: call 0x100aa230c ; 0x100aa230c __ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv
0x10040891d: mov rbx, rax
0x100408920: test byte ptr [rbp - 0x2a0], 1
0x100408927: je 0x100408940
0x100408929: mov r14, qword ptr [rbp - 0x290]
0x100408930: call 0x1007e50d0 ; 0x1007e50d0
0x100408935: mov rdi, rax
0x100408938: mov rsi, r14
0x10040893b: call 0x1007e5db0 ; 0x1007e5db0
0x100408940: mov rdi, rbx
0x100408943: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100408948: mov rdi, rax
0x10040894b: call 0x100011bf0 ; 0x100011bf0
0x100408950: mov rdi, rax
0x100408953: call 0x100011bf0 ; 0x100011bf0
0x100408958: mov rdi, rax
0x10040895b: call 0x100011bf0 ; 0x100011bf0
