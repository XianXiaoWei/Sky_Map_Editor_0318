0x10009ad60: push rbp
0x10009ad61: mov rbp, rsp
0x10009ad64: mov rax, qword ptr [rdi + 0x6018]
0x10009ad6b: mov r10d, dword ptr [rax + 0x54]
0x10009ad6f: mov r8d, r10d
0x10009ad72: and r8d, 0xfffffffc
0x10009ad76: je 0x10009b25a
0x10009ad7c: vpermilps xmm13, xmm0, 0
0x10009ad82: mov r9d, r8d
0x10009ad85: lea rdi, [rsi + 0xb8]
0x10009ad8c: lea rax, [rdx + 0xb8]
0x10009ad93: xor r11d, r11d
0x10009ad96: vmovaps xmm12, xmmword ptr [rip + 0xa0e922] ; 0x100aa96c0
0x10009ad9e: nop 
0x10009ada0: vmulps xmm11, xmm13, xmmword ptr [rcx + r11*4]
0x10009ada6: vmovss xmm2, dword ptr [rdi - 0xb8]
0x10009adae: vmovss xmm3, dword ptr [rdi - 0xb4]
0x10009adb6: vinsertps xmm2, xmm2, dword ptr [rdi - 0x88], 0x10
0x10009adc0: vinsertps xmm2, xmm2, dword ptr [rdi - 0x58], 0x20
0x10009adc7: vinsertps xmm3, xmm3, dword ptr [rdi - 0x84], 0x10
0x10009add1: vinsertps xmm3, xmm3, dword ptr [rdi - 0x54], 0x20
0x10009add8: vmovss xmm4, dword ptr [rdi - 0xb0]
0x10009ade0: vinsertps xmm14, xmm2, dword ptr [rdi - 0x28], 0x30
0x10009ade7: vinsertps xmm2, xmm4, dword ptr [rdi - 0x80], 0x10
0x10009adee: vinsertps xmm2, xmm2, dword ptr [rdi - 0x50], 0x20
0x10009adf5: vmovss xmm4, dword ptr [rax - 0xb8]
0x10009adfd: vinsertps xmm15, xmm3, dword ptr [rdi - 0x24], 0x30
0x10009ae04: vmovss xmm6, dword ptr [rax - 0xb4]
0x10009ae0c: vinsertps xmm4, xmm4, dword ptr [rax - 0x88], 0x10
0x10009ae16: vinsertps xmm4, xmm4, dword ptr [rax - 0x58], 0x20
0x10009ae1d: vinsertps xmm1, xmm2, dword ptr [rdi - 0x20], 0x30
0x10009ae24: vinsertps xmm4, xmm4, dword ptr [rax - 0x28], 0x30
0x10009ae2b: vinsertps xmm2, xmm6, dword ptr [rax - 0x84], 0x10
0x10009ae35: vinsertps xmm2, xmm2, dword ptr [rax - 0x54], 0x20
0x10009ae3c: vinsertps xmm6, xmm2, dword ptr [rax - 0x24], 0x30
0x10009ae43: vmovss xmm2, dword ptr [rax - 0xb0]
0x10009ae4b: vinsertps xmm2, xmm2, dword ptr [rax - 0x80], 0x10
0x10009ae52: vinsertps xmm5, xmm2, dword ptr [rax - 0x50], 0x20
0x10009ae59: vmovaps xmm2, xmmword ptr [rip + 0xa0c7ff] ; 0x100aa7660
0x10009ae61: vsubps xmm2, xmm2, xmm11
0x10009ae66: vinsertps xmm5, xmm5, dword ptr [rax - 0x20], 0x30
0x10009ae6d: vmulps xmm4, xmm2, xmm4
0x10009ae71: vmulps xmm3, xmm11, xmm14
0x10009ae76: vaddps xmm3, xmm3, xmm4
0x10009ae7a: vmulps xmm4, xmm2, xmm6
0x10009ae7e: vmulps xmm6, xmm11, xmm15
0x10009ae83: vmulps xmm5, xmm2, xmm5
0x10009ae87: vaddps xmm4, xmm6, xmm4
0x10009ae8b: vmulps xmm1, xmm11, xmm1
0x10009ae8f: vaddps xmm1, xmm1, xmm5
0x10009ae93: vextractps dword ptr [rax - 0xb8], xmm3, 0
0x10009ae9d: vextractps dword ptr [rax - 0xb4], xmm4, 0
0x10009aea7: vextractps dword ptr [rax - 0xb0], xmm1, 0
0x10009aeb1: vextractps dword ptr [rax - 0x88], xmm3, 1
0x10009aebb: vextractps dword ptr [rax - 0x84], xmm4, 1
0x10009aec5: vextractps dword ptr [rax - 0x80], xmm1, 1
0x10009aecc: vextractps dword ptr [rax - 0x58], xmm3, 2
0x10009aed3: vextractps dword ptr [rax - 0x54], xmm4, 2
0x10009aeda: vextractps dword ptr [rax - 0x50], xmm1, 2
0x10009aee1: vextractps dword ptr [rax - 0x28], xmm3, 3
0x10009aee8: vextractps dword ptr [rax - 0x24], xmm4, 3
0x10009aeef: vextractps dword ptr [rax - 0x20], xmm1, 3
0x10009aef6: vmovss xmm1, dword ptr [rdi - 0x98]
0x10009aefe: vmovss xmm3, dword ptr [rdi - 0x94]
0x10009af06: vinsertps xmm1, xmm1, dword ptr [rdi - 0x68], 0x10
0x10009af0d: vmovss xmm14, dword ptr [rdi - 8]
0x10009af12: vinsertps xmm3, xmm3, dword ptr [rdi - 0x64], 0x10
0x10009af19: vinsertps xmm1, xmm1, dword ptr [rdi - 0x38], 0x20
0x10009af20: vmovss xmm15, dword ptr [rdi - 4]
0x10009af25: vmovss xmm6, dword ptr [rdi - 0x90]
0x10009af2d: vinsertps xmm6, xmm6, dword ptr [rdi - 0x60], 0x10
0x10009af34: vinsertps xmm3, xmm3, dword ptr [rdi - 0x34], 0x20
0x10009af3b: vmovss xmm9, dword ptr [rdi]
0x10009af3f: vmovss xmm5, dword ptr [rax - 0x98]
0x10009af47: vmovss xmm8, dword ptr [rax - 0x94]
0x10009af4f: vinsertps xmm10, xmm6, dword ptr [rdi - 0x30], 0x20
0x10009af56: vinsertps xmm5, xmm5, dword ptr [rax - 0x68], 0x10
0x10009af5d: vinsertps xmm5, xmm5, dword ptr [rax - 0x38], 0x20
0x10009af64: vinsertps xmm5, xmm5, dword ptr [rax - 8], 0x30
0x10009af6b: vinsertps xmm14, xmm1, xmm14, 0x30
0x10009af71: vinsertps xmm4, xmm8, dword ptr [rax - 0x64], 0x10
0x10009af78: vinsertps xmm4, xmm4, dword ptr [rax - 0x34], 0x20
0x10009af7f: vinsertps xmm4, xmm4, dword ptr [rax - 4], 0x30
0x10009af86: vinsertps xmm3, xmm3, xmm15, 0x30
0x10009af8c: vmovss xmm6, dword ptr [rax - 0x90]
0x10009af94: vinsertps xmm6, xmm6, dword ptr [rax - 0x60], 0x10
0x10009af9b: vinsertps xmm6, xmm6, dword ptr [rax - 0x30], 0x20
0x10009afa2: vinsertps xmm1, xmm10, xmm9, 0x30
0x10009afa8: vinsertps xmm6, xmm6, dword ptr [rax], 0x30
0x10009afae: vmulps xmm5, xmm2, xmm5
0x10009afb2: vmulps xmm7, xmm11, xmm14
0x10009afb7: vaddps xmm5, xmm7, xmm5
0x10009afbb: vmulps xmm4, xmm2, xmm4
0x10009afbf: vmulps xmm3, xmm11, xmm3
0x10009afc3: vmulps xmm6, xmm2, xmm6
0x10009afc7: vaddps xmm3, xmm3, xmm4
0x10009afcb: vmulps xmm1, xmm11, xmm1
0x10009afcf: vaddps xmm1, xmm1, xmm6
0x10009afd3: vextractps dword ptr [rax - 0x98], xmm5, 0
0x10009afdd: vextractps dword ptr [rax - 0x94], xmm3, 0
0x10009afe7: vextractps dword ptr [rax - 0x90], xmm1, 0
0x10009aff1: vextractps dword ptr [rax - 0x68], xmm5, 1
0x10009aff8: vextractps dword ptr [rax - 0x64], xmm3, 1
0x10009afff: vextractps dword ptr [rax - 0x60], xmm1, 1
0x10009b006: vextractps dword ptr [rax - 0x38], xmm5, 2
0x10009b00d: vextractps dword ptr [rax - 0x34], xmm3, 2
0x10009b014: vextractps dword ptr [rax - 0x30], xmm1, 2
0x10009b01b: vextractps dword ptr [rax - 8], xmm5, 3
0x10009b022: vextractps dword ptr [rax - 4], xmm3, 3
0x10009b029: vextractps dword ptr [rax], xmm1, 3
0x10009b02f: vmovss xmm1, dword ptr [rdi - 0xa8]
0x10009b037: vmovss xmm4, dword ptr [rdi - 0xa4]
0x10009b03f: vinsertps xmm1, xmm1, dword ptr [rdi - 0x78], 0x10
0x10009b046: vinsertps xmm1, xmm1, dword ptr [rdi - 0x48], 0x20
0x10009b04d: vinsertps xmm8, xmm1, dword ptr [rdi - 0x18], 0x30
0x10009b054: vinsertps xmm1, xmm4, dword ptr [rdi - 0x74], 0x10
0x10009b05b: vinsertps xmm1, xmm1, dword ptr [rdi - 0x44], 0x20
0x10009b062: vmovss xmm4, dword ptr [rdi - 0xa0]
0x10009b06a: vinsertps xmm10, xmm1, dword ptr [rdi - 0x14], 0x30
0x10009b071: vinsertps xmm1, xmm4, dword ptr [rdi - 0x70], 0x10
0x10009b078: vinsertps xmm1, xmm1, dword ptr [rdi - 0x40], 0x20
0x10009b07f: vmovss xmm6, dword ptr [rdi - 0x9c]
0x10009b087: vinsertps xmm9, xmm1, dword ptr [rdi - 0x10], 0x30
0x10009b08e: vinsertps xmm1, xmm6, dword ptr [rdi - 0x6c], 0x10
0x10009b095: vinsertps xmm1, xmm1, dword ptr [rdi - 0x3c], 0x20
0x10009b09c: vmovss xmm7, dword ptr [rax - 0xa8]
0x10009b0a4: vinsertps xmm14, xmm1, dword ptr [rdi - 0xc], 0x30
0x10009b0ab: vmovss xmm1, dword ptr [rax - 0xa4]
0x10009b0b3: vinsertps xmm7, xmm7, dword ptr [rax - 0x78], 0x10
0x10009b0ba: vinsertps xmm7, xmm7, dword ptr [rax - 0x48], 0x20
0x10009b0c1: vinsertps xmm7, xmm7, dword ptr [rax - 0x18], 0x30
0x10009b0c8: vinsertps xmm1, xmm1, dword ptr [rax - 0x74], 0x10
0x10009b0cf: vinsertps xmm1, xmm1, dword ptr [rax - 0x44], 0x20
0x10009b0d6: vinsertps xmm1, xmm1, dword ptr [rax - 0x14], 0x30
0x10009b0dd: vmovss xmm3, dword ptr [rax - 0xa0]
0x10009b0e5: vinsertps xmm3, xmm3, dword ptr [rax - 0x70], 0x10
0x10009b0ec: vinsertps xmm3, xmm3, dword ptr [rax - 0x40], 0x20
0x10009b0f3: vinsertps xmm3, xmm3, dword ptr [rax - 0x10], 0x30
0x10009b0fa: vmovss xmm4, dword ptr [rax - 0x9c]
0x10009b102: vinsertps xmm4, xmm4, dword ptr [rax - 0x6c], 0x10
0x10009b109: vinsertps xmm4, xmm4, dword ptr [rax - 0x3c], 0x20
0x10009b110: vinsertps xmm4, xmm4, dword ptr [rax - 0xc], 0x30
0x10009b117: vmulps xmm5, xmm8, xmm7
0x10009b11b: vmulps xmm6, xmm10, xmm1
0x10009b11f: vaddps xmm5, xmm5, xmm6
0x10009b123: vmulps xmm6, xmm9, xmm3
0x10009b127: vaddps xmm5, xmm5, xmm6
0x10009b12b: vmulps xmm6, xmm14, xmm4
0x10009b12f: vaddps xmm5, xmm5, xmm6
0x10009b133: vcmpltps xmm5, xmm5, xmmword ptr [rip + 0xa09464] ; 0x100aa45a0
0x10009b13c: vxorps xmm6, xmm11, xmmword ptr [rip + 0xa0c7bc] ; 0x100aa7900
0x10009b144: vblendvps xmm5, xmm11, xmm6, xmm5
0x10009b14a: vmulps xmm6, xmm2, xmm7
0x10009b14e: vmulps xmm7, xmm8, xmm5
0x10009b152: vaddps xmm6, xmm6, xmm7
0x10009b156: vmulps xmm1, xmm2, xmm1
0x10009b15a: vmulps xmm7, xmm10, xmm5
0x10009b15e: vaddps xmm1, xmm1, xmm7
0x10009b162: vmulps xmm3, xmm2, xmm3
0x10009b166: vmulps xmm2, xmm2, xmm4
0x10009b16a: vmulps xmm4, xmm9, xmm5
0x10009b16e: vmulps xmm5, xmm14, xmm5
0x10009b172: vaddps xmm3, xmm3, xmm4
0x10009b176: vaddps xmm2, xmm2, xmm5
0x10009b17a: vmulps xmm4, xmm6, xmm6
0x10009b17e: vmulps xmm5, xmm1, xmm1
0x10009b182: vaddps xmm4, xmm4, xmm5
0x10009b186: vmulps xmm5, xmm3, xmm3
0x10009b18a: vaddps xmm4, xmm5, xmm4
0x10009b18e: vmulps xmm5, xmm2, xmm2
0x10009b192: vaddps xmm4, xmm5, xmm4
0x10009b196: vrsqrtps xmm5, xmm4
0x10009b19a: vmulps xmm7, xmm5, xmm5
0x10009b19e: vmulps xmm4, xmm7, xmm4
0x10009b1a2: vmovaps xmm7, xmmword ptr [rip + 0xa0e506] ; 0x100aa96b0
0x10009b1aa: vsubps xmm4, xmm7, xmm4
0x10009b1ae: vmulps xmm4, xmm4, xmm12
0x10009b1b3: vmulps xmm4, xmm5, xmm4
0x10009b1b7: vmulps xmm5, xmm6, xmm4
0x10009b1bb: vmulps xmm1, xmm1, xmm4
0x10009b1bf: vmulps xmm3, xmm3, xmm4
0x10009b1c3: vmulps xmm2, xmm2, xmm4
0x10009b1c7: vpunpckldq xmm4, xmm5, xmm1
0x10009b1cb: vpermilps xmm6, xmm2, 0x24
0x10009b1d1: vmovddup xmm7, xmm3
0x10009b1d5: vpblendw xmm6, xmm7, xmm6, 0xc0
0x10009b1db: vpunpckldq xmm7, xmm3, xmm2
0x10009b1df: vpblendw xmm4, xmm4, xmm6, 0xf0
0x10009b1e5: vpermilps xmm6, xmm5, 0xe5
0x10009b1eb: vpblendw xmm6, xmm6, xmm1, 0xc
0x10009b1f1: vpblendw xmm6, xmm6, xmm7, 0xf0
0x10009b1f7: vmovdqu xmmword ptr [rax - 0xa8], xmm4
0x10009b1ff: vmovdqu xmmword ptr [rax - 0x78], xmm6
0x10009b204: vpunpckhdq xmm4, xmm5, xmm1
0x10009b208: vpermilps xmm6, xmm2, 0xa4
0x10009b20e: vpblendw xmm6, xmm3, xmm6, 0xc0
0x10009b214: vpblendw xmm4, xmm4, xmm6, 0xf0
0x10009b21a: vmovdqu xmmword ptr [rax - 0x48], xmm4
0x10009b21f: vpunpckhdq xmm2, xmm3, xmm2
0x10009b223: vpermilpd xmm1, xmm1, 1
0x10009b229: vpermilps xmm3, xmm5, 0xe7
0x10009b22f: vpblendw xmm1, xmm3, xmm1, 0xc
0x10009b235: vpblendw xmm1, xmm1, xmm2, 0xf0
0x10009b23b: vmovdqu xmmword ptr [rax - 0x18], xmm1
0x10009b240: add r11, 4
0x10009b244: add rdi, 0xc0
0x10009b24b: add rax, 0xc0
0x10009b251: cmp r11, r9
0x10009b254: jb 0x10009ada0
0x10009b25a: cmp r8d, r10d
0x10009b25d: jae 0x10009b368
0x10009b263: mov edi, r8d
0x10009b266: lea rax, [rcx + rdi*4]
0x10009b26a: sub r10, rdi
0x10009b26d: shl rdi, 4
0x10009b271: lea rdi, [rdi + rdi*2]
0x10009b275: lea rcx, [rdx + rdi + 0x20]
0x10009b27a: lea rdx, [rsi + rdi + 0x20]
0x10009b27f: vmovss xmm8, dword ptr [rip + 0xa09e39] ; 0x100aa50c0
0x10009b287: vxorps xmm9, xmm9, xmm9
0x10009b28c: vmovss xmm3, dword ptr [rip + 0xa0c630] ; 0x100aa78c4
0x10009b294: nop word ptr cs:[rax + rax]
0x10009b2a0: vmulss xmm5, xmm0, dword ptr [rax]
0x10009b2a4: vsubss xmm4, xmm8, xmm5
0x10009b2a8: vpermilps xmm6, xmm4, 0xc0
0x10009b2ae: vmulps xmm7, xmm6, xmmword ptr [rcx - 0x20]
0x10009b2b3: vpermilps xmm1, xmm5, 0xc0
0x10009b2b9: vmulps xmm2, xmm1, xmmword ptr [rdx - 0x20]
0x10009b2be: vaddps xmm2, xmm2, xmm7
0x10009b2c2: vmovaps xmmword ptr [rcx - 0x20], xmm2
0x10009b2c7: vmulps xmm2, xmm6, xmmword ptr [rcx]
0x10009b2cb: vmulps xmm1, xmm1, xmmword ptr [rdx]
0x10009b2cf: vaddps xmm1, xmm2, xmm1
0x10009b2d3: vmovaps xmmword ptr [rcx], xmm1
0x10009b2d7: vmovaps xmm1, xmmword ptr [rcx - 0x10]
0x10009b2dc: vmovaps xmm2, xmmword ptr [rdx - 0x10]
0x10009b2e1: vmulps xmm6, xmm1, xmm2
0x10009b2e5: vpermilpd xmm7, xmm6, 1
0x10009b2eb: vaddps xmm6, xmm6, xmm7
0x10009b2ef: vmovshdup xmm7, xmm6
0x10009b2f3: vaddss xmm6, xmm6, xmm7
0x10009b2f7: vucomiss xmm9, xmm6
0x10009b2fb: vpermilps xmm4, xmm4, 0
0x10009b301: vmulps xmm4, xmm4, xmm1
0x10009b305: vpermilps xmm1, xmm5, 0
0x10009b30b: vmulps xmm5, xmm1, xmm2
0x10009b30f: jbe 0x10009b320
0x10009b311: vsubps xmm4, xmm4, xmm5
0x10009b315: jmp 0x10009b324 ; 0x10009b324
0x10009b317: nop word ptr [rax + rax]
0x10009b320: vaddps xmm4, xmm4, xmm5
0x10009b324: vmulps xmm1, xmm4, xmm4
0x10009b328: vpermilpd xmm2, xmm1, 1
0x10009b32e: vaddps xmm1, xmm1, xmm2
0x10009b332: vmovshdup xmm2, xmm1
0x10009b336: vaddss xmm1, xmm1, xmm2
0x10009b33a: vsqrtss xmm5, xmm1, xmm1
0x10009b33e: vucomiss xmm5, xmm3
0x10009b342: jbe 0x10009b34e
0x10009b344: vpermilps xmm1, xmm5, 0
0x10009b34a: vdivps xmm4, xmm4, xmm1
0x10009b34e: vmovaps xmmword ptr [rcx - 0x10], xmm4
0x10009b353: add rax, 4
0x10009b357: add rcx, 0x30
0x10009b35b: add rdx, 0x30
0x10009b35f: dec r10
0x10009b362: jne 0x10009b2a0
0x10009b368: pop rbp
0x10009b369: ret 
0x10009b36a: nop word ptr [rax + rax]
