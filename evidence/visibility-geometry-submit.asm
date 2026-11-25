0x100720250: push rbp
0x100720251: mov rbp, rsp
0x100720254: push r15
0x100720256: push r14
0x100720258: push r13
0x10072025a: push r12
0x10072025c: push rbx
0x10072025d: sub rsp, 0xd8
0x100720264: mov qword ptr [rbp - 0x58], r9
0x100720268: mov ebx, r8d
0x10072026b: mov r15, rcx
0x10072026e: mov ecx, edx
0x100720270: mov qword ptr [rbp - 0x50], rdi
0x100720274: mov rdx, qword ptr [rbp + 0x18]
0x100720278: mov dword ptr [rbp - 0x44], esi
0x10072027b: mov eax, esi
0x10072027d: vcvtsi2ss xmm0, xmm0, rax
0x100720282: mov dword ptr [rbp - 0x2c], ecx
0x100720285: mov eax, ecx
0x100720287: vcvtsi2ss xmm1, xmm1, rax
0x10072028c: vmovss xmm2, dword ptr [rip + 0x384324] ; 0x100aa45b8
0x100720294: vmulss xmm0, xmm0, xmm2
0x100720298: vxorps xmm3, xmm3, xmm3
0x10072029c: vblendps xmm3, xmm3, xmm0, 1
0x1007202a2: vmulss xmm1, xmm1, xmm2
0x1007202a6: vinsertps xmm2, xmm0, xmm1, 0x1d
0x1007202ac: vmovss xmm4, dword ptr [rip + 0x38836c] ; 0x100aa8620
0x1007202b4: vaddss xmm0, xmm0, xmm4
0x1007202b8: vaddss xmm1, xmm1, xmm4
0x1007202bc: vunpcklps xmm0, xmm0, xmm1
0x1007202c0: vmovss xmm1, dword ptr [rip + 0x384df8] ; 0x100aa50c0
0x1007202c8: vshufps xmm0, xmm0, xmm1, 0x14
0x1007202cd: vmovaps xmmword ptr [rbp - 0xa0], xmm3
0x1007202d5: vmovaps xmmword ptr [rbp - 0x90], xmm2
0x1007202dd: vmovaps xmm1, xmmword ptr [rip + 0x38874b] ; 0x100aa8a30
0x1007202e5: vmovaps xmmword ptr [rbp - 0x80], xmm1
0x1007202ea: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x1007202ef: lea r14, [rbp - 0xe0]
0x1007202f6: lea rsi, [rbp - 0xa0]
0x1007202fd: mov rdi, r14
0x100720300: call 0x100076df0 ; 0x100076df0
0x100720305: call 0x1007c6c20 ; 0x1007c6c20
0x10072030a: mov esi, ebx
0x10072030c: shl rsi, 4
0x100720310: lea rcx, [rip + 0x1928839] ; 0x102048b50
0x100720317: mov r12, rcx
0x10072031a: mov rdx, qword ptr [rcx]
0x10072031d: mov ecx, 0x10
0x100720322: mov rdi, rax
0x100720325: call 0x100795530 ; 0x100795530
0x10072032a: mov r13, rax
0x10072032d: mov qword ptr [rbp - 0x60], r15
0x100720331: mov rdi, r15
0x100720334: mov esi, ebx
0x100720336: mov rdx, r14
0x100720339: mov rcx, r13
0x10072033c: call 0x10071e7f0 ; 0x10071e7f0
0x100720341: call 0x1007c6c20 ; 0x1007c6c20
0x100720346: mov r15, r12
0x100720349: mov r14d, dword ptr [rbp + 0x10]
0x10072034d: mov ecx, r14d
0x100720350: mov ebx, 0xaaaaaaab
0x100720355: imul rbx, rcx
0x100720359: shr rbx, 0x25
0x10072035d: lea esi, [rbx*4]
0x100720364: mov rdx, qword ptr [r15]
0x100720367: mov ecx, 4
0x10072036c: mov rdi, rax
0x10072036f: call 0x100795530 ; 0x100795530
0x100720374: mov dword ptr [rbp - 0x34], 0
0x10072037b: mov dword ptr [rsp + 0x10], ebx
0x10072037f: lea rcx, [rbp - 0x34]
0x100720383: mov qword ptr [rsp + 8], rcx
0x100720388: mov qword ptr [rbp - 0x40], rax
0x10072038c: mov qword ptr [rsp], rax
0x100720390: mov rdi, qword ptr [rbp - 0x50]
0x100720394: mov ebx, dword ptr [rbp - 0x44]
0x100720397: mov esi, ebx
0x100720399: mov edx, dword ptr [rbp - 0x2c]
0x10072039c: mov r12, r13
0x10072039f: mov rcx, r13
0x1007203a2: mov r8, qword ptr [rbp - 0x58]
0x1007203a6: mov r9d, r14d
0x1007203a9: call 0x10071ee60 ; 0x10071ee60
0x1007203ae: mov r13d, dword ptr [rbp - 0x34]
0x1007203b2: call 0x1007c6c20 ; 0x1007c6c20
0x1007203b7: lea esi, [r13*4 + 1]
0x1007203bf: shl rsi, 4
0x1007203c3: mov rdx, qword ptr [r15]
0x1007203c6: mov ecx, 0x10
0x1007203cb: mov rdi, rax
0x1007203ce: call 0x100795530 ; 0x100795530
0x1007203d3: mov r14, rax
0x1007203d6: call 0x1007c6c20 ; 0x1007c6c20
0x1007203db: lea ecx, [r13 + r13*2]
0x1007203e0: lea esi, [rcx + rcx + 0xb]
0x1007203e4: add rsi, rsi
0x1007203e7: mov rdx, qword ptr [r15]
0x1007203ea: mov ecx, 2
0x1007203ef: mov rdi, rax
0x1007203f2: call 0x100795530 ; 0x100795530
0x1007203f7: mov r15, rax
0x1007203fa: mov dword ptr [rbp - 0x48], 0
0x100720401: mov dword ptr [rbp - 0x30], 0
0x100720408: lea rax, [rbp - 0x30]
0x10072040c: mov qword ptr [rsp + 0x10], rax
0x100720411: mov qword ptr [rsp + 8], r15
0x100720416: lea rax, [rbp - 0x48]
0x10072041a: mov qword ptr [rsp], rax
0x10072041e: lea r8, [rbp - 0xe0]
0x100720425: mov rdi, qword ptr [rbp - 0x60]
0x100720429: mov rsi, qword ptr [rbp - 0x58]
0x10072042d: mov rdx, qword ptr [rbp - 0x40]
0x100720431: mov ecx, r13d
0x100720434: mov r9, r14
0x100720437: call 0x10071f790 ; 0x10071f790
0x10072043c: mov r9d, dword ptr [rbp - 0x30]
0x100720440: vxorps xmm0, xmm0, xmm0
0x100720444: vmovups xmmword ptr [rsp], xmm0
0x100720449: mov dword ptr [rsp + 0x10], 0
0x100720451: mov rdi, qword ptr [rbp - 0x50]
0x100720455: mov esi, ebx
0x100720457: mov edx, dword ptr [rbp - 0x2c]
0x10072045a: mov rcx, r14
0x10072045d: mov r8, r15
0x100720460: call 0x10071ee60 ; 0x10071ee60
0x100720465: call 0x1007c6c20 ; 0x1007c6c20
0x10072046a: mov rdi, rax
0x10072046d: mov rsi, r15
0x100720470: call 0x100795a70 ; 0x100795a70
0x100720475: call 0x1007c6c20 ; 0x1007c6c20
0x10072047a: mov rdi, rax
0x10072047d: mov rsi, r14
0x100720480: call 0x100795a70 ; 0x100795a70
0x100720485: call 0x1007c6c20 ; 0x1007c6c20
0x10072048a: mov rdi, rax
0x10072048d: mov rsi, qword ptr [rbp - 0x40]
0x100720491: call 0x100795a70 ; 0x100795a70
0x100720496: call 0x1007c6c20 ; 0x1007c6c20
0x10072049b: mov rdi, rax
0x10072049e: mov rsi, r12
0x1007204a1: call 0x100795a70 ; 0x100795a70
0x1007204a6: add rsp, 0xd8
0x1007204ad: pop rbx
0x1007204ae: pop r12
0x1007204b0: pop r13
0x1007204b2: pop r14
0x1007204b4: pop r15
0x1007204b6: pop rbp
0x1007204b7: ret 
0x1007204b8: jmp 0x100720516 ; 0x100720516
0x1007204ba: jmp 0x100720534 ; 0x100720534
0x1007204bc: mov rdi, rax
0x1007204bf: call 0x100011bf0 ; 0x100011bf0
0x1007204c4: mov rdi, rax
0x1007204c7: call 0x100011bf0 ; 0x100011bf0
0x1007204cc: mov rdi, rax
0x1007204cf: call 0x100011bf0 ; 0x100011bf0
0x1007204d4: mov rdi, rax
0x1007204d7: call 0x100011bf0 ; 0x100011bf0
0x1007204dc: mov rbx, rax
0x1007204df: call 0x1007c6c20 ; 0x1007c6c20
0x1007204e4: mov rdi, rax
0x1007204e7: mov rsi, r15
0x1007204ea: call 0x100795a70 ; 0x100795a70
0x1007204ef: jmp 0x1007204fc ; 0x1007204fc
0x1007204f1: mov rdi, rax
0x1007204f4: call 0x100011bf0 ; 0x100011bf0
0x1007204f9: mov rbx, rax
0x1007204fc: call 0x1007c6c20 ; 0x1007c6c20
0x100720501: mov rdi, rax
0x100720504: mov rsi, r14
0x100720507: call 0x100795a70 ; 0x100795a70
0x10072050c: jmp 0x100720519 ; 0x100720519
0x10072050e: mov rdi, rax
0x100720511: call 0x100011bf0 ; 0x100011bf0
0x100720516: mov rbx, rax
0x100720519: call 0x1007c6c20 ; 0x1007c6c20
0x10072051e: mov rdi, rax
0x100720521: mov rsi, qword ptr [rbp - 0x40]
0x100720525: call 0x100795a70 ; 0x100795a70
0x10072052a: jmp 0x10072053a ; 0x10072053a
0x10072052c: mov rdi, rax
0x10072052f: call 0x100011bf0 ; 0x100011bf0
0x100720534: mov r12, r13
0x100720537: mov rbx, rax
0x10072053a: call 0x1007c6c20 ; 0x1007c6c20
0x10072053f: mov rdi, rax
0x100720542: mov rsi, r12
0x100720545: call 0x100795a70 ; 0x100795a70
0x10072054a: mov rdi, rbx
0x10072054d: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100720552: mov rdi, rax
0x100720555: call 0x100011bf0 ; 0x100011bf0
0x10072055a: nop word ptr [rax + rax]
