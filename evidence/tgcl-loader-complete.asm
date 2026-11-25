0x10040bc00: push rbp
0x10040bc01: mov rbp, rsp
0x10040bc04: push r15
0x10040bc06: push r14
0x10040bc08: push r13
0x10040bc0a: push r12
0x10040bc0c: push rbx
0x10040bc0d: and rsp, 0xffffffffffffffe0
0x10040bc11: sub rsp, 0x17a0
0x10040bc18: mov r14, r9
0x10040bc1b: mov qword ptr [rsp + 0x88], rcx
0x10040bc23: mov r15, rdx
0x10040bc26: mov r12, rsi
0x10040bc29: mov rbx, rdi
0x10040bc2c: mov rax, qword ptr [rip + 0x801ca5] ; 0x100c0d8d8
0x10040bc33: mov rax, qword ptr [rax]
0x10040bc36: mov qword ptr [rsp + 0x1780], rax
0x10040bc3e: call 0x1007c6c20 ; 0x1007c6c20
0x10040bc43: lea rcx, [rip + 0x1c3cf06] ; 0x102048b50
0x10040bc4a: mov rdx, qword ptr [rcx]
0x10040bc4d: mov esi, 0x400000
0x10040bc52: mov ecx, 0x10
0x10040bc57: mov rdi, rax
0x10040bc5a: call 0x100795530 ; 0x100795530
0x10040bc5f: mov r13, rax
0x10040bc62: mov dword ptr [rsp + 0x74], 0
0x10040bc6a: lea r8, [rsp + 0x74]
0x10040bc6f: mov ecx, 0x400000
0x10040bc74: mov rdi, rbx
0x10040bc77: mov rsi, r12
0x10040bc7a: mov rdx, r13
0x10040bc7d: call 0x1007f86c0 ; 0x1007f86c0
0x10040bc82: mov eax, dword ptr [rsp + 0x74]
0x10040bc86: cmp eax, 0x2b
0x10040bc89: jbe 0x10040d3b6
0x10040bc8f: cmp dword ptr [r13], 0x4c434754
0x10040bc97: mov qword ptr [rsp + 0x18], r13
0x10040bc9c: lea r12, [rip + 0x1c3cead] ; 0x102048b50
0x10040bca3: jne 0x10040d3d8
0x10040bca9: cmp dword ptr [r13 + 0x28], eax
0x10040bcad: jne 0x10040d3fa
0x10040bcb3: lea rdi, [rsp + 0xf0]
0x10040bcbb: mov esi, 0x1490
0x10040bcc0: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x10040bcc5: mov esi, dword ptr [r13 + 0x10]
0x10040bcc9: shl rsi, 3
0x10040bccd: mov rdx, qword ptr [rip + 0x1bf78dc] ; 0x1020035b0
0x10040bcd4: mov ecx, 0x10
0x10040bcd9: mov rdi, r15
0x10040bcdc: call 0x100795530 ; 0x100795530
0x10040bce1: mov qword ptr [rsp + 0xf0], rax
0x10040bce9: mov eax, dword ptr [r13 + 0x10]
0x10040bced: shl rax, 3
0x10040bcf1: lea rsi, [rax + rax*2]
0x10040bcf5: mov rdx, qword ptr [rip + 0x1bf78b4] ; 0x1020035b0
0x10040bcfc: mov ecx, 0x10
0x10040bd01: mov rdi, r15
0x10040bd04: call 0x100795530 ; 0x100795530
0x10040bd09: mov qword ptr [rsp + 0xf8], rax
0x10040bd11: cmp dword ptr [r13 + 0x10], 0
0x10040bd16: je 0x10040bd68
0x10040bd18: vxorps xmm0, xmm0, xmm0
0x10040bd1c: vmovups xmmword ptr [rax], xmm0
0x10040bd20: mov qword ptr [rax + 0x10], 0
0x10040bd28: mov ecx, dword ptr [r13 + 0x10]
0x10040bd2c: cmp ecx, 2
0x10040bd2f: jb 0x10040bd6a
0x10040bd31: mov eax, 1
0x10040bd36: nop word ptr cs:[rax + rax]
0x10040bd40: mov rcx, qword ptr [rsp + 0xf8]
0x10040bd48: mov edx, eax
0x10040bd4a: lea rdx, [rdx + rdx*2]
0x10040bd4e: vmovups xmmword ptr [rcx + rdx*8], xmm0
0x10040bd53: mov qword ptr [rcx + rdx*8 + 0x10], 0
0x10040bd5c: inc eax
0x10040bd5e: mov ecx, dword ptr [r13 + 0x10]
0x10040bd62: cmp eax, ecx
0x10040bd64: jb 0x10040bd40
0x10040bd66: jmp 0x10040bd6a ; 0x10040bd6a
0x10040bd68: xor ecx, ecx
0x10040bd6a: mov dword ptr [rsp + 0x100], ecx
0x10040bd71: mov qword ptr [rsp + 0x108], r14
0x10040bd79: mov eax, dword ptr [r13 + 0x18]
0x10040bd7d: add rax, r13
0x10040bd80: mov qword ptr [rsp + 0x1510], rax
0x10040bd88: mov eax, dword ptr [r13 + 8]
0x10040bd8c: mov dword ptr [rsp + 0x1520], eax
0x10040bd93: mov eax, dword ptr [r13 + 0x1c]
0x10040bd97: add rax, r13
0x10040bd9a: mov qword ptr [rsp + 0x1528], rax
0x10040bda2: mov eax, dword ptr [r13 + 0xc]
0x10040bda6: mov dword ptr [rsp + 0x1538], eax
0x10040bdad: mov eax, dword ptr [r13 + 0x20]
0x10040bdb1: mov rcx, rax
0x10040bdb4: add rcx, r13
0x10040bdb7: mov qword ptr [rsp + 0x1550], rcx
0x10040bdbf: mov ecx, dword ptr [r13 + 0x24]
0x10040bdc3: mov edx, ecx
0x10040bdc5: sub edx, eax
0x10040bdc7: mov dword ptr [rsp + 0x1558], edx
0x10040bdce: mov rax, r13
0x10040bdd1: add rax, rcx
0x10040bdd4: mov qword ptr [rsp + 0x1560], rax
0x10040bddc: mov eax, dword ptr [r13 + 0x28]
0x10040bde0: sub eax, ecx
0x10040bde2: mov dword ptr [rsp + 0x1568], eax
0x10040bde9: mov ebx, dword ptr [r13 + 0x14]
0x10040bded: call 0x1007c6c20 ; 0x1007c6c20
0x10040bdf2: shl rbx, 3
0x10040bdf6: lea rsi, [rbx + rbx*2]
0x10040bdfa: mov rdx, qword ptr [r12]
0x10040bdfe: mov ecx, 8
0x10040be03: mov rdi, rax
0x10040be06: call 0x100795530 ; 0x100795530
0x10040be0b: mov qword ptr [rsp + 0xe0], rax
0x10040be13: mov qword ptr [rsp + 0x1570], rax
0x10040be1b: mov eax, dword ptr [r13 + 0x14]
0x10040be1f: mov dword ptr [rsp + 0x1578], eax
0x10040be26: mov ebx, dword ptr [rsp + 0x1520]
0x10040be2d: call 0x1007c6c20 ; 0x1007c6c20
0x10040be32: shl rbx, 3
0x10040be36: mov rdx, qword ptr [r12]
0x10040be3a: mov ecx, 4
0x10040be3f: mov rdi, rax
0x10040be42: mov rsi, rbx
0x10040be45: call 0x100795530 ; 0x100795530
0x10040be4a: mov qword ptr [rsp + 0xd8], rax
0x10040be52: mov qword ptr [rsp + 0x1518], rax
0x10040be5a: mov ebx, dword ptr [rsp + 0x1538]
0x10040be61: call 0x1007c6c20 ; 0x1007c6c20
0x10040be66: shl rbx, 5
0x10040be6a: mov rdx, qword ptr [r12]
0x10040be6e: mov ecx, 8
0x10040be73: mov rdi, rax
0x10040be76: mov rsi, rbx
0x10040be79: call 0x100795530 ; 0x100795530
0x10040be7e: mov qword ptr [rsp + 0x1530], rax
0x10040be86: cmp dword ptr [rsp + 0x1520], 0
0x10040be8e: mov qword ptr [rsp + 0xd0], rax
0x10040be96: je 0x10040bf15
0x10040be98: xor r15d, r15d
0x10040be9b: xor r14d, r14d
0x10040be9e: mov rax, qword ptr [rsp + 0x1510]
0x10040bea6: mov ecx, r14d
0x10040bea9: lea rcx, [rcx + rcx*2]
0x10040bead: mov edi, dword ptr [rax + rcx*4]
0x10040beb0: add rdi, qword ptr [rsp + 0x1550]
0x10040beb8: xor esi, esi
0x10040beba: call 0x1007abc80 ; 0x1007abc80
0x10040bebf: test rax, rax
0x10040bec2: je 0x10040bf06
0x10040bec4: mov ecx, dword ptr [rax + 0x38]
0x10040bec7: mov dword ptr [rsp + rcx*4 + 0x110], r14d
0x10040becf: jmp 0x10040bee3 ; 0x10040bee3
0x10040bed1: nop word ptr cs:[rax + rax]
0x10040bee0: add r15d, ebx
0x10040bee3: mov rcx, qword ptr [rax + 0x30]
0x10040bee7: mov rax, qword ptr [rax + 0x48]
0x10040beeb: mov rbx, qword ptr [rax + 0x10]
0x10040beef: test rcx, rcx
0x10040bef2: je 0x10040bf00
0x10040bef4: call rcx
0x10040bef6: jmp 0x10040bee0 ; 0x10040bee0
0x10040bef8: nop dword ptr [rax + rax]
0x10040bf00: add ebx, r15d
0x10040bf03: mov r15d, ebx
0x10040bf06: inc r14d
0x10040bf09: cmp r14d, dword ptr [rsp + 0x1520]
0x10040bf11: jb 0x10040be9e
0x10040bf13: jmp 0x10040bf18 ; 0x10040bf18
0x10040bf15: xor r15d, r15d
0x10040bf18: call 0x1007c6c20 ; 0x1007c6c20
0x10040bf1d: mov ecx, r15d
0x10040bf20: lea rdx, [rcx + rcx*8]
0x10040bf24: lea rsi, [rdx + rdx*2]
0x10040bf28: add rsi, rcx
0x10040bf2b: mov rdx, qword ptr [r12]
0x10040bf2f: mov ecx, 4
0x10040bf34: mov rdi, rax
0x10040bf37: call 0x100795530 ; 0x100795530
0x10040bf3c: mov qword ptr [rsp + 0xc0], rax
0x10040bf44: mov qword ptr [rsp + 0x1540], rax
0x10040bf4c: mov dword ptr [rsp + 0x1548], 0
0x10040bf57: cmp dword ptr [rsp + 0x1520], 0
0x10040bf5f: je 0x10040d06e
0x10040bf65: lea r14, [rsp + 0x1588]
0x10040bf6d: add qword ptr [rsp + 0x88], 0x28
0x10040bf76: mov rax, qword ptr [rip + 0x7fe603] ; 0x100c0a580
0x10040bf7d: add rax, 8
0x10040bf81: mov qword ptr [rsp + 0x50], rax
0x10040bf86: xor eax, eax
0x10040bf88: mov r15, qword ptr [rsp + 0x1510]
0x10040bf90: mov rcx, qword ptr [rsp + 0x1518]
0x10040bf98: mov qword ptr [rsp + 0xb8], rcx
0x10040bfa0: mov eax, eax
0x10040bfa2: mov qword ptr [rsp + 0xa8], rax
0x10040bfaa: lea rax, [rax + rax*2]
0x10040bfae: mov qword ptr [rsp + 0x20], rax
0x10040bfb3: mov edi, dword ptr [r15 + rax*4]
0x10040bfb7: add rdi, qword ptr [rsp + 0x1550]
0x10040bfbf: xor esi, esi
0x10040bfc1: mov qword ptr [rsp + 0x58], rdi
0x10040bfc6: call 0x1007abc80 ; 0x1007abc80
0x10040bfcb: mov rbx, rax
0x10040bfce: test rbx, rbx
0x10040bfd1: je 0x10040c06a
0x10040bfd7: mov rax, qword ptr [rbx]
0x10040bfda: mov rdi, rbx
0x10040bfdd: call qword ptr [rax + 0xa0]
0x10040bfe3: mov r12, rax
0x10040bfe6: mov rax, qword ptr [rbx]
0x10040bfe9: mov rdi, rbx
0x10040bfec: call qword ptr [rax + 0xa8]
0x10040bff2: mov r14, rax
0x10040bff5: call 0x1007c6c20 ; 0x1007c6c20
0x10040bffa: mov esi, r12d
0x10040bffd: lea rcx, [rip + 0x1c3cb4c] ; 0x102048b50
0x10040c004: mov rdx, qword ptr [rcx]
0x10040c007: mov ecx, r14d
0x10040c00a: mov rdi, rax
0x10040c00d: call 0x100795530 ; 0x100795530
0x10040c012: mov rcx, qword ptr [rbx]
0x10040c015: mov rdi, rbx
0x10040c018: mov qword ptr [rsp + 0xb0], rax
0x10040c020: mov rsi, rax
0x10040c023: call qword ptr [rcx + 0xc0]
0x10040c029: mov qword ptr [rsp + 0x68], rax
0x10040c02e: mov rsi, qword ptr [rsp + 0x20]
0x10040c033: lea rax, [r15 + rsi*4 + 8]
0x10040c038: mov qword ptr [rsp + 0xc8], rax
0x10040c040: cmp dword ptr [r15 + rsi*4 + 8], 0
0x10040c046: mov qword ptr [rsp + 0x48], rbx
0x10040c04b: je 0x10040c798
0x10040c051: lea rax, [r15 + rsi*4 + 4]
0x10040c056: xor ecx, ecx
0x10040c058: mov qword ptr [rsp + 0x10], r15
0x10040c05d: mov qword ptr [rsp + 0xe8], rax
0x10040c065: jmp 0x10040c4df ; 0x10040c4df
0x10040c06a: mov rax, qword ptr [rip + 0x7fe4af] ; 0x100c0a520
0x10040c071: mov rcx, rax
0x10040c074: lea rax, [rcx + 0x18]
0x10040c078: mov qword ptr [rsp + 0x1580], rax
0x10040c080: lea rax, [rcx + 0x40]
0x10040c084: mov qword ptr [rsp + 0x16d0], rax
0x10040c08c: lea rdi, [rsp + 0x16d0]
0x10040c094: mov rsi, r14
0x10040c097: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x10040c09c: mov qword ptr [rsp + 0x10], r15
0x10040c0a1: mov qword ptr [rsp + 0x1758], 0
0x10040c0ad: mov dword ptr [rsp + 0x1760], 0xffffffff
0x10040c0b8: mov rax, qword ptr [rip + 0x801509] ; 0x100c0d5c8
0x10040c0bf: lea r15, [rax + 0x18]
0x10040c0c3: mov qword ptr [rsp + 0x1580], r15
0x10040c0cb: lea r12, [rax + 0x40]
0x10040c0cf: mov qword ptr [rsp + 0x16d0], r12
0x10040c0d7: mov edx, 1
0x10040c0dc: mov rdi, r14
0x10040c0df: lea rsi, [rip + 0x77b7e7] ; 0x100b878cd LevelObjects
0x10040c0e6: call 0x1007a56a0 ; 0x1007a56a0
0x10040c0eb: mov edx, 0xd
0x10040c0f0: lea rdi, [rsp + 0x1580]
0x10040c0f8: lea rsi, [rip + 0x77b8e8] ; 0x100b879e7 Unknown type 
0x10040c0ff: call 0x100011930 ; 0x100011930
0x10040c104: mov rbx, rax
0x10040c107: mov r14, qword ptr [rsp + 0x58]
0x10040c10c: mov rdi, r14
0x10040c10f: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x10040c114: mov rdi, rbx
0x10040c117: mov rsi, r14
0x10040c11a: mov rdx, rax
0x10040c11d: call 0x100011930 ; 0x100011930
0x10040c122: mov edx, 0x26
0x10040c127: mov rdi, rax
0x10040c12a: lea rsi, [rip + 0x77b8c4] ; 0x100b879f5 . System may become unstable or crash.
0x10040c131: call 0x100011930 ; 0x100011930
0x10040c136: mov rax, qword ptr [rsp + 0x10]
0x10040c13b: mov r14, qword ptr [rsp + 0x20]
0x10040c140: lea rcx, [rax + r14*4]
0x10040c144: mov qword ptr [rsp + 0x30], rcx
0x10040c149: mov qword ptr [rsp + 0x1580], r15
0x10040c151: mov rbx, rax
0x10040c154: mov qword ptr [rsp + 0x16d0], r12
0x10040c15c: lea rdi, [rsp + 0x1588]
0x10040c164: call 0x1007a58d0 ; 0x1007a58d0
0x10040c169: lea rdi, [rsp + 0x1580]
0x10040c171: mov rsi, qword ptr [rsp + 0x50]
0x10040c176: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10040c17b: lea rdi, [rsp + 0x16d0]
0x10040c183: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10040c188: mov rax, qword ptr [rsp + 0x30]
0x10040c18d: mov dword ptr [rax], 0xffffffff
0x10040c193: mov edi, dword ptr [rbx + r14*4 + 8]
0x10040c198: test rdi, rdi
0x10040c19b: je 0x10040d025
0x10040c1a1: mov rax, qword ptr [rsp + 0x1528]
0x10040c1a9: mov r8d, dword ptr [rbx + r14*4 + 4]
0x10040c1ae: lea rsi, [rdi - 1]
0x10040c1b2: mov ecx, edi
0x10040c1b4: and ecx, 3
0x10040c1b7: cmp rsi, 3
0x10040c1bb: jae 0x10040cfa9
0x10040c1c1: xor esi, esi
0x10040c1c3: test rcx, rcx
0x10040c1c6: jne 0x10040cffd
0x10040c1cc: jmp 0x10040d025 ; 0x10040d025
0x10040c1d1: mov rbx, qword ptr [rsp + 0x38]
0x10040c1d6: mov rax, qword ptr [rsp + 0x30]
0x10040c1db: cmp dword ptr [rbx + rax], 0
0x10040c1df: je 0x10040c1ea
0x10040c1e1: xor eax, eax
0x10040c1e3: mov qword ptr [rsp + 0x78], rax
0x10040c1e8: jmp 0x10040c21b ; 0x10040c21b
0x10040c1ea: call qword ptr [r14 + 0x28]
0x10040c1ee: mov rcx, qword ptr [rax]
0x10040c1f1: mov rdi, rax
0x10040c1f4: call qword ptr [rcx + 0x10]
0x10040c1f7: mov rcx, qword ptr [rsp + 0x30]
0x10040c1fc: mov ecx, dword ptr [rbx + rcx + 8]
0x10040c200: cmp rax, rcx
0x10040c203: lea rax, [rip + 0x77b82a] ; 0x100b87a34 MemVar is an incompatible size
0x10040c20a: mov rcx, rax
0x10040c20d: mov eax, 0
0x10040c212: cmove rcx, rax
0x10040c216: mov qword ptr [rsp + 0x78], rcx
0x10040c21b: call qword ptr [r14 + 0x28]
0x10040c21f: mov r15, qword ptr [rsp + 0x10]
0x10040c224: mov rcx, qword ptr [rax]
0x10040c227: mov rdi, rax
0x10040c22a: call qword ptr [rcx + 0x50]
0x10040c22d: mov r12d, eax
0x10040c230: call qword ptr [r14 + 0x28]
0x10040c234: mov rcx, qword ptr [rax]
0x10040c237: mov rdi, rax
0x10040c23a: call qword ptr [rcx + 0x68]
0x10040c23d: mov rcx, qword ptr [rsp + 0x30]
0x10040c242: lea rdx, [rbx + rcx]
0x10040c246: test rax, rax
0x10040c249: je 0x10040c2bd
0x10040c24b: cmp qword ptr [r14 + 0x38], -1
0x10040c250: lea rsi, [rsp + 0x1588]
0x10040c258: jne 0x10040c265
0x10040c25a: cmp qword ptr [r14 + 0x48], 0
0x10040c25f: je 0x10040c346
0x10040c265: cmp dword ptr [rdx], 3
0x10040c268: lea rax, [rip + 0x77b7e4] ; 0x100b87a53 MemVar is an incompatible type
0x10040c26f: jne 0x10040c2e6
0x10040c271: mov rax, qword ptr [rsp + 0x30]
0x10040c276: mov r12d, dword ptr [rbx + rax + 0xc]
0x10040c27b: cmp r12d, -1
0x10040c27f: je 0x10040c2e1
0x10040c281: mov rbx, rdx
0x10040c284: call qword ptr [r14 + 0x28]
0x10040c288: mov rcx, qword ptr [rax]
0x10040c28b: mov rdi, rax
0x10040c28e: call qword ptr [rcx + 0x68]
0x10040c291: mov ecx, dword ptr [rax + 0x38]
0x10040c294: mov rax, qword ptr [rsp + 0x78]
0x10040c299: lea rdx, [rip + 0x77b7d2] ; 0x100b87a72 Array elements are incompatible types
0x10040c2a0: cmp r12d, dword ptr [rsp + rcx*4 + 0x110]
0x10040c2a8: mov r12, rdx
0x10040c2ab: lea rsi, [rsp + 0x1588]
0x10040c2b3: mov rdx, rbx
0x10040c2b6: je 0x10040c2e6
0x10040c2b8: jmp 0x10040c5e8 ; 0x10040c5e8
0x10040c2bd: movzx eax, r12b
0x10040c2c1: lea rsi, [rsp + 0x1588]
0x10040c2c9: cmp dword ptr [rdx], eax
0x10040c2cb: mov rax, qword ptr [rsp + 0x78]
0x10040c2d0: lea rcx, [rip + 0x77b77c] ; 0x100b87a53 MemVar is an incompatible type
0x10040c2d7: mov r12, rcx
0x10040c2da: je 0x10040c2e6
0x10040c2dc: jmp 0x10040c5e8 ; 0x10040c5e8
0x10040c2e1: mov rax, qword ptr [rsp + 0x78]
0x10040c2e6: mov r12, rax
0x10040c2e9: test rax, rax
0x10040c2ec: jne 0x10040c5e8
0x10040c2f2: cmp dword ptr [rdx], 3
0x10040c2f5: mov r13, qword ptr [rsp + 0x18]
0x10040c2fa: je 0x10040c38e
0x10040c300: mov r12, rdx
0x10040c303: call qword ptr [r14 + 0x30]
0x10040c307: mov rbx, rax
0x10040c30a: mov rax, qword ptr [rbx]
0x10040c30d: mov r15, qword ptr [rax + 0xe0]
0x10040c314: mov rdi, qword ptr [rsp + 0x48]
0x10040c319: mov rax, qword ptr [rdi]
0x10040c31c: call qword ptr [rax + 0x68]
0x10040c31f: mov rcx, qword ptr [r14 + 0x20]
0x10040c323: mov rdi, rbx
0x10040c326: lea rsi, [rsp + 0x68]
0x10040c32b: mov rdx, rax
0x10040c32e: call r15
0x10040c331: cmp qword ptr [r14 + 0x38], -1
0x10040c336: je 0x10040c33f
0x10040c338: cmp qword ptr [r14 + 0x48], 0
0x10040c33d: je 0x10040c350
0x10040c33f: mov r15, qword ptr [rsp + 0x10]
0x10040c344: jmp 0x10040c361 ; 0x10040c361
0x10040c346: mov eax, 2
0x10040c34b: jmp 0x10040c2c9 ; 0x10040c2c9
0x10040c350: mov rax, qword ptr [rax]
0x10040c353: test rax, rax
0x10040c356: mov r15, qword ptr [rsp + 0x10]
0x10040c35b: je 0x10040d43e
0x10040c361: sub rax, qword ptr [rsp + 0x68]
0x10040c366: mov rcx, qword ptr [rsp + 0x28]
0x10040c36b: shl rcx, 5
0x10040c36f: mov rdx, qword ptr [rsp + 0x60]
0x10040c374: mov qword ptr [rdx + rcx], rax
0x10040c378: mov rdx, r12
0x10040c37b: mov eax, dword ptr [rdx]
0x10040c37d: and eax, 0xfffffffe
0x10040c380: cmp eax, 2
0x10040c383: mov r13, qword ptr [rsp + 0x18]
0x10040c388: jne 0x10040c76d
0x10040c38e: mov rbx, rdx
0x10040c391: mov qword ptr [rsp + 0x1580], 0x100000
0x10040c39d: call qword ptr [r14 + 0x28]
0x10040c3a1: mov rcx, qword ptr [rax]
0x10040c3a4: mov rdi, rax
0x10040c3a7: call qword ptr [rcx + 0x68]
0x10040c3aa: mov rcx, qword ptr [rax]
0x10040c3ad: mov rdi, rax
0x10040c3b0: lea rsi, [rsp + 0x1580]
0x10040c3b8: call qword ptr [rcx + 0xd0]
0x10040c3be: sub rax, qword ptr [rsp + 0x1580]
0x10040c3c6: mov rdx, qword ptr [rsp + 0x28]
0x10040c3cb: shl rdx, 5
0x10040c3cf: mov rcx, qword ptr [rsp + 0x60]
0x10040c3d4: mov qword ptr [rsp + 0x28], rdx
0x10040c3d9: mov qword ptr [rcx + rdx + 8], rax
0x10040c3de: cmp dword ptr [rbx], 3
0x10040c3e1: jne 0x10040c76d
0x10040c3e7: mov rax, qword ptr [rsp + 0x60]
0x10040c3ec: mov rcx, qword ptr [rsp + 0x28]
0x10040c3f1: mov qword ptr [rax + rcx + 0x10], r14
0x10040c3f6: mov rbx, qword ptr [r14 + 8]
0x10040c3fa: test rbx, rbx
0x10040c3fd: lea r15, [rip + 0x76e87a] ; 0x100b7ac7e ArrayAllocator
0x10040c404: je 0x10040d478
0x10040c40a: mov rsi, qword ptr [rbx]
0x10040c40d: mov rdi, r15
0x10040c410: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10040c415: test eax, eax
0x10040c417: je 0x10040c427
0x10040c419: mov rbx, qword ptr [rbx + 0x10]
0x10040c41d: test rbx, rbx
0x10040c420: jne 0x10040c40a
0x10040c422: jmp 0x10040d478 ; 0x10040d478
0x10040c427: mov r15, qword ptr [rbx + 8]
0x10040c42b: mov r12, qword ptr [rsp + 0x48]
0x10040c430: mov r14, qword ptr [r12 + 0x50]
0x10040c435: mov rbx, qword ptr [r14 + 8]
0x10040c439: add r14, 8
0x10040c43d: test rbx, rbx
0x10040c440: je 0x10040c487
0x10040c442: mov r13, r14
0x10040c445: nop word ptr cs:[rax + rax]
0x10040c450: mov rdi, qword ptr [rbx + 0x20]
0x10040c454: mov rsi, r15
0x10040c457: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10040c45c: lea rcx, [rbx + 8]
0x10040c460: test eax, eax
0x10040c462: cmovns rcx, rbx
0x10040c466: cmovns r13, rbx
0x10040c46a: mov rbx, qword ptr [rcx]
0x10040c46d: test rbx, rbx
0x10040c470: jne 0x10040c450
0x10040c472: cmp r13, r14
0x10040c475: je 0x10040c487
0x10040c477: mov rsi, qword ptr [r13 + 0x20]
0x10040c47b: mov rdi, r15
0x10040c47e: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10040c483: test eax, eax
0x10040c485: jns 0x10040c48a
0x10040c487: mov r13, r14
0x10040c48a: cmp r14, r13
0x10040c48d: je 0x10040c498
0x10040c48f: mov rax, qword ptr [r13 + 0x28]
0x10040c493: test rax, rax
0x10040c496: jne 0x10040c4cb
0x10040c498: mov rax, qword ptr [r12 + 0x30]
0x10040c49d: test rax, rax
0x10040c4a0: mov r13, qword ptr [rsp + 0x18]
0x10040c4a5: je 0x10040d4b3
0x10040c4ab: call rax
0x10040c4ad: mov rax, qword ptr [r12 + 0x30]
0x10040c4b2: mov r12d, 0
0x10040c4b8: test rax, rax
0x10040c4bb: je 0x10040c430
0x10040c4c1: call rax
0x10040c4c3: mov r12, rax
0x10040c4c6: jmp 0x10040c430 ; 0x10040c430
0x10040c4cb: mov rcx, qword ptr [rsp + 0x60]
0x10040c4d0: mov rdx, qword ptr [rsp + 0x28]
0x10040c4d5: mov qword ptr [rcx + rdx + 0x18], rax
0x10040c4da: jmp 0x10040c763 ; 0x10040c763
0x10040c4df: mov rsi, qword ptr [rsp + 0x1528]
0x10040c4e7: mov rdx, qword ptr [rsp + 0x1530]
0x10040c4ef: mov qword ptr [rsp + 0x60], rdx
0x10040c4f4: mov eax, dword ptr [rax]
0x10040c4f6: mov dword ptr [rsp + 0x80], ecx
0x10040c4fd: add eax, ecx
0x10040c4ff: mov qword ptr [rsp + 0x28], rax
0x10040c504: mov rcx, rax
0x10040c507: shl rcx, 4
0x10040c50b: lea rax, [rsi + rcx + 4]
0x10040c510: mov qword ptr [rsp + 0xa0], rax
0x10040c518: mov qword ptr [rsp + 0x38], rsi
0x10040c51d: mov qword ptr [rsp + 0x30], rcx
0x10040c522: mov r13d, dword ptr [rsi + rcx + 4]
0x10040c527: add r13, qword ptr [rsp + 0x1550]
0x10040c52f: mov r12, rbx
0x10040c532: nop word ptr cs:[rax + rax]
0x10040c540: mov r14, qword ptr [r12 + 0x48]
0x10040c545: mov r15, qword ptr [r14 + 8]
0x10040c549: add r14, 8
0x10040c54d: test r15, r15
0x10040c550: je 0x10040c597
0x10040c552: mov rbx, r14
0x10040c555: nop word ptr cs:[rax + rax]
0x10040c560: mov rdi, qword ptr [r15 + 0x20]
0x10040c564: mov rsi, r13
0x10040c567: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10040c56c: lea rcx, [r15 + 8]
0x10040c570: test eax, eax
0x10040c572: cmovns rcx, r15
0x10040c576: cmovns rbx, r15
0x10040c57a: mov r15, qword ptr [rcx]
0x10040c57d: test r15, r15
0x10040c580: jne 0x10040c560
0x10040c582: cmp rbx, r14
0x10040c585: je 0x10040c597
0x10040c587: mov rsi, qword ptr [rbx + 0x20]
0x10040c58b: mov rdi, r13
0x10040c58e: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10040c593: test eax, eax
0x10040c595: jns 0x10040c59a
0x10040c597: mov rbx, r14
0x10040c59a: cmp r14, rbx
0x10040c59d: je 0x10040c5ac
0x10040c59f: mov r14, qword ptr [rbx + 0x28]
0x10040c5a3: test r14, r14
0x10040c5a6: jne 0x10040c1d1
0x10040c5ac: mov rcx, qword ptr [r12 + 0x30]
0x10040c5b1: test rcx, rcx
0x10040c5b4: je 0x10040c5d6
0x10040c5b6: call rcx
0x10040c5b8: mov rax, qword ptr [r12 + 0x30]
0x10040c5bd: mov r12d, 0
0x10040c5c3: test rax, rax
0x10040c5c6: je 0x10040c540
0x10040c5cc: call rax
0x10040c5ce: mov r12, rax
0x10040c5d1: jmp 0x10040c540 ; 0x10040c540
0x10040c5d6: lea rax, [rip + 0x77b43f] ; 0x100b87a1c MemVar no longer exists
0x10040c5dd: mov r12, rax
0x10040c5e0: lea rsi, [rsp + 0x1588]
0x10040c5e8: mov rax, qword ptr [rip + 0x7fdf31] ; 0x100c0a520
0x10040c5ef: mov rcx, rax
0x10040c5f2: lea rax, [rcx + 0x18]
0x10040c5f6: mov qword ptr [rsp + 0x1580], rax
0x10040c5fe: lea rax, [rcx + 0x40]
0x10040c602: mov qword ptr [rsp + 0x16d0], rax
0x10040c60a: lea r14, [rsp + 0x16d0]
0x10040c612: mov rdi, r14
0x10040c615: mov r14, rsi
0x10040c618: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x10040c61d: mov qword ptr [rsp + 0x1758], 0
0x10040c629: mov dword ptr [rsp + 0x1760], 0xffffffff
0x10040c634: mov rax, qword ptr [rip + 0x800f8d] ; 0x100c0d5c8
0x10040c63b: lea r15, [rax + 0x18]
0x10040c63f: mov qword ptr [rsp + 0x1580], r15
0x10040c647: lea rbx, [rax + 0x40]
0x10040c64b: mov qword ptr [rsp + 0x16d0], rbx
0x10040c653: mov edx, 1
0x10040c658: mov rdi, r14
0x10040c65b: lea rsi, [rip + 0x77b26b] ; 0x100b878cd LevelObjects
0x10040c662: call 0x1007a56a0 ; 0x1007a56a0
0x10040c667: mov qword ptr [rsp + 0x30], rbx
0x10040c66c: mov r14, r12
0x10040c66f: mov edx, 0xc
0x10040c674: lea rdi, [rsp + 0x1580]
0x10040c67c: lea rsi, [rip + 0x77b415] ; 0x100b87a98 Cannot load 
0x10040c683: call 0x100011930 ; 0x100011930
0x10040c688: mov r12, rax
0x10040c68b: mov rbx, qword ptr [rsp + 0x58]
0x10040c690: mov rdi, rbx
0x10040c693: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x10040c698: mov rdi, r12
0x10040c69b: mov rsi, rbx
0x10040c69e: mov rdx, rax
0x10040c6a1: call 0x100011930 ; 0x100011930
0x10040c6a6: mov edx, 2
0x10040c6ab: mov rdi, rax
0x10040c6ae: lea rsi, [rip + 0x77b3f0] ; 0x100b87aa5 ::
0x10040c6b5: call 0x100011930 ; 0x100011930
0x10040c6ba: mov r12, rax
0x10040c6bd: mov rdi, r13
0x10040c6c0: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x10040c6c5: mov rdi, r12
0x10040c6c8: mov rsi, r13
0x10040c6cb: mov rdx, rax
0x10040c6ce: call 0x100011930 ; 0x100011930
0x10040c6d3: mov edx, 2
0x10040c6d8: mov rdi, rax
0x10040c6db: lea rsi, [rip + 0x77b3c6] ; 0x100b87aa8 . 
0x10040c6e2: call 0x100011930 ; 0x100011930
0x10040c6e7: mov rbx, rax
0x10040c6ea: mov rdi, r14
0x10040c6ed: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x10040c6f2: mov rdi, rbx
0x10040c6f5: mov rsi, r14
0x10040c6f8: mov rdx, rax
0x10040c6fb: call 0x100011930 ; 0x100011930
0x10040c700: mov edx, 0x26
0x10040c705: mov rdi, rax
0x10040c708: lea rsi, [rip + 0x77b2e6] ; 0x100b879f5 . System may become unstable or crash.
0x10040c70f: call 0x100011930 ; 0x100011930
0x10040c714: mov qword ptr [rsp + 0x1580], r15
0x10040c71c: mov rax, qword ptr [rsp + 0x30]
0x10040c721: mov qword ptr [rsp + 0x16d0], rax
0x10040c729: lea rdi, [rsp + 0x1588]
0x10040c731: call 0x1007a58d0 ; 0x1007a58d0
0x10040c736: lea rdi, [rsp + 0x1580]
0x10040c73e: mov rsi, qword ptr [rsp + 0x50]
0x10040c743: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10040c748: lea rdi, [rsp + 0x16d0]
0x10040c750: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10040c755: mov rax, qword ptr [rsp + 0xa0]
0x10040c75d: mov dword ptr [rax], 0xffffffff
0x10040c763: mov r13, qword ptr [rsp + 0x18]
0x10040c768: mov r15, qword ptr [rsp + 0x10]
0x10040c76d: mov ecx, dword ptr [rsp + 0x80]
0x10040c774: inc ecx
0x10040c776: mov rax, qword ptr [rsp + 0xc8]
0x10040c77e: cmp ecx, dword ptr [rax]
0x10040c780: mov rbx, qword ptr [rsp + 0x48]
0x10040c785: mov rsi, qword ptr [rsp + 0x20]
0x10040c78a: mov rax, qword ptr [rsp + 0xe8]
0x10040c792: jb 0x10040c4df
0x10040c798: mov eax, dword ptr [rsp + 0x1548]
0x10040c79f: mov rcx, qword ptr [rsp + 0xa8]
0x10040c7a7: mov rdx, qword ptr [rsp + 0xb8]
0x10040c7af: mov dword ptr [rdx + rcx*8], eax
0x10040c7b2: mov dword ptr [rdx + rcx*8 + 4], 0
0x10040c7ba: lea rax, [r15 + rsi*4 + 4]
0x10040c7bf: mov qword ptr [rsp + 0xa0], rax
0x10040c7c7: mov rsi, rbx
0x10040c7ca: mov rax, qword ptr [rsi + 0x48]
0x10040c7ce: mov rdx, qword ptr [rax]
0x10040c7d1: add rax, 8
0x10040c7d5: cmp rdx, rax
0x10040c7d8: mov qword ptr [rsp + 0x80], rsi
0x10040c7e0: jne 0x10040c820
0x10040c7e2: mov rax, qword ptr [rsi + 0x30]
0x10040c7e6: test rax, rax
0x10040c7e9: je 0x10040d046
0x10040c7ef: call rax
0x10040c7f1: mov rsi, rax
0x10040c7f4: jmp 0x10040c7ca ; 0x10040c7ca
0x10040c7f6: mov rax, qword ptr [rsp + 0x28]
0x10040c7fb: mov dword ptr [rax], 1
0x10040c801: mov rax, qword ptr [rsp + 0x38]
0x10040c806: mov qword ptr [r12 + rax + 0xc], r15
0x10040c80b: mov dword ptr [r12 + rax + 4], 8
0x10040c814: mov r15, qword ptr [rsp + 0x10]
0x10040c819: jmp 0x10040cec3 ; 0x10040cec3
0x10040c81e: nop 
0x10040c820: mov rax, qword ptr [rdx + 0x20]
0x10040c824: mov qword ptr [rsp + 0x20], rax
0x10040c829: mov qword ptr [rsp + 0x30], rdx
0x10040c82e: mov rax, qword ptr [rdx + 0x28]
0x10040c832: mov qword ptr [rsp + 0x10], rax
0x10040c837: mov rax, qword ptr [rsp + 0xc8]
0x10040c83f: mov r13d, dword ptr [rax]
0x10040c842: test r13d, r13d
0x10040c845: je 0x10040c8ae
0x10040c847: mov r15, qword ptr [rsp + 0x1528]
0x10040c84f: mov rbx, qword ptr [rsp + 0x1550]
0x10040c857: mov rax, qword ptr [rsp + 0xa0]
0x10040c85f: mov r12d, dword ptr [rax]
0x10040c862: xor r14d, r14d
0x10040c865: nop word ptr cs:[rax + rax]
0x10040c870: lea eax, [r12 + r14]
0x10040c874: shl rax, 4
0x10040c878: mov eax, dword ptr [r15 + rax + 4]
0x10040c87d: lea rdi, [rbx + rax]
0x10040c881: mov ecx, 0xffffffff
0x10040c886: cmp rax, rcx
0x10040c889: lea rax, [rip + 0x798548] ; 0x100ba4dd8
0x10040c890: cmove rdi, rax
0x10040c894: mov rsi, qword ptr [rsp + 0x20]
0x10040c899: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10040c89e: test eax, eax
0x10040c8a0: je 0x10040cf30
0x10040c8a6: inc r14d
0x10040c8a9: cmp r14d, r13d
0x10040c8ac: jb 0x10040c870
0x10040c8ae: mov rax, qword ptr [rsp + 0x10]
0x10040c8b3: mov r15, qword ptr [rax + 8]
0x10040c8b7: test r15, r15
0x10040c8ba: je 0x10040cf30
0x10040c8c0: mov rsi, qword ptr [r15]
0x10040c8c3: lea rdi, [rip + 0x752138] ; 0x100b5ea02 Tool_DefaultValue
0x10040c8ca: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10040c8cf: test eax, eax
0x10040c8d1: je 0x10040c8e1
0x10040c8d3: mov r15, qword ptr [r15 + 0x10]
0x10040c8d7: test r15, r15
0x10040c8da: jne 0x10040c8c0
0x10040c8dc: jmp 0x10040cf30 ; 0x10040cf30
0x10040c8e1: mov r12, qword ptr [rsp + 0x1540]
0x10040c8e9: mov ebx, dword ptr [rsp + 0x1548]
0x10040c8f0: lea eax, [rbx + 1]
0x10040c8f3: mov dword ptr [rsp + 0x1548], eax
0x10040c8fa: mov rax, qword ptr [rsp + 0xa8]
0x10040c902: mov rcx, qword ptr [rsp + 0xb8]
0x10040c90a: inc dword ptr [rcx + rax*8 + 4]
0x10040c90e: mov r13, qword ptr [rsp + 0x18]
0x10040c913: mov rax, qword ptr [rsp + 0x10]
0x10040c918: call qword ptr [rax + 0x28]
0x10040c91b: lea r14, [rsp + 0x1580]
0x10040c923: mov rcx, qword ptr [rax]
0x10040c926: mov rdi, rax
0x10040c929: call qword ptr [rcx + 0x48]
0x10040c92c: lea rcx, [rbx + rbx*8]
0x10040c930: lea rcx, [rcx + rcx*2]
0x10040c934: add rcx, rbx
0x10040c937: mov qword ptr [rsp + 0x38], rcx
0x10040c93c: lea rcx, [r12 + rcx]
0x10040c940: test al, al
0x10040c942: jne 0x10040ca9f
0x10040c948: mov qword ptr [rsp + 0x28], rcx
0x10040c94d: mov rax, qword ptr [rsp + 0x10]
0x10040c952: call qword ptr [rax + 0x28]
0x10040c955: mov rbx, rax
0x10040c958: mov byte ptr [rsp + 0x1580], 0
0x10040c960: mov rdi, r14
0x10040c963: call 0x1007abbd0 ; 0x1007abbd0
0x10040c968: cmp rbx, rax
0x10040c96b: mov rcx, qword ptr [rsp + 0x28]
0x10040c970: je 0x10040ca9f
0x10040c976: mov rax, qword ptr [rsp + 0x10]
0x10040c97b: call qword ptr [rax + 0x28]
0x10040c97e: mov rbx, rax
0x10040c981: mov rdi, r14
0x10040c984: call 0x1007fa330 ; 0x1007fa330
0x10040c989: cmp rbx, rax
0x10040c98c: je 0x10040cc78
0x10040c992: mov rax, qword ptr [rsp + 0x10]
0x10040c997: call qword ptr [rax + 0x28]
0x10040c99a: mov rbx, rax
0x10040c99d: mov rdi, r14
0x10040c9a0: call 0x1007fa350 ; 0x1007fa350
0x10040c9a5: cmp rbx, rax
0x10040c9a8: je 0x10040cc78
0x10040c9ae: mov rax, qword ptr [rsp + 0x10]
0x10040c9b3: call qword ptr [rax + 0x28]
0x10040c9b6: mov rbx, rax
0x10040c9b9: lea rax, [rip + 0x1c32d20] ; 0x10203f6e0
0x10040c9c0: vmovaps xmm0, xmmword ptr [rax]
0x10040c9c4: vmovaps xmmword ptr [rsp + 0x1580], xmm0
0x10040c9cd: mov rdi, r14
0x10040c9d0: call 0x10077d810 ; 0x10077d810
0x10040c9d5: cmp rbx, rax
0x10040c9d8: je 0x10040cc78
0x10040c9de: mov rax, qword ptr [rsp + 0x10]
0x10040c9e3: call qword ptr [rax + 0x28]
0x10040c9e6: mov rbx, rax
0x10040c9e9: mov rdi, r14
0x10040c9ec: call 0x1007fa370 ; 0x1007fa370
0x10040c9f1: cmp rbx, rax
0x10040c9f4: je 0x10040cc78
0x10040c9fa: mov rax, qword ptr [rsp + 0x10]
0x10040c9ff: call qword ptr [rax + 0x28]
0x10040ca02: mov rbx, rax
0x10040ca05: xor edi, edi
0x10040ca07: xor esi, esi
0x10040ca09: call 0x100020a00 ; 0x100020a00
0x10040ca0e: cmp rbx, rax
0x10040ca11: je 0x10040c7f6
0x10040ca17: mov rax, qword ptr [rsp + 0x10]
0x10040ca1c: call qword ptr [rax + 0x28]
0x10040ca1f: mov rcx, qword ptr [rax]
0x10040ca22: mov rdi, rax
0x10040ca25: call qword ptr [rcx + 0x68]
0x10040ca28: test rax, rax
0x10040ca2b: je 0x10040d526
0x10040ca31: mov rax, qword ptr [rsp + 0x10]
0x10040ca36: cmp qword ptr [rax + 0x38], -1
0x10040ca3b: jne 0x10040d526
0x10040ca41: mov rax, qword ptr [rsp + 0x10]
0x10040ca46: cmp qword ptr [rax + 0x48], 0
0x10040ca4b: jne 0x10040d526
0x10040ca51: mov rax, qword ptr [rsp + 0x28]
0x10040ca56: mov dword ptr [rax], 2
0x10040ca5c: mov rbx, qword ptr [r15 + 8]
0x10040ca60: mov rdi, rbx
0x10040ca63: lea rsi, [rip + 0x75202d] ; 0x100b5ea97 null
0x10040ca6a: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10040ca6f: test eax, eax
0x10040ca71: je 0x10040ca8a
0x10040ca73: mov rdi, rbx
0x10040ca76: lea rsi, [rip + 0x751f97] ; 0x100b5ea14 NULL
0x10040ca7d: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10040ca82: test eax, eax
0x10040ca84: jne 0x10040d55f
0x10040ca8a: vxorps xmm0, xmm0, xmm0
0x10040ca8e: mov rax, qword ptr [rsp + 0x38]
0x10040ca93: vmovups xmmword ptr [r12 + rax + 0xc], xmm0
0x10040ca9a: jmp 0x10040c80b ; 0x10040c80b
0x10040ca9f: mov dword ptr [rcx], 0
0x10040caa5: mov qword ptr [rsp + 0x90], 0
0x10040cab1: mov rdi, qword ptr [r15 + 8]
0x10040cab5: lea rsi, [rsp + 0x90]
0x10040cabd: call 0x100aa2cb4 ; 0x100aa2cb4 _strtod
0x10040cac2: vmovsd qword ptr [rsp + 0x40], xmm0
0x10040cac8: mov r13, qword ptr [rsp + 0x90]
0x10040cad0: cmp r13, qword ptr [r15 + 8]
0x10040cad4: mov r15, qword ptr [rsp + 0x10]
0x10040cad9: jne 0x10040cbb6
0x10040cadf: mov rdi, r13
0x10040cae2: lea rsi, [rip + 0x751ef6] ; 0x100b5e9df true
0x10040cae9: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10040caee: mov ebx, eax
0x10040caf0: mov rdi, r13
0x10040caf3: lea rsi, [rip + 0x796532] ; 0x100ba302c false
0x10040cafa: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10040caff: vmovsd xmm0, qword ptr [rip + 0x6993a9] ; 0x100aa5eb0
0x10040cb07: test ebx, ebx
0x10040cb09: je 0x10040cb0f
0x10040cb0b: vxorps xmm0, xmm0, xmm0
0x10040cb0f: vmovsd qword ptr [rsp + 0x40], xmm0
0x10040cb15: je 0x10040cbb6
0x10040cb1b: test eax, eax
0x10040cb1d: je 0x10040cbb6
0x10040cb23: mov rcx, qword ptr [rsp + 0x88]
0x10040cb2b: mov rbx, qword ptr [rcx]
0x10040cb2e: test rbx, rbx
0x10040cb31: je 0x10040cb87
0x10040cb33: mov r14, rcx
0x10040cb36: nop word ptr cs:[rax + rax]
0x10040cb40: mov rdi, qword ptr [rbx + 0x20]
0x10040cb44: mov rsi, r13
0x10040cb47: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10040cb4c: lea rcx, [rbx + 8]
0x10040cb50: test eax, eax
0x10040cb52: cmovns rcx, rbx
0x10040cb56: cmovns r14, rbx
0x10040cb5a: mov rbx, qword ptr [rcx]
0x10040cb5d: test rbx, rbx
0x10040cb60: jne 0x10040cb40
0x10040cb62: mov rcx, qword ptr [rsp + 0x88]
0x10040cb6a: cmp r14, rcx
0x10040cb6d: je 0x10040cb87
0x10040cb6f: mov rsi, qword ptr [r14 + 0x20]
0x10040cb73: mov rdi, r13
0x10040cb76: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10040cb7b: mov rcx, qword ptr [rsp + 0x88]
0x10040cb83: test eax, eax
0x10040cb85: jns 0x10040cb8a
0x10040cb87: mov r14, rcx
0x10040cb8a: cmp rcx, r14
0x10040cb8d: je 0x10040d4e8
0x10040cb93: mov rbx, qword ptr [r14 + 0x28]
0x10040cb97: test rbx, rbx
0x10040cb9a: je 0x10040d4e8
0x10040cba0: call qword ptr [rbx + 0x28]
0x10040cba3: mov rcx, qword ptr [rax]
0x10040cba6: mov rsi, qword ptr [rbx + 0x20]
0x10040cbaa: mov rdi, rax
0x10040cbad: call qword ptr [rcx + 0x58]
0x10040cbb0: vmovsd qword ptr [rsp + 0x40], xmm0
0x10040cbb6: mov qword ptr [rsp + 0x20], r12
0x10040cbbb: mov r13, qword ptr [rsp + 0x18]
0x10040cbc0: call 0x1007c6c20 ; 0x1007c6c20
0x10040cbc5: lea rcx, [rip + 0x1c3bf84] ; 0x102048b50
0x10040cbcc: mov rdx, qword ptr [rcx]
0x10040cbcf: mov esi, 0x10
0x10040cbd4: mov ecx, 0x10
0x10040cbd9: mov rdi, rax
0x10040cbdc: call 0x100795530 ; 0x100795530
0x10040cbe1: mov r12, rax
0x10040cbe4: call qword ptr [r15 + 0x28]
0x10040cbe8: mov rbx, rax
0x10040cbeb: mov rax, qword ptr [rbx]
0x10040cbee: mov r14, qword ptr [rax + 0x40]
0x10040cbf2: mov qword ptr [rsp + 0x1580], 0
0x10040cbfe: lea rdi, [rsp + 0x1580]
0x10040cc06: call 0x1007abb70 ; 0x1007abb70
0x10040cc0b: mov rdi, rbx
0x10040cc0e: mov rsi, r12
0x10040cc11: lea rdx, [rsp + 0x40]
0x10040cc16: mov rcx, rax
0x10040cc19: call r14
0x10040cc1c: call qword ptr [r15 + 0x28]
0x10040cc20: mov rcx, qword ptr [rax]
0x10040cc23: mov rdi, rax
0x10040cc26: call qword ptr [rcx + 0x10]
0x10040cc29: mov rcx, qword ptr [rsp + 0x38]
0x10040cc2e: mov rdx, qword ptr [rsp + 0x20]
0x10040cc33: lea rdi, [rdx + rcx + 0xc]
0x10040cc38: mov rsi, r12
0x10040cc3b: mov rdx, rax
0x10040cc3e: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x10040cc43: call qword ptr [r15 + 0x28]
0x10040cc47: mov rcx, qword ptr [rax]
0x10040cc4a: mov rdi, rax
0x10040cc4d: call qword ptr [rcx + 0x10]
0x10040cc50: mov rcx, qword ptr [rsp + 0x38]
0x10040cc55: mov rdx, qword ptr [rsp + 0x20]
0x10040cc5a: mov dword ptr [rdx + rcx + 4], eax
0x10040cc5e: call 0x1007c6c20 ; 0x1007c6c20
0x10040cc63: mov rdi, rax
0x10040cc66: mov rsi, r12
0x10040cc69: call 0x100795a70 ; 0x100795a70
0x10040cc6e: mov r12, qword ptr [rsp + 0x20]
0x10040cc73: jmp 0x10040cec3 ; 0x10040cec3
0x10040cc78: mov rax, qword ptr [rsp + 0x28]
0x10040cc7d: mov dword ptr [rax], 0
0x10040cc83: vxorps ymm0, ymm0, ymm0
0x10040cc87: vmovaps ymmword ptr [rsp + 0x15e0], ymm0
0x10040cc90: vmovaps ymmword ptr [rsp + 0x15c0], ymm0
0x10040cc99: vmovaps ymmword ptr [rsp + 0x15a0], ymm0
0x10040cca2: vmovaps ymmword ptr [rsp + 0x1580], ymm0
0x10040ccab: mov rsi, qword ptr [r15 + 8]
0x10040ccaf: mov edx, 0x7f
0x10040ccb4: mov rdi, r14
0x10040ccb7: vzeroupper 
0x10040ccba: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x10040ccbf: mov rdi, r14
0x10040ccc2: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x10040ccc7: test eax, eax
0x10040ccc9: lea rbx, [rsp + 0x40]
0x10040ccce: movabs rdi, 0x130000000000
0x10040ccd8: je 0x10040ce1b
0x10040ccde: mov ecx, eax
0x10040cce0: lea rdx, [rcx - 1]
0x10040cce4: and eax, 3
0x10040cce7: cmp rdx, 3
0x10040cceb: jae 0x10040ccfd
0x10040cced: xor edx, edx
0x10040ccef: test rax, rax
0x10040ccf2: jne 0x10040cdda
0x10040ccf8: jmp 0x10040ce1b ; 0x10040ce1b
0x10040ccfd: sub rcx, rax
0x10040cd00: xor edx, edx
0x10040cd02: nop word ptr cs:[rax + rax]
0x10040cd10: movzx esi, byte ptr [rsp + rdx + 0x1580]
0x10040cd18: cmp rsi, 0x2c
0x10040cd1c: ja 0x10040cd24
0x10040cd1e: bt rdi, rsi
0x10040cd22: jb 0x10040cd30
0x10040cd24: cmp sil, 0x7d
0x10040cd28: je 0x10040cd30
0x10040cd2a: cmp sil, 0x7b
0x10040cd2e: jne 0x10040cd38
0x10040cd30: mov byte ptr [rsp + rdx + 0x1580], 0x20
0x10040cd38: movzx esi, byte ptr [rsp + rdx + 0x1581]
0x10040cd40: cmp rsi, 0x2c
0x10040cd44: ja 0x10040cd4c
0x10040cd46: bt rdi, rsi
0x10040cd4a: jb 0x10040cd60
0x10040cd4c: cmp sil, 0x7b
0x10040cd50: je 0x10040cd60
0x10040cd52: cmp sil, 0x7d
0x10040cd56: jne 0x10040cd68
0x10040cd58: nop dword ptr [rax + rax]
0x10040cd60: mov byte ptr [rsp + rdx + 0x1581], 0x20
0x10040cd68: movzx esi, byte ptr [rsp + rdx + 0x1582]
0x10040cd70: cmp rsi, 0x2c
0x10040cd74: ja 0x10040cd7c
0x10040cd76: bt rdi, rsi
0x10040cd7a: jb 0x10040cd90
0x10040cd7c: cmp sil, 0x7d
0x10040cd80: je 0x10040cd90
0x10040cd82: cmp sil, 0x7b
0x10040cd86: jne 0x10040cd98
0x10040cd88: nop dword ptr [rax + rax]
0x10040cd90: mov byte ptr [rsp + rdx + 0x1582], 0x20
0x10040cd98: movzx esi, byte ptr [rsp + rdx + 0x1583]
0x10040cda0: cmp rsi, 0x2c
0x10040cda4: ja 0x10040cdac
0x10040cda6: bt rdi, rsi
0x10040cdaa: jb 0x10040cdc0
0x10040cdac: cmp sil, 0x7d
0x10040cdb0: je 0x10040cdc0
0x10040cdb2: cmp sil, 0x7b
0x10040cdb6: jne 0x10040cdc8
0x10040cdb8: nop dword ptr [rax + rax]
0x10040cdc0: mov byte ptr [rsp + rdx + 0x1583], 0x20
0x10040cdc8: add rdx, 4
0x10040cdcc: cmp rcx, rdx
0x10040cdcf: jne 0x10040cd10
0x10040cdd5: test rax, rax
0x10040cdd8: je 0x10040ce1b
0x10040cdda: lea rcx, [rsp + rdx + 0x1580]
0x10040cde2: neg rax
0x10040cde5: nop word ptr cs:[rax + rax]
0x10040cdf0: movzx edx, byte ptr [rcx]
0x10040cdf3: cmp rdx, 0x2c
0x10040cdf7: ja 0x10040ce00
0x10040cdf9: bt rdi, rdx
0x10040cdfd: jb 0x10040ce10
0x10040cdff: nop 
0x10040ce00: cmp dl, 0x7d
0x10040ce03: je 0x10040ce10
0x10040ce05: cmp dl, 0x7b
0x10040ce08: jne 0x10040ce13
0x10040ce0a: nop word ptr [rax + rax]
0x10040ce10: mov byte ptr [rcx], 0x20
0x10040ce13: inc rcx
0x10040ce16: inc rax
0x10040ce19: jne 0x10040cdf0
0x10040ce1b: vxorps xmm0, xmm0, xmm0
0x10040ce1f: vmovaps xmmword ptr [rsp + 0x90], xmm0
0x10040ce28: mov qword ptr [rsp + 0x40], 0
0x10040ce31: mov rdi, r14
0x10040ce34: mov rsi, rbx
0x10040ce37: call 0x100aa2cba ; 0x100aa2cba _strtof
0x10040ce3c: vmovss dword ptr [rsp + 0x90], xmm0
0x10040ce45: mov rdi, qword ptr [rsp + 0x40]
0x10040ce4a: mov rsi, rbx
0x10040ce4d: call 0x100aa2cba ; 0x100aa2cba _strtof
0x10040ce52: vmovss dword ptr [rsp + 0x94], xmm0
0x10040ce5b: mov rdi, qword ptr [rsp + 0x40]
0x10040ce60: mov rsi, rbx
0x10040ce63: call 0x100aa2cba ; 0x100aa2cba _strtof
0x10040ce68: vmovss dword ptr [rsp + 0x98], xmm0
0x10040ce71: mov rdi, qword ptr [rsp + 0x40]
0x10040ce76: mov rsi, rbx
0x10040ce79: call 0x100aa2cba ; 0x100aa2cba _strtof
0x10040ce7e: vmovss dword ptr [rsp + 0x9c], xmm0
0x10040ce87: cmp qword ptr [rsp + 0x40], r14
0x10040ce8c: je 0x10040d5f8
0x10040ce92: vmovaps xmm0, xmmword ptr [rsp + 0x90]
0x10040ce9b: mov rax, qword ptr [rsp + 0x38]
0x10040cea0: vmovups xmmword ptr [r12 + rax + 0xc], xmm0
0x10040cea7: mov r15, qword ptr [rsp + 0x10]
0x10040ceac: call qword ptr [r15 + 0x28]
0x10040ceb0: mov rcx, qword ptr [rax]
0x10040ceb3: mov rdi, rax
0x10040ceb6: call qword ptr [rcx + 0x10]
0x10040ceb9: mov rcx, qword ptr [rsp + 0x38]
0x10040cebe: mov dword ptr [r12 + rcx + 4], eax
0x10040cec3: call qword ptr [r15 + 0x30]
0x10040cec7: mov rbx, rax
0x10040ceca: mov rax, qword ptr [rbx]
0x10040cecd: mov r14, qword ptr [rax + 0xe0]
0x10040ced4: mov rdi, qword ptr [rsp + 0x48]
0x10040ced9: mov rax, qword ptr [rdi]
0x10040cedc: call qword ptr [rax + 0x68]
0x10040cedf: mov rcx, qword ptr [r15 + 0x20]
0x10040cee3: mov rdi, rbx
0x10040cee6: lea rsi, [rsp + 0x68]
0x10040ceeb: mov rdx, rax
0x10040ceee: call r14
0x10040cef1: cmp qword ptr [r15 + 0x38], -1
0x10040cef6: je 0x10040cf0b
0x10040cef8: cmp qword ptr [r15 + 0x48], 0
0x10040cefd: jne 0x10040cf0b
0x10040ceff: mov rax, qword ptr [rax]
0x10040cf02: test rax, rax
0x10040cf05: je 0x10040d59d
0x10040cf0b: sub rax, qword ptr [rsp + 0x68]
0x10040cf10: mov rcx, rax
0x10040cf13: shr rcx, 0x20
0x10040cf17: jne 0x10040d5d9
0x10040cf1d: mov rcx, qword ptr [rsp + 0x38]
0x10040cf22: mov dword ptr [r12 + rcx + 8], eax
0x10040cf27: nop word ptr [rax + rax]
0x10040cf30: mov rdx, qword ptr [rsp + 0x30]
0x10040cf35: mov rcx, qword ptr [rdx + 8]
0x10040cf39: test rcx, rcx
0x10040cf3c: je 0x10040cf60
0x10040cf3e: mov r13, qword ptr [rsp + 0x18]
0x10040cf43: mov rbx, qword ptr [rsp + 0x48]
0x10040cf48: mov rsi, qword ptr [rsp + 0x80]
0x10040cf50: mov rax, rcx
0x10040cf53: mov rcx, qword ptr [rax]
0x10040cf56: test rcx, rcx
0x10040cf59: jne 0x10040cf50
0x10040cf5b: jmp 0x10040cf90 ; 0x10040cf90
0x10040cf5d: nop dword ptr [rax]
0x10040cf60: mov rax, qword ptr [rdx + 0x10]
0x10040cf64: cmp qword ptr [rax], rdx
0x10040cf67: mov r13, qword ptr [rsp + 0x18]
0x10040cf6c: mov rbx, qword ptr [rsp + 0x48]
0x10040cf71: mov rsi, qword ptr [rsp + 0x80]
0x10040cf79: je 0x10040cf90
0x10040cf7b: add rdx, 0x10
0x10040cf7f: nop 
0x10040cf80: mov rcx, qword ptr [rdx]
0x10040cf83: mov rax, qword ptr [rcx + 0x10]
0x10040cf87: cmp qword ptr [rax], rcx
0x10040cf8a: lea rdx, [rcx + 0x10]
0x10040cf8e: jne 0x10040cf80
0x10040cf90: mov rcx, qword ptr [rsi + 0x48]
0x10040cf94: add rcx, 8
0x10040cf98: mov rdx, rax
0x10040cf9b: cmp rax, rcx
0x10040cf9e: jne 0x10040c820
0x10040cfa4: jmp 0x10040c7e2 ; 0x10040c7e2
0x10040cfa9: sub rdi, rcx
0x10040cfac: xor esi, esi
0x10040cfae: nop 
0x10040cfb0: lea rbx, [r8 + rsi]
0x10040cfb4: mov edx, ebx
0x10040cfb6: shl rdx, 4
0x10040cfba: mov dword ptr [rax + rdx + 4], 0xffffffff
0x10040cfc2: lea edx, [rbx + 1]
0x10040cfc5: shl rdx, 4
0x10040cfc9: mov dword ptr [rax + rdx + 4], 0xffffffff
0x10040cfd1: lea edx, [rbx + 2]
0x10040cfd4: shl rdx, 4
0x10040cfd8: mov dword ptr [rax + rdx + 4], 0xffffffff
0x10040cfe0: add ebx, 3
0x10040cfe3: shl rbx, 4
0x10040cfe7: mov dword ptr [rax + rbx + 4], 0xffffffff
0x10040cfef: add rsi, 4
0x10040cff3: cmp rdi, rsi
0x10040cff6: jne 0x10040cfb0
0x10040cff8: test rcx, rcx
0x10040cffb: je 0x10040d025
0x10040cffd: add esi, r8d
0x10040d000: neg rcx
0x10040d003: nop word ptr cs:[rax + rax]
0x10040d010: mov edx, esi
0x10040d012: shl rdx, 4
0x10040d016: mov dword ptr [rax + rdx + 4], 0xffffffff
0x10040d01e: inc esi
0x10040d020: inc rcx
0x10040d023: jne 0x10040d010
0x10040d025: mov rax, qword ptr [rsp + 0xa8]
0x10040d02d: inc eax
0x10040d02f: cmp eax, dword ptr [rsp + 0x1520]
0x10040d036: lea r14, [rsp + 0x1588]
0x10040d03e: jb 0x10040bf88
0x10040d044: jmp 0x10040d06e ; 0x10040d06e
0x10040d046: mov rax, qword ptr [rbx]
0x10040d049: mov rsi, qword ptr [rsp + 0x68]
0x10040d04e: mov rdi, rbx
0x10040d051: call qword ptr [rax + 0xc8]
0x10040d057: call 0x1007c6c20 ; 0x1007c6c20
0x10040d05c: mov rdi, rax
0x10040d05f: mov rsi, qword ptr [rsp + 0xb0]
0x10040d067: call 0x100795a70 ; 0x100795a70
0x10040d06c: jmp 0x10040d025 ; 0x10040d025
0x10040d06e: cmp dword ptr [rsp + 0x100], 0
0x10040d076: je 0x10040d29b
0x10040d07c: xor r15d, r15d
0x10040d07f: jmp 0x10040d0a0 ; 0x10040d0a0
0x10040d081: mov qword ptr [r13 + r14*8 + 8], rbx
0x10040d086: test byte ptr [rsp + 0x1580], 1
0x10040d08e: jne 0x10040d268
0x10040d094: jmp 0x10040d280 ; 0x10040d280
0x10040d099: nop dword ptr [rax]
0x10040d0a0: mov edx, dword ptr [rsp + 0x1568]
0x10040d0a7: mov eax, dword ptr [rsp + 0x156c]
0x10040d0ae: lea rcx, [rax + 4]
0x10040d0b2: cmp rcx, rdx
0x10040d0b5: ja 0x10040d41c
0x10040d0bb: mov r14, qword ptr [rsp + 0x1510]
0x10040d0c3: mov rdx, qword ptr [rsp + 0x1560]
0x10040d0cb: mov eax, dword ptr [rdx + rax]
0x10040d0ce: mov dword ptr [rsp + 0x156c], ecx
0x10040d0d5: lea r12, [rax + rax*2]
0x10040d0d9: mov esi, dword ptr [r14 + r12*4]
0x10040d0dd: mov eax, 0xffffffff
0x10040d0e2: cmp rsi, rax
0x10040d0e5: je 0x10040d110
0x10040d0e7: mov rdi, qword ptr [rsp + 0x108]
0x10040d0ef: add rsi, qword ptr [rsp + 0x1550]
0x10040d0f7: call 0x1004d0b60 ; 0x1004d0b60
0x10040d0fc: mov rbx, rax
0x10040d0ff: jmp 0x10040d112 ; 0x10040d112
0x10040d101: nop word ptr cs:[rax + rax]
0x10040d110: xor ebx, ebx
0x10040d112: vxorps xmm0, xmm0, xmm0
0x10040d116: vmovaps xmmword ptr [rsp + 0x1580], xmm0
0x10040d11f: mov qword ptr [rsp + 0x1590], 0
0x10040d12b: lea rdi, [rsp + 0xf0]
0x10040d133: lea rsi, [rsp + 0x1580]
0x10040d13b: call 0x10040b1d0 ; 0x10040b1d0
0x10040d140: lea rdx, [r14 + r12*4]
0x10040d144: lea rdi, [rsp + 0xf0]
0x10040d14c: mov rsi, rbx
0x10040d14f: call 0x10040b390 ; 0x10040b390
0x10040d154: mov rax, qword ptr [rsp + 0xf0]
0x10040d15c: mov ecx, r15d
0x10040d15f: mov qword ptr [rax + rcx*8], rbx
0x10040d163: mov r13, qword ptr [rsp + 0xf8]
0x10040d16b: lea r14, [rcx + rcx*2]
0x10040d16f: lea r12, [r13 + r14*8]
0x10040d174: lea rax, [rsp + 0x1580]
0x10040d17c: cmp r12, rax
0x10040d17f: je 0x10040d25e
0x10040d185: movzx eax, byte ptr [rsp + 0x1580]
0x10040d18d: mov rbx, rax
0x10040d190: shr rbx, 1
0x10040d193: and al, 1
0x10040d195: mov rsi, qword ptr [rsp + 0x1590]
0x10040d19d: lea rcx, [rsp + 0x1581]
0x10040d1a5: cmove rsi, rcx
0x10040d1a9: test al, al
0x10040d1ab: cmovne rbx, qword ptr [rsp + 0x1588]
0x10040d1b4: movzx ecx, byte ptr [r12]
0x10040d1b9: test cl, 1
0x10040d1bc: jne 0x10040d1e0
0x10040d1be: mov eax, 0x16
0x10040d1c3: mov rdx, rbx
0x10040d1c6: sub rdx, rax
0x10040d1c9: ja 0x10040d1f3
0x10040d1cb: test cl, 1
0x10040d1ce: jne 0x10040d1fd
0x10040d1d0: lea rax, [r12 + 1]
0x10040d1d5: test rbx, rbx
0x10040d1d8: jne 0x10040d207
0x10040d1da: jmp 0x10040d21e ; 0x10040d21e
0x10040d1dc: nop dword ptr [rax]
0x10040d1e0: mov rax, qword ptr [r12]
0x10040d1e4: and rax, 0xfffffffffffffffe
0x10040d1e8: dec rax
0x10040d1eb: mov rdx, rbx
0x10040d1ee: sub rdx, rax
0x10040d1f1: jbe 0x10040d1cb
0x10040d1f3: test cl, 1
0x10040d1f6: jne 0x10040d23f
0x10040d1f8: shr rcx, 1
0x10040d1fb: jmp 0x10040d244 ; 0x10040d244
0x10040d1fd: mov rax, qword ptr [r13 + r14*8 + 0x10]
0x10040d202: test rbx, rbx
0x10040d205: je 0x10040d21e
0x10040d207: mov qword ptr [rsp + 0x20], rax
0x10040d20c: mov rdi, qword ptr [rsp + 0x20]
0x10040d211: mov rdx, rbx
0x10040d214: call 0x100aa28fa ; 0x100aa28fa _memmove
0x10040d219: mov rax, qword ptr [rsp + 0x20]
0x10040d21e: mov byte ptr [rax + rbx], 0
0x10040d222: test byte ptr [r12], 1
0x10040d227: jne 0x10040d081
0x10040d22d: add bl, bl
0x10040d22f: mov byte ptr [r12], bl
0x10040d233: test byte ptr [rsp + 0x1580], 1
0x10040d23b: jne 0x10040d268
0x10040d23d: jmp 0x10040d280 ; 0x10040d280
0x10040d23f: mov rcx, qword ptr [r13 + r14*8 + 8]
0x10040d244: mov qword ptr [rsp + 8], rsi
0x10040d249: mov qword ptr [rsp], rbx
0x10040d24d: xor r8d, r8d
0x10040d250: mov rdi, r12
0x10040d253: mov rsi, rax
0x10040d256: mov r9, rcx
0x10040d259: call 0x1000198c0 ; 0x1000198c0
0x10040d25e: test byte ptr [rsp + 0x1580], 1
0x10040d266: je 0x10040d280
0x10040d268: mov rbx, qword ptr [rsp + 0x1590]
0x10040d270: call 0x1007e50d0 ; 0x1007e50d0
0x10040d275: mov rdi, rax
0x10040d278: mov rsi, rbx
0x10040d27b: call 0x1007e5db0 ; 0x1007e5db0
0x10040d280: inc r15d
0x10040d283: mov r12d, dword ptr [rsp + 0x100]
0x10040d28b: cmp r15d, r12d
0x10040d28e: mov r13, qword ptr [rsp + 0x18]
0x10040d293: jb 0x10040d0a0
0x10040d299: jmp 0x10040d29e ; 0x10040d29e
0x10040d29b: xor r12d, r12d
0x10040d29e: mov r8, qword ptr [rbp + 0x20]
0x10040d2a2: mov r9, qword ptr [rbp + 0x18]
0x10040d2a6: mov r10, qword ptr [rbp + 0x10]
0x10040d2aa: mov r14d, dword ptr [rsp + 0x157c]
0x10040d2b2: test r14, r14
0x10040d2b5: je 0x10040d311
0x10040d2b7: xor ebx, ebx
0x10040d2b9: mov ecx, 0x10
0x10040d2be: mov r11d, 0xffffffff
0x10040d2c4: nop word ptr cs:[rax + rax]
0x10040d2d0: mov rdx, qword ptr [rsp + 0x1570]
0x10040d2d8: mov rsi, qword ptr [rdx + rcx - 0x10]
0x10040d2dd: test rsi, rsi
0x10040d2e0: je 0x10040d305
0x10040d2e2: mov edi, dword ptr [rdx + rcx - 8]
0x10040d2e6: cmp rdi, r11
0x10040d2e9: je 0x10040d300
0x10040d2eb: mov rax, qword ptr [rsp + 0xf0]
0x10040d2f3: mov rdi, qword ptr [rax + rdi*8]
0x10040d2f7: sub rdi, qword ptr [rdx + rcx]
0x10040d2fb: jmp 0x10040d302 ; 0x10040d302
0x10040d2fd: nop dword ptr [rax]
0x10040d300: xor edi, edi
0x10040d302: mov qword ptr [rsi], rdi
0x10040d305: inc rbx
0x10040d308: add rcx, 0x18
0x10040d30c: cmp rbx, r14
0x10040d30f: jb 0x10040d2d0
0x10040d311: mov rcx, qword ptr [rsp + 0xf0]
0x10040d319: mov qword ptr [r10], rcx
0x10040d31c: mov rcx, qword ptr [rsp + 0xf8]
0x10040d324: mov qword ptr [r9], rcx
0x10040d327: mov dword ptr [r8], r12d
0x10040d32a: call 0x1007c6c20 ; 0x1007c6c20
0x10040d32f: mov rdi, rax
0x10040d332: mov rsi, qword ptr [rsp + 0xc0]
0x10040d33a: call 0x100795a70 ; 0x100795a70
0x10040d33f: call 0x1007c6c20 ; 0x1007c6c20
0x10040d344: mov rdi, rax
0x10040d347: mov rsi, qword ptr [rsp + 0xd0]
0x10040d34f: call 0x100795a70 ; 0x100795a70
0x10040d354: call 0x1007c6c20 ; 0x1007c6c20
0x10040d359: mov rdi, rax
0x10040d35c: mov rsi, qword ptr [rsp + 0xd8]
0x10040d364: call 0x100795a70 ; 0x100795a70
0x10040d369: call 0x1007c6c20 ; 0x1007c6c20
0x10040d36e: mov rdi, rax
0x10040d371: mov rsi, qword ptr [rsp + 0xe0]
0x10040d379: call 0x100795a70 ; 0x100795a70
0x10040d37e: call 0x1007c6c20 ; 0x1007c6c20
0x10040d383: mov rdi, rax
0x10040d386: mov rsi, r13
0x10040d389: call 0x100795a70 ; 0x100795a70
0x10040d38e: mov rax, qword ptr [rip + 0x800543] ; 0x100c0d8d8
0x10040d395: mov rax, qword ptr [rax]
0x10040d398: cmp rax, qword ptr [rsp + 0x1780]
0x10040d3a0: jne 0x10040d3b1
0x10040d3a2: lea rsp, [rbp - 0x28]
0x10040d3a6: pop rbx
0x10040d3a7: pop r12
0x10040d3a9: pop r13
0x10040d3ab: pop r14
0x10040d3ad: pop r15
0x10040d3af: pop rbp
0x10040d3b0: ret 
0x10040d3b1: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10040d3b6: lea rdi, [rip + 0x77a5dd] ; 0x100b8799a fileSize >= sizeof( LoToc )
0x10040d3bd: lea rsi, [rip + 0x77a566] ; 0x100b8792a LevelObjects.cpp
0x10040d3c4: mov edx, 0x113
0x10040d3c9: mov ecx, 3
0x10040d3ce: call 0x1007e5f70 ; 0x1007e5f70
0x10040d3d3: jmp 0x10040d635 ; 0x10040d635
0x10040d3d8: lea rdi, [rip + 0x77a5d7] ; 0x100b879b6 toc->magic == kLoMagic
0x10040d3df: lea rsi, [rip + 0x77a544] ; 0x100b8792a LevelObjects.cpp
0x10040d3e6: mov edx, 0x115
0x10040d3eb: mov ecx, 3
0x10040d3f0: call 0x1007e5f70 ; 0x1007e5f70
0x10040d3f5: jmp 0x10040d635 ; 0x10040d635
0x10040d3fa: lea rdi, [rip + 0x77a5cc] ; 0x100b879cd toc->fileSize == fileSize
0x10040d401: lea rsi, [rip + 0x77a522] ; 0x100b8792a LevelObjects.cpp
0x10040d408: mov edx, 0x116
0x10040d40d: mov ecx, 3
0x10040d412: call 0x1007e5f70 ; 0x1007e5f70
0x10040d417: jmp 0x10040d635 ; 0x10040d635
0x10040d41c: lea rdi, [rip + 0x77a4df] ; 0x100b87902 ctx->dataHead + podSize <= ctx->dataMax
0x10040d423: lea rsi, [rip + 0x77a500] ; 0x100b8792a LevelObjects.cpp
0x10040d42a: mov edx, 0x9d
0x10040d42f: mov ecx, 3
0x10040d434: call 0x1007e5f70 ; 0x1007e5f70
0x10040d439: jmp 0x10040d635 ; 0x10040d635
0x10040d43e: call qword ptr [r14 + 0x30]
0x10040d442: mov r9, qword ptr [rax + 8]
0x10040d446: mov rax, qword ptr [r14]
0x10040d449: mov qword ptr [rsp], rax
0x10040d44d: lea rdi, [rip + 0x771336] ; 0x100b7e78a !m_countAddress || m_staticArraySize > 0 || *(void**)v != 0
0x10040d454: lea rsi, [rip + 0x75017d] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x10040d45b: lea r8, [rip + 0x771364] ; 0x100b7e7c6 %s::%s is a null array
0x10040d462: mov edx, 0x40b
0x10040d467: mov ecx, 4
0x10040d46c: xor eax, eax
0x10040d46e: call 0x1007e6030 ; 0x1007e6030
0x10040d473: jmp 0x10040d635 ; 0x10040d635
0x10040d478: mov rax, qword ptr [rsp + 0x48]
0x10040d47d: mov r9, qword ptr [rax + 8]
0x10040d481: mov rax, qword ptr [r14]
0x10040d484: mov qword ptr [rsp], rax
0x10040d488: lea rdi, [rip + 0x77a61c] ; 0x100b87aab md
0x10040d48f: lea rsi, [rip + 0x77a494] ; 0x100b8792a LevelObjects.cpp
0x10040d496: lea r8, [rip + 0x77a611] ; 0x100b87aae %s::%s is an array variable, and must therefore define 'ArrayAllocator' meta data.
0x10040d49d: mov edx, 0x190
0x10040d4a2: mov ecx, 4
0x10040d4a7: xor eax, eax
0x10040d4a9: call 0x1007e6030 ; 0x1007e6030
0x10040d4ae: jmp 0x10040d635 ; 0x10040d635
0x10040d4b3: mov rax, qword ptr [rsp + 0x60]
0x10040d4b8: mov rcx, qword ptr [rsp + 0x28]
0x10040d4bd: mov qword ptr [rax + rcx + 0x18], 0
0x10040d4c6: lea rdi, [rip + 0x77a634] ; 0x100b87b01 mvAux->arrayAllocator
0x10040d4cd: lea rsi, [rip + 0x77a456] ; 0x100b8792a LevelObjects.cpp
0x10040d4d4: mov edx, 0x192
0x10040d4d9: mov ecx, 3
0x10040d4de: call 0x1007e5f70 ; 0x1007e5f70
0x10040d4e3: jmp 0x10040d635 ; 0x10040d635
0x10040d4e8: mov qword ptr [rsp + 8], r13
0x10040d4ed: mov rax, qword ptr [rsp + 0x20]
0x10040d4f2: mov qword ptr [rsp], rax
0x10040d4f6: lea rdi, [rip + 0x77a61a] ; 0x100b87b17 mconst
0x10040d4fd: lea rsi, [rip + 0x77a426] ; 0x100b8792a LevelObjects.cpp
0x10040d504: lea r8, [rip + 0x77a613] ; 0x100b87b1e Tool_DefaultValue for %s::%s must be number, boolean or meta registered constant. Instead given: %s.
0x10040d50b: mov edx, 0x1c2
0x10040d510: mov ecx, 4
0x10040d515: xor eax, eax
0x10040d517: mov r9, qword ptr [rsp + 0x58]
0x10040d51c: call 0x1007e6030 ; 0x1007e6030
0x10040d521: jmp 0x10040d635 ; 0x10040d635
0x10040d526: mov rax, qword ptr [rsp + 0x20]
0x10040d52b: mov qword ptr [rsp], rax
0x10040d52f: lea rdi, [rip + 0x795af6] ; 0x100ba302c false
0x10040d536: lea rsi, [rip + 0x77a3ed] ; 0x100b8792a LevelObjects.cpp
0x10040d53d: lea r8, [rip + 0x77a6e3] ; 0x100b87c27 The member variable %s::%s is a type that does not support Tool_DefaultValue.
0x10040d544: mov edx, 0x202
0x10040d549: mov ecx, 4
0x10040d54e: xor eax, eax
0x10040d550: mov r9, qword ptr [rsp + 0x58]
0x10040d555: call 0x1007e6030 ; 0x1007e6030
0x10040d55a: jmp 0x10040d635 ; 0x10040d635
0x10040d55f: mov qword ptr [rsp + 8], rbx
0x10040d564: mov rax, qword ptr [rsp + 0x20]
0x10040d569: mov qword ptr [rsp], rax
0x10040d56d: lea rdi, [rip + 0x77a65d] ; 0x100b87bd1 isNull
0x10040d574: lea rsi, [rip + 0x77a3af] ; 0x100b8792a LevelObjects.cpp
0x10040d57b: lea r8, [rip + 0x77a656] ; 0x100b87bd8 The only allowed default value for Object pointers is "null". %s::%s gave: %s.
0x10040d582: mov edx, 0x1fc
0x10040d587: mov ecx, 4
0x10040d58c: xor eax, eax
0x10040d58e: mov r9, qword ptr [rsp + 0x58]
0x10040d593: call 0x1007e6030 ; 0x1007e6030
0x10040d598: jmp 0x10040d635 ; 0x10040d635
0x10040d59d: call qword ptr [r15 + 0x30]
0x10040d5a1: mov r9, qword ptr [rax + 8]
0x10040d5a5: mov rax, qword ptr [rsp + 0x10]
0x10040d5aa: mov rax, qword ptr [rax]
0x10040d5ad: mov qword ptr [rsp], rax
0x10040d5b1: lea rdi, [rip + 0x7711d2] ; 0x100b7e78a !m_countAddress || m_staticArraySize > 0 || *(void**)v != 0
0x10040d5b8: lea rsi, [rip + 0x750019] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x10040d5bf: lea r8, [rip + 0x771200] ; 0x100b7e7c6 %s::%s is a null array
0x10040d5c6: mov edx, 0x40b
0x10040d5cb: mov ecx, 4
0x10040d5d0: xor eax, eax
0x10040d5d2: call 0x1007e6030 ; 0x1007e6030
0x10040d5d7: jmp 0x10040d635 ; 0x10040d635
0x10040d5d9: lea rdi, [rip + 0x77a695] ; 0x100b87c75 offset <= UINT_MAX
0x10040d5e0: lea rsi, [rip + 0x77a343] ; 0x100b8792a LevelObjects.cpp
0x10040d5e7: mov edx, 0x206
0x10040d5ec: mov ecx, 3
0x10040d5f1: call 0x1007e5f70 ; 0x1007e5f70
0x10040d5f6: jmp 0x10040d635 ; 0x10040d635
0x10040d5f8: mov rax, qword ptr [r15 + 8]
0x10040d5fc: mov qword ptr [rsp + 8], rax
0x10040d601: mov rax, qword ptr [rsp + 0x20]
0x10040d606: mov qword ptr [rsp], rax
0x10040d60a: lea rdi, [rip + 0x77a572] ; 0x100b87b83 next != buf
0x10040d611: lea rsi, [rip + 0x77a312] ; 0x100b8792a LevelObjects.cpp
0x10040d618: lea r8, [rip + 0x77a570] ; 0x100b87b8f Tool_DefaultValue for %s::%s must be a vector. Instead given: %s.
0x10040d61f: mov edx, 0x1e9
0x10040d624: mov ecx, 4
0x10040d629: xor eax, eax
0x10040d62b: mov r9, qword ptr [rsp + 0x58]
0x10040d630: call 0x1007e6030 ; 0x1007e6030
0x10040d635: ud2 
0x10040d637: jmp 0x10040d81b ; 0x10040d81b
0x10040d63c: jmp 0x10040d81b ; 0x10040d81b
0x10040d641: jmp 0x10040d81b ; 0x10040d81b
0x10040d646: jmp 0x10040d81b ; 0x10040d81b
0x10040d64b: mov r14, rax
0x10040d64e: mov r13, qword ptr [rsp + 0x18]
0x10040d653: jmp 0x10040d838 ; 0x10040d838
0x10040d658: jmp 0x10040d81b ; 0x10040d81b
0x10040d65d: jmp 0x10040d81b ; 0x10040d81b
0x10040d662: jmp 0x10040d81b ; 0x10040d81b
0x10040d667: mov r14, rax
0x10040d66a: mov r13, qword ptr [rsp + 0x18]
0x10040d66f: jmp 0x10040d8a1 ; 0x10040d8a1
0x10040d674: mov rdi, rax
0x10040d677: call 0x100011bf0 ; 0x100011bf0
0x10040d67c: mov rdi, rax
0x10040d67f: call 0x100011bf0 ; 0x100011bf0
0x10040d684: mov rdi, rax
0x10040d687: call 0x100011bf0 ; 0x100011bf0
0x10040d68c: mov rdi, rax
0x10040d68f: call 0x100011bf0 ; 0x100011bf0
0x10040d694: mov rdi, rax
0x10040d697: call 0x100011bf0 ; 0x100011bf0
0x10040d69c: jmp 0x10040d85f ; 0x10040d85f
0x10040d6a1: jmp 0x10040d6b5 ; 0x10040d6b5
0x10040d6a3: mov r14, rax
0x10040d6a6: jmp 0x10040d877 ; 0x10040d877
0x10040d6ab: mov r14, rax
0x10040d6ae: jmp 0x10040d88c ; 0x10040d88c
0x10040d6b3: jmp 0x10040d6b5 ; 0x10040d6b5
0x10040d6b5: mov r14, rax
0x10040d6b8: jmp 0x10040d8a1 ; 0x10040d8a1
0x10040d6bd: jmp 0x10040d7db ; 0x10040d7db
0x10040d6c2: mov rdi, rax
0x10040d6c5: call 0x100011bf0 ; 0x100011bf0
0x10040d6ca: jmp 0x10040d7db ; 0x10040d7db
0x10040d6cf: jmp 0x10040d81b ; 0x10040d81b
0x10040d6d4: jmp 0x10040d81b ; 0x10040d81b
0x10040d6d9: jmp 0x10040d7db ; 0x10040d7db
0x10040d6de: jmp 0x10040d7db ; 0x10040d7db
0x10040d6e3: jmp 0x10040d7db ; 0x10040d7db
0x10040d6e8: mov r14, rax
0x10040d6eb: jmp 0x10040d795 ; 0x10040d795
0x10040d6f0: mov r14, rax
0x10040d6f3: jmp 0x10040d7a7 ; 0x10040d7a7
0x10040d6f8: jmp 0x10040d7db ; 0x10040d7db
0x10040d6fd: jmp 0x10040d7db ; 0x10040d7db
0x10040d702: mov r14, rax
0x10040d705: jmp 0x10040d748 ; 0x10040d748
0x10040d707: mov r14, rax
0x10040d70a: jmp 0x10040d75a ; 0x10040d75a
0x10040d70c: mov rdi, rax
0x10040d70f: call 0x100011bf0 ; 0x100011bf0
0x10040d714: jmp 0x10040d81b ; 0x10040d81b
0x10040d719: jmp 0x10040d7db ; 0x10040d7db
0x10040d71e: jmp 0x10040d7db ; 0x10040d7db
0x10040d723: jmp 0x10040d7db ; 0x10040d7db
0x10040d728: mov r14, rax
0x10040d72b: mov qword ptr [rsp + 0x1580], r15
0x10040d733: mov qword ptr [rsp + 0x16d0], r12
0x10040d73b: lea rdi, [rsp + 0x1588]
0x10040d743: call 0x1007a58d0 ; 0x1007a58d0
0x10040d748: lea rdi, [rsp + 0x1580]
0x10040d750: mov rsi, qword ptr [rsp + 0x50]
0x10040d755: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10040d75a: lea rdi, [rsp + 0x16d0]
0x10040d762: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10040d767: jmp 0x10040d838 ; 0x10040d838
0x10040d76c: jmp 0x10040d7e0 ; 0x10040d7e0
0x10040d76e: jmp 0x10040d7e0 ; 0x10040d7e0
0x10040d770: mov r14, rax
0x10040d773: mov qword ptr [rsp + 0x1580], r15
0x10040d77b: mov rax, qword ptr [rsp + 0x30]
0x10040d780: mov qword ptr [rsp + 0x16d0], rax
0x10040d788: lea rdi, [rsp + 0x1588]
0x10040d790: call 0x1007a58d0 ; 0x1007a58d0
0x10040d795: lea rdi, [rsp + 0x1580]
0x10040d79d: mov rsi, qword ptr [rsp + 0x50]
0x10040d7a2: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10040d7a7: lea rdi, [rsp + 0x16d0]
0x10040d7af: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10040d7b4: jmp 0x10040d81e ; 0x10040d81e
0x10040d7b6: mov r14, rax
0x10040d7b9: call 0x1007c6c20 ; 0x1007c6c20
0x10040d7be: mov rdi, rax
0x10040d7c1: mov rsi, r12
0x10040d7c4: call 0x100795a70 ; 0x100795a70
0x10040d7c9: jmp 0x10040d823 ; 0x10040d823
0x10040d7cb: mov rdi, rax
0x10040d7ce: call 0x100011bf0 ; 0x100011bf0
0x10040d7d3: mov rdi, rax
0x10040d7d6: call 0x100011bf0 ; 0x100011bf0
0x10040d7db: mov r14, rax
0x10040d7de: jmp 0x10040d823 ; 0x10040d823
0x10040d7e0: mov r14, rax
0x10040d7e3: jmp 0x10040d838 ; 0x10040d838
0x10040d7e5: mov r14, rax
0x10040d7e8: test byte ptr [rsp + 0x1580], 1
0x10040d7f0: je 0x10040d80a
0x10040d7f2: mov rbx, qword ptr [rsp + 0x1590]
0x10040d7fa: call 0x1007e50d0 ; 0x1007e50d0
0x10040d7ff: mov rdi, rax
0x10040d802: mov rsi, rbx
0x10040d805: call 0x1007e5db0 ; 0x1007e5db0
0x10040d80a: mov r13, qword ptr [rsp + 0x18]
0x10040d80f: jmp 0x10040d838 ; 0x10040d838
0x10040d811: mov rdi, rax
0x10040d814: call 0x100011bf0 ; 0x100011bf0
0x10040d819: jmp 0x10040d85f ; 0x10040d85f
0x10040d81b: mov r14, rax
0x10040d81e: mov r13, qword ptr [rsp + 0x18]
0x10040d823: call 0x1007c6c20 ; 0x1007c6c20
0x10040d828: mov rdi, rax
0x10040d82b: mov rsi, qword ptr [rsp + 0xb0]
0x10040d833: call 0x100795a70 ; 0x100795a70
0x10040d838: call 0x1007c6c20 ; 0x1007c6c20
0x10040d83d: mov rdi, rax
0x10040d840: mov rsi, qword ptr [rsp + 0xc0]
0x10040d848: call 0x100795a70 ; 0x100795a70
0x10040d84d: jmp 0x10040d862 ; 0x10040d862
0x10040d84f: mov rdi, rax
0x10040d852: call 0x100011bf0 ; 0x100011bf0
0x10040d857: mov rdi, rax
0x10040d85a: call 0x100011bf0 ; 0x100011bf0
0x10040d85f: mov r14, rax
0x10040d862: call 0x1007c6c20 ; 0x1007c6c20
0x10040d867: mov rdi, rax
0x10040d86a: mov rsi, qword ptr [rsp + 0xd0]
0x10040d872: call 0x100795a70 ; 0x100795a70
0x10040d877: call 0x1007c6c20 ; 0x1007c6c20
0x10040d87c: mov rdi, rax
0x10040d87f: mov rsi, qword ptr [rsp + 0xd8]
0x10040d887: call 0x100795a70 ; 0x100795a70
0x10040d88c: call 0x1007c6c20 ; 0x1007c6c20
0x10040d891: mov rdi, rax
0x10040d894: mov rsi, qword ptr [rsp + 0xe0]
0x10040d89c: call 0x100795a70 ; 0x100795a70
0x10040d8a1: call 0x1007c6c20 ; 0x1007c6c20
0x10040d8a6: mov rdi, rax
0x10040d8a9: mov rsi, r13
0x10040d8ac: call 0x100795a70 ; 0x100795a70
0x10040d8b1: mov rdi, r14
0x10040d8b4: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10040d8b9: mov rdi, rax
0x10040d8bc: call 0x100011bf0 ; 0x100011bf0
0x10040d8c1: mov rdi, rax
0x10040d8c4: call 0x100011bf0 ; 0x100011bf0
0x10040d8c9: mov rdi, rax
0x10040d8cc: call 0x100011bf0 ; 0x100011bf0
0x10040d8d1: mov rdi, rax
0x10040d8d4: call 0x100011bf0 ; 0x100011bf0
0x10040d8d9: nop dword ptr [rax]
