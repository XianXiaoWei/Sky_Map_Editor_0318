0x10027a370: push rbp
0x10027a371: mov rbp, rsp
0x10027a374: push r15
0x10027a376: push r14
0x10027a378: push r13
0x10027a37a: push r12
0x10027a37c: push rbx
0x10027a37d: sub rsp, 0x838
0x10027a384: mov rbx, rsi
0x10027a387: mov r13, rdi
0x10027a38a: mov rax, qword ptr [rip + 0x993547] ; 0x100c0d8d8
0x10027a391: mov rax, qword ptr [rax]
0x10027a394: mov qword ptr [rbp - 0x30], rax
0x10027a398: mov rax, qword ptr [r13 + 8]
0x10027a39c: mov r8d, dword ptr [rax + 0x10]
0x10027a3a0: cmp r8, 0x101
0x10027a3a7: jae 0x10027a741
0x10027a3ad: mov qword ptr [r13 + 0x40], 0
0x10027a3b5: test r8d, r8d
0x10027a3b8: je 0x10027a686
0x10027a3be: xor r14d, r14d
0x10027a3c1: xor ecx, ecx
0x10027a3c3: mov qword ptr [rbp - 0x840], r8
0x10027a3ca: nop word ptr [rax + rax]
0x10027a3d0: mov r15d, dword ptr [rbx + 0x1b220]
0x10027a3d7: cmp r15, 0x100
0x10027a3de: jae 0x10027a6bc
0x10027a3e4: lea eax, [r15 + 1]
0x10027a3e8: mov dword ptr [rbx + 0x1b220], eax
0x10027a3ee: imul rax, r15, 0x1a0
0x10027a3f5: lea r12, [rbx + rax + 0x1220]
0x10027a3fd: cmp qword ptr [r13 + 0x40], 0
0x10027a402: je 0x10027a420
0x10027a404: add rcx, 0x1a0
0x10027a40b: cmp r12, rcx
0x10027a40e: je 0x10027a424
0x10027a410: jmp 0x10027a719 ; 0x10027a719
0x10027a415: nop word ptr cs:[rax + rax]
0x10027a420: mov qword ptr [r13 + 0x40], r12
0x10027a424: mov qword ptr [rbp - 0x850], rax
0x10027a42b: mov rax, r13
0x10027a42e: mov rax, qword ptr [rax + 8]
0x10027a432: mov ecx, dword ptr [rax + 0x10]
0x10027a435: cmp r14, rcx
0x10027a438: jae 0x10027a6db
0x10027a43e: mov rax, qword ptr [rax + 8]
0x10027a442: mov rax, qword ptr [rax + r14*8]
0x10027a446: mov qword ptr [rbp - 0x858], rax
0x10027a44d: call 0x1007abc10 ; 0x1007abc10
0x10027a452: mov qword ptr [rbp - 0x848], rax
0x10027a459: mov qword ptr [rbp - 0x838], 0
0x10027a464: call 0x1003ffcf0 ; 0x1003ffcf0
0x10027a469: mov r8, qword ptr [rax]
0x10027a46c: mov rdi, rax
0x10027a46f: lea rsi, [rbp - 0x838]
0x10027a476: lea rdx, [rbp - 0x858]
0x10027a47d: mov rcx, qword ptr [rbp - 0x848]
0x10027a484: call qword ptr [r8 + 0x40]
0x10027a488: mov r8, qword ptr [rbp - 0x838]
0x10027a48f: test r8, r8
0x10027a492: je 0x10027a6fa
0x10027a498: mov r9d, dword ptr [r13 + 0x24]
0x10027a49c: mov dword ptr [rsp], r15d
0x10027a4a0: mov rdi, r12
0x10027a4a3: mov rsi, rbx
0x10027a4a6: mov rcx, r13
0x10027a4a9: call 0x10027a7c0 ; 0x10027a7c0
0x10027a4ae: movzx eax, byte ptr [r13 + 0x20]
0x10027a4b3: test r14, r14
0x10027a4b6: mov r8, qword ptr [rbp - 0x840]
0x10027a4bd: mov rdx, qword ptr [rbp - 0x850]
0x10027a4c4: je 0x10027a4e0
0x10027a4c6: test al, al
0x10027a4c8: je 0x10027a4e0
0x10027a4ca: mov ecx, dword ptr [r13 + 0x28]
0x10027a4ce: mov dword ptr [rbx + rdx + 0x13ac], ecx
0x10027a4d5: mov dword ptr [rbx + rdx + 0x13a8], 0
0x10027a4e0: mov qword ptr [rbp + r14*8 - 0x830], r12
0x10027a4e8: mov rcx, qword ptr [r13 + 0x30]
0x10027a4ec: test rcx, rcx
0x10027a4ef: je 0x10027a4f9
0x10027a4f1: mov qword ptr [rbx + rdx + 0x1390], rcx
0x10027a4f9: inc r14
0x10027a4fc: mov rcx, r12
0x10027a4ff: cmp r14, r8
0x10027a502: jb 0x10027a3d0
0x10027a508: test r8d, r8d
0x10027a50b: je 0x10027a686
0x10027a511: test al, al
0x10027a513: je 0x10027a686
0x10027a519: mov rsi, qword ptr [rbp - 0x830]
0x10027a520: mov al, byte ptr [r13 + 0x21]
0x10027a524: mov byte ptr [rsi + 0xdc], al
0x10027a52a: mov rax, qword ptr [r13 + 8]
0x10027a52e: mov eax, dword ptr [rax + 0x10]
0x10027a531: vcvtsi2ss xmm0, xmm0, rax
0x10027a536: vaddss xmm0, xmm0, xmm0
0x10027a53a: vcvttss2si rax, xmm0
0x10027a53f: mov dword ptr [rsi + 0x188], eax
0x10027a545: mov eax, dword ptr [r13 + 0x28]
0x10027a549: mov dword ptr [rsi + 0x18c], eax
0x10027a54f: mov dword ptr [rbp - 0x838], 1
0x10027a559: xor r14d, r14d
0x10027a55c: lea rdx, [rbp - 0x830]
0x10027a563: lea rcx, [rbp - 0x838]
0x10027a56a: xor edi, edi
0x10027a56c: mov r15, r8
0x10027a56f: mov r9, rbx
0x10027a572: call 0x10027ae30 ; 0x10027ae30
0x10027a577: vxorps xmm0, xmm0, xmm0
0x10027a57b: nop dword ptr [rax + rax]
0x10027a580: mov rax, qword ptr [rbp + r14*8 - 0x830]
0x10027a588: test rax, rax
0x10027a58b: je 0x10027a5c0
0x10027a58d: mov edx, dword ptr [rbx + 0x1b220]
0x10027a593: mov ecx, 0xffffffff
0x10027a598: mov rsi, rax
0x10027a59b: nop dword ptr [rax + rax]
0x10027a5a0: inc ecx
0x10027a5a2: mov edi, dword ptr [rsi + 0xe0]
0x10027a5a8: imul rsi, rdi, 0x1a0
0x10027a5af: lea rsi, [rbx + rsi + 0x1220]
0x10027a5b7: cmp edx, edi
0x10027a5b9: ja 0x10027a5a0
0x10027a5bb: jmp 0x10027a5c5 ; 0x10027a5c5
0x10027a5bd: nop dword ptr [rax]
0x10027a5c0: mov ecx, 0xffffffff
0x10027a5c5: mov ecx, ecx
0x10027a5c7: vcvtsi2ss xmm1, xmm2, rcx
0x10027a5cc: vmaxss xmm0, xmm1, xmm0
0x10027a5d0: vmovss dword ptr [rax + 0x108], xmm1
0x10027a5d8: inc r14
0x10027a5db: cmp r14, r15
0x10027a5de: jne 0x10027a580
0x10027a5e0: vaddss xmm0, xmm0, dword ptr [rip + 0x82aad8] ; 0x100aa50c0
0x10027a5e8: mov eax, r15d
0x10027a5eb: and eax, 1
0x10027a5ee: cmp r15d, 1
0x10027a5f2: jne 0x10027a600
0x10027a5f4: xor ecx, ecx
0x10027a5f6: test rax, rax
0x10027a5f9: jne 0x10027a65e
0x10027a5fb: jmp 0x10027a686 ; 0x10027a686
0x10027a600: sub r15, rax
0x10027a603: xor ecx, ecx
0x10027a605: vmovss xmm1, dword ptr [rip + 0x82aab3] ; 0x100aa50c0
0x10027a60d: nop dword ptr [rax]
0x10027a610: mov rdx, qword ptr [rbp + rcx*8 - 0x830]
0x10027a618: vmovss xmm2, dword ptr [rdx + 0x108]
0x10027a620: vdivss xmm2, xmm2, xmm0
0x10027a624: vsubss xmm2, xmm1, xmm2
0x10027a628: vmovss dword ptr [rdx + 0x108], xmm2
0x10027a630: mov rdx, qword ptr [rbp + rcx*8 - 0x828]
0x10027a638: vmovss xmm2, dword ptr [rdx + 0x108]
0x10027a640: vdivss xmm2, xmm2, xmm0
0x10027a644: vsubss xmm2, xmm1, xmm2
0x10027a648: vmovss dword ptr [rdx + 0x108], xmm2
0x10027a650: add rcx, 2
0x10027a654: cmp r15, rcx
0x10027a657: jne 0x10027a610
0x10027a659: test rax, rax
0x10027a65c: je 0x10027a686
0x10027a65e: mov rax, qword ptr [rbp + rcx*8 - 0x830]
0x10027a666: vmovss xmm1, dword ptr [rax + 0x108]
0x10027a66e: vdivss xmm0, xmm1, xmm0
0x10027a672: vmovss xmm1, dword ptr [rip + 0x82aa46] ; 0x100aa50c0
0x10027a67a: vsubss xmm0, xmm1, xmm0
0x10027a67e: vmovss dword ptr [rax + 0x108], xmm0
0x10027a686: mov dword ptr [r13 + 0x3c], 0
0x10027a68e: mov word ptr [r13 + 0x39], 0
0x10027a695: mov rax, qword ptr [rip + 0x99323c] ; 0x100c0d8d8
0x10027a69c: mov rax, qword ptr [rax]
0x10027a69f: cmp rax, qword ptr [rbp - 0x30]
0x10027a6a3: jne 0x10027a6b7
0x10027a6a5: add rsp, 0x838
0x10027a6ac: pop rbx
0x10027a6ad: pop r12
0x10027a6af: pop r13
0x10027a6b1: pop r14
0x10027a6b3: pop r15
0x10027a6b5: pop rbp
0x10027a6b6: ret 
0x10027a6b7: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10027a6bc: lea rdi, [rip + 0x902b33] ; 0x100b7d1f6 m_darkstoneCount < kMaxDarkstones
0x10027a6c3: lea rsi, [rip + 0x90286c] ; 0x100b7cf36 Darkstone.cpp
0x10027a6ca: mov edx, 0x5ab
0x10027a6cf: mov ecx, 3
0x10027a6d4: call 0x1007e5f70 ; 0x1007e5f70
0x10027a6d9: ud2 
0x10027a6db: lea rdi, [rip + 0x8e7276] ; 0x100b61958 idx < size
0x10027a6e2: lea rsi, [rip + 0x8e727a] ; 0x100b61963 ./Clump.h
0x10027a6e9: mov edx, 0x36
0x10027a6ee: mov ecx, 3
0x10027a6f3: call 0x1007e5f70 ; 0x1007e5f70
0x10027a6f8: ud2 
0x10027a6fa: lea rdi, [rip + 0x8e73f7] ; 0x100b61af8 ret
0x10027a701: lea rsi, [rip + 0x8e725b] ; 0x100b61963 ./Clump.h
0x10027a708: mov edx, 0x47
0x10027a70d: mov ecx, 3
0x10027a712: call 0x1007e5f70 ; 0x1007e5f70
0x10027a717: ud2 
0x10027a719: lea rdi, [rip + 0x90291b] ; 0x100b7d03b d == prev + 1
0x10027a720: lea rsi, [rip + 0x90280f] ; 0x100b7cf36 Darkstone.cpp
0x10027a727: lea r8, [rip + 0x90291b] ; 0x100b7d049 SoulTrap relies on contiguous Darkstone allocation
0x10027a72e: mov edx, 0x13a
0x10027a733: mov ecx, 4
0x10027a738: xor eax, eax
0x10027a73a: call 0x1007e6030 ; 0x1007e6030
0x10027a73f: ud2 
0x10027a741: lea rdi, [rip + 0x9028a4] ; 0x100b7cfec darkstoneCount <= kMaxDarkStones
0x10027a748: lea rsi, [rip + 0x9027e7] ; 0x100b7cf36 Darkstone.cpp
0x10027a74f: lea r8, [rip + 0x9028b7] ; 0x100b7d00d SoulTrap holds more darkstones than supported
0x10027a756: mov edx, 0x130
0x10027a75b: jmp 0x10027a733 ; 0x10027a733
0x10027a75d: nop dword ptr [rax]
