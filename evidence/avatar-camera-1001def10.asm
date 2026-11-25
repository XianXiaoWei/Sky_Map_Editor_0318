0x1001def10: push rbp
0x1001def11: mov rbp, rsp
0x1001def14: push r15
0x1001def16: push r14
0x1001def18: push r13
0x1001def1a: push r12
0x1001def1c: push rbx
0x1001def1d: and rsp, 0xffffffffffffffe0
0x1001def21: sub rsp, 0xb00
0x1001def28: mov qword ptr [rsp + 0x88], rsi
0x1001def30: mov r13, rdi
0x1001def33: mov rax, qword ptr [rip + 0xa2e99e] ; 0x100c0d8d8
0x1001def3a: mov rax, qword ptr [rax]
0x1001def3d: mov qword ptr [rsp + 0xae0], rax
0x1001def45: mov rax, qword ptr [r13 + 0x110]
0x1001def4c: test rax, rax
0x1001def4f: je 0x1001df00a
0x1001def55: vxorps xmm0, xmm0, xmm0
0x1001def59: nop dword ptr [rax]
0x1001def60: cmp byte ptr [rax + 0xe0], 0
0x1001def67: je 0x1001def80
0x1001def69: mov rcx, rax
0x1001def6c: mov rax, qword ptr [rcx + 0x18]
0x1001def70: test rax, rax
0x1001def73: jne 0x1001def60
0x1001def75: jmp 0x1001df001 ; 0x1001df001
0x1001def7a: nop word ptr [rax + rax]
0x1001def80: cmp rax, qword ptr [r13 + 0x110]
0x1001def87: je 0x1001e044f
0x1001def8d: cmp rax, qword ptr [r13 + 0x118]
0x1001def94: je 0x1001e044f
0x1001def9a: cmp rax, qword ptr [r13 + 0x120]
0x1001defa1: je 0x1001e044f
0x1001defa7: cmp rax, qword ptr [r13 + 0x128]
0x1001defae: je 0x1001e044f
0x1001defb4: cmp rax, qword ptr [r13 + 0x130]
0x1001defbb: je 0x1001e044f
0x1001defc1: cmp rax, qword ptr [r13 + 0x138]
0x1001defc8: je 0x1001e044f
0x1001defce: mov rcx, qword ptr [rax + 0x10]
0x1001defd2: test rcx, rcx
0x1001defd5: je 0x1001defdf
0x1001defd7: mov rsi, qword ptr [rax + 0x18]
0x1001defdb: mov qword ptr [rcx + 0x18], rsi
0x1001defdf: mov rsi, qword ptr [rax + 0x18]
0x1001defe3: add rax, 0x10
0x1001defe7: test rsi, rsi
0x1001defea: je 0x1001deff0
0x1001defec: mov qword ptr [rsi + 0x10], rcx
0x1001deff0: vmovups xmmword ptr [rax], xmm0
0x1001deff4: mov rax, qword ptr [rcx + 0x18]
0x1001deff8: test rax, rax
0x1001deffb: jne 0x1001def60
0x1001df001: mov rbx, qword ptr [r13 + 0x110]
0x1001df008: jmp 0x1001df00c ; 0x1001df00c
0x1001df00a: xor ebx, ebx
0x1001df00c: mov qword ptr [rsp + 0x90], rdx
0x1001df014: mov eax, dword ptr [r13 + 0x150]
0x1001df01b: mov dword ptr [rsp + 0x10], eax
0x1001df01f: mov eax, dword ptr [r13 + 0x154]
0x1001df026: mov dword ptr [rsp + 0x30], eax
0x1001df02a: vmovaps xmm0, xmmword ptr [r13 + 0x160]
0x1001df033: vmovaps xmmword ptr [rsp + 0x70], xmm0
0x1001df039: vmovaps xmm0, xmmword ptr [r13 + 0x170]
0x1001df042: vmovaps xmmword ptr [rsp + 0x2d0], xmm0
0x1001df04b: vmovaps xmm0, xmmword ptr [r13 + 0x180]
0x1001df054: vmovaps xmmword ptr [rsp + 0x2c0], xmm0
0x1001df05d: vmovaps xmm0, xmmword ptr [r13 + 0x190]
0x1001df066: vmovaps xmmword ptr [rsp + 0x2b0], xmm0
0x1001df06f: mov rax, qword ptr [r13 + 0x1a0]
0x1001df076: mov qword ptr [rsp + 0x98], rax
0x1001df07e: test rbx, rbx
0x1001df081: je 0x1001df147
0x1001df087: mov r12, qword ptr [rsp + 0x88]
0x1001df08f: nop 
0x1001df090: cmp byte ptr [rbx + 0xe0], 0
0x1001df097: je 0x1001e046e
0x1001df09d: mov rax, qword ptr [rbx]
0x1001df0a0: mov r14, qword ptr [rbx + 0x20]
0x1001df0a4: vmovaps xmm0, xmmword ptr [rbx + 0x30]
0x1001df0a9: vmovaps xmmword ptr [rsp], xmm0
0x1001df0ae: vmovaps xmm0, xmmword ptr [rbx + 0x40]
0x1001df0b3: vmovaps xmmword ptr [rsp + 0x40], xmm0
0x1001df0b9: vmovaps xmm0, xmmword ptr [rbx + 0x50]
0x1001df0be: vmovaps xmmword ptr [rsp + 0x50], xmm0
0x1001df0c4: vmovaps xmm0, xmmword ptr [rbx + 0x60]
0x1001df0c9: vmovaps xmmword ptr [rsp + 0x20], xmm0
0x1001df0cf: mov r15, qword ptr [rbx + 0x70]
0x1001df0d3: mov rdi, rbx
0x1001df0d6: mov rsi, r12
0x1001df0d9: call qword ptr [rax + 0x18]
0x1001df0dc: mov qword ptr [rbx + 0x80], r14
0x1001df0e3: vmovaps xmm0, xmmword ptr [rsp]
0x1001df0e8: vmovaps xmmword ptr [rbx + 0x90], xmm0
0x1001df0f0: vmovaps xmm0, xmmword ptr [rsp + 0x40]
0x1001df0f6: vmovaps xmmword ptr [rbx + 0xa0], xmm0
0x1001df0fe: vmovaps xmm0, xmmword ptr [rsp + 0x50]
0x1001df104: vmovaps xmmword ptr [rbx + 0xb0], xmm0
0x1001df10c: vmovaps xmm0, xmmword ptr [rsp + 0x20]
0x1001df112: vmovaps xmmword ptr [rbx + 0xc0], xmm0
0x1001df11a: mov qword ptr [rbx + 0xd0], r15
0x1001df121: cmp byte ptr [rip + 0xab06a8], 0 ; 0x100c8f7d0
0x1001df128: je 0x1001df13a
0x1001df12a: mov rdx, qword ptr [r12 + 0x60]
0x1001df12f: mov rdi, r13
0x1001df132: mov rsi, rbx
0x1001df135: call 0x1001e2300 ; 0x1001e2300
0x1001df13a: mov rbx, qword ptr [rbx + 0x18]
0x1001df13e: test rbx, rbx
0x1001df141: jne 0x1001df090
0x1001df147: mov eax, dword ptr [rsp + 0x10]
0x1001df14b: mov dword ptr [r13 + 0x1b0], eax
0x1001df152: mov eax, dword ptr [rsp + 0x30]
0x1001df156: mov dword ptr [r13 + 0x1b4], eax
0x1001df15d: vmovaps xmm0, xmmword ptr [rsp + 0x70]
0x1001df163: vmovaps xmmword ptr [r13 + 0x1c0], xmm0
0x1001df16c: vmovaps xmm0, xmmword ptr [rsp + 0x2d0]
0x1001df175: vmovaps xmmword ptr [r13 + 0x1d0], xmm0
0x1001df17e: vmovaps xmm0, xmmword ptr [rsp + 0x2c0]
0x1001df187: vmovaps xmmword ptr [r13 + 0x1e0], xmm0
0x1001df190: vmovaps xmm0, xmmword ptr [rsp + 0x2b0]
0x1001df199: vmovaps xmmword ptr [r13 + 0x1f0], xmm0
0x1001df1a2: mov rax, qword ptr [rsp + 0x98]
0x1001df1aa: mov qword ptr [r13 + 0x200], rax
0x1001df1b1: mov rax, qword ptr [r13 + 0x138]
0x1001df1b8: mov ecx, dword ptr [rax + 0x20]
0x1001df1bb: mov dword ptr [r13 + 0x150], ecx
0x1001df1c2: mov ecx, dword ptr [rax + 0x24]
0x1001df1c5: mov dword ptr [r13 + 0x154], ecx
0x1001df1cc: vmovaps xmm0, xmmword ptr [rax + 0x30]
0x1001df1d1: vmovaps xmmword ptr [r13 + 0x160], xmm0
0x1001df1da: vmovaps xmm0, xmmword ptr [rax + 0x40]
0x1001df1df: vmovaps xmmword ptr [r13 + 0x170], xmm0
0x1001df1e8: vmovaps xmm0, xmmword ptr [rax + 0x50]
0x1001df1ed: vmovaps xmmword ptr [r13 + 0x180], xmm0
0x1001df1f6: vmovaps xmm0, xmmword ptr [rax + 0x60]
0x1001df1fb: vmovaps xmmword ptr [r13 + 0x190], xmm0
0x1001df204: mov rax, qword ptr [rax + 0x70]
0x1001df208: mov qword ptr [r13 + 0x1a0], rax
0x1001df20f: lea r12, [r13 + 0x270]
0x1001df216: mov ebx, 2
0x1001df21b: nop dword ptr [rax + rax]
0x1001df220: mov r14, qword ptr [r13 + rbx*8]
0x1001df225: test r14, r14
0x1001df228: je 0x1001df250
0x1001df22a: cmp byte ptr [r14 + 0xe0], 0
0x1001df232: jne 0x1001df250
0x1001df234: cmp qword ptr [r14 + 0x10], 0
0x1001df239: jne 0x1001df250
0x1001df23b: cmp qword ptr [r14 + 0x18], 0
0x1001df240: jne 0x1001df250
0x1001df242: cmp qword ptr [r14 + 0xe8], 0
0x1001df24a: je 0x1001df25b
0x1001df24c: nop dword ptr [rax]
0x1001df250: inc rbx
0x1001df253: cmp rbx, 0x22
0x1001df257: jne 0x1001df220
0x1001df259: jmp 0x1001df280 ; 0x1001df280
0x1001df25b: mov rax, qword ptr [r14]
0x1001df25e: mov rdi, r14
0x1001df261: call qword ptr [rax]
0x1001df263: mov rdi, r12
0x1001df266: mov rsi, r14
0x1001df269: call 0x100795a70 ; 0x100795a70
0x1001df26e: mov qword ptr [r13 + rbx*8], 0
0x1001df277: inc rbx
0x1001df27a: cmp rbx, 0x22
0x1001df27e: jne 0x1001df220
0x1001df280: mov rbx, qword ptr [rsp + 0x88]
0x1001df288: mov rdx, qword ptr [rbx + 0x150]
0x1001df28f: mov rsi, qword ptr [rbx + 0x158]
0x1001df296: mov rdi, r13
0x1001df299: call 0x1001e1400 ; 0x1001e1400
0x1001df29e: mov rdi, qword ptr [rbx + 0x150]
0x1001df2a5: mov rsi, qword ptr [r13 + 0x25c]
0x1001df2ac: call 0x1005964e0 ; 0x1005964e0
0x1001df2b1: mov rcx, qword ptr [r13 + 0x140]
0x1001df2b8: vmovaps xmm0, xmmword ptr [rcx + 0x60]
0x1001df2bd: vmovaps xmmword ptr [rax], xmm0
0x1001df2c1: mov rcx, qword ptr [r13 + 0x140]
0x1001df2c8: vmovaps xmm0, xmmword ptr [rcx + 0x70]
0x1001df2cd: vmovaps xmmword ptr [rax + 0x10], xmm0
0x1001df2d2: mov rcx, qword ptr [r13 + 0x140]
0x1001df2d9: vmovaps xmm0, xmmword ptr [rcx + 0x80]
0x1001df2e1: vmovaps xmmword ptr [rax + 0x20], xmm0
0x1001df2e6: mov rcx, qword ptr [r13 + 0x140]
0x1001df2ed: vmovaps xmm0, xmmword ptr [rcx + 0x90]
0x1001df2f5: vmovaps xmmword ptr [rax + 0x30], xmm0
0x1001df2fa: mov rcx, qword ptr [r13 + 0x140]
0x1001df301: vmovaps xmm0, xmmword ptr [rcx + 0xa0]
0x1001df309: vmovaps xmmword ptr [rax + 0x40], xmm0
0x1001df30e: mov rcx, qword ptr [r13 + 0x140]
0x1001df315: vmovaps xmm0, xmmword ptr [rcx + 0xb0]
0x1001df31d: vmovaps xmmword ptr [rax + 0x50], xmm0
0x1001df322: mov rcx, qword ptr [r13 + 0x140]
0x1001df329: vmovaps xmm0, xmmword ptr [rcx + 0xf0]
0x1001df331: vmovaps xmmword ptr [rax + 0x60], xmm0
0x1001df336: cmp byte ptr [rip + 0x1bfef2b], 0 ; 0x101dde268
0x1001df33d: je 0x1001df383
0x1001df33f: call 0x1002acd30 ; 0x1002acd30
0x1001df344: test rax, rax
0x1001df347: je 0x1001df383
0x1001df349: lea r14, [rsp + 0x2e0]
0x1001df351: mov edx, 0x800
0x1001df356: mov rdi, r13
0x1001df359: mov rsi, r14
0x1001df35c: call 0x1001e25f0 ; 0x1001e25f0
0x1001df361: mov rdi, qword ptr [rbx + 0x5f0]
0x1001df368: call 0x1002b22c0 ; 0x1002b22c0
0x1001df36d: mov rdi, qword ptr [rbx + 0x5f0]
0x1001df374: lea rdx, [rip + 0x1e60335] ; 0x10203f6b0
0x1001df37b: mov rsi, r14
0x1001df37e: call 0x1002b21b0 ; 0x1002b21b0
0x1001df383: mov r12, qword ptr [rbx + 0x498]
0x1001df38a: mov rax, qword ptr [rbx + 0x60]
0x1001df38e: vmovss xmm2, dword ptr [rax + 0x260]
0x1001df396: vmovss xmm0, dword ptr [rax + 0x264]
0x1001df39e: vmovss xmm5, dword ptr [rax + 0x298]
0x1001df3a6: vdivss xmm1, xmm2, xmm0
0x1001df3aa: vmulss xmm1, xmm0, xmm1
0x1001df3ae: vdivss xmm1, xmm1, xmm5
0x1001df3b2: vsubss xmm0, xmm0, xmm1
0x1001df3b6: vmulss xmm3, xmm0, dword ptr [rip + 0x8c51fa] ; 0x100aa45b8
0x1001df3be: vdivss xmm4, xmm2, xmm5
0x1001df3c2: cmp byte ptr [rip + 0x1bff05f], 0 ; 0x101dde428
0x1001df3c9: jne 0x1001df851
0x1001df3cf: cmp byte ptr [rip + 0x1bff0c2], 0 ; 0x101dde498
0x1001df3d6: jne 0x1001dfb7c
0x1001df3dc: mov dword ptr [r13 + 0x268], 0
0x1001df3e7: mov rax, qword ptr [r13 + 0x138]
0x1001df3ee: mov qword ptr [rsp + 0x68], rax
0x1001df3f3: test rax, rax
0x1001df3f6: je 0x1001df53c
0x1001df3fc: lea r12, [rsp + 0x2e0]
0x1001df404: lea r14, [rsp + 0x68]
0x1001df409: test rax, rax
0x1001df40c: jne 0x1001df423
0x1001df40e: jmp 0x1001df458 ; 0x1001df458
0x1001df410: mov rax, qword ptr [rsp + 0x68]
0x1001df415: mov rax, qword ptr [rax + 0x10]
0x1001df419: mov qword ptr [rsp + 0x68], rax
0x1001df41e: test rax, rax
0x1001df421: je 0x1001df458
0x1001df423: mov r15, qword ptr [rip + 0x1bfea26] ; 0x101ddde50
0x1001df42a: mov qword ptr [rsp + 0x2e0], 0
0x1001df436: call 0x1001e5770 ; 0x1001e5770
0x1001df43b: mov rbx, qword ptr [rax]
0x1001df43e: mov rdi, rax
0x1001df441: mov rsi, r12
0x1001df444: mov rdx, r14
0x1001df447: mov rcx, r15
0x1001df44a: call qword ptr [rbx + 0x40]
0x1001df44d: cmp qword ptr [rsp + 0x2e0], 0
0x1001df456: je 0x1001df410
0x1001df458: mov r15, qword ptr [rip + 0x1bfe9f1] ; 0x101ddde50
0x1001df45f: mov qword ptr [rsp + 0x2e0], 0
0x1001df46b: call 0x1001e5770 ; 0x1001e5770
0x1001df470: mov rbx, qword ptr [rax]
0x1001df473: mov rdi, rax
0x1001df476: mov rsi, r12
0x1001df479: mov rdx, r14
0x1001df47c: mov rcx, r15
0x1001df47f: call qword ptr [rbx + 0x40]
0x1001df482: mov rax, qword ptr [rsp + 0x2e0]
0x1001df48a: test rax, rax
0x1001df48d: je 0x1001df52e
0x1001df493: vmovss xmm1, dword ptr [rax + 0x100]
0x1001df49b: vucomiss xmm1, dword ptr [rip + 0x8c7c41] ; 0x100aa70e4
0x1001df4a3: vmovss xmm0, dword ptr [rip + 0x8c5c15] ; 0x100aa50c0
0x1001df4ab: jbe 0x1001df4cd
0x1001df4ad: vmovss xmm0, dword ptr [rax + 0x130]
0x1001df4b5: vdivss xmm0, xmm0, xmm1
0x1001df4b9: vxorps xmm1, xmm1, xmm1
0x1001df4bd: vmaxss xmm0, xmm1, xmm0
0x1001df4c1: vmovss xmm1, dword ptr [rip + 0x8c5bf7] ; 0x100aa50c0
0x1001df4c9: vminss xmm0, xmm1, xmm0
0x1001df4cd: vmovss xmm2, dword ptr [rax + 0x104]
0x1001df4d5: vxorps xmm1, xmm1, xmm1
0x1001df4d9: vucomiss xmm2, xmm1
0x1001df4dd: jbe 0x1001df4ff
0x1001df4df: vmovss xmm1, dword ptr [rax + 0x134]
0x1001df4e7: vdivss xmm1, xmm1, xmm2
0x1001df4eb: vxorps xmm2, xmm2, xmm2
0x1001df4ef: vmaxss xmm1, xmm2, xmm1
0x1001df4f3: vmovss xmm2, dword ptr [rip + 0x8c5bc5] ; 0x100aa50c0
0x1001df4fb: vminss xmm1, xmm2, xmm1
0x1001df4ff: vsubss xmm0, xmm0, xmm1
0x1001df503: vaddss xmm0, xmm0, dword ptr [r13 + 0x268]
0x1001df50c: vmovss dword ptr [r13 + 0x268], xmm0
0x1001df515: mov rax, qword ptr [rsp + 0x68]
0x1001df51a: mov rax, qword ptr [rax + 0x10]
0x1001df51e: mov qword ptr [rsp + 0x68], rax
0x1001df523: test rax, rax
0x1001df526: jne 0x1001df41e
0x1001df52c: jmp 0x1001df53c ; 0x1001df53c
0x1001df52e: mov rax, qword ptr [rsp + 0x68]
0x1001df533: test rax, rax
0x1001df536: jne 0x1001df41e
0x1001df53c: cmp byte ptr [rip + 0xab0299], 0 ; 0x100c8f7dc
0x1001df543: je 0x1001df82a
0x1001df549: mov rax, qword ptr [rsp + 0x90]
0x1001df551: cmp dword ptr [rax + 4], 3
0x1001df555: jl 0x1001df82a
0x1001df55b: mov rbx, qword ptr [rsp + 0x88]
0x1001df563: mov rax, qword ptr [rbx + 0x60]
0x1001df567: vmovss xmm0, dword ptr [rax + 0x298]
0x1001df56f: vmovss dword ptr [rsp], xmm0
0x1001df574: mov rdi, r13
0x1001df577: call 0x1001e2820 ; 0x1001e2820
0x1001df57c: cmp al, 2
0x1001df57e: jne 0x1001df5e0
0x1001df580: vxorps xmm0, xmm0, xmm0
0x1001df584: vmaxss xmm1, xmm0, dword ptr [r13 + 0x268]
0x1001df58d: vmovss xmm2, dword ptr [rip + 0x8c5b2b] ; 0x100aa50c0
0x1001df595: vminss xmm1, xmm2, xmm1
0x1001df599: vmulss xmm3, xmm1, xmm1
0x1001df59d: vmulss xmm3, xmm1, xmm3
0x1001df5a1: vmulss xmm4, xmm1, dword ptr [rip + 0x8c74fb] ; 0x100aa6aa4
0x1001df5a9: vaddss xmm4, xmm4, dword ptr [rip + 0x8ca0cb] ; 0x100aa967c
0x1001df5b1: vmulss xmm1, xmm1, xmm4
0x1001df5b5: vaddss xmm1, xmm1, dword ptr [rip + 0x8c821f] ; 0x100aa77dc
0x1001df5bd: vmulss xmm1, xmm3, xmm1
0x1001df5c1: vmaxss xmm0, xmm0, xmm1
0x1001df5c5: vminss xmm0, xmm2, xmm0
0x1001df5c9: vsubss xmm1, xmm2, xmm0
0x1001df5cd: vmulss xmm1, xmm1, dword ptr [rsp]
0x1001df5d2: vmulss xmm0, xmm0, dword ptr [rip + 0x8cfdbe] ; 0x100aaf398
0x1001df5da: vaddss xmm1, xmm0, xmm1
0x1001df5de: jmp 0x1001df5e5 ; 0x1001df5e5
0x1001df5e0: vmovss xmm1, dword ptr [rsp]
0x1001df5e5: mov rax, qword ptr [rbx + 0x60]
0x1001df5e9: vmovss xmm0, dword ptr [rax + 0x298]
0x1001df5f1: vdivss xmm1, xmm0, xmm1
0x1001df5f5: vmovss xmm0, dword ptr [rax + 0x264]
0x1001df5fd: vmovss xmm2, dword ptr [rax + 0x274]
0x1001df605: vdivss xmm2, xmm2, dword ptr [rip + 0x8cfc47] ; 0x100aaf254
0x1001df60d: vxorps xmm4, xmm4, xmm4
0x1001df611: vmaxss xmm2, xmm4, xmm2
0x1001df615: vmovss xmm3, dword ptr [rip + 0x8c5aa3] ; 0x100aa50c0
0x1001df61d: vminss xmm2, xmm3, xmm2
0x1001df621: vmulss xmm2, xmm0, xmm2
0x1001df625: vmulss xmm1, xmm1, xmm2
0x1001df629: vsubss xmm1, xmm2, xmm1
0x1001df62d: vmovss xmm3, dword ptr [rip + 0x8c4f83] ; 0x100aa45b8
0x1001df635: vmulss xmm1, xmm1, xmm3
0x1001df639: vucomiss xmm1, xmm4
0x1001df63d: jbe 0x1001df82a
0x1001df643: vsubss xmm2, xmm0, xmm2
0x1001df647: vmulss xmm5, xmm2, xmm3
0x1001df64b: vxorps ymm2, ymm2, ymm2
0x1001df64f: vmovaps ymmword ptr [rsp + 0x2e0], ymm2
0x1001df658: mov qword ptr [rsp + 0x300], 0
0x1001df664: movabs rcx, 0x3f8000003f800000
0x1001df66e: mov qword ptr [rsp + 0x308], rcx
0x1001df676: vxorps xmm2, xmm2, xmm2
0x1001df67a: vmovaps xmmword ptr [rsp + 0x330], xmm2
0x1001df683: vmovaps xmm3, xmmword ptr [rip + 0x8caec5] ; 0x100aaa550
0x1001df68b: vmovaps xmmword ptr [rsp + 0x340], xmm3
0x1001df694: mov dword ptr [rsp + 0x350], 0x43b40000
0x1001df69f: vmovaps xmm3, xmmword ptr [rip + 0x8c9359] ; 0x100aa8a00
0x1001df6a7: vmovaps xmmword ptr [rsp + 0x360], xmm3
0x1001df6b0: mov word ptr [rsp + 0x370], 0
0x1001df6ba: lea rcx, [rip + 0x1e5ffef] ; 0x10203f6b0
0x1001df6c1: vmovaps xmm3, xmmword ptr [rcx]
0x1001df6c5: vmovaps xmmword ptr [rsp + 0x380], xmm3
0x1001df6ce: mov dword ptr [rsp + 0x390], 0x101
0x1001df6d9: mov byte ptr [rsp + 0x394], 0
0x1001df6e1: mov dword ptr [rsp + 0x398], 0
0x1001df6ec: mov byte ptr [rsp + 0x39c], 0
0x1001df6f4: mov qword ptr [rsp + 0x3c4], 0
0x1001df700: mov dword ptr [rsp + 0x3cc], 0
0x1001df70b: vmovaps xmmword ptr [rsp + 0x3a0], xmm2
0x1001df714: mov byte ptr [rsp + 0x3b0], 0
0x1001df71c: mov qword ptr [rsp + 0x3b9], 0
0x1001df728: mov qword ptr [rsp + 0x3b4], 0
0x1001df734: mov dword ptr [rsp + 0x3d0], 0xb
0x1001df73f: vmovss xmm3, dword ptr [rax + 0x260]
0x1001df747: vmulss xmm4, xmm3, dword ptr [rip + 0x8c4e69] ; 0x100aa45b8
0x1001df74f: vblendps xmm2, xmm2, xmm4, 1
0x1001df755: vmovaps xmmword ptr [rsp + 0x310], xmm2
0x1001df75e: vinsertps xmm1, xmm3, xmm1, 0x1c
0x1001df764: vmulps xmm1, xmm1, xmmword ptr [rip + 0x8c7f04] ; 0x100aa7670
0x1001df76c: vmovaps xmmword ptr [rsp + 0x320], xmm1
0x1001df775: movabs rax, 0x100000001
0x1001df77f: mov qword ptr [rsp + 0x330], rax
0x1001df787: vmovshdup xmm1, xmm1
0x1001df78b: mov dword ptr [rsp + 0x2e1], 0x63616c42
0x1001df796: mov word ptr [rsp + 0x2e5], 0x6b
0x1001df7a0: mov byte ptr [rsp + 0x2e0], 0xa
0x1001df7a8: vmovss dword ptr [rsp], xmm5
0x1001df7ad: vsubss xmm0, xmm0, xmm5
0x1001df7b1: vsubss xmm0, xmm0, xmm1
0x1001df7b5: vmovss dword ptr [rsp + 0x314], xmm0
0x1001df7be: mov rbx, qword ptr [rsp + 0x88]
0x1001df7c6: mov rdi, qword ptr [rbx + 0x498]
0x1001df7cd: lea rsi, [rsp + 0x2e0]
0x1001df7d5: vzeroupper 
0x1001df7d8: call 0x1003a7cf0 ; 0x1003a7cf0
0x1001df7dd: vmovss xmm0, dword ptr [rsp]
0x1001df7e2: vaddss xmm0, xmm0, dword ptr [rsp + 0x324]
0x1001df7eb: vmovss dword ptr [rsp + 0x314], xmm0
0x1001df7f4: mov rdi, qword ptr [rbx + 0x498]
0x1001df7fb: lea rsi, [rsp + 0x2e0]
0x1001df803: call 0x1003a7cf0 ; 0x1003a7cf0
0x1001df808: test byte ptr [rsp + 0x2e0], 1
0x1001df810: je 0x1001df82a
0x1001df812: mov rbx, qword ptr [rsp + 0x2f0]
0x1001df81a: call 0x1007e50d0 ; 0x1007e50d0
0x1001df81f: mov rdi, rax
0x1001df822: mov rsi, rbx
0x1001df825: call 0x1007e5db0 ; 0x1007e5db0
0x1001df82a: mov rax, qword ptr [rip + 0xa2e0a7] ; 0x100c0d8d8
0x1001df831: mov rax, qword ptr [rax]
0x1001df834: cmp rax, qword ptr [rsp + 0xae0]
0x1001df83c: jne 0x1001e044a
0x1001df842: lea rsp, [rbp - 0x28]
0x1001df846: pop rbx
0x1001df847: pop r12
0x1001df849: pop r13
0x1001df84b: pop r14
0x1001df84d: pop r15
0x1001df84f: pop rbp
0x1001df850: ret 
0x1001df851: lea r14, [rip + 0x1e5fe38] ; 0x10203f690
0x1001df858: vmovaps xmm0, xmmword ptr [r14]
0x1001df85d: vmulps xmm1, xmm0, xmmword ptr [rip + 0x8c7e0b] ; 0x100aa7670
0x1001df865: vblendps xmm0, xmm1, xmm0, 8
0x1001df86b: vmovaps xmmword ptr [rsp + 0x2e0], xmm0
0x1001df874: vucomiss xmm5, dword ptr [rip + 0x8cf9d8] ; 0x100aaf254
0x1001df87c: vmovss dword ptr [rsp], xmm2
0x1001df881: vmovss dword ptr [rsp + 0x40], xmm3
0x1001df887: vmovss dword ptr [rsp + 0x50], xmm4
0x1001df88d: vmovss dword ptr [rsp + 0x20], xmm5
0x1001df893: ja 0x1001dfea5
0x1001df899: vucomiss xmm5, dword ptr [rip + 0x8cfae7] ; 0x100aaf388
0x1001df8a1: ja 0x1001e000c
0x1001df8a7: vucomiss xmm5, dword ptr [rip + 0x8c8d45] ; 0x100aa85f4
0x1001df8af: ja 0x1001e0173
0x1001df8b5: vucomiss xmm5, dword ptr [rip + 0x8cfad3] ; 0x100aaf390
0x1001df8bd: ja 0x1001e02da
0x1001df8c3: vmovss xmm0, dword ptr [rip + 0x8cf989] ; 0x100aaf254
0x1001df8cb: vucomiss xmm0, xmm5
0x1001df8cf: jbe 0x1001dfa15
0x1001df8d5: vmovss xmm6, dword ptr [rip + 0x8c4cdb] ; 0x100aa45b8
0x1001df8dd: vmulss xmm1, xmm2, xmm6
0x1001df8e1: vmulss xmm0, xmm5, dword ptr [rip + 0x8cfaab] ; 0x100aaf394
0x1001df8e9: vmovss dword ptr [rsp + 0x10], xmm0
0x1001df8ef: vaddss xmm0, xmm0, xmm6
0x1001df8f3: vmulss xmm0, xmm4, xmm0
0x1001df8f7: vaddss xmm2, xmm0, xmm3
0x1001df8fb: vmovaps xmm0, xmm1
0x1001df8ff: vmovaps xmmword ptr [rsp + 0x30], xmm0
0x1001df905: vinsertps xmm1, xmm0, xmm2, 0x1c
0x1001df90b: vmovlps qword ptr [rsp + 0x1a0], xmm1
0x1001df914: mov dword ptr [rsp + 0x1a8], 0
0x1001df91f: xor edi, edi
0x1001df921: call 0x10076d810 ; 0x10076d810
0x1001df926: vinsertps xmm0, xmm0, dword ptr [rip + 0x8cbcd4], 0x1c ; 0x100aab604
0x1001df930: vmovlps qword ptr [rsp + 0x190], xmm0
0x1001df939: mov dword ptr [rsp + 0x198], 0
0x1001df944: lea rbx, [rip + 0x999946] ; 0x100b79291 UIFadeLine
0x1001df94b: lea rdx, [rsp + 0x1a0]
0x1001df953: lea rcx, [rsp + 0x190]
0x1001df95b: vmovss xmm0, dword ptr [rip + 0x8c8cd1] ; 0x100aa8634
0x1001df963: lea r15, [rsp + 0x2e0]
0x1001df96b: mov rdi, r12
0x1001df96e: mov rsi, rbx
0x1001df971: mov r8, r15
0x1001df974: call 0x1003a79d0 ; 0x1003a79d0
0x1001df979: vmovss xmm0, dword ptr [rip + 0x8c4c37] ; 0x100aa45b8
0x1001df981: vsubss xmm0, xmm0, dword ptr [rsp + 0x10]
0x1001df987: vmulss xmm0, xmm0, dword ptr [rsp + 0x50]
0x1001df98d: vaddss xmm1, xmm0, dword ptr [rsp + 0x40]
0x1001df993: vmovaps xmm0, xmmword ptr [rsp + 0x30]
0x1001df999: vinsertps xmm1, xmm0, xmm1, 0x1c
0x1001df99f: vmovlps qword ptr [rsp + 0x180], xmm1
0x1001df9a8: mov dword ptr [rsp + 0x188], 0
0x1001df9b3: xor edi, edi
0x1001df9b5: call 0x10076d810 ; 0x10076d810
0x1001df9ba: vinsertps xmm0, xmm0, dword ptr [rip + 0x8cbc40], 0x1c ; 0x100aab604
0x1001df9c4: vmovlps qword ptr [rsp + 0x170], xmm0
0x1001df9cd: mov dword ptr [rsp + 0x178], 0
0x1001df9d8: lea rdx, [rsp + 0x180]
0x1001df9e0: lea rcx, [rsp + 0x170]
0x1001df9e8: mov rdi, r12
0x1001df9eb: mov rsi, rbx
0x1001df9ee: vmovss xmm0, dword ptr [rip + 0x8c8c3e] ; 0x100aa8634
0x1001df9f6: mov r8, r15
0x1001df9f9: call 0x1003a79d0 ; 0x1003a79d0
0x1001df9fe: vmovss xmm5, dword ptr [rsp + 0x20]
0x1001dfa04: vmovss xmm4, dword ptr [rsp + 0x50]
0x1001dfa0a: vmovss xmm3, dword ptr [rsp + 0x40]
0x1001dfa10: vmovss xmm2, dword ptr [rsp]
0x1001dfa15: vmovaps xmm0, xmmword ptr [r14]
0x1001dfa1a: vmovaps xmmword ptr [rsp + 0x2e0], xmm0
0x1001dfa23: vmovss xmm0, dword ptr [rip + 0x8cf96d] ; 0x100aaf398
0x1001dfa2b: vucomiss xmm0, xmm5
0x1001dfa2f: jbe 0x1001df3cf
0x1001dfa35: vmovss xmm6, dword ptr [rip + 0x8c4b7b] ; 0x100aa45b8
0x1001dfa3d: vmulss xmm1, xmm2, xmm6
0x1001dfa41: vmulss xmm0, xmm5, dword ptr [rip + 0x8cf953] ; 0x100aaf39c
0x1001dfa49: vmovss dword ptr [rsp + 0x20], xmm0
0x1001dfa4f: vaddss xmm0, xmm0, xmm6
0x1001dfa53: vmulss xmm0, xmm4, xmm0
0x1001dfa57: vaddss xmm2, xmm0, xmm3
0x1001dfa5b: vmovaps xmm0, xmm1
0x1001dfa5f: vmovaps xmmword ptr [rsp + 0x10], xmm0
0x1001dfa65: vinsertps xmm1, xmm0, xmm2, 0x1c
0x1001dfa6b: vmovlps qword ptr [rsp + 0x160], xmm1
0x1001dfa74: mov dword ptr [rsp + 0x168], 0
0x1001dfa7f: xor edi, edi
0x1001dfa81: call 0x10076d810 ; 0x10076d810
0x1001dfa86: vinsertps xmm0, xmm0, dword ptr [rip + 0x8cbb74], 0x1c ; 0x100aab604
0x1001dfa90: vmovlps qword ptr [rsp + 0x150], xmm0
0x1001dfa99: mov dword ptr [rsp + 0x158], 0
0x1001dfaa4: lea rbx, [rip + 0x9997e6] ; 0x100b79291 UIFadeLine
0x1001dfaab: lea rdx, [rsp + 0x160]
0x1001dfab3: lea rcx, [rsp + 0x150]
0x1001dfabb: vmovss xmm0, dword ptr [rip + 0x8c8b6d] ; 0x100aa8630
0x1001dfac3: lea r14, [rsp + 0x2e0]
0x1001dfacb: mov rdi, r12
0x1001dface: mov rsi, rbx
0x1001dfad1: mov r8, r14
0x1001dfad4: call 0x1003a79d0 ; 0x1003a79d0
0x1001dfad9: vmovss xmm0, dword ptr [rip + 0x8c4ad7] ; 0x100aa45b8
0x1001dfae1: vsubss xmm0, xmm0, dword ptr [rsp + 0x20]
0x1001dfae7: vmulss xmm0, xmm0, dword ptr [rsp + 0x50]
0x1001dfaed: vaddss xmm1, xmm0, dword ptr [rsp + 0x40]
0x1001dfaf3: vmovaps xmm0, xmmword ptr [rsp + 0x10]
0x1001dfaf9: vinsertps xmm1, xmm0, xmm1, 0x1c
0x1001dfaff: vmovlps qword ptr [rsp + 0x140], xmm1
0x1001dfb08: mov dword ptr [rsp + 0x148], 0
0x1001dfb13: xor edi, edi
0x1001dfb15: call 0x10076d810 ; 0x10076d810
0x1001dfb1a: vinsertps xmm0, xmm0, dword ptr [rip + 0x8cbae0], 0x1c ; 0x100aab604
0x1001dfb24: vmovlps qword ptr [rsp + 0x130], xmm0
0x1001dfb2d: mov dword ptr [rsp + 0x138], 0
0x1001dfb38: lea rdx, [rsp + 0x140]
0x1001dfb40: lea rcx, [rsp + 0x130]
0x1001dfb48: mov rdi, r12
0x1001dfb4b: mov rsi, rbx
0x1001dfb4e: vmovss xmm0, dword ptr [rip + 0x8c8ada] ; 0x100aa8630
0x1001dfb56: mov r8, r14
0x1001dfb59: call 0x1003a79d0 ; 0x1003a79d0
0x1001dfb5e: vmovss xmm4, dword ptr [rsp + 0x50]
0x1001dfb64: vmovss xmm3, dword ptr [rsp + 0x40]
0x1001dfb6a: vmovss xmm2, dword ptr [rsp]
0x1001dfb6f: cmp byte ptr [rip + 0x1bfe922], 0 ; 0x101dde498
0x1001dfb76: je 0x1001df3dc
0x1001dfb7c: lea rax, [rip + 0x1e5fabd] ; 0x10203f640
0x1001dfb83: vmovaps xmm0, xmmword ptr [rax]
0x1001dfb87: vmovaps xmmword ptr [rsp + 0x2e0], xmm0
0x1001dfb90: vmovss xmm0, dword ptr [rip + 0x8c4a20] ; 0x100aa45b8
0x1001dfb98: vmulss xmm1, xmm2, xmm0
0x1001dfb9c: vmovaps xmmword ptr [rsp + 0x20], xmm1
0x1001dfba2: vmulss xmm0, xmm4, xmm0
0x1001dfba6: vmovss dword ptr [rsp + 0x30], xmm0
0x1001dfbac: vaddss xmm0, xmm0, xmm3
0x1001dfbb0: vmovaps xmmword ptr [rsp + 0x10], xmm0
0x1001dfbb6: xor edi, edi
0x1001dfbb8: vmovaps xmm0, xmm1
0x1001dfbbc: vmovss dword ptr [rsp], xmm2
0x1001dfbc1: vmovss dword ptr [rsp + 0x40], xmm3
0x1001dfbc7: vmovss dword ptr [rsp + 0x50], xmm4
0x1001dfbcd: call 0x10076d810 ; 0x10076d810
0x1001dfbd2: vinsertps xmm0, xmm0, dword ptr [rip + 0x8cba28], 0x1c ; 0x100aab604
0x1001dfbdc: vmovlps qword ptr [rsp + 0x120], xmm0
0x1001dfbe5: mov dword ptr [rsp + 0x128], 0
0x1001dfbf0: lea rbx, [rip + 0x99969a] ; 0x100b79291 UIFadeLine
0x1001dfbf7: lea rdx, [rsp + 0x120]
0x1001dfbff: vmovss xmm2, dword ptr [rip + 0x8c8a2d] ; 0x100aa8634
0x1001dfc07: lea r14, [rsp + 0x2e0]
0x1001dfc0f: mov rdi, r12
0x1001dfc12: mov rsi, rbx
0x1001dfc15: vmovaps xmm0, xmmword ptr [rsp + 0x20]
0x1001dfc1b: vmovaps xmm1, xmmword ptr [rsp + 0x10]
0x1001dfc21: mov rcx, r14
0x1001dfc24: call 0x1003a7c70 ; 0x1003a7c70
0x1001dfc29: vmovapd xmm0, xmmword ptr [rsp + 0x20]
0x1001dfc2f: vblendpd xmm0, xmm0, xmmword ptr [rip + 0x8cf777], 2 ; 0x100aaf3b0
0x1001dfc39: vinsertps xmm0, xmm0, dword ptr [rsp + 0x10], 0x10
0x1001dfc41: vmovlps qword ptr [rsp + 0x110], xmm0
0x1001dfc4a: mov dword ptr [rsp + 0x118], 0x3fc90fdb
0x1001dfc55: xor edi, edi
0x1001dfc57: vmovss xmm0, dword ptr [rsp + 0x30]
0x1001dfc5d: call 0x10076d810 ; 0x10076d810
0x1001dfc62: vinsertps xmm0, xmm0, dword ptr [rip + 0x8cb998], 0x1c ; 0x100aab604
0x1001dfc6c: vmovlps qword ptr [rsp + 0x100], xmm0
0x1001dfc75: mov dword ptr [rsp + 0x108], 0
0x1001dfc80: lea rdx, [rsp + 0x110]
0x1001dfc88: lea rcx, [rsp + 0x100]
0x1001dfc90: mov rdi, r12
0x1001dfc93: mov rsi, rbx
0x1001dfc96: vmovss xmm0, dword ptr [rip + 0x8c8996] ; 0x100aa8634
0x1001dfc9e: mov r8, r14
0x1001dfca1: call 0x1003a79d0 ; 0x1003a79d0
0x1001dfca6: lea rax, [rip + 0x1e5f963] ; 0x10203f610
0x1001dfcad: vmovaps xmm0, xmmword ptr [rax]
0x1001dfcb1: vmovaps xmmword ptr [rsp + 0x2e0], xmm0
0x1001dfcba: vmovss xmm0, dword ptr [rip + 0x8c8996] ; 0x100aa8658
0x1001dfcc2: vmulss xmm0, xmm0, dword ptr [rsp + 0x50]
0x1001dfcc8: vaddss xmm0, xmm0, dword ptr [rsp + 0x40]
0x1001dfcce: vmovss dword ptr [rsp + 0x70], xmm0
0x1001dfcd4: xor edi, edi
0x1001dfcd6: vmovaps xmm0, xmmword ptr [rsp + 0x20]
0x1001dfcdc: call 0x10076d810 ; 0x10076d810
0x1001dfce1: vinsertps xmm0, xmm0, dword ptr [rip + 0x8cb919], 0x1c ; 0x100aab604
0x1001dfceb: vmovlps qword ptr [rsp + 0xf0], xmm0
0x1001dfcf4: mov dword ptr [rsp + 0xf8], 0
0x1001dfcff: lea rdx, [rsp + 0xf0]
0x1001dfd07: mov rdi, r12
0x1001dfd0a: mov rsi, rbx
0x1001dfd0d: vmovaps xmm0, xmmword ptr [rsp + 0x20]
0x1001dfd13: vmovss xmm1, dword ptr [rsp + 0x70]
0x1001dfd19: vmovss xmm2, dword ptr [rip + 0x8c8913] ; 0x100aa8634
0x1001dfd21: mov rcx, r14
0x1001dfd24: call 0x1003a7c70 ; 0x1003a7c70
0x1001dfd29: vmovss xmm0, dword ptr [rip + 0x8ca74b] ; 0x100aaa47c
0x1001dfd31: vmulss xmm0, xmm0, dword ptr [rsp + 0x50]
0x1001dfd37: vaddss xmm0, xmm0, dword ptr [rsp + 0x40]
0x1001dfd3d: vmovss dword ptr [rsp + 0x40], xmm0
0x1001dfd43: xor edi, edi
0x1001dfd45: vmovaps xmm0, xmmword ptr [rsp + 0x20]
0x1001dfd4b: call 0x10076d810 ; 0x10076d810
0x1001dfd50: vinsertps xmm0, xmm0, dword ptr [rip + 0x8cb8aa], 0x1c ; 0x100aab604
0x1001dfd5a: vmovlps qword ptr [rsp + 0xe0], xmm0
0x1001dfd63: mov dword ptr [rsp + 0xe8], 0
0x1001dfd6e: lea rdx, [rsp + 0xe0]
0x1001dfd76: mov rdi, r12
0x1001dfd79: mov rsi, rbx
0x1001dfd7c: vmovaps xmm0, xmmword ptr [rsp + 0x20]
0x1001dfd82: vmovss xmm1, dword ptr [rsp + 0x40]
0x1001dfd88: vmovss xmm2, dword ptr [rip + 0x8c88a4] ; 0x100aa8634
0x1001dfd90: mov rcx, r14
0x1001dfd93: call 0x1003a7c70 ; 0x1003a7c70
0x1001dfd98: vmovss xmm0, dword ptr [rip + 0x8c88b8] ; 0x100aa8658
0x1001dfda0: vmulss xmm0, xmm0, dword ptr [rsp]
0x1001dfda5: vblendpd xmm0, xmm0, xmmword ptr [rip + 0x8cf601], 2 ; 0x100aaf3b0
0x1001dfdaf: vinsertps xmm0, xmm0, dword ptr [rsp + 0x10], 0x10
0x1001dfdb7: vmovlps qword ptr [rsp + 0xd0], xmm0
0x1001dfdc0: mov dword ptr [rsp + 0xd8], 0x3fc90fdb
0x1001dfdcb: xor edi, edi
0x1001dfdcd: vmovss xmm0, dword ptr [rsp + 0x30]
0x1001dfdd3: call 0x10076d810 ; 0x10076d810
0x1001dfdd8: vinsertps xmm0, xmm0, dword ptr [rip + 0x8cb822], 0x1c ; 0x100aab604
0x1001dfde2: vmovlps qword ptr [rsp + 0xc0], xmm0
0x1001dfdeb: mov dword ptr [rsp + 0xc8], 0
0x1001dfdf6: lea rdx, [rsp + 0xd0]
0x1001dfdfe: lea rcx, [rsp + 0xc0]
0x1001dfe06: mov rdi, r12
0x1001dfe09: mov rsi, rbx
0x1001dfe0c: vmovss xmm0, dword ptr [rip + 0x8c8820] ; 0x100aa8634
0x1001dfe14: mov r8, r14
0x1001dfe17: call 0x1003a79d0 ; 0x1003a79d0
0x1001dfe1c: vmovss xmm0, dword ptr [rip + 0x8ca658] ; 0x100aaa47c
0x1001dfe24: vmulss xmm0, xmm0, dword ptr [rsp]
0x1001dfe29: vblendpd xmm0, xmm0, xmmword ptr [rip + 0x8cf57d], 2 ; 0x100aaf3b0
0x1001dfe33: vinsertps xmm0, xmm0, dword ptr [rsp + 0x10], 0x10
0x1001dfe3b: vmovlps qword ptr [rsp + 0xb0], xmm0
0x1001dfe44: mov dword ptr [rsp + 0xb8], 0x3fc90fdb
0x1001dfe4f: xor edi, edi
0x1001dfe51: vmovss xmm0, dword ptr [rsp + 0x30]
0x1001dfe57: call 0x10076d810 ; 0x10076d810
0x1001dfe5c: vinsertps xmm0, xmm0, dword ptr [rip + 0x8cb79e], 0x1c ; 0x100aab604
0x1001dfe66: vmovlps qword ptr [rsp + 0xa0], xmm0
0x1001dfe6f: mov dword ptr [rsp + 0xa8], 0
0x1001dfe7a: lea rdx, [rsp + 0xb0]
0x1001dfe82: lea rcx, [rsp + 0xa0]
0x1001dfe8a: mov rdi, r12
0x1001dfe8d: mov rsi, rbx
0x1001dfe90: vmovss xmm0, dword ptr [rip + 0x8c879c] ; 0x100aa8634
0x1001dfe98: mov r8, r14
0x1001dfe9b: call 0x1003a79d0 ; 0x1003a79d0
0x1001dfea0: jmp 0x1001df3dc ; 0x1001df3dc
0x1001dfea5: vmovss xmm0, dword ptr [rip + 0x8cf4d7] ; 0x100aaf384
0x1001dfead: vdivss xmm0, xmm0, xmm5
0x1001dfeb1: vmovss dword ptr [rsp + 0x10], xmm0
0x1001dfeb7: vmovss xmm1, dword ptr [rip + 0x8c46f9] ; 0x100aa45b8
0x1001dfebf: vaddss xmm0, xmm0, xmm1
0x1001dfec3: vmulss xmm2, xmm2, xmm0
0x1001dfec7: vmulss xmm1, xmm4, xmm1
0x1001dfecb: vaddss xmm3, xmm1, xmm3
0x1001dfecf: vmovaps xmmword ptr [rsp + 0x30], xmm3
0x1001dfed5: vmovaps xmm0, xmm1
0x1001dfed9: vmovss dword ptr [rsp + 0x70], xmm0
0x1001dfedf: vblendpd xmm1, xmm2, xmmword ptr [rip + 0x8cf4c7], 2 ; 0x100aaf3b0
0x1001dfee9: vinsertps xmm1, xmm1, xmm3, 0x10
0x1001dfeef: vmovlps qword ptr [rsp + 0x2a0], xmm1
0x1001dfef8: mov dword ptr [rsp + 0x2a8], 0x3fc90fdb
0x1001dff03: xor edi, edi
0x1001dff05: call 0x10076d810 ; 0x10076d810
0x1001dff0a: vinsertps xmm0, xmm0, dword ptr [rip + 0x8cb6f0], 0x1c ; 0x100aab604
0x1001dff14: vmovlps qword ptr [rsp + 0x290], xmm0
0x1001dff1d: mov dword ptr [rsp + 0x298], 0
0x1001dff28: lea rbx, [rip + 0x999362] ; 0x100b79291 UIFadeLine
0x1001dff2f: lea rdx, [rsp + 0x2a0]
0x1001dff37: lea rcx, [rsp + 0x290]
0x1001dff3f: lea r15, [rsp + 0x2e0]
0x1001dff47: mov rdi, r12
0x1001dff4a: mov rsi, rbx
0x1001dff4d: vmovss xmm0, dword ptr [rip + 0x8c4663] ; 0x100aa45b8
0x1001dff55: mov r8, r15
0x1001dff58: call 0x1003a79d0 ; 0x1003a79d0
0x1001dff5d: vmovss xmm0, dword ptr [rip + 0x8c4653] ; 0x100aa45b8
0x1001dff65: vsubss xmm0, xmm0, dword ptr [rsp + 0x10]
0x1001dff6b: vmulss xmm0, xmm0, dword ptr [rsp]
0x1001dff70: vblendpd xmm0, xmm0, xmmword ptr [rip + 0x8cf436], 2 ; 0x100aaf3b0
0x1001dff7a: vinsertps xmm0, xmm0, dword ptr [rsp + 0x30], 0x10
0x1001dff82: vmovlps qword ptr [rsp + 0x280], xmm0
0x1001dff8b: mov dword ptr [rsp + 0x288], 0x3fc90fdb
0x1001dff96: xor edi, edi
0x1001dff98: vmovss xmm0, dword ptr [rsp + 0x70]
0x1001dff9e: call 0x10076d810 ; 0x10076d810
0x1001dffa3: vinsertps xmm0, xmm0, dword ptr [rip + 0x8cb657], 0x1c ; 0x100aab604
0x1001dffad: vmovlps qword ptr [rsp + 0x270], xmm0
0x1001dffb6: mov dword ptr [rsp + 0x278], 0
0x1001dffc1: lea rdx, [rsp + 0x280]
0x1001dffc9: lea rcx, [rsp + 0x270]
0x1001dffd1: mov rdi, r12
0x1001dffd4: mov rsi, rbx
0x1001dffd7: vmovss xmm0, dword ptr [rip + 0x8c45d9] ; 0x100aa45b8
0x1001dffdf: mov r8, r15
0x1001dffe2: call 0x1003a79d0 ; 0x1003a79d0
0x1001dffe7: vmovss xmm5, dword ptr [rsp + 0x20]
0x1001dffed: vmovss xmm4, dword ptr [rsp + 0x50]
0x1001dfff3: vmovss xmm3, dword ptr [rsp + 0x40]
0x1001dfff9: vmovss xmm2, dword ptr [rsp]
0x1001dfffe: vucomiss xmm5, dword ptr [rip + 0x8cf382] ; 0x100aaf388
0x1001e0006: jbe 0x1001df8a7
0x1001e000c: vmovss xmm0, dword ptr [rip + 0x8cf378] ; 0x100aaf38c
0x1001e0014: vdivss xmm0, xmm0, xmm5
0x1001e0018: vmovss dword ptr [rsp + 0x10], xmm0
0x1001e001e: vmovss xmm1, dword ptr [rip + 0x8c4592] ; 0x100aa45b8
0x1001e0026: vaddss xmm0, xmm0, xmm1
0x1001e002a: vmulss xmm2, xmm2, xmm0
0x1001e002e: vmulss xmm1, xmm4, xmm1
0x1001e0032: vaddss xmm3, xmm1, xmm3
0x1001e0036: vmovaps xmmword ptr [rsp + 0x30], xmm3
0x1001e003c: vmovaps xmm0, xmm1
0x1001e0040: vmovss dword ptr [rsp + 0x70], xmm0
0x1001e0046: vblendpd xmm1, xmm2, xmmword ptr [rip + 0x8cf360], 2 ; 0x100aaf3b0
0x1001e0050: vinsertps xmm1, xmm1, xmm3, 0x10
0x1001e0056: vmovlps qword ptr [rsp + 0x260], xmm1
0x1001e005f: mov dword ptr [rsp + 0x268], 0x3fc90fdb
0x1001e006a: xor edi, edi
0x1001e006c: call 0x10076d810 ; 0x10076d810
0x1001e0071: vinsertps xmm0, xmm0, dword ptr [rip + 0x8cb589], 0x1c ; 0x100aab604
0x1001e007b: vmovlps qword ptr [rsp + 0x250], xmm0
0x1001e0084: mov dword ptr [rsp + 0x258], 0
0x1001e008f: lea rbx, [rip + 0x9991fb] ; 0x100b79291 UIFadeLine
0x1001e0096: lea rdx, [rsp + 0x260]
0x1001e009e: lea rcx, [rsp + 0x250]
0x1001e00a6: lea r15, [rsp + 0x2e0]
0x1001e00ae: mov rdi, r12
0x1001e00b1: mov rsi, rbx
0x1001e00b4: vmovss xmm0, dword ptr [rip + 0x8c44fc] ; 0x100aa45b8
0x1001e00bc: mov r8, r15
0x1001e00bf: call 0x1003a79d0 ; 0x1003a79d0
0x1001e00c4: vmovss xmm0, dword ptr [rip + 0x8c44ec] ; 0x100aa45b8
0x1001e00cc: vsubss xmm0, xmm0, dword ptr [rsp + 0x10]
0x1001e00d2: vmulss xmm0, xmm0, dword ptr [rsp]
0x1001e00d7: vblendpd xmm0, xmm0, xmmword ptr [rip + 0x8cf2cf], 2 ; 0x100aaf3b0
0x1001e00e1: vinsertps xmm0, xmm0, dword ptr [rsp + 0x30], 0x10
0x1001e00e9: vmovlps qword ptr [rsp + 0x240], xmm0
0x1001e00f2: mov dword ptr [rsp + 0x248], 0x3fc90fdb
0x1001e00fd: xor edi, edi
0x1001e00ff: vmovss xmm0, dword ptr [rsp + 0x70]
0x1001e0105: call 0x10076d810 ; 0x10076d810
0x1001e010a: vinsertps xmm0, xmm0, dword ptr [rip + 0x8cb4f0], 0x1c ; 0x100aab604
0x1001e0114: vmovlps qword ptr [rsp + 0x230], xmm0
0x1001e011d: mov dword ptr [rsp + 0x238], 0
0x1001e0128: lea rdx, [rsp + 0x240]
0x1001e0130: lea rcx, [rsp + 0x230]
0x1001e0138: mov rdi, r12
0x1001e013b: mov rsi, rbx
0x1001e013e: vmovss xmm0, dword ptr [rip + 0x8c4472] ; 0x100aa45b8
0x1001e0146: mov r8, r15
0x1001e0149: call 0x1003a79d0 ; 0x1003a79d0
0x1001e014e: vmovss xmm5, dword ptr [rsp + 0x20]
0x1001e0154: vmovss xmm4, dword ptr [rsp + 0x50]
0x1001e015a: vmovss xmm3, dword ptr [rsp + 0x40]
0x1001e0160: vmovss xmm2, dword ptr [rsp]
0x1001e0165: vucomiss xmm5, dword ptr [rip + 0x8c8487] ; 0x100aa85f4
0x1001e016d: jbe 0x1001df8b5
0x1001e0173: vmovss xmm0, dword ptr [rip + 0x8ce84d] ; 0x100aae9c8
0x1001e017b: vdivss xmm0, xmm0, xmm5
0x1001e017f: vmovss dword ptr [rsp + 0x10], xmm0
0x1001e0185: vmovss xmm1, dword ptr [rip + 0x8c442b] ; 0x100aa45b8
0x1001e018d: vaddss xmm0, xmm0, xmm1
0x1001e0191: vmulss xmm2, xmm2, xmm0
0x1001e0195: vmulss xmm1, xmm4, xmm1
0x1001e0199: vaddss xmm3, xmm1, xmm3
0x1001e019d: vmovaps xmmword ptr [rsp + 0x30], xmm3
0x1001e01a3: vmovaps xmm0, xmm1
0x1001e01a7: vmovss dword ptr [rsp + 0x70], xmm0
0x1001e01ad: vblendpd xmm1, xmm2, xmmword ptr [rip + 0x8cf1f9], 2 ; 0x100aaf3b0
0x1001e01b7: vinsertps xmm1, xmm1, xmm3, 0x10
0x1001e01bd: vmovlps qword ptr [rsp + 0x220], xmm1
0x1001e01c6: mov dword ptr [rsp + 0x228], 0x3fc90fdb
0x1001e01d1: xor edi, edi
0x1001e01d3: call 0x10076d810 ; 0x10076d810
0x1001e01d8: vinsertps xmm0, xmm0, dword ptr [rip + 0x8cb422], 0x1c ; 0x100aab604
0x1001e01e2: vmovlps qword ptr [rsp + 0x210], xmm0
0x1001e01eb: mov dword ptr [rsp + 0x218], 0
0x1001e01f6: lea rbx, [rip + 0x999094] ; 0x100b79291 UIFadeLine
0x1001e01fd: lea rdx, [rsp + 0x220]
0x1001e0205: lea rcx, [rsp + 0x210]
0x1001e020d: vmovss xmm0, dword ptr [rip + 0x8c841f] ; 0x100aa8634
0x1001e0215: lea r15, [rsp + 0x2e0]
0x1001e021d: mov rdi, r12
0x1001e0220: mov rsi, rbx
0x1001e0223: mov r8, r15
0x1001e0226: call 0x1003a79d0 ; 0x1003a79d0
0x1001e022b: vmovss xmm0, dword ptr [rip + 0x8c4385] ; 0x100aa45b8
0x1001e0233: vsubss xmm0, xmm0, dword ptr [rsp + 0x10]
0x1001e0239: vmulss xmm0, xmm0, dword ptr [rsp]
0x1001e023e: vblendpd xmm0, xmm0, xmmword ptr [rip + 0x8cf168], 2 ; 0x100aaf3b0
0x1001e0248: vinsertps xmm0, xmm0, dword ptr [rsp + 0x30], 0x10
0x1001e0250: vmovlps qword ptr [rsp + 0x200], xmm0
0x1001e0259: mov dword ptr [rsp + 0x208], 0x3fc90fdb
0x1001e0264: xor edi, edi
0x1001e0266: vmovss xmm0, dword ptr [rsp + 0x70]
0x1001e026c: call 0x10076d810 ; 0x10076d810
0x1001e0271: vinsertps xmm0, xmm0, dword ptr [rip + 0x8cb389], 0x1c ; 0x100aab604
0x1001e027b: vmovlps qword ptr [rsp + 0x1f0], xmm0
0x1001e0284: mov dword ptr [rsp + 0x1f8], 0
0x1001e028f: lea rdx, [rsp + 0x200]
0x1001e0297: lea rcx, [rsp + 0x1f0]
0x1001e029f: mov rdi, r12
0x1001e02a2: mov rsi, rbx
0x1001e02a5: vmovss xmm0, dword ptr [rip + 0x8c8387] ; 0x100aa8634
0x1001e02ad: mov r8, r15
0x1001e02b0: call 0x1003a79d0 ; 0x1003a79d0
0x1001e02b5: vmovss xmm5, dword ptr [rsp + 0x20]
0x1001e02bb: vmovss xmm4, dword ptr [rsp + 0x50]
0x1001e02c1: vmovss xmm3, dword ptr [rsp + 0x40]
0x1001e02c7: vmovss xmm2, dword ptr [rsp]
0x1001e02cc: vucomiss xmm5, dword ptr [rip + 0x8cf0bc] ; 0x100aaf390
0x1001e02d4: jbe 0x1001df8c3
0x1001e02da: vmovss xmm0, dword ptr [rip + 0x8cf0b2] ; 0x100aaf394
0x1001e02e2: vdivss xmm0, xmm0, xmm5
0x1001e02e6: vmovss dword ptr [rsp + 0x10], xmm0
0x1001e02ec: vmovss xmm1, dword ptr [rip + 0x8c42c4] ; 0x100aa45b8
0x1001e02f4: vaddss xmm0, xmm0, xmm1
0x1001e02f8: vmulss xmm2, xmm2, xmm0
0x1001e02fc: vmulss xmm1, xmm4, xmm1
0x1001e0300: vaddss xmm3, xmm1, xmm3
0x1001e0304: vmovaps xmmword ptr [rsp + 0x30], xmm3
0x1001e030a: vmovaps xmm0, xmm1
0x1001e030e: vmovss dword ptr [rsp + 0x70], xmm0
0x1001e0314: vblendpd xmm1, xmm2, xmmword ptr [rip + 0x8cf092], 2 ; 0x100aaf3b0
0x1001e031e: vinsertps xmm1, xmm1, xmm3, 0x10
0x1001e0324: vmovlps qword ptr [rsp + 0x1e0], xmm1
0x1001e032d: mov dword ptr [rsp + 0x1e8], 0x3fc90fdb
0x1001e0338: xor edi, edi
0x1001e033a: call 0x10076d810 ; 0x10076d810
0x1001e033f: vinsertps xmm0, xmm0, dword ptr [rip + 0x8cb2bb], 0x1c ; 0x100aab604
0x1001e0349: vmovlps qword ptr [rsp + 0x1d0], xmm0
0x1001e0352: mov dword ptr [rsp + 0x1d8], 0
0x1001e035d: lea rbx, [rip + 0x998f2d] ; 0x100b79291 UIFadeLine
0x1001e0364: lea rdx, [rsp + 0x1e0]
0x1001e036c: lea rcx, [rsp + 0x1d0]
0x1001e0374: vmovss xmm0, dword ptr [rip + 0x8c82b8] ; 0x100aa8634
0x1001e037c: lea r15, [rsp + 0x2e0]
0x1001e0384: mov rdi, r12
0x1001e0387: mov rsi, rbx
0x1001e038a: mov r8, r15
0x1001e038d: call 0x1003a79d0 ; 0x1003a79d0
0x1001e0392: vmovss xmm0, dword ptr [rip + 0x8c421e] ; 0x100aa45b8
0x1001e039a: vsubss xmm0, xmm0, dword ptr [rsp + 0x10]
0x1001e03a0: vmulss xmm0, xmm0, dword ptr [rsp]
0x1001e03a5: vblendpd xmm0, xmm0, xmmword ptr [rip + 0x8cf001], 2 ; 0x100aaf3b0
0x1001e03af: vinsertps xmm0, xmm0, dword ptr [rsp + 0x30], 0x10
0x1001e03b7: vmovlps qword ptr [rsp + 0x1c0], xmm0
0x1001e03c0: mov dword ptr [rsp + 0x1c8], 0x3fc90fdb
0x1001e03cb: xor edi, edi
0x1001e03cd: vmovss xmm0, dword ptr [rsp + 0x70]
0x1001e03d3: call 0x10076d810 ; 0x10076d810
0x1001e03d8: vinsertps xmm0, xmm0, dword ptr [rip + 0x8cb222], 0x1c ; 0x100aab604
0x1001e03e2: vmovlps qword ptr [rsp + 0x1b0], xmm0
0x1001e03eb: mov dword ptr [rsp + 0x1b8], 0
0x1001e03f6: lea rdx, [rsp + 0x1c0]
0x1001e03fe: lea rcx, [rsp + 0x1b0]
0x1001e0406: mov rdi, r12
0x1001e0409: mov rsi, rbx
0x1001e040c: vmovss xmm0, dword ptr [rip + 0x8c8220] ; 0x100aa8634
0x1001e0414: mov r8, r15
0x1001e0417: call 0x1003a79d0 ; 0x1003a79d0
0x1001e041c: vmovss xmm5, dword ptr [rsp + 0x20]
0x1001e0422: vmovss xmm4, dword ptr [rsp + 0x50]
0x1001e0428: vmovss xmm3, dword ptr [rsp + 0x40]
0x1001e042e: vmovss xmm2, dword ptr [rsp]
0x1001e0433: vmovss xmm0, dword ptr [rip + 0x8cee19] ; 0x100aaf254
0x1001e043b: vucomiss xmm0, xmm5
0x1001e043f: ja 0x1001df8d5
0x1001e0445: jmp 0x1001dfa15 ; 0x1001dfa15
0x1001e044a: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1001e044f: lea rdi, [rip + 0x998e0b] ; 0x100b79261 camera != m_cameraHeads[ i ]
0x1001e0456: lea rsi, [rip + 0x998bfa] ; 0x100b79057 CameraSystem.cpp
0x1001e045d: mov edx, 0x218
0x1001e0462: mov ecx, 3
0x1001e0467: call 0x1007e5f70 ; 0x1007e5f70
0x1001e046c: ud2 
0x1001e046e: lea rdi, [rip + 0x998e09] ; 0x100b7927e camera->IsActive()
0x1001e0475: lea rsi, [rip + 0x998bdb] ; 0x100b79057 CameraSystem.cpp
0x1001e047c: mov edx, 0x227
0x1001e0481: mov ecx, 3
0x1001e0486: call 0x1007e5f70 ; 0x1007e5f70
0x1001e048b: ud2 
0x1001e048d: mov rdi, rax
0x1001e0490: call 0x100011bf0 ; 0x100011bf0
0x1001e0495: mov rbx, rax
0x1001e0498: test byte ptr [rsp + 0x2e0], 1
0x1001e04a0: je 0x1001e04ba
0x1001e04a2: mov r14, qword ptr [rsp + 0x2f0]
0x1001e04aa: call 0x1007e50d0 ; 0x1007e50d0
0x1001e04af: mov rdi, rax
0x1001e04b2: mov rsi, r14
0x1001e04b5: call 0x1007e5db0 ; 0x1007e5db0
0x1001e04ba: mov rdi, rbx
0x1001e04bd: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1001e04c2: mov rdi, rax
0x1001e04c5: call 0x100011bf0 ; 0x100011bf0
0x1001e04ca: nop word ptr [rax + rax]
