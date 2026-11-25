0x1007ba0c0: push rbp
0x1007ba0c1: mov rbp, rsp
0x1007ba0c4: push r15
0x1007ba0c6: push r14
0x1007ba0c8: push r13
0x1007ba0ca: push r12
0x1007ba0cc: push rbx
0x1007ba0cd: sub rsp, 0x48
0x1007ba0d1: mov r13, rdx
0x1007ba0d4: mov r14, rdi
0x1007ba0d7: jmp 0x1007ba0f0 ; 0x1007ba0f0
0x1007ba0d9: lea rdi, [r12 + 0x10]
0x1007ba0de: mov rdx, r13
0x1007ba0e1: call 0x1007ba0c0 ; 0x1007ba0c0
0x1007ba0e6: mov rsi, r12
0x1007ba0e9: nop dword ptr [rax]
0x1007ba0f0: lea rax, [rsi - 0x10]
0x1007ba0f4: mov qword ptr [rbp - 0x48], rax
0x1007ba0f8: mov qword ptr [rbp - 0x60], rsi
0x1007ba0fc: lea rax, [rsi - 0x20]
0x1007ba100: mov qword ptr [rbp - 0x68], rax
0x1007ba104: mov r12, r14
0x1007ba107: jmp 0x1007ba120 ; 0x1007ba120
0x1007ba109: mov rdi, r14
0x1007ba10c: mov rsi, r12
0x1007ba10f: mov rdx, r13
0x1007ba112: call 0x1007ba0c0 ; 0x1007ba0c0
0x1007ba117: add r12, 0x10
0x1007ba11b: nop dword ptr [rax + rax]
0x1007ba120: mov r14, r12
0x1007ba123: mov r12, qword ptr [rbp - 0x60]
0x1007ba127: mov rcx, r12
0x1007ba12a: sub rcx, r14
0x1007ba12d: mov rax, rcx
0x1007ba130: sar rax, 4
0x1007ba134: cmp rax, 5
0x1007ba138: jbe 0x1007ba55d
0x1007ba13e: cmp rcx, 0x1ef
0x1007ba145: jle 0x1007ba59c
0x1007ba14b: mov rdx, rax
0x1007ba14e: shr rdx, 0x3f
0x1007ba152: add rdx, rax
0x1007ba155: movabs rsi, 0x1ffffffffffffffe
0x1007ba15f: and rdx, rsi
0x1007ba162: lea rbx, [r14 + rdx*8]
0x1007ba166: cmp rcx, 0x3e71
0x1007ba16d: jl 0x1007ba1d0
0x1007ba16f: mov rcx, rax
0x1007ba172: sar rcx, 0x3f
0x1007ba176: shr rcx, 0x3e
0x1007ba17a: add rcx, rax
0x1007ba17d: shl rcx, 2
0x1007ba181: and rcx, 0xfffffffffffffff0
0x1007ba185: lea rsi, [r14 + rcx]
0x1007ba189: add rcx, rbx
0x1007ba18c: mov rdi, r14
0x1007ba18f: mov rdx, rbx
0x1007ba192: mov r12, qword ptr [rbp - 0x48]
0x1007ba196: mov r8, r12
0x1007ba199: mov r9, r13
0x1007ba19c: call 0x1007ba9f0 ; 0x1007ba9f0
0x1007ba1a1: mov ecx, eax
0x1007ba1a3: mov dword ptr [rbp - 0x58], ecx
0x1007ba1a6: mov rdi, r14
0x1007ba1a9: mov rsi, rbx
0x1007ba1ac: call qword ptr [r13]
0x1007ba1b0: test al, al
0x1007ba1b2: je 0x1007ba230
0x1007ba1b4: mov r15, r12
0x1007ba1b7: lea r12, [r14 + 0x10]
0x1007ba1bb: cmp r12, r15
0x1007ba1be: jb 0x1007ba37e
0x1007ba1c4: jmp 0x1007ba3c7 ; 0x1007ba3c7
0x1007ba1c9: nop dword ptr [rax]
0x1007ba1d0: mov rdi, rbx
0x1007ba1d3: mov rsi, r14
0x1007ba1d6: call qword ptr [r13]
0x1007ba1da: mov r15d, eax
0x1007ba1dd: mov r12, qword ptr [rbp - 0x48]
0x1007ba1e1: mov rdi, r12
0x1007ba1e4: mov rsi, rbx
0x1007ba1e7: call qword ptr [r13]
0x1007ba1eb: test r15b, r15b
0x1007ba1ee: je 0x1007ba2c0
0x1007ba1f4: test al, al
0x1007ba1f6: je 0x1007ba461
0x1007ba1fc: vmovups xmm0, xmmword ptr [r14]
0x1007ba201: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba206: vmovups xmm0, xmmword ptr [r12]
0x1007ba20c: vmovups xmmword ptr [r14], xmm0
0x1007ba211: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1007ba216: vmovups xmmword ptr [r12], xmm0
0x1007ba21c: mov ecx, 1
0x1007ba221: jmp 0x1007ba1a3 ; 0x1007ba1a3
0x1007ba223: nop word ptr cs:[rax + rax]
0x1007ba230: mov rax, qword ptr [rbp - 0x68]
0x1007ba234: mov r15, rax
0x1007ba237: cmp r14, rax
0x1007ba23a: je 0x1007ba25b
0x1007ba23c: nop dword ptr [rax]
0x1007ba240: mov rdi, r15
0x1007ba243: mov rsi, rbx
0x1007ba246: call qword ptr [r13]
0x1007ba24a: test al, al
0x1007ba24c: jne 0x1007ba320
0x1007ba252: add r15, -0x10
0x1007ba256: cmp r14, r15
0x1007ba259: jne 0x1007ba240
0x1007ba25b: lea r15, [r14 + 0x10]
0x1007ba25f: mov rdi, r14
0x1007ba262: mov rsi, r12
0x1007ba265: call qword ptr [r13]
0x1007ba269: test al, al
0x1007ba26b: jne 0x1007ba4e2
0x1007ba271: cmp r15, r12
0x1007ba274: mov rbx, qword ptr [rbp - 0x60]
0x1007ba278: je 0x1007ba745
0x1007ba27e: lea r15, [r14 + 0x20]
0x1007ba282: nop word ptr cs:[rax + rax]
0x1007ba290: lea rsi, [r15 - 0x10]
0x1007ba294: mov rdi, r14
0x1007ba297: call qword ptr [r13]
0x1007ba29b: test al, al
0x1007ba29d: jne 0x1007ba4bc
0x1007ba2a3: add r15, 0x10
0x1007ba2a7: cmp rbx, r15
0x1007ba2aa: jne 0x1007ba290
0x1007ba2ac: jmp 0x1007ba745 ; 0x1007ba745
0x1007ba2b1: nop word ptr cs:[rax + rax]
0x1007ba2c0: xor ecx, ecx
0x1007ba2c2: test al, al
0x1007ba2c4: je 0x1007ba1a3
0x1007ba2ca: vmovups xmm0, xmmword ptr [rbx]
0x1007ba2ce: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba2d3: vmovups xmm0, xmmword ptr [r12]
0x1007ba2d9: vmovups xmmword ptr [rbx], xmm0
0x1007ba2dd: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1007ba2e2: vmovups xmmword ptr [r12], xmm0
0x1007ba2e8: mov rdi, rbx
0x1007ba2eb: mov rsi, r14
0x1007ba2ee: call qword ptr [r13]
0x1007ba2f2: mov ecx, 1
0x1007ba2f7: test al, al
0x1007ba2f9: je 0x1007ba1a3
0x1007ba2ff: vmovups xmm0, xmmword ptr [r14]
0x1007ba304: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba309: vmovups xmm0, xmmword ptr [rbx]
0x1007ba30d: vmovups xmmword ptr [r14], xmm0
0x1007ba312: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1007ba317: vmovups xmmword ptr [rbx], xmm0
0x1007ba31b: jmp 0x1007ba4b2 ; 0x1007ba4b2
0x1007ba320: vmovups xmm0, xmmword ptr [r14]
0x1007ba325: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba32a: vmovups xmm0, xmmword ptr [r15]
0x1007ba32f: vmovups xmmword ptr [r14], xmm0
0x1007ba334: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1007ba339: vmovups xmmword ptr [r15], xmm0
0x1007ba33e: inc dword ptr [rbp - 0x58]
0x1007ba341: lea r12, [r14 + 0x10]
0x1007ba345: cmp r12, r15
0x1007ba348: jb 0x1007ba37e
0x1007ba34a: jmp 0x1007ba3c7 ; 0x1007ba3c7
0x1007ba34f: nop 
0x1007ba350: vmovups xmm0, xmmword ptr [r12]
0x1007ba356: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba35b: vmovups xmm0, xmmword ptr [r15]
0x1007ba360: vmovups xmmword ptr [r12], xmm0
0x1007ba366: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1007ba36b: vmovups xmmword ptr [r15], xmm0
0x1007ba370: inc dword ptr [rbp - 0x58]
0x1007ba373: cmp rbx, r12
0x1007ba376: cmove rbx, r15
0x1007ba37a: mov r12, qword ptr [rbp - 0x50]
0x1007ba37e: add r12, -0x10
0x1007ba382: nop word ptr cs:[rax + rax]
0x1007ba390: add r12, 0x10
0x1007ba394: mov rdi, r12
0x1007ba397: mov rsi, rbx
0x1007ba39a: call qword ptr [r13]
0x1007ba39e: test al, al
0x1007ba3a0: jne 0x1007ba390
0x1007ba3a2: lea rax, [r12 + 0x10]
0x1007ba3a7: mov qword ptr [rbp - 0x50], rax
0x1007ba3ab: nop dword ptr [rax + rax]
0x1007ba3b0: add r15, -0x10
0x1007ba3b4: mov rdi, r15
0x1007ba3b7: mov rsi, rbx
0x1007ba3ba: call qword ptr [r13]
0x1007ba3be: test al, al
0x1007ba3c0: je 0x1007ba3b0
0x1007ba3c2: cmp r12, r15
0x1007ba3c5: jbe 0x1007ba350
0x1007ba3c7: cmp r12, rbx
0x1007ba3ca: mov r15d, dword ptr [rbp - 0x58]
0x1007ba3ce: mov qword ptr [rbp - 0x50], r12
0x1007ba3d2: je 0x1007ba403
0x1007ba3d4: mov rdi, rbx
0x1007ba3d7: mov rsi, r12
0x1007ba3da: call qword ptr [r13]
0x1007ba3de: test al, al
0x1007ba3e0: je 0x1007ba403
0x1007ba3e2: vmovups xmm0, xmmword ptr [r12]
0x1007ba3e8: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba3ed: vmovups xmm0, xmmword ptr [rbx]
0x1007ba3f1: vmovups xmmword ptr [r12], xmm0
0x1007ba3f7: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1007ba3fc: vmovups xmmword ptr [rbx], xmm0
0x1007ba400: inc r15d
0x1007ba403: test r15d, r15d
0x1007ba406: jne 0x1007ba43f
0x1007ba408: mov rdi, r14
0x1007ba40b: mov r15, qword ptr [rbp - 0x50]
0x1007ba40f: mov rsi, r15
0x1007ba412: mov rdx, r13
0x1007ba415: call 0x1007bacb0 ; 0x1007bacb0
0x1007ba41a: mov ebx, eax
0x1007ba41c: lea r12, [r15 + 0x10]
0x1007ba420: mov rdi, r12
0x1007ba423: mov rsi, qword ptr [rbp - 0x60]
0x1007ba427: mov rdx, r13
0x1007ba42a: call 0x1007bacb0 ; 0x1007bacb0
0x1007ba42f: test al, al
0x1007ba431: jne 0x1007ba54c
0x1007ba437: test bl, bl
0x1007ba439: jne 0x1007ba120
0x1007ba43f: mov r12, qword ptr [rbp - 0x50]
0x1007ba443: mov rax, r12
0x1007ba446: sub rax, r14
0x1007ba449: mov rsi, qword ptr [rbp - 0x60]
0x1007ba44d: mov rcx, rsi
0x1007ba450: sub rcx, r12
0x1007ba453: cmp rax, rcx
0x1007ba456: jl 0x1007ba109
0x1007ba45c: jmp 0x1007ba0d9 ; 0x1007ba0d9
0x1007ba461: vmovups xmm0, xmmword ptr [r14]
0x1007ba466: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba46b: vmovups xmm0, xmmword ptr [rbx]
0x1007ba46f: vmovups xmmword ptr [r14], xmm0
0x1007ba474: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1007ba479: vmovups xmmword ptr [rbx], xmm0
0x1007ba47d: mov rdi, r12
0x1007ba480: mov rsi, rbx
0x1007ba483: call qword ptr [r13]
0x1007ba487: mov ecx, 1
0x1007ba48c: test al, al
0x1007ba48e: je 0x1007ba1a3
0x1007ba494: vmovups xmm0, xmmword ptr [rbx]
0x1007ba498: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba49d: vmovups xmm0, xmmword ptr [r12]
0x1007ba4a3: vmovups xmmword ptr [rbx], xmm0
0x1007ba4a7: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1007ba4ac: vmovups xmmword ptr [r12], xmm0
0x1007ba4b2: mov ecx, 2
0x1007ba4b7: jmp 0x1007ba1a3 ; 0x1007ba1a3
0x1007ba4bc: vmovups xmm0, xmmword ptr [r15 - 0x10]
0x1007ba4c2: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba4c7: mov r12, qword ptr [rbp - 0x48]
0x1007ba4cb: vmovups xmm0, xmmword ptr [r12]
0x1007ba4d1: vmovups xmmword ptr [r15 - 0x10], xmm0
0x1007ba4d7: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1007ba4dc: vmovups xmmword ptr [r12], xmm0
0x1007ba4e2: cmp r15, r12
0x1007ba4e5: je 0x1007ba745
0x1007ba4eb: mov rbx, qword ptr [rbp - 0x48]
0x1007ba4ef: jmp 0x1007ba510 ; 0x1007ba510
0x1007ba4f1: vmovups xmm0, xmmword ptr [r15 - 0x10]
0x1007ba4f7: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba4fc: vmovups xmm0, xmmword ptr [rbx]
0x1007ba500: vmovups xmmword ptr [r15 - 0x10], xmm0
0x1007ba506: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1007ba50b: vmovups xmmword ptr [rbx], xmm0
0x1007ba50f: nop 
0x1007ba510: mov rdi, r14
0x1007ba513: mov rsi, r15
0x1007ba516: call qword ptr [r13]
0x1007ba51a: add r15, 0x10
0x1007ba51e: test al, al
0x1007ba520: je 0x1007ba510
0x1007ba522: lea r12, [r15 - 0x10]
0x1007ba526: nop word ptr cs:[rax + rax]
0x1007ba530: add rbx, -0x10
0x1007ba534: mov rdi, r14
0x1007ba537: mov rsi, rbx
0x1007ba53a: call qword ptr [r13]
0x1007ba53e: test al, al
0x1007ba540: jne 0x1007ba530
0x1007ba542: cmp r12, rbx
0x1007ba545: jb 0x1007ba4f1
0x1007ba547: jmp 0x1007ba120 ; 0x1007ba120
0x1007ba54c: mov rsi, qword ptr [rbp - 0x50]
0x1007ba550: test bl, bl
0x1007ba552: je 0x1007ba0f0
0x1007ba558: jmp 0x1007ba745 ; 0x1007ba745
0x1007ba55d: lea rcx, [rip + 0x474] ; 0x1007ba9d8
0x1007ba564: movsxd rax, dword ptr [rcx + rax*4]
0x1007ba568: add rax, rcx
0x1007ba56b: jmp rax
0x1007ba56d: mov rdi, qword ptr [rbp - 0x48]
0x1007ba571: mov rsi, r14
0x1007ba574: call qword ptr [r13]
0x1007ba578: test al, al
0x1007ba57a: je 0x1007ba745
0x1007ba580: vmovups xmm0, xmmword ptr [r14]
0x1007ba585: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba58a: mov rax, qword ptr [rbp - 0x48]
0x1007ba58e: vmovups xmm0, xmmword ptr [rax]
0x1007ba592: vmovups xmmword ptr [r14], xmm0
0x1007ba597: jmp 0x1007ba8e2 ; 0x1007ba8e2
0x1007ba59c: lea r15, [r14 + 0x20]
0x1007ba5a0: lea rbx, [r14 + 0x10]
0x1007ba5a4: mov rdi, rbx
0x1007ba5a7: mov rsi, r14
0x1007ba5aa: call qword ptr [r13]
0x1007ba5ae: mov byte ptr [rbp - 0x58], al
0x1007ba5b1: mov qword ptr [rbp - 0x50], r15
0x1007ba5b5: mov rdi, r15
0x1007ba5b8: mov qword ptr [rbp - 0x48], rbx
0x1007ba5bc: mov rsi, rbx
0x1007ba5bf: call qword ptr [r13]
0x1007ba5c3: cmp byte ptr [rbp - 0x58], 0
0x1007ba5c7: je 0x1007ba5ee
0x1007ba5c9: test al, al
0x1007ba5cb: je 0x1007ba657
0x1007ba5d1: vmovups xmm0, xmmword ptr [r14]
0x1007ba5d6: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba5db: mov r15, qword ptr [rbp - 0x50]
0x1007ba5df: vmovups xmm0, xmmword ptr [r15]
0x1007ba5e4: vmovups xmmword ptr [r14], xmm0
0x1007ba5e9: jmp 0x1007ba69c ; 0x1007ba69c
0x1007ba5ee: test al, al
0x1007ba5f0: mov r15, qword ptr [rbp - 0x50]
0x1007ba5f4: je 0x1007ba6a6
0x1007ba5fa: mov rdi, qword ptr [rbp - 0x48]
0x1007ba5fe: vmovups xmm0, xmmword ptr [rdi]
0x1007ba602: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba607: vmovups xmm0, xmmword ptr [r15]
0x1007ba60c: vmovups xmmword ptr [rdi], xmm0
0x1007ba610: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1007ba615: vmovups xmmword ptr [r15], xmm0
0x1007ba61a: mov rsi, r14
0x1007ba61d: call qword ptr [r13]
0x1007ba621: mov r15, qword ptr [rbp - 0x50]
0x1007ba625: test al, al
0x1007ba627: je 0x1007ba6a6
0x1007ba629: vmovups xmm0, xmmword ptr [r14]
0x1007ba62e: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba633: mov rax, qword ptr [rbp - 0x48]
0x1007ba637: vmovups xmm0, xmmword ptr [rax]
0x1007ba63b: vmovups xmmword ptr [r14], xmm0
0x1007ba640: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1007ba645: vmovups xmmword ptr [rax], xmm0
0x1007ba649: lea rax, [r14 + 0x30]
0x1007ba64d: cmp rax, r12
0x1007ba650: jne 0x1007ba6b3
0x1007ba652: jmp 0x1007ba745 ; 0x1007ba745
0x1007ba657: vmovups xmm0, xmmword ptr [r14]
0x1007ba65c: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba661: mov rsi, qword ptr [rbp - 0x48]
0x1007ba665: vmovups xmm0, xmmword ptr [rsi]
0x1007ba669: vmovups xmmword ptr [r14], xmm0
0x1007ba66e: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1007ba673: vmovups xmmword ptr [rsi], xmm0
0x1007ba677: mov r15, qword ptr [rbp - 0x50]
0x1007ba67b: mov rdi, r15
0x1007ba67e: call qword ptr [r13]
0x1007ba682: test al, al
0x1007ba684: je 0x1007ba6a6
0x1007ba686: mov rax, qword ptr [rbp - 0x48]
0x1007ba68a: vmovups xmm0, xmmword ptr [rax]
0x1007ba68e: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba693: vmovups xmm0, xmmword ptr [r15]
0x1007ba698: vmovups xmmword ptr [rax], xmm0
0x1007ba69c: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1007ba6a1: vmovups xmmword ptr [r15], xmm0
0x1007ba6a6: lea rax, [r14 + 0x30]
0x1007ba6aa: cmp rax, r12
0x1007ba6ad: je 0x1007ba745
0x1007ba6b3: xor ebx, ebx
0x1007ba6b5: nop word ptr cs:[rax + rax]
0x1007ba6c0: mov rsi, r15
0x1007ba6c3: mov r15, rax
0x1007ba6c6: mov rdi, r15
0x1007ba6c9: call qword ptr [r13]
0x1007ba6cd: test al, al
0x1007ba6cf: je 0x1007ba734
0x1007ba6d1: mov qword ptr [rbp - 0x50], r15
0x1007ba6d5: vmovups xmm0, xmmword ptr [r15]
0x1007ba6da: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba6df: mov qword ptr [rbp - 0x58], rbx
0x1007ba6e3: mov rcx, rbx
0x1007ba6e6: lea rbx, [rbp - 0x40]
0x1007ba6ea: nop word ptr [rax + rax]
0x1007ba6f0: mov r12, rcx
0x1007ba6f3: vmovups xmm0, xmmword ptr [r14 + r12 + 0x20]
0x1007ba6fa: vmovups xmmword ptr [r14 + r12 + 0x30], xmm0
0x1007ba701: cmp r12, -0x20
0x1007ba705: je 0x1007ba71c
0x1007ba707: lea rsi, [r14 + r12 + 0x10]
0x1007ba70c: mov rdi, rbx
0x1007ba70f: call qword ptr [r13]
0x1007ba713: lea rcx, [r12 - 0x10]
0x1007ba718: test al, al
0x1007ba71a: jne 0x1007ba6f0
0x1007ba71c: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1007ba721: vmovups xmmword ptr [r14 + r12 + 0x20], xmm0
0x1007ba728: mov r12, qword ptr [rbp - 0x60]
0x1007ba72c: mov r15, qword ptr [rbp - 0x50]
0x1007ba730: mov rbx, qword ptr [rbp - 0x58]
0x1007ba734: lea rax, [r15 + 0x10]
0x1007ba738: add rbx, 0x10
0x1007ba73c: cmp rax, r12
0x1007ba73f: jne 0x1007ba6c0
0x1007ba745: add rsp, 0x48
0x1007ba749: pop rbx
0x1007ba74a: pop r12
0x1007ba74c: pop r13
0x1007ba74e: pop r14
0x1007ba750: pop r15
0x1007ba752: pop rbp
0x1007ba753: ret 
0x1007ba754: lea r15, [r14 + 0x10]
0x1007ba758: mov rdi, r15
0x1007ba75b: mov rsi, r14
0x1007ba75e: call qword ptr [r13]
0x1007ba762: mov ebx, eax
0x1007ba764: mov r12, qword ptr [rbp - 0x48]
0x1007ba768: mov rdi, r12
0x1007ba76b: mov rsi, r15
0x1007ba76e: call qword ptr [r13]
0x1007ba772: test bl, bl
0x1007ba774: je 0x1007ba811
0x1007ba77a: test al, al
0x1007ba77c: je 0x1007ba89b
0x1007ba782: vmovups xmm0, xmmword ptr [r14]
0x1007ba787: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba78c: vmovups xmm0, xmmword ptr [r12]
0x1007ba792: vmovups xmmword ptr [r14], xmm0
0x1007ba797: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1007ba79c: vmovups xmmword ptr [r12], xmm0
0x1007ba7a2: jmp 0x1007ba745 ; 0x1007ba745
0x1007ba7a4: lea rdx, [r14 + 0x20]
0x1007ba7a8: lea rcx, [r14 + 0x30]
0x1007ba7ac: lea rsi, [r14 + 0x10]
0x1007ba7b0: mov rdi, r14
0x1007ba7b3: mov r8, qword ptr [rbp - 0x48]
0x1007ba7b7: mov r9, r13
0x1007ba7ba: add rsp, 0x48
0x1007ba7be: pop rbx
0x1007ba7bf: pop r12
0x1007ba7c1: pop r13
0x1007ba7c3: pop r14
0x1007ba7c5: pop r15
0x1007ba7c7: pop rbp
0x1007ba7c8: jmp 0x1007ba9f0 ; 0x1007ba9f0
0x1007ba7cd: lea r15, [r14 + 0x10]
0x1007ba7d1: lea r12, [r14 + 0x20]
0x1007ba7d5: mov rdi, r15
0x1007ba7d8: mov rsi, r14
0x1007ba7db: call qword ptr [r13]
0x1007ba7df: mov ebx, eax
0x1007ba7e1: mov rdi, r12
0x1007ba7e4: mov rsi, r15
0x1007ba7e7: call qword ptr [r13]
0x1007ba7eb: test bl, bl
0x1007ba7ed: je 0x1007ba83e
0x1007ba7ef: test al, al
0x1007ba7f1: je 0x1007ba8f0
0x1007ba7f7: vmovups xmm0, xmmword ptr [r14]
0x1007ba7fc: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba801: vmovups xmm0, xmmword ptr [r12]
0x1007ba807: vmovups xmmword ptr [r14], xmm0
0x1007ba80c: jmp 0x1007ba931 ; 0x1007ba931
0x1007ba811: test al, al
0x1007ba813: je 0x1007ba745
0x1007ba819: vmovups xmm0, xmmword ptr [r15]
0x1007ba81e: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba823: mov rax, qword ptr [rbp - 0x48]
0x1007ba827: vmovups xmm0, xmmword ptr [rax]
0x1007ba82b: vmovups xmmword ptr [r15], xmm0
0x1007ba830: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1007ba835: vmovups xmmword ptr [rax], xmm0
0x1007ba839: jmp 0x1007ba9a3 ; 0x1007ba9a3
0x1007ba83e: test al, al
0x1007ba840: je 0x1007ba93c
0x1007ba846: vmovups xmm0, xmmword ptr [r15]
0x1007ba84b: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba850: vmovups xmm0, xmmword ptr [r12]
0x1007ba856: vmovups xmmword ptr [r15], xmm0
0x1007ba85b: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1007ba860: vmovups xmmword ptr [r12], xmm0
0x1007ba866: mov rdi, r15
0x1007ba869: mov rsi, r14
0x1007ba86c: call qword ptr [r13]
0x1007ba870: test al, al
0x1007ba872: je 0x1007ba93c
0x1007ba878: vmovups xmm0, xmmword ptr [r14]
0x1007ba87d: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba882: vmovups xmm0, xmmword ptr [r15]
0x1007ba887: vmovups xmmword ptr [r14], xmm0
0x1007ba88c: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1007ba891: vmovups xmmword ptr [r15], xmm0
0x1007ba896: jmp 0x1007ba93c ; 0x1007ba93c
0x1007ba89b: vmovups xmm0, xmmword ptr [r14]
0x1007ba8a0: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba8a5: vmovups xmm0, xmmword ptr [r15]
0x1007ba8aa: vmovups xmmword ptr [r14], xmm0
0x1007ba8af: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1007ba8b4: vmovups xmmword ptr [r15], xmm0
0x1007ba8b9: mov rdi, r12
0x1007ba8bc: mov rsi, r15
0x1007ba8bf: call qword ptr [r13]
0x1007ba8c3: test al, al
0x1007ba8c5: je 0x1007ba745
0x1007ba8cb: vmovups xmm0, xmmword ptr [r15]
0x1007ba8d0: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba8d5: mov rax, qword ptr [rbp - 0x48]
0x1007ba8d9: vmovups xmm0, xmmword ptr [rax]
0x1007ba8dd: vmovups xmmword ptr [r15], xmm0
0x1007ba8e2: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1007ba8e7: vmovups xmmword ptr [rax], xmm0
0x1007ba8eb: jmp 0x1007ba745 ; 0x1007ba745
0x1007ba8f0: vmovups xmm0, xmmword ptr [r14]
0x1007ba8f5: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba8fa: vmovups xmm0, xmmword ptr [r15]
0x1007ba8ff: vmovups xmmword ptr [r14], xmm0
0x1007ba904: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1007ba909: vmovups xmmword ptr [r15], xmm0
0x1007ba90e: mov rdi, r12
0x1007ba911: mov rsi, r15
0x1007ba914: call qword ptr [r13]
0x1007ba918: test al, al
0x1007ba91a: je 0x1007ba93c
0x1007ba91c: vmovups xmm0, xmmword ptr [r15]
0x1007ba921: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba926: vmovups xmm0, xmmword ptr [r12]
0x1007ba92c: vmovups xmmword ptr [r15], xmm0
0x1007ba931: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1007ba936: vmovups xmmword ptr [r12], xmm0
0x1007ba93c: mov rdi, qword ptr [rbp - 0x48]
0x1007ba940: mov rsi, r12
0x1007ba943: call qword ptr [r13]
0x1007ba947: test al, al
0x1007ba949: je 0x1007ba745
0x1007ba94f: vmovups xmm0, xmmword ptr [r12]
0x1007ba955: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba95a: mov rax, qword ptr [rbp - 0x48]
0x1007ba95e: vmovups xmm0, xmmword ptr [rax]
0x1007ba962: vmovups xmmword ptr [r12], xmm0
0x1007ba968: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1007ba96d: vmovups xmmword ptr [rax], xmm0
0x1007ba971: mov rdi, r12
0x1007ba974: mov rsi, r15
0x1007ba977: call qword ptr [r13]
0x1007ba97b: test al, al
0x1007ba97d: je 0x1007ba745
0x1007ba983: vmovups xmm0, xmmword ptr [r15]
0x1007ba988: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba98d: vmovups xmm0, xmmword ptr [r12]
0x1007ba993: vmovups xmmword ptr [r15], xmm0
0x1007ba998: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1007ba99d: vmovups xmmword ptr [r12], xmm0
0x1007ba9a3: mov rdi, r15
0x1007ba9a6: mov rsi, r14
0x1007ba9a9: call qword ptr [r13]
0x1007ba9ad: test al, al
0x1007ba9af: je 0x1007ba745
0x1007ba9b5: vmovups xmm0, xmmword ptr [r14]
0x1007ba9ba: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1007ba9bf: vmovups xmm0, xmmword ptr [r15]
0x1007ba9c4: vmovups xmmword ptr [r14], xmm0
0x1007ba9c9: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1007ba9ce: vmovups xmmword ptr [r15], xmm0
0x1007ba9d3: jmp 0x1007ba745 ; 0x1007ba745
