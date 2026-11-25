0x100455e90: push rbp
0x100455e91: mov rbp, rsp
0x100455e94: push r15
0x100455e96: push r14
0x100455e98: push r13
0x100455e9a: push r12
0x100455e9c: push rbx
0x100455e9d: sub rsp, 0xa8
0x100455ea4: mov dword ptr [rbp - 0x5c], r9d
0x100455ea8: mov dword ptr [rbp - 0x48], r8d
0x100455eac: mov dword ptr [rbp - 0x44], ecx
0x100455eaf: mov r14, rdx
0x100455eb2: mov r12, rsi
0x100455eb5: mov rbx, rdi
0x100455eb8: mov qword ptr [rbx + 0x48], 0
0x100455ec0: movsxd rax, dword ptr [rbx + 0x40]
0x100455ec4: test rax, rax
0x100455ec7: jle 0x10045655b
0x100455ecd: imul rsi, rax, 0xb8
0x100455ed4: mov rdx, qword ptr [rip + 0x1bb0f65] ; 0x102006e40
0x100455edb: mov ecx, 0x10
0x100455ee0: mov rdi, r14
0x100455ee3: call 0x100795530 ; 0x100795530
0x100455ee8: mov r13, rax
0x100455eeb: mov qword ptr [rbx + 0x48], r13
0x100455eef: cmp dword ptr [rbx + 0x40], 0
0x100455ef3: jle 0x10045655b
0x100455ef9: cmp dword ptr [rbp - 0x44], 0x1c
0x100455efd: setl al
0x100455f00: and al, byte ptr [rbp - 0x48]
0x100455f03: mov byte ptr [rbp - 0x29], al
0x100455f06: xor ecx, ecx
0x100455f08: mov qword ptr [rbp - 0x50], r12
0x100455f0c: mov qword ptr [rbp - 0x70], rbx
0x100455f10: mov qword ptr [rbp - 0x40], r14
0x100455f14: mov qword ptr [rbp - 0x68], r13
0x100455f18: nop dword ptr [rax + rax]
0x100455f20: mov qword ptr [rbp - 0xa8], rcx
0x100455f27: imul r15, rcx, 0xb8
0x100455f2e: lea rsi, [r13 + r15]
0x100455f33: mov rdi, r12
0x100455f36: mov qword ptr [rbp - 0x38], rsi
0x100455f3a: call 0x10076a2a0 ; 0x10076a2a0
0x100455f3f: lea rbx, [r13 + r15 + 4]
0x100455f44: mov edx, 0xc
0x100455f49: mov rdi, r12
0x100455f4c: mov rsi, rbx
0x100455f4f: call 0x10076a0a0 ; 0x10076a0a0
0x100455f54: mov r14, r12
0x100455f57: lea r12, [r13 + r15 + 0x10]
0x100455f5c: mov edx, 0xc
0x100455f61: mov rdi, r14
0x100455f64: mov rsi, r12
0x100455f67: call 0x10076a0a0 ; 0x10076a0a0
0x100455f6c: lea rcx, [r13 + r15 + 0x1c]
0x100455f71: cmp dword ptr [rbp - 0x44], 0x1c
0x100455f75: mov qword ptr [rbp - 0xa0], rcx
0x100455f7c: jl 0x100455fb0
0x100455f7e: mov edx, 0xc
0x100455f83: mov rdi, r14
0x100455f86: mov rsi, rcx
0x100455f89: call 0x10076a0a0 ; 0x10076a0a0
0x100455f8e: lea rsi, [r13 + r15 + 0x28]
0x100455f93: mov edx, 0xc
0x100455f98: mov rdi, r14
0x100455f9b: call 0x10076a0a0 ; 0x10076a0a0
0x100455fa0: jmp 0x100455fcf ; 0x100455fcf
0x100455fa2: nop word ptr cs:[rax + rax]
0x100455fb0: mov eax, dword ptr [rbx + 8]
0x100455fb3: mov dword ptr [rcx + 8], eax
0x100455fb6: mov rax, qword ptr [rbx]
0x100455fb9: mov qword ptr [rcx], rax
0x100455fbc: mov eax, dword ptr [r12 + 8]
0x100455fc1: mov dword ptr [r13 + r15 + 0x30], eax
0x100455fc6: mov rax, qword ptr [r12]
0x100455fca: mov qword ptr [r13 + r15 + 0x28], rax
0x100455fcf: mov rax, qword ptr [rbp - 0x38]
0x100455fd3: vmovss xmm0, dword ptr [rax]
0x100455fd7: vucomiss xmm0, dword ptr [rip + 0x65264d] ; 0x100aa862c
0x100455fdf: jb 0x100456065
0x100455fe5: vmovss xmm0, dword ptr [r12]
0x100455feb: vinsertps xmm0, xmm0, dword ptr [r13 + r15 + 0x14], 0x10
0x100455ff3: vinsertps xmm0, xmm0, dword ptr [r13 + r15 + 0x18], 0x20
0x100455ffb: vmovaps xmm2, xmmword ptr [rbp - 0xc0]
0x100456003: vblendps xmm2, xmm0, xmm2, 8
0x100456009: vmovss xmm0, dword ptr [rbx]
0x10045600d: vinsertps xmm0, xmm0, dword ptr [r13 + r15 + 8], 0x10
0x100456015: vinsertps xmm0, xmm0, dword ptr [r13 + r15 + 0xc], 0x20
0x10045601d: vmovaps xmm1, xmmword ptr [rbp - 0xd0]
0x100456025: vblendps xmm1, xmm0, xmm1, 8
0x10045602b: vmovaps xmmword ptr [rbp - 0xd0], xmm1
0x100456033: vmovaps xmmword ptr [rbp - 0xc0], xmm2
0x10045603b: vsubps xmm0, xmm2, xmm1
0x10045603f: vmulps xmm0, xmm0, xmm0
0x100456043: vmovshdup xmm1, xmm0
0x100456047: vaddss xmm1, xmm0, xmm1
0x10045604b: vpermilpd xmm0, xmm0, 1
0x100456051: vaddss xmm0, xmm0, xmm1
0x100456055: vsqrtss xmm0, xmm0, xmm0
0x100456059: vmulss xmm0, xmm0, dword ptr [rip + 0x65756f] ; 0x100aad5d0
0x100456061: vmovss dword ptr [rax], xmm0
0x100456065: mov r12, qword ptr [rbp - 0x50]
0x100456069: lea rsi, [r13 + r15 + 0x34]
0x10045606e: mov rdi, r12
0x100456071: mov qword ptr [rbp - 0x38], rsi
0x100456075: call 0x10076a240 ; 0x10076a240
0x10045607a: lea rsi, [r13 + r15 + 0x38]
0x10045607f: mov rdi, r12
0x100456082: mov qword ptr [rbp - 0x78], rsi
0x100456086: call 0x10076a240 ; 0x10076a240
0x10045608b: lea rsi, [r13 + r15 + 0x3c]
0x100456090: mov rdi, r12
0x100456093: mov qword ptr [rbp - 0x58], rsi
0x100456097: call 0x10076a240 ; 0x10076a240
0x10045609c: lea rsi, [r13 + r15 + 0x40]
0x1004560a1: mov rdi, r12
0x1004560a4: mov qword ptr [rbp - 0x80], rsi
0x1004560a8: call 0x10076a240 ; 0x10076a240
0x1004560ad: lea rsi, [r13 + r15 + 0x44]
0x1004560b2: mov rdi, r12
0x1004560b5: mov qword ptr [rbp - 0x88], rsi
0x1004560bc: call 0x10076a240 ; 0x10076a240
0x1004560c1: lea rsi, [r13 + r15 + 0x48]
0x1004560c6: mov rdi, r12
0x1004560c9: mov qword ptr [rbp - 0x90], rsi
0x1004560d0: call 0x10076a240 ; 0x10076a240
0x1004560d5: lea rsi, [r13 + r15 + 0x4c]
0x1004560da: mov rdi, r12
0x1004560dd: mov qword ptr [rbp - 0x98], rsi
0x1004560e4: call 0x10076a240 ; 0x10076a240
0x1004560e9: lea rsi, [r13 + r15 + 0x50]
0x1004560ee: mov edx, 0x10
0x1004560f3: mov rdi, r12
0x1004560f6: call 0x10076a0a0 ; 0x10076a0a0
0x1004560fb: movsxd rbx, dword ptr [r13 + r15 + 0x34]
0x100456100: shl rbx, 4
0x100456104: mov rdx, qword ptr [rip + 0x1bb0d35] ; 0x102006e40
0x10045610b: mov ecx, 0x10
0x100456110: mov r14, qword ptr [rbp - 0x40]
0x100456114: mov rdi, r14
0x100456117: mov rsi, rbx
0x10045611a: call 0x100795530 ; 0x100795530
0x10045611f: mov qword ptr [r13 + r15 + 0x60], rax
0x100456124: mov rdi, r12
0x100456127: mov rsi, rax
0x10045612a: mov edx, ebx
0x10045612c: call 0x10076a0a0 ; 0x10076a0a0
0x100456131: movsxd rbx, dword ptr [r13 + r15 + 0x34]
0x100456136: lea rsi, [rbx*4 + 4]
0x10045613e: shl rbx, 2
0x100456142: mov rdx, qword ptr [rip + 0x1bb0cf7] ; 0x102006e40
0x100456149: mov ecx, 0x10
0x10045614e: mov rdi, r14
0x100456151: call 0x100795530 ; 0x100795530
0x100456156: mov qword ptr [r13 + r15 + 0x68], rax
0x10045615b: mov rdi, r12
0x10045615e: mov rsi, rax
0x100456161: mov edx, ebx
0x100456163: call 0x10076a0a0 ; 0x10076a0a0
0x100456168: movsxd rbx, dword ptr [r13 + r15 + 0x34]
0x10045616d: shl rbx, 4
0x100456171: mov rdx, qword ptr [rip + 0x1bb0cc8] ; 0x102006e40
0x100456178: mov ecx, 0x10
0x10045617d: mov rdi, r14
0x100456180: mov rsi, rbx
0x100456183: call 0x100795530 ; 0x100795530
0x100456188: mov qword ptr [r13 + r15 + 0x70], rax
0x10045618d: mov rdi, r12
0x100456190: mov rsi, rax
0x100456193: mov edx, ebx
0x100456195: call 0x10076a0a0 ; 0x10076a0a0
0x10045619a: mov qword ptr [r13 + r15 + 0x78], 0
0x1004561a3: cmp byte ptr [rbp - 0x48], 0
0x1004561a7: je 0x1004561e5
0x1004561a9: lea r12, [r13 + r15 + 0x78]
0x1004561ae: mov rax, qword ptr [rbp - 0x38]
0x1004561b2: movsxd rbx, dword ptr [rax]
0x1004561b5: shl rbx, 3
0x1004561b9: mov rdx, qword ptr [rip + 0x1bb0c80] ; 0x102006e40
0x1004561c0: mov ecx, 0x10
0x1004561c5: mov rdi, r14
0x1004561c8: mov rsi, rbx
0x1004561cb: call 0x100795530 ; 0x100795530
0x1004561d0: mov qword ptr [r12], rax
0x1004561d4: mov r12, qword ptr [rbp - 0x50]
0x1004561d8: mov rdi, r12
0x1004561db: mov rsi, rax
0x1004561de: mov edx, ebx
0x1004561e0: call 0x10076a0a0 ; 0x10076a0a0
0x1004561e5: mov r13, r14
0x1004561e8: mov r14, r12
0x1004561eb: mov r12, qword ptr [rbp - 0x78]
0x1004561ef: movsxd rbx, dword ptr [r12]
0x1004561f3: shl rbx, 2
0x1004561f7: mov rdx, qword ptr [rip + 0x1bb0c42] ; 0x102006e40
0x1004561fe: mov ecx, 0x10
0x100456203: mov rdi, r13
0x100456206: mov rsi, rbx
0x100456209: call 0x100795530 ; 0x100795530
0x10045620e: mov rcx, qword ptr [rbp - 0x68]
0x100456212: mov qword ptr [rcx + r15 + 0x80], rax
0x10045621a: mov rdi, r14
0x10045621d: mov rsi, rax
0x100456220: mov edx, ebx
0x100456222: call 0x10076a0a0 ; 0x10076a0a0
0x100456227: movsxd rbx, dword ptr [r12]
0x10045622b: mov r12, r14
0x10045622e: mov r14, r13
0x100456231: mov r13, qword ptr [rbp - 0x68]
0x100456235: shl rbx, 2
0x100456239: mov rdx, qword ptr [rip + 0x1bb0c00] ; 0x102006e40
0x100456240: mov ecx, 0x10
0x100456245: mov rdi, r14
0x100456248: mov rsi, rbx
0x10045624b: call 0x100795530 ; 0x100795530
0x100456250: mov qword ptr [r13 + r15 + 0x88], rax
0x100456258: mov rdi, r12
0x10045625b: mov rsi, rax
0x10045625e: mov edx, ebx
0x100456260: call 0x10076a0a0 ; 0x10076a0a0
0x100456265: mov qword ptr [r13 + r15 + 0x90], 0
0x100456271: mov rax, qword ptr [rbp - 0x58]
0x100456275: cmp dword ptr [rax], 0
0x100456278: jle 0x1004562bc
0x10045627a: lea rax, [r13 + r15 + 0x90]
0x100456282: mov qword ptr [rbp - 0x58], rax
0x100456286: mov rax, qword ptr [rbp - 0x38]
0x10045628a: movsxd rbx, dword ptr [rax]
0x10045628d: shl rbx, 2
0x100456291: mov rdx, qword ptr [rip + 0x1bb0ba8] ; 0x102006e40
0x100456298: mov ecx, 0x10
0x10045629d: mov rdi, r14
0x1004562a0: mov rsi, rbx
0x1004562a3: call 0x100795530 ; 0x100795530
0x1004562a8: mov rcx, qword ptr [rbp - 0x58]
0x1004562ac: mov qword ptr [rcx], rax
0x1004562af: mov rdi, r12
0x1004562b2: mov rsi, rax
0x1004562b5: mov edx, ebx
0x1004562b7: call 0x10076a0a0 ; 0x10076a0a0
0x1004562bc: mov qword ptr [r13 + r15 + 0x98], 0
0x1004562c8: mov rax, qword ptr [rbp - 0x80]
0x1004562cc: cmp dword ptr [rax], 0
0x1004562cf: jle 0x10045630c
0x1004562d1: lea r14, [r13 + r15 + 0x98]
0x1004562d9: mov rax, qword ptr [rbp - 0x38]
0x1004562dd: movsxd rbx, dword ptr [rax]
0x1004562e0: shl rbx, 2
0x1004562e4: mov rdx, qword ptr [rip + 0x1bb0b55] ; 0x102006e40
0x1004562eb: mov ecx, 0x10
0x1004562f0: mov rdi, qword ptr [rbp - 0x40]
0x1004562f4: mov rsi, rbx
0x1004562f7: call 0x100795530 ; 0x100795530
0x1004562fc: mov qword ptr [r14], rax
0x1004562ff: mov rdi, r12
0x100456302: mov rsi, rax
0x100456305: mov edx, ebx
0x100456307: call 0x10076a0a0 ; 0x10076a0a0
0x10045630c: mov qword ptr [r13 + r15 + 0xa0], 0
0x100456318: mov rax, qword ptr [rbp - 0x88]
0x10045631f: movsxd rbx, dword ptr [rax]
0x100456322: test rbx, rbx
0x100456325: jle 0x10045635b
0x100456327: lea r14, [r13 + r15 + 0xa0]
0x10045632f: shl rbx, 2
0x100456333: mov rdx, qword ptr [rip + 0x1bb0b06] ; 0x102006e40
0x10045633a: mov ecx, 0x10
0x10045633f: mov rdi, qword ptr [rbp - 0x40]
0x100456343: mov rsi, rbx
0x100456346: call 0x100795530 ; 0x100795530
0x10045634b: mov qword ptr [r14], rax
0x10045634e: mov rdi, r12
0x100456351: mov rsi, rax
0x100456354: mov edx, ebx
0x100456356: call 0x10076a0a0 ; 0x10076a0a0
0x10045635b: mov qword ptr [r13 + r15 + 0xa8], 0
0x100456367: mov rax, qword ptr [rbp - 0x90]
0x10045636e: movsxd rbx, dword ptr [rax]
0x100456371: test rbx, rbx
0x100456374: jle 0x1004563aa
0x100456376: lea r14, [r13 + r15 + 0xa8]
0x10045637e: shl rbx, 2
0x100456382: mov rdx, qword ptr [rip + 0x1bb0ab7] ; 0x102006e40
0x100456389: mov ecx, 0x10
0x10045638e: mov rdi, qword ptr [rbp - 0x40]
0x100456392: mov rsi, rbx
0x100456395: call 0x100795530 ; 0x100795530
0x10045639a: mov qword ptr [r14], rax
0x10045639d: mov rdi, r12
0x1004563a0: mov rsi, rax
0x1004563a3: mov edx, ebx
0x1004563a5: call 0x10076a0a0 ; 0x10076a0a0
0x1004563aa: mov qword ptr [r13 + r15 + 0xb0], 0
0x1004563b6: mov rax, qword ptr [rbp - 0x98]
0x1004563bd: movsxd rbx, dword ptr [rax]
0x1004563c0: test rbx, rbx
0x1004563c3: jle 0x1004563f9
0x1004563c5: lea r14, [r13 + r15 + 0xb0]
0x1004563cd: shl rbx, 3
0x1004563d1: mov rdx, qword ptr [rip + 0x1bb0a68] ; 0x102006e40
0x1004563d8: mov ecx, 0x10
0x1004563dd: mov rdi, qword ptr [rbp - 0x40]
0x1004563e1: mov rsi, rbx
0x1004563e4: call 0x100795530 ; 0x100795530
0x1004563e9: mov qword ptr [r14], rax
0x1004563ec: mov rdi, r12
0x1004563ef: mov rsi, rax
0x1004563f2: mov edx, ebx
0x1004563f4: call 0x10076a0a0 ; 0x10076a0a0
0x1004563f9: cmp byte ptr [rbp - 0x29], 0
0x1004563fd: mov r14, qword ptr [rbp - 0x40]
0x100456401: mov rsi, qword ptr [rbp - 0xa0]
0x100456408: je 0x100456540
0x10045640e: movabs rax, 0x80000000800000
0x100456418: mov qword ptr [r13 + r15 + 0x2c], rax
0x10045641d: vmovaps xmm0, xmmword ptr [rip + 0x66c28b] ; 0x100ac26b0
0x100456425: vmovups xmmword ptr [rsi], xmm0
0x100456429: mov rax, qword ptr [rbp - 0x38]
0x10045642d: movsxd rax, dword ptr [rax]
0x100456430: test rax, rax
0x100456433: jle 0x100456540
0x100456439: lea rcx, [r13 + r15 + 0x60]
0x10045643e: mov rdx, qword ptr [rcx]
0x100456441: add rdx, 8
0x100456445: vmovss xmm0, dword ptr [rip + 0x655b03] ; 0x100aabf50
0x10045644d: vmovaps xmm2, xmm0
0x100456451: vmovaps xmm1, xmm2
0x100456455: vmovss xmm3, dword ptr [rip + 0x65145b] ; 0x100aa78b8
0x10045645d: vmovaps xmm5, xmm3
0x100456461: vmovaps xmm4, xmm5
0x100456465: nop word ptr cs:[rax + rax]
0x100456470: vmovss xmm6, dword ptr [rdx - 8]
0x100456475: vucomiss xmm5, xmm6
0x100456479: ja 0x1004564c0
0x10045647b: vmovss xmm6, dword ptr [rdx - 4]
0x100456480: vucomiss xmm4, xmm6
0x100456484: ja 0x1004564d3
0x100456486: vmovss xmm6, dword ptr [rdx]
0x10045648a: vucomiss xmm3, xmm6
0x10045648e: ja 0x1004564e6
0x100456490: vmovss xmm6, dword ptr [rdx - 8]
0x100456495: vucomiss xmm6, xmm2
0x100456499: ja 0x1004564fa
0x10045649b: vmovss xmm6, dword ptr [rdx - 4]
0x1004564a0: vucomiss xmm6, xmm1
0x1004564a4: ja 0x10045650e
0x1004564a6: vmovss xmm6, dword ptr [rdx]
0x1004564aa: vucomiss xmm6, xmm0
0x1004564ae: ja 0x100456521
0x1004564b0: add rdx, 0x10
0x1004564b4: dec rax
0x1004564b7: jne 0x100456470
0x1004564b9: jmp 0x100456540 ; 0x100456540
0x1004564be: nop 
0x1004564c0: vmovss dword ptr [rsi], xmm6
0x1004564c4: vmovaps xmm5, xmm6
0x1004564c8: vmovss xmm6, dword ptr [rdx - 4]
0x1004564cd: vucomiss xmm4, xmm6
0x1004564d1: jbe 0x100456486
0x1004564d3: vmovss dword ptr [rcx - 0x40], xmm6
0x1004564d8: vmovaps xmm4, xmm6
0x1004564dc: vmovss xmm6, dword ptr [rdx]
0x1004564e0: vucomiss xmm3, xmm6
0x1004564e4: jbe 0x100456490
0x1004564e6: vmovss dword ptr [rcx - 0x3c], xmm6
0x1004564eb: vmovaps xmm3, xmm6
0x1004564ef: vmovss xmm6, dword ptr [rdx - 8]
0x1004564f4: vucomiss xmm6, xmm2
0x1004564f8: jbe 0x10045649b
0x1004564fa: vmovss dword ptr [rcx - 0x38], xmm6
0x1004564ff: vmovaps xmm2, xmm6
0x100456503: vmovss xmm6, dword ptr [rdx - 4]
0x100456508: vucomiss xmm6, xmm1
0x10045650c: jbe 0x1004564a6
0x10045650e: vmovss dword ptr [rcx - 0x34], xmm6
0x100456513: vmovaps xmm1, xmm6
0x100456517: vmovss xmm6, dword ptr [rdx]
0x10045651b: vucomiss xmm6, xmm0
0x10045651f: jbe 0x1004564b0
0x100456521: vmovss dword ptr [rcx - 0x30], xmm6
0x100456526: vmovaps xmm0, xmm6
0x10045652a: add rdx, 0x10
0x10045652e: dec rax
0x100456531: jne 0x100456470
0x100456537: nop word ptr [rax + rax]
0x100456540: mov rcx, qword ptr [rbp - 0xa8]
0x100456547: inc rcx
0x10045654a: mov rbx, qword ptr [rbp - 0x70]
0x10045654e: movsxd rax, dword ptr [rbx + 0x40]
0x100456552: cmp rcx, rax
0x100456555: jl 0x100455f20
0x10045655b: mov qword ptr [rbx + 0x50], 0
0x100456563: cmp byte ptr [rbp - 0x5c], 0
0x100456567: je 0x100456609
0x10045656d: mov rdx, qword ptr [rip + 0x1bb08d4] ; 0x102006e48
0x100456574: mov esi, 0x18
0x100456579: mov ecx, 0x10
0x10045657e: mov rdi, r14
0x100456581: call 0x100795530 ; 0x100795530
0x100456586: mov r13, r14
0x100456589: mov r14, rax
0x10045658c: mov rdi, r12
0x10045658f: mov rsi, r14
0x100456592: call 0x10076a280 ; 0x10076a280
0x100456597: lea rsi, [r14 + 4]
0x10045659b: mov rdi, r12
0x10045659e: call 0x10076a280 ; 0x10076a280
0x1004565a3: imul r15d, dword ptr [r14], 3
0x1004565a7: shl r15, 2
0x1004565ab: mov rdx, qword ptr [rip + 0x1bb088e] ; 0x102006e40
0x1004565b2: mov ecx, 0x10
0x1004565b7: mov rdi, r13
0x1004565ba: mov rsi, r15
0x1004565bd: call 0x100795530 ; 0x100795530
0x1004565c2: mov qword ptr [r14 + 8], rax
0x1004565c6: mov rdi, r12
0x1004565c9: mov rsi, rax
0x1004565cc: mov edx, r15d
0x1004565cf: call 0x10076a0a0 ; 0x10076a0a0
0x1004565d4: mov r15d, dword ptr [r14 + 4]
0x1004565d8: shl r15, 2
0x1004565dc: mov rdx, qword ptr [rip + 0x1bb085d] ; 0x102006e40
0x1004565e3: mov ecx, 0x10
0x1004565e8: mov rdi, r13
0x1004565eb: mov rsi, r15
0x1004565ee: call 0x100795530 ; 0x100795530
0x1004565f3: mov qword ptr [r14 + 0x10], rax
0x1004565f7: mov rdi, r12
0x1004565fa: mov rsi, rax
0x1004565fd: mov edx, r15d
0x100456600: call 0x10076a0a0 ; 0x10076a0a0
0x100456605: mov qword ptr [rbx + 0x50], r14
0x100456609: add rsp, 0xa8
0x100456610: pop rbx
0x100456611: pop r12
0x100456613: pop r13
0x100456615: pop r14
0x100456617: pop r15
0x100456619: pop rbp
0x10045661a: ret 
0x10045661b: nop dword ptr [rax + rax]
