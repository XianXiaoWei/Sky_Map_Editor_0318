0x1003f3500: mov ebp, 0xfffffb98
0x1003f3505: mov rsi, qword ptr [rbp - 0x470]
0x1003f350c: call 0x100aa23ba
0x1003f3511: lea rbx, [rbp - 0x318]
0x1003f3518: mov rdi, rbx
0x1003f351b: call 0x100aa245c
0x1003f3520: inc r14d
0x1003f3523: mov rax, qword ptr [rbp - 0x500]
0x1003f352a: cmp r14d, dword ptr [rax + 0x38]
0x1003f352e: jb 0x1003f3361
0x1003f3534: cmp dword ptr [rbp - 0x280], 0xc00000
0x1003f353e: jbe 0x1003f35e2
0x1003f3544: lea r14, [rbp - 0x318]
0x1003f354b: lea rbx, [rbp - 0x460]
0x1003f3552: mov rax, qword ptr [rbp - 0x4a0]
0x1003f3559: mov qword ptr [rbp - 0x468], rax
0x1003f3560: mov rax, qword ptr [rbp - 0x4a8]
0x1003f3567: mov qword ptr [rbp - 0x318], rax
0x1003f356e: mov rdi, r14
0x1003f3571: mov rsi, rbx
0x1003f3574: lea r13, [rbp - 0xc8]
0x1003f357b: call 0x100aa2450
0x1003f3580: mov qword ptr [rbp - 0x290], 0
0x1003f358b: mov dword ptr [rbp - 0x288], 0xffffffff
0x1003f3595: mov rax, qword ptr [rbp - 0x488]
0x1003f359c: mov qword ptr [rbp - 0x468], rax
0x1003f35a3: mov qword ptr [rbp - 0x318], r12
0x1003f35aa: lea rsi, [rip + 0x793568]
0x1003f35b1: mov edx, 1
0x1003f35b6: mov rdi, rbx
0x1003f35b9: lea r15, [rbp - 0x260]
0x1003f35c0: call 0x1007a56a0
0x1003f35c5: lea rsi, [rip + 0x79364a]
0x1003f35cc: lea rdi, [rbp - 0x468]
0x1003f35d3: mov edx, 0x3b
0x1003f35d8: call 0x100011930
0x1003f35dd: jmp 0x1003f3872
0x1003f35e2: cmp qword ptr [rbp - 0x1e8], 0
0x1003f35ea: lea r13, [rbp - 0xc8]
0x1003f35f1: je 0x1003f37e0
0x1003f35f7: lea rdi, [rbp - 0x658]
0x1003f35fe: call 0x100769850
0x1003f3603: mov r12d, eax
0x1003f3606: mov r15d, r12d
0x1003f3609: lea rdi, [rbp - 0x268]
0x1003f3610: mov rsi, qword ptr [rbp - 0x590]
0x1003f3617: mov rdx, r15
0x1003f361a: call 0x100aa23a8
0x1003f361f: mov rbx, qword ptr [rbp - 0x1e8]
0x1003f3626: test rbx, rbx
0x1003f3629: je 0x1003f365b
0x1003f362b: mov rax, qword ptr [rbp - 0x260]
0x1003f3632: lea rdi, [rbp - 0x260]
0x1003f3639: call qword ptr [rax + 0x30]
0x1003f363c: mov r14d, eax
0x1003f363f: mov rdi, rbx
0x1003f3642: call 0x100aa270e
0x1003f3647: test eax, eax
0x1003f3649: jne 0x1003f365b
0x1003f364b: mov qword ptr [rbp - 0x1e8], 0
0x1003f3656: test r14d, r14d
0x1003f3659: je 0x1003f367d
0x1003f365b: mov rax, qword ptr [rbp - 0x268]
0x1003f3662: mov rax, qword ptr [rax - 0x18]
0x1003f3666: lea rdi, [rbp + rax - 0x268]
0x1003f366e: mov esi, dword ptr [rbp + rax - 0x248]
0x1003f3675: or esi, 4
0x1003f3678: call 0x100aa2456
0x1003f367d: lea r14, [rbp - 0x318]
0x1003f3684: lea r13, [rbp - 0x460]
0x1003f368b: mov rax, qword ptr [rbp - 0x4a0]
0x1003f3692: mov qword ptr [rbp - 0x468], rax
0x1003f3699: mov rax, qword ptr [rbp - 0x4a8]
0x1003f36a0: mov qword ptr [rbp - 0x318], rax
0x1003f36a7: mov rdi, r14
0x1003f36aa: mov rsi, r13
0x1003f36ad: call 0x100aa2450
0x1003f36b2: mov qword ptr [rbp - 0x290], 0
0x1003f36bd: mov dword ptr [rbp - 0x288], 0xffffffff
0x1003f36c7: mov rax, qword ptr [rbp - 0x488]
0x1003f36ce: mov qword ptr [rbp - 0x468], rax
0x1003f36d5: mov rax, qword ptr [rbp - 0x490]
0x1003f36dc: mov qword ptr [rbp - 0x318], rax
0x1003f36e3: lea rsi, [rip + 0x79342f]
0x1003f36ea: mov edx, 2
0x1003f36ef: mov rdi, r13
0x1003f36f2: call 0x1007a56a0
0x1003f36f7: lea rsi, [rip + 0x793554]
0x1003f36fe: lea rdi, [rbp - 0x468]
0x1003f3705: mov edx, 0x23
0x1003f370a: call 0x100011930
0x1003f370f: mov rdi, rax
0x1003f3712: mov esi, dword ptr [rbp - 0x510]
0x1003f3718: call 0x100aa23de
0x1003f371d: lea rsi, [rip + 0x7872d8]
0x1003f3724: mov edx, 7
0x1003f3729: mov rdi, rax
0x1003f372c: call 0x100011930
0x1003f3731: mov esi, r12d
0x1003f3734: shr esi, 0xa
0x1003f3737: mov rdi, rax
0x1003f373a: call 0x100aa23de
0x1003f373f: lea rsi, [rip + 0x7872be]
0x1003f3746: mov edx, 5
0x1003f374b: mov rdi, rax
0x1003f374e: call 0x100011930
0x1003f3753: vcvtsi2ss xmm0, xmm1, r15
0x1003f3758: add r12d, dword ptr [rbp - 0x4ac]
0x1003f375f: vcvtsi2ss xmm1, xmm1, r12
0x1003f3764: vdivss xmm0, xmm0, xmm1
0x1003f3768: vmulss xmm0, xmm0, dword ptr [rip + 0x6b4f00]
0x1003f3770: mov rdi, rax
0x1003f3773: call 0x100aa23d2
0x1003f3778: lea rsi, [rip + 0x78728b]
0x1003f377f: mov edx, 2
0x1003f3784: mov rdi, rax
0x1003f3787: call 0x100011930
0x1003f378c: mov rax, qword ptr [rbp - 0x488]
0x1003f3793: mov qword ptr [rbp - 0x468], rax
0x1003f379a: mov rax, qword ptr [rbp - 0x490]
0x1003f37a1: mov qword ptr [rbp - 0x318], rax
0x1003f37a8: mov rdi, r13
0x1003f37ab: call 0x1007a58d0
0x1003f37b0: lea rdi, [rbp - 0x468]
0x1003f37b7: mov rsi, qword ptr [rbp - 0x470]
0x1003f37be: call 0x100aa23ba
0x1003f37c3: mov rdi, r14
0x1003f37c6: call 0x100aa245c
0x1003f37cb: mov bl, 1
0x1003f37cd: lea r13, [rbp - 0xc8]
0x1003f37d4: lea r15, [rbp - 0x260]
0x1003f37db: jmp 0x1003f38ac
0x1003f37e0: lea r14, [rbp - 0x318]
0x1003f37e7: lea rbx, [rbp - 0x460]
0x1003f37ee: mov rax, qword ptr [rbp - 0x4a0]
0x1003f37f5: mov qword ptr [rbp - 0x468], rax
0x1003f37fc: mov rax, qword ptr [rbp - 0x4a8]
0x1003f3803: mov qword ptr [rbp - 0x318], rax
0x1003f380a: mov rdi, r14
0x1003f380d: mov rsi, rbx
0x1003f3810: call 0x100aa2450
0x1003f3815: mov rax, qword ptr [rbp - 0x488]
0x1003f381c: mov qword ptr [rbp - 0x290], 0
0x1003f3827: mov dword ptr [rbp - 0x288], 0xffffffff
0x1003f3831: mov qword ptr [rbp - 0x468], rax
0x1003f3838: mov qword ptr [rbp - 0x318], r12
0x1003f383f: lea rsi, [rip + 0x7932d3]
0x1003f3846: mov edx, 1
0x1003f384b: mov rdi, rbx
0x1003f384e: lea r15, [rbp - 0x260]
0x1003f3855: call 0x1007a56a0
0x1003f385a: lea rsi, [rip + 0x793415]
0x1003f3861: lea rdi, [rbp - 0x468]
0x1003f3868: mov edx, 0x22
0x1003f386d: call 0x100011930
0x1003f3872: mov rax, qword ptr [rbp - 0x488]
0x1003f3879: mov qword ptr [rbp - 0x468], rax
0x1003f3880: mov qword ptr [rbp - 0x318], r12
0x1003f3887: mov rdi, rbx
0x1003f388a: call 0x1007a58d0
0x1003f388f: lea rdi, [rbp - 0x468]
0x1003f3896: mov rsi, qword ptr [rbp - 0x470]
0x1003f389d: call 0x100aa23ba
0x1003f38a2: mov rdi, r14
0x1003f38a5: call 0x100aa245c
0x1003f38aa: xor ebx, ebx
0x1003f38ac: mov rdi, qword ptr [rbp - 0x590]
0x1003f38b3: call 0x1007e8b90
0x1003f38b8: mov rax, qword ptr [rbp - 0x478]
0x1003f38bf: mov qword ptr [rbp - 0x268], rax
0x1003f38c6: mov rax, qword ptr [rbp - 0x480]
0x1003f38cd: mov qword ptr [rbp - 0xc8], rax
0x1003f38d4: mov rdi, r15
0x1003f38d7: call 0x1003f6ae0
0x1003f38dc: mov rsi, qword ptr [rip + 0x816cad]
0x1003f38e3: add rsi, 8
0x1003f38e7: lea rdi, [rbp - 0x268]
0x1003f38ee: call 0x100aa23ba
0x1003f38f3: mov rdi, r13
0x1003f38f6: call 0x100aa245c
0x1003f38fb: lea rdi, [rbp - 0x660]
0x1003f3902: call 0x10076b810
0x1003f3907: mov rax, qword ptr [rip + 0x819fca]
0x1003f390e: mov rax, qword ptr [rax]
0x1003f3911: cmp rax, qword ptr [rbp - 0x30]
0x1003f3915: jne 0x1003f392b
0x1003f3917: mov eax, ebx
0x1003f3919: add rsp, 0x638
0x1003f3920: pop rbx
0x1003f3921: pop r12
0x1003f3923: pop r13
0x1003f3925: pop r14
0x1003f3927: pop r15
0x1003f3929: pop rbp
0x1003f392a: ret 
0x1003f392b: call 0x100aa251c
0x1003f3930: jmp 0x1003f3947
0x1003f3932: jmp 0x1003f398a
0x1003f3934: jmp 0x1003f3992
0x1003f3936: mov r14, rax
0x1003f3939: mov rdi, rbx
0x1003f393c: call 0x100aa270e
0x1003f3941: jmp 0x1003f39a0
0x1003f3943: jmp 0x1003f398a
0x1003f3945: jmp 0x1003f3992
0x1003f3947: mov rcx, rax
0x1003f394a: mov rax, qword ptr [rbp - 0x488]
0x1003f3951: mov qword ptr [rbp - 0x468], rax
0x1003f3958: mov qword ptr [rbp - 0x318], r12
0x1003f395f: mov rdi, rbx
0x1003f3962: mov rbx, rcx
0x1003f3965: call 0x1007a58d0
0x1003f396a: lea rdi, [rbp - 0x468]
0x1003f3971: mov rsi, qword ptr [rbp - 0x470]
0x1003f3978: call 0x100aa23ba
0x1003f397d: mov rdi, r14
0x1003f3980: call 0x100aa245c
0x1003f3985: jmp 0x1003f4186
0x1003f398a: mov rbx, rax
0x1003f398d: jmp 0x1003f3a1c
0x1003f3992: mov rbx, rax
0x1003f3995: mov rdi, r14
0x1003f3998: jmp 0x1003f4135
0x1003f399d: mov r14, rax
0x1003f39a0: lea r13, [rbp - 0xc8]
0x1003f39a7: jmp 0x1003f3b14
0x1003f39ac: mov rdi, rax
0x1003f39af: call 0x100011bf0
0x1003f39b4: jmp 0x1003f39bc
0x1003f39b6: jmp 0x1003f39bc
0x1003f39b8: jmp 0x1003f39bc
0x1003f39ba: jmp 0x1003f39bc
0x1003f39bc: mov rbx, rax
0x1003f39bf: lea r13, [rbp - 0xc8]
0x1003f39c6: jmp 0x1003f40d4
0x1003f39cb: mov rbx, rax
0x1003f39ce: mov rax, qword ptr [rbp - 0x488]
0x1003f39d5: mov qword ptr [rbp - 0x468], rax
0x1003f39dc: mov rax, qword ptr [rbp - 0x490]
0x1003f39e3: mov qword ptr [rbp - 0x318], rax
0x1003f39ea: mov rdi, r13
0x1003f39ed: jmp 0x1003f3a17
0x1003f39ef: jmp 0x1003f4044
0x1003f39f4: jmp 0x1003f4044
0x1003f39f9: mov rcx, rax
0x1003f39fc: mov rax, qword ptr [rbp - 0x488]
0x1003f3a03: mov qword ptr [rbp - 0x468], rax
0x1003f3a0a: mov qword ptr [rbp - 0x318], r12
0x1003f3a11: mov rdi, rbx
0x1003f3a14: mov rbx, rcx
0x1003f3a17: call 0x1007a58d0
0x1003f3a1c: lea rdi, [rbp - 0x468]
0x1003f3a23: mov rsi, qword ptr [rbp - 0x470]
0x1003f3a2a: call 0x100aa23ba
0x1003f3a2f: mov rdi, r14
0x1003f3a32: jmp 0x1003f4135
0x1003f3a37: lea r13, [rbp - 0xc8]
0x1003f3a3e: mov rbx, rax
0x1003f3a41: lea rdi, [rbp - 0x468]
0x1003f3a48: mov rsi, qword ptr [rbp - 0x470]
0x1003f3a4f: call 0x100aa23ba
0x1003f3a54: mov rdi, r14
0x1003f3a57: jmp 0x1003f3d1d
0x1003f3a5c: lea r13, [rbp - 0xc8]
0x1003f3a63: mov rbx, rax
0x1003f3a66: mov rdi, r14
0x1003f3a69: jmp 0x1003f3d1d
0x1003f3a6e: lea r13, [rbp - 0xc8]
0x1003f3a75: mov rbx, rax
0x1003f3a78: jmp 0x1003f3b96
0x1003f3a7d: lea r13, [rbp - 0xc8]
0x1003f3a84: mov rbx, rax
0x1003f3a87: mov rdi, r15
0x1003f3a8a: jmp 0x1003f3d1d
0x1003f3a8f: jmp 0x1003f3aa7
0x1003f3a91: jmp 0x1003f3ab9
0x1003f3a93: jmp 0x1003f3aa7
0x1003f3a95: jmp 0x1003f3ab9
0x1003f3a97: jmp 0x1003f3aa7
0x1003f3a99: jmp 0x1003f3ab9
0x1003f3a9b: jmp 0x1003f3aa7
0x1003f3a9d: jmp 0x1003f3ab9
0x1003f3a9f: jmp 0x1003f3aa7
0x1003f3aa1: jmp 0x1003f3ab9
0x1003f3aa3: jmp 0x1003f3aa7
0x1003f3aa5: jmp 0x1003f3ab9
0x1003f3aa7: lea rbx, [rbp - 0xc8]
0x1003f3aae: mov r14, rbx
0x1003f3ab1: mov rbx, rax
0x1003f3ab4: jmp 0x1003f3be9
0x1003f3ab9: lea rbx, [rbp - 0xc8]
0x1003f3ac0: mov r14, rbx
0x1003f3ac3: mov rbx, rax
0x1003f3ac6: jmp 0x1003f3bfc
0x1003f3acb: jmp 0x1003f3ad3
0x1003f3acd: jmp 0x1003f3ae2
0x1003f3acf: jmp 0x1003f3ad3
0x1003f3ad1: jmp 0x1003f3ae2
0x1003f3ad3: lea r13, [rbp - 0xc8]
0x1003f3ada: mov rbx, rax
0x1003f3add: jmp 0x1003f3d03
0x1003f3ae2: lea r13, [rbp - 0xc8]
0x1003f3ae9: mov rbx, rax
0x1003f3aec: jmp 0x1003f3d16
0x1003f3af1: mov r14, rax
0x1003f3af4: lea rdi, [rbp - 0x468]
0x1003f3afb: mov rsi, qword ptr [rbp - 0x470]
0x1003f3b02: call 0x100aa23ba
0x1003f3b07: jmp 0x1003f3b0c
0x1003f3b09: mov r14, rax
0x1003f3b0c: mov rdi, rbx
0x1003f3b0f: call 0x100aa245c
0x1003f3b14: lea r15, [rbp - 0x260]
0x1003f3b1b: mov rcx, qword ptr [rbp - 0x480]
0x1003f3b22: mov rsi, qword ptr [rbp - 0x478]
0x1003f3b29: mov rbx, r14
0x1003f3b2c: jmp 0x1003f4194
0x1003f3b31: jmp 0x1003f4044
0x1003f3b36: jmp 0x1003f4044
0x1003f3b3b: jmp 0x1003f3b64
0x1003f3b3d: jmp 0x1003f3bbb
0x1003f3b3f: jmp 0x1003f3bbb
0x1003f3b41: jmp 0x1003f3bbb
0x1003f3b43: jmp 0x1003f3bbb
0x1003f3b45: jmp 0x1003f3bbb
0x1003f3b47: jmp 0x1003f3bbb
0x1003f3b49: jmp 0x1003f3c13
0x1003f3b4e: lea r14, [rbp - 0xc8]
0x1003f3b55: jmp 0x1003f3c8f
0x1003f3b5a: jmp 0x1003f3c85
0x1003f3b5f: jmp 0x1003f3cd5
0x1003f3b64: lea r13, [rbp - 0xc8]
0x1003f3b6b: mov rbx, rax
0x1003f3b6e: mov rax, qword ptr [rbp - 0x488]
0x1003f3b75: mov qword ptr [rbp - 0x468], rax
0x1003f3b7c: mov rax, qword ptr [rbp - 0x490]
0x1003f3b83: mov qword ptr [rbp - 0x318], rax
0x1003f3b8a: lea rdi, [rbp - 0x460]
0x1003f3b91: call 0x1007a58d0
0x1003f3b96: lea rdi, [rbp - 0x468]
0x1003f3b9d: mov rsi, qword ptr [rbp - 0x470]
0x1003f3ba4: call 0x100aa23ba
0x1003f3ba9: mov rdi, r15
0x1003f3bac: jmp 0x1003f3d1d
0x1003f3bb1: jmp 0x1003f3bbb
0x1003f3bb3: jmp 0x1003f3bbb
0x1003f3bb5: jmp 0x1003f3bbb
0x1003f3bb7: jmp 0x1003f3bbb
0x1003f3bb9: jmp 0x1003f3bbb
0x1003f3bbb: lea r14, [rbp - 0xc8]
0x1003f3bc2: mov rbx, rax
0x1003f3bc5: mov rax, qword ptr [rbp - 0x488]
0x1003f3bcc: mov qword ptr [rbp - 0x468], rax
0x1003f3bd3: mov rax, qword ptr [rbp - 0x490]
0x1003f3bda: mov qword ptr [rbp - 0x318], rax
0x1003f3be1: mov rdi, r15
0x1003f3be4: call 0x1007a58d0
0x1003f3be9: lea rdi, [rbp - 0x468]
0x1003f3bf0: mov rsi, qword ptr [rbp - 0x470]
0x1003f3bf7: call 0x100aa23ba
0x1003f3bfc: mov rdi, r13
0x1003f3bff: call 0x100aa245c
0x1003f3c04: mov r13, r14
0x1003f3c07: lea r15, [rbp - 0x260]
0x1003f3c0e: jmp 0x1003f4186
0x1003f3c13: lea r14, [rbp - 0xc8]
0x1003f3c1a: mov r12, rax
0x1003f3c1d: mov rax, qword ptr [rbp - 0x488]
0x1003f3c24: mov qword ptr [rbp - 0x468], rax
0x1003f3c2b: mov rax, qword ptr [rbp - 0x490]
0x1003f3c32: mov qword ptr [rbp - 0x318], rax
0x1003f3c39: mov rdi, rbx
0x1003f3c3c: call 0x1007a58d0
0x1003f3c41: lea rdi, [rbp - 0x468]
0x1003f3c48: mov rsi, qword ptr [rbp - 0x470]
0x1003f3c4f: call 0x100aa23ba
0x1003f3c54: mov rdi, r13
0x1003f3c57: call 0x100aa245c
0x1003f3c5c: mov r13, r14
0x1003f3c5f: lea r15, [rbp - 0x260]
0x1003f3c66: mov rcx, qword ptr [rbp - 0x480]
0x1003f3c6d: mov rsi, qword ptr [rbp - 0x478]
0x1003f3c74: mov rbx, r12
0x1003f3c77: jmp 0x1003f4194
0x1003f3c7c: lea r14, [rbp - 0xc8]
0x1003f3c83: jmp 0x1003f3c8f
0x1003f3c85: lea rbx, [rbp - 0xc8]
0x1003f3c8c: mov r14, rbx
0x1003f3c8f: mov rbx, rax
0x1003f3c92: mov rax, qword ptr [rbp - 0x488]
0x1003f3c99: mov qword ptr [rbp - 0x468], rax
0x1003f3ca0: mov rax, qword ptr [rbp - 0x490]
0x1003f3ca7: mov qword ptr [rbp - 0x318], rax
0x1003f3cae: mov rdi, r13
0x1003f3cb1: call 0x1007a58d0
0x1003f3cb6: lea rdi, [rbp - 0x468]
0x1003f3cbd: mov rsi, qword ptr [rbp - 0x470]
0x1003f3cc4: call 0x100aa23ba
0x1003f3cc9: lea rdi, [rbp - 0x318]
0x1003f3cd0: jmp 0x1003f3bff
0x1003f3cd5: lea r13, [rbp - 0xc8]
0x1003f3cdc: mov rbx, rax
0x1003f3cdf: mov rax, qword ptr [rbp - 0x488]
0x1003f3ce6: mov qword ptr [rbp - 0x468], rax
0x1003f3ced: mov rax, qword ptr [rbp - 0x490]
0x1003f3cf4: mov qword ptr [rbp - 0x318], rax
0x1003f3cfb: mov rdi, r15
0x1003f3cfe: call 0x1007a58d0
0x1003f3d03: lea rdi, [rbp - 0x468]
0x1003f3d0a: mov rsi, qword ptr [rbp - 0x470]
0x1003f3d11: call 0x100aa23ba
0x1003f3d16: lea rdi, [rbp - 0x318]
0x1003f3d1d: call 0x100aa245c
0x1003f3d22: lea r15, [rbp - 0x260]
0x1003f3d29: jmp 0x1003f4186
0x1003f3d2e: mov r14, rax
0x1003f3d31: mov rax, qword ptr [rbp - 0x488]
0x1003f3d38: mov qword ptr [rbp - 0x468], rax
0x1003f3d3f: mov qword ptr [rbp - 0x318], r12
0x1003f3d46: mov rdi, r15
0x1003f3d49: call 0x1007a58d0
0x1003f3d4e: lea rdi, [rbp - 0x468]
0x1003f3d55: mov rsi, qword ptr [rbp - 0x470]
0x1003f3d5c: call 0x100aa23ba
0x1003f3d61: mov rdi, rbx
0x1003f3d64: mov rbx, r14
0x1003f3d67: call 0x100aa245c
0x1003f3d6c: lea r15, [rbp - 0x260]
0x1003f3d73: mov rcx, qword ptr [rbp - 0x480]
0x1003f3d7a: mov rsi, qword ptr [rbp - 0x478]
0x1003f3d81: lea r13, [rbp - 0xc8]
0x1003f3d88: jmp 0x1003f4194
0x1003f3d8d: mov r14, rax
0x1003f3d90: jmp 0x1003f3db2
0x1003f3d92: mov r14, rax
0x1003f3d95: jmp 0x1003f3dc9
0x1003f3d97: mov rbx, rax
0x1003f3d9a: jmp 0x1003f3e05
0x1003f3d9c: mov rbx, rax
0x1003f3d9f: mov rdi, r15
0x1003f3da2: jmp 0x1003f41c4
0x1003f3da7: mov r14, rax
0x1003f3daa: mov rdi, r15
0x1003f3dad: call 0x1003f6ae0
0x1003f3db2: mov rsi, qword ptr [rip + 0x8167d7]
0x1003f3db9: add rsi, 8
0x1003f3dbd: lea rdi, [rbp - 0x268]
0x1003f3dc4: call 0x100aa23ba
0x1003f3dc9: mov rdi, r13
0x1003f3dcc: call 0x100aa245c
0x1003f3dd1: mov rbx, r14
0x1003f3dd4: jmp 0x1003f41c9
0x1003f3dd9: jmp 0x1003f40d1
0x1003f3dde: mov rbx, rax
0x1003f3de1: mov rax, qword ptr [rbp - 0x488]
0x1003f3de8: mov qword ptr [rbp - 0x268], rax
0x1003f3def: mov rax, qword ptr [rbp - 0x490]
0x1003f3df6: mov qword ptr [rbp - 0x118], rax
0x1003f3dfd: mov rdi, r13
0x1003f3e00: call 0x1007a58d0
0x1003f3e05: mov rsi, qword ptr [rip + 0x816774]
0x1003f3e0c: add rsi, 8
0x1003f3e10: lea rdi, [rbp - 0x268]
0x1003f3e17: call 0x100aa23ba
0x1003f3e1c: mov rdi, r15
0x1003f3e1f: jmp 0x1003f41c4
0x1003f3e24: jmp 0x1003f4044
0x1003f3e29: mov rdi, rax
0x1003f3e2c: call 0x100011bf0
0x1003f3e31: jmp 0x1003f3e35
0x1003f3e33: jmp 0x1003f3e35
0x1003f3e35: mov rbx, rax
0x1003f3e38: lea r15, [rbp - 0x260]
0x1003f3e3f: lea r12, [rbp - 0x460]
0x1003f3e46: jmp 0x1003f416a
0x1003f3e4b: jmp 0x1003f3fb0
0x1003f3e50: mov rbx, rax
0x1003f3e53: jmp 0x1003f416a
0x1003f3e58: mov rdi, rax
0x1003f3e5b: call 0x100011bf0
0x1003f3e60: mov rbx, rax
0x1003f3e63: lea r13, [rbp - 0xc8]
0x1003f3e6a: lea r15, [rbp - 0x260]
0x1003f3e71: jmp 0x1003f416a
0x1003f3e76: mov rdi, rax
0x1003f3e79: call 0x100011bf0
0x1003f3e7e: mov rdi, rax
0x1003f3e81: call 0x100011bf0
0x1003f3e86: mov rbx, rax
0x1003f3e89: lea r15, [rbp - 0x260]
0x1003f3e90: lea r13, [rbp - 0xc8]
0x1003f3e97: jmp 0x1003f3fe1
0x1003f3e9c: mov rdi, rax
0x1003f3e9f: call 0x100011bf0
0x1003f3ea4: mov rdi, rax
0x1003f3ea7: call 0x100011bf0
0x1003f3eac: mov rbx, rax
0x1003f3eaf: lea rdi, [rbp - 0x460]
0x1003f3eb6: call 0x100769850
0x1003f3ebb: mov r15, r12
0x1003f3ebe: lea r13, [rbp - 0xc8]
0x1003f3ec5: lea r12, [rbp - 0x460]
0x1003f3ecc: jmp 0x1003f40a1
0x1003f3ed1: mov rdi, rax
0x1003f3ed4: call 0x100011bf0
0x1003f3ed9: mov rbx, rax
0x1003f3edc: mov r15, r12
0x1003f3edf: lea r12, [rbp - 0x460]
0x1003f3ee6: jmp 0x1003f409a
0x1003f3eeb: jmp 0x1003f3f1d
0x1003f3eed: mov rbx, rax
0x1003f3ef0: jmp 0x1003f4064
0x1003f3ef5: mov rbx, rax
0x1003f3ef8: jmp 0x1003f416a
0x1003f3efd: mov rdi, rax
0x1003f3f00: call 0x100011bf0
0x1003f3f05: mov rbx, rax
0x1003f3f08: mov rdi, r12
0x1003f3f0b: call 0x100769850
0x1003f3f10: jmp 0x1003f416a
0x1003f3f15: mov rdi, rax
0x1003f3f18: call 0x100011bf0
0x1003f3f1d: mov rbx, rax
0x1003f3f20: jmp 0x1003f3fe1
0x1003f3f25: mov rbx, rax
0x1003f3f28: lea r13, [rbp - 0xc8]
0x1003f3f2f: jmp 0x1003f416a
0x1003f3f34: mov rdi, rax
0x1003f3f37: call 0x100011bf0
0x1003f3f3c: mov rdi, rax
0x1003f3f3f: call 0x100011bf0
0x1003f3f44: jmp 0x1003f4097
0x1003f3f49: mov rbx, rax
0x1003f3f4c: mov rdi, r12
0x1003f3f4f: call 0x100769850
0x1003f3f54: lea r15, [rbp - 0x260]
0x1003f3f5b: lea r13, [rbp - 0xc8]
0x1003f3f62: jmp 0x1003f3fe1
0x1003f3f64: mov rdi, rax
0x1003f3f67: call 0x100011bf0
0x1003f3f6c: mov rdi, rax
0x1003f3f6f: call 0x100011bf0
0x1003f3f74: jmp 0x1003f4097
0x1003f3f79: mov rdi, rax
0x1003f3f7c: call 0x100011bf0
0x1003f3f81: mov rbx, rax
0x1003f3f84: mov rdi, r12
0x1003f3f87: call 0x100769850
0x1003f3f8c: lea r13, [rbp - 0xc8]
0x1003f3f93: jmp 0x1003f40a1
0x1003f3f98: mov rdi, rax
0x1003f3f9b: call 0x100011bf0
0x1003f3fa0: jmp 0x1003f4097
0x1003f3fa5: mov rbx, rax
0x1003f3fa8: mov r15, r14
0x1003f3fab: jmp 0x1003f40a1
0x1003f3fb0: mov rbx, rax
0x1003f3fb3: lea r15, [rbp - 0x260]
0x1003f3fba: jmp 0x1003f416a
0x1003f3fbf: mov rdi, rax
0x1003f3fc2: call 0x100011bf0
0x1003f3fc7: mov rbx, rax
0x1003f3fca: jmp 0x1003f411b
0x1003f3fcf: mov rbx, rax
0x1003f3fd2: mov rdi, r12
0x1003f3fd5: call 0x100769850
0x1003f3fda: lea r13, [rbp - 0xc8]
0x1003f3fe1: mov rdi, r12
0x1003f3fe4: call 0x100769850
0x1003f3fe9: jmp 0x1003f416a
0x1003f3fee: mov rdi, rax
0x1003f3ff1: call 0x100011bf0
0x1003f3ff6: mov rdi, rax
0x1003f3ff9: call 0x100011bf0
0x1003f3ffe: mov rbx, rax
0x1003f4001: jmp 0x1003f412e
0x1003f4006: mov rbx, rax
0x1003f4009: mov rdi, r12
0x1003f400c: call 0x100769850
0x1003f4011: lea r13, [rbp - 0xc8]
0x1003f4018: jmp 0x1003f40a1
0x1003f401d: mov rdi, rax
0x1003f4020: call 0x100011bf0
0x1003f4025: mov rbx, rax
0x1003f4028: mov r13, r15
0x1003f402b: jmp 0x1003f4154
0x1003f4030: mov rbx, rax
0x1003f4033: mov r13, r15
0x1003f4036: lea r15, [rbp - 0x260]
0x1003f403d: jmp 0x1003f416a
0x1003f4042: jmp 0x1003f4044
0x1003f4044: mov rbx, rax
0x1003f4047: jmp 0x1003f4186
0x1003f404c: mov rbx, rax
0x1003f404f: lea r13, [rbp - 0xc8]
0x1003f4056: lea r15, [rbp - 0x260]
0x1003f405d: lea r12, [rbp - 0x460]
0x1003f4064: mov rdi, r12
0x1003f4067: call 0x100769850
0x1003f406c: jmp 0x1003f416a
0x1003f4071: mov rdi, rax
0x1003f4074: call 0x100011bf0
0x1003f4079: mov rbx, rax
0x1003f407c: mov rdi, r12
0x1003f407f: call 0x100769850
0x1003f4084: lea r13, [rbp - 0xc8]
0x1003f408b: jmp 0x1003f40a1
0x1003f408d: mov rdi, rax
0x1003f4090: call 0x100011bf0
0x1003f4095: jmp 0x1003f40f4
0x1003f4097: mov rbx, rax
0x1003f409a: lea r13, [rbp - 0xc8]
0x1003f40a1: mov rdi, r12
0x1003f40a4: call 0x100769850
0x1003f40a9: jmp 0x1003f416a
0x1003f40ae: mov rdi, rax
0x1003f40b1: call 0x100011bf0
0x1003f40b6: jmp 0x1003f40d1
0x1003f40b8: mov rbx, rax
0x1003f40bb: lea r12, [rbp - 0x460]
0x1003f40c2: mov r13, r15
0x1003f40c5: lea r15, [rbp - 0x260]
0x1003f40cc: jmp 0x1003f4162
0x1003f40d1: mov rbx, rax
0x1003f40d4: lea rdi, [rbp - 0x460]
0x1003f40db: call 0x100769850
0x1003f40e0: lea r15, [rbp - 0x260]
0x1003f40e7: jmp 0x1003f4186
0x1003f40ec: mov rdi, rax
0x1003f40ef: call 0x100011bf0
0x1003f40f4: mov rbx, rax
0x1003f40f7: mov rax, qword ptr [rbp - 0x488]
0x1003f40fe: mov qword ptr [rbp - 0x468], rax
0x1003f4105: mov rax, qword ptr [rbp - 0x490]
0x1003f410c: mov qword ptr [rbp - 0x318], rax
0x1003f4113: mov rdi, r13
0x1003f4116: call 0x1007a58d0
0x1003f411b: lea rdi, [rbp - 0x468]
0x1003f4122: mov rsi, qword ptr [rbp - 0x470]
0x1003f4129: call 0x100aa23ba
0x1003f412e: lea rdi, [rbp - 0x318]
0x1003f4135: call 0x100aa245c
0x1003f413a: lea r13, [rbp - 0xc8]
0x1003f4141: lea r15, [rbp - 0x260]
0x1003f4148: jmp 0x1003f4186
0x1003f414a: mov rbx, rax
0x1003f414d: lea r13, [rbp - 0xc8]
0x1003f4154: lea r15, [rbp - 0x260]
0x1003f415b: lea r12, [rbp - 0x460]
0x1003f4162: mov rdi, r12
0x1003f4165: call 0x100769850
0x1003f416a: mov rdi, r12
0x1003f416d: call 0x100769850
0x1003f4172: sub eax, dword ptr [rbp - 0x514]
0x1003f4178: mov rcx, qword ptr [rbp - 0x598]
0x1003f417f: add dword ptr [rbp + rcx*4 - 0x280], eax
0x1003f4186: mov rcx, qword ptr [rbp - 0x480]
0x1003f418d: mov rsi, qword ptr [rbp - 0x478]
0x1003f4194: mov qword ptr [rbp - 0x268], rsi
0x1003f419b: mov qword ptr [rbp - 0xc8], rcx
0x1003f41a2: mov rdi, r15
0x1003f41a5: call 0x1003f6ae0
0x1003f41aa: mov rsi, qword ptr [rip + 0x8163df]
0x1003f41b1: add rsi, 8
0x1003f41b5: lea rdi, [rbp - 0x268]
0x1003f41bc: call 0x100aa23ba
0x1003f41c1: mov rdi, r13
0x1003f41c4: call 0x100aa245c
0x1003f41c9: lea rdi, [rbp - 0x660]
0x1003f41d0: call 0x10076b810
0x1003f41d5: mov rdi, rbx
0x1003f41d8: call 0x100aa2192
0x1003f41dd: mov rdi, rax
0x1003f41e0: call 0x100011bf0
0x1003f41e5: mov rdi, rax
0x1003f41e8: call 0x100011bf0
0x1003f41ed: nop dword ptr [rax]
0x1003f41f0: push rbp
0x1003f41f1: mov rbp, rsp
0x1003f41f4: push r14
0x1003f41f6: push rbx
0x1003f41f7: mov rbx, rdi
0x1003f41fa: mov rax, qword ptr [rip + 0x81967f]
0x1003f4201: lea rcx, [rax + 0x18]
0x1003f4205: mov qword ptr [rbx], rcx
0x1003f4208: add rax, 0x40
0x1003f420c: mov qword ptr [rbx + 0x1a0], rax
0x1003f4213: lea rdi, [rbx + 8]
0x1003f4217: call 0x1003f6ae0
0x1003f421c: mov rsi, qword ptr [rip + 0x81636d]
0x1003f4223: add rsi, 8
0x1003f4227: lea r14, [rbx + 0x1a0]
0x1003f422e: mov rdi, rbx
0x1003f4231: call 0x100aa23ba
0x1003f4236: mov rdi, r14
0x1003f4239: pop rbx
0x1003f423a: pop r14
0x1003f423c: pop rbp
0x1003f423d: jmp 0x100aa245c
0x1003f4242: nop word ptr cs:[rax + rax]
0x1003f4250: push rbp
0x1003f4251: mov rbp, rsp
0x1003f4254: push r15
0x1003f4256: push r14
0x1003f4258: push r13
0x1003f425a: push r12
0x1003f425c: push rbx
0x1003f425d: sub rsp, 0x158
0x1003f4264: mov r13, rdi
0x1003f4267: mov qword ptr [rbp - 0x48], rsi
0x1003f426b: call 0x1007c6580
0x1003f4270: mov r14, rax
0x1003f4273: mov qword ptr [rbp - 0x128], 0
0x1003f427e: call 0x1003869c0
0x1003f4283: mov rbx, qword ptr [rax]
0x1003f4286: lea rsi, [rbp - 0x128]
0x1003f428d: lea rdx, [rbp - 0x48]
0x1003f4291: mov rdi, rax
0x1003f4294: mov rcx, r14
0x1003f4297: call qword ptr [rbx + 0x40]
0x1003f429a: mov rbx, qword ptr [rbp - 0x128]
0x1003f42a1: test rbx, rbx
0x1003f42a4: je 0x1003f42c5
0x1003f42a6: mov rax, qword ptr [rbx + 0x48]
0x1003f42aa: mov rax, qword ptr [rax + 0x330]
0x1003f42b1: mov al, byte ptr [rax + 0xd]
0x1003f42b4: mov byte ptr [r13 + 0x120], al
0x1003f42bb: test al, al
0x1003f42bd: jne 0x1003f4746
0x1003f42c3: jmp 0x1003f42cd
0x1003f42c5: mov byte ptr [r13 + 0x120], 0
0x1003f42cd: mov rax, qword ptr [rbp - 0x48]
0x1003f42d1: mov qword ptr [r13 + 0x230], rax
0x1003f42d8: lea r14, [r13 + 0x121]
0x1003f42df: test byte ptr [r13 + 0x70], 1
0x1003f42e4: jne 0x1003f42ef
0x1003f42e6: lea rcx, [r13 + 0x70]
0x1003f42ea: inc rcx
0x1003f42ed: jmp 0x1003f42f6
0x1003f42ef: mov rcx, qword ptr [r13 + 0x80]
0x1003f42f6: lea rdx, [rip + 0x79299c]
0x1003f42fd: mov esi, 0x100
0x1003f4302: xor eax, eax
0x1003f4304: mov rdi, r14
0x1003f4307: call 0x100aa2bd6
0x1003f430c: call 0x1007c6c20
0x1003f4311: lea rcx, [rip + 0x1c54838]
0x1003f4318: mov rdx, qword ptr [rcx]
0x1003f431b: mov esi, 0x8c
0x1003f4320: mov ecx, 1
0x1003f4325: mov rdi, rax
0x1003f4328: call 0x100795530
0x1003f432d: mov r15, rax
0x1003f4330: mov rax, qword ptr [rbp - 0x48]
0x1003f4334: mov rdi, qword ptr [rax + 0x10]
0x1003f4338: xor edx, edx
0x1003f433a: mov ecx, 0x8c
0x1003f433f: mov rsi, r14
0x1003f4342: mov r8, r15
0x1003f4345: call 0x1007f8ac0
0x1003f434a: lea rdi, [rbp - 0x128]
0x1003f4351: xor esi, esi
0x1003f4353: mov ecx, 0x8c
0x1003f4358: mov rdx, r15
0x1003f435b: call 0x10076b710
0x1003f4360: lea rdi, [rbp - 0x128]
0x1003f4367: lea rsi, [rbp - 0x70]
0x1003f436b: mov edx, 8
0x1003f4370: call 0x10076a0a0
0x1003f4375: lea rdi, [rbp - 0x128]
0x1003f437c: call 0x10076b900
0x1003f4381: mov qword ptr [rbp - 0x30], r15
0x1003f4385: mov eax, dword ptr [rbp - 0x6c]
0x1003f4388: mov dword ptr [r13 + 0x224], eax
0x1003f438f: cmp eax, 0x32
0x1003f4392: jbe 0x1003f4777
0x1003f4398: mov qword ptr [rbp - 0x68], r14
0x1003f439c: mov qword ptr [rbp - 0x60], rbx
0x1003f43a0: lea rdi, [rbp - 0x128]
0x1003f43a7: call 0x10076b930
0x1003f43ac: mov r14, rax
0x1003f43af: mov dword ptr [r13 + 0x238], 0
0x1003f43ba: mov cl, byte ptr [r14]
0x1003f43bd: mov byte ptr [rbp - 0x38], cl
0x1003f43c0: test cl, cl
0x1003f43c2: je 0x1003f46db
0x1003f43c8: xor r12d, r12d
0x1003f43cb: mov qword ptr [rbp - 0x40], r14
0x1003f43cf: mov qword ptr [rbp - 0x58], r13
0x1003f43d3: jmp 0x1003f4660
0x1003f43d8: nop dword ptr [rax + rax]
0x1003f43e0: mov rdi, rbx
0x1003f43e3: lea rsi, [rip + 0x79298c]
0x1003f43ea: call 0x100aa2cae
0x1003f43ef: test rax, rax
0x1003f43f2: je 0x1003f46cf
0x1003f43f8: movsxd r14, dword ptr [r14 + r15*4 + 0xc]
0x1003f43fd: call 0x1007c6c20
0x1003f4402: lea rcx, [rip + 0x1c54747]
0x1003f4409: mov rdx, qword ptr [rcx]
0x1003f440c: mov esi, 0xc00000
0x1003f4411: mov ecx, 1
0x1003f4416: mov rdi, rax
0x1003f4419: call 0x100795530
0x1003f441e: mov rbx, rax
0x1003f4421: mov rax, qword ptr [rbp - 0x40]
0x1003f4425: lea rax, [rax + r15*4 + 0xc]
0x1003f442a: mov qword ptr [rbp - 0x38], rax
0x1003f442e: mov rdi, r14
0x1003f4431: call 0x100aa28c4
0x1003f4436: mov rcx, rbx
0x1003f4439: mov rbx, r14
0x1003f443c: mov r14, rax
0x1003f443f: mov rax, qword ptr [r13 + 0x230]
0x1003f4446: mov r13, rcx
0x1003f4449: mov rdi, qword ptr [rax + 0x10]
0x1003f444d: mov rax, qword ptr [rbp - 0x40]
0x1003f4451: mov edx, dword ptr [rax + r15*4 + 8]
0x1003f4456: mov rax, qword ptr [rbp - 0x38]
0x1003f445a: mov ecx, dword ptr [rax]
0x1003f445c: mov rsi, qword ptr [rbp - 0x68]
0x1003f4460: mov r8, r14
0x1003f4463: mov qword ptr [rbp - 0x50], r13
0x1003f4467: call 0x1007f8ac0
0x1003f446c: mov edi, 1
0x1003f4471: mov r8d, 0xc00000
0x1003f4477: mov rsi, r14
0x1003f447a: mov rdx, r13
0x1003f447d: mov ecx, ebx
0x1003f447f: call 0x100780880
0x1003f4484: mov ebx, eax
0x1003f4486: mov rdi, r14
0x1003f4489: call 0x100aa2768
0x1003f448e: xor esi, esi
0x1003f4490: lea r15, [rbp - 0x170]
0x1003f4497: mov rdi, r15
0x1003f449a: mov rdx, r13
0x1003f449d: mov ecx, ebx
0x1003f449f: call 0x100769c80
0x1003f44a4: mov rbx, qword ptr [rbp - 0x58]
0x1003f44a8: mov rdi, qword ptr [rbx + 0x30]
0x1003f44ac: mov rdx, qword ptr [rip + 0x937b05]
0x1003f44b3: mov esi, 0x30
0x1003f44b8: mov ecx, 0x10
0x1003f44bd: call 0x100795530
0x1003f44c2: mov qword ptr [rbx + 0x110], rax
0x1003f44c9: mov rdi, r15
0x1003f44cc: mov rsi, rax
0x1003f44cf: call 0x10076a2a0
0x1003f44d4: mov rsi, qword ptr [rbx + 0x110]
0x1003f44db: add rsi, 4
0x1003f44df: mov rdi, r15
0x1003f44e2: call 0x10076a2a0
0x1003f44e7: mov rsi, qword ptr [rbx + 0x110]
0x1003f44ee: add rsi, 8
0x1003f44f2: mov rdi, r15
0x1003f44f5: call 0x10076a2a0
0x1003f44fa: mov rsi, qword ptr [rbx + 0x110]
0x1003f4501: add rsi, 0xc
0x1003f4505: mov rdi, r15
0x1003f4508: call 0x10076a2a0
0x1003f450d: mov rsi, qword ptr [rbx + 0x110]
0x1003f4514: add rsi, 0x10
0x1003f4518: mov rdi, r15
0x1003f451b: call 0x10076a280
0x1003f4520: mov rsi, qword ptr [rbx + 0x110]
0x1003f4527: add rsi, 0x14
0x1003f452b: mov rdi, r15
0x1003f452e: call 0x10076a280
0x1003f4533: mov rsi, qword ptr [rbx + 0x110]
0x1003f453a: add rsi, 0x18
0x1003f453e: mov rdi, r15
0x1003f4541: call 0x10076a280
0x1003f4546: mov rsi, qword ptr [rbx + 0x110]
0x1003f454d: add rsi, 0x1c
0x1003f4551: mov rdi, r15
0x1003f4554: call 0x10076a280
0x1003f4559: mov rdi, qword ptr [rbx + 0x30]
0x1003f455d: mov rax, qword ptr [rbx + 0x110]
0x1003f4564: mov esi, dword ptr [rax + 0x18]
0x1003f4567: imul esi, dword ptr [rax + 0x10]
0x1003f456b: shl rsi, 2
0x1003f456f: mov rdx, qword ptr [rip + 0x937a42]
0x1003f4576: mov ecx, 0x10
0x1003f457b: call 0x100795530
0x1003f4580: mov rcx, qword ptr [rbx + 0x110]
0x1003f4587: mov qword ptr [rcx + 0x20], rax
0x1003f458b: mov rdi, qword ptr [rbx + 0x30]
0x1003f458f: mov esi, dword ptr [rcx + 0x1c]
0x1003f4592: shl rsi, 2
0x1003f4596: mov rdx, qword ptr [rip + 0x937a1b]
0x1003f459d: mov ecx, 0x10
0x1003f45a2: call 0x100795530
0x1003f45a7: mov rcx, qword ptr [rbx + 0x110]
0x1003f45ae: mov qword ptr [rcx + 0x28], rax
0x1003f45b2: mov eax, dword ptr [rcx + 0x18]
0x1003f45b5: imul eax, dword ptr [rcx + 0x10]
0x1003f45b9: test eax, eax
0x1003f45bb: mov r13, rbx
0x1003f45be: je 0x1003f45f9
0x1003f45c0: xor r14d, r14d
0x1003f45c3: xor ebx, ebx
0x1003f45c5: nop word ptr cs:[rax + rax]
0x1003f45d0: mov rsi, qword ptr [rcx + 0x20]
0x1003f45d4: add rsi, r14
0x1003f45d7: mov rdi, r15
0x1003f45da: call 0x10076a280
0x1003f45df: inc rbx
0x1003f45e2: mov rcx, qword ptr [r13 + 0x110]
0x1003f45e9: mov eax, dword ptr [rcx + 0x18]
0x1003f45ec: imul eax, dword ptr [rcx + 0x10]
0x1003f45f0: add r14, 4
0x1003f45f4: cmp rbx, rax
0x1003f45f7: jb 0x1003f45d0
0x1003f45f9: cmp dword ptr [rcx + 0x1c], 0
0x1003f45fd: je 0x1003f4635
0x1003f45ff: xor r14d, r14d
0x1003f4602: xor ebx, ebx
0x1003f4604: nop word ptr cs:[rax + rax]
0x1003f4610: mov rsi, qword ptr [rcx + 0x28]
0x1003f4614: add rsi, r14
0x1003f4617: mov rdi, r15
0x1003f461a: call 0x10076a280
0x1003f461f: inc rbx
0x1003f4622: mov rcx, qword ptr [r13 + 0x110]
0x1003f4629: mov eax, dword ptr [rcx + 0x1c]
0x1003f462c: add r14, 4
0x1003f4630: cmp rbx, rax
0x1003f4633: jb 0x1003f4610
0x1003f4635: call 0x1007c6c20
0x1003f463a: mov rdi, rax
0x1003f463d: mov rsi, qword ptr [rbp - 0x50]
0x1003f4641: call 0x100795a70
0x1003f4646: mov r14, qword ptr [rbp - 0x40]
0x1003f464a: mov cl, byte ptr [r14]
0x1003f464d: mov byte ptr [rbp - 0x38], cl
0x1003f4650: jmp 0x1003f46cf
0x1003f4652: nop word ptr cs:[rax + rax]
0x1003f4660: mov r12d, r12d
0x1003f4663: lea r15, [r12 + r12*2]
0x1003f4667: lea rbx, [r14 + r15*4 + 4]
0x1003f466c: mov rdi, rbx
0x1003f466f: lea rsi, [rip + 0x782cce]
0x1003f4676: call 0x100aa2cae
0x1003f467b: test rax, rax
0x1003f467e: je 0x1003f43e0
0x1003f4684: mov ecx, dword ptr [r14 + r15*4 + 8]
0x1003f4689: mov edi, dword ptr [r13 + 0x238]
0x1003f4690: mov dword ptr [r13 + rdi*4 + 0x23c], ecx
0x1003f4698: mov edx, dword ptr [r14 + r15*4 + 0xc]
0x1003f469d: mov dword ptr [r13 + rdi*4 + 0x250], edx
0x1003f46a5: test rdi, rdi
0x1003f46a8: je 0x1003f46c5
0x1003f46aa: lea edx, [rdi - 1]
0x1003f46ad: mov esi, dword ptr [r13 + rdx*4 + 0x250]
0x1003f46b5: add esi, dword ptr [r13 + rdx*4 + 0x23c]
0x1003f46bd: cmp ecx, esi
0x1003f46bf: jne 0x1003f4758
0x1003f46c5: lea ecx, [rdi + 1]
0x1003f46c8: mov dword ptr [r13 + 0x238], ecx
0x1003f46cf: inc r12d
0x1003f46d2: movzx ecx, byte ptr [rbp - 0x38]
0x1003f46d6: cmp r12d, ecx
0x1003f46d9: jb 0x1003f4660
0x1003f46db: lea rsi, [r13 + 0xb0]
0x1003f46e2: lea rdi, [rbp - 0x128]
0x1003f46e9: call 0x10076a360
0x1003f46ee: lea rsi, [r13 + 0xc0]
0x1003f46f5: lea rdi, [rbp - 0x128]
0x1003f46fc: call 0x10076a360
0x1003f4701: lea rdi, [rbp - 0x128]
0x1003f4708: call 0x10076b940
0x1003f470d: lea rdi, [rbp - 0x128]
0x1003f4714: call 0x10076b810
0x1003f4719: call 0x1007c6c20
0x1003f471e: mov rbx, qword ptr [rbp - 0x60]
0x1003f4722: mov rdi, rax
0x1003f4725: mov rsi, qword ptr [rbp - 0x30]
0x1003f4729: call 0x100795a70
0x1003f472e: mov edx, dword ptr [r13 + 0xa0]
0x1003f4735: cmp edx, -1
0x1003f4738: je 0x1003f4746
0x1003f473a: mov rsi, qword ptr [rbx + 0x48]
0x1003f473e: mov rdi, r13
0x1003f4741: call 0x1003f4840
0x1003f4746: add rsp, 0x158
0x1003f474d: pop rbx
0x1003f474e: pop r12
0x1003f4750: pop r13
0x1003f4752: pop r14
0x1003f4754: pop r15
0x1003f4756: pop rbp
0x1003f4757: ret 
0x1003f4758: lea rdi, [rip + 0x79258e]
0x1003f475f: lea rsi, [rip + 0x7923a5]
0x1003f4766: mov edx, 0x201
0x1003f476b: mov ecx, 3
0x1003f4770: call 0x1007e5f70
0x1003f4775: jmp 0x1003f47b7
0x1003f4777: mov r9, r13
0x1003f477a: test byte ptr [r13 + 0x10], 1
0x1003f477f: jne 0x1003f478a
0x1003f4781: add r9, 0x10
0x1003f4785: inc r9
0x1003f4788: jmp 0x1003f478e
0x1003f478a: mov r9, qword ptr [r9 + 0x20]
0x1003f478e: mov dword ptr [rsp], eax
0x1003f4791: lea rdi, [rip + 0x792509]
0x1003f4798: lea rsi, [rip + 0x79236c]
0x1003f479f: lea r8, [rip + 0x79250c]
0x1003f47a6: mov edx, 0x1f4
0x1003f47ab: mov ecx, 4
0x1003f47b0: xor eax, eax
0x1003f47b2: call 0x1007e6030
0x1003f47b7: ud2 
0x1003f47b9: jmp 0x1003f47e0
0x1003f47bb: jmp 0x1003f47e0
0x1003f47bd: mov rdi, rax
0x1003f47c0: call 0x100011bf0
0x1003f47c5: mov r14, rax
0x1003f47c8: jmp 0x1003f4811
0x1003f47ca: mov r14, rax
0x1003f47cd: jmp 0x1003f4811
0x1003f47cf: mov r14, rax
0x1003f47d2: jmp 0x1003f4805
0x1003f47d4: jmp 0x1003f47e0
0x1003f47d6: mov rdi, rax
0x1003f47d9: call 0x100011bf0
0x1003f47de: jmp 0x1003f47ed
0x1003f47e0: mov r14, rax
0x1003f47e3: mov r15, qword ptr [rbp - 0x30]
0x1003f47e7: jmp 0x1003f4805
0x1003f47e9: jmp 0x1003f47ed
0x1003f47eb: jmp 0x1003f47ed
0x1003f47ed: mov r14, rax
0x1003f47f0: mov r15, qword ptr [rbp - 0x30]
0x1003f47f4: call 0x1007c6c20
0x1003f47f9: mov rdi, rax
0x1003f47fc: mov rsi, qword ptr [rbp - 0x50]
0x1003f4800: call 0x100795a70
0x1003f4805: lea rdi, [rbp - 0x128]
0x1003f480c: call 0x10076b810
0x1003f4811: call 0x1007c6c20
0x1003f4816: mov rdi, rax
0x1003f4819: mov rsi, r15
0x1003f481c: call 0x100795a70
0x1003f4821: mov rdi, r14
0x1003f4824: call 0x100aa2192
0x1003f4829: mov rdi, rax
0x1003f482c: call 0x100011bf0
0x1003f4831: mov rdi, rax
0x1003f4834: call 0x100011bf0
0x1003f4839: nop dword ptr [rax]
0x1003f4840: push rbp
0x1003f4841: mov rbp, rsp
0x1003f4844: push r15
0x1003f4846: push r14
0x1003f4848: push r13
0x1003f484a: push r12
0x1003f484c: push rbx
0x1003f484d: and rsp, 0xffffffffffffffe0
0x1003f4851: sub rsp, 0x2e0
0x1003f4858: mov r15d, edx
0x1003f485b: mov rbx, rdi
0x1003f485e: mov rax, qword ptr [rip + 0x819073]
0x1003f4865: mov rax, qword ptr [rax]
0x1003f4868: mov qword ptr [rsp + 0x2c0], rax
0x1003f4870: mov qword ptr [rsp + 0xe0], rsi
0x1003f4878: test rsi, rsi
0x1003f487b: je 0x1003f5c22
0x1003f4881: cmp dword ptr [rbx + 0x238], r15d
0x1003f4888: jbe 0x1003f5c4a
0x1003f488e: lea r14, [rbx + 0x10]
0x1003f4892: test byte ptr [rbx + 0x10], 1
0x1003f4896: jne 0x1003f489e
0x1003f4898: lea rcx, [r14 + 1]
0x1003f489c: jmp 0x1003f48a2
0x1003f489e: mov rcx, qword ptr [rbx + 0x20]
0x1003f48a2: lea rdx, [rip + 0x792526]
0x1003f48a9: lea rdi, [rsp + 0x1c0]
0x1003f48b1: mov esi, 0x100
0x1003f48b6: xor eax, eax
0x1003f48b8: mov r8d, r15d
0x1003f48bb: call 0x100aa2bd6
0x1003f48c0: lea r13, [rbx + 0x230]
0x1003f48c7: call 0x1007c6580
0x1003f48cc: mov r12, rax
0x1003f48cf: mov qword ptr [rsp + 0x100], 0
0x1003f48db: call 0x1003869c0
0x1003f48e0: mov qword ptr [rsp + 0x18], rbx
0x1003f48e5: mov rbx, qword ptr [rax]
0x1003f48e8: lea rsi, [rsp + 0x100]
0x1003f48f0: mov rdi, rax
0x1003f48f3: mov rdx, r13
0x1003f48f6: mov rcx, r12
0x1003f48f9: call qword ptr [rbx + 0x40]
0x1003f48fc: mov rdi, qword ptr [rsp + 0x18]
0x1003f4901: cmp byte ptr [rdi + 0x120], 0
0x1003f4908: je 0x1003f4931
0x1003f490a: mov rax, qword ptr [rip + 0x818fc7]
0x1003f4911: mov rax, qword ptr [rax]
0x1003f4914: cmp rax, qword ptr [rsp + 0x2c0]
0x1003f491c: jne 0x1003f5c1d
0x1003f4922: lea rsp, [rbp - 0x28]
0x1003f4926: pop rbx
0x1003f4927: pop r12
0x1003f4929: pop r13
0x1003f492b: pop r14
0x1003f492d: pop r15
0x1003f492f: pop rbp
0x1003f4930: ret 
0x1003f4931: mov qword ptr [rsp + 0xd8], r13
0x1003f4939: mov r13, qword ptr [rsp + 0x100]
0x1003f4941: cmp dword ptr [rdi + 0x264], 0
0x1003f4948: js 0x1003f4957
0x1003f494a: mov rax, qword ptr [rdi]
0x1003f494d: mov rsi, qword ptr [rdi + 0x230]
0x1003f4954: call qword ptr [rax + 0x18]
0x1003f4957: cmp r15d, 4
0x1003f495b: mov r12d, 4
0x1003f4961: cmovb r12d, r15d
0x1003f4965: lea rdi, [rsp + 0x1a0]
0x1003f496d: call 0x1007c2530
0x1003f4972: mov rax, qword ptr [rsp + 0xd8]
0x1003f497a: mov rax, qword ptr [rax]
0x1003f497d: mov rbx, qword ptr [rax + 0x38]
0x1003f4981: test byte ptr [r14], 1
0x1003f4985: jne 0x1003f498c
0x1003f4987: inc r14
0x1003f498a: jmp 0x1003f4995
0x1003f498c: mov rax, qword ptr [rsp + 0x18]
0x1003f4991: mov r14, qword ptr [rax + 0x20]
0x1003f4995: call 0x10040b090
0x1003f499a: mov rdi, rbx
0x1003f499d: mov rsi, rax
0x1003f49a0: mov rdx, r14
0x1003f49a3: call 0x1007c4360
0x1003f49a8: test rax, rax
0x1003f49ab: je 0x1003f49bf
0x1003f49ad: lea rsi, [rsp + 0x1a0]
0x1003f49b5: mov rdi, rax
0x1003f49b8: call 0x1007c2310
0x1003f49bd: jmp 0x1003f49d3
0x1003f49bf: call 0x10040b090
0x1003f49c4: mov rsi, qword ptr [rax + 8]
0x1003f49c8: mov rdi, rbx
0x1003f49cb: mov rdx, r14
0x1003f49ce: call 0x1007c4640
0x1003f49d3: mov rax, qword ptr [rsp + 0x1a0]
0x1003f49db: test rax, rax
0x1003f49de: mov qword ptr [rsp + 0x48], r13
0x1003f49e3: je 0x1003f4a01
0x1003f49e5: mov rax, qword ptr [rax + 0x10]
0x1003f49e9: test rax, rax
0x1003f49ec: je 0x1003f4a01
0x1003f49ee: mov rcx, qword ptr [rax + 0x3a8]
0x1003f49f5: mov eax, dword ptr [rax + 0x3b8]
0x1003f49fb: mov dword ptr [rsp + 0x50], eax
0x1003f49ff: jmp 0x1003f4a0b
0x1003f4a01: xor ecx, ecx
0x1003f4a03: mov dword ptr [rsp + 0x50], 0
0x1003f4a0b: mov qword ptr [rsp + 0xf8], rcx
0x1003f4a13: mov r13d, r12d
0x1003f4a16: mov rax, qword ptr [rsp + 0x18]
0x1003f4a1b: mov r14d, dword ptr [rax + r13*4 + 0x250]
0x1003f4a23: mov edi, 0xc00000
0x1003f4a28: call 0x100aa28c4
0x1003f4a2d: mov qword ptr [rsp + 0xe8], rax
0x1003f4a35: call 0x1007c6c20
0x1003f4a3a: lea rcx, [rip + 0x1c5410f]
0x1003f4a41: mov rdx, qword ptr [rcx]
0x1003f4a44: mov ecx, 1
0x1003f4a49: mov rdi, rax
0x1003f4a4c: mov rsi, r14
0x1003f4a4f: call 0x100795530
0x1003f4a54: mov r15, rax
0x1003f4a57: mov rbx, qword ptr [rsp + 0x18]
0x1003f4a5c: mov rax, qword ptr [rbx + 0x230]
0x1003f4a63: mov rdi, qword ptr [rax + 0x10]
0x1003f4a67: lea rsi, [rbx + 0x121]
0x1003f4a6e: mov edx, dword ptr [rbx + r13*4 + 0x23c]
0x1003f4a76: mov ecx, dword ptr [rbx + r13*4 + 0x250]
0x1003f4a7e: mov r8, r15
0x1003f4a81: call 0x1007f8ac0
0x1003f4a86: mov edi, 1
0x1003f4a8b: mov r8d, 0xc00000
0x1003f4a91: mov rsi, r15
0x1003f4a94: mov rdx, qword ptr [rsp + 0xe8]
0x1003f4a9c: mov ecx, r14d
0x1003f4a9f: call 0x100780880
0x1003f4aa4: mov r14d, eax
0x1003f4aa7: call 0x1007c6c20
0x1003f4aac: mov rdi, rax
0x1003f4aaf: mov rsi, r15
0x1003f4ab2: call 0x100795a70
0x1003f4ab7: lea rdi, [rsp + 0x70]
0x1003f4abc: xor esi, esi
0x1003f4abe: mov rdx, qword ptr [rsp + 0xe8]
0x1003f4ac6: mov ecx, r14d
0x1003f4ac9: call 0x100769c80
0x1003f4ace: lea r13, [rbx + 0xd0]
0x1003f4ad5: lea rdi, [rsp + 0x70]
0x1003f4ada: mov rsi, r13
0x1003f4add: call 0x10076a280
0x1003f4ae2: mov rdi, qword ptr [rbx + 0x30]
0x1003f4ae6: mov eax, dword ptr [rbx + 0xd0]
0x1003f4aec: shl rax, 4
0x1003f4af0: lea rsi, [rax + rax*2]
0x1003f4af4: mov rdx, qword ptr [rip + 0x93755d]
0x1003f4afb: mov ecx, 0x10
0x1003f4b00: call 0x100795530
0x1003f4b05: mov r14, rax
0x1003f4b08: mov qword ptr [rbx + 0xe8], r14
0x1003f4b0f: cmp dword ptr [rbx + 0xd0], 0
0x1003f4b16: mov dword ptr [rsp + 0x24], r12d
0x1003f4b1b: je 0x1003f4f67
0x1003f4b21: xor r15d, r15d
0x1003f4b24: vxorps ymm0, ymm0, ymm0
0x1003f4b28: lea rdi, [rsp + 0x70]
0x1003f4b2d: mov qword ptr [rsp + 0xc0], r13
0x1003f4b35: jmp 0x1003f4b7b
0x1003f4b37: lea rdi, [rsp + 0x100]
0x1003f4b3f: call 0x1007c2570
0x1003f4b44: mov r15, qword ptr [rsp + 0xc8]
0x1003f4b4c: inc r15
0x1003f4b4f: mov r13, qword ptr [rsp + 0xc0]
0x1003f4b57: cmp dword ptr [r13], r15d
0x1003f4b5b: mov rbx, qword ptr [rsp + 0x18]
0x1003f4b60: mov r12d, dword ptr [rsp + 0x24]
0x1003f4b65: jbe 0x1003f4f67
0x1003f4b6b: mov r14, qword ptr [rbx + 0xe8]
0x1003f4b72: vxorps ymm0, ymm0, ymm0
0x1003f4b76: lea rdi, [rsp + 0x70]
0x1003f4b7b: lea r12, [r15 + r15*2]
0x1003f4b7f: shl r12, 4
0x1003f4b83: lea rbx, [r14 + r12]
0x1003f4b87: vmovups ymmword ptr [r14 + r12 + 0x10], ymm0
0x1003f4b8e: vmovups ymmword ptr [r14 + r12], ymm0
0x1003f4b94: mov rsi, rbx
0x1003f4b97: vzeroupper 
0x1003f4b9a: call 0x10076a5d0
0x1003f4b9f: lea rdi, [rsp + 0x100]
0x1003f4ba7: call 0x1007c2530
0x1003f4bac: mov qword ptr [rsp + 0xc8], r15
0x1003f4bb4: mov rax, qword ptr [rsp + 0xd8]
0x1003f4bbc: mov rax, qword ptr [rax]
0x1003f4bbf: mov r15, qword ptr [rax + 0x38]
0x1003f4bc3: test byte ptr [rbx], 1
0x1003f4bc6: jne 0x1003f4bcd
0x1003f4bc8: inc rbx
0x1003f4bcb: jmp 0x1003f4bd2
0x1003f4bcd: mov rbx, qword ptr [r14 + r12 + 0x10]
0x1003f4bd2: call 0x1004559d0
0x1003f4bd7: lea r13, [rsp + 0x70]
0x1003f4bdc: mov rdi, r15
0x1003f4bdf: mov rsi, rax
0x1003f4be2: mov rdx, rbx
0x1003f4be5: call 0x1007c4360
0x1003f4bea: mov r15, rax
0x1003f4bed: test r15, r15
0x1003f4bf0: je 0x1003f4c28
0x1003f4bf2: mov rdi, r15
0x1003f4bf5: lea rsi, [rsp + 0x100]
0x1003f4bfd: call 0x1007c2310
0x1003f4c02: mov rax, qword ptr [rsp + 0x100]
0x1003f4c0a: test rax, rax
0x1003f4c0d: je 0x1003f5c75
0x1003f4c13: mov rax, qword ptr [rax + 0x10]
0x1003f4c17: test rax, rax
0x1003f4c1a: je 0x1003f5c75
0x1003f4c20: add rax, 0xa8
0x1003f4c26: jmp 0x1003f4c2a
0x1003f4c28: xor eax, eax
0x1003f4c2a: mov qword ptr [rsp + 0x28], rax
0x1003f4c2f: lea rbx, [r14 + r12 + 0x18]
0x1003f4c34: mov rdi, r13
0x1003f4c37: mov rsi, rbx
0x1003f4c3a: call 0x10076a240
0x1003f4c3f: lea rsi, [r14 + r12 + 0x1c]
0x1003f4c44: mov rdi, r13
0x1003f4c47: mov qword ptr [rsp + 0x38], rsi
0x1003f4c4c: call 0x10076a280
0x1003f4c51: lea rsi, [r14 + r12 + 0x20]
0x1003f4c56: mov rdi, r13
0x1003f4c59: mov qword ptr [rsp + 0x58], rsi
0x1003f4c5e: call 0x10076aae0
0x1003f4c63: test r15, r15
0x1003f4c66: jne 0x1003f4c6e
0x1003f4c68: mov dword ptr [rbx], 0xffffffff
0x1003f4c6e: mov rax, qword ptr [rsp + 0x18]
0x1003f4c73: mov rdi, qword ptr [rax + 0x30]
0x1003f4c77: mov rax, qword ptr [rsp + 0x38]
0x1003f4c7c: mov eax, dword ptr [rax]
0x1003f4c7e: shl rax, 3
0x1003f4c82: lea rsi, [rax + rax*2]
0x1003f4c86: mov rdx, qword ptr [rip + 0x9373cb]
0x1003f4c8d: mov ecx, 0x10
0x1003f4c92: call 0x100795530
0x1003f4c97: mov r15, rax
0x1003f4c9a: mov qword ptr [r14 + r12 + 0x28], r15
0x1003f4c9f: mov rax, qword ptr [rsp + 0x38]
0x1003f4ca4: cmp dword ptr [rax], 0
0x1003f4ca7: je 0x1003f4b37
0x1003f4cad: lea rax, [r14 + r12 + 0x28]
0x1003f4cb2: mov qword ptr [rsp + 0xd0], rax
0x1003f4cba: xor r13d, r13d
0x1003f4cbd: jmp 0x1003f4db5
0x1003f4cc2: call 0x1007c6c20
0x1003f4cc7: mov rdi, rax
0x1003f4cca: mov rsi, r15
0x1003f4ccd: call 0x100795a70
0x1003f4cd2: jmp 0x1003f4d99
0x1003f4cd7: nop word ptr [rax + rax]
0x1003f4ce0: call 0x1007c6c20
0x1003f4ce5: shl rbx, 2
0x1003f4ce9: lea rsi, [rbx + rbx*2]
0x1003f4ced: lea rcx, [rip + 0x1c53e5c]
0x1003f4cf4: mov rdx, qword ptr [rcx]
0x1003f4cf7: mov ecx, 4
0x1003f4cfc: mov rdi, rax
0x1003f4cff: call 0x100795530
0x1003f4d04: mov r15, rax
0x1003f4d07: mov ebx, dword ptr [r14]
0x1003f4d0a: call 0x1007c6c20
0x1003f4d0f: lea rcx, [rip + 0x1c53e3a]
0x1003f4d16: mov rdx, qword ptr [rcx]
0x1003f4d19: mov ecx, 1
0x1003f4d1e: mov rdi, rax
0x1003f4d21: mov rsi, rbx
0x1003f4d24: call 0x100795530
0x1003f4d29: mov r12, rax
0x1003f4d2c: mov eax, dword ptr [rsp + 0x40]
0x1003f4d30: shl eax, 2
0x1003f4d33: mov rcx, qword ptr [rsp + 0x58]
0x1003f4d38: cmp byte ptr [rcx], 0
0x1003f4d3b: lea edx, [rax + rax*2]
0x1003f4d3e: mov eax, 0xc
0x1003f4d43: cmovne edx, eax
0x1003f4d46: lea rbx, [rsp + 0x70]
0x1003f4d4b: mov rdi, rbx
0x1003f4d4e: mov rsi, r15
0x1003f4d51: call 0x10076a0a0
0x1003f4d56: mov edx, dword ptr [r14]
0x1003f4d59: mov rdi, rbx
0x1003f4d5c: mov rsi, r12
0x1003f4d5f: call 0x10076a0a0
0x1003f4d64: vxorps xmm0, xmm0, xmm0
0x1003f4d68: mov rax, qword ptr [rsp + 0x60]
0x1003f4d6d: vmovups xmmword ptr [rax], xmm0
0x1003f4d71: mov qword ptr [rax + 0x10], 0
0x1003f4d79: call 0x1007c6c20
0x1003f4d7e: mov rdi, rax
0x1003f4d81: mov rsi, r12
0x1003f4d84: call 0x100795a70
0x1003f4d89: call 0x1007c6c20
0x1003f4d8e: mov rdi, rax
0x1003f4d91: mov rsi, r15
0x1003f4d94: call 0x100795a70
0x1003f4d99: inc r13d
0x1003f4d9c: mov rax, qword ptr [rsp + 0x38]
0x1003f4da1: cmp r13d, dword ptr [rax]
0x1003f4da4: jae 0x1003f4b37
0x1003f4daa: mov rax, qword ptr [rsp + 0xd0]
0x1003f4db2: mov r15, qword ptr [rax]
0x1003f4db5: lea rbx, [rsp + 0x70]
0x1003f4dba: mov rdi, rbx
0x1003f4dbd: lea rsi, [rsp + 0x40]
0x1003f4dc2: call 0x10076a280
0x1003f4dc7: mov r13d, r13d
0x1003f4dca: lea r12, [r13 + r13*2]
0x1003f4dcf: lea r14, [r15 + r12*8 + 4]
0x1003f4dd4: mov rdi, rbx
0x1003f4dd7: mov rsi, r14
0x1003f4dda: call 0x10076a280
0x1003f4ddf: lea rax, [r15 + r12*8]
0x1003f4de3: mov qword ptr [rsp + 0x60], rax
0x1003f4de8: mov ebx, dword ptr [rsp + 0x40]
0x1003f4dec: mov rax, qword ptr [rsp + 0x28]
0x1003f4df1: test rax, rax
0x1003f4df4: je 0x1003f4ce0
0x1003f4dfa: mov rax, qword ptr [rax + 0x48]
0x1003f4dfe: imul rcx, r13, 0xb8
0x1003f4e05: cmp ebx, dword ptr [rax + rcx + 0x40]
0x1003f4e09: jne 0x1003f4ce0
0x1003f4e0f: mov qword ptr [rsp + 0xb8], rcx
0x1003f4e17: mov qword ptr [rsp + 0x30], r15
0x1003f4e1c: call 0x1007c6c20
0x1003f4e21: shl rbx, 2
0x1003f4e25: lea rsi, [rbx + rbx*2]
0x1003f4e29: lea rcx, [rip + 0x1c53d20]
0x1003f4e30: mov rdx, qword ptr [rcx]
0x1003f4e33: mov ecx, 4
0x1003f4e38: mov rdi, rax
0x1003f4e3b: call 0x100795530
0x1003f4e40: mov r15, rax
0x1003f4e43: mov rax, qword ptr [rsp + 0x18]
0x1003f4e48: mov rdi, qword ptr [rax + 0x30]
0x1003f4e4c: mov esi, dword ptr [r14]
0x1003f4e4f: mov rdx, qword ptr [rip + 0x937202]
0x1003f4e56: mov ecx, 0x10
0x1003f4e5b: call 0x100795530
0x1003f4e60: mov rcx, qword ptr [rsp + 0x30]
0x1003f4e65: mov qword ptr [rcx + r12*8 + 0x10], rax
0x1003f4e6a: mov eax, dword ptr [rsp + 0x40]
0x1003f4e6e: shl eax, 2
0x1003f4e71: mov rcx, qword ptr [rsp + 0x58]
0x1003f4e76: cmp byte ptr [rcx], 0
0x1003f4e79: lea edx, [rax + rax*2]
0x1003f4e7c: mov eax, 0xc
0x1003f4e81: cmovne edx, eax
0x1003f4e84: lea rdi, [rsp + 0x70]
0x1003f4e89: mov rsi, r15
0x1003f4e8c: call 0x10076a0a0
0x1003f4e91: mov rax, qword ptr [rsp + 0x30]
0x1003f4e96: lea rax, [rax + r12*8 + 0x10]
0x1003f4e9b: mov rsi, qword ptr [rax]
0x1003f4e9e: mov edx, dword ptr [r14]
0x1003f4ea1: lea rdi, [rsp + 0x70]
0x1003f4ea6: call 0x10076a0a0
0x1003f4eab: mov rax, qword ptr [rsp + 0x28]
0x1003f4eb0: mov rax, qword ptr [rax + 0x48]
0x1003f4eb4: mov rcx, qword ptr [rsp + 0xb8]
0x1003f4ebc: mov eax, dword ptr [rax + rcx + 0x34]
0x1003f4ec0: mov rcx, qword ptr [rsp + 0x60]
0x1003f4ec5: mov dword ptr [rcx], eax
0x1003f4ec7: mov rcx, qword ptr [rsp + 0x18]
0x1003f4ecc: mov rdi, qword ptr [rcx + 0x30]
0x1003f4ed0: shl rax, 2
0x1003f4ed4: lea rsi, [rax + rax*2]
0x1003f4ed8: mov rdx, qword ptr [rip + 0x937179]
0x1003f4edf: mov ecx, 0x10
0x1003f4ee4: call 0x100795530
0x1003f4ee9: mov rcx, qword ptr [rsp + 0x30]
0x1003f4eee: mov qword ptr [rcx + r12*8 + 8], rax
0x1003f4ef3: mov rbx, qword ptr [rsp + 0x60]
0x1003f4ef8: cmp dword ptr [rbx], 0
0x1003f4efb: mov r8, qword ptr [rsp + 0x28]
0x1003f4f00: mov r9, qword ptr [rsp + 0x58]
0x1003f4f05: mov r10, qword ptr [rsp + 0xb8]
0x1003f4f0d: je 0x1003f4cc2
0x1003f4f13: xor ecx, ecx
0x1003f4f15: nop word ptr cs:[rax + rax]
0x1003f4f20: cmp byte ptr [r9], 0
0x1003f4f24: je 0x1003f4f30
0x1003f4f26: mov edx, ecx
0x1003f4f28: xor esi, esi
0x1003f4f2a: jmp 0x1003f4f41
0x1003f4f2c: nop dword ptr [rax]
0x1003f4f30: mov rdx, qword ptr [r8 + 0x48]
0x1003f4f34: mov rsi, qword ptr [rdx + r10 + 0x98]
0x1003f4f3c: mov edx, ecx
0x1003f4f3e: mov esi, dword ptr [rsi + rdx*4]
0x1003f4f41: mov esi, esi
0x1003f4f43: lea rsi, [rsi + rsi*2]
0x1003f4f47: lea rdx, [rdx + rdx*2]
0x1003f4f4b: mov edi, dword ptr [r15 + rsi*4 + 8]
0x1003f4f50: mov dword ptr [rax + rdx*4 + 8], edi
0x1003f4f54: mov rsi, qword ptr [r15 + rsi*4]
0x1003f4f58: mov qword ptr [rax + rdx*4], rsi
0x1003f4f5c: inc ecx
0x1003f4f5e: cmp ecx, dword ptr [rbx]
0x1003f4f60: jb 0x1003f4f20
0x1003f4f62: jmp 0x1003f4cc2
0x1003f4f67: lea r13, [rbx + 0xd4]
0x1003f4f6e: lea rdi, [rsp + 0x70]
0x1003f4f73: mov rsi, r13
0x1003f4f76: call 0x10076a280
0x1003f4f7b: mov rdi, qword ptr [rbx + 0x30]
0x1003f4f7f: mov eax, dword ptr [rbx + 0xd4]
0x1003f4f85: imul rsi, rax, 0xd0
0x1003f4f8c: mov rdx, qword ptr [rip + 0x937045]
0x1003f4f93: mov ecx, 0x10
0x1003f4f98: call 0x100795530
0x1003f4f9d: mov qword ptr [rbx + 0xf0], rax
0x1003f4fa4: mov ecx, dword ptr [rbx + 0xd4]
0x1003f4faa: imul rsi, rcx, 0xd0
0x1003f4fb1: mov rdi, rax
0x1003f4fb4: call 0x100aa24aa
0x1003f4fb9: cmp dword ptr [rbx + 0xd4], 0
0x1003f4fc0: je 0x1003f5653
0x1003f4fc6: mov ecx, dword ptr [rsp + 0x50]
0x1003f4fca: mov rdx, qword ptr [rsp + 0xf8]
0x1003f4fd2: lea rax, [rdx + rcx*8]
0x1003f4fd6: mov qword ptr [rsp + 0xc0], rax
0x1003f4fde: cmp qword ptr [rsp + 0x48], 0
0x1003f4fe4: setne al
0x1003f4fe7: test rdx, rdx
0x1003f4fea: setne dl
0x1003f4fed: and dl, al
0x1003f4fef: mov byte ptr [rsp + 0xd0], dl
0x1003f4ff6: mov qword ptr [rsp + 0x50], rcx
0x1003f4ffb: shl rcx, 3
0x1003f4fff: mov qword ptr [rsp + 0xc8], rcx
0x1003f5007: xor eax, eax
0x1003f5009: mov qword ptr [rsp + 0x30], rax
0x1003f500e: lea r14, [rsp + 0x70]
0x1003f5013: lea rax, [rsp + 0x6c]
0x1003f5018: mov qword ptr [rsp + 0xb8], r13
0x1003f5020: mov rdi, r14
0x1003f5023: mov rsi, rax
0x1003f5026: call 0x10076a280
0x1003f502b: mov r15d, dword ptr [rsp + 0x6c]
0x1003f5030: cmp r15d, -1
0x1003f5034: setne al
0x1003f5037: and al, byte ptr [rsp + 0xd0]
0x1003f503e: cmp al, 1
0x1003f5040: jne 0x1003f50e3
0x1003f5046: mov rax, qword ptr [rsp + 0xf8]
0x1003f504e: mov r14, rax
0x1003f5051: cmp dword ptr [rsp + 0x50], 0
0x1003f5056: mov r13, rbx
0x1003f5059: je 0x1003f50ec
0x1003f505f: mov r12, qword ptr [rsp + 0xc8]
0x1003f5067: mov r14, rax
0x1003f506a: nop word ptr [rax + rax]
0x1003f5070: mov rax, qword ptr [r14]
0x1003f5073: mov qword ptr [rsp + 0x40], rax
0x1003f5078: call 0x1007abc10
0x1003f507d: mov rbx, rax
0x1003f5080: mov qword ptr [rsp + 0x100], 0
0x1003f508c: call 0x1006aea90
0x1003f5091: mov r8, qword ptr [rax]
0x1003f5094: mov rdi, rax
0x1003f5097: lea rsi, [rsp + 0x100]
0x1003f509f: lea rdx, [rsp + 0x40]
0x1003f50a4: mov rcx, rbx
0x1003f50a7: call qword ptr [r8 + 0x40]
0x1003f50ab: mov rax, qword ptr [rsp + 0x100]
0x1003f50b3: test rax, rax
0x1003f50b6: je 0x1003f50cd
0x1003f50b8: cmp dword ptr [rax + 4], r15d
0x1003f50bc: mov rbx, r13
0x1003f50bf: je 0x1003f50e7
0x1003f50c1: add r14, 8
0x1003f50c5: add r12, -8
0x1003f50c9: jne 0x1003f5070
0x1003f50cb: jmp 0x1003f50da
0x1003f50cd: mov rbx, r13
0x1003f50d0: add r14, 8
0x1003f50d4: add r12, -8
0x1003f50d8: jne 0x1003f5070
0x1003f50da: xor eax, eax
0x1003f50dc: mov r12d, dword ptr [rsp + 0x24]
0x1003f50e1: jmp 0x1003f5136
0x1003f50e3: xor eax, eax
0x1003f50e5: jmp 0x1003f513b
0x1003f50e7: mov r12d, dword ptr [rsp + 0x24]
0x1003f50ec: cmp r14, qword ptr [rsp + 0xc0]
0x1003f50f4: je 0x1003f5134
0x1003f50f6: call 0x1007abc10
0x1003f50fb: mov rbx, rax
0x1003f50fe: mov qword ptr [rsp + 0x100], 0
0x1003f510a: call 0x1006aea90
0x1003f510f: mov r8, qword ptr [rax]
0x1003f5112: mov rdi, rax
0x1003f5115: lea rsi, [rsp + 0x100]
0x1003f511d: mov rdx, r14
0x1003f5120: mov rcx, rbx
0x1003f5123: call qword ptr [r8 + 0x40]
0x1003f5127: mov rax, qword ptr [rsp + 0x100]
0x1003f512f: mov rbx, r13
0x1003f5132: jmp 0x1003f5136
0x1003f5134: xor eax, eax
0x1003f5136: lea r14, [rsp + 0x70]
0x1003f513b: mov rcx, qword ptr [rbx + 0xf0]
0x1003f5142: imul r15, qword ptr [rsp + 0x30], 0xd0
0x1003f514b: mov qword ptr [rcx + r15 + 0xb8], rax
0x1003f5153: lea rsi, [rcx + r15 + 0xc0]
0x1003f515b: mov rdi, r14
0x1003f515e: call 0x10076aae0
0x1003f5163: mov rax, qword ptr [rbx + 0xf0]
0x1003f516a: lea rsi, [rax + r15 + 0xc1]
0x1003f5172: mov rdi, r14
0x1003f5175: call 0x10076aae0
0x1003f517a: mov rsi, qword ptr [rbx + 0xf0]
0x1003f5181: test r12d, r12d
0x1003f5184: je 0x1003f518f
0x1003f5186: mov byte ptr [rsi + r15 + 0xc1], 1
0x1003f518f: add rsi, r15
0x1003f5192: mov rdi, r14
0x1003f5195: call 0x10076a360
0x1003f519a: mov rax, qword ptr [rbx + 0xf0]
0x1003f51a1: lea rsi, [rax + r15 + 0x10]
0x1003f51a6: mov rdi, r14
0x1003f51a9: call 0x10076a360
0x1003f51ae: mov rax, qword ptr [rbx + 0xf0]
0x1003f51b5: lea rsi, [rax + r15 + 0x20]
0x1003f51ba: mov rdi, r14
0x1003f51bd: call 0x10076a280
0x1003f51c2: mov rax, qword ptr [rbx + 0xf0]
0x1003f51c9: lea rsi, [rax + r15 + 0x24]
0x1003f51ce: mov rdi, r14
0x1003f51d1: call 0x10076a280
0x1003f51d6: mov rdi, qword ptr [rbx + 0x30]
0x1003f51da: mov rax, qword ptr [rbx + 0xf0]
0x1003f51e1: mov eax, dword ptr [rax + r15 + 0x20]
0x1003f51e6: shl rax, 2
0x1003f51ea: lea rsi, [rax + rax*8]
0x1003f51ee: mov rdx, qword ptr [rip + 0x936de3]
0x1003f51f5: mov ecx, 0x10
0x1003f51fa: call 0x100795530
0x1003f51ff: mov r14, rbx
0x1003f5202: mov rbx, rax
0x1003f5205: mov rax, qword ptr [r14 + 0xf0]
0x1003f520c: mov eax, dword ptr [rax + r15 + 0x20]
0x1003f5211: shl eax, 2
0x1003f5214: lea edx, [rax + rax*8]
0x1003f5217: lea rdi, [rsp + 0x70]
0x1003f521c: mov rsi, rbx
0x1003f521f: call 0x10076a0a0
0x1003f5224: mov rax, qword ptr [r14 + 0xf0]
0x1003f522b: mov qword ptr [rax + r15 + 0x28], rbx
0x1003f5230: lea rsi, [rax + r15 + 0x38]
0x1003f5235: lea rdi, [rsp + 0x70]
0x1003f523a: call 0x10076a280
0x1003f523f: mov rdi, qword ptr [r14 + 0x30]
0x1003f5243: mov rax, qword ptr [r14 + 0xf0]
0x1003f524a: mov esi, dword ptr [rax + r15 + 0x38]
0x1003f524f: mov rdx, qword ptr [rip + 0x936d82]
0x1003f5256: mov ecx, 0x10
0x1003f525b: call 0x100795530
0x1003f5260: mov rbx, rax
0x1003f5263: lea r12, [rsp + 0x70]
0x1003f5268: mov rax, qword ptr [r14 + 0xf0]
0x1003f526f: mov edx, dword ptr [rax + r15 + 0x38]
0x1003f5274: mov rdi, r12
0x1003f5277: mov rsi, rbx
0x1003f527a: call 0x10076a0a0
0x1003f527f: mov r13, r14
0x1003f5282: mov r13, qword ptr [r13 + 0xf0]
0x1003f5289: mov qword ptr [r13 + r15 + 0x40], rbx
0x1003f528e: lea rsi, [r13 + r15 + 0x50]
0x1003f5293: mov rdi, r12
0x1003f5296: call 0x10076a360
0x1003f529b: mov r14, r12
0x1003f529e: lea rsi, [r13 + r15 + 0x60]
0x1003f52a3: mov rdi, r14
0x1003f52a6: call 0x10076a360
0x1003f52ab: lea rsi, [r13 + r15 + 0x70]
0x1003f52b0: mov rdi, r14
0x1003f52b3: call 0x10076a2a0
0x1003f52b8: lea rsi, [r13 + r15 + 0x74]
0x1003f52bd: mov rdi, r14
0x1003f52c0: call 0x10076a280
0x1003f52c5: lea rsi, [r13 + r15 + 0x78]
0x1003f52ca: mov rdi, r14
0x1003f52cd: call 0x10076a280
0x1003f52d2: lea rsi, [r13 + r15 + 0x7c]
0x1003f52d7: mov rdi, r14
0x1003f52da: call 0x10076a280
0x1003f52df: lea rbx, [r13 + r15 + 0x80]
0x1003f52e7: mov rdi, r14
0x1003f52ea: mov rsi, rbx
0x1003f52ed: call 0x10076a280
0x1003f52f2: mov rax, qword ptr [rsp + 0x18]
0x1003f52f7: mov rdi, qword ptr [rax + 0x30]
0x1003f52fb: mov esi, dword ptr [rbx]
0x1003f52fd: shl rsi, 3
0x1003f5301: mov rdx, qword ptr [rip + 0x936cd0]
0x1003f5308: mov ecx, 0x10
0x1003f530d: call 0x100795530
0x1003f5312: mov qword ptr [r13 + r15 + 0x88], rax
0x1003f531a: mov edx, dword ptr [rbx]
0x1003f531c: shl edx, 3
0x1003f531f: mov rdi, r14
0x1003f5322: mov rsi, rax
0x1003f5325: call 0x10076a0a0
0x1003f532a: mov qword ptr [rsp + 0x198], rbx
0x1003f5332: mov rax, qword ptr [rsp + 0x18]
0x1003f5337: mov rbx, qword ptr [rax + 0xf0]
0x1003f533e: lea rsi, [rbx + r15 + 0x90]
0x1003f5346: mov rdi, r14
0x1003f5349: mov qword ptr [rsp + 0x48], rsi
0x1003f534e: call 0x10076a280
0x1003f5353: lea rsi, [rbx + r15 + 0x94]
0x1003f535b: mov rdi, r14
0x1003f535e: mov r12, rsi
0x1003f5361: call 0x10076a280
0x1003f5366: lea rsi, [rbx + r15 + 0x98]
0x1003f536e: mov rdi, r14
0x1003f5371: mov qword ptr [rsp + 0x28], rsi
0x1003f5376: call 0x10076a280
0x1003f537b: mov rax, qword ptr [rsp + 0x18]
0x1003f5380: mov rdi, qword ptr [rax + 0x30]
0x1003f5384: mov rax, qword ptr [rsp + 0x48]
0x1003f5389: mov esi, dword ptr [rax]
0x1003f538b: shl rsi, 2
0x1003f538f: mov rdx, qword ptr [rip + 0x936c42]
0x1003f5396: mov ecx, 0x10
0x1003f539b: call 0x100795530
0x1003f53a0: mov qword ptr [rbx + r15 + 0xb0], rax
0x1003f53a8: mov rax, qword ptr [rsp + 0x18]
0x1003f53ad: mov rdi, qword ptr [rax + 0x30]
0x1003f53b1: mov esi, dword ptr [r12]
0x1003f53b5: shl rsi, 2
0x1003f53b9: mov rdx, qword ptr [rip + 0x936c18]
0x1003f53c0: mov ecx, 0x10
0x1003f53c5: call 0x100795530
0x1003f53ca: mov qword ptr [rbx + r15 + 0xa0], rax
0x1003f53d2: mov rax, qword ptr [rsp + 0x18]
0x1003f53d7: mov rdi, qword ptr [rax + 0x30]
0x1003f53db: mov rax, qword ptr [rsp + 0x28]
0x1003f53e0: mov esi, dword ptr [rax]
0x1003f53e2: add rsi, rsi
0x1003f53e5: mov rdx, qword ptr [rip + 0x936bec]
0x1003f53ec: mov ecx, 0x10
0x1003f53f1: call 0x100795530
0x1003f53f6: lea rcx, [rbx + r15 + 0xa0]
0x1003f53fe: mov qword ptr [rbx + r15 + 0xa8], rax
0x1003f5406: mov qword ptr [rsp + 0x60], rcx
0x1003f540b: mov rsi, qword ptr [rcx]
0x1003f540e: mov edx, dword ptr [r12]
0x1003f5412: shl edx, 2
0x1003f5415: mov rdi, r14
0x1003f5418: call 0x10076a0a0
0x1003f541d: lea rax, [rbx + r15 + 0xa8]
0x1003f5425: mov qword ptr [rsp + 0x58], rax
0x1003f542a: mov rsi, qword ptr [rax]
0x1003f542d: mov rax, qword ptr [rsp + 0x28]
0x1003f5432: mov edx, dword ptr [rax]
0x1003f5434: add edx, edx
0x1003f5436: mov rdi, r14
0x1003f5439: call 0x10076a0a0
0x1003f543e: lea rax, [rbx + r15 + 0xb0]
0x1003f5446: mov qword ptr [rsp + 0x38], rax
0x1003f544b: mov rsi, qword ptr [rax]
0x1003f544e: mov rax, qword ptr [rsp + 0x48]
0x1003f5453: mov edx, dword ptr [rax]
0x1003f5455: shl edx, 2
0x1003f5458: mov rdi, r14
0x1003f545b: call 0x10076a0a0
0x1003f5460: mov rax, qword ptr [rsp + 0x18]
0x1003f5465: mov rdi, qword ptr [rax + 0x30]
0x1003f5469: mov rax, qword ptr [rax + 0xf0]
0x1003f5470: mov esi, dword ptr [rax + r15 + 0x24]
0x1003f5475: add rsi, rsi
0x1003f5478: cmp dword ptr [r12], 0
0x1003f547d: mov rdx, qword ptr [rip + 0x936b54]
0x1003f5484: je 0x1003f55ef
0x1003f548a: mov rbx, qword ptr [rsp + 0x198]
0x1003f5492: mov ecx, 0x10
0x1003f5497: call 0x100795530
0x1003f549c: mov r12, rax
0x1003f549f: mov rax, qword ptr [rsp + 0x28]
0x1003f54a4: mov ecx, dword ptr [rax]
0x1003f54a6: mov rax, qword ptr [rsp + 0x18]
0x1003f54ab: mov rax, qword ptr [rax + 0xf0]
0x1003f54b2: mov qword ptr [rsp + 0x48], rax
0x1003f54b7: mov dword ptr [rsp + 0xf4], ecx
0x1003f54be: cmp ecx, dword ptr [rax + r15 + 0x24]
0x1003f54c3: jne 0x1003f5c94
0x1003f54c9: mov r10d, dword ptr [rbx]
0x1003f54cc: test r10d, r10d
0x1003f54cf: je 0x1003f55d6
0x1003f54d5: lea rax, [r13 + r15 + 0x88]
0x1003f54dd: mov rax, qword ptr [rax]
0x1003f54e0: mov qword ptr [rsp + 0x28], rax
0x1003f54e5: xor ecx, ecx
0x1003f54e7: xor edi, edi
0x1003f54e9: xor r9d, r9d
0x1003f54ec: nop dword ptr [rax]
0x1003f54f0: mov r11d, ecx
0x1003f54f3: mov rax, qword ptr [rsp + 0x28]
0x1003f54f8: mov r8d, dword ptr [rax + r11*8]
0x1003f54fc: test r8d, r8d
0x1003f54ff: je 0x1003f55bd
0x1003f5505: mov rax, qword ptr [rsp + 0x58]
0x1003f550a: mov rsi, qword ptr [rax]
0x1003f550d: mov rax, qword ptr [rsp + 0x60]
0x1003f5512: mov rcx, qword ptr [rax]
0x1003f5515: mov r14d, r8d
0x1003f5518: and r14d, 1
0x1003f551c: cmp r8d, 1
0x1003f5520: je 0x1003f5583
0x1003f5522: mov r13d, r14d
0x1003f5525: sub r13d, r8d
0x1003f5528: nop dword ptr [rax + rax]
0x1003f5530: mov ebx, edi
0x1003f5532: movzx eax, word ptr [rsi + rbx*2]
0x1003f5536: mov edx, eax
0x1003f5538: shr edx, 1
0x1003f553a: add edx, r9d
0x1003f553d: test al, 1
0x1003f553f: lea rax, [rcx + rdx*4]
0x1003f5543: lea rdx, [rcx + rdx*4 + 2]
0x1003f5548: cmove rdx, rax
0x1003f554c: movzx eax, word ptr [rdx]
0x1003f554f: mov word ptr [r12 + rbx*2], ax
0x1003f5554: lea eax, [rdi + 1]
0x1003f5557: movzx edx, word ptr [rsi + rax*2]
0x1003f555b: mov ebx, edx
0x1003f555d: shr ebx, 1
0x1003f555f: add ebx, r9d
0x1003f5562: test dl, 1
0x1003f5565: lea rdx, [rcx + rbx*4]
0x1003f5569: lea rbx, [rcx + rbx*4 + 2]
0x1003f556e: cmove rbx, rdx
0x1003f5572: movzx edx, word ptr [rbx]
0x1003f5575: mov word ptr [r12 + rax*2], dx
0x1003f557a: add edi, 2
0x1003f557d: add r13d, 2
0x1003f5581: jne 0x1003f5530
0x1003f5583: test r14d, r14d
0x1003f5586: lea r14, [rsp + 0x70]
0x1003f558b: je 0x1003f55bd
0x1003f558d: mov r8d, edi
0x1003f5590: movzx r14d, word ptr [rsi + r8*2]
0x1003f5595: mov esi, r14d
0x1003f5598: shr esi, 1
0x1003f559a: add esi, r9d
0x1003f559d: test r14b, 1
0x1003f55a1: lea r14, [rcx + rsi*4]
0x1003f55a5: lea rcx, [rcx + rsi*4 + 2]
0x1003f55aa: cmove rcx, r14
0x1003f55ae: lea r14, [rsp + 0x70]
0x1003f55b3: movzx ecx, word ptr [rcx]
0x1003f55b6: mov word ptr [r12 + r8*2], cx
0x1003f55bb: inc edi
0x1003f55bd: mov rax, qword ptr [rsp + 0x38]
0x1003f55c2: mov rcx, qword ptr [rax]
0x1003f55c5: add r9d, dword ptr [rcx + r11*4]
0x1003f55c9: lea ecx, [r11 + 1]
0x1003f55cd: cmp ecx, r10d
0x1003f55d0: jb 0x1003f54f0
0x1003f55d6: cmp dword ptr [rsp + 0xf4], 0
0x1003f55de: mov rbx, qword ptr [rsp + 0x18]
0x1003f55e3: mov rdx, qword ptr [rsp + 0x48]
0x1003f55e8: jne 0x1003f5621
0x1003f55ea: jmp 0x1003f5cb3
0x1003f55ef: mov ecx, 0x10
0x1003f55f4: call 0x100795530
0x1003f55f9: mov r12, rax
0x1003f55fc: mov rbx, qword ptr [rsp + 0x18]
0x1003f5601: mov rax, qword ptr [rbx + 0xf0]
0x1003f5608: mov edx, dword ptr [rax + r15 + 0x24]
0x1003f560d: add edx, edx
0x1003f560f: mov rdi, r14
0x1003f5612: mov rsi, r12
0x1003f5615: call 0x10076a0a0
0x1003f561a: mov rdx, qword ptr [rbx + 0xf0]
0x1003f5621: mov qword ptr [rdx + r15 + 0x30], r12
0x1003f5626: mov rax, qword ptr [rsp + 0x30]
0x1003f562b: inc rax
0x1003f562e: mov r13, qword ptr [rsp + 0xb8]
0x1003f5636: mov esi, dword ptr [r13]
0x1003f563a: mov qword ptr [rsp + 0x30], rax
0x1003f563f: cmp esi, eax
0x1003f5641: mov r12d, dword ptr [rsp + 0x24]
0x1003f5646: lea rax, [rsp + 0x6c]
0x1003f564b: ja 0x1003f5020
0x1003f5651: jmp 0x1003f565c
0x1003f5653: mov rdx, qword ptr [rbx + 0xf0]
0x1003f565a: xor esi, esi
0x1003f565c: mov rax, qword ptr [rsp + 0xe0]
0x1003f5664: mov rdi, qword ptr [rax + 0x328]
0x1003f566b: call 0x1006aa070
0x1003f5670: mov rax, qword ptr [rsp + 0xe0]
0x1003f5678: mov rdi, qword ptr [rax + 0x3b0]
0x1003f567f: mov esi, dword ptr [rbx + 0xd4]
0x1003f5685: mov rdx, qword ptr [rbx + 0xf0]
0x1003f568c: mov rcx, qword ptr [rax + 0x138]
0x1003f5693: call 0x10034fb10
0x1003f5698: mov r15, rbx
0x1003f569b: cmp dword ptr [r13], 0
0x1003f56a0: je 0x1003f5730
0x1003f56a6: xor r14d, r14d
0x1003f56a9: mov r12d, 0x50
0x1003f56af: nop 
0x1003f56b0: mov rbx, r15
0x1003f56b3: mov rdi, qword ptr [rbx + 0x30]
0x1003f56b7: mov rax, qword ptr [rbx + 0xf0]
0x1003f56be: mov rsi, qword ptr [rax + r12 - 0x28]
0x1003f56c3: call 0x100795a70
0x1003f56c8: mov rax, qword ptr [rbx + 0xf0]
0x1003f56cf: mov qword ptr [rax + r12 - 0x28], 0
0x1003f56d8: mov rdi, qword ptr [rbx + 0x30]
0x1003f56dc: mov rsi, qword ptr [rax + r12 - 0x20]
0x1003f56e1: call 0x100795a70
0x1003f56e6: mov rax, qword ptr [rbx + 0xf0]
0x1003f56ed: mov qword ptr [rax + r12 - 0x20], 0
0x1003f56f6: mov rdi, qword ptr [rbx + 0x30]
0x1003f56fa: mov rsi, qword ptr [rax + r12 - 0x10]
0x1003f56ff: call 0x100795a70
0x1003f5704: mov rdi, qword ptr [rbx + 0xf0]
0x1003f570b: mov qword ptr [rdi + r12 - 0x10], 0
0x1003f5714: add rdi, r12
0x1003f5717: mov rsi, qword ptr [rbx + 0x30]
0x1003f571b: call 0x1006b9bf0
0x1003f5720: add r12, 0xd0
0x1003f5727: inc r14d
0x1003f572a: cmp dword ptr [r13], r14d
0x1003f572e: ja 0x1003f56b0
0x1003f5730: lea rdi, [rsp + 0x70]
0x1003f5735: lea rsi, [rsp + 0x40]
0x1003f573a: call 0x10076a280
0x1003f573f: mov r13, r15
0x1003f5742: cmp dword ptr [rsp + 0x40], 0
0x1003f5747: je 0x1003f59c2
0x1003f574d: vxorps ymm0, ymm0, ymm0
0x1003f5751: vmovaps ymmword ptr [rsp + 0x160], ymm0
0x1003f575a: vmovaps ymmword ptr [rsp + 0x140], ymm0
0x1003f5763: vmovaps ymmword ptr [rsp + 0x120], ymm0
0x1003f576c: vmovaps ymmword ptr [rsp + 0x100], ymm0
0x1003f5775: lea rdi, [rsp + 0x70]
0x1003f577a: lea rsi, [rsp + 0x100]
0x1003f5782: mov edx, 0xc
0x1003f5787: vzeroupper 
0x1003f578a: call 0x10076a0a0
0x1003f578f: lea rsi, [rsp + 0x10c]
0x1003f5797: lea rdi, [rsp + 0x70]
0x1003f579c: mov edx, 0xc
0x1003f57a1: call 0x10076a0a0
0x1003f57a6: mov r13d, dword ptr [rsp + 0x10c]
0x1003f57ae: mov ebx, dword ptr [rsp + 0x110]
0x1003f57b5: mov r14d, dword ptr [rsp + 0x114]
0x1003f57bd: lea r15, [rsp + 0x78]
0x1003f57c2: mov r12, qword ptr [rsp + 0x80]
0x1003f57ca: mov rdi, r15
0x1003f57cd: call 0x100769850
0x1003f57d2: imul ebx, r13d
0x1003f57d6: imul ebx, r14d
0x1003f57da: cdqe 
0x1003f57dc: add r12, rax
0x1003f57df: mov qword ptr [rsp + 0x118], r12
0x1003f57e7: lea rdi, [rsp + 0x70]
0x1003f57ec: mov esi, ebx
0x1003f57ee: call 0x100769ec0
0x1003f57f3: lea rsi, [rsp + 0x120]
0x1003f57fb: lea rdi, [rsp + 0x70]
0x1003f5800: call 0x10076a280
0x1003f5805: mov rbx, qword ptr [rsp + 0x80]
0x1003f580d: mov rdi, r15
0x1003f5810: call 0x100769850
0x1003f5815: cdqe 
0x1003f5817: add rbx, rax
0x1003f581a: mov qword ptr [rsp + 0x128], rbx
0x1003f5822: mov eax, dword ptr [rsp + 0x120]
0x1003f5829: add eax, eax
0x1003f582b: lea esi, [rax + rax*2]
0x1003f582e: lea rdi, [rsp + 0x70]
0x1003f5833: call 0x100769ec0
0x1003f5838: lea rsi, [rsp + 0x130]
0x1003f5840: lea rdi, [rsp + 0x70]
0x1003f5845: call 0x10076a280
0x1003f584a: lea rsi, [rsp + 0x134]
0x1003f5852: lea rdi, [rsp + 0x70]
0x1003f5857: call 0x10076a280
0x1003f585c: lea rsi, [rsp + 0x138]
0x1003f5864: lea rdi, [rsp + 0x70]
0x1003f5869: call 0x10076a280
0x1003f586e: mov rbx, qword ptr [rsp + 0x80]
0x1003f5876: mov rdi, r15
0x1003f5879: call 0x100769850
0x1003f587e: cdqe 
0x1003f5880: add rbx, rax
0x1003f5883: mov qword ptr [rsp + 0x140], rbx
0x1003f588b: mov esi, dword ptr [rsp + 0x130]
0x1003f5892: lea rdi, [rsp + 0x70]
0x1003f5897: call 0x100769ec0
0x1003f589c: mov rbx, qword ptr [rsp + 0x80]
0x1003f58a4: mov rdi, r15
0x1003f58a7: call 0x100769850
0x1003f58ac: cdqe 
0x1003f58ae: add rbx, rax
0x1003f58b1: mov qword ptr [rsp + 0x148], rbx
0x1003f58b9: mov esi, dword ptr [rsp + 0x134]
0x1003f58c0: lea rdi, [rsp + 0x70]
0x1003f58c5: call 0x100769ec0
0x1003f58ca: mov rbx, qword ptr [rsp + 0x80]
0x1003f58d2: mov rdi, r15
0x1003f58d5: call 0x100769850
0x1003f58da: cdqe 
0x1003f58dc: add rbx, rax
0x1003f58df: mov qword ptr [rsp + 0x150], rbx
0x1003f58e7: mov esi, dword ptr [rsp + 0x138]
0x1003f58ee: lea rdi, [rsp + 0x70]
0x1003f58f3: call 0x100769ec0
0x1003f58f8: lea rsi, [rsp + 0x158]
0x1003f5900: lea rdi, [rsp + 0x70]
0x1003f5905: call 0x10076a2a0
0x1003f590a: lea rsi, [rsp + 0x15c]
0x1003f5912: lea rdi, [rsp + 0x70]
0x1003f5917: call 0x10076a280
0x1003f591c: lea rsi, [rsp + 0x160]
0x1003f5924: lea rdi, [rsp + 0x70]
0x1003f5929: call 0x10076a280
0x1003f592e: lea rsi, [rsp + 0x164]
0x1003f5936: lea rdi, [rsp + 0x70]
0x1003f593b: call 0x10076a280
0x1003f5940: lea rsi, [rsp + 0x168]
0x1003f5948: lea rdi, [rsp + 0x70]
0x1003f594d: call 0x10076a280
0x1003f5952: mov rbx, qword ptr [rsp + 0x80]
0x1003f595a: mov rdi, r15
0x1003f595d: call 0x100769850
0x1003f5962: cdqe 
0x1003f5964: add rbx, rax
0x1003f5967: mov qword ptr [rsp + 0x170], rbx
0x1003f596f: mov esi, dword ptr [rsp + 0x164]
0x1003f5976: shl esi, 4
0x1003f5979: lea rdi, [rsp + 0x70]
0x1003f597e: call 0x100769ec0
0x1003f5983: mov rbx, qword ptr [rsp + 0x80]
0x1003f598b: mov rdi, r15
0x1003f598e: call 0x100769850
0x1003f5993: cdqe 
0x1003f5995: add rbx, rax
0x1003f5998: mov qword ptr [rsp + 0x178], rbx
0x1003f59a0: mov esi, dword ptr [rsp + 0x168]
0x1003f59a7: add esi, esi
0x1003f59a9: lea rdi, [rsp + 0x70]
0x1003f59ae: call 0x100769ec0
0x1003f59b3: mov r13, qword ptr [rsp + 0x18]
0x1003f59b8: lea rsi, [rsp + 0x100]
0x1003f59c0: jmp 0x1003f59c4
0x1003f59c2: xor esi, esi
0x1003f59c4: mov rbx, qword ptr [rsp + 0xe0]
0x1003f59cc: mov rdi, qword ptr [rbx + 0x3b8]
0x1003f59d3: mov rax, qword ptr [rsp + 0xd8]
0x1003f59db: mov rax, qword ptr [rax]
0x1003f59de: mov rdx, qword ptr [rax + 0x38]
0x1003f59e2: mov rcx, qword ptr [rbx + 0x148]
0x1003f59e9: mov r8, qword ptr [rbx + 0xe8]
0x1003f59f0: mov r9, qword ptr [rbx + 0x138]
0x1003f59f7: call 0x1002129f0
0x1003f59fc: lea rsi, [r13 + 0xd8]
0x1003f5a03: lea rdi, [rsp + 0x70]
0x1003f5a08: mov qword ptr [rsp + 0x38], rsi
0x1003f5a0d: call 0x10076a280
0x1003f5a12: mov rdi, qword ptr [r13 + 0x30]
0x1003f5a16: mov esi, dword ptr [r13 + 0xd8]
0x1003f5a1d: shl rsi, 5
0x1003f5a21: mov rdx, qword ptr [rip + 0x9365d0]
0x1003f5a28: mov ecx, 0x10
0x1003f5a2d: call 0x100795530
0x1003f5a32: mov r12, rax
0x1003f5a35: mov qword ptr [r13 + 0xf8], r12
0x1003f5a3c: cmp dword ptr [r13 + 0xd8], 0
0x1003f5a44: je 0x1003f5b09
0x1003f5a4a: xor r14d, r14d
0x1003f5a4d: lea r15, [rsp + 0x70]
0x1003f5a52: jmp 0x1003f5a5b
0x1003f5a54: mov r12, qword ptr [r13 + 0xf8]
0x1003f5a5b: mov r14d, r14d
0x1003f5a5e: mov r13, r14
0x1003f5a61: shl r13, 5
0x1003f5a65: lea rbx, [r12 + r13]
0x1003f5a69: mov rdi, r15
0x1003f5a6c: mov rsi, rbx
0x1003f5a6f: call 0x10076a280
0x1003f5a74: mov rax, qword ptr [rsp + 0x18]
0x1003f5a79: mov rdi, qword ptr [rax + 0x30]
0x1003f5a7d: mov eax, dword ptr [rbx]
0x1003f5a7f: shl rax, 3
0x1003f5a83: lea rsi, [rax + rax*4]
0x1003f5a87: mov rdx, qword ptr [rip + 0x93656a]
0x1003f5a8e: mov ecx, 0x10
0x1003f5a93: call 0x100795530
0x1003f5a98: mov qword ptr [r12 + r13 + 8], rax
0x1003f5a9d: mov ecx, dword ptr [rbx]
0x1003f5a9f: shl ecx, 3
0x1003f5aa2: lea edx, [rcx + rcx*4]
0x1003f5aa5: mov rdi, r15
0x1003f5aa8: mov rsi, rax
0x1003f5aab: call 0x10076a0a0
0x1003f5ab0: lea rbx, [r12 + r13 + 0x10]
0x1003f5ab5: mov rdi, r15
0x1003f5ab8: mov rsi, rbx
0x1003f5abb: call 0x10076a280
0x1003f5ac0: mov rax, qword ptr [rsp + 0x18]
0x1003f5ac5: mov rdi, qword ptr [rax + 0x30]
0x1003f5ac9: mov esi, dword ptr [rbx]
0x1003f5acb: add rsi, rsi
0x1003f5ace: mov rdx, qword ptr [rip + 0x936523]
0x1003f5ad5: mov ecx, 0x10
0x1003f5ada: call 0x100795530
0x1003f5adf: mov qword ptr [r12 + r13 + 0x18], rax
0x1003f5ae4: mov edx, dword ptr [rbx]
0x1003f5ae6: add edx, edx
0x1003f5ae8: mov rdi, r15
0x1003f5aeb: mov rsi, rax
0x1003f5aee: call 0x10076a0a0
0x1003f5af3: inc r14d
0x1003f5af6: mov rax, qword ptr [rsp + 0x38]
0x1003f5afb: cmp r14d, dword ptr [rax]
0x1003f5afe: mov r13, qword ptr [rsp + 0x18]
0x1003f5b03: jb 0x1003f5a54
0x1003f5b09: lea rsi, [r13 + 0xdc]
0x1003f5b10: lea rdi, [rsp + 0x70]
0x1003f5b15: call 0x10076a280
0x1003f5b1a: mov rdi, qword ptr [r13 + 0x30]
0x1003f5b1e: mov eax, dword ptr [r13 + 0xdc]
0x1003f5b25: shl rax, 3
0x1003f5b29: lea rsi, [rax + rax*2]
0x1003f5b2d: mov rdx, qword ptr [rip + 0x9364e4]
0x1003f5b34: mov ecx, 0x10
0x1003f5b39: call 0x100795530
0x1003f5b3e: mov qword ptr [r13 + 0x100], rax
0x1003f5b45: cmp dword ptr [r13 + 0xdc], 0
0x1003f5b4d: je 0x1003f5bf3
0x1003f5b53: lea rdi, [rsp + 0x70]
0x1003f5b58: mov rsi, rax
0x1003f5b5b: call 0x10076a280
0x1003f5b60: mov rsi, qword ptr [r13 + 0x100]
0x1003f5b67: add rsi, 4
0x1003f5b6b: lea rdi, [rsp + 0x70]
0x1003f5b70: call 0x10076a280
0x1003f5b75: mov rdi, qword ptr [r13 + 0x30]
0x1003f5b79: mov rax, qword ptr [r13 + 0x100]
0x1003f5b80: mov esi, dword ptr [rax]
0x1003f5b82: shl rsi, 4
0x1003f5b86: mov rdx, qword ptr [rip + 0x93648b]
0x1003f5b8d: mov ecx, 0x10
0x1003f5b92: call 0x100795530
0x1003f5b97: mov rcx, qword ptr [r13 + 0x100]
0x1003f5b9e: mov qword ptr [rcx + 8], rax
0x1003f5ba2: mov edx, dword ptr [rcx]
0x1003f5ba4: shl edx, 4
0x1003f5ba7: lea rdi, [rsp + 0x70]
0x1003f5bac: mov rsi, rax
0x1003f5baf: call 0x10076a0a0
0x1003f5bb4: mov rdi, qword ptr [r13 + 0x30]
0x1003f5bb8: mov rax, qword ptr [r13 + 0x100]
0x1003f5bbf: mov esi, dword ptr [rax + 4]
0x1003f5bc2: add rsi, rsi
0x1003f5bc5: mov rdx, qword ptr [rip + 0x93644c]
0x1003f5bcc: mov ecx, 0x10
0x1003f5bd1: call 0x100795530
0x1003f5bd6: mov rcx, qword ptr [r13 + 0x100]
0x1003f5bdd: mov qword ptr [rcx + 0x10], rax
0x1003f5be1: mov edx, dword ptr [rcx + 4]
0x1003f5be4: add edx, edx
0x1003f5be6: lea rdi, [rsp + 0x70]
0x1003f5beb: mov rsi, rax
0x1003f5bee: call 0x10076a0a0
0x1003f5bf3: mov rdi, qword ptr [rsp + 0xe8]
0x1003f5bfb: call 0x100aa2768
0x1003f5c00: mov eax, dword ptr [rsp + 0x24]
0x1003f5c04: mov dword ptr [r13 + 0x264], eax
0x1003f5c0b: lea rdi, [rsp + 0x1a0]
0x1003f5c13: call 0x1007c2570
0x1003f5c18: jmp 0x1003f490a
0x1003f5c1d: call 0x100aa251c
0x1003f5c22: lea rdi, [rip + 0x791151]
0x1003f5c29: lea rsi, [rip + 0x790edb]
0x1003f5c30: lea r8, [rip + 0x791148]
0x1003f5c37: mov edx, 0x257
0x1003f5c3c: mov ecx, 4
0x1003f5c41: xor eax, eax
0x1003f5c43: call 0x1007e6030
0x1003f5c48: ud2 
0x1003f5c4a: lea rdi, [rip + 0x79114f]
0x1003f5c51: lea rsi, [rip + 0x790eb3]
0x1003f5c58: lea r8, [rip + 0x791156]
0x1003f5c5f: mov edx, 0x258
0x1003f5c64: mov ecx, 4
0x1003f5c69: xor eax, eax
0x1003f5c6b: mov r9d, r15d
0x1003f5c6e: call 0x1007e6030
0x1003f5c73: ud2 
0x1003f5c75: lea rdi, [rip + 0x7701e9]
0x1003f5c7c: lea rsi, [rip + 0x7701ed]
0x1003f5c83: mov edx, 0x6d
0x1003f5c88: mov ecx, 3
0x1003f5c8d: call 0x1007e5f70
0x1003f5c92: jmp 0x1003f5cd0
0x1003f5c94: lea rdi, [rip + 0x791145]
0x1003f5c9b: lea rsi, [rip + 0x790e69]
0x1003f5ca2: mov edx, 0x313
0x1003f5ca7: mov ecx, 3
0x1003f5cac: call 0x1007e5f70
0x1003f5cb1: jmp 0x1003f5cd0
0x1003f5cb3: lea rdi, [rip + 0x791164]
0x1003f5cba: lea rsi, [rip + 0x790e4a]
0x1003f5cc1: mov edx, 0x324
0x1003f5cc6: mov ecx, 3
0x1003f5ccb: call 0x1007e5f70
0x1003f5cd0: ud2 
0x1003f5cd2: jmp 0x1003f5dc1
0x1003f5cd7: jmp 0x1003f5dc1
0x1003f5cdc: jmp 0x1003f5dc8
0x1003f5ce1: jmp 0x1003f5dc1
0x1003f5ce6: jmp 0x1003f5dc1
0x1003f5ceb: jmp 0x1003f5dc1
0x1003f5cf0: mov rdi, rax
0x1003f5cf3: call 0x100011bf0
0x1003f5cf8: mov r14, rax
0x1003f5cfb: call 0x1007c6c20
0x1003f5d00: mov rdi, rax
0x1003f5d03: mov rsi, r15
0x1003f5d06: call 0x100795a70
0x1003f5d0b: jmp 0x1003f5dd8
0x1003f5d10: mov rdi, rax
0x1003f5d13: call 0x100011bf0
0x1003f5d18: jmp 0x1003f5dc1
0x1003f5d1d: jmp 0x1003f5dc1
0x1003f5d22: jmp 0x1003f5dc1
0x1003f5d27: jmp 0x1003f5dc1
0x1003f5d2c: jmp 0x1003f5dc1
0x1003f5d31: jmp 0x1003f5dc1
0x1003f5d36: jmp 0x1003f5dc1
0x1003f5d3b: jmp 0x1003f5dc1
0x1003f5d40: mov rdi, rax
0x1003f5d43: call 0x100011bf0
0x1003f5d48: jmp 0x1003f5dc8
0x1003f5d4a: jmp 0x1003f5dc1
0x1003f5d4c: jmp 0x1003f5dc1
0x1003f5d4e: jmp 0x1003f5dc1
0x1003f5d50: jmp 0x1003f5dc1
0x1003f5d52: mov rdi, rax
0x1003f5d55: call 0x100011bf0
0x1003f5d5a: mov rdi, rax
0x1003f5d5d: call 0x100011bf0
0x1003f5d62: mov r14, rax
0x1003f5d65: call 0x1007c6c20
0x1003f5d6a: mov rdi, rax
0x1003f5d6d: mov rsi, r15
0x1003f5d70: call 0x100795a70
0x1003f5d75: jmp 0x1003f5dcb
0x1003f5d77: mov rdi, rax
0x1003f5d7a: call 0x100011bf0
0x1003f5d7f: jmp 0x1003f5dc1
0x1003f5d81: mov r14, rax
0x1003f5d84: call 0x1007c6c20
0x1003f5d89: mov rdi, rax
0x1003f5d8c: mov rsi, r12
0x1003f5d8f: call 0x100795a70
0x1003f5d94: jmp 0x1003f5da1
0x1003f5d96: mov rdi, rax
0x1003f5d99: call 0x100011bf0
0x1003f5d9e: mov r14, rax
0x1003f5da1: call 0x1007c6c20
0x1003f5da6: mov rdi, rax
0x1003f5da9: mov rsi, r15
0x1003f5dac: call 0x100795a70
0x1003f5db1: jmp 0x1003f5dcb
0x1003f5db3: mov rdi, rax
0x1003f5db6: call 0x100011bf0
0x1003f5dbb: jmp 0x1003f5dc8
0x1003f5dbd: jmp 0x1003f5dc1
0x1003f5dbf: jmp 0x1003f5dc1
0x1003f5dc1: mov r14, rax
0x1003f5dc4: jmp 0x1003f5dd8
0x1003f5dc6: jmp 0x1003f5dc8
0x1003f5dc8: mov r14, rax
0x1003f5dcb: lea rdi, [rsp + 0x100]
0x1003f5dd3: call 0x1007c2570
0x1003f5dd8: lea rdi, [rsp + 0x1a0]
0x1003f5de0: call 0x1007c2570
0x1003f5de5: mov rdi, r14
0x1003f5de8: call 0x100aa2192
0x1003f5ded: nop dword ptr [rax]
0x1003f5df0: push rbp
0x1003f5df1: mov rbp, rsp
0x1003f5df4: pop rbp
0x1003f5df5: ret 
0x1003f5df6: nop word ptr cs:[rax + rax]
0x1003f5e00: push rbp
0x1003f5e01: mov rbp, rsp
0x1003f5e04: push r15
0x1003f5e06: push r14
0x1003f5e08: push r13
0x1003f5e0a: push r12
0x1003f5e0c: push rbx
0x1003f5e0d: push rax
0x1003f5e0e: mov r12, rdi
0x1003f5e11: mov dword ptr [r12 + 0x264], 0xffffffff
0x1003f5e1d: cmp dword ptr [r12 + 0xd0], 0
0x1003f5e26: je 0x1003f5f07
0x1003f5e2c: xor r15d, r15d
0x1003f5e2f: nop 
0x1003f5e30: mov rdi, qword ptr [r12 + 0x30]
0x1003f5e35: mov rax, qword ptr [r12 + 0xe8]
0x1003f5e3d: lea rbx, [r15 + r15*2]
0x1003f5e41: shl rbx, 4
0x1003f5e45: cmp dword ptr [rax + rbx + 0x1c], 0
0x1003f5e4a: lea rax, [rax + rbx + 0x28]
0x1003f5e4f: je 0x1003f5ec2
0x1003f5e51: mov qword ptr [rbp - 0x30], rbx
0x1003f5e55: mov rax, qword ptr [rax]
0x1003f5e58: xor r13d, r13d
0x1003f5e5b: mov ebx, 8
0x1003f5e60: mov rsi, qword ptr [rax + rbx]
0x1003f5e64: call 0x100795a70
0x1003f5e69: mov rdi, qword ptr [r12 + 0x30]
0x1003f5e6e: mov rax, qword ptr [r12 + 0xe8]
0x1003f5e76: mov rcx, r15
0x1003f5e79: shl rcx, 4
0x1003f5e7d: lea r14, [rcx + rcx*2]
0x1003f5e81: mov rax, qword ptr [rax + r14 + 0x28]
0x1003f5e86: mov rsi, qword ptr [rax + rbx + 8]
0x1003f5e8b: call 0x100795a70
0x1003f5e90: mov rcx, qword ptr [r12 + 0xe8]
0x1003f5e98: mov rax, qword ptr [rcx + r14 + 0x28]
0x1003f5e9d: vxorps xmm0, xmm0, xmm0
0x1003f5ea1: vmovups xmmword ptr [rax + rbx], xmm0
0x1003f5ea6: mov rdi, qword ptr [r12 + 0x30]
0x1003f5eab: add rbx, 0x18
0x1003f5eaf: inc r13d
0x1003f5eb2: cmp dword ptr [rcx + r14 + 0x1c], r13d
0x1003f5eb7: ja 0x1003f5e60
0x1003f5eb9: lea rax, [rcx + r14 + 0x28]
0x1003f5ebe: mov rbx, qword ptr [rbp - 0x30]
0x1003f5ec2: mov rsi, qword ptr [rax]
0x1003f5ec5: call 0x100795a70
0x1003f5eca: mov rax, qword ptr [r12 + 0xe8]
0x1003f5ed2: mov qword ptr [rax + rbx + 0x28], 0
0x1003f5edb: test byte ptr [rax + rbx], 1
0x1003f5edf: je 0x1003f5ef6
0x1003f5ee1: mov r14, qword ptr [rax + rbx + 0x10]
0x1003f5ee6: call 0x1007e50d0
0x1003f5eeb: mov rdi, rax
0x1003f5eee: mov rsi, r14
0x1003f5ef1: call 0x1007e5db0
0x1003f5ef6: inc r15
0x1003f5ef9: cmp dword ptr [r12 + 0xd0], r15d
0x1003f5f01: ja 0x1003f5e30
0x1003f5f07: cmp dword ptr [r12 + 0xd8], 0
0x1003f5f10: mov rdi, qword ptr [r12 + 0x30]
0x1003f5f15: je 0x1003f5f62
0x1003f5f17: xor r14d, r14d
0x1003f5f1a: nop word ptr [rax + rax]
0x1003f5f20: mov rax, qword ptr [r12 + 0xf8]
0x1003f5f28: mov ebx, r14d
0x1003f5f2b: shl rbx, 5
0x1003f5f2f: mov rsi, qword ptr [rax + rbx + 8]
0x1003f5f34: call 0x100795a70
0x1003f5f39: mov rdi, qword ptr [r12 + 0x30]
0x1003f5f3e: mov rax, qword ptr [r12 + 0xf8]
0x1003f5f46: mov rsi, qword ptr [rax + rbx + 0x18]
0x1003f5f4b: call 0x100795a70
0x1003f5f50: inc r14d
0x1003f5f53: mov rdi, qword ptr [r12 + 0x30]
0x1003f5f58: cmp r14d, dword ptr [r12 + 0xd8]
0x1003f5f60: jb 0x1003f5f20
0x1003f5f62: mov rsi, qword ptr [r12 + 0xf8]
0x1003f5f6a: call 0x100795a70
0x1003f5f6f: cmp dword ptr [r12 + 0xdc], 0
0x1003f5f78: je 0x1003f5fc4
0x1003f5f7a: mov rdi, qword ptr [r12 + 0x30]
0x1003f5f7f: mov rax, qword ptr [r12 + 0x100]
0x1003f5f87: mov rsi, qword ptr [rax + 8]
0x1003f5f8b: call 0x100795a70
0x1003f5f90: mov rdi, qword ptr [r12 + 0x30]
0x1003f5f95: mov rax, qword ptr [r12 + 0x100]
0x1003f5f9d: mov rsi, qword ptr [rax + 0x10]
0x1003f5fa1: call 0x100795a70
0x1003f5fa6: mov rdi, qword ptr [r12 + 0x30]
0x1003f5fab: mov rsi, qword ptr [r12 + 0x100]
0x1003f5fb3: call 0x100795a70
0x1003f5fb8: mov qword ptr [r12 + 0x100], 0
0x1003f5fc4: mov rsi, qword ptr [r12 + 0x110]
0x1003f5fcc: test rsi, rsi
0x1003f5fcf: je 0x1003f6023
0x1003f5fd1: mov rax, qword ptr [rsi + 0x20]
0x1003f5fd5: test rax, rax
0x1003f5fd8: je 0x1003f5fef
0x1003f5fda: mov rdi, qword ptr [r12 + 0x30]
0x1003f5fdf: mov rsi, rax
0x1003f5fe2: call 0x100795a70
0x1003f5fe7: mov rsi, qword ptr [r12 + 0x110]
0x1003f5fef: mov rax, qword ptr [rsi + 0x28]
0x1003f5ff3: test rax, rax
0x1003f5ff6: je 0x1003f600d
0x1003f5ff8: mov rdi, qword ptr [r12 + 0x30]
0x1003f5ffd: mov rsi, rax
0x1003f6000: call 0x100795a70
0x1003f6005: mov rsi, qword ptr [r12 + 0x110]
0x1003f600d: mov rdi, qword ptr [r12 + 0x30]
0x1003f6012: call 0x100795a70
0x1003f6017: mov qword ptr [r12 + 0x110], 0
0x1003f6023: mov rdi, qword ptr [r12 + 0x30]
0x1003f6028: mov rsi, qword ptr [r12 + 0xe8]
0x1003f6030: call 0x100795a70
0x1003f6035: mov qword ptr [r12 + 0xe8], 0
0x1003f6041: mov rdi, qword ptr [r12 + 0x30]
0x1003f6046: mov rsi, qword ptr [r12 + 0xf0]
0x1003f604e: call 0x100795a70
0x1003f6053: mov qword ptr [r12 + 0xf0], 0
0x1003f605f: add rsp, 8
0x1003f6063: pop rbx
0x1003f6064: pop r12
0x1003f6066: pop r13
0x1003f6068: pop r14
0x1003f606a: pop r15
0x1003f606c: pop rbp
0x1003f606d: ret 
0x1003f606e: mov rdi, rax
0x1003f6071: call 0x100011bf0
0x1003f6076: nop word ptr cs:[rax + rax]
0x1003f6080: push rbp
0x1003f6081: mov rbp, rsp
0x1003f6084: mov rax, qword ptr [rsi + 0x110]
0x1003f608b: imul r8d, dword ptr [rax + 0x10]
0x1003f6090: add r8d, edx
0x1003f6093: mov rdx, qword ptr [rax + 0x20]
0x1003f6097: mov r9, qword ptr [rax + 0x28]
0x1003f609b: mov esi, dword ptr [rdx + r8*4]
0x1003f609f: xor edx, edx
0x1003f60a1: nop word ptr cs:[rax + rax]
0x1003f60b0: mov eax, esi
0x1003f60b2: mov r8d, dword ptr [r9 + rax*4]
0x1003f60b6: mov eax, r8d
0x1003f60b9: and eax, 0x7f
0x1003f60bc: add edx, eax
0x1003f60be: inc esi
0x1003f60c0: cmp edx, ecx
0x1003f60c2: jbe 0x1003f60b0
0x1003f60c4: mov eax, r8d
0x1003f60c7: shr eax, 7
0x1003f60ca: and eax, 0x7f
0x1003f60cd: mov ecx, r8d
0x1003f60d0: shr ecx, 0xe
0x1003f60d3: and ecx, 0x3f
0x1003f60d6: mov edx, r8d
0x1003f60d9: shr edx, 0x14
0x1003f60dc: and edx, 0x3f
0x1003f60df: shr r8d, 0x1a
0x1003f60e3: vmovd xmm0, eax
0x1003f60e7: vpinsrd xmm0, xmm0, ecx, 1
0x1003f60ed: vpinsrd xmm0, xmm0, edx, 2
0x1003f60f3: vpinsrd xmm0, xmm0, r8d, 3
0x1003f60f9: vcvtdq2ps xmm0, xmm0
0x1003f60fd: vdivps xmm0, xmm0, xmmword ptr [rip + 0x6caa5b]
0x1003f6105: vaddps xmm0, xmm0, xmmword ptr [rip + 0x6caa63]
0x1003f610d: vmovaps xmmword ptr [rdi], xmm0
0x1003f6111: mov rax, rdi
0x1003f6114: pop rbp
0x1003f6115: ret 
0x1003f6116: nop word ptr cs:[rax + rax]
0x1003f6120: push rbp
0x1003f6121: mov rbp, rsp
0x1003f6124: push r15
0x1003f6126: push r14
0x1003f6128: push r13
0x1003f612a: push r12
0x1003f612c: push rbx
0x1003f612d: mov rbx, qword ptr [rsi + 0x110]
0x1003f6134: vmovaps xmm0, xmmword ptr [rip + 0x6b1524]
0x1003f613c: test rbx, rbx
0x1003f613f: je 0x1003f6664
0x1003f6145: mov r11, qword ptr [rbx + 0x28]
0x1003f6149: test r11, r11
0x1003f614c: je 0x1003f6664
0x1003f6152: mov qword ptr [rbp - 0x60], rdi
0x1003f6156: vmovsd xmm0, qword ptr [rbx]
0x1003f615a: vinsertps xmm0, xmm0, dword ptr [rbx + 8], 0x20
0x1003f6161: vmovaps xmm1, xmmword ptr [rdx]
0x1003f6165: vsubps xmm0, xmm1, xmm0
0x1003f6169: vbroadcastss xmm1, dword ptr [rbx + 0xc]
0x1003f616f: vdivps xmm0, xmm0, xmm1
0x1003f6173: vpermilpd xmm1, xmm0, 1
0x1003f6179: vmovshdup xmm2, xmm0
0x1003f617d: vroundss xmm3, xmm0, xmm0, 9
0x1003f6183: vroundss xmm2, xmm2, xmm2, 9
0x1003f6189: vroundss xmm1, xmm1, xmm1, 9
0x1003f618f: vinsertps xmm4, xmm3, xmm2, 0x10
0x1003f6195: vinsertps xmm4, xmm4, xmm1, 0x20
0x1003f619b: vaddps xmm4, xmm4, xmmword ptr [rip + 0x6b14cd]
0x1003f61a3: vsubps xmm4, xmm0, xmm4
0x1003f61a7: vandps xmm13, xmm4, xmmword ptr [rip + 0x6b1e81]
0x1003f61af: vxorps xmm5, xmm5, xmm5
0x1003f61b3: vucomiss xmm5, xmm4
0x1003f61b7: mov ecx, 0xffffffff
0x1003f61bc: mov esi, 1
0x1003f61c1: mov eax, 1
0x1003f61c6: cmova eax, ecx
0x1003f61c9: vmovshdup xmm6, xmm4
0x1003f61cd: vucomiss xmm5, xmm6
0x1003f61d1: mov r9d, 1
0x1003f61d7: cmova r9d, ecx
0x1003f61db: vpermilpd xmm4, xmm4, 1
0x1003f61e1: vucomiss xmm5, xmm4
0x1003f61e5: cmova esi, ecx
0x1003f61e8: vcvttss2si ecx, xmm3
0x1003f61ec: mov edi, dword ptr [rbx + 0x10]
0x1003f61ef: lea r15d, [rdi - 1]
0x1003f61f3: xor edx, edx
0x1003f61f5: test ecx, ecx
0x1003f61f7: mov r14d, 0
0x1003f61fd: cmovns r14d, ecx
0x1003f6201: cmp r15d, r14d
0x1003f6204: cmovle r14d, r15d
0x1003f6208: add eax, ecx
0x1003f620a: cmovs eax, edx
0x1003f620d: vcvttss2si ecx, xmm2
0x1003f6211: mov r13d, dword ptr [rbx + 0x14]
0x1003f6215: dec r13d
0x1003f6218: test ecx, ecx
0x1003f621a: mov r8d, 0
0x1003f6220: cmovns r8d, ecx
0x1003f6224: cmp r13d, r8d
0x1003f6227: cmovle r8d, r13d
0x1003f622b: add r9d, ecx
0x1003f622e: cmovs r9d, edx
0x1003f6232: vcvttss2si ecx, xmm1
0x1003f6236: mov r10d, dword ptr [rbx + 0x18]
0x1003f623a: dec r10d
0x1003f623d: test ecx, ecx
0x1003f623f: mov r12d, 0
0x1003f6245: cmovns r12d, ecx
0x1003f6249: cmp r10d, r12d
0x1003f624c: cmovle r12d, r10d
0x1003f6250: add esi, ecx
0x1003f6252: cmovs esi, edx
0x1003f6255: mov qword ptr [rbp - 0x40], rsi
0x1003f6259: mov rsi, qword ptr [rbx + 0x20]
0x1003f625d: mov qword ptr [rbp - 0x50], rdi
0x1003f6261: imul r12d, edi
0x1003f6265: mov qword ptr [rbp - 0x48], r14
0x1003f6269: lea ecx, [r12 + r14]
0x1003f626d: mov qword ptr [rbp - 0x58], rsi
0x1003f6271: mov ebx, dword ptr [rsi + rcx*4]
0x1003f6274: mov ecx, ebx
0x1003f6276: nop word ptr cs:[rax + rax]
0x1003f6280: mov esi, ecx
0x1003f6282: mov edi, dword ptr [r11 + rsi*4]
0x1003f6286: mov esi, edi
0x1003f6288: and esi, 0x7f
0x1003f628b: add edx, esi
0x1003f628d: inc ecx
0x1003f628f: cmp edx, r8d
0x1003f6292: jbe 0x1003f6280
0x1003f6294: cmp r15d, eax
0x1003f6297: cmovle eax, r15d
0x1003f629b: cmp r13d, r9d
0x1003f629e: cmovle r9d, r13d
0x1003f62a2: mov r14, qword ptr [rbp - 0x40]
0x1003f62a6: cmp r10d, r14d
0x1003f62a9: cmovle r14d, r10d
0x1003f62ad: mov ecx, edi
0x1003f62af: shr ecx, 7
0x1003f62b2: and ecx, 0x7f
0x1003f62b5: mov edx, edi
0x1003f62b7: shr edx, 0xe
0x1003f62ba: and edx, 0x3f
0x1003f62bd: mov esi, edi
0x1003f62bf: shr esi, 0x14
0x1003f62c2: and esi, 0x3f
0x1003f62c5: shr edi, 0x1a
0x1003f62c8: vmovd xmm1, ecx
0x1003f62cc: vpinsrd xmm1, xmm1, edx, 1
0x1003f62d2: vpinsrd xmm1, xmm1, esi, 2
0x1003f62d8: vpinsrd xmm1, xmm1, edi, 3
0x1003f62de: vcvtdq2ps xmm1, xmm1
0x1003f62e2: vdivps xmm1, xmm1, xmmword ptr [rip + 0x6ca876]
0x1003f62ea: mov r10d, eax
0x1003f62ed: add r12d, eax
0x1003f62f0: mov r15, qword ptr [rbp - 0x58]
0x1003f62f4: mov esi, dword ptr [r15 + r12*4]
0x1003f62f8: xor ecx, ecx
0x1003f62fa: mov edx, esi
0x1003f62fc: nop dword ptr [rax]
0x1003f6300: mov edi, edx
0x1003f6302: mov eax, dword ptr [r11 + rdi*4]
0x1003f6306: mov edi, eax
0x1003f6308: and edi, 0x7f
0x1003f630b: add ecx, edi
0x1003f630d: inc edx
0x1003f630f: cmp ecx, r8d
0x1003f6312: jbe 0x1003f6300
0x1003f6314: vaddps xmm0, xmm1, xmmword ptr [rip + 0x6ca854]
0x1003f631c: mov ecx, eax
0x1003f631e: shr ecx, 7
0x1003f6321: and ecx, 0x7f
0x1003f6324: mov edx, eax
0x1003f6326: shr edx, 0xe
0x1003f6329: and edx, 0x3f
0x1003f632c: mov edi, eax
0x1003f632e: shr edi, 0x14
0x1003f6331: and edi, 0x3f
0x1003f6334: shr eax, 0x1a
0x1003f6337: vmovd xmm2, ecx
0x1003f633b: vpinsrd xmm2, xmm2, edx, 1
0x1003f6341: vpinsrd xmm2, xmm2, edi, 2
0x1003f6347: vpinsrd xmm2, xmm2, eax, 3
0x1003f634d: vcvtdq2ps xmm2, xmm2
0x1003f6351: vdivps xmm2, xmm2, xmmword ptr [rip + 0x6ca807]
0x1003f6359: xor ecx, ecx
0x1003f635b: nop dword ptr [rax + rax]
0x1003f6360: mov eax, ebx
0x1003f6362: mov edi, dword ptr [r11 + rax*4]
0x1003f6366: mov eax, edi
0x1003f6368: and eax, 0x7f
0x1003f636b: add ecx, eax
0x1003f636d: inc ebx
0x1003f636f: cmp ecx, r9d
0x1003f6372: jbe 0x1003f6360
0x1003f6374: vaddps xmm1, xmm2, xmmword ptr [rip + 0x6ca7f4]
0x1003f637c: vmovaps xmmword ptr [rbp - 0x40], xmm1
0x1003f6381: mov eax, edi
0x1003f6383: shr eax, 7
0x1003f6386: and eax, 0x7f
0x1003f6389: mov ecx, edi
0x1003f638b: shr ecx, 0xe
0x1003f638e: and ecx, 0x3f
0x1003f6391: mov edx, edi
0x1003f6393: shr edx, 0x14
0x1003f6396: and edx, 0x3f
0x1003f6399: shr edi, 0x1a
0x1003f639c: vmovd xmm3, eax
0x1003f63a0: vpinsrd xmm3, xmm3, ecx, 1
0x1003f63a6: vpinsrd xmm3, xmm3, edx, 2
0x1003f63ac: vpinsrd xmm3, xmm3, edi, 3
0x1003f63b2: vcvtdq2ps xmm3, xmm3
0x1003f63b6: vdivps xmm3, xmm3, xmmword ptr [rip + 0x6ca7a2]
0x1003f63be: xor ecx, ecx
0x1003f63c0: mov eax, esi
0x1003f63c2: mov edi, dword ptr [r11 + rax*4]
0x1003f63c6: mov eax, edi
0x1003f63c8: and eax, 0x7f
0x1003f63cb: add ecx, eax
0x1003f63cd: inc esi
0x1003f63cf: cmp ecx, r9d
0x1003f63d2: jbe 0x1003f63c0
0x1003f63d4: vaddps xmm10, xmm3, xmmword ptr [rip + 0x6ca794]
0x1003f63dc: mov eax, edi
0x1003f63de: shr eax, 7
0x1003f63e1: and eax, 0x7f
0x1003f63e4: mov ecx, edi
0x1003f63e6: shr ecx, 0xe
0x1003f63e9: and ecx, 0x3f
0x1003f63ec: mov edx, edi
0x1003f63ee: shr edx, 0x14
0x1003f63f1: and edx, 0x3f
0x1003f63f4: shr edi, 0x1a
0x1003f63f7: vmovd xmm4, eax
0x1003f63fb: vpinsrd xmm4, xmm4, ecx, 1
0x1003f6401: vpinsrd xmm4, xmm4, edx, 2
0x1003f6407: vpinsrd xmm4, xmm4, edi, 3
0x1003f640d: vcvtdq2ps xmm4, xmm4
0x1003f6411: vdivps xmm4, xmm4, xmmword ptr [rip + 0x6ca747]
0x1003f6419: imul r14d, dword ptr [rbp - 0x50]
0x1003f641e: mov rax, qword ptr [rbp - 0x48]
0x1003f6422: add eax, r14d
0x1003f6425: mov ebx, dword ptr [r15 + rax*4]
0x1003f6429: xor ecx, ecx
0x1003f642b: mov esi, ebx
0x1003f642d: nop dword ptr [rax]
0x1003f6430: mov eax, esi
0x1003f6432: mov edx, dword ptr [r11 + rax*4]
0x1003f6436: mov eax, edx
0x1003f6438: and eax, 0x7f
0x1003f643b: add ecx, eax
0x1003f643d: inc esi
0x1003f643f: cmp ecx, r8d
0x1003f6442: jbe 0x1003f6430
0x1003f6444: vaddps xmm11, xmm4, xmmword ptr [rip + 0x6ca724]
0x1003f644c: mov eax, edx
0x1003f644e: shr eax, 7
0x1003f6451: and eax, 0x7f
0x1003f6454: mov ecx, edx
0x1003f6456: shr ecx, 0xe
0x1003f6459: and ecx, 0x3f
0x1003f645c: mov esi, edx
0x1003f645e: shr esi, 0x14
0x1003f6461: and esi, 0x3f
0x1003f6464: shr edx, 0x1a
0x1003f6467: vmovd xmm5, eax
0x1003f646b: vpinsrd xmm5, xmm5, ecx, 1
0x1003f6471: vpinsrd xmm5, xmm5, esi, 2
0x1003f6477: vpinsrd xmm5, xmm5, edx, 3
0x1003f647d: vcvtdq2ps xmm5, xmm5
0x1003f6481: vdivps xmm5, xmm5, xmmword ptr [rip + 0x6ca6d7]
0x1003f6489: add r14d, r10d
0x1003f648c: mov edx, dword ptr [r15 + r14*4]
0x1003f6490: xor ecx, ecx
0x1003f6492: mov esi, edx
0x1003f6494: nop word ptr cs:[rax + rax]
0x1003f64a0: mov eax, esi
0x1003f64a2: mov edi, dword ptr [r11 + rax*4]
0x1003f64a6: mov eax, edi
0x1003f64a8: and eax, 0x7f
0x1003f64ab: add ecx, eax
0x1003f64ad: inc esi
0x1003f64af: cmp ecx, r8d
0x1003f64b2: jbe 0x1003f64a0
0x1003f64b4: vaddps xmm12, xmm5, xmmword ptr [rip + 0x6ca6b4]
0x1003f64bc: mov eax, edi
0x1003f64be: shr eax, 7
0x1003f64c1: and eax, 0x7f
0x1003f64c4: mov ecx, edi
0x1003f64c6: shr ecx, 0xe
0x1003f64c9: and ecx, 0x3f
0x1003f64cc: mov esi, edi
0x1003f64ce: shr esi, 0x14
0x1003f64d1: and esi, 0x3f
0x1003f64d4: shr edi, 0x1a
0x1003f64d7: vmovd xmm6, eax
0x1003f64db: vpinsrd xmm6, xmm6, ecx, 1
0x1003f64e1: vpinsrd xmm6, xmm6, esi, 2
0x1003f64e7: vpinsrd xmm6, xmm6, edi, 3
0x1003f64ed: vcvtdq2ps xmm6, xmm6
0x1003f64f1: vdivps xmm6, xmm6, xmmword ptr [rip + 0x6ca667]
0x1003f64f9: xor ecx, ecx
0x1003f64fb: nop dword ptr [rax + rax]
0x1003f6500: mov eax, ebx
0x1003f6502: mov esi, dword ptr [r11 + rax*4]
0x1003f6506: mov eax, esi
0x1003f6508: and eax, 0x7f
0x1003f650b: add ecx, eax
0x1003f650d: inc ebx
0x1003f650f: cmp ecx, r9d
0x1003f6512: jbe 0x1003f6500
0x1003f6514: vaddps xmm14, xmm6, xmmword ptr [rip + 0x6ca654]
0x1003f651c: mov eax, esi
0x1003f651e: shr eax, 7
0x1003f6521: and eax, 0x7f
0x1003f6524: mov ecx, esi
0x1003f6526: shr ecx, 0xe
0x1003f6529: and ecx, 0x3f
0x1003f652c: mov edi, esi
0x1003f652e: shr edi, 0x14
0x1003f6531: and edi, 0x3f
0x1003f6534: shr esi, 0x1a
0x1003f6537: vmovd xmm7, eax
0x1003f653b: vpinsrd xmm7, xmm7, ecx, 1
0x1003f6541: vpinsrd xmm7, xmm7, edi, 2
0x1003f6547: vpinsrd xmm7, xmm7, esi, 3
0x1003f654d: vcvtdq2ps xmm7, xmm7
0x1003f6551: vdivps xmm7, xmm7, xmmword ptr [rip + 0x6ca607]
0x1003f6559: xor ecx, ecx
0x1003f655b: nop dword ptr [rax + rax]
0x1003f6560: mov eax, edx
0x1003f6562: mov esi, dword ptr [r11 + rax*4]
0x1003f6566: mov eax, esi
0x1003f6568: and eax, 0x7f
0x1003f656b: add ecx, eax
0x1003f656d: inc edx
0x1003f656f: cmp ecx, r9d
0x1003f6572: jbe 0x1003f6560
0x1003f6574: vmovaps xmm1, xmmword ptr [rip + 0x6ca5f4]
0x1003f657c: vaddps xmm15, xmm7, xmm1
0x1003f6580: mov eax, esi
0x1003f6582: shr eax, 7
0x1003f6585: and eax, 0x7f
0x1003f6588: mov ecx, esi
0x1003f658a: shr ecx, 0xe
0x1003f658d: and ecx, 0x3f
0x1003f6590: mov edx, esi
0x1003f6592: shr edx, 0x14
0x1003f6595: and edx, 0x3f
0x1003f6598: shr esi, 0x1a
0x1003f659b: vmovd xmm2, eax
0x1003f659f: vpinsrd xmm2, xmm2, ecx, 1
0x1003f65a5: vpinsrd xmm2, xmm2, edx, 2
0x1003f65ab: vpinsrd xmm2, xmm2, esi, 3
0x1003f65b1: vcvtdq2ps xmm2, xmm2
0x1003f65b5: vdivps xmm2, xmm2, xmmword ptr [rip + 0x6ca5a3]
0x1003f65bd: vaddps xmm1, xmm2, xmm1
0x1003f65c1: vmovss xmm8, dword ptr [rip + 0x6aeaf7]
0x1003f65c9: vsubss xmm3, xmm8, xmm13
0x1003f65ce: vpermilps xmm3, xmm3, 0
0x1003f65d4: vmulps xmm4, xmm3, xmm0
0x1003f65d8: vpermilpd xmm9, xmm13, 1
0x1003f65de: vmovshdup xmm0, xmm13
0x1003f65e3: vpermilps xmm6, xmm13, 0
0x1003f65e9: vmulps xmm7, xmm6, xmmword ptr [rbp - 0x40]
0x1003f65ee: vaddps xmm4, xmm4, xmm7
0x1003f65f2: vmulps xmm7, xmm3, xmm10
0x1003f65f7: vmulps xmm2, xmm6, xmm11
0x1003f65fc: vaddps xmm2, xmm7, xmm2
0x1003f6600: vmulps xmm7, xmm3, xmm12
0x1003f6605: vmulps xmm5, xmm6, xmm14
0x1003f660a: vaddps xmm5, xmm7, xmm5
0x1003f660e: vmulps xmm3, xmm3, xmm15
0x1003f6613: vmulps xmm1, xmm6, xmm1
0x1003f6617: vaddps xmm1, xmm3, xmm1
0x1003f661b: vsubss xmm0, xmm8, xmm0
0x1003f661f: vpermilps xmm0, xmm0, 0
0x1003f6625: vmulps xmm3, xmm0, xmm4
0x1003f6629: vpermilps xmm4, xmm13, 0x55
0x1003f662f: vmulps xmm2, xmm4, xmm2
0x1003f6633: vaddps xmm2, xmm3, xmm2
0x1003f6637: vmulps xmm0, xmm0, xmm5
0x1003f663b: vmulps xmm1, xmm4, xmm1
0x1003f663f: vaddps xmm0, xmm0, xmm1
0x1003f6643: vsubss xmm1, xmm8, xmm9
0x1003f6648: vpermilps xmm1, xmm1, 0
0x1003f664e: vmulps xmm1, xmm1, xmm2
0x1003f6652: vpermilps xmm2, xmm13, 0xaa
0x1003f6658: vmulps xmm0, xmm2, xmm0
0x1003f665c: vaddps xmm0, xmm1, xmm0
0x1003f6660: mov rdi, qword ptr [rbp - 0x60]
0x1003f6664: vmovaps xmmword ptr [rdi], xmm0
0x1003f6668: mov rax, rdi
0x1003f666b: pop rbx
0x1003f666c: pop r12
0x1003f666e: pop r13
0x1003f6670: pop r14
0x1003f6672: pop r15
0x1003f6674: pop rbp
0x1003f6675: ret 
0x1003f6676: nop word ptr cs:[rax + rax]
0x1003f6680: push rbp
0x1003f6681: mov rbp, rsp
0x1003f6684: push r15
0x1003f6686: push r14
0x1003f6688: push r12
0x1003f668a: push rbx