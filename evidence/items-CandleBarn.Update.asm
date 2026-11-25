0x1001e9ba0: push rbp
0x1001e9ba1: mov rbp, rsp
0x1001e9ba4: push r15
0x1001e9ba6: push r14
0x1001e9ba8: push r13
0x1001e9baa: push r12
0x1001e9bac: push rbx
0x1001e9bad: sub rsp, 0xb8
0x1001e9bb4: mov r13, rdi
0x1001e9bb7: mov rax, qword ptr [rip + 0xa23d1a] ; 0x100c0d8d8
0x1001e9bbe: mov rax, qword ptr [rax]
0x1001e9bc1: mov qword ptr [rbp - 0x30], rax
0x1001e9bc5: mov qword ptr [rbp - 0x98], rsi
0x1001e9bcc: mov rax, qword ptr [rsi + 0x160]
0x1001e9bd3: lea rcx, [rip + 0x1e114f6] ; 0x101ffb0d0
0x1001e9bda: cmp byte ptr [rcx], 0
0x1001e9bdd: je 0x1001e9bf9
0x1001e9bdf: lea rcx, [rip + 0xace95a] ; 0x100cb8540
0x1001e9be6: vmovss xmm0, dword ptr [rcx]
0x1001e9bea: cmp dword ptr [r13 + 0xf6d0], 0
0x1001e9bf2: jne 0x1001e9c0f
0x1001e9bf4: jmp 0x1001e9f70 ; 0x1001e9f70
0x1001e9bf9: vmovss xmm0, dword ptr [rip + 0x8bb4bf] ; 0x100aa50c0
0x1001e9c01: cmp dword ptr [r13 + 0xf6d0], 0
0x1001e9c09: je 0x1001e9f70
0x1001e9c0f: vmulss xmm0, xmm0, dword ptr [rax + 0x20]
0x1001e9c14: vmulss xmm0, xmm0, dword ptr [rax + 0x14]
0x1001e9c19: vmovss xmm1, dword ptr [rip + 0x8bce7b] ; 0x100aa6a9c
0x1001e9c21: vmaxss xmm0, xmm1, xmm0
0x1001e9c25: vmovss xmm1, dword ptr [rip + 0x8bce73] ; 0x100aa6aa0
0x1001e9c2d: vminss xmm0, xmm1, xmm0
0x1001e9c31: vmovss dword ptr [rbp - 0xb0], xmm0
0x1001e9c39: xor r14d, r14d
0x1001e9c3c: nop dword ptr [rax]
0x1001e9c40: mov r14d, r14d
0x1001e9c43: imul r15, r14, 0x70
0x1001e9c47: mov rbx, qword ptr [r13 + r15 + 0x50]
0x1001e9c4c: mov rdi, qword ptr [rbx + 0x10]
0x1001e9c50: cmp byte ptr [r13 + r15 + 0x75], 0
0x1001e9c56: je 0x1001e9ea0
0x1001e9c5c: cmp byte ptr [r13 + r15 + 0x74], 0
0x1001e9c62: je 0x1001e9ea0
0x1001e9c68: mov qword ptr [rbp - 0x78], rdi
0x1001e9c6c: imul rax, r14, 0xb0
0x1001e9c73: vmovaps xmm0, xmmword ptr [r13 + rax + 0x7020]
0x1001e9c7d: vmovaps xmm1, xmmword ptr [r13 + rax + 0x7030]
0x1001e9c87: vmovaps xmm2, xmmword ptr [r13 + rax + 0x7040]
0x1001e9c91: vmovaps xmm3, xmmword ptr [r13 + rax + 0x7050]
0x1001e9c9b: vmovaps xmmword ptr [r13 + r15 + 0x10], xmm0
0x1001e9ca2: vmovaps xmmword ptr [r13 + r15 + 0x20], xmm1
0x1001e9ca9: vmovaps xmmword ptr [r13 + r15 + 0x30], xmm2
0x1001e9cb0: vmovaps xmmword ptr [r13 + r15 + 0x40], xmm3
0x1001e9cb7: cmp byte ptr [rbx + 0x54a], 1
0x1001e9cbe: je 0x1001ea1b3
0x1001e9cc4: lea r12, [r13 + r15 + 0x10]
0x1001e9cc9: mov byte ptr [rbx + 0x549], 1
0x1001e9cd0: mov rdi, qword ptr [rbx + 0x10]
0x1001e9cd4: mov esi, 1
0x1001e9cd9: call 0x10033ac40 ; 0x10033ac40
0x1001e9cde: cmp byte ptr [r13 + r15 + 0x70], 0
0x1001e9ce4: vmovss xmm2, dword ptr [rip + 0x8bb3d4] ; 0x100aa50c0
0x1001e9cec: vmovaps xmm0, xmm2
0x1001e9cf0: je 0x1001e9d2a
0x1001e9cf2: vmovss xmm1, dword ptr [r13 + r15 + 0x64]
0x1001e9cf9: vucomiss xmm1, dword ptr [rip + 0x8bd3e3] ; 0x100aa70e4
0x1001e9d01: vmovaps xmm0, xmm2
0x1001e9d05: jbe 0x1001e9d2a
0x1001e9d07: vmovss xmm0, dword ptr [r13 + r15 + 0x68]
0x1001e9d0e: vdivss xmm0, xmm0, xmm1
0x1001e9d12: vxorps xmm1, xmm1, xmm1
0x1001e9d16: vmaxss xmm0, xmm1, xmm0
0x1001e9d1a: vminss xmm0, xmm2, xmm0
0x1001e9d1e: vmulss xmm0, xmm0, dword ptr [rip + 0x8c0786] ; 0x100aaa4ac
0x1001e9d26: vaddss xmm0, xmm0, xmm2
0x1001e9d2a: vmovss xmm1, dword ptr [r13 + r15 + 0x6c]
0x1001e9d31: vmulss xmm0, xmm0, xmm1
0x1001e9d35: vinsertps xmm0, xmm1, xmm0, 0x10
0x1001e9d3b: vinsertps xmm0, xmm0, xmm1, 0x20
0x1001e9d41: vbroadcastss xmm1, dword ptr [r13 + r15 + 0x60]
0x1001e9d48: vmulps xmm0, xmm1, xmm0
0x1001e9d4c: vpermilps xmm1, xmm0, 0
0x1001e9d52: vmulps xmm1, xmm1, xmmword ptr [r12]
0x1001e9d58: vpermilps xmm2, xmm0, 0x55
0x1001e9d5e: vmulps xmm2, xmm2, xmmword ptr [r12 + 0x10]
0x1001e9d65: vpermilps xmm0, xmm0, 0xaa
0x1001e9d6b: vmulps xmm0, xmm0, xmmword ptr [r12 + 0x20]
0x1001e9d72: vmovaps xmm3, xmmword ptr [r12 + 0x30]
0x1001e9d79: vmovaps xmmword ptr [rbp - 0x70], xmm1
0x1001e9d7e: vmovaps xmmword ptr [rbp - 0x60], xmm2
0x1001e9d83: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1001e9d88: vmovaps xmmword ptr [rbp - 0x40], xmm3
0x1001e9d8d: mov rdi, rbx
0x1001e9d90: lea rsi, [rbp - 0x70]
0x1001e9d94: call 0x1001eaf00 ; 0x1001eaf00
0x1001e9d99: lea rbx, [r13 + r15 + 0x72]
0x1001e9d9e: xor esi, esi
0x1001e9da0: cmp byte ptr [r13 + r15 + 0x72], 0
0x1001e9da6: sete sil
0x1001e9daa: mov rdi, qword ptr [rbp - 0x78]
0x1001e9dae: call 0x10033ac40 ; 0x10033ac40
0x1001e9db3: cmp byte ptr [r13 + r15 + 0x71], 0
0x1001e9db9: je 0x1001e9edb
0x1001e9dbf: mov qword ptr [rbp - 0xb8], rbx
0x1001e9dc6: lea rbx, [r13 + r15 + 0x70]
0x1001e9dcb: vmovss xmm0, dword ptr [rbp - 0xb0]
0x1001e9dd3: vaddss xmm3, xmm0, dword ptr [r13 + r15 + 0x68]
0x1001e9dda: vmovss dword ptr [r13 + r15 + 0x68], xmm3
0x1001e9de1: vmovss xmm1, dword ptr [r13 + r15 + 0x64]
0x1001e9de8: vucomiss xmm1, dword ptr [rip + 0x8bd2f4] ; 0x100aa70e4
0x1001e9df0: vmovss xmm2, dword ptr [rip + 0x8bccb4] ; 0x100aa6aac
0x1001e9df8: vmovaps xmm0, xmm2
0x1001e9dfc: jbe 0x1001e9e33
0x1001e9dfe: cmp byte ptr [rbx], 0
0x1001e9e01: vmovss xmm2, dword ptr [rip + 0x8bcca3] ; 0x100aa6aac
0x1001e9e09: vmovaps xmm0, xmm2
0x1001e9e0d: je 0x1001e9e33
0x1001e9e0f: vsubss xmm0, xmm1, xmm3
0x1001e9e13: vxorps xmm1, xmm1, xmm1
0x1001e9e17: vmaxss xmm0, xmm0, xmm1
0x1001e9e1b: vmulss xmm0, xmm0, dword ptr [rip + 0x8ba795] ; 0x100aa45b8
0x1001e9e23: vmaxss xmm0, xmm1, xmm0
0x1001e9e27: vmovss xmm1, dword ptr [rip + 0x8bb291] ; 0x100aa50c0
0x1001e9e2f: vminss xmm0, xmm1, xmm0
0x1001e9e33: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x1001e9e3b: mov r12, qword ptr [rbp - 0x78]
0x1001e9e3f: mov rdi, r12
0x1001e9e42: call 0x10033b460 ; 0x10033b460
0x1001e9e47: vmovaps xmm0, xmmword ptr [rbp - 0x90]
0x1001e9e4f: vandps xmm0, xmm0, xmmword ptr [rip + 0x8bdab9] ; 0x100aa7910
0x1001e9e57: vmovss xmm1, dword ptr [rip + 0x8bda65] ; 0x100aa78c4
0x1001e9e5f: vucomiss xmm1, xmm0
0x1001e9e63: jb 0x1001e9efa
0x1001e9e69: mov esi, 1
0x1001e9e6e: mov rdi, r12
0x1001e9e71: call 0x10033a780 ; 0x10033a780
0x1001e9e76: cmp byte ptr [rbx], 0
0x1001e9e79: je 0x1001e9f3e
0x1001e9e7f: mov rax, qword ptr [rbp - 0xb8]
0x1001e9e86: mov byte ptr [rax], 1
0x1001e9e89: mov r12, qword ptr [rbp - 0x78]
0x1001e9e8d: cmp byte ptr [r12 + 0xb6], 0
0x1001e9e96: jne 0x1001e9f05
0x1001e9e98: jmp 0x1001e9f60 ; 0x1001e9f60
0x1001e9e9d: nop dword ptr [rax]
0x1001e9ea0: xor esi, esi
0x1001e9ea2: call 0x10033ac40 ; 0x10033ac40
0x1001e9ea7: cmp byte ptr [rbx + 0x54a], 1
0x1001e9eae: je 0x1001ea1b3
0x1001e9eb4: mov byte ptr [rbx + 0x549], 0
0x1001e9ebb: mov rdi, qword ptr [rbx + 0x10]
0x1001e9ebf: xor esi, esi
0x1001e9ec1: call 0x10033ac40 ; 0x10033ac40
0x1001e9ec6: inc r14d
0x1001e9ec9: cmp r14d, dword ptr [r13 + 0xf6d0]
0x1001e9ed0: jb 0x1001e9c40
0x1001e9ed6: jmp 0x1001e9f70 ; 0x1001e9f70
0x1001e9edb: cmp byte ptr [rbx], 0
0x1001e9ede: mov r12, qword ptr [rbp - 0x78]
0x1001e9ee2: je 0x1001e9efa
0x1001e9ee4: vmovss xmm0, dword ptr [rbp - 0xb0]
0x1001e9eec: vaddss xmm0, xmm0, dword ptr [r13 + r15 + 0x68]
0x1001e9ef3: vmovss dword ptr [r13 + r15 + 0x68], xmm0
0x1001e9efa: cmp byte ptr [r12 + 0xb6], 0
0x1001e9f03: je 0x1001e9f60
0x1001e9f05: lea rax, [r13 + r15 + 0x71]
0x1001e9f0a: cmp byte ptr [rax], 0
0x1001e9f0d: jne 0x1001e9f60
0x1001e9f0f: mov rsi, qword ptr [rbp - 0x98]
0x1001e9f16: mov rdi, qword ptr [rsi + 0x460]
0x1001e9f1d: mov edx, dword ptr [r13 + r15 + 0x58]
0x1001e9f22: mov ecx, 1
0x1001e9f27: call 0x1001eb190 ; 0x1001eb190
0x1001e9f2c: inc r14d
0x1001e9f2f: cmp r14d, dword ptr [r13 + 0xf6d0]
0x1001e9f36: jb 0x1001e9c40
0x1001e9f3c: jmp 0x1001e9f70 ; 0x1001e9f70
0x1001e9f3e: lea rax, [r13 + r15 + 0x68]
0x1001e9f43: mov dword ptr [rax], 0
0x1001e9f49: mov r12, qword ptr [rbp - 0x78]
0x1001e9f4d: cmp byte ptr [r12 + 0xb6], 0
0x1001e9f56: jne 0x1001e9f05
0x1001e9f58: nop dword ptr [rax + rax]
0x1001e9f60: inc r14d
0x1001e9f63: cmp r14d, dword ptr [r13 + 0xf6d0]
0x1001e9f6a: jb 0x1001e9c40
0x1001e9f70: cmp byte ptr [rip + 0x1bf4921], 0 ; 0x101dde898
0x1001e9f77: je 0x1001e9f83
0x1001e9f79: call 0x1002b9810 ; 0x1002b9810
0x1001e9f7e: test rax, rax
0x1001e9f81: jne 0x1001e9fa9
0x1001e9f83: mov rax, qword ptr [rip + 0xa2394e] ; 0x100c0d8d8
0x1001e9f8a: mov rax, qword ptr [rax]
0x1001e9f8d: cmp rax, qword ptr [rbp - 0x30]
0x1001e9f91: jne 0x1001ea1ae
0x1001e9f97: add rsp, 0xb8
0x1001e9f9e: pop rbx
0x1001e9f9f: pop r12
0x1001e9fa1: pop r13
0x1001e9fa3: pop r14
0x1001e9fa5: pop r15
0x1001e9fa7: pop rbp
0x1001e9fa8: ret 
0x1001e9fa9: mov eax, dword ptr [r13 + 0xf980]
0x1001e9fb0: mov qword ptr [rbp - 0x78], rax
0x1001e9fb4: test rax, rax
0x1001e9fb7: je 0x1001e9fdd
0x1001e9fb9: mov rax, qword ptr [r13 + 0xf990]
0x1001e9fc0: xor r12d, r12d
0x1001e9fc3: mov ecx, r12d
0x1001e9fc6: shr ecx, 5
0x1001e9fc9: mov ecx, dword ptr [rax + rcx*4]
0x1001e9fcc: bt ecx, r12d
0x1001e9fd0: jb 0x1001e9fe0
0x1001e9fd2: inc r12d
0x1001e9fd5: cmp r12d, dword ptr [rbp - 0x78]
0x1001e9fd9: jb 0x1001e9fc3
0x1001e9fdb: jmp 0x1001e9fe0 ; 0x1001e9fe0
0x1001e9fdd: xor r12d, r12d
0x1001e9fe0: cmp dword ptr [rbp - 0x78], r12d
0x1001e9fe4: je 0x1001e9f83
0x1001e9fe6: cmp dword ptr [rbp - 0x78], r12d
0x1001e9fea: jbe 0x1001ea192
0x1001e9ff0: mov rax, qword ptr [rbp - 0x78]
0x1001e9ff4: shl rax, 0x20
0x1001e9ff8: mov r15d, r12d
0x1001e9ffb: or r15, rax
0x1001e9ffe: mov rax, qword ptr [r13 + 0xf990]
0x1001ea005: mov rcx, r15
0x1001ea008: shr rcx, 3
0x1001ea00c: and ecx, 0x1ffffffc
0x1001ea012: mov eax, dword ptr [rax + rcx]
0x1001ea015: bt eax, r12d
0x1001ea019: jae 0x1001ea1f7
0x1001ea01f: mov rbx, qword ptr [r13 + 0xf998]
0x1001ea026: mov eax, r15d
0x1001ea029: imul r14, rax, 0x570
0x1001ea030: mov rdi, qword ptr [rbx + r14 + 0x10]
0x1001ea035: mov rax, qword ptr [rdi]
0x1001ea038: call qword ptr [rax + 0x10]
0x1001ea03b: test al, al
0x1001ea03d: je 0x1001ea137
0x1001ea043: lea rax, [rbx + r14 + 0x10]
0x1001ea048: mov qword ptr [rbp - 0x90], rax
0x1001ea04f: vmovaps xmm0, xmmword ptr [rbx + r14 + 0x60]
0x1001ea056: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x1001ea05e: mov rax, qword ptr [rbp - 0x98]
0x1001ea065: mov rsi, qword ptr [rax + 0x70]
0x1001ea069: lea rdi, [rbp - 0xe0]
0x1001ea070: call 0x10076be90 ; 0x10076be90
0x1001ea075: vmovaps xmm0, xmmword ptr [rbp - 0xe0]
0x1001ea07d: vsubps xmm0, xmm0, xmmword ptr [rbp - 0xd0]
0x1001ea085: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x1001ea08d: mov rax, qword ptr [rbp - 0x90]
0x1001ea094: mov rax, qword ptr [rax]
0x1001ea097: vmovss xmm0, dword ptr [rax + 0x110]
0x1001ea09f: vmovsd qword ptr [rbp - 0x90], xmm0
0x1001ea0a7: call 0x1002acd30 ; 0x1002acd30
0x1001ea0ac: vmovsd xmm2, qword ptr [rbp - 0x90]
0x1001ea0b4: vucomiss xmm2, dword ptr [rip + 0x8bd028] ; 0x100aa70e4
0x1001ea0bc: jbe 0x1001ea137
0x1001ea0be: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x1001ea0c6: vmulps xmm0, xmm0, xmm0
0x1001ea0ca: vmovshdup xmm1, xmm0
0x1001ea0ce: vaddss xmm1, xmm0, xmm1
0x1001ea0d2: vpermilpd xmm0, xmm0, 1
0x1001ea0d8: vaddss xmm0, xmm0, xmm1
0x1001ea0dc: vsqrtss xmm0, xmm0, xmm0
0x1001ea0e0: vmovss xmm1, dword ptr [rip + 0x8bdbcc] ; 0x100aa7cb4
0x1001ea0e8: vucomiss xmm1, xmm0
0x1001ea0ec: jbe 0x1001ea137
0x1001ea0ee: test rax, rax
0x1001ea0f1: je 0x1001ea137
0x1001ea0f3: vcvtss2sd xmm0, xmm2, xmm2
0x1001ea0f7: mov esi, 0x18
0x1001ea0fc: mov al, 1
0x1001ea0fe: lea rbx, [rbp - 0x70]
0x1001ea102: mov rdi, rbx
0x1001ea105: lea rdx, [rip + 0x98f51e] ; 0x100b7962a %.1f
0x1001ea10c: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x1001ea111: call 0x1002acd30 ; 0x1002acd30
0x1001ea116: mov rdi, rax
0x1001ea119: mov rsi, rbx
0x1001ea11c: lea rdx, [rbp - 0xd0]
0x1001ea123: vmovss xmm0, dword ptr [rip + 0x8bf545] ; 0x100aa9670
0x1001ea12b: lea rcx, [rip + 0x1e5550e] ; 0x10203f640
0x1001ea132: call 0x1002b2410 ; 0x1002b2410
0x1001ea137: mov rax, r15
0x1001ea13a: shr rax, 0x20
0x1001ea13e: inc r12d
0x1001ea141: movabs rdi, 0xffffffff00000000
0x1001ea14b: mov rcx, r12
0x1001ea14e: and r15, rdi
0x1001ea151: or r15, rcx
0x1001ea154: cmp ecx, eax
0x1001ea156: jae 0x1001ea179
0x1001ea158: cmp dword ptr [r13 + 0xf980], ecx
0x1001ea15f: jbe 0x1001ea1db
0x1001ea161: mov rdx, qword ptr [r13 + 0xf990]
0x1001ea168: mov esi, ecx
0x1001ea16a: shr esi, 5
0x1001ea16d: mov edx, dword ptr [rdx + rsi*4]
0x1001ea170: lea r12, [rcx + 1]
0x1001ea174: bt edx, ecx
0x1001ea177: jae 0x1001ea14b
0x1001ea179: cmp dword ptr [rbp - 0x78], ecx
0x1001ea17c: je 0x1001e9f83
0x1001ea182: cmp dword ptr [r13 + 0xf980], ecx
0x1001ea189: mov r12d, ecx
0x1001ea18c: ja 0x1001e9ffe
0x1001ea192: lea rdi, [rip + 0x989dd0] ; 0x100b73f69 idx < kCapacity
0x1001ea199: lea rsi, [rip + 0x989dd9] ; 0x100b73f79 ../../../Code/Base/ObjectPool.h
0x1001ea1a0: lea r8, [rip + 0x989df2] ; 0x100b73f99 ObjectPool attempted to access out of bounds
0x1001ea1a7: mov edx, 0x6b
0x1001ea1ac: jmp 0x1001ea1cd ; 0x1001ea1cd
0x1001ea1ae: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1001ea1b3: lea rdi, [rip + 0x9780b7] ; 0x100b62271 !m_queued
0x1001ea1ba: lea rsi, [rip + 0x9780ba] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1001ea1c1: lea r8, [rip + 0x9780cf] ; 0x100b62297 VertexRender has already been committed!
0x1001ea1c8: mov edx, 0x8a
0x1001ea1cd: mov ecx, 4
0x1001ea1d2: xor eax, eax
0x1001ea1d4: call 0x1007e6030 ; 0x1007e6030
0x1001ea1d9: ud2 
0x1001ea1db: lea rdi, [rip + 0x989d87] ; 0x100b73f69 idx < kCapacity
0x1001ea1e2: lea rsi, [rip + 0x989d90] ; 0x100b73f79 ../../../Code/Base/ObjectPool.h
0x1001ea1e9: lea r8, [rip + 0x989da9] ; 0x100b73f99 ObjectPool attempted to access out of bounds
0x1001ea1f0: mov edx, 0x39
0x1001ea1f5: jmp 0x1001ea1cd ; 0x1001ea1cd
0x1001ea1f7: lea rdi, [rip + 0x989dc8] ; 0x100b73fc6 Allocated( idx )
0x1001ea1fe: lea rsi, [rip + 0x989d74] ; 0x100b73f79 ../../../Code/Base/ObjectPool.h
0x1001ea205: lea r8, [rip + 0x989dcb] ; 0x100b73fd7 ObjectPool attempted to access unallocated slot
0x1001ea20c: mov edx, 0x6c
0x1001ea211: jmp 0x1001ea1cd ; 0x1001ea1cd
0x1001ea213: nop word ptr cs:[rax + rax]
