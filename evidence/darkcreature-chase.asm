0x1002703d0: push rbp
0x1002703d1: mov rbp, rsp
0x1002703d4: push r15
0x1002703d6: push r14
0x1002703d8: push r12
0x1002703da: push rbx
0x1002703db: and rsp, 0xffffffffffffffe0
0x1002703df: sub rsp, 0x2a0
0x1002703e6: mov r14, rcx
0x1002703e9: mov r15, rdx
0x1002703ec: vmovss dword ptr [rsp + 0x1c], xmm0
0x1002703f2: mov rbx, rdi
0x1002703f5: mov rax, qword ptr [rip + 0x99d4dc] ; 0x100c0d8d8
0x1002703fc: mov rax, qword ptr [rax]
0x1002703ff: mov qword ptr [rsp + 0x288], rax
0x100270407: cmp byte ptr [rbx + 0x2c7], 0
0x10027040e: je 0x100270902
0x100270414: mov rsi, qword ptr [rbx + 0x228]
0x10027041b: lea rdi, [rsp + 0x30]
0x100270420: call 0x1007f26b0 ; 0x1007f26b0
0x100270425: vmovaps xmm0, xmmword ptr [rbx + 0x1b0]
0x10027042d: vsubps xmm0, xmm0, xmmword ptr [rsp + 0x30]
0x100270433: vxorps ymm1, ymm1, ymm1
0x100270437: vblendps xmm1, xmm0, xmm1, 2
0x10027043d: vmulps xmm2, xmm1, xmm1
0x100270441: vmovshdup xmm3, xmm2
0x100270445: vaddss xmm3, xmm2, xmm3
0x100270449: vpermilpd xmm2, xmm2, 1
0x10027044f: vaddss xmm2, xmm2, xmm3
0x100270453: vsqrtss xmm2, xmm2, xmm2
0x100270457: vucomiss xmm2, dword ptr [rip + 0x837465] ; 0x100aa78c4
0x10027045f: jbe 0x100270475
0x100270461: vxorps xmm1, xmm1, xmm1
0x100270465: vblendps xmm0, xmm0, xmm1, 2
0x10027046b: vpermilps xmm1, xmm2, 0xc0
0x100270471: vdivps xmm1, xmm0, xmm1
0x100270475: vmulps xmm0, xmm1, xmmword ptr [rip + 0x8391e3] ; 0x100aa9660
0x10027047d: lea rsi, [rbx + 0x60]
0x100270481: vaddps xmm0, xmm0, xmmword ptr [rbx + 0x60]
0x100270486: vaddps xmm0, xmm0, xmmword ptr [rip + 0x837c12] ; 0x100aa80a0
0x10027048e: vmovaps xmmword ptr [rsp + 0x200], xmm0
0x100270497: lea rdi, [rsp + 0x40]
0x10027049c: lea rdx, [rsp + 0x200]
0x1002704a4: vmovss xmm0, dword ptr [rip + 0x834c14] ; 0x100aa50c0
0x1002704ac: vzeroupper 
0x1002704af: call 0x10062cb10 ; 0x10062cb10
0x1002704b4: vmovaps xmm0, xmmword ptr [rbx + 0xc0]
0x1002704bc: vaddps xmm0, xmm0, xmmword ptr [rsp + 0x40]
0x1002704c2: vmovaps xmmword ptr [rbx + 0xc0], xmm0
0x1002704ca: vmovaps xmm0, xmmword ptr [rbx + 0xa0]
0x1002704d2: vmovaps xmmword ptr [rsp + 0x20], xmm0
0x1002704d8: vmovss xmm0, dword ptr [rsp + 0x1c]
0x1002704de: vmulss xmm0, xmm0, dword ptr [rip + 0x839fa6] ; 0x100aaa48c
0x1002704e6: call 0x100aa2708 ; 0x100aa2708 _expf
0x1002704eb: vmovss xmm2, dword ptr [rip + 0x834bcd] ; 0x100aa50c0
0x1002704f3: vsubss xmm0, xmm2, xmm0
0x1002704f7: vxorps xmm1, xmm1, xmm1
0x1002704fb: vmaxss xmm0, xmm1, xmm0
0x1002704ff: vminss xmm0, xmm2, xmm0
0x100270503: vsubss xmm2, xmm2, xmm0
0x100270507: vmovaps xmm4, xmmword ptr [rsp + 0x20]
0x10027050d: vmulss xmm3, xmm4, xmm2
0x100270511: vmulss xmm0, xmm0, xmm1
0x100270515: vaddss xmm1, xmm0, xmm3
0x100270519: vblendps xmm1, xmm4, xmm1, 1
0x10027051f: vpermilpd xmm3, xmm4, 1
0x100270525: vmulss xmm2, xmm3, xmm2
0x100270529: vaddss xmm0, xmm0, xmm2
0x10027052d: vinsertps xmm1, xmm1, xmm0, 0x20
0x100270533: vmovss dword ptr [rbx + 0xa8], xmm0
0x10027053b: vmovlps qword ptr [rbx + 0xa0], xmm1
0x100270543: mov rdi, qword ptr [rbx + 0x290]
0x10027054a: test rdi, rdi
0x10027054d: je 0x10027057a
0x10027054f: mov r12, qword ptr [rbx + 0x298]
0x100270556: test r12, r12
0x100270559: je 0x10027057a
0x10027055b: mov rax, qword ptr [rdi]
0x10027055e: call qword ptr [rax]
0x100270560: cmp r12, rax
0x100270563: jne 0x10027057a
0x100270565: mov rdi, qword ptr [rbx + 0x290]
0x10027056c: mov rax, qword ptr [rdi]
0x10027056f: call qword ptr [rax + 0x10]
0x100270572: test al, al
0x100270574: jne 0x100270685
0x10027057a: vxorps ymm0, ymm0, ymm0
0x10027057e: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x100270587: vmovaps ymmword ptr [rsp + 0x260], ymm0
0x100270590: vmovaps ymmword ptr [rsp + 0x240], ymm0
0x100270599: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x1002705a2: mov byte ptr [rsp + 0x20d], 1
0x1002705aa: mov dword ptr [rsp + 0x200], 0x3f800000
0x1002705b5: vmovaps xmm1, xmmword ptr [rbx + 0x60]
0x1002705ba: vmovaps xmmword ptr [rsp + 0x210], xmm1
0x1002705c3: movabs rax, 0x4248000040a00000
0x1002705cd: mov qword ptr [rsp + 0x248], rax
0x1002705d5: mov dword ptr [rsp + 0x270], 0xc31
0x1002705e0: vmovups ymmword ptr [rsp + 0x1d0], ymm0
0x1002705e9: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x1002705f2: vmovaps ymmword ptr [rsp + 0x1a0], ymm0
0x1002705fb: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x100270604: vmovaps ymmword ptr [rsp + 0x160], ymm0
0x10027060d: vmovaps ymmword ptr [rsp + 0x140], ymm0
0x100270616: vmovaps ymmword ptr [rsp + 0x120], ymm0
0x10027061f: vmovaps ymmword ptr [rsp + 0x100], ymm0
0x100270628: vmovaps ymmword ptr [rsp + 0xe0], ymm0
0x100270631: vmovaps ymmword ptr [rsp + 0xc0], ymm0
0x10027063a: vmovaps ymmword ptr [rsp + 0xa0], ymm0
0x100270643: vmovaps ymmword ptr [rsp + 0x80], ymm0
0x10027064c: vmovaps ymmword ptr [rsp + 0x60], ymm0
0x100270652: vmovaps ymmword ptr [rsp + 0x40], ymm0
0x100270658: lea rsi, [rip + 0x90c62f] ; 0x100b7cc8e DuskCreatureWindup
0x10027065f: lea rdx, [rsp + 0x200]
0x100270667: lea rcx, [rsp + 0x40]
0x10027066c: mov rdi, r15
0x10027066f: vzeroupper 
0x100270672: call 0x1006018a0 ; 0x1006018a0
0x100270677: mov qword ptr [rbx + 0x290], rax
0x10027067e: mov qword ptr [rbx + 0x298], rdx
0x100270685: mov rdi, qword ptr [rbx + 0x2a0]
0x10027068c: test rdi, rdi
0x10027068f: je 0x1002706bc
0x100270691: mov r12, qword ptr [rbx + 0x2a8]
0x100270698: test r12, r12
0x10027069b: je 0x1002706bc
0x10027069d: mov rax, qword ptr [rdi]
0x1002706a0: call qword ptr [rax]
0x1002706a2: cmp r12, rax
0x1002706a5: jne 0x1002706bc
0x1002706a7: mov rdi, qword ptr [rbx + 0x2a0]
0x1002706ae: mov rax, qword ptr [rdi]
0x1002706b1: call qword ptr [rax + 0x10]
0x1002706b4: test al, al
0x1002706b6: jne 0x100270789
0x1002706bc: vxorps ymm0, ymm0, ymm0
0x1002706c0: vmovaps ymmword ptr [rsp + 0x260], ymm0
0x1002706c9: vmovaps ymmword ptr [rsp + 0x240], ymm0
0x1002706d2: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x1002706db: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x1002706e4: vmovups ymmword ptr [rsp + 0x1d0], ymm0
0x1002706ed: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x1002706f6: vmovaps ymmword ptr [rsp + 0x1a0], ymm0
0x1002706ff: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x100270708: vmovaps ymmword ptr [rsp + 0x160], ymm0
0x100270711: vmovaps ymmword ptr [rsp + 0x140], ymm0
0x10027071a: vmovaps ymmword ptr [rsp + 0x120], ymm0
0x100270723: vmovaps ymmword ptr [rsp + 0x100], ymm0
0x10027072c: vmovaps ymmword ptr [rsp + 0xe0], ymm0
0x100270735: vmovaps ymmword ptr [rsp + 0xc0], ymm0
0x10027073e: vmovaps ymmword ptr [rsp + 0xa0], ymm0
0x100270747: vmovaps ymmword ptr [rsp + 0x80], ymm0
0x100270750: vmovaps ymmword ptr [rsp + 0x60], ymm0
0x100270756: vmovaps ymmword ptr [rsp + 0x40], ymm0
0x10027075c: lea rsi, [rip + 0x90c53e] ; 0x100b7cca1 duskstart2lockon
0x100270763: lea rdx, [rsp + 0x200]
0x10027076b: lea rcx, [rsp + 0x40]
0x100270770: mov rdi, r15
0x100270773: vzeroupper 
0x100270776: call 0x1006018a0 ; 0x1006018a0
0x10027077b: mov qword ptr [rbx + 0x2a0], rax
0x100270782: mov qword ptr [rbx + 0x2a8], rdx
0x100270789: vxorps ymm0, ymm0, ymm0
0x10027078d: vmovaps ymmword ptr [rsp + 0x40], ymm0
0x100270793: vmovaps ymmword ptr [rsp + 0x60], ymm0
0x100270799: vmovups ymmword ptr [rsp + 0x1cc], ymm0
0x1002707a2: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x1002707ab: vmovaps ymmword ptr [rsp + 0x1a0], ymm0
0x1002707b4: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x1002707bd: vmovaps ymmword ptr [rsp + 0x160], ymm0
0x1002707c6: vmovaps ymmword ptr [rsp + 0x140], ymm0
0x1002707cf: vmovaps ymmword ptr [rsp + 0x120], ymm0
0x1002707d8: vmovaps ymmword ptr [rsp + 0x100], ymm0
0x1002707e1: vmovaps ymmword ptr [rsp + 0xe0], ymm0
0x1002707ea: vmovaps ymmword ptr [rsp + 0xc0], ymm0
0x1002707f3: vmovaps ymmword ptr [rsp + 0xa0], ymm0
0x1002707fc: vmovaps ymmword ptr [rsp + 0x80], ymm0
0x100270805: mov byte ptr [rsp + 0x40], 0x27
0x10027080a: mov dword ptr [rsp + 0x60], 0x3f800000
0x100270812: mov dword ptr [rsp + 0x1e0], 1
0x10027081d: mov dword ptr [rsp + 0x1ec], 1
0x100270828: mov rdi, qword ptr [rbx + 0x250]
0x10027082f: test rdi, rdi
0x100270832: je 0x100270862
0x100270834: mov r15, qword ptr [rbx + 0x258]
0x10027083b: test r15, r15
0x10027083e: je 0x100270862
0x100270840: mov rax, qword ptr [rdi]
0x100270843: vzeroupper 
0x100270846: call qword ptr [rax]
0x100270848: cmp r15, rax
0x10027084b: jne 0x100270862
0x10027084d: mov rdi, qword ptr [rbx + 0x250]
0x100270854: mov rax, qword ptr [rdi]
0x100270857: lea rsi, [rsp + 0x40]
0x10027085c: call qword ptr [rax + 0x88]
0x100270862: vmovss xmm0, dword ptr [rsp + 0x1c]
0x100270868: vaddss xmm0, xmm0, dword ptr [rbx + 0x140]
0x100270870: vmovss dword ptr [rbx + 0x140], xmm0
0x100270878: vucomiss xmm0, dword ptr [rip + 0x836228] ; 0x100aa6aa8
0x100270880: jbe 0x100270931
0x100270886: vmovss xmm0, dword ptr [rbx + 0xd0]
0x10027088e: vmulss xmm0, xmm0, dword ptr [rip + 0x833d22] ; 0x100aa45b8
0x100270896: mov dword ptr [rsp], 1
0x10027089d: lea rcx, [rip + 0x1dced6c] ; 0x10203f610
0x1002708a4: mov edx, 9
0x1002708a9: vxorps xmm1, xmm1, xmm1
0x1002708ad: xor r8d, r8d
0x1002708b0: mov r9d, 1
0x1002708b6: mov rdi, r14
0x1002708b9: mov rsi, rbx
0x1002708bc: vzeroupper 
0x1002708bf: call 0x1005a1410 ; 0x1005a1410
0x1002708c4: vmovaps xmm0, xmmword ptr [rbx + 0x60]
0x1002708c9: vmovaps xmmword ptr [rbx + 0x150], xmm0
0x1002708d1: mov dword ptr [rbx + 0x170], 0
0x1002708db: mov byte ptr [rbx + 0x174], 0
0x1002708e2: mov dword ptr [rbx + 0xb4], 0x41c80000
0x1002708ec: mov dword ptr [rbx + 0x100], 0x41c80000
0x1002708f6: mov dword ptr [rbx + 0x2e0], 2
0x100270900: jmp 0x100270931 ; 0x100270931
0x100270902: mov byte ptr [rbx + 0x2d0], 0
0x100270909: mov dword ptr [rbx + 0x140], 0
0x100270913: mov dword ptr [rbx + 0x178], 0
0x10027091d: mov dword ptr [rbx + 0x100], 0x40800000
0x100270927: mov dword ptr [rbx + 0x2e0], 0
0x100270931: mov rax, qword ptr [rip + 0x99cfa0] ; 0x100c0d8d8
0x100270938: mov rax, qword ptr [rax]
0x10027093b: cmp rax, qword ptr [rsp + 0x288]
0x100270943: jne 0x100270955
0x100270945: lea rsp, [rbp - 0x20]
0x100270949: pop rbx
0x10027094a: pop r12
0x10027094c: pop r14
0x10027094e: pop r15
0x100270950: pop rbp
0x100270951: vzeroupper 
0x100270954: ret 
0x100270955: vzeroupper 
0x100270958: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10027095d: nop dword ptr [rax]
