0x10034e2b0: push rbp
0x10034e2b1: mov rbp, rsp
0x10034e2b4: push r15
0x10034e2b6: push r14
0x10034e2b8: push r12
0x10034e2ba: push rbx
0x10034e2bb: sub rsp, 0x50
0x10034e2bf: mov rbx, rdi
0x10034e2c2: mov dword ptr [rbx + 0x11dc0], 0
0x10034e2cc: mov dword ptr [rbp - 0x48], 1
0x10034e2d3: vmovaps ymm0, ymmword ptr [rip + 0x76ea25] ; 0x100abcd00
0x10034e2db: vmovups ymmword ptr [rbp - 0x68], ymm0
0x10034e2e0: lea r15, [rbx + 0x455e60]
0x10034e2e7: lea rsi, [rbp - 0x68]
0x10034e2eb: mov rdi, r15
0x10034e2ee: vzeroupper 
0x10034e2f1: call 0x1007f04d0 ; 0x1007f04d0
0x10034e2f6: call 0x1007c6c20 ; 0x1007c6c20
0x10034e2fb: lea rcx, [rip + 0x1cfa84e] ; 0x102048b50
0x10034e302: mov rdx, qword ptr [rcx]
0x10034e305: mov esi, 0x800
0x10034e30a: mov ecx, 1
0x10034e30f: mov rdi, rax
0x10034e312: call 0x100795530 ; 0x100795530
0x10034e317: mov r14, rax
0x10034e31a: lea r12, [rbx + 0x455de8]
0x10034e321: mov dword ptr [rsp], 0
0x10034e328: lea rsi, [rip + 0x83396a] ; 0x100b81c99 FlowerTex
0x10034e32f: mov edx, 1
0x10034e334: mov ecx, 0x20
0x10034e339: mov r8d, 0x20
0x10034e33f: mov r9d, 4
0x10034e345: mov rdi, r12
0x10034e348: call 0x1007f0850 ; 0x1007f0850
0x10034e34d: mov rax, r14
0x10034e350: inc rax
0x10034e353: xor ecx, ecx
0x10034e355: vmovss xmm1, dword ptr [rip + 0x76eb33] ; 0x100abce90
0x10034e35d: vmovss xmm3, dword ptr [rip + 0x76eb2f] ; 0x100abce94
0x10034e365: vmovss xmm14, dword ptr [rip + 0x759463] ; 0x100aa77d0
0x10034e36d: vmovss xmm11, dword ptr [rip + 0x75947f] ; 0x100aa77f4
0x10034e375: vxorps xmm5, xmm5, xmm5
0x10034e379: vmovss xmm15, dword ptr [rip + 0x756d3f] ; 0x100aa50c0
0x10034e381: vmovss xmm12, dword ptr [rip + 0x759453] ; 0x100aa77dc
0x10034e389: vmovaps xmm8, xmmword ptr [rip + 0x75957f] ; 0x100aa7910
0x10034e391: vmovss xmm9, dword ptr [rip + 0x75992b] ; 0x100aa7cc4
0x10034e399: vmovss xmm13, dword ptr [rip + 0x75a22f] ; 0x100aa85d0
0x10034e3a1: vmovss xmm6, dword ptr [rip + 0x76eaef] ; 0x100abce98
0x10034e3a9: nop dword ptr [rax]
0x10034e3b0: vxorps xmm4, xmm4, xmm4
0x10034e3b4: vcvtsi2ss xmm0, xmm4, ecx
0x10034e3b8: vaddss xmm0, xmm0, xmm1
0x10034e3bc: vdivss xmm0, xmm0, xmm3
0x10034e3c0: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x10034e3c5: vcvtss2sd xmm4, xmm0, xmm0
0x10034e3c9: vmovsd xmm0, qword ptr [rip + 0x76ead7] ; 0x100abcea8
0x10034e3d1: vsubsd xmm4, xmm0, xmm4
0x10034e3d5: vaddsd xmm4, xmm4, xmm4
0x10034e3d9: vcvtsd2ss xmm4, xmm4, xmm4
0x10034e3dd: vmulss xmm0, xmm4, dword ptr [rip + 0x76eab3] ; 0x100abce98
0x10034e3e5: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x10034e3ea: xor edx, edx
0x10034e3ec: nop dword ptr [rax]
0x10034e3f0: vxorps xmm10, xmm10, xmm10
0x10034e3f5: vcvtsi2ss xmm4, xmm10, edx
0x10034e3f9: vaddss xmm4, xmm4, xmm1
0x10034e3fd: vdivss xmm4, xmm4, xmm3
0x10034e401: vinsertps xmm10, xmm4, dword ptr [rbp - 0x40], 0x1c
0x10034e408: vinsertps xmm2, xmm10, xmm2, 0xf4
0x10034e40e: vmovaps xmm10, xmm1
0x10034e412: vmulps xmm1, xmm2, xmm2
0x10034e416: vmovaps xmm0, xmm3
0x10034e41a: vmovshdup xmm3, xmm1
0x10034e41e: vaddss xmm3, xmm1, xmm3
0x10034e422: vpermilpd xmm1, xmm1, 1
0x10034e428: vaddss xmm1, xmm1, xmm3
0x10034e42c: vaddss xmm1, xmm1, xmm14
0x10034e431: vdivss xmm1, xmm1, xmm11
0x10034e436: vmaxss xmm1, xmm5, xmm1
0x10034e43a: vminss xmm1, xmm15, xmm1
0x10034e43e: vmulss xmm3, xmm1, xmm1
0x10034e442: vmulss xmm3, xmm1, xmm3
0x10034e446: vmulss xmm7, xmm1, dword ptr [rip + 0x758656] ; 0x100aa6aa4
0x10034e44e: vaddss xmm7, xmm7, dword ptr [rip + 0x75b226] ; 0x100aa967c
0x10034e456: vmulss xmm1, xmm1, xmm7
0x10034e45a: vxorps xmm5, xmm5, xmm5
0x10034e45e: vaddss xmm1, xmm1, xmm12
0x10034e463: vmulss xmm1, xmm3, xmm1
0x10034e467: vmovaps xmm3, xmm0
0x10034e46b: vsubss xmm1, xmm15, xmm1
0x10034e46f: vmulss xmm1, xmm1, xmm6
0x10034e473: vmaxss xmm1, xmm5, xmm1
0x10034e477: vminss xmm1, xmm9, xmm1
0x10034e47b: vcvttss2si esi, xmm1
0x10034e47f: vandps xmm1, xmm4, xmm8
0x10034e484: vcmpltss xmm1, xmm13, xmm1
0x10034e489: vandnps xmm1, xmm1, xmmword ptr [rbp - 0x30]
0x10034e48e: vmaxss xmm1, xmm5, xmm1
0x10034e492: vminss xmm1, xmm9, xmm1
0x10034e496: vcvttss2si edi, xmm1
0x10034e49a: vmovaps xmm1, xmm10
0x10034e49e: mov byte ptr [rax + rdx*2 - 1], sil
0x10034e4a3: mov byte ptr [rax + rdx*2], dil
0x10034e4a7: inc rdx
0x10034e4aa: cmp edx, 0x20
0x10034e4ad: jne 0x10034e3f0
0x10034e4b3: inc ecx
0x10034e4b5: add rax, 0x40
0x10034e4b9: cmp ecx, 0x20
0x10034e4bc: jne 0x10034e3b0
0x10034e4c2: mov qword ptr [rbx + 0x455df0], r15
0x10034e4c9: mov rdi, r12
0x10034e4cc: mov rsi, r14
0x10034e4cf: call 0x1007f0e00 ; 0x1007f0e00
0x10034e4d4: mov rdi, r12
0x10034e4d7: call 0x1007f12f0 ; 0x1007f12f0
0x10034e4dc: call 0x1007c6c20 ; 0x1007c6c20
0x10034e4e1: mov rdi, rax
0x10034e4e4: mov rsi, r14
0x10034e4e7: call 0x100795a70 ; 0x100795a70
0x10034e4ec: add rsp, 0x50
0x10034e4f0: pop rbx
0x10034e4f1: pop r12
0x10034e4f3: pop r14
0x10034e4f5: pop r15
0x10034e4f7: pop rbp
0x10034e4f8: ret 
0x10034e4f9: mov rdi, rax
0x10034e4fc: call 0x100011bf0 ; 0x100011bf0
0x10034e501: mov rbx, rax
0x10034e504: call 0x1007c6c20 ; 0x1007c6c20
0x10034e509: mov rdi, rax
0x10034e50c: mov rsi, r14
0x10034e50f: call 0x100795a70 ; 0x100795a70
0x10034e514: mov rdi, rbx
0x10034e517: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10034e51c: mov rdi, rax
0x10034e51f: call 0x100011bf0 ; 0x100011bf0
0x10034e524: nop word ptr cs:[rax + rax]
