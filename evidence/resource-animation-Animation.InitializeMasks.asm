0x100094550: push rbp
0x100094551: mov rbp, rsp
0x100094554: push r15
0x100094556: push r14
0x100094558: push r13
0x10009455a: push r12
0x10009455c: push rbx
0x10009455d: sub rsp, 0x38
0x100094561: mov r13, rdi
0x100094564: lea rdi, [rip + 0xc8e965] ; 0x100d22ed0
0x10009456b: lea rsi, [rip + 0xa130ee] ; 0x100aa7660
0x100094572: mov edx, 0x400
0x100094577: call 0x100aa2906 ; 0x100aa2906 _memset_pattern16
0x10009457c: cmp byte ptr [r13 + 0x5830], 0
0x100094584: je 0x1000948e3
0x10009458a: lea rdi, [rip + 0xc8ed3f] ; 0x100d232d0
0x100094591: lea rsi, [rip + 0xa130c8] ; 0x100aa7660
0x100094598: mov edx, 0x400
0x10009459d: call 0x100aa2906 ; 0x100aa2906 _memset_pattern16
0x1000945a2: mov eax, dword ptr [r13 + 0x5810]
0x1000945a9: mov qword ptr [rbp - 0x38], rax
0x1000945ad: mov rax, qword ptr [r13 + 0x6018]
0x1000945b4: mov qword ptr [rbp - 0x40], rax
0x1000945b8: movsxd r15, dword ptr [rax + 0x54]
0x1000945bc: mov eax, r15d
0x1000945bf: mov qword ptr [rbp - 0x60], rax
0x1000945c3: lea rax, [r13 + r15*2 + 0x5610]
0x1000945cb: mov qword ptr [rbp - 0x50], rax
0x1000945cf: lea r13, [r13 + 0x5610]
0x1000945d6: add r15, r15
0x1000945d9: sar r15, 1
0x1000945dc: mov qword ptr [rbp - 0x30], r13
0x1000945e0: je 0x100094678
0x1000945e6: mov rax, qword ptr [rbp - 0x40]
0x1000945ea: mov rcx, qword ptr [rax + 0x60]
0x1000945ee: mov rax, qword ptr [rbp - 0x38]
0x1000945f2: mov qword ptr [rbp - 0x58], rcx
0x1000945f6: lea rax, [rcx + rax + 0x4400]
0x1000945fe: mov qword ptr [rbp - 0x48], rax
0x100094602: mov r13, qword ptr [rbp - 0x30]
0x100094606: mov rbx, r15
0x100094609: mov r12, rbx
0x10009460c: nop dword ptr [rax]
0x100094610: shr r12, 0x3f
0x100094614: add r12, rbx
0x100094617: mov r14, r12
0x10009461a: and r14, 0xfffffffffffffffe
0x10009461e: movzx eax, word ptr [r13 + r14]
0x100094624: mov rsi, qword ptr [rbp - 0x48]
0x100094628: lea rdi, [rip + 0xad104e] ; 0x100b6567d L_legRoot
0x10009462f: cmp rax, 0x100
0x100094635: je 0x10009464a
0x100094637: imul rdi, rax, 0x44
0x10009463b: add rdi, qword ptr [rbp - 0x58]
0x10009463f: add rdi, qword ptr [rbp - 0x38]
0x100094643: lea rsi, [rip + 0xad1033] ; 0x100b6567d L_legRoot
0x10009464a: sar r12, 1
0x10009464d: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x100094652: test eax, eax
0x100094654: jns 0x100094670
0x100094656: dec rbx
0x100094659: sub rbx, r12
0x10009465c: lea r13, [r13 + r14 + 2]
0x100094661: mov r12, rbx
0x100094664: test r12, r12
0x100094667: jne 0x100094610
0x100094669: jmp 0x100094678 ; 0x100094678
0x10009466b: nop dword ptr [rax + rax]
0x100094670: mov rbx, r12
0x100094673: test r12, r12
0x100094676: jne 0x100094610
0x100094678: cmp r13, qword ptr [rbp - 0x50]
0x10009467c: lea rdi, [rip + 0xc8ec4d] ; 0x100d232d0
0x100094683: mov rbx, qword ptr [rbp - 0x60]
0x100094687: je 0x100094704
0x100094689: mov rax, qword ptr [rbp - 0x40]
0x10009468d: mov rax, qword ptr [rax + 0x60]
0x100094691: movzx ecx, word ptr [r13]
0x100094696: mov dword ptr [rdi + rcx*4], 0
0x10009469d: test ebx, ebx
0x10009469f: jle 0x100094704
0x1000946a1: xor ecx, ecx
0x1000946a3: vxorps xmm0, xmm0, xmm0
0x1000946a7: xor edx, edx
0x1000946a9: nop dword ptr [rax]
0x1000946b0: imul rsi, rcx, 0x44
0x1000946b4: movsxd rsi, dword ptr [rax + rsi + 0x40]
0x1000946b9: cmp rsi, 2
0x1000946bd: jl 0x1000946f0
0x1000946bf: vmovss xmm1, dword ptr [rdi + rsi*4 - 4]
0x1000946c5: vucomiss xmm1, xmm0
0x1000946c9: jne 0x1000946f0
0x1000946cb: jp 0x1000946f0
0x1000946cd: vmovss xmm1, dword ptr [rdi + rcx*4]
0x1000946d2: vucomiss xmm1, xmm0
0x1000946d6: jne 0x1000946da
0x1000946d8: jnp 0x1000946f0
0x1000946da: mov dword ptr [rdi + rcx*4], 0
0x1000946e1: mov dl, 1
0x1000946e3: nop word ptr cs:[rax + rax]
0x1000946f0: inc rcx
0x1000946f3: cmp rcx, rbx
0x1000946f6: jne 0x1000946b0
0x1000946f8: xor ecx, ecx
0x1000946fa: test dl, 1
0x1000946fd: mov edx, 0
0x100094702: jne 0x1000946b0
0x100094704: mov r12, qword ptr [rbp - 0x30]
0x100094708: test r15, r15
0x10009470b: je 0x1000947a8
0x100094711: mov rax, qword ptr [rbp - 0x40]
0x100094715: mov rcx, qword ptr [rax + 0x60]
0x100094719: mov rax, qword ptr [rbp - 0x38]
0x10009471d: mov qword ptr [rbp - 0x58], rcx
0x100094721: lea rax, [rcx + rax + 0x4400]
0x100094729: mov qword ptr [rbp - 0x48], rax
0x10009472d: mov r12, qword ptr [rbp - 0x30]
0x100094731: mov r13, r15
0x100094734: mov rbx, r13
0x100094737: nop word ptr [rax + rax]
0x100094740: shr rbx, 0x3f
0x100094744: add rbx, r13
0x100094747: mov r14, rbx
0x10009474a: and r14, 0xfffffffffffffffe
0x10009474e: movzx eax, word ptr [r12 + r14]
0x100094753: mov rsi, qword ptr [rbp - 0x48]
0x100094757: lea rdi, [rip + 0xad102f] ; 0x100b6578d R_legRoot
0x10009475e: cmp rax, 0x100
0x100094764: je 0x100094779
0x100094766: imul rdi, rax, 0x44
0x10009476a: add rdi, qword ptr [rbp - 0x58]
0x10009476e: add rdi, qword ptr [rbp - 0x38]
0x100094772: lea rsi, [rip + 0xad1014] ; 0x100b6578d R_legRoot
0x100094779: sar rbx, 1
0x10009477c: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x100094781: test eax, eax
0x100094783: jns 0x1000947a0
0x100094785: dec r13
0x100094788: sub r13, rbx
0x10009478b: lea r12, [r12 + r14 + 2]
0x100094790: mov rbx, r13
0x100094793: test rbx, rbx
0x100094796: jne 0x100094740
0x100094798: jmp 0x1000947a8 ; 0x1000947a8
0x10009479a: nop word ptr [rax + rax]
0x1000947a0: mov r13, rbx
0x1000947a3: test rbx, rbx
0x1000947a6: jne 0x100094740
0x1000947a8: cmp r12, qword ptr [rbp - 0x50]
0x1000947ac: lea rdi, [rip + 0xc8eb1d] ; 0x100d232d0
0x1000947b3: mov rbx, qword ptr [rbp - 0x60]
0x1000947b7: je 0x100094834
0x1000947b9: mov rax, qword ptr [rbp - 0x40]
0x1000947bd: mov rax, qword ptr [rax + 0x60]
0x1000947c1: movzx ecx, word ptr [r12]
0x1000947c6: mov dword ptr [rdi + rcx*4], 0
0x1000947cd: test ebx, ebx
0x1000947cf: jle 0x100094834
0x1000947d1: xor ecx, ecx
0x1000947d3: vxorps xmm0, xmm0, xmm0
0x1000947d7: xor edx, edx
0x1000947d9: nop dword ptr [rax]
0x1000947e0: imul rsi, rcx, 0x44
0x1000947e4: movsxd rsi, dword ptr [rax + rsi + 0x40]
0x1000947e9: cmp rsi, 2
0x1000947ed: jl 0x100094820
0x1000947ef: vmovss xmm1, dword ptr [rdi + rsi*4 - 4]
0x1000947f5: vucomiss xmm1, xmm0
0x1000947f9: jne 0x100094820
0x1000947fb: jp 0x100094820
0x1000947fd: vmovss xmm1, dword ptr [rdi + rcx*4]
0x100094802: vucomiss xmm1, xmm0
0x100094806: jne 0x10009480a
0x100094808: jnp 0x100094820
0x10009480a: mov dword ptr [rdi + rcx*4], 0
0x100094811: mov dl, 1
0x100094813: nop word ptr cs:[rax + rax]
0x100094820: inc rcx
0x100094823: cmp rcx, rbx
0x100094826: jne 0x1000947e0
0x100094828: xor ecx, ecx
0x10009482a: test dl, 1
0x10009482d: mov edx, 0
0x100094832: jne 0x1000947e0
0x100094834: test r15, r15
0x100094837: je 0x1000948c8
0x10009483d: mov rax, qword ptr [rbp - 0x40]
0x100094841: mov rcx, qword ptr [rax + 0x60]
0x100094845: mov rax, qword ptr [rbp - 0x38]
0x100094849: mov qword ptr [rbp - 0x48], rcx
0x10009484d: lea r13, [rcx + rax + 0x4400]
0x100094855: lea r12, [rip + 0xad0e1b] ; 0x100b65677 M_hip
0x10009485c: mov rbx, r15
0x10009485f: nop 
0x100094860: shr rbx, 0x3f
0x100094864: add rbx, r15
0x100094867: mov r14, rbx
0x10009486a: and r14, 0xfffffffffffffffe
0x10009486e: mov rax, qword ptr [rbp - 0x30]
0x100094872: movzx eax, word ptr [rax + r14]
0x100094877: mov rsi, r13
0x10009487a: mov rdi, r12
0x10009487d: cmp rax, 0x100
0x100094883: je 0x100094894
0x100094885: imul rdi, rax, 0x44
0x100094889: add rdi, qword ptr [rbp - 0x48]
0x10009488d: add rdi, qword ptr [rbp - 0x38]
0x100094891: mov rsi, r12
0x100094894: sar rbx, 1
0x100094897: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10009489c: test eax, eax
0x10009489e: jns 0x1000948c0
0x1000948a0: dec r15
0x1000948a3: sub r15, rbx
0x1000948a6: mov rax, qword ptr [rbp - 0x30]
0x1000948aa: lea rax, [rax + r14 + 2]
0x1000948af: mov qword ptr [rbp - 0x30], rax
0x1000948b3: mov rbx, r15
0x1000948b6: test rbx, rbx
0x1000948b9: jne 0x100094860
0x1000948bb: jmp 0x1000948c8 ; 0x1000948c8
0x1000948bd: nop dword ptr [rax]
0x1000948c0: mov r15, rbx
0x1000948c3: test rbx, rbx
0x1000948c6: jne 0x100094860
0x1000948c8: mov rax, qword ptr [rbp - 0x30]
0x1000948cc: cmp rax, qword ptr [rbp - 0x50]
0x1000948d0: je 0x1000948e3
0x1000948d2: movzx eax, word ptr [rax]
0x1000948d5: lea rcx, [rip + 0xc8e9f4] ; 0x100d232d0
0x1000948dc: mov dword ptr [rcx + rax*4], 0
0x1000948e3: add rsp, 0x38
0x1000948e7: pop rbx
0x1000948e8: pop r12
0x1000948ea: pop r13
0x1000948ec: pop r14
0x1000948ee: pop r15
0x1000948f0: pop rbp
0x1000948f1: ret 
0x1000948f2: nop word ptr cs:[rax + rax]
