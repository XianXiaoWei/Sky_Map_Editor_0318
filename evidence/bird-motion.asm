0x1001a34c0: push rbp
0x1001a34c1: mov rbp, rsp
0x1001a34c4: push r15
0x1001a34c6: push r14
0x1001a34c8: push r13
0x1001a34ca: push r12
0x1001a34cc: push rbx
0x1001a34cd: sub rsp, 0x108
0x1001a34d4: vmovaps xmm4, xmm1
0x1001a34d8: mov r15, rcx
0x1001a34db: mov r14, rdx
0x1001a34de: mov r12, rsi
0x1001a34e1: mov r13, rdi
0x1001a34e4: cmp byte ptr [r12 + 0x84], 0
0x1001a34ed: jne 0x1001a38e9
0x1001a34f3: vmovss xmm2, dword ptr [r12 + 0x24]
0x1001a34fa: vxorps xmm0, xmm0, xmm0
0x1001a34fe: vucomiss xmm2, xmm0
0x1001a3502: vmovaps xmm0, xmmword ptr [r15 + 0x40]
0x1001a3508: vpermilps xmm1, xmm4, 0xc0
0x1001a350e: jbe 0x1001a3534
0x1001a3510: vmulps xmm3, xmm1, xmm0
0x1001a3514: vpermilps xmm2, xmm2, 0xc0
0x1001a351a: vmulps xmm3, xmm2, xmm3
0x1001a351e: vmulps xmm2, xmm2, xmm3
0x1001a3522: vmulps xmm2, xmm2, xmmword ptr [rip + 0x904256] ; 0x100aa7780
0x1001a352a: vsubps xmm0, xmm0, xmm2
0x1001a352e: vmovaps xmmword ptr [r15 + 0x40], xmm0
0x1001a3534: vmulps xmm1, xmm1, xmm0
0x1001a3538: vaddps xmm1, xmm1, xmmword ptr [r15]
0x1001a353d: vmovaps xmmword ptr [r15], xmm1
0x1001a3542: vmovaps xmm1, xmmword ptr [r15 + 0x30]
0x1001a3548: vxorps xmm1, xmm1, xmmword ptr [rip + 0x9043b0] ; 0x100aa7900
0x1001a3550: vmovaps xmmword ptr [rbp - 0xf0], xmm1
0x1001a3558: vmulps xmm1, xmm0, xmm0
0x1001a355c: vmovshdup xmm2, xmm1
0x1001a3560: vaddss xmm2, xmm1, xmm2
0x1001a3564: vpermilpd xmm1, xmm1, 1
0x1001a356a: vaddss xmm1, xmm1, xmm2
0x1001a356e: vsqrtss xmm1, xmm1, xmm1
0x1001a3572: vucomiss xmm1, dword ptr [rip + 0x90434a] ; 0x100aa78c4
0x1001a357a: jbe 0x1001a3586
0x1001a357c: vpermilps xmm1, xmm1, 0xc0
0x1001a3582: vdivps xmm0, xmm0, xmm1
0x1001a3586: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x1001a358e: vmovddup xmm1, qword ptr [rip + 0x904342] ; 0x100aa78d8
0x1001a3596: vmulps xmm2, xmm0, xmm1
0x1001a359a: vmovshdup xmm3, xmm2
0x1001a359e: vaddss xmm3, xmm2, xmm3
0x1001a35a2: vpermilpd xmm2, xmm2, 1
0x1001a35a8: vaddss xmm2, xmm2, xmm3
0x1001a35ac: vpermilps xmm2, xmm2, 0xc0
0x1001a35b2: vmulps xmm1, xmm2, xmm1
0x1001a35b6: vsubps xmm0, xmm0, xmm1
0x1001a35ba: vmulps xmm1, xmm0, xmm0
0x1001a35be: vmovshdup xmm2, xmm1
0x1001a35c2: vaddss xmm2, xmm1, xmm2
0x1001a35c6: vpermilpd xmm1, xmm1, 1
0x1001a35cc: vaddss xmm1, xmm1, xmm2
0x1001a35d0: vsqrtss xmm1, xmm1, xmm1
0x1001a35d4: vucomiss xmm1, dword ptr [rip + 0x9042e8] ; 0x100aa78c4
0x1001a35dc: jbe 0x1001a35e8
0x1001a35de: vpermilps xmm1, xmm1, 0xc0
0x1001a35e4: vdivps xmm0, xmm0, xmm1
0x1001a35e8: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x1001a35ed: vmovss xmm0, dword ptr [r12 + 0x24]
0x1001a35f4: vxorps xmm1, xmm1, xmm1
0x1001a35f8: vucomiss xmm0, xmm1
0x1001a35fc: lea rax, [rbp - 0x70]
0x1001a3600: lea rcx, [rbp - 0xb0]
0x1001a3607: cmova rcx, rax
0x1001a360b: cmp byte ptr [r12 + 0x21], 0
0x1001a3611: cmovne rcx, rax
0x1001a3615: vmovaps xmm0, xmmword ptr [rcx]
0x1001a3619: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1001a361e: vmovaps xmmword ptr [rbp - 0x40], xmm4
0x1001a3623: vaddss xmm0, xmm4, xmm4
0x1001a3627: mov rax, qword ptr [r13 + 0x78]
0x1001a362b: vmovss xmm1, dword ptr [rip + 0x901a8d] ; 0x100aa50c0
0x1001a3633: vmaxss xmm1, xmm1, dword ptr [rax + 0x18]
0x1001a3638: vdivss xmm0, xmm0, xmm1
0x1001a363c: vmovss dword ptr [rbp - 0x2c], xmm0
0x1001a3641: lea rdi, [rbp - 0x50]
0x1001a3645: lea rsi, [rbp - 0x2c]
0x1001a3649: lea rdx, [rbp - 0xf0]
0x1001a3650: lea rcx, [rbp - 0x60]
0x1001a3654: call 0x100168830 ; 0x100168830
0x1001a3659: vmovaps xmm3, xmmword ptr [rbp - 0x50]
0x1001a365e: vmulps xmm1, xmm3, xmm3
0x1001a3662: vmovshdup xmm2, xmm1
0x1001a3666: vaddss xmm2, xmm1, xmm2
0x1001a366a: vpermilpd xmm1, xmm1, 1
0x1001a3670: vaddss xmm1, xmm1, xmm2
0x1001a3674: vandps xmm2, xmm1, xmmword ptr [rip + 0x904294] ; 0x100aa7910
0x1001a367c: vmovss xmm0, dword ptr [rip + 0x904240] ; 0x100aa78c4
0x1001a3684: vucomiss xmm0, xmm2
0x1001a3688: jae 0x1001a36a9
0x1001a368a: vsqrtss xmm1, xmm1, xmm1
0x1001a368e: vucomiss xmm1, dword ptr [rip + 0x90422e] ; 0x100aa78c4
0x1001a3696: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001a369b: jbe 0x1001a36b6
0x1001a369d: vpermilps xmm1, xmm1, 0xc0
0x1001a36a3: vdivps xmm3, xmm3, xmm1
0x1001a36a7: jmp 0x1001a36b6 ; 0x1001a36b6
0x1001a36a9: vmovaps xmm3, xmmword ptr [rip + 0x90537f] ; 0x100aa8a30
0x1001a36b1: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001a36b6: vmovaps xmmword ptr [rbp - 0x50], xmm3
0x1001a36bb: lea rdi, [r13 + 0x360]
0x1001a36c2: vmovss xmm1, dword ptr [rip + 0x904f76] ; 0x100aa8640
0x1001a36ca: vmovss xmm3, dword ptr [rip + 0x90a28e] ; 0x100aad960
0x1001a36d2: mov rsi, r15
0x1001a36d5: vmovss xmm2, dword ptr [rip + 0x9019e3] ; 0x100aa50c0
0x1001a36dd: call 0x100192550 ; 0x100192550
0x1001a36e2: vmovss xmm0, dword ptr [r13 + 0x390]
0x1001a36eb: vmulss xmm0, xmm0, dword ptr [rip + 0x904f0d] ; 0x100aa8600
0x1001a36f3: vdivss xmm0, xmm0, dword ptr [rip + 0x904f09] ; 0x100aa8604
0x1001a36fb: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x1001a3700: vmovshdup xmm14, xmm0
0x1001a3704: vmovaps xmm1, xmmword ptr [rbp - 0x50]
0x1001a3709: vmovshdup xmm3, xmm1
0x1001a370d: vpermilpd xmm4, xmm1, 1
0x1001a3713: vmulss xmm5, xmm1, xmm3
0x1001a3717: vmulss xmm8, xmm3, xmm4
0x1001a371b: vmulss xmm9, xmm4, xmm1
0x1001a371f: vmovss xmm2, dword ptr [rip + 0x901999] ; 0x100aa50c0
0x1001a3727: vsubss xmm6, xmm2, xmm14
0x1001a372c: vmulss xmm7, xmm1, xmm1
0x1001a3730: vmulss xmm7, xmm6, xmm7
0x1001a3734: vaddss xmm10, xmm14, xmm7
0x1001a3738: vmulss xmm5, xmm6, xmm5
0x1001a373c: vmulss xmm7, xmm0, xmm4
0x1001a3740: vaddss xmm11, xmm7, xmm5
0x1001a3744: vmulss xmm9, xmm6, xmm9
0x1001a3749: vmulss xmm12, xmm0, xmm3
0x1001a374d: vsubss xmm13, xmm9, xmm12
0x1001a3752: vinsertps xmm2, xmm10, xmm11, 0x10
0x1001a3758: vinsertps xmm10, xmm2, xmm13, 0x20
0x1001a375e: vsubss xmm5, xmm5, xmm7
0x1001a3762: vmulss xmm3, xmm3, xmm3
0x1001a3766: vmulss xmm3, xmm6, xmm3
0x1001a376a: vaddss xmm3, xmm14, xmm3
0x1001a376e: vmulss xmm7, xmm6, xmm8
0x1001a3773: vmulss xmm0, xmm0, xmm1
0x1001a3777: vaddss xmm2, xmm0, xmm7
0x1001a377b: vinsertps xmm3, xmm5, xmm3, 0x10
0x1001a3781: vinsertps xmm2, xmm3, xmm2, 0x20
0x1001a3787: vaddss xmm3, xmm12, xmm9
0x1001a378c: vsubss xmm0, xmm7, xmm0
0x1001a3790: vmulss xmm4, xmm4, xmm4
0x1001a3794: vmulss xmm4, xmm6, xmm4
0x1001a3798: vaddss xmm4, xmm14, xmm4
0x1001a379c: vinsertps xmm0, xmm3, xmm0, 0x10
0x1001a37a2: vinsertps xmm0, xmm0, xmm4, 0x20
0x1001a37a8: vxorps xmm3, xmm3, xmm3
0x1001a37ac: vmulps xmm4, xmm10, xmm3
0x1001a37b0: vaddps xmm2, xmm2, xmm4
0x1001a37b4: vmulps xmm0, xmm0, xmm3
0x1001a37b8: vaddps xmm0, xmm0, xmm2
0x1001a37bc: vmulps xmm2, xmm1, xmm0
0x1001a37c0: vmovshdup xmm3, xmm2
0x1001a37c4: vaddss xmm3, xmm2, xmm3
0x1001a37c8: vpermilpd xmm2, xmm2, 1
0x1001a37ce: vaddss xmm2, xmm2, xmm3
0x1001a37d2: vmovaps xmm3, xmmword ptr [rip + 0x904136] ; 0x100aa7910
0x1001a37da: vandps xmm2, xmm2, xmm3
0x1001a37de: vaddss xmm2, xmm2, dword ptr [rip + 0x9018de] ; 0x100aa50c4
0x1001a37e6: vandps xmm2, xmm2, xmm3
0x1001a37ea: vmovss xmm3, dword ptr [rip + 0x9040d2] ; 0x100aa78c4
0x1001a37f2: vucomiss xmm3, xmm2
0x1001a37f6: jb 0x1001a37fe
0x1001a37f8: vmovaps xmm0, xmmword ptr [r15 + 0x20]
0x1001a37fe: vpermilps xmm2, xmm1, 0xd2
0x1001a3804: vmulps xmm3, xmm2, xmm0
0x1001a3808: vpermilps xmm0, xmm0, 0xd2
0x1001a380e: vmulps xmm0, xmm1, xmm0
0x1001a3812: vsubps xmm3, xmm3, xmm0
0x1001a3816: vpermilps xmm0, xmm3, 0xd2
0x1001a381c: vmulps xmm3, xmm3, xmm3
0x1001a3820: vpermilpd xmm4, xmm3, 1
0x1001a3826: vaddss xmm4, xmm4, xmm3
0x1001a382a: vmovshdup xmm3, xmm3
0x1001a382e: vaddss xmm3, xmm3, xmm4
0x1001a3832: vsqrtss xmm3, xmm3, xmm3
0x1001a3836: vucomiss xmm3, dword ptr [rip + 0x904086] ; 0x100aa78c4
0x1001a383e: jbe 0x1001a384a
0x1001a3840: vpermilps xmm3, xmm3, 0xc0
0x1001a3846: vdivps xmm0, xmm0, xmm3
0x1001a384a: vpermilps xmm3, xmm0, 0xd2
0x1001a3850: vmulps xmm3, xmm1, xmm3
0x1001a3854: vmulps xmm2, xmm2, xmm0
0x1001a3858: vsubps xmm3, xmm3, xmm2
0x1001a385c: vpermilps xmm2, xmm3, 0xd2
0x1001a3862: vmulps xmm3, xmm3, xmm3
0x1001a3866: vpermilpd xmm4, xmm3, 1
0x1001a386c: vaddss xmm4, xmm4, xmm3
0x1001a3870: vmovshdup xmm3, xmm3
0x1001a3874: vaddss xmm3, xmm3, xmm4
0x1001a3878: vsqrtss xmm3, xmm3, xmm3
0x1001a387c: vucomiss xmm3, dword ptr [rip + 0x904040] ; 0x100aa78c4
0x1001a3884: jbe 0x1001a3890
0x1001a3886: vpermilps xmm3, xmm3, 0xc0
0x1001a388c: vdivps xmm2, xmm2, xmm3
0x1001a3890: vxorps xmm1, xmm1, xmmword ptr [rip + 0x904068] ; 0x100aa7900
0x1001a3898: vmovaps xmmword ptr [r15 + 0x10], xmm0
0x1001a389e: vmovaps xmmword ptr [r15 + 0x20], xmm2
0x1001a38a4: vmovaps xmmword ptr [r15 + 0x30], xmm1
0x1001a38aa: vmovss xmm0, dword ptr [rip + 0x90180e] ; 0x100aa50c0
0x1001a38b2: vsubss xmm0, xmm0, dword ptr [r12 + 0x24]
0x1001a38b9: vmovss dword ptr [rbp - 0x40], xmm0
0x1001a38be: mov esi, dword ptr [r13 + 0x3c0]
0x1001a38c5: mov rdi, r14
0x1001a38c8: call 0x100097200 ; 0x100097200
0x1001a38cd: mov esi, dword ptr [r13 + 0x3c4]
0x1001a38d4: vmovss xmm0, dword ptr [rip + 0x9017e4] ; 0x100aa50c0
0x1001a38dc: vsubss xmm0, xmm0, dword ptr [rbp - 0x40]
0x1001a38e1: mov rdi, r14
0x1001a38e4: call 0x100097200 ; 0x100097200
0x1001a38e9: mov r15, qword ptr [r13 + 0x3a0]
0x1001a38f0: mov rax, qword ptr [r13]
0x1001a38f4: lea r14, [rbp - 0x130]
0x1001a38fb: mov rdi, r14
0x1001a38fe: mov rsi, r13
0x1001a3901: call qword ptr [rax + 0x18]
0x1001a3904: vmovaps xmm0, xmmword ptr [r13 + 0x3b0]
0x1001a390d: vxorps xmm1, xmm1, xmm1
0x1001a3911: vblendps xmm2, xmm1, xmm0, 1
0x1001a3917: vblendps xmm3, xmm1, xmm0, 2
0x1001a391d: vblendps xmm0, xmm1, xmm0, 4
0x1001a3923: vmovaps xmmword ptr [rbp - 0xb0], xmm2
0x1001a392b: vmovaps xmmword ptr [rbp - 0xa0], xmm3
0x1001a3933: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x1001a393b: vmovaps xmm0, xmmword ptr [rip + 0x9050bd] ; 0x100aa8a00
0x1001a3943: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x1001a3948: lea rbx, [rbp - 0xf0]
0x1001a394f: lea rdx, [rbp - 0xb0]
0x1001a3956: mov rdi, rbx
0x1001a3959: mov rsi, r14
0x1001a395c: call 0x100076df0 ; 0x100076df0
0x1001a3961: mov rdi, r15
0x1001a3964: mov rsi, rbx
0x1001a3967: call 0x100463750 ; 0x100463750
0x1001a396c: add rsp, 0x108
0x1001a3973: pop rbx
0x1001a3974: pop r12
0x1001a3976: pop r13
0x1001a3978: pop r14
0x1001a397a: pop r15
0x1001a397c: pop rbp
0x1001a397d: ret 
0x1001a397e: nop 
