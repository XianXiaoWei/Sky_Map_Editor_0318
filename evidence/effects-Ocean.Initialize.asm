0x1004d4270: push rbp
0x1004d4271: mov rbp, rsp
0x1004d4274: push r15
0x1004d4276: push r14
0x1004d4278: push r13
0x1004d427a: push r12
0x1004d427c: push rbx
0x1004d427d: sub rsp, 0x1a7a8
0x1004d4284: mov r14, rsi
0x1004d4287: mov r15, rdi
0x1004d428a: mov rax, qword ptr [rip + 0x739647] ; 0x100c0d8d8
0x1004d4291: mov rax, qword ptr [rax]
0x1004d4294: mov qword ptr [rbp - 0x30], rax
0x1004d4298: mov qword ptr [r15 + 0x13c0], 0
0x1004d42a3: lea r12, [r15 + 0x13b0]
0x1004d42aa: vxorps xmm0, xmm0, xmm0
0x1004d42ae: vmovaps xmmword ptr [r15 + 0x13b0], xmm0
0x1004d42b7: xor eax, eax
0x1004d42b9: lea r8, [rbp - 0x1a740]
0x1004d42c0: xor edx, edx
0x1004d42c2: nop word ptr cs:[rax + rax]
0x1004d42d0: mov esi, 0xffffffa2
0x1004d42d5: mov rdi, r8
0x1004d42d8: jmp 0x1004d4315 ; 0x1004d4315
0x1004d42da: nop word ptr [rax + rax]
0x1004d42e0: lea ecx, [rax + rsi + 0x5f]
0x1004d42e4: mov word ptr [rdi + 0xc], cx
0x1004d42e8: lea ecx, [rax + rsi + 0x60]
0x1004d42ec: mov word ptr [rdi + 0xe], cx
0x1004d42f0: lea ebx, [rax + rsi + 0xbf]
0x1004d42f7: mov word ptr [rdi + 0x10], bx
0x1004d42fb: mov word ptr [rdi + 0x12], cx
0x1004d42ff: lea ecx, [rax + rsi + 0xc0]
0x1004d4306: mov word ptr [rdi + 0x14], cx
0x1004d430a: mov word ptr [rdi + 0x16], bx
0x1004d430e: add esi, 2
0x1004d4311: add rdi, 0x18
0x1004d4315: lea ebx, [rax + rsi + 0x5e]
0x1004d4319: mov word ptr [rdi], bx
0x1004d431c: lea ebx, [rax + rsi + 0x5f]
0x1004d4320: mov word ptr [rdi + 2], bx
0x1004d4324: lea ecx, [rax + rsi + 0xbe]
0x1004d432b: mov word ptr [rdi + 4], cx
0x1004d432f: mov word ptr [rdi + 6], bx
0x1004d4333: lea ebx, [rax + rsi + 0xbf]
0x1004d433a: mov word ptr [rdi + 8], bx
0x1004d433e: mov word ptr [rdi + 0xa], cx
0x1004d4342: test esi, esi
0x1004d4344: jne 0x1004d42e0
0x1004d4346: add r8, 0x474
0x1004d434d: inc edx
0x1004d434f: add eax, 0x60
0x1004d4352: cmp edx, 0x5f
0x1004d4355: jne 0x1004d42d0
0x1004d435b: lea rbx, [r15 + 0x88]
0x1004d4362: lea rsi, [rip + 0x6a28d6] ; 0x100b76c3f Ocean
0x1004d4369: mov edx, 0x2400
0x1004d436e: mov rdi, rbx
0x1004d4371: call 0x1007f53c0 ; 0x1007f53c0
0x1004d4376: lea rcx, [rbp - 0x1a778]
0x1004d437d: vmovaps xmm0, xmmword ptr [rip + 0x5dd25b] ; 0x100ab15e0
0x1004d4385: vmovaps xmmword ptr [rbp - 0x1a780], xmm0
0x1004d438d: mov qword ptr [rsp + 8], 0
0x1004d4396: mov dword ptr [rsp], 0
0x1004d439d: lea rdx, [rbp - 0x1a780]
0x1004d43a4: mov esi, 0
0x1004d43a9: mov r8d, 2
0x1004d43af: mov r9d, 2
0x1004d43b5: mov rdi, rbx
0x1004d43b8: call 0x1007f5430 ; 0x1007f5430
0x1004d43bd: lea r9, [rbp - 0x1a740]
0x1004d43c4: mov esi, 0
0x1004d43c9: mov edx, 0x11
0x1004d43ce: mov ecx, 1
0x1004d43d3: mov r8d, 0xd386
0x1004d43d9: mov rdi, rbx
0x1004d43dc: call 0x1007f55d0 ; 0x1007f55d0
0x1004d43e1: mov rdi, rbx
0x1004d43e4: call 0x1007f5690 ; 0x1007f5690
0x1004d43e9: lea rdi, [rbp - 0x1a780]
0x1004d43f0: call 0x1007c2530 ; 0x1007c2530
0x1004d43f5: call 0x1004559d0 ; 0x1004559d0
0x1004d43fa: lea rdx, [rip + 0x6b9d72] ; 0x100b8e173 Plane10x10
0x1004d4401: mov rdi, r14
0x1004d4404: mov rsi, rax
0x1004d4407: call 0x1007c4360 ; 0x1007c4360
0x1004d440c: test rax, rax
0x1004d440f: je 0x1004d4422
0x1004d4411: lea rsi, [rbp - 0x1a780]
0x1004d4418: mov rdi, rax
0x1004d441b: call 0x1007c2310 ; 0x1007c2310
0x1004d4420: jmp 0x1004d443a ; 0x1004d443a
0x1004d4422: call 0x1004559d0 ; 0x1004559d0
0x1004d4427: mov rsi, qword ptr [rax + 8]
0x1004d442b: lea rdx, [rip + 0x6b9d41] ; 0x100b8e173 Plane10x10
0x1004d4432: mov rdi, r14
0x1004d4435: call 0x1007c4640 ; 0x1007c4640
0x1004d443a: mov qword ptr [rbp - 0x1a788], r12
0x1004d4441: mov rax, qword ptr [rbp - 0x1a780]
0x1004d4448: test rax, rax
0x1004d444b: je 0x1004d47f8
0x1004d4451: mov rax, qword ptr [rax + 0x10]
0x1004d4455: test rax, rax
0x1004d4458: je 0x1004d47f8
0x1004d445e: mov r13, qword ptr [rax + 0xf0]
0x1004d4465: mov ebx, dword ptr [r13 + 0x34]
0x1004d4469: call 0x1007c6c20 ; 0x1007c6c20
0x1004d446e: add ebx, 0x2710
0x1004d4474: shl rbx, 4
0x1004d4478: lea r12, [rip + 0x1b746d1] ; 0x102048b50
0x1004d447f: mov rdx, qword ptr [r12]
0x1004d4483: mov ecx, 4
0x1004d4488: mov rdi, rax
0x1004d448b: mov rsi, rbx
0x1004d448e: call 0x100795530 ; 0x100795530
0x1004d4493: mov rbx, rax
0x1004d4496: cmp dword ptr [r13 + 0x34], 0
0x1004d449b: je 0x1004d44d0
0x1004d449d: xor eax, eax
0x1004d449f: nop 
0x1004d44a0: mov ecx, eax
0x1004d44a2: mov rdx, rcx
0x1004d44a5: shl rdx, 4
0x1004d44a9: mov rsi, qword ptr [r13 + 0x60]
0x1004d44ad: mov edi, dword ptr [rsi + rdx + 8]
0x1004d44b1: mov dword ptr [rbx + rdx + 8], edi
0x1004d44b5: mov rsi, qword ptr [rsi + rdx]
0x1004d44b9: mov qword ptr [rbx + rdx], rsi
0x1004d44bd: mov rsi, qword ptr [r13 + 0x68]
0x1004d44c1: mov ecx, dword ptr [rsi + rcx*4]
0x1004d44c4: mov dword ptr [rbx + rdx + 0xc], ecx
0x1004d44c8: inc eax
0x1004d44ca: cmp eax, dword ptr [r13 + 0x34]
0x1004d44ce: jb 0x1004d44a0
0x1004d44d0: mov r14d, dword ptr [r13 + 0x38]
0x1004d44d4: call 0x1007c6c20 ; 0x1007c6c20
0x1004d44d9: shl r14, 3
0x1004d44dd: mov rdx, qword ptr [r12]
0x1004d44e1: mov ecx, 4
0x1004d44e6: mov rdi, rax
0x1004d44e9: mov rsi, r14
0x1004d44ec: call 0x100795530 ; 0x100795530
0x1004d44f1: mov qword ptr [rbp - 0x1a758], rax
0x1004d44f8: mov r14d, dword ptr [r13 + 0x38]
0x1004d44fc: call 0x1007c6c20 ; 0x1007c6c20
0x1004d4501: shl r14, 2
0x1004d4505: mov rdx, qword ptr [r12]
0x1004d4509: mov ecx, 4
0x1004d450e: mov rdi, rax
0x1004d4511: mov rsi, r14
0x1004d4514: call 0x100795530 ; 0x100795530
0x1004d4519: mov qword ptr [rbp - 0x1a750], rax
0x1004d4520: call 0x1007c6c20 ; 0x1007c6c20
0x1004d4525: mov rdx, qword ptr [r12]
0x1004d4529: mov esi, 0x4e200
0x1004d452e: mov ecx, 4
0x1004d4533: mov rdi, rax
0x1004d4536: call 0x100795530 ; 0x100795530
0x1004d453b: mov r14, rax
0x1004d453e: mov dword ptr [rbp - 0x1a744], 0x13880
0x1004d4548: mov dword ptr [rbp - 0x1a748], 0x2710
0x1004d4552: mov rdi, qword ptr [r13 + 0x80]
0x1004d4559: mov esi, dword ptr [r13 + 0x38]
0x1004d455d: mov rdx, qword ptr [rbp - 0x1a758]
0x1004d4564: mov rcx, qword ptr [rbp - 0x1a750]
0x1004d456b: call 0x100aa21b6 ; 0x100aa21b6 __Z15FindUniqueEdgesIjEjPKT_jP4EdgeIS0_EP9EdgeIndexIS0_E
0x1004d4570: mov ecx, dword ptr [r13 + 0x38]
0x1004d4574: cmp eax, ecx
0x1004d4576: ja 0x1004d4817
0x1004d457c: mov rdx, qword ptr [rbp - 0x1a758]
0x1004d4583: mov qword ptr [rbp - 0x1a7c0], rdx
0x1004d458a: mov rdx, qword ptr [rbp - 0x1a750]
0x1004d4591: mov qword ptr [rbp - 0x1a7b8], rdx
0x1004d4598: mov dword ptr [rbp - 0x1a7b0], ecx
0x1004d459e: mov dword ptr [rbp - 0x1a7ac], eax
0x1004d45a4: mov dword ptr [rbp - 0x1a7a8], 4
0x1004d45ae: mov rax, qword ptr [rip + 0x738bd3] ; 0x100c0d188
0x1004d45b5: add rax, 0x10
0x1004d45b9: mov qword ptr [rbp - 0x1a790], rax
0x1004d45c0: mov ecx, dword ptr [r13 + 0x34]
0x1004d45c4: mov rax, rcx
0x1004d45c7: shl rax, 4
0x1004d45cb: mov r9, rbx
0x1004d45ce: add r9, rax
0x1004d45d1: lea rax, [rbp - 0x1a748]
0x1004d45d8: mov qword ptr [rsp + 8], rax
0x1004d45dd: lea rax, [rbp - 0x1a744]
0x1004d45e4: mov qword ptr [rsp], rax
0x1004d45e8: lea rdi, [rbp - 0x1a790]
0x1004d45ef: lea rsi, [rbp - 0x1a7c0]
0x1004d45f6: vmovss xmm0, dword ptr [rip + 0x5da282] ; 0x100aae880
0x1004d45fe: mov rdx, rbx
0x1004d4601: mov r8, r14
0x1004d4604: call 0x100aa219e ; 0x100aa219e __Z10TessellateIjEbP17TessVertInterfaceRK12TessMeshInfoPKvjPT_PvPjSA_f
0x1004d4609: test al, al
0x1004d460b: je 0x1004d4836
0x1004d4611: cmp dword ptr [rbp - 0x1a744], 0
0x1004d4618: je 0x1004d4634
0x1004d461a: xor eax, eax
0x1004d461c: nop dword ptr [rax]
0x1004d4620: mov ecx, dword ptr [r13 + 0x34]
0x1004d4624: mov edx, eax
0x1004d4626: add dword ptr [r14 + rdx*4], ecx
0x1004d462a: inc eax
0x1004d462c: cmp eax, dword ptr [rbp - 0x1a744]
0x1004d4632: jb 0x1004d4620
0x1004d4634: lea r12, [r15 + 0x4c0]
0x1004d463b: mov edx, dword ptr [rbp - 0x1a748]
0x1004d4641: add edx, dword ptr [r13 + 0x34]
0x1004d4645: lea rsi, [rip + 0x6a25f3] ; 0x100b76c3f Ocean
0x1004d464c: mov rdi, r12
0x1004d464f: call 0x1007f53c0 ; 0x1007f53c0
0x1004d4654: lea rcx, [rbp - 0x1a798]
0x1004d465b: vmovaps xmm0, xmmword ptr [rip + 0x5dcf7d] ; 0x100ab15e0
0x1004d4663: vmovaps xmmword ptr [rbp - 0x1a7a0], xmm0
0x1004d466b: mov qword ptr [rsp + 8], rbx
0x1004d4670: mov dword ptr [rsp], 0
0x1004d4677: lea rdx, [rbp - 0x1a7a0]
0x1004d467e: mov esi, 0
0x1004d4683: mov r8d, 2
0x1004d4689: mov r9d, 1
0x1004d468f: mov rdi, r12
0x1004d4692: call 0x1007f5430 ; 0x1007f5430
0x1004d4697: mov r8d, dword ptr [r13 + 0x38]
0x1004d469b: mov r9, qword ptr [r13 + 0x80]
0x1004d46a2: mov esi, 0
0x1004d46a7: mov edx, 9
0x1004d46ac: mov ecx, 1
0x1004d46b1: mov rdi, r12
0x1004d46b4: call 0x1007f55d0 ; 0x1007f55d0
0x1004d46b9: mov r8d, dword ptr [rbp - 0x1a744]
0x1004d46c0: mov esi, 1
0x1004d46c5: mov edx, 9
0x1004d46ca: mov ecx, 1
0x1004d46cf: mov rdi, r12
0x1004d46d2: mov r9, r14
0x1004d46d5: call 0x1007f55d0 ; 0x1007f55d0
0x1004d46da: mov rdi, r12
0x1004d46dd: call 0x1007f5690 ; 0x1007f5690
0x1004d46e2: xor eax, eax
0x1004d46e4: call 0x100011c10 ; 0x100011c10
0x1004d46e9: mov byte ptr [r15 + 0x1392], 0
0x1004d46f1: mov byte ptr [rip + 0x1b3d5d0], 1 ; 0x102011cc8
0x1004d46f8: mov dword ptr [r15 + 0x80], 0xffffffff
0x1004d4703: call 0x1007945e0 ; 0x1007945e0
0x1004d4708: lea rdx, [r15 + 0x40]
0x1004d470c: lea rsi, [rip + 0x6b9a94] ; 0x100b8e1a7 u_waterSimTerms
0x1004d4713: mov ecx, 4
0x1004d4718: mov rdi, rax
0x1004d471b: call 0x100793f20 ; 0x100793f20
0x1004d4720: call 0x1007945e0 ; 0x1007945e0
0x1004d4725: lea rdx, [r15 + 0x50]
0x1004d4729: lea rsi, [rip + 0x6b9a87] ; 0x100b8e1b7 u_waterSimTerms2
0x1004d4730: mov ecx, 4
0x1004d4735: mov rdi, rax
0x1004d4738: call 0x100793f20 ; 0x100793f20
0x1004d473d: call 0x1007945e0 ; 0x1007945e0
0x1004d4742: add r15, 0x60
0x1004d4746: lea rsi, [rip + 0x6b9a7b] ; 0x100b8e1c8 u_waterSimTerms3
0x1004d474d: mov ecx, 4
0x1004d4752: mov rdi, rax
0x1004d4755: mov rdx, r15
0x1004d4758: call 0x100793f20 ; 0x100793f20
0x1004d475d: call 0x1007945e0 ; 0x1007945e0
0x1004d4762: lea rsi, [rip + 0x6b9a70] ; 0x100b8e1d9 u_oceanOffset
0x1004d4769: mov ecx, 3
0x1004d476e: mov rdi, rax
0x1004d4771: mov rdx, qword ptr [rbp - 0x1a788]
0x1004d4778: call 0x100793f20 ; 0x100793f20
0x1004d477d: call 0x1007c6c20 ; 0x1007c6c20
0x1004d4782: mov rdi, rax
0x1004d4785: mov rsi, r14
0x1004d4788: call 0x100795a70 ; 0x100795a70
0x1004d478d: call 0x1007c6c20 ; 0x1007c6c20
0x1004d4792: mov rdi, rax
0x1004d4795: mov rsi, qword ptr [rbp - 0x1a750]
0x1004d479c: call 0x100795a70 ; 0x100795a70
0x1004d47a1: call 0x1007c6c20 ; 0x1007c6c20
0x1004d47a6: mov rdi, rax
0x1004d47a9: mov rsi, qword ptr [rbp - 0x1a758]
0x1004d47b0: call 0x100795a70 ; 0x100795a70
0x1004d47b5: call 0x1007c6c20 ; 0x1007c6c20
0x1004d47ba: mov rdi, rax
0x1004d47bd: mov rsi, rbx
0x1004d47c0: call 0x100795a70 ; 0x100795a70
0x1004d47c5: lea rdi, [rbp - 0x1a780]
0x1004d47cc: call 0x1007c2570 ; 0x1007c2570
0x1004d47d1: mov rax, qword ptr [rip + 0x739100] ; 0x100c0d8d8
0x1004d47d8: mov rax, qword ptr [rax]
0x1004d47db: cmp rax, qword ptr [rbp - 0x30]
0x1004d47df: jne 0x1004d47f3
0x1004d47e1: add rsp, 0x1a7a8
0x1004d47e8: pop rbx
0x1004d47e9: pop r12
0x1004d47eb: pop r13
0x1004d47ed: pop r14
0x1004d47ef: pop r15
0x1004d47f1: pop rbp
0x1004d47f2: ret 
0x1004d47f3: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1004d47f8: lea rdi, [rip + 0x691666] ; 0x100b65e65 Observed()
0x1004d47ff: lea rsi, [rip + 0x69166a] ; 0x100b65e70 ./Mesh.h
0x1004d4806: mov edx, 0x6d
0x1004d480b: mov ecx, 3
0x1004d4810: call 0x1007e5f70 ; 0x1007e5f70
0x1004d4815: jmp 0x1004d4853 ; 0x1004d4853
0x1004d4817: lea rdi, [rip + 0x6b9960] ; 0x100b8e17e uniqueEdgeCount <= planeMesh->indexCount
0x1004d481e: lea rsi, [rip + 0x6b98c1] ; 0x100b8e0e6 Ocean.cpp
0x1004d4825: mov edx, 0xd9
0x1004d482a: mov ecx, 3
0x1004d482f: call 0x1007e5f70 ; 0x1007e5f70
0x1004d4834: jmp 0x1004d4853 ; 0x1004d4853
0x1004d4836: lea rdi, [rip + 0x6a4dbe] ; 0x100b795fb success
0x1004d483d: lea rsi, [rip + 0x6b98a2] ; 0x100b8e0e6 Ocean.cpp
0x1004d4844: mov edx, 0xe5
0x1004d4849: mov ecx, 3
0x1004d484e: call 0x1007e5f70 ; 0x1007e5f70
0x1004d4853: ud2 
0x1004d4855: jmp 0x1004d488a ; 0x1004d488a
0x1004d4857: jmp 0x1004d488f ; 0x1004d488f
0x1004d4859: mov rdi, rax
0x1004d485c: call 0x100011bf0 ; 0x100011bf0
0x1004d4861: mov rdi, rax
0x1004d4864: call 0x100011bf0 ; 0x100011bf0
0x1004d4869: mov rdi, rax
0x1004d486c: call 0x100011bf0 ; 0x100011bf0
0x1004d4871: mov rdi, rax
0x1004d4874: call 0x100011bf0 ; 0x100011bf0
0x1004d4879: mov r15, rax
0x1004d487c: jmp 0x1004d48a2 ; 0x1004d48a2
0x1004d487e: mov r15, rax
0x1004d4881: jmp 0x1004d48b6 ; 0x1004d48b6
0x1004d4883: mov r15, rax
0x1004d4886: jmp 0x1004d48ca ; 0x1004d48ca
0x1004d4888: jmp 0x1004d488a ; 0x1004d488a
0x1004d488a: mov r15, rax
0x1004d488d: jmp 0x1004d48da ; 0x1004d48da
0x1004d488f: mov r15, rax
0x1004d4892: call 0x1007c6c20 ; 0x1007c6c20
0x1004d4897: mov rdi, rax
0x1004d489a: mov rsi, r14
0x1004d489d: call 0x100795a70 ; 0x100795a70
0x1004d48a2: call 0x1007c6c20 ; 0x1007c6c20
0x1004d48a7: mov rdi, rax
0x1004d48aa: mov rsi, qword ptr [rbp - 0x1a750]
0x1004d48b1: call 0x100795a70 ; 0x100795a70
0x1004d48b6: call 0x1007c6c20 ; 0x1007c6c20
0x1004d48bb: mov rdi, rax
0x1004d48be: mov rsi, qword ptr [rbp - 0x1a758]
0x1004d48c5: call 0x100795a70 ; 0x100795a70
0x1004d48ca: call 0x1007c6c20 ; 0x1007c6c20
0x1004d48cf: mov rdi, rax
0x1004d48d2: mov rsi, rbx
0x1004d48d5: call 0x100795a70 ; 0x100795a70
0x1004d48da: lea rdi, [rbp - 0x1a780]
0x1004d48e1: call 0x1007c2570 ; 0x1007c2570
0x1004d48e6: mov rdi, r15
0x1004d48e9: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1004d48ee: mov rdi, rax
0x1004d48f1: call 0x100011bf0 ; 0x100011bf0
0x1004d48f6: mov rdi, rax
0x1004d48f9: call 0x100011bf0 ; 0x100011bf0
0x1004d48fe: mov rdi, rax
0x1004d4901: call 0x100011bf0 ; 0x100011bf0
0x1004d4906: mov rdi, rax
0x1004d4909: call 0x100011bf0 ; 0x100011bf0
0x1004d490e: nop 
