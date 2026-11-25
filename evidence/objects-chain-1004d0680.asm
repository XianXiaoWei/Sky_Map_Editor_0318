0x1004d0680: push rbp
0x1004d0681: mov rbp, rsp
0x1004d0684: push r15
0x1004d0686: push r14
0x1004d0688: push r13
0x1004d068a: push r12
0x1004d068c: push rbx
0x1004d068d: sub rsp, 0xa8
0x1004d0694: mov qword ptr [rbp - 0x48], rdi
0x1004d0698: mov rax, qword ptr [rdi + 0x10]
0x1004d069c: test rax, rax
0x1004d069f: je 0x1004d0b33
0x1004d06a5: mov edi, dword ptr [rax]
0x1004d06a7: call 0x1007abd30 ; 0x1007abd30
0x1004d06ac: mov rcx, qword ptr [rax]
0x1004d06af: mov rdi, rax
0x1004d06b2: call qword ptr [rcx + 0x68]
0x1004d06b5: test rax, rax
0x1004d06b8: jne 0x1004d06bf
0x1004d06ba: call 0x1007abc60 ; 0x1007abc60
0x1004d06bf: mov rcx, qword ptr [rax + 0x48]
0x1004d06c3: mov rsi, qword ptr [rcx]
0x1004d06c6: add rcx, 8
0x1004d06ca: cmp rsi, rcx
0x1004d06cd: je 0x1004d0a64
0x1004d06d3: mov rcx, qword ptr [rbp - 0x48]
0x1004d06d7: lea rdx, [rcx + 0x10]
0x1004d06db: mov qword ptr [rbp - 0x78], rdx
0x1004d06df: lea rbx, [rcx + 0x18]
0x1004d06e3: lea rcx, [rcx + 0x20]
0x1004d06e7: mov qword ptr [rbp - 0x70], rcx
0x1004d06eb: lea r15, [rip + 0x6a69d6] ; 0x100b770c8 ObjectFactory_CreatesType
0x1004d06f2: mov qword ptr [rbp - 0x38], rax
0x1004d06f6: mov qword ptr [rbp - 0x68], rbx
0x1004d06fa: nop word ptr [rax + rax]
0x1004d0700: mov qword ptr [rbp - 0x58], rsi
0x1004d0704: mov rax, qword ptr [rsi + 0x28]
0x1004d0708: mov qword ptr [rbp - 0x80], rax
0x1004d070c: call qword ptr [rax + 0x28]
0x1004d070f: mov rcx, qword ptr [rax]
0x1004d0712: mov rdi, rax
0x1004d0715: call qword ptr [rcx + 0x68]
0x1004d0718: mov qword ptr [rbp - 0x40], rax
0x1004d071c: test rax, rax
0x1004d071f: je 0x1004d09f8
0x1004d0725: mov rax, qword ptr [rbp - 0x40]
0x1004d0729: mov rax, qword ptr [rax + 0x50]
0x1004d072d: mov rdx, qword ptr [rax]
0x1004d0730: add rax, 8
0x1004d0734: cmp rdx, rax
0x1004d0737: je 0x1004d09f8
0x1004d073d: nop dword ptr [rax]
0x1004d0740: mov qword ptr [rbp - 0x60], rdx
0x1004d0744: mov rax, qword ptr [rdx + 0x28]
0x1004d0748: mov qword ptr [rbp - 0x88], rax
0x1004d074f: mov r12, qword ptr [rax + 8]
0x1004d0753: test r12, r12
0x1004d0756: jne 0x1004d076e
0x1004d0758: jmp 0x1004d09a0 ; 0x1004d09a0
0x1004d075d: nop dword ptr [rax]
0x1004d0760: mov r12, qword ptr [r12 + 0x10]
0x1004d0765: test r12, r12
0x1004d0768: je 0x1004d09a0
0x1004d076e: mov rbx, qword ptr [r12]
0x1004d0772: mov rdi, rbx
0x1004d0775: mov rsi, r15
0x1004d0778: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1004d077d: mov r14d, eax
0x1004d0780: mov rdi, rbx
0x1004d0783: lea rsi, [rip + 0x6a696a] ; 0x100b770f4 ObjectFactory_ReleasesType
0x1004d078a: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1004d078f: mov r13d, eax
0x1004d0792: test r14d, r14d
0x1004d0795: je 0x1004d079c
0x1004d0797: test r13d, r13d
0x1004d079a: jne 0x1004d0760
0x1004d079c: mov dword ptr [rbp - 0x2c], r14d
0x1004d07a0: mov rdi, qword ptr [r12 + 8]
0x1004d07a5: xor esi, esi
0x1004d07a7: call 0x1007abc80 ; 0x1007abc80
0x1004d07ac: mov r14, rax
0x1004d07af: test r14, r14
0x1004d07b2: je 0x1004d0a76
0x1004d07b8: mov rbx, qword ptr [rbp - 0x70]
0x1004d07bc: mov rax, qword ptr [rbx]
0x1004d07bf: test rax, rax
0x1004d07c2: mov qword ptr [rbp - 0x50], r12
0x1004d07c6: je 0x1004d07f7
0x1004d07c8: mov r15, rbx
0x1004d07cb: nop dword ptr [rax + rax]
0x1004d07d0: lea rcx, [rax + 8]
0x1004d07d4: cmp qword ptr [rax + 0x20], r14
0x1004d07d8: cmovae rcx, rax
0x1004d07dc: cmovae r15, rax
0x1004d07e0: mov rax, qword ptr [rcx]
0x1004d07e3: test rax, rax
0x1004d07e6: jne 0x1004d07d0
0x1004d07e8: cmp r15, rbx
0x1004d07eb: je 0x1004d07f7
0x1004d07ed: cmp r14, qword ptr [r15 + 0x20]
0x1004d07f1: jae 0x1004d08ad
0x1004d07f7: call 0x1007abbf0 ; 0x1007abbf0
0x1004d07fc: mov qword ptr [rbp - 0xc0], r14
0x1004d0803: mov qword ptr [rbp - 0xb8], 0
0x1004d080e: mov qword ptr [rbp - 0xb0], rax
0x1004d0815: lea rax, [rbp - 0xa8]
0x1004d081c: vxorps xmm0, xmm0, xmm0
0x1004d0820: vmovups xmmword ptr [rax], xmm0
0x1004d0824: mov r13, qword ptr [rbp - 0x68]
0x1004d0828: mov rdi, r13
0x1004d082b: mov rsi, rbx
0x1004d082e: lea rdx, [rbp - 0x98]
0x1004d0835: lea rcx, [rbp - 0xc8]
0x1004d083c: lea r8, [rbp - 0xc0]
0x1004d0843: call 0x1004d1990 ; 0x1004d1990
0x1004d0848: mov rbx, rax
0x1004d084b: mov r15, qword ptr [rbx]
0x1004d084e: test r15, r15
0x1004d0851: jne 0x1004d08f2
0x1004d0857: mov edi, 0x48
0x1004d085c: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1004d0861: mov r15, rax
0x1004d0864: mov rax, qword ptr [rbp - 0xc0]
0x1004d086b: mov qword ptr [r15 + 0x20], rax
0x1004d086f: lea rax, [rbp - 0xa8]
0x1004d0876: vmovups ymm0, ymmword ptr [rax - 0x10]
0x1004d087b: vmovups ymmword ptr [r15 + 0x28], ymm0
0x1004d0881: mov rax, qword ptr [rbp - 0x98]
0x1004d0888: vxorps xmm0, xmm0, xmm0
0x1004d088c: vmovups xmmword ptr [r15], xmm0
0x1004d0891: mov qword ptr [r15 + 0x10], rax
0x1004d0895: mov qword ptr [rbx], r15
0x1004d0898: mov rax, qword ptr [r13]
0x1004d089c: mov rax, qword ptr [rax]
0x1004d089f: test rax, rax
0x1004d08a2: je 0x1004d08db
0x1004d08a4: mov qword ptr [r13], rax
0x1004d08a8: mov rsi, qword ptr [rbx]
0x1004d08ab: jmp 0x1004d08de ; 0x1004d08de
0x1004d08ad: cmp dword ptr [rbp - 0x2c], 0
0x1004d08b1: sete al
0x1004d08b4: cmp qword ptr [r15 + 0x38], 0
0x1004d08b9: setne cl
0x1004d08bc: xor cl, al
0x1004d08be: je 0x1004d0ae7
0x1004d08c4: test r13d, r13d
0x1004d08c7: sete al
0x1004d08ca: cmp qword ptr [r15 + 0x40], 0
0x1004d08cf: setne cl
0x1004d08d2: xor cl, al
0x1004d08d4: jne 0x1004d08f2
0x1004d08d6: jmp 0x1004d0b07 ; 0x1004d0b07
0x1004d08db: mov rsi, r15
0x1004d08de: mov rbx, qword ptr [rbp - 0x48]
0x1004d08e2: mov rdi, qword ptr [rbx + 0x20]
0x1004d08e6: vzeroupper 
0x1004d08e9: call 0x1001a7bb0 ; 0x1001a7bb0
0x1004d08ee: inc qword ptr [rbx + 0x28]
0x1004d08f2: call 0x1007abc10 ; 0x1007abc10
0x1004d08f7: mov rbx, rax
0x1004d08fa: mov r12, qword ptr [rbp - 0x80]
0x1004d08fe: call qword ptr [r12 + 0x30]
0x1004d0903: mov r13, rax
0x1004d0906: mov rax, qword ptr [r13]
0x1004d090a: mov rax, qword ptr [rax + 0xe0]
0x1004d0911: mov qword ptr [rbp - 0x90], rax
0x1004d0918: mov rax, qword ptr [rbx]
0x1004d091b: mov rdi, rbx
0x1004d091e: call qword ptr [rax + 0x68]
0x1004d0921: mov rcx, qword ptr [r12 + 0x20]
0x1004d0926: mov rdi, r13
0x1004d0929: mov rsi, qword ptr [rbp - 0x78]
0x1004d092d: mov rdx, rax
0x1004d0930: call qword ptr [rbp - 0x90]
0x1004d0936: mov rcx, r12
0x1004d0939: cmp qword ptr [rcx + 0x38], -1
0x1004d093e: je 0x1004d0958
0x1004d0940: cmp qword ptr [rcx + 0x48], 0
0x1004d0945: mov r12, qword ptr [rbp - 0x50]
0x1004d0949: jne 0x1004d095c
0x1004d094b: mov rax, qword ptr [rax]
0x1004d094e: test rax, rax
0x1004d0951: jne 0x1004d095c
0x1004d0953: jmp 0x1004d0aba ; 0x1004d0aba
0x1004d0958: mov r12, qword ptr [rbp - 0x50]
0x1004d095c: xor ebx, ebx
0x1004d095e: cmp dword ptr [rbp - 0x2c], 0
0x1004d0962: setne bl
0x1004d0965: mov qword ptr [r15 + 0x28], rax
0x1004d0969: call qword ptr [rcx + 0x28]
0x1004d096c: mov qword ptr [r15 + 0x30], rax
0x1004d0970: mov rax, qword ptr [rbp - 0x88]
0x1004d0977: mov qword ptr [r15 + rbx*8 + 0x38], rax
0x1004d097c: mov rax, qword ptr [r15 + 0x38]
0x1004d0980: cmp rax, qword ptr [r15 + 0x40]
0x1004d0984: lea r15, [rip + 0x6a673d] ; 0x100b770c8 ObjectFactory_CreatesType
0x1004d098b: jne 0x1004d0760
0x1004d0991: jmp 0x1004d0a9a ; 0x1004d0a9a
0x1004d0996: nop word ptr cs:[rax + rax]
0x1004d09a0: mov rdx, qword ptr [rbp - 0x60]
0x1004d09a4: mov rcx, qword ptr [rdx + 8]
0x1004d09a8: test rcx, rcx
0x1004d09ab: je 0x1004d09c0
0x1004d09ad: nop dword ptr [rax]
0x1004d09b0: mov rax, rcx
0x1004d09b3: mov rcx, qword ptr [rax]
0x1004d09b6: test rcx, rcx
0x1004d09b9: jne 0x1004d09b0
0x1004d09bb: jmp 0x1004d09e0 ; 0x1004d09e0
0x1004d09bd: nop dword ptr [rax]
0x1004d09c0: mov rax, qword ptr [rdx + 0x10]
0x1004d09c4: cmp qword ptr [rax], rdx
0x1004d09c7: je 0x1004d09e0
0x1004d09c9: add rdx, 0x10
0x1004d09cd: nop dword ptr [rax]
0x1004d09d0: mov rcx, qword ptr [rdx]
0x1004d09d3: mov rax, qword ptr [rcx + 0x10]
0x1004d09d7: cmp qword ptr [rax], rcx
0x1004d09da: lea rdx, [rcx + 0x10]
0x1004d09de: jne 0x1004d09d0
0x1004d09e0: mov rcx, qword ptr [rbp - 0x40]
0x1004d09e4: mov rcx, qword ptr [rcx + 0x50]
0x1004d09e8: add rcx, 8
0x1004d09ec: mov rdx, rax
0x1004d09ef: cmp rax, rcx
0x1004d09f2: jne 0x1004d0740
0x1004d09f8: mov rsi, qword ptr [rbp - 0x58]
0x1004d09fc: mov rcx, qword ptr [rsi + 8]
0x1004d0a00: test rcx, rcx
0x1004d0a03: je 0x1004d0a20
0x1004d0a05: mov rax, qword ptr [rbp - 0x38]
0x1004d0a09: nop dword ptr [rax]
0x1004d0a10: mov rdx, rcx
0x1004d0a13: mov rcx, qword ptr [rdx]
0x1004d0a16: test rcx, rcx
0x1004d0a19: jne 0x1004d0a10
0x1004d0a1b: jmp 0x1004d0a50 ; 0x1004d0a50
0x1004d0a1d: nop dword ptr [rax]
0x1004d0a20: mov rdx, qword ptr [rsi + 0x10]
0x1004d0a24: cmp qword ptr [rdx], rsi
0x1004d0a27: mov rax, qword ptr [rbp - 0x38]
0x1004d0a2b: je 0x1004d0a50
0x1004d0a2d: add rsi, 0x10
0x1004d0a31: nop word ptr cs:[rax + rax]
0x1004d0a40: mov rcx, qword ptr [rsi]
0x1004d0a43: mov rdx, qword ptr [rcx + 0x10]
0x1004d0a47: cmp qword ptr [rdx], rcx
0x1004d0a4a: lea rsi, [rcx + 0x10]
0x1004d0a4e: jne 0x1004d0a40
0x1004d0a50: mov rcx, qword ptr [rax + 0x48]
0x1004d0a54: add rcx, 8
0x1004d0a58: mov rsi, rdx
0x1004d0a5b: cmp rdx, rcx
0x1004d0a5e: jne 0x1004d0700
0x1004d0a64: add rsp, 0xa8
0x1004d0a6b: pop rbx
0x1004d0a6c: pop r12
0x1004d0a6e: pop r13
0x1004d0a70: pop r14
0x1004d0a72: pop r15
0x1004d0a74: pop rbp
0x1004d0a75: ret 
0x1004d0a76: mov r9, qword ptr [r12 + 8]
0x1004d0a7b: lea rdi, [rip + 0x68d2d2] ; 0x100b5dd54 type
0x1004d0a82: lea rsi, [rip + 0x6bd219] ; 0x100b8dca2 ObjectFactory.cpp
0x1004d0a89: lea r8, [rip + 0x6bd23f] ; 0x100b8dccf Unable to find MetaClass for type: %s
0x1004d0a90: mov edx, 0x33
0x1004d0a95: jmp 0x1004d0b25 ; 0x1004d0b25
0x1004d0a9a: mov r9, qword ptr [r14 + 8]
0x1004d0a9e: lea rdi, [rip + 0x6bd2f3] ; 0x100b8dd98 itFact->second.createFun != itFact->second.releaseFun
0x1004d0aa5: lea rsi, [rip + 0x6bd1f6] ; 0x100b8dca2 ObjectFactory.cpp
0x1004d0aac: lea r8, [rip + 0x6bd31b] ; 0x100b8ddce CreateFun is the same as ReleaseFun for type %s
0x1004d0ab3: mov edx, 0x4c
0x1004d0ab8: jmp 0x1004d0b25 ; 0x1004d0b25
0x1004d0aba: mov rbx, rcx
0x1004d0abd: call qword ptr [rbx + 0x30]
0x1004d0ac0: mov r9, qword ptr [rax + 8]
0x1004d0ac4: mov rax, qword ptr [rbx]
0x1004d0ac7: mov qword ptr [rsp], rax
0x1004d0acb: lea rdi, [rip + 0x6adcb8] ; 0x100b7e78a !m_countAddress || m_staticArraySize > 0 || *(void**)v != 0
0x1004d0ad2: lea rsi, [rip + 0x68caff] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x1004d0ad9: lea r8, [rip + 0x6adce6] ; 0x100b7e7c6 %s::%s is a null array
0x1004d0ae0: mov edx, 0x40b
0x1004d0ae5: jmp 0x1004d0b25 ; 0x1004d0b25
0x1004d0ae7: mov r9, qword ptr [r14 + 8]
0x1004d0aeb: lea rdi, [rip + 0x6bd203] ; 0x100b8dcf5 createFun ^ !!itFact->second.createFun
0x1004d0af2: lea rsi, [rip + 0x6bd1a9] ; 0x100b8dca2 ObjectFactory.cpp
0x1004d0af9: lea r8, [rip + 0x6bd21c] ; 0x100b8dd1c CreateFun already registered for type %s
0x1004d0b00: mov edx, 0x3c
0x1004d0b05: jmp 0x1004d0b25 ; 0x1004d0b25
0x1004d0b07: mov r9, qword ptr [r14 + 8]
0x1004d0b0b: lea rdi, [rip + 0x6bd233] ; 0x100b8dd45 releaseFun ^ !!itFact->second.releaseFun
0x1004d0b12: lea rsi, [rip + 0x6bd189] ; 0x100b8dca2 ObjectFactory.cpp
0x1004d0b19: lea r8, [rip + 0x6bd24e] ; 0x100b8dd6e ReleaseFun already registered for type %s
0x1004d0b20: mov edx, 0x3d
0x1004d0b25: mov ecx, 4
0x1004d0b2a: xor eax, eax
0x1004d0b2c: call 0x1007e6030 ; 0x1007e6030
0x1004d0b31: ud2 
0x1004d0b33: lea rdi, [rip + 0x6bd158] ; 0x100b8dc92 m_barnContainer
0x1004d0b3a: lea rsi, [rip + 0x6bd161] ; 0x100b8dca2 ObjectFactory.cpp
0x1004d0b41: lea r8, [rip + 0x6bd16c] ; 0x100b8dcb4 Must call SetBarnContainer
0x1004d0b48: mov edx, 0x1f
0x1004d0b4d: mov ecx, 4
0x1004d0b52: xor eax, eax
0x1004d0b54: call 0x1007e6030 ; 0x1007e6030
0x1004d0b59: ud2 
0x1004d0b5b: nop dword ptr [rax + rax]
