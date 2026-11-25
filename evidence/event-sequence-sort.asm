0x1003315d0: push rbp
0x1003315d1: mov rbp, rsp
0x1003315d4: push r15
0x1003315d6: push r14
0x1003315d8: push r13
0x1003315da: push r12
0x1003315dc: push rbx
0x1003315dd: sub rsp, 0x18
0x1003315e1: mov r12, rdi
0x1003315e4: jmp 0x100331600 ; 0x100331600
0x1003315e6: lea rdi, [r15 + 8]
0x1003315ea: call 0x1003315d0 ; 0x1003315d0
0x1003315ef: mov rsi, r15
0x1003315f2: nop word ptr cs:[rax + rax]
0x100331600: lea r10, [rsi - 8]
0x100331604: mov qword ptr [rbp - 0x38], rsi
0x100331608: lea rax, [rsi - 0x10]
0x10033160c: mov qword ptr [rbp - 0x40], rax
0x100331610: mov r14, r12
0x100331613: mov qword ptr [rbp - 0x30], r10
0x100331617: jmp 0x100331630 ; 0x100331630
0x100331619: mov rdi, r12
0x10033161c: mov rsi, r15
0x10033161f: call 0x1003315d0 ; 0x1003315d0
0x100331624: mov r10, qword ptr [rbp - 0x30]
0x100331628: add r15, 8
0x10033162c: mov r14, r15
0x10033162f: nop 
0x100331630: mov r12, r14
0x100331633: mov r9, qword ptr [rbp - 0x38]
0x100331637: mov rcx, r9
0x10033163a: sub rcx, r12
0x10033163d: mov rax, rcx
0x100331640: sar rax, 3
0x100331644: cmp rax, 5
0x100331648: jbe 0x100331a2b
0x10033164e: cmp rcx, 0xf7
0x100331655: jle 0x100331a60
0x10033165b: mov rdx, rax
0x10033165e: shr rdx, 0x3f
0x100331662: add rdx, rax
0x100331665: movabs rsi, 0x3ffffffffffffffe
0x10033166f: and rdx, rsi
0x100331672: lea r13, [r12 + rdx*4]
0x100331676: cmp rcx, 0x1f39
0x10033167d: jl 0x100331740
0x100331683: mov r14, rax
0x100331686: sar r14, 0x3f
0x10033168a: shr r14, 0x3e
0x10033168e: add r14, rax
0x100331691: add r14, r14
0x100331694: and r14, 0xfffffffffffffff8
0x100331698: lea r15, [r12 + r14]
0x10033169c: lea rbx, [r13 + r14]
0x1003316a1: mov rdi, r12
0x1003316a4: mov rsi, r15
0x1003316a7: mov rdx, r13
0x1003316aa: mov rcx, rbx
0x1003316ad: call 0x100331ce0 ; 0x100331ce0
0x1003316b2: mov r10, qword ptr [rbp - 0x30]
0x1003316b6: mov rcx, qword ptr [r10]
0x1003316b9: mov rdx, qword ptr [r13 + r14]
0x1003316be: mov rsi, qword ptr [rcx]
0x1003316c1: mov rdi, qword ptr [rdx]
0x1003316c4: mov esi, dword ptr [rsi + 0x10]
0x1003316c7: cmp esi, dword ptr [rdi + 0x10]
0x1003316ca: jae 0x1003317f0
0x1003316d0: mov qword ptr [rbx], rcx
0x1003316d3: mov qword ptr [r10], rdx
0x1003316d6: mov rcx, qword ptr [rbx]
0x1003316d9: mov rdx, qword ptr [r13]
0x1003316dd: mov rsi, qword ptr [rcx]
0x1003316e0: mov rdi, qword ptr [rdx]
0x1003316e3: mov esi, dword ptr [rsi + 0x10]
0x1003316e6: cmp esi, dword ptr [rdi + 0x10]
0x1003316e9: jae 0x1003317b2
0x1003316ef: mov qword ptr [r13], rcx
0x1003316f3: mov qword ptr [rbx], rdx
0x1003316f6: mov rcx, qword ptr [r13]
0x1003316fa: mov rdx, qword ptr [r15]
0x1003316fd: mov rsi, qword ptr [rcx]
0x100331700: mov rdi, qword ptr [rdx]
0x100331703: mov esi, dword ptr [rsi + 0x10]
0x100331706: cmp esi, dword ptr [rdi + 0x10]
0x100331709: jae 0x1003317e2
0x10033170f: mov qword ptr [r15], rcx
0x100331712: mov qword ptr [r13], rdx
0x100331716: mov rcx, qword ptr [r15]
0x100331719: mov rdx, qword ptr [r12]
0x10033171d: mov rsi, qword ptr [rcx]
0x100331720: mov rdi, qword ptr [rdx]
0x100331723: mov esi, dword ptr [rsi + 0x10]
0x100331726: cmp esi, dword ptr [rdi + 0x10]
0x100331729: jae 0x1003317e7
0x10033172f: mov qword ptr [r12], rcx
0x100331733: mov qword ptr [r15], rdx
0x100331736: add eax, 4
0x100331739: jmp 0x1003317f0 ; 0x1003317f0
0x10033173e: nop 
0x100331740: mov r8, qword ptr [r13]
0x100331744: mov rcx, qword ptr [r12]
0x100331748: mov rax, qword ptr [r8]
0x10033174b: mov rdx, qword ptr [rcx]
0x10033174e: mov edi, dword ptr [rax + 0x10]
0x100331751: mov rsi, qword ptr [r10]
0x100331754: mov rax, qword ptr [rsi]
0x100331757: mov ebx, dword ptr [rax + 0x10]
0x10033175a: cmp edi, dword ptr [rdx + 0x10]
0x10033175d: jae 0x100331780
0x10033175f: cmp ebx, edi
0x100331761: jae 0x1003317b6
0x100331763: mov qword ptr [r12], rsi
0x100331767: mov qword ptr [r10], rcx
0x10033176a: mov eax, 1
0x10033176f: jmp 0x1003317f0 ; 0x1003317f0
0x100331771: nop word ptr cs:[rax + rax]
0x100331780: xor eax, eax
0x100331782: cmp ebx, edi
0x100331784: jae 0x1003317f0
0x100331786: mov qword ptr [r13], rsi
0x10033178a: mov qword ptr [r10], r8
0x10033178d: mov rcx, qword ptr [r13]
0x100331791: mov rdx, qword ptr [r12]
0x100331795: mov rax, qword ptr [rcx]
0x100331798: mov rsi, qword ptr [rdx]
0x10033179b: mov edi, dword ptr [rax + 0x10]
0x10033179e: mov eax, 1
0x1003317a3: cmp edi, dword ptr [rsi + 0x10]
0x1003317a6: jae 0x1003317f0
0x1003317a8: mov qword ptr [r12], rcx
0x1003317ac: mov qword ptr [r13], rdx
0x1003317b0: jmp 0x1003317db ; 0x1003317db
0x1003317b2: inc eax
0x1003317b4: jmp 0x1003317f0 ; 0x1003317f0
0x1003317b6: mov qword ptr [r12], r8
0x1003317ba: mov qword ptr [r13], rcx
0x1003317be: mov rdx, qword ptr [r10]
0x1003317c1: mov rax, qword ptr [rdx]
0x1003317c4: mov rsi, qword ptr [rcx]
0x1003317c7: mov edi, dword ptr [rax + 0x10]
0x1003317ca: mov eax, 1
0x1003317cf: cmp edi, dword ptr [rsi + 0x10]
0x1003317d2: jae 0x1003317f0
0x1003317d4: mov qword ptr [r13], rdx
0x1003317d8: mov qword ptr [r10], rcx
0x1003317db: mov eax, 2
0x1003317e0: jmp 0x1003317f0 ; 0x1003317f0
0x1003317e2: add eax, 2
0x1003317e5: jmp 0x1003317f0 ; 0x1003317f0
0x1003317e7: add eax, 3
0x1003317ea: nop word ptr [rax + rax]
0x1003317f0: mov r8, qword ptr [r12]
0x1003317f4: mov rcx, qword ptr [r13]
0x1003317f8: mov rdx, qword ptr [r8]
0x1003317fb: mov rcx, qword ptr [rcx]
0x1003317fe: mov edx, dword ptr [rdx + 0x10]
0x100331801: mov edi, dword ptr [rcx + 0x10]
0x100331804: cmp edx, edi
0x100331806: jae 0x100331830
0x100331808: mov rcx, r10
0x10033180b: lea r15, [r12 + 8]
0x100331810: cmp r15, rcx
0x100331813: jb 0x1003318cf
0x100331819: cmp r15, r13
0x10033181c: jne 0x10033192e
0x100331822: jmp 0x10033194c ; 0x10033194c
0x100331827: nop word ptr [rax + rax]
0x100331830: mov rsi, qword ptr [rbp - 0x40]
0x100331834: mov rcx, rsi
0x100331837: cmp r12, rsi
0x10033183a: mov r9, qword ptr [rbp - 0x38]
0x10033183e: je 0x100331854
0x100331840: mov rbx, qword ptr [rcx]
0x100331843: mov rsi, qword ptr [rbx]
0x100331846: cmp dword ptr [rsi + 0x10], edi
0x100331849: jb 0x10033189e
0x10033184b: add rcx, -8
0x10033184f: cmp r12, rcx
0x100331852: jne 0x100331840
0x100331854: lea rax, [r12 + 8]
0x100331859: mov rcx, qword ptr [r10]
0x10033185c: mov rsi, qword ptr [rcx]
0x10033185f: cmp edx, dword ptr [rsi + 0x10]
0x100331862: jb 0x1003319a8
0x100331868: cmp rax, r10
0x10033186b: je 0x100331cb0
0x100331871: lea rax, [r12 + 0x10]
0x100331876: nop word ptr cs:[rax + rax]
0x100331880: mov rsi, qword ptr [rax - 8]
0x100331884: mov rdi, qword ptr [rsi]
0x100331887: cmp edx, dword ptr [rdi + 0x10]
0x10033188a: jb 0x1003319a1
0x100331890: add rax, 8
0x100331894: cmp r9, rax
0x100331897: jne 0x100331880
0x100331899: jmp 0x100331cb0 ; 0x100331cb0
0x10033189e: mov qword ptr [r12], rbx
0x1003318a2: mov qword ptr [rcx], r8
0x1003318a5: inc eax
0x1003318a7: lea r15, [r12 + 8]
0x1003318ac: cmp r15, rcx
0x1003318af: jb 0x1003318cf
0x1003318b1: jmp 0x100331819 ; 0x100331819
0x1003318b6: nop word ptr cs:[rax + rax]
0x1003318c0: mov qword ptr [rdx], rbx
0x1003318c3: mov qword ptr [rcx], rdi
0x1003318c6: inc eax
0x1003318c8: cmp r13, rdx
0x1003318cb: cmove r13, rcx
0x1003318cf: mov rdx, qword ptr [r13]
0x1003318d3: mov rdx, qword ptr [rdx]
0x1003318d6: mov r8d, dword ptr [rdx + 0x10]
0x1003318da: add r15, -8
0x1003318de: mov rdx, r15
0x1003318e1: nop word ptr cs:[rax + rax]
0x1003318f0: mov rdi, qword ptr [rdx + 8]
0x1003318f4: add rdx, 8
0x1003318f8: mov rbx, qword ptr [rdi]
0x1003318fb: cmp dword ptr [rbx + 0x10], r8d
0x1003318ff: jb 0x1003318f0
0x100331901: lea r15, [rdx + 8]
0x100331905: nop word ptr cs:[rax + rax]
0x100331910: mov rbx, qword ptr [rcx - 8]
0x100331914: add rcx, -8
0x100331918: mov rsi, qword ptr [rbx]
0x10033191b: cmp dword ptr [rsi + 0x10], r8d
0x10033191f: jae 0x100331910
0x100331921: cmp rdx, rcx
0x100331924: jbe 0x1003318c0
0x100331926: mov r15, rdx
0x100331929: cmp r15, r13
0x10033192c: je 0x10033194c
0x10033192e: mov rcx, qword ptr [r13]
0x100331932: mov rdx, qword ptr [r15]
0x100331935: mov rsi, qword ptr [rcx]
0x100331938: mov rdi, qword ptr [rdx]
0x10033193b: mov esi, dword ptr [rsi + 0x10]
0x10033193e: cmp esi, dword ptr [rdi + 0x10]
0x100331941: jae 0x10033194c
0x100331943: mov qword ptr [r15], rcx
0x100331946: mov qword ptr [r13], rdx
0x10033194a: inc eax
0x10033194c: test eax, eax
0x10033194e: jne 0x100331983
0x100331950: mov rdi, r12
0x100331953: mov rsi, r15
0x100331956: call 0x100331de0 ; 0x100331de0
0x10033195b: mov r13d, eax
0x10033195e: lea r14, [r15 + 8]
0x100331962: mov rdi, r14
0x100331965: mov rsi, qword ptr [rbp - 0x38]
0x100331969: call 0x100331de0 ; 0x100331de0
0x10033196e: test al, al
0x100331970: jne 0x100331a1a
0x100331976: test r13b, r13b
0x100331979: mov r10, qword ptr [rbp - 0x30]
0x10033197d: jne 0x100331630
0x100331983: mov rax, r15
0x100331986: sub rax, r12
0x100331989: mov rsi, qword ptr [rbp - 0x38]
0x10033198d: mov rcx, rsi
0x100331990: sub rcx, r15
0x100331993: cmp rax, rcx
0x100331996: jl 0x100331619
0x10033199c: jmp 0x1003315e6 ; 0x1003315e6
0x1003319a1: mov qword ptr [rax - 8], rcx
0x1003319a5: mov qword ptr [r10], rsi
0x1003319a8: cmp rax, r10
0x1003319ab: je 0x100331cb0
0x1003319b1: mov rcx, r10
0x1003319b4: jmp 0x1003319c7 ; 0x1003319c7
0x1003319b6: nop word ptr cs:[rax + rax]
0x1003319c0: mov qword ptr [rax - 8], rdi
0x1003319c4: mov qword ptr [rcx], rdx
0x1003319c7: mov rdx, qword ptr [r12]
0x1003319cb: mov rdx, qword ptr [rdx]
0x1003319ce: mov esi, dword ptr [rdx + 0x10]
0x1003319d1: nop word ptr cs:[rax + rax]
0x1003319e0: mov rdx, qword ptr [rax]
0x1003319e3: mov rdi, qword ptr [rdx]
0x1003319e6: add rax, 8
0x1003319ea: cmp esi, dword ptr [rdi + 0x10]
0x1003319ed: jae 0x1003319e0
0x1003319ef: lea r14, [rax - 8]
0x1003319f3: nop word ptr cs:[rax + rax]
0x100331a00: mov rdi, qword ptr [rcx - 8]
0x100331a04: add rcx, -8
0x100331a08: mov rbx, qword ptr [rdi]
0x100331a0b: cmp esi, dword ptr [rbx + 0x10]
0x100331a0e: jb 0x100331a00
0x100331a10: cmp r14, rcx
0x100331a13: jb 0x1003319c0
0x100331a15: jmp 0x100331630 ; 0x100331630
0x100331a1a: mov rsi, r15
0x100331a1d: test r13b, r13b
0x100331a20: je 0x100331600
0x100331a26: jmp 0x100331cb0 ; 0x100331cb0
0x100331a2b: lea rcx, [rip + 0x28e] ; 0x100331cc0
0x100331a32: movsxd rax, dword ptr [rcx + rax*4]
0x100331a36: add rax, rcx
0x100331a39: jmp rax
0x100331a3b: mov rax, qword ptr [r10]
0x100331a3e: mov rcx, qword ptr [r12]
0x100331a42: mov rdx, qword ptr [rax]
0x100331a45: mov rsi, qword ptr [rcx]
0x100331a48: mov edx, dword ptr [rdx + 0x10]
0x100331a4b: cmp edx, dword ptr [rsi + 0x10]
0x100331a4e: jae 0x100331cb0
0x100331a54: mov qword ptr [r12], rax
0x100331a58: mov qword ptr [r10], rcx
0x100331a5b: jmp 0x100331cb0 ; 0x100331cb0
0x100331a60: mov rcx, qword ptr [r12]
0x100331a64: mov rax, qword ptr [r12 + 8]
0x100331a69: mov rdx, qword ptr [rax]
0x100331a6c: mov rbx, qword ptr [rcx]
0x100331a6f: mov esi, dword ptr [rdx + 0x10]
0x100331a72: mov rdx, qword ptr [r12 + 0x10]
0x100331a77: mov rdi, qword ptr [rdx]
0x100331a7a: mov edi, dword ptr [rdi + 0x10]
0x100331a7d: cmp esi, dword ptr [rbx + 0x10]
0x100331a80: jae 0x100331a8c
0x100331a82: cmp edi, esi
0x100331a84: jae 0x100331ac0
0x100331a86: mov qword ptr [r12], rdx
0x100331a8a: jmp 0x100331adc ; 0x100331adc
0x100331a8c: cmp edi, esi
0x100331a8e: jae 0x100331af3
0x100331a90: mov qword ptr [r12 + 8], rdx
0x100331a95: mov qword ptr [r12 + 0x10], rax
0x100331a9a: mov rsi, qword ptr [rdx]
0x100331a9d: mov rdi, qword ptr [rcx]
0x100331aa0: mov esi, dword ptr [rsi + 0x10]
0x100331aa3: cmp esi, dword ptr [rdi + 0x10]
0x100331aa6: jae 0x100331ae4
0x100331aa8: mov qword ptr [r12], rdx
0x100331aac: mov qword ptr [r12 + 8], rcx
0x100331ab1: lea rdx, [r12 + 0x18]
0x100331ab6: cmp rdx, r9
0x100331ab9: jne 0x100331b04
0x100331abb: jmp 0x100331cb0 ; 0x100331cb0
0x100331ac0: mov qword ptr [r12], rax
0x100331ac4: mov qword ptr [r12 + 8], rcx
0x100331ac9: mov rax, qword ptr [rdx]
0x100331acc: mov rsi, qword ptr [rcx]
0x100331acf: mov eax, dword ptr [rax + 0x10]
0x100331ad2: cmp eax, dword ptr [rsi + 0x10]
0x100331ad5: jae 0x100331af3
0x100331ad7: mov qword ptr [r12 + 8], rdx
0x100331adc: mov qword ptr [r12 + 0x10], rcx
0x100331ae1: mov rax, rcx
0x100331ae4: lea rdx, [r12 + 0x18]
0x100331ae9: cmp rdx, r9
0x100331aec: jne 0x100331b04
0x100331aee: jmp 0x100331cb0 ; 0x100331cb0
0x100331af3: mov rax, rdx
0x100331af6: lea rdx, [r12 + 0x18]
0x100331afb: cmp rdx, r9
0x100331afe: je 0x100331cb0
0x100331b04: mov r8d, 0x10
0x100331b0a: jmp 0x100331b2b ; 0x100331b2b
0x100331b0c: nop dword ptr [rax]
0x100331b10: mov qword ptr [r12 + rax], rsi
0x100331b14: lea rsi, [rdx + 8]
0x100331b18: cmp rsi, r9
0x100331b1b: je 0x100331cb0
0x100331b21: mov rax, qword ptr [rdx]
0x100331b24: add r8, 8
0x100331b28: mov rdx, rsi
0x100331b2b: mov rsi, qword ptr [rdx]
0x100331b2e: mov rdi, qword ptr [rsi]
0x100331b31: mov rax, qword ptr [rax]
0x100331b34: mov edi, dword ptr [rdi + 0x10]
0x100331b37: cmp edi, dword ptr [rax + 0x10]
0x100331b3a: jae 0x100331b14
0x100331b3c: mov rdi, r8
0x100331b3f: nop 
0x100331b40: mov rax, rdi
0x100331b43: mov rdi, qword ptr [r12 + rax]
0x100331b47: mov qword ptr [r12 + rax + 8], rdi
0x100331b4c: test rax, rax
0x100331b4f: je 0x100331b10
0x100331b51: mov rdi, qword ptr [r12 + rax - 8]
0x100331b56: mov rbx, qword ptr [rsi]
0x100331b59: mov rcx, qword ptr [rdi]
0x100331b5c: mov ebx, dword ptr [rbx + 0x10]
0x100331b5f: lea rdi, [rax - 8]
0x100331b63: cmp ebx, dword ptr [rcx + 0x10]
0x100331b66: jb 0x100331b40
0x100331b68: jmp 0x100331b10 ; 0x100331b10
0x100331b6a: mov rax, qword ptr [r12]
0x100331b6e: mov rcx, qword ptr [r12 + 8]
0x100331b73: mov rdx, qword ptr [rcx]
0x100331b76: mov rbx, qword ptr [rax]
0x100331b79: mov esi, dword ptr [rdx + 0x10]
0x100331b7c: mov rdx, qword ptr [r10]
0x100331b7f: mov rdi, qword ptr [rdx]
0x100331b82: mov edi, dword ptr [rdi + 0x10]
0x100331b85: cmp esi, dword ptr [rbx + 0x10]
0x100331b88: jae 0x100331c60
0x100331b8e: cmp edi, esi
0x100331b90: jae 0x100331c8e
0x100331b96: mov qword ptr [r12], rdx
0x100331b9a: jmp 0x100331cad ; 0x100331cad
0x100331b9f: lea r14, [r12 + 8]
0x100331ba4: lea r15, [r12 + 0x10]
0x100331ba9: lea rbx, [r12 + 0x18]
0x100331bae: mov rdi, r12
0x100331bb1: mov rsi, r14
0x100331bb4: mov rdx, r15
0x100331bb7: mov rcx, rbx
0x100331bba: call 0x100331ce0 ; 0x100331ce0
0x100331bbf: mov rdi, qword ptr [rbp - 0x30]
0x100331bc3: mov rax, qword ptr [rdi]
0x100331bc6: mov rcx, qword ptr [r12 + 0x18]
0x100331bcb: mov rdx, qword ptr [rax]
0x100331bce: mov rsi, qword ptr [rcx]
0x100331bd1: mov edx, dword ptr [rdx + 0x10]
0x100331bd4: cmp edx, dword ptr [rsi + 0x10]
0x100331bd7: jae 0x100331cb0
0x100331bdd: mov qword ptr [rbx], rax
0x100331be0: mov qword ptr [rdi], rcx
0x100331be3: mov rax, qword ptr [rbx]
0x100331be6: mov rcx, qword ptr [r15]
0x100331be9: mov rdx, qword ptr [rax]
0x100331bec: mov rsi, qword ptr [rcx]
0x100331bef: mov edx, dword ptr [rdx + 0x10]
0x100331bf2: cmp edx, dword ptr [rsi + 0x10]
0x100331bf5: jae 0x100331cb0
0x100331bfb: mov qword ptr [r15], rax
0x100331bfe: mov qword ptr [rbx], rcx
0x100331c01: mov rcx, qword ptr [r14]
0x100331c04: mov rdx, qword ptr [rax]
0x100331c07: mov rsi, qword ptr [rcx]
0x100331c0a: mov edx, dword ptr [rdx + 0x10]
0x100331c0d: cmp edx, dword ptr [rsi + 0x10]
0x100331c10: jae 0x100331cb0
0x100331c16: mov qword ptr [r12 + 8], rax
0x100331c1b: mov qword ptr [r12 + 0x10], rcx
0x100331c20: mov rcx, qword ptr [r12]
0x100331c24: mov rdx, qword ptr [rax]
0x100331c27: mov rsi, qword ptr [rcx]
0x100331c2a: mov edx, dword ptr [rdx + 0x10]
0x100331c2d: cmp edx, dword ptr [rsi + 0x10]
0x100331c30: jae 0x100331cb0
0x100331c32: mov qword ptr [r12], rax
0x100331c36: mov qword ptr [r12 + 8], rcx
0x100331c3b: jmp 0x100331cb0 ; 0x100331cb0
0x100331c3d: lea rsi, [r12 + 8]
0x100331c42: lea rdx, [r12 + 0x10]
0x100331c47: mov rdi, r12
0x100331c4a: mov rcx, r10
0x100331c4d: add rsp, 0x18
0x100331c51: pop rbx
0x100331c52: pop r12
0x100331c54: pop r13
0x100331c56: pop r14
0x100331c58: pop r15
0x100331c5a: pop rbp
0x100331c5b: jmp 0x100331ce0 ; 0x100331ce0
0x100331c60: cmp edi, esi
0x100331c62: jae 0x100331cb0
0x100331c64: mov qword ptr [r12 + 8], rdx
0x100331c69: mov qword ptr [r10], rcx
0x100331c6c: mov rax, qword ptr [r12]
0x100331c70: mov rcx, qword ptr [r12 + 8]
0x100331c75: mov rdx, qword ptr [rcx]
0x100331c78: mov rsi, qword ptr [rax]
0x100331c7b: mov edx, dword ptr [rdx + 0x10]
0x100331c7e: cmp edx, dword ptr [rsi + 0x10]
0x100331c81: jae 0x100331cb0
0x100331c83: mov qword ptr [r12], rcx
0x100331c87: mov qword ptr [r12 + 8], rax
0x100331c8c: jmp 0x100331cb0 ; 0x100331cb0
0x100331c8e: mov qword ptr [r12], rcx
0x100331c92: mov qword ptr [r12 + 8], rax
0x100331c97: mov rcx, qword ptr [r10]
0x100331c9a: mov rdx, qword ptr [rcx]
0x100331c9d: mov rsi, qword ptr [rax]
0x100331ca0: mov edx, dword ptr [rdx + 0x10]
0x100331ca3: cmp edx, dword ptr [rsi + 0x10]
0x100331ca6: jae 0x100331cb0
0x100331ca8: mov qword ptr [r12 + 8], rcx
0x100331cad: mov qword ptr [r10], rax
0x100331cb0: add rsp, 0x18
0x100331cb4: pop rbx
0x100331cb5: pop r12
0x100331cb7: pop r13
0x100331cb9: pop r14
0x100331cbb: pop r15
0x100331cbd: pop rbp
0x100331cbe: ret 
0x100331cbf: nop 
