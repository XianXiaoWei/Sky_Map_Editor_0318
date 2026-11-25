0x10071a140: push rbp
0x10071a141: mov rbp, rsp
0x10071a144: push r15
0x10071a146: push r14
0x10071a148: push r13
0x10071a14a: push r12
0x10071a14c: push rbx
0x10071a14d: sub rsp, 0x248
0x10071a154: mov qword ptr [rbp - 0x270], rdx
0x10071a15b: mov r13, rdi
0x10071a15e: mov rax, qword ptr [rip + 0x4f3773] ; 0x100c0d8d8
0x10071a165: mov rax, qword ptr [rax]
0x10071a168: mov qword ptr [rbp - 0x30], rax
0x10071a16c: mov r12, qword ptr [r13 + 0x90]
0x10071a173: test r12, r12
0x10071a176: mov qword ptr [rbp - 0x268], rcx
0x10071a17d: je 0x10071a1c7
0x10071a17f: movzx r15d, byte ptr [r13 + 0x98]
0x10071a187: mov bl, byte ptr [r13 + 0x58]
0x10071a18b: vxorps xmm0, xmm0, xmm0
0x10071a18f: vmovaps xmmword ptr [rbp - 0x260], xmm0
0x10071a197: mov qword ptr [rbp - 0x250], 0
0x10071a1a2: test byte ptr [rcx], 1
0x10071a1a5: jne 0x10071a272
0x10071a1ab: mov rax, qword ptr [rcx + 0x10]
0x10071a1af: mov qword ptr [rbp - 0x250], rax
0x10071a1b6: vmovups xmm0, xmmword ptr [rcx]
0x10071a1ba: vmovaps xmmword ptr [rbp - 0x260], xmm0
0x10071a1c2: jmp 0x10071a30a ; 0x10071a30a
0x10071a1c7: mov rax, qword ptr [r13 + 0x38]
0x10071a1cb: mov rcx, qword ptr [r13 + 0x80]
0x10071a1d2: lea rdx, [r13 + 0x78]
0x10071a1d6: test rcx, rcx
0x10071a1d9: lea rcx, [rcx + 0x10]
0x10071a1dd: cmove rcx, rdx
0x10071a1e1: vmovss xmm0, dword ptr [rcx]
0x10071a1e5: vmovss xmm1, dword ptr [rax + 0x10]
0x10071a1ea: vucomiss xmm1, xmm0
0x10071a1ee: jbe 0x10071a1fe
0x10071a1f0: cmp dword ptr [r13 + 0x88], 0
0x10071a1f8: je 0x10071a6c0
0x10071a1fe: vucomiss xmm1, xmm0
0x10071a202: jb 0x10071a214
0x10071a204: mov bl, 1
0x10071a206: cmp dword ptr [r13 + 0x88], 1
0x10071a20e: je 0x10071a34f
0x10071a214: vucomiss xmm0, xmm1
0x10071a218: jbe 0x10071a22a
0x10071a21a: mov bl, 1
0x10071a21c: cmp dword ptr [r13 + 0x88], 2
0x10071a224: je 0x10071a34f
0x10071a22a: vucomiss xmm0, xmm1
0x10071a22e: jb 0x10071a240
0x10071a230: mov bl, 1
0x10071a232: cmp dword ptr [r13 + 0x88], 3
0x10071a23a: je 0x10071a34f
0x10071a240: vsubss xmm0, xmm1, xmm0
0x10071a244: vandps xmm0, xmm0, xmmword ptr [rip + 0x38d6c4] ; 0x100aa7910
0x10071a24c: vcvtss2sd xmm0, xmm0, xmm0
0x10071a250: vmovsd xmm1, qword ptr [rip + 0x38c868] ; 0x100aa6ac0
0x10071a258: vucomisd xmm1, xmm0
0x10071a25c: jbe 0x10071a6d5
0x10071a262: cmp dword ptr [r13 + 0x88], 4
0x10071a26a: sete bl
0x10071a26d: jmp 0x10071a34f ; 0x10071a34f
0x10071a272: mov r14, qword ptr [rcx + 8]
0x10071a276: cmp r14, 0xff1
0x10071a27d: jae 0x10071a6e8
0x10071a283: mov byte ptr [rbp - 0x220], bl
0x10071a289: mov dword ptr [rbp - 0x21c], r15d
0x10071a290: mov rsi, qword ptr [rcx + 0x10]
0x10071a294: cmp r14, 0x17
0x10071a298: jae 0x10071a2b3
0x10071a29a: mov eax, r14d
0x10071a29d: add al, al
0x10071a29f: mov byte ptr [rbp - 0x260], al
0x10071a2a5: lea rbx, [rbp - 0x25f]
0x10071a2ac: test r14, r14
0x10071a2af: jne 0x10071a2ed
0x10071a2b1: jmp 0x10071a2f8 ; 0x10071a2f8
0x10071a2b3: lea r15, [r14 + 0x10]
0x10071a2b7: and r15, 0xfffffffffffffff0
0x10071a2bb: mov rbx, rsi
0x10071a2be: call 0x1007e50d0 ; 0x1007e50d0
0x10071a2c3: mov rdi, rax
0x10071a2c6: mov rsi, r15
0x10071a2c9: call 0x1007e5790 ; 0x1007e5790
0x10071a2ce: mov rsi, rbx
0x10071a2d1: mov rbx, rax
0x10071a2d4: mov qword ptr [rbp - 0x250], rbx
0x10071a2db: or r15, 1
0x10071a2df: mov qword ptr [rbp - 0x260], r15
0x10071a2e6: mov qword ptr [rbp - 0x258], r14
0x10071a2ed: mov rdi, rbx
0x10071a2f0: mov rdx, r14
0x10071a2f3: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x10071a2f8: mov byte ptr [rbx + r14], 0
0x10071a2fd: mov r15d, dword ptr [rbp - 0x21c]
0x10071a304: mov bl, byte ptr [rbp - 0x220]
0x10071a30a: mov rax, qword ptr [rbp - 0x270]
0x10071a311: lea edx, [rax + 1]
0x10071a314: movzx esi, bl
0x10071a317: lea rcx, [rbp - 0x260]
0x10071a31e: mov rdi, r12
0x10071a321: call 0x10071a140 ; 0x10071a140
0x10071a326: movzx eax, al
0x10071a329: cmp r15d, eax
0x10071a32c: setne bl
0x10071a32f: test byte ptr [rbp - 0x260], 1
0x10071a336: je 0x10071a34f
0x10071a338: mov r14, qword ptr [rbp - 0x250]
0x10071a33f: call 0x1007e50d0 ; 0x1007e50d0
0x10071a344: mov rdi, rax
0x10071a347: mov rsi, r14
0x10071a34a: call 0x1007e5db0 ; 0x1007e5db0
0x10071a34f: mov dword ptr [rbp - 0x21c], ebx
0x10071a355: mov r12, qword ptr [r13 + 0xb0]
0x10071a35c: test r12, r12
0x10071a35f: je 0x10071a3b0
0x10071a361: movzx ebx, byte ptr [r13 + 0xb8]
0x10071a369: mov r15b, byte ptr [r13 + 0x58]
0x10071a36d: vxorps xmm0, xmm0, xmm0
0x10071a371: vmovaps xmmword ptr [rbp - 0x240], xmm0
0x10071a379: mov qword ptr [rbp - 0x230], 0
0x10071a384: mov rcx, qword ptr [rbp - 0x268]
0x10071a38b: test byte ptr [rcx], 1
0x10071a38e: jne 0x10071a465
0x10071a394: mov rax, qword ptr [rcx + 0x10]
0x10071a398: mov qword ptr [rbp - 0x230], rax
0x10071a39f: vmovups xmm0, xmmword ptr [rcx]
0x10071a3a3: vmovaps xmmword ptr [rbp - 0x240], xmm0
0x10071a3ab: jmp 0x10071a4fd ; 0x10071a4fd
0x10071a3b0: mov rax, qword ptr [r13 + 0x38]
0x10071a3b4: mov rcx, qword ptr [r13 + 0xa0]
0x10071a3bb: lea rdx, [r13 + 0x9c]
0x10071a3c2: test rcx, rcx
0x10071a3c5: lea rcx, [rcx + 0x10]
0x10071a3c9: cmove rcx, rdx
0x10071a3cd: vmovss xmm0, dword ptr [rcx]
0x10071a3d1: vmovss xmm1, dword ptr [rax + 0x10]
0x10071a3d6: vucomiss xmm1, xmm0
0x10071a3da: jbe 0x10071a3ea
0x10071a3dc: cmp dword ptr [r13 + 0xa8], 0
0x10071a3e4: je 0x10071a6c7
0x10071a3ea: vucomiss xmm1, xmm0
0x10071a3ee: mov r12d, dword ptr [rbp - 0x21c]
0x10071a3f5: jb 0x10071a407
0x10071a3f7: mov bl, 1
0x10071a3f9: cmp dword ptr [r13 + 0xa8], 1
0x10071a401: je 0x10071a548
0x10071a407: vucomiss xmm0, xmm1
0x10071a40b: jbe 0x10071a41d
0x10071a40d: mov bl, 1
0x10071a40f: cmp dword ptr [r13 + 0xa8], 2
0x10071a417: je 0x10071a548
0x10071a41d: vucomiss xmm0, xmm1
0x10071a421: jb 0x10071a433
0x10071a423: mov bl, 1
0x10071a425: cmp dword ptr [r13 + 0xa8], 3
0x10071a42d: je 0x10071a548
0x10071a433: vsubss xmm0, xmm1, xmm0
0x10071a437: vandps xmm0, xmm0, xmmword ptr [rip + 0x38d4d1] ; 0x100aa7910
0x10071a43f: vcvtss2sd xmm0, xmm0, xmm0
0x10071a443: vmovsd xmm1, qword ptr [rip + 0x38c675] ; 0x100aa6ac0
0x10071a44b: vucomisd xmm1, xmm0
0x10071a44f: jbe 0x10071a6dc
0x10071a455: cmp dword ptr [r13 + 0xa8], 4
0x10071a45d: sete bl
0x10071a460: jmp 0x10071a548 ; 0x10071a548
0x10071a465: mov r14, qword ptr [rcx + 8]
0x10071a469: cmp r14, 0xff1
0x10071a470: jae 0x10071a6f4
0x10071a476: mov dword ptr [rbp - 0x220], ebx
0x10071a47c: mov rsi, qword ptr [rcx + 0x10]
0x10071a480: cmp r14, 0x17
0x10071a484: jae 0x10071a49f
0x10071a486: mov eax, r14d
0x10071a489: add al, al
0x10071a48b: mov byte ptr [rbp - 0x240], al
0x10071a491: lea rbx, [rbp - 0x23f]
0x10071a498: test r14, r14
0x10071a49b: jne 0x10071a4e7
0x10071a49d: jmp 0x10071a4f2 ; 0x10071a4f2
0x10071a49f: mov byte ptr [rbp - 0x268], r15b
0x10071a4a6: lea r15, [r14 + 0x10]
0x10071a4aa: and r15, 0xfffffffffffffff0
0x10071a4ae: mov rbx, rsi
0x10071a4b1: call 0x1007e50d0 ; 0x1007e50d0
0x10071a4b6: mov rdi, rax
0x10071a4b9: mov rsi, r15
0x10071a4bc: call 0x1007e5790 ; 0x1007e5790
0x10071a4c1: mov rsi, rbx
0x10071a4c4: mov rbx, rax
0x10071a4c7: mov qword ptr [rbp - 0x230], rbx
0x10071a4ce: or r15, 1
0x10071a4d2: mov qword ptr [rbp - 0x240], r15
0x10071a4d9: mov r15b, byte ptr [rbp - 0x268]
0x10071a4e0: mov qword ptr [rbp - 0x238], r14
0x10071a4e7: mov rdi, rbx
0x10071a4ea: mov rdx, r14
0x10071a4ed: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x10071a4f2: mov byte ptr [rbx + r14], 0
0x10071a4f7: mov ebx, dword ptr [rbp - 0x220]
0x10071a4fd: mov rdx, qword ptr [rbp - 0x270]
0x10071a504: inc edx
0x10071a506: movzx esi, r15b
0x10071a50a: lea rcx, [rbp - 0x240]
0x10071a511: mov rdi, r12
0x10071a514: call 0x10071a140 ; 0x10071a140
0x10071a519: movzx eax, al
0x10071a51c: cmp ebx, eax
0x10071a51e: setne bl
0x10071a521: test byte ptr [rbp - 0x240], 1
0x10071a528: mov r12d, dword ptr [rbp - 0x21c]
0x10071a52f: je 0x10071a548
0x10071a531: mov r14, qword ptr [rbp - 0x230]
0x10071a538: call 0x1007e50d0 ; 0x1007e50d0
0x10071a53d: mov rdi, rax
0x10071a540: mov rsi, r14
0x10071a543: call 0x1007e5db0 ; 0x1007e5db0
0x10071a548: mov eax, dword ptr [r13 + 0xbc]
0x10071a54f: mov ecx, r12d
0x10071a552: xor cl, 1
0x10071a555: mov r15b, 1
0x10071a558: test bl, bl
0x10071a55a: je 0x10071a565
0x10071a55c: cmp eax, 1
0x10071a55f: jne 0x10071a565
0x10071a561: test cl, cl
0x10071a563: je 0x10071a57b
0x10071a565: test bl, bl
0x10071a567: sete dl
0x10071a56a: cmp eax, 2
0x10071a56d: jne 0x10071a6a8
0x10071a573: and dl, cl
0x10071a575: jne 0x10071a6a8
0x10071a57b: cmp byte ptr [r13 + 0x58], 0
0x10071a580: je 0x10071a683
0x10071a586: lea rdi, [rbp - 0xc8]
0x10071a58d: lea r12, [rbp - 0x210]
0x10071a594: mov rax, qword ptr [rip + 0x4eff85] ; 0x100c0a520
0x10071a59b: lea rcx, [rax + 0x18]
0x10071a59f: mov qword ptr [rbp - 0x218], rcx
0x10071a5a6: add rax, 0x40
0x10071a5aa: mov qword ptr [rbp - 0xc8], rax
0x10071a5b1: mov rsi, r12
0x10071a5b4: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x10071a5b9: mov qword ptr [rbp - 0x40], 0
0x10071a5c1: mov dword ptr [rbp - 0x38], 0xffffffff
0x10071a5c8: mov rbx, qword ptr [rip + 0x4f2ff9] ; 0x100c0d5c8
0x10071a5cf: lea r14, [rbx + 0x18]
0x10071a5d3: mov qword ptr [rbp - 0x218], r14
0x10071a5da: add rbx, 0x40
0x10071a5de: mov qword ptr [rbp - 0xc8], rbx
0x10071a5e5: lea rsi, [rip + 0x44641a] ; 0x100b60a06 DEV
0x10071a5ec: mov edx, 8
0x10071a5f1: mov rdi, r12
0x10071a5f4: call 0x1007a56a0 ; 0x1007a56a0
0x10071a5f9: lea rsi, [rip + 0x482401] ; 0x100b9ca01 value->value
0x10071a600: lea rdi, [rbp - 0x218]
0x10071a607: mov edx, 0xc
0x10071a60c: call 0x100011930 ; 0x100011930
0x10071a611: lea rsi, [rip + 0x4463f4] ; 0x100b60a0c : 
0x10071a618: mov edx, 2
0x10071a61d: mov rdi, rax
0x10071a620: call 0x100011930 ; 0x100011930
0x10071a625: mov rcx, qword ptr [r13 + 0x38]
0x10071a629: vmovss xmm0, dword ptr [rcx + 0x10]
0x10071a62e: mov rdi, rax
0x10071a631: call 0x100aa23d2 ; 0x100aa23d2 __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEf
0x10071a636: lea rsi, [rip + 0x4463d2] ; 0x100b60a0f  
0x10071a63d: mov edx, 1
0x10071a642: mov rdi, rax
0x10071a645: call 0x100011930 ; 0x100011930
0x10071a64a: mov qword ptr [rbp - 0x218], r14
0x10071a651: mov qword ptr [rbp - 0xc8], rbx
0x10071a658: mov rdi, r12
0x10071a65b: call 0x1007a58d0 ; 0x1007a58d0
0x10071a660: mov rsi, qword ptr [rip + 0x4eff19] ; 0x100c0a580
0x10071a667: add rsi, 8
0x10071a66b: lea rdi, [rbp - 0x218]
0x10071a672: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10071a677: lea rdi, [rbp - 0xc8]
0x10071a67e: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10071a683: mov rax, qword ptr [rip + 0x4f324e] ; 0x100c0d8d8
0x10071a68a: mov rax, qword ptr [rax]
0x10071a68d: cmp rax, qword ptr [rbp - 0x30]
0x10071a691: jne 0x10071a6e3
0x10071a693: mov eax, r15d
0x10071a696: add rsp, 0x248
0x10071a69d: pop rbx
0x10071a69e: pop r12
0x10071a6a0: pop r13
0x10071a6a2: pop r14
0x10071a6a4: pop r15
0x10071a6a6: pop rbp
0x10071a6a7: ret 
0x10071a6a8: test eax, eax
0x10071a6aa: sete al
0x10071a6ad: and r12b, al
0x10071a6b0: mov r15d, r12d
0x10071a6b3: cmp byte ptr [r13 + 0x58], 0
0x10071a6b8: jne 0x10071a586
0x10071a6be: jmp 0x10071a683 ; 0x10071a683
0x10071a6c0: mov bl, 1
0x10071a6c2: jmp 0x10071a34f ; 0x10071a34f
0x10071a6c7: mov bl, 1
0x10071a6c9: mov r12d, dword ptr [rbp - 0x21c]
0x10071a6d0: jmp 0x10071a548 ; 0x10071a548
0x10071a6d5: xor ebx, ebx
0x10071a6d7: jmp 0x10071a34f ; 0x10071a34f
0x10071a6dc: xor ebx, ebx
0x10071a6de: jmp 0x10071a548 ; 0x10071a548
0x10071a6e3: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10071a6e8: lea rdi, [rbp - 0x260]
0x10071a6ef: call 0x100aa230c ; 0x100aa230c __ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv
0x10071a6f4: lea rdi, [rbp - 0x240]
0x10071a6fb: call 0x100aa230c ; 0x100aa230c __ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv
0x10071a700: mov r15, rax
0x10071a703: jmp 0x10071a797 ; 0x10071a797
0x10071a708: mov rdi, rax
0x10071a70b: call 0x100011bf0 ; 0x100011bf0
0x10071a710: mov r15, rax
0x10071a713: jmp 0x10071a7ae ; 0x10071a7ae
0x10071a718: mov rdi, rax
0x10071a71b: call 0x100011bf0 ; 0x100011bf0
0x10071a720: mov r15, rax
0x10071a723: test byte ptr [rbp - 0x240], 1
0x10071a72a: je 0x10071a7ba
0x10071a730: mov r14, qword ptr [rbp - 0x230]
0x10071a737: call 0x1007e50d0 ; 0x1007e50d0
0x10071a73c: mov rdi, rax
0x10071a73f: mov rsi, r14
0x10071a742: call 0x1007e5db0 ; 0x1007e5db0
0x10071a747: jmp 0x10071a7ba ; 0x10071a7ba
0x10071a749: mov rdi, rax
0x10071a74c: call 0x100011bf0 ; 0x100011bf0
0x10071a751: mov r15, rax
0x10071a754: test byte ptr [rbp - 0x260], 1
0x10071a75b: je 0x10071a7ba
0x10071a75d: mov r14, qword ptr [rbp - 0x250]
0x10071a764: call 0x1007e50d0 ; 0x1007e50d0
0x10071a769: mov rdi, rax
0x10071a76c: mov rsi, r14
0x10071a76f: call 0x1007e5db0 ; 0x1007e5db0
0x10071a774: jmp 0x10071a7ba ; 0x10071a7ba
0x10071a776: mov rdi, rax
0x10071a779: call 0x100011bf0 ; 0x100011bf0
0x10071a77e: mov r15, rax
0x10071a781: mov qword ptr [rbp - 0x218], r14
0x10071a788: mov qword ptr [rbp - 0xc8], rbx
0x10071a78f: mov rdi, r12
0x10071a792: call 0x1007a58d0 ; 0x1007a58d0
0x10071a797: mov rsi, qword ptr [rip + 0x4efde2] ; 0x100c0a580
0x10071a79e: add rsi, 8
0x10071a7a2: lea rdi, [rbp - 0x218]
0x10071a7a9: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10071a7ae: lea rdi, [rbp - 0xc8]
0x10071a7b5: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10071a7ba: mov rdi, r15
0x10071a7bd: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10071a7c2: nop word ptr cs:[rax + rax]
