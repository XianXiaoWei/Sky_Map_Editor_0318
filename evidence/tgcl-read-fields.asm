0x10040b390: push rbp
0x10040b391: mov rbp, rsp
0x10040b394: push r15
0x10040b396: push r14
0x10040b398: push r13
0x10040b39a: push r12
0x10040b39c: push rbx
0x10040b39d: sub rsp, 0x88
0x10040b3a4: mov r8, rdx
0x10040b3a7: mov r13, rdi
0x10040b3aa: mov qword ptr [rbp - 0x68], rsi
0x10040b3ae: test rsi, rsi
0x10040b3b1: je 0x10040b3f3
0x10040b3b3: mov rbx, r8
0x10040b3b6: mov edi, dword ptr [rsi]
0x10040b3b8: call 0x1007abd30 ; 0x1007abd30
0x10040b3bd: mov rcx, qword ptr [rax]
0x10040b3c0: mov rdi, rax
0x10040b3c3: call qword ptr [rcx + 0x68]
0x10040b3c6: test rax, rax
0x10040b3c9: jne 0x10040b3d0
0x10040b3cb: call 0x1007abc60 ; 0x1007abc60
0x10040b3d0: mov rcx, qword ptr [rax]
0x10040b3d3: lea rsi, [rbp - 0x68]
0x10040b3d7: mov rdi, rax
0x10040b3da: call qword ptr [rcx + 0xd8]
0x10040b3e0: mov r8, rbx
0x10040b3e3: mov qword ptr [rbp - 0x40], rax
0x10040b3e7: cmp dword ptr [r8 + 8], 0
0x10040b3ec: jne 0x10040b404
0x10040b3ee: jmp 0x10040b940 ; 0x10040b940
0x10040b3f3: xor eax, eax
0x10040b3f5: mov qword ptr [rbp - 0x40], rax
0x10040b3f9: cmp dword ptr [r8 + 8], 0
0x10040b3fe: je 0x10040b940
0x10040b404: xor ebx, ebx
0x10040b406: lea r15, [rip + 0x7d7] ; 0x10040bbe4
0x10040b40d: mov qword ptr [rbp - 0x50], r8
0x10040b411: nop word ptr cs:[rax + rax]
0x10040b420: mov rcx, qword ptr [r13 + 0x1438]
0x10040b427: mov r9, qword ptr [r13 + 0x1440]
0x10040b42e: mov r12d, dword ptr [r8 + 4]
0x10040b432: add r12d, ebx
0x10040b435: mov r10, qword ptr [rbp - 0x68]
0x10040b439: test r10, r10
0x10040b43c: je 0x10040b450
0x10040b43e: mov rax, r12
0x10040b441: shl rax, 4
0x10040b445: cmp dword ptr [rcx + rax + 4], -1
0x10040b44a: setne dil
0x10040b44e: jmp 0x10040b452 ; 0x10040b452
0x10040b450: xor edi, edi
0x10040b452: mov r14, r12
0x10040b455: shl r14, 4
0x10040b459: mov eax, dword ptr [rcx + r14]
0x10040b45d: cmp rax, 3
0x10040b461: ja 0x10040bb4f
0x10040b467: shl r12, 5
0x10040b46b: lea rdx, [r9 + r12]
0x10040b46f: movsxd rax, dword ptr [r15 + rax*4]
0x10040b473: add rax, r15
0x10040b476: jmp rax
0x10040b478: test dil, dil
0x10040b47b: je 0x10040b5c7
0x10040b481: mov rdi, qword ptr [rbp - 0x40]
0x10040b485: add rdi, qword ptr [rdx]
0x10040b488: jmp 0x10040b5c9 ; 0x10040b5c9
0x10040b48d: nop dword ptr [rax]
0x10040b490: test dil, dil
0x10040b493: je 0x10040b548
0x10040b499: mov r8, qword ptr [rbp - 0x40]
0x10040b49d: add r8, qword ptr [rdx]
0x10040b4a0: jmp 0x10040b54b ; 0x10040b54b
0x10040b4a5: nop word ptr cs:[rax + rax]
0x10040b4b0: mov qword ptr [rbp - 0x60], rbx
0x10040b4b4: mov esi, dword ptr [r13 + 0x1478]
0x10040b4bb: mov eax, dword ptr [r13 + 0x147c]
0x10040b4c2: lea rdx, [rax + 4]
0x10040b4c6: cmp rdx, rsi
0x10040b4c9: ja 0x10040baf2
0x10040b4cf: mov rsi, qword ptr [r13 + 0x1470]
0x10040b4d6: mov r8d, dword ptr [rsi + rax]
0x10040b4da: mov dword ptr [rbp - 0x34], r8d
0x10040b4de: mov dword ptr [r13 + 0x147c], edx
0x10040b4e5: mov r15d, 0
0x10040b4eb: mov eax, 0
0x10040b4f0: mov qword ptr [rbp - 0x30], rax
0x10040b4f4: test dil, dil
0x10040b4f7: je 0x10040b77f
0x10040b4fd: mov dword ptr [rbp - 0x6c], edi
0x10040b500: mov qword ptr [rbp - 0x88], rcx
0x10040b507: mov qword ptr [rbp - 0x48], r9
0x10040b50b: test r10, r10
0x10040b50e: je 0x10040b64d
0x10040b514: mov edi, dword ptr [r10]
0x10040b517: call 0x1007abd30 ; 0x1007abd30
0x10040b51c: jmp 0x10040b652 ; 0x10040b652
0x10040b521: nop word ptr cs:[rax + rax]
0x10040b530: mov r14, r8
0x10040b533: test dil, dil
0x10040b536: je 0x10040b62f
0x10040b53c: mov rsi, qword ptr [rbp - 0x40]
0x10040b540: add rsi, qword ptr [rdx]
0x10040b543: jmp 0x10040b631 ; 0x10040b631
0x10040b548: xor r8d, r8d
0x10040b54b: mov ecx, dword ptr [r13 + 0x1478]
0x10040b552: mov edx, dword ptr [r13 + 0x147c]
0x10040b559: lea rsi, [rdx + 4]
0x10040b55d: cmp rsi, rcx
0x10040b560: ja 0x10040baf2
0x10040b566: mov rcx, qword ptr [r9 + r12 + 8]
0x10040b56b: mov rdi, qword ptr [r13 + 0x1470]
0x10040b572: mov edx, dword ptr [rdi + rdx]
0x10040b575: mov dword ptr [r13 + 0x147c], esi
0x10040b57c: mov esi, dword ptr [r13 + 0x148c]
0x10040b583: cmp esi, dword ptr [r13 + 0x1488]
0x10040b58a: jae 0x10040bb11
0x10040b590: mov rdi, qword ptr [r13 + 0x1480]
0x10040b597: lea rax, [rsi + rsi*2]
0x10040b59b: mov qword ptr [rdi + rax*8], r8
0x10040b59f: mov dword ptr [rdi + rax*8 + 8], edx
0x10040b5a3: mov qword ptr [rdi + rax*8 + 0x10], rcx
0x10040b5a8: lea eax, [rsi + 1]
0x10040b5ab: mov dword ptr [r13 + 0x148c], eax
0x10040b5b2: mov r8, qword ptr [rbp - 0x50]
0x10040b5b6: inc ebx
0x10040b5b8: cmp ebx, dword ptr [r8 + 8]
0x10040b5bc: jb 0x10040b420
0x10040b5c2: jmp 0x10040b940 ; 0x10040b940
0x10040b5c7: xor edi, edi
0x10040b5c9: mov r15d, dword ptr [rcx + r14 + 8]
0x10040b5ce: mov ecx, dword ptr [r13 + 0x1478]
0x10040b5d5: mov eax, dword ptr [r13 + 0x147c]
0x10040b5dc: lea rdx, [rax + r15]
0x10040b5e0: cmp rdx, rcx
0x10040b5e3: ja 0x10040baf2
0x10040b5e9: test rdi, rdi
0x10040b5ec: je 0x10040b60d
0x10040b5ee: mov rsi, qword ptr [r13 + 0x1470]
0x10040b5f5: add rsi, rax
0x10040b5f8: mov rdx, r15
0x10040b5fb: mov r14, r8
0x10040b5fe: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x10040b603: mov r8, r14
0x10040b606: mov eax, dword ptr [r13 + 0x147c]
0x10040b60d: add r15d, eax
0x10040b610: mov dword ptr [r13 + 0x147c], r15d
0x10040b617: lea r15, [rip + 0x5c6] ; 0x10040bbe4
0x10040b61e: inc ebx
0x10040b620: cmp ebx, dword ptr [r8 + 8]
0x10040b624: jb 0x10040b420
0x10040b62a: jmp 0x10040b940 ; 0x10040b940
0x10040b62f: xor esi, esi
0x10040b631: mov rdi, r13
0x10040b634: call 0x10040b1d0 ; 0x10040b1d0
0x10040b639: mov r8, r14
0x10040b63c: inc ebx
0x10040b63e: cmp ebx, dword ptr [r8 + 8]
0x10040b642: jb 0x10040b420
0x10040b648: jmp 0x10040b940 ; 0x10040b940
0x10040b64d: call 0x1007abbf0 ; 0x1007abbf0
0x10040b652: mov rcx, qword ptr [rax]
0x10040b655: mov rdi, rax
0x10040b658: call qword ptr [rcx + 0x68]
0x10040b65b: mov qword ptr [rbp - 0x30], rax
0x10040b65f: test rax, rax
0x10040b662: jne 0x10040b66d
0x10040b664: call 0x1007abc60 ; 0x1007abc60
0x10040b669: mov qword ptr [rbp - 0x30], rax
0x10040b66d: mov rbx, qword ptr [rbp - 0x48]
0x10040b671: mov rax, qword ptr [rbx + r12 + 0x10]
0x10040b676: mov qword ptr [rbp - 0x80], rax
0x10040b67a: lea rax, [rbp - 0x34]
0x10040b67e: mov qword ptr [rbp - 0x98], rax
0x10040b685: mov dword ptr [rbp - 0x58], 0
0x10040b68c: lea rax, [rbp - 0x58]
0x10040b690: mov rdi, rax
0x10040b693: call 0x1007abaf0 ; 0x1007abaf0
0x10040b698: mov qword ptr [rbp - 0x90], rax
0x10040b69f: mov r15, qword ptr [rbx + r12 + 0x18]
0x10040b6a4: call 0x1007abbf0 ; 0x1007abbf0
0x10040b6a9: mov rbx, rax
0x10040b6ac: mov qword ptr [rbp - 0x58], 0
0x10040b6b4: call qword ptr [r15 + 0x58]
0x10040b6b8: mov r8, qword ptr [rax]
0x10040b6bb: mov rdi, rax
0x10040b6be: lea rsi, [rbp - 0x58]
0x10040b6c2: lea rax, [rbp - 0x40]
0x10040b6c6: mov rdx, rax
0x10040b6c9: mov rcx, qword ptr [rbp - 0x30]
0x10040b6cd: call qword ptr [r8 + 0x40]
0x10040b6d1: mov rdx, qword ptr [rbp - 0x58]
0x10040b6d5: test rdx, rdx
0x10040b6d8: je 0x10040bb8d
0x10040b6de: mov rdi, qword ptr [r15 + 0x38]
0x10040b6e2: mov rsi, qword ptr [r15 + 0x40]
0x10040b6e6: mov dword ptr [rsp], 1
0x10040b6ed: xor ecx, ecx
0x10040b6ef: mov r8, rbx
0x10040b6f2: lea r9, [rbp - 0x98]
0x10040b6f9: call qword ptr [r15 + 0x48]
0x10040b6fd: mov r15, qword ptr [rbp - 0x80]
0x10040b701: call qword ptr [r15 + 0x30]
0x10040b705: mov rbx, rax
0x10040b708: mov rax, qword ptr [rbx]
0x10040b70b: mov rax, qword ptr [rax + 0xe0]
0x10040b712: mov qword ptr [rbp - 0x78], rax
0x10040b716: mov rdi, qword ptr [rbp - 0x30]
0x10040b71a: mov rax, qword ptr [rdi]
0x10040b71d: call qword ptr [rax + 0x68]
0x10040b720: mov rcx, qword ptr [r15 + 0x20]
0x10040b724: mov rdi, rbx
0x10040b727: lea rsi, [rbp - 0x40]
0x10040b72b: mov rdx, rax
0x10040b72e: call qword ptr [rbp - 0x78]
0x10040b731: mov qword ptr [rbp - 0x30], rax
0x10040b735: cmp qword ptr [r15 + 0x38], -1
0x10040b73a: je 0x10040b75d
0x10040b73c: cmp qword ptr [r15 + 0x48], 0
0x10040b741: jne 0x10040b75d
0x10040b743: mov rax, qword ptr [rbp - 0x30]
0x10040b747: mov rcx, rax
0x10040b74a: mov rcx, qword ptr [rcx]
0x10040b74d: mov rax, rcx
0x10040b750: mov qword ptr [rbp - 0x30], rax
0x10040b754: test rcx, rcx
0x10040b757: je 0x10040bbac
0x10040b75d: call qword ptr [r15 + 0x28]
0x10040b761: mov rcx, qword ptr [rax]
0x10040b764: mov rdi, rax
0x10040b767: call qword ptr [rcx + 0x68]
0x10040b76a: mov r15, rax
0x10040b76d: mov r8d, dword ptr [rbp - 0x34]
0x10040b771: mov r9, qword ptr [rbp - 0x48]
0x10040b775: mov rcx, qword ptr [rbp - 0x88]
0x10040b77c: mov edi, dword ptr [rbp - 0x6c]
0x10040b77f: test r8d, r8d
0x10040b782: je 0x10040b925
0x10040b788: lea r14, [rcx + r14 + 0xc]
0x10040b78d: lea r12, [r9 + r12 + 8]
0x10040b792: xor ebx, ebx
0x10040b794: test dil, dil
0x10040b797: je 0x10040b880
0x10040b79d: nop dword ptr [rax]
0x10040b7a0: cmp dword ptr [r14], -1
0x10040b7a4: mov ecx, ebx
0x10040b7a6: mov rax, qword ptr [rbp - 0x30]
0x10040b7aa: lea rsi, [rax + rcx*8]
0x10040b7ae: je 0x10040b800
0x10040b7b0: cmp qword ptr [rsi], 0
0x10040b7b4: je 0x10040bb30
0x10040b7ba: mov rax, qword ptr [r15]
0x10040b7bd: mov rdi, r15
0x10040b7c0: call qword ptr [rax + 0xd0]
0x10040b7c6: mov rcx, qword ptr [r13 + 0x1420]
0x10040b7cd: mov edx, dword ptr [r14]
0x10040b7d0: lea rdx, [rdx + rdx*2]
0x10040b7d4: lea rdx, [rcx + rdx*4]
0x10040b7d8: mov rdi, r13
0x10040b7db: mov rsi, rax
0x10040b7de: call 0x10040b390 ; 0x10040b390
0x10040b7e3: mov r8d, dword ptr [rbp - 0x34]
0x10040b7e7: inc ebx
0x10040b7e9: cmp ebx, r8d
0x10040b7ec: jb 0x10040b7a0
0x10040b7ee: jmp 0x10040b925 ; 0x10040b925
0x10040b7f3: nop word ptr cs:[rax + rax]
0x10040b800: mov ecx, dword ptr [r13 + 0x1478]
0x10040b807: mov edx, dword ptr [r13 + 0x147c]
0x10040b80e: lea rdi, [rdx + 4]
0x10040b812: cmp rdi, rcx
0x10040b815: ja 0x10040baf2
0x10040b81b: mov r9, qword ptr [r12]
0x10040b81f: mov rax, qword ptr [r13 + 0x1470]
0x10040b826: mov edx, dword ptr [rax + rdx]
0x10040b829: mov dword ptr [r13 + 0x147c], edi
0x10040b830: mov edi, dword ptr [r13 + 0x148c]
0x10040b837: cmp edi, dword ptr [r13 + 0x1488]
0x10040b83e: jae 0x10040bb11
0x10040b844: mov rax, qword ptr [r13 + 0x1480]
0x10040b84b: lea rcx, [rdi + rdi*2]
0x10040b84f: mov qword ptr [rax + rcx*8], rsi
0x10040b853: mov dword ptr [rax + rcx*8 + 8], edx
0x10040b857: mov qword ptr [rax + rcx*8 + 0x10], r9
0x10040b85c: lea eax, [rdi + 1]
0x10040b85f: mov dword ptr [r13 + 0x148c], eax
0x10040b866: inc ebx
0x10040b868: cmp ebx, r8d
0x10040b86b: jb 0x10040b7a0
0x10040b871: jmp 0x10040b925 ; 0x10040b925
0x10040b876: nop word ptr cs:[rax + rax]
0x10040b880: mov ecx, dword ptr [r14]
0x10040b883: mov eax, 0xffffffff
0x10040b888: cmp rcx, rax
0x10040b88b: je 0x10040b8b0
0x10040b88d: mov rax, qword ptr [r13 + 0x1420]
0x10040b894: lea rcx, [rcx + rcx*2]
0x10040b898: lea rdx, [rax + rcx*4]
0x10040b89c: xor esi, esi
0x10040b89e: mov rdi, r13
0x10040b8a1: call 0x10040b390 ; 0x10040b390
0x10040b8a6: mov r8d, dword ptr [rbp - 0x34]
0x10040b8aa: jmp 0x10040b91a ; 0x10040b91a
0x10040b8ac: nop dword ptr [rax]
0x10040b8b0: mov eax, dword ptr [r13 + 0x1478]
0x10040b8b7: mov edx, dword ptr [r13 + 0x147c]
0x10040b8be: lea rsi, [rdx + 4]
0x10040b8c2: cmp rsi, rax
0x10040b8c5: ja 0x10040baf2
0x10040b8cb: mov rcx, qword ptr [r12]
0x10040b8cf: mov rax, qword ptr [r13 + 0x1470]
0x10040b8d6: mov edx, dword ptr [rax + rdx]
0x10040b8d9: mov dword ptr [r13 + 0x147c], esi
0x10040b8e0: mov esi, dword ptr [r13 + 0x148c]
0x10040b8e7: cmp esi, dword ptr [r13 + 0x1488]
0x10040b8ee: jae 0x10040bb11
0x10040b8f4: mov rax, qword ptr [r13 + 0x1480]
0x10040b8fb: lea rdi, [rsi + rsi*2]
0x10040b8ff: mov qword ptr [rax + rdi*8], 0
0x10040b907: mov dword ptr [rax + rdi*8 + 8], edx
0x10040b90b: mov qword ptr [rax + rdi*8 + 0x10], rcx
0x10040b910: lea eax, [rsi + 1]
0x10040b913: mov dword ptr [r13 + 0x148c], eax
0x10040b91a: inc ebx
0x10040b91c: cmp ebx, r8d
0x10040b91f: jb 0x10040b880
0x10040b925: mov r8, qword ptr [rbp - 0x50]
0x10040b929: mov rbx, qword ptr [rbp - 0x60]
0x10040b92d: lea r15, [rip + 0x2b0] ; 0x10040bbe4
0x10040b934: inc ebx
0x10040b936: cmp ebx, dword ptr [r8 + 8]
0x10040b93a: jb 0x10040b420
0x10040b940: cmp qword ptr [rbp - 0x68], 0
0x10040b945: je 0x10040bae0
0x10040b94b: mov r14, qword ptr [r13 + 0x1428]
0x10040b952: sub r8, qword ptr [r13 + 0x1420]
0x10040b959: sar r8, 2
0x10040b95d: movabs r15, 0xaaaaaaaaaaaaaaab
0x10040b967: imul r15, r8
0x10040b96b: cmp dword ptr [r14 + r15*8 + 4], 0
0x10040b971: je 0x10040bae0
0x10040b977: xor r12d, r12d
0x10040b97a: mov qword ptr [rbp - 0x50], r14
0x10040b97e: mov qword ptr [rbp - 0x60], r15
0x10040b982: nop word ptr cs:[rax + rax]
0x10040b990: mov rax, qword ptr [r13 + 0x1450]
0x10040b997: mov edx, dword ptr [r14 + r15*8]
0x10040b99b: add edx, r12d
0x10040b99e: lea rcx, [rdx + rdx*8]
0x10040b9a2: lea rcx, [rcx + rcx*2]
0x10040b9a6: add rcx, rdx
0x10040b9a9: mov edx, dword ptr [rax + rcx]
0x10040b9ac: cmp edx, 2
0x10040b9af: je 0x10040b9be
0x10040b9b1: cmp edx, 1
0x10040b9b4: je 0x10040b9f0
0x10040b9b6: test edx, edx
0x10040b9b8: jne 0x10040bb6e
0x10040b9be: mov edx, dword ptr [rax + rcx + 4]
0x10040b9c2: mov edi, dword ptr [rax + rcx + 8]
0x10040b9c6: add rdi, qword ptr [rbp - 0x40]
0x10040b9ca: lea rsi, [rax + rcx + 0xc]
0x10040b9cf: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x10040b9d4: inc r12d
0x10040b9d7: cmp r12d, dword ptr [r14 + r15*8 + 4]
0x10040b9dc: jb 0x10040b990
0x10040b9de: jmp 0x10040bae0 ; 0x10040bae0
0x10040b9e3: nop word ptr cs:[rax + rax]
0x10040b9f0: mov rdx, qword ptr [rax + rcx + 0xc]
0x10040b9f5: mov rdi, qword ptr [rdx + 8]
0x10040b9f9: mov rbx, qword ptr [rbp - 0x40]
0x10040b9fd: mov r14d, dword ptr [rax + rcx + 8]
0x10040ba02: lea r15, [rbx + r14]
0x10040ba06: mov qword ptr [rbp - 0x30], rdi
0x10040ba0a: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x10040ba0f: movzx ecx, byte ptr [rbx + r14]
0x10040ba14: test cl, 1
0x10040ba17: jne 0x10040ba20
0x10040ba19: mov esi, 0x16
0x10040ba1e: jmp 0x10040ba2a ; 0x10040ba2a
0x10040ba20: mov rsi, qword ptr [r15]
0x10040ba23: and rsi, 0xfffffffffffffffe
0x10040ba27: dec rsi
0x10040ba2a: mov rdi, r15
0x10040ba2d: mov rdx, rax
0x10040ba30: sub rdx, rsi
0x10040ba33: mov r14, qword ptr [rbp - 0x50]
0x10040ba37: mov r15, qword ptr [rbp - 0x60]
0x10040ba3b: jbe 0x10040ba47
0x10040ba3d: test cl, 1
0x10040ba40: jne 0x10040ba57
0x10040ba42: shr rcx, 1
0x10040ba45: jmp 0x10040ba5b ; 0x10040ba5b
0x10040ba47: test cl, 1
0x10040ba4a: jne 0x10040ba83
0x10040ba4c: lea rcx, [rdi + 1]
0x10040ba50: test rax, rax
0x10040ba53: jne 0x10040ba8c
0x10040ba55: jmp 0x10040bab1 ; 0x10040bab1
0x10040ba57: mov rcx, qword ptr [rdi + 8]
0x10040ba5b: mov rbx, qword ptr [rbp - 0x30]
0x10040ba5f: mov qword ptr [rsp + 8], rbx
0x10040ba64: mov qword ptr [rsp], rax
0x10040ba68: xor r8d, r8d
0x10040ba6b: mov r9, rcx
0x10040ba6e: call 0x1000198c0 ; 0x1000198c0
0x10040ba73: inc r12d
0x10040ba76: cmp r12d, dword ptr [r14 + r15*8 + 4]
0x10040ba7b: jb 0x10040b990
0x10040ba81: jmp 0x10040bae0 ; 0x10040bae0
0x10040ba83: mov rcx, qword ptr [rdi + 0x10]
0x10040ba87: test rax, rax
0x10040ba8a: je 0x10040bab1
0x10040ba8c: mov qword ptr [rbp - 0x48], rdi
0x10040ba90: mov rdi, rcx
0x10040ba93: mov rsi, qword ptr [rbp - 0x30]
0x10040ba97: mov rdx, rax
0x10040ba9a: mov rbx, rax
0x10040ba9d: mov qword ptr [rbp - 0x30], rcx
0x10040baa1: call 0x100aa28fa ; 0x100aa28fa _memmove
0x10040baa6: mov rcx, qword ptr [rbp - 0x30]
0x10040baaa: mov rax, rbx
0x10040baad: mov rdi, qword ptr [rbp - 0x48]
0x10040bab1: mov byte ptr [rcx + rax], 0
0x10040bab5: test byte ptr [rdi], 1
0x10040bab8: jne 0x10040bace
0x10040baba: add al, al
0x10040babc: mov byte ptr [rdi], al
0x10040babe: inc r12d
0x10040bac1: cmp r12d, dword ptr [r14 + r15*8 + 4]
0x10040bac6: jb 0x10040b990
0x10040bacc: jmp 0x10040bae0 ; 0x10040bae0
0x10040bace: mov qword ptr [rdi + 8], rax
0x10040bad2: inc r12d
0x10040bad5: cmp r12d, dword ptr [r14 + r15*8 + 4]
0x10040bada: jb 0x10040b990
0x10040bae0: add rsp, 0x88
0x10040bae7: pop rbx
0x10040bae8: pop r12
0x10040baea: pop r13
0x10040baec: pop r14
0x10040baee: pop r15
0x10040baf0: pop rbp
0x10040baf1: ret 
0x10040baf2: lea rdi, [rip + 0x77be09] ; 0x100b87902 ctx->dataHead + podSize <= ctx->dataMax
0x10040baf9: lea rsi, [rip + 0x77be2a] ; 0x100b8792a LevelObjects.cpp
0x10040bb00: mov edx, 0x9d
0x10040bb05: mov ecx, 3
0x10040bb0a: call 0x1007e5f70 ; 0x1007e5f70
0x10040bb0f: ud2 
0x10040bb11: lea rdi, [rip + 0x77be41] ; 0x100b87959 ctx->objectPtrCount < ctx->objectPtrMax
0x10040bb18: lea rsi, [rip + 0x77be0b] ; 0x100b8792a LevelObjects.cpp
0x10040bb1f: mov edx, 0xb0
0x10040bb24: mov ecx, 3
0x10040bb29: call 0x1007e5f70 ; 0x1007e5f70
0x10040bb2e: ud2 
0x10040bb30: lea rdi, [rip + 0x77be4a] ; 0x100b87981 !hasVar || varArray[ j ]
0x10040bb37: lea rsi, [rip + 0x77bdec] ; 0x100b8792a LevelObjects.cpp
0x10040bb3e: mov edx, 0xe5
0x10040bb43: mov ecx, 3
0x10040bb48: call 0x1007e5f70 ; 0x1007e5f70
0x10040bb4d: ud2 
0x10040bb4f: lea rdi, [rip + 0x7974d6] ; 0x100ba302c false
0x10040bb56: lea rsi, [rip + 0x77bdcd] ; 0x100b8792a LevelObjects.cpp
0x10040bb5d: mov edx, 0xeb
0x10040bb62: mov ecx, 3
0x10040bb67: call 0x1007e5f70 ; 0x1007e5f70
0x10040bb6c: ud2 
0x10040bb6e: lea rdi, [rip + 0x7974b7] ; 0x100ba302c false
0x10040bb75: lea rsi, [rip + 0x77bdae] ; 0x100b8792a LevelObjects.cpp
0x10040bb7c: mov edx, 0x105
0x10040bb81: mov ecx, 3
0x10040bb86: call 0x1007e5f70 ; 0x1007e5f70
0x10040bb8b: ud2 
0x10040bb8d: lea rdi, [rip + 0x76c2e2] ; 0x100b77e76 c
0x10040bb94: lea rsi, [rip + 0x751a3d] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x10040bb9b: mov edx, 0x443
0x10040bba0: mov ecx, 3
0x10040bba5: call 0x1007e5f70 ; 0x1007e5f70
0x10040bbaa: ud2 
0x10040bbac: call qword ptr [r15 + 0x30]
0x10040bbb0: mov r9, qword ptr [rax + 8]
0x10040bbb4: mov rax, qword ptr [r15]
0x10040bbb7: mov qword ptr [rsp], rax
0x10040bbbb: lea rdi, [rip + 0x772bc8] ; 0x100b7e78a !m_countAddress || m_staticArraySize > 0 || *(void**)v != 0
0x10040bbc2: lea rsi, [rip + 0x751a0f] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x10040bbc9: lea r8, [rip + 0x772bf6] ; 0x100b7e7c6 %s::%s is a null array
0x10040bbd0: mov edx, 0x40b
0x10040bbd5: mov ecx, 4
0x10040bbda: xor eax, eax
0x10040bbdc: call 0x1007e6030 ; 0x1007e6030
0x10040bbe1: ud2 
0x10040bbe3: nop 
