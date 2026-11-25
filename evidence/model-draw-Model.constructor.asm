0x100467330: push rbp
0x100467331: mov rbp, rsp
0x100467334: push r15
0x100467336: push r14
0x100467338: push r13
0x10046733a: push r12
0x10046733c: push rbx
0x10046733d: and rsp, 0xffffffffffffffe0
0x100467341: sub rsp, 0x340
0x100467348: mov rbx, rsp
0x10046734b: mov r13, r8
0x10046734e: mov r14, rsi
0x100467351: mov r15, rdi
0x100467354: mov rax, qword ptr [rip + 0x7a657d] ; 0x100c0d8d8
0x10046735b: mov rax, qword ptr [rax]
0x10046735e: mov qword ptr [rbx + 0x320], rax
0x100467365: mov byte ptr [r15 + 0x226], 1
0x10046736d: mov byte ptr [r15 + 0x3c0], 1
0x100467375: vmovups ymm0, ymmword ptr [rbp + 0x88]
0x10046737d: vmovups ymmword ptr [r15 + 0x300], ymm0
0x100467386: vmovups ymm0, ymmword ptr [rbp + 0x10]
0x10046738b: vmovups ymm1, ymmword ptr [rbp + 0x30]
0x100467390: vmovups ymm2, ymmword ptr [rbp + 0x50]
0x100467395: vmovups ymm3, ymmword ptr [rbp + 0x70]
0x10046739a: vmovups ymmword ptr [r15 + 0x2e8], ymm3
0x1004673a3: vmovups ymmword ptr [r15 + 0x2c8], ymm2
0x1004673ac: vmovups ymmword ptr [r15 + 0x2a8], ymm1
0x1004673b5: vmovups ymmword ptr [r15 + 0x288], ymm0
0x1004673be: lea rdi, [rbp + 0x50]
0x1004673c2: vmovups ymm0, ymmword ptr [r14]
0x1004673c7: vmovups ymm1, ymmword ptr [r14 + 0x20]
0x1004673cd: vmovups ymm2, ymmword ptr [r14 + 0x40]
0x1004673d3: vmovups ymm3, ymmword ptr [r14 + 0x50]
0x1004673d9: vmovups ymmword ptr [r15 + 0x370], ymm3
0x1004673e2: vmovups ymmword ptr [r15 + 0x360], ymm2
0x1004673eb: vmovups ymmword ptr [r15 + 0x340], ymm1
0x1004673f4: vmovups ymmword ptr [r15 + 0x320], ymm0
0x1004673fd: mov qword ptr [rbx + 0x88], rdx
0x100467404: mov qword ptr [r15 + 0x3a8], rdx
0x10046740b: mov qword ptr [rbx + 0x30], rcx
0x10046740f: mov rsi, rcx
0x100467412: vzeroupper 
0x100467415: call 0x1004653c0 ; 0x1004653c0
0x10046741a: test eax, eax
0x10046741c: je 0x1004692ec
0x100467422: mov qword ptr [rbx + 0x108], r13
0x100467429: dec eax
0x10046742b: mov ecx, dword ptr [r15 + 0x320]
0x100467432: mov edx, dword ptr [r15 + 0x324]
0x100467439: cmp edx, eax
0x10046743b: cmovb eax, edx
0x10046743e: mov dword ptr [r15 + 0x324], eax
0x100467445: cmp eax, 6
0x100467448: ja 0x100469246
0x10046744e: sub eax, ecx
0x100467450: jb 0x100469246
0x100467456: lea r13, [rbp + 0x10]
0x10046745a: lea ecx, [rax + 2]
0x10046745d: mov dword ptr [r15 + 0x88], ecx
0x100467464: inc eax
0x100467466: mov dword ptr [r15 + 0x8c], eax
0x10046746d: mov qword ptr [r15 + 0x22c], 0
0x100467478: mov dword ptr [r15 + 0xc8], 0
0x100467483: mov qword ptr [r15 + 0x95], 0
0x10046748e: mov qword ptr [r15 + 0x90], 0
0x100467499: vxorps ymm0, ymm0, ymm0
0x10046749d: vmovups ymmword ptr [r15 + 0xa0], ymm0
0x1004674a6: movabs rcx, 0x7f80000000000000
0x1004674b0: mov qword ptr [r15 + 0xc0], rcx
0x1004674b7: mov rcx, qword ptr [r13 + 0x90]
0x1004674be: cmp byte ptr [r15 + 0x32e], 0
0x1004674c6: vmovaps xmm0, xmmword ptr [rcx]
0x1004674ca: je 0x100467509
0x1004674cc: vmovaps xmmword ptr [r15 + 0x240], xmm0
0x1004674d5: vmovaps xmm0, xmmword ptr [rcx + 0x10]
0x1004674da: vmovaps xmmword ptr [r15 + 0x250], xmm0
0x1004674e3: vmovaps xmm0, xmmword ptr [rcx + 0x20]
0x1004674e8: vmovaps xmmword ptr [r15 + 0x260], xmm0
0x1004674f1: vmovaps xmm0, xmmword ptr [rcx + 0x30]
0x1004674f6: vmovaps xmmword ptr [r15 + 0x270], xmm0
0x1004674ff: mov byte ptr [r15 + 0x280], 1
0x100467507: jmp 0x100467544 ; 0x100467544
0x100467509: vmovaps xmmword ptr [r15 + 0x160], xmm0
0x100467512: vmovaps xmm0, xmmword ptr [rcx + 0x10]
0x100467517: vmovaps xmmword ptr [r15 + 0x170], xmm0
0x100467520: vmovaps xmm0, xmmword ptr [rcx + 0x20]
0x100467525: vmovaps xmmword ptr [r15 + 0x180], xmm0
0x10046752e: vmovaps xmm0, xmmword ptr [rcx + 0x30]
0x100467533: vmovaps xmmword ptr [r15 + 0x190], xmm0
0x10046753c: mov byte ptr [r15 + 0x225], 1
0x100467544: mov rcx, qword ptr [r13 + 0x90]
0x10046754b: vmovaps xmm0, xmmword ptr [rcx]
0x10046754f: vmovaps xmmword ptr [r15 + 0x240], xmm0
0x100467558: vmovaps xmm1, xmmword ptr [rcx + 0x10]
0x10046755d: vmovaps xmmword ptr [r15 + 0x250], xmm1
0x100467566: vmovaps xmm2, xmmword ptr [rcx + 0x20]
0x10046756b: vmovaps xmmword ptr [r15 + 0x260], xmm2
0x100467574: vmovaps xmm3, xmmword ptr [rcx + 0x30]
0x100467579: vmovaps xmmword ptr [r15 + 0x270], xmm3
0x100467582: vmovaps xmmword ptr [r15 + 0x160], xmm0
0x10046758b: vmovaps xmmword ptr [r15 + 0x170], xmm1
0x100467594: vmovaps xmmword ptr [r15 + 0x180], xmm2
0x10046759d: vmovaps xmmword ptr [r15 + 0x190], xmm3
0x1004675a6: mov byte ptr [r15 + 0x280], 0
0x1004675ae: mov word ptr [r15 + 0x227], 0x101
0x1004675b8: mov byte ptr [r15 + 0x229], 1
0x1004675c0: mov word ptr [r15 + 0x390], 0
0x1004675ca: mov word ptr [r15 + 0x224], 0x101
0x1004675d4: mov qword ptr [r15 + 0x398], 0
0x1004675df: mov dword ptr [r15 + 0x3a0], 0
0x1004675ea: mov byte ptr [r15 + 0x3a4], 0
0x1004675f2: vxorps xmm0, xmm0, xmm0
0x1004675f6: vmovaps xmmword ptr [r15 + 0x3b0], xmm0
0x1004675ff: mov r12d, dword ptr [r15 + 0x354]
0x100467606: mov rdi, qword ptr [r15 + 0x3a8]
0x10046760d: mov esi, eax
0x10046760f: shl rsi, 3
0x100467613: mov rdx, qword ptr [rip + 0x1ba028e] ; 0x1020078a8
0x10046761a: mov ecx, 0x10
0x10046761f: vzeroupper 
0x100467622: call 0x100795530 ; 0x100795530
0x100467627: mov qword ptr [r15 + 8], rax
0x10046762b: mov rdi, qword ptr [r15 + 0x3a8]
0x100467632: mov esi, dword ptr [r15 + 0x8c]
0x100467639: shl rsi, 3
0x10046763d: mov rdx, qword ptr [rip + 0x1ba0264] ; 0x1020078a8
0x100467644: mov ecx, 0x10
0x100467649: call 0x100795530 ; 0x100795530
0x10046764e: mov qword ptr [r15 + 0x28], rax
0x100467652: mov rdi, qword ptr [r15 + 0x3a8]
0x100467659: mov esi, dword ptr [r15 + 0x8c]
0x100467660: shl rsi, 3
0x100467664: mov rdx, qword ptr [rip + 0x1ba023d] ; 0x1020078a8
0x10046766b: mov ecx, 0x10
0x100467670: call 0x100795530 ; 0x100795530
0x100467675: mov qword ptr [r15 + 0x30], rax
0x100467679: mov rdi, qword ptr [r15 + 0x3a8]
0x100467680: mov esi, dword ptr [r15 + 0x8c]
0x100467687: shl rsi, 3
0x10046768b: mov rdx, qword ptr [rip + 0x1ba0216] ; 0x1020078a8
0x100467692: mov ecx, 0x10
0x100467697: call 0x100795530 ; 0x100795530
0x10046769c: mov qword ptr [r15 + 0x38], rax
0x1004676a0: mov rdi, qword ptr [r15 + 0x3a8]
0x1004676a7: mov esi, dword ptr [r15 + 0x8c]
0x1004676ae: shl rsi, 3
0x1004676b2: mov rdx, qword ptr [rip + 0x1ba01ef] ; 0x1020078a8
0x1004676b9: mov ecx, 0x10
0x1004676be: call 0x100795530 ; 0x100795530
0x1004676c3: mov qword ptr [r15 + 0x40], rax
0x1004676c7: mov rdi, qword ptr [r15 + 0x3a8]
0x1004676ce: mov esi, dword ptr [r15 + 0x8c]
0x1004676d5: shl rsi, 3
0x1004676d9: mov rdx, qword ptr [rip + 0x1ba01c8] ; 0x1020078a8
0x1004676e0: mov ecx, 0x10
0x1004676e5: call 0x100795530 ; 0x100795530
0x1004676ea: mov qword ptr [r15 + 0x10], rax
0x1004676ee: cmp dword ptr [r15 + 0x8c], 0
0x1004676f6: mov qword ptr [rbx + 0x40], r14
0x1004676fa: je 0x100468bff
0x100467700: mov rax, qword ptr [rbp + 0xc8]
0x100467707: lea rcx, [r15 + 0x320]
0x10046770e: mov qword ptr [rbx + 0xe8], rcx
0x100467715: mov dword ptr [rbx + 0x3c], r12d
0x100467719: test r12d, r12d
0x10046771c: sete byte ptr [rbx + 0x1b]
0x100467720: lea rcx, [rax + 0x1e0]
0x100467727: mov qword ptr [rbx + 0x48], rcx
0x10046772b: mov rcx, qword ptr [rip + 0x7a2e4e] ; 0x100c0a580
0x100467732: add rcx, 8
0x100467736: mov qword ptr [rbx + 0x78], rcx
0x10046773a: lea rcx, [rax + 0xa08]
0x100467741: mov qword ptr [rbx + 0xf0], rcx
0x100467748: lea rax, [rax + 0xda8]
0x10046774f: mov qword ptr [rbx + 0x100], rax
0x100467756: lea rax, [r15 + 0x1e0]
0x10046775d: mov qword ptr [rbx + 0xf8], rax
0x100467764: xor r14d, r14d
0x100467767: lea r12, [rip + 0x70cb72] ; 0x100b742e0 UnlitAlpha
0x10046776e: mov rdi, qword ptr [r15 + 0x3a8]
0x100467775: mov rdx, qword ptr [rip + 0x1ba012c] ; 0x1020078a8
0x10046777c: mov esi, 0xb0
0x100467781: mov ecx, 0x10
0x100467786: call 0x100795530 ; 0x100795530
0x10046778b: mov byte ptr [rax + 0x14], 0
0x10046778f: mov dword ptr [rax + 0x18], 0
0x100467796: vxorps xmm0, xmm0, xmm0
0x10046779a: vmovaps xmmword ptr [rax], xmm0
0x10046779e: mov rcx, qword ptr [r15 + 8]
0x1004677a2: mov r14d, r14d
0x1004677a5: mov qword ptr [rbx + 8], r14
0x1004677a9: mov qword ptr [rcx + r14*8], rax
0x1004677ad: mov rdi, qword ptr [r15 + 0x3a8]
0x1004677b4: mov rdx, qword ptr [rip + 0x1ba00ed] ; 0x1020078a8
0x1004677bb: mov esi, 0x540
0x1004677c0: mov ecx, 0x10
0x1004677c5: call 0x100795530 ; 0x100795530
0x1004677ca: mov r14, rax
0x1004677cd: mov rdi, r14
0x1004677d0: call 0x1007f5d80 ; 0x1007f5d80
0x1004677d5: mov rax, qword ptr [r15 + 0x28]
0x1004677d9: mov rcx, qword ptr [rbx + 8]
0x1004677dd: mov qword ptr [rax + rcx*8], r14
0x1004677e1: mov rdi, qword ptr [r15 + 0x3a8]
0x1004677e8: mov rdx, qword ptr [rip + 0x1ba00b9] ; 0x1020078a8
0x1004677ef: mov esi, 0x540
0x1004677f4: mov ecx, 0x10
0x1004677f9: call 0x100795530 ; 0x100795530
0x1004677fe: mov r14, rax
0x100467801: mov rdi, r14
0x100467804: call 0x1007f5d80 ; 0x1007f5d80
0x100467809: mov rax, qword ptr [r15 + 0x30]
0x10046780d: mov rcx, qword ptr [rbx + 8]
0x100467811: mov qword ptr [rax + rcx*8], r14
0x100467815: mov rdi, qword ptr [r15 + 0x3a8]
0x10046781c: mov rdx, qword ptr [rip + 0x1ba0085] ; 0x1020078a8
0x100467823: mov esi, 0x540
0x100467828: mov ecx, 0x10
0x10046782d: call 0x100795530 ; 0x100795530
0x100467832: mov r14, rax
0x100467835: mov rdi, r14
0x100467838: call 0x1007f5d80 ; 0x1007f5d80
0x10046783d: mov rax, qword ptr [r15 + 0x38]
0x100467841: mov rcx, qword ptr [rbx + 8]
0x100467845: mov qword ptr [rax + rcx*8], r14
0x100467849: mov rdi, qword ptr [r15 + 0x3a8]
0x100467850: mov rdx, qword ptr [rip + 0x1ba0051] ; 0x1020078a8
0x100467857: mov esi, 0x540
0x10046785c: mov ecx, 0x10
0x100467861: call 0x100795530 ; 0x100795530
0x100467866: mov r14, rax
0x100467869: mov rdi, r14
0x10046786c: call 0x1007f5d80 ; 0x1007f5d80
0x100467871: mov rax, qword ptr [r15 + 0x40]
0x100467875: mov rcx, qword ptr [rbx + 8]
0x100467879: mov qword ptr [rax + rcx*8], r14
0x10046787d: mov rdi, qword ptr [r15 + 0x3a8]
0x100467884: mov rdx, qword ptr [rip + 0x1ba001d] ; 0x1020078a8
0x10046788b: mov esi, 0x438
0x100467890: mov ecx, 8
0x100467895: call 0x100795530 ; 0x100795530
0x10046789a: mov r14, rax
0x10046789d: mov rdi, r14
0x1004678a0: call 0x1007f5010 ; 0x1007f5010
0x1004678a5: mov rax, qword ptr [r15 + 0x10]
0x1004678a9: mov rcx, qword ptr [rbx + 8]
0x1004678ad: mov qword ptr [rax + rcx*8], r14
0x1004678b1: mov r14, qword ptr [rbx + 8]
0x1004678b5: mov eax, dword ptr [r13 + 0x84]
0x1004678bc: cmp eax, 1
0x1004678bf: je 0x1004679a0
0x1004678c5: test eax, eax
0x1004678c7: jne 0x1004694eb
0x1004678cd: mov rax, qword ptr [r15 + 8]
0x1004678d1: mov rdi, qword ptr [rax + r14*8]
0x1004678d5: mov ecx, dword ptr [r15 + 0x320]
0x1004678dc: add ecx, r14d
0x1004678df: mov rsi, qword ptr [rbx + 0x30]
0x1004678e3: lea rdx, [rbp + 0x50]
0x1004678e7: call 0x10045f770 ; 0x10045f770
0x1004678ec: cmp byte ptr [r15 + 0x349], 0
0x1004678f4: je 0x100467910
0x1004678f6: mov rax, qword ptr [r15 + 8]
0x1004678fa: mov rdi, qword ptr [rax + r14*8]
0x1004678fe: mov esi, 1
0x100467903: vmovss xmm0, dword ptr [rip + 0x63d7b5] ; 0x100aa50c0
0x10046790b: call 0x10045fdb0 ; 0x10045fdb0
0x100467910: mov r13, qword ptr [r13 + 0x88]
0x100467917: cmp dword ptr [rbx + 0x3c], 0
0x10046791b: je 0x100467935
0x10046791d: mov rdi, r13
0x100467920: mov rsi, r12
0x100467923: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x100467928: test eax, eax
0x10046792a: lea rax, [rip + 0x72246c] ; 0x100b89d9d UnlitAlphaSolid
0x100467931: cmove r13, rax
0x100467935: lea rdi, [rbx + 0xb0]
0x10046793c: call 0x1007c2530 ; 0x1007c2530
0x100467941: call 0x1007d1100 ; 0x1007d1100
0x100467946: mov rdi, qword ptr [rbx + 0x30]
0x10046794a: mov rsi, rax
0x10046794d: mov rdx, r13
0x100467950: call 0x1007c4360 ; 0x1007c4360
0x100467955: mov r14, rax
0x100467958: test r14, r14
0x10046795b: je 0x1004679e0
0x100467961: mov rdi, r14
0x100467964: lea rsi, [rbx + 0xb0]
0x10046796b: call 0x1007c2310 ; 0x1007c2310
0x100467970: mov rax, qword ptr [rbx + 0xb0]
0x100467977: test rax, rax
0x10046797a: je 0x1004679e5
0x10046797c: mov r12, qword ptr [rax + 0x10]
0x100467980: test byte ptr [r12 + 0xe8], 1
0x100467989: jne 0x1004679f3
0x10046798b: add r12, 0xe8
0x100467992: inc r12
0x100467995: jmp 0x1004679fb ; 0x1004679fb
0x100467997: nop word ptr [rax + rax]
0x1004679a0: mov rax, qword ptr [r15 + 8]
0x1004679a4: mov rdi, qword ptr [rax + r14*8]
0x1004679a8: mov r8d, dword ptr [r13 + 0x80]
0x1004679af: mov r9d, dword ptr [r15 + 0x320]
0x1004679b6: add r9d, r14d
0x1004679b9: mov rsi, qword ptr [rbx + 0x30]
0x1004679bd: mov rdx, r13
0x1004679c0: lea rcx, [rbp + 0x50]
0x1004679c4: call 0x10045fa00 ; 0x10045fa00
0x1004679c9: cmp byte ptr [r15 + 0x349], 0
0x1004679d1: jne 0x1004678f6
0x1004679d7: jmp 0x100467910 ; 0x100467910
0x1004679dc: nop dword ptr [rax]
0x1004679e0: xor r12d, r12d
0x1004679e3: jmp 0x1004679fb ; 0x1004679fb
0x1004679e5: xor r12d, r12d
0x1004679e8: test byte ptr [r12 + 0xe8], 1
0x1004679f1: je 0x10046798b
0x1004679f3: mov r12, qword ptr [r12 + 0xf8]
0x1004679fb: mov rdi, qword ptr [rbp + 0xc8]
0x100467a02: mov rsi, r12
0x100467a05: call 0x10017e8d0 ; 0x10017e8d0
0x100467a0a: test r14, r14
0x100467a0d: je 0x1004692be
0x100467a13: test r12, r12
0x100467a16: mov r14, qword ptr [rbx + 8]
0x100467a1a: je 0x100469290
0x100467a20: cmp byte ptr [r12], 0
0x100467a25: je 0x100469290
0x100467a2b: test rax, rax
0x100467a2e: je 0x100469459
0x100467a34: mov rdi, qword ptr [r15 + 8]
0x100467a38: cmp byte ptr [r15 + 0x328], 0
0x100467a40: je 0x100467a71
0x100467a42: mov rcx, qword ptr [rdi]
0x100467a45: mov rcx, qword ptr [rcx]
0x100467a48: mov rcx, qword ptr [rcx + 0x58]
0x100467a4c: test rcx, rcx
0x100467a4f: je 0x100467a5f
0x100467a51: mov dl, 1
0x100467a53: cmp dword ptr [rcx + 0x48], 0
0x100467a57: mov r12b, 1
0x100467a5a: mov sil, 1
0x100467a5d: jg 0x100467ac3
0x100467a5f: mov dl, 1
0x100467a61: cmp byte ptr [r15 + 0x329], 0
0x100467a69: mov r12b, 1
0x100467a6c: mov sil, 1
0x100467a6f: jne 0x100467ac3
0x100467a71: mov cl, byte ptr [r15 + 0x340]
0x100467a78: mov sil, 1
0x100467a7b: mov dl, 1
0x100467a7d: test cl, cl
0x100467a7f: je 0x100467aac
0x100467a81: or cl, byte ptr [r15 + 0x335]
0x100467a88: jne 0x100467ac0
0x100467a8a: cmp byte ptr [r15 + 0x350], 0
0x100467a92: jne 0x100467ac0
0x100467a94: cmp byte ptr [r15 + 0x34b], 0
0x100467a9c: jne 0x100467ac0
0x100467a9e: cmp byte ptr [r15 + 0x378], 0
0x100467aa6: setne sil
0x100467aaa: jmp 0x100467ac0 ; 0x100467ac0
0x100467aac: cmp byte ptr [r15 + 0x350], 0
0x100467ab4: setne dl
0x100467ab7: or cl, byte ptr [r15 + 0x335]
0x100467abe: je 0x100467a8a
0x100467ac0: xor r12d, r12d
0x100467ac3: mov byte ptr [rbx + 0x58], dl
0x100467ac6: xor edx, edx
0x100467ac8: mov qword ptr [rbx + 0x60], rax
0x100467acc: cmp qword ptr [rbx + 0x48], rax
0x100467ad0: sete dl
0x100467ad3: mov byte ptr [rbx + 0x50], sil
0x100467ad7: movzx r13d, sil
0x100467adb: mov esi, r13d
0x100467ade: mov ecx, r14d
0x100467ae1: shl esi, cl
0x100467ae3: or dword ptr [r15 + 0x22c], esi
0x100467aea: shl edx, cl
0x100467aec: or dword ptr [r15 + 0x230], edx
0x100467af3: test r14d, r14d
0x100467af6: jne 0x100467ba7
0x100467afc: cmp byte ptr [rbx + 0x58], 0
0x100467b00: je 0x100467b58
0x100467b02: mov rdi, qword ptr [r15 + 0x3a8]
0x100467b09: mov esi, dword ptr [r15 + 0x8c]
0x100467b10: shl rsi, 3
0x100467b14: mov rdx, qword ptr [rip + 0x1b9fd8d] ; 0x1020078a8
0x100467b1b: mov ecx, 0x10
0x100467b20: call 0x100795530 ; 0x100795530
0x100467b25: mov rcx, qword ptr [rbx + 0x40]
0x100467b29: mov qword ptr [r15 + 0x18], rax
0x100467b2d: cmp byte ptr [rcx + 0x20], 0
0x100467b31: je 0x100467b68
0x100467b33: mov rdi, qword ptr [r15 + 0x3a8]
0x100467b3a: mov esi, dword ptr [r15 + 0x8c]
0x100467b41: shl rsi, 3
0x100467b45: mov rdx, qword ptr [rip + 0x1b9fd5c] ; 0x1020078a8
0x100467b4c: mov ecx, 0x10
0x100467b51: call 0x100795530 ; 0x100795530
0x100467b56: jmp 0x100467b6a ; 0x100467b6a
0x100467b58: xor eax, eax
0x100467b5a: mov rcx, qword ptr [rbx + 0x40]
0x100467b5e: mov qword ptr [r15 + 0x18], rax
0x100467b62: cmp byte ptr [rcx + 0x20], 0
0x100467b66: jne 0x100467b33
0x100467b68: xor eax, eax
0x100467b6a: mov qword ptr [r15 + 0x20], rax
0x100467b6e: mov rax, qword ptr [rbx + 0x60]
0x100467b72: cmp qword ptr [rbx + 0x48], rax
0x100467b76: je 0x100467b7c
0x100467b78: xor eax, eax
0x100467b7a: jmp 0x100467b9f ; 0x100467b9f
0x100467b7c: mov rdi, qword ptr [r15 + 0x3a8]
0x100467b83: mov esi, dword ptr [r15 + 0x8c]
0x100467b8a: shl rsi, 3
0x100467b8e: mov rdx, qword ptr [rip + 0x1b9fd13] ; 0x1020078a8
0x100467b95: mov ecx, 0x10
0x100467b9a: call 0x100795530 ; 0x100795530
0x100467b9f: mov qword ptr [r15 + 0x48], rax
0x100467ba3: mov rdi, qword ptr [r15 + 8]
0x100467ba7: mov rax, qword ptr [rdi + r14*8]
0x100467bab: mov rcx, qword ptr [rax]
0x100467bae: mov rcx, qword ptr [rcx + 0x48]
0x100467bb2: movsxd rax, dword ptr [rax + 0x10]
0x100467bb6: imul rax, rax, 0xb8
0x100467bbd: mov qword ptr [rbx + 0x20], rcx
0x100467bc1: mov qword ptr [rbx + 0x10], rax
0x100467bc5: mov r14d, dword ptr [rcx + rax + 0x34]
0x100467bca: call 0x1007c6c20 ; 0x1007c6c20
0x100467bcf: shl r14, 4
0x100467bd3: lea rcx, [rip + 0x1be0f76] ; 0x102048b50
0x100467bda: mov rdx, qword ptr [rcx]
0x100467bdd: mov ecx, 4
0x100467be2: mov rdi, rax
0x100467be5: mov rsi, r14
0x100467be8: call 0x100795530 ; 0x100795530
0x100467bed: mov qword ptr [rbx + 0x70], rax
0x100467bf1: mov dword ptr [rbx + 0x1c], r12d
0x100467bf5: mov rax, qword ptr [rbx + 0x20]
0x100467bf9: mov rcx, qword ptr [rbx + 0x10]
0x100467bfd: lea r12, [rax + rcx + 0x34]
0x100467c02: mov r14d, dword ptr [r12]
0x100467c06: call 0x1007c6c20 ; 0x1007c6c20
0x100467c0b: shl r14, 2
0x100467c0f: lea rcx, [rip + 0x1be0f3a] ; 0x102048b50
0x100467c16: mov rdx, qword ptr [rcx]
0x100467c19: mov ecx, 4
0x100467c1e: mov rdi, rax
0x100467c21: mov rsi, r14
0x100467c24: call 0x100795530 ; 0x100795530
0x100467c29: mov qword ptr [rbx + 0x68], rax
0x100467c2d: mov rax, qword ptr [rbx + 0x20]
0x100467c31: mov rcx, qword ptr [rbx + 0x10]
0x100467c35: lea rdx, [rax + rcx]
0x100467c39: mov r14, qword ptr [rbx + 0x40]
0x100467c3d: cmp byte ptr [r14 + 0x59], 0
0x100467c42: mov qword ptr [rbx + 0x80], rdx
0x100467c49: je 0x100467c90
0x100467c4b: mov rax, qword ptr [r15 + 8]
0x100467c4f: mov rcx, qword ptr [rbx + 8]
0x100467c53: mov rsi, qword ptr [rax + rcx*8]
0x100467c57: sub rsp, 0x10
0x100467c5b: mov rax, qword ptr [rbx + 0x30]
0x100467c5f: mov qword ptr [rsp + 8], rax
0x100467c64: mov rax, qword ptr [rbx + 0x88]
0x100467c6b: mov qword ptr [rsp], rax
0x100467c6f: mov rcx, qword ptr [rbx + 0x70]
0x100467c73: mov r8, qword ptr [rbx + 0x68]
0x100467c77: mov r9, r14
0x100467c7a: call 0x100469710 ; 0x100469710
0x100467c7f: add rsp, 0x10
0x100467c83: jmp 0x100467cc0 ; 0x100467cc0
0x100467c85: nop word ptr cs:[rax + rax]
0x100467c90: cmp byte ptr [rbx + 0x50], 0
0x100467c94: jne 0x100467cc0
0x100467c96: mov rax, qword ptr [rbx + 0x20]
0x100467c9a: mov rcx, qword ptr [rbx + 0x10]
0x100467c9e: mov rsi, qword ptr [rax + rcx + 0x60]
0x100467ca3: mov rdi, qword ptr [rax + rcx + 0x68]
0x100467ca8: mov rdx, qword ptr [rbx + 0x80]
0x100467caf: call 0x10045edf0 ; 0x10045edf0
0x100467cb4: nop word ptr cs:[rax + rax]
0x100467cc0: mov rax, qword ptr [r15 + 8]
0x100467cc4: mov rcx, qword ptr [r15 + 0x10]
0x100467cc8: mov rdx, qword ptr [rbx + 8]
0x100467ccc: mov rdi, qword ptr [rcx + rdx*8]
0x100467cd0: mov rax, qword ptr [rax + rdx*8]
0x100467cd4: mov rsi, qword ptr [rax]
0x100467cd7: mov edx, dword ptr [r12]
0x100467cdb: call 0x1007f53c0 ; 0x1007f53c0
0x100467ce0: mov rax, qword ptr [r15 + 0x10]
0x100467ce4: mov rcx, qword ptr [rbx + 8]
0x100467ce8: mov rdi, qword ptr [rax + rcx*8]
0x100467cec: inc r13d
0x100467cef: cmp byte ptr [r14 + 0x59], 0
0x100467cf4: mov rax, qword ptr [rbx + 0x70]
0x100467cf8: jne 0x100467d07
0x100467cfa: mov rax, qword ptr [rbx + 0x20]
0x100467cfe: mov rcx, qword ptr [rbx + 0x10]
0x100467d02: mov rax, qword ptr [rax + rcx + 0x60]
0x100467d07: vmovaps xmm0, xmmword ptr [rip + 0x6450f1] ; 0x100aace00
0x100467d0f: vmovaps xmmword ptr [rbx + 0x120], xmm0
0x100467d17: sub rsp, 0x10
0x100467d1b: mov qword ptr [rsp + 8], rax
0x100467d20: mov dword ptr [rsp], 0
0x100467d27: mov esi, 0
0x100467d2c: mov r8d, 2
0x100467d32: lea rdx, [rbx + 0x120]
0x100467d39: lea rcx, [rbx + 0x128]
0x100467d40: mov r9d, r13d
0x100467d43: call 0x1007f5430 ; 0x1007f5430
0x100467d48: add rsp, 0x10
0x100467d4c: mov rax, qword ptr [r15 + 0x10]
0x100467d50: mov rcx, qword ptr [rbx + 8]
0x100467d54: mov rdi, qword ptr [rax + rcx*8]
0x100467d58: cmp byte ptr [r14 + 0x59], 0
0x100467d5d: mov rax, qword ptr [rbx + 0x68]
0x100467d61: jne 0x100467d70
0x100467d63: mov rax, qword ptr [rbx + 0x20]
0x100467d67: mov rcx, qword ptr [rbx + 0x10]
0x100467d6b: mov rax, qword ptr [rax + rcx + 0x68]
0x100467d70: movabs rcx, 0x300000018
0x100467d7a: mov qword ptr [rbx + 0x120], rcx
0x100467d81: sub rsp, 0x10
0x100467d85: mov qword ptr [rsp + 8], rax
0x100467d8a: mov dword ptr [rsp], 0
0x100467d91: mov esi, 2
0x100467d96: mov r8d, 1
0x100467d9c: lea rdx, [rbx + 0x120]
0x100467da3: lea rcx, [rbx + 0x124]
0x100467daa: mov r9d, r13d
0x100467dad: call 0x1007f5430 ; 0x1007f5430
0x100467db2: add rsp, 0x10
0x100467db6: mov rax, qword ptr [r15 + 0x10]
0x100467dba: mov rcx, qword ptr [rbx + 8]
0x100467dbe: mov rdi, qword ptr [rax + rcx*8]
0x100467dc2: mov rax, qword ptr [rbx + 0x20]
0x100467dc6: mov rcx, qword ptr [rbx + 0x10]
0x100467dca: mov rax, qword ptr [rax + rcx + 0x70]
0x100467dcf: vmovaps xmm0, xmmword ptr [rip + 0x645039] ; 0x100aace10  
0x100467dd7: vmovaps xmmword ptr [rbx + 0x120], xmm0
0x100467ddf: sub rsp, 0x10
0x100467de3: mov qword ptr [rsp + 8], rax
0x100467de8: mov dword ptr [rsp], 0
0x100467def: mov esi, 3
0x100467df4: mov r8d, 2
0x100467dfa: lea rdx, [rbx + 0x120]
0x100467e01: lea rcx, [rbx + 0x128]
0x100467e08: mov r9d, r13d
0x100467e0b: call 0x1007f5430 ; 0x1007f5430
0x100467e10: add rsp, 0x10
0x100467e14: lea rax, [rbp + 0x10]
0x100467e18: cmp dword ptr [rax + 0x84], 1
0x100467e1f: jne 0x100467ec2
0x100467e25: mov rax, qword ptr [r15 + 8]
0x100467e29: mov rsi, qword ptr [rbx + 8]
0x100467e2d: mov rax, qword ptr [rax + rsi*8]
0x100467e31: mov rax, qword ptr [rax + 8]
0x100467e35: test rax, rax
0x100467e38: je 0x100468336
0x100467e3e: mov rcx, qword ptr [rbx + 0xe8]
0x100467e45: mov ecx, dword ptr [rcx]
0x100467e47: add ecx, esi
0x100467e49: cmp dword ptr [rax + 0x1c], ecx
0x100467e4c: jbe 0x100468336
0x100467e52: mov rdx, qword ptr [r15 + 0x10]
0x100467e56: mov rdi, qword ptr [rdx + rsi*8]
0x100467e5a: mov rax, qword ptr [rax + 0x28]
0x100467e5e: mov ecx, ecx
0x100467e60: lea rcx, [rcx + rcx*2]
0x100467e64: mov rax, qword ptr [rax + rcx*8 + 8]
0x100467e69: vmovaps xmm0, xmmword ptr [rip + 0x65b2ef] ; 0x100ac3160
0x100467e71: vmovaps xmmword ptr [rbx + 0x120], xmm0
0x100467e79: movabs rcx, 0xf0000000e
0x100467e83: mov qword ptr [rbx + 0x130], rcx
0x100467e8a: sub rsp, 0x10
0x100467e8e: mov qword ptr [rsp + 8], rax
0x100467e93: mov dword ptr [rsp], 0
0x100467e9a: mov esi, 4
0x100467e9f: mov r8d, 3
0x100467ea5: mov r9d, 1
0x100467eab: lea rdx, [rbx + 0x120]
0x100467eb2: lea rcx, [rbx + 0x12c]
0x100467eb9: call 0x1007f5430 ; 0x1007f5430
0x100467ebe: add rsp, 0x10
0x100467ec2: mov r14, qword ptr [rbx + 8]
0x100467ec6: cmp byte ptr [rbx + 0x58], 0
0x100467eca: je 0x100467fab
0x100467ed0: mov rdi, qword ptr [r15 + 0x3a8]
0x100467ed7: movsxd rax, dword ptr [r12]
0x100467edb: shl rax, 2
0x100467edf: lea rsi, [rax + rax*2]
0x100467ee3: mov rdx, qword ptr [rip + 0x1b9f9be] ; 0x1020078a8
0x100467eea: mov ecx, 0x10
0x100467eef: call 0x100795530 ; 0x100795530
0x100467ef4: mov rcx, qword ptr [r15 + 0x18]
0x100467ef8: mov r10, qword ptr [rbx + 8]
0x100467efc: mov qword ptr [rcx + r10*8], rax
0x100467f00: cmp dword ptr [r12], 0
0x100467f05: je 0x100467f4e
0x100467f07: mov rax, qword ptr [rbx + 0x20]
0x100467f0b: mov rcx, qword ptr [rbx + 0x10]
0x100467f0f: lea r8, [rax + rcx + 0x60]
0x100467f14: xor ecx, ecx
0x100467f16: nop word ptr cs:[rax + rax]
0x100467f20: mov rdx, qword ptr [r15 + 0x18]
0x100467f24: mov r9, qword ptr [rdx + r10*8]
0x100467f28: mov esi, ecx
0x100467f2a: lea rdi, [rsi + rsi*2]
0x100467f2e: mov rax, qword ptr [r8]
0x100467f31: shl rsi, 4
0x100467f35: mov edx, dword ptr [rax + rsi + 8]
0x100467f39: mov dword ptr [r9 + rdi*4 + 8], edx
0x100467f3e: mov rax, qword ptr [rax + rsi]
0x100467f42: mov qword ptr [r9 + rdi*4], rax
0x100467f46: inc ecx
0x100467f48: cmp ecx, dword ptr [r12]
0x100467f4c: jb 0x100467f20
0x100467f4e: mov rax, qword ptr [r15 + 0x10]
0x100467f52: mov rcx, qword ptr [r15 + 0x18]
0x100467f56: mov rdi, qword ptr [rax + r10*8]
0x100467f5a: mov rax, qword ptr [rcx + r10*8]
0x100467f5e: movabs rcx, 0x700000003
0x100467f68: mov qword ptr [rbx + 0x120], rcx
0x100467f6f: sub rsp, 0x10
0x100467f73: mov qword ptr [rsp + 8], rax
0x100467f78: mov dword ptr [rsp], 0
0x100467f7f: mov esi, 1
0x100467f84: mov r8d, 1
0x100467f8a: mov r9d, 2
0x100467f90: lea rdx, [rbx + 0x120]
0x100467f97: lea rcx, [rbx + 0x124]
0x100467f9e: call 0x1007f5430 ; 0x1007f5430
0x100467fa3: add rsp, 0x10
0x100467fa7: mov r14, qword ptr [rbx + 8]
0x100467fab: mov rax, qword ptr [rbx + 0x60]
0x100467faf: cmp qword ptr [rbx + 0x48], rax
0x100467fb3: jne 0x100468090
0x100467fb9: mov rdi, qword ptr [r15 + 0x3a8]
0x100467fc0: mov rax, qword ptr [rbx + 0x20]
0x100467fc4: mov rcx, qword ptr [rbx + 0x10]
0x100467fc8: movsxd rax, dword ptr [rax + rcx + 0x38]
0x100467fcd: imul rax, rax, 0x55555556
0x100467fd4: mov rcx, rax
0x100467fd7: shr rcx, 0x3f
0x100467fdb: shr rax, 0x20
0x100467fdf: add eax, ecx
0x100467fe1: movsxd rsi, eax
0x100467fe4: shl rsi, 4
0x100467fe8: mov rdx, qword ptr [rip + 0x1b9f8b9] ; 0x1020078a8
0x100467fef: mov ecx, 0x10
0x100467ff4: call 0x100795530 ; 0x100795530
0x100467ff9: mov rcx, qword ptr [rbx + 0x20]
0x100467ffd: mov rdx, qword ptr [rbx + 0x10]
0x100468001: lea r8, [rcx + rdx + 0x38]
0x100468006: mov rdx, qword ptr [r15 + 0x48]
0x10046800a: mov r14, qword ptr [rbx + 8]
0x10046800e: mov qword ptr [rdx + r14*8], rax
0x100468012: mov eax, dword ptr [r8]
0x100468015: add eax, 2
0x100468018: cmp eax, 5
0x10046801b: jb 0x100468090
0x10046801d: mov rax, qword ptr [rbx + 0x20]
0x100468021: mov rcx, qword ptr [rbx + 0x10]
0x100468025: mov r9, qword ptr [rax + rcx + 0x80]
0x10046802d: mov rdx, qword ptr [r15 + 0x48]
0x100468031: mov rdx, qword ptr [rdx + r14*8]
0x100468035: xor esi, esi
0x100468037: mov edi, 2
0x10046803c: nop dword ptr [rax]
0x100468040: lea ecx, [rdi - 2]
0x100468043: mov ecx, dword ptr [r9 + rcx*4]
0x100468047: mov eax, esi
0x100468049: shl rax, 4
0x10046804d: mov dword ptr [rdx + rax], ecx
0x100468050: lea ecx, [rdi - 1]
0x100468053: mov ecx, dword ptr [r9 + rcx*4]
0x100468057: mov dword ptr [rdx + rax + 4], ecx
0x10046805b: mov ecx, edi
0x10046805d: mov ecx, dword ptr [r9 + rcx*4]
0x100468061: mov dword ptr [rdx + rax + 8], ecx
0x100468065: inc esi
0x100468067: movsxd rax, dword ptr [r8]
0x10046806a: imul rax, rax, 0x55555556
0x100468071: mov rcx, rax
0x100468074: shr rcx, 0x3f
0x100468078: shr rax, 0x20
0x10046807c: add eax, ecx
0x10046807e: add edi, 3
0x100468081: cmp esi, eax
0x100468083: jb 0x100468040
0x100468085: nop word ptr cs:[rax + rax]
0x100468090: cmp byte ptr [r15 + 0x340], 0
0x100468098: je 0x1004680e3
0x10046809a: mov rdi, qword ptr [r15 + 0x3a8]
0x1004680a1: movsxd rax, dword ptr [r12]
0x1004680a5: shl rax, 2
0x1004680a9: lea rsi, [rax + rax*2]
0x1004680ad: mov rdx, qword ptr [rip + 0x1b9f7f4] ; 0x1020078a8
0x1004680b4: mov ecx, 0x10
0x1004680b9: call 0x100795530 ; 0x100795530
0x1004680be: mov rcx, qword ptr [r15 + 0x20]
0x1004680c2: mov r14, qword ptr [rbx + 8]
0x1004680c6: mov qword ptr [rcx + r14*8], rax
0x1004680ca: mov rax, qword ptr [r15 + 0x20]
0x1004680ce: mov rdi, qword ptr [rax + r14*8]
0x1004680d2: movsxd rax, dword ptr [r12]
0x1004680d6: shl rax, 2
0x1004680da: lea rsi, [rax + rax*2]
0x1004680de: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x1004680e3: mov rdx, qword ptr [rbx + 0x60]
0x1004680e7: cmp qword ptr [rbx + 0x48], rdx
0x1004680eb: sete al
0x1004680ee: or al, byte ptr [rbx + 0x1b]
0x1004680f1: jne 0x100468290
0x1004680f7: cmp byte ptr [r15 + 0x368], 0
0x1004680ff: je 0x100468290
0x100468105: vmovss xmm0, dword ptr [r15 + 0x36c]
0x10046810e: vucomiss xmm0, dword ptr [rip + 0x63efce] ; 0x100aa70e4
0x100468116: jbe 0x100468290
0x10046811c: mov rax, qword ptr [rbx + 0x20]
0x100468120: mov rcx, qword ptr [rbx + 0x10]
0x100468124: mov r14d, dword ptr [rax + rcx + 0x38]
0x100468129: call 0x1007c6c20 ; 0x1007c6c20
0x10046812e: shl r14, 2
0x100468132: lea rcx, [rip + 0x1be0a17] ; 0x102048b50
0x100468139: mov rdx, qword ptr [rcx]
0x10046813c: mov ecx, 4
0x100468141: mov rdi, rax
0x100468144: mov rsi, r14
0x100468147: call 0x100795530 ; 0x100795530
0x10046814c: mov r13, rax
0x10046814f: mov rax, qword ptr [rbx + 0x20]
0x100468153: mov rcx, qword ptr [rbx + 0x10]
0x100468157: lea rax, [rax + rcx + 0x38]
0x10046815c: mov qword ptr [rbx + 0x58], rax
0x100468160: mov r10d, dword ptr [rax]
0x100468163: lea eax, [r10 + 2]
0x100468167: xor r8d, r8d
0x10046816a: cmp eax, 5
0x10046816d: jb 0x100468257
0x100468173: vmovss xmm0, dword ptr [rip + 0x63fb49] ; 0x100aa7cc4
0x10046817b: vmulss xmm0, xmm0, dword ptr [r15 + 0x36c]
0x100468184: vcvttss2si r14d, xmm0
0x100468188: mov rax, qword ptr [rbx + 0x20]
0x10046818c: mov rcx, qword ptr [rbx + 0x10]
0x100468190: mov r11, qword ptr [rax + rcx + 0x60]
0x100468195: mov r12, qword ptr [rax + rcx + 0x80]
0x10046819d: xor edi, edi
0x10046819f: xor r8d, r8d
0x1004681a2: xor eax, eax
0x1004681a4: nop word ptr cs:[rax + rax]
0x1004681b0: mov r9d, edi
0x1004681b3: mov ecx, dword ptr [r12 + r9*4]
0x1004681b7: shl rcx, 4
0x1004681bb: cmp byte ptr [r11 + rcx + 0xe], r14b
0x1004681c0: setbe cl
0x1004681c3: jbe 0x1004681f8
0x1004681c5: lea esi, [rdi + 1]
0x1004681c8: mov esi, dword ptr [r12 + rsi*4]
0x1004681cc: shl rsi, 4
0x1004681d0: movzx esi, byte ptr [r11 + rsi + 0xe]
0x1004681d6: cmp sil, r14b
0x1004681d9: setbe dl
0x1004681dc: or cl, dl
0x1004681de: cmp sil, r14b
0x1004681e1: jbe 0x1004681f8
0x1004681e3: lea edx, [rdi + 2]
0x1004681e6: mov edx, dword ptr [r12 + rdx*4]
0x1004681ea: shl rdx, 4
0x1004681ee: cmp byte ptr [r11 + rdx + 0xe], r14b
0x1004681f3: setbe dl
0x1004681f6: or cl, dl
0x1004681f8: test cl, cl
0x1004681fa: je 0x100468233
0x1004681fc: mov ecx, dword ptr [r12 + r9*4]
0x100468200: lea edx, [r8 + 1]
0x100468204: mov esi, r8d
0x100468207: mov dword ptr [r13 + rsi*4], ecx
0x10046820c: lea ecx, [rdi + 1]
0x10046820f: mov ecx, dword ptr [r12 + rcx*4]
0x100468213: lea esi, [r8 + 2]
0x100468217: mov dword ptr [r13 + rdx*4], ecx
0x10046821c: lea ecx, [rdi + 2]
0x10046821f: mov ecx, dword ptr [r12 + rcx*4]
0x100468223: mov dword ptr [r13 + rsi*4], ecx
0x100468228: add r8d, 3
0x10046822c: mov rcx, qword ptr [rbx + 0x58]
0x100468230: mov r10d, dword ptr [rcx]
0x100468233: inc eax
0x100468235: movsxd rcx, r10d
0x100468238: imul rcx, rcx, 0x55555556
0x10046823f: mov rdx, rcx
0x100468242: shr rdx, 0x3f
0x100468246: shr rcx, 0x20
0x10046824a: add ecx, edx
0x10046824c: add edi, 3
0x10046824f: cmp eax, ecx
0x100468251: jb 0x1004681b0
0x100468257: mov rax, qword ptr [r15 + 0x10]
0x10046825b: mov rcx, qword ptr [rbx + 8]
0x10046825f: mov rdi, qword ptr [rax + rcx*8]
0x100468263: xor esi, esi
0x100468265: mov edx, 9
0x10046826a: mov ecx, 1
0x10046826f: mov r9, r13
0x100468272: call 0x1007f55d0 ; 0x1007f55d0
0x100468277: call 0x1007c6c20 ; 0x1007c6c20
0x10046827c: mov rdi, rax
0x10046827f: mov rsi, r13
0x100468282: call 0x100795a70 ; 0x100795a70
0x100468287: jmp 0x1004682c4 ; 0x1004682c4
0x100468289: nop dword ptr [rax]
0x100468290: xor ecx, ecx
0x100468292: cmp qword ptr [rbx + 0x48], rdx
0x100468296: sete cl
0x100468299: mov rax, qword ptr [r15 + 0x10]
0x10046829d: mov rdi, qword ptr [rax + r14*8]
0x1004682a1: inc ecx
0x1004682a3: mov rax, qword ptr [rbx + 0x20]
0x1004682a7: mov rdx, qword ptr [rbx + 0x10]
0x1004682ab: mov r8d, dword ptr [rax + rdx + 0x38]
0x1004682b0: mov r9, qword ptr [rax + rdx + 0x80]
0x1004682b8: xor esi, esi
0x1004682ba: mov edx, 9
0x1004682bf: call 0x1007f55d0 ; 0x1007f55d0
0x1004682c4: cmp dword ptr [rbx + 0x3c], 0
0x1004682c8: je 0x10046865a
0x1004682ce: mov rax, qword ptr [rbx + 0x20]
0x1004682d2: mov rcx, qword ptr [rbx + 0x10]
0x1004682d6: mov r14d, dword ptr [rax + rcx + 0x3c]
0x1004682db: call 0x1007c6c20 ; 0x1007c6c20
0x1004682e0: shl r14, 2
0x1004682e4: lea rcx, [rip + 0x1be0865] ; 0x102048b50
0x1004682eb: mov rdx, qword ptr [rcx]
0x1004682ee: mov ecx, 4
0x1004682f3: mov rdi, rax
0x1004682f6: mov rsi, r14
0x1004682f9: call 0x100795530 ; 0x100795530
0x1004682fe: mov r13, rax
0x100468301: mov rax, qword ptr [rbx + 0x20]
0x100468305: mov rcx, qword ptr [rbx + 0x10]
0x100468309: lea rax, [rax + rcx + 0x3c]
0x10046830e: cmp dword ptr [rax], 0
0x100468311: je 0x1004685cb
0x100468317: xor ecx, ecx
0x100468319: mov r14, qword ptr [rbx + 8]
0x10046831d: nop dword ptr [rax]
0x100468320: mov edx, ecx
0x100468322: mov dword ptr [r13 + rdx*4], ecx
0x100468327: inc ecx
0x100468329: mov r8d, dword ptr [rax]
0x10046832c: cmp ecx, r8d
0x10046832f: jb 0x100468320
0x100468331: jmp 0x1004685d2 ; 0x1004685d2
0x100468336: mov rax, qword ptr [rip + 0x7a21e3] ; 0x100c0a520
0x10046833d: mov rcx, rax
0x100468340: lea rax, [rcx + 0x18]
0x100468344: mov qword ptr [rbx + 0x120], rax
0x10046834b: lea rax, [rcx + 0x40]
0x10046834f: mov qword ptr [rbx + 0x270], rax
0x100468356: lea rdi, [rbx + 0x270]
0x10046835d: lea r14, [rbx + 0x128]
0x100468364: mov rsi, r14
0x100468367: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x10046836c: mov qword ptr [rbx + 0x2f8], 0
0x100468377: mov dword ptr [rbx + 0x300], 0xffffffff
0x100468381: mov rdi, r14
0x100468384: mov rax, qword ptr [rip + 0x7a523d] ; 0x100c0d5c8
0x10046838b: lea r13, [rax + 0x18]
0x10046838f: mov qword ptr [rbx + 0x120], r13
0x100468396: lea r14, [rax + 0x40]
0x10046839a: mov qword ptr [rbx + 0x270], r14
0x1004683a1: mov edx, 1
0x1004683a6: lea rsi, [rip + 0x7215fa] ; 0x100b899a7 Model
0x1004683ad: call 0x1007a56a0 ; 0x1007a56a0
0x1004683b2: mov qword ptr [rbx + 0x50], r14
0x1004683b6: mov edx, 0x14
0x1004683bb: lea rdi, [rbx + 0x120]
0x1004683c2: lea rsi, [rip + 0x7219e4] ; 0x100b89dad Unbaked LevelMesh : 
0x1004683c9: call 0x100011930 ; 0x100011930
0x1004683ce: mov r14, rax
0x1004683d1: lea rax, [rbp + 0x50]
0x1004683d5: mov rdi, rax
0x1004683d8: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1004683dd: mov rdi, r14
0x1004683e0: lea rsi, [rbp + 0x50]
0x1004683e4: mov rdx, rax
0x1004683e7: call 0x100011930 ; 0x100011930
0x1004683ec: mov edx, 9
0x1004683f1: mov rdi, rax
0x1004683f4: lea rsi, [rip + 0x7219c7] ; 0x100b89dc2   (lod : 
0x1004683fb: call 0x100011930 ; 0x100011930
0x100468400: mov rdi, rax
0x100468403: mov rsi, qword ptr [rbx + 8]
0x100468407: call 0x100aa23de ; 0x100aa23de __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
0x10046840c: mov edx, 1
0x100468411: mov rdi, rax
0x100468414: lea rsi, [rip + 0x6f4679] ; 0x100b5ca94 )
0x10046841b: call 0x100011930 ; 0x100011930
0x100468420: mov qword ptr [rbx + 0x120], r13
0x100468427: mov rax, qword ptr [rbx + 0x50]
0x10046842b: mov qword ptr [rbx + 0x270], rax
0x100468432: lea rdi, [rbx + 0x128]
0x100468439: call 0x1007a58d0 ; 0x1007a58d0
0x10046843e: lea rdi, [rbx + 0x120]
0x100468445: mov rsi, qword ptr [rbx + 0x78]
0x100468449: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10046844e: lea rdi, [rbx + 0x270]
0x100468455: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10046845a: mov rax, qword ptr [rbp + 0xd0]
0x100468461: mov byte ptr [rax + 0x8f34], 1
0x100468468: lea rax, [rip + 0x1bd7271] ; 0x10203f6e0
0x10046846f: vmovaps xmm0, xmmword ptr [rax]
0x100468473: vmovaps xmmword ptr [rbx + 0x120], xmm0
0x10046847b: vmovaps xmm0, xmmword ptr [rip + 0x64513d] ; 0x100aad5c0
0x100468483: vmovaps xmmword ptr [rbx + 0xd0], xmm0
0x10046848b: lea rdi, [rbx + 0x90]
0x100468492: lea rsi, [rbx + 0xd0]
0x100468499: vmovss xmm0, dword ptr [rip + 0x640117] ; 0x100aa85b8
0x1004684a1: call 0x10077d310 ; 0x10077d310
0x1004684a6: vmovaps xmm0, xmmword ptr [rbx + 0x90]
0x1004684ae: vmovaps xmmword ptr [rbx + 0x120], xmm0
0x1004684b6: vmovaps xmm0, xmmword ptr [rip + 0x63fbe2] ; 0x100aa80a0
0x1004684be: vmovaps xmm1, xmmword ptr [rbx + 0x110]
0x1004684c6: vinsertps xmm1, xmm0, xmm1, 0xf5
0x1004684cc: vmovaps xmmword ptr [rbx + 0x110], xmm1
0x1004684d4: vmovaps xmmword ptr [rbx + 0x130], xmm1
0x1004684dc: vmovss xmm0, dword ptr [rip + 0x63cbdc] ; 0x100aa50c0
0x1004684e4: vmovaps xmmword ptr [rbx + 0x140], xmm0
0x1004684ec: mov r14d, dword ptr [r12]
0x1004684f0: call 0x1007c6c20 ; 0x1007c6c20
0x1004684f5: shl r14, 2
0x1004684f9: lea rsi, [r14 + r14*2]
0x1004684fd: lea rcx, [rip + 0x1be064c] ; 0x102048b50
0x100468504: mov rdx, qword ptr [rcx]
0x100468507: mov ecx, 4
0x10046850c: mov rdi, rax
0x10046850f: call 0x100795530 ; 0x100795530
0x100468514: mov r13, rax
0x100468517: cmp dword ptr [r12], 0
0x10046851c: je 0x100468551
0x10046851e: xor r14d, r14d
0x100468521: nop word ptr cs:[rax + rax]
0x100468530: mov eax, r14d
0x100468533: lea rax, [rax + rax*2]
0x100468537: lea rsi, [r13 + rax*4]
0x10046853c: lea rdi, [rbx + 0x120]
0x100468543: call 0x100414530 ; 0x100414530
0x100468548: inc r14d
0x10046854b: cmp r14d, dword ptr [r12]
0x10046854f: jb 0x100468530
0x100468551: mov rax, qword ptr [r15 + 0x10]
0x100468555: mov r14, qword ptr [rbx + 8]
0x100468559: mov rdi, qword ptr [rax + r14*8]
0x10046855d: vmovaps xmm0, xmmword ptr [rip + 0x65abfb] ; 0x100ac3160
0x100468565: vmovaps xmmword ptr [rbx + 0x90], xmm0
0x10046856d: movabs rax, 0xf0000000e
0x100468577: mov qword ptr [rbx + 0xa0], rax
0x10046857e: sub rsp, 0x10
0x100468582: mov qword ptr [rsp + 8], r13
0x100468587: mov dword ptr [rsp], 0
0x10046858e: mov esi, 4
0x100468593: mov r8d, 3
0x100468599: mov r9d, 1
0x10046859f: lea rdx, [rbx + 0x90]
0x1004685a6: lea rcx, [rbx + 0x9c]
0x1004685ad: call 0x1007f5430 ; 0x1007f5430
0x1004685b2: add rsp, 0x10
0x1004685b6: call 0x1007c6c20 ; 0x1007c6c20
0x1004685bb: mov rdi, rax
0x1004685be: mov rsi, r13
0x1004685c1: call 0x100795a70 ; 0x100795a70
0x1004685c6: jmp 0x100467ec6 ; 0x100467ec6
0x1004685cb: xor r8d, r8d
0x1004685ce: mov r14, qword ptr [rbx + 8]
0x1004685d2: mov rax, qword ptr [r15 + 0x10]
0x1004685d6: mov rdi, qword ptr [rax + r14*8]
0x1004685da: mov esi, 2
0x1004685df: mov edx, 9
0x1004685e4: mov ecx, 2
0x1004685e9: mov r9, r13
0x1004685ec: call 0x1007f55d0 ; 0x1007f55d0
0x1004685f1: mov rax, qword ptr [r15 + 0x40]
0x1004685f5: mov rax, qword ptr [rax + r14*8]
0x1004685f9: cmp byte ptr [rax + 0x52a], 1
0x100468600: je 0x10046942e
0x100468606: mov dword ptr [rax + 0x524], 0
0x100468610: call 0x1007c6c20 ; 0x1007c6c20
0x100468615: mov rdi, rax
0x100468618: mov rsi, r13
0x10046861b: call 0x100795a70 ; 0x100795a70
0x100468620: mov rax, qword ptr [r15 + 0x10]
0x100468624: mov rdi, qword ptr [rax + r14*8]
0x100468628: vmovss xmm0, dword ptr [r15 + 0x36c]
0x100468631: vucomiss xmm0, dword ptr [rip + 0x63eaab] ; 0x100aa70e4
0x100468639: seta al
0x10046863c: movzx ecx, byte ptr [r15 + 0x368]
0x100468644: test ecx, ecx
0x100468646: sete dl
0x100468649: or dl, al
0x10046864b: movzx edx, dl
0x10046864e: mov rsi, qword ptr [rbx + 0x80]
0x100468655: call 0x100469a80 ; 0x100469a80
0x10046865a: mov rax, qword ptr [r15 + 0x10]
0x10046865e: mov rcx, qword ptr [rbx + 8]
0x100468662: mov rdi, qword ptr [rax + rcx*8]
0x100468666: call 0x1007f5690 ; 0x1007f5690
0x10046866b: mov rax, qword ptr [r15 + 0x28]
0x10046866f: mov rdx, qword ptr [rbx + 8]
0x100468673: mov rax, qword ptr [rax + rdx*8]
0x100468677: cmp byte ptr [rax + 0x52a], 1
0x10046867e: je 0x100469265
0x100468684: mov rcx, qword ptr [r15 + 8]
0x100468688: mov rcx, qword ptr [rcx + rdx*8]
0x10046868c: vmovaps xmm0, xmmword ptr [rcx + 0x30]
0x100468691: vmovaps xmmword ptr [rax + 0x50], xmm0
0x100468696: vmovaps xmm0, xmmword ptr [rcx + 0x40]
0x10046869b: vmovaps xmmword ptr [rax + 0x60], xmm0
0x1004686a0: vmovaps xmm0, xmmword ptr [rcx + 0x50]
0x1004686a5: vmovaps xmmword ptr [rax + 0x70], xmm0
0x1004686aa: vmovaps xmm0, xmmword ptr [rcx + 0x60]
0x1004686af: vmovaps xmmword ptr [rax + 0x80], xmm0
0x1004686b7: mov rax, qword ptr [r15 + 0x30]
0x1004686bb: mov rax, qword ptr [rax + rdx*8]
0x1004686bf: cmp byte ptr [rax + 0x52a], 1
0x1004686c6: je 0x100469265
0x1004686cc: mov rcx, qword ptr [r15 + 8]
0x1004686d0: mov rcx, qword ptr [rcx + rdx*8]
0x1004686d4: vmovaps xmm0, xmmword ptr [rcx + 0x30]
0x1004686d9: vmovaps xmmword ptr [rax + 0x50], xmm0
0x1004686de: vmovaps xmm0, xmmword ptr [rcx + 0x40]
0x1004686e3: vmovaps xmmword ptr [rax + 0x60], xmm0
0x1004686e8: vmovaps xmm0, xmmword ptr [rcx + 0x50]
0x1004686ed: vmovaps xmmword ptr [rax + 0x70], xmm0
0x1004686f2: vmovaps xmm0, xmmword ptr [rcx + 0x60]
0x1004686f7: vmovaps xmmword ptr [rax + 0x80], xmm0
0x1004686ff: mov rax, qword ptr [r15 + 0x38]
0x100468703: mov rax, qword ptr [rax + rdx*8]
0x100468707: cmp byte ptr [rax + 0x52a], 1
0x10046870e: je 0x100469265
0x100468714: mov rcx, qword ptr [r15 + 8]
0x100468718: mov rcx, qword ptr [rcx + rdx*8]
0x10046871c: vmovaps xmm0, xmmword ptr [rcx + 0x30]
0x100468721: vmovaps xmmword ptr [rax + 0x50], xmm0
0x100468726: vmovaps xmm0, xmmword ptr [rcx + 0x40]
0x10046872b: vmovaps xmmword ptr [rax + 0x60], xmm0
0x100468730: vmovaps xmm0, xmmword ptr [rcx + 0x50]
0x100468735: vmovaps xmmword ptr [rax + 0x70], xmm0
0x10046873a: vmovaps xmm0, xmmword ptr [rcx + 0x60]
0x10046873f: vmovaps xmmword ptr [rax + 0x80], xmm0
0x100468747: mov rax, qword ptr [r15 + 0x40]
0x10046874b: mov rax, qword ptr [rax + rdx*8]
0x10046874f: cmp byte ptr [rax + 0x52a], 1
0x100468756: je 0x100469265
0x10046875c: mov rcx, qword ptr [r15 + 8]
0x100468760: mov rcx, qword ptr [rcx + rdx*8]
0x100468764: vmovaps xmm0, xmmword ptr [rcx + 0x30]
0x100468769: vmovaps xmmword ptr [rax + 0x50], xmm0
0x10046876e: vmovaps xmm0, xmmword ptr [rcx + 0x40]
0x100468773: vmovaps xmmword ptr [rax + 0x60], xmm0
0x100468778: vmovaps xmm0, xmmword ptr [rcx + 0x50]
0x10046877d: vmovaps xmmword ptr [rax + 0x70], xmm0
0x100468782: vmovaps xmm0, xmmword ptr [rcx + 0x60]
0x100468787: vmovaps xmmword ptr [rax + 0x80], xmm0
0x10046878f: mov rax, qword ptr [r15 + 0x10]
0x100468793: mov rcx, qword ptr [r15 + 0x28]
0x100468797: mov rdi, qword ptr [rcx + rdx*8]
0x10046879b: mov rsi, qword ptr [rax + rdx*8]
0x10046879f: mov rax, qword ptr [rbx + 0xb0]
0x1004687a6: test rax, rax
0x1004687a9: je 0x1004687b1
0x1004687ab: mov rdx, qword ptr [rax + 0x10]
0x1004687af: jmp 0x1004687b3 ; 0x1004687b3
0x1004687b1: xor edx, edx
0x1004687b3: add rdx, 0x100
0x1004687ba: mov r8d, 1
0x1004687c0: mov rcx, qword ptr [rbx + 0x60]
0x1004687c4: call 0x1007f5e90 ; 0x1007f5e90
0x1004687c9: cmp dword ptr [rbx + 0x3c], 0
0x1004687cd: lea rcx, [rbp + 0x10]
0x1004687d1: je 0x100468a58
0x1004687d7: mov rax, qword ptr [r15 + 0x358]
0x1004687de: mov dl, byte ptr [rax]
0x1004687e0: xor eax, eax
0x1004687e2: mov byte ptr [rbx + 0x20], dl
0x1004687e5: test dl, dl
0x1004687e7: sete al
0x1004687ea: mov r14, qword ptr [rcx + 0x88]
0x1004687f1: lea r12, [rip + 0x7215da] ; 0x100b89dd2 CloudPoint
0x1004687f8: lea rcx, [rip + 0x7215cd] ; 0x100b89dcc Point
0x1004687ff: cmovne r12, rcx
0x100468803: lea r13, [rax + rax*4]
0x100468807: mov rdi, r14
0x10046880a: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x10046880f: lea rax, [rax + r13 + 0x15]
0x100468814: and rax, 0xfffffffffffffff0
0x100468818: mov r13, rsp
0x10046881b: sub r13, rax
0x10046881e: mov rsp, r13
0x100468821: mov rdi, r13
0x100468824: mov rsi, r14
0x100468827: call 0x100aa2c5a ; 0x100aa2c5a _strcpy
0x10046882c: mov rdi, r13
0x10046882f: mov rsi, r12
0x100468832: call 0x100aa2c42 ; 0x100aa2c42 _strcat
0x100468837: mov rax, qword ptr [r15 + 0x10]
0x10046883b: mov rcx, qword ptr [r15 + 0x40]
0x10046883f: mov r14, qword ptr [rbx + 8]
0x100468843: mov rdi, qword ptr [rcx + r14*8]
0x100468847: mov rsi, qword ptr [rax + r14*8]
0x10046884b: mov r9d, 1
0x100468851: mov r12, qword ptr [rbx + 0x30]
0x100468855: mov rdx, r12
0x100468858: mov rcx, r13
0x10046885b: mov r8, qword ptr [rbx + 0xf0]
0x100468862: call 0x1007f5d90 ; 0x1007f5d90
0x100468867: mov rax, qword ptr [r15 + 0x40]
0x10046886b: mov rax, qword ptr [rax + r14*8]
0x10046886f: cmp byte ptr [rax + 0x52a], 1
0x100468876: je 0x100469403
0x10046887c: mov dword ptr [rax + 0x508], 2
0x100468886: lea rdi, [rbx + 0x120]
0x10046888d: call 0x1007c2530 ; 0x1007c2530
0x100468892: mov r14, qword ptr [rbx + 0x40]
0x100468896: call 0x10079ac90 ; 0x10079ac90
0x10046889b: mov rdi, r12
0x10046889e: mov rsi, rax
0x1004688a1: lea rdx, [rip + 0x721535] ; 0x100b89ddd ThreeDee
0x1004688a8: call 0x1007c4360 ; 0x1007c4360
0x1004688ad: test rax, rax
0x1004688b0: je 0x1004688c3
0x1004688b2: mov rdi, rax
0x1004688b5: lea rsi, [rbx + 0x120]
0x1004688bc: call 0x1007c2310 ; 0x1007c2310
0x1004688c1: jmp 0x1004688db ; 0x1004688db
0x1004688c3: call 0x10079ac90 ; 0x10079ac90
0x1004688c8: mov rsi, qword ptr [rax + 8]
0x1004688cc: mov rdi, r12
0x1004688cf: lea rdx, [rip + 0x721507] ; 0x100b89ddd ThreeDee
0x1004688d6: call 0x1007c4640 ; 0x1007c4640
0x1004688db: mov rax, qword ptr [r15 + 0x40]
0x1004688df: mov rcx, qword ptr [rbx + 8]
0x1004688e3: mov rdi, qword ptr [rax + rcx*8]
0x1004688e7: cmp byte ptr [rdi + 0x538], 0
0x1004688ee: je 0x1004693bf
0x1004688f4: add rdi, 0x270
0x1004688fb: mov rax, qword ptr [rbx + 0x120]
0x100468902: test rax, rax
0x100468905: je 0x10046891b
0x100468907: mov rax, qword ptr [rax + 0x10]
0x10046890b: lea rdx, [rax + 0xb0]
0x100468912: test rax, rax
0x100468915: cmove rdx, rax
0x100468919: jmp 0x10046891d ; 0x10046891d
0x10046891b: xor edx, edx
0x10046891d: xor ecx, ecx
0x10046891f: lea rsi, [rip + 0x71ec23] ; 0x100b87549 u_noiseTexture
0x100468926: call 0x1007be8b0 ; 0x1007be8b0
0x10046892b: mov rax, qword ptr [r15 + 0x40]
0x10046892f: mov rcx, qword ptr [rbx + 8]
0x100468933: mov rdi, qword ptr [rax + rcx*8]
0x100468937: cmp byte ptr [rdi + 0x538], 0
0x10046893e: je 0x1004693e1
0x100468944: add rdi, 0x270
0x10046894b: vmovss xmm0, dword ptr [r14 + 0x40]
0x100468951: lea rsi, [rip + 0x72148e] ; 0x100b89de6 u_pointFinAlphaMult
0x100468958: call 0x1007be530 ; 0x1007be530
0x10046895d: cmp byte ptr [rbx + 0x20], 0
0x100468961: je 0x100468a4c
0x100468967: lea rdi, [rbx + 0x90]
0x10046896e: call 0x1007c2530 ; 0x1007c2530
0x100468973: mov r14, qword ptr [r15 + 0x358]
0x10046897a: call 0x10079cb20 ; 0x10079cb20
0x10046897f: mov rdi, r12
0x100468982: mov rsi, rax
0x100468985: mov rdx, r14
0x100468988: call 0x1007c4360 ; 0x1007c4360
0x10046898d: test rax, rax
0x100468990: je 0x100468b8a
0x100468996: mov rdi, rax
0x100468999: lea rsi, [rbx + 0x90]
0x1004689a0: call 0x1007c2310 ; 0x1007c2310
0x1004689a5: mov rax, qword ptr [rbx + 0x90]
0x1004689ac: test rax, rax
0x1004689af: je 0x10046937b
0x1004689b5: mov rax, qword ptr [rax + 0x10]
0x1004689b9: test rax, rax
0x1004689bc: je 0x10046937b
0x1004689c2: mov rcx, qword ptr [r15 + 0x40]
0x1004689c6: mov r14, qword ptr [rbx + 8]
0x1004689ca: mov rdi, qword ptr [rcx + r14*8]
0x1004689ce: cmp byte ptr [rdi + 0x538], 0
0x1004689d5: je 0x10046939d
0x1004689db: vmovups xmm0, xmmword ptr [rax + 0xa8]
0x1004689e3: vmovaps xmmword ptr [rbx + 0x20], xmm0
0x1004689e8: mov rdx, qword ptr [rax + 0xa0]
0x1004689ef: add rdi, 0x270
0x1004689f6: xor ecx, ecx
0x1004689f8: lea rsi, [rip + 0x7213fb] ; 0x100b89dfa u_sprite
0x1004689ff: call 0x1007be8b0 ; 0x1007be8b0
0x100468a04: vmovaps xmm0, xmmword ptr [rbx + 0x20]
0x100468a09: vmovaps xmmword ptr [rbx + 0xd0], xmm0
0x100468a11: mov rax, qword ptr [r15 + 0x40]
0x100468a15: mov rdi, qword ptr [rax + r14*8]
0x100468a19: cmp byte ptr [rdi + 0x538], 0
0x100468a20: je 0x100469359
0x100468a26: add rdi, 0x270
0x100468a2d: lea rsi, [rip + 0x7213cf] ; 0x100b89e03 u_spriteFrame
0x100468a34: lea rdx, [rbx + 0xd0]
0x100468a3b: call 0x1007be690 ; 0x1007be690
0x100468a40: lea rdi, [rbx + 0x90]
0x100468a47: call 0x1007c2570 ; 0x1007c2570
0x100468a4c: lea rdi, [rbx + 0x120]
0x100468a53: call 0x1007c2570 ; 0x1007c2570
0x100468a58: mov eax, dword ptr [rbx + 0x1c]
0x100468a5b: test al, al
0x100468a5d: jne 0x100468a6d
0x100468a5f: cmp byte ptr [r15 + 0x351], 0
0x100468a67: je 0x100468b7e
0x100468a6d: mov rsi, qword ptr [r15 + 0x10]
0x100468a71: mov rcx, qword ptr [r15 + 0x30]
0x100468a75: mov rdx, qword ptr [rbx + 8]
0x100468a79: mov rdi, qword ptr [rcx + rdx*8]
0x100468a7d: mov rsi, qword ptr [rsi + rdx*8]
0x100468a81: test al, al
0x100468a83: lea rcx, [rip + 0x721387] ; 0x100b89e11 StaticMeshMotion
0x100468a8a: lea rax, [rip + 0x70e012] ; 0x100b76aa3 MeshMotion
0x100468a91: cmovne rcx, rax
0x100468a95: mov r9d, 1
0x100468a9b: mov rdx, qword ptr [rbx + 0x30]
0x100468a9f: mov r8, qword ptr [rbx + 0x100]
0x100468aa6: call 0x1007f5d90 ; 0x1007f5d90
0x100468aab: mov rax, qword ptr [r15 + 0x30]
0x100468aaf: mov rcx, qword ptr [rbx + 8]
0x100468ab3: mov rdi, qword ptr [rax + rcx*8]
0x100468ab7: cmp byte ptr [rdi + 0x538], 0
0x100468abe: je 0x100469337
0x100468ac4: add rdi, 0x270
0x100468acb: mov ecx, 0x10
0x100468ad0: lea rsi, [rip + 0x70e0c9] ; 0x100b76ba0 u_modelOld
0x100468ad7: mov rdx, qword ptr [rbx + 0xf8]
0x100468ade: call 0x1007be7f0 ; 0x1007be7f0
0x100468ae3: mov byte ptr [r15 + 0x391], 1
0x100468aeb: mov r14, qword ptr [rbx + 8]
0x100468aef: mov eax, dword ptr [r15 + 0x88]
0x100468af6: lea ecx, [rax - 1]
0x100468af9: cmp ecx, r14d
0x100468afc: lea r12, [rip + 0x70b7dd] ; 0x100b742e0 UnlitAlpha
0x100468b03: mov rcx, qword ptr [rbx + 0x80]
0x100468b0a: jbe 0x100468bbb
0x100468b10: vmovss xmm0, dword ptr [rcx]
0x100468b14: vandps xmm1, xmm0, xmmword ptr [rip + 0x63edf4] ; 0x100aa7910
0x100468b1c: vmovss xmm2, dword ptr [rip + 0x63eda0] ; 0x100aa78c4
0x100468b24: vucomiss xmm2, xmm1
0x100468b28: jb 0x100468b60
0x100468b2a: add eax, -2
0x100468b2d: cmp eax, r14d
0x100468b30: jne 0x100468b60
0x100468b32: vmovss xmm0, dword ptr [rip + 0x645ec6] ; 0x100aaea00
0x100468b3a: test r14d, r14d
0x100468b3d: je 0x100468bb1
0x100468b3f: lea eax, [r14 - 1]
0x100468b43: vmovss xmm1, dword ptr [r15 + rax*4 + 0xa4]
0x100468b4d: vmulss xmm0, xmm1, dword ptr [rip + 0x63ec9b] ; 0x100aa77f0
0x100468b55: vucomiss xmm0, xmm1
0x100468b59: jae 0x100468bb1
0x100468b5b: jmp 0x100469487 ; 0x100469487
0x100468b60: test r14d, r14d
0x100468b63: je 0x100468ba3
0x100468b65: lea eax, [r14 - 1]
0x100468b69: vmovss xmm1, dword ptr [r15 + rax*4 + 0xa4]
0x100468b73: vucomiss xmm0, xmm1
0x100468b77: jae 0x100468bb1
0x100468b79: jmp 0x100469487 ; 0x100469487
0x100468b7e: mov dword ptr [rbx + 0x1c], 0
0x100468b85: jmp 0x100468aeb ; 0x100468aeb
0x100468b8a: call 0x10079cb20 ; 0x10079cb20
0x100468b8f: mov rsi, qword ptr [rax + 8]
0x100468b93: mov rdi, r12
0x100468b96: mov rdx, r14
0x100468b99: call 0x1007c4640 ; 0x1007c4640
0x100468b9e: jmp 0x1004689a5 ; 0x1004689a5
0x100468ba3: vxorps xmm1, xmm1, xmm1
0x100468ba7: vucomiss xmm0, xmm1
0x100468bab: jb 0x100469487
0x100468bb1: vmovss dword ptr [r15 + r14*4 + 0xa4], xmm0
0x100468bbb: call 0x1007c6c20 ; 0x1007c6c20
0x100468bc0: mov rdi, rax
0x100468bc3: mov rsi, qword ptr [rbx + 0x68]
0x100468bc7: call 0x100795a70 ; 0x100795a70
0x100468bcc: call 0x1007c6c20 ; 0x1007c6c20
0x100468bd1: mov rdi, rax
0x100468bd4: mov rsi, qword ptr [rbx + 0x70]
0x100468bd8: call 0x100795a70 ; 0x100795a70
0x100468bdd: lea rdi, [rbx + 0xb0]
0x100468be4: call 0x1007c2570 ; 0x1007c2570
0x100468be9: inc r14d
0x100468bec: cmp r14d, dword ptr [r15 + 0x8c]
0x100468bf3: lea r13, [rbp + 0x10]
0x100468bf7: jb 0x10046776e
0x100468bfd: jmp 0x100468c02 ; 0x100468c02
0x100468bff: mov dword ptr [rbx + 0x1c], eax
0x100468c02: lea r14, [r15 + 0x160]
0x100468c09: mov rax, qword ptr [r15 + 0x28]
0x100468c0d: mov rax, qword ptr [rax]
0x100468c10: vmovaps xmm0, xmmword ptr [rax + 0x50]
0x100468c15: vmovaps xmmword ptr [r15 + 0x120], xmm0
0x100468c1e: vmovaps xmm0, xmmword ptr [rax + 0x60]
0x100468c23: vmovaps xmmword ptr [r15 + 0x130], xmm0
0x100468c2c: vmovaps xmm0, xmmword ptr [rax + 0x70]
0x100468c31: vmovaps xmmword ptr [r15 + 0x140], xmm0
0x100468c3a: vmovaps xmm0, xmmword ptr [rax + 0x80]
0x100468c42: vmovaps xmmword ptr [r15 + 0x150], xmm0
0x100468c4b: cmp byte ptr [r15 + 0x32a], 0
0x100468c53: je 0x100468d86
0x100468c59: vxorps ymm0, ymm0, ymm0
0x100468c5d: vmovups ymmword ptr [rbx + 0x130], ymm0
0x100468c65: vmovaps ymmword ptr [rbx + 0x120], ymm0
0x100468c6d: movabs rax, 0x3f800000ffffffff
0x100468c77: mov qword ptr [rbx + 0x150], rax
0x100468c7e: lea rdi, [rbx + 0xb0]
0x100468c85: vzeroupper 
0x100468c88: call 0x1007c2530 ; 0x1007c2530
0x100468c8d: call 0x1004559d0 ; 0x1004559d0
0x100468c92: mov rdi, qword ptr [rbx + 0x30]
0x100468c96: mov rsi, rax
0x100468c99: lea rdx, [rbp + 0x50]
0x100468c9d: call 0x1007c4360 ; 0x1007c4360
0x100468ca2: test rax, rax
0x100468ca5: je 0x100468dd5
0x100468cab: lea rsi, [rbx + 0xb0]
0x100468cb2: mov rdi, rax
0x100468cb5: call 0x1007c2310 ; 0x1007c2310
0x100468cba: mov rax, qword ptr [rbx + 0xb0]
0x100468cc1: test rax, rax
0x100468cc4: je 0x10046950a
0x100468cca: mov rax, qword ptr [rax + 0x10]
0x100468cce: test rax, rax
0x100468cd1: je 0x10046950a
0x100468cd7: mov esi, dword ptr [rax + 0x110]
0x100468cdd: test esi, esi
0x100468cdf: js 0x100469529
0x100468ce5: cmp byte ptr [r15 + 0x352], 0
0x100468ced: je 0x100468d08
0x100468cef: lea rax, [r15 + 0x352]
0x100468cf6: mov qword ptr [rbx + 0x140], rax
0x100468cfd: mov qword ptr [rbx + 0x148], 0x19
0x100468d08: mov rax, qword ptr [r15 + 8]
0x100468d0c: mov rax, qword ptr [rax]
0x100468d0f: mov rax, qword ptr [rax + 8]
0x100468d13: test rax, rax
0x100468d16: je 0x100468d38
0x100468d18: mov rax, qword ptr [rax + 0x28]
0x100468d1c: mov rax, qword ptr [rax + 8]
0x100468d20: mov qword ptr [rbx + 0x120], rax
0x100468d27: movabs rax, 0xc0000001c
0x100468d31: mov qword ptr [rbx + 0x128], rax
0x100468d38: mov dword ptr [rbx + 0x90], 0xffffffff
0x100468d42: lea rax, [rbx + 0x90]
0x100468d49: mov qword ptr [rbx + 0x130], rax
0x100468d50: mov qword ptr [rbx + 0x138], 0x1c
0x100468d5b: mov eax, 0x40
0x100468d60: cmp byte ptr [r15 + 0x32b], 0
0x100468d68: jne 0x100468df5
0x100468d6e: cmp byte ptr [r15 + 0x32d], 0
0x100468d76: je 0x100468df0
0x100468d78: movzx eax, byte ptr [r15 + 0x32c]
0x100468d80: lea eax, [rax + rax + 2]
0x100468d84: jmp 0x100468df5 ; 0x100468df5
0x100468d86: mov qword ptr [r15 + 0x50], 0
0x100468d8e: cmp byte ptr [r15 + 0x34b], 0
0x100468d96: jne 0x100468e40
0x100468d9c: mov qword ptr [r15 + 0x70], 0
0x100468da4: mov r12d, dword ptr [rbx + 0x1c]
0x100468da8: cmp byte ptr [r15 + 0x378], 0
0x100468db0: jne 0x100468eb3
0x100468db6: mov qword ptr [r15 + 0x78], 0
0x100468dbe: test r12b, 1
0x100468dc2: jne 0x100468f21
0x100468dc8: mov qword ptr [r15 + 0x68], 0
0x100468dd0: jmp 0x1004691ec ; 0x1004691ec
0x100468dd5: call 0x1004559d0 ; 0x1004559d0
0x100468dda: mov rsi, qword ptr [rax + 8]
0x100468dde: mov rdi, qword ptr [rbx + 0x30]
0x100468de2: lea rdx, [rbp + 0x50]
0x100468de6: call 0x1007c4640 ; 0x1007c4640
0x100468deb: jmp 0x100468cba ; 0x100468cba
0x100468df0: mov eax, 0x20
0x100468df5: mov dword ptr [rbx + 0x150], eax
0x100468dfb: mov rax, qword ptr [rbx + 0x40]
0x100468dff: mov eax, dword ptr [rax + 0x10]
0x100468e02: mov dword ptr [rbx + 0x154], eax
0x100468e08: lea r8, [r15 + 0x58]
0x100468e0c: lea rcx, [rbx + 0x120]
0x100468e13: mov rdi, qword ptr [rbx + 0x108]
0x100468e1a: mov rdx, r14
0x100468e1d: call 0x100778fd0 ; 0x100778fd0
0x100468e22: mov qword ptr [r15 + 0x50], rax
0x100468e26: lea rdi, [rbx + 0xb0]
0x100468e2d: call 0x1007c2570 ; 0x1007c2570
0x100468e32: cmp byte ptr [r15 + 0x34b], 0
0x100468e3a: je 0x100468d9c
0x100468e40: mov rdi, qword ptr [r15 + 0x3a8]
0x100468e47: mov rdx, qword ptr [rip + 0x1b9ea5a] ; 0x1020078a8
0x100468e4e: mov esi, 0x60
0x100468e53: mov ecx, 0x10
0x100468e58: call 0x100795530 ; 0x100795530
0x100468e5d: vxorps ymm0, ymm0, ymm0
0x100468e61: vmovups ymmword ptr [rax + 0x40], ymm0
0x100468e66: vmovups ymmword ptr [rax + 0x20], ymm0
0x100468e6b: vmovups ymmword ptr [rax], ymm0
0x100468e6f: mov qword ptr [r15 + 0x70], rax
0x100468e73: mov rsi, qword ptr [r15 + 0x3a8]
0x100468e7a: mov rcx, qword ptr [r15 + 8]
0x100468e7e: mov rcx, qword ptr [rcx]
0x100468e81: mov rdi, qword ptr [rcx]
0x100468e84: movsxd rcx, dword ptr [rcx + 0x10]
0x100468e88: imul rdx, rcx, 0xb8
0x100468e8f: add rdx, qword ptr [rdi + 0x48]
0x100468e93: mov rdi, rax
0x100468e96: mov rcx, r14
0x100468e99: vzeroupper 
0x100468e9c: call 0x10020f4f0 ; 0x10020f4f0
0x100468ea1: mov r12d, dword ptr [rbx + 0x1c]
0x100468ea5: cmp byte ptr [r15 + 0x378], 0
0x100468ead: je 0x100468db6
0x100468eb3: mov rdi, qword ptr [r15 + 0x3a8]
0x100468eba: mov rdx, qword ptr [rip + 0x1b9e9e7] ; 0x1020078a8
0x100468ec1: mov esi, 0x390
0x100468ec6: mov ecx, 0x10
0x100468ecb: call 0x100795530 ; 0x100795530
0x100468ed0: mov r14, rax
0x100468ed3: mov esi, 0x390
0x100468ed8: mov rdi, r14
0x100468edb: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x100468ee0: mov qword ptr [r15 + 0x78], r14
0x100468ee4: mov rsi, qword ptr [r15 + 0x3a8]
0x100468eeb: mov rax, qword ptr [r15 + 8]
0x100468eef: mov rax, qword ptr [rax]
0x100468ef2: mov rcx, qword ptr [rax]
0x100468ef5: mov rcx, qword ptr [rcx + 0x48]
0x100468ef9: movsxd rax, dword ptr [rax + 0x10]
0x100468efd: imul rax, rax, 0xb8
0x100468f04: mov edx, dword ptr [rcx + rax + 0x34]
0x100468f08: mov ecx, dword ptr [r13 + 0x80]
0x100468f0f: mov rdi, r14
0x100468f12: call 0x10028f360 ; 0x10028f360
0x100468f17: test r12b, 1
0x100468f1b: je 0x100468dc8
0x100468f21: mov r12, qword ptr [rbp + 0xa8]
0x100468f28: mov rdi, qword ptr [r15 + 0x3a8]
0x100468f2f: lea rax, [rip + 0x190b6d2] ; 0x101d74608
0x100468f36: mov rdx, qword ptr [rax]
0x100468f39: mov esi, 0x6230
0x100468f3e: mov ecx, 0x10
0x100468f43: call 0x100795530 ; 0x100795530
0x100468f48: mov r13, rax
0x100468f4b: mov rdi, r13
0x100468f4e: call 0x100106170 ; 0x100106170
0x100468f53: mov qword ptr [r15 + 0x68], r13
0x100468f57: xor r14d, r14d
0x100468f5a: xor r8d, r8d
0x100468f5d: mov rdi, r13
0x100468f60: mov rsi, r12
0x100468f63: mov r12, qword ptr [rbx + 0x30]
0x100468f67: mov rdx, qword ptr [rbp + 0xb0]
0x100468f6e: mov rcx, qword ptr [rbx + 0x88]
0x100468f75: call 0x1000941f0 ; 0x1000941f0
0x100468f7a: cmp dword ptr [r15 + 0x8c], 0
0x100468f82: je 0x1004690d6
0x100468f88: vmovss xmm3, dword ptr [rip + 0x63c130] ; 0x100aa50c0
0x100468f90: vmovaps xmm0, xmmword ptr [rip + 0x63f108] ; 0x100aa80a0
0x100468f98: vmovaps xmm1, xmmword ptr [rip + 0x63fa90] ; 0x100aa8a30
0x100468fa0: vmovaps xmm2, xmmword ptr [rip + 0x63fa58] ; 0x100aa8a00
0x100468fa8: nop dword ptr [rax + rax]
0x100468fb0: mov rax, qword ptr [r15 + 0x28]
0x100468fb4: mov ecx, r14d
0x100468fb7: mov rax, qword ptr [rax + rcx*8]
0x100468fbb: cmp byte ptr [rax + 0x52a], 1
0x100468fc2: je 0x10046921e
0x100468fc8: vmovaps xmmword ptr [rax + 0x10], xmm3
0x100468fcd: vmovaps xmmword ptr [rax + 0x20], xmm0
0x100468fd2: vmovaps xmmword ptr [rax + 0x30], xmm1
0x100468fd7: vmovaps xmmword ptr [rax + 0x40], xmm2
0x100468fdc: inc r14d
0x100468fdf: mov eax, dword ptr [r15 + 0x8c]
0x100468fe6: cmp r14d, eax
0x100468fe9: jb 0x100468fb0
0x100468feb: test eax, eax
0x100468fed: je 0x1004690d6
0x100468ff3: xor eax, eax
0x100468ff5: vmovss xmm3, dword ptr [rip + 0x63c0c3] ; 0x100aa50c0
0x100468ffd: nop dword ptr [rax]
0x100469000: mov rcx, qword ptr [r15 + 0x30]
0x100469004: mov edx, eax
0x100469006: mov rcx, qword ptr [rcx + rdx*8]
0x10046900a: cmp byte ptr [rcx + 0x52a], 1
0x100469011: je 0x10046921e
0x100469017: vmovaps xmmword ptr [rcx + 0x10], xmm3
0x10046901c: vmovaps xmmword ptr [rcx + 0x20], xmm0
0x100469021: vmovaps xmmword ptr [rcx + 0x30], xmm1
0x100469026: vmovaps xmmword ptr [rcx + 0x40], xmm2
0x10046902b: inc eax
0x10046902d: mov ecx, dword ptr [r15 + 0x8c]
0x100469034: cmp eax, ecx
0x100469036: jb 0x100469000
0x100469038: test ecx, ecx
0x10046903a: je 0x1004690d6
0x100469040: xor eax, eax
0x100469042: vmovss xmm3, dword ptr [rip + 0x63c076] ; 0x100aa50c0
0x10046904a: nop word ptr [rax + rax]
0x100469050: mov rcx, qword ptr [r15 + 0x38]
0x100469054: mov edx, eax
0x100469056: mov rcx, qword ptr [rcx + rdx*8]
0x10046905a: cmp byte ptr [rcx + 0x52a], 1
0x100469061: je 0x10046921e
0x100469067: vmovaps xmmword ptr [rcx + 0x10], xmm3
0x10046906c: vmovaps xmmword ptr [rcx + 0x20], xmm0
0x100469071: vmovaps xmmword ptr [rcx + 0x30], xmm1
0x100469076: vmovaps xmmword ptr [rcx + 0x40], xmm2
0x10046907b: inc eax
0x10046907d: mov ecx, dword ptr [r15 + 0x8c]
0x100469084: cmp eax, ecx
0x100469086: jb 0x100469050
0x100469088: test ecx, ecx
0x10046908a: je 0x1004690d6
0x10046908c: xor eax, eax
0x10046908e: vmovss xmm3, dword ptr [rip + 0x63c02a] ; 0x100aa50c0
0x100469096: nop word ptr cs:[rax + rax]
0x1004690a0: mov rcx, qword ptr [r15 + 0x40]
0x1004690a4: mov edx, eax
0x1004690a6: mov rcx, qword ptr [rcx + rdx*8]
0x1004690aa: cmp byte ptr [rcx + 0x52a], 1
0x1004690b1: je 0x10046921e
0x1004690b7: vmovaps xmmword ptr [rcx + 0x10], xmm3
0x1004690bc: vmovaps xmmword ptr [rcx + 0x20], xmm0
0x1004690c1: vmovaps xmmword ptr [rcx + 0x30], xmm1
0x1004690c6: vmovaps xmmword ptr [rcx + 0x40], xmm2
0x1004690cb: inc eax
0x1004690cd: cmp eax, dword ptr [r15 + 0x8c]
0x1004690d4: jb 0x1004690a0
0x1004690d6: vmovss xmm0, dword ptr [rip + 0x63bfe2] ; 0x100aa50c0
0x1004690de: vmovaps xmmword ptr [r15 + 0x1e0], xmm0
0x1004690e7: vmovaps xmm0, xmmword ptr [rip + 0x63efb1] ; 0x100aa80a0
0x1004690ef: vmovaps xmmword ptr [r15 + 0x1f0], xmm0
0x1004690f8: vmovaps xmm0, xmmword ptr [rip + 0x63f930] ; 0x100aa8a30
0x100469100: vmovaps xmmword ptr [r15 + 0x200], xmm0
0x100469109: vmovaps xmm0, xmmword ptr [rip + 0x63f8ef] ; 0x100aa8a00
0x100469111: vmovaps xmmword ptr [r15 + 0x210], xmm0
0x10046911a: mov rdi, qword ptr [r15 + 0x68]
0x10046911e: test rdi, rdi
0x100469121: je 0x1004694cc
0x100469127: mov rax, qword ptr [r15 + 8]
0x10046912b: test rax, rax
0x10046912e: je 0x1004694cc
0x100469134: mov rax, qword ptr [rax]
0x100469137: test rax, rax
0x10046913a: je 0x1004694cc
0x100469140: cmp byte ptr [rax + 0x14], 0
0x100469144: je 0x1004694cc
0x10046914a: mov rdx, qword ptr [rax]
0x10046914d: mov rsi, r12
0x100469150: call 0x100095170 ; 0x100095170
0x100469155: test eax, eax
0x100469157: mov r14, qword ptr [rbx + 0x40]
0x10046915b: jne 0x100469165
0x10046915d: mov rdi, r15
0x100469160: call 0x1004670a0 ; 0x1004670a0
0x100469165: cmp byte ptr [r14 + 9], 0
0x10046916a: je 0x10046917f
0x10046916c: mov rdi, qword ptr [r15 + 0x68]
0x100469170: lea rdx, [rip + 0x7092c6] ; 0x100b7243d Character
0x100469177: mov rsi, r12
0x10046917a: call 0x100095170 ; 0x100095170
0x10046917f: mov rdi, qword ptr [r15 + 0x68]
0x100469183: test rdi, rdi
0x100469186: je 0x1004691ec
0x100469188: cmp byte ptr [r15 + 0x348], 0
0x100469190: je 0x1004691ec
0x100469192: vxorps xmm0, xmm0, xmm0
0x100469196: call 0x100098b90 ; 0x100098b90
0x10046919b: mov rdi, qword ptr [r15 + 0x3a8]
0x1004691a2: lea rax, [rip + 0x198d0b7] ; 0x101df6260
0x1004691a9: mov rdx, qword ptr [rax]
0x1004691ac: mov esi, 0x50
0x1004691b1: mov ecx, 0x10
0x1004691b6: call 0x100795530 ; 0x100795530
0x1004691bb: vxorps ymm0, ymm0, ymm0
0x1004691bf: vmovups ymmword ptr [rax + 0x30], ymm0
0x1004691c4: vmovups ymmword ptr [rax + 0x20], ymm0
0x1004691c9: vmovups ymmword ptr [rax], ymm0
0x1004691cd: mov qword ptr [r15 + 0x80], rax
0x1004691d4: mov rsi, qword ptr [r15 + 0x68]
0x1004691d8: mov rdi, rax
0x1004691db: mov rdx, qword ptr [rbx + 0x88]
0x1004691e2: vzeroupper 
0x1004691e5: call 0x10034d0d0 ; 0x10034d0d0
0x1004691ea: jmp 0x1004691f7 ; 0x1004691f7
0x1004691ec: mov qword ptr [r15 + 0x80], 0
0x1004691f7: mov rax, qword ptr [rip + 0x7a46da] ; 0x100c0d8d8
0x1004691fe: mov rax, qword ptr [rax]
0x100469201: cmp rax, qword ptr [rbx + 0x320]
0x100469208: jne 0x100469219
0x10046920a: lea rsp, [rbp - 0x28]
0x10046920e: pop rbx
0x10046920f: pop r12
0x100469211: pop r13
0x100469213: pop r14
0x100469215: pop r15
0x100469217: pop rbp
0x100469218: ret 
0x100469219: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10046921e: lea rdi, [rip + 0x6f904c] ; 0x100b62271 !m_queued
0x100469225: lea rsi, [rip + 0x6f904f] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x10046922c: lea r8, [rip + 0x6f9064] ; 0x100b62297 VertexRender has already been committed!
0x100469233: mov edx, 0x8c
0x100469238: mov ecx, 4
0x10046923d: xor eax, eax
0x10046923f: call 0x1007e6030 ; 0x1007e6030
0x100469244: ud2 
0x100469246: lea rdi, [rip + 0x720b00] ; 0x100b89d4d m_options.minLod <= m_options.maxLod && m_options.maxLod < kMaxLodsPerModel - 1
0x10046924d: lea rsi, [rip + 0x72073d] ; 0x100b89991 Model.cpp
0x100469254: mov edx, 0x1bf
0x100469259: mov ecx, 3
0x10046925e: call 0x1007e5f70 ; 0x1007e5f70
0x100469263: ud2 
0x100469265: lea rdi, [rip + 0x6f9005] ; 0x100b62271 !m_queued
0x10046926c: lea rsi, [rip + 0x6f9008] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x100469273: lea r8, [rip + 0x6f901d] ; 0x100b62297 VertexRender has already been committed!
0x10046927a: mov edx, 0x8d
0x10046927f: mov ecx, 4
0x100469284: xor eax, eax
0x100469286: call 0x1007e6030 ; 0x1007e6030
0x10046928b: jmp 0x100469553 ; 0x100469553
0x100469290: lea rdi, [rip + 0x70d79d] ; 0x100b76a34 renderlistName && renderlistName[0]
0x100469297: lea rsi, [rip + 0x7206f3] ; 0x100b89991 Model.cpp
0x10046929e: lea r8, [rip + 0x70d7b3] ; 0x100b76a58 Shader %s is missing a RenderList group
0x1004692a5: mov edx, 0x20f
0x1004692aa: mov ecx, 4
0x1004692af: xor eax, eax
0x1004692b1: mov r9, r13
0x1004692b4: call 0x1007e6030 ; 0x1007e6030
0x1004692b9: jmp 0x100469553 ; 0x100469553
0x1004692be: lea rdi, [rip + 0x70d74f] ; 0x100b76a14 foundShader
0x1004692c5: lea rsi, [rip + 0x7206c5] ; 0x100b89991 Model.cpp
0x1004692cc: lea r8, [rip + 0x70d74d] ; 0x100b76a20 No shader called %s
0x1004692d3: mov edx, 0x20e
0x1004692d8: mov ecx, 4
0x1004692dd: xor eax, eax
0x1004692df: mov r9, r13
0x1004692e2: call 0x1007e6030 ; 0x1007e6030
0x1004692e7: jmp 0x100469553 ; 0x100469553
0x1004692ec: sub rsp, 0x40
0x1004692f0: lea rax, [rbp + 0x50]
0x1004692f4: vmovups ymm0, ymmword ptr [rax]
0x1004692f8: vmovups ymm1, ymmword ptr [rax + 0x20]
0x1004692fd: vmovups ymmword ptr [rsp + 0x20], ymm1
0x100469303: vmovups ymmword ptr [rsp], ymm0
0x100469308: lea rdi, [rip + 0x7209f4] ; 0x100b89d03 availableLods > 0
0x10046930f: lea rsi, [rip + 0x72067b] ; 0x100b89991 Model.cpp
0x100469316: lea r8, [rip + 0x7209f8] ; 0x100b89d15 Found mesh %s with 0 Lods. Baking may solve this issue.
0x10046931d: mov edx, 0x1bd
0x100469322: mov ecx, 4
0x100469327: xor eax, eax
0x100469329: vzeroupper 
0x10046932c: call 0x1007e6030 ; 0x1007e6030
0x100469331: add rsp, 0x40
0x100469335: ud2 
0x100469337: lea rdi, [rip + 0x70d9ac] ; 0x100b76cea IsInitialized()
0x10046933e: lea rsi, [rip + 0x6f8f36] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x100469345: mov edx, 0xa8
0x10046934a: mov ecx, 3
0x10046934f: call 0x1007e5f70 ; 0x1007e5f70
0x100469354: jmp 0x100469553 ; 0x100469553
0x100469359: lea rdi, [rip + 0x70d98a] ; 0x100b76cea IsInitialized()
0x100469360: lea rsi, [rip + 0x6f8f14] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x100469367: mov edx, 0xa8
0x10046936c: mov ecx, 3
0x100469371: call 0x1007e5f70 ; 0x1007e5f70
0x100469376: jmp 0x100469553 ; 0x100469553
0x10046937b: lea rdi, [rip + 0x6fcae3] ; 0x100b65e65 Observed()
0x100469382: lea rsi, [rip + 0x70d971] ; 0x100b76cfa ../../../Code/Base/ImageRegion.h
0x100469389: mov edx, 0x33
0x10046938e: mov ecx, 3
0x100469393: call 0x1007e5f70 ; 0x1007e5f70
0x100469398: jmp 0x100469553 ; 0x100469553
0x10046939d: lea rdi, [rip + 0x70d946] ; 0x100b76cea IsInitialized()
0x1004693a4: lea rsi, [rip + 0x6f8ed0] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1004693ab: mov edx, 0xa8
0x1004693b0: mov ecx, 3
0x1004693b5: call 0x1007e5f70 ; 0x1007e5f70
0x1004693ba: jmp 0x100469553 ; 0x100469553
0x1004693bf: lea rdi, [rip + 0x70d924] ; 0x100b76cea IsInitialized()
0x1004693c6: lea rsi, [rip + 0x6f8eae] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1004693cd: mov edx, 0xa8
0x1004693d2: mov ecx, 3
0x1004693d7: call 0x1007e5f70 ; 0x1007e5f70
0x1004693dc: jmp 0x100469553 ; 0x100469553
0x1004693e1: lea rdi, [rip + 0x70d902] ; 0x100b76cea IsInitialized()
0x1004693e8: lea rsi, [rip + 0x6f8e8c] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1004693ef: mov edx, 0xa8
0x1004693f4: mov ecx, 3
0x1004693f9: call 0x1007e5f70 ; 0x1007e5f70
0x1004693fe: jmp 0x100469553 ; 0x100469553
0x100469403: lea rdi, [rip + 0x6f8e67] ; 0x100b62271 !m_queued
0x10046940a: lea rsi, [rip + 0x6f8e6a] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x100469411: lea r8, [rip + 0x6f8e7f] ; 0x100b62297 VertexRender has already been committed!
0x100469418: mov edx, 0x8e
0x10046941d: mov ecx, 4
0x100469422: xor eax, eax
0x100469424: call 0x1007e6030 ; 0x1007e6030
0x100469429: jmp 0x100469553 ; 0x100469553
0x10046942e: lea rdi, [rip + 0x6f8e3c] ; 0x100b62271 !m_queued
0x100469435: lea rsi, [rip + 0x6f8e3f] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x10046943c: lea r8, [rip + 0x6f8e54] ; 0x100b62297 VertexRender has already been committed!
0x100469443: mov edx, 0x8b
0x100469448: mov ecx, 4
0x10046944d: xor eax, eax
0x10046944f: call 0x1007e6030 ; 0x1007e6030
0x100469454: jmp 0x100469553 ; 0x100469553
0x100469459: lea rdi, [rip + 0x70d620] ; 0x100b76a80 renderList
0x100469460: lea rsi, [rip + 0x72052a] ; 0x100b89991 Model.cpp
0x100469467: lea r8, [rip + 0x70d61d] ; 0x100b76a8b No RenderList called %s
0x10046946e: mov edx, 0x210
0x100469473: mov ecx, 4
0x100469478: xor eax, eax
0x10046947a: mov r9, r12
0x10046947d: call 0x1007e6030 ; 0x1007e6030
0x100469482: jmp 0x100469553 ; 0x100469553
0x100469487: vcvtss2sd xmm0, xmm0, xmm0
0x10046948b: lea eax, [r14 - 1]
0x10046948f: vcvtss2sd xmm1, xmm1, xmm1
0x100469493: sub rsp, 0x10
0x100469497: mov dword ptr [rsp], eax
0x10046949a: lea rdi, [rip + 0x720710] ; 0x100b89bb1 newDist >= prevDist
0x1004694a1: lea rsi, [rip + 0x7204e9] ; 0x100b89991 Model.cpp
0x1004694a8: lea r8, [rip + 0x720716] ; 0x100b89bc5 Invalid Lod distances. Lod %i dist %f less than lod %i dist %f
0x1004694af: mov edx, 0x125
0x1004694b4: mov ecx, 4
0x1004694b9: mov al, 2
0x1004694bb: mov r9d, r14d
0x1004694be: call 0x1007e6030 ; 0x1007e6030
0x1004694c3: add rsp, 0x10
0x1004694c7: jmp 0x100469553 ; 0x100469553
0x1004694cc: lea rdi, [rip + 0x7207a1] ; 0x100b89c74 m_animation && m_meshes && m_meshes[ 0 ] && m_meshes[ 0 ]->GetInitialized()
0x1004694d3: lea rsi, [rip + 0x7204b7] ; 0x100b89991 Model.cpp
0x1004694da: mov edx, 0x19d
0x1004694df: mov ecx, 3
0x1004694e4: call 0x1007e5f70 ; 0x1007e5f70
0x1004694e9: ud2 
0x1004694eb: lea rdi, [rip + 0x739b3a] ; 0x100ba302c false
0x1004694f2: lea rsi, [rip + 0x720498] ; 0x100b89991 Model.cpp
0x1004694f9: mov edx, 0x1fe
0x1004694fe: mov ecx, 3
0x100469503: call 0x1007e5f70 ; 0x1007e5f70
0x100469508: ud2 
0x10046950a: lea rdi, [rip + 0x6fc954] ; 0x100b65e65 Observed()
0x100469511: lea rsi, [rip + 0x6fc958] ; 0x100b65e70 ./Mesh.h
0x100469518: mov edx, 0x6e
0x10046951d: mov ecx, 3
0x100469522: call 0x1007e5f70 ; 0x1007e5f70
0x100469527: jmp 0x100469553 ; 0x100469553
0x100469529: lea rdi, [rip + 0x7208f2] ; 0x100b89e22 meshGeoId >= 0
0x100469530: lea rsi, [rip + 0x72045a] ; 0x100b89991 Model.cpp
0x100469537: lea r8, [rip + 0x7208f3] ; 0x100b89e31 Model's underlying Mesh (%s) was never registered with CollisionGeoBarn. If this mesh is in Persistent.lua, make sure it has the registerCollision = true option set.
0x10046953e: mov edx, 0x2cf
0x100469543: mov ecx, 4
0x100469548: xor eax, eax
0x10046954a: lea r9, [rbp + 0x50]
0x10046954e: call 0x1007e6030 ; 0x1007e6030
0x100469553: ud2 
0x100469555: jmp 0x1004696bc ; 0x1004696bc
0x10046955a: jmp 0x1004695ee ; 0x1004695ee
0x10046955f: jmp 0x1004696c1 ; 0x1004696c1
0x100469564: jmp 0x100469613 ; 0x100469613
0x100469569: jmp 0x1004696c1 ; 0x1004696c1
0x10046956e: jmp 0x100469687 ; 0x100469687
0x100469573: jmp 0x100469613 ; 0x100469613
0x100469578: jmp 0x1004696c1 ; 0x1004696c1
0x10046957d: jmp 0x1004696bc ; 0x1004696bc
0x100469582: jmp 0x1004696bc ; 0x1004696bc
0x100469587: jmp 0x1004696bc ; 0x1004696bc
0x10046958c: mov r14, rax
0x10046958f: call 0x1007c6c20 ; 0x1007c6c20
0x100469594: mov rdi, rax
0x100469597: mov rsi, r13
0x10046959a: call 0x100795a70 ; 0x100795a70
0x10046959f: jmp 0x1004696c4 ; 0x1004696c4
0x1004695a4: mov rdi, rax
0x1004695a7: call 0x100011bf0 ; 0x100011bf0
0x1004695ac: jmp 0x100469613 ; 0x100469613
0x1004695ae: jmp 0x100469613 ; 0x100469613
0x1004695b0: jmp 0x10046969d ; 0x10046969d
0x1004695b5: jmp 0x100469687 ; 0x100469687
0x1004695ba: mov rdi, rax
0x1004695bd: call 0x100011bf0 ; 0x100011bf0
0x1004695c2: jmp 0x1004696c1 ; 0x1004696c1
0x1004695c7: jmp 0x1004696c1 ; 0x1004696c1
0x1004695cc: mov rdi, rax
0x1004695cf: call 0x100011bf0 ; 0x100011bf0
0x1004695d4: mov r14, rax
0x1004695d7: jmp 0x100469669 ; 0x100469669
0x1004695dc: mov r14, rax
0x1004695df: jmp 0x100469679 ; 0x100469679
0x1004695e4: jmp 0x1004696c1 ; 0x1004696c1
0x1004695e9: jmp 0x1004696c1 ; 0x1004696c1
0x1004695ee: mov r14, rax
0x1004695f1: call 0x1007c6c20 ; 0x1007c6c20
0x1004695f6: mov rdi, rax
0x1004695f9: mov rsi, r13
0x1004695fc: call 0x100795a70 ; 0x100795a70
0x100469601: jmp 0x1004696c4 ; 0x1004696c4
0x100469606: mov rdi, rax
0x100469609: call 0x100011bf0 ; 0x100011bf0
0x10046960e: jmp 0x1004696c1 ; 0x1004696c1
0x100469613: mov r14, rax
0x100469616: lea rdi, [rbx + 0x90]
0x10046961d: call 0x1007c2570 ; 0x1007c2570
0x100469622: jmp 0x10046968a ; 0x10046968a
0x100469624: jmp 0x1004696bc ; 0x1004696bc
0x100469629: mov rdi, rax
0x10046962c: call 0x100011bf0 ; 0x100011bf0
0x100469631: mov rdi, rax
0x100469634: call 0x100011bf0 ; 0x100011bf0
0x100469639: jmp 0x1004696c1 ; 0x1004696c1
0x10046963e: mov rdi, rax
0x100469641: call 0x100011bf0 ; 0x100011bf0
0x100469646: jmp 0x1004696bc ; 0x1004696bc
0x100469648: mov r14, rax
0x10046964b: mov qword ptr [rbx + 0x120], r13
0x100469652: mov rax, qword ptr [rbx + 0x50]
0x100469656: mov qword ptr [rbx + 0x270], rax
0x10046965d: lea rdi, [rbx + 0x128]
0x100469664: call 0x1007a58d0 ; 0x1007a58d0
0x100469669: lea rdi, [rbx + 0x120]
0x100469670: mov rsi, qword ptr [rbx + 0x78]
0x100469674: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x100469679: lea rdi, [rbx + 0x270]
0x100469680: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100469685: jmp 0x1004696c4 ; 0x1004696c4
0x100469687: mov r14, rax
0x10046968a: lea rdi, [rbx + 0x120]
0x100469691: call 0x1007c2570 ; 0x1007c2570
0x100469696: jmp 0x1004696c4 ; 0x1004696c4
0x100469698: mov r14, rax
0x10046969b: jmp 0x1004696d5 ; 0x1004696d5
0x10046969d: mov r14, rax
0x1004696a0: call 0x1007c6c20 ; 0x1007c6c20
0x1004696a5: mov rdi, rax
0x1004696a8: mov rsi, r13
0x1004696ab: call 0x100795a70 ; 0x100795a70
0x1004696b0: jmp 0x1004696c4 ; 0x1004696c4
0x1004696b2: mov rdi, rax
0x1004696b5: call 0x100011bf0 ; 0x100011bf0
0x1004696ba: jmp 0x1004696bc ; 0x1004696bc
0x1004696bc: mov r14, rax
0x1004696bf: jmp 0x1004696e6 ; 0x1004696e6
0x1004696c1: mov r14, rax
0x1004696c4: call 0x1007c6c20 ; 0x1007c6c20
0x1004696c9: mov rdi, rax
0x1004696cc: mov rsi, qword ptr [rbx + 0x68]
0x1004696d0: call 0x100795a70 ; 0x100795a70
0x1004696d5: call 0x1007c6c20 ; 0x1007c6c20
0x1004696da: mov rdi, rax
0x1004696dd: mov rsi, qword ptr [rbx + 0x70]
0x1004696e1: call 0x100795a70 ; 0x100795a70
0x1004696e6: lea rdi, [rbx + 0xb0]
0x1004696ed: call 0x1007c2570 ; 0x1007c2570
0x1004696f2: mov rdi, r14
0x1004696f5: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1004696fa: mov rdi, rax
0x1004696fd: call 0x100011bf0 ; 0x100011bf0
0x100469702: mov rdi, rax
0x100469705: call 0x100011bf0 ; 0x100011bf0
0x10046970a: nop word ptr [rax + rax]
