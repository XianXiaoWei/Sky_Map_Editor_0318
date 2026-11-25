0x10021fb40: push rbp
0x10021fb41: mov rbp, rsp
0x10021fb44: push r15
0x10021fb46: push r14
0x10021fb48: push r13
0x10021fb4a: push r12
0x10021fb4c: push rbx
0x10021fb4d: sub rsp, 0xc8
0x10021fb54: mov rbx, rcx
0x10021fb57: mov qword ptr [rbp - 0x50], rdx
0x10021fb5b: mov qword ptr [rbp - 0x30], rsi
0x10021fb5f: mov r14, rdi
0x10021fb62: lea rdi, [rbp - 0xe0]
0x10021fb69: call 0x1007c2530 ; 0x1007c2530
0x10021fb6e: mov r12, qword ptr [rbx + 0x10]
0x10021fb72: mov r15, qword ptr [rbx + 0xa0]
0x10021fb79: call 0x1003f10c0 ; 0x1003f10c0
0x10021fb7e: mov rdi, r15
0x10021fb81: mov rsi, rax
0x10021fb84: mov rdx, r12
0x10021fb87: call 0x1007c4360 ; 0x1007c4360
0x10021fb8c: test rax, rax
0x10021fb8f: je 0x10021fd4a
0x10021fb95: lea rsi, [rbp - 0xe0]
0x10021fb9c: mov rdi, rax
0x10021fb9f: call 0x1007c2310 ; 0x1007c2310
0x10021fba4: cmp dword ptr [r14 + 0x10010], 0
0x10021fbac: je 0x10021ff42
0x10021fbb2: lea r13, [rbp - 0xc0]
0x10021fbb9: xor ebx, ebx
0x10021fbbb: mov r12, qword ptr [r14 + 0x10018]
0x10021fbc2: mov ebx, ebx
0x10021fbc4: mov r15, rbx
0x10021fbc7: shl r15, 7
0x10021fbcb: lea rax, [r14 + r15 + 0x10]
0x10021fbd0: vxorps ymm0, ymm0, ymm0
0x10021fbd4: vmovups ymmword ptr [r12 + r15], ymm0
0x10021fbda: vmovups ymmword ptr [r12 + r15 + 0x60], ymm0
0x10021fbe1: vmovups ymmword ptr [r12 + r15 + 0x40], ymm0
0x10021fbe8: vmovups ymmword ptr [r12 + r15 + 0x20], ymm0
0x10021fbef: mov qword ptr [r12 + r15], rax
0x10021fbf3: mov rdi, r13
0x10021fbf6: vzeroupper 
0x10021fbf9: call 0x1007c2530 ; 0x1007c2530
0x10021fbfe: lea rax, [r12 + r15]
0x10021fc02: mov qword ptr [rbp - 0x38], rax
0x10021fc06: mov rdi, qword ptr [rax]
0x10021fc09: mov rax, qword ptr [rdi]
0x10021fc0c: call qword ptr [rax + 0x38]
0x10021fc0f: mov r13, rax
0x10021fc12: call 0x1004559d0 ; 0x1004559d0
0x10021fc17: mov rdi, qword ptr [rbp - 0x30]
0x10021fc1b: mov rsi, rax
0x10021fc1e: mov rdx, r13
0x10021fc21: call 0x1007c4360 ; 0x1007c4360
0x10021fc26: test rax, rax
0x10021fc29: je 0x10021fd30
0x10021fc2f: mov rdi, rax
0x10021fc32: lea rsi, [rbp - 0xc0]
0x10021fc39: call 0x1007c2310 ; 0x1007c2310
0x10021fc3e: mov rax, qword ptr [rbp - 0xc0]
0x10021fc45: test rax, rax
0x10021fc48: je 0x100220595
0x10021fc4e: mov rax, qword ptr [rax + 0x10]
0x10021fc52: test rax, rax
0x10021fc55: je 0x100220595
0x10021fc5b: mov rax, qword ptr [rax + 0xf0]
0x10021fc62: mov qword ptr [r12 + r15 + 8], rax
0x10021fc67: mov rax, qword ptr [rbp - 0x38]
0x10021fc6b: mov rdi, qword ptr [rax]
0x10021fc6e: mov rax, qword ptr [rdi]
0x10021fc71: call qword ptr [rax + 0x30]
0x10021fc74: lea rdi, [rbp - 0xe0]
0x10021fc7b: mov esi, eax
0x10021fc7d: lea rdx, [rbp - 0x58]
0x10021fc81: call 0x1003f68d0 ; 0x1003f68d0
0x10021fc86: test al, al
0x10021fc88: je 0x10021fcb0
0x10021fc8a: lea rcx, [r12 + r15 + 8]
0x10021fc8f: mov rax, qword ptr [rbp - 0x58]
0x10021fc93: mov rax, qword ptr [rax + 0x28]
0x10021fc97: mov edx, dword ptr [rax]
0x10021fc99: mov rcx, qword ptr [rcx]
0x10021fc9c: cmp edx, dword ptr [rcx + 0x34]
0x10021fc9f: mov ecx, 0
0x10021fca4: cmovne rax, rcx
0x10021fca8: jmp 0x10021fcb2 ; 0x10021fcb2
0x10021fcaa: nop word ptr [rax + rax]
0x10021fcb0: xor eax, eax
0x10021fcb2: lea r13, [rbp - 0xc0]
0x10021fcb9: mov qword ptr [r12 + r15 + 0x10], rax
0x10021fcbe: mov rax, qword ptr [rbp - 0x38]
0x10021fcc2: mov rsi, qword ptr [rax]
0x10021fcc5: add rsi, 0x10
0x10021fcc9: lea rdi, [rbp - 0xa0]
0x10021fcd0: call 0x100076940 ; 0x100076940
0x10021fcd5: vmovaps xmm0, xmmword ptr [rbp - 0xa0]
0x10021fcdd: vmovaps xmmword ptr [r12 + r15 + 0x30], xmm0
0x10021fce4: vmovaps xmm0, xmmword ptr [rbp - 0x90]
0x10021fcec: vmovaps xmmword ptr [r12 + r15 + 0x40], xmm0
0x10021fcf3: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x10021fcf8: vmovaps xmmword ptr [r12 + r15 + 0x50], xmm0
0x10021fcff: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x10021fd04: vmovaps xmmword ptr [r12 + r15 + 0x60], xmm0
0x10021fd0b: mov rdi, r13
0x10021fd0e: call 0x1007c2570 ; 0x1007c2570
0x10021fd13: inc ebx
0x10021fd15: mov eax, dword ptr [r14 + 0x10010]
0x10021fd1c: cmp ebx, eax
0x10021fd1e: jb 0x10021fbbb
0x10021fd24: jmp 0x10021fd63 ; 0x10021fd63
0x10021fd26: nop word ptr cs:[rax + rax]
0x10021fd30: call 0x1004559d0 ; 0x1004559d0
0x10021fd35: mov rsi, qword ptr [rax + 8]
0x10021fd39: mov rdi, qword ptr [rbp - 0x30]
0x10021fd3d: mov rdx, r13
0x10021fd40: call 0x1007c4640 ; 0x1007c4640
0x10021fd45: jmp 0x10021fc3e ; 0x10021fc3e
0x10021fd4a: call 0x1003f10c0 ; 0x1003f10c0
0x10021fd4f: mov rsi, qword ptr [rax + 8]
0x10021fd53: mov rdi, r15
0x10021fd56: mov rdx, r12
0x10021fd59: call 0x1007c4640 ; 0x1007c4640
0x10021fd5e: jmp 0x10021fba4 ; 0x10021fba4
0x10021fd63: test eax, eax
0x10021fd65: je 0x10021ff42
0x10021fd6b: xor eax, eax
0x10021fd6d: vmovaps xmm8, xmmword ptr [rip + 0x8878fb] ; 0x100aa7670
0x10021fd75: nop word ptr cs:[rax + rax]
0x10021fd80: mov rcx, qword ptr [r14 + 0x10018]
0x10021fd87: mov eax, eax
0x10021fd89: mov rdx, rax
0x10021fd8c: shl rdx, 7
0x10021fd90: mov rdi, qword ptr [rcx + rdx]
0x10021fd94: mov rsi, qword ptr [rcx + rdx + 8]
0x10021fd99: vmovsd xmm1, qword ptr [rsi + 4]
0x10021fd9e: vmovsd xmm2, qword ptr [rsi + 0x10]
0x10021fda3: vinsertps xmm1, xmm1, dword ptr [rsi + 0xc], 0x20
0x10021fdaa: vinsertps xmm2, xmm2, dword ptr [rsi + 0x18], 0x20
0x10021fdb1: vaddps xmm1, xmm1, xmm2
0x10021fdb5: vmulps xmm4, xmm1, xmm8
0x10021fdba: vmovaps xmm3, xmmword ptr [rdi + 0x10]
0x10021fdbf: vmovaps xmm11, xmmword ptr [rdi + 0x20]
0x10021fdc4: vmovaps xmm9, xmmword ptr [rdi + 0x30]
0x10021fdc9: vmovaps xmm5, xmmword ptr [rdi + 0x40]
0x10021fdce: vmulss xmm6, xmm3, xmm4
0x10021fdd2: vmovshdup xmm7, xmm4
0x10021fdd6: vmulss xmm0, xmm7, xmm11
0x10021fddb: vaddss xmm0, xmm6, xmm0
0x10021fddf: vpermilpd xmm6, xmm4, 1
0x10021fde5: vmulss xmm1, xmm6, xmm9
0x10021fdea: vaddss xmm0, xmm0, xmm1
0x10021fdee: vaddss xmm10, xmm5, xmm0
0x10021fdf2: vmovshdup xmm1, xmm3
0x10021fdf6: vmulss xmm1, xmm1, xmm4
0x10021fdfa: vmovshdup xmm0, xmm11
0x10021fdff: vmulss xmm0, xmm7, xmm0
0x10021fe03: vaddss xmm0, xmm1, xmm0
0x10021fe07: vmovshdup xmm1, xmm9
0x10021fe0c: vmulss xmm1, xmm6, xmm1
0x10021fe10: vaddss xmm0, xmm0, xmm1
0x10021fe14: vmovshdup xmm1, xmm5
0x10021fe18: vaddss xmm0, xmm1, xmm0
0x10021fe1c: vpermilpd xmm1, xmm3, 1
0x10021fe22: vmulss xmm1, xmm1, xmm4
0x10021fe26: vpermilpd xmm2, xmm11, 1
0x10021fe2c: vmulss xmm2, xmm7, xmm2
0x10021fe30: vaddss xmm1, xmm1, xmm2
0x10021fe34: vpermilpd xmm2, xmm9, 1
0x10021fe3a: vmulss xmm2, xmm6, xmm2
0x10021fe3e: vaddss xmm1, xmm1, xmm2
0x10021fe42: vpermilpd xmm2, xmm5, 1
0x10021fe48: vaddss xmm1, xmm2, xmm1
0x10021fe4c: vinsertps xmm0, xmm10, xmm0, 0x10
0x10021fe52: vinsertps xmm5, xmm0, xmm1, 0x20
0x10021fe58: movsxd rdi, dword ptr [rsi + 0x34]
0x10021fe5c: test rdi, rdi
0x10021fe5f: jle 0x10021feb0
0x10021fe61: mov rsi, qword ptr [rsi + 0x60]
0x10021fe65: add rsi, 8
0x10021fe69: vxorps xmm6, xmm6, xmm6
0x10021fe6d: xor ebx, ebx
0x10021fe6f: nop 
0x10021fe70: vmovsd xmm0, qword ptr [rsi - 8]
0x10021fe75: vinsertps xmm0, xmm0, dword ptr [rsi], 0x20
0x10021fe7b: vsubps xmm0, xmm0, xmm4
0x10021fe7f: vmulps xmm0, xmm0, xmm0
0x10021fe83: vmovshdup xmm1, xmm0
0x10021fe87: vaddss xmm1, xmm0, xmm1
0x10021fe8b: vpermilpd xmm0, xmm0, 1
0x10021fe91: vaddss xmm0, xmm0, xmm1
0x10021fe95: vmaxss xmm6, xmm0, xmm6
0x10021fe99: inc rbx
0x10021fe9c: add rsi, 0x10
0x10021fea0: cmp rbx, rdi
0x10021fea3: jl 0x10021fe70
0x10021fea5: jmp 0x10021feb4 ; 0x10021feb4
0x10021fea7: nop word ptr [rax + rax]
0x10021feb0: vxorps xmm6, xmm6, xmm6
0x10021feb4: vsqrtss xmm0, xmm6, xmm6
0x10021feb8: vmulps xmm1, xmm3, xmm3
0x10021febc: vpermilpd xmm2, xmm1, 1
0x10021fec2: vaddps xmm1, xmm1, xmm2
0x10021fec6: vmovshdup xmm2, xmm1
0x10021feca: vaddss xmm1, xmm1, xmm2
0x10021fece: vmulps xmm2, xmm11, xmm11
0x10021fed3: vpermilpd xmm3, xmm2, 1
0x10021fed9: vaddps xmm2, xmm2, xmm3
0x10021fedd: vmovshdup xmm3, xmm2
0x10021fee1: vaddss xmm2, xmm2, xmm3
0x10021fee5: vmulps xmm3, xmm9, xmm9
0x10021feea: vpermilpd xmm4, xmm3, 1
0x10021fef0: vaddps xmm3, xmm3, xmm4
0x10021fef4: vmovshdup xmm4, xmm3
0x10021fef8: vaddss xmm3, xmm3, xmm4
0x10021fefc: vmaxss xmm4, xmm3, xmm1
0x10021ff00: vcmpunordss xmm1, xmm1, xmm1
0x10021ff05: vblendvps xmm1, xmm4, xmm3, xmm1
0x10021ff0b: vcmpunordss xmm3, xmm1, xmm1
0x10021ff10: vmaxss xmm1, xmm2, xmm1
0x10021ff14: vblendvps xmm1, xmm1, xmm2, xmm3
0x10021ff1a: vsqrtss xmm1, xmm1, xmm1
0x10021ff1e: vmulss xmm0, xmm0, xmm1
0x10021ff22: vinsertps xmm0, xmm5, xmm0, 0x30
0x10021ff28: vmovaps xmmword ptr [rcx + rdx + 0x70], xmm0
0x10021ff2e: inc eax
0x10021ff30: mov r12d, dword ptr [r14 + 0x10010]
0x10021ff37: cmp eax, r12d
0x10021ff3a: jb 0x10021fd80
0x10021ff40: jmp 0x10021ff45 ; 0x10021ff45
0x10021ff42: xor r12d, r12d
0x10021ff45: call 0x1007c6c20 ; 0x1007c6c20
0x10021ff4a: mov r15d, r12d
0x10021ff4d: mov rsi, r15
0x10021ff50: shl rsi, 4
0x10021ff54: lea rcx, [rip + 0x1e28bf5] ; 0x102048b50
0x10021ff5b: mov rdx, qword ptr [rcx]
0x10021ff5e: mov ecx, 8
0x10021ff63: mov rdi, rax
0x10021ff66: call 0x100795530 ; 0x100795530
0x10021ff6b: mov r13, rax
0x10021ff6e: mov ebx, dword ptr [r14 + 0x10010]
0x10021ff75: mov qword ptr [rbp - 0x38], r13
0x10021ff79: call 0x1007c6c20 ; 0x1007c6c20
0x10021ff7e: imul ebx, ebx
0x10021ff81: shl rbx, 2
0x10021ff85: lea rcx, [rip + 0x1e28bc4] ; 0x102048b50
0x10021ff8c: mov rdx, qword ptr [rcx]
0x10021ff8f: mov ecx, 4
0x10021ff94: mov rdi, rax
0x10021ff97: mov rsi, rbx
0x10021ff9a: call 0x100795530 ; 0x100795530
0x10021ff9f: mov ebx, dword ptr [r14 + 0x10010]
0x10021ffa6: test r12d, r12d
0x10021ffa9: je 0x10022007b
0x10021ffaf: lea rcx, [r15 - 1]
0x10021ffb3: mov r11d, r15d
0x10021ffb6: and r11d, 3
0x10021ffba: xor edx, edx
0x10021ffbc: cmp rcx, 3
0x10021ffc0: jae 0x10021ffd2
0x10021ffc2: xor ecx, ecx
0x10021ffc4: test r11, r11
0x10021ffc7: jne 0x10022004d
0x10021ffcd: jmp 0x10022007b ; 0x10022007b
0x10021ffd2: sub r15, r11
0x10021ffd5: lea rsi, [r13 + 0x38]
0x10021ffd9: lea r8d, [rbx + rbx*2]
0x10021ffdd: lea r9d, [rbx*4]
0x10021ffe5: lea r10d, [rbx + rbx]
0x10021ffe9: xor ecx, ecx
0x10021ffeb: nop dword ptr [rax + rax]
0x10021fff0: mov dword ptr [rsi - 0x38], 0
0x10021fff7: mov edi, edx
0x10021fff9: lea rdi, [rax + rdi*4]
0x10021fffd: mov qword ptr [rsi - 0x30], rdi
0x100220001: mov dword ptr [rsi - 0x28], 0
0x100220008: lea edi, [rbx + rdx]
0x10022000b: lea rdi, [rax + rdi*4]
0x10022000f: mov qword ptr [rsi - 0x20], rdi
0x100220013: mov dword ptr [rsi - 0x18], 0
0x10022001a: lea edi, [r10 + rdx]
0x10022001e: lea rdi, [rax + rdi*4]
0x100220022: mov qword ptr [rsi - 0x10], rdi
0x100220026: mov dword ptr [rsi - 8], 0
0x10022002d: lea edi, [r8 + rdx]
0x100220031: lea rdi, [rax + rdi*4]
0x100220035: mov qword ptr [rsi], rdi
0x100220038: add rcx, 4
0x10022003c: add rsi, 0x40
0x100220040: add edx, r9d
0x100220043: cmp r15, rcx
0x100220046: jne 0x10021fff0
0x100220048: test r11, r11
0x10022004b: je 0x10022007b
0x10022004d: mov rdx, rcx
0x100220050: shl rdx, 4
0x100220054: lea rdx, [r13 + rdx + 8]
0x100220059: imul ecx, ebx
0x10022005c: neg r11
0x10022005f: nop 
0x100220060: mov dword ptr [rdx - 8], 0
0x100220067: mov esi, ecx
0x100220069: lea rsi, [rax + rsi*4]
0x10022006d: mov qword ptr [rdx], rsi
0x100220070: add rdx, 0x10
0x100220074: add ecx, ebx
0x100220076: inc r11
0x100220079: jne 0x100220060
0x10022007b: test ebx, ebx
0x10022007d: je 0x100220130
0x100220083: xor ecx, ecx
0x100220085: nop word ptr cs:[rax + rax]
0x100220090: mov ecx, ecx
0x100220092: mov r9, rcx
0x100220095: shl r9, 4
0x100220099: lea r8, [r13 + r9 + 8]
0x10022009e: add r9, r13
0x1002200a1: xor esi, esi
0x1002200a3: nop word ptr cs:[rax + rax]
0x1002200b0: cmp ecx, esi
0x1002200b2: je 0x10022011e
0x1002200b4: mov rdi, qword ptr [r14 + 0x10018]
0x1002200bb: mov edx, esi
0x1002200bd: shl rdx, 7
0x1002200c1: vmovaps xmm0, xmmword ptr [rdi + rdx + 0x70]
0x1002200c7: mov rdx, rcx
0x1002200ca: shl rdx, 7
0x1002200ce: vmovaps xmm1, xmmword ptr [rdi + rdx + 0x70]
0x1002200d4: vsubps xmm2, xmm0, xmm1
0x1002200d8: vmulps xmm2, xmm2, xmm2
0x1002200dc: vmovshdup xmm3, xmm2
0x1002200e0: vaddss xmm3, xmm2, xmm3
0x1002200e4: vpermilpd xmm2, xmm2, 1
0x1002200ea: vaddss xmm2, xmm2, xmm3
0x1002200ee: vpermilps xmm0, xmm0, 0xe7
0x1002200f4: vpermilps xmm1, xmm1, 0xe7
0x1002200fa: vaddss xmm0, xmm0, xmm1
0x1002200fe: vmulss xmm0, xmm0, xmm0
0x100220102: vucomiss xmm0, xmm2
0x100220106: jbe 0x10022011e
0x100220108: mov rdx, qword ptr [r8]
0x10022010b: mov edi, dword ptr [r9]
0x10022010e: lea ebx, [rdi + 1]
0x100220111: mov dword ptr [r9], ebx
0x100220114: mov dword ptr [rdx + rdi*4], esi
0x100220117: mov ebx, dword ptr [r14 + 0x10010]
0x10022011e: inc esi
0x100220120: cmp esi, ebx
0x100220122: jb 0x1002200b0
0x100220124: inc ecx
0x100220126: cmp ecx, ebx
0x100220128: jb 0x100220090
0x10022012e: jmp 0x100220132 ; 0x100220132
0x100220130: xor ebx, ebx
0x100220132: mov qword ptr [rbp - 0x40], rax
0x100220136: call 0x1007c6c20 ; 0x1007c6c20
0x10022013b: mov ebx, ebx
0x10022013d: shl rbx, 2
0x100220141: lea rcx, [rip + 0x1e28a08] ; 0x102048b50
0x100220148: mov rdx, qword ptr [rcx]
0x10022014b: mov ecx, 4
0x100220150: mov rdi, rax
0x100220153: mov rsi, rbx
0x100220156: call 0x100795530 ; 0x100795530
0x10022015b: mov r12, rax
0x10022015e: mov esi, 0xff
0x100220163: mov rdi, r12
0x100220166: mov rdx, rbx
0x100220169: call 0x100aa2900 ; 0x100aa2900 _memset
0x10022016e: cmp dword ptr [r14 + 0x10010], 0
0x100220176: je 0x1002201d0
0x100220178: xor ebx, ebx
0x10022017a: xor r15d, r15d
0x10022017d: nop dword ptr [rax]
0x100220180: mov edi, ebx
0x100220182: mov esi, r15d
0x100220185: mov rdx, r13
0x100220188: mov rcx, r12
0x10022018b: call 0x10021fa30 ; 0x10021fa30
0x100220190: movzx eax, al
0x100220193: add r15d, eax
0x100220196: inc ebx
0x100220198: mov esi, dword ptr [r14 + 0x10010]
0x10022019f: cmp ebx, esi
0x1002201a1: jb 0x100220180
0x1002201a3: test esi, esi
0x1002201a5: je 0x1002201d0
0x1002201a7: mov rdi, qword ptr [r14 + 0x10018]
0x1002201ae: lea rax, [rsi - 1]
0x1002201b2: mov ecx, esi
0x1002201b4: and ecx, 3
0x1002201b7: cmp rax, 3
0x1002201bb: jae 0x1002201e2
0x1002201bd: xor ebx, ebx
0x1002201bf: lea r15, [r14 + 0x10018]
0x1002201c6: test rcx, rcx
0x1002201c9: jne 0x10022023f
0x1002201cb: jmp 0x100220261 ; 0x100220261
0x1002201d0: lea r15, [r14 + 0x10018]
0x1002201d7: mov rdi, qword ptr [r14 + 0x10018]
0x1002201de: xor esi, esi
0x1002201e0: jmp 0x100220261 ; 0x100220261
0x1002201e2: mov r8, rsi
0x1002201e5: sub r8, rcx
0x1002201e8: lea rax, [rdi + 0x1a0]
0x1002201ef: xor ebx, ebx
0x1002201f1: nop word ptr cs:[rax + rax]
0x100220200: mov edx, dword ptr [r12 + rbx*4]
0x100220204: mov dword ptr [rax - 0x180], edx
0x10022020a: mov edx, dword ptr [r12 + rbx*4 + 4]
0x10022020f: mov dword ptr [rax - 0x100], edx
0x100220215: mov edx, dword ptr [r12 + rbx*4 + 8]
0x10022021a: mov dword ptr [rax - 0x80], edx
0x10022021d: mov edx, dword ptr [r12 + rbx*4 + 0xc]
0x100220222: mov dword ptr [rax], edx
0x100220224: add rbx, 4
0x100220228: add rax, 0x200
0x10022022e: cmp r8, rbx
0x100220231: jne 0x100220200
0x100220233: lea r15, [r14 + 0x10018]
0x10022023a: test rcx, rcx
0x10022023d: je 0x100220261
0x10022023f: lea rax, [r12 + rbx*4]
0x100220243: shl rbx, 7
0x100220247: lea rdx, [rdi + rbx + 0x20]
0x10022024c: neg rcx
0x10022024f: nop 
0x100220250: mov ebx, dword ptr [rax]
0x100220252: mov dword ptr [rdx], ebx
0x100220254: sub rdx, -0x80
0x100220258: add rax, 4
0x10022025c: inc rcx
0x10022025f: jne 0x100220250
0x100220261: shl rsi, 7
0x100220265: add rsi, rdi
0x100220268: mov qword ptr [rbp - 0x48], r12
0x10022026c: call 0x100222830 ; 0x100222830
0x100220271: mov esi, dword ptr [r14 + 0x10010]
0x100220278: test rsi, rsi
0x10022027b: je 0x10022029f
0x10022027d: mov r8, qword ptr [r15]
0x100220280: mov ecx, esi
0x100220282: and ecx, 1
0x100220285: cmp esi, 1
0x100220288: jne 0x1002202aa
0x10022028a: xor edx, edx
0x10022028c: xor r12d, r12d
0x10022028f: xor r13d, r13d
0x100220292: mov rbx, r15
0x100220295: test rcx, rcx
0x100220298: jne 0x100220305
0x10022029a: jmp 0x100220320 ; 0x100220320
0x10022029f: mov rbx, r15
0x1002202a2: xor r13d, r13d
0x1002202a5: xor r12d, r12d
0x1002202a8: jmp 0x100220320 ; 0x100220320
0x1002202aa: sub rsi, rcx
0x1002202ad: lea rdi, [r8 + 0x9c]
0x1002202b4: xor edx, edx
0x1002202b6: xor r12d, r12d
0x1002202b9: xor r13d, r13d
0x1002202bc: nop dword ptr [rax]
0x1002202c0: mov dword ptr [rdi - 0x84], r12d
0x1002202c7: mov dword ptr [rdi - 0x80], r13d
0x1002202cb: mov rbx, qword ptr [rdi - 0x94]
0x1002202d2: mov rax, qword ptr [rdi - 0x14]
0x1002202d6: add r12d, dword ptr [rbx + 0x34]
0x1002202da: add r13d, dword ptr [rbx + 0x38]
0x1002202de: mov dword ptr [rdi - 4], r12d
0x1002202e2: mov dword ptr [rdi], r13d
0x1002202e5: add r12d, dword ptr [rax + 0x34]
0x1002202e9: add r13d, dword ptr [rax + 0x38]
0x1002202ed: add rdx, 2
0x1002202f1: add rdi, 0x100
0x1002202f8: cmp rsi, rdx
0x1002202fb: jne 0x1002202c0
0x1002202fd: mov rbx, r15
0x100220300: test rcx, rcx
0x100220303: je 0x100220320
0x100220305: shl rdx, 7
0x100220309: mov dword ptr [r8 + rdx + 0x18], r12d
0x10022030e: mov dword ptr [r8 + rdx + 0x1c], r13d
0x100220313: mov rax, qword ptr [r8 + rdx + 8]
0x100220318: add r13d, dword ptr [rax + 0x38]
0x10022031c: add r12d, dword ptr [rax + 0x34]
0x100220320: call 0x1007c6c20 ; 0x1007c6c20
0x100220325: mov esi, r13d
0x100220328: shl rsi, 2
0x10022032c: lea rcx, [rip + 0x1e2881d] ; 0x102048b50
0x100220333: mov rdx, qword ptr [rcx]
0x100220336: mov ecx, 4
0x10022033b: mov rdi, rax
0x10022033e: call 0x100795530 ; 0x100795530
0x100220343: mov r15, rax
0x100220346: mov esi, dword ptr [r14 + 0x10010]
0x10022034d: test esi, esi
0x10022034f: je 0x1002203c6
0x100220351: mov r8, qword ptr [rbx]
0x100220354: xor r9d, r9d
0x100220357: nop word ptr [rax + rax]
0x100220360: mov r9d, r9d
0x100220363: mov rdi, r9
0x100220366: shl rdi, 7
0x10022036a: mov rdx, qword ptr [r8 + rdi + 8]
0x10022036f: cmp dword ptr [rdx + 0x38], 0
0x100220373: je 0x1002203be
0x100220375: mov rsi, qword ptr [rdx + 0x80]
0x10022037c: mov ebx, dword ptr [r8 + rdi + 0x18]
0x100220381: mov eax, dword ptr [r8 + rdi + 0x1c]
0x100220386: add ebx, dword ptr [rsi]
0x100220388: mov dword ptr [r15 + rax*4], ebx
0x10022038c: cmp dword ptr [rdx + 0x38], 2
0x100220390: jb 0x1002203b7
0x100220392: lea rdi, [r8 + rdi + 0x18]
0x100220397: mov ebx, 1
0x10022039c: nop dword ptr [rax]
0x1002203a0: mov eax, ebx
0x1002203a2: mov ecx, dword ptr [rdi]
0x1002203a4: add ecx, dword ptr [rsi + rax*4]
0x1002203a7: mov eax, dword ptr [rdi + 4]
0x1002203aa: add eax, ebx
0x1002203ac: mov dword ptr [r15 + rax*4], ecx
0x1002203b0: inc ebx
0x1002203b2: cmp ebx, dword ptr [rdx + 0x38]
0x1002203b5: jb 0x1002203a0
0x1002203b7: mov esi, dword ptr [r14 + 0x10010]
0x1002203be: inc r9d
0x1002203c1: cmp r9d, esi
0x1002203c4: jb 0x100220360
0x1002203c6: lea rbx, [r14 + 0x20030]
0x1002203cd: lea rsi, [rip + 0x95a6f6] ; 0x100b7aaca CloudCards
0x1002203d4: mov rdi, rbx
0x1002203d7: mov edx, r12d
0x1002203da: call 0x1007f53c0 ; 0x1007f53c0
0x1002203df: lea rcx, [rbp - 0x8c]
0x1002203e6: vmovaps ymm0, ymmword ptr [rip + 0x891772] ; 0x100ab1b60
0x1002203ee: vmovups ymmword ptr [rbp - 0xa0], ymm0
0x1002203f6: movabs rax, 0xe0000000d
0x100220400: mov qword ptr [rbp - 0x80], rax
0x100220404: mov qword ptr [rsp + 8], 0
0x10022040d: mov dword ptr [rsp], 0
0x100220414: lea rdx, [rbp - 0xa0]
0x10022041b: mov esi, 0
0x100220420: mov r8d, 5
0x100220426: mov r9d, 2
0x10022042c: mov rdi, rbx
0x10022042f: vzeroupper 
0x100220432: call 0x1007f5430 ; 0x1007f5430
0x100220437: mov esi, 0
0x10022043c: mov edx, 9
0x100220441: mov ecx, 1
0x100220446: mov rdi, rbx
0x100220449: mov r8d, r13d
0x10022044c: mov r9, r15
0x10022044f: call 0x1007f55d0 ; 0x1007f55d0
0x100220454: mov rdi, rbx
0x100220457: call 0x1007f5690 ; 0x1007f5690
0x10022045c: lea rdi, [rbp - 0xa0]
0x100220463: mov r13, qword ptr [rbp - 0x48]
0x100220467: call 0x1007c2530 ; 0x1007c2530
0x10022046c: mov r12, qword ptr [rbp - 0x38]
0x100220470: call 0x10079ac90 ; 0x10079ac90
0x100220475: lea rdx, [rip + 0x95a659] ; 0x100b7aad5 CloudFinTex
0x10022047c: mov rdi, qword ptr [rbp - 0x30]
0x100220480: mov rsi, rax
0x100220483: call 0x1007c4360 ; 0x1007c4360
0x100220488: test rax, rax
0x10022048b: je 0x10022049e
0x10022048d: lea rsi, [rbp - 0xa0]
0x100220494: mov rdi, rax
0x100220497: call 0x1007c2310 ; 0x1007c2310
0x10022049c: jmp 0x1002204b7 ; 0x1002204b7
0x10022049e: call 0x10079ac90 ; 0x10079ac90
0x1002204a3: mov rsi, qword ptr [rax + 8]
0x1002204a7: lea rdx, [rip + 0x95a627] ; 0x100b7aad5 CloudFinTex
0x1002204ae: mov rdi, qword ptr [rbp - 0x30]
0x1002204b2: call 0x1007c4640 ; 0x1007c4640
0x1002204b7: mov r8, qword ptr [rbp - 0x50]
0x1002204bb: add r8, 0x1230
0x1002204c2: lea rdi, [r14 + 0x20470]
0x1002204c9: lea rcx, [rip + 0x953a8f] ; 0x100b73f5f CloudCard
0x1002204d0: mov r9d, 6
0x1002204d6: mov rsi, rbx
0x1002204d9: mov rdx, qword ptr [rbp - 0x30]
0x1002204dd: call 0x1007f5d90 ; 0x1007f5d90
0x1002204e2: cmp byte ptr [r14 + 0x209a8], 0
0x1002204ea: je 0x1002205b4
0x1002204f0: add r14, 0x206e0
0x1002204f7: mov rax, qword ptr [rbp - 0xa0]
0x1002204fe: test rax, rax
0x100220501: je 0x100220517
0x100220503: mov rax, qword ptr [rax + 0x10]
0x100220507: lea rdx, [rax + 0xb0]
0x10022050e: test rax, rax
0x100220511: cmove rdx, rax
0x100220515: jmp 0x100220519 ; 0x100220519
0x100220517: xor edx, edx
0x100220519: lea rsi, [rip + 0x95a5c1] ; 0x100b7aae1 u_alphaTex
0x100220520: xor ecx, ecx
0x100220522: mov rdi, r14
0x100220525: call 0x1007be8b0 ; 0x1007be8b0
0x10022052a: lea rdi, [rbp - 0xa0]
0x100220531: call 0x1007c2570 ; 0x1007c2570
0x100220536: call 0x1007c6c20 ; 0x1007c6c20
0x10022053b: mov rdi, rax
0x10022053e: mov rsi, r15
0x100220541: call 0x100795a70 ; 0x100795a70
0x100220546: call 0x1007c6c20 ; 0x1007c6c20
0x10022054b: mov rdi, rax
0x10022054e: mov rsi, r13
0x100220551: call 0x100795a70 ; 0x100795a70
0x100220556: call 0x1007c6c20 ; 0x1007c6c20
0x10022055b: mov rdi, rax
0x10022055e: mov rsi, qword ptr [rbp - 0x40]
0x100220562: call 0x100795a70 ; 0x100795a70
0x100220567: call 0x1007c6c20 ; 0x1007c6c20
0x10022056c: mov rdi, rax
0x10022056f: mov rsi, r12
0x100220572: call 0x100795a70 ; 0x100795a70
0x100220577: lea rdi, [rbp - 0xe0]
0x10022057e: call 0x1007c2570 ; 0x1007c2570
0x100220583: add rsp, 0xc8
0x10022058a: pop rbx
0x10022058b: pop r12
0x10022058d: pop r13
0x10022058f: pop r14
0x100220591: pop r15
0x100220593: pop rbp
0x100220594: ret 
0x100220595: lea rdi, [rip + 0x9458c9] ; 0x100b65e65 Observed()
0x10022059c: lea rsi, [rip + 0x9458cd] ; 0x100b65e70 ./Mesh.h
0x1002205a3: mov edx, 0x6d
0x1002205a8: mov ecx, 3
0x1002205ad: call 0x1007e5f70 ; 0x1007e5f70
0x1002205b2: ud2 
0x1002205b4: lea rdi, [rip + 0x95672f] ; 0x100b76cea IsInitialized()
0x1002205bb: lea rsi, [rip + 0x941cb9] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1002205c2: mov edx, 0xa8
0x1002205c7: mov ecx, 3
0x1002205cc: call 0x1007e5f70 ; 0x1007e5f70
0x1002205d1: jmp 0x1002205b2 ; 0x1002205b2
0x1002205d3: jmp 0x100220694 ; 0x100220694
0x1002205d8: mov rbx, rax
0x1002205db: jmp 0x100220624 ; 0x100220624
0x1002205dd: jmp 0x1002205ff ; 0x1002205ff
0x1002205df: mov rdi, rax
0x1002205e2: call 0x100011bf0 ; 0x100011bf0
0x1002205e7: mov rdi, rax
0x1002205ea: call 0x100011bf0 ; 0x100011bf0
0x1002205ef: mov rdi, rax
0x1002205f2: call 0x100011bf0 ; 0x100011bf0
0x1002205f7: mov rdi, rax
0x1002205fa: call 0x100011bf0 ; 0x100011bf0
0x1002205ff: mov rbx, rax
0x100220602: jmp 0x100220634 ; 0x100220634
0x100220604: mov rbx, rax
0x100220607: jmp 0x100220645 ; 0x100220645
0x100220609: mov rbx, rax
0x10022060c: jmp 0x100220656 ; 0x100220656
0x10022060e: jmp 0x10022068d ; 0x10022068d
0x100220610: mov rbx, rax
0x100220613: jmp 0x100220624 ; 0x100220624
0x100220615: mov rbx, rax
0x100220618: lea rdi, [rbp - 0xa0]
0x10022061f: call 0x1007c2570 ; 0x1007c2570
0x100220624: call 0x1007c6c20 ; 0x1007c6c20
0x100220629: mov rdi, rax
0x10022062c: mov rsi, r15
0x10022062f: call 0x100795a70 ; 0x100795a70
0x100220634: call 0x1007c6c20 ; 0x1007c6c20
0x100220639: mov rdi, rax
0x10022063c: mov rsi, qword ptr [rbp - 0x48]
0x100220640: call 0x100795a70 ; 0x100795a70
0x100220645: call 0x1007c6c20 ; 0x1007c6c20
0x10022064a: mov rdi, rax
0x10022064d: mov rsi, qword ptr [rbp - 0x40]
0x100220651: call 0x100795a70 ; 0x100795a70
0x100220656: call 0x1007c6c20 ; 0x1007c6c20
0x10022065b: mov rdi, rax
0x10022065e: mov rsi, qword ptr [rbp - 0x38]
0x100220662: call 0x100795a70 ; 0x100795a70
0x100220667: jmp 0x1002206a3 ; 0x1002206a3
0x100220669: mov rdi, rax
0x10022066c: call 0x100011bf0 ; 0x100011bf0
0x100220671: mov rdi, rax
0x100220674: call 0x100011bf0 ; 0x100011bf0
0x100220679: mov rdi, rax
0x10022067c: call 0x100011bf0 ; 0x100011bf0
0x100220681: mov rdi, rax
0x100220684: call 0x100011bf0 ; 0x100011bf0
0x100220689: jmp 0x10022068d ; 0x10022068d
0x10022068b: jmp 0x100220694 ; 0x100220694
0x10022068d: mov rbx, rax
0x100220690: jmp 0x1002206a3 ; 0x1002206a3
0x100220692: jmp 0x100220694 ; 0x100220694
0x100220694: mov rbx, rax
0x100220697: lea rdi, [rbp - 0xc0]
0x10022069e: call 0x1007c2570 ; 0x1007c2570
0x1002206a3: lea rdi, [rbp - 0xe0]
0x1002206aa: call 0x1007c2570 ; 0x1007c2570
0x1002206af: mov rdi, rbx
0x1002206b2: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1002206b7: nop word ptr [rax + rax]
