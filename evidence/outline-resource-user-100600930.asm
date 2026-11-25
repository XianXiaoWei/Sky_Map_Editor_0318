0x100600930: push rbp
0x100600931: mov rbp, rsp
0x100600934: push r15
0x100600936: push r14
0x100600938: push r13
0x10060093a: push r12
0x10060093c: push rbx
0x10060093d: and rsp, 0xffffffffffffffe0
0x100600941: sub rsp, 0x2e0
0x100600948: mov rbx, r9
0x10060094b: mov r15, r8
0x10060094e: mov r14, rcx
0x100600951: mov r13, rdx
0x100600954: mov qword ptr [rsp + 0x18], rsi
0x100600959: mov r12, rdi
0x10060095c: mov rax, qword ptr [rip + 0x60cf75] ; 0x100c0d8d8
0x100600963: mov rax, qword ptr [rax]
0x100600966: mov qword ptr [rsp + 0x2c0], rax
0x10060096e: call 0x1007e3bd0 ; 0x1007e3bd0
0x100600973: cmp eax, 3
0x100600976: je 0x1006015d0
0x10060097c: call 0x1007e8580 ; 0x1007e8580
0x100600981: mov qword ptr [rsp + 0x48], rax
0x100600986: mov al, byte ptr [rip + 0x1a28e7c] ; 0x102029808
0x10060098c: mov byte ptr [r12 + 0x82], al
0x100600994: cmp byte ptr [rip + 0x1a28fbd], 0 ; 0x102029958
0x10060099b: je 0x1006009df
0x10060099d: mov rdi, qword ptr [r12 + 0x10]
0x1006009a2: cmp byte ptr [r12 + 0x80], 0
0x1006009ab: je 0x100600d52
0x1006009b1: vmovaps xmm0, xmmword ptr [r12 + 0x30]
0x1006009b8: vsubps xmm0, xmm0, xmmword ptr [r12 + 0x20]
0x1006009bf: lea rax, [rip + 0x19fa70a] ; 0x101ffb0d0
0x1006009c6: cmp byte ptr [rax], 0
0x1006009c9: je 0x100600a79
0x1006009cf: lea rax, [rip + 0x6b7b6a] ; 0x100cb8540
0x1006009d6: vmovss xmm1, dword ptr [rax]
0x1006009da: jmp 0x100600a81 ; 0x100600a81
0x1006009df: lea rsi, [r14 + 0x150]
0x1006009e6: lea rdi, [rsp + 0x70]
0x1006009eb: call 0x1001e0cf0 ; 0x1001e0cf0
0x1006009f0: vmovaps xmm0, xmmword ptr [rsp + 0x70]
0x1006009f6: vmovaps xmmword ptr [r12 + 0x30], xmm0
0x1006009fd: vmovaps xmm0, xmmword ptr [r14 + 0x160]
0x100600a06: vmovaps xmm1, xmmword ptr [r14 + 0x170]
0x100600a0f: vmovaps xmm2, xmmword ptr [r14 + 0x180]
0x100600a18: vmovaps xmmword ptr [r12 + 0x40], xmm0
0x100600a1f: vmovaps xmmword ptr [r12 + 0x50], xmm1
0x100600a26: vmovaps xmmword ptr [r12 + 0x60], xmm2
0x100600a2d: cmp byte ptr [rip + 0x1a28f94], 0 ; 0x1020299c8
0x100600a34: je 0x100600c9e
0x100600a3a: mov rdi, r14
0x100600a3d: call 0x1001e2820 ; 0x1001e2820
0x100600a42: cmp al, 3
0x100600a44: jne 0x100600c9e
0x100600a4a: vmovapd xmm0, xmmword ptr [r12 + 0x60]
0x100600a51: vmovapd xmmword ptr [rsp + 0x30], xmm0
0x100600a57: lea rdi, [rsp + 0x70]
0x100600a5c: mov edx, 3
0x100600a61: mov rsi, r14
0x100600a64: call 0x1001e2ac0 ; 0x1001e2ac0
0x100600a69: mov rax, qword ptr [rsp + 0x70]
0x100600a6e: test rax, rax
0x100600a71: je 0x100600ac2
0x100600a73: mov rax, qword ptr [rax + 0x10]
0x100600a77: jmp 0x100600ac4 ; 0x100600ac4
0x100600a79: vmovss xmm1, dword ptr [rip + 0x4a463f] ; 0x100aa50c0
0x100600a81: mov r15, rbx
0x100600a84: lea rsi, [r12 + 0x30]
0x100600a89: vmulss xmm1, xmm1, dword ptr [r13 + 0x20]
0x100600a8f: vmulss xmm1, xmm1, dword ptr [r13 + 0x18]
0x100600a95: vmovss xmm2, dword ptr [rip + 0x4a5fff] ; 0x100aa6a9c
0x100600a9d: vmaxss xmm1, xmm2, xmm1
0x100600aa1: vmovss xmm2, dword ptr [rip + 0x4a5ff7] ; 0x100aa6aa0
0x100600aa9: vminss xmm1, xmm2, xmm1
0x100600aad: vpermilps xmm1, xmm1, 0xc0
0x100600ab3: vdivps xmm0, xmm0, xmm1
0x100600ab7: vmovaps xmmword ptr [rsp + 0x70], xmm0
0x100600abd: jmp 0x100600d6c ; 0x100600d6c
0x100600ac2: xor eax, eax
0x100600ac4: mov qword ptr [rsp + 0x20], rbx
0x100600ac9: mov qword ptr [rsp + 0x50], rax
0x100600ace: call 0x1001ddff0 ; 0x1001ddff0
0x100600ad3: mov qword ptr [rsp + 0x10], rax
0x100600ad8: mov qword ptr [rsp + 0x260], 0
0x100600ae4: call 0x10029fea0 ; 0x10029fea0
0x100600ae9: mov rbx, qword ptr [rax]
0x100600aec: lea rsi, [rsp + 0x260]
0x100600af4: lea rdx, [rsp + 0x50]
0x100600af9: mov rdi, rax
0x100600afc: mov rcx, qword ptr [rsp + 0x10]
0x100600b01: call qword ptr [rbx + 0x40]
0x100600b04: mov rax, qword ptr [rsp + 0x260]
0x100600b0c: vbroadcastss xmm0, dword ptr [rax + 0x184]
0x100600b15: vmulps xmm0, xmm0, xmmword ptr [rsp + 0x30]
0x100600b1b: vmovaps xmm1, xmmword ptr [r12 + 0x30]
0x100600b22: vsubps xmm0, xmm1, xmm0
0x100600b26: vmovaps xmmword ptr [r12 + 0x30], xmm0
0x100600b2d: mov rax, qword ptr [rsp + 0x70]
0x100600b32: test rax, rax
0x100600b35: mov rbx, qword ptr [rsp + 0x20]
0x100600b3a: je 0x100600b8c
0x100600b3c: mov rcx, qword ptr [rsp + 0x78]
0x100600b41: mov rdx, qword ptr [rsp + 0x80]
0x100600b49: test rdx, rdx
0x100600b4c: lea rdx, [rdx + 8]
0x100600b50: cmove rdx, rax
0x100600b54: mov qword ptr [rdx], rcx
0x100600b57: mov rcx, qword ptr [rsp + 0x78]
0x100600b5c: mov rdx, qword ptr [rsp + 0x80]
0x100600b64: add rax, 8
0x100600b68: test rcx, rcx
0x100600b6b: lea rcx, [rcx + 0x10]
0x100600b6f: cmove rcx, rax
0x100600b73: mov qword ptr [rcx], rdx
0x100600b76: vxorps xmm0, xmm0, xmm0
0x100600b7a: vmovaps xmmword ptr [rsp + 0x70], xmm0
0x100600b80: mov qword ptr [rsp + 0x80], 0
0x100600b8c: vmovddup xmm0, qword ptr [rip + 0x4a6d44] ; 0x100aa78d8
0x100600b94: vmovapd xmmword ptr [r12 + 0x50], xmm0
0x100600b9b: vmovaps xmm1, xmmword ptr [r12 + 0x40]
0x100600ba2: vpermilps xmm2, xmm1, 0xd2
0x100600ba8: vmulps xmm0, xmm2, xmm0
0x100600bac: vmovaps xmm2, xmmword ptr [rip + 0x4a7e7c] ; 0x100aa8a30
0x100600bb4: vmulps xmm1, xmm1, xmm2
0x100600bb8: vsubps xmm0, xmm0, xmm1
0x100600bbc: vpermilps xmm1, xmm0, 0xd2
0x100600bc2: vmulps xmm0, xmm0, xmm0
0x100600bc6: vpermilpd xmm3, xmm0, 1
0x100600bcc: vaddss xmm3, xmm3, xmm0
0x100600bd0: vmovshdup xmm0, xmm0
0x100600bd4: vaddss xmm0, xmm0, xmm3
0x100600bd8: vrsqrtss xmm3, xmm0, xmm0
0x100600bdc: vmovss xmm4, dword ptr [rip + 0x4a39d4] ; 0x100aa45b8
0x100600be4: vmulss xmm5, xmm0, xmm4
0x100600be8: vxorps xmm6, xmm6, xmm6
0x100600bec: vcmpeqss xmm0, xmm0, xmm6
0x100600bf1: vandnps xmm5, xmm0, xmm5
0x100600bf5: vmovss xmm7, dword ptr [rip + 0x4a7a2b] ; 0x100aa8628
0x100600bfd: vandps xmm0, xmm0, xmm7
0x100600c01: vorps xmm0, xmm5, xmm0
0x100600c05: vmulss xmm0, xmm3, xmm0
0x100600c09: vmulss xmm0, xmm3, xmm0
0x100600c0d: vmovss xmm5, dword ptr [rip + 0x4a6bd7] ; 0x100aa77ec
0x100600c15: vsubss xmm0, xmm5, xmm0
0x100600c19: vmulss xmm0, xmm3, xmm0
0x100600c1d: vpermilps xmm0, xmm0, 0xc0
0x100600c23: vmulps xmm0, xmm1, xmm0
0x100600c27: vmovaps xmmword ptr [r12 + 0x60], xmm0
0x100600c2e: vmulps xmm1, xmm0, xmm2
0x100600c32: vmovss xmm2, dword ptr [rip + 0x4a4486] ; 0x100aa50c0
0x100600c3a: vmulps xmm0, xmm0, xmm2
0x100600c3e: vpermilps xmm0, xmm0, 0xd2
0x100600c44: vsubps xmm0, xmm1, xmm0
0x100600c48: vpermilps xmm1, xmm0, 0xd2
0x100600c4e: vmulps xmm0, xmm0, xmm0
0x100600c52: vpermilpd xmm2, xmm0, 1
0x100600c58: vaddss xmm2, xmm2, xmm0
0x100600c5c: vmovshdup xmm0, xmm0
0x100600c60: vaddss xmm0, xmm0, xmm2
0x100600c64: vrsqrtss xmm2, xmm0, xmm0
0x100600c68: vmulss xmm3, xmm0, xmm4
0x100600c6c: vcmpeqss xmm0, xmm0, xmm6
0x100600c71: vandnps xmm3, xmm0, xmm3
0x100600c75: vandps xmm0, xmm0, xmm7
0x100600c79: vorps xmm0, xmm3, xmm0
0x100600c7d: vmulss xmm0, xmm2, xmm0
0x100600c81: vmulss xmm0, xmm2, xmm0
0x100600c85: vsubss xmm0, xmm5, xmm0
0x100600c89: vmulss xmm0, xmm2, xmm0
0x100600c8d: vpermilps xmm0, xmm0, 0xc0
0x100600c93: vmulps xmm0, xmm1, xmm0
0x100600c97: vmovaps xmmword ptr [r12 + 0x40], xmm0
0x100600c9e: mov rdi, r15
0x100600ca1: call 0x1000ff210 ; 0x1000ff210
0x100600ca6: test rax, rax
0x100600ca9: je 0x100600cd7
0x100600cab: mov rdi, r15
0x100600cae: call 0x1000fc260 ; 0x1000fc260
0x100600cb3: mov rax, qword ptr [rax + 0x20]
0x100600cb7: mov rsi, qword ptr [rax + 0x298]
0x100600cbe: lea rdi, [rsp + 0x70]
0x100600cc3: call 0x1007f26b0 ; 0x1007f26b0
0x100600cc8: vmovaps xmm1, xmmword ptr [rsp + 0x70]
0x100600cce: vmovaps xmm0, xmmword ptr [r12 + 0x30]
0x100600cd5: jmp 0x100600ce8 ; 0x100600ce8
0x100600cd7: vmovaps xmm0, xmmword ptr [r12 + 0x30]
0x100600cde: vmovaps xmmword ptr [rsp + 0x70], xmm0
0x100600ce4: vmovaps xmm1, xmm0
0x100600ce8: vmovaps xmmword ptr [r12 + 0x70], xmm1
0x100600cef: vxorps xmm2, xmm2, xmm2
0x100600cf3: vmaxss xmm2, xmm2, dword ptr [r14 + 0x1a4]
0x100600cfc: vmovss xmm3, dword ptr [rip + 0x4a43bc] ; 0x100aa50c0
0x100600d04: vminss xmm2, xmm3, xmm2
0x100600d08: vsubss xmm3, xmm3, xmm2
0x100600d0c: vpermilps xmm3, xmm3, 0xc0
0x100600d12: vmulps xmm0, xmm0, xmm3
0x100600d16: vpermilps xmm2, xmm2, 0xc0
0x100600d1c: vmulps xmm1, xmm1, xmm2
0x100600d20: vaddps xmm0, xmm1, xmm0
0x100600d24: vmovaps xmmword ptr [r12 + 0x70], xmm0
0x100600d2b: mov rdi, r14
0x100600d2e: call 0x1001e2820 ; 0x1001e2820
0x100600d33: test al, al
0x100600d35: sete byte ptr [r12 + 0x80]
0x100600d3e: mov rdi, qword ptr [r12 + 0x10]
0x100600d43: cmp byte ptr [r12 + 0x80], 0
0x100600d4c: jne 0x1006009b1
0x100600d52: mov r15, rbx
0x100600d55: vxorps xmm0, xmm0, xmm0
0x100600d59: vmovlps qword ptr [rsp + 0x70], xmm0
0x100600d5f: mov dword ptr [rsp + 0x78], 0
0x100600d67: lea rsi, [r12 + 0x30]
0x100600d6c: mov rax, qword ptr [rdi]
0x100600d6f: lea rdx, [r12 + 0x60]
0x100600d74: lea rcx, [r12 + 0x50]
0x100600d79: lea r8, [rsp + 0x70]
0x100600d7e: call qword ptr [rax + 0xd8]
0x100600d84: call 0x1007e8580 ; 0x1007e8580
0x100600d89: mov rbx, rax
0x100600d8c: lea rdi, [r12 + 0x90]
0x100600d94: vmovaps xmm0, xmmword ptr [r12 + 0x30]
0x100600d9b: vmovaps xmmword ptr [rsp + 0x60], xmm0
0x100600da1: lea rax, [rip + 0x19fa328] ; 0x101ffb0d0
0x100600da8: cmp byte ptr [rax], 0
0x100600dab: lea rax, [rip + 0x6b778e] ; 0x100cb8540
0x100600db2: vmovss xmm0, dword ptr [rip + 0x4a4306] ; 0x100aa50c0
0x100600dba: vmovss dword ptr [rsp + 0x10], xmm0
0x100600dc0: je 0x100600dc6
0x100600dc2: vmovss xmm0, dword ptr [rax]
0x100600dc6: mov r14, qword ptr [rbp + 0x10]
0x100600dca: vmulss xmm0, xmm0, dword ptr [r13 + 0x20]
0x100600dd0: vmulss xmm0, xmm0, dword ptr [r13 + 0x14]
0x100600dd6: vmovss xmm1, dword ptr [rip + 0x4a5cbe] ; 0x100aa6a9c
0x100600dde: vmaxss xmm0, xmm1, xmm0
0x100600de2: vmovss xmm1, dword ptr [rip + 0x4a5cb6] ; 0x100aa6aa0
0x100600dea: vminss xmm0, xmm1, xmm0
0x100600dee: lea rdx, [rsp + 0x60]
0x100600df3: mov rsi, qword ptr [rsp + 0x18]
0x100600df8: call 0x10006c550 ; 0x10006c550
0x100600dfd: mov rdi, rbx
0x100600e00: call 0x1007e8590 ; 0x1007e8590
0x100600e05: vdivsd xmm1, xmm0, qword ptr [rip + 0x4bc27b] ; 0x100abd088
0x100600e0d: vmovsd xmm0, qword ptr [rip + 0x4d330b] ; 0x100ad4120
0x100600e15: vmulsd xmm0, xmm0, qword ptr [r12 + 0xb350]
0x100600e1f: vmovsd qword ptr [rsp + 0x20], xmm1
0x100600e25: vmulsd xmm1, xmm1, qword ptr [rip + 0x4adc23] ; 0x100aaea50
0x100600e2d: vaddsd xmm0, xmm0, xmm1
0x100600e31: vmovsd qword ptr [r12 + 0xb350], xmm0
0x100600e3b: call 0x1007e8580 ; 0x1007e8580
0x100600e40: mov rbx, rax
0x100600e43: mov rdi, qword ptr [r12 + 0x10]
0x100600e48: mov rax, qword ptr [rdi]
0x100600e4b: call qword ptr [rax + 0xe0]
0x100600e51: mov rdi, rbx
0x100600e54: call 0x1007e8590 ; 0x1007e8590
0x100600e59: vdivsd xmm0, xmm0, qword ptr [rip + 0x4bc227] ; 0x100abd088
0x100600e61: vmovsd qword ptr [r12 + 0xb328], xmm0
0x100600e6b: vmovsd xmm1, qword ptr [rip + 0x4d32ad] ; 0x100ad4120
0x100600e73: vmulsd xmm1, xmm1, qword ptr [r12 + 0xb330]
0x100600e7d: vmulsd xmm0, xmm0, qword ptr [rip + 0x4adbcb] ; 0x100aaea50
0x100600e85: vaddsd xmm0, xmm0, xmm1
0x100600e89: vmovsd qword ptr [r12 + 0xb330], xmm0
0x100600e93: vmovapd xmm0, xmmword ptr [r12 + 0x30]
0x100600e9a: vmovapd xmmword ptr [r12 + 0x20], xmm0
0x100600ea1: call 0x1007e8580 ; 0x1007e8580
0x100600ea6: mov rbx, rax
0x100600ea9: mov rdi, qword ptr [r12 + 0x10]
0x100600eae: mov rax, qword ptr [rdi]
0x100600eb1: call qword ptr [rax + 0xe8]
0x100600eb7: mov rdi, rbx
0x100600eba: call 0x1007e8590 ; 0x1007e8590
0x100600ebf: vdivsd xmm1, xmm0, qword ptr [rip + 0x4bc1c1] ; 0x100abd088
0x100600ec7: vmovsd xmm0, qword ptr [rip + 0x4d3251] ; 0x100ad4120
0x100600ecf: vmulsd xmm0, xmm0, qword ptr [r12 + 0xb358]
0x100600ed9: vmovsd qword ptr [rsp + 0x30], xmm1
0x100600edf: vmulsd xmm1, xmm1, qword ptr [rip + 0x4adb69] ; 0x100aaea50
0x100600ee7: vaddsd xmm0, xmm0, xmm1
0x100600eeb: vmovsd qword ptr [r12 + 0xb358], xmm0
0x100600ef5: mov rdi, qword ptr [r12 + 0x10]
0x100600efa: cmp byte ptr [r15 + 0x2ce], 0
0x100600f02: vmovss xmm0, dword ptr [rip + 0x4a41b6] ; 0x100aa50c0
0x100600f0a: je 0x100600f10
0x100600f0c: vxorps xmm0, xmm0, xmm0
0x100600f10: mov rax, qword ptr [rdi]
0x100600f13: mov esi, 0xd
0x100600f18: call qword ptr [rax + 0xb8]
0x100600f1e: mov rbx, qword ptr [r12 + 0x10]
0x100600f23: mov rax, qword ptr [rbx]
0x100600f26: mov r13, qword ptr [rax + 0xa0]
0x100600f2d: mov rax, qword ptr [r14]
0x100600f30: mov rdi, r14
0x100600f33: call qword ptr [rax + 0x38]
0x100600f36: movzx edx, al
0x100600f39: mov esi, 1
0x100600f3e: mov rdi, rbx
0x100600f41: call r13
0x100600f44: mov rdi, qword ptr [r12 + 0x10]
0x100600f49: mov rcx, qword ptr [r12 + 0x18]
0x100600f4e: mov rax, qword ptr [rdi]
0x100600f51: vmovss xmm0, dword ptr [rcx + 0x24]
0x100600f56: vmovss xmm1, dword ptr [rip + 0x1a28ada] ; 0x102029a38
0x100600f5e: lea rdx, [rip + 0x19fa16b] ; 0x101ffb0d0
0x100600f65: cmp byte ptr [rdx], 0
0x100600f68: je 0x100600f7b
0x100600f6a: lea rdx, [rip + 0x6b75cf] ; 0x100cb8540
0x100600f71: vmovss xmm2, dword ptr [rdx]
0x100600f75: vmovss dword ptr [rsp + 0x10], xmm2
0x100600f7b: vmovss xmm2, dword ptr [rsp + 0x10]
0x100600f81: vmulss xmm2, xmm2, dword ptr [rcx + 0x20]
0x100600f86: vmulss xmm2, xmm2, dword ptr [rcx + 0x14]
0x100600f8b: vmovss xmm3, dword ptr [rip + 0x4a5b09] ; 0x100aa6a9c
0x100600f93: vmaxss xmm2, xmm3, xmm2
0x100600f97: vmovss xmm3, dword ptr [rip + 0x4a5b01] ; 0x100aa6aa0
0x100600f9f: vminss xmm2, xmm3, xmm2
0x100600fa3: call qword ptr [rax + 0xa8]
0x100600fa9: mov rdi, qword ptr [r12 + 0x10]
0x100600fae: mov rax, qword ptr [rdi]
0x100600fb1: call qword ptr [rax + 0xc8]
0x100600fb7: mov qword ptr [rsp + 0x18], rax
0x100600fbc: mov eax, dword ptr [r12 + 0x84]
0x100600fc4: lea ecx, [rax + 1]
0x100600fc7: mov edx, 0xcccccccd
0x100600fcc: imul rdx, rcx
0x100600fd0: shr rdx, 0x22
0x100600fd4: lea ecx, [rdx + rdx*4]
0x100600fd7: neg ecx
0x100600fd9: lea eax, [rax + rcx + 1]
0x100600fdd: mov dword ptr [r12 + 0x84], eax
0x100600fe5: mov qword ptr [r12 + 0xb310], 0
0x100600ff1: mov qword ptr [r12 + 0xb320], 0
0x100600ffd: call 0x1007e8580 ; 0x1007e8580
0x100601002: mov qword ptr [rsp + 0x10], rax
0x100601007: mov rdi, qword ptr [r12 + 0x10]
0x10060100c: mov rax, qword ptr [rdi]
0x10060100f: call qword ptr [rax + 0x110]
0x100601015: mov r14, rax
0x100601018: test r14, r14
0x10060101b: je 0x1006011c0
0x100601021: mov dword ptr [rsp + 0x2c], 0
0x100601029: nop dword ptr [rax]
0x100601030: mov rax, qword ptr [r14]
0x100601033: mov rdi, r14
0x100601036: call qword ptr [rax + 0x10]
0x100601039: test al, al
0x10060103b: je 0x1006010a0
0x10060103d: inc dword ptr [r12 + 0xb310]
0x100601045: mov rax, qword ptr [r14]
0x100601048: mov rdi, r14
0x10060104b: call qword ptr [rax + 0x60]
0x10060104e: mov r13, rax
0x100601051: cmp byte ptr [r13 + 0xd], 0
0x100601056: je 0x1006010a8
0x100601058: vmovaps xmm0, xmmword ptr [r13 + 0x10]
0x10060105e: vsubps xmm0, xmm0, xmmword ptr [r12 + 0x30]
0x100601065: vmulps xmm0, xmm0, xmm0
0x100601069: vmovshdup xmm1, xmm0
0x10060106d: vaddss xmm1, xmm0, xmm1
0x100601071: vpermilpd xmm0, xmm0, 1
0x100601077: vaddss xmm0, xmm0, xmm1
0x10060107b: vsqrtss xmm0, xmm0, xmm0
0x10060107f: vmovss xmm1, dword ptr [r13 + 0x4c]
0x100601085: cmp dword ptr [r13 + 0x68], 0
0x10060108a: sete al
0x10060108d: vucomiss xmm1, xmm0
0x100601091: seta bl
0x100601094: or bl, al
0x100601096: jmp 0x1006010aa ; 0x1006010aa
0x100601098: nop dword ptr [rax + rax]
0x1006010a0: xor r15d, r15d
0x1006010a3: jmp 0x10060118d ; 0x10060118d
0x1006010a8: mov bl, 1
0x1006010aa: mov rax, qword ptr [r14]
0x1006010ad: mov rdi, r14
0x1006010b0: call qword ptr [rax + 0x18]
0x1006010b3: test al, al
0x1006010b5: je 0x100601160
0x1006010bb: inc dword ptr [r12 + 0xb314]
0x1006010c3: test bl, bl
0x1006010c5: je 0x100601160
0x1006010cb: vmovss xmm0, dword ptr [r13]
0x1006010d1: vucomiss xmm0, dword ptr [rip + 0x4a600b] ; 0x100aa70e4
0x1006010d9: jbe 0x100601160
0x1006010df: mov rax, qword ptr [r14]
0x1006010e2: mov rdi, r14
0x1006010e5: call qword ptr [rax + 0x48]
0x1006010e8: cmp eax, 2
0x1006010eb: jne 0x10060111f
0x1006010ed: inc dword ptr [r12 + 0xb320]
0x1006010f5: mov rax, qword ptr [r14]
0x1006010f8: mov esi, 1
0x1006010fd: mov rdi, r14
0x100601100: mov rdx, qword ptr [rsp + 0x18]
0x100601105: call qword ptr [rax + 0x28]
0x100601108: mov rax, qword ptr [r14]
0x10060110b: mov rdi, r14
0x10060110e: call qword ptr [rax + 0x18]
0x100601111: test al, al
0x100601113: jne 0x100601170
0x100601115: inc dword ptr [r12 + 0xb324]
0x10060111d: jmp 0x100601170 ; 0x100601170
0x10060111f: mov rax, qword ptr [r14]
0x100601122: mov rdi, r14
0x100601125: call qword ptr [rax + 0x48]
0x100601128: cmp eax, 1
0x10060112b: jne 0x100601160
0x10060112d: mov edx, dword ptr [rsp + 0x2c]
0x100601131: mov eax, edx
0x100601133: mov ecx, 0xcccccccd
0x100601138: imul rax, rcx
0x10060113c: shr rax, 0x22
0x100601140: lea eax, [rax + rax*4]
0x100601143: mov ecx, edx
0x100601145: sub ecx, eax
0x100601147: inc edx
0x100601149: mov dword ptr [rsp + 0x2c], edx
0x10060114d: cmp ecx, dword ptr [r12 + 0x84]
0x100601155: je 0x1006010ed
0x100601157: nop word ptr [rax + rax]
0x100601160: mov rax, qword ptr [r14]
0x100601163: xor esi, esi
0x100601165: mov rdi, r14
0x100601168: mov rdx, qword ptr [rsp + 0x18]
0x10060116d: call qword ptr [rax + 0x28]
0x100601170: mov rax, qword ptr [r14]
0x100601173: mov rdi, r14
0x100601176: call qword ptr [rax + 0x18]
0x100601179: xor r15d, r15d
0x10060117c: test bl, bl
0x10060117e: jne 0x10060118d
0x100601180: test al, al
0x100601182: jne 0x10060118d
0x100601184: cmp byte ptr [r13 + 0xc], 0
0x100601189: setne r15b
0x10060118d: mov rdi, qword ptr [r12 + 0x10]
0x100601192: mov rax, qword ptr [rdi]
0x100601195: mov rsi, r14
0x100601198: call qword ptr [rax + 0x118]
0x10060119e: mov rbx, rax
0x1006011a1: test r15b, r15b
0x1006011a4: je 0x1006011b4
0x1006011a6: mov rax, qword ptr [r14]
0x1006011a9: mov esi, 1
0x1006011ae: mov rdi, r14
0x1006011b1: call qword ptr [rax + 0x38]
0x1006011b4: mov r14, rbx
0x1006011b7: test rbx, rbx
0x1006011ba: jne 0x100601030
0x1006011c0: mov rdi, qword ptr [rsp + 0x10]
0x1006011c5: call 0x1007e8590 ; 0x1007e8590
0x1006011ca: vmovsd xmm1, qword ptr [rip + 0x4bbeb6] ; 0x100abd088
0x1006011d2: vdivsd xmm0, xmm0, xmm1
0x1006011d6: vmovsd qword ptr [r12 + 0xb338], xmm0
0x1006011e0: vmovsd xmm1, qword ptr [rip + 0x4d2f38] ; 0x100ad4120
0x1006011e8: vmulsd xmm1, xmm1, qword ptr [r12 + 0xb340]
0x1006011f2: vmovsd xmm2, qword ptr [rip + 0x4ad856] ; 0x100aaea50
0x1006011fa: vmulsd xmm0, xmm0, xmm2
0x1006011fe: vaddsd xmm0, xmm0, xmm1
0x100601202: vmovsd qword ptr [r12 + 0xb340], xmm0
0x10060120c: mov rdi, qword ptr [rsp + 0x48]
0x100601211: call 0x1007e8590 ; 0x1007e8590
0x100601216: vdivsd xmm0, xmm0, qword ptr [rip + 0x4bbe6a] ; 0x100abd088
0x10060121e: vsubsd xmm0, xmm0, qword ptr [r12 + 0xb328]
0x100601228: vsubsd xmm0, xmm0, qword ptr [r12 + 0xb338]
0x100601232: vsubsd xmm0, xmm0, qword ptr [rsp + 0x20]
0x100601238: vsubsd xmm0, xmm0, qword ptr [rsp + 0x30]
0x10060123e: vmovsd xmm1, qword ptr [rip + 0x4d2eda] ; 0x100ad4120
0x100601246: vmulsd xmm1, xmm1, qword ptr [r12 + 0xb348]
0x100601250: vmulsd xmm0, xmm0, qword ptr [rip + 0x4ad7f8] ; 0x100aaea50
0x100601258: vaddsd xmm0, xmm1, xmm0
0x10060125c: vmovsd qword ptr [r12 + 0xb348], xmm0
0x100601266: cmp byte ptr [rip + 0x1a2860b], 0 ; 0x102029878
0x10060126d: je 0x10060159d
0x100601273: vxorpd ymm0, ymm0, ymm0
0x100601277: vmovupd ymmword ptr [rsp + 0x290], ymm0
0x100601280: vmovapd ymmword ptr [rsp + 0x280], ymm0
0x100601289: vmovapd ymmword ptr [rsp + 0x260], ymm0
0x100601292: mov rdi, qword ptr [r12 + 0x10]
0x100601297: mov rax, qword ptr [rdi]
0x10060129a: lea rsi, [rsp + 0x260]
0x1006012a2: mov edx, 0xa
0x1006012a7: vzeroupper 
0x1006012aa: call qword ptr [rax + 0x170]
0x1006012b0: lea r13, [rsp + 0x1c0]
0x1006012b8: lea rbx, [rsp + 0x78]
0x1006012bd: mov rax, qword ptr [rip + 0x60925c] ; 0x100c0a520
0x1006012c4: lea rcx, [rax + 0x18]
0x1006012c8: mov qword ptr [rsp + 0x20], rcx
0x1006012cd: mov qword ptr [rsp + 0x70], rcx
0x1006012d2: add rax, 0x40
0x1006012d6: mov qword ptr [rsp + 0x48], rax
0x1006012db: mov qword ptr [rsp + 0x1c0], rax
0x1006012e3: mov rdi, r13
0x1006012e6: mov rsi, rbx
0x1006012e9: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1006012ee: mov qword ptr [rsp + 0x248], 0
0x1006012fa: mov dword ptr [rsp + 0x250], 0xffffffff
0x100601305: mov rcx, qword ptr [rip + 0x60c2bc] ; 0x100c0d5c8
0x10060130c: lea rax, [rcx + 0x18]
0x100601310: mov qword ptr [rsp + 0x18], rax
0x100601315: mov qword ptr [rsp + 0x70], rax
0x10060131a: add rcx, 0x40
0x10060131e: mov qword ptr [rsp + 0x10], rcx
0x100601323: mov qword ptr [rsp + 0x1c0], rcx
0x10060132b: lea rsi, [rip + 0x55f6d4] ; 0x100b60a06 DEV
0x100601332: mov edx, 8
0x100601337: mov rdi, rbx
0x10060133a: call 0x1007a56a0 ; 0x1007a56a0
0x10060133f: lea rsi, [rip + 0x595509] ; 0x100b9684f
0x100601346: lea rdi, [rsp + 0x70]
0x10060134b: mov edx, 0x15
0x100601350: call 0x100011930 ; 0x100011930
0x100601355: mov rax, qword ptr [rsp + 0x18]
0x10060135a: mov qword ptr [rsp + 0x70], rax
0x10060135f: mov rax, qword ptr [rsp + 0x10]
0x100601364: mov qword ptr [rsp + 0x1c0], rax
0x10060136c: mov rdi, rbx
0x10060136f: call 0x1007a58d0 ; 0x1007a58d0
0x100601374: mov rsi, qword ptr [rip + 0x609205] ; 0x100c0a580
0x10060137b: add rsi, 8
0x10060137f: lea rdi, [rsp + 0x70]
0x100601384: mov qword ptr [rsp + 0x30], rsi
0x100601389: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10060138e: mov rdi, r13
0x100601391: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100601396: lea r14, [rsp + 0x1c0]
0x10060139e: lea rbx, [rsp + 0x78]
0x1006013a3: xor r15d, r15d
0x1006013a6: mov r13, qword ptr [rsp + r15*8 + 0x260]
0x1006013ae: test r13, r13
0x1006013b1: je 0x1006014bc
0x1006013b7: mov rax, qword ptr [rsp + 0x20]
0x1006013bc: mov qword ptr [rsp + 0x70], rax
0x1006013c1: mov rax, qword ptr [rsp + 0x48]
0x1006013c6: mov qword ptr [rsp + 0x1c0], rax
0x1006013ce: mov rdi, r14
0x1006013d1: mov rsi, rbx
0x1006013d4: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1006013d9: mov qword ptr [rsp + 0x248], 0
0x1006013e5: mov dword ptr [rsp + 0x250], 0xffffffff
0x1006013f0: mov rax, qword ptr [rsp + 0x18]
0x1006013f5: mov qword ptr [rsp + 0x70], rax
0x1006013fa: mov rax, qword ptr [rsp + 0x10]
0x1006013ff: mov qword ptr [rsp + 0x1c0], rax
0x100601407: mov edx, 8
0x10060140c: mov rdi, rbx
0x10060140f: lea rsi, [rip + 0x55f5f0] ; 0x100b60a06 DEV
0x100601416: call 0x1007a56a0 ; 0x1007a56a0
0x10060141b: mov r14, rbx
0x10060141e: mov rax, qword ptr [r13]
0x100601422: mov rdi, r13
0x100601425: call qword ptr [rax + 0x28]
0x100601428: mov rbx, rax
0x10060142b: mov rdi, rbx
0x10060142e: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x100601433: lea rdi, [rsp + 0x70]
0x100601438: mov rsi, rbx
0x10060143b: mov rdx, rax
0x10060143e: call 0x100011930 ; 0x100011930
0x100601443: mov edx, 4
0x100601448: mov rdi, rax
0x10060144b: lea rsi, [rip + 0x595413] ; 0x100b96865 :   
0x100601452: call 0x100011930 ; 0x100011930
0x100601457: mov rbx, rax
0x10060145a: mov rax, qword ptr [r13]
0x10060145e: mov rdi, r13
0x100601461: call qword ptr [rax + 0x40]
0x100601464: mov rdi, rbx
0x100601467: mov esi, eax
0x100601469: call 0x100aa23de ; 0x100aa23de __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
0x10060146e: mov rax, qword ptr [rsp + 0x18]
0x100601473: mov qword ptr [rsp + 0x70], rax
0x100601478: mov rax, qword ptr [rsp + 0x10]
0x10060147d: mov qword ptr [rsp + 0x1c0], rax
0x100601485: mov rbx, r14
0x100601488: mov rdi, rbx
0x10060148b: call 0x1007a58d0 ; 0x1007a58d0
0x100601490: lea rdi, [rsp + 0x70]
0x100601495: mov rsi, qword ptr [rsp + 0x30]
0x10060149a: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10060149f: lea r14, [rsp + 0x1c0]
0x1006014a7: mov rdi, r14
0x1006014aa: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006014af: inc r15
0x1006014b2: cmp r15d, 0xa
0x1006014b6: jb 0x1006013a6
0x1006014bc: lea rbx, [rsp + 0x1c0]
0x1006014c4: lea r13, [rsp + 0x78]
0x1006014c9: mov rax, qword ptr [rsp + 0x20]
0x1006014ce: mov qword ptr [rsp + 0x70], rax
0x1006014d3: mov rax, qword ptr [rsp + 0x48]
0x1006014d8: mov qword ptr [rsp + 0x1c0], rax
0x1006014e0: mov rdi, rbx
0x1006014e3: mov rsi, r13
0x1006014e6: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1006014eb: mov qword ptr [rsp + 0x248], 0
0x1006014f7: mov dword ptr [rsp + 0x250], 0xffffffff
0x100601502: mov rax, qword ptr [rsp + 0x18]
0x100601507: mov qword ptr [rsp + 0x70], rax
0x10060150c: mov rax, qword ptr [rsp + 0x10]
0x100601511: mov qword ptr [rsp + 0x1c0], rax
0x100601519: lea rsi, [rip + 0x55f4e6] ; 0x100b60a06 DEV
0x100601520: mov edx, 8
0x100601525: mov rdi, r13
0x100601528: call 0x1007a56a0 ; 0x1007a56a0
0x10060152d: lea rsi, [rip + 0x595336] ; 0x100b9686a Total:  
0x100601534: lea rdi, [rsp + 0x70]
0x100601539: mov edx, 8
0x10060153e: call 0x100011930 ; 0x100011930
0x100601543: mov esi, dword ptr [r12 + 0xb310]
0x10060154b: mov rdi, rax
0x10060154e: call 0x100aa23de ; 0x100aa23de __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
0x100601553: lea rsi, [rip + 0x55f360] ; 0x100b608ba
0x10060155a: mov edx, 1
0x10060155f: mov rdi, rax
0x100601562: call 0x100011930 ; 0x100011930
0x100601567: mov rax, qword ptr [rsp + 0x18]
0x10060156c: mov qword ptr [rsp + 0x70], rax
0x100601571: mov rax, qword ptr [rsp + 0x10]
0x100601576: mov qword ptr [rsp + 0x1c0], rax
0x10060157e: mov rdi, r13
0x100601581: call 0x1007a58d0 ; 0x1007a58d0
0x100601586: lea rdi, [rsp + 0x70]
0x10060158b: mov rsi, qword ptr [rsp + 0x30]
0x100601590: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x100601595: mov rdi, rbx
0x100601598: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10060159d: mov rdi, qword ptr [r12 + 0x10]
0x1006015a2: mov rax, qword ptr [rdi]
0x1006015a5: call qword ptr [rax + 0xf0]
0x1006015ab: mov rdi, qword ptr [r12 + 0x10]
0x1006015b0: mov rax, qword ptr [rdi]
0x1006015b3: lea rsi, [rsp + 0x70]
0x1006015b8: lea rdx, [rsp + 0x260]
0x1006015c0: lea rcx, [rsp + 0x50]
0x1006015c5: lea r8, [rsp + 0x5c]
0x1006015ca: call qword ptr [rax + 0x168]
0x1006015d0: mov rax, qword ptr [rip + 0x60c301] ; 0x100c0d8d8
0x1006015d7: mov rax, qword ptr [rax]
0x1006015da: cmp rax, qword ptr [rsp + 0x2c0]
0x1006015e2: jne 0x1006015f3
0x1006015e4: lea rsp, [rbp - 0x28]
0x1006015e8: pop rbx
0x1006015e9: pop r12
0x1006015eb: pop r13
0x1006015ed: pop r14
0x1006015ef: pop r15
0x1006015f1: pop rbp
0x1006015f2: ret 
0x1006015f3: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1006015f8: mov r12, rax
0x1006015fb: jmp 0x100601696 ; 0x100601696
0x100601600: mov r12, rax
0x100601603: mov rdi, rbx
0x100601606: jmp 0x10060174b ; 0x10060174b
0x10060160b: mov r12, rax
0x10060160e: mov rax, qword ptr [rsp + 0x70]
0x100601613: test rax, rax
0x100601616: je 0x100601750
0x10060161c: mov rcx, qword ptr [rsp + 0x78]
0x100601621: mov rdx, qword ptr [rsp + 0x80]
0x100601629: test rdx, rdx
0x10060162c: lea rdx, [rdx + 8]
0x100601630: cmove rdx, rax
0x100601634: mov qword ptr [rdx], rcx
0x100601637: mov rcx, qword ptr [rsp + 0x78]
0x10060163c: mov rdx, qword ptr [rsp + 0x80]
0x100601644: add rax, 8
0x100601648: test rcx, rcx
0x10060164b: lea rcx, [rcx + 0x10]
0x10060164f: cmove rcx, rax
0x100601653: mov qword ptr [rcx], rdx
0x100601656: vxorpd xmm0, xmm0, xmm0
0x10060165a: vmovapd xmmword ptr [rsp + 0x70], xmm0
0x100601660: mov qword ptr [rsp + 0x80], 0
0x10060166c: mov rdi, r12
0x10060166f: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100601674: mov r12, rax
0x100601677: mov rax, qword ptr [rsp + 0x18]
0x10060167c: mov qword ptr [rsp + 0x70], rax
0x100601681: mov rax, qword ptr [rsp + 0x10]
0x100601686: mov qword ptr [rsp + 0x1c0], rax
0x10060168e: mov rdi, r13
0x100601691: call 0x1007a58d0 ; 0x1007a58d0
0x100601696: lea rdi, [rsp + 0x70]
0x10060169b: mov rsi, qword ptr [rsp + 0x30]
0x1006016a0: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006016a5: mov rdi, rbx
0x1006016a8: jmp 0x10060174b ; 0x10060174b
0x1006016ad: mov r12, rax
0x1006016b0: mov rax, qword ptr [rsp + 0x18]
0x1006016b5: mov qword ptr [rsp + 0x70], rax
0x1006016ba: mov rax, qword ptr [rsp + 0x10]
0x1006016bf: mov qword ptr [rsp + 0x1c0], rax
0x1006016c7: mov rdi, rbx
0x1006016ca: call 0x1007a58d0 ; 0x1007a58d0
0x1006016cf: jmp 0x1006016d4 ; 0x1006016d4
0x1006016d1: mov r12, rax
0x1006016d4: mov rsi, qword ptr [rip + 0x608ea5] ; 0x100c0a580
0x1006016db: add rsi, 8
0x1006016df: lea rdi, [rsp + 0x70]
0x1006016e4: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006016e9: jmp 0x1006016ee ; 0x1006016ee
0x1006016eb: mov r12, rax
0x1006016ee: mov rdi, r13
0x1006016f1: jmp 0x10060174b ; 0x10060174b
0x1006016f3: mov r12, rax
0x1006016f6: lea rdi, [rsp + 0x70]
0x1006016fb: mov rsi, qword ptr [rsp + 0x30]
0x100601700: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x100601705: mov rdi, r14
0x100601708: jmp 0x10060174b ; 0x10060174b
0x10060170a: mov r12, rax
0x10060170d: mov rdi, r14
0x100601710: jmp 0x10060174b ; 0x10060174b
0x100601712: mov r12, rax
0x100601715: mov rax, qword ptr [rsp + 0x18]
0x10060171a: mov qword ptr [rsp + 0x70], rax
0x10060171f: mov rax, qword ptr [rsp + 0x10]
0x100601724: mov qword ptr [rsp + 0x1c0], rax
0x10060172c: mov rdi, r14
0x10060172f: call 0x1007a58d0 ; 0x1007a58d0
0x100601734: lea rdi, [rsp + 0x70]
0x100601739: mov rsi, qword ptr [rsp + 0x30]
0x10060173e: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x100601743: lea rdi, [rsp + 0x1c0]
0x10060174b: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100601750: mov rdi, r12
0x100601753: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100601758: nop dword ptr [rax + rax]
