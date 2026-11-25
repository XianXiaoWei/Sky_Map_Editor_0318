0x100a6afc0: push rbp
0x100a6afc1: mov rbp, rsp
0x100a6afc4: push r15
0x100a6afc6: push r14
0x100a6afc8: push r13
0x100a6afca: push r12
0x100a6afcc: push rbx
0x100a6afcd: sub rsp, 0x58
0x100a6afd1: mov r14, rdx
0x100a6afd4: mov qword ptr [rbp - 0x60], rsi
0x100a6afd8: mov eax, dword ptr [rdi + 0xdc]
0x100a6afde: cmp eax, dword ptr [rdi + 0xd8]
0x100a6afe4: jae 0x100a6b4d9
0x100a6afea: inc eax
0x100a6afec: mov dword ptr [rdi + 0xdc], eax
0x100a6aff2: mov rdx, qword ptr [rdi + 0xe8]
0x100a6aff9: mov eax, 0xffffffff
0x100a6affe: mov r13d, 0xffffffe0
0x100a6b004: nop word ptr cs:[rax + rax]
0x100a6b010: inc eax
0x100a6b012: mov ebx, dword ptr [rdx + rax*4]
0x100a6b015: add r13d, 0x20
0x100a6b019: cmp ebx, -1
0x100a6b01c: je 0x100a6b010
0x100a6b01e: mov ecx, ebx
0x100a6b020: not ecx
0x100a6b022: bsf ecx, ecx
0x100a6b025: mov esi, 1
0x100a6b02a: shl esi, cl
0x100a6b02c: mov r8d, eax
0x100a6b02f: or ebx, esi
0x100a6b031: mov dword ptr [rdx + r8*4], ebx
0x100a6b035: or r13d, ecx
0x100a6b038: mov rcx, qword ptr [rdi + 0xe0]
0x100a6b03f: lea r15, [r13 + r13*2]
0x100a6b044: shl r15, 4
0x100a6b048: mov qword ptr [rcx + r15 + 0x28], 0
0x100a6b051: mov qword ptr [rcx + r15 + 0x20], 0
0x100a6b05a: mov qword ptr [rcx + r15 + 0x18], 0
0x100a6b063: mov qword ptr [rcx + r15 + 0x10], 0
0x100a6b06c: mov qword ptr [rcx + r15 + 8], 0
0x100a6b075: mov qword ptr [rcx + r15], 0
0x100a6b07d: cmp dword ptr [rdi + 0xd8], r13d
0x100a6b084: jbe 0x100a6b500
0x100a6b08a: mov rcx, qword ptr [rdi + 0xe8]
0x100a6b091: and eax, 0x7ffffff
0x100a6b096: test dword ptr [rcx + rax*4], esi
0x100a6b099: je 0x100a6b52a
0x100a6b09f: mov qword ptr [rbp - 0x30], rdi
0x100a6b0a3: mov rbx, qword ptr [rdi + 0xe0]
0x100a6b0aa: mov rdi, qword ptr [rip + 0x20050f] ; 0x100c6b5c0
0x100a6b0b1: mov rsi, qword ptr [rip + 0x1fc510] ; 0x100c675c8
0x100a6b0b8: mov r12, qword ptr [rip + 0x1a2a51] ; 0x100c0db10
0x100a6b0bf: call r12
0x100a6b0c2: mov rsi, qword ptr [rip + 0x1fc54f] ; 0x100c67618
0x100a6b0c9: mov rdi, rax
0x100a6b0cc: call r12
0x100a6b0cf: mov rdi, qword ptr [rbx + r15]
0x100a6b0d3: mov qword ptr [rbx + r15], rax
0x100a6b0d7: call qword ptr [rip + 0x1a2a3b] ; 0x100c0db18
0x100a6b0dd: mov eax, dword ptr [r14]
0x100a6b0e0: cmp eax, 3
0x100a6b0e3: je 0x100a6b10b
0x100a6b0e5: cmp eax, 2
0x100a6b0e8: je 0x100a6b104
0x100a6b0ea: cmp eax, 1
0x100a6b0ed: jne 0x100a6b554
0x100a6b0f3: xor eax, eax
0x100a6b0f5: cmp byte ptr [r14 + 0x20], 1
0x100a6b0fa: seta al
0x100a6b0fd: lea rdx, [rax + rax + 2]
0x100a6b102: jmp 0x100a6b110 ; 0x100a6b110
0x100a6b104: mov edx, 7
0x100a6b109: jmp 0x100a6b110 ; 0x100a6b110
0x100a6b10b: mov edx, 5
0x100a6b110: mov qword ptr [rbp - 0x40], rbx
0x100a6b114: lea rax, [rbx + r15]
0x100a6b118: mov qword ptr [rbp - 0x38], rax
0x100a6b11c: mov rdi, qword ptr [rax]
0x100a6b11f: mov rsi, qword ptr [rip + 0x1feed2] ; 0x100c69ff8
0x100a6b126: call qword ptr [rip + 0x1a29e4] ; 0x100c0db10
0x100a6b12c: movsxd rax, dword ptr [r14 + 0xc]
0x100a6b130: cmp rax, 0x16
0x100a6b134: jae 0x100a6b4b9
0x100a6b13a: mov ecx, 0x3fefd5
0x100a6b13f: bt ecx, eax
0x100a6b142: jae 0x100a6b4b9
0x100a6b148: lea rcx, [rip + 0x9b571] ; 0x100b066c0
0x100a6b14f: mov rdx, qword ptr [rcx + rax*8]
0x100a6b153: mov r12, qword ptr [rbp - 0x38]
0x100a6b157: mov rdi, qword ptr [r12]
0x100a6b15b: mov rsi, qword ptr [rip + 0x1fed2e] ; 0x100c69e90
0x100a6b162: mov rax, qword ptr [rip + 0x1a29a7] ; 0x100c0db10
0x100a6b169: mov rbx, rax
0x100a6b16c: call rbx
0x100a6b16e: mov edx, dword ptr [r14 + 0x1c]
0x100a6b172: mov rdi, qword ptr [r12]
0x100a6b176: mov rsi, qword ptr [rip + 0x1fee83] ; 0x100c6a000
0x100a6b17d: call rbx
0x100a6b17f: mov edx, dword ptr [r14 + 0x10]
0x100a6b183: cmp rdx, 1
0x100a6b187: mov ebx, 1
0x100a6b18c: cmovbe rdx, rbx
0x100a6b190: mov rdi, qword ptr [r12]
0x100a6b194: mov rsi, qword ptr [rip + 0x1fee6d] ; 0x100c6a008
0x100a6b19b: call qword ptr [rip + 0x1a296f] ; 0x100c0db10
0x100a6b1a1: mov edx, dword ptr [r14 + 0x14]
0x100a6b1a5: cmp rdx, 1
0x100a6b1a9: cmovbe rdx, rbx
0x100a6b1ad: mov rdi, qword ptr [r12]
0x100a6b1b1: mov rsi, qword ptr [rip + 0x1fee58] ; 0x100c6a010
0x100a6b1b8: call qword ptr [rip + 0x1a2952] ; 0x100c0db10
0x100a6b1be: mov rcx, qword ptr [rip + 0x1a294b] ; 0x100c0db10
0x100a6b1c5: mov eax, dword ptr [r14 + 0x18]
0x100a6b1c9: cmp rax, 1
0x100a6b1cd: cmova rbx, rax
0x100a6b1d1: mov rdi, qword ptr [r12]
0x100a6b1d5: mov rsi, qword ptr [rip + 0x1fee3c] ; 0x100c6a018
0x100a6b1dc: mov rdx, rbx
0x100a6b1df: mov rbx, rcx
0x100a6b1e2: call rbx
0x100a6b1e4: mov edx, dword ptr [r14 + 8]
0x100a6b1e8: and edx, 7
0x100a6b1eb: mov rdi, qword ptr [r12]
0x100a6b1ef: mov rsi, qword ptr [rip + 0x1fee2a] ; 0x100c6a020
0x100a6b1f6: call rbx
0x100a6b1f8: movzx edx, byte ptr [r14 + 0x20]
0x100a6b1fd: mov rdi, qword ptr [r12]
0x100a6b201: mov rsi, qword ptr [rip + 0x1febd8] ; 0x100c69de0
0x100a6b208: call rbx
0x100a6b20a: mov eax, dword ptr [r14 + 8]
0x100a6b20e: and eax, 0xc
0x100a6b211: cmp eax, 4
0x100a6b214: jne 0x100a6b22f
0x100a6b216: mov rax, qword ptr [rbp - 0x38]
0x100a6b21a: mov rdi, qword ptr [rax]
0x100a6b21d: mov rsi, qword ptr [rip + 0x1fee04] ; 0x100c6a028
0x100a6b224: mov edx, 0x20
0x100a6b229: call qword ptr [rip + 0x1a28e1] ; 0x100c0db10
0x100a6b22f: mov eax, dword ptr [r14 + 0xc]
0x100a6b233: mov rsi, qword ptr [rbp - 0x40]
0x100a6b237: mov dword ptr [rsi + r15 + 8], eax
0x100a6b23c: cmp dword ptr [r14 + 4], 2
0x100a6b241: mov qword ptr [rbp - 0x70], r14
0x100a6b245: mov qword ptr [rbp - 0x68], r15
0x100a6b249: jne 0x100a6b282
0x100a6b24b: mov rcx, qword ptr [rbp - 0x30]
0x100a6b24f: mov eax, dword ptr [rcx + 0x2220]
0x100a6b255: lea rdx, [rsi + r15 + 0xc]
0x100a6b25a: mov qword ptr [rbp - 0x48], rdx
0x100a6b25e: mov dword ptr [rsi + r15 + 0xc], eax
0x100a6b263: test eax, eax
0x100a6b265: jne 0x100a6b298
0x100a6b267: cmp byte ptr [r14 + 0x21], 0
0x100a6b26c: je 0x100a6b362
0x100a6b272: mov dword ptr [rsi + r15 + 0x14], 0
0x100a6b27b: xor eax, eax
0x100a6b27d: jmp 0x100a6b4a2 ; 0x100a6b4a2
0x100a6b282: lea rax, [rsi + r15 + 0xc]
0x100a6b287: mov qword ptr [rbp - 0x48], rax
0x100a6b28b: mov dword ptr [rsi + r15 + 0xc], 1
0x100a6b294: mov rcx, qword ptr [rbp - 0x30]
0x100a6b298: mov qword ptr [rbp - 0x78], r13
0x100a6b29c: mov rax, qword ptr [rip + 0x1fed8d] ; 0x100c6a030
0x100a6b2a3: mov qword ptr [rbp - 0x58], rax
0x100a6b2a7: mov rax, qword ptr [rip + 0x1fc352] ; 0x100c67600
0x100a6b2ae: mov qword ptr [rbp - 0x50], rax
0x100a6b2b2: mov rax, rsi
0x100a6b2b5: mov rdx, qword ptr [rip + 0x1feadc] ; 0x100c69d98
0x100a6b2bc: mov qword ptr [rbp - 0x80], rdx
0x100a6b2c0: lea r14, [rax + r15 + 0x18]
0x100a6b2c5: mov rbx, qword ptr [rip + 0x1a284c] ; 0x100c0db18
0x100a6b2cc: xor r15d, r15d
0x100a6b2cf: nop 
0x100a6b2d0: mov rdi, qword ptr [rcx + 8]
0x100a6b2d4: mov rax, qword ptr [rbp - 0x38]
0x100a6b2d8: mov rdx, qword ptr [rax]
0x100a6b2db: mov rsi, qword ptr [rbp - 0x58]
0x100a6b2df: mov r12, qword ptr [rip + 0x1a282a] ; 0x100c0db10
0x100a6b2e6: call r12
0x100a6b2e9: mov rdi, qword ptr [r14 + r15*8]
0x100a6b2ed: mov qword ptr [r14 + r15*8], rax
0x100a6b2f1: mov r13, rbx
0x100a6b2f4: call rbx
0x100a6b2f6: mov rdi, qword ptr [rip + 0x1ffc63] ; 0x100c6af60
0x100a6b2fd: xor eax, eax
0x100a6b2ff: mov rsi, qword ptr [rbp - 0x50]
0x100a6b303: lea rdx, [rip + 0x1d64c6] ; 0x100c417d0
0x100a6b30a: mov rcx, qword ptr [rbp - 0x60]
0x100a6b30e: mov r8d, r15d
0x100a6b311: call r12
0x100a6b314: mov rdi, rax
0x100a6b317: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a6b31c: mov rbx, rax
0x100a6b31f: mov rdi, qword ptr [r14 + r15*8]
0x100a6b323: mov rsi, qword ptr [rbp - 0x80]
0x100a6b327: mov rdx, rbx
0x100a6b32a: call r12
0x100a6b32d: mov rdi, rbx
0x100a6b330: mov rbx, r13
0x100a6b333: call rbx
0x100a6b335: inc r15
0x100a6b338: mov rax, qword ptr [rbp - 0x48]
0x100a6b33c: mov eax, dword ptr [rax]
0x100a6b33e: cmp r15, rax
0x100a6b341: mov rcx, qword ptr [rbp - 0x30]
0x100a6b345: jb 0x100a6b2d0
0x100a6b347: mov r14, qword ptr [rbp - 0x70]
0x100a6b34b: mov r15, qword ptr [rbp - 0x68]
0x100a6b34f: mov rsi, qword ptr [rbp - 0x40]
0x100a6b353: mov r13, qword ptr [rbp - 0x78]
0x100a6b357: cmp byte ptr [r14 + 0x21], 0
0x100a6b35c: jne 0x100a6b272
0x100a6b362: lea rax, [rsi + r15 + 8]
0x100a6b367: mov qword ptr [rbp - 0x30], rax
0x100a6b36b: mov r15, qword ptr [rbp - 0x38]
0x100a6b36f: mov rdi, qword ptr [r15]
0x100a6b372: mov rsi, qword ptr [rip + 0x1fecbf] ; 0x100c6a038
0x100a6b379: mov r12, qword ptr [rip + 0x1a2790] ; 0x100c0db10
0x100a6b380: call r12
0x100a6b383: mov qword ptr [rbp - 0x60], rax
0x100a6b387: mov rdi, qword ptr [r15]
0x100a6b38a: mov rsi, qword ptr [rip + 0x1fecaf] ; 0x100c6a040
0x100a6b391: call r12
0x100a6b394: mov qword ptr [rbp - 0x58], rax
0x100a6b398: mov rdi, qword ptr [r15]
0x100a6b39b: mov rsi, qword ptr [rip + 0x1feca6] ; 0x100c6a048
0x100a6b3a2: call r12
0x100a6b3a5: mov rbx, rax
0x100a6b3a8: mov rdi, qword ptr [r15]
0x100a6b3ab: mov rsi, qword ptr [rip + 0x1fea26] ; 0x100c69dd8
0x100a6b3b2: call r12
0x100a6b3b5: mov qword ptr [rbp - 0x50], rax
0x100a6b3b9: mov r14d, dword ptr [r14]
0x100a6b3bc: mov rdi, qword ptr [r15]
0x100a6b3bf: mov rsi, qword ptr [rip + 0x1fec8a] ; 0x100c6a050
0x100a6b3c6: call r12
0x100a6b3c9: xor r8d, r8d
0x100a6b3cc: mov esi, 0
0x100a6b3d1: test eax, eax
0x100a6b3d3: je 0x100a6b458
0x100a6b3d9: xor ecx, ecx
0x100a6b3db: cmp r14d, 2
0x100a6b3df: sete cl
0x100a6b3e2: xor edx, edx
0x100a6b3e4: cmp qword ptr [rbp - 0x50], 5
0x100a6b3e9: sete dl
0x100a6b3ec: lea edx, [rdx + rdx*4 + 1]
0x100a6b3f0: mov rsi, qword ptr [rbp - 0x58]
0x100a6b3f4: imul esi, dword ptr [rbp - 0x60]
0x100a6b3f8: imul ebx, esi
0x100a6b3fb: imul ebx, edx
0x100a6b3fe: or ecx, 2
0x100a6b401: lea esi, [rax - 1]
0x100a6b404: mov edx, eax
0x100a6b406: and edx, 7
0x100a6b409: cmp esi, 7
0x100a6b40c: jae 0x100a6b416
0x100a6b40e: xor esi, esi
0x100a6b410: test edx, edx
0x100a6b412: jne 0x100a6b449
0x100a6b414: jmp 0x100a6b458 ; 0x100a6b458
0x100a6b416: mov edi, edx
0x100a6b418: sub edi, eax
0x100a6b41a: xor esi, esi
0x100a6b41c: nop dword ptr [rax]
0x100a6b420: add esi, ebx
0x100a6b422: shr ebx, cl
0x100a6b424: add esi, ebx
0x100a6b426: shr ebx, cl
0x100a6b428: add esi, ebx
0x100a6b42a: shr ebx, cl
0x100a6b42c: add esi, ebx
0x100a6b42e: shr ebx, cl
0x100a6b430: add esi, ebx
0x100a6b432: shr ebx, cl
0x100a6b434: add esi, ebx
0x100a6b436: shr ebx, cl
0x100a6b438: add esi, ebx
0x100a6b43a: shr ebx, cl
0x100a6b43c: add esi, ebx
0x100a6b43e: shr ebx, cl
0x100a6b440: add edi, 8
0x100a6b443: jne 0x100a6b420
0x100a6b445: test edx, edx
0x100a6b447: je 0x100a6b458
0x100a6b449: neg edx
0x100a6b44b: nop dword ptr [rax + rax]
0x100a6b450: add esi, ebx
0x100a6b452: shr ebx, cl
0x100a6b454: inc edx
0x100a6b456: jne 0x100a6b450
0x100a6b458: mov rax, qword ptr [rbp - 0x48]
0x100a6b45c: imul esi, dword ptr [rax]
0x100a6b45f: mov rax, qword ptr [rbp - 0x30]
0x100a6b463: mov eax, dword ptr [rax]
0x100a6b465: dec eax
0x100a6b467: cmp eax, 0x20
0x100a6b46a: ja 0x100a6b479
0x100a6b46c: cdqe 
0x100a6b46e: lea rcx, [rip + 0x9b2fb] ; 0x100b06770
0x100a6b475: mov r8d, dword ptr [rcx + rax*4]
0x100a6b479: imul esi, r8d
0x100a6b47d: shr esi, 3
0x100a6b480: mov eax, 1
0x100a6b485: cmovne eax, esi
0x100a6b488: mov r15, qword ptr [rbp - 0x68]
0x100a6b48c: mov rsi, qword ptr [rbp - 0x40]
0x100a6b490: mov dword ptr [rsi + r15 + 0x14], eax
0x100a6b495: mov rax, qword ptr [rbp - 0x70]
0x100a6b499: mov al, byte ptr [rax + 8]
0x100a6b49c: and al, 6
0x100a6b49e: cmp al, 1
0x100a6b4a0: sbb eax, eax
0x100a6b4a2: mov dword ptr [rsi + r15 + 0x10], eax
0x100a6b4a7: mov eax, r13d
0x100a6b4aa: add rsp, 0x58
0x100a6b4ae: pop rbx
0x100a6b4af: pop r12
0x100a6b4b1: pop r13
0x100a6b4b3: pop r14
0x100a6b4b5: pop r15
0x100a6b4b7: pop rbp
0x100a6b4b8: ret 
0x100a6b4b9: lea rdi, [rip + 0x155883] ; 0x100bc0d43 /Users/buildserver/.jenkins/workspace/Sky-Test/Code/Renderer/MetalRenderer/MetalRenderer.mm
0x100a6b4c0: lea rdx, [rip + 0x1564a8] ; 0x100bc196f Unsupported TexelFormat
0x100a6b4c7: mov esi, 0xc0
0x100a6b4cc: xor eax, eax
0x100a6b4ce: call qword ptr [rip + 0x12fce34] ; 0x101d68308
0x100a6b4d4: call 0x100aa2564 ; 0x100aa2564 _abort
0x100a6b4d9: mov rcx, qword ptr [rdi + 0xd0]
0x100a6b4e0: lea rdi, [rip + 0x1564b9] ; 0x100bc19a0 ../../../Code/Renderer/RendererUtils.h
0x100a6b4e7: lea rdx, [rip + 0x1564d9] ; 0x100bc19c7 %s: Exceeded maximum capacity
0x100a6b4ee: mov esi, 0x6c
0x100a6b4f3: xor eax, eax
0x100a6b4f5: call qword ptr [rip + 0x12fce0d] ; 0x101d68308
0x100a6b4fb: call 0x100aa2564 ; 0x100aa2564 _abort
0x100a6b500: mov rcx, qword ptr [rdi + 0xd0]
0x100a6b507: lea rdi, [rip + 0x156492] ; 0x100bc19a0 ../../../Code/Renderer/RendererUtils.h
0x100a6b50e: lea rdx, [rip + 0x1564d0] ; 0x100bc19e5 %s: Attempted to access out of bounds [%u]
0x100a6b515: mov esi, 0x64
0x100a6b51a: xor eax, eax
0x100a6b51c: mov r8d, r13d
0x100a6b51f: call qword ptr [rip + 0x12fcde3] ; 0x101d68308
0x100a6b525: call 0x100aa2564 ; 0x100aa2564 _abort
0x100a6b52a: mov rcx, qword ptr [rdi + 0xd0]
0x100a6b531: lea rdi, [rip + 0x156468] ; 0x100bc19a0 ../../../Code/Renderer/RendererUtils.h
0x100a6b538: lea rdx, [rip + 0x1564d1] ; 0x100bc1a10 %s: Attempted to access unallocated slot [%u]
0x100a6b53f: mov esi, 0x65
0x100a6b544: xor eax, eax
0x100a6b546: mov r8d, r13d
0x100a6b549: call qword ptr [rip + 0x12fcdb9] ; 0x101d68308
0x100a6b54f: call 0x100aa2564 ; 0x100aa2564 _abort
0x100a6b554: lea rdi, [rip + 0x1557e8] ; 0x100bc0d43 /Users/buildserver/.jenkins/workspace/Sky-Test/Code/Renderer/MetalRenderer/MetalRenderer.mm
0x100a6b55b: lea rdx, [rip + 0x137aca] ; 0x100ba302c false
0x100a6b562: mov esi, 0x161
0x100a6b567: xor eax, eax
0x100a6b569: call qword ptr [rip + 0x12fcd99] ; 0x101d68308
0x100a6b56f: call 0x100aa2564 ; 0x100aa2564 _abort
0x100a6b574: mov r14, rax
0x100a6b577: mov rdi, rbx
0x100a6b57a: call qword ptr [rip + 0x1a2598] ; 0x100c0db18
0x100a6b580: mov rdi, r14
0x100a6b583: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100a6b588: ud2 
0x100a6b58a: nop word ptr [rax + rax]
