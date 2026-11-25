0x1006c5d40: push rbp
0x1006c5d41: mov rbp, rsp
0x1006c5d44: push r15
0x1006c5d46: push r14
0x1006c5d48: push r13
0x1006c5d4a: push r12
0x1006c5d4c: push rbx
0x1006c5d4d: sub rsp, 0x18
0x1006c5d51: mov r13, rdx
0x1006c5d54: mov r14, rdi
0x1006c5d57: jmp 0x1006c5d70 ; 0x1006c5d70
0x1006c5d59: lea rdi, [r12 + 8]
0x1006c5d5e: mov rsi, qword ptr [rbp - 0x38]
0x1006c5d62: mov rdx, r13
0x1006c5d65: call 0x1006c5d40 ; 0x1006c5d40
0x1006c5d6a: mov rsi, r12
0x1006c5d6d: nop dword ptr [rax]
0x1006c5d70: lea rax, [rsi - 8]
0x1006c5d74: mov qword ptr [rbp - 0x30], rax
0x1006c5d78: mov qword ptr [rbp - 0x38], rsi
0x1006c5d7c: lea rax, [rsi - 0x10]
0x1006c5d80: mov qword ptr [rbp - 0x40], rax
0x1006c5d84: mov rbx, r14
0x1006c5d87: jmp 0x1006c5da0 ; 0x1006c5da0
0x1006c5d89: mov rdi, r14
0x1006c5d8c: mov rsi, r12
0x1006c5d8f: mov rdx, r13
0x1006c5d92: call 0x1006c5d40 ; 0x1006c5d40
0x1006c5d97: add r12, 8
0x1006c5d9b: mov rbx, r12
0x1006c5d9e: nop 
0x1006c5da0: mov r14, rbx
0x1006c5da3: mov r12, qword ptr [rbp - 0x38]
0x1006c5da7: mov rcx, r12
0x1006c5daa: sub rcx, r14
0x1006c5dad: mov rax, rcx
0x1006c5db0: sar rax, 3
0x1006c5db4: cmp rax, 5
0x1006c5db8: jbe 0x1006c63b2
0x1006c5dbe: cmp rcx, 0xf7
0x1006c5dc5: jle 0x1006c6428
0x1006c5dcb: mov rdx, rax
0x1006c5dce: shr rdx, 0x3f
0x1006c5dd2: add rdx, rax
0x1006c5dd5: movabs rsi, 0x3ffffffffffffffe
0x1006c5ddf: and rdx, rsi
0x1006c5de2: lea r15, [r14 + rdx*4]
0x1006c5de6: cmp rcx, 0x1f39
0x1006c5ded: jl 0x1006c5e20
0x1006c5def: mov rcx, rax
0x1006c5df2: sar rcx, 0x3f
0x1006c5df6: shr rcx, 0x3e
0x1006c5dfa: add rcx, rax
0x1006c5dfd: add rcx, rcx
0x1006c5e00: and rcx, 0xfffffffffffffff8
0x1006c5e04: lea rsi, [r14 + rcx]
0x1006c5e08: add rcx, r15
0x1006c5e0b: mov rdi, r14
0x1006c5e0e: mov rdx, r15
0x1006c5e11: mov r8, qword ptr [rbp - 0x30]
0x1006c5e15: mov r9, r13
0x1006c5e18: call 0x1006c6950 ; 0x1006c6950
0x1006c5e1d: jmp 0x1006c5e32 ; 0x1006c5e32
0x1006c5e1f: nop 
0x1006c5e20: mov rdi, r14
0x1006c5e23: mov rsi, r15
0x1006c5e26: mov rdx, qword ptr [rbp - 0x30]
0x1006c5e2a: mov rcx, r13
0x1006c5e2d: call 0x1006c6620 ; 0x1006c6620
0x1006c5e32: mov rdi, qword ptr [r14]
0x1006c5e35: mov rcx, qword ptr [r15]
0x1006c5e38: mov rsi, qword ptr [r13]
0x1006c5e3c: mov rdx, qword ptr [r13 + 8]
0x1006c5e40: vmovss xmm0, dword ptr [rdi + 0x10]
0x1006c5e45: mov sil, byte ptr [rsi]
0x1006c5e48: test sil, sil
0x1006c5e4b: je 0x1006c5ea0
0x1006c5e4d: vmovss xmm4, dword ptr [rdx + 0x1090]
0x1006c5e55: vxorps xmm2, xmm2, xmm2
0x1006c5e59: vucomiss xmm4, xmm0
0x1006c5e5d: vxorps xmm1, xmm1, xmm1
0x1006c5e61: jbe 0x1006c5e68
0x1006c5e63: vmovss xmm1, dword ptr [rdx + 0x18]
0x1006c5e68: vaddss xmm3, xmm0, xmm1
0x1006c5e6c: vmovss xmm1, dword ptr [rcx + 0x10]
0x1006c5e71: vucomiss xmm4, xmm1
0x1006c5e75: jbe 0x1006c5e7c
0x1006c5e77: vmovss xmm2, dword ptr [rdx + 0x18]
0x1006c5e7c: vaddss xmm2, xmm1, xmm2
0x1006c5e80: vucomiss xmm2, xmm3
0x1006c5e84: jbe 0x1006c5eb7
0x1006c5e86: mov rcx, qword ptr [rbp - 0x30]
0x1006c5e8a: lea r12, [r14 + 8]
0x1006c5e8e: cmp r12, rcx
0x1006c5e91: jb 0x1006c5ffb
0x1006c5e97: jmp 0x1006c60e8 ; 0x1006c60e8
0x1006c5e9c: nop dword ptr [rax]
0x1006c5ea0: vmovss xmm1, dword ptr [rcx + 0x10]
0x1006c5ea5: vxorps xmm2, xmm2, xmm2
0x1006c5ea9: vmovaps xmm3, xmm0
0x1006c5ead: vaddss xmm2, xmm1, xmm2
0x1006c5eb1: vucomiss xmm2, xmm3
0x1006c5eb5: ja 0x1006c5e86
0x1006c5eb7: cmp r14, qword ptr [rbp - 0x40]
0x1006c5ebb: je 0x1006c5f70
0x1006c5ec1: test sil, sil
0x1006c5ec4: je 0x1006c5f40
0x1006c5ec6: vmovss xmm2, dword ptr [rdx + 0x1090]
0x1006c5ece: mov rcx, qword ptr [rbp - 0x40]
0x1006c5ed2: nop word ptr cs:[rax + rax]
0x1006c5ee0: mov rbx, qword ptr [rcx]
0x1006c5ee3: vmovss xmm4, dword ptr [rbx + 0x10]
0x1006c5ee8: vxorps xmm3, xmm3, xmm3
0x1006c5eec: vucomiss xmm2, xmm4
0x1006c5ef0: vxorps xmm5, xmm5, xmm5
0x1006c5ef4: ja 0x1006c5f20
0x1006c5ef6: vucomiss xmm2, xmm1
0x1006c5efa: vaddss xmm4, xmm4, xmm5
0x1006c5efe: ja 0x1006c5f2f
0x1006c5f00: vaddss xmm3, xmm1, xmm3
0x1006c5f04: vucomiss xmm3, xmm4
0x1006c5f08: ja 0x1006c5fb8
0x1006c5f0e: add rcx, -8
0x1006c5f12: cmp r14, rcx
0x1006c5f15: jne 0x1006c5ee0
0x1006c5f17: jmp 0x1006c5f70 ; 0x1006c5f70
0x1006c5f19: nop dword ptr [rax]
0x1006c5f20: vmovss xmm5, dword ptr [rdx + 0x18]
0x1006c5f25: vucomiss xmm2, xmm1
0x1006c5f29: vaddss xmm4, xmm4, xmm5
0x1006c5f2d: jbe 0x1006c5f00
0x1006c5f2f: vmovss xmm3, dword ptr [rdx + 0x18]
0x1006c5f34: vaddss xmm3, xmm1, xmm3
0x1006c5f38: vucomiss xmm3, xmm4
0x1006c5f3c: jbe 0x1006c5f0e
0x1006c5f3e: jmp 0x1006c5fb8 ; 0x1006c5fb8
0x1006c5f40: mov rcx, qword ptr [rbp - 0x40]
0x1006c5f44: nop word ptr cs:[rax + rax]
0x1006c5f50: mov rbx, qword ptr [rcx]
0x1006c5f53: vucomiss xmm1, dword ptr [rbx + 0x10]
0x1006c5f58: ja 0x1006c5fb8
0x1006c5f5a: add rcx, -8
0x1006c5f5e: cmp r14, rcx
0x1006c5f61: jne 0x1006c5f50
0x1006c5f63: nop word ptr cs:[rax + rax]
0x1006c5f70: mov rax, qword ptr [rbp - 0x30]
0x1006c5f74: mov rax, qword ptr [rax]
0x1006c5f77: test sil, sil
0x1006c5f7a: je 0x1006c61b6
0x1006c5f80: vmovss xmm4, dword ptr [rdx + 0x1090]
0x1006c5f88: vxorps xmm1, xmm1, xmm1
0x1006c5f8c: vucomiss xmm4, xmm0
0x1006c5f90: vxorps xmm2, xmm2, xmm2
0x1006c5f94: jbe 0x1006c5f9b
0x1006c5f96: vmovss xmm2, dword ptr [rdx + 0x18]
0x1006c5f9b: vaddss xmm3, xmm0, xmm2
0x1006c5f9f: vmovss xmm2, dword ptr [rax + 0x10]
0x1006c5fa4: vucomiss xmm4, xmm2
0x1006c5fa8: jbe 0x1006c61c3
0x1006c5fae: vmovss xmm1, dword ptr [rdx + 0x18]
0x1006c5fb3: jmp 0x1006c61c3 ; 0x1006c61c3
0x1006c5fb8: mov rdx, qword ptr [rcx]
0x1006c5fbb: mov qword ptr [r14], rdx
0x1006c5fbe: mov qword ptr [rcx], rdi
0x1006c5fc1: inc eax
0x1006c5fc3: lea r12, [r14 + 8]
0x1006c5fc7: cmp r12, rcx
0x1006c5fca: jb 0x1006c5ffb
0x1006c5fcc: jmp 0x1006c60e8 ; 0x1006c60e8
0x1006c5fd1: nop word ptr cs:[rax + rax]
0x1006c5fe0: mov rdx, qword ptr [r12]
0x1006c5fe4: mov rsi, qword ptr [rcx]
0x1006c5fe7: mov qword ptr [r12], rsi
0x1006c5feb: mov qword ptr [rcx], rdx
0x1006c5fee: inc eax
0x1006c5ff0: cmp r15, r12
0x1006c5ff3: cmove r15, rcx
0x1006c5ff7: add r12, 8
0x1006c5ffb: mov rsi, qword ptr [r15]
0x1006c5ffe: mov rdi, qword ptr [r13]
0x1006c6002: mov rdx, qword ptr [r13 + 8]
0x1006c6006: mov bl, byte ptr [rdi]
0x1006c6008: test bl, bl
0x1006c600a: je 0x1006c6060
0x1006c600c: vmovss xmm1, dword ptr [rdx + 0x1090]
0x1006c6014: vmovss xmm0, dword ptr [rsi + 0x10]
0x1006c6019: add r12, -8
0x1006c601d: nop dword ptr [rax]
0x1006c6020: mov rsi, qword ptr [r12 + 8]
0x1006c6025: vmovss xmm3, dword ptr [rsi + 0x10]
0x1006c602a: vxorps xmm2, xmm2, xmm2
0x1006c602e: vucomiss xmm1, xmm3
0x1006c6032: vxorps xmm4, xmm4, xmm4
0x1006c6036: jbe 0x1006c603d
0x1006c6038: vmovss xmm4, dword ptr [rdx + 0x18]
0x1006c603d: vucomiss xmm1, xmm0
0x1006c6041: vaddss xmm3, xmm3, xmm4
0x1006c6045: jbe 0x1006c604c
0x1006c6047: vmovss xmm2, dword ptr [rdx + 0x18]
0x1006c604c: vaddss xmm2, xmm0, xmm2
0x1006c6050: add r12, 8
0x1006c6054: vucomiss xmm2, xmm3
0x1006c6058: ja 0x1006c6020
0x1006c605a: jmp 0x1006c6080 ; 0x1006c6080
0x1006c605c: nop dword ptr [rax]
0x1006c6060: vmovss xmm0, dword ptr [rsi + 0x10]
0x1006c6065: add r12, -8
0x1006c6069: nop dword ptr [rax]
0x1006c6070: mov rsi, qword ptr [r12 + 8]
0x1006c6075: add r12, 8
0x1006c6079: vucomiss xmm0, dword ptr [rsi + 0x10]
0x1006c607e: ja 0x1006c6070
0x1006c6080: test bl, bl
0x1006c6082: je 0x1006c60d0
0x1006c6084: vmovss xmm1, dword ptr [rdx + 0x1090]
0x1006c608c: nop dword ptr [rax]
0x1006c6090: mov rsi, qword ptr [rcx - 8]
0x1006c6094: vmovss xmm3, dword ptr [rsi + 0x10]
0x1006c6099: vxorps xmm2, xmm2, xmm2
0x1006c609d: vucomiss xmm1, xmm3
0x1006c60a1: vxorps xmm4, xmm4, xmm4
0x1006c60a5: jbe 0x1006c60ac
0x1006c60a7: vmovss xmm4, dword ptr [rdx + 0x18]
0x1006c60ac: vucomiss xmm1, xmm0
0x1006c60b0: vaddss xmm3, xmm3, xmm4
0x1006c60b4: jbe 0x1006c60bb
0x1006c60b6: vmovss xmm2, dword ptr [rdx + 0x18]
0x1006c60bb: add rcx, -8
0x1006c60bf: vaddss xmm2, xmm0, xmm2
0x1006c60c3: vucomiss xmm2, xmm3
0x1006c60c7: jbe 0x1006c6090
0x1006c60c9: jmp 0x1006c60df ; 0x1006c60df
0x1006c60cb: nop dword ptr [rax + rax]
0x1006c60d0: mov rdx, qword ptr [rcx - 8]
0x1006c60d4: add rcx, -8
0x1006c60d8: vucomiss xmm0, dword ptr [rdx + 0x10]
0x1006c60dd: jbe 0x1006c60d0
0x1006c60df: cmp r12, rcx
0x1006c60e2: jbe 0x1006c5fe0
0x1006c60e8: cmp r12, r15
0x1006c60eb: je 0x1006c614c
0x1006c60ed: mov rcx, qword ptr [r15]
0x1006c60f0: mov rdx, qword ptr [r12]
0x1006c60f4: mov rsi, qword ptr [r13]
0x1006c60f8: vmovss xmm0, dword ptr [rcx + 0x10]
0x1006c60fd: cmp byte ptr [rsi], 0
0x1006c6100: je 0x1006c61a1
0x1006c6106: mov rsi, qword ptr [r13 + 8]
0x1006c610a: vmovss xmm3, dword ptr [rsi + 0x1090]
0x1006c6112: vxorps xmm1, xmm1, xmm1
0x1006c6116: vucomiss xmm3, xmm0
0x1006c611a: vxorps xmm2, xmm2, xmm2
0x1006c611e: jbe 0x1006c6125
0x1006c6120: vmovss xmm2, dword ptr [rsi + 0x18]
0x1006c6125: vaddss xmm0, xmm0, xmm2
0x1006c6129: vmovss xmm2, dword ptr [rdx + 0x10]
0x1006c612e: vucomiss xmm3, xmm2
0x1006c6132: jbe 0x1006c6139
0x1006c6134: vmovss xmm1, dword ptr [rsi + 0x18]
0x1006c6139: vaddss xmm1, xmm2, xmm1
0x1006c613d: vucomiss xmm1, xmm0
0x1006c6141: jbe 0x1006c614c
0x1006c6143: mov qword ptr [r12], rcx
0x1006c6147: mov qword ptr [r15], rdx
0x1006c614a: inc eax
0x1006c614c: test eax, eax
0x1006c614e: jne 0x1006c6186
0x1006c6150: mov rdi, r14
0x1006c6153: mov rsi, r12
0x1006c6156: mov rdx, r13
0x1006c6159: call 0x1006c6b70 ; 0x1006c6b70
0x1006c615e: mov r15d, eax
0x1006c6161: lea rbx, [r12 + 8]
0x1006c6166: mov rdi, rbx
0x1006c6169: mov rsi, qword ptr [rbp - 0x38]
0x1006c616d: mov rdx, r13
0x1006c6170: call 0x1006c6b70 ; 0x1006c6b70
0x1006c6175: test al, al
0x1006c6177: jne 0x1006c63a1
0x1006c617d: test r15b, r15b
0x1006c6180: jne 0x1006c5da0
0x1006c6186: mov rax, r12
0x1006c6189: sub rax, r14
0x1006c618c: mov rcx, qword ptr [rbp - 0x38]
0x1006c6190: sub rcx, r12
0x1006c6193: cmp rax, rcx
0x1006c6196: jl 0x1006c5d89
0x1006c619c: jmp 0x1006c5d59 ; 0x1006c5d59
0x1006c61a1: vmovss xmm2, dword ptr [rdx + 0x10]
0x1006c61a6: vxorps xmm1, xmm1, xmm1
0x1006c61aa: vaddss xmm1, xmm2, xmm1
0x1006c61ae: vucomiss xmm1, xmm0
0x1006c61b2: ja 0x1006c6143
0x1006c61b4: jmp 0x1006c614c ; 0x1006c614c
0x1006c61b6: vmovss xmm2, dword ptr [rax + 0x10]
0x1006c61bb: vxorps xmm1, xmm1, xmm1
0x1006c61bf: vmovaps xmm3, xmm0
0x1006c61c3: vaddss xmm1, xmm2, xmm1
0x1006c61c7: lea rbx, [r14 + 8]
0x1006c61cb: vucomiss xmm1, xmm3
0x1006c61cf: ja 0x1006c6272
0x1006c61d5: cmp rbx, qword ptr [rbp - 0x30]
0x1006c61d9: je 0x1006c6560
0x1006c61df: test sil, sil
0x1006c61e2: je 0x1006c6233
0x1006c61e4: vmovss xmm1, dword ptr [rdx + 0x1090]
0x1006c61ec: lea rbx, [r14 + 0x10]
0x1006c61f0: vucomiss xmm1, xmm0
0x1006c61f4: mov rcx, qword ptr [rbx - 8]
0x1006c61f8: vxorps xmm2, xmm2, xmm2
0x1006c61fc: vxorps xmm3, xmm3, xmm3
0x1006c6200: jbe 0x1006c6207
0x1006c6202: vmovss xmm3, dword ptr [rdx + 0x18]
0x1006c6207: vaddss xmm3, xmm0, xmm3
0x1006c620b: vmovss xmm4, dword ptr [rcx + 0x10]
0x1006c6210: vucomiss xmm1, xmm4
0x1006c6214: jbe 0x1006c621b
0x1006c6216: vmovss xmm2, dword ptr [rdx + 0x18]
0x1006c621b: vaddss xmm2, xmm4, xmm2
0x1006c621f: vucomiss xmm2, xmm3
0x1006c6223: ja 0x1006c625d
0x1006c6225: add rbx, 8
0x1006c6229: cmp r12, rbx
0x1006c622c: jne 0x1006c61f0
0x1006c622e: jmp 0x1006c6560 ; 0x1006c6560
0x1006c6233: lea rbx, [r14 + 0x10]
0x1006c6237: nop word ptr [rax + rax]
0x1006c6240: mov rcx, qword ptr [rbx - 8]
0x1006c6244: vmovss xmm1, dword ptr [rcx + 0x10]
0x1006c6249: vucomiss xmm1, xmm0
0x1006c624d: ja 0x1006c625d
0x1006c624f: add rbx, 8
0x1006c6253: cmp r12, rbx
0x1006c6256: jne 0x1006c6240
0x1006c6258: jmp 0x1006c6560 ; 0x1006c6560
0x1006c625d: add rbx, -8
0x1006c6261: mov rcx, qword ptr [rbx]
0x1006c6264: mov qword ptr [rbx], rax
0x1006c6267: mov rax, qword ptr [rbp - 0x30]
0x1006c626b: mov qword ptr [rax], rcx
0x1006c626e: add rbx, 8
0x1006c6272: cmp rbx, qword ptr [rbp - 0x30]
0x1006c6276: je 0x1006c6560
0x1006c627c: mov rax, qword ptr [rbp - 0x30]
0x1006c6280: jmp 0x1006c62a0 ; 0x1006c62a0
0x1006c6282: nop word ptr cs:[rax + rax]
0x1006c6290: mov rcx, qword ptr [rbx]
0x1006c6293: mov rdx, qword ptr [rax]
0x1006c6296: mov qword ptr [rbx], rdx
0x1006c6299: mov qword ptr [rax], rcx
0x1006c629c: add rbx, 8
0x1006c62a0: mov rdx, qword ptr [r14]
0x1006c62a3: mov rsi, qword ptr [r13]
0x1006c62a7: mov rcx, qword ptr [r13 + 8]
0x1006c62ab: vmovss xmm0, dword ptr [rdx + 0x10]
0x1006c62b0: mov dl, byte ptr [rsi]
0x1006c62b2: test dl, dl
0x1006c62b4: je 0x1006c6310
0x1006c62b6: vmovss xmm1, dword ptr [rcx + 0x1090]
0x1006c62be: add rbx, -8
0x1006c62c2: nop word ptr cs:[rax + rax]
0x1006c62d0: vucomiss xmm1, xmm0
0x1006c62d4: mov rsi, qword ptr [rbx + 8]
0x1006c62d8: vxorps xmm2, xmm2, xmm2
0x1006c62dc: vxorps xmm3, xmm3, xmm3
0x1006c62e0: jbe 0x1006c62e7
0x1006c62e2: vmovss xmm3, dword ptr [rcx + 0x18]
0x1006c62e7: vaddss xmm3, xmm0, xmm3
0x1006c62eb: vmovss xmm4, dword ptr [rsi + 0x10]
0x1006c62f0: vucomiss xmm1, xmm4
0x1006c62f4: jbe 0x1006c62fb
0x1006c62f6: vmovss xmm2, dword ptr [rcx + 0x18]
0x1006c62fb: vaddss xmm2, xmm4, xmm2
0x1006c62ff: add rbx, 8
0x1006c6303: vucomiss xmm2, xmm3
0x1006c6307: jbe 0x1006c62d0
0x1006c6309: jmp 0x1006c6333 ; 0x1006c6333
0x1006c630b: nop dword ptr [rax + rax]
0x1006c6310: add rbx, -8
0x1006c6314: nop word ptr cs:[rax + rax]
0x1006c6320: mov rsi, qword ptr [rbx + 8]
0x1006c6324: add rbx, 8
0x1006c6328: vmovss xmm1, dword ptr [rsi + 0x10]
0x1006c632d: vucomiss xmm1, xmm0
0x1006c6331: jbe 0x1006c6320
0x1006c6333: test dl, dl
0x1006c6335: je 0x1006c6380
0x1006c6337: vmovss xmm1, dword ptr [rcx + 0x1090]
0x1006c633f: nop 
0x1006c6340: vucomiss xmm1, xmm0
0x1006c6344: mov rdx, qword ptr [rax - 8]
0x1006c6348: vxorps xmm2, xmm2, xmm2
0x1006c634c: vxorps xmm3, xmm3, xmm3
0x1006c6350: jbe 0x1006c6357
0x1006c6352: vmovss xmm3, dword ptr [rcx + 0x18]
0x1006c6357: vaddss xmm3, xmm0, xmm3
0x1006c635b: vmovss xmm4, dword ptr [rdx + 0x10]
0x1006c6360: vucomiss xmm1, xmm4
0x1006c6364: jbe 0x1006c636b
0x1006c6366: vmovss xmm2, dword ptr [rcx + 0x18]
0x1006c636b: add rax, -8
0x1006c636f: vaddss xmm2, xmm4, xmm2
0x1006c6373: vucomiss xmm2, xmm3
0x1006c6377: ja 0x1006c6340
0x1006c6379: jmp 0x1006c6393 ; 0x1006c6393
0x1006c637b: nop dword ptr [rax + rax]
0x1006c6380: mov rcx, qword ptr [rax - 8]
0x1006c6384: add rax, -8
0x1006c6388: vmovss xmm1, dword ptr [rcx + 0x10]
0x1006c638d: vucomiss xmm1, xmm0
0x1006c6391: ja 0x1006c6380
0x1006c6393: cmp rbx, rax
0x1006c6396: jb 0x1006c6290
0x1006c639c: jmp 0x1006c5da0 ; 0x1006c5da0
0x1006c63a1: mov rsi, r12
0x1006c63a4: test r15b, r15b
0x1006c63a7: je 0x1006c5d70
0x1006c63ad: jmp 0x1006c6560 ; 0x1006c6560
0x1006c63b2: lea rcx, [rip + 0x24b] ; 0x1006c6604
0x1006c63b9: movsxd rax, dword ptr [rcx + rax*4]
0x1006c63bd: add rax, rcx
0x1006c63c0: jmp rax
0x1006c63c2: mov rax, qword ptr [rbp - 0x30]
0x1006c63c6: mov rax, qword ptr [rax]
0x1006c63c9: mov rcx, qword ptr [r14]
0x1006c63cc: mov rdx, qword ptr [r13]
0x1006c63d0: vmovss xmm0, dword ptr [rax + 0x10]
0x1006c63d5: cmp byte ptr [rdx], 0
0x1006c63d8: je 0x1006c65de
0x1006c63de: mov rdx, qword ptr [r13 + 8]
0x1006c63e2: vmovss xmm3, dword ptr [rdx + 0x1090]
0x1006c63ea: vxorps xmm1, xmm1, xmm1
0x1006c63ee: vucomiss xmm3, xmm0
0x1006c63f2: vxorps xmm2, xmm2, xmm2
0x1006c63f6: jbe 0x1006c63fd
0x1006c63f8: vmovss xmm2, dword ptr [rdx + 0x18]
0x1006c63fd: vaddss xmm0, xmm0, xmm2
0x1006c6401: vmovss xmm2, dword ptr [rcx + 0x10]
0x1006c6406: vucomiss xmm3, xmm2
0x1006c640a: jbe 0x1006c65e7
0x1006c6410: vmovss xmm1, dword ptr [rdx + 0x18]
0x1006c6415: vaddss xmm1, xmm2, xmm1
0x1006c6419: vucomiss xmm1, xmm0
0x1006c641d: jbe 0x1006c6560
0x1006c6423: jmp 0x1006c65f5 ; 0x1006c65f5
0x1006c6428: lea rbx, [r14 + 0x10]
0x1006c642c: lea rsi, [r14 + 8]
0x1006c6430: mov rdi, r14
0x1006c6433: mov rdx, rbx
0x1006c6436: mov rcx, r13
0x1006c6439: call 0x1006c6620 ; 0x1006c6620
0x1006c643e: lea rcx, [r14 + 0x18]
0x1006c6442: cmp rcx, r12
0x1006c6445: je 0x1006c6560
0x1006c644b: mov eax, 0x10
0x1006c6450: mov rdx, qword ptr [rbx]
0x1006c6453: mov rbx, rcx
0x1006c6456: mov rcx, qword ptr [rbx]
0x1006c6459: mov rsi, qword ptr [r13]
0x1006c645d: vmovss xmm0, dword ptr [rcx + 0x10]
0x1006c6462: cmp byte ptr [rsi], 0
0x1006c6465: je 0x1006c64b0
0x1006c6467: mov rsi, qword ptr [r13 + 8]
0x1006c646b: vmovss xmm4, dword ptr [rsi + 0x1090]
0x1006c6473: vxorps xmm1, xmm1, xmm1
0x1006c6477: vucomiss xmm4, xmm0
0x1006c647b: vxorps xmm2, xmm2, xmm2
0x1006c647f: jbe 0x1006c6486
0x1006c6481: vmovss xmm2, dword ptr [rsi + 0x18]
0x1006c6486: vaddss xmm3, xmm0, xmm2
0x1006c648a: vmovss xmm2, dword ptr [rdx + 0x10]
0x1006c648f: vucomiss xmm4, xmm2
0x1006c6493: jbe 0x1006c649a
0x1006c6495: vmovss xmm1, dword ptr [rsi + 0x18]
0x1006c649a: vaddss xmm1, xmm2, xmm1
0x1006c649e: vucomiss xmm1, xmm3
0x1006c64a2: ja 0x1006c64cb
0x1006c64a4: jmp 0x1006c654f ; 0x1006c654f
0x1006c64a9: nop dword ptr [rax]
0x1006c64b0: vmovss xmm2, dword ptr [rdx + 0x10]
0x1006c64b5: vxorps xmm1, xmm1, xmm1
0x1006c64b9: vmovaps xmm3, xmm0
0x1006c64bd: vaddss xmm1, xmm2, xmm1
0x1006c64c1: vucomiss xmm1, xmm3
0x1006c64c5: jbe 0x1006c654f
0x1006c64cb: mov rsi, rax
0x1006c64ce: nop 
0x1006c64d0: mov rdx, rsi
0x1006c64d3: mov rsi, qword ptr [r14 + rdx]
0x1006c64d7: mov qword ptr [r14 + rdx + 8], rsi
0x1006c64dc: test rdx, rdx
0x1006c64df: je 0x1006c654b
0x1006c64e1: mov rsi, qword ptr [r14 + rdx - 8]
0x1006c64e6: mov rdi, qword ptr [r13]
0x1006c64ea: cmp byte ptr [rdi], 0
0x1006c64ed: je 0x1006c6530
0x1006c64ef: mov rdi, qword ptr [r13 + 8]
0x1006c64f3: vmovss xmm4, dword ptr [rdi + 0x1090]
0x1006c64fb: vxorps xmm1, xmm1, xmm1
0x1006c64ff: vucomiss xmm4, xmm0
0x1006c6503: vxorps xmm2, xmm2, xmm2
0x1006c6507: jbe 0x1006c650e
0x1006c6509: vmovss xmm2, dword ptr [rdi + 0x18]
0x1006c650e: vaddss xmm3, xmm0, xmm2
0x1006c6512: vmovss xmm2, dword ptr [rsi + 0x10]
0x1006c6517: vucomiss xmm4, xmm2
0x1006c651b: jbe 0x1006c653d
0x1006c651d: vmovss xmm1, dword ptr [rdi + 0x18]
0x1006c6522: jmp 0x1006c653d ; 0x1006c653d
0x1006c6524: nop word ptr cs:[rax + rax]
0x1006c6530: vmovss xmm2, dword ptr [rsi + 0x10]
0x1006c6535: vxorps xmm1, xmm1, xmm1
0x1006c6539: vmovaps xmm3, xmm0
0x1006c653d: vaddss xmm1, xmm2, xmm1
0x1006c6541: lea rsi, [rdx - 8]
0x1006c6545: vucomiss xmm1, xmm3
0x1006c6549: ja 0x1006c64d0
0x1006c654b: mov qword ptr [r14 + rdx], rcx
0x1006c654f: lea rcx, [rbx + 8]
0x1006c6553: add rax, 8
0x1006c6557: cmp rcx, r12
0x1006c655a: jne 0x1006c6450
0x1006c6560: add rsp, 0x18
0x1006c6564: pop rbx
0x1006c6565: pop r12
0x1006c6567: pop r13
0x1006c6569: pop r14
0x1006c656b: pop r15
0x1006c656d: pop rbp
0x1006c656e: ret 
0x1006c656f: lea rsi, [r14 + 8]
0x1006c6573: mov rdi, r14
0x1006c6576: mov rdx, qword ptr [rbp - 0x30]
0x1006c657a: mov rcx, r13
0x1006c657d: add rsp, 0x18
0x1006c6581: pop rbx
0x1006c6582: pop r12
0x1006c6584: pop r13
0x1006c6586: pop r14
0x1006c6588: pop r15
0x1006c658a: pop rbp
0x1006c658b: jmp 0x1006c6620 ; 0x1006c6620
0x1006c6590: lea rsi, [r14 + 8]
0x1006c6594: lea rdx, [r14 + 0x10]
0x1006c6598: mov rdi, r14
0x1006c659b: mov rcx, qword ptr [rbp - 0x30]
0x1006c659f: mov r8, r13
0x1006c65a2: add rsp, 0x18
0x1006c65a6: pop rbx
0x1006c65a7: pop r12
0x1006c65a9: pop r13
0x1006c65ab: pop r14
0x1006c65ad: pop r15
0x1006c65af: pop rbp
0x1006c65b0: jmp 0x1006c67c0 ; 0x1006c67c0
0x1006c65b5: lea rdx, [r14 + 0x10]
0x1006c65b9: lea rcx, [r14 + 0x18]
0x1006c65bd: lea rsi, [r14 + 8]
0x1006c65c1: mov rdi, r14
0x1006c65c4: mov r8, qword ptr [rbp - 0x30]
0x1006c65c8: mov r9, r13
0x1006c65cb: add rsp, 0x18
0x1006c65cf: pop rbx
0x1006c65d0: pop r12
0x1006c65d2: pop r13
0x1006c65d4: pop r14
0x1006c65d6: pop r15
0x1006c65d8: pop rbp
0x1006c65d9: jmp 0x1006c6950 ; 0x1006c6950
0x1006c65de: vmovss xmm2, dword ptr [rcx + 0x10]
0x1006c65e3: vxorps xmm1, xmm1, xmm1
0x1006c65e7: vaddss xmm1, xmm2, xmm1
0x1006c65eb: vucomiss xmm1, xmm0
0x1006c65ef: jbe 0x1006c6560
0x1006c65f5: mov qword ptr [r14], rax
0x1006c65f8: mov rax, qword ptr [rbp - 0x30]
0x1006c65fc: mov qword ptr [rax], rcx
0x1006c65ff: jmp 0x1006c6560 ; 0x1006c6560
