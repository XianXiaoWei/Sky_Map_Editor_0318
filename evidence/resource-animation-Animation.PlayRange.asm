0x100095c70: push rbp
0x100095c71: mov rbp, rsp
0x100095c74: push r15
0x100095c76: push r14
0x100095c78: push r13
0x100095c7a: push r12
0x100095c7c: push rbx
0x100095c7d: sub rsp, 0x38
0x100095c81: vmovss dword ptr [rbp - 0x48], xmm4
0x100095c86: vmovss dword ptr [rbp - 0x38], xmm3
0x100095c8b: mov dword ptr [rbp - 0x44], r9d
0x100095c8f: mov r14d, r8d
0x100095c92: vmovss dword ptr [rbp - 0x40], xmm0
0x100095c97: mov r13d, ecx
0x100095c9a: mov r8d, edx
0x100095c9d: mov r9d, esi
0x100095ca0: mov r15, rdi
0x100095ca3: mov esi, dword ptr [rbp + 0x38]
0x100095ca6: mov r12d, dword ptr [rbp + 0x30]
0x100095caa: cmp r14d, -1
0x100095cae: je 0x100095d0b
0x100095cb0: movsxd rax, r14d
0x100095cb3: mov rbx, qword ptr [r15 + rax*8 + 0x6020]
0x100095cbb: mov r12d, esi
0x100095cbe: lea esi, [r9 - 1]
0x100095cc2: lea edx, [r8 - 1]
0x100095cc6: mov rdi, rbx
0x100095cc9: mov qword ptr [rbp - 0x50], r8
0x100095ccd: mov qword ptr [rbp - 0x58], r9
0x100095cd1: vmovss dword ptr [rbp - 0x34], xmm5
0x100095cd6: vmovss dword ptr [rbp - 0x30], xmm2
0x100095cdb: vmovss dword ptr [rbp - 0x3c], xmm1
0x100095ce0: call 0x1000e69e0 ; 0x1000e69e0
0x100095ce5: vmovss xmm1, dword ptr [rbp - 0x3c]
0x100095cea: mov esi, r12d
0x100095ced: mov r12d, dword ptr [rbp + 0x30]
0x100095cf1: vmovss xmm2, dword ptr [rbp - 0x30]
0x100095cf6: vmovss xmm5, dword ptr [rbp - 0x34]
0x100095cfb: mov r9, qword ptr [rbp - 0x58]
0x100095cff: mov r8, qword ptr [rbp - 0x50]
0x100095d03: test al, al
0x100095d05: je 0x100095f7d
0x100095d0b: mov eax, dword ptr [rbp + 0x50]
0x100095d0e: cmp eax, -1
0x100095d11: je 0x100095d2e
0x100095d13: cmp eax, 0x98
0x100095d18: mov qword ptr [rbp - 0x30], rax
0x100095d1c: jae 0x100095d74
0x100095d1e: cdqe 
0x100095d20: imul rax, rax, 0x70
0x100095d24: lea rbx, [r15 + rax + 0x18]
0x100095d29: jmp 0x100095e1a ; 0x100095e1a
0x100095d2e: cmp r13d, 2
0x100095d32: je 0x100095de2
0x100095d38: cmp r13d, 1
0x100095d3c: je 0x100095db5
0x100095d3e: test r13d, r13d
0x100095d41: jne 0x100095e0f
0x100095d47: movsxd rcx, dword ptr [r15 + 8]
0x100095d4b: cmp rcx, 0x98
0x100095d52: jge 0x10009600e
0x100095d58: imul rax, rcx, 0x70
0x100095d5c: lea rbx, [r15 + rax + 0x18]
0x100095d61: mov rax, rcx
0x100095d64: mov qword ptr [rbp - 0x30], rax
0x100095d68: lea eax, [rcx + 1]
0x100095d6b: mov dword ptr [r15 + 8], eax
0x100095d6f: jmp 0x100095e1a ; 0x100095e1a
0x100095d74: cmp eax, 0xa8
0x100095d79: jge 0x100095d94
0x100095d7b: lea eax, [rax - 0x98]
0x100095d81: cdqe 
0x100095d83: imul rax, rax, 0x70
0x100095d87: lea rbx, [r15 + rax + 0x4298]
0x100095d8f: jmp 0x100095e1a ; 0x100095e1a
0x100095d94: cmp eax, 0xc1
0x100095d99: jge 0x100095fe6
0x100095d9f: lea eax, [rax - 0xa8]
0x100095da5: cdqe 
0x100095da7: imul rax, rax, 0x70
0x100095dab: lea rbx, [r15 + rax + 0x4998]
0x100095db3: jmp 0x100095e1a ; 0x100095e1a
0x100095db5: movsxd rax, dword ptr [r15 + 0xc]
0x100095db9: cmp rax, 0x10
0x100095dbd: jge 0x10009602d
0x100095dc3: imul rcx, rax, 0x70
0x100095dc7: lea rbx, [r15 + rcx + 0x4298]
0x100095dcf: lea ecx, [rax + 0x98]
0x100095dd5: mov qword ptr [rbp - 0x30], rcx
0x100095dd9: lea eax, [rax + 1]
0x100095ddc: mov dword ptr [r15 + 0xc], eax
0x100095de0: jmp 0x100095e1a ; 0x100095e1a
0x100095de2: movsxd rax, dword ptr [r15 + 0x10]
0x100095de6: cmp rax, 0x19
0x100095dea: jge 0x10009604c
0x100095df0: imul rcx, rax, 0x70
0x100095df4: lea rbx, [r15 + rcx + 0x4998]
0x100095dfc: lea ecx, [rax + 0xa8]
0x100095e02: mov qword ptr [rbp - 0x30], rcx
0x100095e06: lea eax, [rax + 1]
0x100095e09: mov dword ptr [r15 + 0x10], eax
0x100095e0d: jmp 0x100095e1a ; 0x100095e1a
0x100095e0f: mov eax, 0xffffffff
0x100095e14: mov qword ptr [rbp - 0x30], rax
0x100095e18: xor ebx, ebx
0x100095e1a: mov eax, dword ptr [rbp + 0x40]
0x100095e1d: mov ecx, dword ptr [r15 + 0x5864]
0x100095e24: lea edx, [rcx + 1]
0x100095e27: mov dword ptr [r15 + 0x5864], edx
0x100095e2e: mov dword ptr [rbx], ecx
0x100095e30: mov dword ptr [rbx + 0xc], r14d
0x100095e34: mov dword ptr [rbx + 4], r12d
0x100095e38: mov dword ptr [rbx + 8], esi
0x100095e3b: vmovss dword ptr [rbx + 0x14], xmm1
0x100095e40: vmovss dword ptr [rbx + 0x18], xmm2
0x100095e45: lea esi, [r9 - 1]
0x100095e49: mov dword ptr [rbx + 0x24], esi
0x100095e4c: mov ecx, 1
0x100095e51: sub ecx, r9d
0x100095e54: add ecx, r8d
0x100095e57: mov dword ptr [rbx + 0x28], ecx
0x100095e5a: mov dword ptr [rbx + 0x2c], eax
0x100095e5d: vmovss dword ptr [rbx + 0x30], xmm5
0x100095e62: xor r12d, r12d
0x100095e65: cmp r14d, -1
0x100095e69: mov dword ptr [rbp - 0x34], r14d
0x100095e6d: movsxd r13, r14d
0x100095e70: mov r14d, 0
0x100095e76: cmovne r14, r13
0x100095e7a: mov rdi, qword ptr [r15 + r14*8 + 0x6020]
0x100095e82: dec r8d
0x100095e85: mov edx, r8d
0x100095e88: call 0x1000e49e0 ; 0x1000e49e0
0x100095e8d: mov dword ptr [rbx + 0x10], eax
0x100095e90: mov rax, qword ptr [r15 + r14*8 + 0x6020]
0x100095e98: vcvtsi2ss xmm0, xmm6, dword ptr [rax + 0x50]
0x100095e9d: vmulss xmm0, xmm0, dword ptr [rbp - 0x40]
0x100095ea2: vmovss dword ptr [rbx + 0x20], xmm0
0x100095ea7: mov eax, dword ptr [rbp + 0x48]
0x100095eaa: mov dword ptr [rbx + 0x5c], eax
0x100095ead: vmulss xmm0, xmm0, dword ptr [rbp - 0x38]
0x100095eb2: vxorps xmm0, xmm0, xmmword ptr [rip + 0xa11a46] ; 0x100aa7900
0x100095eba: mov edx, dword ptr [rbx + 0x28]
0x100095ebd: vcvtsi2ss xmm1, xmm6, edx
0x100095ec1: vdivss xmm0, xmm0, xmm1
0x100095ec5: vmovss dword ptr [rbx + 0x1c], xmm0
0x100095eca: vxorps xmm1, xmm1, xmm1
0x100095ece: vucomiss xmm1, xmm0
0x100095ed2: jbe 0x100095eef
0x100095ed4: vmovss xmm2, dword ptr [rip + 0xa0f1e4] ; 0x100aa50c0
0x100095edc: nop dword ptr [rax]
0x100095ee0: vaddss xmm0, xmm0, xmm2
0x100095ee4: vucomiss xmm1, xmm0
0x100095ee8: ja 0x100095ee0
0x100095eea: vmovss dword ptr [rbx + 0x1c], xmm0
0x100095eef: mov r8b, byte ptr [rbp + 0x10]
0x100095ef3: mov cl, byte ptr [rbp + 0x18]
0x100095ef6: mov sil, byte ptr [rbp + 0x20]
0x100095efa: mov dil, byte ptr [rbp + 0x28]
0x100095efe: mov eax, dword ptr [rbp - 0x44]
0x100095f01: mov byte ptr [rbx + 0x4f], al
0x100095f04: test al, al
0x100095f06: je 0x100095f0f
0x100095f08: mov r12d, dword ptr [r15 + 0x5868]
0x100095f0f: mov dword ptr [rbx + 0x50], r12d
0x100095f13: vmovss xmm0, dword ptr [rbp - 0x38]
0x100095f18: vmovss dword ptr [rbx + 0x54], xmm0
0x100095f1d: vmovd xmm0, dword ptr [rbp - 0x48]
0x100095f22: vmovd dword ptr [rbx + 0x58], xmm0
0x100095f27: mov byte ptr [rbx + 0x60], 1
0x100095f2b: vpcmpeqd xmm0, xmm0, xmm0
0x100095f2f: vmovdqu xmmword ptr [rbx + 0x34], xmm0
0x100095f34: mov dword ptr [rbx + 0x44], 0xffffffff
0x100095f3b: mov byte ptr [rbx + 0x4c], r8b
0x100095f3f: mov byte ptr [rbx + 0x4d], cl
0x100095f42: mov byte ptr [rbx + 0x4e], sil
0x100095f46: mov byte ptr [rbx + 0x62], dil
0x100095f4a: cmp dword ptr [rbp - 0x34], -1
0x100095f4e: je 0x100095f6a
0x100095f50: mov rdi, qword ptr [r15 + r13*8 + 0x6020]
0x100095f58: mov esi, dword ptr [rbx + 0x24]
0x100095f5b: mov rcx, qword ptr [rbx + 0x68]
0x100095f5f: call 0x1000e6580 ; 0x1000e6580
0x100095f64: test eax, eax
0x100095f66: setg byte ptr [rbx + 0x61]
0x100095f6a: mov rax, qword ptr [rbp - 0x30]
0x100095f6e: add rsp, 0x38
0x100095f72: pop rbx
0x100095f73: pop r12
0x100095f75: pop r13
0x100095f77: pop r14
0x100095f79: pop r15
0x100095f7b: pop rbp
0x100095f7c: ret 
0x100095f7d: mov r14d, esi
0x100095f80: call 0x10009fcd0 ; 0x10009fcd0
0x100095f85: mov rdi, rax
0x100095f88: mov esi, r12d
0x100095f8b: mov edx, r14d
0x100095f8e: call 0x1000dd330 ; 0x1000dd330
0x100095f93: mov r9, rax
0x100095f96: test byte ptr [r9 + 0x10], 1
0x100095f9b: jne 0x100095fa6
0x100095f9d: add r9, 0x10
0x100095fa1: inc r9
0x100095fa4: jmp 0x100095faa ; 0x100095faa
0x100095fa6: mov r9, qword ptr [r9 + 0x20]
0x100095faa: mov r10d, dword ptr [rbx + 0x48]
0x100095fae: lea rdi, [rip + 0xb0d077] ; 0x100ba302c false
0x100095fb5: lea rsi, [rip + 0xacf638] ; 0x100b655f4 AnimationInstance.cpp
0x100095fbc: lea r8, [rip + 0xacfa63] ; 0x100b65a26 Animation not Found %s in %s. start=%d end=%d packEnd=%d
0x100095fc3: mov edx, 0x24a
0x100095fc8: mov ecx, 4
0x100095fcd: mov eax, 0
0x100095fd2: push r10
0x100095fd4: push qword ptr [rbp - 0x50]
0x100095fd7: push qword ptr [rbp - 0x58]
0x100095fda: push rbx
0x100095fdb: call 0x1007e6030 ; 0x1007e6030
0x100095fe0: add rsp, 0x20
0x100095fe4: ud2 
0x100095fe6: lea rdi, [rip + 0xb0d03f] ; 0x100ba302c false
0x100095fed: lea rsi, [rip + 0xacf600] ; 0x100b655f4 AnimationInstance.cpp
0x100095ff4: lea r8, [rip + 0xacfc33] ; 0x100b65c2e playheadIndex out of bounds
0x100095ffb: mov edx, 0x8b3
0x100096000: mov ecx, 4
0x100096005: xor eax, eax
0x100096007: call 0x1007e6030 ; 0x1007e6030
0x10009600c: ud2 
0x10009600e: lea rdi, [rip + 0xacfa4a] ; 0x100b65a5f m_stateCount < kMaxStateCount
0x100096015: lea rsi, [rip + 0xacf5d8] ; 0x100b655f4 AnimationInstance.cpp
0x10009601c: mov edx, 0x254
0x100096021: mov ecx, 3
0x100096026: call 0x1007e5f70 ; 0x1007e5f70
0x10009602b: ud2 
0x10009602d: lea rdi, [rip + 0xacfa49] ; 0x100b65a7d m_actionCount < kMaxActionCount
0x100096034: lea rsi, [rip + 0xacf5b9] ; 0x100b655f4 AnimationInstance.cpp
0x10009603b: mov edx, 0x25a
0x100096040: mov ecx, 3
0x100096045: call 0x1007e5f70 ; 0x1007e5f70
0x10009604a: ud2 
0x10009604c: lea rdi, [rip + 0xacfa4a] ; 0x100b65a9d m_additiveCount < kMaxAdditiveCount
0x100096053: lea rsi, [rip + 0xacf59a] ; 0x100b655f4 AnimationInstance.cpp
0x10009605a: mov edx, 0x260
0x10009605f: mov ecx, 3
0x100096064: call 0x1007e5f70 ; 0x1007e5f70
0x100096069: ud2 
0x10009606b: nop dword ptr [rax + rax]
