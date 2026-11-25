0x1006c3f70: push rbp
0x1006c3f71: mov rbp, rsp
0x1006c3f74: push r15
0x1006c3f76: push r14
0x1006c3f78: push r13
0x1006c3f7a: push r12
0x1006c3f7c: push rbx
0x1006c3f7d: sub rsp, 0x228
0x1006c3f84: mov r15, rdi
0x1006c3f87: mov rax, qword ptr [rip + 0x54994a] ; 0x100c0d8d8
0x1006c3f8e: mov rax, qword ptr [rax]
0x1006c3f91: mov qword ptr [rbp - 0x30], rax
0x1006c3f95: cmp byte ptr [r15 + 0x1096], 0
0x1006c3f9d: je 0x1006c3fc5
0x1006c3f9f: mov rax, qword ptr [rip + 0x549932] ; 0x100c0d8d8
0x1006c3fa6: mov rax, qword ptr [rax]
0x1006c3fa9: cmp rax, qword ptr [rbp - 0x30]
0x1006c3fad: jne 0x1006c43a0
0x1006c3fb3: add rsp, 0x228
0x1006c3fba: pop rbx
0x1006c3fbb: pop r12
0x1006c3fbd: pop r13
0x1006c3fbf: pop r14
0x1006c3fc1: pop r15
0x1006c3fc3: pop rbp
0x1006c3fc4: ret 
0x1006c3fc5: cmp byte ptr [r15 + 0x1088], 0
0x1006c3fcd: je 0x1006c3f9f
0x1006c3fcf: mov eax, dword ptr [r15 + 0x108c]
0x1006c3fd6: mov dword ptr [r15 + 0x1090], eax
0x1006c3fdd: lea rcx, [rip + 0x19370ec] ; 0x101ffb0d0
0x1006c3fe4: cmp byte ptr [rcx], 0
0x1006c3fe7: je 0x1006c3ff6
0x1006c3fe9: lea rcx, [rip + 0x5f4550] ; 0x100cb8540
0x1006c3ff0: vmovss xmm0, dword ptr [rcx]
0x1006c3ff4: jmp 0x1006c3ffe ; 0x1006c3ffe
0x1006c3ff6: vmovss xmm0, dword ptr [rip + 0x3e10c2] ; 0x100aa50c0
0x1006c3ffe: vmulss xmm0, xmm0, dword ptr [rsi + 0x20]
0x1006c4003: vmulss xmm0, xmm0, dword ptr [rsi + 0x14]
0x1006c4008: vmovss xmm1, dword ptr [rip + 0x3e2a8c] ; 0x100aa6a9c
0x1006c4010: vmaxss xmm0, xmm1, xmm0
0x1006c4014: vmovss xmm1, dword ptr [rip + 0x3e2a84] ; 0x100aa6aa0
0x1006c401c: vminss xmm0, xmm1, xmm0
0x1006c4020: vmovd xmm1, eax
0x1006c4024: vaddss xmm0, xmm0, xmm1
0x1006c4028: vmovss dword ptr [r15 + 0x108c], xmm0
0x1006c4031: vmovss xmm1, dword ptr [r15 + 0x18]
0x1006c4037: vucomiss xmm0, xmm1
0x1006c403b: jbe 0x1006c4060
0x1006c403d: cmp byte ptr [r15 + 0x1c], 0
0x1006c4042: je 0x1006c404f
0x1006c4044: call 0x100aa2744 ; 0x100aa2744 _fmodf
0x1006c4049: vmovaps xmm1, xmm0
0x1006c404d: jmp 0x1006c4057 ; 0x1006c4057
0x1006c404f: mov byte ptr [r15 + 0x1088], 0
0x1006c4057: vmovss dword ptr [r15 + 0x108c], xmm1
0x1006c4060: mov ebx, dword ptr [r15 + 0x480]
0x1006c4067: call 0x1007c6c20 ; 0x1007c6c20
0x1006c406c: shl rbx, 3
0x1006c4070: lea rcx, [rip + 0x1984ad9] ; 0x102048b50
0x1006c4077: mov rdx, qword ptr [rcx]
0x1006c407a: mov ecx, 8
0x1006c407f: mov rdi, rax
0x1006c4082: mov rsi, rbx
0x1006c4085: call 0x100795530 ; 0x100795530
0x1006c408a: mov r13, rax
0x1006c408d: mov ecx, dword ptr [r15 + 0x480]
0x1006c4094: test rcx, rcx
0x1006c4097: je 0x1006c4144
0x1006c409d: vmovss xmm0, dword ptr [r15 + 0x1090]
0x1006c40a6: lea rax, [r15 + 0x1c]
0x1006c40aa: xor edx, edx
0x1006c40ac: xor ebx, ebx
0x1006c40ae: nop 
0x1006c40b0: mov rsi, qword ptr [r15 + rdx*8 + 0x80]
0x1006c40b8: vmovss xmm1, dword ptr [rsi + 0x10]
0x1006c40bd: vucomiss xmm1, xmm0
0x1006c40c1: jb 0x1006c40e0
0x1006c40c3: vmovss xmm2, dword ptr [r15 + 0x108c]
0x1006c40cc: vucomiss xmm2, xmm1
0x1006c40d0: jbe 0x1006c40e0
0x1006c40d2: mov edi, ebx
0x1006c40d4: inc ebx
0x1006c40d6: mov qword ptr [r13 + rdi*8], rsi
0x1006c40db: jmp 0x1006c4120 ; 0x1006c4120
0x1006c40dd: nop dword ptr [rax]
0x1006c40e0: cmp byte ptr [rax], 0
0x1006c40e3: je 0x1006c4120
0x1006c40e5: vmovss xmm2, dword ptr [r15 + 0x108c]
0x1006c40ee: vucomiss xmm0, xmm2
0x1006c40f2: jbe 0x1006c4120
0x1006c40f4: vucomiss xmm1, xmm0
0x1006c40f8: jae 0x1006c4102
0x1006c40fa: vucomiss xmm2, xmm1
0x1006c40fe: ja 0x1006c40d2
0x1006c4100: jmp 0x1006c4120 ; 0x1006c4120
0x1006c4102: vucomiss xmm2, xmm1
0x1006c4106: ja 0x1006c40d2
0x1006c4108: vmovss xmm2, dword ptr [r15 + 0x18]
0x1006c410e: vucomiss xmm2, xmm1
0x1006c4112: jae 0x1006c40d2
0x1006c4114: nop word ptr cs:[rax + rax]
0x1006c4120: inc rdx
0x1006c4123: cmp rdx, rcx
0x1006c4126: jb 0x1006c40b0
0x1006c4128: cmp byte ptr [rax], 0
0x1006c412b: je 0x1006c414f
0x1006c412d: vmovss xmm0, dword ptr [r15 + 0x1090]
0x1006c4136: vucomiss xmm0, dword ptr [r15 + 0x108c]
0x1006c413f: seta al
0x1006c4142: jmp 0x1006c4151 ; 0x1006c4151
0x1006c4144: lea rax, [r15 + 0x1c]
0x1006c4148: xor ebx, ebx
0x1006c414a: cmp byte ptr [rax], 0
0x1006c414d: jne 0x1006c412d
0x1006c414f: xor eax, eax
0x1006c4151: mov byte ptr [rbp - 0x219], al
0x1006c4157: mov r14d, ebx
0x1006c415a: lea rsi, [r13 + r14*8]
0x1006c415f: lea rax, [rbp - 0x219]
0x1006c4166: mov qword ptr [rbp - 0x218], rax
0x1006c416d: mov qword ptr [rbp - 0x210], r15
0x1006c4174: lea rdx, [rbp - 0x218]
0x1006c417b: mov rdi, r13
0x1006c417e: call 0x1006c5d40 ; 0x1006c5d40
0x1006c4183: test ebx, ebx
0x1006c4185: je 0x1006c438b
0x1006c418b: lea rbx, [rbp - 0x210]
0x1006c4192: xor ecx, ecx
0x1006c4194: mov rax, qword ptr [rip + 0x546385] ; 0x100c0a520
0x1006c419b: lea rdx, [rax + 0x18]
0x1006c419f: mov qword ptr [rbp - 0x238], rdx
0x1006c41a6: add rax, 0x40
0x1006c41aa: mov qword ptr [rbp - 0x240], rax
0x1006c41b1: mov rax, qword ptr [rip + 0x549410] ; 0x100c0d5c8
0x1006c41b8: lea rax, [rax + 0x18]
0x1006c41bc: mov qword ptr [rbp - 0x230], rax
0x1006c41c3: mov rax, qword ptr [rip + 0x5463b6] ; 0x100c0a580
0x1006c41ca: add rax, 8
0x1006c41ce: mov qword ptr [rbp - 0x228], rax
0x1006c41d5: mov qword ptr [rbp - 0x248], r14
0x1006c41dc: nop dword ptr [rax]
0x1006c41e0: mov qword ptr [rbp - 0x250], rcx
0x1006c41e7: mov r12, qword ptr [r13 + rcx*8]
0x1006c41ec: cmp qword ptr [r12 + 8], 0
0x1006c41f2: je 0x1006c42a0
0x1006c41f8: mov r14, r13
0x1006c41fb: call 0x1007abc10 ; 0x1007abc10
0x1006c4200: mov r13, rax
0x1006c4203: mov qword ptr [rbp - 0x218], 0
0x1006c420e: call 0x100534700 ; 0x100534700
0x1006c4213: add r12, 8
0x1006c4217: mov rbx, qword ptr [rax]
0x1006c421a: mov rdi, rax
0x1006c421d: lea rsi, [rbp - 0x218]
0x1006c4224: mov rdx, r12
0x1006c4227: mov rcx, r13
0x1006c422a: call qword ptr [rbx + 0x40]
0x1006c422d: mov rax, qword ptr [rbp - 0x218]
0x1006c4234: test rax, rax
0x1006c4237: je 0x1006c423d
0x1006c4239: mov qword ptr [rax + 0x58], r15
0x1006c423d: mov r13, r14
0x1006c4240: call 0x1007abc10 ; 0x1007abc10
0x1006c4245: mov rbx, rax
0x1006c4248: mov qword ptr [rbp - 0x218], 0
0x1006c4253: call 0x100534c50 ; 0x100534c50
0x1006c4258: mov r8, qword ptr [rax]
0x1006c425b: mov rdi, rax
0x1006c425e: lea rsi, [rbp - 0x218]
0x1006c4265: mov rdx, r12
0x1006c4268: mov rcx, rbx
0x1006c426b: call qword ptr [r8 + 0x40]
0x1006c426f: mov rax, qword ptr [rbp - 0x218]
0x1006c4276: test rax, rax
0x1006c4279: je 0x1006c427f
0x1006c427b: mov qword ptr [rax + 0x70], r15
0x1006c427f: mov rdi, qword ptr [r12]
0x1006c4283: mov esi, 1
0x1006c4288: call 0x1004d1f60 ; 0x1004d1f60
0x1006c428d: mov r14, qword ptr [rbp - 0x248]
0x1006c4294: lea rbx, [rbp - 0x210]
0x1006c429b: jmp 0x1006c4378 ; 0x1006c4378
0x1006c42a0: mov rax, qword ptr [rbp - 0x238]
0x1006c42a7: mov qword ptr [rbp - 0x218], rax
0x1006c42ae: mov rax, qword ptr [rbp - 0x240]
0x1006c42b5: mov qword ptr [rbp - 0xc8], rax
0x1006c42bc: lea rdi, [rbp - 0xc8]
0x1006c42c3: mov rsi, rbx
0x1006c42c6: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1006c42cb: mov qword ptr [rbp - 0x40], 0
0x1006c42d3: mov dword ptr [rbp - 0x38], 0xffffffff
0x1006c42da: mov rax, qword ptr [rbp - 0x230]
0x1006c42e1: mov qword ptr [rbp - 0x218], rax
0x1006c42e8: mov rdi, rbx
0x1006c42eb: mov rax, qword ptr [rip + 0x5492d6] ; 0x100c0d5c8
0x1006c42f2: lea rbx, [rax + 0x40]
0x1006c42f6: mov qword ptr [rbp - 0xc8], rbx
0x1006c42fd: mov edx, 1
0x1006c4302: lea rsi, [rip + 0x4d6b31] ; 0x100b9ae3a Timeline
0x1006c4309: call 0x1007a56a0 ; 0x1007a56a0
0x1006c430e: mov edx, 0x39
0x1006c4313: lea rdi, [rbp - 0x218]
0x1006c431a: lea rsi, [rip + 0x4d6ba1] ; 0x100b9aec2 Failed enabling timeline node; node doesn't exist. Time: 
0x1006c4321: call 0x100011930 ; 0x100011930
0x1006c4326: vmovss xmm0, dword ptr [r12 + 0x10]
0x1006c432d: mov rdi, rax
0x1006c4330: call 0x100aa23d2 ; 0x100aa23d2 __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEf
0x1006c4335: mov rax, qword ptr [rbp - 0x230]
0x1006c433c: mov qword ptr [rbp - 0x218], rax
0x1006c4343: mov qword ptr [rbp - 0xc8], rbx
0x1006c434a: lea rbx, [rbp - 0x210]
0x1006c4351: mov rdi, rbx
0x1006c4354: call 0x1007a58d0 ; 0x1007a58d0
0x1006c4359: lea rdi, [rbp - 0x218]
0x1006c4360: mov rsi, qword ptr [rbp - 0x228]
0x1006c4367: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006c436c: lea rdi, [rbp - 0xc8]
0x1006c4373: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006c4378: mov rcx, qword ptr [rbp - 0x250]
0x1006c437f: inc rcx
0x1006c4382: cmp rcx, r14
0x1006c4385: jb 0x1006c41e0
0x1006c438b: call 0x1007c6c20 ; 0x1007c6c20
0x1006c4390: mov rdi, rax
0x1006c4393: mov rsi, r13
0x1006c4396: call 0x100795a70 ; 0x100795a70
0x1006c439b: jmp 0x1006c3f9f ; 0x1006c3f9f
0x1006c43a0: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1006c43a5: mov rdi, rax
0x1006c43a8: call 0x100011bf0 ; 0x100011bf0
0x1006c43ad: mov r15, rax
0x1006c43b0: jmp 0x1006c43dd ; 0x1006c43dd
0x1006c43b2: mov r15, rax
0x1006c43b5: jmp 0x1006c43f0 ; 0x1006c43f0
0x1006c43b7: jmp 0x1006c43fe ; 0x1006c43fe
0x1006c43b9: mov r15, rax
0x1006c43bc: mov rax, qword ptr [rbp - 0x230]
0x1006c43c3: mov qword ptr [rbp - 0x218], rax
0x1006c43ca: mov qword ptr [rbp - 0xc8], rbx
0x1006c43d1: lea rdi, [rbp - 0x210]
0x1006c43d8: call 0x1007a58d0 ; 0x1007a58d0
0x1006c43dd: lea rdi, [rbp - 0x218]
0x1006c43e4: mov rsi, qword ptr [rbp - 0x228]
0x1006c43eb: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006c43f0: lea rdi, [rbp - 0xc8]
0x1006c43f7: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006c43fc: jmp 0x1006c4409 ; 0x1006c4409
0x1006c43fe: mov r15, rax
0x1006c4401: jmp 0x1006c4409 ; 0x1006c4409
0x1006c4403: mov r15, rax
0x1006c4406: mov r13, r14
0x1006c4409: call 0x1007c6c20 ; 0x1007c6c20
0x1006c440e: mov rdi, rax
0x1006c4411: mov rsi, r13
0x1006c4414: call 0x100795a70 ; 0x100795a70
0x1006c4419: mov rdi, r15
0x1006c441c: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006c4421: mov rdi, rax
0x1006c4424: call 0x100011bf0 ; 0x100011bf0
0x1006c4429: nop dword ptr [rax]
