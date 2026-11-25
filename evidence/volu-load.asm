0x1004ba510: push rbp
0x1004ba511: mov rbp, rsp
0x1004ba514: push r15
0x1004ba516: push r14
0x1004ba518: push r13
0x1004ba51a: push r12
0x1004ba51c: push rbx
0x1004ba51d: sub rsp, 0x18
0x1004ba521: mov r15, rdx
0x1004ba524: mov r13, rsi
0x1004ba527: mov rbx, rdi
0x1004ba52a: test r15, r15
0x1004ba52d: je 0x1004ba7b5
0x1004ba533: test rcx, rcx
0x1004ba536: je 0x1004ba7b5
0x1004ba53c: mov qword ptr [rbp - 0x40], rcx
0x1004ba540: lea rdx, [rbp - 0x38]
0x1004ba544: mov rdi, rbx
0x1004ba547: mov rsi, r13
0x1004ba54a: call 0x1007f81e0 ; 0x1007f81e0
0x1004ba54f: test al, al
0x1004ba551: je 0x1004ba7d4
0x1004ba557: mov r14, qword ptr [rbp - 0x38]
0x1004ba55b: inc r14
0x1004ba55e: call 0x1007c6c20 ; 0x1007c6c20
0x1004ba563: mov esi, r14d
0x1004ba566: lea rcx, [rip + 0x1b8e5e3] ; 0x102048b50
0x1004ba56d: mov rdx, qword ptr [rcx]
0x1004ba570: mov ecx, 1
0x1004ba575: mov rdi, rax
0x1004ba578: call 0x100795530 ; 0x100795530
0x1004ba57d: mov r12, rax
0x1004ba580: lea r8, [rbp - 0x2c]
0x1004ba584: mov rdi, rbx
0x1004ba587: mov rsi, r13
0x1004ba58a: mov rdx, r12
0x1004ba58d: mov ecx, r14d
0x1004ba590: call 0x1007f86c0 ; 0x1007f86c0
0x1004ba595: mov eax, dword ptr [rbp - 0x2c]
0x1004ba598: cmp qword ptr [rbp - 0x38], rax
0x1004ba59c: jne 0x1004ba7f3
0x1004ba5a2: cmp dword ptr [r12], 0x554c4f56
0x1004ba5aa: jne 0x1004ba812
0x1004ba5b0: cmp dword ptr [r12 + 4], 4
0x1004ba5b6: jne 0x1004ba831
0x1004ba5bc: cmp dword ptr [r12 + 0x114], 1
0x1004ba5c5: jne 0x1004ba850
0x1004ba5cb: cmp dword ptr [r12 + 0x110], 1
0x1004ba5d4: jne 0x1004ba86f
0x1004ba5da: mov eax, dword ptr [r12 + 0x10c]
0x1004ba5e2: mov ebx, eax
0x1004ba5e4: imul ebx, ebx
0x1004ba5e7: imul ebx, eax
0x1004ba5ea: lea rdi, [rbx*4]
0x1004ba5f2: call 0x100aa2492 ; 0x100aa2492 __Znam
0x1004ba5f7: mov qword ptr [r15], rax
0x1004ba5fa: mov ecx, dword ptr [r12 + 0x10c]
0x1004ba602: mov rdx, qword ptr [rbp - 0x40]
0x1004ba606: mov dword ptr [rdx], ecx
0x1004ba608: test ebx, ebx
0x1004ba60a: je 0x1004ba6fe
0x1004ba610: lea r9, [r12 + 0x1000]
0x1004ba618: cmp ebx, 7
0x1004ba61b: jbe 0x1004ba63b
0x1004ba61d: lea rcx, [r12 + rbx + 0x1000]
0x1004ba625: cmp rax, rcx
0x1004ba628: jae 0x1004ba720
0x1004ba62e: lea rcx, [rax + rbx*4]
0x1004ba632: cmp r9, rcx
0x1004ba635: jae 0x1004ba720
0x1004ba63b: xor edx, edx
0x1004ba63d: mov edi, ebx
0x1004ba63f: sub edi, edx
0x1004ba641: lea rcx, [rbx - 1]
0x1004ba645: mov rsi, rdx
0x1004ba648: test dil, 1
0x1004ba64c: je 0x1004ba67c
0x1004ba64e: movzx esi, byte ptr [r9 + rdx]
0x1004ba653: vcvtsi2ss xmm0, xmm4, esi
0x1004ba657: vdivss xmm0, xmm0, dword ptr [rip + 0x5ed665] ; 0x100aa7cc4
0x1004ba65f: vcvtss2sd xmm0, xmm0, xmm0
0x1004ba663: vaddsd xmm0, xmm0, xmm0
0x1004ba667: vaddsd xmm0, xmm0, qword ptr [rip + 0x604b49] ; 0x100abf1b8
0x1004ba66f: vcvtsd2ss xmm0, xmm0, xmm0
0x1004ba673: vmovss dword ptr [rax + rdx*4], xmm0
0x1004ba678: lea rsi, [rdx + 1]
0x1004ba67c: cmp rcx, rdx
0x1004ba67f: je 0x1004ba6fe
0x1004ba681: sub rbx, rsi
0x1004ba684: lea rcx, [r12 + rsi + 0x1001]
0x1004ba68c: lea rax, [rax + rsi*4 + 4]
0x1004ba691: vmovss xmm0, dword ptr [rip + 0x5ed62b] ; 0x100aa7cc4
0x1004ba699: vmovsd xmm1, qword ptr [rip + 0x604b17] ; 0x100abf1b8
0x1004ba6a1: nop word ptr cs:[rax + rax]
0x1004ba6b0: movzx edx, byte ptr [rcx - 1]
0x1004ba6b4: vcvtsi2ss xmm2, xmm4, edx
0x1004ba6b8: vdivss xmm2, xmm2, xmm0
0x1004ba6bc: vcvtss2sd xmm2, xmm2, xmm2
0x1004ba6c0: vaddsd xmm2, xmm2, xmm2
0x1004ba6c4: vaddsd xmm2, xmm2, xmm1
0x1004ba6c8: vcvtsd2ss xmm2, xmm2, xmm2
0x1004ba6cc: vmovss dword ptr [rax - 4], xmm2
0x1004ba6d1: movzx edx, byte ptr [rcx]
0x1004ba6d4: vcvtsi2ss xmm2, xmm4, edx
0x1004ba6d8: vdivss xmm2, xmm2, xmm0
0x1004ba6dc: vcvtss2sd xmm2, xmm2, xmm2
0x1004ba6e0: vaddsd xmm2, xmm2, xmm2
0x1004ba6e4: vaddsd xmm2, xmm2, xmm1
0x1004ba6e8: vcvtsd2ss xmm2, xmm2, xmm2
0x1004ba6ec: vmovss dword ptr [rax], xmm2
0x1004ba6f0: add rcx, 2
0x1004ba6f4: add rax, 8
0x1004ba6f8: add rbx, -2
0x1004ba6fc: jne 0x1004ba6b0
0x1004ba6fe: vzeroupper 
0x1004ba701: call 0x1007c6c20 ; 0x1007c6c20
0x1004ba706: mov rdi, rax
0x1004ba709: mov rsi, r12
0x1004ba70c: call 0x100795a70 ; 0x100795a70
0x1004ba711: add rsp, 0x18
0x1004ba715: pop rbx
0x1004ba716: pop r12
0x1004ba718: pop r13
0x1004ba71a: pop r14
0x1004ba71c: pop r15
0x1004ba71e: pop rbp
0x1004ba71f: ret 
0x1004ba720: mov r8d, ebx
0x1004ba723: and r8d, 7
0x1004ba727: mov rdx, rbx
0x1004ba72a: sub rdx, r8
0x1004ba72d: vmovaps ymm0, ymmword ptr [rip + 0x609c8b] ; 0x100ac43c0
0x1004ba735: vmovapd ymm1, ymmword ptr [rip + 0x609ca3] ; 0x100ac43e0
0x1004ba73d: mov rdi, rdx
0x1004ba740: mov rsi, rax
0x1004ba743: mov rcx, r9
0x1004ba746: nop word ptr cs:[rax + rax]
0x1004ba750: vpmovzxbd xmm2, dword ptr [rcx]
0x1004ba755: vpmovzxbd xmm3, dword ptr [rcx + 4]
0x1004ba75b: vinsertf128 ymm2, ymm2, xmm3, 1
0x1004ba761: vcvtdq2ps ymm2, ymm2
0x1004ba765: vdivps ymm2, ymm2, ymm0
0x1004ba769: vextractf128 xmm3, ymm2, 1
0x1004ba76f: vcvtps2pd ymm3, xmm3
0x1004ba773: vcvtps2pd ymm2, xmm2
0x1004ba777: vaddpd ymm2, ymm2, ymm2
0x1004ba77b: vaddpd ymm3, ymm3, ymm3
0x1004ba77f: vaddpd ymm3, ymm3, ymm1
0x1004ba783: vaddpd ymm2, ymm2, ymm1
0x1004ba787: vcvtpd2ps xmm2, ymm2
0x1004ba78b: vcvtpd2ps xmm3, ymm3
0x1004ba78f: vinsertf128 ymm2, ymm2, xmm3, 1
0x1004ba795: vmovups ymmword ptr [rsi], ymm2
0x1004ba799: add rcx, 8
0x1004ba79d: add rsi, 0x20
0x1004ba7a1: add rdi, -8
0x1004ba7a5: jne 0x1004ba750
0x1004ba7a7: test r8d, r8d
0x1004ba7aa: jne 0x1004ba63d
0x1004ba7b0: jmp 0x1004ba6fe ; 0x1004ba6fe
0x1004ba7b5: lea rdi, [rip + 0x6d2fd2] ; 0x100b8d78e texture != nullptr && size != nullptr
0x1004ba7bc: lea rsi, [rip + 0x6d2e7b] ; 0x100b8d63e Noise.cpp
0x1004ba7c3: mov edx, 0x1b6
0x1004ba7c8: mov ecx, 3
0x1004ba7cd: call 0x1007e5f70 ; 0x1007e5f70
0x1004ba7d2: ud2 
0x1004ba7d4: lea rdi, [rip + 0x6d2fd9] ; 0x100b8d7b4 exists
0x1004ba7db: lea rsi, [rip + 0x6d2e5c] ; 0x100b8d63e Noise.cpp
0x1004ba7e2: mov edx, 0x1ba
0x1004ba7e7: mov ecx, 3
0x1004ba7ec: call 0x1007e5f70 ; 0x1007e5f70
0x1004ba7f1: ud2 
0x1004ba7f3: lea rdi, [rip + 0x6d2fc1] ; 0x100b8d7bb fileSize == sizeRead
0x1004ba7fa: lea rsi, [rip + 0x6d2e3d] ; 0x100b8d63e Noise.cpp
0x1004ba801: mov edx, 0x1bf
0x1004ba806: mov ecx, 3
0x1004ba80b: call 0x1007e5f70 ; 0x1007e5f70
0x1004ba810: jmp 0x1004ba88c ; 0x1004ba88c
0x1004ba812: lea rdi, [rip + 0x6d2fbc] ; 0x100b8d7d5 memcmp( header->magic, "VOLU", 4 ) == 0
0x1004ba819: lea rsi, [rip + 0x6d2e1e] ; 0x100b8d63e Noise.cpp
0x1004ba820: mov edx, 0x1c2
0x1004ba825: mov ecx, 3
0x1004ba82a: call 0x1007e5f70 ; 0x1007e5f70
0x1004ba82f: jmp 0x1004ba88c ; 0x1004ba88c
0x1004ba831: lea rdi, [rip + 0x6d2fc5] ; 0x100b8d7fd header->version == 4
0x1004ba838: lea rsi, [rip + 0x6d2dff] ; 0x100b8d63e Noise.cpp
0x1004ba83f: mov edx, 0x1c3
0x1004ba844: mov ecx, 3
0x1004ba849: call 0x1007e5f70 ; 0x1007e5f70
0x1004ba84e: jmp 0x1004ba88c ; 0x1004ba88c
0x1004ba850: lea rdi, [rip + 0x6d2fbb] ; 0x100b8d812 header->bytesPerChannel == 1
0x1004ba857: lea rsi, [rip + 0x6d2de0] ; 0x100b8d63e Noise.cpp
0x1004ba85e: mov edx, 0x1c4
0x1004ba863: mov ecx, 3
0x1004ba868: call 0x1007e5f70 ; 0x1007e5f70
0x1004ba86d: jmp 0x1004ba88c ; 0x1004ba88c
0x1004ba86f: lea rdi, [rip + 0x6d2fb9] ; 0x100b8d82f header->numChannels == 1
0x1004ba876: lea rsi, [rip + 0x6d2dc1] ; 0x100b8d63e Noise.cpp
0x1004ba87d: mov edx, 0x1c5
0x1004ba882: mov ecx, 3
0x1004ba887: call 0x1007e5f70 ; 0x1007e5f70
0x1004ba88c: ud2 
0x1004ba88e: jmp 0x1004ba892 ; 0x1004ba892
0x1004ba890: jmp 0x1004ba892 ; 0x1004ba892
0x1004ba892: mov rbx, rax
0x1004ba895: call 0x1007c6c20 ; 0x1007c6c20
0x1004ba89a: mov rdi, rax
0x1004ba89d: mov rsi, r12
0x1004ba8a0: call 0x100795a70 ; 0x100795a70
0x1004ba8a5: mov rdi, rbx
0x1004ba8a8: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1004ba8ad: mov rdi, rax
0x1004ba8b0: call 0x100011bf0 ; 0x100011bf0
0x1004ba8b5: mov rdi, rax
0x1004ba8b8: call 0x100011bf0 ; 0x100011bf0
0x1004ba8bd: nop dword ptr [rax]
