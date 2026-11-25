0x1000dd370: push rbp
0x1000dd371: mov rbp, rsp
0x1000dd374: push r15
0x1000dd376: push r14
0x1000dd378: push r13
0x1000dd37a: push r12
0x1000dd37c: push rbx
0x1000dd37d: sub rsp, 0x68
0x1000dd381: mov qword ptr [rbp - 0x40], rdx
0x1000dd385: mov r14, rsi
0x1000dd388: mov r12, rdi
0x1000dd38b: mov dword ptr [rbp - 0x30], 3
0x1000dd392: lea rsi, [rbp - 0x30]
0x1000dd396: mov rdi, r14
0x1000dd399: call 0x10076a240 ; 0x10076a240
0x1000dd39e: mov eax, dword ptr [rbp - 0x30]
0x1000dd3a1: dec eax
0x1000dd3a3: cmp eax, 3
0x1000dd3a6: jae 0x1000ddbd2
0x1000dd3ac: lea rsi, [r12 + 8]
0x1000dd3b1: mov rdi, r14
0x1000dd3b4: mov qword ptr [rbp - 0x68], rsi
0x1000dd3b8: call 0x10076a240 ; 0x10076a240
0x1000dd3bd: mov eax, dword ptr [r12 + 8]
0x1000dd3c2: cmp eax, 0x200
0x1000dd3c7: jge 0x1000ddbf1
0x1000dd3cd: mov dword ptr [r12 + 0x1010], 0
0x1000dd3d9: test eax, eax
0x1000dd3db: je 0x1000ddba4
0x1000dd3e1: mov eax, dword ptr [r14]
0x1000dd3e4: mov dword ptr [rbp - 0x2c], eax
0x1000dd3e7: xor ecx, ecx
0x1000dd3e9: mov qword ptr [rbp - 0x70], r12
0x1000dd3ed: nop dword ptr [rax]
0x1000dd3f0: cmp dword ptr [rbp - 0x2c], 0
0x1000dd3f4: mov dword ptr [rbp - 0x5c], ecx
0x1000dd3f7: je 0x1000dd410
0x1000dd3f9: mov eax, ecx
0x1000dd3fb: lea r15, [r12 + rax*8 + 0x10]
0x1000dd400: mov rbx, qword ptr [r12 + rax*8 + 0x10]
0x1000dd405: jmp 0x1000dd46a ; 0x1000dd46a
0x1000dd407: nop word ptr [rax + rax]
0x1000dd410: mov rdx, qword ptr [rip + 0x1c971f9] ; 0x101d74610
0x1000dd417: mov esi, 0x28
0x1000dd41c: mov r15d, ecx
0x1000dd41f: mov ecx, 8
0x1000dd424: mov rdi, qword ptr [rbp - 0x40]
0x1000dd428: call 0x100795530 ; 0x100795530
0x1000dd42d: mov rbx, rax
0x1000dd430: vxorps ymm0, ymm0, ymm0
0x1000dd434: vmovups ymmword ptr [rbx], ymm0
0x1000dd438: mov qword ptr [rbx + 0x20], 0
0x1000dd440: vzeroupper 
0x1000dd443: call 0x1007abc10 ; 0x1007abc10
0x1000dd448: mov rax, qword ptr [rip + 0x1c97311] ; 0x101d74760
0x1000dd44f: mov eax, dword ptr [rax + 0x38]
0x1000dd452: mov dword ptr [rbx], eax
0x1000dd454: vxorps ymm0, ymm0, ymm0
0x1000dd458: vmovups ymmword ptr [rbx + 8], ymm0
0x1000dd45d: mov eax, r15d
0x1000dd460: lea r15, [r12 + rax*8 + 0x10]
0x1000dd465: mov qword ptr [r12 + rax*8 + 0x10], rbx
0x1000dd46a: add rbx, 8
0x1000dd46e: mov rdi, r14
0x1000dd471: mov rsi, rbx
0x1000dd474: vzeroupper 
0x1000dd477: call 0x1000ddc10 ; 0x1000ddc10
0x1000dd47c: mov rsi, qword ptr [r15]
0x1000dd47f: add rsi, 0x20
0x1000dd483: mov rdi, r14
0x1000dd486: call 0x10076a240 ; 0x10076a240
0x1000dd48b: mov ebx, dword ptr [r12 + 0x1010]
0x1000dd493: mov rax, qword ptr [r15]
0x1000dd496: mov dword ptr [rax + 0x24], ebx
0x1000dd499: mov eax, dword ptr [rax + 0x20]
0x1000dd49c: add eax, ebx
0x1000dd49e: mov dword ptr [r12 + 0x1010], eax
0x1000dd4a6: cmp eax, 0x1000
0x1000dd4ab: jge 0x1000ddbb3
0x1000dd4b1: cmp ebx, eax
0x1000dd4b3: jae 0x1000ddb93
0x1000dd4b9: nop dword ptr [rax]
0x1000dd4c0: cmp dword ptr [rbp - 0x2c], 0
0x1000dd4c4: mov dword ptr [rbp - 0x60], ebx
0x1000dd4c7: je 0x1000dd4e0
0x1000dd4c9: mov eax, ebx
0x1000dd4cb: mov r15, qword ptr [r12 + rax*8 + 0x1018]
0x1000dd4d3: jmp 0x1000dd5b2 ; 0x1000dd5b2
0x1000dd4d8: nop dword ptr [rax + rax]
0x1000dd4e0: mov rdx, qword ptr [rip + 0x1c97129] ; 0x101d74610
0x1000dd4e7: mov esi, 0x108
0x1000dd4ec: mov ecx, 8
0x1000dd4f1: mov rdi, qword ptr [rbp - 0x40]
0x1000dd4f5: call 0x100795530 ; 0x100795530
0x1000dd4fa: mov r15, rax
0x1000dd4fd: vxorps ymm0, ymm0, ymm0
0x1000dd501: vmovups ymmword ptr [r15 + 0xe0], ymm0
0x1000dd50a: vmovups ymmword ptr [r15 + 0xc0], ymm0
0x1000dd513: vmovups ymmword ptr [r15 + 0xa0], ymm0
0x1000dd51c: vmovups ymmword ptr [r15 + 0x80], ymm0
0x1000dd525: vmovups ymmword ptr [r15 + 0x60], ymm0
0x1000dd52b: vmovups ymmword ptr [r15 + 0x40], ymm0
0x1000dd531: vmovups ymmword ptr [r15 + 0x20], ymm0
0x1000dd537: vmovups ymmword ptr [r15], ymm0
0x1000dd53c: mov qword ptr [r15 + 0x100], 0
0x1000dd547: vzeroupper 
0x1000dd54a: call 0x1007abc10 ; 0x1007abc10
0x1000dd54f: mov rax, qword ptr [rip + 0x1c971aa] ; 0x101d74700
0x1000dd556: mov eax, dword ptr [rax + 0x38]
0x1000dd559: mov dword ptr [r15], eax
0x1000dd55c: mov qword ptr [r15 + 4], 0
0x1000dd564: vxorps ymm0, ymm0, ymm0
0x1000dd568: vmovups ymmword ptr [r15 + 0x10], ymm0
0x1000dd56e: mov dword ptr [r15 + 0x30], 0
0x1000dd576: mov qword ptr [r15 + 0x34], 0x3f800000
0x1000dd57e: mov dword ptr [r15 + 0x3c], 0x40000000
0x1000dd586: mov word ptr [r15 + 0x40], 0x100
0x1000dd58d: mov byte ptr [r15 + 0x42], 1
0x1000dd592: mov dword ptr [r15 + 0xc8], 0
0x1000dd59d: mov dword ptr [r15 + 0x100], 0
0x1000dd5a8: mov eax, ebx
0x1000dd5aa: mov qword ptr [r12 + rax*8 + 0x1018], r15
0x1000dd5b2: lea rbx, [r15 + 0x10]
0x1000dd5b6: mov rdi, r14
0x1000dd5b9: mov rsi, rbx
0x1000dd5bc: vzeroupper 
0x1000dd5bf: call 0x1000ddc10 ; 0x1000ddc10
0x1000dd5c4: cmp dword ptr [r14], 0
0x1000dd5c8: mov qword ptr [rbp - 0x38], r15
0x1000dd5cc: jne 0x1000dd630
0x1000dd5ce: test byte ptr [rbx], 1
0x1000dd5d1: jne 0x1000dd5d8
0x1000dd5d3: inc rbx
0x1000dd5d6: jmp 0x1000dd5e0 ; 0x1000dd5e0
0x1000dd5d8: mov rax, qword ptr [rbp - 0x38]
0x1000dd5dc: mov rbx, qword ptr [rax + 0x20]
0x1000dd5e0: movabs rsi, 0x100000001b3
0x1000dd5ea: mov al, byte ptr [rbx]
0x1000dd5ec: movabs rcx, 0xcbf29ce484222325
0x1000dd5f6: test al, al
0x1000dd5f8: je 0x1000dd628
0x1000dd5fa: inc rbx
0x1000dd5fd: movabs rdx, 0xcbf29ce484222325
0x1000dd607: nop word ptr [rax + rax]
0x1000dd610: movsx rcx, al
0x1000dd614: xor rcx, rdx
0x1000dd617: imul rcx, rsi
0x1000dd61b: movzx eax, byte ptr [rbx]
0x1000dd61e: inc rbx
0x1000dd621: mov rdx, rcx
0x1000dd624: test al, al
0x1000dd626: jne 0x1000dd610
0x1000dd628: mov r15, qword ptr [rbp - 0x38]
0x1000dd62c: mov qword ptr [r15 + 0x28], rcx
0x1000dd630: lea rsi, [r15 + 4]
0x1000dd634: mov rdi, r14
0x1000dd637: call 0x10076a240 ; 0x10076a240
0x1000dd63c: lea rsi, [r15 + 8]
0x1000dd640: mov rdi, r14
0x1000dd643: call 0x10076a240 ; 0x10076a240
0x1000dd648: lea rsi, [r15 + 0x30]
0x1000dd64c: mov rdi, r14
0x1000dd64f: call 0x10076a240 ; 0x10076a240
0x1000dd654: lea rsi, [r15 + 0x34]
0x1000dd658: mov rdi, r14
0x1000dd65b: call 0x10076a2a0 ; 0x10076a2a0
0x1000dd660: lea rsi, [r15 + 0x40]
0x1000dd664: mov edx, 1
0x1000dd669: mov rdi, r14
0x1000dd66c: call 0x10076a0a0 ; 0x10076a0a0
0x1000dd671: lea rsi, [r15 + 0x38]
0x1000dd675: mov edx, 4
0x1000dd67a: mov rdi, r14
0x1000dd67d: call 0x10076a0a0 ; 0x10076a0a0
0x1000dd682: lea rsi, [r15 + 0x3c]
0x1000dd686: mov rdi, r14
0x1000dd689: call 0x10076a2a0 ; 0x10076a2a0
0x1000dd68e: lea rsi, [r15 + 0x41]
0x1000dd692: mov edx, 1
0x1000dd697: mov rdi, r14
0x1000dd69a: call 0x10076a0a0 ; 0x10076a0a0
0x1000dd69f: lea rsi, [r15 + 0x42]
0x1000dd6a3: mov edx, 1
0x1000dd6a8: mov rdi, r14
0x1000dd6ab: call 0x10076a0a0 ; 0x10076a0a0
0x1000dd6b0: lea r13, [r15 + 0xc8]
0x1000dd6b7: mov rdi, r14
0x1000dd6ba: mov rsi, r13
0x1000dd6bd: call 0x10076a240 ; 0x10076a240
0x1000dd6c2: lea rsi, [r15 + 0x100]
0x1000dd6c9: mov rdi, r14
0x1000dd6cc: mov qword ptr [rbp - 0x78], rsi
0x1000dd6d0: call 0x10076a240 ; 0x10076a240
0x1000dd6d5: cmp dword ptr [r15 + 0xc8], 0
0x1000dd6dd: mov r12, r15
0x1000dd6e0: je 0x1000dd968
0x1000dd6e6: cmp dword ptr [rbp - 0x2c], 0
0x1000dd6ea: je 0x1000dd7d0
0x1000dd6f0: xor r15d, r15d
0x1000dd6f3: nop word ptr cs:[rax + rax]
0x1000dd700: mov eax, r15d
0x1000dd703: mov rbx, qword ptr [r12 + rax*8 + 0x48]
0x1000dd708: lea rsi, [rbx + 4]
0x1000dd70c: mov rdi, r14
0x1000dd70f: call 0x10076a240 ; 0x10076a240
0x1000dd714: lea rsi, [rbx + 8]
0x1000dd718: mov rdi, r14
0x1000dd71b: call 0x1000ddc10 ; 0x1000ddc10
0x1000dd720: lea rsi, [rbx + 0x20]
0x1000dd724: mov rdi, r14
0x1000dd727: call 0x1000ddc10 ; 0x1000ddc10
0x1000dd72c: lea rsi, [rbx + 0x38]
0x1000dd730: mov rdi, r14
0x1000dd733: call 0x10076a2a0 ; 0x10076a2a0
0x1000dd738: lea rsi, [rbx + 0x3c]
0x1000dd73c: mov rdi, r14
0x1000dd73f: call 0x10076a2a0 ; 0x10076a2a0
0x1000dd744: lea rsi, [rbx + 0x40]
0x1000dd748: mov edx, 4
0x1000dd74d: mov rdi, r14
0x1000dd750: call 0x10076a0a0 ; 0x10076a0a0
0x1000dd755: lea rsi, [rbx + 0x44]
0x1000dd759: mov rdi, r14
0x1000dd75c: call 0x10076a2a0 ; 0x10076a2a0
0x1000dd761: lea rsi, [rbx + 0x48]
0x1000dd765: mov edx, 1
0x1000dd76a: mov rdi, r14
0x1000dd76d: call 0x10076a0a0 ; 0x10076a0a0
0x1000dd772: lea rsi, [rbx + 0x49]
0x1000dd776: mov edx, 1
0x1000dd77b: mov rdi, r14
0x1000dd77e: call 0x10076a0a0 ; 0x10076a0a0
0x1000dd783: cmp dword ptr [rbp - 0x30], 3
0x1000dd787: jl 0x1000dd7ab
0x1000dd789: lea rsi, [rbx + 0x4a]
0x1000dd78d: mov edx, 1
0x1000dd792: mov rdi, r14
0x1000dd795: call 0x10076a0a0 ; 0x10076a0a0
0x1000dd79a: lea rsi, [rbx + 0x4b]
0x1000dd79e: mov edx, 1
0x1000dd7a3: mov rdi, r14
0x1000dd7a6: call 0x10076a0a0 ; 0x10076a0a0
0x1000dd7ab: add rbx, 0x4c
0x1000dd7af: mov rdi, r14
0x1000dd7b2: mov rsi, rbx
0x1000dd7b5: call 0x10076a240 ; 0x10076a240
0x1000dd7ba: inc r15d
0x1000dd7bd: cmp r15d, dword ptr [r13]
0x1000dd7c1: jb 0x1000dd700
0x1000dd7c7: jmp 0x1000dd968 ; 0x1000dd968
0x1000dd7cc: nop dword ptr [rax]
0x1000dd7d0: xor ebx, ebx
0x1000dd7d2: mov qword ptr [rbp - 0x80], r13
0x1000dd7d6: nop word ptr cs:[rax + rax]
0x1000dd7e0: mov rdx, qword ptr [rip + 0x1c96e29] ; 0x101d74610
0x1000dd7e7: mov esi, 0x50
0x1000dd7ec: mov ecx, 8
0x1000dd7f1: mov rdi, qword ptr [rbp - 0x40]
0x1000dd7f5: call 0x100795530 ; 0x100795530
0x1000dd7fa: mov r15, rax
0x1000dd7fd: vxorps ymm0, ymm0, ymm0
0x1000dd801: vmovups ymmword ptr [r15 + 0x30], ymm0
0x1000dd807: vmovups ymmword ptr [r15 + 0x20], ymm0
0x1000dd80d: vmovups ymmword ptr [r15], ymm0
0x1000dd812: lea rax, [r15 + 0x20]
0x1000dd816: mov qword ptr [rbp - 0x88], rax
0x1000dd81d: vzeroupper 
0x1000dd820: call 0x1007abc10 ; 0x1007abc10
0x1000dd825: mov rax, qword ptr [rip + 0x1c96e14] ; 0x101d74640
0x1000dd82c: mov eax, dword ptr [rax + 0x38]
0x1000dd82f: mov dword ptr [r15], eax
0x1000dd832: lea rsi, [r15 + 4]
0x1000dd836: mov rcx, r12
0x1000dd839: lea r12, [r15 + 0x38]
0x1000dd83d: vxorps ymm0, ymm0, ymm0
0x1000dd841: vmovups ymmword ptr [r15 + 0x18], ymm0
0x1000dd847: vmovups ymmword ptr [r15 + 4], ymm0
0x1000dd84d: movabs rax, 0xbf800000bf800000
0x1000dd857: mov qword ptr [r15 + 0x38], rax
0x1000dd85b: lea r13, [r15 + 0x3c]
0x1000dd85f: lea rax, [r15 + 0x40]
0x1000dd863: mov qword ptr [rbp - 0x90], rax
0x1000dd86a: movabs rax, 0xbf80000000000000
0x1000dd874: mov qword ptr [r15 + 0x40], rax
0x1000dd878: lea rax, [r15 + 0x44]
0x1000dd87c: mov qword ptr [rbp - 0x48], rax
0x1000dd880: lea rax, [r15 + 0x48]
0x1000dd884: mov qword ptr [rbp - 0x50], rax
0x1000dd888: mov qword ptr [r15 + 0x48], 0x1000001
0x1000dd890: lea rax, [r15 + 0x49]
0x1000dd894: mov qword ptr [rbp - 0x58], rax
0x1000dd898: mov eax, ebx
0x1000dd89a: mov qword ptr [rcx + rax*8 + 0x48], r15
0x1000dd89f: mov rdi, r14
0x1000dd8a2: vzeroupper 
0x1000dd8a5: call 0x10076a240 ; 0x10076a240
0x1000dd8aa: lea rsi, [r15 + 8]
0x1000dd8ae: mov rdi, r14
0x1000dd8b1: call 0x1000ddc10 ; 0x1000ddc10
0x1000dd8b6: mov rdi, r14
0x1000dd8b9: mov rsi, qword ptr [rbp - 0x88]
0x1000dd8c0: call 0x1000ddc10 ; 0x1000ddc10
0x1000dd8c5: mov rdi, r14
0x1000dd8c8: mov rsi, r12
0x1000dd8cb: call 0x10076a2a0 ; 0x10076a2a0
0x1000dd8d0: mov rdi, r14
0x1000dd8d3: mov rsi, r13
0x1000dd8d6: call 0x10076a2a0 ; 0x10076a2a0
0x1000dd8db: mov edx, 4
0x1000dd8e0: mov rdi, r14
0x1000dd8e3: mov rsi, qword ptr [rbp - 0x90]
0x1000dd8ea: call 0x10076a0a0 ; 0x10076a0a0
0x1000dd8ef: mov rdi, r14
0x1000dd8f2: mov rsi, qword ptr [rbp - 0x48]
0x1000dd8f6: call 0x10076a2a0 ; 0x10076a2a0
0x1000dd8fb: mov edx, 1
0x1000dd900: mov rdi, r14
0x1000dd903: mov rsi, qword ptr [rbp - 0x50]
0x1000dd907: call 0x10076a0a0 ; 0x10076a0a0
0x1000dd90c: mov edx, 1
0x1000dd911: mov rdi, r14
0x1000dd914: mov rsi, qword ptr [rbp - 0x58]
0x1000dd918: call 0x10076a0a0 ; 0x10076a0a0
0x1000dd91d: cmp dword ptr [rbp - 0x30], 3
0x1000dd921: jl 0x1000dd945
0x1000dd923: lea rsi, [r15 + 0x4a]
0x1000dd927: mov edx, 1
0x1000dd92c: mov rdi, r14
0x1000dd92f: call 0x10076a0a0 ; 0x10076a0a0
0x1000dd934: lea rsi, [r15 + 0x4b]
0x1000dd938: mov edx, 1
0x1000dd93d: mov rdi, r14
0x1000dd940: call 0x10076a0a0 ; 0x10076a0a0
0x1000dd945: add r15, 0x4c
0x1000dd949: mov rdi, r14
0x1000dd94c: mov rsi, r15
0x1000dd94f: call 0x10076a240 ; 0x10076a240
0x1000dd954: inc ebx
0x1000dd956: mov r13, qword ptr [rbp - 0x80]
0x1000dd95a: cmp ebx, dword ptr [r13]
0x1000dd95e: mov r12, qword ptr [rbp - 0x38]
0x1000dd962: jb 0x1000dd7e0
0x1000dd968: mov rax, qword ptr [rbp - 0x78]
0x1000dd96c: cmp dword ptr [rax], 0
0x1000dd96f: je 0x1000ddb7c
0x1000dd975: cmp dword ptr [rbp - 0x2c], 0
0x1000dd979: je 0x1000dda40
0x1000dd97f: xor r15d, r15d
0x1000dd982: nop word ptr cs:[rax + rax]
0x1000dd990: mov eax, r15d
0x1000dd993: mov rbx, qword ptr [r12 + rax*8 + 0xd0]
0x1000dd99b: lea rsi, [rbx + 4]
0x1000dd99f: mov rdi, r14
0x1000dd9a2: call 0x10076a240 ; 0x10076a240
0x1000dd9a7: lea rsi, [rbx + 8]
0x1000dd9ab: mov rdi, r14
0x1000dd9ae: call 0x10076a240 ; 0x10076a240
0x1000dd9b3: lea rsi, [rbx + 0x10]
0x1000dd9b7: mov rdi, r14
0x1000dd9ba: call 0x1000ddc10 ; 0x1000ddc10
0x1000dd9bf: lea rsi, [rbx + 0x28]
0x1000dd9c3: mov rdi, r14
0x1000dd9c6: call 0x1000ddc10 ; 0x1000ddc10
0x1000dd9cb: lea rsi, [rbx + 0x40]
0x1000dd9cf: mov rdi, r14
0x1000dd9d2: call 0x10076a2a0 ; 0x10076a2a0
0x1000dd9d7: lea rsi, [rbx + 0x44]
0x1000dd9db: mov rdi, r14
0x1000dd9de: call 0x10076a2a0 ; 0x10076a2a0
0x1000dd9e3: lea rsi, [rbx + 0x48]
0x1000dd9e7: mov rdi, r14
0x1000dd9ea: call 0x10076a2a0 ; 0x10076a2a0
0x1000dd9ef: lea rsi, [rbx + 0x4c]
0x1000dd9f3: mov edx, 1
0x1000dd9f8: mov rdi, r14
0x1000dd9fb: call 0x10076a0a0 ; 0x10076a0a0
0x1000dda00: lea rsi, [rbx + 0x50]
0x1000dda04: mov rdi, r14
0x1000dda07: call 0x10076a240 ; 0x10076a240
0x1000dda0c: add rbx, 0x54
0x1000dda10: mov rdi, r14
0x1000dda13: mov rsi, rbx
0x1000dda16: call 0x10076a2a0 ; 0x10076a2a0
0x1000dda1b: inc r15d
0x1000dda1e: cmp r15d, dword ptr [r12 + 0x100]
0x1000dda26: jb 0x1000dd990
0x1000dda2c: jmp 0x1000ddb7c ; 0x1000ddb7c
0x1000dda31: nop word ptr cs:[rax + rax]
0x1000dda40: xor r13d, r13d
0x1000dda43: nop word ptr cs:[rax + rax]
0x1000dda50: mov rdx, qword ptr [rip + 0x1c96bb9] ; 0x101d74610
0x1000dda57: mov esi, 0x58
0x1000dda5c: mov ecx, 8
0x1000dda61: mov rdi, qword ptr [rbp - 0x40]
0x1000dda65: call 0x100795530 ; 0x100795530
0x1000dda6a: mov rbx, rax
0x1000dda6d: vxorps ymm0, ymm0, ymm0
0x1000dda71: vmovups ymmword ptr [rbx + 0x38], ymm0
0x1000dda76: vmovups ymmword ptr [rbx + 0x20], ymm0
0x1000dda7b: vmovups ymmword ptr [rbx], ymm0
0x1000dda7f: vzeroupper 
0x1000dda82: call 0x1007abc10 ; 0x1007abc10
0x1000dda87: mov rax, qword ptr [rip + 0x1c96c12] ; 0x101d746a0
0x1000dda8e: mov eax, dword ptr [rax + 0x38]
0x1000dda91: mov dword ptr [rbx], eax
0x1000dda93: lea rsi, [rbx + 4]
0x1000dda97: mov qword ptr [rbx + 4], 0
0x1000dda9f: lea r15, [rbx + 8]
0x1000ddaa3: lea r12, [rbx + 0x10]
0x1000ddaa7: lea rax, [rbx + 0x4c]
0x1000ddaab: mov qword ptr [rbp - 0x48], rax
0x1000ddaaf: vxorps ymm0, ymm0, ymm0
0x1000ddab3: vmovups ymmword ptr [rbx + 0x2c], ymm0
0x1000ddab8: vmovups ymmword ptr [rbx + 0x10], ymm0
0x1000ddabd: mov byte ptr [rbx + 0x4c], 1
0x1000ddac1: lea rax, [rbx + 0x50]
0x1000ddac5: mov qword ptr [rbp - 0x50], rax
0x1000ddac9: movabs rax, 0xbf80000000000000
0x1000ddad3: mov qword ptr [rbx + 0x50], rax
0x1000ddad7: lea rax, [rbx + 0x54]
0x1000ddadb: mov qword ptr [rbp - 0x58], rax
0x1000ddadf: mov eax, r13d
0x1000ddae2: mov rcx, qword ptr [rbp - 0x38]
0x1000ddae6: mov qword ptr [rcx + rax*8 + 0xd0], rbx
0x1000ddaee: mov rdi, r14
0x1000ddaf1: vzeroupper 
0x1000ddaf4: call 0x10076a240 ; 0x10076a240
0x1000ddaf9: mov rdi, r14
0x1000ddafc: mov rsi, r15
0x1000ddaff: call 0x10076a240 ; 0x10076a240
0x1000ddb04: mov rdi, r14
0x1000ddb07: mov rsi, r12
0x1000ddb0a: call 0x1000ddc10 ; 0x1000ddc10
0x1000ddb0f: lea rsi, [rbx + 0x28]
0x1000ddb13: mov rdi, r14
0x1000ddb16: call 0x1000ddc10 ; 0x1000ddc10
0x1000ddb1b: lea rsi, [rbx + 0x40]
0x1000ddb1f: mov rdi, r14
0x1000ddb22: call 0x10076a2a0 ; 0x10076a2a0
0x1000ddb27: lea rsi, [rbx + 0x44]
0x1000ddb2b: mov rdi, r14
0x1000ddb2e: call 0x10076a2a0 ; 0x10076a2a0
0x1000ddb33: lea rsi, [rbx + 0x48]
0x1000ddb37: mov rdi, r14
0x1000ddb3a: call 0x10076a2a0 ; 0x10076a2a0
0x1000ddb3f: mov edx, 1
0x1000ddb44: mov rdi, r14
0x1000ddb47: mov rsi, qword ptr [rbp - 0x48]
0x1000ddb4b: call 0x10076a0a0 ; 0x10076a0a0
0x1000ddb50: mov rdi, r14
0x1000ddb53: mov rsi, qword ptr [rbp - 0x50]
0x1000ddb57: call 0x10076a240 ; 0x10076a240
0x1000ddb5c: mov rdi, r14
0x1000ddb5f: mov rsi, qword ptr [rbp - 0x58]
0x1000ddb63: call 0x10076a2a0 ; 0x10076a2a0
0x1000ddb68: inc r13d
0x1000ddb6b: mov rax, qword ptr [rbp - 0x38]
0x1000ddb6f: cmp r13d, dword ptr [rax + 0x100]
0x1000ddb76: jb 0x1000dda50
0x1000ddb7c: mov ebx, dword ptr [rbp - 0x60]
0x1000ddb7f: inc ebx
0x1000ddb81: mov r12, qword ptr [rbp - 0x70]
0x1000ddb85: cmp ebx, dword ptr [r12 + 0x1010]
0x1000ddb8d: jb 0x1000dd4c0
0x1000ddb93: mov ecx, dword ptr [rbp - 0x5c]
0x1000ddb96: inc ecx
0x1000ddb98: mov rax, qword ptr [rbp - 0x68]
0x1000ddb9c: cmp ecx, dword ptr [rax]
0x1000ddb9e: jb 0x1000dd3f0
0x1000ddba4: add rsp, 0x68
0x1000ddba8: pop rbx
0x1000ddba9: pop r12
0x1000ddbab: pop r13
0x1000ddbad: pop r14
0x1000ddbaf: pop r15
0x1000ddbb1: pop rbp
0x1000ddbb2: ret 
0x1000ddbb3: lea rdi, [rip + 0xa88609] ; 0x100b661c3 metaDataCount < AnimationList::kMaxAnimationMetaDatas
0x1000ddbba: lea rsi, [rip + 0xa88550] ; 0x100b66111 AnimationList.cpp
0x1000ddbc1: mov edx, 0x16f
0x1000ddbc6: mov ecx, 3
0x1000ddbcb: call 0x1007e5f70 ; 0x1007e5f70
0x1000ddbd0: ud2 
0x1000ddbd2: lea rdi, [rip + 0xa88583] ; 0x100b6615c version >= kAnimationListMinVersion && version <= kAnimationListVersion
0x1000ddbd9: lea rsi, [rip + 0xa88531] ; 0x100b66111 AnimationList.cpp
0x1000ddbe0: mov edx, 0x15a
0x1000ddbe5: mov ecx, 3
0x1000ddbea: call 0x1007e5f70 ; 0x1007e5f70
0x1000ddbef: ud2 
0x1000ddbf1: lea rdi, [rip + 0xa885ac] ; 0x100b661a4 fileCount < kMaxAnimationFiles
0x1000ddbf8: lea rsi, [rip + 0xa88512] ; 0x100b66111 AnimationList.cpp
0x1000ddbff: mov edx, 0x15d
0x1000ddc04: mov ecx, 3
0x1000ddc09: call 0x1007e5f70 ; 0x1007e5f70
0x1000ddc0e: ud2 
