0x1006a7280: push rbp
0x1006a7281: mov rbp, rsp
0x1006a7284: push r15
0x1006a7286: push r14
0x1006a7288: push r13
0x1006a728a: push r12
0x1006a728c: push rbx
0x1006a728d: sub rsp, 0x458
0x1006a7294: mov qword ptr [rbp - 0x438], r8
0x1006a729b: mov dword ptr [rbp - 0x454], ecx
0x1006a72a1: mov qword ptr [rbp - 0x460], rdx
0x1006a72a8: mov dword ptr [rbp - 0x444], esi
0x1006a72ae: mov rax, qword ptr [rip + 0x566623] ; 0x100c0d8d8
0x1006a72b5: mov rax, qword ptr [rax]
0x1006a72b8: mov qword ptr [rbp - 0x30], rax
0x1006a72bc: mov qword ptr [rbp - 0x478], rdi
0x1006a72c3: cmp rdi, qword ptr [rbp + 0x10]
0x1006a72c7: je 0x1006a7a88
0x1006a72cd: mov qword ptr [rbp - 0x470], r9
0x1006a72d4: lea r15d, [r9 + r9 - 1]
0x1006a72d9: call 0x1007c6c20 ; 0x1007c6c20
0x1006a72de: lea r12, [r15*4]
0x1006a72e6: lea rbx, [rip + 0x19a1863] ; 0x102048b50
0x1006a72ed: mov rdx, qword ptr [rbx]
0x1006a72f0: mov ecx, 4
0x1006a72f5: mov rdi, rax
0x1006a72f8: mov rsi, r12
0x1006a72fb: call 0x100795530 ; 0x100795530
0x1006a7300: mov r14, rax
0x1006a7303: mov rdi, r14
0x1006a7306: mov rsi, r12
0x1006a7309: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x1006a730e: call 0x1007c6c20 ; 0x1007c6c20
0x1006a7313: lea rsi, [r15*8]
0x1006a731b: mov rdx, qword ptr [rbx]
0x1006a731e: mov ecx, 8
0x1006a7323: mov rdi, rax
0x1006a7326: call 0x100795530 ; 0x100795530
0x1006a732b: mov r13, rax
0x1006a732e: call 0x1007c6c20 ; 0x1007c6c20
0x1006a7333: mov ecx, dword ptr [rbp - 0x444]
0x1006a7339: mov edx, 0xaaaaaaab
0x1006a733e: imul rdx, rcx
0x1006a7342: shr rdx, 0x21
0x1006a7346: mov qword ptr [rbp - 0x468], rdx
0x1006a734d: lea rsi, [rdx*8]
0x1006a7355: mov rdx, qword ptr [rbx]
0x1006a7358: mov ecx, 8
0x1006a735d: mov rdi, rax
0x1006a7360: call 0x100795530 ; 0x100795530
0x1006a7365: mov qword ptr [rbp - 0x440], rax
0x1006a736c: cmp r15d, 0x41
0x1006a7370: jae 0x1006a7aa7
0x1006a7376: lea rdi, [rbp - 0x430]
0x1006a737d: mov esi, 0xff
0x1006a7382: mov edx, 0x400
0x1006a7387: call 0x100aa2900 ; 0x100aa2900 _memset
0x1006a738c: mov rcx, qword ptr [rbp - 0x470]
0x1006a7393: test ecx, ecx
0x1006a7395: mov r9, qword ptr [rbp - 0x440]
0x1006a739c: mov r8, qword ptr [rbp - 0x468]
0x1006a73a3: mov rsi, qword ptr [rbp - 0x438]
0x1006a73aa: je 0x1006a7466
0x1006a73b0: mov r10d, ecx
0x1006a73b3: lea rsi, [r10 - 1]
0x1006a73b7: mov eax, r10d
0x1006a73ba: and eax, 3
0x1006a73bd: cmp rsi, 3
0x1006a73c1: jae 0x1006a73d6
0x1006a73c3: xor ebx, ebx
0x1006a73c5: test rax, rax
0x1006a73c8: mov rsi, qword ptr [rbp - 0x438]
0x1006a73cf: jne 0x1006a7449
0x1006a73d1: jmp 0x1006a7466 ; 0x1006a7466
0x1006a73d6: sub r10, rax
0x1006a73d9: xor ebx, ebx
0x1006a73db: mov rdx, qword ptr [rbp - 0x438]
0x1006a73e2: nop word ptr cs:[rax + rax]
0x1006a73f0: mov rsi, qword ptr [rdx + rbx*8]
0x1006a73f4: movzx esi, byte ptr [rsi]
0x1006a73f7: mov dword ptr [rbp + rsi*4 - 0x430], ebx
0x1006a73fe: mov rsi, qword ptr [rdx + rbx*8 + 8]
0x1006a7403: movzx esi, byte ptr [rsi]
0x1006a7406: lea edi, [rbx + 1]
0x1006a7409: mov dword ptr [rbp + rsi*4 - 0x430], edi
0x1006a7410: mov rsi, qword ptr [rdx + rbx*8 + 0x10]
0x1006a7415: movzx esi, byte ptr [rsi]
0x1006a7418: lea edi, [rbx + 2]
0x1006a741b: mov dword ptr [rbp + rsi*4 - 0x430], edi
0x1006a7422: mov rsi, qword ptr [rdx + rbx*8 + 0x18]
0x1006a7427: movzx esi, byte ptr [rsi]
0x1006a742a: lea edi, [rbx + 3]
0x1006a742d: mov dword ptr [rbp + rsi*4 - 0x430], edi
0x1006a7434: add rbx, 4
0x1006a7438: cmp r10, rbx
0x1006a743b: jne 0x1006a73f0
0x1006a743d: test rax, rax
0x1006a7440: mov rsi, qword ptr [rbp - 0x438]
0x1006a7447: je 0x1006a7466
0x1006a7449: neg rax
0x1006a744c: nop dword ptr [rax]
0x1006a7450: mov rdx, qword ptr [rsi + rbx*8]
0x1006a7454: movzx edx, byte ptr [rdx]
0x1006a7457: mov dword ptr [rbp + rdx*4 - 0x430], ebx
0x1006a745e: inc rbx
0x1006a7461: inc rax
0x1006a7464: jne 0x1006a7450
0x1006a7466: mov qword ptr [rbp - 0x480], r12
0x1006a746d: cmp dword ptr [rbp - 0x444], 0
0x1006a7474: mov rbx, rsi
0x1006a7477: je 0x1006a7925
0x1006a747d: dec ecx
0x1006a747f: xor r11d, r11d
0x1006a7482: mov qword ptr [rbp - 0x470], rcx
0x1006a7489: nop dword ptr [rax]
0x1006a7490: mov r12d, r11d
0x1006a7493: mov rcx, qword ptr [rbp - 0x478]
0x1006a749a: movzx esi, word ptr [rcx + r12*2]
0x1006a749f: imul esi, dword ptr [rbp - 0x454]
0x1006a74a6: lea eax, [r11 + 1]
0x1006a74aa: movzx r10d, word ptr [rcx + rax*2]
0x1006a74af: lea eax, [r11 + 2]
0x1006a74b3: movzx r8d, word ptr [rcx + rax*2]
0x1006a74b8: mov rdi, qword ptr [rbp - 0x460]
0x1006a74bf: movzx eax, byte ptr [rdi + rsi + 0x10]
0x1006a74c4: test rax, rax
0x1006a74c7: je 0x1006a7620
0x1006a74cd: mov ecx, dword ptr [rbp + rax*4 - 0x430]
0x1006a74d4: mov eax, 0xffffffff
0x1006a74d9: cmp rcx, rax
0x1006a74dc: je 0x1006a7a69
0x1006a74e2: mov qword ptr [rbp - 0x450], r8
0x1006a74e9: mov r8b, byte ptr [rdi + rsi + 0x14]
0x1006a74ee: mov r9, qword ptr [rbx + rcx*8]
0x1006a74f2: mov eax, 1
0x1006a74f7: shl rax, cl
0x1006a74fa: cmp r8b, byte ptr [r9 + 0x60]
0x1006a74fe: mov ecx, 0
0x1006a7503: cmovbe rax, rcx
0x1006a7507: cmp r8b, byte ptr [r9 + 0x61]
0x1006a750b: jae 0x1006a7610
0x1006a7511: movzx ecx, byte ptr [rdi + rsi + 0x11]
0x1006a7516: test rcx, rcx
0x1006a7519: je 0x1006a7610
0x1006a751f: mov ecx, dword ptr [rbp + rcx*4 - 0x430]
0x1006a7526: mov edx, 0xffffffff
0x1006a752b: cmp rcx, rdx
0x1006a752e: je 0x1006a7a69
0x1006a7534: mov r8b, byte ptr [rdi + rsi + 0x15]
0x1006a7539: mov r9, qword ptr [rbx + rcx*8]
0x1006a753d: mov edx, 1
0x1006a7542: shl rdx, cl
0x1006a7545: cmp r8b, byte ptr [r9 + 0x60]
0x1006a7549: mov ecx, 0
0x1006a754e: cmovbe rdx, rcx
0x1006a7552: or rax, rdx
0x1006a7555: cmp r8b, byte ptr [r9 + 0x61]
0x1006a7559: jae 0x1006a7610
0x1006a755f: movzx ecx, byte ptr [rdi + rsi + 0x12]
0x1006a7564: test rcx, rcx
0x1006a7567: je 0x1006a7610
0x1006a756d: mov ecx, dword ptr [rbp + rcx*4 - 0x430]
0x1006a7574: mov edx, 0xffffffff
0x1006a7579: cmp rcx, rdx
0x1006a757c: je 0x1006a7a69
0x1006a7582: mov r8b, byte ptr [rdi + rsi + 0x16]
0x1006a7587: mov r9, qword ptr [rbx + rcx*8]
0x1006a758b: mov edx, 1
0x1006a7590: shl rdx, cl
0x1006a7593: cmp r8b, byte ptr [r9 + 0x60]
0x1006a7597: mov ecx, 0
0x1006a759c: cmovbe rdx, rcx
0x1006a75a0: or rax, rdx
0x1006a75a3: cmp r8b, byte ptr [r9 + 0x61]
0x1006a75a7: jae 0x1006a7610
0x1006a75a9: movzx ecx, byte ptr [rdi + rsi + 0x13]
0x1006a75ae: test rcx, rcx
0x1006a75b1: je 0x1006a7610
0x1006a75b3: mov ecx, dword ptr [rbp + rcx*4 - 0x430]
0x1006a75ba: mov edx, 0xffffffff
0x1006a75bf: cmp rcx, rdx
0x1006a75c2: mov r9, qword ptr [rbp - 0x440]
0x1006a75c9: je 0x1006a7a69
0x1006a75cf: mov rdx, qword ptr [rbp - 0x460]
0x1006a75d6: mov r8b, byte ptr [rdx + rsi + 0x17]
0x1006a75db: mov rsi, qword ptr [rbx + rcx*8]
0x1006a75df: mov edx, 1
0x1006a75e4: shl rdx, cl
0x1006a75e7: cmp r8b, byte ptr [rsi + 0x60]
0x1006a75eb: mov r8, qword ptr [rbp - 0x450]
0x1006a75f2: mov rdi, qword ptr [rbp - 0x460]
0x1006a75f9: mov ecx, 0
0x1006a75fe: cmovbe rdx, rcx
0x1006a7602: or rax, rdx
0x1006a7605: jmp 0x1006a7622 ; 0x1006a7622
0x1006a7607: nop word ptr [rax + rax]
0x1006a7610: mov r9, qword ptr [rbp - 0x440]
0x1006a7617: mov r8, qword ptr [rbp - 0x450]
0x1006a761e: jmp 0x1006a7622 ; 0x1006a7622
0x1006a7620: xor eax, eax
0x1006a7622: imul r10d, dword ptr [rbp - 0x454]
0x1006a762a: movzx ecx, byte ptr [rdi + r10 + 0x10]
0x1006a7630: test rcx, rcx
0x1006a7633: je 0x1006a7770
0x1006a7639: mov ecx, dword ptr [rbp + rcx*4 - 0x430]
0x1006a7640: mov edx, 0xffffffff
0x1006a7645: cmp rcx, rdx
0x1006a7648: je 0x1006a7a69
0x1006a764e: mov dl, byte ptr [rdi + r10 + 0x14]
0x1006a7653: mov rsi, qword ptr [rbx + rcx*8]
0x1006a7657: mov ebx, 1
0x1006a765c: shl rbx, cl
0x1006a765f: cmp dl, byte ptr [rsi + 0x60]
0x1006a7662: mov ecx, 0
0x1006a7667: cmovbe rbx, rcx
0x1006a766b: or rax, rbx
0x1006a766e: cmp dl, byte ptr [rsi + 0x61]
0x1006a7671: jae 0x1006a7770
0x1006a7677: movzx ecx, byte ptr [rdi + r10 + 0x11]
0x1006a767d: test rcx, rcx
0x1006a7680: je 0x1006a7770
0x1006a7686: mov ecx, dword ptr [rbp + rcx*4 - 0x430]
0x1006a768d: mov edx, 0xffffffff
0x1006a7692: cmp rcx, rdx
0x1006a7695: mov rsi, qword ptr [rbp - 0x438]
0x1006a769c: je 0x1006a7a69
0x1006a76a2: mov dl, byte ptr [rdi + r10 + 0x15]
0x1006a76a7: mov rsi, qword ptr [rsi + rcx*8]
0x1006a76ab: mov ebx, 1
0x1006a76b0: shl rbx, cl
0x1006a76b3: cmp dl, byte ptr [rsi + 0x60]
0x1006a76b6: mov ecx, 0
0x1006a76bb: cmovbe rbx, rcx
0x1006a76bf: or rax, rbx
0x1006a76c2: cmp dl, byte ptr [rsi + 0x61]
0x1006a76c5: jae 0x1006a7770
0x1006a76cb: movzx ecx, byte ptr [rdi + r10 + 0x12]
0x1006a76d1: test rcx, rcx
0x1006a76d4: je 0x1006a7770
0x1006a76da: mov ecx, dword ptr [rbp + rcx*4 - 0x430]
0x1006a76e1: mov edx, 0xffffffff
0x1006a76e6: cmp rcx, rdx
0x1006a76e9: mov rsi, qword ptr [rbp - 0x438]
0x1006a76f0: je 0x1006a7a69
0x1006a76f6: mov dl, byte ptr [rdi + r10 + 0x16]
0x1006a76fb: mov rsi, qword ptr [rsi + rcx*8]
0x1006a76ff: mov ebx, 1
0x1006a7704: shl rbx, cl
0x1006a7707: cmp dl, byte ptr [rsi + 0x60]
0x1006a770a: mov ecx, 0
0x1006a770f: cmovbe rbx, rcx
0x1006a7713: or rax, rbx
0x1006a7716: cmp dl, byte ptr [rsi + 0x61]
0x1006a7719: jae 0x1006a7770
0x1006a771b: movzx ecx, byte ptr [rdi + r10 + 0x13]
0x1006a7721: test rcx, rcx
0x1006a7724: je 0x1006a7770
0x1006a7726: mov ecx, dword ptr [rbp + rcx*4 - 0x430]
0x1006a772d: mov edx, 0xffffffff
0x1006a7732: cmp rcx, rdx
0x1006a7735: mov rsi, qword ptr [rbp - 0x438]
0x1006a773c: je 0x1006a7a69
0x1006a7742: mov dl, byte ptr [rdi + r10 + 0x17]
0x1006a7747: mov rsi, qword ptr [rsi + rcx*8]
0x1006a774b: mov ebx, 1
0x1006a7750: shl rbx, cl
0x1006a7753: cmp dl, byte ptr [rsi + 0x60]
0x1006a7756: mov ecx, 0
0x1006a775b: cmovbe rbx, rcx
0x1006a775f: or rax, rbx
0x1006a7762: nop word ptr cs:[rax + rax]
0x1006a7770: imul r8d, dword ptr [rbp - 0x454]
0x1006a7778: movzx ecx, byte ptr [rdi + r8 + 0x10]
0x1006a777e: test rcx, rcx
0x1006a7781: je 0x1006a78c0
0x1006a7787: mov ecx, dword ptr [rbp + rcx*4 - 0x430]
0x1006a778e: mov edx, 0xffffffff
0x1006a7793: cmp rcx, rdx
0x1006a7796: mov rsi, qword ptr [rbp - 0x438]
0x1006a779d: je 0x1006a7a69
0x1006a77a3: mov dl, byte ptr [rdi + r8 + 0x14]
0x1006a77a8: mov rsi, qword ptr [rsi + rcx*8]
0x1006a77ac: mov ebx, 1
0x1006a77b1: shl rbx, cl
0x1006a77b4: cmp dl, byte ptr [rsi + 0x60]
0x1006a77b7: mov ecx, 0
0x1006a77bc: cmovbe rbx, rcx
0x1006a77c0: or rax, rbx
0x1006a77c3: cmp dl, byte ptr [rsi + 0x61]
0x1006a77c6: jae 0x1006a78c0
0x1006a77cc: movzx ecx, byte ptr [rdi + r8 + 0x11]
0x1006a77d2: test rcx, rcx
0x1006a77d5: je 0x1006a78c0
0x1006a77db: mov ecx, dword ptr [rbp + rcx*4 - 0x430]
0x1006a77e2: mov edx, 0xffffffff
0x1006a77e7: cmp rcx, rdx
0x1006a77ea: mov rsi, qword ptr [rbp - 0x438]
0x1006a77f1: je 0x1006a7a69
0x1006a77f7: mov dl, byte ptr [rdi + r8 + 0x15]
0x1006a77fc: mov rsi, qword ptr [rsi + rcx*8]
0x1006a7800: mov ebx, 1
0x1006a7805: shl rbx, cl
0x1006a7808: cmp dl, byte ptr [rsi + 0x60]
0x1006a780b: mov ecx, 0
0x1006a7810: cmovbe rbx, rcx
0x1006a7814: or rax, rbx
0x1006a7817: cmp dl, byte ptr [rsi + 0x61]
0x1006a781a: jae 0x1006a78c0
0x1006a7820: movzx ecx, byte ptr [rdi + r8 + 0x12]
0x1006a7826: test rcx, rcx
0x1006a7829: je 0x1006a78c0
0x1006a782f: mov ecx, dword ptr [rbp + rcx*4 - 0x430]
0x1006a7836: mov edx, 0xffffffff
0x1006a783b: cmp rcx, rdx
0x1006a783e: mov rsi, qword ptr [rbp - 0x438]
0x1006a7845: je 0x1006a7a69
0x1006a784b: mov dl, byte ptr [rdi + r8 + 0x16]
0x1006a7850: mov rsi, qword ptr [rsi + rcx*8]
0x1006a7854: mov ebx, 1
0x1006a7859: shl rbx, cl
0x1006a785c: cmp dl, byte ptr [rsi + 0x60]
0x1006a785f: mov ecx, 0
0x1006a7864: cmovbe rbx, rcx
0x1006a7868: or rax, rbx
0x1006a786b: cmp dl, byte ptr [rsi + 0x61]
0x1006a786e: jae 0x1006a78c0
0x1006a7870: movzx ecx, byte ptr [rdi + r8 + 0x13]
0x1006a7876: test rcx, rcx
0x1006a7879: je 0x1006a78c0
0x1006a787b: mov ecx, dword ptr [rbp + rcx*4 - 0x430]
0x1006a7882: mov edx, 0xffffffff
0x1006a7887: cmp rcx, rdx
0x1006a788a: mov rsi, qword ptr [rbp - 0x438]
0x1006a7891: je 0x1006a7a69
0x1006a7897: mov dl, byte ptr [rdi + r8 + 0x17]
0x1006a789c: mov rsi, qword ptr [rsi + rcx*8]
0x1006a78a0: mov ebx, 1
0x1006a78a5: shl rbx, cl
0x1006a78a8: cmp dl, byte ptr [rsi + 0x60]
0x1006a78ab: mov ecx, 0
0x1006a78b0: cmovbe rbx, rcx
0x1006a78b4: or rax, rbx
0x1006a78b7: nop word ptr [rax + rax]
0x1006a78c0: mov rbx, qword ptr [rbp - 0x438]
0x1006a78c7: lea rsi, [rax - 1]
0x1006a78cb: xor rsi, rax
0x1006a78ce: mov rdx, rsi
0x1006a78d1: not rdx
0x1006a78d4: and rdx, rax
0x1006a78d7: mov rcx, qword ptr [rbp - 0x470]
0x1006a78de: shl rdx, cl
0x1006a78e1: and rsi, rax
0x1006a78e4: or rsi, rdx
0x1006a78e7: xor eax, eax
0x1006a78e9: mov r8, qword ptr [rbp - 0x468]
0x1006a78f0: bt rsi, rax
0x1006a78f4: jae 0x1006a78fb
0x1006a78f6: add dword ptr [r14 + rax*4], 3
0x1006a78fb: inc rax
0x1006a78fe: cmp rax, r15
0x1006a7901: jb 0x1006a78f0
0x1006a7903: mov eax, 0xaaaaaaab
0x1006a7908: imul r12, rax
0x1006a790c: shr r12, 0x21
0x1006a7910: mov qword ptr [r9 + r12*8], rsi
0x1006a7914: add r11d, 3
0x1006a7918: cmp r11d, dword ptr [rbp - 0x444]
0x1006a791f: jb 0x1006a7490
0x1006a7925: mov rdi, qword ptr [rbp + 0x18]
0x1006a7929: mov rsi, qword ptr [rbp + 0x10]
0x1006a792d: mov qword ptr [r13], rsi
0x1006a7931: mov ebx, dword ptr [r14]
0x1006a7934: mov r12d, ebx
0x1006a7937: cmp r15d, 1
0x1006a793b: je 0x1006a796a
0x1006a793d: mov eax, 1
0x1006a7942: mov edx, ebx
0x1006a7944: mov rcx, rsi
0x1006a7947: mov r12d, ebx
0x1006a794a: nop word ptr [rax + rax]
0x1006a7950: mov edx, edx
0x1006a7952: lea rcx, [rcx + rdx*2]
0x1006a7956: mov qword ptr [r13 + rax*8], rcx
0x1006a795b: mov edx, dword ptr [r14 + rax*4]
0x1006a795f: add r12d, edx
0x1006a7962: inc rax
0x1006a7965: cmp rax, r15
0x1006a7968: jb 0x1006a7950
0x1006a796a: test rdi, rdi
0x1006a796d: je 0x1006a7990
0x1006a796f: mov rsi, r14
0x1006a7972: mov rdx, qword ptr [rbp - 0x480]
0x1006a7979: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1006a797e: mov r8, qword ptr [rbp - 0x468]
0x1006a7985: mov rsi, qword ptr [rbp + 0x10]
0x1006a7989: mov r9, qword ptr [rbp - 0x440]
0x1006a7990: test rsi, rsi
0x1006a7993: je 0x1006a7a0b
0x1006a7995: cmp dword ptr [rbp - 0x444], 3
0x1006a799c: jb 0x1006a7a0b
0x1006a799e: xor ecx, ecx
0x1006a79a0: test ebx, ebx
0x1006a79a2: jne 0x1006a79c5
0x1006a79a4: nop word ptr cs:[rax + rax]
0x1006a79b0: lea rax, [rcx + 1]
0x1006a79b4: cmp rax, r15
0x1006a79b7: jae 0x1006a7a0b
0x1006a79b9: mov ebx, dword ptr [r14 + rcx*4 + 4]
0x1006a79be: mov rcx, rax
0x1006a79c1: test ebx, ebx
0x1006a79c3: je 0x1006a79b0
0x1006a79c5: mov eax, 1
0x1006a79ca: shl rax, cl
0x1006a79cd: mov rdx, qword ptr [rbp - 0x478]
0x1006a79d4: xor esi, esi
0x1006a79d6: nop word ptr cs:[rax + rax]
0x1006a79e0: test qword ptr [r9 + rsi*8], rax
0x1006a79e4: je 0x1006a79fd
0x1006a79e6: mov rdi, qword ptr [r13 + rcx*8]
0x1006a79eb: movzx ebx, word ptr [rdx + 4]
0x1006a79ef: mov word ptr [rdi + 4], bx
0x1006a79f3: mov ebx, dword ptr [rdx]
0x1006a79f5: mov dword ptr [rdi], ebx
0x1006a79f7: add qword ptr [r13 + rcx*8], 6
0x1006a79fd: inc rsi
0x1006a7a00: add rdx, 6
0x1006a7a04: cmp rsi, r8
0x1006a7a07: jb 0x1006a79e0
0x1006a7a09: jmp 0x1006a79b0 ; 0x1006a79b0
0x1006a7a0b: call 0x1007c6c20 ; 0x1007c6c20
0x1006a7a10: mov rdi, rax
0x1006a7a13: mov rsi, qword ptr [rbp - 0x440]
0x1006a7a1a: call 0x100795a70 ; 0x100795a70
0x1006a7a1f: call 0x1007c6c20 ; 0x1007c6c20
0x1006a7a24: mov rdi, rax
0x1006a7a27: mov rsi, r13
0x1006a7a2a: call 0x100795a70 ; 0x100795a70
0x1006a7a2f: call 0x1007c6c20 ; 0x1007c6c20
0x1006a7a34: mov rdi, rax
0x1006a7a37: mov rsi, r14
0x1006a7a3a: call 0x100795a70 ; 0x100795a70
0x1006a7a3f: mov rax, qword ptr [rip + 0x565e92] ; 0x100c0d8d8
0x1006a7a46: mov rax, qword ptr [rax]
0x1006a7a49: cmp rax, qword ptr [rbp - 0x30]
0x1006a7a4d: jne 0x1006a7a64
0x1006a7a4f: mov eax, r12d
0x1006a7a52: add rsp, 0x458
0x1006a7a59: pop rbx
0x1006a7a5a: pop r12
0x1006a7a5c: pop r13
0x1006a7a5e: pop r14
0x1006a7a60: pop r15
0x1006a7a62: pop rbp
0x1006a7a63: ret 
0x1006a7a64: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1006a7a69: lea rdi, [rip + 0x4f256b] ; 0x100b99fdb matIdx != (typeof( matToIdxMap[0] ))(-1)
0x1006a7a70: lea rsi, [rip + 0x4f1f6a] ; 0x100b999e1 TerrainBarn.cpp
0x1006a7a77: mov edx, 0x9e
0x1006a7a7c: mov ecx, 3
0x1006a7a81: call 0x1007e5f70 ; 0x1007e5f70
0x1006a7a86: ud2 
0x1006a7a88: lea rdi, [rip + 0x4f2507] ; 0x100b99f96 srcIndices != dstIndices
0x1006a7a8f: lea rsi, [rip + 0x4f1f4b] ; 0x100b999e1 TerrainBarn.cpp
0x1006a7a96: mov edx, 0x7d
0x1006a7a9b: mov ecx, 3
0x1006a7aa0: call 0x1007e5f70 ; 0x1007e5f70
0x1006a7aa5: ud2 
0x1006a7aa7: lea rdi, [rip + 0x4f2501] ; 0x100b99faf surfaceCount <= sizeof( scatterMap[0] ) * 8
0x1006a7aae: lea rsi, [rip + 0x4f1f2c] ; 0x100b999e1 TerrainBarn.cpp
0x1006a7ab5: mov edx, 0x88
0x1006a7aba: mov ecx, 3
0x1006a7abf: call 0x1007e5f70 ; 0x1007e5f70
0x1006a7ac4: jmp 0x1006a7a86 ; 0x1006a7a86
0x1006a7ac6: jmp 0x1006a7ac8 ; 0x1006a7ac8
0x1006a7ac8: mov rbx, rax
0x1006a7acb: call 0x1007c6c20 ; 0x1007c6c20
0x1006a7ad0: mov rdi, rax
0x1006a7ad3: mov rsi, qword ptr [rbp - 0x440]
0x1006a7ada: call 0x100795a70 ; 0x100795a70
0x1006a7adf: jmp 0x1006a7b04 ; 0x1006a7b04
0x1006a7ae1: mov rdi, rax
0x1006a7ae4: call 0x100011bf0 ; 0x100011bf0
0x1006a7ae9: mov rdi, rax
0x1006a7aec: call 0x100011bf0 ; 0x100011bf0
0x1006a7af1: mov rdi, rax
0x1006a7af4: call 0x100011bf0 ; 0x100011bf0
0x1006a7af9: mov rdi, rax
0x1006a7afc: call 0x100011bf0 ; 0x100011bf0
0x1006a7b01: mov rbx, rax
0x1006a7b04: call 0x1007c6c20 ; 0x1007c6c20
0x1006a7b09: mov rdi, rax
0x1006a7b0c: mov rsi, r13
0x1006a7b0f: call 0x100795a70 ; 0x100795a70
0x1006a7b14: jmp 0x1006a7b21 ; 0x1006a7b21
0x1006a7b16: mov rdi, rax
0x1006a7b19: call 0x100011bf0 ; 0x100011bf0
0x1006a7b1e: mov rbx, rax
0x1006a7b21: call 0x1007c6c20 ; 0x1007c6c20
0x1006a7b26: mov rdi, rax
0x1006a7b29: mov rsi, r14
0x1006a7b2c: call 0x100795a70 ; 0x100795a70
0x1006a7b31: mov rdi, rbx
0x1006a7b34: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006a7b39: mov rdi, rax
0x1006a7b3c: call 0x100011bf0 ; 0x100011bf0
0x1006a7b41: nop word ptr cs:[rax + rax]
