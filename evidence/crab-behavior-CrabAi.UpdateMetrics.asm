0x1002591f0: push rbp
0x1002591f1: mov rbp, rsp
0x1002591f4: push r15
0x1002591f6: push r14
0x1002591f8: push r13
0x1002591fa: push r12
0x1002591fc: push rbx
0x1002591fd: sub rsp, 0x68
0x100259201: mov r12, rdi
0x100259204: mov rax, qword ptr [rip + 0x9b46cd] ; 0x100c0d8d8
0x10025920b: mov rax, qword ptr [rax]
0x10025920e: mov qword ptr [rbp - 0x30], rax
0x100259212: mov rax, qword ptr [rsi + 0x160]
0x100259219: lea rcx, [rip + 0x1da1eb0] ; 0x101ffb0d0
0x100259220: cmp byte ptr [rcx], 0
0x100259223: vmovss xmm2, dword ptr [rip + 0x84be95] ; 0x100aa50c0
0x10025922b: vmovaps xmm0, xmm2
0x10025922f: je 0x10025923c
0x100259231: lea rcx, [rip + 0xa5f308] ; 0x100cb8540
0x100259238: vmovss xmm0, dword ptr [rcx]
0x10025923c: vmulss xmm0, xmm0, dword ptr [rax + 0x20]
0x100259241: vmulss xmm0, xmm0, dword ptr [rax + 0x14]
0x100259246: vmovss xmm1, dword ptr [rip + 0x84d84e] ; 0x100aa6a9c
0x10025924e: vmaxss xmm0, xmm1, xmm0
0x100259252: vmovss xmm1, dword ptr [rip + 0x84d846] ; 0x100aa6aa0
0x10025925a: vminss xmm0, xmm1, xmm0
0x10025925e: lea r15, [r12 + 0x50]
0x100259263: vmulss xmm3, xmm0, dword ptr [rip + 0x84b34d] ; 0x100aa45b8
0x10025926b: mov r13d, 1
0x100259271: mov ebx, 0x98
0x100259276: vmovss xmm4, dword ptr [rip + 0x8503fa] ; 0x100aa9678
0x10025927e: vxorps xmm1, xmm1, xmm1
0x100259282: lea r14, [rip + 0x1ff] ; 0x100259488
0x100259289: vmovss dword ptr [rbp - 0x74], xmm3
0x10025928e: nop 
0x100259290: cmp r13d, 0xb
0x100259294: ja 0x1002592a7
0x100259296: mov rax, qword ptr [r12 + 8]
0x10025929b: mov ecx, r13d
0x10025929e: movsxd rcx, dword ptr [r14 + rcx*4]
0x1002592a2: add rcx, r14
0x1002592a5: jmp rcx
0x1002592a7: vblendps xmm5, xmm5, xmmword ptr [rip + 0x84b2ef], 7 ; 0x100aa45a0
0x1002592b1: mov eax, dword ptr [r15]
0x1002592b4: cmp r13, rax
0x1002592b7: jne 0x100259420
0x1002592bd: nop dword ptr [rax]
0x1002592c0: mov rax, qword ptr [r15 + 0x10]
0x1002592c4: mov qword ptr [rbp - 0x60], rax
0x1002592c8: vmovaps xmm0, xmmword ptr [r15]
0x1002592cd: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x1002592d2: vmovaps xmm0, xmmword ptr [r12 + 0x70]
0x1002592d9: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1002592de: mov eax, dword ptr [r12 + 0x80]
0x1002592e6: mov dword ptr [rbp - 0x40], eax
0x1002592e9: mov rdi, r12
0x1002592ec: lea rsi, [rbp - 0x70]
0x1002592f0: vmovaps xmmword ptr [rbp - 0x90], xmm5
0x1002592f8: call 0x100258790 ; 0x100258790
0x1002592fd: vmovaps xmm5, xmmword ptr [rbp - 0x90]
0x100259305: vmovss xmm4, dword ptr [rip + 0x85036b] ; 0x100aa9678
0x10025930d: vmovss xmm3, dword ptr [rbp - 0x74]
0x100259312: vmovss xmm2, dword ptr [rip + 0x84bda6] ; 0x100aa50c0
0x10025931a: vmulss xmm0, xmm3, xmm0
0x10025931e: vmovshdup xmm1, xmm5
0x100259322: vmaxss xmm1, xmm1, xmm4
0x100259326: vdivss xmm0, xmm0, xmm1
0x10025932a: lea rax, [r12 + rbx]
0x10025932e: vmovss xmm1, dword ptr [r12 + rbx]
0x100259334: vsubss xmm0, xmm1, xmm0
0x100259338: vxorps xmm1, xmm1, xmm1
0x10025933c: jmp 0x10025943c ; 0x10025943c
0x100259341: vmovaps xmm5, xmmword ptr [rax + 0x20]
0x100259346: mov eax, dword ptr [r15]
0x100259349: cmp r13, rax
0x10025934c: je 0x1002592c0
0x100259352: jmp 0x100259420 ; 0x100259420
0x100259357: vmovaps xmm5, xmmword ptr [rax + 0x30]
0x10025935c: mov eax, dword ptr [r15]
0x10025935f: cmp r13, rax
0x100259362: je 0x1002592c0
0x100259368: jmp 0x100259420 ; 0x100259420
0x10025936d: vmovaps xmm5, xmmword ptr [rax + 0x40]
0x100259372: mov eax, dword ptr [r15]
0x100259375: cmp r13, rax
0x100259378: je 0x1002592c0
0x10025937e: jmp 0x100259420 ; 0x100259420
0x100259383: vmovaps xmm5, xmmword ptr [rax + 0x50]
0x100259388: mov eax, dword ptr [r15]
0x10025938b: cmp r13, rax
0x10025938e: je 0x1002592c0
0x100259394: jmp 0x100259420 ; 0x100259420
0x100259399: vmovaps xmm5, xmmword ptr [rax + 0x60]
0x10025939e: mov eax, dword ptr [r15]
0x1002593a1: cmp r13, rax
0x1002593a4: je 0x1002592c0
0x1002593aa: jmp 0x100259420 ; 0x100259420
0x1002593ac: vmovaps xmm5, xmmword ptr [rax + 0x70]
0x1002593b1: mov eax, dword ptr [r15]
0x1002593b4: cmp r13, rax
0x1002593b7: je 0x1002592c0
0x1002593bd: jmp 0x100259420 ; 0x100259420
0x1002593bf: vmovaps xmm5, xmmword ptr [rax + 0x80]
0x1002593c7: mov eax, dword ptr [r15]
0x1002593ca: cmp r13, rax
0x1002593cd: je 0x1002592c0
0x1002593d3: jmp 0x100259420 ; 0x100259420
0x1002593d5: vmovaps xmm5, xmmword ptr [rax + 0x90]
0x1002593dd: mov eax, dword ptr [r15]
0x1002593e0: cmp r13, rax
0x1002593e3: je 0x1002592c0
0x1002593e9: jmp 0x100259420 ; 0x100259420
0x1002593eb: vmovaps xmm5, xmmword ptr [rax + 0xa0]
0x1002593f3: mov eax, dword ptr [r15]
0x1002593f6: cmp r13, rax
0x1002593f9: je 0x1002592c0
0x1002593ff: jmp 0x100259420 ; 0x100259420
0x100259401: vmovaps xmm5, xmmword ptr [rax + 0xb0]
0x100259409: mov eax, dword ptr [r15]
0x10025940c: cmp r13, rax
0x10025940f: je 0x1002592c0
0x100259415: nop word ptr cs:[rax + rax]
0x100259420: vpermilpd xmm0, xmm5, 1
0x100259426: vmaxss xmm0, xmm0, xmm4
0x10025942a: vdivss xmm0, xmm3, xmm0
0x10025942e: lea rax, [r12 + r13*4 + 0x94]
0x100259436: vaddss xmm0, xmm0, dword ptr [r12 + rbx]
0x10025943c: vmovss dword ptr [r12 + rbx], xmm0
0x100259442: vmaxss xmm0, xmm1, xmm0
0x100259446: vminss xmm0, xmm2, xmm0
0x10025944a: vmovss dword ptr [rax], xmm0
0x10025944e: inc r13
0x100259451: add rbx, 4
0x100259455: cmp rbx, 0xc4
0x10025945c: jne 0x100259290
0x100259462: mov rax, qword ptr [rip + 0x9b446f] ; 0x100c0d8d8
0x100259469: mov rax, qword ptr [rax]
0x10025946c: cmp rax, qword ptr [rbp - 0x30]
0x100259470: jne 0x100259481
0x100259472: add rsp, 0x68
0x100259476: pop rbx
0x100259477: pop r12
0x100259479: pop r13
0x10025947b: pop r14
0x10025947d: pop r15
0x10025947f: pop rbp
0x100259480: ret 
0x100259481: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100259486: nop 
