0x1004d4910: push rbp
0x1004d4911: mov rbp, rsp
0x1004d4914: push r15
0x1004d4916: push r14
0x1004d4918: push r13
0x1004d491a: push r12
0x1004d491c: push rbx
0x1004d491d: sub rsp, 0x88
0x1004d4924: mov r15, rcx
0x1004d4927: mov r12, rdx
0x1004d492a: mov qword ptr [rbp - 0x30], rsi
0x1004d492e: mov rbx, rdi
0x1004d4931: mov r14b, byte ptr [rip + 0x1b3d240] ; 0x102011b78
0x1004d4938: mov byte ptr [rbx + 0x1392], r14b
0x1004d493f: mov dword ptr [rbx + 0x13c0], 0
0x1004d4949: mov word ptr [rbx + 0x1390], 0
0x1004d4952: lea rsi, [rip + 0x68da51] ; 0x100b623aa RainEnd
0x1004d4959: mov rdi, r12
0x1004d495c: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1004d4961: test eax, eax
0x1004d4963: je 0x1004d49b6
0x1004d4965: lea rsi, [rip + 0x68da9c] ; 0x100b62408 Storm
0x1004d496c: mov rdi, r12
0x1004d496f: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1004d4974: test eax, eax
0x1004d4976: je 0x1004d49b6
0x1004d4978: lea rsi, [rip + 0x69e96f] ; 0x100b732ee StormEnd
0x1004d497f: mov rdi, r12
0x1004d4982: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1004d4987: test eax, eax
0x1004d4989: je 0x1004d49b6
0x1004d498b: mov rdi, r12
0x1004d498e: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1004d4993: cmp rax, 4
0x1004d4997: jb 0x1004d49b1
0x1004d4999: lea rdi, [rip + 0x68d9ef] ; 0x100b6238f Dusk
0x1004d49a0: mov edx, 4
0x1004d49a5: mov rsi, r12
0x1004d49a8: call 0x100aa2c8a ; 0x100aa2c8a _strncmp
0x1004d49ad: test eax, eax
0x1004d49af: je 0x1004d49b6
0x1004d49b1: xor r13d, r13d
0x1004d49b4: jmp 0x1004d49c0 ; 0x1004d49c0
0x1004d49b6: mov byte ptr [rbx + 0x1391], 1
0x1004d49bd: mov r13b, 1
0x1004d49c0: lea rsi, [rip + 0x6a19ee] ; 0x100b763b5 OrbitMid
0x1004d49c7: mov rdi, r12
0x1004d49ca: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1004d49cf: test eax, eax
0x1004d49d1: je 0x1004d49e6
0x1004d49d3: lea rsi, [rip + 0x69e91d] ; 0x100b732f7 CandleSpaceEnd
0x1004d49da: mov rdi, r12
0x1004d49dd: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1004d49e2: test eax, eax
0x1004d49e4: jne 0x1004d49f0
0x1004d49e6: mov byte ptr [rbx + 0x1392], 0
0x1004d49ed: xor r14d, r14d
0x1004d49f0: lea rsi, [rip + 0x69e8eb] ; 0x100b732e2 CandleSpace
0x1004d49f7: mov rdi, r12
0x1004d49fa: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1004d49ff: test eax, eax
0x1004d4a01: je 0x1004d4a11
0x1004d4a03: test r14b, r14b
0x1004d4a06: je 0x1004d4a1a
0x1004d4a08: lea r13, [rip + 0x6b97e4] ; 0x100b8e1f3 OceanCloud
0x1004d4a0f: jmp 0x1004d4a2f ; 0x1004d4a2f
0x1004d4a11: lea r13, [rip + 0x6b97cf] ; 0x100b8e1e7 OceanCandle
0x1004d4a18: jmp 0x1004d4a2f ; 0x1004d4a2f
0x1004d4a1a: test r13b, r13b
0x1004d4a1d: lea rax, [rip + 0x6a221b] ; 0x100b76c3f Ocean
0x1004d4a24: lea r13, [rip + 0x6b97d3] ; 0x100b8e1fe OceanDark
0x1004d4a2b: cmove r13, rax
0x1004d4a2f: lea rdi, [rbp - 0x88]
0x1004d4a36: call 0x1007c2530 ; 0x1007c2530
0x1004d4a3b: lea rdi, [rbp - 0x68]
0x1004d4a3f: call 0x1007c2530 ; 0x1007c2530
0x1004d4a44: cmp byte ptr [rbx + 0x1392], 0
0x1004d4a4b: lea rax, [rip + 0x6b97c2] ; 0x100b8e214 OceanNormal
0x1004d4a52: lea r14, [rip + 0x6b97af] ; 0x100b8e208 CloudNormal
0x1004d4a59: cmove r14, rax
0x1004d4a5d: call 0x10079ac90 ; 0x10079ac90
0x1004d4a62: mov rdi, qword ptr [rbp - 0x30]
0x1004d4a66: mov rsi, rax
0x1004d4a69: mov rdx, r14
0x1004d4a6c: call 0x1007c4360 ; 0x1007c4360
0x1004d4a71: test rax, rax
0x1004d4a74: je 0x1004d4a87
0x1004d4a76: lea rsi, [rbp - 0x88]
0x1004d4a7d: mov rdi, rax
0x1004d4a80: call 0x1007c2310 ; 0x1007c2310
0x1004d4a85: jmp 0x1004d4a9c ; 0x1004d4a9c
0x1004d4a87: call 0x10079ac90 ; 0x10079ac90
0x1004d4a8c: mov rsi, qword ptr [rax + 8]
0x1004d4a90: mov rdi, qword ptr [rbp - 0x30]
0x1004d4a94: mov rdx, r14
0x1004d4a97: call 0x1007c4640 ; 0x1007c4640
0x1004d4a9c: call 0x10079ac90 ; 0x10079ac90
0x1004d4aa1: lea rdx, [rip + 0x68d71c] ; 0x100b621c4 Caustics
0x1004d4aa8: mov rdi, qword ptr [rbp - 0x30]
0x1004d4aac: mov rsi, rax
0x1004d4aaf: call 0x1007c4360 ; 0x1007c4360
0x1004d4ab4: test rax, rax
0x1004d4ab7: je 0x1004d4ac7
0x1004d4ab9: lea rsi, [rbp - 0x68]
0x1004d4abd: mov rdi, rax
0x1004d4ac0: call 0x1007c2310 ; 0x1007c2310
0x1004d4ac5: jmp 0x1004d4ae0 ; 0x1004d4ae0
0x1004d4ac7: call 0x10079ac90 ; 0x10079ac90
0x1004d4acc: mov rsi, qword ptr [rax + 8]
0x1004d4ad0: lea rdx, [rip + 0x68d6ed] ; 0x100b621c4 Caustics
0x1004d4ad7: mov rdi, qword ptr [rbp - 0x30]
0x1004d4adb: call 0x1007c4640 ; 0x1007c4640
0x1004d4ae0: lea rdi, [rbx + 0xe40]
0x1004d4ae7: lea rsi, [rbx + 0x88]
0x1004d4aee: lea r8, [r15 + 0x750]
0x1004d4af5: mov r9d, 8
0x1004d4afb: mov rdx, qword ptr [rbp - 0x30]
0x1004d4aff: mov rcx, r13
0x1004d4b02: call 0x1007f5d90 ; 0x1007f5d90
0x1004d4b07: cmp byte ptr [rbx + 0x1378], 0
0x1004d4b0e: je 0x1004d4fde
0x1004d4b14: lea r13, [rbx + 0x10b0]
0x1004d4b1b: mov rax, qword ptr [rbp - 0x88]
0x1004d4b22: test rax, rax
0x1004d4b25: je 0x1004d4b3b
0x1004d4b27: mov rax, qword ptr [rax + 0x10]
0x1004d4b2b: lea rdx, [rax + 0xb0]
0x1004d4b32: test rax, rax
0x1004d4b35: cmove rdx, rax
0x1004d4b39: jmp 0x1004d4b3d ; 0x1004d4b3d
0x1004d4b3b: xor edx, edx
0x1004d4b3d: lea rsi, [rip + 0x6b43be] ; 0x100b88f02 u_normalTex
0x1004d4b44: xor ecx, ecx
0x1004d4b46: mov rdi, r13
0x1004d4b49: call 0x1007be8b0 ; 0x1007be8b0
0x1004d4b4e: cmp byte ptr [rbx + 0x1378], 0
0x1004d4b55: je 0x1004d5000
0x1004d4b5b: mov rax, qword ptr [rbp - 0x68]
0x1004d4b5f: test rax, rax
0x1004d4b62: je 0x1004d4b78
0x1004d4b64: mov rax, qword ptr [rax + 0x10]
0x1004d4b68: lea rdx, [rax + 0xb0]
0x1004d4b6f: test rax, rax
0x1004d4b72: cmove rdx, rax
0x1004d4b76: jmp 0x1004d4b7a ; 0x1004d4b7a
0x1004d4b78: xor edx, edx
0x1004d4b7a: lea rsi, [rip + 0x6b969f] ; 0x100b8e220 u_causticTex
0x1004d4b81: xor ecx, ecx
0x1004d4b83: mov rdi, r13
0x1004d4b86: call 0x1007be8b0 ; 0x1007be8b0
0x1004d4b8b: cmp byte ptr [rbx + 0x1378], 0
0x1004d4b92: je 0x1004d501f
0x1004d4b98: lea rsi, [rip + 0x6b968e] ; 0x100b8e22d u_specScale
0x1004d4b9f: vmovss xmm0, dword ptr [rip + 0x5d0519] ; 0x100aa50c0
0x1004d4ba7: mov rdi, r13
0x1004d4baa: call 0x1007be530 ; 0x1007be530
0x1004d4baf: lea rsi, [rip + 0x6a26c3] ; 0x100b77279 Rain
0x1004d4bb6: mov rdi, r12
0x1004d4bb9: call 0x100aa2cae ; 0x100aa2cae _strstr
0x1004d4bbe: test rax, rax
0x1004d4bc1: lea rax, [rip + 0x6b9671] ; 0x100b8e239 OceanDarkMeshWet
0x1004d4bc8: lea rcx, [rip + 0x6b967b] ; 0x100b8e24a OceanDarkMesh
0x1004d4bcf: cmovne rcx, rax
0x1004d4bd3: lea rax, [rip + 0x6b967e] ; 0x100b8e258 OceanMeshWet
0x1004d4bda: lea rdx, [rip + 0x6b9684] ; 0x100b8e265 OceanMesh
0x1004d4be1: cmovne rdx, rax
0x1004d4be5: cmp byte ptr [rbx + 0x1391], 0
0x1004d4bec: cmovne rdx, rcx
0x1004d4bf0: mov qword ptr [rbp - 0x38], rdx
0x1004d4bf4: lea rdi, [rbp - 0xa8]
0x1004d4bfb: call 0x1007c2530 ; 0x1007c2530
0x1004d4c00: call 0x1007d1100 ; 0x1007d1100
0x1004d4c05: mov rdi, qword ptr [rbp - 0x30]
0x1004d4c09: mov rsi, rax
0x1004d4c0c: mov rdx, qword ptr [rbp - 0x38]
0x1004d4c10: call 0x1007c4360 ; 0x1007c4360
0x1004d4c15: mov r13, rax
0x1004d4c18: test r13, r13
0x1004d4c1b: je 0x1004d4c52
0x1004d4c1d: lea rsi, [rbp - 0xa8]
0x1004d4c24: mov rdi, r13
0x1004d4c27: call 0x1007c2310 ; 0x1007c2310
0x1004d4c2c: mov rax, qword ptr [rbp - 0xa8]
0x1004d4c33: test rax, rax
0x1004d4c36: je 0x1004d4c57
0x1004d4c38: mov r14, qword ptr [rax + 0x10]
0x1004d4c3c: test byte ptr [r14 + 0xe8], 1
0x1004d4c44: jne 0x1004d4c64
0x1004d4c46: add r14, 0xe8
0x1004d4c4d: inc r14
0x1004d4c50: jmp 0x1004d4c6b ; 0x1004d4c6b
0x1004d4c52: xor r14d, r14d
0x1004d4c55: jmp 0x1004d4c6b ; 0x1004d4c6b
0x1004d4c57: xor r14d, r14d
0x1004d4c5a: test byte ptr [r14 + 0xe8], 1
0x1004d4c62: je 0x1004d4c46
0x1004d4c64: mov r14, qword ptr [r14 + 0xf8]
0x1004d4c6b: mov rdi, r15
0x1004d4c6e: mov rsi, r14
0x1004d4c71: call 0x10017e8d0 ; 0x10017e8d0
0x1004d4c76: mov qword ptr [rbp - 0x40], rax
0x1004d4c7a: test r13, r13
0x1004d4c7d: je 0x1004d503e
0x1004d4c83: test r14, r14
0x1004d4c86: je 0x1004d4faf
0x1004d4c8c: cmp byte ptr [r14], 0
0x1004d4c90: je 0x1004d4faf
0x1004d4c96: cmp qword ptr [rbp - 0x40], 0
0x1004d4c9b: je 0x1004d506a
0x1004d4ca1: cmp dword ptr [rbx + 0x13c8], 0
0x1004d4ca8: je 0x1004d4e62
0x1004d4cae: lea rax, [rbx + 0x4c0]
0x1004d4cb5: mov qword ptr [rbp - 0x48], rax
0x1004d4cb9: xor r13d, r13d
0x1004d4cbc: nop dword ptr [rax]
0x1004d4cc0: mov r13d, r13d
0x1004d4cc3: imul r15, r13, 0x5d0
0x1004d4cca: lea rdi, [rbx + r15 + 0x1430]
0x1004d4cd2: mov r9d, 8
0x1004d4cd8: mov rsi, qword ptr [rbp - 0x48]
0x1004d4cdc: mov rdx, qword ptr [rbp - 0x30]
0x1004d4ce0: mov rcx, qword ptr [rbp - 0x38]
0x1004d4ce4: mov r8, qword ptr [rbp - 0x40]
0x1004d4ce8: call 0x1007f5d90 ; 0x1007f5d90
0x1004d4ced: cmp byte ptr [rbx + r15 + 0x1968], 0
0x1004d4cf6: je 0x1004d4f1e
0x1004d4cfc: lea r14, [rbx + r15 + 0x16a0]
0x1004d4d04: mov rax, qword ptr [rbp - 0x88]
0x1004d4d0b: test rax, rax
0x1004d4d0e: je 0x1004d4d30
0x1004d4d10: mov rax, qword ptr [rax + 0x10]
0x1004d4d14: lea rdx, [rax + 0xb0]
0x1004d4d1b: test rax, rax
0x1004d4d1e: cmove rdx, rax
0x1004d4d22: jmp 0x1004d4d32 ; 0x1004d4d32
0x1004d4d24: nop word ptr cs:[rax + rax]
0x1004d4d30: xor edx, edx
0x1004d4d32: xor ecx, ecx
0x1004d4d34: mov rdi, r14
0x1004d4d37: lea rsi, [rip + 0x6b41c4] ; 0x100b88f02 u_normalTex
0x1004d4d3e: call 0x1007be8b0 ; 0x1007be8b0
0x1004d4d43: lea r12, [rbx + r15 + 0x1968]
0x1004d4d4b: cmp byte ptr [r12], 0
0x1004d4d50: je 0x1004d4f40
0x1004d4d56: mov rax, qword ptr [rbp - 0x68]
0x1004d4d5a: test rax, rax
0x1004d4d5d: je 0x1004d4d80
0x1004d4d5f: mov rax, qword ptr [rax + 0x10]
0x1004d4d63: lea rdx, [rax + 0xb0]
0x1004d4d6a: test rax, rax
0x1004d4d6d: cmove rdx, rax
0x1004d4d71: jmp 0x1004d4d82 ; 0x1004d4d82
0x1004d4d73: nop word ptr cs:[rax + rax]
0x1004d4d80: xor edx, edx
0x1004d4d82: xor ecx, ecx
0x1004d4d84: mov rdi, r14
0x1004d4d87: lea rsi, [rip + 0x6b9492] ; 0x100b8e220 u_causticTex
0x1004d4d8e: call 0x1007be8b0 ; 0x1007be8b0
0x1004d4d93: cmp byte ptr [r12], 0
0x1004d4d98: je 0x1004d4f62
0x1004d4d9e: xor eax, eax
0x1004d4da0: cmp byte ptr [rbx + r15 + 0x1420], 0
0x1004d4da9: sete al
0x1004d4dac: lea rcx, [rip + 0x5f08ed] ; 0x100ac56a0
0x1004d4db3: vmovss xmm0, dword ptr [rcx + rax*4]
0x1004d4db8: mov rdi, r14
0x1004d4dbb: lea rsi, [rip + 0x6b946b] ; 0x100b8e22d u_specScale
0x1004d4dc2: call 0x1007be530 ; 0x1007be530
0x1004d4dc7: cmp byte ptr [rbx + r15 + 0x195a], 1
0x1004d4dd0: je 0x1004d4f84
0x1004d4dd6: vmovaps xmm0, xmmword ptr [rbx + r15 + 0x1410]
0x1004d4de0: vmovss xmm1, dword ptr [rbx + r15 + 0x13f4]
0x1004d4dea: vcvtss2sd xmm1, xmm1, xmm1
0x1004d4dee: vmulsd xmm1, xmm1, qword ptr [rip + 0x5d579a] ; 0x100aaa590
0x1004d4df6: vmovshdup xmm2, xmm0
0x1004d4dfa: vcvtss2sd xmm2, xmm2, xmm2
0x1004d4dfe: vaddsd xmm1, xmm1, xmm2
0x1004d4e02: vcvtsd2ss xmm1, xmm1, xmm1
0x1004d4e06: vinsertps xmm0, xmm0, xmm1, 0x10
0x1004d4e0c: vmovaps xmm1, xmmword ptr [rbx + r15 + 0x1400]
0x1004d4e16: vmovaps xmm2, xmmword ptr [rbx + r15 + 0x13e0]
0x1004d4e20: vmovaps xmm3, xmmword ptr [rbx + r15 + 0x13f0]
0x1004d4e2a: vmovaps xmmword ptr [rbx + r15 + 0x1440], xmm2
0x1004d4e34: vmovaps xmmword ptr [rbx + r15 + 0x1450], xmm3
0x1004d4e3e: vmovaps xmmword ptr [rbx + r15 + 0x1460], xmm1
0x1004d4e48: vmovaps xmmword ptr [rbx + r15 + 0x1470], xmm0
0x1004d4e52: inc r13d
0x1004d4e55: cmp r13d, dword ptr [rbx + 0x13c8]
0x1004d4e5c: jb 0x1004d4cc0
0x1004d4e62: mov byte ptr [rip + 0x1b3ce5f], 1 ; 0x102011cc8
0x1004d4e69: mov dword ptr [rbx + 0x80], 3
0x1004d4e73: vxorps ymm0, ymm0, ymm0
0x1004d4e77: vmovups ymmword ptr [rbx + 0x60], ymm0
0x1004d4e7c: vmovups ymmword ptr [rbx + 0x40], ymm0
0x1004d4e81: mov rdi, qword ptr [rbx + 0x1398]
0x1004d4e88: test rdi, rdi
0x1004d4e8b: je 0x1004d4ee8
0x1004d4e8d: mov r14, qword ptr [rbx + 0x13a0]
0x1004d4e94: test r14, r14
0x1004d4e97: je 0x1004d4ee8
0x1004d4e99: mov rax, qword ptr [rdi]
0x1004d4e9c: vzeroupper 
0x1004d4e9f: call qword ptr [rax]
0x1004d4ea1: cmp r14, rax
0x1004d4ea4: jne 0x1004d4ee8
0x1004d4ea6: mov rdi, qword ptr [rbx + 0x1398]
0x1004d4ead: mov rax, qword ptr [rdi]
0x1004d4eb0: call qword ptr [rax + 0x10]
0x1004d4eb3: test al, al
0x1004d4eb5: je 0x1004d4ee8
0x1004d4eb7: mov rdi, qword ptr [rbx + 0x1398]
0x1004d4ebe: test rdi, rdi
0x1004d4ec1: je 0x1004d4ee8
0x1004d4ec3: mov r14, qword ptr [rbx + 0x13a0]
0x1004d4eca: test r14, r14
0x1004d4ecd: je 0x1004d4ee8
0x1004d4ecf: mov rax, qword ptr [rdi]
0x1004d4ed2: call qword ptr [rax]
0x1004d4ed4: cmp r14, rax
0x1004d4ed7: jne 0x1004d4ee8
0x1004d4ed9: mov rdi, qword ptr [rbx + 0x1398]
0x1004d4ee0: mov rax, qword ptr [rdi]
0x1004d4ee3: xor esi, esi
0x1004d4ee5: call qword ptr [rax + 0x30]
0x1004d4ee8: lea rdi, [rbp - 0xa8]
0x1004d4eef: vzeroupper 
0x1004d4ef2: call 0x1007c2570 ; 0x1007c2570
0x1004d4ef7: lea rdi, [rbp - 0x68]
0x1004d4efb: call 0x1007c2570 ; 0x1007c2570
0x1004d4f00: lea rdi, [rbp - 0x88]
0x1004d4f07: call 0x1007c2570 ; 0x1007c2570
0x1004d4f0c: add rsp, 0x88
0x1004d4f13: pop rbx
0x1004d4f14: pop r12
0x1004d4f16: pop r13
0x1004d4f18: pop r14
0x1004d4f1a: pop r15
0x1004d4f1c: pop rbp
0x1004d4f1d: ret 
0x1004d4f1e: lea rdi, [rip + 0x6a1dc5] ; 0x100b76cea IsInitialized()
0x1004d4f25: lea rsi, [rip + 0x68d34f] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1004d4f2c: mov edx, 0xa8
0x1004d4f31: mov ecx, 3
0x1004d4f36: call 0x1007e5f70 ; 0x1007e5f70
0x1004d4f3b: jmp 0x1004d5093 ; 0x1004d5093
0x1004d4f40: lea rdi, [rip + 0x6a1da3] ; 0x100b76cea IsInitialized()
0x1004d4f47: lea rsi, [rip + 0x68d32d] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1004d4f4e: mov edx, 0xa8
0x1004d4f53: mov ecx, 3
0x1004d4f58: call 0x1007e5f70 ; 0x1007e5f70
0x1004d4f5d: jmp 0x1004d5093 ; 0x1004d5093
0x1004d4f62: lea rdi, [rip + 0x6a1d81] ; 0x100b76cea IsInitialized()
0x1004d4f69: lea rsi, [rip + 0x68d30b] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1004d4f70: mov edx, 0xa8
0x1004d4f75: mov ecx, 3
0x1004d4f7a: call 0x1007e5f70 ; 0x1007e5f70
0x1004d4f7f: jmp 0x1004d5093 ; 0x1004d5093
0x1004d4f84: lea rdi, [rip + 0x68d2e6] ; 0x100b62271 !m_queued
0x1004d4f8b: lea rsi, [rip + 0x68d2e9] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1004d4f92: lea r8, [rip + 0x68d2fe] ; 0x100b62297 VertexRender has already been committed!
0x1004d4f99: mov edx, 0x8c
0x1004d4f9e: mov ecx, 4
0x1004d4fa3: xor eax, eax
0x1004d4fa5: call 0x1007e6030 ; 0x1007e6030
0x1004d4faa: jmp 0x1004d5093 ; 0x1004d5093
0x1004d4faf: lea rdi, [rip + 0x6a1a7e] ; 0x100b76a34 renderlistName && renderlistName[0]
0x1004d4fb6: lea rsi, [rip + 0x6b9129] ; 0x100b8e0e6 Ocean.cpp
0x1004d4fbd: lea r8, [rip + 0x6a1a94] ; 0x100b76a58 Shader %s is missing a RenderList group
0x1004d4fc4: mov edx, 0x142
0x1004d4fc9: mov ecx, 4
0x1004d4fce: xor eax, eax
0x1004d4fd0: mov r9, qword ptr [rbp - 0x38]
0x1004d4fd4: call 0x1007e6030 ; 0x1007e6030
0x1004d4fd9: jmp 0x1004d5093 ; 0x1004d5093
0x1004d4fde: lea rdi, [rip + 0x6a1d05] ; 0x100b76cea IsInitialized()
0x1004d4fe5: lea rsi, [rip + 0x68d28f] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1004d4fec: mov edx, 0xa8
0x1004d4ff1: mov ecx, 3
0x1004d4ff6: call 0x1007e5f70 ; 0x1007e5f70
0x1004d4ffb: jmp 0x1004d5093 ; 0x1004d5093
0x1004d5000: lea rdi, [rip + 0x6a1ce3] ; 0x100b76cea IsInitialized()
0x1004d5007: lea rsi, [rip + 0x68d26d] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1004d500e: mov edx, 0xa8
0x1004d5013: mov ecx, 3
0x1004d5018: call 0x1007e5f70 ; 0x1007e5f70
0x1004d501d: jmp 0x1004d5093 ; 0x1004d5093
0x1004d501f: lea rdi, [rip + 0x6a1cc4] ; 0x100b76cea IsInitialized()
0x1004d5026: lea rsi, [rip + 0x68d24e] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1004d502d: mov edx, 0xa8
0x1004d5032: mov ecx, 3
0x1004d5037: call 0x1007e5f70 ; 0x1007e5f70
0x1004d503c: jmp 0x1004d5093 ; 0x1004d5093
0x1004d503e: lea rdi, [rip + 0x6a19cf] ; 0x100b76a14 foundShader
0x1004d5045: lea rsi, [rip + 0x6b909a] ; 0x100b8e0e6 Ocean.cpp
0x1004d504c: lea r8, [rip + 0x6a19cd] ; 0x100b76a20 No shader called %s
0x1004d5053: mov edx, 0x141
0x1004d5058: mov ecx, 4
0x1004d505d: xor eax, eax
0x1004d505f: mov r9, qword ptr [rbp - 0x38]
0x1004d5063: call 0x1007e6030 ; 0x1007e6030
0x1004d5068: jmp 0x1004d5093 ; 0x1004d5093
0x1004d506a: lea rdi, [rip + 0x6a1a0f] ; 0x100b76a80 renderList
0x1004d5071: lea rsi, [rip + 0x6b906e] ; 0x100b8e0e6 Ocean.cpp
0x1004d5078: lea r8, [rip + 0x6a1a0c] ; 0x100b76a8b No RenderList called %s
0x1004d507f: mov edx, 0x143
0x1004d5084: mov ecx, 4
0x1004d5089: xor eax, eax
0x1004d508b: mov r9, r14
0x1004d508e: call 0x1007e6030 ; 0x1007e6030
0x1004d5093: ud2 
0x1004d5095: jmp 0x1004d50ac ; 0x1004d50ac
0x1004d5097: jmp 0x1004d50ac ; 0x1004d50ac
0x1004d5099: mov rbx, rax
0x1004d509c: jmp 0x1004d50bb ; 0x1004d50bb
0x1004d509e: mov rbx, rax
0x1004d50a1: jmp 0x1004d50c4 ; 0x1004d50c4
0x1004d50a3: jmp 0x1004d50ac ; 0x1004d50ac
0x1004d50a5: jmp 0x1004d50ac ; 0x1004d50ac
0x1004d50a7: mov rbx, rax
0x1004d50aa: jmp 0x1004d50bb ; 0x1004d50bb
0x1004d50ac: mov rbx, rax
0x1004d50af: lea rdi, [rbp - 0xa8]
0x1004d50b6: call 0x1007c2570 ; 0x1007c2570
0x1004d50bb: lea rdi, [rbp - 0x68]
0x1004d50bf: call 0x1007c2570 ; 0x1007c2570
0x1004d50c4: lea rdi, [rbp - 0x88]
0x1004d50cb: call 0x1007c2570 ; 0x1007c2570
0x1004d50d0: mov rdi, rbx
0x1004d50d3: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1004d50d8: nop dword ptr [rax + rax]
