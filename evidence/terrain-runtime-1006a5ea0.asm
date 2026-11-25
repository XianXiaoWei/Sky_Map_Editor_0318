0x1006a5ea0: push rbp
0x1006a5ea1: mov rbp, rsp
0x1006a5ea4: push r15
0x1006a5ea6: push r14
0x1006a5ea8: push r13
0x1006a5eaa: push r12
0x1006a5eac: push rbx
0x1006a5ead: sub rsp, 0xe8
0x1006a5eb4: mov dword ptr [rbp - 0x74], r9d
0x1006a5eb8: mov r15d, r8d
0x1006a5ebb: mov dword ptr [rbp - 0x78], ecx
0x1006a5ebe: mov r13, rdx
0x1006a5ec1: mov rbx, rsi
0x1006a5ec4: mov r14, rdi
0x1006a5ec7: mov rax, qword ptr [rip + 0x567a0a] ; 0x100c0d8d8
0x1006a5ece: mov rax, qword ptr [rax]
0x1006a5ed1: mov qword ptr [rbp - 0x30], rax
0x1006a5ed5: call 0x1002b9810 ; 0x1002b9810
0x1006a5eda: mov qword ptr [rbp - 0xc8], rax
0x1006a5ee1: lea rax, [rip + 0x1999728] ; 0x10203f610
0x1006a5ee8: vmovaps xmm0, xmmword ptr [rax]
0x1006a5eec: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x1006a5ef1: lea rax, [rip + 0x1999728] ; 0x10203f620
0x1006a5ef8: vmovaps xmm0, xmmword ptr [rax]
0x1006a5efc: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1006a5f01: lea rax, [rip + 0x1999728] ; 0x10203f630
0x1006a5f08: vmovaps xmm0, xmmword ptr [rax]
0x1006a5f0c: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1006a5f11: lea rax, [rip + 0x19997c8] ; 0x10203f6e0
0x1006a5f18: vmovaps xmm0, xmmword ptr [rax]
0x1006a5f1c: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1006a5f21: mov dword ptr [rbp - 0x7c], r15d
0x1006a5f25: test r15d, r15d
0x1006a5f28: je 0x1006a6488
0x1006a5f2e: mov r12, qword ptr [rbp + 0x18]
0x1006a5f32: movsx rax, word ptr [rbp - 0x74]
0x1006a5f37: mov rcx, rax
0x1006a5f3a: mov qword ptr [rbp - 0xb8], rcx
0x1006a5f41: shl rax, 4
0x1006a5f45: lea rax, [rbp + rax - 0x70]
0x1006a5f4a: mov qword ptr [rbp - 0xc0], rax
0x1006a5f51: xor r15d, r15d
0x1006a5f54: jmp 0x1006a5f80 ; 0x1006a5f80
0x1006a5f56: nop word ptr cs:[rax + rax]
0x1006a5f60: vmovss xmm5, dword ptr [rip + 0x3ff158] ; 0x100aa50c0
0x1006a5f68: test r12, r12
0x1006a5f6b: jne 0x1006a6360
0x1006a5f71: jmp 0x1006a6411 ; 0x1006a6411
0x1006a5f76: nop word ptr cs:[rax + rax]
0x1006a5f80: movzx eax, word ptr [r14 + r15*2]
0x1006a5f85: mov esi, dword ptr [rbp - 0x78]
0x1006a5f88: imul eax, esi
0x1006a5f8b: movzx ecx, word ptr [r14 + r15*2 + 2]
0x1006a5f91: imul ecx, esi
0x1006a5f94: movzx edx, word ptr [r14 + r15*2 + 4]
0x1006a5f9a: imul edx, esi
0x1006a5f9d: vmovsd xmm0, qword ptr [rbx + rax]
0x1006a5fa2: vinsertps xmm2, xmm0, dword ptr [rbx + rax + 8], 0x20
0x1006a5faa: vmovaps xmmword ptr [rbp - 0xb0], xmm2
0x1006a5fb2: vmovsd xmm0, qword ptr [rbx + rcx]
0x1006a5fb7: vinsertps xmm15, xmm0, dword ptr [rbx + rcx + 8], 0x20
0x1006a5fbf: vmovaps xmmword ptr [rbp - 0xa0], xmm15
0x1006a5fc7: vmovsd xmm0, qword ptr [rbx + rdx]
0x1006a5fcc: vinsertps xmm14, xmm0, dword ptr [rbx + rdx + 8], 0x20
0x1006a5fd4: vmovaps xmmword ptr [rbp - 0x90], xmm14
0x1006a5fdc: test r13, r13
0x1006a5fdf: je 0x1006a5f60
0x1006a5fe5: movsx r8d, word ptr [rbp - 0x74]
0x1006a5fea: movsx esi, byte ptr [r13 + rax]
0x1006a5ff0: movsx edi, byte ptr [r13 + rax + 1]
0x1006a5ff6: add edi, esi
0x1006a5ff8: movsx esi, byte ptr [r13 + rcx]
0x1006a5ffe: movsx r9d, byte ptr [r13 + rcx + 1]
0x1006a6004: add r9d, esi
0x1006a6007: movsx esi, byte ptr [r13 + rdx]
0x1006a600d: movsx r10d, byte ptr [r13 + rdx + 1]
0x1006a6013: add r10d, esi
0x1006a6016: vcvtsi2ss xmm3, xmm8, edi
0x1006a601a: vmovss xmm1, dword ptr [rip + 0x4026ba] ; 0x100aa86dc
0x1006a6022: vmovaps xmm11, xmm1
0x1006a6026: vmulss xmm8, xmm3, xmm11
0x1006a602b: movsx esi, byte ptr [rbx + rax + 0xc]
0x1006a6030: vcvtsi2ss xmm3, xmm9, esi
0x1006a6034: movsx esi, byte ptr [rbx + rax + 0xd]
0x1006a6039: vcvtsi2ss xmm4, xmm9, esi
0x1006a603d: movsx esi, byte ptr [rbx + rax + 0xe]
0x1006a6042: vcvtsi2ss xmm5, xmm9, esi
0x1006a6046: vinsertps xmm3, xmm3, xmm4, 0x10
0x1006a604c: vinsertps xmm3, xmm3, xmm5, 0x20
0x1006a6052: vmovaps xmm0, xmmword ptr [rbp - 0x100]
0x1006a605a: vblendps xmm0, xmm3, xmm0, 8
0x1006a6060: vmovaps xmmword ptr [rbp - 0x100], xmm0
0x1006a6068: vmulps xmm4, xmm0, xmm0
0x1006a606c: vmovshdup xmm5, xmm4
0x1006a6070: vaddss xmm5, xmm4, xmm5
0x1006a6074: vpermilpd xmm4, xmm4, 1
0x1006a607a: vaddss xmm4, xmm4, xmm5
0x1006a607e: vrsqrtss xmm5, xmm4, xmm4
0x1006a6082: vmovss xmm7, dword ptr [rip + 0x3fe52e] ; 0x100aa45b8
0x1006a608a: vmulss xmm6, xmm4, xmm7
0x1006a608e: vxorps xmm12, xmm12, xmm12
0x1006a6093: vcmpeqss xmm4, xmm4, xmm12
0x1006a6099: vandnps xmm6, xmm4, xmm6
0x1006a609d: vmovss xmm1, dword ptr [rip + 0x402583] ; 0x100aa8628
0x1006a60a5: vandps xmm4, xmm4, xmm1
0x1006a60a9: vorps xmm4, xmm6, xmm4
0x1006a60ad: vmulss xmm4, xmm5, xmm4
0x1006a60b1: vmulss xmm4, xmm5, xmm4
0x1006a60b5: vmovss xmm0, dword ptr [rip + 0x40172f] ; 0x100aa77ec
0x1006a60bd: vsubss xmm4, xmm0, xmm4
0x1006a60c1: vmulss xmm4, xmm5, xmm4
0x1006a60c5: vpermilps xmm4, xmm4, 0xc0
0x1006a60cb: vmulps xmm9, xmm3, xmm4
0x1006a60cf: movsx esi, byte ptr [rbx + rcx + 0xc]
0x1006a60d4: vcvtsi2ss xmm3, xmm10, esi
0x1006a60d8: movsx esi, byte ptr [rbx + rcx + 0xd]
0x1006a60dd: vcvtsi2ss xmm4, xmm10, esi
0x1006a60e1: movsx esi, byte ptr [rbx + rcx + 0xe]
0x1006a60e6: vcvtsi2ss xmm5, xmm10, esi
0x1006a60ea: vinsertps xmm3, xmm3, xmm4, 0x10
0x1006a60f0: vinsertps xmm3, xmm3, xmm5, 0x20
0x1006a60f6: vmovaps xmm4, xmmword ptr [rbp - 0xf0]
0x1006a60fe: vblendps xmm4, xmm3, xmm4, 8
0x1006a6104: vmovaps xmmword ptr [rbp - 0xf0], xmm4
0x1006a610c: vmulps xmm4, xmm4, xmm4
0x1006a6110: vmovshdup xmm5, xmm4
0x1006a6114: vaddss xmm5, xmm4, xmm5
0x1006a6118: vpermilpd xmm4, xmm4, 1
0x1006a611e: vaddss xmm4, xmm4, xmm5
0x1006a6122: vrsqrtss xmm5, xmm4, xmm4
0x1006a6126: vmulss xmm6, xmm4, xmm7
0x1006a612a: vcmpeqss xmm4, xmm4, xmm12
0x1006a6130: vandnps xmm6, xmm4, xmm6
0x1006a6134: vandps xmm4, xmm4, xmm1
0x1006a6138: vorps xmm4, xmm6, xmm4
0x1006a613c: vmulss xmm4, xmm5, xmm4
0x1006a6140: vmulss xmm4, xmm5, xmm4
0x1006a6144: vsubss xmm4, xmm0, xmm4
0x1006a6148: vmulss xmm4, xmm5, xmm4
0x1006a614c: vpermilps xmm4, xmm4, 0xc0
0x1006a6152: vmulps xmm10, xmm3, xmm4
0x1006a6156: movsx esi, byte ptr [rbx + rdx + 0xc]
0x1006a615b: vcvtsi2ss xmm3, xmm13, esi
0x1006a615f: movsx esi, byte ptr [rbx + rdx + 0xd]
0x1006a6164: vcvtsi2ss xmm4, xmm13, esi
0x1006a6168: movsx esi, byte ptr [rbx + rdx + 0xe]
0x1006a616d: vcvtsi2ss xmm5, xmm13, esi
0x1006a6171: vinsertps xmm3, xmm3, xmm4, 0x10
0x1006a6177: vinsertps xmm5, xmm3, xmm5, 0x20
0x1006a617d: vmovaps xmm3, xmmword ptr [rbp - 0xe0]
0x1006a6185: vblendps xmm3, xmm5, xmm3, 8
0x1006a618b: vmovaps xmmword ptr [rbp - 0xe0], xmm3
0x1006a6193: vmulps xmm3, xmm3, xmm3
0x1006a6197: vmovshdup xmm4, xmm3
0x1006a619b: vaddss xmm4, xmm3, xmm4
0x1006a619f: vpermilpd xmm3, xmm3, 1
0x1006a61a5: vaddss xmm3, xmm3, xmm4
0x1006a61a9: vmulss xmm4, xmm3, xmm7
0x1006a61ad: vcmpeqss xmm7, xmm3, xmm12
0x1006a61b3: vandnps xmm4, xmm7, xmm4
0x1006a61b7: vandps xmm7, xmm7, xmm1
0x1006a61bb: vorps xmm7, xmm4, xmm7
0x1006a61bf: vcvtsi2ss xmm4, xmm13, r9d
0x1006a61c4: vmulss xmm13, xmm4, xmm11
0x1006a61c9: vrsqrtss xmm3, xmm3, xmm3
0x1006a61cd: vmulss xmm7, xmm3, xmm7
0x1006a61d1: vmulss xmm7, xmm3, xmm7
0x1006a61d5: vsubss xmm7, xmm0, xmm7
0x1006a61d9: vmulss xmm7, xmm3, xmm7
0x1006a61dd: vcvtsi2ss xmm3, xmm2, r10d
0x1006a61e2: vmulss xmm12, xmm3, xmm11
0x1006a61e7: vpermilps xmm7, xmm7, 0xc0
0x1006a61ed: vmulps xmm11, xmm5, xmm7
0x1006a61f1: vmovaps xmm5, xmmword ptr [rip + 0x401467] ; 0x100aa7660
0x1006a61f9: cmp r8d, 2
0x1006a61fd: jg 0x1006a62b5
0x1006a6203: movsx edx, byte ptr [r13 + rdx + 3]
0x1006a6209: vcvtsi2ss xmm5, xmm2, edx
0x1006a620d: movsx ecx, byte ptr [r13 + rcx + 3]
0x1006a6213: vcvtsi2ss xmm6, xmm2, ecx
0x1006a6217: movsx eax, byte ptr [r13 + rax + 3]
0x1006a621d: vcvtsi2ss xmm7, xmm2, eax
0x1006a6221: mov rax, qword ptr [rbp + 0x20]
0x1006a6225: vsubps xmm3, xmm2, xmmword ptr [rax]
0x1006a6229: vmulps xmm3, xmm3, xmm3
0x1006a622d: vmovshdup xmm4, xmm3
0x1006a6231: vaddss xmm4, xmm3, xmm4
0x1006a6235: vpermilpd xmm3, xmm3, 1
0x1006a623b: vaddss xmm3, xmm3, xmm4
0x1006a623f: vsqrtss xmm3, xmm3, xmm3
0x1006a6243: mov rax, qword ptr [rbp + 0x10]
0x1006a6247: mov rcx, qword ptr [rbp - 0xb8]
0x1006a624e: vmovss xmm4, dword ptr [rax + rcx*4]
0x1006a6253: vinsertps xmm4, xmm4, xmm7, 0x10
0x1006a6259: vinsertps xmm4, xmm4, xmm6, 0x20
0x1006a625f: vinsertps xmm4, xmm4, xmm5, 0x30
0x1006a6265: vpermilps xmm3, xmm3, 0
0x1006a626b: vsubps xmm3, xmm4, xmm3
0x1006a626f: vbroadcastss xmm4, dword ptr [rax + 0xc]
0x1006a6275: vdivps xmm3, xmm3, xmm4
0x1006a6279: vxorps xmm0, xmm0, xmm0
0x1006a627d: vmaxps xmm3, xmm0, xmm3
0x1006a6281: vmovaps xmm0, xmmword ptr [rip + 0x4013d7] ; 0x100aa7660
0x1006a6289: vminps xmm3, xmm0, xmm3
0x1006a628d: vmulps xmm4, xmm3, xmm3
0x1006a6291: vmulps xmm4, xmm3, xmm4
0x1006a6295: vmulps xmm5, xmm3, xmmword ptr [rip + 0x430d53] ; 0x100ad6ff0
0x1006a629d: vaddps xmm5, xmm5, xmmword ptr [rip + 0x430d5b] ; 0x100ad7000
0x1006a62a5: vmulps xmm3, xmm3, xmm5
0x1006a62a9: vaddps xmm3, xmm3, xmmword ptr [rip + 0x4143df] ; 0x100aba690
0x1006a62b1: vmulps xmm5, xmm4, xmm3
0x1006a62b5: vmovss xmm3, dword ptr [rip + 0x65c7e3] ; 0x100d02aa0
0x1006a62bd: vmovshdup xmm4, xmm5
0x1006a62c1: vmulss xmm4, xmm4, xmm3
0x1006a62c5: vmovss xmm0, dword ptr [rip + 0x3fedf3] ; 0x100aa50c0
0x1006a62cd: vsubss xmm6, xmm0, xmm4
0x1006a62d1: vxorps xmm1, xmm1, xmm1
0x1006a62d5: vmulss xmm6, xmm6, xmm1
0x1006a62d9: vmulss xmm4, xmm8, xmm4
0x1006a62dd: vaddss xmm4, xmm4, xmm6
0x1006a62e1: vpermilps xmm4, xmm4, 0xc0
0x1006a62e7: vmulps xmm4, xmm9, xmm4
0x1006a62eb: vaddps xmm2, xmm2, xmm4
0x1006a62ef: vmovaps xmmword ptr [rbp - 0xb0], xmm2
0x1006a62f7: vpermilpd xmm4, xmm5, 1
0x1006a62fd: vmulss xmm4, xmm4, xmm3
0x1006a6301: vsubss xmm6, xmm0, xmm4
0x1006a6305: vmulss xmm6, xmm6, xmm1
0x1006a6309: vmulss xmm4, xmm13, xmm4
0x1006a630d: vaddss xmm4, xmm4, xmm6
0x1006a6311: vpermilps xmm4, xmm4, 0xc0
0x1006a6317: vmulps xmm4, xmm10, xmm4
0x1006a631b: vaddps xmm15, xmm15, xmm4
0x1006a631f: vmovaps xmmword ptr [rbp - 0xa0], xmm15
0x1006a6327: vpermilps xmm4, xmm5, 0xe7
0x1006a632d: vmulss xmm3, xmm4, xmm3
0x1006a6331: vsubss xmm4, xmm0, xmm3
0x1006a6335: vmulss xmm4, xmm4, xmm1
0x1006a6339: vmulss xmm3, xmm12, xmm3
0x1006a633d: vaddss xmm3, xmm3, xmm4
0x1006a6341: vpermilps xmm3, xmm3, 0xc0
0x1006a6347: vmulps xmm3, xmm11, xmm3
0x1006a634b: vaddps xmm14, xmm14, xmm3
0x1006a634f: vmovaps xmmword ptr [rbp - 0x90], xmm14
0x1006a6357: test r12, r12
0x1006a635a: je 0x1006a6411
0x1006a6360: vmovaps xmm3, xmmword ptr [r12]
0x1006a6366: vmovaps xmm4, xmmword ptr [r12 + 0x10]
0x1006a636d: vmovaps xmm6, xmmword ptr [r12 + 0x20]
0x1006a6374: vmovaps xmm7, xmmword ptr [r12 + 0x30]
0x1006a637b: vpermilps xmm0, xmm2, 0
0x1006a6381: vmulps xmm0, xmm0, xmm3
0x1006a6385: vpermilps xmm1, xmm2, 0x55
0x1006a638b: vmulps xmm1, xmm1, xmm4
0x1006a638f: vaddps xmm0, xmm0, xmm1
0x1006a6393: vpermilps xmm1, xmm2, 0xaa
0x1006a6399: vmulps xmm1, xmm1, xmm6
0x1006a639d: vaddps xmm0, xmm0, xmm1
0x1006a63a1: vaddps xmm0, xmm7, xmm0
0x1006a63a5: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x1006a63ad: vpermilps xmm0, xmm15, 0
0x1006a63b3: vmulps xmm0, xmm3, xmm0
0x1006a63b7: vpermilps xmm1, xmm15, 0x55
0x1006a63bd: vmulps xmm1, xmm4, xmm1
0x1006a63c1: vaddps xmm0, xmm0, xmm1
0x1006a63c5: vpermilps xmm1, xmm15, 0xaa
0x1006a63cb: vmulps xmm1, xmm6, xmm1
0x1006a63cf: vaddps xmm0, xmm1, xmm0
0x1006a63d3: vaddps xmm0, xmm7, xmm0
0x1006a63d7: vmovaps xmmword ptr [rbp - 0xa0], xmm0
0x1006a63df: vpermilps xmm0, xmm14, 0
0x1006a63e5: vmulps xmm0, xmm3, xmm0
0x1006a63e9: vpermilps xmm1, xmm14, 0x55
0x1006a63ef: vmulps xmm1, xmm4, xmm1
0x1006a63f3: vaddps xmm0, xmm0, xmm1
0x1006a63f7: vpermilps xmm1, xmm14, 0xaa
0x1006a63fd: vmulps xmm1, xmm6, xmm1
0x1006a6401: vaddps xmm0, xmm1, xmm0
0x1006a6405: vaddps xmm0, xmm7, xmm0
0x1006a6409: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x1006a6411: vxorps xmm0, xmm0, xmm0
0x1006a6415: vmaxss xmm0, xmm0, xmm5
0x1006a6419: vmovss xmm1, dword ptr [rip + 0x3fec9f] ; 0x100aa50c0
0x1006a6421: vminss xmm0, xmm1, xmm0
0x1006a6425: mov rax, qword ptr [rbp - 0xc0]
0x1006a642c: vmovaps xmm1, xmmword ptr [rax]
0x1006a6430: vmovaps xmm2, xmmword ptr [rax + 0x10]
0x1006a6435: vsubps xmm1, xmm1, xmm2
0x1006a6439: vpermilps xmm0, xmm0, 0
0x1006a643f: vmulps xmm0, xmm0, xmm1
0x1006a6443: vaddps xmm0, xmm2, xmm0
0x1006a6447: vmovaps xmmword ptr [rbp - 0x110], xmm0
0x1006a644f: xor r9d, r9d
0x1006a6452: mov rdi, qword ptr [rbp - 0xc8]
0x1006a6459: lea rsi, [rbp - 0xb0]
0x1006a6460: lea rdx, [rbp - 0xa0]
0x1006a6467: lea rcx, [rbp - 0x90]
0x1006a646e: lea r8, [rbp - 0x110]
0x1006a6475: call 0x1002bd1b0 ; 0x1002bd1b0
0x1006a647a: add r15, 3
0x1006a647e: cmp r15d, dword ptr [rbp - 0x7c]
0x1006a6482: jb 0x1006a5f80
0x1006a6488: mov rax, qword ptr [rip + 0x567449] ; 0x100c0d8d8
0x1006a648f: mov rax, qword ptr [rax]
0x1006a6492: cmp rax, qword ptr [rbp - 0x30]
0x1006a6496: jne 0x1006a64aa
0x1006a6498: add rsp, 0xe8
0x1006a649f: pop rbx
0x1006a64a0: pop r12
0x1006a64a2: pop r13
0x1006a64a4: pop r14
0x1006a64a6: pop r15
0x1006a64a8: pop rbp
0x1006a64a9: ret 
0x1006a64aa: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1006a64af: nop 
