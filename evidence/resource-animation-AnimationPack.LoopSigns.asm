0x1000e6580: push rbp
0x1000e6581: mov rbp, rsp
0x1000e6584: push r15
0x1000e6586: push r14
0x1000e6588: push r13
0x1000e658a: push r12
0x1000e658c: push rbx
0x1000e658d: sub rsp, 0x6048
0x1000e6594: mov r15, rcx
0x1000e6597: mov r8, rdi
0x1000e659a: mov rax, qword ptr [rip + 0xb27337] ; 0x100c0d8d8
0x1000e65a1: mov rax, qword ptr [rax]
0x1000e65a4: mov qword ptr [rbp - 0x30], rax
0x1000e65a8: mov eax, dword ptr [r8 + 0x78]
0x1000e65ac: test eax, eax
0x1000e65ae: je 0x1000e66a9
0x1000e65b4: lea r12d, [rdx + rsi]
0x1000e65b8: lea r13d, [rdx + rsi - 1]
0x1000e65bd: mov rbx, qword ptr [r8 + 0x70]
0x1000e65c1: xor ecx, ecx
0x1000e65c3: nop word ptr cs:[rax + rax]
0x1000e65d0: mov edx, dword ptr [rbx]
0x1000e65d2: cmp edx, esi
0x1000e65d4: jg 0x1000e65db
0x1000e65d6: cmp dword ptr [rbx + 4], esi
0x1000e65d9: jge 0x1000e65ea
0x1000e65db: inc ecx
0x1000e65dd: sub rbx, -0x80
0x1000e65e1: cmp eax, ecx
0x1000e65e3: ja 0x1000e65d0
0x1000e65e5: jmp 0x1000e66a9 ; 0x1000e66a9
0x1000e65ea: sub esi, edx
0x1000e65ec: vcvtsi2ss xmm0, xmm0, esi
0x1000e65f0: vcvttss2si eax, xmm0
0x1000e65f4: vmovd xmm0, eax
0x1000e65f8: vpshufd xmm0, xmm0, 0
0x1000e65fd: vmovdqu xmmword ptr [rbp - 0x6018], xmm0
0x1000e6605: mov byte ptr [rbp - 0x6008], 0
0x1000e660c: movabs rax, 0x3f80000000000000
0x1000e6616: mov qword ptr [rbp - 0x6020], rax
0x1000e661d: vmovaps xmm0, xmmword ptr [rip + 0x9c37cb] ; 0x100aa9df0
0x1000e6625: vmovaps xmmword ptr [rbp - 0x6030], xmm0
0x1000e662d: mov rsi, qword ptr [r8 + 0x88]
0x1000e6634: movsxd rax, dword ptr [r8 + 0x54]
0x1000e6638: shl rax, 4
0x1000e663c: lea rdx, [rax + rax*2]
0x1000e6640: lea rdi, [rbp - 0x3030]
0x1000e6647: mov qword ptr [rbp - 0x6038], r8
0x1000e664e: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1000e6653: xor r14d, r14d
0x1000e6656: lea rdx, [rbp - 0x6030]
0x1000e665d: xor ecx, ecx
0x1000e665f: xor r9d, r9d
0x1000e6662: mov rdi, rbx
0x1000e6665: lea rsi, [rbp - 0x3030]
0x1000e666c: mov r8, qword ptr [rbp - 0x6038]
0x1000e6673: call 0x1000e5020 ; 0x1000e5020
0x1000e6678: mov rdx, qword ptr [rbp - 0x6038]
0x1000e667f: mov eax, dword ptr [rdx + 0x78]
0x1000e6682: test eax, eax
0x1000e6684: je 0x1000e66a9
0x1000e6686: mov rbx, qword ptr [rdx + 0x70]
0x1000e668a: nop word ptr [rax + rax]
0x1000e6690: mov ecx, dword ptr [rbx]
0x1000e6692: cmp r12d, ecx
0x1000e6695: jle 0x1000e669d
0x1000e6697: cmp dword ptr [rbx + 4], r13d
0x1000e669b: jge 0x1000e66c8
0x1000e669d: inc r14d
0x1000e66a0: sub rbx, -0x80
0x1000e66a4: cmp eax, r14d
0x1000e66a7: ja 0x1000e6690
0x1000e66a9: lea rdi, [rip + 0xa8c0b4] ; 0x100b72764 anim != nullptr
0x1000e66b0: lea rsi, [rip + 0xa8c0bd] ; 0x100b72774 AnimationPack.cpp
0x1000e66b7: mov edx, 0x22f
0x1000e66bc: mov ecx, 3
0x1000e66c1: call 0x1007e5f70 ; 0x1007e5f70
0x1000e66c6: ud2 
0x1000e66c8: sub r13d, ecx
0x1000e66cb: vcvtsi2ss xmm0, xmm1, r13d
0x1000e66d0: vcvttss2si eax, xmm0
0x1000e66d4: vmovd xmm0, eax
0x1000e66d8: vpshufd xmm0, xmm0, 0
0x1000e66dd: vmovdqu xmmword ptr [rbp - 0x6058], xmm0
0x1000e66e5: mov byte ptr [rbp - 0x6048], 0
0x1000e66ec: movabs rax, 0x3f80000000000000
0x1000e66f6: mov qword ptr [rbp - 0x6060], rax
0x1000e66fd: vmovaps xmm0, xmmword ptr [rip + 0x9c36eb] ; 0x100aa9df0
0x1000e6705: vmovaps xmmword ptr [rbp - 0x6070], xmm0
0x1000e670d: mov rsi, qword ptr [rdx + 0x88]
0x1000e6714: movsxd rax, dword ptr [rdx + 0x54]
0x1000e6718: shl rax, 4
0x1000e671c: lea rdx, [rax + rax*2]
0x1000e6720: lea r13, [rbp - 0x6030]
0x1000e6727: mov rdi, r13
0x1000e672a: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1000e672f: xor r12d, r12d
0x1000e6732: lea rdx, [rbp - 0x6070]
0x1000e6739: xor ecx, ecx
0x1000e673b: xor r9d, r9d
0x1000e673e: mov rdi, rbx
0x1000e6741: mov rsi, r13
0x1000e6744: mov r8, qword ptr [rbp - 0x6038]
0x1000e674b: call 0x1000e5020 ; 0x1000e5020
0x1000e6750: mov rdi, qword ptr [rbp - 0x6038]
0x1000e6757: cmp dword ptr [rdi + 0x54], 0
0x1000e675b: je 0x1000e67e8
0x1000e6761: xor r12d, r12d
0x1000e6764: vxorps xmm0, xmm0, xmm0
0x1000e6768: xor eax, eax
0x1000e676a: nop word ptr [rax + rax]
0x1000e6770: mov esi, eax
0x1000e6772: shr esi, 3
0x1000e6775: mov ecx, eax
0x1000e6777: and cl, 7
0x1000e677a: mov edx, 1
0x1000e677f: shl edx, cl
0x1000e6781: mov ecx, eax
0x1000e6783: shl rcx, 4
0x1000e6787: lea rcx, [rcx + rcx*2]
0x1000e678b: vmovaps xmm1, xmmword ptr [rbp + rcx - 0x3020]
0x1000e6794: vmulps xmm1, xmm1, xmmword ptr [rbp + rcx - 0x6020]
0x1000e679d: vpermilpd xmm2, xmm1, 1
0x1000e67a3: vaddps xmm1, xmm1, xmm2
0x1000e67a7: vmovshdup xmm2, xmm1
0x1000e67ab: vaddss xmm1, xmm1, xmm2
0x1000e67af: vucomiss xmm0, xmm1
0x1000e67b3: jbe 0x1000e67d0
0x1000e67b5: movzx ecx, sil
0x1000e67b9: movzx esi, byte ptr [r15 + rcx]
0x1000e67be: or edx, esi
0x1000e67c0: mov byte ptr [r15 + rcx], dl
0x1000e67c4: inc r12d
0x1000e67c7: jmp 0x1000e67e1 ; 0x1000e67e1
0x1000e67c9: nop dword ptr [rax]
0x1000e67d0: not edx
0x1000e67d2: movzx ecx, sil
0x1000e67d6: movzx esi, byte ptr [r15 + rcx]
0x1000e67db: and esi, edx
0x1000e67dd: mov byte ptr [r15 + rcx], sil
0x1000e67e1: inc eax
0x1000e67e3: cmp eax, dword ptr [rdi + 0x54]
0x1000e67e6: jb 0x1000e6770
0x1000e67e8: mov rax, qword ptr [rip + 0xb270e9] ; 0x100c0d8d8
0x1000e67ef: mov rax, qword ptr [rax]
0x1000e67f2: cmp rax, qword ptr [rbp - 0x30]
0x1000e67f6: jne 0x1000e680d
0x1000e67f8: mov eax, r12d
0x1000e67fb: add rsp, 0x6048
0x1000e6802: pop rbx
0x1000e6803: pop r12
0x1000e6805: pop r13
0x1000e6807: pop r14
0x1000e6809: pop r15
0x1000e680b: pop rbp
0x1000e680c: ret 
0x1000e680d: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1000e6812: nop word ptr cs:[rax + rax]
