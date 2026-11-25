0x100224290: push rbp
0x100224291: mov rbp, rsp
0x100224294: push r15
0x100224296: push r14
0x100224298: push r13
0x10022429a: push r12
0x10022429c: push rbx
0x10022429d: sub rsp, 0x28
0x1002242a1: mov r15, rsi
0x1002242a4: mov r12, rdi
0x1002242a7: movabs rdi, 0xaaaaaaaaaaaaaaab
0x1002242b1: jmp 0x1002242d0 ; 0x1002242d0
0x1002242b3: lea rdi, [r14 + 0xc]
0x1002242b7: mov rsi, r15
0x1002242ba: call 0x100224290 ; 0x100224290
0x1002242bf: movabs rdi, 0xaaaaaaaaaaaaaaab
0x1002242c9: mov r15, r14
0x1002242cc: nop dword ptr [rax]
0x1002242d0: lea r8, [r15 - 0xc]
0x1002242d4: lea rax, [r15 - 0x18]
0x1002242d8: mov qword ptr [rbp - 0x50], rax
0x1002242dc: mov rbx, r12
0x1002242df: mov qword ptr [rbp - 0x40], r8
0x1002242e3: mov qword ptr [rbp - 0x48], r15
0x1002242e7: jmp 0x100224310 ; 0x100224310
0x1002242e9: mov rdi, r12
0x1002242ec: mov rsi, r14
0x1002242ef: call 0x100224290 ; 0x100224290
0x1002242f4: movabs rdi, 0xaaaaaaaaaaaaaaab
0x1002242fe: mov r8, qword ptr [rbp - 0x40]
0x100224302: add r14, 0xc
0x100224306: mov rbx, r14
0x100224309: nop dword ptr [rax]
0x100224310: mov r12, rbx
0x100224313: mov rcx, r15
0x100224316: sub rcx, r12
0x100224319: mov rax, rcx
0x10022431c: sar rax, 2
0x100224320: imul rax, rdi
0x100224324: cmp rax, 5
0x100224328: jbe 0x100224904
0x10022432e: cmp rcx, 0x173
0x100224335: jle 0x10022492a
0x10022433b: mov rax, rcx
0x10022433e: mul rdi
0x100224341: shr rdx, 4
0x100224345: lea rax, [rdx + rdx*2]
0x100224349: lea r13, [r12 + rax*4]
0x10022434d: cmp rcx, 0x2ed5
0x100224354: jl 0x1002244a0
0x10022435a: mov rax, rcx
0x10022435d: mul rdi
0x100224360: shr rdx, 3
0x100224364: movabs rax, 0x1ffffffffffffffc
0x10022436e: and rdx, rax
0x100224371: lea r15, [rdx + rdx*2]
0x100224375: lea rbx, [r12 + r15]
0x100224379: lea r14, [r13 + r15]
0x10022437e: mov rdi, r12
0x100224381: mov rsi, rbx
0x100224384: mov rdx, r13
0x100224387: mov rcx, r14
0x10022438a: call 0x100224d70 ; 0x100224d70
0x10022438f: mov r8, qword ptr [rbp - 0x40]
0x100224393: vmovss xmm0, dword ptr [r13 + r15]
0x10022439a: vucomiss xmm0, dword ptr [r8]
0x10022439f: jbe 0x100224500
0x1002243a5: mov ecx, dword ptr [r14 + 8]
0x1002243a9: mov dword ptr [rbp - 0x30], ecx
0x1002243ac: mov rcx, qword ptr [r14]
0x1002243af: mov qword ptr [rbp - 0x38], rcx
0x1002243b3: mov ecx, dword ptr [r8 + 8]
0x1002243b7: mov dword ptr [r14 + 8], ecx
0x1002243bb: mov rcx, qword ptr [r8]
0x1002243be: mov qword ptr [r14], rcx
0x1002243c1: mov ecx, dword ptr [rbp - 0x30]
0x1002243c4: mov dword ptr [r8 + 8], ecx
0x1002243c8: mov rcx, qword ptr [rbp - 0x38]
0x1002243cc: mov qword ptr [r8], rcx
0x1002243cf: vmovss xmm0, dword ptr [r13]
0x1002243d5: vucomiss xmm0, dword ptr [r14]
0x1002243da: mov r15, qword ptr [rbp - 0x48]
0x1002243de: movabs rdi, 0xaaaaaaaaaaaaaaab
0x1002243e8: jbe 0x10022459a
0x1002243ee: mov ecx, dword ptr [r13 + 8]
0x1002243f2: mov dword ptr [rbp - 0x30], ecx
0x1002243f5: mov rcx, qword ptr [r13]
0x1002243f9: mov qword ptr [rbp - 0x38], rcx
0x1002243fd: mov ecx, dword ptr [r14 + 8]
0x100224401: mov dword ptr [r13 + 8], ecx
0x100224405: mov rcx, qword ptr [r14]
0x100224408: mov qword ptr [r13], rcx
0x10022440c: mov ecx, dword ptr [rbp - 0x30]
0x10022440f: mov dword ptr [r14 + 8], ecx
0x100224413: mov rcx, qword ptr [rbp - 0x38]
0x100224417: mov qword ptr [r14], rcx
0x10022441a: vmovss xmm0, dword ptr [rbx]
0x10022441e: vucomiss xmm0, dword ptr [r13]
0x100224424: jbe 0x10022461c
0x10022442a: mov ecx, dword ptr [rbx + 8]
0x10022442d: mov dword ptr [rbp - 0x30], ecx
0x100224430: mov rcx, qword ptr [rbx]
0x100224433: mov qword ptr [rbp - 0x38], rcx
0x100224437: mov ecx, dword ptr [r13 + 8]
0x10022443b: mov dword ptr [rbx + 8], ecx
0x10022443e: mov rcx, qword ptr [r13]
0x100224442: mov qword ptr [rbx], rcx
0x100224445: mov ecx, dword ptr [rbp - 0x30]
0x100224448: mov dword ptr [r13 + 8], ecx
0x10022444c: mov rcx, qword ptr [rbp - 0x38]
0x100224450: mov qword ptr [r13], rcx
0x100224454: vmovss xmm0, dword ptr [r12]
0x10022445a: vucomiss xmm0, dword ptr [rbx]
0x10022445e: jbe 0x100224621
0x100224464: mov ecx, dword ptr [r12 + 8]
0x100224469: mov dword ptr [rbp - 0x30], ecx
0x10022446c: mov rcx, qword ptr [r12]
0x100224470: mov qword ptr [rbp - 0x38], rcx
0x100224474: mov ecx, dword ptr [rbx + 8]
0x100224477: mov dword ptr [r12 + 8], ecx
0x10022447c: mov rcx, qword ptr [rbx]
0x10022447f: mov qword ptr [r12], rcx
0x100224483: mov ecx, dword ptr [rbp - 0x30]
0x100224486: mov dword ptr [rbx + 8], ecx
0x100224489: mov rcx, qword ptr [rbp - 0x38]
0x10022448d: mov qword ptr [rbx], rcx
0x100224490: add eax, 4
0x100224493: jmp 0x100224630 ; 0x100224630
0x100224498: nop dword ptr [rax + rax]
0x1002244a0: vmovss xmm0, dword ptr [r13]
0x1002244a6: vmovss xmm1, dword ptr [r12]
0x1002244ac: vucomiss xmm1, xmm0
0x1002244b0: vmovss xmm1, dword ptr [r8]
0x1002244b5: jbe 0x100224520
0x1002244b7: vucomiss xmm0, xmm1
0x1002244bb: jbe 0x1002245a1
0x1002244c1: mov eax, dword ptr [r12 + 8]
0x1002244c6: mov dword ptr [rbp - 0x30], eax
0x1002244c9: mov rax, qword ptr [r12]
0x1002244cd: mov qword ptr [rbp - 0x38], rax
0x1002244d1: mov eax, dword ptr [r8 + 8]
0x1002244d5: mov dword ptr [r12 + 8], eax
0x1002244da: mov rax, qword ptr [r8]
0x1002244dd: mov qword ptr [r12], rax
0x1002244e1: mov eax, dword ptr [rbp - 0x30]
0x1002244e4: mov dword ptr [r8 + 8], eax
0x1002244e8: mov rax, qword ptr [rbp - 0x38]
0x1002244ec: mov qword ptr [r8], rax
0x1002244ef: mov eax, 1
0x1002244f4: jmp 0x100224630 ; 0x100224630
0x1002244f9: nop dword ptr [rax]
0x100224500: mov r15, qword ptr [rbp - 0x48]
0x100224504: movabs rdi, 0xaaaaaaaaaaaaaaab
0x10022450e: jmp 0x100224630 ; 0x100224630
0x100224513: nop word ptr cs:[rax + rax]
0x100224520: vucomiss xmm0, xmm1
0x100224524: jbe 0x100224611
0x10022452a: mov eax, dword ptr [r13 + 8]
0x10022452e: mov dword ptr [rbp - 0x30], eax
0x100224531: mov rax, qword ptr [r13]
0x100224535: mov qword ptr [rbp - 0x38], rax
0x100224539: mov eax, dword ptr [r8 + 8]
0x10022453d: mov dword ptr [r13 + 8], eax
0x100224541: mov rax, qword ptr [r8]
0x100224544: mov qword ptr [r13], rax
0x100224548: mov eax, dword ptr [rbp - 0x30]
0x10022454b: mov dword ptr [r8 + 8], eax
0x10022454f: mov rax, qword ptr [rbp - 0x38]
0x100224553: mov qword ptr [r8], rax
0x100224556: vmovss xmm0, dword ptr [r12]
0x10022455c: vucomiss xmm0, dword ptr [r13]
0x100224562: jbe 0x100224615
0x100224568: mov eax, dword ptr [r12 + 8]
0x10022456d: mov dword ptr [rbp - 0x30], eax
0x100224570: mov rax, qword ptr [r12]
0x100224574: mov qword ptr [rbp - 0x38], rax
0x100224578: mov eax, dword ptr [r13 + 8]
0x10022457c: mov dword ptr [r12 + 8], eax
0x100224581: mov rax, qword ptr [r13]
0x100224585: mov qword ptr [r12], rax
0x100224589: mov eax, dword ptr [rbp - 0x30]
0x10022458c: mov dword ptr [r13 + 8], eax
0x100224590: mov rax, qword ptr [rbp - 0x38]
0x100224594: mov qword ptr [r13], rax
0x100224598: jmp 0x10022460a ; 0x10022460a
0x10022459a: inc eax
0x10022459c: jmp 0x100224630 ; 0x100224630
0x1002245a1: mov eax, dword ptr [r12 + 8]
0x1002245a6: mov dword ptr [rbp - 0x30], eax
0x1002245a9: mov rax, qword ptr [r12]
0x1002245ad: mov qword ptr [rbp - 0x38], rax
0x1002245b1: mov eax, dword ptr [r13 + 8]
0x1002245b5: mov dword ptr [r12 + 8], eax
0x1002245ba: mov rax, qword ptr [r13]
0x1002245be: mov qword ptr [r12], rax
0x1002245c2: mov eax, dword ptr [rbp - 0x30]
0x1002245c5: mov dword ptr [r13 + 8], eax
0x1002245c9: mov rax, qword ptr [rbp - 0x38]
0x1002245cd: mov qword ptr [r13], rax
0x1002245d1: vmovss xmm0, dword ptr [r13]
0x1002245d7: vucomiss xmm0, dword ptr [r8]
0x1002245dc: jbe 0x100224615
0x1002245de: mov eax, dword ptr [r13 + 8]
0x1002245e2: mov dword ptr [rbp - 0x30], eax
0x1002245e5: mov rax, qword ptr [r13]
0x1002245e9: mov qword ptr [rbp - 0x38], rax
0x1002245ed: mov eax, dword ptr [r8 + 8]
0x1002245f1: mov dword ptr [r13 + 8], eax
0x1002245f5: mov rax, qword ptr [r8]
0x1002245f8: mov qword ptr [r13], rax
0x1002245fc: mov eax, dword ptr [rbp - 0x30]
0x1002245ff: mov dword ptr [r8 + 8], eax
0x100224603: mov rax, qword ptr [rbp - 0x38]
0x100224607: mov qword ptr [r8], rax
0x10022460a: mov eax, 2
0x10022460f: jmp 0x100224630 ; 0x100224630
0x100224611: xor eax, eax
0x100224613: jmp 0x100224630 ; 0x100224630
0x100224615: mov eax, 1
0x10022461a: jmp 0x100224630 ; 0x100224630
0x10022461c: add eax, 2
0x10022461f: jmp 0x100224630 ; 0x100224630
0x100224621: add eax, 3
0x100224624: nop word ptr cs:[rax + rax]
0x100224630: vmovss xmm0, dword ptr [r12]
0x100224636: vmovss xmm1, dword ptr [r13]
0x10022463c: vucomiss xmm1, xmm0
0x100224640: jbe 0x1002246b0
0x100224642: mov rcx, r8
0x100224645: lea r14, [r12 + 0xc]
0x10022464a: cmp r14, rcx
0x10022464d: jb 0x10022478f
0x100224653: cmp r14, r13
0x100224656: je 0x1002247d0
0x10022465c: vmovss xmm0, dword ptr [r14]
0x100224661: vucomiss xmm0, dword ptr [r13]
0x100224667: jbe 0x1002247d0
0x10022466d: mov ecx, dword ptr [r14 + 8]
0x100224671: mov dword ptr [rbp - 0x30], ecx
0x100224674: mov rcx, qword ptr [r14]
0x100224677: mov qword ptr [rbp - 0x38], rcx
0x10022467b: mov ecx, dword ptr [r13 + 8]
0x10022467f: mov dword ptr [r14 + 8], ecx
0x100224683: mov rcx, qword ptr [r13]
0x100224687: mov qword ptr [r14], rcx
0x10022468a: mov ecx, dword ptr [rbp - 0x30]
0x10022468d: mov dword ptr [r13 + 8], ecx
0x100224691: mov rcx, qword ptr [rbp - 0x38]
0x100224695: mov qword ptr [r13], rcx
0x100224699: inc eax
0x10022469b: test eax, eax
0x10022469d: je 0x1002247d4
0x1002246a3: jmp 0x100224810 ; 0x100224810
0x1002246a8: nop dword ptr [rax + rax]
0x1002246b0: mov rdx, qword ptr [rbp - 0x50]
0x1002246b4: mov rcx, rdx
0x1002246b7: cmp r12, rdx
0x1002246ba: je 0x1002246cf
0x1002246bc: nop dword ptr [rax]
0x1002246c0: vucomiss xmm1, dword ptr [rcx]
0x1002246c4: ja 0x10022471d
0x1002246c6: add rcx, -0xc
0x1002246ca: cmp r12, rcx
0x1002246cd: jne 0x1002246c0
0x1002246cf: lea rax, [r12 + 0xc]
0x1002246d4: vmovss xmm1, dword ptr [r8]
0x1002246d9: vucomiss xmm1, xmm0
0x1002246dd: ja 0x100224864
0x1002246e3: cmp rax, r8
0x1002246e6: je 0x100224ad8
0x1002246ec: lea rax, [r12 + 0x18]
0x1002246f1: nop word ptr cs:[rax + rax]
0x100224700: vmovss xmm1, dword ptr [rax - 0xc]
0x100224705: vucomiss xmm1, xmm0
0x100224709: ja 0x10022483a
0x10022470f: add rax, 0xc
0x100224713: cmp r15, rax
0x100224716: jne 0x100224700
0x100224718: jmp 0x100224ad8 ; 0x100224ad8
0x10022471d: mov edx, dword ptr [r12 + 8]
0x100224722: mov dword ptr [rbp - 0x30], edx
0x100224725: mov rdx, qword ptr [r12]
0x100224729: mov qword ptr [rbp - 0x38], rdx
0x10022472d: mov edx, dword ptr [rcx + 8]
0x100224730: mov dword ptr [r12 + 8], edx
0x100224735: mov rdx, qword ptr [rcx]
0x100224738: mov qword ptr [r12], rdx
0x10022473c: mov edx, dword ptr [rbp - 0x30]
0x10022473f: mov dword ptr [rcx + 8], edx
0x100224742: mov rdx, qword ptr [rbp - 0x38]
0x100224746: mov qword ptr [rcx], rdx
0x100224749: inc eax
0x10022474b: lea r14, [r12 + 0xc]
0x100224750: cmp r14, rcx
0x100224753: jb 0x10022478f
0x100224755: jmp 0x100224653 ; 0x100224653
0x10022475a: nop word ptr [rax + rax]
0x100224760: mov esi, dword ptr [rdx + 8]
0x100224763: mov dword ptr [rbp - 0x30], esi
0x100224766: mov rsi, qword ptr [rdx]
0x100224769: mov qword ptr [rbp - 0x38], rsi
0x10022476d: mov esi, dword ptr [rcx + 8]
0x100224770: mov dword ptr [rdx + 8], esi
0x100224773: mov rsi, qword ptr [rcx]
0x100224776: mov qword ptr [rdx], rsi
0x100224779: mov esi, dword ptr [rbp - 0x30]
0x10022477c: mov dword ptr [rcx + 8], esi
0x10022477f: mov rsi, qword ptr [rbp - 0x38]
0x100224783: mov qword ptr [rcx], rsi
0x100224786: inc eax
0x100224788: cmp r13, rdx
0x10022478b: cmove r13, rcx
0x10022478f: vmovss xmm0, dword ptr [r13]
0x100224795: add r14, -0xc
0x100224799: mov rdx, r14
0x10022479c: nop dword ptr [rax]
0x1002247a0: vucomiss xmm0, dword ptr [rdx + 0xc]
0x1002247a5: lea rdx, [rdx + 0xc]
0x1002247a9: ja 0x1002247a0
0x1002247ab: lea r14, [rdx + 0xc]
0x1002247af: nop 
0x1002247b0: vucomiss xmm0, dword ptr [rcx - 0xc]
0x1002247b5: lea rcx, [rcx - 0xc]
0x1002247b9: jbe 0x1002247b0
0x1002247bb: cmp rdx, rcx
0x1002247be: jbe 0x100224760
0x1002247c0: mov r14, rdx
0x1002247c3: cmp r14, r13
0x1002247c6: jne 0x10022465c
0x1002247cc: nop dword ptr [rax]
0x1002247d0: test eax, eax
0x1002247d2: jne 0x100224810
0x1002247d4: mov rdi, r12
0x1002247d7: mov rsi, r14
0x1002247da: call 0x100224f50 ; 0x100224f50
0x1002247df: mov r13d, eax
0x1002247e2: lea rbx, [r14 + 0xc]
0x1002247e6: mov rdi, rbx
0x1002247e9: mov rsi, r15
0x1002247ec: call 0x100224f50 ; 0x100224f50
0x1002247f1: test al, al
0x1002247f3: jne 0x1002248e9
0x1002247f9: test r13b, r13b
0x1002247fc: mov r8, qword ptr [rbp - 0x40]
0x100224800: movabs rdi, 0xaaaaaaaaaaaaaaab
0x10022480a: jne 0x100224310
0x100224810: mov rax, r14
0x100224813: sub rax, r12
0x100224816: sar rax, 2
0x10022481a: imul rax, rdi
0x10022481e: mov rcx, r15
0x100224821: sub rcx, r14
0x100224824: sar rcx, 2
0x100224828: imul rcx, rdi
0x10022482c: cmp rax, rcx
0x10022482f: jl 0x1002242e9
0x100224835: jmp 0x1002242b3 ; 0x1002242b3
0x10022483a: mov ecx, dword ptr [rax - 4]
0x10022483d: mov dword ptr [rbp - 0x30], ecx
0x100224840: mov rcx, qword ptr [rax - 0xc]
0x100224844: mov qword ptr [rbp - 0x38], rcx
0x100224848: mov ecx, dword ptr [r8 + 8]
0x10022484c: mov dword ptr [rax - 4], ecx
0x10022484f: mov rcx, qword ptr [r8]
0x100224852: mov qword ptr [rax - 0xc], rcx
0x100224856: mov ecx, dword ptr [rbp - 0x30]
0x100224859: mov dword ptr [r8 + 8], ecx
0x10022485d: mov rcx, qword ptr [rbp - 0x38]
0x100224861: mov qword ptr [r8], rcx
0x100224864: cmp rax, r8
0x100224867: je 0x100224ad8
0x10022486d: mov rcx, r8
0x100224870: jmp 0x1002248a8 ; 0x1002248a8
0x100224872: nop word ptr cs:[rax + rax]
0x100224880: mov edx, dword ptr [rax - 4]
0x100224883: mov dword ptr [rbp - 0x30], edx
0x100224886: mov rdx, qword ptr [rax - 0xc]
0x10022488a: mov qword ptr [rbp - 0x38], rdx
0x10022488e: mov edx, dword ptr [rcx + 8]
0x100224891: mov dword ptr [rax - 4], edx
0x100224894: mov rdx, qword ptr [rcx]
0x100224897: mov qword ptr [rax - 0xc], rdx
0x10022489b: mov edx, dword ptr [rbp - 0x30]
0x10022489e: mov dword ptr [rcx + 8], edx
0x1002248a1: mov rdx, qword ptr [rbp - 0x38]
0x1002248a5: mov qword ptr [rcx], rdx
0x1002248a8: vmovss xmm0, dword ptr [r12]
0x1002248ae: nop 
0x1002248b0: vmovss xmm1, dword ptr [rax]
0x1002248b4: add rax, 0xc
0x1002248b8: vucomiss xmm1, xmm0
0x1002248bc: jbe 0x1002248b0
0x1002248be: lea rbx, [rax - 0xc]
0x1002248c2: nop word ptr cs:[rax + rax]
0x1002248d0: vmovss xmm1, dword ptr [rcx - 0xc]
0x1002248d5: add rcx, -0xc
0x1002248d9: vucomiss xmm1, xmm0
0x1002248dd: ja 0x1002248d0
0x1002248df: cmp rbx, rcx
0x1002248e2: jb 0x100224880
0x1002248e4: jmp 0x100224310 ; 0x100224310
0x1002248e9: mov r15, r14
0x1002248ec: test r13b, r13b
0x1002248ef: movabs rdi, 0xaaaaaaaaaaaaaaab
0x1002248f9: je 0x1002242d0
0x1002248ff: jmp 0x100224ad8 ; 0x100224ad8
0x100224904: lea rcx, [rip + 0x445] ; 0x100224d50
0x10022490b: movsxd rax, dword ptr [rcx + rax*4]
0x10022490f: add rax, rcx
0x100224912: jmp rax
0x100224914: vmovss xmm0, dword ptr [r12]
0x10022491a: vucomiss xmm0, dword ptr [r8]
0x10022491f: jbe 0x100224ad8
0x100224925: jmp 0x100224b12 ; 0x100224b12
0x10022492a: lea rax, [r12 + 0x18]
0x10022492f: lea rcx, [r12 + 0xc]
0x100224934: vmovss xmm0, dword ptr [r12]
0x10022493a: vmovss xmm2, dword ptr [r12 + 0xc]
0x100224941: vucomiss xmm0, xmm2
0x100224945: vmovss xmm1, dword ptr [r12 + 0x18]
0x10022494c: jbe 0x10022497c
0x10022494e: vucomiss xmm2, xmm1
0x100224952: jbe 0x1002249f1
0x100224958: mov ecx, dword ptr [r12 + 8]
0x10022495d: mov dword ptr [rbp - 0x30], ecx
0x100224960: mov rcx, qword ptr [r12]
0x100224964: mov qword ptr [rbp - 0x38], rcx
0x100224968: mov ecx, dword ptr [rax + 8]
0x10022496b: mov dword ptr [r12 + 8], ecx
0x100224970: mov rcx, qword ptr [rax]
0x100224973: mov qword ptr [r12], rcx
0x100224977: jmp 0x100224a43 ; 0x100224a43
0x10022497c: vucomiss xmm2, xmm1
0x100224980: jbe 0x100224a50
0x100224986: mov edx, dword ptr [rcx + 8]
0x100224989: mov dword ptr [rbp - 0x30], edx
0x10022498c: mov rdx, qword ptr [rcx]
0x10022498f: mov qword ptr [rbp - 0x38], rdx
0x100224993: mov edx, dword ptr [rax + 8]
0x100224996: mov dword ptr [rcx + 8], edx
0x100224999: mov rdx, qword ptr [rax]
0x10022499c: mov qword ptr [rcx], rdx
0x10022499f: mov edx, dword ptr [rbp - 0x30]
0x1002249a2: mov dword ptr [rax + 8], edx
0x1002249a5: mov rdx, qword ptr [rbp - 0x38]
0x1002249a9: mov qword ptr [rax], rdx
0x1002249ac: vucomiss xmm0, dword ptr [rcx]
0x1002249b0: jbe 0x100224a50
0x1002249b6: mov edx, dword ptr [r12 + 8]
0x1002249bb: mov dword ptr [rbp - 0x30], edx
0x1002249be: mov rdx, qword ptr [r12]
0x1002249c2: mov qword ptr [rbp - 0x38], rdx
0x1002249c6: mov edx, dword ptr [rcx + 8]
0x1002249c9: mov dword ptr [r12 + 8], edx
0x1002249ce: mov rdx, qword ptr [rcx]
0x1002249d1: mov qword ptr [r12], rdx
0x1002249d5: mov edx, dword ptr [rbp - 0x30]
0x1002249d8: mov dword ptr [rcx + 8], edx
0x1002249db: mov rdx, qword ptr [rbp - 0x38]
0x1002249df: mov qword ptr [rcx], rdx
0x1002249e2: lea rdx, [r12 + 0x24]
0x1002249e7: cmp rdx, r15
0x1002249ea: jne 0x100224a5e
0x1002249ec: jmp 0x100224ad8 ; 0x100224ad8
0x1002249f1: mov edx, dword ptr [r12 + 8]
0x1002249f6: mov dword ptr [rbp - 0x30], edx
0x1002249f9: mov rdx, qword ptr [r12]
0x1002249fd: mov qword ptr [rbp - 0x38], rdx
0x100224a01: mov edx, dword ptr [rcx + 8]
0x100224a04: mov dword ptr [r12 + 8], edx
0x100224a09: mov rdx, qword ptr [rcx]
0x100224a0c: mov qword ptr [r12], rdx
0x100224a10: mov edx, dword ptr [rbp - 0x30]
0x100224a13: mov dword ptr [rcx + 8], edx
0x100224a16: mov rdx, qword ptr [rbp - 0x38]
0x100224a1a: mov qword ptr [rcx], rdx
0x100224a1d: vmovss xmm0, dword ptr [r12 + 0xc]
0x100224a24: vucomiss xmm0, xmm1
0x100224a28: jbe 0x100224a50
0x100224a2a: mov edx, dword ptr [rcx + 8]
0x100224a2d: mov dword ptr [rbp - 0x30], edx
0x100224a30: mov rdx, qword ptr [rcx]
0x100224a33: mov qword ptr [rbp - 0x38], rdx
0x100224a37: mov edx, dword ptr [rax + 8]
0x100224a3a: mov dword ptr [rcx + 8], edx
0x100224a3d: mov rdx, qword ptr [rax]
0x100224a40: mov qword ptr [rcx], rdx
0x100224a43: mov ecx, dword ptr [rbp - 0x30]
0x100224a46: mov dword ptr [rax + 8], ecx
0x100224a49: mov rcx, qword ptr [rbp - 0x38]
0x100224a4d: mov qword ptr [rax], rcx
0x100224a50: lea rdx, [r12 + 0x24]
0x100224a55: cmp rdx, r15
0x100224a58: je 0x100224ad8
0x100224a5e: xor ecx, ecx
0x100224a60: vmovss xmm1, dword ptr [rax]
0x100224a64: mov rax, rdx
0x100224a67: vmovss xmm0, dword ptr [rax]
0x100224a6b: vucomiss xmm1, xmm0
0x100224a6f: jbe 0x100224acb
0x100224a71: mov rdx, qword ptr [rax + 4]
0x100224a75: mov rsi, rcx
0x100224a78: nop dword ptr [rax + rax]
0x100224a80: mov edi, dword ptr [r12 + rsi + 0x20]
0x100224a85: mov dword ptr [r12 + rsi + 0x2c], edi
0x100224a8a: mov rdi, qword ptr [r12 + rsi + 0x18]
0x100224a8f: mov qword ptr [r12 + rsi + 0x24], rdi
0x100224a94: cmp rsi, -0x18
0x100224a98: je 0x100224ac0
0x100224a9a: vmovss xmm1, dword ptr [r12 + rsi + 0xc]
0x100224aa1: add rsi, -0xc
0x100224aa5: vucomiss xmm1, xmm0
0x100224aa9: ja 0x100224a80
0x100224aab: lea rsi, [r12 + rsi + 0x24]
0x100224ab0: jmp 0x100224ac3 ; 0x100224ac3
0x100224ab2: nop word ptr cs:[rax + rax]
0x100224ac0: mov rsi, r12
0x100224ac3: vmovss dword ptr [rsi], xmm0
0x100224ac7: mov qword ptr [rsi + 4], rdx
0x100224acb: lea rdx, [rax + 0xc]
0x100224acf: add rcx, 0xc
0x100224ad3: cmp rdx, r15
0x100224ad6: jne 0x100224a60
0x100224ad8: add rsp, 0x28
0x100224adc: pop rbx
0x100224add: pop r12
0x100224adf: pop r13
0x100224ae1: pop r14
0x100224ae3: pop r15
0x100224ae5: pop rbp
0x100224ae6: ret 
0x100224ae7: lea rax, [r12 + 0xc]
0x100224aec: vmovss xmm1, dword ptr [r12]
0x100224af2: vmovss xmm0, dword ptr [r12 + 0xc]
0x100224af9: vucomiss xmm1, xmm0
0x100224afd: vmovss xmm1, dword ptr [r8]
0x100224b02: jbe 0x100224c7d
0x100224b08: vucomiss xmm0, xmm1
0x100224b0c: jbe 0x100224cf3
0x100224b12: mov eax, dword ptr [r12 + 8]
0x100224b17: mov dword ptr [rbp - 0x30], eax
0x100224b1a: mov rax, qword ptr [r12]
0x100224b1e: mov qword ptr [rbp - 0x38], rax
0x100224b22: mov eax, dword ptr [r8 + 8]
0x100224b26: mov dword ptr [r12 + 8], eax
0x100224b2b: mov rax, qword ptr [r8]
0x100224b2e: mov qword ptr [r12], rax
0x100224b32: mov eax, dword ptr [rbp - 0x30]
0x100224b35: mov dword ptr [r8 + 8], eax
0x100224b39: mov rax, qword ptr [rbp - 0x38]
0x100224b3d: mov qword ptr [r8], rax
0x100224b40: jmp 0x100224ad8 ; 0x100224ad8
0x100224b42: lea r14, [r12 + 0xc]
0x100224b47: lea r13, [r12 + 0x18]
0x100224b4c: lea rbx, [r12 + 0x24]
0x100224b51: mov rdi, r12
0x100224b54: mov rsi, r14
0x100224b57: mov rdx, r13
0x100224b5a: mov rcx, rbx
0x100224b5d: call 0x100224d70 ; 0x100224d70
0x100224b62: mov rcx, qword ptr [rbp - 0x40]
0x100224b66: vmovss xmm0, dword ptr [r12 + 0x24]
0x100224b6d: vucomiss xmm0, dword ptr [rcx]
0x100224b71: jbe 0x100224ad8
0x100224b77: mov eax, dword ptr [rbx + 8]
0x100224b7a: mov dword ptr [rbp - 0x30], eax
0x100224b7d: mov rax, qword ptr [rbx]
0x100224b80: mov qword ptr [rbp - 0x38], rax
0x100224b84: mov eax, dword ptr [rcx + 8]
0x100224b87: mov dword ptr [rbx + 8], eax
0x100224b8a: mov rax, qword ptr [rcx]
0x100224b8d: mov qword ptr [rbx], rax
0x100224b90: mov eax, dword ptr [rbp - 0x30]
0x100224b93: mov dword ptr [rcx + 8], eax
0x100224b96: mov rax, qword ptr [rbp - 0x38]
0x100224b9a: mov qword ptr [rcx], rax
0x100224b9d: vmovss xmm0, dword ptr [r13]
0x100224ba3: vucomiss xmm0, dword ptr [rbx]
0x100224ba7: jbe 0x100224ad8
0x100224bad: mov eax, dword ptr [r13 + 8]
0x100224bb1: mov dword ptr [rbp - 0x30], eax
0x100224bb4: mov rax, qword ptr [r13]
0x100224bb8: mov qword ptr [rbp - 0x38], rax
0x100224bbc: mov eax, dword ptr [rbx + 8]
0x100224bbf: mov dword ptr [r13 + 8], eax
0x100224bc3: mov rax, qword ptr [rbx]
0x100224bc6: mov qword ptr [r13], rax
0x100224bca: mov eax, dword ptr [rbp - 0x30]
0x100224bcd: mov dword ptr [rbx + 8], eax
0x100224bd0: mov rax, qword ptr [rbp - 0x38]
0x100224bd4: mov qword ptr [rbx], rax
0x100224bd7: vmovss xmm0, dword ptr [r14]
0x100224bdc: vucomiss xmm0, dword ptr [r13]
0x100224be2: jbe 0x100224ad8
0x100224be8: mov eax, dword ptr [r14 + 8]
0x100224bec: mov dword ptr [rbp - 0x30], eax
0x100224bef: mov rax, qword ptr [r14]
0x100224bf2: mov qword ptr [rbp - 0x38], rax
0x100224bf6: mov eax, dword ptr [r13 + 8]
0x100224bfa: mov dword ptr [r14 + 8], eax
0x100224bfe: mov rax, qword ptr [r13]
0x100224c02: mov qword ptr [r14], rax
0x100224c05: mov eax, dword ptr [rbp - 0x30]
0x100224c08: mov dword ptr [r13 + 8], eax
0x100224c0c: mov rax, qword ptr [rbp - 0x38]
0x100224c10: mov qword ptr [r13], rax
0x100224c14: vmovss xmm0, dword ptr [r12]
0x100224c1a: vucomiss xmm0, dword ptr [r12 + 0xc]
0x100224c21: jbe 0x100224ad8
0x100224c27: mov eax, dword ptr [r12 + 8]
0x100224c2c: mov dword ptr [rbp - 0x30], eax
0x100224c2f: mov rax, qword ptr [r12]
0x100224c33: mov qword ptr [rbp - 0x38], rax
0x100224c37: mov eax, dword ptr [r14 + 8]
0x100224c3b: mov dword ptr [r12 + 8], eax
0x100224c40: mov rax, qword ptr [r14]
0x100224c43: mov qword ptr [r12], rax
0x100224c47: mov eax, dword ptr [rbp - 0x30]
0x100224c4a: mov dword ptr [r14 + 8], eax
0x100224c4e: mov rax, qword ptr [rbp - 0x38]
0x100224c52: mov qword ptr [r14], rax
0x100224c55: jmp 0x100224ad8 ; 0x100224ad8
0x100224c5a: lea rsi, [r12 + 0xc]
0x100224c5f: lea rdx, [r12 + 0x18]
0x100224c64: mov rdi, r12
0x100224c67: mov rcx, r8
0x100224c6a: add rsp, 0x28
0x100224c6e: pop rbx
0x100224c6f: pop r12
0x100224c71: pop r13
0x100224c73: pop r14
0x100224c75: pop r15
0x100224c77: pop rbp
0x100224c78: jmp 0x100224d70 ; 0x100224d70
0x100224c7d: vucomiss xmm0, xmm1
0x100224c81: jbe 0x100224ad8
0x100224c87: mov ecx, dword ptr [rax + 8]
0x100224c8a: mov dword ptr [rbp - 0x30], ecx
0x100224c8d: mov rcx, qword ptr [rax]
0x100224c90: mov qword ptr [rbp - 0x38], rcx
0x100224c94: mov ecx, dword ptr [r8 + 8]
0x100224c98: mov dword ptr [rax + 8], ecx
0x100224c9b: mov rcx, qword ptr [r8]
0x100224c9e: mov qword ptr [rax], rcx
0x100224ca1: mov ecx, dword ptr [rbp - 0x30]
0x100224ca4: mov dword ptr [r8 + 8], ecx
0x100224ca8: mov rcx, qword ptr [rbp - 0x38]
0x100224cac: mov qword ptr [r8], rcx
0x100224caf: vmovss xmm0, dword ptr [r12]
0x100224cb5: vucomiss xmm0, dword ptr [r12 + 0xc]
0x100224cbc: jbe 0x100224ad8
0x100224cc2: mov ecx, dword ptr [r12 + 8]
0x100224cc7: mov dword ptr [rbp - 0x30], ecx
0x100224cca: mov rcx, qword ptr [r12]
0x100224cce: mov qword ptr [rbp - 0x38], rcx
0x100224cd2: mov ecx, dword ptr [rax + 8]
0x100224cd5: mov dword ptr [r12 + 8], ecx
0x100224cda: mov rcx, qword ptr [rax]
0x100224cdd: mov qword ptr [r12], rcx
0x100224ce1: mov ecx, dword ptr [rbp - 0x30]
0x100224ce4: mov dword ptr [rax + 8], ecx
0x100224ce7: mov rcx, qword ptr [rbp - 0x38]
0x100224ceb: mov qword ptr [rax], rcx
0x100224cee: jmp 0x100224ad8 ; 0x100224ad8
0x100224cf3: mov ecx, dword ptr [r12 + 8]
0x100224cf8: mov dword ptr [rbp - 0x30], ecx
0x100224cfb: mov rcx, qword ptr [r12]
0x100224cff: mov qword ptr [rbp - 0x38], rcx
0x100224d03: mov ecx, dword ptr [rax + 8]
0x100224d06: mov dword ptr [r12 + 8], ecx
0x100224d0b: mov rcx, qword ptr [rax]
0x100224d0e: mov qword ptr [r12], rcx
0x100224d12: mov ecx, dword ptr [rbp - 0x30]
0x100224d15: mov dword ptr [rax + 8], ecx
0x100224d18: mov rcx, qword ptr [rbp - 0x38]
0x100224d1c: mov qword ptr [rax], rcx
0x100224d1f: vmovss xmm0, dword ptr [r12 + 0xc]
0x100224d26: vucomiss xmm0, dword ptr [r8]
0x100224d2b: jbe 0x100224ad8
0x100224d31: mov ecx, dword ptr [rax + 8]
0x100224d34: mov dword ptr [rbp - 0x30], ecx
0x100224d37: mov rcx, qword ptr [rax]
0x100224d3a: mov qword ptr [rbp - 0x38], rcx
0x100224d3e: mov ecx, dword ptr [r8 + 8]
0x100224d42: mov dword ptr [rax + 8], ecx
0x100224d45: mov rcx, qword ptr [r8]
0x100224d48: mov qword ptr [rax], rcx
0x100224d4b: jmp 0x100224b32 ; 0x100224b32
0x100224d50: mov ch, bh
