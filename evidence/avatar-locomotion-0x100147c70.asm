0x100147c70: push rbp
0x100147c71: mov rbp, rsp
0x100147c74: push r15
0x100147c76: push r14
0x100147c78: push r13
0x100147c7a: push r12
0x100147c7c: push rbx
0x100147c7d: sub rsp, 0x208
0x100147c84: mov r12, rcx
0x100147c87: mov r14, rsi
0x100147c8a: mov rbx, rdi
0x100147c8d: mov rax, qword ptr [rip + 0xac5c44] ; 0x100c0d8d8
0x100147c94: mov rax, qword ptr [rax]
0x100147c97: mov qword ptr [rbp - 0x30], rax
0x100147c9b: test r12, r12
0x100147c9e: je 0x100147f1c
0x100147ca4: vmovaps xmm3, xmmword ptr [rbx + 0x10]
0x100147ca9: vmovaps xmm2, xmmword ptr [rbx + 0x60]
0x100147cae: vmovaps xmmword ptr [rbx + 0xbd0], xmm3
0x100147cb6: vmovaps xmmword ptr [rbx + 0xbe0], xmm2
0x100147cbe: vmovaps xmm2, xmmword ptr [rdx]
0x100147cc2: vmovaps xmmword ptr [rbx + 0xbf0], xmm2
0x100147cca: mov byte ptr [rbx + 0xbc8], 1
0x100147cd1: mov byte ptr [rbx + 0xc10], r8b
0x100147cd8: mov dword ptr [rbx + 0xc14], 0
0x100147ce2: vmovss dword ptr [rbp - 0x220], xmm0
0x100147cea: vmovss dword ptr [rbx + 0xc18], xmm0
0x100147cf2: vmovss dword ptr [rbp - 0x21c], xmm1
0x100147cfa: vmovss dword ptr [rbx + 0xc1c], xmm1
0x100147d02: lea rdi, [rbp - 0xc8]
0x100147d09: mov rax, qword ptr [rip + 0xac2810] ; 0x100c0a520
0x100147d10: lea rcx, [rax + 0x18]
0x100147d14: mov qword ptr [rbp - 0x218], rcx
0x100147d1b: lea r13, [rbp - 0x210]
0x100147d22: add rax, 0x40
0x100147d26: mov qword ptr [rbp - 0xc8], rax
0x100147d2d: mov rsi, r13
0x100147d30: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x100147d35: mov qword ptr [rbp - 0x230], r14
0x100147d3c: mov qword ptr [rbp - 0x40], 0
0x100147d44: mov dword ptr [rbp - 0x38], 0xffffffff
0x100147d4b: mov r15, qword ptr [rip + 0xac5876] ; 0x100c0d5c8
0x100147d52: lea rax, [r15 + 0x18]
0x100147d56: mov qword ptr [rbp - 0x228], rax
0x100147d5d: mov qword ptr [rbp - 0x218], rax
0x100147d64: add r15, 0x40
0x100147d68: mov qword ptr [rbp - 0xc8], r15
0x100147d6f: lea rsi, [rip + 0xa18c90] ; 0x100b60a06 DEV
0x100147d76: mov edx, 8
0x100147d7b: mov rdi, r13
0x100147d7e: call 0x1007a56a0 ; 0x1007a56a0
0x100147d83: lea rsi, [rip + 0xa17965] ; 0x100b5f6ef duration
0x100147d8a: lea rdi, [rbp - 0x218]
0x100147d91: mov edx, 8
0x100147d96: call 0x100011930 ; 0x100011930
0x100147d9b: lea rsi, [rip + 0xa18c6a] ; 0x100b60a0c : 
0x100147da2: mov edx, 2
0x100147da7: mov rdi, rax
0x100147daa: call 0x100011930 ; 0x100011930
0x100147daf: mov rdi, rax
0x100147db2: vmovss xmm0, dword ptr [rbp - 0x220]
0x100147dba: call 0x100aa23d2 ; 0x100aa23d2 __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEf
0x100147dbf: lea rsi, [rip + 0xa18c49] ; 0x100b60a0f  
0x100147dc6: mov edx, 1
0x100147dcb: mov rdi, rax
0x100147dce: call 0x100011930 ; 0x100011930
0x100147dd3: lea rsi, [rip + 0xa2d492] ; 0x100b7526c delay
0x100147dda: mov edx, 5
0x100147ddf: mov rdi, rax
0x100147de2: call 0x100011930 ; 0x100011930
0x100147de7: lea rsi, [rip + 0xa18c1e] ; 0x100b60a0c : 
0x100147dee: mov edx, 2
0x100147df3: mov rdi, rax
0x100147df6: call 0x100011930 ; 0x100011930
0x100147dfb: mov rdi, rax
0x100147dfe: vmovss xmm0, dword ptr [rbp - 0x21c]
0x100147e06: call 0x100aa23d2 ; 0x100aa23d2 __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEf
0x100147e0b: lea rsi, [rip + 0xa18bfd] ; 0x100b60a0f  
0x100147e12: mov edx, 1
0x100147e17: mov rdi, rax
0x100147e1a: call 0x100011930 ; 0x100011930
0x100147e1f: lea rsi, [rip + 0xa2d43d] ; 0x100b75263 animName
0x100147e26: mov edx, 8
0x100147e2b: mov rdi, rax
0x100147e2e: call 0x100011930 ; 0x100011930
0x100147e33: lea rsi, [rip + 0xa18bd2] ; 0x100b60a0c : 
0x100147e3a: mov edx, 2
0x100147e3f: mov rdi, rax
0x100147e42: call 0x100011930 ; 0x100011930
0x100147e47: mov r14, rax
0x100147e4a: mov rdi, r12
0x100147e4d: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x100147e52: mov rdi, r14
0x100147e55: mov rsi, r12
0x100147e58: mov rdx, rax
0x100147e5b: call 0x100011930 ; 0x100011930
0x100147e60: lea rsi, [rip + 0xa18ba8] ; 0x100b60a0f  
0x100147e67: mov edx, 1
0x100147e6c: mov rdi, rax
0x100147e6f: call 0x100011930 ; 0x100011930
0x100147e74: mov rax, qword ptr [rbp - 0x228]
0x100147e7b: mov qword ptr [rbp - 0x218], rax
0x100147e82: mov qword ptr [rbp - 0xc8], r15
0x100147e89: lea rdi, [rbp - 0x210]
0x100147e90: call 0x1007a58d0 ; 0x1007a58d0
0x100147e95: mov rsi, qword ptr [rip + 0xac26e4] ; 0x100c0a580
0x100147e9c: add rsi, 8
0x100147ea0: lea rdi, [rbp - 0x218]
0x100147ea7: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x100147eac: lea rdi, [rbp - 0xc8]
0x100147eb3: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100147eb8: mov rdi, r12
0x100147ebb: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x100147ec0: inc eax
0x100147ec2: cmp eax, 0x41
0x100147ec5: jae 0x100147f3b
0x100147ec7: lea rdi, [rbx + 0xc20]
0x100147ece: mov rsi, r12
0x100147ed1: call 0x100aa2c5a ; 0x100aa2c5a _strcpy
0x100147ed6: vmovaps xmm0, xmmword ptr [rbx + 0x10]
0x100147edb: mov rax, qword ptr [rbp - 0x230]
0x100147ee2: vsubps xmm0, xmm0, xmmword ptr [rax]
0x100147ee6: vmovaps xmmword ptr [rbx + 0xc00], xmm0
0x100147eee: mov byte ptr [rbx + 0xc60], 0
0x100147ef5: mov rax, qword ptr [rip + 0xac59dc] ; 0x100c0d8d8
0x100147efc: mov rax, qword ptr [rax]
0x100147eff: cmp rax, qword ptr [rbp - 0x30]
0x100147f03: jne 0x100147f17
0x100147f05: add rsp, 0x208
0x100147f0c: pop rbx
0x100147f0d: pop r12
0x100147f0f: pop r13
0x100147f11: pop r14
0x100147f13: pop r15
0x100147f15: pop rbp
0x100147f16: ret 
0x100147f17: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100147f1c: lea rdi, [rip + 0xa2d340] ; 0x100b75263 animName
0x100147f23: lea rsi, [rip + 0xa2d0ae] ; 0x100b74fd8 AvatarLoco.cpp
0x100147f2a: mov edx, 0x612
0x100147f2f: mov ecx, 3
0x100147f34: call 0x1007e5f70 ; 0x1007e5f70
0x100147f39: ud2 
0x100147f3b: lea rdi, [rip + 0xa1cf1a] ; 0x100b64e5c len + 1 <= N
0x100147f42: lea rsi, [rip + 0xa1cf20] ; 0x100b64e69 ../../../Code/Base/FixedString.h
0x100147f49: mov edx, 0x30
0x100147f4e: mov ecx, 3
0x100147f53: call 0x1007e5f70 ; 0x1007e5f70
0x100147f58: ud2 
0x100147f5a: mov rbx, rax
0x100147f5d: jmp 0x100147f88 ; 0x100147f88
0x100147f5f: mov rbx, rax
0x100147f62: jmp 0x100147f9f ; 0x100147f9f
0x100147f64: mov rbx, rax
0x100147f67: mov rax, qword ptr [rbp - 0x228]
0x100147f6e: mov qword ptr [rbp - 0x218], rax
0x100147f75: mov qword ptr [rbp - 0xc8], r15
0x100147f7c: lea rdi, [rbp - 0x210]
0x100147f83: call 0x1007a58d0 ; 0x1007a58d0
0x100147f88: mov rsi, qword ptr [rip + 0xac25f1] ; 0x100c0a580
0x100147f8f: add rsi, 8
0x100147f93: lea rdi, [rbp - 0x218]
0x100147f9a: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x100147f9f: lea rdi, [rbp - 0xc8]
0x100147fa6: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100147fab: mov rdi, rbx
0x100147fae: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100147fb3: ud2 
0x100147fb5: nop word ptr cs:[rax + rax]

