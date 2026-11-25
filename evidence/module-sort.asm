0x1007b3dc0: push rbp
0x1007b3dc1: mov rbp, rsp
0x1007b3dc4: push r15
0x1007b3dc6: push r14
0x1007b3dc8: push r13
0x1007b3dca: push r12
0x1007b3dcc: push rbx
0x1007b3dcd: sub rsp, 0x28
0x1007b3dd1: mov r13, rdx
0x1007b3dd4: mov r14, rdi
0x1007b3dd7: jmp 0x1007b3df0 ; 0x1007b3df0
0x1007b3dd9: lea rdi, [r12 + 8]
0x1007b3dde: mov rdx, r13
0x1007b3de1: call 0x1007b3dc0 ; 0x1007b3dc0
0x1007b3de6: mov rsi, r12
0x1007b3de9: nop dword ptr [rax]
0x1007b3df0: lea rax, [rsi - 8]
0x1007b3df4: mov qword ptr [rbp - 0x38], rax
0x1007b3df8: mov qword ptr [rbp - 0x40], rsi
0x1007b3dfc: lea rax, [rsi - 0x10]
0x1007b3e00: mov qword ptr [rbp - 0x48], rax
0x1007b3e04: mov r15, r14
0x1007b3e07: jmp 0x1007b3e20 ; 0x1007b3e20
0x1007b3e09: mov rdi, r14
0x1007b3e0c: mov rsi, r12
0x1007b3e0f: mov rdx, r13
0x1007b3e12: call 0x1007b3dc0 ; 0x1007b3dc0
0x1007b3e17: add r12, 8
0x1007b3e1b: mov r15, r12
0x1007b3e1e: nop 
0x1007b3e20: mov r14, r15
0x1007b3e23: mov rsi, qword ptr [rbp - 0x40]
0x1007b3e27: mov rcx, rsi
0x1007b3e2a: sub rcx, r14
0x1007b3e2d: mov rax, rcx
0x1007b3e30: sar rax, 3
0x1007b3e34: cmp rax, 5
0x1007b3e38: jbe 0x1007b424c
0x1007b3e3e: cmp rcx, 0xf7
0x1007b3e45: jle 0x1007b4281
0x1007b3e4b: mov rdx, rax
0x1007b3e4e: shr rdx, 0x3f
0x1007b3e52: add rdx, rax
0x1007b3e55: movabs rsi, 0x3ffffffffffffffe
0x1007b3e5f: and rdx, rsi
0x1007b3e62: lea rbx, [r14 + rdx*4]
0x1007b3e66: cmp rcx, 0x1f39
0x1007b3e6d: jl 0x1007b3f30
0x1007b3e73: mov r12, rax
0x1007b3e76: sar r12, 0x3f
0x1007b3e7a: shr r12, 0x3e
0x1007b3e7e: add r12, rax
0x1007b3e81: add r12, r12
0x1007b3e84: and r12, 0xfffffffffffffff8
0x1007b3e88: lea r15, [r14 + r12]
0x1007b3e8c: add r12, rbx
0x1007b3e8f: mov rdi, r14
0x1007b3e92: mov rsi, r15
0x1007b3e95: mov rdx, rbx
0x1007b3e98: mov rcx, r12
0x1007b3e9b: mov r8, r13
0x1007b3e9e: call 0x1007b4410 ; 0x1007b4410
0x1007b3ea3: mov dword ptr [rbp - 0x2c], eax
0x1007b3ea6: mov rdi, qword ptr [rbp - 0x38]
0x1007b3eaa: mov rsi, r12
0x1007b3ead: call qword ptr [r13]
0x1007b3eb1: test al, al
0x1007b3eb3: je 0x1007b4000
0x1007b3eb9: mov rax, qword ptr [r12]
0x1007b3ebd: mov rdx, qword ptr [rbp - 0x38]
0x1007b3ec1: mov rcx, qword ptr [rdx]
0x1007b3ec4: mov qword ptr [r12], rcx
0x1007b3ec8: mov qword ptr [rdx], rax
0x1007b3ecb: mov rdi, r12
0x1007b3ece: mov rsi, rbx
0x1007b3ed1: call qword ptr [r13]
0x1007b3ed5: test al, al
0x1007b3ed7: je 0x1007b3fb2
0x1007b3edd: mov rax, qword ptr [rbx]
0x1007b3ee0: mov rcx, qword ptr [r12]
0x1007b3ee4: mov qword ptr [rbx], rcx
0x1007b3ee7: mov qword ptr [r12], rax
0x1007b3eeb: mov rdi, rbx
0x1007b3eee: mov rsi, r15
0x1007b3ef1: call qword ptr [r13]
0x1007b3ef5: test al, al
0x1007b3ef7: je 0x1007b3fef
0x1007b3efd: mov rax, qword ptr [r15]
0x1007b3f00: mov rcx, qword ptr [rbx]
0x1007b3f03: mov qword ptr [r15], rcx
0x1007b3f06: mov qword ptr [rbx], rax
0x1007b3f09: mov rdi, r15
0x1007b3f0c: mov rsi, r14
0x1007b3f0f: call qword ptr [r13]
0x1007b3f13: test al, al
0x1007b3f15: je 0x1007b3ff5
0x1007b3f1b: mov rax, qword ptr [r14]
0x1007b3f1e: mov rcx, qword ptr [r15]
0x1007b3f21: mov qword ptr [r14], rcx
0x1007b3f24: mov qword ptr [r15], rax
0x1007b3f27: add dword ptr [rbp - 0x2c], 4
0x1007b3f2b: jmp 0x1007b4000 ; 0x1007b4000
0x1007b3f30: mov rdi, rbx
0x1007b3f33: mov rsi, r14
0x1007b3f36: call qword ptr [r13]
0x1007b3f3a: mov r15d, eax
0x1007b3f3d: mov rdi, qword ptr [rbp - 0x38]
0x1007b3f41: mov rsi, rbx
0x1007b3f44: call qword ptr [r13]
0x1007b3f48: test r15b, r15b
0x1007b3f4b: je 0x1007b3f70
0x1007b3f4d: mov rcx, qword ptr [r14]
0x1007b3f50: test al, al
0x1007b3f52: je 0x1007b3fb7
0x1007b3f54: mov rdx, qword ptr [rbp - 0x38]
0x1007b3f58: mov rax, qword ptr [rdx]
0x1007b3f5b: mov qword ptr [r14], rax
0x1007b3f5e: mov qword ptr [rdx], rcx
0x1007b3f61: mov dword ptr [rbp - 0x2c], 1
0x1007b3f68: jmp 0x1007b4000 ; 0x1007b4000
0x1007b3f6d: nop dword ptr [rax]
0x1007b3f70: mov dword ptr [rbp - 0x2c], 0
0x1007b3f77: test al, al
0x1007b3f79: je 0x1007b4000
0x1007b3f7f: mov rax, qword ptr [rbx]
0x1007b3f82: mov rdx, qword ptr [rbp - 0x38]
0x1007b3f86: mov rcx, qword ptr [rdx]
0x1007b3f89: mov qword ptr [rbx], rcx
0x1007b3f8c: mov qword ptr [rdx], rax
0x1007b3f8f: mov rdi, rbx
0x1007b3f92: mov rsi, r14
0x1007b3f95: call qword ptr [r13]
0x1007b3f99: mov dword ptr [rbp - 0x2c], 1
0x1007b3fa0: test al, al
0x1007b3fa2: je 0x1007b4000
0x1007b3fa4: mov rax, qword ptr [r14]
0x1007b3fa7: mov rcx, qword ptr [rbx]
0x1007b3faa: mov qword ptr [r14], rcx
0x1007b3fad: mov qword ptr [rbx], rax
0x1007b3fb0: jmp 0x1007b3fe6 ; 0x1007b3fe6
0x1007b3fb2: inc dword ptr [rbp - 0x2c]
0x1007b3fb5: jmp 0x1007b4000 ; 0x1007b4000
0x1007b3fb7: mov rax, qword ptr [rbx]
0x1007b3fba: mov qword ptr [r14], rax
0x1007b3fbd: mov qword ptr [rbx], rcx
0x1007b3fc0: mov rdi, qword ptr [rbp - 0x38]
0x1007b3fc4: mov rsi, rbx
0x1007b3fc7: call qword ptr [r13]
0x1007b3fcb: mov dword ptr [rbp - 0x2c], 1
0x1007b3fd2: test al, al
0x1007b3fd4: je 0x1007b4000
0x1007b3fd6: mov rax, qword ptr [rbx]
0x1007b3fd9: mov rdx, qword ptr [rbp - 0x38]
0x1007b3fdd: mov rcx, qword ptr [rdx]
0x1007b3fe0: mov qword ptr [rbx], rcx
0x1007b3fe3: mov qword ptr [rdx], rax
0x1007b3fe6: mov dword ptr [rbp - 0x2c], 2
0x1007b3fed: jmp 0x1007b4000 ; 0x1007b4000
0x1007b3fef: add dword ptr [rbp - 0x2c], 2
0x1007b3ff3: jmp 0x1007b4000 ; 0x1007b4000
0x1007b3ff5: add dword ptr [rbp - 0x2c], 3
0x1007b3ff9: nop dword ptr [rax]
0x1007b4000: mov rdi, r14
0x1007b4003: mov rsi, rbx
0x1007b4006: call qword ptr [r13]
0x1007b400a: test al, al
0x1007b400c: je 0x1007b4030
0x1007b400e: mov r15, qword ptr [rbp - 0x38]
0x1007b4012: lea r12, [r14 + 8]
0x1007b4016: cmp r12, r15
0x1007b4019: jb 0x1007b40ec
0x1007b401f: jmp 0x1007b4127 ; 0x1007b4127
0x1007b4024: nop word ptr cs:[rax + rax]
0x1007b4030: mov rax, qword ptr [rbp - 0x48]
0x1007b4034: mov r15, rax
0x1007b4037: cmp r14, rax
0x1007b403a: je 0x1007b4057
0x1007b403c: nop dword ptr [rax]
0x1007b4040: mov rdi, r15
0x1007b4043: mov rsi, rbx
0x1007b4046: call qword ptr [r13]
0x1007b404a: test al, al
0x1007b404c: jne 0x1007b40b2
0x1007b404e: add r15, -8
0x1007b4052: cmp r14, r15
0x1007b4055: jne 0x1007b4040
0x1007b4057: lea r12, [r14 + 8]
0x1007b405b: mov rdi, r14
0x1007b405e: mov rbx, qword ptr [rbp - 0x38]
0x1007b4062: mov rsi, rbx
0x1007b4065: call qword ptr [r13]
0x1007b4069: test al, al
0x1007b406b: jne 0x1007b41cd
0x1007b4071: cmp r12, rbx
0x1007b4074: mov rbx, qword ptr [rbp - 0x40]
0x1007b4078: je 0x1007b43e4
0x1007b407e: lea r12, [r14 + 0x10]
0x1007b4082: nop word ptr cs:[rax + rax]
0x1007b4090: lea rsi, [r12 - 8]
0x1007b4095: mov rdi, r14
0x1007b4098: call qword ptr [r13]
0x1007b409c: test al, al
0x1007b409e: jne 0x1007b41b9
0x1007b40a4: add r12, 8
0x1007b40a8: cmp rbx, r12
0x1007b40ab: jne 0x1007b4090
0x1007b40ad: jmp 0x1007b43e4 ; 0x1007b43e4
0x1007b40b2: mov rax, qword ptr [r14]
0x1007b40b5: mov rcx, qword ptr [r15]
0x1007b40b8: mov qword ptr [r14], rcx
0x1007b40bb: mov qword ptr [r15], rax
0x1007b40be: inc dword ptr [rbp - 0x2c]
0x1007b40c1: lea r12, [r14 + 8]
0x1007b40c5: cmp r12, r15
0x1007b40c8: jb 0x1007b40ec
0x1007b40ca: jmp 0x1007b4127 ; 0x1007b4127
0x1007b40cc: nop dword ptr [rax]
0x1007b40d0: mov rax, qword ptr [r12]
0x1007b40d4: mov rcx, qword ptr [r15]
0x1007b40d7: mov qword ptr [r12], rcx
0x1007b40db: mov qword ptr [r15], rax
0x1007b40de: inc dword ptr [rbp - 0x2c]
0x1007b40e1: cmp rbx, r12
0x1007b40e4: cmove rbx, r15
0x1007b40e8: mov r12, qword ptr [rbp - 0x50]
0x1007b40ec: add r12, -8
0x1007b40f0: add r12, 8
0x1007b40f4: mov rdi, r12
0x1007b40f7: mov rsi, rbx
0x1007b40fa: call qword ptr [r13]
0x1007b40fe: test al, al
0x1007b4100: jne 0x1007b40f0
0x1007b4102: lea rax, [r12 + 8]
0x1007b4107: mov qword ptr [rbp - 0x50], rax
0x1007b410b: nop dword ptr [rax + rax]
0x1007b4110: add r15, -8
0x1007b4114: mov rdi, r15
0x1007b4117: mov rsi, rbx
0x1007b411a: call qword ptr [r13]
0x1007b411e: test al, al
0x1007b4120: je 0x1007b4110
0x1007b4122: cmp r12, r15
0x1007b4125: jbe 0x1007b40d0
0x1007b4127: cmp r12, rbx
0x1007b412a: je 0x1007b4160
0x1007b412c: mov rdi, rbx
0x1007b412f: mov rsi, r12
0x1007b4132: call qword ptr [r13]
0x1007b4136: test al, al
0x1007b4138: je 0x1007b4160
0x1007b413a: mov rax, qword ptr [r12]
0x1007b413e: mov rcx, qword ptr [rbx]
0x1007b4141: mov qword ptr [r12], rcx
0x1007b4145: mov qword ptr [rbx], rax
0x1007b4148: mov eax, dword ptr [rbp - 0x2c]
0x1007b414b: inc eax
0x1007b414d: test eax, eax
0x1007b414f: je 0x1007b4167
0x1007b4151: jmp 0x1007b419b ; 0x1007b419b
0x1007b4153: nop word ptr cs:[rax + rax]
0x1007b4160: mov eax, dword ptr [rbp - 0x2c]
0x1007b4163: test eax, eax
0x1007b4165: jne 0x1007b419b
0x1007b4167: mov rdi, r14
0x1007b416a: mov rsi, r12
0x1007b416d: mov rdx, r13
0x1007b4170: call 0x1007b46a0 ; 0x1007b46a0
0x1007b4175: mov ebx, eax
0x1007b4177: lea r15, [r12 + 8]
0x1007b417c: mov rdi, r15
0x1007b417f: mov rsi, qword ptr [rbp - 0x40]
0x1007b4183: mov rdx, r13
0x1007b4186: call 0x1007b46a0 ; 0x1007b46a0
0x1007b418b: test al, al
0x1007b418d: jne 0x1007b423c
0x1007b4193: test bl, bl
0x1007b4195: jne 0x1007b3e20
0x1007b419b: mov rax, r12
0x1007b419e: sub rax, r14
0x1007b41a1: mov rsi, qword ptr [rbp - 0x40]
0x1007b41a5: mov rcx, rsi
0x1007b41a8: sub rcx, r12
0x1007b41ab: cmp rax, rcx
0x1007b41ae: jl 0x1007b3e09
0x1007b41b4: jmp 0x1007b3dd9 ; 0x1007b3dd9
0x1007b41b9: mov rax, qword ptr [r12 - 8]
0x1007b41be: mov rbx, qword ptr [rbp - 0x38]
0x1007b41c2: mov rcx, qword ptr [rbx]
0x1007b41c5: mov qword ptr [r12 - 8], rcx
0x1007b41ca: mov qword ptr [rbx], rax
0x1007b41cd: cmp r12, rbx
0x1007b41d0: je 0x1007b43e4
0x1007b41d6: mov rbx, qword ptr [rbp - 0x38]
0x1007b41da: jmp 0x1007b41ec ; 0x1007b41ec
0x1007b41dc: nop dword ptr [rax]
0x1007b41e0: mov rax, qword ptr [r15]
0x1007b41e3: mov rcx, qword ptr [rbx]
0x1007b41e6: mov qword ptr [r15], rcx
0x1007b41e9: mov qword ptr [rbx], rax
0x1007b41ec: add r12, -8
0x1007b41f0: mov r15, r12
0x1007b41f3: nop word ptr cs:[rax + rax]
0x1007b4200: add r15, 8
0x1007b4204: mov rdi, r14
0x1007b4207: mov rsi, r15
0x1007b420a: call qword ptr [r13]
0x1007b420e: test al, al
0x1007b4210: je 0x1007b4200
0x1007b4212: lea r12, [r15 + 8]
0x1007b4216: nop word ptr cs:[rax + rax]
0x1007b4220: add rbx, -8
0x1007b4224: mov rdi, r14
0x1007b4227: mov rsi, rbx
0x1007b422a: call qword ptr [r13]
0x1007b422e: test al, al
0x1007b4230: jne 0x1007b4220
0x1007b4232: cmp r15, rbx
0x1007b4235: jb 0x1007b41e0
0x1007b4237: jmp 0x1007b3e20 ; 0x1007b3e20
0x1007b423c: mov rsi, r12
0x1007b423f: test bl, bl
0x1007b4241: je 0x1007b3df0
0x1007b4247: jmp 0x1007b43e4 ; 0x1007b43e4
0x1007b424c: lea rcx, [rip + 0x1a1] ; 0x1007b43f4
0x1007b4253: movsxd rax, dword ptr [rcx + rax*4]
0x1007b4257: add rax, rcx
0x1007b425a: jmp rax
0x1007b425c: mov rdi, qword ptr [rbp - 0x38]
0x1007b4260: mov rsi, r14
0x1007b4263: call qword ptr [r13]
0x1007b4267: test al, al
0x1007b4269: je 0x1007b43e4
0x1007b426f: mov rax, qword ptr [r14]
0x1007b4272: mov rdx, qword ptr [rbp - 0x38]
0x1007b4276: mov rcx, qword ptr [rdx]
0x1007b4279: mov qword ptr [r14], rcx
0x1007b427c: jmp 0x1007b43e1 ; 0x1007b43e1
0x1007b4281: mov rdi, r14
0x1007b4284: mov rdx, r13
0x1007b4287: add rsp, 0x28
0x1007b428b: pop rbx
0x1007b428c: pop r12
0x1007b428e: pop r13
0x1007b4290: pop r14
0x1007b4292: pop r15
0x1007b4294: pop rbp
0x1007b4295: jmp 0x1007b4550 ; 0x1007b4550
0x1007b429a: lea r15, [r14 + 8]
0x1007b429e: mov rdi, r15
0x1007b42a1: mov rsi, r14
0x1007b42a4: call qword ptr [r13]
0x1007b42a8: mov ebx, eax
0x1007b42aa: mov rdi, qword ptr [rbp - 0x38]
0x1007b42ae: mov rsi, r15
0x1007b42b1: call qword ptr [r13]
0x1007b42b5: test bl, bl
0x1007b42b7: je 0x1007b4386
0x1007b42bd: mov rcx, qword ptr [r14]
0x1007b42c0: test al, al
0x1007b42c2: je 0x1007b43ba
0x1007b42c8: mov rdx, qword ptr [rbp - 0x38]
0x1007b42cc: mov rax, qword ptr [rdx]
0x1007b42cf: mov qword ptr [r14], rax
0x1007b42d2: mov qword ptr [rdx], rcx
0x1007b42d5: jmp 0x1007b43e4 ; 0x1007b43e4
0x1007b42da: lea r15, [r14 + 8]
0x1007b42de: lea r12, [r14 + 0x10]
0x1007b42e2: lea rbx, [r14 + 0x18]
0x1007b42e6: mov rdi, r14
0x1007b42e9: mov rsi, r15
0x1007b42ec: mov rdx, r12
0x1007b42ef: mov rcx, rbx
0x1007b42f2: mov r8, r13
0x1007b42f5: call 0x1007b4410 ; 0x1007b4410
0x1007b42fa: mov rdi, qword ptr [rbp - 0x38]
0x1007b42fe: mov rsi, rbx
0x1007b4301: call qword ptr [r13]
0x1007b4305: test al, al
0x1007b4307: je 0x1007b43e4
0x1007b430d: mov rax, qword ptr [rbx]
0x1007b4310: mov rdx, qword ptr [rbp - 0x38]
0x1007b4314: mov rcx, qword ptr [rdx]
0x1007b4317: mov qword ptr [rbx], rcx
0x1007b431a: mov qword ptr [rdx], rax
0x1007b431d: mov rdi, rbx
0x1007b4320: mov rsi, r12
0x1007b4323: call qword ptr [r13]
0x1007b4327: test al, al
0x1007b4329: je 0x1007b43e4
0x1007b432f: mov rax, qword ptr [r12]
0x1007b4333: mov rcx, qword ptr [rbx]
0x1007b4336: mov qword ptr [r12], rcx
0x1007b433a: mov qword ptr [rbx], rax
0x1007b433d: mov rdi, r12
0x1007b4340: mov rsi, r15
0x1007b4343: call qword ptr [r13]
0x1007b4347: test al, al
0x1007b4349: je 0x1007b43e4
0x1007b434f: mov rax, qword ptr [r14 + 8]
0x1007b4353: mov rcx, qword ptr [r14 + 0x10]
0x1007b4357: mov qword ptr [r14 + 8], rcx
0x1007b435b: mov qword ptr [r14 + 0x10], rax
0x1007b435f: jmp 0x1007b439c ; 0x1007b439c
0x1007b4361: lea rsi, [r14 + 8]
0x1007b4365: lea rdx, [r14 + 0x10]
0x1007b4369: mov rdi, r14
0x1007b436c: mov rcx, qword ptr [rbp - 0x38]
0x1007b4370: mov r8, r13
0x1007b4373: add rsp, 0x28
0x1007b4377: pop rbx
0x1007b4378: pop r12
0x1007b437a: pop r13
0x1007b437c: pop r14
0x1007b437e: pop r15
0x1007b4380: pop rbp
0x1007b4381: jmp 0x1007b4410 ; 0x1007b4410
0x1007b4386: test al, al
0x1007b4388: je 0x1007b43e4
0x1007b438a: mov rax, qword ptr [r14 + 8]
0x1007b438e: mov rdx, qword ptr [rbp - 0x38]
0x1007b4392: mov rcx, qword ptr [rdx]
0x1007b4395: mov qword ptr [r14 + 8], rcx
0x1007b4399: mov qword ptr [rdx], rax
0x1007b439c: mov rdi, r15
0x1007b439f: mov rsi, r14
0x1007b43a2: call qword ptr [r13]
0x1007b43a6: test al, al
0x1007b43a8: je 0x1007b43e4
0x1007b43aa: mov rax, qword ptr [r14]
0x1007b43ad: mov rcx, qword ptr [r14 + 8]
0x1007b43b1: mov qword ptr [r14], rcx
0x1007b43b4: mov qword ptr [r14 + 8], rax
0x1007b43b8: jmp 0x1007b43e4 ; 0x1007b43e4
0x1007b43ba: mov rax, qword ptr [r14 + 8]
0x1007b43be: mov qword ptr [r14], rax
0x1007b43c1: mov qword ptr [r14 + 8], rcx
0x1007b43c5: mov rdi, qword ptr [rbp - 0x38]
0x1007b43c9: mov rsi, r15
0x1007b43cc: call qword ptr [r13]
0x1007b43d0: test al, al
0x1007b43d2: je 0x1007b43e4
0x1007b43d4: mov rax, qword ptr [r15]
0x1007b43d7: mov rdx, qword ptr [rbp - 0x38]
0x1007b43db: mov rcx, qword ptr [rdx]
0x1007b43de: mov qword ptr [r15], rcx
0x1007b43e1: mov qword ptr [rdx], rax
0x1007b43e4: add rsp, 0x28
0x1007b43e8: pop rbx
0x1007b43e9: pop r12
0x1007b43eb: pop r13
0x1007b43ed: pop r14
0x1007b43ef: pop r15
0x1007b43f1: pop rbp
0x1007b43f2: ret 
0x1007b43f3: nop 
