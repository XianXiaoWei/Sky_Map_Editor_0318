0x1007b0620: push rbp
0x1007b0621: mov rbp, rsp
0x1007b0624: push r15
0x1007b0626: push r14
0x1007b0628: push r13
0x1007b062a: push r12
0x1007b062c: push rbx
0x1007b062d: sub rsp, 0xac8
0x1007b0634: mov qword ptr [rbp - 0xab8], r9
0x1007b063b: mov r14d, r8d
0x1007b063e: mov rbx, rcx
0x1007b0641: mov r15, rdi
0x1007b0644: mov rax, qword ptr [rip + 0x45d28d] ; 0x100c0d8d8
0x1007b064b: mov rax, qword ptr [rax]
0x1007b064e: mov qword ptr [rbp - 0x30], rax
0x1007b0652: mov qword ptr [rbp - 0xad8], rdx
0x1007b0659: test rsi, rsi
0x1007b065c: je 0x1007b129a
0x1007b0662: mov qword ptr [r15], rsi
0x1007b0665: mov qword ptr [r15 + 0x570], 0
0x1007b0670: cmp dword ptr [rbp + 0x10], 0
0x1007b0674: setne byte ptr [r15 + 0x578]
0x1007b067c: test rdx, rdx
0x1007b067f: je 0x1007b12b9
0x1007b0685: mov edi, dword ptr [rdx]
0x1007b0687: call 0x1007abd30 ; 0x1007abd30
0x1007b068c: mov rcx, qword ptr [rax]
0x1007b068f: mov rdi, rax
0x1007b0692: call qword ptr [rcx + 0x68]
0x1007b0695: mov r12, rax
0x1007b0698: test r12, r12
0x1007b069b: jne 0x1007b06a5
0x1007b069d: call 0x1007abc60 ; 0x1007abc60
0x1007b06a2: mov r12, rax
0x1007b06a5: mov dword ptr [rbp - 0xacc], r14d
0x1007b06ac: mov qword ptr [rbp - 0xae0], rbx
0x1007b06b3: mov rax, qword ptr [r12]
0x1007b06b7: lea rsi, [rbp - 0xad8]
0x1007b06be: mov rdi, r12
0x1007b06c1: call qword ptr [rax + 0xd8]
0x1007b06c7: lea rcx, [r15 + 8]
0x1007b06cb: mov qword ptr [r15 + 8], rax
0x1007b06cf: mov qword ptr [r15 + 0x10], rcx
0x1007b06d3: mov qword ptr [r15 + 0x18], r12
0x1007b06d7: mov dword ptr [r15 + 0x28], 0
0x1007b06df: mov rcx, qword ptr [r12 + 0x48]
0x1007b06e4: mov rbx, qword ptr [rcx]
0x1007b06e7: add rcx, 8
0x1007b06eb: xor r14d, r14d
0x1007b06ee: mov eax, 0
0x1007b06f3: cmp rbx, rcx
0x1007b06f6: mov qword ptr [rbp - 0xaa0], r15
0x1007b06fd: je 0x1007b07f5
0x1007b0703: nop word ptr cs:[rax + rax]
0x1007b0710: mov r13, r15
0x1007b0713: mov r15, qword ptr [rbx + 0x28]
0x1007b0717: call qword ptr [r15 + 0x28]
0x1007b071b: mov rcx, qword ptr [rax]
0x1007b071e: mov rdi, rax
0x1007b0721: call qword ptr [rcx + 0x68]
0x1007b0724: mov ecx, dword ptr [r13 + 0x28]
0x1007b0728: cmp rcx, 0xcc
0x1007b072f: jae 0x1007b1223
0x1007b0735: mov qword ptr [rbp + rcx*8 - 0x690], r15
0x1007b073d: test rax, rax
0x1007b0740: je 0x1007b0770
0x1007b0742: mov rdx, qword ptr [rip + 0x1897947] ; 0x102048090
0x1007b0749: cmp rax, rdx
0x1007b074c: mov r15, qword ptr [rbp - 0xaa0]
0x1007b0753: je 0x1007b0780
0x1007b0755: cmp dword ptr [rdx + 0x3c], -1
0x1007b0759: je 0x1007b0784
0x1007b075b: mov rdx, qword ptr [rdx + 0x40]
0x1007b075f: mov rax, qword ptr [rax + 0x40]
0x1007b0763: and rax, rdx
0x1007b0766: cmp rax, rdx
0x1007b0769: sete al
0x1007b076c: jmp 0x1007b0790 ; 0x1007b0790
0x1007b076e: nop 
0x1007b0770: xor eax, eax
0x1007b0772: mov r15, qword ptr [rbp - 0xaa0]
0x1007b0779: jmp 0x1007b0790 ; 0x1007b0790
0x1007b077b: nop dword ptr [rax + rax]
0x1007b0780: mov al, 1
0x1007b0782: jmp 0x1007b0790 ; 0x1007b0790
0x1007b0784: xor eax, eax
0x1007b0786: nop word ptr cs:[rax + rax]
0x1007b0790: mov byte ptr [rbp + rcx - 0x760], al
0x1007b0797: lea eax, [rcx + 1]
0x1007b079a: mov dword ptr [r15 + 0x28], eax
0x1007b079e: mov rdx, qword ptr [rbx + 8]
0x1007b07a2: test rdx, rdx
0x1007b07a5: je 0x1007b07c0
0x1007b07a7: nop word ptr [rax + rax]
0x1007b07b0: mov rcx, rdx
0x1007b07b3: mov rdx, qword ptr [rcx]
0x1007b07b6: test rdx, rdx
0x1007b07b9: jne 0x1007b07b0
0x1007b07bb: jmp 0x1007b07e0 ; 0x1007b07e0
0x1007b07bd: nop dword ptr [rax]
0x1007b07c0: mov rcx, qword ptr [rbx + 0x10]
0x1007b07c4: cmp qword ptr [rcx], rbx
0x1007b07c7: je 0x1007b07e0
0x1007b07c9: add rbx, 0x10
0x1007b07cd: nop dword ptr [rax]
0x1007b07d0: mov rdx, qword ptr [rbx]
0x1007b07d3: mov rcx, qword ptr [rdx + 0x10]
0x1007b07d7: cmp qword ptr [rcx], rdx
0x1007b07da: lea rbx, [rdx + 0x10]
0x1007b07de: jne 0x1007b07d0
0x1007b07e0: mov rdx, qword ptr [r12 + 0x48]
0x1007b07e5: add rdx, 8
0x1007b07e9: mov rbx, rcx
0x1007b07ec: cmp rcx, rdx
0x1007b07ef: jne 0x1007b0710
0x1007b07f5: mov rdi, qword ptr [r15]
0x1007b07f8: mov eax, eax
0x1007b07fa: shl rax, 3
0x1007b07fe: lea rsi, [rax + rax*4]
0x1007b0802: mov rdx, qword ptr [rip + 0x18978bf] ; 0x1020480c8
0x1007b0809: mov ecx, 0x10
0x1007b080e: call 0x100795530 ; 0x100795530
0x1007b0813: mov r13, rax
0x1007b0816: mov qword ptr [r15 + 0x20], r13
0x1007b081a: cmp dword ptr [r15 + 0x28], 0
0x1007b081f: je 0x1007b0a6a
0x1007b0825: xor ebx, ebx
0x1007b0827: mov rax, qword ptr [rip + 0x459d52] ; 0x100c0a580
0x1007b082e: add rax, 8
0x1007b0832: mov qword ptr [rbp - 0xab0], rax
0x1007b0839: nop dword ptr [rax]
0x1007b0840: mov ebx, ebx
0x1007b0842: mov qword ptr [rbp - 0xa98], rbx
0x1007b0849: mov r12, qword ptr [rbp + rbx*8 - 0x690]
0x1007b0851: call 0x1007abc10 ; 0x1007abc10
0x1007b0856: mov rbx, rax
0x1007b0859: call qword ptr [r12 + 0x30]
0x1007b085e: mov r14, rax
0x1007b0861: mov rax, qword ptr [r14]
0x1007b0864: mov r15, qword ptr [rax + 0xe0]
0x1007b086b: mov rax, qword ptr [rbx]
0x1007b086e: mov rdi, rbx
0x1007b0871: call qword ptr [rax + 0x68]
0x1007b0874: mov rcx, qword ptr [r12 + 0x20]
0x1007b0879: mov rdi, r14
0x1007b087c: lea rsi, [rbp - 0xad8]
0x1007b0883: mov rdx, rax
0x1007b0886: call r15
0x1007b0889: cmp qword ptr [r12 + 0x38], -1
0x1007b088f: je 0x1007b0899
0x1007b0891: cmp qword ptr [r12 + 0x48], 0
0x1007b0897: je 0x1007b08b0
0x1007b0899: mov rbx, qword ptr [rbp - 0xa98]
0x1007b08a0: jmp 0x1007b08c3 ; 0x1007b08c3
0x1007b08a2: nop word ptr cs:[rax + rax]
0x1007b08b0: mov rax, qword ptr [rax]
0x1007b08b3: test rax, rax
0x1007b08b6: mov rbx, qword ptr [rbp - 0xa98]
0x1007b08bd: je 0x1007b126a
0x1007b08c3: lea r15, [rbx + rbx*4]
0x1007b08c7: mov qword ptr [r13 + r15*8], rax
0x1007b08cc: call qword ptr [r12 + 0x28]
0x1007b08d1: mov qword ptr [r13 + r15*8 + 8], rax
0x1007b08d6: mov qword ptr [r13 + r15*8 + 0x10], r12
0x1007b08db: mov r14b, byte ptr [rbp + rbx - 0x760]
0x1007b08e3: mov byte ptr [r13 + r15*8 + 0x20], r14b
0x1007b08e8: mov rax, qword ptr [rbp - 0xaa0]
0x1007b08ef: cmp byte ptr [rax + 0x578], 0
0x1007b08f6: je 0x1007b0a50
0x1007b08fc: mov rbx, qword ptr [r12 + 8]
0x1007b0901: test rbx, rbx
0x1007b0904: lea r12, [rip + 0x3d26e4] ; 0x100b82fef ModuleGroup
0x1007b090b: je 0x1007b0938
0x1007b090d: lea r13, [r13 + r15*8 + 0x10]
0x1007b0912: nop word ptr cs:[rax + rax]
0x1007b0920: mov rsi, qword ptr [rbx]
0x1007b0923: mov rdi, r12
0x1007b0926: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007b092b: test eax, eax
0x1007b092d: je 0x1007b094d
0x1007b092f: mov rbx, qword ptr [rbx + 0x10]
0x1007b0933: test rbx, rbx
0x1007b0936: jne 0x1007b0920
0x1007b0938: test r14b, r14b
0x1007b093b: mov rbx, qword ptr [rbp - 0xa98]
0x1007b0942: je 0x1007b0a50
0x1007b0948: jmp 0x1007b1242 ; 0x1007b1242
0x1007b094d: test r14b, r14b
0x1007b0950: mov rbx, qword ptr [rbp - 0xa98]
0x1007b0957: jne 0x1007b0a50
0x1007b095d: mov rax, qword ptr [rip + 0x459bbc] ; 0x100c0a520
0x1007b0964: mov rcx, rax
0x1007b0967: lea rax, [rcx + 0x18]
0x1007b096b: mov qword ptr [rbp - 0xa90], rax
0x1007b0972: lea rax, [rcx + 0x40]
0x1007b0976: mov qword ptr [rbp - 0x940], rax
0x1007b097d: lea r15, [rbp - 0x940]
0x1007b0984: mov rdi, r15
0x1007b0987: lea rbx, [rbp - 0xa88]
0x1007b098e: mov rsi, rbx
0x1007b0991: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1007b0996: mov qword ptr [rbp - 0x8b8], 0
0x1007b09a1: mov dword ptr [rbp - 0x8b0], 0xffffffff
0x1007b09ab: mov rax, qword ptr [rip + 0x45cc16] ; 0x100c0d5c8
0x1007b09b2: lea r14, [rax + 0x18]
0x1007b09b6: mov qword ptr [rbp - 0xa90], r14
0x1007b09bd: lea r12, [rax + 0x40]
0x1007b09c1: mov qword ptr [rbp - 0x940], r12
0x1007b09c8: mov edx, 1
0x1007b09cd: mov rdi, rbx
0x1007b09d0: lea rsi, [rip + 0x3f281f] ; 0x100ba31f6 ModuleBarn
0x1007b09d7: call 0x1007a56a0 ; 0x1007a56a0
0x1007b09dc: mov rax, qword ptr [r13]
0x1007b09e0: mov rbx, qword ptr [rax]
0x1007b09e3: mov rdi, rbx
0x1007b09e6: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1007b09eb: lea rdi, [rbp - 0xa90]
0x1007b09f2: mov rsi, rbx
0x1007b09f5: mov rdx, rax
0x1007b09f8: call 0x100011930 ; 0x100011930
0x1007b09fd: mov edx, 0x2a
0x1007b0a02: mov rdi, rax
0x1007b0a05: lea rsi, [rip + 0x3f27f5] ; 0x100ba3201  is not a module, but is registered as one
0x1007b0a0c: call 0x100011930 ; 0x100011930
0x1007b0a11: mov qword ptr [rbp - 0xa90], r14
0x1007b0a18: mov qword ptr [rbp - 0x940], r12
0x1007b0a1f: lea rdi, [rbp - 0xa88]
0x1007b0a26: call 0x1007a58d0 ; 0x1007a58d0
0x1007b0a2b: lea rdi, [rbp - 0xa90]
0x1007b0a32: mov rsi, qword ptr [rbp - 0xab0]
0x1007b0a39: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1007b0a3e: mov rdi, r15
0x1007b0a41: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1007b0a46: mov rbx, qword ptr [rbp - 0xa98]
0x1007b0a4d: nop dword ptr [rax]
0x1007b0a50: inc ebx
0x1007b0a52: mov r15, qword ptr [rbp - 0xaa0]
0x1007b0a59: mov r14d, dword ptr [r15 + 0x28]
0x1007b0a5d: mov r13, qword ptr [r15 + 0x20]
0x1007b0a61: cmp ebx, r14d
0x1007b0a64: jb 0x1007b0840
0x1007b0a6a: mov eax, r14d
0x1007b0a6d: lea rax, [rax + rax*4]
0x1007b0a71: lea rsi, [r13 + rax*8]
0x1007b0a76: lea rax, [rip - 0x7dd] ; 0x1007b02a0
0x1007b0a7d: mov qword ptr [rbp - 0xa90], rax
0x1007b0a84: lea rdx, [rbp - 0xa90]
0x1007b0a8b: mov rdi, r13
0x1007b0a8e: call 0x1007b27c0 ; 0x1007b27c0
0x1007b0a93: mov dword ptr [r15 + 0x38], 0
0x1007b0a9b: mov esi, dword ptr [r15 + 0x28]
0x1007b0a9f: test rsi, rsi
0x1007b0aa2: je 0x1007b0abf
0x1007b0aa4: mov r8, qword ptr [r15 + 0x20]
0x1007b0aa8: mov r9d, esi
0x1007b0aab: and r9d, 1
0x1007b0aaf: cmp esi, 1
0x1007b0ab2: jne 0x1007b0ac3
0x1007b0ab4: xor eax, eax
0x1007b0ab6: xor edi, edi
0x1007b0ab8: test r9, r9
0x1007b0abb: jne 0x1007b0b0e
0x1007b0abd: jmp 0x1007b0b29 ; 0x1007b0b29
0x1007b0abf: xor eax, eax
0x1007b0ac1: jmp 0x1007b0b29 ; 0x1007b0b29
0x1007b0ac3: sub rsi, r9
0x1007b0ac6: lea rbx, [r8 + 0x48]
0x1007b0aca: xor eax, eax
0x1007b0acc: xor edi, edi
0x1007b0ace: nop 
0x1007b0ad0: cmp byte ptr [rbx - 0x28], 0
0x1007b0ad4: je 0x1007b0ae5
0x1007b0ad6: mov ecx, eax
0x1007b0ad8: mov dword ptr [rbp + rcx*4 - 0xa90], edi
0x1007b0adf: inc eax
0x1007b0ae1: mov dword ptr [r15 + 0x38], eax
0x1007b0ae5: cmp byte ptr [rbx], 0
0x1007b0ae8: je 0x1007b0afc
0x1007b0aea: mov ecx, eax
0x1007b0aec: lea edx, [rdi + 1]
0x1007b0aef: mov dword ptr [rbp + rcx*4 - 0xa90], edx
0x1007b0af6: inc eax
0x1007b0af8: mov dword ptr [r15 + 0x38], eax
0x1007b0afc: add rdi, 2
0x1007b0b00: add rbx, 0x50
0x1007b0b04: cmp rsi, rdi
0x1007b0b07: jne 0x1007b0ad0
0x1007b0b09: test r9, r9
0x1007b0b0c: je 0x1007b0b29
0x1007b0b0e: lea rdx, [rdi + rdi*4]
0x1007b0b12: cmp byte ptr [r8 + rdx*8 + 0x20], 0
0x1007b0b18: je 0x1007b0b29
0x1007b0b1a: mov ecx, eax
0x1007b0b1c: mov dword ptr [rbp + rcx*4 - 0xa90], edi
0x1007b0b23: inc eax
0x1007b0b25: mov dword ptr [r15 + 0x38], eax
0x1007b0b29: mov rdi, qword ptr [r15]
0x1007b0b2c: mov esi, eax
0x1007b0b2e: shl rsi, 3
0x1007b0b32: mov rdx, qword ptr [rip + 0x189758f] ; 0x1020480c8
0x1007b0b39: mov ecx, 0x10
0x1007b0b3e: call 0x100795530 ; 0x100795530
0x1007b0b43: mov qword ptr [r15 + 0x30], rax
0x1007b0b47: mov ecx, dword ptr [r15 + 0x38]
0x1007b0b4b: test rcx, rcx
0x1007b0b4e: je 0x1007b0b6f
0x1007b0b50: lea rsi, [rcx - 1]
0x1007b0b54: mov edx, ecx
0x1007b0b56: and edx, 3
0x1007b0b59: cmp rsi, 3
0x1007b0b5d: jae 0x1007b0b76
0x1007b0b5f: xor esi, esi
0x1007b0b61: test rdx, rdx
0x1007b0b64: jne 0x1007b0bfd
0x1007b0b6a: jmp 0x1007b0c23 ; 0x1007b0c23
0x1007b0b6f: xor ecx, ecx
0x1007b0b71: jmp 0x1007b0c23 ; 0x1007b0c23
0x1007b0b76: mov rdi, rcx
0x1007b0b79: sub rdi, rdx
0x1007b0b7c: xor esi, esi
0x1007b0b7e: nop 
0x1007b0b80: mov ebx, dword ptr [rbp + rsi*4 - 0xa90]
0x1007b0b87: lea rbx, [rbx + rbx*4]
0x1007b0b8b: shl rbx, 3
0x1007b0b8f: add rbx, qword ptr [r15 + 0x20]
0x1007b0b93: mov qword ptr [rax + rsi*8], rbx
0x1007b0b97: mov rax, qword ptr [r15 + 0x30]
0x1007b0b9b: mov ebx, dword ptr [rbp + rsi*4 - 0xa8c]
0x1007b0ba2: lea rbx, [rbx + rbx*4]
0x1007b0ba6: shl rbx, 3
0x1007b0baa: add rbx, qword ptr [r15 + 0x20]
0x1007b0bae: mov qword ptr [rax + rsi*8 + 8], rbx
0x1007b0bb3: mov rax, qword ptr [r15 + 0x30]
0x1007b0bb7: mov ebx, dword ptr [rbp + rsi*4 - 0xa88]
0x1007b0bbe: lea rbx, [rbx + rbx*4]
0x1007b0bc2: shl rbx, 3
0x1007b0bc6: add rbx, qword ptr [r15 + 0x20]
0x1007b0bca: mov qword ptr [rax + rsi*8 + 0x10], rbx
0x1007b0bcf: mov rax, qword ptr [r15 + 0x30]
0x1007b0bd3: mov ebx, dword ptr [rbp + rsi*4 - 0xa84]
0x1007b0bda: lea rbx, [rbx + rbx*4]
0x1007b0bde: shl rbx, 3
0x1007b0be2: add rbx, qword ptr [r15 + 0x20]
0x1007b0be6: mov qword ptr [rax + rsi*8 + 0x18], rbx
0x1007b0beb: add rsi, 4
0x1007b0bef: mov rax, qword ptr [r15 + 0x30]
0x1007b0bf3: cmp rdi, rsi
0x1007b0bf6: jne 0x1007b0b80
0x1007b0bf8: test rdx, rdx
0x1007b0bfb: je 0x1007b0c23
0x1007b0bfd: neg rdx
0x1007b0c00: mov edi, dword ptr [rbp + rsi*4 - 0xa90]
0x1007b0c07: lea rdi, [rdi + rdi*4]
0x1007b0c0b: shl rdi, 3
0x1007b0c0f: add rdi, qword ptr [r15 + 0x20]
0x1007b0c13: mov qword ptr [rax + rsi*8], rdi
0x1007b0c17: inc rsi
0x1007b0c1a: mov rax, qword ptr [r15 + 0x30]
0x1007b0c1e: inc rdx
0x1007b0c21: jne 0x1007b0c00
0x1007b0c23: lea rsi, [rax + rcx*8]
0x1007b0c27: lea rcx, [rip - 0x96e] ; 0x1007b02c0
0x1007b0c2e: mov qword ptr [rbp - 0xaa8], rcx
0x1007b0c35: lea rdx, [rbp - 0xaa8]
0x1007b0c3c: mov rdi, rax
0x1007b0c3f: call 0x1007b3dc0 ; 0x1007b3dc0
0x1007b0c44: cmp dword ptr [r15 + 0x38], 0
0x1007b0c49: je 0x1007b0f45
0x1007b0c4f: mov rdx, qword ptr [r15 + 0x30]
0x1007b0c53: mov eax, dword ptr [rbp + 0x10]
0x1007b0c56: test eax, eax
0x1007b0c58: je 0x1007b0e3e
0x1007b0c5e: mov eax, eax
0x1007b0c60: mov qword ptr [rbp - 0xa98], rax
0x1007b0c67: xor eax, eax
0x1007b0c69: lea r12, [rip + 0x3d237f] ; 0x100b82fef ModuleGroup
0x1007b0c70: mov dword ptr [rbp - 0xab0], eax
0x1007b0c76: mov r13d, eax
0x1007b0c79: mov rax, qword ptr [rdx + r13*8]
0x1007b0c7d: mov rdi, qword ptr [rax + 8]
0x1007b0c81: mov rax, qword ptr [rdi]
0x1007b0c84: call qword ptr [rax + 0x68]
0x1007b0c87: mov rbx, rax
0x1007b0c8a: mov rdi, qword ptr [rbx + 8]
0x1007b0c8e: call 0x1007951f0 ; 0x1007951f0
0x1007b0c93: mov qword ptr [rbp - 0xac8], rax
0x1007b0c9a: mov rax, qword ptr [rbx]
0x1007b0c9d: mov r15, qword ptr [rax + 0xc0]
0x1007b0ca4: mov rcx, qword ptr [rbp - 0xaa0]
0x1007b0cab: mov rcx, qword ptr [rcx]
0x1007b0cae: mov qword ptr [rbp - 0xac0], rcx
0x1007b0cb5: mov rdi, rbx
0x1007b0cb8: call qword ptr [rax + 0xa0]
0x1007b0cbe: mov r14, rax
0x1007b0cc1: mov rax, qword ptr [rbx]
0x1007b0cc4: mov rdi, rbx
0x1007b0cc7: call qword ptr [rax + 0xa8]
0x1007b0ccd: cmp rax, 0x10
0x1007b0cd1: mov ecx, 0x10
0x1007b0cd6: cmovbe rax, rcx
0x1007b0cda: mov rdi, qword ptr [rbp - 0xac0]
0x1007b0ce1: mov rsi, r14
0x1007b0ce4: mov rdx, qword ptr [rbp - 0xac8]
0x1007b0ceb: mov rcx, rax
0x1007b0cee: call 0x100795530 ; 0x100795530
0x1007b0cf3: mov rdi, rbx
0x1007b0cf6: mov rsi, rax
0x1007b0cf9: call r15
0x1007b0cfc: mov r15, qword ptr [rbp - 0xaa0]
0x1007b0d03: mov rcx, qword ptr [r15 + 0x30]
0x1007b0d07: mov rcx, qword ptr [rcx + r13*8]
0x1007b0d0b: mov rcx, qword ptr [rcx]
0x1007b0d0e: mov qword ptr [rcx], rax
0x1007b0d11: mov rax, qword ptr [r15 + 0x30]
0x1007b0d15: mov rax, qword ptr [rax + r13*8]
0x1007b0d19: mov rdx, qword ptr [rax]
0x1007b0d1c: mov rcx, qword ptr [rax + 8]
0x1007b0d20: mov qword ptr [rbp - 0xaa8], 0
0x1007b0d2b: mov rdi, qword ptr [rip + 0x189735e] ; 0x102048090
0x1007b0d32: mov rax, qword ptr [rdi]
0x1007b0d35: lea rsi, [rbp - 0xaa8]
0x1007b0d3c: call qword ptr [rax + 0x40]
0x1007b0d3f: mov rcx, r13
0x1007b0d42: mov r13, qword ptr [rbp - 0xaa8]
0x1007b0d49: mov rdx, qword ptr [r15 + 0x30]
0x1007b0d4d: mov rax, qword ptr [rdx + rcx*8]
0x1007b0d51: mov qword ptr [rax + 0x18], r13
0x1007b0d55: mov eax, dword ptr [rbp - 0xab0]
0x1007b0d5b: mov dword ptr [r13 + 4], eax
0x1007b0d5f: mov dword ptr [r13 + 8], 0
0x1007b0d67: cmp byte ptr [r15 + 0x578], 0
0x1007b0d6f: je 0x1007b0e2b
0x1007b0d75: mov qword ptr [rbp - 0xab0], rcx
0x1007b0d7c: mov qword ptr [rbp - 0xac8], rdx
0x1007b0d83: mov rax, qword ptr [rdx + rcx*8]
0x1007b0d87: mov rax, qword ptr [rax + 0x10]
0x1007b0d8b: mov qword ptr [rbp - 0xac0], rax
0x1007b0d92: lea rcx, [rax + 8]
0x1007b0d96: nop word ptr cs:[rax + rax]
0x1007b0da0: mov rbx, qword ptr [rcx]
0x1007b0da3: mov rsi, qword ptr [rbx]
0x1007b0da6: mov rdi, r12
0x1007b0da9: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007b0dae: lea rcx, [rbx + 0x10]
0x1007b0db2: test eax, eax
0x1007b0db4: jne 0x1007b0da0
0x1007b0db6: mov rbx, qword ptr [rbx + 8]
0x1007b0dba: xor r12d, r12d
0x1007b0dbd: xor r14d, r14d
0x1007b0dc0: mov rax, qword ptr [rbp - 0xab8]
0x1007b0dc7: mov rsi, qword ptr [rax + r14*8]
0x1007b0dcb: mov rdi, rbx
0x1007b0dce: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007b0dd3: test eax, eax
0x1007b0dd5: je 0x1007b0df0
0x1007b0dd7: inc r14
0x1007b0dda: cmp qword ptr [rbp - 0xa98], r14
0x1007b0de1: jne 0x1007b0dc0
0x1007b0de3: jmp 0x1007b0e0d ; 0x1007b0e0d
0x1007b0de5: nop word ptr cs:[rax + rax]
0x1007b0df0: mov eax, 1
0x1007b0df5: mov ecx, r14d
0x1007b0df8: shl eax, cl
0x1007b0dfa: or r12d, eax
0x1007b0dfd: mov dword ptr [r13 + 8], r12d
0x1007b0e01: inc r14
0x1007b0e04: cmp qword ptr [rbp - 0xa98], r14
0x1007b0e0b: jne 0x1007b0dc0
0x1007b0e0d: test r12d, r12d
0x1007b0e10: lea r12, [rip + 0x3d21d8] ; 0x100b82fef ModuleGroup
0x1007b0e17: mov rcx, qword ptr [rbp - 0xab0]
0x1007b0e1e: mov rdx, qword ptr [rbp - 0xac8]
0x1007b0e25: je 0x1007b11b8
0x1007b0e2b: inc ecx
0x1007b0e2d: mov eax, ecx
0x1007b0e2f: cmp ecx, dword ptr [r15 + 0x38]
0x1007b0e33: jb 0x1007b0c70
0x1007b0e39: jmp 0x1007b0f45 ; 0x1007b0f45
0x1007b0e3e: xor eax, eax
0x1007b0e40: mov dword ptr [rbp - 0xab8], eax
0x1007b0e46: mov r12d, eax
0x1007b0e49: mov rax, qword ptr [rdx + r12*8]
0x1007b0e4d: mov rdi, qword ptr [rax + 8]
0x1007b0e51: mov rax, qword ptr [rdi]
0x1007b0e54: call qword ptr [rax + 0x68]
0x1007b0e57: mov rbx, rax
0x1007b0e5a: mov rdi, qword ptr [rbx + 8]
0x1007b0e5e: call 0x1007951f0 ; 0x1007951f0
0x1007b0e63: mov qword ptr [rbp - 0xa98], rax
0x1007b0e6a: mov rax, qword ptr [rbx]
0x1007b0e6d: mov r15, qword ptr [rax + 0xc0]
0x1007b0e74: mov rcx, qword ptr [rbp - 0xaa0]
0x1007b0e7b: mov r13, qword ptr [rcx]
0x1007b0e7e: mov rdi, rbx
0x1007b0e81: call qword ptr [rax + 0xa0]
0x1007b0e87: mov r14, rax
0x1007b0e8a: mov rax, qword ptr [rbx]
0x1007b0e8d: mov rdi, rbx
0x1007b0e90: call qword ptr [rax + 0xa8]
0x1007b0e96: cmp rax, 0x10
0x1007b0e9a: mov ecx, 0x10
0x1007b0e9f: cmovbe rax, rcx
0x1007b0ea3: mov rdi, r13
0x1007b0ea6: mov rsi, r14
0x1007b0ea9: mov rdx, qword ptr [rbp - 0xa98]
0x1007b0eb0: mov rcx, rax
0x1007b0eb3: call 0x100795530 ; 0x100795530
0x1007b0eb8: mov rdi, rbx
0x1007b0ebb: mov rsi, rax
0x1007b0ebe: call r15
0x1007b0ec1: mov r15, qword ptr [rbp - 0xaa0]
0x1007b0ec8: mov rcx, qword ptr [r15 + 0x30]
0x1007b0ecc: mov rcx, qword ptr [rcx + r12*8]
0x1007b0ed0: mov rcx, qword ptr [rcx]
0x1007b0ed3: mov qword ptr [rcx], rax
0x1007b0ed6: mov rax, qword ptr [r15 + 0x30]
0x1007b0eda: mov rax, qword ptr [rax + r12*8]
0x1007b0ede: mov rdx, qword ptr [rax]
0x1007b0ee1: mov rcx, qword ptr [rax + 8]
0x1007b0ee5: mov qword ptr [rbp - 0xaa8], 0
0x1007b0ef0: mov rdi, qword ptr [rip + 0x1897199] ; 0x102048090
0x1007b0ef7: mov rax, qword ptr [rdi]
0x1007b0efa: lea rsi, [rbp - 0xaa8]
0x1007b0f01: call qword ptr [rax + 0x40]
0x1007b0f04: mov rax, qword ptr [rbp - 0xaa8]
0x1007b0f0b: mov rdx, qword ptr [r15 + 0x30]
0x1007b0f0f: mov rcx, qword ptr [rdx + r12*8]
0x1007b0f13: mov qword ptr [rcx + 0x18], rax
0x1007b0f17: mov ecx, dword ptr [rbp - 0xab8]
0x1007b0f1d: mov dword ptr [rax + 4], ecx
0x1007b0f20: mov dword ptr [rax + 8], 0
0x1007b0f27: cmp byte ptr [r15 + 0x578], 0
0x1007b0f2f: jne 0x1007b1178
0x1007b0f35: inc r12d
0x1007b0f38: mov eax, r12d
0x1007b0f3b: cmp r12d, dword ptr [r15 + 0x38]
0x1007b0f3f: jb 0x1007b0e40
0x1007b0f45: mov rdi, qword ptr [r15]
0x1007b0f48: mov ebx, dword ptr [rbp - 0xacc]
0x1007b0f4e: mov r12d, ebx
0x1007b0f51: imul r14, r12, 0x38
0x1007b0f55: mov rdx, qword ptr [rip + 0x189716c] ; 0x1020480c8
0x1007b0f5c: mov ecx, 0x10
0x1007b0f61: mov rsi, r14
0x1007b0f64: call 0x100795530 ; 0x100795530
0x1007b0f69: mov rsi, rax
0x1007b0f6c: mov qword ptr [r15 + 0x40], rsi
0x1007b0f70: mov dword ptr [r15 + 0x48], ebx
0x1007b0f74: test ebx, ebx
0x1007b0f76: je 0x1007b0faf
0x1007b0f78: xor r13d, r13d
0x1007b0f7b: mov rbx, qword ptr [rbp - 0xae0]
0x1007b0f82: nop word ptr cs:[rax + rax]
0x1007b0f90: add rsi, r13
0x1007b0f93: mov rdx, qword ptr [rbx]
0x1007b0f96: mov rdi, r15
0x1007b0f99: call 0x1007b1330 ; 0x1007b1330
0x1007b0f9e: mov rsi, qword ptr [r15 + 0x40]
0x1007b0fa2: add r13, 0x38
0x1007b0fa6: add rbx, 8
0x1007b0faa: dec r12
0x1007b0fad: jne 0x1007b0f90
0x1007b0faf: add r14, rsi
0x1007b0fb2: lea rax, [rip - 0xd29] ; 0x1007b0290
0x1007b0fb9: mov qword ptr [rbp - 0xaa8], rax
0x1007b0fc0: lea rdx, [rbp - 0xaa8]
0x1007b0fc7: mov rdi, rsi
0x1007b0fca: mov rsi, r14
0x1007b0fcd: call 0x1007b4a50 ; 0x1007b4a50
0x1007b0fd2: cmp dword ptr [r15 + 0x38], 0
0x1007b0fd7: je 0x1007b1152
0x1007b0fdd: xor ecx, ecx
0x1007b0fdf: nop 
0x1007b0fe0: mov rax, qword ptr [r15 + 0x30]
0x1007b0fe4: mov dword ptr [rbp - 0xa98], ecx
0x1007b0fea: mov ecx, ecx
0x1007b0fec: mov rax, qword ptr [rax + rcx*8]
0x1007b0ff0: mov rdi, qword ptr [rax + 8]
0x1007b0ff4: mov rax, qword ptr [rdi]
0x1007b0ff7: call qword ptr [rax + 0x68]
0x1007b0ffa: test rax, rax
0x1007b0ffd: jne 0x1007b101f
0x1007b0fff: jmp 0x1007b1140 ; 0x1007b1140
0x1007b1004: nop word ptr cs:[rax + rax]
0x1007b1010: mov rax, qword ptr [rax + 0x30]
0x1007b1014: test rax, rax
0x1007b1017: je 0x1007b1140
0x1007b101d: call rax
0x1007b101f: mov rcx, qword ptr [rax + 0x50]
0x1007b1023: mov r13, qword ptr [rcx]
0x1007b1026: add rcx, 8
0x1007b102a: cmp r13, rcx
0x1007b102d: je 0x1007b1010
0x1007b102f: mov r14d, dword ptr [r15 + 0x48]
0x1007b1033: mov qword ptr [rbp - 0xab8], rax
0x1007b103a: nop word ptr [rax + rax]
0x1007b1040: mov r12, qword ptr [r13 + 0x20]
0x1007b1044: test r14d, r14d
0x1007b1047: je 0x1007b107b
0x1007b1049: mov rax, qword ptr [rbp - 0xaa0]
0x1007b1050: mov rbx, qword ptr [rax + 0x40]
0x1007b1054: xor r15d, r15d
0x1007b1057: nop word ptr [rax + rax]
0x1007b1060: mov rdi, r12
0x1007b1063: mov rsi, rbx
0x1007b1066: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007b106b: test eax, eax
0x1007b106d: je 0x1007b10e3
0x1007b106f: inc r15d
0x1007b1072: add rbx, 0x38
0x1007b1076: cmp r15d, r14d
0x1007b1079: jb 0x1007b1060
0x1007b107b: test r14d, r14d
0x1007b107e: je 0x1007b10e0
0x1007b1080: xor ebx, ebx
0x1007b1082: mov r15, qword ptr [rbp - 0xaa0]
0x1007b1089: nop dword ptr [rax]
0x1007b1090: mov eax, ebx
0x1007b1092: imul r14, rax, 0x38
0x1007b1096: mov rsi, qword ptr [r15 + 0x40]
0x1007b109a: add rsi, r14
0x1007b109d: mov rdi, r12
0x1007b10a0: call 0x1007b02e0 ; 0x1007b02e0
0x1007b10a5: cmp eax, 3
0x1007b10a8: jbe 0x1007b11ea
0x1007b10ae: inc ebx
0x1007b10b0: mov r14d, dword ptr [r15 + 0x48]
0x1007b10b4: cmp ebx, r14d
0x1007b10b7: jb 0x1007b1090
0x1007b10b9: mov rcx, qword ptr [r13 + 8]
0x1007b10bd: test rcx, rcx
0x1007b10c0: je 0x1007b10f3
0x1007b10c2: mov rax, qword ptr [rbp - 0xab8]
0x1007b10c9: nop dword ptr [rax]
0x1007b10d0: mov rdx, rcx
0x1007b10d3: mov rcx, qword ptr [rdx]
0x1007b10d6: test rcx, rcx
0x1007b10d9: jne 0x1007b10d0
0x1007b10db: jmp 0x1007b1121 ; 0x1007b1121
0x1007b10dd: nop dword ptr [rax]
0x1007b10e0: xor r14d, r14d
0x1007b10e3: mov r15, qword ptr [rbp - 0xaa0]
0x1007b10ea: mov rcx, qword ptr [r13 + 8]
0x1007b10ee: test rcx, rcx
0x1007b10f1: jne 0x1007b10c2
0x1007b10f3: mov rdx, qword ptr [r13 + 0x10]
0x1007b10f7: cmp qword ptr [rdx], r13
0x1007b10fa: mov rax, qword ptr [rbp - 0xab8]
0x1007b1101: je 0x1007b1121
0x1007b1103: add r13, 0x10
0x1007b1107: nop word ptr [rax + rax]
0x1007b1110: mov rcx, qword ptr [r13]
0x1007b1114: mov rdx, qword ptr [rcx + 0x10]
0x1007b1118: cmp qword ptr [rdx], rcx
0x1007b111b: lea r13, [rcx + 0x10]
0x1007b111f: jne 0x1007b1110
0x1007b1121: mov rcx, qword ptr [rax + 0x50]
0x1007b1125: add rcx, 8
0x1007b1129: mov r13, rdx
0x1007b112c: cmp rdx, rcx
0x1007b112f: jne 0x1007b1040
0x1007b1135: jmp 0x1007b1010 ; 0x1007b1010
0x1007b113a: nop word ptr [rax + rax]
0x1007b1140: mov ecx, dword ptr [rbp - 0xa98]
0x1007b1146: inc ecx
0x1007b1148: cmp ecx, dword ptr [r15 + 0x38]
0x1007b114c: jb 0x1007b0fe0
0x1007b1152: mov rax, qword ptr [rip + 0x45c77f] ; 0x100c0d8d8
0x1007b1159: mov rax, qword ptr [rax]
0x1007b115c: cmp rax, qword ptr [rbp - 0x30]
0x1007b1160: jne 0x1007b121e
0x1007b1166: add rsp, 0xac8
0x1007b116d: pop rbx
0x1007b116e: pop r12
0x1007b1170: pop r13
0x1007b1172: pop r14
0x1007b1174: pop r15
0x1007b1176: pop rbp
0x1007b1177: ret 
0x1007b1178: mov rax, qword ptr [rdx + r12*8]
0x1007b117c: mov rax, qword ptr [rax + 0x10]
0x1007b1180: mov qword ptr [rbp - 0xac0], rax
0x1007b1187: mov rbx, qword ptr [rax + 8]
0x1007b118b: test rbx, rbx
0x1007b118e: je 0x1007b11b8
0x1007b1190: lea r14, [rip + 0x3d1e58] ; 0x100b82fef ModuleGroup
0x1007b1197: nop word ptr [rax + rax]
0x1007b11a0: mov rsi, qword ptr [rbx]
0x1007b11a3: mov rdi, r14
0x1007b11a6: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007b11ab: test eax, eax
0x1007b11ad: je 0x1007b11b8
0x1007b11af: mov rbx, qword ptr [rbx + 0x10]
0x1007b11b3: test rbx, rbx
0x1007b11b6: jne 0x1007b11a0
0x1007b11b8: mov rax, qword ptr [rbp - 0xac0]
0x1007b11bf: mov r9, qword ptr [rax]
0x1007b11c2: lea rdi, [rip + 0x3f20a3] ; 0x100ba326c module->m_groupFlags > 0
0x1007b11c9: lea rsi, [rip + 0x3f1fe6] ; 0x100ba31b6 Module.cpp
0x1007b11d0: lea r8, [rip + 0x3f20ae] ; 0x100ba3285 Module %s does not have a valid group
0x1007b11d7: mov edx, 0xa7
0x1007b11dc: mov ecx, 4
0x1007b11e1: xor eax, eax
0x1007b11e3: call 0x1007e6030 ; 0x1007e6030
0x1007b11e8: ud2 
0x1007b11ea: mov rax, qword ptr [rbp - 0xab8]
0x1007b11f1: mov r9, qword ptr [rax + 8]
0x1007b11f5: add r14, qword ptr [r15 + 0x40]
0x1007b11f9: mov qword ptr [rsp + 8], r14
0x1007b11fe: mov qword ptr [rsp], r12
0x1007b1202: lea rdi, [rip + 0x3f20a2] ; 0x100ba32ab lDist > kMaxLevenshteinDistance
0x1007b1209: lea rsi, [rip + 0x3f1fa6] ; 0x100ba31b6 Module.cpp
0x1007b1210: lea r8, [rip + 0x3f20b4] ; 0x100ba32cb Unrecognized member function %s::%s suspiciously close to %s
0x1007b1217: mov edx, 0xce
0x1007b121c: jmp 0x1007b11dc ; 0x1007b11dc
0x1007b121e: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1007b1223: lea rdi, [rip + 0x3f1fb2] ; 0x100ba31dc m_fieldCount < kMaxFields
0x1007b122a: lea rsi, [rip + 0x3f1f85] ; 0x100ba31b6 Module.cpp
0x1007b1231: mov edx, 0x6c
0x1007b1236: mov ecx, 3
0x1007b123b: call 0x1007e5f70 ; 0x1007e5f70
0x1007b1240: ud2 
0x1007b1242: lea rdi, [rip + 0x3f1fe3] ; 0x100ba322c !f.isModule || md
0x1007b1249: lea rsi, [rip + 0x3f1f66] ; 0x100ba31b6 Module.cpp
0x1007b1250: lea r8, [rip + 0x3f1fe7] ; 0x100ba323e Modules must set the meta data "Module Group"
0x1007b1257: mov edx, 0x80
0x1007b125c: mov ecx, 4
0x1007b1261: xor eax, eax
0x1007b1263: call 0x1007e6030 ; 0x1007e6030
0x1007b1268: ud2 
0x1007b126a: call qword ptr [r12 + 0x30]
0x1007b126f: mov r9, qword ptr [rax + 8]
0x1007b1273: mov rax, qword ptr [r12]
0x1007b1277: mov qword ptr [rsp], rax
0x1007b127b: lea rdi, [rip + 0x3cd508] ; 0x100b7e78a !m_countAddress || m_staticArraySize > 0 || *(void**)v != 0
0x1007b1282: lea rsi, [rip + 0x3f1de5] ; 0x100ba306e ../../Code/Base/Meta.h
0x1007b1289: lea r8, [rip + 0x3cd536] ; 0x100b7e7c6 %s::%s is a null array
0x1007b1290: mov edx, 0x40b
0x1007b1295: jmp 0x1007b11dc ; 0x1007b11dc
0x1007b129a: lea rdi, [rip + 0x3f1f2c] ; 0x100ba31cd heap
0x1007b12a1: lea rsi, [rip + 0x3f1f0e] ; 0x100ba31b6 Module.cpp
0x1007b12a8: mov edx, 0x56
0x1007b12ad: mov ecx, 3
0x1007b12b2: call 0x1007e5f70 ; 0x1007e5f70
0x1007b12b7: ud2 
0x1007b12b9: lea rdi, [rip + 0x3f1f12] ; 0x100ba31d2 container
0x1007b12c0: lea rsi, [rip + 0x3f1eef] ; 0x100ba31b6 Module.cpp
0x1007b12c7: mov edx, 0x5e
0x1007b12cc: mov ecx, 3
0x1007b12d1: call 0x1007e5f70 ; 0x1007e5f70
0x1007b12d6: ud2 
0x1007b12d8: mov rbx, rax
0x1007b12db: jmp 0x1007b12ff ; 0x1007b12ff
0x1007b12dd: mov rbx, rax
0x1007b12e0: jmp 0x1007b1312 ; 0x1007b1312
0x1007b12e2: mov rbx, rax
0x1007b12e5: mov qword ptr [rbp - 0xa90], r14
0x1007b12ec: mov qword ptr [rbp - 0x940], r12
0x1007b12f3: lea rdi, [rbp - 0xa88]
0x1007b12fa: call 0x1007a58d0 ; 0x1007a58d0
0x1007b12ff: lea rdi, [rbp - 0xa90]
0x1007b1306: mov rsi, qword ptr [rbp - 0xab0]
0x1007b130d: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1007b1312: mov rdi, r15
0x1007b1315: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1007b131a: mov rdi, rbx
0x1007b131d: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1007b1322: nop word ptr cs:[rax + rax]
