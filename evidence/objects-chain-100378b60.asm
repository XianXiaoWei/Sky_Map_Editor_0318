0x100378b60: push rbp
0x100378b61: mov rbp, rsp
0x100378b64: push r15
0x100378b66: push r14
0x100378b68: push r13
0x100378b6a: push r12
0x100378b6c: push rbx
0x100378b6d: sub rsp, 0x208
0x100378b74: mov r12, rdi
0x100378b77: mov rax, qword ptr [rip + 0x894d5a] ; 0x100c0d8d8
0x100378b7e: mov rax, qword ptr [rax]
0x100378b81: mov qword ptr [rbp - 0x30], rax
0x100378b85: call 0x1007c1470 ; 0x1007c1470
0x100378b8a: mov rcx, qword ptr [rax]
0x100378b8d: mov rdi, rax
0x100378b90: call qword ptr [rcx + 0x48]
0x100378b93: mov rdi, qword ptr [r12 + 0x5f0]
0x100378b9b: call 0x1002b23d0 ; 0x1002b23d0
0x100378ba0: mov rdi, qword ptr [r12 + 0x5a0]
0x100378ba8: call 0x1005a71a0 ; 0x1005a71a0
0x100378bad: mov eax, dword ptr [r12 + 0x1374]
0x100378bb5: cmp eax, 2
0x100378bb8: je 0x100378e5d
0x100378bbe: cmp eax, 1
0x100378bc1: je 0x100378dbc
0x100378bc7: test eax, eax
0x100378bc9: jne 0x100378e66
0x100378bcf: mov rdi, qword ptr [r12 + 0x1068]
0x100378bd7: lea rsi, [rip + 0x7e3d2e] ; 0x100b5c90c Initialize
0x100378bde: mov edx, 2
0x100378be3: xor ecx, ecx
0x100378be5: call 0x1007b1b40 ; 0x1007b1b40
0x100378bea: mov rdi, qword ptr [r12 + 0x1068]
0x100378bf2: lea rsi, [rip + 0x80043a] ; 0x100b79033 Resize
0x100378bf9: mov edx, 2
0x100378bfe: xor ecx, ecx
0x100378c00: call 0x1007b1b40 ; 0x1007b1b40
0x100378c05: or byte ptr [r12 + 0x1560], 2
0x100378c0e: mov dword ptr [rbp - 0x21c], 0
0x100378c18: mov rbx, qword ptr [r12 + 0x18]
0x100378c1d: mov qword ptr [rbp - 0x228], 0
0x100378c28: mov qword ptr [rbp - 0x218], 0
0x100378c33: lea rdi, [rbp - 0x218]
0x100378c3a: call 0x1007abb90 ; 0x1007abb90
0x100378c3f: mov dword ptr [rsp], 0
0x100378c46: lea rdx, [rip + 0x7f9fb5] ; 0x100b72c02 GetIntroLevel
0x100378c4d: lea rsi, [rbp - 0x21c]
0x100378c54: lea rcx, [rbp - 0x228]
0x100378c5b: xor r9d, r9d
0x100378c5e: mov rdi, rbx
0x100378c61: mov r8, rax
0x100378c64: call 0x1000f0760 ; 0x1000f0760
0x100378c69: mov rbx, qword ptr [rbp - 0x228]
0x100378c70: lea rdi, [r12 + 0x1398]
0x100378c78: mov edx, 0x20
0x100378c7d: mov rsi, rbx
0x100378c80: call 0x100aa2c78 ; 0x100aa2c78 _strlcpy
0x100378c85: test rbx, rbx
0x100378c88: je 0x1003790d7
0x100378c8e: mov eax, dword ptr [rbp - 0x21c]
0x100378c94: test eax, eax
0x100378c96: jne 0x1003790d7
0x100378c9c: mov rdi, r12
0x100378c9f: mov rsi, rbx
0x100378ca2: call 0x1003784a0 ; 0x1003784a0
0x100378ca7: mov rdi, qword ptr [r12 + 0x140]
0x100378caf: mov rsi, qword ptr [r12 + 0x18]
0x100378cb4: mov rcx, qword ptr [r12 + 0xf8]
0x100378cbc: lea rdx, [rip + 0x80ae0d] ; 0x100b83ad0 Data/Resources/Persistent.lua
0x100378cc3: call 0x1007c38b0 ; 0x1007c38b0
0x100378cc8: test al, al
0x100378cca: je 0x1003790f6
0x100378cd0: call 0x1007abc10 ; 0x1007abc10
0x100378cd5: mov rax, qword ptr [rip + 0x1c81c74] ; 0x101ffa950
0x100378cdc: mov eax, dword ptr [rax + 0x38]
0x100378cdf: movabs rcx, 0x100000000
0x100378ce9: or rcx, rax
0x100378cec: mov qword ptr [r12 + 0x1370], rcx
0x100378cf4: lea r14, [rbp - 0xc8]
0x100378cfb: lea r15, [rbp - 0x210]
0x100378d02: mov rax, qword ptr [rip + 0x891817] ; 0x100c0a520
0x100378d09: lea rcx, [rax + 0x18]
0x100378d0d: mov qword ptr [rbp - 0x218], rcx
0x100378d14: add rax, 0x40
0x100378d18: mov qword ptr [rbp - 0xc8], rax
0x100378d1f: mov rdi, r14
0x100378d22: mov rsi, r15
0x100378d25: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x100378d2a: mov qword ptr [rbp - 0x40], 0
0x100378d32: mov dword ptr [rbp - 0x38], 0xffffffff
0x100378d39: mov rbx, qword ptr [rip + 0x894888] ; 0x100c0d5c8
0x100378d40: lea r13, [rbx + 0x18]
0x100378d44: mov qword ptr [rbp - 0x218], r13
0x100378d4b: add rbx, 0x40
0x100378d4f: mov qword ptr [rbp - 0xc8], rbx
0x100378d56: lea rsi, [rip + 0x80aa19] ; 0x100b83776 GameMode
0x100378d5d: mov edx, 2
0x100378d62: mov rdi, r15
0x100378d65: call 0x1007a56a0 ; 0x1007a56a0
0x100378d6a: lea rsi, [rip + 0x80ad9b] ; 0x100b83b0c LoadingResources
0x100378d71: lea rdi, [rbp - 0x218]
0x100378d78: mov edx, 0x10
0x100378d7d: call 0x100011930 ; 0x100011930
0x100378d82: mov qword ptr [rbp - 0x218], r13
0x100378d89: mov qword ptr [rbp - 0xc8], rbx
0x100378d90: mov rdi, r15
0x100378d93: call 0x1007a58d0 ; 0x1007a58d0
0x100378d98: mov rsi, qword ptr [rip + 0x8917e1] ; 0x100c0a580
0x100378d9f: add rsi, 8
0x100378da3: lea rdi, [rbp - 0x218]
0x100378daa: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x100378daf: mov rdi, r14
0x100378db2: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100378db7: jmp 0x100378e66 ; 0x100378e66
0x100378dbc: call 0x1007e8580 ; 0x1007e8580
0x100378dc1: mov rbx, rax
0x100378dc4: mov rdi, qword ptr [r12 + 0x140]
0x100378dcc: cmp qword ptr [rdi + 0x4c0], 0
0x100378dd4: je 0x100378e1a
0x100378dd6: nop word ptr cs:[rax + rax]
0x100378de0: mov rdi, rbx
0x100378de3: call 0x1007e8590 ; 0x1007e8590
0x100378de8: vmovsd xmm1, qword ptr [rip + 0x744f20] ; 0x100abdd10
0x100378df0: vucomisd xmm1, xmm0
0x100378df4: mov rdi, qword ptr [r12 + 0x140]
0x100378dfc: jbe 0x100378e1a
0x100378dfe: mov esi, 1
0x100378e03: call 0x1007c3d20 ; 0x1007c3d20
0x100378e08: mov rdi, qword ptr [r12 + 0x140]
0x100378e10: cmp qword ptr [rdi + 0x4c0], 0
0x100378e18: jne 0x100378de0
0x100378e1a: cmp qword ptr [rdi + 0x4c0], 0
0x100378e22: jne 0x100378e66
0x100378e24: cmp qword ptr [rdi + 0x4c8], 0
0x100378e2c: jne 0x100378e66
0x100378e2e: cmp dword ptr [rdi + 0x4d8], 0
0x100378e35: jne 0x100378e66
0x100378e37: cmp byte ptr [rip + 0x9b2ed2], 1 ; 0x100d2bd10
0x100378e3e: jne 0x100378f59
0x100378e44: lea rbx, [r12 + 0x1068]
0x100378e4c: mov rax, qword ptr [rbx]
0x100378e4f: cmp dword ptr [rax + 0x574], 0
0x100378e56: jne 0x100378e66
0x100378e58: jmp 0x100378fff ; 0x100378fff
0x100378e5d: mov byte ptr [r12 + 0x13d9], 1
0x100378e66: mov rdi, qword ptr [r12 + 0x1068]
0x100378e6e: lea r14, [rip + 0x7e3ad8] ; 0x100b5c94d Update
0x100378e75: lea rdx, [rip - 0x2b7c] ; 0x100376300
0x100378e7c: mov rsi, r14
0x100378e7f: call 0x1007b1970 ; 0x1007b1970
0x100378e84: mov rdi, qword ptr [r12 + 0x1068]
0x100378e8c: lea rdx, [rip + 0x80a19f] ; 0x100b83032 input
0x100378e93: lea rcx, [rip - 0x2bfa] ; 0x1003762a0
0x100378e9a: mov rsi, r14
0x100378e9d: call 0x1007b17c0 ; 0x1007b17c0
0x100378ea2: mov rdi, qword ptr [r12 + 0x1068]
0x100378eaa: lea r15, [rip + 0x7e8f5c] ; 0x100b61e0d BuildScene
0x100378eb1: lea rdx, [rip + 0x80a3c3] ; 0x100b8327b hud
0x100378eb8: lea rcx, [rip - 0x2b9f] ; 0x100376320
0x100378ebf: mov rsi, r15
0x100378ec2: call 0x1007b17c0 ; 0x1007b17c0
0x100378ec7: mov rdi, qword ptr [r12 + 0x1068]
0x100378ecf: mov edx, dword ptr [r12 + 0x1560]
0x100378ed7: xor ecx, ecx
0x100378ed9: mov rsi, r14
0x100378edc: call 0x1007b1b40 ; 0x1007b1b40
0x100378ee1: mov rdi, qword ptr [r12 + 0x1068]
0x100378ee9: mov edx, dword ptr [r12 + 0x1560]
0x100378ef1: lea rsi, [rip + 0x7e7b42] ; 0x100b60a3a UpdateLate
0x100378ef8: xor ecx, ecx
0x100378efa: call 0x1007b1b40 ; 0x1007b1b40
0x100378eff: mov rdi, qword ptr [r12 + 0x1068]
0x100378f07: mov edx, dword ptr [r12 + 0x1560]
0x100378f0f: xor ecx, ecx
0x100378f11: mov rsi, r15
0x100378f14: call 0x1007b1b40 ; 0x1007b1b40
0x100378f19: mov rdi, qword ptr [r12 + 0xa0]
0x100378f21: call 0x10079d9b0 ; 0x10079d9b0
0x100378f26: mov rdi, qword ptr [r12 + 0x1068]
0x100378f2e: call 0x1007b2110 ; 0x1007b2110
0x100378f33: mov rax, qword ptr [rip + 0x89499e] ; 0x100c0d8d8
0x100378f3a: mov rax, qword ptr [rax]
0x100378f3d: cmp rax, qword ptr [rbp - 0x30]
0x100378f41: jne 0x1003790d2
0x100378f47: add rsp, 0x208
0x100378f4e: pop rbx
0x100378f4f: pop r12
0x100378f51: pop r13
0x100378f53: pop r14
0x100378f55: pop r15
0x100378f57: pop rbp
0x100378f58: ret 
0x100378f59: mov byte ptr [rip + 0x9b2db0], 1 ; 0x100d2bd10
0x100378f60: lea rbx, [r12 + 0x1068]
0x100378f68: mov rdi, qword ptr [r12 + 0x1068]
0x100378f70: lea rsi, [rip + 0x7e3995] ; 0x100b5c90c Initialize
0x100378f77: mov edx, 4
0x100378f7c: xor ecx, ecx
0x100378f7e: call 0x1007b1ed0 ; 0x1007b1ed0
0x100378f83: mov rdi, qword ptr [r12 + 0x1068]
0x100378f8b: lea rsi, [rip + 0x8000a1] ; 0x100b79033 Resize
0x100378f92: mov edx, 4
0x100378f97: xor ecx, ecx
0x100378f99: call 0x1007b1ed0 ; 0x1007b1ed0
0x100378f9e: mov rdi, qword ptr [r12 + 0x1068]
0x100378fa6: lea rsi, [rip + 0x80a898] ; 0x100b83845 OnLevelLoadEarly
0x100378fad: mov edx, 4
0x100378fb2: xor ecx, ecx
0x100378fb4: call 0x1007b1ed0 ; 0x1007b1ed0
0x100378fb9: mov rdi, qword ptr [r12 + 0x1068]
0x100378fc1: lea rsi, [rip + 0x7e7a7d] ; 0x100b60a45 OnLevelLoad
0x100378fc8: mov edx, 4
0x100378fcd: xor ecx, ecx
0x100378fcf: call 0x1007b1ed0 ; 0x1007b1ed0
0x100378fd4: mov rdi, qword ptr [r12 + 0x1068]
0x100378fdc: lea rsi, [rip + 0x7ebd27] ; 0x100b64d0a OnLevelLoadLate
0x100378fe3: mov edx, 4
0x100378fe8: xor ecx, ecx
0x100378fea: call 0x1007b1ed0 ; 0x1007b1ed0
0x100378fef: mov rax, qword ptr [rbx]
0x100378ff2: cmp dword ptr [rax + 0x574], 0
0x100378ff9: jne 0x100378e66
0x100378fff: mov rdi, qword ptr [r12 + 0x38]
0x100379004: mov esi, 1
0x100379009: xor edx, edx
0x10037900b: xor ecx, ecx
0x10037900d: call 0x1000700d0 ; 0x1000700d0
0x100379012: or byte ptr [r12 + 0x1560], 4
0x10037901b: call 0x1007abc10 ; 0x1007abc10
0x100379020: mov rax, qword ptr [rip + 0x1c81929] ; 0x101ffa950
0x100379027: mov eax, dword ptr [rax + 0x38]
0x10037902a: movabs rcx, 0x200000000
0x100379034: or rcx, rax
0x100379037: mov qword ptr [r12 + 0x1370], rcx
0x10037903f: lea r14, [rbp - 0xc8]
0x100379046: lea r15, [rbp - 0x210]
0x10037904d: mov rax, qword ptr [rip + 0x8914cc] ; 0x100c0a520
0x100379054: lea rcx, [rax + 0x18]
0x100379058: mov qword ptr [rbp - 0x218], rcx
0x10037905f: add rax, 0x40
0x100379063: mov qword ptr [rbp - 0xc8], rax
0x10037906a: mov rdi, r14
0x10037906d: mov rsi, r15
0x100379070: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x100379075: mov qword ptr [rbp - 0x40], 0
0x10037907d: mov dword ptr [rbp - 0x38], 0xffffffff
0x100379084: mov rbx, qword ptr [rip + 0x89453d] ; 0x100c0d5c8
0x10037908b: lea r13, [rbx + 0x18]
0x10037908f: mov qword ptr [rbp - 0x218], r13
0x100379096: add rbx, 0x40
0x10037909a: mov qword ptr [rbp - 0xc8], rbx
0x1003790a1: lea rsi, [rip + 0x80a6ce] ; 0x100b83776 GameMode
0x1003790a8: mov edx, 2
0x1003790ad: mov rdi, r15
0x1003790b0: call 0x1007a56a0 ; 0x1007a56a0
0x1003790b5: lea rsi, [rip + 0x7e4516] ; 0x100b5d5d2 Ready
0x1003790bc: lea rdi, [rbp - 0x218]
0x1003790c3: mov edx, 5
0x1003790c8: call 0x100011930 ; 0x100011930
0x1003790cd: jmp 0x100378d82 ; 0x100378d82
0x1003790d2: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1003790d7: lea rdi, [rip + 0x7f9b32] ; 0x100b72c10 !luaError && introLevel
0x1003790de: lea rsi, [rip + 0x809d8c] ; 0x100b82e71 Game.cpp
0x1003790e5: mov edx, 0x50b
0x1003790ea: mov ecx, 3
0x1003790ef: call 0x1007e5f70 ; 0x1007e5f70
0x1003790f4: ud2 
0x1003790f6: lea rdi, [rip + 0x8004fe] ; 0x100b795fb success
0x1003790fd: lea rsi, [rip + 0x809d6d] ; 0x100b82e71 Game.cpp
0x100379104: lea r8, [rip + 0x80a9e3] ; 0x100b83aee Failed to load Persistent.lua
0x10037910b: mov edx, 0x50f
0x100379110: mov ecx, 4
0x100379115: xor eax, eax
0x100379117: call 0x1007e6030 ; 0x1007e6030
0x10037911c: ud2 
0x10037911e: jmp 0x100379124 ; 0x100379124
0x100379120: jmp 0x10037913f ; 0x10037913f
0x100379122: jmp 0x10037915b ; 0x10037915b
0x100379124: mov r12, rax
0x100379127: mov qword ptr [rbp - 0x218], r13
0x10037912e: mov qword ptr [rbp - 0xc8], rbx
0x100379135: mov rdi, r15
0x100379138: call 0x1007a58d0 ; 0x1007a58d0
0x10037913d: jmp 0x100379142 ; 0x100379142
0x10037913f: mov r12, rax
0x100379142: mov rsi, qword ptr [rip + 0x891437] ; 0x100c0a580
0x100379149: add rsi, 8
0x10037914d: lea rdi, [rbp - 0x218]
0x100379154: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x100379159: jmp 0x10037915e ; 0x10037915e
0x10037915b: mov r12, rax
0x10037915e: mov rdi, r14
0x100379161: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100379166: mov rdi, r12
0x100379169: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10037916e: nop 
