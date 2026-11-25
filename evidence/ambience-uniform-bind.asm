0x100059a50: push rbp
0x100059a51: mov rbp, rsp
0x100059a54: push r15
0x100059a56: push r14
0x100059a58: push r13
0x100059a5a: push r12
0x100059a5c: push rbx
0x100059a5d: and rsp, 0xffffffffffffffe0
0x100059a61: sub rsp, 0x380
0x100059a68: mov r12, r8
0x100059a6b: mov qword ptr [rsp + 0x18], rcx
0x100059a70: mov qword ptr [rsp + 0x20], rdx
0x100059a75: mov qword ptr [rsp + 0x28], rsi
0x100059a7a: mov rbx, rdi
0x100059a7d: mov rax, qword ptr [rip + 0xbb3e54] ; 0x100c0d8d8
0x100059a84: mov rax, qword ptr [rax]
0x100059a87: mov qword ptr [rsp + 0x360], rax
0x100059a8f: mov byte ptr [rbx + 0xc], 1
0x100059a93: lea rsi, [rbx + 0x970a0]
0x100059a9a: mov edi, 2
0x100059a9f: mov edx, 0x4000
0x100059aa4: call 0x1004143b0 ; 0x1004143b0
0x100059aa9: lea rsi, [rbx + 0xa70a0]
0x100059ab0: mov edi, 3
0x100059ab5: mov edx, 0x4000
0x100059aba: call 0x1004143b0 ; 0x1004143b0
0x100059abf: lea rax, [rip + 0x1fe5bea] ; 0x10203f6b0
0x100059ac6: vmovaps xmm0, xmmword ptr [rax]
0x100059aca: vmovaps xmmword ptr [rbx + 0x20], xmm0
0x100059acf: vmovaps xmm0, xmmword ptr [rip + 0xa4e359] ; 0x100aa7e30
0x100059ad7: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x100059adc: movabs rax, 0x3f00000000000000
0x100059ae6: mov qword ptr [rbx + 0x40], rax
0x100059aea: vmovaps xmm0, xmmword ptr [rip + 0xa4e34e] ; 0x100aa7e40
0x100059af2: vmovaps xmmword ptr [rbx + 0x60], xmm0
0x100059af7: vmovaps xmm1, xmmword ptr [rip + 0xa4e351] ; 0x100aa7e50
0x100059aff: vmovaps xmmword ptr [rbx + 0x70], xmm1
0x100059b04: vmovaps xmm2, xmmword ptr [rip + 0xa4e354] ; 0x100aa7e60
0x100059b0c: vmovaps xmmword ptr [rbx + 0x80], xmm2
0x100059b14: vmovaps xmm3, xmmword ptr [rip + 0xa4e354] ; 0x100aa7e70
0x100059b1c: vmovaps xmmword ptr [rbx + 0x90], xmm3
0x100059b24: vmovaps xmm4, xmmword ptr [rip + 0xa4e354] ; 0x100aa7e80
0x100059b2c: vmovaps xmmword ptr [rbx + 0xa0], xmm4
0x100059b34: mov dword ptr [rbx + 0xb0], 0x3f800000
0x100059b3e: mov byte ptr [rbx + 0x110], 0
0x100059b45: vmovaps xmmword ptr [rbx + 0xc0], xmm0
0x100059b4d: vmovaps xmmword ptr [rbx + 0xd0], xmm1
0x100059b55: vmovaps xmmword ptr [rbx + 0xe0], xmm2
0x100059b5d: vmovaps xmmword ptr [rbx + 0xf0], xmm3
0x100059b65: vmovaps xmmword ptr [rbx + 0x100], xmm4
0x100059b6d: mov byte ptr [rip + 0x1d15904], 0 ; 0x101d6f478
0x100059b74: mov byte ptr [rbx + 0x14c80], 0
0x100059b7b: vxorps ymm0, ymm0, ymm0
0x100059b7f: vmovups ymmword ptr [rbx + 0x1d0], ymm0
0x100059b87: vmovups ymmword ptr [rbx + 0x1c0], ymm0
0x100059b8f: vmovups ymmword ptr [rbx + 0x1a0], ymm0
0x100059b97: vmovups ymmword ptr [rbx + 0x180], ymm0
0x100059b9f: vmovups ymmword ptr [rbx + 0x160], ymm0
0x100059ba7: vmovups ymmword ptr [rbx + 0x140], ymm0
0x100059baf: vmovups ymmword ptr [rbx + 0x120], ymm0
0x100059bb7: vmovaps xmm0, xmmword ptr [rip + 0xa4e2d1] ; 0x100aa7e90
0x100059bbf: vmovups xmmword ptr [rbx + 0x1f4], xmm0
0x100059bc7: movabs rax, 0x3f4ccccd453b8000
0x100059bd1: mov qword ptr [rbx + 0x204], rax
0x100059bd8: movabs rax, 0x3f00000039b08727
0x100059be2: mov qword ptr [rbx + 0x20c], rax
0x100059be9: mov dword ptr [rbx + 0x214], 0
0x100059bf3: vmovaps xmm0, xmmword ptr [rip + 0xa4e2a5] ; 0x100aa7ea0
0x100059bfb: vmovaps xmmword ptr [rbx + 0x230], xmm0
0x100059c03: vmovaps xmm0, xmmword ptr [rip + 0xa4e2a5] ; 0x100aa7eb0
0x100059c0b: vmovaps xmmword ptr [rbx + 0x240], xmm0
0x100059c13: mov dword ptr [rbx + 0x254], 0x3f800000
0x100059c1d: vmovaps xmm0, xmmword ptr [rip + 0xa4e29b] ; 0x100aa7ec0
0x100059c25: vmovaps xmmword ptr [rbx + 0x270], xmm0
0x100059c2d: mov dword ptr [rbx + 0x280], 0x42c80000
0x100059c37: cmp dword ptr [r12 + 0x210], 0
0x100059c40: jne 0x100059c4c
0x100059c42: mov dword ptr [rbx + 0x240], 0x3e2aaaaa
0x100059c4c: lea rax, [rbx + 0x20]
0x100059c50: mov qword ptr [rsp + 0x38], rax
0x100059c55: lea rax, [rbx + 0x38]
0x100059c59: mov qword ptr [rsp + 0x40], rax
0x100059c5e: lea rax, [rbx + 0xb0]
0x100059c65: mov qword ptr [rsp + 0x48], rax
0x100059c6a: lea rax, [rbx + 0x1f4]
0x100059c71: mov qword ptr [rsp + 0x50], rax
0x100059c76: lea rax, [rbx + 0x200]
0x100059c7d: mov qword ptr [rsp + 0x58], rax
0x100059c82: lea rax, [rbx + 0x210]
0x100059c89: mov qword ptr [rsp + 0x60], rax
0x100059c8e: mov dword ptr [rsp + 0xb8], 1
0x100059c99: vmovaps ymm0, ymmword ptr [rip + 0xa4e4ff] ; 0x100aa81a0
0x100059ca1: vmovups ymmword ptr [rsp + 0x98], ymm0
0x100059caa: lea r14, [rbx + 0x65680]
0x100059cb1: lea rsi, [rsp + 0x98]
0x100059cb9: mov rdi, r14
0x100059cbc: vzeroupper 
0x100059cbf: call 0x1007f04d0 ; 0x1007f04d0
0x100059cc4: lea rdi, [rbx + 0x14c88]
0x100059ccb: mov dword ptr [rsp], 0
0x100059cd2: lea rsi, [rip + 0xb082ec] ; 0x100b61fc5 AtmosphereTex
0x100059cd9: mov edx, 2
0x100059cde: mov ecx, 0x40
0x100059ce3: mov r8d, 0x40
0x100059ce9: mov r9d, 0xe
0x100059cef: mov qword ptr [rsp + 0x68], rdi
0x100059cf4: call 0x1007f0850 ; 0x1007f0850
0x100059cf9: mov qword ptr [rsp + 0x30], rbx
0x100059cfe: mov qword ptr [rsp + 0x70], r14
0x100059d03: mov qword ptr [rbx + 0x14c90], r14
0x100059d0a: vxorps ymm0, ymm0, ymm0
0x100059d0e: vmovaps ymmword ptr [rsp + 0x1a0], ymm0
0x100059d17: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x100059d20: vmovaps ymmword ptr [rsp + 0x160], ymm0
0x100059d29: vmovaps ymmword ptr [rsp + 0x140], ymm0
0x100059d32: vmovaps ymmword ptr [rsp + 0x120], ymm0
0x100059d3b: vmovaps ymmword ptr [rsp + 0x100], ymm0
0x100059d44: vmovaps ymmword ptr [rsp + 0xe0], ymm0
0x100059d4d: vmovaps ymmword ptr [rsp + 0xc0], ymm0
0x100059d56: mov qword ptr [rsp + 0x1c0], 0
0x100059d62: mov dword ptr [rsp + 0x1d0], 0x10000
0x100059d6d: lea r15, [rsp + 0x1d4]
0x100059d75: mov rbx, 0xffffffffffffffbf
0x100059d7c: mov r13, qword ptr [rip + 0xbb3b25] ; 0x100c0d8a8
0x100059d83: mov r12, qword ptr [rip + 0xbb3b26] ; 0x100c0d8b0
0x100059d8a: mov r14w, 1
0x100059d8f: nop 
0x100059d90: lea eax, [rbx + 0x41]
0x100059d93: vcvtsi2ss xmm0, xmm5, rax
0x100059d98: vmulss xmm0, xmm0, dword ptr [rip + 0xa4e80c] ; 0x100aa85ac
0x100059da0: vzeroupper 
0x100059da3: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x100059da8: vextractps eax, xmm0, 1
0x100059dae: vextractps edx, xmm0, 0
0x100059db4: xor edx, 0x80000000
0x100059dba: mov ecx, edx
0x100059dbc: shr ecx, 0x17
0x100059dbf: movzx esi, word ptr [r13 + rcx*2]
0x100059dc5: and edx, 0x7fffff
0x100059dcb: movzx ecx, byte ptr [r12 + rcx]
0x100059dd0: shr edx, cl
0x100059dd2: add edx, esi
0x100059dd4: mov ecx, eax
0x100059dd6: shr ecx, 0x17
0x100059dd9: movzx esi, word ptr [r13 + rcx*2]
0x100059ddf: and eax, 0x7fffff
0x100059de4: movzx ecx, byte ptr [r12 + rcx]
0x100059de9: shr eax, cl
0x100059deb: add eax, esi
0x100059ded: mov word ptr [rsp + rbx*4 + 0x1c8], dx
0x100059df5: mov word ptr [rsp + rbx*4 + 0x1ca], ax
0x100059dfd: mov word ptr [r15 - 4], 0
0x100059e04: lea eax, [rbx + 0x42]
0x100059e07: mov word ptr [r15 - 2], ax
0x100059e0c: lea eax, [rbx + 0x43]
0x100059e0f: cmp rbx, -1
0x100059e13: cmove ax, r14w
0x100059e18: mov word ptr [r15], ax
0x100059e1c: add r15, 6
0x100059e20: inc rbx
0x100059e23: jne 0x100059d90
0x100059e29: mov rbx, qword ptr [rsp + 0x30]
0x100059e2e: lea r13, [rbx + 0x2b0]
0x100059e35: lea r15, [rip + 0xb08197] ; 0x100b61fd3 Sun
0x100059e3c: mov edx, 0x42
0x100059e41: mov rdi, r13
0x100059e44: mov rsi, r15
0x100059e47: call 0x1007f53c0 ; 0x1007f53c0
0x100059e4c: movabs rax, 0x10000001e
0x100059e56: mov qword ptr [rsp + 0x78], rax
0x100059e5b: lea rcx, [rsp + 0x7c]
0x100059e60: lea rax, [rsp + 0xc0]
0x100059e68: mov qword ptr [rsp + 8], rax
0x100059e6d: mov dword ptr [rsp], 0
0x100059e74: lea rdx, [rsp + 0x78]
0x100059e79: mov esi, 0
0x100059e7e: mov r8d, 1
0x100059e84: mov r9d, 1
0x100059e8a: mov rdi, r13
0x100059e8d: call 0x1007f5430 ; 0x1007f5430
0x100059e92: lea r9, [rsp + 0x1d0]
0x100059e9a: mov esi, 0
0x100059e9f: mov edx, 0x11
0x100059ea4: mov ecx, 1
0x100059ea9: mov r8d, 0xc3
0x100059eaf: mov rdi, r13
0x100059eb2: call 0x1007f55d0 ; 0x1007f55d0
0x100059eb7: mov rdi, r13
0x100059eba: call 0x1007f5690 ; 0x1007f5690
0x100059ebf: lea rdi, [rbx + 0x6f0]
0x100059ec6: mov r8, qword ptr [rsp + 0x18]
0x100059ecb: add r8, 0x10
0x100059ecf: mov r9d, 7
0x100059ed5: mov rsi, r13
0x100059ed8: mov rdx, qword ptr [rsp + 0x20]
0x100059edd: mov rcx, r15
0x100059ee0: call 0x1007f5d90 ; 0x1007f5d90
0x100059ee5: cmp byte ptr [rbx + 0xc1a], 1
0x100059eec: je 0x10005a8a4
0x100059ef2: mov dword ptr [rbx + 0xc14], 4
0x100059efc: mov dword ptr [rbx + 0xbfc], 0xc3
0x100059f06: mov byte ptr [rbx + 0x97070], 0
0x100059f0d: lea rdi, [rbx + 0x14d00]
0x100059f14: call 0x10005cb80 ; 0x10005cb80
0x100059f19: lea r14, [rbx + 0x65608]
0x100059f20: mov edi, 0x20
0x100059f25: mov esi, 0x20
0x100059f2a: call 0x1007f0470 ; 0x1007f0470
0x100059f2f: mov dword ptr [rsp], eax
0x100059f32: lea rsi, [rip + 0xb0809e] ; 0x100b61fd7 ProbeCube
0x100059f39: mov edx, 2
0x100059f3e: mov ecx, 0x20
0x100059f43: mov r8d, 0x20
0x100059f49: mov r9d, 0x11
0x100059f4f: mov rdi, r14
0x100059f52: call 0x1007f0a80 ; 0x1007f0a80
0x100059f57: mov rax, qword ptr [rsp + 0x70]
0x100059f5c: mov qword ptr [rbx + 0x65610], rax
0x100059f63: lea rdi, [rbx + 0x666e0]
0x100059f6a: mov dword ptr [rsp], 0
0x100059f71: lea rsi, [rip + 0xb08069] ; 0x100b61fe1 Puff
0x100059f78: mov edx, 2
0x100059f7d: mov ecx, 0x20
0x100059f82: mov r8d, 0x80
0x100059f88: mov r9d, 2
0x100059f8e: mov qword ptr [rsp + 0x18], rdi
0x100059f93: call 0x1007f0850 ; 0x1007f0850
0x100059f98: mov rdx, qword ptr [rip + 0x1d14381] ; 0x101d6e320
0x100059f9f: mov esi, 0x1800
0x100059fa4: mov ecx, 0x10
0x100059fa9: mov r15, qword ptr [rsp + 0x28]
0x100059fae: mov rdi, r15
0x100059fb1: call 0x100795530 ; 0x100795530
0x100059fb6: mov qword ptr [rbx + 0x66770], rax
0x100059fbd: mov rdx, qword ptr [rip + 0x1d1435c] ; 0x101d6e320
0x100059fc4: mov esi, 0x1800
0x100059fc9: mov ecx, 0x10
0x100059fce: mov rdi, r15
0x100059fd1: call 0x100795530 ; 0x100795530
0x100059fd6: mov qword ptr [rbx + 0x66778], rax
0x100059fdd: mov rdx, qword ptr [rip + 0x1d1433c] ; 0x101d6e320
0x100059fe4: mov esi, 0x1800
0x100059fe9: mov ecx, 0x10
0x100059fee: mov rdi, r15
0x100059ff1: call 0x100795530 ; 0x100795530
0x100059ff6: mov qword ptr [rbx + 0x66780], rax
0x100059ffd: mov rcx, qword ptr [rbx + 0x66770]
0x10005a004: test rcx, rcx
0x10005a007: je 0x10005a866
0x10005a00d: test rax, rax
0x10005a010: je 0x10005a866
0x10005a016: mov rax, qword ptr [rbx + 0x66778]
0x10005a01d: test rax, rax
0x10005a020: je 0x10005a866
0x10005a026: lea r12, [rbx + 0x66790]
0x10005a02d: vxorps xmm0, xmm0, xmm0
0x10005a031: vmovups xmmword ptr [rbx + 0x66798], xmm0
0x10005a039: mov qword ptr [rbx + 0x667a8], rcx
0x10005a040: xor esi, esi
0x10005a042: mov rdi, r12
0x10005a045: call 0x1007e8ed0 ; 0x1007e8ed0
0x10005a04a: vmovups xmm0, xmmword ptr [rbx + 0x66778]
0x10005a052: vmovaps xmmword ptr [rbx + 0x667b0], xmm0
0x10005a05a: mov dword ptr [rbx + 0x667c0], 0x180
0x10005a064: lea rax, [rbx + 0x15614]
0x10005a06b: mov qword ptr [rbx + 0x667e0], rax
0x10005a072: mov dword ptr [rbx + 0x67070], 0x3a83126f
0x10005a07c: mov word ptr [rbx + 0x87050], 0x1418
0x10005a085: vxorps ymm0, ymm0, ymm0
0x10005a089: vmovups ymmword ptr [rbx + 0x67000], ymm0
0x10005a091: vmovups ymmword ptr [rbx + 0x6704c], ymm0
0x10005a099: vmovups ymmword ptr [rbx + 0x67040], ymm0
0x10005a0a1: vmovups ymmword ptr [rbx + 0x67020], ymm0
0x10005a0a9: movabs rax, 0x3eaa7efa3eaa7efa
0x10005a0b3: mov qword ptr [rbx + 0x67000], rax
0x10005a0ba: mov dword ptr [rbx + 0x67008], 0x3eaa7efa
0x10005a0c4: mov dword ptr [rbx + 0x66758], 0xc
0x10005a0ce: mov rdx, qword ptr [rip + 0x1d1424b] ; 0x101d6e320
0x10005a0d5: mov esi, 0x1e0
0x10005a0da: mov ecx, 8
0x10005a0df: mov rdi, qword ptr [rsp + 0x28]
0x10005a0e4: vzeroupper 
0x10005a0e7: call 0x100795530 ; 0x100795530
0x10005a0ec: mov r13, rax
0x10005a0ef: call 0x1007abc10 ; 0x1007abc10
0x10005a0f4: mov eax, dword ptr [rax + 0x38]
0x10005a0f7: mov dword ptr [r13 + 8], eax
0x10005a0fb: call 0x10079ddd0 ; 0x10079ddd0
0x10005a100: mov rax, qword ptr [rip + 0x1d144e9] ; 0x101d6e5f0
0x10005a107: mov eax, dword ptr [rax + 0x38]
0x10005a10a: mov dword ptr [r13 + 8], eax
0x10005a10e: lea r15, [rip + 0xbb7a1b] ; 0x100c11b30
0x10005a115: mov qword ptr [r13], r15
0x10005a119: call 0x1007abc10 ; 0x1007abc10
0x10005a11e: mov eax, dword ptr [rax + 0x38]
0x10005a121: mov dword ptr [r13 + 0x30], eax
0x10005a125: call 0x10079ddd0 ; 0x10079ddd0
0x10005a12a: mov rax, qword ptr [rip + 0x1d144bf] ; 0x101d6e5f0
0x10005a131: mov eax, dword ptr [rax + 0x38]
0x10005a134: mov dword ptr [r13 + 0x30], eax
0x10005a138: mov qword ptr [r13 + 0x28], r15
0x10005a13c: call 0x1007abc10 ; 0x1007abc10
0x10005a141: mov eax, dword ptr [rax + 0x38]
0x10005a144: mov dword ptr [r13 + 0x58], eax
0x10005a148: call 0x10079ddd0 ; 0x10079ddd0
0x10005a14d: mov rax, qword ptr [rip + 0x1d1449c] ; 0x101d6e5f0
0x10005a154: mov eax, dword ptr [rax + 0x38]
0x10005a157: mov dword ptr [r13 + 0x58], eax
0x10005a15b: mov qword ptr [r13 + 0x50], r15
0x10005a15f: call 0x1007abc10 ; 0x1007abc10
0x10005a164: mov eax, dword ptr [rax + 0x38]
0x10005a167: mov dword ptr [r13 + 0x80], eax
0x10005a16e: call 0x10079ddd0 ; 0x10079ddd0
0x10005a173: mov rax, qword ptr [rip + 0x1d14476] ; 0x101d6e5f0
0x10005a17a: mov eax, dword ptr [rax + 0x38]
0x10005a17d: mov dword ptr [r13 + 0x80], eax
0x10005a184: mov qword ptr [r13 + 0x78], r15
0x10005a188: call 0x1007abc10 ; 0x1007abc10
0x10005a18d: mov eax, dword ptr [rax + 0x38]
0x10005a190: mov dword ptr [r13 + 0xa8], eax
0x10005a197: call 0x10079ddd0 ; 0x10079ddd0
0x10005a19c: mov rax, qword ptr [rip + 0x1d1444d] ; 0x101d6e5f0
0x10005a1a3: mov eax, dword ptr [rax + 0x38]
0x10005a1a6: mov dword ptr [r13 + 0xa8], eax
0x10005a1ad: mov qword ptr [r13 + 0xa0], r15
0x10005a1b4: call 0x1007abc10 ; 0x1007abc10
0x10005a1b9: mov eax, dword ptr [rax + 0x38]
0x10005a1bc: mov dword ptr [r13 + 0xd0], eax
0x10005a1c3: call 0x10079ddd0 ; 0x10079ddd0
0x10005a1c8: mov rax, qword ptr [rip + 0x1d14421] ; 0x101d6e5f0
0x10005a1cf: mov eax, dword ptr [rax + 0x38]
0x10005a1d2: mov dword ptr [r13 + 0xd0], eax
0x10005a1d9: mov qword ptr [r13 + 0xc8], r15
0x10005a1e0: call 0x1007abc10 ; 0x1007abc10
0x10005a1e5: mov eax, dword ptr [rax + 0x38]
0x10005a1e8: mov dword ptr [r13 + 0xf8], eax
0x10005a1ef: call 0x10079ddd0 ; 0x10079ddd0
0x10005a1f4: mov rax, qword ptr [rip + 0x1d143f5] ; 0x101d6e5f0
0x10005a1fb: mov eax, dword ptr [rax + 0x38]
0x10005a1fe: mov dword ptr [r13 + 0xf8], eax
0x10005a205: mov qword ptr [r13 + 0xf0], r15
0x10005a20c: call 0x1007abc10 ; 0x1007abc10
0x10005a211: mov eax, dword ptr [rax + 0x38]
0x10005a214: mov dword ptr [r13 + 0x120], eax
0x10005a21b: call 0x10079ddd0 ; 0x10079ddd0
0x10005a220: mov rax, qword ptr [rip + 0x1d143c9] ; 0x101d6e5f0
0x10005a227: mov eax, dword ptr [rax + 0x38]
0x10005a22a: mov dword ptr [r13 + 0x120], eax
0x10005a231: mov qword ptr [r13 + 0x118], r15
0x10005a238: call 0x1007abc10 ; 0x1007abc10
0x10005a23d: mov eax, dword ptr [rax + 0x38]
0x10005a240: mov dword ptr [r13 + 0x148], eax
0x10005a247: call 0x10079ddd0 ; 0x10079ddd0
0x10005a24c: mov rax, qword ptr [rip + 0x1d1439d] ; 0x101d6e5f0
0x10005a253: mov eax, dword ptr [rax + 0x38]
0x10005a256: mov dword ptr [r13 + 0x148], eax
0x10005a25d: mov qword ptr [r13 + 0x140], r15
0x10005a264: call 0x1007abc10 ; 0x1007abc10
0x10005a269: mov eax, dword ptr [rax + 0x38]
0x10005a26c: mov dword ptr [r13 + 0x170], eax
0x10005a273: call 0x10079ddd0 ; 0x10079ddd0
0x10005a278: mov rax, qword ptr [rip + 0x1d14371] ; 0x101d6e5f0
0x10005a27f: mov eax, dword ptr [rax + 0x38]
0x10005a282: mov dword ptr [r13 + 0x170], eax
0x10005a289: mov qword ptr [r13 + 0x168], r15
0x10005a290: call 0x1007abc10 ; 0x1007abc10
0x10005a295: mov eax, dword ptr [rax + 0x38]
0x10005a298: mov dword ptr [r13 + 0x198], eax
0x10005a29f: call 0x10079ddd0 ; 0x10079ddd0
0x10005a2a4: mov rax, qword ptr [rip + 0x1d14345] ; 0x101d6e5f0
0x10005a2ab: mov eax, dword ptr [rax + 0x38]
0x10005a2ae: mov dword ptr [r13 + 0x198], eax
0x10005a2b5: mov qword ptr [r13 + 0x190], r15
0x10005a2bc: call 0x1007abc10 ; 0x1007abc10
0x10005a2c1: mov eax, dword ptr [rax + 0x38]
0x10005a2c4: mov dword ptr [r13 + 0x1c0], eax
0x10005a2cb: call 0x10079ddd0 ; 0x10079ddd0
0x10005a2d0: mov rax, qword ptr [rip + 0x1d14319] ; 0x101d6e5f0
0x10005a2d7: mov eax, dword ptr [rax + 0x38]
0x10005a2da: mov dword ptr [r13 + 0x1c0], eax
0x10005a2e1: mov qword ptr [r13 + 0x1b8], r15
0x10005a2e8: mov rax, qword ptr [rsp + 0x30]
0x10005a2ed: mov qword ptr [rax + 0x66760], r13
0x10005a2f4: mov r13, rax
0x10005a2f7: mov esi, dword ptr [r13 + 0x66758]
0x10005a2fe: inc esi
0x10005a300: shl rsi, 3
0x10005a304: mov rdx, qword ptr [rip + 0x1d14015] ; 0x101d6e320
0x10005a30b: mov ecx, 0x10
0x10005a310: mov rdi, qword ptr [rsp + 0x28]
0x10005a315: call 0x100795530 ; 0x100795530
0x10005a31a: mov qword ptr [r13 + 0x66768], rax
0x10005a321: test rax, rax
0x10005a324: je 0x10005a885
0x10005a32a: mov rcx, qword ptr [r13 + 0x66760]
0x10005a331: test rcx, rcx
0x10005a334: je 0x10005a885
0x10005a33a: mov edx, dword ptr [r13 + 0x66758]
0x10005a341: test rdx, rdx
0x10005a344: je 0x10005a3ba
0x10005a346: mov r10d, 1
0x10005a34c: xor edi, edi
0x10005a34e: movabs r8, 0xffffffe00
0x10005a358: xor r9d, r9d
0x10005a35b: jmp 0x10005a379 ; 0x10005a379
0x10005a35d: nop dword ptr [rax]
0x10005a360: mov rcx, qword ptr [r13 + 0x66760]
0x10005a367: mov rax, qword ptr [r13 + 0x66768]
0x10005a36e: add r9, 0x20
0x10005a372: inc r10
0x10005a375: add rdi, 0x28
0x10005a379: mov rbx, r9
0x10005a37c: shl rbx, 4
0x10005a380: and rbx, r8
0x10005a383: mov rsi, qword ptr [r13 + 0x66778]
0x10005a38a: add rsi, rbx
0x10005a38d: mov qword ptr [rcx + rdi + 0x18], rsi
0x10005a392: add rbx, qword ptr [r13 + 0x66780]
0x10005a399: mov qword ptr [rcx + rdi + 0x20], rbx
0x10005a39e: mov qword ptr [rcx + rdi + 0x10], r12
0x10005a3a3: lea rcx, [rcx + rdi]
0x10005a3a7: mov qword ptr [rax + r10*8 - 8], rcx
0x10005a3ac: cmp r10, rdx
0x10005a3af: jb 0x10005a360
0x10005a3b1: mov rax, qword ptr [r13 + 0x66768]
0x10005a3b8: jmp 0x10005a3bc ; 0x10005a3bc
0x10005a3ba: xor edx, edx
0x10005a3bc: lea rcx, [r13 + 0x656b0]
0x10005a3c3: mov esi, edx
0x10005a3c5: mov qword ptr [rax + rsi*8], rcx
0x10005a3c9: lea r15, [r13 + 0x97040]
0x10005a3d0: mov rsi, qword ptr [r13 + 0x66768]
0x10005a3d7: inc edx
0x10005a3d9: mov rdi, r15
0x10005a3dc: call 0x10079de00 ; 0x10079de00
0x10005a3e1: mov esi, 1
0x10005a3e6: mov rdi, r15
0x10005a3e9: call 0x10079de50 ; 0x10079de50
0x10005a3ee: mov qword ptr [r13 + 0x97090], 0
0x10005a3f9: vxorps xmm0, xmm0, xmm0
0x10005a3fd: vmovaps xmmword ptr [r13 + 0xb70a0], xmm0
0x10005a406: vmovaps xmm0, xmmword ptr [rip + 0xa4dac2] ; 0x100aa7ed0
0x10005a40e: vmovaps xmmword ptr [r13 + 0xb70b0], xmm0
0x10005a417: call 0x1007945e0 ; 0x1007945e0
0x10005a41c: test rax, rax
0x10005a41f: je 0x10005a820
0x10005a425: call 0x1007945e0 ; 0x1007945e0
0x10005a42a: lea rdx, [r13 + 0x290]
0x10005a431: lea rsi, [rip + 0xb07c1a] ; 0x100b62052 u_sunDir
0x10005a438: mov ecx, 3
0x10005a43d: mov rdi, rax
0x10005a440: call 0x100793f20 ; 0x100793f20
0x10005a445: call 0x1007945e0 ; 0x1007945e0
0x10005a44a: lea rsi, [rip + 0xb07c0a] ; 0x100b6205b u_sunColor
0x10005a451: mov ecx, 3
0x10005a456: mov rdi, rax
0x10005a459: mov rdx, qword ptr [rsp + 0x38]
0x10005a45e: call 0x100793f20 ; 0x100793f20
0x10005a463: call 0x1007945e0 ; 0x1007945e0
0x10005a468: lea rsi, [rip + 0xb07bf7] ; 0x100b62066 u_sunSizeIntMoonPhase
0x10005a46f: mov ecx, 4
0x10005a474: mov rdi, rax
0x10005a477: mov rdx, qword ptr [rsp + 0x40]
0x10005a47c: call 0x100793f20 ; 0x100793f20
0x10005a481: call 0x1007945e0 ; 0x1007945e0
0x10005a486: lea rsi, [rip + 0xb07bef] ; 0x100b6207c u_atmosphereDensity
0x10005a48d: mov ecx, 1
0x10005a492: mov rdi, rax
0x10005a495: mov rdx, qword ptr [rsp + 0x48]
0x10005a49a: call 0x100793f20 ; 0x100793f20
0x10005a49f: call 0x1007945e0 ; 0x1007945e0
0x10005a4a4: lea rsi, [rip + 0xb07be5] ; 0x100b62090 u_fogDensityHeightDist
0x10005a4ab: mov ecx, 3
0x10005a4b0: mov rdi, rax
0x10005a4b3: mov rdx, qword ptr [rsp + 0x50]
0x10005a4b8: call 0x100793f20 ; 0x100793f20
0x10005a4bd: call 0x1007945e0 ; 0x1007945e0
0x10005a4c2: lea rsi, [rip + 0xb07bde] ; 0x100b620a7 u_cheapFog
0x10005a4c9: mov ecx, 4
0x10005a4ce: mov rdi, rax
0x10005a4d1: mov rdx, qword ptr [rsp + 0x58]
0x10005a4d6: call 0x100793f20 ; 0x100793f20
0x10005a4db: call 0x1007945e0 ; 0x1007945e0
0x10005a4e0: lea rsi, [rip + 0xb07bcb] ; 0x100b620b2 u_cheapFog2
0x10005a4e7: mov ecx, 2
0x10005a4ec: mov rdi, rax
0x10005a4ef: mov rdx, qword ptr [rsp + 0x60]
0x10005a4f4: call 0x100793f20 ; 0x100793f20
0x10005a4f9: call 0x1007945e0 ; 0x1007945e0
0x10005a4fe: lea rdx, [r13 + 0xc40]
0x10005a505: lea rsi, [rip + 0xb07bb2] ; 0x100b620be u_averageSkyColor
0x10005a50c: mov ecx, 3
0x10005a511: mov rdi, rax
0x10005a514: call 0x100793f20 ; 0x100793f20
0x10005a519: call 0x1007945e0 ; 0x1007945e0
0x10005a51e: lea rdx, [r13 + 0xc50]
0x10005a525: lea rsi, [rip + 0xb07ba4] ; 0x100b620d0 u_averageSkyOcclusion
0x10005a52c: mov ecx, 1
0x10005a531: mov rdi, rax
0x10005a534: call 0x100793f20 ; 0x100793f20
0x10005a539: call 0x1007945e0 ; 0x1007945e0
0x10005a53e: lea rdx, [r13 + 0xc30]
0x10005a545: lea rsi, [rip + 0xb07b9a] ; 0x100b620e6 u_averageSkyboxColor
0x10005a54c: mov ecx, 3
0x10005a551: mov rdi, rax
0x10005a554: call 0x100793f20 ; 0x100793f20
0x10005a559: call 0x1007945e0 ; 0x1007945e0
0x10005a55e: lea rdx, [r13 + 0xc60]
0x10005a565: lea rsi, [rip + 0xb07b8f] ; 0x100b620fb u_atmosphereSunColor
0x10005a56c: mov ecx, 3
0x10005a571: mov rdi, rax
0x10005a574: call 0x100793f20 ; 0x100793f20
0x10005a579: call 0x1007945e0 ; 0x1007945e0
0x10005a57e: lea rdx, [r13 + 0xc70]
0x10005a585: lea rsi, [rip + 0xb07b84] ; 0x100b62110 u_atmosphereSample
0x10005a58c: mov ecx, 1
0x10005a591: mov rdi, rax
0x10005a594: call 0x100793f20 ; 0x100793f20
0x10005a599: call 0x1007945e0 ; 0x1007945e0
0x10005a59e: lea rsi, [rip + 0xb07b7e] ; 0x100b62123 u_atmosphereTex
0x10005a5a5: xor ecx, ecx
0x10005a5a7: mov rdi, rax
0x10005a5aa: mov rdx, qword ptr [rsp + 0x68]
0x10005a5af: call 0x100794050 ; 0x100794050
0x10005a5b4: call 0x1007945e0 ; 0x1007945e0
0x10005a5b9: lea rdx, [r13 + 0x2a0]
0x10005a5c0: lea rsi, [rip + 0xb07b6c] ; 0x100b62133 u_pointLight
0x10005a5c7: mov ecx, 3
0x10005a5cc: mov rdi, rax
0x10005a5cf: call 0x100793f20 ; 0x100793f20
0x10005a5d4: xor eax, eax
0x10005a5d6: call 0x100011c10 ; 0x100011c10
0x10005a5db: call 0x1007945e0 ; 0x1007945e0
0x10005a5e0: lea rdx, [r13 + 0x65570]
0x10005a5e7: lea rsi, [rip + 0xb07b52] ; 0x100b62140 u_probeCenter
0x10005a5ee: mov ecx, 3
0x10005a5f3: mov rdi, rax
0x10005a5f6: call 0x100793f20 ; 0x100793f20
0x10005a5fb: call 0x1007945e0 ; 0x1007945e0
0x10005a600: lea rdx, [r13 + 0x65580]
0x10005a607: lea rsi, [rip + 0xb07b40] ; 0x100b6214e u_averageProbeColor
0x10005a60e: mov ecx, 3
0x10005a613: mov rdi, rax
0x10005a616: call 0x100793f20 ; 0x100793f20
0x10005a61b: call 0x1007945e0 ; 0x1007945e0
0x10005a620: lea rdx, [r13 + 0x65590]
0x10005a627: lea rsi, [rip + 0xb07b34] ; 0x100b62162 u_probeShR0
0x10005a62e: mov ecx, 4
0x10005a633: mov rdi, rax
0x10005a636: call 0x100793f20 ; 0x100793f20
0x10005a63b: call 0x1007945e0 ; 0x1007945e0
0x10005a640: lea rdx, [r13 + 0x655a0]
0x10005a647: lea rsi, [rip + 0xb07b20] ; 0x100b6216e u_probeShR1
0x10005a64e: mov ecx, 4
0x10005a653: mov rdi, rax
0x10005a656: call 0x100793f20 ; 0x100793f20
0x10005a65b: call 0x1007945e0 ; 0x1007945e0
0x10005a660: lea rdx, [r13 + 0x655b4]
0x10005a667: lea rsi, [rip + 0xb07b0c] ; 0x100b6217a u_probeShG0
0x10005a66e: mov ecx, 4
0x10005a673: mov rdi, rax
0x10005a676: call 0x100793f20 ; 0x100793f20
0x10005a67b: call 0x1007945e0 ; 0x1007945e0
0x10005a680: lea rdx, [r13 + 0x655c4]
0x10005a687: lea rsi, [rip + 0xb07af8] ; 0x100b62186 u_probeShG1
0x10005a68e: mov ecx, 4
0x10005a693: mov rdi, rax
0x10005a696: call 0x100793f20 ; 0x100793f20
0x10005a69b: call 0x1007945e0 ; 0x1007945e0
0x10005a6a0: lea rdx, [r13 + 0x655d8]
0x10005a6a7: lea rsi, [rip + 0xb07ae4] ; 0x100b62192 u_probeShB0
0x10005a6ae: mov ecx, 4
0x10005a6b3: mov rdi, rax
0x10005a6b6: call 0x100793f20 ; 0x100793f20
0x10005a6bb: call 0x1007945e0 ; 0x1007945e0
0x10005a6c0: lea rdx, [r13 + 0x655e8]
0x10005a6c7: lea rsi, [rip + 0xb07ad0] ; 0x100b6219e u_probeShB1
0x10005a6ce: mov ecx, 4
0x10005a6d3: mov rdi, rax
0x10005a6d6: call 0x100793f20 ; 0x100793f20
0x10005a6db: call 0x1007945e0 ; 0x1007945e0
0x10005a6e0: lea rdx, [r13 + 0x655fc]
0x10005a6e7: lea rsi, [rip + 0xb07abc] ; 0x100b621aa u_probeShRGB2
0x10005a6ee: mov ecx, 3
0x10005a6f3: mov rdi, rax
0x10005a6f6: call 0x100793f20 ; 0x100793f20
0x10005a6fb: call 0x1007945e0 ; 0x1007945e0
0x10005a700: lea rsi, [rip + 0xb07ab1] ; 0x100b621b8 u_probeCube
0x10005a707: xor ecx, ecx
0x10005a709: mov rdi, rax
0x10005a70c: mov rdx, r14
0x10005a70f: call 0x100794050 ; 0x100794050
0x10005a714: lea rdi, [rsp + 0x78]
0x10005a719: call 0x1007c2530 ; 0x1007c2530
0x10005a71e: call 0x10079ac90 ; 0x10079ac90
0x10005a723: lea rdx, [rip + 0xb07a9a] ; 0x100b621c4 Caustics
0x10005a72a: mov rdi, qword ptr [rsp + 0x20]
0x10005a72f: mov rsi, rax
0x10005a732: call 0x1007c4360 ; 0x1007c4360
0x10005a737: test rax, rax
0x10005a73a: je 0x10005a74b
0x10005a73c: lea rsi, [rsp + 0x78]
0x10005a741: mov rdi, rax
0x10005a744: call 0x1007c2310 ; 0x1007c2310
0x10005a749: jmp 0x10005a765 ; 0x10005a765
0x10005a74b: call 0x10079ac90 ; 0x10079ac90
0x10005a750: mov rsi, qword ptr [rax + 8]
0x10005a754: lea rdx, [rip + 0xb07a69] ; 0x100b621c4 Caustics
0x10005a75b: mov rdi, qword ptr [rsp + 0x20]
0x10005a760: call 0x1007c4640 ; 0x1007c4640
0x10005a765: call 0x1007945e0 ; 0x1007945e0
0x10005a76a: mov rcx, qword ptr [rsp + 0x78]
0x10005a76f: test rcx, rcx
0x10005a772: je 0x10005a788
0x10005a774: mov rcx, qword ptr [rcx + 0x10]
0x10005a778: lea rdx, [rcx + 0xb0]
0x10005a77f: test rcx, rcx
0x10005a782: cmove rdx, rcx
0x10005a786: jmp 0x10005a78a ; 0x10005a78a
0x10005a788: xor edx, edx
0x10005a78a: lea rsi, [rip + 0xb07a3c] ; 0x100b621cd u_caustics
0x10005a791: xor ecx, ecx
0x10005a793: mov rdi, rax
0x10005a796: call 0x100794050 ; 0x100794050
0x10005a79b: call 0x1007945e0 ; 0x1007945e0
0x10005a7a0: lea rsi, [rip + 0xb07a31] ; 0x100b621d8 u_puff
0x10005a7a7: xor ecx, ecx
0x10005a7a9: mov rdi, rax
0x10005a7ac: mov rdx, qword ptr [rsp + 0x18]
0x10005a7b1: call 0x100794050 ; 0x100794050
0x10005a7b6: call 0x1007945e0 ; 0x1007945e0
0x10005a7bb: lea rdx, [r13 + 0x97080]
0x10005a7c2: lea rsi, [rip + 0xb07a16] ; 0x100b621df u_earthPosRad
0x10005a7c9: mov ecx, 4
0x10005a7ce: mov rdi, rax
0x10005a7d1: call 0x100793f20 ; 0x100793f20
0x10005a7d6: call 0x1007945e0 ; 0x1007945e0
0x10005a7db: lea rdx, [r13 + 0xb70a0]
0x10005a7e2: lea rsi, [rip + 0xb07a04] ; 0x100b621ed u_beaconPosEnable
0x10005a7e9: mov ecx, 4
0x10005a7ee: mov rdi, rax
0x10005a7f1: call 0x100793f20 ; 0x100793f20
0x10005a7f6: call 0x1007945e0 ; 0x1007945e0
0x10005a7fb: lea rdx, [r13 + 0xb70b0]
0x10005a802: lea rsi, [rip + 0xb079f6] ; 0x100b621ff u_beaconColor
0x10005a809: mov ecx, 3
0x10005a80e: mov rdi, rax
0x10005a811: call 0x100793f20 ; 0x100793f20
0x10005a816: lea rdi, [rsp + 0x78]
0x10005a81b: call 0x1007c2570 ; 0x1007c2570
0x10005a820: lea rsi, [rip + 0xb079e6] ; 0x100b6220d GSU::Ambience
0x10005a827: xor edx, edx
0x10005a829: mov ecx, 0xa0
0x10005a82e: mov rdi, qword ptr [rbp + 0x10]
0x10005a832: call 0x100596550 ; 0x100596550
0x10005a837: mov qword ptr [r13 + 0xb70c0], rax
0x10005a83e: mov rax, qword ptr [rip + 0xbb3093] ; 0x100c0d8d8
0x10005a845: mov rax, qword ptr [rax]
0x10005a848: cmp rax, qword ptr [rsp + 0x360]
0x10005a850: jne 0x10005a861
0x10005a852: lea rsp, [rbp - 0x28]
0x10005a856: pop rbx
0x10005a857: pop r12
0x10005a859: pop r13
0x10005a85b: pop r14
0x10005a85d: pop r15
0x10005a85f: pop rbp
0x10005a860: ret 
0x10005a861: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10005a866: lea rdi, [rip + 0xb07779] ; 0x100b61fe6 m_cubeCoords && m_rayDirs && m_rayColors && "Failed to create"
0x10005a86d: lea rsi, [rip + 0xb075b1] ; 0x100b61e25 Ambience.cpp
0x10005a874: mov edx, 0x37f
0x10005a879: mov ecx, 3
0x10005a87e: call 0x1007e5f70 ; 0x1007e5f70
0x10005a883: ud2 
0x10005a885: lea rdi, [rip + 0xb07799] ; 0x100b62025 m_rayJobs && m_jobPtrs && "Failed to create"
0x10005a88c: lea rsi, [rip + 0xb07592] ; 0x100b61e25 Ambience.cpp
0x10005a893: mov edx, 0x39c
0x10005a898: mov ecx, 3
0x10005a89d: call 0x1007e5f70 ; 0x1007e5f70
0x10005a8a2: ud2 
0x10005a8a4: lea rdi, [rip + 0xb079c6] ; 0x100b62271 !m_queued
0x10005a8ab: lea rsi, [rip + 0xb079c9] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x10005a8b2: lea r8, [rip + 0xb079de] ; 0x100b62297 VertexRender has already been committed!
0x10005a8b9: mov edx, 0x8b
0x10005a8be: mov ecx, 4
0x10005a8c3: xor eax, eax
0x10005a8c5: call 0x1007e6030 ; 0x1007e6030
0x10005a8ca: ud2 
0x10005a8cc: mov rbx, rax
0x10005a8cf: mov rdi, rbx
0x10005a8d2: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10005a8d7: mov rbx, rax
0x10005a8da: lea rdi, [rsp + 0x78]
0x10005a8df: call 0x1007c2570 ; 0x1007c2570
0x10005a8e4: mov rdi, rbx
0x10005a8e7: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10005a8ec: mov rbx, rax
0x10005a8ef: mov rdi, rbx
0x10005a8f2: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10005a8f7: nop word ptr [rax + rax]
