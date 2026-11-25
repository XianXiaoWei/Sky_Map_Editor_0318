0x10005c6d0: push rbp
0x10005c6d1: mov rbp, rsp
0x10005c6d4: push r15
0x10005c6d6: push r14
0x10005c6d8: push r13
0x10005c6da: push r12
0x10005c6dc: push rbx
0x10005c6dd: push rax
0x10005c6de: mov qword ptr [rbp - 0x30], rdx
0x10005c6e2: mov r15, rdi
0x10005c6e5: cmp byte ptr [r15 + 0x97070], 0
0x10005c6ed: je 0x10005c716
0x10005c6ef: lea rax, [r15 + 0x97040]
0x10005c6f6: mov rdi, rsi
0x10005c6f9: mov rsi, rax
0x10005c6fc: call 0x10079e5c0 ; 0x10079e5c0
0x10005c701: mov rax, qword ptr [r15 + 0x66798]
0x10005c708: dec dword ptr [rax + 0x92034]
0x10005c70e: mov byte ptr [r15 + 0x97070], 0
0x10005c716: cmp byte ptr [r15 + 0x14c80], 0
0x10005c71e: je 0x10005c746
0x10005c720: lea rbx, [r15 + 0x14c88]
0x10005c727: lea rsi, [r15 + 0xc74]
0x10005c72e: mov rdi, rbx
0x10005c731: call 0x1007f0e00 ; 0x1007f0e00
0x10005c736: mov rdi, rbx
0x10005c739: call 0x1007f1390 ; 0x1007f1390
0x10005c73e: mov byte ptr [r15 + 0x14c80], 0
0x10005c746: mov eax, dword ptr [r15 + 0x67000]
0x10005c74d: mov ecx, dword ptr [r15 + 0x67004]
0x10005c754: mov dword ptr [r15 + 0x65590], eax
0x10005c75b: mov dword ptr [r15 + 0x655b4], ecx
0x10005c762: mov eax, dword ptr [r15 + 0x67008]
0x10005c769: mov dword ptr [r15 + 0x655d8], eax
0x10005c770: mov eax, dword ptr [r15 + 0x6700c]
0x10005c777: mov dword ptr [r15 + 0x65594], eax
0x10005c77e: mov eax, dword ptr [r15 + 0x67010]
0x10005c785: mov dword ptr [r15 + 0x655b8], eax
0x10005c78c: mov eax, dword ptr [r15 + 0x67014]
0x10005c793: mov dword ptr [r15 + 0x655dc], eax
0x10005c79a: mov eax, dword ptr [r15 + 0x67018]
0x10005c7a1: mov dword ptr [r15 + 0x65598], eax
0x10005c7a8: mov eax, dword ptr [r15 + 0x6701c]
0x10005c7af: mov dword ptr [r15 + 0x655bc], eax
0x10005c7b6: mov eax, dword ptr [r15 + 0x67020]
0x10005c7bd: mov dword ptr [r15 + 0x655e0], eax
0x10005c7c4: mov eax, dword ptr [r15 + 0x67024]
0x10005c7cb: mov ecx, dword ptr [r15 + 0x67028]
0x10005c7d2: mov dword ptr [r15 + 0x6559c], eax
0x10005c7d9: mov dword ptr [r15 + 0x655c0], ecx
0x10005c7e0: mov eax, dword ptr [r15 + 0x6702c]
0x10005c7e7: mov dword ptr [r15 + 0x655e4], eax
0x10005c7ee: mov eax, dword ptr [r15 + 0x67030]
0x10005c7f5: mov dword ptr [r15 + 0x655a0], eax
0x10005c7fc: mov eax, dword ptr [r15 + 0x67034]
0x10005c803: mov dword ptr [r15 + 0x655c4], eax
0x10005c80a: mov eax, dword ptr [r15 + 0x67038]
0x10005c811: mov dword ptr [r15 + 0x655e8], eax
0x10005c818: mov eax, dword ptr [r15 + 0x6703c]
0x10005c81f: mov dword ptr [r15 + 0x655a4], eax
0x10005c826: mov eax, dword ptr [r15 + 0x67040]
0x10005c82d: mov dword ptr [r15 + 0x655c8], eax
0x10005c834: mov eax, dword ptr [r15 + 0x67044]
0x10005c83b: mov dword ptr [r15 + 0x655ec], eax
0x10005c842: mov eax, dword ptr [r15 + 0x67048]
0x10005c849: mov ecx, dword ptr [r15 + 0x6704c]
0x10005c850: mov dword ptr [r15 + 0x655a8], eax
0x10005c857: mov dword ptr [r15 + 0x655cc], ecx
0x10005c85e: mov eax, dword ptr [r15 + 0x67050]
0x10005c865: mov dword ptr [r15 + 0x655f0], eax
0x10005c86c: mov eax, dword ptr [r15 + 0x67054]
0x10005c873: mov dword ptr [r15 + 0x655ac], eax
0x10005c87a: mov eax, dword ptr [r15 + 0x67058]
0x10005c881: mov dword ptr [r15 + 0x655d0], eax
0x10005c888: mov eax, dword ptr [r15 + 0x6705c]
0x10005c88f: mov dword ptr [r15 + 0x655f4], eax
0x10005c896: mov eax, dword ptr [r15 + 0x67060]
0x10005c89d: mov dword ptr [r15 + 0x655b0], eax
0x10005c8a4: mov ecx, dword ptr [r15 + 0x67064]
0x10005c8ab: mov dword ptr [r15 + 0x655d4], ecx
0x10005c8b2: mov edx, dword ptr [r15 + 0x67068]
0x10005c8b9: mov dword ptr [r15 + 0x655f8], edx
0x10005c8c0: mov dword ptr [r15 + 0x655fc], eax
0x10005c8c7: mov dword ptr [r15 + 0x65600], ecx
0x10005c8ce: mov dword ptr [r15 + 0x65604], edx
0x10005c8d5: vmovsd xmm0, qword ptr [r15 + 0x67000]
0x10005c8de: vinsertps xmm0, xmm0, dword ptr [r15 + 0x67008], 0x20
0x10005c8e8: vmulps xmm0, xmm0, xmmword ptr [rip + 0xa4b730] ; 0x100aa8020
0x10005c8f0: vmovaps xmmword ptr [r15 + 0x65580], xmm0
0x10005c8f9: mov edi, 0x20
0x10005c8fe: mov esi, 0x20
0x10005c903: call 0x1007f0470 ; 0x1007f0470
0x10005c908: mov r12d, eax
0x10005c90b: lea r13, [r15 + 0x65608]
0x10005c912: test r12d, r12d
0x10005c915: je 0x10005c9ff
0x10005c91b: xor ebx, ebx
0x10005c91d: nop dword ptr [rax]
0x10005c920: mov r14d, 0x20
0x10005c926: mov ecx, ebx
0x10005c928: shr r14d, cl
0x10005c92b: imul r14d, r14d
0x10005c92f: mov eax, r14d
0x10005c932: shl eax, 5
0x10005c935: mov ecx, 0x8000
0x10005c93a: sub ecx, eax
0x10005c93c: lea rcx, [r15 + rcx*2 + 0x87050]
0x10005c944: xor esi, esi
0x10005c946: mov rdi, r13
0x10005c949: mov edx, ebx
0x10005c94b: call 0x1007f1150 ; 0x1007f1150
0x10005c950: imul eax, r14d, -0x1c
0x10005c954: add eax, 0x8000
0x10005c959: lea rcx, [r15 + rax*2 + 0x87050]
0x10005c961: mov esi, 1
0x10005c966: mov rdi, r13
0x10005c969: mov edx, ebx
0x10005c96b: call 0x1007f1150 ; 0x1007f1150
0x10005c970: imul eax, r14d, -0x18
0x10005c974: add eax, 0x8000
0x10005c979: lea rcx, [r15 + rax*2 + 0x87050]
0x10005c981: mov esi, 2
0x10005c986: mov rdi, r13
0x10005c989: mov edx, ebx
0x10005c98b: call 0x1007f1150 ; 0x1007f1150
0x10005c990: imul eax, r14d, -0x14
0x10005c994: add eax, 0x8000
0x10005c999: lea rcx, [r15 + rax*2 + 0x87050]
0x10005c9a1: mov esi, 3
0x10005c9a6: mov rdi, r13
0x10005c9a9: mov edx, ebx
0x10005c9ab: call 0x1007f1150 ; 0x1007f1150
0x10005c9b0: mov eax, r14d
0x10005c9b3: shl eax, 4
0x10005c9b6: mov ecx, 0x8000
0x10005c9bb: sub ecx, eax
0x10005c9bd: lea rcx, [r15 + rcx*2 + 0x87050]
0x10005c9c5: mov esi, 4
0x10005c9ca: mov rdi, r13
0x10005c9cd: mov edx, ebx
0x10005c9cf: call 0x1007f1150 ; 0x1007f1150
0x10005c9d4: imul eax, r14d, -0xc
0x10005c9d8: add eax, 0x8000
0x10005c9dd: lea rcx, [r15 + rax*2 + 0x87050]
0x10005c9e5: mov esi, 5
0x10005c9ea: mov rdi, r13
0x10005c9ed: mov edx, ebx
0x10005c9ef: call 0x1007f1150 ; 0x1007f1150
0x10005c9f4: inc ebx
0x10005c9f6: cmp r12d, ebx
0x10005c9f9: jne 0x10005c920
0x10005c9ff: mov rdi, r13
0x10005ca02: call 0x1007f1390 ; 0x1007f1390
0x10005ca07: cmp byte ptr [r15 + 0x666d0], 0
0x10005ca0f: je 0x10005ca37
0x10005ca11: lea rbx, [r15 + 0x666e0]
0x10005ca18: lea rsi, [r15 + 0x656d0]
0x10005ca1f: mov rdi, rbx
0x10005ca22: call 0x1007f0e00 ; 0x1007f0e00
0x10005ca27: mov rdi, rbx
0x10005ca2a: call 0x1007f1390 ; 0x1007f1390
0x10005ca2f: mov byte ptr [r15 + 0x666d0], 0
0x10005ca37: vmovss xmm0, dword ptr [r15 + 0x97090]
0x10005ca40: vxorps xmm1, xmm1, xmm1
0x10005ca44: vucomiss xmm0, xmm1
0x10005ca48: jbe 0x10005ca6a
0x10005ca4a: vaddss xmm0, xmm0, dword ptr [rip + 0xa48672] ; 0x100aa50c4
0x10005ca52: vmaxss xmm1, xmm1, xmm0
0x10005ca56: vcmpunordss xmm0, xmm0, xmm0
0x10005ca5b: vandnps xmm0, xmm0, xmm1
0x10005ca5f: vmovss dword ptr [r15 + 0x97090], xmm0
0x10005ca68: jmp 0x10005ca75 ; 0x10005ca75
0x10005ca6a: mov dword ptr [r15 + 0x97094], 0
0x10005ca75: vmovss xmm0, dword ptr [r15 + 0xb70ac]
0x10005ca7e: vxorps xmm1, xmm1, xmm1
0x10005ca82: vucomiss xmm0, xmm1
0x10005ca86: jbe 0x10005caa6
0x10005ca88: vaddss xmm0, xmm0, dword ptr [rip + 0xa48634] ; 0x100aa50c4
0x10005ca90: vmaxss xmm1, xmm1, xmm0
0x10005ca94: vcmpunordss xmm0, xmm0, xmm0
0x10005ca99: vandnps xmm0, xmm0, xmm1
0x10005ca9d: vmovss dword ptr [r15 + 0xb70ac], xmm0
0x10005caa6: mov rsi, qword ptr [r15 + 0xb70c0]
0x10005caad: mov rdi, qword ptr [rbp - 0x30]
0x10005cab1: call 0x1005964e0 ; 0x1005964e0
0x10005cab6: vmovaps xmm0, xmmword ptr [r15 + 0x290]
0x10005cabf: vmovaps xmmword ptr [rax], xmm0
0x10005cac3: vmovaps xmm0, xmmword ptr [r15 + 0x20]
0x10005cac9: vmovaps xmmword ptr [rax + 0x10], xmm0
0x10005cace: mov ecx, dword ptr [r15 + 0x38]
0x10005cad2: mov dword ptr [rax + 0x20], ecx
0x10005cad5: mov ecx, dword ptr [r15 + 0x3c]
0x10005cad9: mov dword ptr [rax + 0x24], ecx
0x10005cadc: vmovss xmm0, dword ptr [r15 + 0x1f8]
0x10005cae5: vcmpneqss xmm1, xmm0, dword ptr [rip + 0xa4a5f6] ; 0x100aa70e4
0x10005caee: vandps xmm0, xmm1, xmm0
0x10005caf2: vmovss xmm2, dword ptr [rip + 0xa4baba] ; 0x100aa85b4
0x10005cafa: vandnps xmm1, xmm1, xmm2
0x10005cafe: vorps xmm0, xmm1, xmm0
0x10005cb02: vmovss dword ptr [rax + 0x28], xmm0
0x10005cb07: mov ecx, dword ptr [r15 + 0x1f4]
0x10005cb0e: mov dword ptr [rax + 0x2c], ecx
0x10005cb11: mov ecx, dword ptr [r15 + 0xb0]
0x10005cb18: mov dword ptr [rax + 0x30], ecx
0x10005cb1b: mov ecx, dword ptr [r15 + 0xc70]
0x10005cb22: mov dword ptr [rax + 0x34], ecx
0x10005cb25: vmovaps xmm0, xmmword ptr [r15 + 0xc60]
0x10005cb2e: vmovaps xmmword ptr [rax + 0x40], xmm0
0x10005cb33: vmovaps xmm0, xmmword ptr [r15 + 0xc30]
0x10005cb3c: vmovaps xmmword ptr [rax + 0x50], xmm0
0x10005cb41: vmovaps xmm0, xmmword ptr [r15 + 0x97080]
0x10005cb4a: vmovaps xmmword ptr [rax + 0x60], xmm0
0x10005cb4f: add rsp, 8
0x10005cb53: pop rbx
0x10005cb54: pop r12
0x10005cb56: pop r13
0x10005cb58: pop r14
0x10005cb5a: pop r15
0x10005cb5c: pop rbp
0x10005cb5d: ret 
0x10005cb5e: nop 
