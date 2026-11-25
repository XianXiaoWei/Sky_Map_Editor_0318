0x100443a70: lea rax, [rip + 0x745355] ; 0x100b88dcc u_materialId
0x100443a77: mov qword ptr [rsi], rax
0x100443a7a: mov dword ptr [rsi + 8], 1
0x100443a81: movzx eax, byte ptr [rdi]
0x100443a84: vcvtsi2ss xmm0, xmm0, eax
0x100443a88: vmovss dword ptr [rsi + 0x10], xmm0
0x100443a8d: lea rax, [rip + 0x745345] ; 0x100b88dd9 u_matUvScale
0x100443a94: mov qword ptr [rsi + 0x20], rax
0x100443a98: mov dword ptr [rsi + 0x28], 1
0x100443a9f: mov eax, dword ptr [rdi + 0x5c]
0x100443aa2: mov dword ptr [rsi + 0x30], eax
0x100443aa5: lea rax, [rip + 0x745354] ; 0x100b88e00 u_matRoughness
0x100443aac: mov qword ptr [rsi + 0x40], rax
0x100443ab0: mov dword ptr [rsi + 0x48], 1
0x100443ab7: mov eax, dword ptr [rdi + 0x58]
0x100443aba: mov dword ptr [rsi + 0x50], eax
0x100443abd: lea rax, [rip + 0x74532d] ; 0x100b88df1 u_matMetalness
0x100443ac4: mov qword ptr [rsi + 0x60], rax
0x100443ac8: mov dword ptr [rsi + 0x68], 1
0x100443acf: mov eax, dword ptr [rdi + 0x54]
0x100443ad2: mov dword ptr [rsi + 0x70], eax
0x100443ad5: lea rax, [rip + 0x74530a] ; 0x100b88de6 u_matColor
0x100443adc: mov qword ptr [rsi + 0x80], rax
0x100443ae3: mov dword ptr [rsi + 0x88], 3
0x100443aed: vmovaps xmm0, xmmword ptr [rdi + 0x20]
0x100443af2: vmovss dword ptr [rsi + 0x90], xmm0
0x100443afa: vextractps dword ptr [rsi + 0x94], xmm0, 1
0x100443b04: vextractps dword ptr [rsi + 0x98], xmm0, 2
0x100443b0e: mov rcx, qword ptr [rdi + 0x68]
0x100443b12: mov eax, 5
0x100443b17: test rcx, rcx
0x100443b1a: je 0x100443b4a
0x100443b1c: cmp qword ptr [rdi + 0x88], 0
0x100443b24: je 0x100443b4a
0x100443b26: mov qword ptr [rsi + 0xa0], rcx
0x100443b2d: mov dword ptr [rsi + 0xa8], 0x64
0x100443b37: mov rax, qword ptr [rdi + 0x88]
0x100443b3e: mov qword ptr [rsi + 0xb0], rax
0x100443b45: mov eax, 6
0x100443b4a: mov r8, qword ptr [rdi + 0xa8]
0x100443b51: test r8, r8
0x100443b54: je 0x100443ba2
0x100443b56: mov ecx, eax
0x100443b58: shl rcx, 5
0x100443b5c: mov qword ptr [rsi + rcx], r8
0x100443b60: mov dword ptr [rsi + rcx + 8], 4
0x100443b68: vmovss xmm0, dword ptr [rdi + 0xd0]
0x100443b70: vmovss dword ptr [rsi + rcx + 0x10], xmm0
0x100443b76: vmovss xmm0, dword ptr [rdi + 0xd4]
0x100443b7e: vmovss dword ptr [rsi + rcx + 0x14], xmm0
0x100443b84: vmovss xmm0, dword ptr [rdi + 0xd8]
0x100443b8c: vmovss dword ptr [rsi + rcx + 0x18], xmm0
0x100443b92: vmovss xmm0, dword ptr [rdi + 0xdc]
0x100443b9a: vmovss dword ptr [rsi + rcx + 0x1c], xmm0
0x100443ba0: inc eax
0x100443ba2: mov r8, qword ptr [rdi + 0x110]
0x100443ba9: test r8, r8
0x100443bac: je 0x100443bec
0x100443bae: mov ecx, eax
0x100443bb0: shl rcx, 5
0x100443bb4: mov qword ptr [rsi + rcx], r8
0x100443bb8: mov dword ptr [rsi + rcx + 8], 3
0x100443bc0: vmovss xmm0, dword ptr [rdi + 0x130]
0x100443bc8: vmovss dword ptr [rsi + rcx + 0x10], xmm0
0x100443bce: vmovss xmm0, dword ptr [rdi + 0x134]
0x100443bd6: vmovss dword ptr [rsi + rcx + 0x14], xmm0
0x100443bdc: vmovss xmm0, dword ptr [rdi + 0x138]
0x100443be4: vmovss dword ptr [rsi + rcx + 0x18], xmm0
0x100443bea: inc eax
0x100443bec: mov r8, qword ptr [rdi + 0x170]
0x100443bf3: test r8, r8
0x100443bf6: je 0x100443c19
0x100443bf8: mov r9d, eax
0x100443bfb: shl r9, 5
0x100443bff: mov qword ptr [rsi + r9], r8
0x100443c03: mov dword ptr [rsi + r9 + 8], 1
0x100443c0c: mov ecx, dword ptr [rdi + 0x190]
0x100443c12: mov dword ptr [rsi + r9 + 0x10], ecx
0x100443c17: inc eax
0x100443c19: mov r8, qword ptr [rdi + 0x70]
0x100443c1d: test r8, r8
0x100443c20: je 0x100443c4e
0x100443c22: cmp qword ptr [rdi + 0x90], 0
0x100443c2a: je 0x100443c4e
0x100443c2c: mov r9d, eax
0x100443c2f: shl r9, 5
0x100443c33: mov qword ptr [rsi + r9], r8
0x100443c37: mov dword ptr [rsi + r9 + 8], 0x64
0x100443c40: mov rcx, qword ptr [rdi + 0x90]
0x100443c47: mov qword ptr [rsi + r9 + 0x10], rcx
0x100443c4c: inc eax
0x100443c4e: mov r8, qword ptr [rdi + 0xb0]
0x100443c55: test r8, r8
0x100443c58: je 0x100443ca6
0x100443c5a: mov ecx, eax
0x100443c5c: shl rcx, 5
0x100443c60: mov qword ptr [rsi + rcx], r8
0x100443c64: mov dword ptr [rsi + rcx + 8], 4
0x100443c6c: vmovss xmm0, dword ptr [rdi + 0xe0]
0x100443c74: vmovss dword ptr [rsi + rcx + 0x10], xmm0
0x100443c7a: vmovss xmm0, dword ptr [rdi + 0xe4]
0x100443c82: vmovss dword ptr [rsi + rcx + 0x14], xmm0
0x100443c88: vmovss xmm0, dword ptr [rdi + 0xe8]
0x100443c90: vmovss dword ptr [rsi + rcx + 0x18], xmm0
0x100443c96: vmovss xmm0, dword ptr [rdi + 0xec]
0x100443c9e: vmovss dword ptr [rsi + rcx + 0x1c], xmm0
0x100443ca4: inc eax
0x100443ca6: mov r8, qword ptr [rdi + 0x118]
0x100443cad: test r8, r8
0x100443cb0: je 0x100443cf0
0x100443cb2: mov ecx, eax
0x100443cb4: shl rcx, 5
0x100443cb8: mov qword ptr [rsi + rcx], r8
0x100443cbc: mov dword ptr [rsi + rcx + 8], 3
0x100443cc4: vmovss xmm0, dword ptr [rdi + 0x140]
0x100443ccc: vmovss dword ptr [rsi + rcx + 0x10], xmm0
0x100443cd2: vmovss xmm0, dword ptr [rdi + 0x144]
0x100443cda: vmovss dword ptr [rsi + rcx + 0x14], xmm0
0x100443ce0: vmovss xmm0, dword ptr [rdi + 0x148]
0x100443ce8: vmovss dword ptr [rsi + rcx + 0x18], xmm0
0x100443cee: inc eax
0x100443cf0: mov r8, qword ptr [rdi + 0x178]
0x100443cf7: test r8, r8
0x100443cfa: je 0x100443d1d
0x100443cfc: mov r9d, eax
0x100443cff: shl r9, 5
0x100443d03: mov qword ptr [rsi + r9], r8
0x100443d07: mov dword ptr [rsi + r9 + 8], 1
0x100443d10: mov ecx, dword ptr [rdi + 0x194]
0x100443d16: mov dword ptr [rsi + r9 + 0x10], ecx
0x100443d1b: inc eax
0x100443d1d: mov r8, qword ptr [rdi + 0x78]
0x100443d21: test r8, r8
0x100443d24: je 0x100443d52
0x100443d26: cmp qword ptr [rdi + 0x98], 0
0x100443d2e: je 0x100443d52
0x100443d30: mov r9d, eax
0x100443d33: shl r9, 5
0x100443d37: mov qword ptr [rsi + r9], r8
0x100443d3b: mov dword ptr [rsi + r9 + 8], 0x64
0x100443d44: mov rcx, qword ptr [rdi + 0x98]
0x100443d4b: mov qword ptr [rsi + r9 + 0x10], rcx
0x100443d50: inc eax
0x100443d52: mov r8, qword ptr [rdi + 0xb8]
0x100443d59: test r8, r8
0x100443d5c: je 0x100443daa
0x100443d5e: mov ecx, eax
0x100443d60: shl rcx, 5
0x100443d64: mov qword ptr [rsi + rcx], r8
0x100443d68: mov dword ptr [rsi + rcx + 8], 4
0x100443d70: vmovss xmm0, dword ptr [rdi + 0xf0]
0x100443d78: vmovss dword ptr [rsi + rcx + 0x10], xmm0
0x100443d7e: vmovss xmm0, dword ptr [rdi + 0xf4]
0x100443d86: vmovss dword ptr [rsi + rcx + 0x14], xmm0
0x100443d8c: vmovss xmm0, dword ptr [rdi + 0xf8]
0x100443d94: vmovss dword ptr [rsi + rcx + 0x18], xmm0
0x100443d9a: vmovss xmm0, dword ptr [rdi + 0xfc]
0x100443da2: vmovss dword ptr [rsi + rcx + 0x1c], xmm0
0x100443da8: inc eax
0x100443daa: mov r8, qword ptr [rdi + 0x120]
0x100443db1: test r8, r8
0x100443db4: je 0x100443df4
0x100443db6: mov ecx, eax
0x100443db8: shl rcx, 5
0x100443dbc: mov qword ptr [rsi + rcx], r8
0x100443dc0: mov dword ptr [rsi + rcx + 8], 3
0x100443dc8: vmovss xmm0, dword ptr [rdi + 0x150]
0x100443dd0: vmovss dword ptr [rsi + rcx + 0x10], xmm0
0x100443dd6: vmovss xmm0, dword ptr [rdi + 0x154]
0x100443dde: vmovss dword ptr [rsi + rcx + 0x14], xmm0
0x100443de4: vmovss xmm0, dword ptr [rdi + 0x158]
0x100443dec: vmovss dword ptr [rsi + rcx + 0x18], xmm0
0x100443df2: inc eax
0x100443df4: mov r8, qword ptr [rdi + 0x180]
0x100443dfb: test r8, r8
0x100443dfe: je 0x100443e21
0x100443e00: mov r9d, eax
0x100443e03: shl r9, 5
0x100443e07: mov qword ptr [rsi + r9], r8
0x100443e0b: mov dword ptr [rsi + r9 + 8], 1
0x100443e14: mov ecx, dword ptr [rdi + 0x198]
0x100443e1a: mov dword ptr [rsi + r9 + 0x10], ecx
0x100443e1f: inc eax
0x100443e21: mov r8, qword ptr [rdi + 0x80]
0x100443e28: test r8, r8
0x100443e2b: je 0x100443e59
0x100443e2d: cmp qword ptr [rdi + 0xa0], 0
0x100443e35: je 0x100443e59
0x100443e37: mov r9d, eax
0x100443e3a: shl r9, 5
0x100443e3e: mov qword ptr [rsi + r9], r8
0x100443e42: mov dword ptr [rsi + r9 + 8], 0x64
0x100443e4b: mov rcx, qword ptr [rdi + 0xa0]
0x100443e52: mov qword ptr [rsi + r9 + 0x10], rcx
0x100443e57: inc eax
0x100443e59: mov r8, qword ptr [rdi + 0xc0]
0x100443e60: test r8, r8
0x100443e63: je 0x100443eb1
0x100443e65: mov ecx, eax
0x100443e67: shl rcx, 5
0x100443e6b: mov qword ptr [rsi + rcx], r8
0x100443e6f: mov dword ptr [rsi + rcx + 8], 4
0x100443e77: vmovss xmm0, dword ptr [rdi + 0x100]
0x100443e7f: vmovss dword ptr [rsi + rcx + 0x10], xmm0
0x100443e85: vmovss xmm0, dword ptr [rdi + 0x104]
0x100443e8d: vmovss dword ptr [rsi + rcx + 0x14], xmm0
0x100443e93: vmovss xmm0, dword ptr [rdi + 0x108]
0x100443e9b: vmovss dword ptr [rsi + rcx + 0x18], xmm0
0x100443ea1: vmovss xmm0, dword ptr [rdi + 0x10c]
0x100443ea9: vmovss dword ptr [rsi + rcx + 0x1c], xmm0
0x100443eaf: inc eax
0x100443eb1: mov r8, qword ptr [rdi + 0x128]
0x100443eb8: test r8, r8
0x100443ebb: je 0x100443efb
0x100443ebd: mov ecx, eax
0x100443ebf: shl rcx, 5
0x100443ec3: mov qword ptr [rsi + rcx], r8
0x100443ec7: mov dword ptr [rsi + rcx + 8], 3
0x100443ecf: vmovss xmm0, dword ptr [rdi + 0x160]
0x100443ed7: vmovss dword ptr [rsi + rcx + 0x10], xmm0
0x100443edd: vmovss xmm0, dword ptr [rdi + 0x164]
0x100443ee5: vmovss dword ptr [rsi + rcx + 0x14], xmm0
0x100443eeb: vmovss xmm0, dword ptr [rdi + 0x168]
0x100443ef3: vmovss dword ptr [rsi + rcx + 0x18], xmm0
0x100443ef9: inc eax
0x100443efb: mov r8, qword ptr [rdi + 0x188]
0x100443f02: test r8, r8
0x100443f05: je 0x100443f25
0x100443f07: mov ecx, eax
0x100443f09: shl rcx, 5
0x100443f0d: mov qword ptr [rsi + rcx], r8
0x100443f11: mov dword ptr [rsi + rcx + 8], 1
0x100443f19: mov edi, dword ptr [rdi + 0x19c]
0x100443f1f: mov dword ptr [rsi + rcx + 0x10], edi
0x100443f23: inc eax
0x100443f25: cmp eax, edx
0x100443f27: ja 0x100443f2a
0x100443f29: ret 
0x100443f2a: push rbp
0x100443f2b: mov rbp, rsp
0x100443f2e: lea rdi, [rip + 0x744eda] ; 0x100b88e0f bufSize >= uniformCount
0x100443f35: lea rsi, [rip + 0x744e2d] ; 0x100b88d69 MaterialDefs.cpp
0x100443f3c: mov edx, 0xe0
0x100443f41: mov ecx, 3
0x100443f46: call 0x1007e5f70 ; 0x1007e5f70
0x100443f4b: ud2 
0x100443f4d: nop dword ptr [rax]
