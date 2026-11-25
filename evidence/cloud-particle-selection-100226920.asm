0x100226920: mov r15d, dword ptr [r12 + 0xc824]
0x100226928: mov dword ptr [rbp - 0x2d50], ecx
0x10022692e: add r15d, ecx
0x100226931: and r15d, 0x3ff
0x100226938: vmovss xmm1, dword ptr [r12 + r15*4 + 0x18]
0x10022693f: vinsertps xmm1, xmm1, dword ptr [r12 + r15*4 + 0x1018], 0x10
0x10022694a: vmovss xmm2, dword ptr [r12 + r15*4 + 0x2018]
0x100226954: vinsertps xmm1, xmm1, xmm2, 0x20
0x10022695a: vblendps xmm7, xmm1, xmm0, 8
0x100226960: mov eax, 0
0x100226965: cmp dword ptr [rbp - 0x2d48], 0
0x10022696c: je 0x100226a05
0x100226972: xor eax, eax
0x100226974: mov rcx, qword ptr [rbp - 0x2e50]
0x10022697b: lea rdx, [rbp - 0x2d30]
0x100226982: nop word ptr cs:[rax + rax]
0x100226990: mov esi, eax
0x100226992: mov eax, esi
0x100226994: lea rax, [rax + rax*2]
0x100226998: shl rax, 4
0x10022699c: mov qword ptr [rbp + rax - 0x930], rdx
0x1002269a4: vsubps xmm0, xmm7, xmmword ptr [rdx]
0x1002269a8: vmovaps xmmword ptr [rbp + rax - 0x920], xmm0
0x1002269b1: vmulps xmm0, xmm0, xmm0
0x1002269b5: vmovshdup xmm1, xmm0
0x1002269b9: vaddss xmm1, xmm0, xmm1
0x1002269bd: vpermilpd xmm0, xmm0, 1
0x1002269c3: vaddss xmm0, xmm0, xmm1
0x1002269c7: vmovss dword ptr [rbp + rax - 0x910], xmm0
0x1002269d0: vmulss xmm1, xmm8, dword ptr [rdx + 0x8c]
0x1002269d8: vmulss xmm1, xmm1, dword ptr [rdx + 0x90]
0x1002269e0: vmulss xmm1, xmm1, xmm1
0x1002269e4: xor eax, eax
0x1002269e6: vucomiss xmm0, xmm1
0x1002269ea: setbe al
0x1002269ed: add eax, esi
0x1002269ef: add rdx, 0xc0
0x1002269f6: dec rcx
0x1002269f9: jne 0x100226990
0x1002269fb: mov ecx, 3
0x100226a00: cmp eax, 2
0x100226a03: ja 0x100226a07
0x100226a05: mov ecx, eax
0x100226a07: mov r13d, ecx
0x100226a0a: mov rcx, r13
0x100226a0d: shl rcx, 4
0x100226a11: lea rcx, [rcx + rcx*2]
0x100226a15: mov r8d, eax
0x100226a18: mov rax, rcx
0x100226a1b: mov qword ptr [rbp - 0x2d40], rax
0x100226a22: cmp rcx, 0x31
0x100226a26: jb 0x100226b5b
0x100226a2c: cmp qword ptr [rbp - 0x2d40], 0x60
0x100226a34: jb 0x100226b5b
0x100226a3a: lea rax, [r13 - 2]
0x100226a3e: shr rax, 0x3f
0x100226a42: lea r9, [r13 + rax - 2]
0x100226a47: sar r9, 1
0x100226a4a: mov r14, r9
0x100226a4d: nop dword ptr [rax]
0x100226a50: mov rax, r14
0x100226a53: shl rax, 4
0x100226a57: lea rsi, [rax + rax*2]
0x100226a5b: mov rcx, rsi
0x100226a5e: sar rcx, 4
0x100226a62: imul rcx, r11
0x100226a66: cmp r9, rcx
0x100226a69: jl 0x100226b4e
0x100226a6f: lea rbx, [rcx + rcx + 1]
0x100226a74: lea rdx, [rbx + rbx*2]
0x100226a78: shl rdx, 4
0x100226a7c: lea rax, [rbp + rdx - 0x930]
0x100226a84: lea rcx, [rcx + rcx + 2]
0x100226a89: cmp rcx, r13
0x100226a8c: jge 0x100226aa8
0x100226a8e: lea rdi, [rax + 0x30]
0x100226a92: vmovss xmm0, dword ptr [rax + 0x50]
0x100226a97: vucomiss xmm0, dword ptr [rbp + rdx - 0x910]
0x100226aa0: cmova rbx, rcx
0x100226aa4: cmova rax, rdi
0x100226aa8: lea rcx, [r14 + r14*2]
0x100226aac: shl rcx, 4
0x100226ab0: vmovss xmm0, dword ptr [rbp + rcx - 0x910]
0x100226ab9: vucomiss xmm0, dword ptr [rax + 0x20]
0x100226abe: ja 0x100226b4e
0x100226ac4: lea rsi, [rbp + rsi - 0x930]
0x100226acc: mov r10, qword ptr [rsi]
0x100226acf: vmovaps xmm1, xmmword ptr [rbp + rcx - 0x920]
0x100226ad8: nop dword ptr [rax + rax]
0x100226ae0: mov rdx, rax
0x100226ae3: mov rax, qword ptr [rdx]
0x100226ae6: mov qword ptr [rsi], rax
0x100226ae9: vmovaps xmm2, xmmword ptr [rdx + 0x10]
0x100226aee: vmovaps xmmword ptr [rsi + 0x10], xmm2
0x100226af3: mov eax, dword ptr [rdx + 0x20]
0x100226af6: mov dword ptr [rsi + 0x20], eax
0x100226af9: cmp r9, rbx
0x100226afc: jl 0x100226b41
0x100226afe: lea rcx, [rbx + rbx + 1]
0x100226b03: lea rdi, [rcx + rcx*2]
0x100226b07: shl rdi, 4
0x100226b0b: lea rax, [rbp + rdi - 0x930]
0x100226b13: lea rsi, [rbx + rbx + 2]
0x100226b18: cmp rsi, r13
0x100226b1b: jge 0x100226b34
0x100226b1d: vmovss xmm2, dword ptr [rax + 0x50]
0x100226b22: vucomiss xmm2, dword ptr [rbp + rdi - 0x910]
0x100226b2b: jbe 0x100226b34
0x100226b2d: add rax, 0x30
0x100226b31: mov rcx, rsi
0x100226b34: vucomiss xmm0, dword ptr [rax + 0x20]
0x100226b39: mov rsi, rdx
0x100226b3c: mov rbx, rcx
0x100226b3f: jbe 0x100226ae0
0x100226b41: mov qword ptr [rdx], r10
0x100226b44: vmovaps xmmword ptr [rdx + 0x10], xmm1
0x100226b49: vmovss dword ptr [rdx + 0x20], xmm0
0x100226b4e: test r14, r14
0x100226b51: lea r14, [r14 - 1]
0x100226b55: jg 0x100226a50
0x100226b5b: mov rax, qword ptr [rbp - 0x2d40]
0x100226b62: lea r10, [rbp + rax - 0x930]
0x100226b6a: cmp r8d, 4
0x100226b6e: jb 0x100226e60
0x100226b74: mov rsi, qword ptr [rbp - 0x2d40]
0x100226b7b: cmp rsi, 0x5f
0x100226b7f: ja 0x100226c10
0x100226b85: vmovss xmm0, dword ptr [rbp - 0x910]
0x100226b8d: lea rax, [r13 + r13*2]
0x100226b92: shl rax, 4
0x100226b96: lea rcx, [rbp - 0x910]
0x100226b9d: add rax, rcx
0x100226ba0: shl r8, 4
0x100226ba4: lea rdx, [r8 + r8*2]
0x100226ba8: sub rdx, rsi
0x100226bab: nop dword ptr [rax + rax]
0x100226bb0: vmovss xmm1, dword ptr [rax]
0x100226bb4: vucomiss xmm0, xmm1
0x100226bb8: jbe 0x100226bfe
0x100226bba: mov rcx, qword ptr [rax - 0x20]
0x100226bbe: vmovaps xmm0, xmmword ptr [rax - 0x10]
0x100226bc3: mov rsi, qword ptr [rbp - 0x930]
0x100226bca: mov qword ptr [rax - 0x20], rsi
0x100226bce: vmovaps xmm2, xmmword ptr [rbp - 0x920]
0x100226bd6: vmovaps xmmword ptr [rax - 0x10], xmm2
0x100226bdb: mov esi, dword ptr [rbp - 0x910]
0x100226be1: mov dword ptr [rax], esi
0x100226be3: mov qword ptr [rbp - 0x930], rcx
0x100226bea: vmovaps xmmword ptr [rbp - 0x920], xmm0
0x100226bf2: vmovss dword ptr [rbp - 0x910], xmm1
0x100226bfa: vmovaps xmm0, xmm1
0x100226bfe: add rax, 0x30
0x100226c02: add rdx, -0x30
0x100226c06: jne 0x100226bb0
0x100226c08: jmp 0x100226e60 ; 0x100226e60
0x100226c0d: nop dword ptr [rax]
0x100226c10: lea rax, [r8 + r8*2]
0x100226c14: shl rax, 4
0x100226c18: lea r9, [rbp + rax - 0x930]
0x100226c20: lea rax, [r13 - 2]
0x100226c24: shr rax, 0x3f
0x100226c28: lea r8, [r13 + rax - 2]
0x100226c2d: sar r8, 1
0x100226c30: mov rdi, r10
0x100226c33: mov rax, r10
0x100226c36: cmp rsi, 0x60
0x100226c3a: jne 0x100226d40
0x100226c40: vmovss xmm0, dword ptr [rax + 0x20]
0x100226c45: vmovss xmm1, dword ptr [rbp - 0x910]
0x100226c4d: vucomiss xmm1, xmm0
0x100226c51: jbe 0x100226d2e
0x100226c57: mov r14, qword ptr [rax]
0x100226c5a: vmovaps xmm1, xmmword ptr [rax + 0x10]
0x100226c5f: mov rcx, qword ptr [rbp - 0x930]
0x100226c66: mov qword ptr [rax], rcx
0x100226c69: vmovaps xmm2, xmmword ptr [rbp - 0x920]
0x100226c71: vmovaps xmmword ptr [rax + 0x10], xmm2
0x100226c76: mov ecx, dword ptr [rbp - 0x910]
0x100226c7c: mov dword ptr [rax + 0x20], ecx
0x100226c7f: mov qword ptr [rbp - 0x930], r14
0x100226c86: vmovaps xmmword ptr [rbp - 0x920], xmm1
0x100226c8e: vmovss dword ptr [rbp - 0x910], xmm0
0x100226c96: vucomiss xmm0, dword ptr [rbp - 0x8e0]
0x100226c9e: ja 0x100226d2e
0x100226ca4: lea rdx, [rbp - 0x930]
0x100226cab: mov ecx, 1
0x100226cb0: lea rdi, [rbp - 0x900]
0x100226cb7: nop word ptr [rax + rax]
0x100226cc0: mov rsi, rdi
0x100226cc3: mov rdi, qword ptr [rsi]
0x100226cc6: mov qword ptr [rdx], rdi
0x100226cc9: vmovaps xmm2, xmmword ptr [rsi + 0x10]
0x100226cce: vmovaps xmmword ptr [rdx + 0x10], xmm2
0x100226cd3: mov edi, dword ptr [rsi + 0x20]
0x100226cd6: mov dword ptr [rdx + 0x20], edi
0x100226cd9: cmp r8, rcx
0x100226cdc: jl 0x100226d21
0x100226cde: lea rbx, [rcx + rcx + 1]
0x100226ce3: lea rdx, [rbx + rbx*2]
0x100226ce7: shl rdx, 4
0x100226ceb: lea rdi, [rbp + rdx - 0x930]
0x100226cf3: lea rcx, [rcx + rcx + 2]
0x100226cf8: cmp rcx, r13
0x100226cfb: jge 0x100226d14
0x100226cfd: vmovss xmm2, dword ptr [rdi + 0x50]
0x100226d02: vucomiss xmm2, dword ptr [rbp + rdx - 0x910]
0x100226d0b: jbe 0x100226d14
0x100226d0d: add rdi, 0x30
0x100226d11: mov rbx, rcx
0x100226d14: vucomiss xmm0, dword ptr [rdi + 0x20]
0x100226d19: mov rdx, rsi
0x100226d1c: mov rcx, rbx
0x100226d1f: jbe 0x100226cc0
0x100226d21: mov qword ptr [rsi], r14
0x100226d24: vmovaps xmmword ptr [rsi + 0x10], xmm1
0x100226d29: vmovss dword ptr [rsi + 0x20], xmm0
0x100226d2e: add rax, 0x30
0x100226d32: cmp rax, r9
0x100226d35: jne 0x100226c40
0x100226d3b: jmp 0x100226e60 ; 0x100226e60
0x100226d40: vmovss xmm1, dword ptr [rdi + 0x20]
0x100226d45: vmovss xmm0, dword ptr [rbp - 0x910]
0x100226d4d: vucomiss xmm0, xmm1
0x100226d51: jbe 0x100226e4f
0x100226d57: mov rax, qword ptr [rdi]
0x100226d5a: vmovaps xmm0, xmmword ptr [rdi + 0x10]
0x100226d5f: mov rcx, qword ptr [rbp - 0x930]
0x100226d66: mov qword ptr [rdi], rcx
0x100226d69: vmovaps xmm2, xmmword ptr [rbp - 0x920]
0x100226d71: vmovaps xmmword ptr [rdi + 0x10], xmm2
0x100226d76: mov ecx, dword ptr [rbp - 0x910]
0x100226d7c: mov dword ptr [rdi + 0x20], ecx
0x100226d7f: mov qword ptr [rbp - 0x930], rax
0x100226d86: vmovaps xmmword ptr [rbp - 0x920], xmm0
0x100226d8e: vmovss dword ptr [rbp - 0x910], xmm1
0x100226d96: vmovss xmm2, dword ptr [rbp - 0x8e0]
0x100226d9e: vmovss xmm3, dword ptr [rbp - 0x8b0]
0x100226da6: vucomiss xmm3, xmm2
0x100226daa: lea rsi, [rbp - 0x900]
0x100226db1: lea rcx, [rbp - 0x8d0]
0x100226db8: cmova rsi, rcx
0x100226dbc: vucomiss xmm1, dword ptr [rsi + 0x20]
0x100226dc1: ja 0x100226e4f
0x100226dc7: xor r14d, r14d
0x100226dca: vucomiss xmm3, xmm2
0x100226dce: seta r14b
0x100226dd2: inc r14
0x100226dd5: lea rbx, [rbp - 0x930]
0x100226ddc: nop dword ptr [rax]
0x100226de0: mov rdx, rsi
0x100226de3: mov rcx, qword ptr [rdx]
0x100226de6: mov qword ptr [rbx], rcx
0x100226de9: vmovaps xmm2, xmmword ptr [rdx + 0x10]
0x100226dee: vmovaps xmmword ptr [rbx + 0x10], xmm2
0x100226df3: mov ecx, dword ptr [rdx + 0x20]
0x100226df6: mov dword ptr [rbx + 0x20], ecx
0x100226df9: cmp r8, r14
0x100226dfc: jl 0x100226e42
0x100226dfe: lea rcx, [r14 + r14 + 1]
0x100226e03: lea r11, [rcx + rcx*2]
0x100226e07: shl r11, 4
0x100226e0b: lea rsi, [rbp + r11 - 0x930]
0x100226e13: lea rbx, [r14 + r14 + 2]
0x100226e18: cmp rbx, r13
0x100226e1b: jge 0x100226e35
0x100226e1d: vmovss xmm2, dword ptr [rsi + 0x50]
0x100226e22: vucomiss xmm2, dword ptr [rbp + r11 - 0x910]
0x100226e2c: jbe 0x100226e35
0x100226e2e: add rsi, 0x30
0x100226e32: mov rcx, rbx
0x100226e35: vucomiss xmm1, dword ptr [rsi + 0x20]
0x100226e3a: mov rbx, rdx
0x100226e3d: mov r14, rcx
0x100226e40: jbe 0x100226de0
0x100226e42: mov qword ptr [rdx], rax
0x100226e45: vmovaps xmmword ptr [rdx + 0x10], xmm0
0x100226e4a: vmovss dword ptr [rdx + 0x20], xmm1
0x100226e4f: add rdi, 0x30
0x100226e53: cmp rdi, r9
0x100226e56: jne 0x100226d40
0x100226e5c: nop dword ptr [rax]
0x100226e60: cmp qword ptr [rbp - 0x2d40], 0x31
0x100226e68: jb 0x100226f9f
0x100226e6e: mov r11, r13
0x100226e71: nop word ptr cs:[rax + rax]
0x100226e80: mov rax, qword ptr [rbp - 0x930]
0x100226e87: vmovaps xmm0, xmmword ptr [rbp - 0x920]
0x100226e8f: mov ecx, dword ptr [rbp - 0x910]
0x100226e95: mov rdx, qword ptr [r10 - 0x30]
0x100226e99: mov qword ptr [rbp - 0x930], rdx
0x100226ea0: vmovaps xmm1, xmmword ptr [r10 - 0x20]
0x100226ea6: vmovaps xmmword ptr [rbp - 0x920], xmm1
0x100226eae: mov edx, dword ptr [r10 - 0x10]
0x100226eb2: mov dword ptr [rbp - 0x910], edx
0x100226eb8: mov qword ptr [r10 - 0x30], rax
0x100226ebc: vmovaps xmmword ptr [r10 - 0x20], xmm0
0x100226ec2: mov dword ptr [r10 - 0x10], ecx
0x100226ec6: cmp r11, 2
0x100226eca: je 0x100226f9f
0x100226ed0: lea r9, [r11 - 1]
0x100226ed4: vmovss xmm0, dword ptr [rbp - 0x910]
0x100226edc: vucomiss xmm0, dword ptr [rbp - 0x8e0]
0x100226ee4: ja 0x100226f8e
0x100226eea: lea rax, [r11 - 3]
0x100226eee: shr rax, 0x3f
0x100226ef2: lea rdi, [r11 + rax - 3]
0x100226ef7: sar rdi, 1
0x100226efa: mov r8, qword ptr [rbp - 0x930]
0x100226f01: vmovaps xmm1, xmmword ptr [rbp - 0x920]
0x100226f09: lea rdx, [rbp - 0x930]
0x100226f10: mov ecx, 1
0x100226f15: lea rax, [rbp - 0x900]
0x100226f1c: nop dword ptr [rax]
0x100226f20: mov rbx, rax
0x100226f23: mov rax, qword ptr [rbx]
0x100226f26: mov qword ptr [rdx], rax
0x100226f29: vmovaps xmm2, xmmword ptr [rbx + 0x10]
0x100226f2e: vmovaps xmmword ptr [rdx + 0x10], xmm2
0x100226f33: mov eax, dword ptr [rbx + 0x20]
0x100226f36: mov dword ptr [rdx + 0x20], eax
0x100226f39: cmp rdi, rcx
0x100226f3c: jl 0x100226f81
0x100226f3e: lea rsi, [rcx + rcx + 1]
0x100226f43: lea rdx, [rsi + rsi*2]
0x100226f47: shl rdx, 4
0x100226f4b: lea rax, [rbp + rdx - 0x930]
0x100226f53: lea rcx, [rcx + rcx + 2]
0x100226f58: cmp rcx, r9
0x100226f5b: jge 0x100226f74
0x100226f5d: vmovss xmm2, dword ptr [rax + 0x50]
0x100226f62: vucomiss xmm2, dword ptr [rbp + rdx - 0x910]
0x100226f6b: jbe 0x100226f74
0x100226f6d: add rax, 0x30
0x100226f71: mov rsi, rcx
0x100226f74: vucomiss xmm0, dword ptr [rax + 0x20]
0x100226f79: mov rdx, rbx
0x100226f7c: mov rcx, rsi
0x100226f7f: jbe 0x100226f20
0x100226f81: mov qword ptr [rbx], r8
0x100226f84: vmovaps xmmword ptr [rbx + 0x10], xmm1
0x100226f89: vmovss dword ptr [rbx + 0x20], xmm0
0x100226f8e: add r10, -0x30
0x100226f92: cmp r11, 2
0x100226f96: mov r11, r9
0x100226f99: jg 0x100226e80
0x100226f9f: mov rax, qword ptr [rbp - 0x930]
0x100226fa6: lea rcx, [rbp - 0x2d30]
0x100226fad: sub rax, rcx
0x100226fb0: sar rax, 6
0x100226fb4: movabs r11, 0xaaaaaaaaaaaaaaab
0x100226fbe: imul rax, r11
0x100226fc2: test r13d, r13d
