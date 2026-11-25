0x100270010: push rbp
0x100270011: mov rbp, rsp
0x100270014: push r15
0x100270016: push r14
0x100270018: push rbx
0x100270019: and rsp, 0xffffffffffffffe0
0x10027001d: sub rsp, 0x260
0x100270024: mov r14, rsi
0x100270027: mov rbx, rdi
0x10027002a: mov rax, qword ptr [rip + 0x99d8a7] ; 0x100c0d8d8
0x100270031: mov rax, qword ptr [rax]
0x100270034: mov qword ptr [rsp + 0x250], rax
0x10027003c: vbroadcastss xmm0, dword ptr [rbx + 0x64]
0x100270042: vsubss xmm0, xmm0, dword ptr [rbx + 0x12c]
0x10027004a: vucomiss xmm0, dword ptr [rip + 0x8448b6] ; 0x100ab4908
0x100270052: jbe 0x10027006a
0x100270054: xor esi, esi
0x100270056: mov rdi, rbx
0x100270059: call 0x10026d0f0 ; 0x10026d0f0
0x10027005e: mov byte ptr [rbx + 0x2c4], 1
0x100270065: jmp 0x1002702de ; 0x1002702de
0x10027006a: lea rsi, [rbx + 0x60]
0x10027006e: vmovaps xmm0, xmmword ptr [rbx + 0x60]
0x100270073: vaddps xmm0, xmm0, xmmword ptr [rip + 0x838025] ; 0x100aa80a0
0x10027007b: vmovaps xmmword ptr [rsp + 0x1c0], xmm0
0x100270084: mov rdi, rsp
0x100270087: lea rdx, [rsp + 0x1c0]
0x10027008f: vmovss xmm0, dword ptr [rip + 0x835029] ; 0x100aa50c0
0x100270097: call 0x10062cb10 ; 0x10062cb10
0x10027009c: vmovaps xmm0, xmmword ptr [rbx + 0xc0]
0x1002700a4: vaddps xmm0, xmm0, xmmword ptr [rsp]
0x1002700a9: vmovaps xmmword ptr [rbx + 0xc0], xmm0
0x1002700b1: mov rdi, qword ptr [rbx + 0x280]
0x1002700b8: test rdi, rdi
0x1002700bb: je 0x1002700e8
0x1002700bd: mov r15, qword ptr [rbx + 0x288]
0x1002700c4: test r15, r15
0x1002700c7: je 0x1002700e8
0x1002700c9: mov rax, qword ptr [rdi]
0x1002700cc: call qword ptr [rax]
0x1002700ce: cmp r15, rax
0x1002700d1: jne 0x1002700e8
0x1002700d3: mov rdi, qword ptr [rbx + 0x280]
0x1002700da: mov rax, qword ptr [rdi]
0x1002700dd: call qword ptr [rax + 0x10]
0x1002700e0: test al, al
0x1002700e2: jne 0x1002702de
0x1002700e8: vxorps ymm1, ymm1, ymm1
0x1002700ec: vmovaps ymmword ptr [rsp + 0x1c0], ymm1
0x1002700f5: vmovaps ymmword ptr [rsp + 0x220], ymm1
0x1002700fe: vmovaps ymmword ptr [rsp + 0x200], ymm1
0x100270107: vmovaps ymmword ptr [rsp + 0x1e0], ymm1
0x100270110: mov byte ptr [rsp + 0x1cd], 1
0x100270118: mov dword ptr [rsp + 0x1c0], 0x3f19999a
0x100270123: vmovaps xmm0, xmmword ptr [rbx + 0x60]
0x100270128: vmovaps xmmword ptr [rsp + 0x1d0], xmm0
0x100270131: movabs rax, 0x42c8000041200000
0x10027013b: mov qword ptr [rsp + 0x208], rax
0x100270143: mov dword ptr [rsp + 0x230], 0xc31
0x10027014e: vmovups ymmword ptr [rsp + 0x190], ymm1
0x100270157: vmovaps ymmword ptr [rsp + 0x180], ymm1
0x100270160: vmovaps ymmword ptr [rsp + 0x160], ymm1
0x100270169: vmovaps ymmword ptr [rsp + 0x140], ymm1
0x100270172: vmovaps ymmword ptr [rsp + 0x120], ymm1
0x10027017b: vmovaps ymmword ptr [rsp + 0x100], ymm1
0x100270184: vmovaps ymmword ptr [rsp + 0xe0], ymm1
0x10027018d: vmovaps ymmword ptr [rsp + 0xc0], ymm1
0x100270196: vmovaps ymmword ptr [rsp + 0xa0], ymm1
0x10027019f: vmovaps ymmword ptr [rsp + 0x80], ymm1
0x1002701a8: vmovaps ymmword ptr [rsp + 0x60], ymm1
0x1002701ae: vmovaps ymmword ptr [rsp + 0x40], ymm1
0x1002701b4: vmovaps ymmword ptr [rsp + 0x20], ymm1
0x1002701ba: vmovaps ymmword ptr [rsp], ymm1
0x1002701bf: lea rsi, [rip + 0x90caa2] ; 0x100b7cc68 DarkCreatureAppear
0x1002701c6: lea rdx, [rsp + 0x1c0]
0x1002701ce: mov rcx, rsp
0x1002701d1: mov rdi, r14
0x1002701d4: vzeroupper 
0x1002701d7: call 0x1006018a0 ; 0x1006018a0
0x1002701dc: mov qword ptr [rbx + 0x280], rax
0x1002701e3: mov qword ptr [rbx + 0x288], rdx
0x1002701ea: vxorps ymm1, ymm1, ymm1
0x1002701ee: vmovaps ymmword ptr [rsp + 0x1c0], ymm1
0x1002701f7: vmovaps ymmword ptr [rsp + 0x220], ymm1
0x100270200: vmovaps ymmword ptr [rsp + 0x200], ymm1
0x100270209: vmovaps ymmword ptr [rsp + 0x1e0], ymm1
0x100270212: mov byte ptr [rsp + 0x1cd], 1
0x10027021a: mov dword ptr [rsp + 0x1c0], 0x3f800000
0x100270225: vmovaps xmm0, xmmword ptr [rbx + 0x60]
0x10027022a: vmovaps xmmword ptr [rsp + 0x1d0], xmm0
0x100270233: movabs rax, 0x42a0000041000000
0x10027023d: mov qword ptr [rsp + 0x208], rax
0x100270245: mov dword ptr [rsp + 0x230], 0xc31
0x100270250: vmovups ymmword ptr [rsp + 0x190], ymm1
0x100270259: vmovaps ymmword ptr [rsp + 0x180], ymm1
0x100270262: vmovaps ymmword ptr [rsp + 0x160], ymm1
0x10027026b: vmovaps ymmword ptr [rsp + 0x140], ymm1
0x100270274: vmovaps ymmword ptr [rsp + 0x120], ymm1
0x10027027d: vmovaps ymmword ptr [rsp + 0x100], ymm1
0x100270286: vmovaps ymmword ptr [rsp + 0xe0], ymm1
0x10027028f: vmovaps ymmword ptr [rsp + 0xc0], ymm1
0x100270298: vmovaps ymmword ptr [rsp + 0xa0], ymm1
0x1002702a1: vmovaps ymmword ptr [rsp + 0x80], ymm1
0x1002702aa: vmovaps ymmword ptr [rsp + 0x60], ymm1
0x1002702b0: vmovaps ymmword ptr [rsp + 0x40], ymm1
0x1002702b6: vmovaps ymmword ptr [rsp + 0x20], ymm1
0x1002702bc: vmovaps ymmword ptr [rsp], ymm1
0x1002702c1: lea rsi, [rip + 0x90c9b3] ; 0x100b7cc7b DuskCreatureReveal
0x1002702c8: lea rdx, [rsp + 0x1c0]
0x1002702d0: mov rcx, rsp
0x1002702d3: mov rdi, r14
0x1002702d6: vzeroupper 
0x1002702d9: call 0x1006018a0 ; 0x1006018a0
0x1002702de: mov rax, qword ptr [rip + 0x99d5f3] ; 0x100c0d8d8
0x1002702e5: mov rax, qword ptr [rax]
0x1002702e8: cmp rax, qword ptr [rsp + 0x250]
0x1002702f0: jne 0x1002702fd
0x1002702f2: lea rsp, [rbp - 0x18]
0x1002702f6: pop rbx
0x1002702f7: pop r14
0x1002702f9: pop r15
0x1002702fb: pop rbp
0x1002702fc: ret 
0x1002702fd: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100270302: nop word ptr cs:[rax + rax]
