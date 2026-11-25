0x1006aa110: push rbp
0x1006aa111: mov rbp, rsp
0x1006aa114: push r15
0x1006aa116: push r14
0x1006aa118: push r13
0x1006aa11a: push r12
0x1006aa11c: push rbx
0x1006aa11d: and rsp, 0xffffffffffffffe0
0x1006aa121: sub rsp, 0x480
0x1006aa128: mov r12, rsi
0x1006aa12b: mov r15, rdi
0x1006aa12e: mov rax, qword ptr [rip + 0x5637a3] ; 0x100c0d8d8
0x1006aa135: mov rax, qword ptr [rax]
0x1006aa138: mov qword ptr [rsp + 0x460], rax
0x1006aa140: mov dword ptr [rsp + 0x44], 0
0x1006aa148: mov dword ptr [rsp + 0x40], 0
0x1006aa150: vxorps ymm0, ymm0, ymm0
0x1006aa154: vmovups ymmword ptr [rsp + 0x42c], ymm0
0x1006aa15d: vmovaps ymmword ptr [rsp + 0x420], ymm0
0x1006aa166: vmovaps ymmword ptr [rsp + 0x400], ymm0
0x1006aa16f: vmovaps ymmword ptr [rsp + 0x3e0], ymm0
0x1006aa178: vmovaps ymmword ptr [rsp + 0x3c0], ymm0
0x1006aa181: vmovaps ymmword ptr [rsp + 0x3a0], ymm0
0x1006aa18a: vmovaps ymmword ptr [rsp + 0x380], ymm0
0x1006aa193: vmovaps ymmword ptr [rsp + 0x360], ymm0
0x1006aa19c: vmovups ymmword ptr [r15 + 0xe6e4c], ymm0
0x1006aa1a5: vmovups ymmword ptr [r15 + 0xe6e40], ymm0
0x1006aa1ae: vmovups ymmword ptr [r15 + 0xe6e20], ymm0
0x1006aa1b7: vmovups ymmword ptr [r15 + 0xe6e00], ymm0
0x1006aa1c0: vmovups ymmword ptr [r15 + 0xe6de0], ymm0
0x1006aa1c9: vmovups ymmword ptr [r15 + 0xe6dc0], ymm0
0x1006aa1d2: vmovups ymmword ptr [r15 + 0xe6da0], ymm0
0x1006aa1db: vmovups ymmword ptr [r15 + 0xe6d80], ymm0
0x1006aa1e4: cmp dword ptr [r15 + 0xe6c78], 0
0x1006aa1ec: je 0x1006aa5d2
0x1006aa1f2: lea r11, [r15 + 0xe6d80]
0x1006aa1f9: lea r10, [r15 + 0xe6e6c]
0x1006aa200: xor edx, edx
0x1006aa202: lea r8, [rsp + 0x40]
0x1006aa207: lea r9, [rsp + 0x44]
0x1006aa20c: xor r14d, r14d
0x1006aa20f: xor ebx, ebx
0x1006aa211: nop word ptr cs:[rax + rax]
0x1006aa220: mov rdi, qword ptr [r15 + rdx*8 + 0xe6c80]
0x1006aa228: mov dword ptr [rdi + 0xb0], ebx
0x1006aa22e: mov esi, dword ptr [rdi + 0x2c8]
0x1006aa234: imul rcx, rdx, 0xd0
0x1006aa23b: mov r13d, dword ptr [r12 + rcx + 0x20]
0x1006aa240: cmp byte ptr [rdi + 0x5e4], 0
0x1006aa247: mov rcx, r9
0x1006aa24a: cmove rcx, r8
0x1006aa24e: add dword ptr [rcx], r13d
0x1006aa251: lea rcx, [rdi + 0x3b8]
0x1006aa258: cmp r11, rcx
0x1006aa25b: jae 0x1006aa270
0x1006aa25d: lea rcx, [rdi + 0x1dc]
0x1006aa264: cmp rcx, r10
0x1006aa267: jae 0x1006aa270
0x1006aa269: xor ecx, ecx
0x1006aa26b: jmp 0x1006aa54d ; 0x1006aa54d
0x1006aa270: vmovdqu ymm0, ymmword ptr [rdi + 0x2cc]
0x1006aa278: vmovdqa ymm1, ymmword ptr [rsp + 0x360]
0x1006aa281: vextractf128 xmm2, ymm1, 1
0x1006aa287: vextractf128 xmm3, ymm0, 1
0x1006aa28d: vpaddd xmm2, xmm2, xmm3
0x1006aa291: vpaddd xmm0, xmm1, xmm0
0x1006aa295: vinsertf128 ymm0, ymm0, xmm2, 1
0x1006aa29b: vmovaps ymmword ptr [rsp + 0x360], ymm0
0x1006aa2a4: vmovdqu ymm0, ymmword ptr [rdi + 0x1dc]
0x1006aa2ac: vmovdqu ymm1, ymmword ptr [r15 + 0xe6d80]
0x1006aa2b5: vextractf128 xmm2, ymm0, 1
0x1006aa2bb: vextractf128 xmm3, ymm1, 1
0x1006aa2c1: vpaddd xmm2, xmm3, xmm2
0x1006aa2c5: vpaddd xmm0, xmm1, xmm0
0x1006aa2c9: vinsertf128 ymm0, ymm0, xmm2, 1
0x1006aa2cf: vmovups ymmword ptr [r15 + 0xe6d80], ymm0
0x1006aa2d8: vmovdqu ymm0, ymmword ptr [rdi + 0x2ec]
0x1006aa2e0: vmovdqa ymm1, ymmword ptr [rsp + 0x380]
0x1006aa2e9: vextractf128 xmm2, ymm0, 1
0x1006aa2ef: vextractf128 xmm3, ymm1, 1
0x1006aa2f5: vpaddd xmm2, xmm3, xmm2
0x1006aa2f9: vpaddd xmm0, xmm1, xmm0
0x1006aa2fd: vinsertf128 ymm0, ymm0, xmm2, 1
0x1006aa303: vmovaps ymmword ptr [rsp + 0x380], ymm0
0x1006aa30c: vmovdqu ymm0, ymmword ptr [rdi + 0x1fc]
0x1006aa314: vmovdqu ymm1, ymmword ptr [r15 + 0xe6da0]
0x1006aa31d: vextractf128 xmm2, ymm0, 1
0x1006aa323: vextractf128 xmm3, ymm1, 1
0x1006aa329: vpaddd xmm2, xmm3, xmm2
0x1006aa32d: vpaddd xmm0, xmm1, xmm0
0x1006aa331: vinsertf128 ymm0, ymm0, xmm2, 1
0x1006aa337: vmovups ymmword ptr [r15 + 0xe6da0], ymm0
0x1006aa340: vmovdqu ymm0, ymmword ptr [rdi + 0x30c]
0x1006aa348: vmovdqa ymm1, ymmword ptr [rsp + 0x3a0]
0x1006aa351: vextractf128 xmm2, ymm0, 1
0x1006aa357: vextractf128 xmm3, ymm1, 1
0x1006aa35d: vpaddd xmm2, xmm3, xmm2
0x1006aa361: vpaddd xmm0, xmm1, xmm0
0x1006aa365: vinsertf128 ymm0, ymm0, xmm2, 1
0x1006aa36b: vmovaps ymmword ptr [rsp + 0x3a0], ymm0
0x1006aa374: vmovdqu ymm0, ymmword ptr [rdi + 0x21c]
0x1006aa37c: vmovdqu ymm1, ymmword ptr [r15 + 0xe6dc0]
0x1006aa385: vextractf128 xmm2, ymm0, 1
0x1006aa38b: vextractf128 xmm3, ymm1, 1
0x1006aa391: vpaddd xmm2, xmm3, xmm2
0x1006aa395: vpaddd xmm0, xmm1, xmm0
0x1006aa399: vinsertf128 ymm0, ymm0, xmm2, 1
0x1006aa39f: vmovups ymmword ptr [r15 + 0xe6dc0], ymm0
0x1006aa3a8: vmovdqu ymm0, ymmword ptr [rdi + 0x32c]
0x1006aa3b0: vmovdqa ymm1, ymmword ptr [rsp + 0x3c0]
0x1006aa3b9: vextractf128 xmm2, ymm0, 1
0x1006aa3bf: vextractf128 xmm3, ymm1, 1
0x1006aa3c5: vpaddd xmm2, xmm3, xmm2
0x1006aa3c9: vpaddd xmm0, xmm1, xmm0
0x1006aa3cd: vinsertf128 ymm0, ymm0, xmm2, 1
0x1006aa3d3: vmovaps ymmword ptr [rsp + 0x3c0], ymm0
0x1006aa3dc: vmovdqu ymm0, ymmword ptr [rdi + 0x23c]
0x1006aa3e4: vmovdqu ymm1, ymmword ptr [r15 + 0xe6de0]
0x1006aa3ed: vextractf128 xmm2, ymm0, 1
0x1006aa3f3: vextractf128 xmm3, ymm1, 1
0x1006aa3f9: vpaddd xmm2, xmm3, xmm2
0x1006aa3fd: vpaddd xmm0, xmm1, xmm0
0x1006aa401: vinsertf128 ymm0, ymm0, xmm2, 1
0x1006aa407: vmovups ymmword ptr [r15 + 0xe6de0], ymm0
0x1006aa410: vmovdqu ymm0, ymmword ptr [rdi + 0x34c]
0x1006aa418: vmovdqa ymm1, ymmword ptr [rsp + 0x3e0]
0x1006aa421: vextractf128 xmm2, ymm0, 1
0x1006aa427: vextractf128 xmm3, ymm1, 1
0x1006aa42d: vpaddd xmm2, xmm3, xmm2
0x1006aa431: vpaddd xmm0, xmm1, xmm0
0x1006aa435: vinsertf128 ymm0, ymm0, xmm2, 1
0x1006aa43b: vmovaps ymmword ptr [rsp + 0x3e0], ymm0
0x1006aa444: vmovdqu ymm0, ymmword ptr [rdi + 0x25c]
0x1006aa44c: vmovdqu ymm1, ymmword ptr [r15 + 0xe6e00]
0x1006aa455: vextractf128 xmm2, ymm0, 1
0x1006aa45b: vextractf128 xmm3, ymm1, 1
0x1006aa461: vpaddd xmm2, xmm3, xmm2
0x1006aa465: vpaddd xmm0, xmm1, xmm0
0x1006aa469: vinsertf128 ymm0, ymm0, xmm2, 1
0x1006aa46f: vmovups ymmword ptr [r15 + 0xe6e00], ymm0
0x1006aa478: vmovdqu ymm0, ymmword ptr [rdi + 0x36c]
0x1006aa480: vmovdqa ymm1, ymmword ptr [rsp + 0x400]
0x1006aa489: vextractf128 xmm2, ymm0, 1
0x1006aa48f: vextractf128 xmm3, ymm1, 1
0x1006aa495: vpaddd xmm2, xmm3, xmm2
0x1006aa499: vpaddd xmm0, xmm1, xmm0
0x1006aa49d: vinsertf128 ymm0, ymm0, xmm2, 1
0x1006aa4a3: vmovaps ymmword ptr [rsp + 0x400], ymm0
0x1006aa4ac: vmovdqu ymm0, ymmword ptr [rdi + 0x27c]
0x1006aa4b4: vmovdqu ymm1, ymmword ptr [r15 + 0xe6e20]
0x1006aa4bd: vextractf128 xmm2, ymm0, 1
0x1006aa4c3: vextractf128 xmm3, ymm1, 1
0x1006aa4c9: vpaddd xmm2, xmm3, xmm2
0x1006aa4cd: vpaddd xmm0, xmm1, xmm0
0x1006aa4d1: vinsertf128 ymm0, ymm0, xmm2, 1
0x1006aa4d7: vmovups ymmword ptr [r15 + 0xe6e20], ymm0
0x1006aa4e0: vmovdqu ymm0, ymmword ptr [rdi + 0x38c]
0x1006aa4e8: vmovdqa ymm1, ymmword ptr [rsp + 0x420]
0x1006aa4f1: vextractf128 xmm2, ymm0, 1
0x1006aa4f7: vextractf128 xmm3, ymm1, 1
0x1006aa4fd: vpaddd xmm2, xmm3, xmm2
0x1006aa501: vpaddd xmm0, xmm1, xmm0
0x1006aa505: vinsertf128 ymm0, ymm0, xmm2, 1
0x1006aa50b: vmovaps ymmword ptr [rsp + 0x420], ymm0
0x1006aa514: vmovdqu ymm0, ymmword ptr [rdi + 0x29c]
0x1006aa51c: vmovdqu ymm1, ymmword ptr [r15 + 0xe6e40]
0x1006aa525: vextractf128 xmm2, ymm0, 1
0x1006aa52b: vextractf128 xmm3, ymm1, 1
0x1006aa531: vpaddd xmm2, xmm3, xmm2
0x1006aa535: vpaddd xmm0, xmm1, xmm0
0x1006aa539: vinsertf128 ymm0, ymm0, xmm2, 1
0x1006aa53f: vmovups ymmword ptr [r15 + 0xe6e40], ymm0
0x1006aa548: mov ecx, 0x38
0x1006aa54d: mov eax, dword ptr [rdi + rcx*4 + 0x2cc]
0x1006aa554: add dword ptr [rsp + rcx*4 + 0x360], eax
0x1006aa55b: mov eax, dword ptr [rdi + rcx*4 + 0x1dc]
0x1006aa562: add dword ptr [r15 + rcx*4 + 0xe6d80], eax
0x1006aa56a: nop word ptr [rax + rax]
0x1006aa570: mov eax, dword ptr [rdi + rcx*4 + 0x2d0]
0x1006aa577: add dword ptr [rsp + rcx*4 + 0x364], eax
0x1006aa57e: mov eax, dword ptr [rdi + rcx*4 + 0x1e0]
0x1006aa585: add dword ptr [r15 + rcx*4 + 0xe6d84], eax
0x1006aa58d: mov eax, dword ptr [rdi + rcx*4 + 0x2d4]
0x1006aa594: add dword ptr [rsp + rcx*4 + 0x368], eax
0x1006aa59b: mov eax, dword ptr [rdi + rcx*4 + 0x1e4]
0x1006aa5a2: add dword ptr [r15 + rcx*4 + 0xe6d88], eax
0x1006aa5aa: add rcx, 2
0x1006aa5ae: cmp rcx, 0x3a
0x1006aa5b2: jne 0x1006aa570
0x1006aa5b4: add r14d, esi
0x1006aa5b7: add r13d, ebx
0x1006aa5ba: inc rdx
0x1006aa5bd: mov eax, dword ptr [r15 + 0xe6c78]
0x1006aa5c4: mov ebx, r13d
0x1006aa5c7: cmp rdx, rax
0x1006aa5ca: jb 0x1006aa220
0x1006aa5d0: jmp 0x1006aa5d8 ; 0x1006aa5d8
0x1006aa5d2: xor r13d, r13d
0x1006aa5d5: xor r14d, r14d
0x1006aa5d8: lea rdi, [r15 + 0x598]
0x1006aa5df: lea rsi, [rip + 0x4ef8ae] ; 0x100b99e94 Base Terrain
0x1006aa5e6: mov qword ptr [rsp + 0x28], rdi
0x1006aa5eb: mov edx, r13d
0x1006aa5ee: vzeroupper 
0x1006aa5f1: call 0x1007f53c0 ; 0x1007f53c0
0x1006aa5f6: call 0x1007c6c20 ; 0x1007c6c20
0x1006aa5fb: mov ecx, r13d
0x1006aa5fe: shl rcx, 2
0x1006aa602: lea rsi, [rcx + rcx*8]
0x1006aa606: lea r13, [rip + 0x199e543] ; 0x102048b50
0x1006aa60d: mov rdx, qword ptr [r13]
0x1006aa611: mov ecx, 4
0x1006aa616: mov rdi, rax
0x1006aa619: call 0x100795530 ; 0x100795530
0x1006aa61e: mov rbx, rax
0x1006aa621: mov edx, dword ptr [r15 + 0xe6c78]
0x1006aa628: test edx, edx
0x1006aa62a: je 0x1006aa768
0x1006aa630: xor r8d, r8d
0x1006aa633: xor r9d, r9d
0x1006aa636: nop word ptr cs:[rax + rax]
0x1006aa640: mov r9d, r9d
0x1006aa643: imul rsi, r9, 0xd0
0x1006aa64a: cmp dword ptr [r12 + rsi + 0x20], 0
0x1006aa650: mov edi, 0
0x1006aa655: je 0x1006aa756
0x1006aa65b: lea rdx, [r12 + rsi + 0x20]
0x1006aa660: xor esi, esi
0x1006aa662: nop word ptr cs:[rax + rax]
0x1006aa670: lea edi, [r8 + rsi]
0x1006aa674: lea rdi, [rdi + rdi*8]
0x1006aa678: mov rcx, qword ptr [rdx + 8]
0x1006aa67c: mov eax, esi
0x1006aa67e: lea rax, [rax + rax*8]
0x1006aa682: vmovups ymm0, ymmword ptr [rcx + rax*4]
0x1006aa687: vmovups ymmword ptr [rbx + rdi*4], ymm0
0x1006aa68c: mov eax, dword ptr [rcx + rax*4 + 0x20]
0x1006aa690: mov dword ptr [rbx + rdi*4 + 0x20], eax
0x1006aa694: vmovss xmm0, dword ptr [rbx + rdi*4]
0x1006aa699: vmovss xmm1, dword ptr [rbx + rdi*4 + 4]
0x1006aa69f: vmovss xmm2, dword ptr [rbx + rdi*4 + 8]
0x1006aa6a5: mov rax, qword ptr [r15 + r9*8 + 0xe6c80]
0x1006aa6ad: vmovaps xmm3, xmmword ptr [rax + 0x20]
0x1006aa6b2: vmovaps xmm4, xmmword ptr [rax + 0x30]
0x1006aa6b7: vmovaps xmm5, xmmword ptr [rax + 0x40]
0x1006aa6bc: vmovaps xmm6, xmmword ptr [rax + 0x50]
0x1006aa6c1: vmulss xmm8, xmm0, xmm3
0x1006aa6c5: vmulss xmm7, xmm1, xmm4
0x1006aa6c9: vaddss xmm8, xmm8, xmm7
0x1006aa6cd: vmulss xmm7, xmm2, xmm5
0x1006aa6d1: vaddss xmm7, xmm8, xmm7
0x1006aa6d5: vaddss xmm8, xmm6, xmm7
0x1006aa6d9: vmovshdup xmm7, xmm3
0x1006aa6dd: vmulss xmm9, xmm0, xmm7
0x1006aa6e1: vmovshdup xmm7, xmm4
0x1006aa6e5: vmulss xmm7, xmm1, xmm7
0x1006aa6e9: vaddss xmm9, xmm9, xmm7
0x1006aa6ed: vmovshdup xmm7, xmm5
0x1006aa6f1: vmulss xmm7, xmm2, xmm7
0x1006aa6f5: vaddss xmm9, xmm9, xmm7
0x1006aa6f9: vmovshdup xmm7, xmm6
0x1006aa6fd: vaddss xmm7, xmm7, xmm9
0x1006aa702: vpermilpd xmm3, xmm3, 1
0x1006aa708: vmulss xmm0, xmm0, xmm3
0x1006aa70c: vpermilpd xmm3, xmm4, 1
0x1006aa712: vmulss xmm1, xmm1, xmm3
0x1006aa716: vaddss xmm0, xmm0, xmm1
0x1006aa71a: vpermilpd xmm1, xmm5, 1
0x1006aa720: vmulss xmm1, xmm2, xmm1
0x1006aa724: vaddss xmm0, xmm0, xmm1
0x1006aa728: vpermilpd xmm1, xmm6, 1
0x1006aa72e: vaddss xmm0, xmm1, xmm0
0x1006aa732: vmovss dword ptr [rbx + rdi*4], xmm8
0x1006aa737: vmovss dword ptr [rbx + rdi*4 + 4], xmm7
0x1006aa73d: vmovss dword ptr [rbx + rdi*4 + 8], xmm0
0x1006aa743: inc esi
0x1006aa745: mov edi, dword ptr [rdx]
0x1006aa747: cmp esi, edi
0x1006aa749: jb 0x1006aa670
0x1006aa74f: mov edx, dword ptr [r15 + 0xe6c78]
0x1006aa756: add edi, r8d
0x1006aa759: inc r9d
0x1006aa75c: mov r8d, edi
0x1006aa75f: cmp r9d, edx
0x1006aa762: jb 0x1006aa640
0x1006aa768: lea rcx, [rsp + 0x18c]
0x1006aa770: vmovdqa ymm0, ymmword ptr [rip + 0x42c8c8] ; 0x100ad7040
0x1006aa778: vmovdqu ymmword ptr [rsp + 0x170], ymm0
0x1006aa781: movabs rax, 0x2000000003
0x1006aa78b: mov qword ptr [rsp + 0x190], rax
0x1006aa793: movabs rax, 0xd00000021
0x1006aa79d: mov qword ptr [rsp + 0x198], rax
0x1006aa7a5: movabs rax, 0xf0000000e
0x1006aa7af: mov qword ptr [rsp + 0x1a0], rax
0x1006aa7b7: mov qword ptr [rsp + 8], rbx
0x1006aa7bc: mov dword ptr [rsp], 0
0x1006aa7c3: lea rdx, [rsp + 0x170]
0x1006aa7cb: mov esi, 0
0x1006aa7d0: mov r8d, 7
0x1006aa7d6: mov r9d, 1
0x1006aa7dc: mov rdi, qword ptr [rsp + 0x28]
0x1006aa7e1: vzeroupper 
0x1006aa7e4: call 0x1007f5430 ; 0x1007f5430
0x1006aa7e9: call 0x1007c6c20 ; 0x1007c6c20
0x1006aa7ee: mov rdi, rax
0x1006aa7f1: mov rsi, rbx
0x1006aa7f4: call 0x100795a70 ; 0x100795a70
0x1006aa7f9: mov qword ptr [rsp + 0x38], r14
0x1006aa7fe: lea ebx, [r14 + 8]
0x1006aa802: call 0x1007c6c20 ; 0x1007c6c20
0x1006aa807: shl rbx, 2
0x1006aa80b: mov rdx, qword ptr [r13]
0x1006aa80f: mov ecx, 4
0x1006aa814: mov rdi, rax
0x1006aa817: mov rsi, rbx
0x1006aa81a: call 0x100795530 ; 0x100795530
0x1006aa81f: mov edx, dword ptr [r15 + 0xe6c78]
0x1006aa826: mov qword ptr [rsp + 0x20], rax
0x1006aa82b: lea rax, [rax + 0x30]
0x1006aa82f: mov qword ptr [rsp + 0x30], rax
0x1006aa834: xor r10d, r10d
0x1006aa837: xor r14d, r14d
0x1006aa83a: mov qword ptr [rsp + 0x18], r15
0x1006aa83f: nop 
0x1006aa840: test edx, edx
0x1006aa842: je 0x1006aa970
0x1006aa848: xor esi, esi
0x1006aa84a: nop word ptr [rax + rax]
0x1006aa850: mov eax, esi
0x1006aa852: mov r9, qword ptr [r15 + rax*8 + 0xe6c80]
0x1006aa85a: mov ebx, dword ptr [r9 + r10*4 + 0x2cc]
0x1006aa862: mov ecx, 0
0x1006aa867: test rbx, rbx
0x1006aa86a: je 0x1006aa94c
0x1006aa870: mov r11d, r14d
0x1006aa873: mov rdx, qword ptr [r9 + r10*8 + 0x3b8]
0x1006aa87b: mov eax, dword ptr [r9 + 0xb0]
0x1006aa882: cmp ebx, 0x10
0x1006aa885: jae 0x1006aa890
0x1006aa887: xor r12d, r12d
0x1006aa88a: jmp 0x1006aa916 ; 0x1006aa916
0x1006aa88f: nop 
0x1006aa890: mov r13d, ebx
0x1006aa893: and r13d, 0xf
0x1006aa897: mov r12, rbx
0x1006aa89a: sub r12, r13
0x1006aa89d: vmovd xmm0, eax
0x1006aa8a1: vpshufd xmm0, xmm0, 0
0x1006aa8a6: lea r15, [rdx + 0x18]
0x1006aa8aa: mov rcx, qword ptr [rsp + 0x30]
0x1006aa8af: lea r8, [rcx + r11*4]
0x1006aa8b3: mov rcx, r12
0x1006aa8b6: nop word ptr cs:[rax + rax]
0x1006aa8c0: vpmovzxwd xmm1, qword ptr [r15 - 0x18]
0x1006aa8c6: vpmovzxwd xmm2, qword ptr [r15 - 0x10]
0x1006aa8cc: vpmovzxwd xmm3, qword ptr [r15 - 8]
0x1006aa8d2: vpmovzxwd xmm4, qword ptr [r15]
0x1006aa8d7: vpaddd xmm1, xmm0, xmm1
0x1006aa8db: vpaddd xmm2, xmm0, xmm2
0x1006aa8df: vpaddd xmm3, xmm0, xmm3
0x1006aa8e3: vpaddd xmm4, xmm0, xmm4
0x1006aa8e7: vmovdqu xmmword ptr [r8 - 0x30], xmm1
0x1006aa8ed: vmovdqu xmmword ptr [r8 - 0x20], xmm2
0x1006aa8f3: vmovdqu xmmword ptr [r8 - 0x10], xmm3
0x1006aa8f9: vmovdqu xmmword ptr [r8], xmm4
0x1006aa8fe: add r15, 0x20
0x1006aa902: add r8, 0x40
0x1006aa906: add rcx, -0x10
0x1006aa90a: jne 0x1006aa8c0
0x1006aa90c: test r13d, r13d
0x1006aa90f: mov r15, qword ptr [rsp + 0x18]
0x1006aa914: je 0x1006aa944
0x1006aa916: sub rbx, r12
0x1006aa919: shl r11, 2
0x1006aa91d: lea rcx, [r11 + r12*4]
0x1006aa921: add rcx, qword ptr [rsp + 0x20]
0x1006aa926: lea rdx, [rdx + r12*2]
0x1006aa92a: nop word ptr [rax + rax]
0x1006aa930: movzx edi, word ptr [rdx]
0x1006aa933: add edi, eax
0x1006aa935: mov dword ptr [rcx], edi
0x1006aa937: add rcx, 4
0x1006aa93b: add rdx, 2
0x1006aa93f: dec rbx
0x1006aa942: jne 0x1006aa930
0x1006aa944: mov ecx, dword ptr [r9 + r10*4 + 0x2cc]
0x1006aa94c: mov dword ptr [r9 + r10*4 + 0xb4], r14d
0x1006aa954: add ecx, r14d
0x1006aa957: inc esi
0x1006aa959: mov edx, dword ptr [r15 + 0xe6c78]
0x1006aa960: mov r14d, ecx
0x1006aa963: cmp esi, edx
0x1006aa965: jb 0x1006aa850
0x1006aa96b: jmp 0x1006aa975 ; 0x1006aa975
0x1006aa96d: nop dword ptr [rax]
0x1006aa970: xor edx, edx
0x1006aa972: mov ecx, r14d
0x1006aa975: inc r10
0x1006aa978: mov r14d, ecx
0x1006aa97b: cmp r10, 0x3b
0x1006aa97f: jne 0x1006aa840
0x1006aa985: mov esi, 0
0x1006aa98a: mov edx, 9
0x1006aa98f: mov ecx, 1
0x1006aa994: mov rdi, qword ptr [rsp + 0x28]
0x1006aa999: mov r8, qword ptr [rsp + 0x38]
0x1006aa99e: mov r9, qword ptr [rsp + 0x20]
0x1006aa9a3: call 0x1007f55d0 ; 0x1007f55d0
0x1006aa9a8: call 0x1007c6c20 ; 0x1007c6c20
0x1006aa9ad: mov rdi, rax
0x1006aa9b0: mov rsi, qword ptr [rsp + 0x20]
0x1006aa9b5: call 0x100795a70 ; 0x100795a70
0x1006aa9ba: mov rdi, qword ptr [rsp + 0x28]
0x1006aa9bf: call 0x1007f5690 ; 0x1007f5690
0x1006aa9c4: lea rdi, [rsp + 0x2c0]
0x1006aa9cc: lea r15, [rsp + 0x178]
0x1006aa9d4: mov r12, qword ptr [rip + 0x55fb45] ; 0x100c0a520
0x1006aa9db: lea rbx, [r12 + 0x18]
0x1006aa9e0: mov qword ptr [rsp + 0x170], rbx
0x1006aa9e8: add r12, 0x40
0x1006aa9ec: mov qword ptr [rsp + 0x2c0], r12
0x1006aa9f4: mov rsi, r15
0x1006aa9f7: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1006aa9fc: mov qword ptr [rsp + 0x20], rbx
0x1006aaa01: mov qword ptr [rsp + 0x348], 0
0x1006aaa0d: mov dword ptr [rsp + 0x350], 0xffffffff
0x1006aaa18: mov r13, qword ptr [rip + 0x562ba9] ; 0x100c0d5c8
0x1006aaa1f: lea r14, [r13 + 0x18]
0x1006aaa23: mov qword ptr [rsp + 0x170], r14
0x1006aaa2b: add r13, 0x40
0x1006aaa2f: mov qword ptr [rsp + 0x2c0], r13
0x1006aaa37: lea rsi, [rip + 0x4ef01f] ; 0x100b99a5d TerrainBarn
0x1006aaa3e: mov edx, 4
0x1006aaa43: mov rdi, r15
0x1006aaa46: call 0x1007a56a0 ; 0x1007a56a0
0x1006aaa4b: lea rsi, [rip + 0x4ef44f] ; 0x100b99ea1
0x1006aaa52: lea rdi, [rsp + 0x170]
0x1006aaa5a: mov edx, 0x1b
0x1006aaa5f: call 0x100011930 ; 0x100011930
0x1006aaa64: lea rsi, [rip + 0x4ef452] ; 0x100b99ebd   Static Verts: 
0x1006aaa6b: mov edx, 0x10
0x1006aaa70: mov rdi, rax
0x1006aaa73: call 0x100011930 ; 0x100011930
0x1006aaa78: mov rcx, qword ptr [rsp + 0x18]
0x1006aaa7d: mov ecx, dword ptr [rcx + 0x6d4]
0x1006aaa83: shl rcx, 2
0x1006aaa87: lea rsi, [rcx + rcx*8]
0x1006aaa8b: shr rsi, 0xa
0x1006aaa8f: mov rdi, rax
0x1006aaa92: call 0x100aa23e4 ; 0x100aa23e4 __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEm
0x1006aaa97: lea rsi, [rip + 0x4ef430] ; 0x100b99ece
0x1006aaa9e: mov edx, 4
0x1006aaaa3: mov rdi, rax
0x1006aaaa6: call 0x100011930 ; 0x100011930
0x1006aaaab: lea rsi, [rip + 0x4ef421] ; 0x100b99ed3   Dynamic Idxs: 
0x1006aaab2: mov edx, 0x10
0x1006aaab7: mov rdi, rax
0x1006aaaba: call 0x100011930 ; 0x100011930
0x1006aaabf: mov rbx, rax
0x1006aaac2: xor esi, esi
0x1006aaac4: mov rdi, qword ptr [rsp + 0x28]
0x1006aaac9: call 0x1007f5ac0 ; 0x1007f5ac0
0x1006aaace: mov eax, eax
0x1006aaad0: shl rax, 2
0x1006aaad4: lea rsi, [rax + rax*2]
0x1006aaad8: shr rsi, 0xa
0x1006aaadc: mov rdi, rbx
0x1006aaadf: call 0x100aa23e4 ; 0x100aa23e4 __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEm
0x1006aaae4: lea rsi, [rip + 0x4ef3e3] ; 0x100b99ece
0x1006aaaeb: mov edx, 4
0x1006aaaf0: mov rdi, rax
0x1006aaaf3: call 0x100011930 ; 0x100011930
0x1006aaaf8: lea rsi, [rip + 0x4ef3e5] ; 0x100b99ee4   Total: 
0x1006aaaff: mov edx, 9
0x1006aab04: mov rdi, rax
0x1006aab07: call 0x100011930 ; 0x100011930
0x1006aab0c: mov rbx, rax
0x1006aab0f: mov rdi, qword ptr [rsp + 0x28]
0x1006aab14: call 0x1007f4d20 ; 0x1007f4d20
0x1006aab19: shr eax, 0xa
0x1006aab1c: mov rdi, rbx
0x1006aab1f: mov esi, eax
0x1006aab21: call 0x100aa23de ; 0x100aa23de __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
0x1006aab26: lea rsi, [rip + 0x4ef3c1] ; 0x100b99eee KB
0x1006aab2d: mov edx, 2
0x1006aab32: mov rdi, rax
0x1006aab35: call 0x100011930 ; 0x100011930
0x1006aab3a: mov qword ptr [rsp + 0x170], r14
0x1006aab42: mov qword ptr [rsp + 0x2c0], r13
0x1006aab4a: mov rdi, r15
0x1006aab4d: call 0x1007a58d0 ; 0x1007a58d0
0x1006aab52: mov r15, qword ptr [rip + 0x55fa27] ; 0x100c0a580
0x1006aab59: add r15, 8
0x1006aab5d: lea rdi, [rsp + 0x170]
0x1006aab65: mov rsi, r15
0x1006aab68: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006aab6d: lea rdi, [rsp + 0x2c0]
0x1006aab75: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006aab7a: mov rax, r14
0x1006aab7d: mov r14, qword ptr [rsp + 0x18]
0x1006aab82: cmp byte ptr [r14 + 0x339], 0
0x1006aab8a: jne 0x1006aaefe
0x1006aab90: cmp dword ptr [r14 + 0xe0c], 0
0x1006aab98: je 0x1006aaed7
0x1006aab9e: lea rax, [r14 + 0x9d0]
0x1006aaba5: mov qword ptr [rsp + 0x38], rax
0x1006aabaa: lea rax, [r14 + 0xe6e6c]
0x1006aabb1: mov qword ptr [rsp + 0x48], rax
0x1006aabb6: xor r15d, r15d
0x1006aabb9: lea r12, [rsp + 0x170]
0x1006aabc1: lea r13, [rsp + 0x50]
0x1006aabc6: jmp 0x1006aacf0 ; 0x1006aacf0
0x1006aabcb: mov edx, 0x100
0x1006aabd0: lea rax, [rsp + 0x70]
0x1006aabd5: mov rdi, rax
0x1006aabd8: lea rsi, [rsp + 0x170]
0x1006aabe0: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1006aabe5: lea rdi, [rsp + 0x70]
0x1006aabea: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1006aabef: mov byte ptr [rsp + rax + 0x74], 0
0x1006aabf4: mov dword ptr [rsp + rax + 0x70], 0x73736554
0x1006aabfc: imul r13, r13, 0x550
0x1006aac03: lea rdi, [r14 + r13 + 0xc54d0]
0x1006aac0b: mov rdx, qword ptr [r14 + 0x310]
0x1006aac12: mov r9d, 3
0x1006aac18: mov rsi, qword ptr [rsp + 0x38]
0x1006aac1d: lea rcx, [rsp + 0x70]
0x1006aac22: mov r8, r12
0x1006aac25: call 0x1007f5d90 ; 0x1007f5d90
0x1006aac2a: mov rax, qword ptr [rsp + 0x18]
0x1006aac2f: cmp byte ptr [rax + r13 + 0xc59fa], 1
0x1006aac38: je 0x1006ab258
0x1006aac3e: mov dword ptr [rax + r13 + 0xc59d8], 0
0x1006aac4a: cmp dword ptr [rsp + 0x30], 0
0x1006aac4f: je 0x1006aacde
0x1006aac55: mov rax, qword ptr [rsp + 0x18]
0x1006aac5a: cmp byte ptr [rax + r13 + 0xc5a08], 0
0x1006aac63: je 0x1006ab280
0x1006aac69: cmp byte ptr [rax + rbx + 0x1438], 0
0x1006aac71: je 0x1006ab29f
0x1006aac77: lea r12, [rax + r13 + 0xc5740]
0x1006aac7f: lea rsi, [rax + rbx + 0x1170]
0x1006aac87: mov rdi, r12
0x1006aac8a: call 0x1007bef60 ; 0x1007bef60
0x1006aac8f: mov rax, qword ptr [rsp + 0x18]
0x1006aac94: lea rbx, [rax + r13 + 0xc5a08]
0x1006aac9c: cmp byte ptr [rbx], 0
0x1006aac9f: je 0x1006ab2be
0x1006aaca5: mov rdi, r12
0x1006aaca8: lea rsi, [rip + 0x4ef296] ; 0x100b99f45 u_tessBlendDist
0x1006aacaf: vmovd xmm0, dword ptr [rip + 0x3fcb25] ; 0x100aa77dc
0x1006aacb7: call 0x1007be530 ; 0x1007be530
0x1006aacbc: cmp byte ptr [rbx], 0
0x1006aacbf: je 0x1006ab2dd
0x1006aacc5: mov ecx, 1
0x1006aacca: mov rdi, r12
0x1006aaccd: lea rsi, [rip + 0x4ef281] ; 0x100b99f55 u_tessOffsetScale
0x1006aacd4: mov rdx, qword ptr [rsp + 0x48]
0x1006aacd9: call 0x1007be7f0 ; 0x1007be7f0
0x1006aacde: mov r14, qword ptr [rsp + 0x18]
0x1006aace3: jmp 0x1006aaeb2 ; 0x1006aaeb2
0x1006aace8: nop dword ptr [rax + rax]
0x1006aacf0: mov ebx, dword ptr [r14 + 0xe08]
0x1006aacf7: mov eax, r15d
0x1006aacfa: sub eax, ebx
0x1006aacfc: inc eax
0x1006aacfe: cmp r15d, ebx
0x1006aad01: cmovb eax, r15d
0x1006aad05: mov r14, qword ptr [r14 + rax*8 + 0xe10]
0x1006aad0d: mov rsi, qword ptr [r14 + 8]
0x1006aad11: mov edx, 0x100
0x1006aad16: mov rdi, r12
0x1006aad19: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1006aad1e: cmp r15d, ebx
0x1006aad21: jb 0x1006aad40
0x1006aad23: mov rdi, r12
0x1006aad26: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1006aad2b: mov word ptr [rsp + rax + 0x174], 0x61
0x1006aad35: mov dword ptr [rsp + rax + 0x170], 0x68706c41
0x1006aad40: mov rdi, r13
0x1006aad43: call 0x1007c2530 ; 0x1007c2530
0x1006aad48: mov rax, qword ptr [rsp + 0x18]
0x1006aad4d: mov rbx, qword ptr [rax + 0x310]
0x1006aad54: call 0x1007d1100 ; 0x1007d1100
0x1006aad59: mov rdi, rbx
0x1006aad5c: mov rsi, rax
0x1006aad5f: mov rdx, r12
0x1006aad62: call 0x1007c4360 ; 0x1007c4360
0x1006aad67: test rax, rax
0x1006aad6a: je 0x1006ab1aa
0x1006aad70: mov rdi, rax
0x1006aad73: mov rsi, r13
0x1006aad76: call 0x1007c2310 ; 0x1007c2310
0x1006aad7b: mov rax, qword ptr [rsp + 0x50]
0x1006aad80: test rax, rax
0x1006aad83: je 0x1006aadb0
0x1006aad85: mov r13, qword ptr [rax + 0x10]
0x1006aad89: test byte ptr [r13 + 0xe8], 1
0x1006aad91: jne 0x1006aadbd
0x1006aad93: add r13, 0xe8
0x1006aad9a: inc r13
0x1006aad9d: cmp byte ptr [r13], 0
0x1006aada2: jne 0x1006aadd8
0x1006aada4: jmp 0x1006ab177 ; 0x1006ab177
0x1006aada9: nop dword ptr [rax]
0x1006aadb0: xor r13d, r13d
0x1006aadb3: test byte ptr [r13 + 0xe8], 1
0x1006aadbb: je 0x1006aad93
0x1006aadbd: mov r13, qword ptr [r13 + 0xf8]
0x1006aadc4: test r13, r13
0x1006aadc7: je 0x1006ab177
0x1006aadcd: cmp byte ptr [r13], 0
0x1006aadd2: je 0x1006ab177
0x1006aadd8: mov rax, qword ptr [rsp + 0x18]
0x1006aaddd: mov rdi, qword ptr [rax + 0x330]
0x1006aade4: mov rsi, r13
0x1006aade7: call 0x10017e8d0 ; 0x10017e8d0
0x1006aadec: mov r12, rax
0x1006aadef: test r12, r12
0x1006aadf2: je 0x1006ab1dd
0x1006aadf8: mov r13d, r15d
0x1006aadfb: imul rbx, r13, 0x3540
0x1006aae02: mov rax, qword ptr [rsp + 0x18]
0x1006aae07: lea rdi, [rax + rbx + 0xf00]
0x1006aae0f: mov rax, qword ptr [rsp + 0x50]
0x1006aae14: test rax, rax
0x1006aae17: mov qword ptr [rsp + 0x20], r14
0x1006aae1c: je 0x1006aae30
0x1006aae1e: mov rdx, qword ptr [rax + 0x10]
0x1006aae22: jmp 0x1006aae32 ; 0x1006aae32
0x1006aae24: nop word ptr cs:[rax + rax]
0x1006aae30: xor edx, edx
0x1006aae32: add rdx, 0x100
0x1006aae39: mov r8d, 3
0x1006aae3f: mov rsi, qword ptr [rsp + 0x28]
0x1006aae44: mov rcx, r12
0x1006aae47: call 0x1007f5e90 ; 0x1007f5e90
0x1006aae4c: mov r14, qword ptr [rsp + 0x18]
0x1006aae51: cmp byte ptr [r14 + rbx + 0x142a], 1
0x1006aae5a: je 0x1006ab20b
0x1006aae60: mov dword ptr [r14 + rbx + 0x1408], 0
0x1006aae6c: mov eax, dword ptr [rsp + r13*4 + 0x360]
0x1006aae74: mov dword ptr [rsp + 0x30], eax
0x1006aae78: test eax, eax
0x1006aae7a: je 0x1006aaea4
0x1006aae7c: cmp byte ptr [r14 + rbx + 0x1438], 0
0x1006aae85: je 0x1006ab236
0x1006aae8b: lea rdi, [r14 + rbx + 0x1170]
0x1006aae93: mov rdx, qword ptr [r14 + 0x310]
0x1006aae9a: mov rsi, qword ptr [rsp + 0x20]
0x1006aae9f: call 0x100443810 ; 0x100443810
0x1006aaea4: cmp byte ptr [r14 + 0x339], 0
0x1006aaeac: jne 0x1006aabcb
0x1006aaeb2: inc r15d
0x1006aaeb5: lea r13, [rsp + 0x50]
0x1006aaeba: mov rdi, r13
0x1006aaebd: call 0x1007c2570 ; 0x1007c2570
0x1006aaec2: cmp r15d, dword ptr [r14 + 0xe0c]
0x1006aaec9: lea r12, [rsp + 0x170]
0x1006aaed1: jb 0x1006aacf0
0x1006aaed7: mov rax, qword ptr [rip + 0x5629fa] ; 0x100c0d8d8
0x1006aaede: mov rax, qword ptr [rax]
0x1006aaee1: cmp rax, qword ptr [rsp + 0x460]
0x1006aaee9: jne 0x1006ab172
0x1006aaeef: lea rsp, [rbp - 0x28]
0x1006aaef3: pop rbx
0x1006aaef4: pop r12
0x1006aaef6: pop r13
0x1006aaef8: pop r14
0x1006aaefa: pop r15
0x1006aaefc: pop rbp
0x1006aaefd: ret 
0x1006aaefe: mov rbx, rax
0x1006aaf01: lea r14, [r14 + 0x9d0]
0x1006aaf08: lea rsi, [rip + 0x4eefe2] ; 0x100b99ef1 Tess Terrain
0x1006aaf0f: mov edx, 0x1fffe
0x1006aaf14: mov rdi, r14
0x1006aaf17: call 0x1007f53c0 ; 0x1007f53c0
0x1006aaf1c: vmovaps ymm0, ymmword ptr [rip + 0x42c13c] ; 0x100ad7060
0x1006aaf24: vmovups ymmword ptr [rsp + 0x170], ymm0
0x1006aaf2d: lea rcx, [rsp + 0x190]
0x1006aaf35: vmovdqa ymm0, ymmword ptr [rip + 0x42c143] ; 0x100ad7080
0x1006aaf3d: vmovdqu ymmword ptr [rsp + 0x190], ymm0
0x1006aaf46: mov qword ptr [rsp + 8], 0
0x1006aaf4f: mov dword ptr [rsp], 0
0x1006aaf56: lea rdx, [rsp + 0x170]
0x1006aaf5e: mov esi, 0
0x1006aaf63: mov r8d, 8
0x1006aaf69: mov r9d, 2
0x1006aaf6f: mov rdi, r14
0x1006aaf72: vzeroupper 
0x1006aaf75: call 0x1007f5430 ; 0x1007f5430
0x1006aaf7a: mov esi, 0
0x1006aaf7f: mov edx, 9
0x1006aaf84: mov ecx, 2
0x1006aaf89: mov r8d, 0xffff8
0x1006aaf8f: xor r9d, r9d
0x1006aaf92: mov rdi, r14
0x1006aaf95: call 0x1007f55d0 ; 0x1007f55d0
0x1006aaf9a: mov esi, 1
0x1006aaf9f: mov edx, 9
0x1006aafa4: mov ecx, 2
0x1006aafa9: mov r8d, 0x20006
0x1006aafaf: xor r9d, r9d
0x1006aafb2: mov rdi, r14
0x1006aafb5: call 0x1007f55d0 ; 0x1007f55d0
0x1006aafba: mov qword ptr [rsp + 0x30], r14
0x1006aafbf: mov rdi, r14
0x1006aafc2: call 0x1007f5690 ; 0x1007f5690
0x1006aafc7: lea rcx, [rsp + 0x2c0]
0x1006aafcf: lea r14, [rsp + 0x178]
0x1006aafd7: mov rax, qword ptr [rsp + 0x20]
0x1006aafdc: mov qword ptr [rsp + 0x170], rax
0x1006aafe4: mov qword ptr [rsp + 0x2c0], r12
0x1006aafec: mov rdi, rcx
0x1006aafef: mov rsi, r14
0x1006aaff2: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1006aaff7: mov qword ptr [rsp + 0x348], 0
0x1006ab003: mov dword ptr [rsp + 0x350], 0xffffffff
0x1006ab00e: mov r12, rbx
0x1006ab011: mov qword ptr [rsp + 0x170], r12
0x1006ab019: mov qword ptr [rsp + 0x2c0], r13
0x1006ab021: lea rsi, [rip + 0x4eea35] ; 0x100b99a5d TerrainBarn
0x1006ab028: mov edx, 4
0x1006ab02d: mov rdi, r14
0x1006ab030: call 0x1007a56a0 ; 0x1007a56a0
0x1006ab035: lea rsi, [rip + 0x4eeec2] ; 0x100b99efe
0x1006ab03c: lea rdi, [rsp + 0x170]
0x1006ab044: mov edx, 0x1b
0x1006ab049: call 0x100011930 ; 0x100011930
0x1006ab04e: lea rsi, [rip + 0x4eeec5] ; 0x100b99f1a   Dynamic Verts: 
0x1006ab055: mov edx, 0x11
0x1006ab05a: mov rdi, rax
0x1006ab05d: call 0x100011930 ; 0x100011930
0x1006ab062: mov rcx, qword ptr [rsp + 0x18]
0x1006ab067: mov ecx, dword ptr [rcx + 0xb0c]
0x1006ab06d: imul rsi, rcx, 0x78
0x1006ab071: shr rsi, 0xa
0x1006ab075: mov rdi, rax
0x1006ab078: call 0x100aa23e4 ; 0x100aa23e4 __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEm
0x1006ab07d: lea rsi, [rip + 0x4eee4a] ; 0x100b99ece
0x1006ab084: mov edx, 4
0x1006ab089: mov rdi, rax
0x1006ab08c: call 0x100011930 ; 0x100011930
0x1006ab091: lea rsi, [rip + 0x4eee94] ; 0x100b99f2c   Dynamic Indices: 
0x1006ab098: mov edx, 0x13
0x1006ab09d: mov rdi, rax
0x1006ab0a0: call 0x100011930 ; 0x100011930
0x1006ab0a5: mov rbx, rax
0x1006ab0a8: xor esi, esi
0x1006ab0aa: mov rdi, qword ptr [rsp + 0x30]
0x1006ab0af: call 0x1007f5ac0 ; 0x1007f5ac0
0x1006ab0b4: mov eax, eax
0x1006ab0b6: shl rax, 2
0x1006ab0ba: lea rsi, [rax + rax*2]
0x1006ab0be: shr rsi, 0xa
0x1006ab0c2: mov rdi, rbx
0x1006ab0c5: call 0x100aa23e4 ; 0x100aa23e4 __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEm
0x1006ab0ca: lea rsi, [rip + 0x4eedfd] ; 0x100b99ece
0x1006ab0d1: mov edx, 4
0x1006ab0d6: mov rdi, rax
0x1006ab0d9: call 0x100011930 ; 0x100011930
0x1006ab0de: lea rsi, [rip + 0x4eedff] ; 0x100b99ee4   Total: 
0x1006ab0e5: mov edx, 9
0x1006ab0ea: mov rdi, rax
0x1006ab0ed: call 0x100011930 ; 0x100011930
0x1006ab0f2: mov rbx, rax
0x1006ab0f5: mov rdi, qword ptr [rsp + 0x30]
0x1006ab0fa: call 0x1007f4d20 ; 0x1007f4d20
0x1006ab0ff: shr eax, 0xa
0x1006ab102: mov rdi, rbx
0x1006ab105: mov esi, eax
0x1006ab107: call 0x100aa23de ; 0x100aa23de __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
0x1006ab10c: lea rsi, [rip + 0x4eeddb] ; 0x100b99eee KB
0x1006ab113: mov edx, 2
0x1006ab118: mov rdi, rax
0x1006ab11b: call 0x100011930 ; 0x100011930
0x1006ab120: mov qword ptr [rsp + 0x170], r12
0x1006ab128: mov qword ptr [rsp + 0x2c0], r13
0x1006ab130: lea rdi, [rsp + 0x178]
0x1006ab138: call 0x1007a58d0 ; 0x1007a58d0
0x1006ab13d: lea rdi, [rsp + 0x170]
0x1006ab145: mov rsi, r15
0x1006ab148: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006ab14d: lea rdi, [rsp + 0x2c0]
0x1006ab155: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006ab15a: mov r14, qword ptr [rsp + 0x18]
0x1006ab15f: cmp dword ptr [r14 + 0xe0c], 0
0x1006ab167: jne 0x1006aab9e
0x1006ab16d: jmp 0x1006aaed7 ; 0x1006aaed7
0x1006ab172: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1006ab177: lea rdi, [rip + 0x4cb8b6] ; 0x100b76a34 renderlistName && renderlistName[0]
0x1006ab17e: lea rsi, [rip + 0x4ee85c] ; 0x100b999e1 TerrainBarn.cpp
0x1006ab185: lea r8, [rip + 0x4cb8cc] ; 0x100b76a58 Shader %s is missing a RenderList group
0x1006ab18c: lea r9, [rsp + 0x170]
0x1006ab194: mov edx, 0x579
0x1006ab199: mov ecx, 4
0x1006ab19e: xor eax, eax
0x1006ab1a0: call 0x1007e6030 ; 0x1007e6030
0x1006ab1a5: jmp 0x1006ab2fa ; 0x1006ab2fa
0x1006ab1aa: lea rdi, [rip + 0x4cb863] ; 0x100b76a14 foundShader
0x1006ab1b1: lea rsi, [rip + 0x4ee829] ; 0x100b999e1 TerrainBarn.cpp
0x1006ab1b8: lea r8, [rip + 0x4cb861] ; 0x100b76a20 No shader called %s
0x1006ab1bf: lea r9, [rsp + 0x170]
0x1006ab1c7: mov edx, 0x576
0x1006ab1cc: mov ecx, 4
0x1006ab1d1: xor eax, eax
0x1006ab1d3: call 0x1007e6030 ; 0x1007e6030
0x1006ab1d8: jmp 0x1006ab2fa ; 0x1006ab2fa
0x1006ab1dd: lea rdi, [rip + 0x4cb89c] ; 0x100b76a80 renderList
0x1006ab1e4: lea rsi, [rip + 0x4ee7f6] ; 0x100b999e1 TerrainBarn.cpp
0x1006ab1eb: lea r8, [rip + 0x4cb899] ; 0x100b76a8b No RenderList called %s
0x1006ab1f2: mov edx, 0x57c
0x1006ab1f7: mov ecx, 4
0x1006ab1fc: xor eax, eax
0x1006ab1fe: mov r9, r13
0x1006ab201: call 0x1007e6030 ; 0x1007e6030
0x1006ab206: jmp 0x1006ab2fa ; 0x1006ab2fa
0x1006ab20b: lea rdi, [rip + 0x4b705f] ; 0x100b62271 !m_queued
0x1006ab212: lea rsi, [rip + 0x4b7062] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1006ab219: lea r8, [rip + 0x4b7077] ; 0x100b62297 VertexRender has already been committed!
0x1006ab220: mov edx, 0x8e
0x1006ab225: mov ecx, 4
0x1006ab22a: xor eax, eax
0x1006ab22c: call 0x1007e6030 ; 0x1007e6030
0x1006ab231: jmp 0x1006ab2fa ; 0x1006ab2fa
0x1006ab236: lea rdi, [rip + 0x4cbaad] ; 0x100b76cea IsInitialized()
0x1006ab23d: lea rsi, [rip + 0x4b7037] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1006ab244: mov edx, 0xa8
0x1006ab249: mov ecx, 3
0x1006ab24e: call 0x1007e5f70 ; 0x1007e5f70
0x1006ab253: jmp 0x1006ab2fa ; 0x1006ab2fa
0x1006ab258: lea rdi, [rip + 0x4b7012] ; 0x100b62271 !m_queued
0x1006ab25f: lea rsi, [rip + 0x4b7015] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1006ab266: lea r8, [rip + 0x4b702a] ; 0x100b62297 VertexRender has already been committed!
0x1006ab26d: mov edx, 0x8e
0x1006ab272: mov ecx, 4
0x1006ab277: xor eax, eax
0x1006ab279: call 0x1007e6030 ; 0x1007e6030
0x1006ab27e: jmp 0x1006ab2fa ; 0x1006ab2fa
0x1006ab280: lea rdi, [rip + 0x4cba63] ; 0x100b76cea IsInitialized()
0x1006ab287: lea rsi, [rip + 0x4b6fed] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1006ab28e: mov edx, 0xa8
0x1006ab293: mov ecx, 3
0x1006ab298: call 0x1007e5f70 ; 0x1007e5f70
0x1006ab29d: jmp 0x1006ab2fa ; 0x1006ab2fa
0x1006ab29f: lea rdi, [rip + 0x4cba44] ; 0x100b76cea IsInitialized()
0x1006ab2a6: lea rsi, [rip + 0x4b6fce] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1006ab2ad: mov edx, 0xa8
0x1006ab2b2: mov ecx, 3
0x1006ab2b7: call 0x1007e5f70 ; 0x1007e5f70
0x1006ab2bc: jmp 0x1006ab2fa ; 0x1006ab2fa
0x1006ab2be: lea rdi, [rip + 0x4cba25] ; 0x100b76cea IsInitialized()
0x1006ab2c5: lea rsi, [rip + 0x4b6faf] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1006ab2cc: mov edx, 0xa8
0x1006ab2d1: mov ecx, 3
0x1006ab2d6: call 0x1007e5f70 ; 0x1007e5f70
0x1006ab2db: jmp 0x1006ab2fa ; 0x1006ab2fa
0x1006ab2dd: lea rdi, [rip + 0x4cba06] ; 0x100b76cea IsInitialized()
0x1006ab2e4: lea rsi, [rip + 0x4b6f90] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1006ab2eb: mov edx, 0xa8
0x1006ab2f0: mov ecx, 3
0x1006ab2f5: call 0x1007e5f70 ; 0x1007e5f70
0x1006ab2fa: ud2 
0x1006ab2fc: jmp 0x1006ab42a ; 0x1006ab42a
0x1006ab301: jmp 0x1006ab42a ; 0x1006ab42a
0x1006ab306: jmp 0x1006ab42a ; 0x1006ab42a
0x1006ab30b: jmp 0x1006ab42a ; 0x1006ab42a
0x1006ab310: jmp 0x1006ab42a ; 0x1006ab42a
0x1006ab315: lea rbx, [rsp + 0x2c0]
0x1006ab31d: mov r14, rax
0x1006ab320: lea rdi, [rsp + 0x170]
0x1006ab328: mov rsi, r15
0x1006ab32b: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006ab330: jmp 0x1006ab33d ; 0x1006ab33d
0x1006ab332: lea rbx, [rsp + 0x2c0]
0x1006ab33a: mov r14, rax
0x1006ab33d: mov rdi, rbx
0x1006ab340: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006ab345: mov rdi, r14
0x1006ab348: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006ab34d: mov r14, rax
0x1006ab350: mov qword ptr [rsp + 0x170], r12
0x1006ab358: mov qword ptr [rsp + 0x2c0], r13
0x1006ab360: lea rdi, [rsp + 0x178]
0x1006ab368: call 0x1007a58d0 ; 0x1007a58d0
0x1006ab36d: lea rdi, [rsp + 0x170]
0x1006ab375: mov rsi, r15
0x1006ab378: jmp 0x1006ab40a ; 0x1006ab40a
0x1006ab37d: mov r14, rax
0x1006ab380: jmp 0x1006ab3f7 ; 0x1006ab3f7
0x1006ab382: mov r14, rax
0x1006ab385: jmp 0x1006ab40f ; 0x1006ab40f
0x1006ab38a: mov r14, rax
0x1006ab38d: call 0x1007c6c20 ; 0x1007c6c20
0x1006ab392: mov rdi, rax
0x1006ab395: mov rsi, qword ptr [rsp + 0x20]
0x1006ab39a: call 0x100795a70 ; 0x100795a70
0x1006ab39f: jmp 0x1006ab437 ; 0x1006ab437
0x1006ab3a4: mov rdi, rax
0x1006ab3a7: call 0x100011bf0 ; 0x100011bf0
0x1006ab3ac: mov r14, rax
0x1006ab3af: call 0x1007c6c20 ; 0x1007c6c20
0x1006ab3b4: mov rdi, rax
0x1006ab3b7: mov rsi, rbx
0x1006ab3ba: call 0x100795a70 ; 0x100795a70
0x1006ab3bf: jmp 0x1006ab437 ; 0x1006ab437
0x1006ab3c1: mov rdi, rax
0x1006ab3c4: call 0x100011bf0 ; 0x100011bf0
0x1006ab3c9: mov rdi, rax
0x1006ab3cc: call 0x100011bf0 ; 0x100011bf0
0x1006ab3d1: mov rdi, rax
0x1006ab3d4: call 0x100011bf0 ; 0x100011bf0
0x1006ab3d9: mov rcx, r14
0x1006ab3dc: mov r14, rax
0x1006ab3df: mov qword ptr [rsp + 0x170], rcx
0x1006ab3e7: mov qword ptr [rsp + 0x2c0], r13
0x1006ab3ef: mov rdi, r15
0x1006ab3f2: call 0x1007a58d0 ; 0x1007a58d0
0x1006ab3f7: mov rsi, qword ptr [rip + 0x55f182] ; 0x100c0a580
0x1006ab3fe: add rsi, 8
0x1006ab402: lea rdi, [rsp + 0x170]
0x1006ab40a: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006ab40f: lea rdi, [rsp + 0x2c0]
0x1006ab417: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006ab41c: mov rdi, r14
0x1006ab41f: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006ab424: jmp 0x1006ab42a ; 0x1006ab42a
0x1006ab426: jmp 0x1006ab42a ; 0x1006ab42a
0x1006ab428: jmp 0x1006ab42a ; 0x1006ab42a
0x1006ab42a: mov r14, rax
0x1006ab42d: lea rdi, [rsp + 0x50]
0x1006ab432: call 0x1007c2570 ; 0x1007c2570
0x1006ab437: mov rdi, r14
0x1006ab43a: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006ab43f: nop 
