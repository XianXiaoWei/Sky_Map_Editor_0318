0x1001cfaf0: push rbp
0x1001cfaf1: mov rbp, rsp
0x1001cfaf4: push r15
0x1001cfaf6: push r14
0x1001cfaf8: push rbx
0x1001cfaf9: and rsp, 0xffffffffffffffe0
0x1001cfafd: sub rsp, 0xa0
0x1001cfb04: mov r14, rdx
0x1001cfb07: mov rbx, rdi
0x1001cfb0a: mov rax, qword ptr [rip + 0xa3ddc7] ; 0x100c0d8d8
0x1001cfb11: mov rax, qword ptr [rax]
0x1001cfb14: mov qword ptr [rsp + 0x90], rax
0x1001cfb1c: mov rdi, qword ptr [rbx + 0x80]
0x1001cfb23: call 0x1001cf940 ; 0x1001cf940
0x1001cfb28: mov rax, qword ptr [r14 + 0x388]
0x1001cfb2f: mov ecx, dword ptr [rax + 0x50]
0x1001cfb32: cmp rcx, 8
0x1001cfb36: jae 0x1001cffc0
0x1001cfb3c: mov byte ptr [rbx + 0xb24], cl
0x1001cfb42: lea edx, [rcx + 1]
0x1001cfb45: mov dword ptr [rax + 0x50], edx
0x1001cfb48: mov qword ptr [rax + rcx*8 + 0x10], rbx
0x1001cfb4d: vxorps ymm0, ymm0, ymm0
0x1001cfb51: vmovaps ymmword ptr [rsp + 0x60], ymm0
0x1001cfb57: mov rax, qword ptr [r14 + 0x178]
0x1001cfb5e: mov rdi, qword ptr [rax + 0x20]
0x1001cfb62: lea rsi, [rsp + 0x60]
0x1001cfb67: vzeroupper 
0x1001cfb6a: call 0x1004a9e50 ; 0x1004a9e50
0x1001cfb6f: mov ecx, eax
0x1001cfb71: movzx eax, byte ptr [rbx + 0xb24]
0x1001cfb78: xor edx, edx
0x1001cfb7a: div ecx
0x1001cfb7c: mov eax, dword ptr [rsp + rdx*4 + 0x60]
0x1001cfb80: mov dword ptr [rbx + 0xb28], eax
0x1001cfb86: mov rdi, qword ptr [r14 + 0x300]
0x1001cfb8d: xor esi, esi
0x1001cfb8f: call 0x10043d6a0 ; 0x10043d6a0
0x1001cfb94: mov qword ptr [rbx + 0xb58], rax
0x1001cfb9b: mov eax, dword ptr [rip + 0xb54447] ; 0x100d23fe8
0x1001cfba1: mov dword ptr [rbx + 0xb60], eax
0x1001cfba7: mov rax, qword ptr [r14 + 0x178]
0x1001cfbae: mov rax, qword ptr [rax + 0x38]
0x1001cfbb2: mov qword ptr [rbx + 0xb68], rax
0x1001cfbb9: mov dword ptr [rbx + 0xb20], 0x4e6e6b28
0x1001cfbc3: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001cfbc8: vcvtsi2ss xmm0, xmm1, eax
0x1001cfbcc: vmulss xmm0, xmm0, dword ptr [rip + 0x8d751c] ; 0x100aa70f0
0x1001cfbd4: vmovss xmm1, dword ptr [rip + 0x8d54e4] ; 0x100aa50c0
0x1001cfbdc: vsubss xmm1, xmm1, xmm0
0x1001cfbe0: vxorps xmm2, xmm2, xmm2
0x1001cfbe4: vmulss xmm1, xmm1, xmm2
0x1001cfbe8: vaddss xmm0, xmm0, xmm1
0x1001cfbec: vmovss dword ptr [rbx + 0xd8], xmm0
0x1001cfbf4: vmovaps xmm2, xmmword ptr [rbx + 0x90]
0x1001cfbfc: vmovaps xmm1, xmmword ptr [rbx + 0xa0]
0x1001cfc04: vmovaps xmm0, xmmword ptr [rbx + 0xb0]
0x1001cfc0c: vmovaps xmm3, xmmword ptr [rbx + 0xc0]
0x1001cfc14: vmovaps xmmword ptr [rbx + 0x10], xmm3
0x1001cfc19: vmovaps xmmword ptr [rbx + 0x20], xmm2
0x1001cfc1e: vmovaps xmmword ptr [rbx + 0x30], xmm1
0x1001cfc23: vmovaps xmmword ptr [rbx + 0x40], xmm0
0x1001cfc28: vmulps xmm3, xmm2, xmm2
0x1001cfc2c: vmovshdup xmm4, xmm3
0x1001cfc30: vaddss xmm4, xmm3, xmm4
0x1001cfc34: vpermilpd xmm3, xmm3, 1
0x1001cfc3a: vaddss xmm3, xmm3, xmm4
0x1001cfc3e: vsqrtss xmm3, xmm3, xmm3
0x1001cfc42: vucomiss xmm3, dword ptr [rip + 0x8d7c7a] ; 0x100aa78c4
0x1001cfc4a: jbe 0x1001cfc56
0x1001cfc4c: vpermilps xmm3, xmm3, 0xc0
0x1001cfc52: vdivps xmm2, xmm2, xmm3
0x1001cfc56: vmovaps xmmword ptr [rbx + 0x20], xmm2
0x1001cfc5b: vmulps xmm2, xmm1, xmm1
0x1001cfc5f: vmovshdup xmm3, xmm2
0x1001cfc63: vaddss xmm3, xmm2, xmm3
0x1001cfc67: vpermilpd xmm2, xmm2, 1
0x1001cfc6d: vaddss xmm2, xmm2, xmm3
0x1001cfc71: vsqrtss xmm2, xmm2, xmm2
0x1001cfc75: vucomiss xmm2, dword ptr [rip + 0x8d7c47] ; 0x100aa78c4
0x1001cfc7d: jbe 0x1001cfc89
0x1001cfc7f: vpermilps xmm2, xmm2, 0xc0
0x1001cfc85: vdivps xmm1, xmm1, xmm2
0x1001cfc89: vmovaps xmmword ptr [rbx + 0x30], xmm1
0x1001cfc8e: vmulps xmm1, xmm0, xmm0
0x1001cfc92: vmovshdup xmm2, xmm1
0x1001cfc96: vaddss xmm2, xmm1, xmm2
0x1001cfc9a: vpermilpd xmm1, xmm1, 1
0x1001cfca0: vaddss xmm1, xmm1, xmm2
0x1001cfca4: vsqrtss xmm1, xmm1, xmm1
0x1001cfca8: vucomiss xmm1, dword ptr [rip + 0x8d7c14] ; 0x100aa78c4
0x1001cfcb0: vmovaps xmm2, xmm0
0x1001cfcb4: jbe 0x1001cfcc0
0x1001cfcb6: vpermilps xmm2, xmm1, 0xc0
0x1001cfcbc: vdivps xmm2, xmm0, xmm2
0x1001cfcc0: vucomiss xmm1, dword ptr [rip + 0x8d7bfc] ; 0x100aa78c4
0x1001cfcc8: vmovaps xmmword ptr [rbx + 0x40], xmm2
0x1001cfccd: vxorps xmm2, xmm2, xmm2
0x1001cfcd1: vmovaps xmmword ptr [rbx + 0x50], xmm2
0x1001cfcd6: mov r15, qword ptr [rbx + 0x80]
0x1001cfcdd: mov eax, dword ptr [r15 + 0x30]
0x1001cfce1: mov dword ptr [rbx + 0x60], eax
0x1001cfce4: mov eax, dword ptr [r15 + 0x38]
0x1001cfce8: mov dword ptr [rbx + 0x64], eax
0x1001cfceb: mov dword ptr [rbx + 0x68], 0x3f800000
0x1001cfcf2: vxorps xmm0, xmm0, xmmword ptr [rip + 0x8d7c06] ; 0x100aa7900
0x1001cfcfa: jbe 0x1001cfd06
0x1001cfcfc: vpermilps xmm1, xmm1, 0xc0
0x1001cfd02: vdivps xmm0, xmm0, xmm1
0x1001cfd06: vmovaps xmmword ptr [rsp + 0x10], xmm0
0x1001cfd0c: vpermilpd xmm1, xmm0, 1
0x1001cfd12: call 0x100aa25a0 ; 0x100aa25a0 _atan2f
0x1001cfd17: vmovss dword ptr [rbx + 0xd0], xmm0
0x1001cfd1f: vmovshdup xmm0, xmmword ptr [rsp + 0x10]
0x1001cfd25: call 0x100aa2588 ; 0x100aa2588 _asinf
0x1001cfd2a: vmovss dword ptr [rbx + 0xd4], xmm0
0x1001cfd32: mov rdi, qword ptr [r14 + 0x5a8]
0x1001cfd39: mov rax, qword ptr [r15 + 8]
0x1001cfd3d: mov rsi, qword ptr [rax + 0x228]
0x1001cfd44: call 0x10046ccc0 ; 0x10046ccc0
0x1001cfd49: mov qword ptr [rbx + 0xb30], rax
0x1001cfd50: test rax, rax
0x1001cfd53: je 0x1001cffdf
0x1001cfd59: vmovaps xmm0, xmmword ptr [rip + 0x8dab5f] ; 0x100aaa8c0
0x1001cfd61: vmovaps xmmword ptr [rbx + 0xb40], xmm0
0x1001cfd69: mov rax, qword ptr [rbx + 0x80]
0x1001cfd70: mov rsi, qword ptr [rax + 8]
0x1001cfd74: mov rax, qword ptr [rsi]
0x1001cfd77: lea r14, [rsp + 0x20]
0x1001cfd7c: mov rdi, r14
0x1001cfd7f: call qword ptr [rax + 0x18]
0x1001cfd82: vmovaps xmm0, xmmword ptr [rsp + 0x20]
0x1001cfd88: vmulps xmm0, xmm0, xmm0
0x1001cfd8c: vmovshdup xmm1, xmm0
0x1001cfd90: vaddss xmm1, xmm0, xmm1
0x1001cfd94: vpermilpd xmm0, xmm0, 1
0x1001cfd9a: vaddss xmm0, xmm0, xmm1
0x1001cfd9e: vsqrtss xmm0, xmm0, xmm0
0x1001cfda2: vmovss dword ptr [rbx + 0xb40], xmm0
0x1001cfdaa: mov rax, qword ptr [rbx + 0x80]
0x1001cfdb1: mov rsi, qword ptr [rax + 8]
0x1001cfdb5: mov rax, qword ptr [rsi]
0x1001cfdb8: mov rdi, r14
0x1001cfdbb: call qword ptr [rax + 0x18]
0x1001cfdbe: vmovaps xmm0, xmmword ptr [rsp + 0x30]
0x1001cfdc4: vmulps xmm0, xmm0, xmm0
0x1001cfdc8: vmovshdup xmm1, xmm0
0x1001cfdcc: vaddss xmm1, xmm0, xmm1
0x1001cfdd0: vpermilpd xmm0, xmm0, 1
0x1001cfdd6: vaddss xmm0, xmm0, xmm1
0x1001cfdda: vsqrtss xmm0, xmm0, xmm0
0x1001cfdde: vmovss dword ptr [rbx + 0xb44], xmm0
0x1001cfde6: mov rax, qword ptr [rbx + 0x80]
0x1001cfded: mov rsi, qword ptr [rax + 8]
0x1001cfdf1: mov rax, qword ptr [rsi]
0x1001cfdf4: mov rdi, r14
0x1001cfdf7: call qword ptr [rax + 0x18]
0x1001cfdfa: vmovaps xmm0, xmmword ptr [rsp + 0x40]
0x1001cfe00: vmulps xmm0, xmm0, xmm0
0x1001cfe04: vmovshdup xmm1, xmm0
0x1001cfe08: vaddss xmm1, xmm0, xmm1
0x1001cfe0c: vpermilpd xmm0, xmm0, 1
0x1001cfe12: vaddss xmm0, xmm0, xmm1
0x1001cfe16: vsqrtss xmm0, xmm0, xmm0
0x1001cfe1a: vmovss dword ptr [rbx + 0xb48], xmm0
0x1001cfe22: mov dword ptr [rbx + 0xb50], 0
0x1001cfe2c: lea rdi, [rbx + 0x138]
0x1001cfe33: call 0x1007331f0 ; 0x1007331f0
0x1001cfe38: mov dword ptr [rbx + 0xaac], 0
0x1001cfe42: mov dword ptr [rbx + 0x114], 0
0x1001cfe4c: mov dword ptr [rbx + 0xe0], 0
0x1001cfe56: mov qword ptr [rbx + 0xe8], 0
0x1001cfe61: vxorps xmm0, xmm0, xmm0
0x1001cfe65: vmovaps xmmword ptr [rbx + 0xf0], xmm0
0x1001cfe6d: mov dword ptr [rbx + 0x100], 0
0x1001cfe77: vmovaps xmm1, xmmword ptr [rbx + 0x10]
0x1001cfe7c: vmovaps xmmword ptr [rbx + 0x990], xmm1
0x1001cfe84: movzx eax, byte ptr [rbx + 0xb24]
0x1001cfe8b: imul eax, eax, 0xec4bab
0x1001cfe91: mov dword ptr [rbx + 0x110], eax
0x1001cfe97: mov dword ptr [rbx + 0x9a0], 0
0x1001cfea1: vmovaps xmmword ptr [rbx + 0xb70], xmm0
0x1001cfea9: mov rax, qword ptr [rbx + 0x80]
0x1001cfeb0: mov rax, qword ptr [rax + 0x28]
0x1001cfeb4: test rax, rax
0x1001cfeb7: je 0x1001cfed4
0x1001cfeb9: mov ecx, dword ptr [rax + 0x10]
0x1001cfebc: cmp ecx, 0x21
0x1001cfebf: jae 0x1001cfffe
0x1001cfec5: mov eax, 1
0x1001cfeca: shl eax, cl
0x1001cfecc: dec eax
0x1001cfece: mov dword ptr [rbx + 0x9a0], eax
0x1001cfed4: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001cfed9: vcvtsi2ss xmm0, xmm5, eax
0x1001cfedd: vmulss xmm0, xmm0, dword ptr [rip + 0x8d720b] ; 0x100aa70f0
0x1001cfee5: vmovss dword ptr [rbx + 0x118], xmm0
0x1001cfeed: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001cfef2: vcvtsi2ss xmm0, xmm5, eax
0x1001cfef6: vmulss xmm0, xmm0, dword ptr [rip + 0x8d71f2] ; 0x100aa70f0
0x1001cfefe: vmovss dword ptr [rbx + 0x11c], xmm0
0x1001cff06: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001cff0b: vcvtsi2ss xmm0, xmm5, eax
0x1001cff0f: vmulss xmm0, xmm0, dword ptr [rip + 0x8d71d9] ; 0x100aa70f0
0x1001cff17: vmovss dword ptr [rbx + 0x120], xmm0
0x1001cff1f: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001cff24: vcvtsi2ss xmm0, xmm5, eax
0x1001cff28: vmulss xmm0, xmm0, dword ptr [rip + 0x8d71c0] ; 0x100aa70f0
0x1001cff30: vmovss dword ptr [rbx + 0x124], xmm0
0x1001cff38: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001cff3d: vcvtsi2ss xmm0, xmm4, eax
0x1001cff41: vmulss xmm0, xmm0, dword ptr [rip + 0x8d71a7] ; 0x100aa70f0
0x1001cff49: vmovss dword ptr [rbx + 0x128], xmm0
0x1001cff51: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001cff56: vcvtsi2ss xmm0, xmm4, eax
0x1001cff5a: vmulss xmm0, xmm0, dword ptr [rip + 0x8d718e] ; 0x100aa70f0
0x1001cff62: vmovss dword ptr [rbx + 0x12c], xmm0
0x1001cff6a: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001cff6f: vcvtsi2ss xmm0, xmm3, eax
0x1001cff73: vmulss xmm0, xmm0, dword ptr [rip + 0x8d7175] ; 0x100aa70f0
0x1001cff7b: vmovss dword ptr [rbx + 0x130], xmm0
0x1001cff83: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001cff88: vcvtsi2ss xmm0, xmm3, eax
0x1001cff8c: vmulss xmm0, xmm0, dword ptr [rip + 0x8d715c] ; 0x100aa70f0
0x1001cff94: vmovss dword ptr [rbx + 0x134], xmm0
0x1001cff9c: mov rax, qword ptr [rip + 0xa3d935] ; 0x100c0d8d8
0x1001cffa3: mov rax, qword ptr [rax]
0x1001cffa6: cmp rax, qword ptr [rsp + 0x90]
0x1001cffae: jne 0x1001cffbb
0x1001cffb0: lea rsp, [rbp - 0x18]
0x1001cffb4: pop rbx
0x1001cffb5: pop r14
0x1001cffb7: pop r15
0x1001cffb9: pop rbp
0x1001cffba: ret 
0x1001cffbb: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1001cffc0: lea rdi, [rip + 0x9a898e] ; 0x100b78955 m_numBuddies < kMaxBuddies
0x1001cffc7: lea rsi, [rip + 0x9a8910] ; 0x100b788de Buddy.cpp
0x1001cffce: mov edx, 0x379
0x1001cffd3: mov ecx, 3
0x1001cffd8: call 0x1007e5f70 ; 0x1007e5f70
0x1001cffdd: ud2 
0x1001cffdf: lea rdi, [rip + 0x9a7c95] ; 0x100b77c7b m_model
0x1001cffe6: lea rsi, [rip + 0x9a88f1] ; 0x100b788de Buddy.cpp
0x1001cffed: mov edx, 0xb6
0x1001cfff2: mov ecx, 3
0x1001cfff7: call 0x1007e5f70 ; 0x1007e5f70
0x1001cfffc: ud2 
0x1001cfffe: lea rdi, [rip + 0x9a88e3] ; 0x100b788e8 params->discoverables->Size() <= 32
0x1001d0005: lea rsi, [rip + 0x9a88d2] ; 0x100b788de Buddy.cpp
0x1001d000c: mov edx, 0xce
0x1001d0011: mov ecx, 3
0x1001d0016: call 0x1007e5f70 ; 0x1007e5f70
0x1001d001b: ud2 
0x1001d001d: nop dword ptr [rax]
