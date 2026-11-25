0x1000e5020: push rbp
0x1000e5021: mov rbp, rsp
0x1000e5024: push r15
0x1000e5026: push r14
0x1000e5028: push r13
0x1000e502a: push r12
0x1000e502c: push rbx
0x1000e502d: mov dword ptr [rbp - 0x2c], r9d
0x1000e5031: mov r11, qword ptr [r8 + 0x98]
0x1000e5038: mov r15, qword ptr [r8 + 0xa0]
0x1000e503f: mov r9, qword ptr [r8 + 0xa8]
0x1000e5046: mov qword ptr [rbp - 0x38], r8
0x1000e504a: mov r8, qword ptr [r8 + 0xb0]
0x1000e5051: cmp dword ptr [rdi + 0x70], 0
0x1000e5055: je 0x1000e50a4
0x1000e5057: movsxd rax, dword ptr [rdi + 0x34]
0x1000e505b: lea rax, [rax + rax*2]
0x1000e505f: lea r10, [r15 + rax*4]
0x1000e5063: xor ebx, ebx
0x1000e5065: nop word ptr cs:[rax + rax]
0x1000e5070: vmovsd xmm1, qword ptr [r10]
0x1000e5075: vinsertps xmm1, xmm1, dword ptr [r10 + 8], 0x20
0x1000e507c: vblendps xmm0, xmm1, xmm0, 8
0x1000e5082: mov eax, dword ptr [rdi + 0x58]
0x1000e5085: add eax, ebx
0x1000e5087: movzx eax, byte ptr [r8 + rax]
0x1000e508c: lea rax, [rax + rax*2]
0x1000e5090: shl rax, 4
0x1000e5094: vmovaps xmmword ptr [rsi + rax], xmm0
0x1000e5099: inc ebx
0x1000e509b: add r10, 0xc
0x1000e509f: cmp ebx, dword ptr [rdi + 0x70]
0x1000e50a2: jb 0x1000e5070
0x1000e50a4: cmp dword ptr [rdi + 0x74], 0
0x1000e50a8: je 0x1000e534d
0x1000e50ae: movsxd r14, dword ptr [rdi + 0x30]
0x1000e50b2: shl r14, 4
0x1000e50b6: add r14, r11
0x1000e50b9: xor ebx, ebx
0x1000e50bb: vmovaps xmm8, xmmword ptr [rip + 0x9c283d] ; 0x100aa7900
0x1000e50c3: nop word ptr cs:[rax + rax]
0x1000e50d0: vmovaps xmm1, xmmword ptr [r14]
0x1000e50d5: cmp byte ptr [rbp - 0x2c], 0
0x1000e50d9: je 0x1000e5290
0x1000e50df: mov rax, qword ptr [rbp - 0x38]
0x1000e50e3: mov r13, qword ptr [rax + 0xe0]
0x1000e50ea: mov eax, dword ptr [rdi + 0x54]
0x1000e50ed: add eax, ebx
0x1000e50ef: movzx eax, byte ptr [r8 + rax]
0x1000e50f4: lea rax, [rax + rax*8]
0x1000e50f8: shl rax, 4
0x1000e50fc: movsxd r12, dword ptr [r13 + rax + 0x84]
0x1000e5104: vpermilps xmm2, xmm1, 0xe7
0x1000e510a: vpermilps xmm3, xmm1, 0xff
0x1000e5110: lea r10, [r12 + r12*8]
0x1000e5114: shl r10, 4
0x1000e5118: vmovaps xmm5, xmmword ptr [r13 + r10 + 0x40]
0x1000e511f: vmulps xmm3, xmm3, xmm5
0x1000e5123: vpermilps xmm6, xmm5, 0xe7
0x1000e5129: vpermilps xmm4, xmm5, 0xff
0x1000e512f: vmulps xmm4, xmm1, xmm4
0x1000e5133: vaddps xmm3, xmm3, xmm4
0x1000e5137: vpermilps xmm4, xmm1, 0xd2
0x1000e513d: vmulps xmm4, xmm4, xmm5
0x1000e5141: vpermilps xmm7, xmm5, 0xd2
0x1000e5147: vmulps xmm7, xmm1, xmm7
0x1000e514b: vsubps xmm4, xmm4, xmm7
0x1000e514f: vpermilps xmm4, xmm4, 0xd2
0x1000e5155: vaddps xmm4, xmm3, xmm4
0x1000e5159: vmulss xmm2, xmm2, xmm6
0x1000e515d: vmulps xmm1, xmm1, xmm5
0x1000e5161: vmovshdup xmm3, xmm1
0x1000e5165: vaddss xmm3, xmm1, xmm3
0x1000e5169: vpermilpd xmm1, xmm1, 1
0x1000e516f: vaddss xmm1, xmm1, xmm3
0x1000e5173: vsubss xmm3, xmm2, xmm1
0x1000e5177: vinsertps xmm2, xmm4, xmm3, 0x30
0x1000e517d: cmp byte ptr [r13 + r10 + 0x88], 0
0x1000e5186: je 0x1000e529f
0x1000e518c: vmovaps xmm4, xmmword ptr [r13 + r10 + 0x50]
0x1000e5193: vmovaps xmm1, xmmword ptr [r13 + r10 + 0x60]
0x1000e519a: vpermilps xmm5, xmm4, 0xe7
0x1000e51a0: vpermilps xmm6, xmm4, 0xff
0x1000e51a6: vmulps xmm6, xmm2, xmm6
0x1000e51aa: vpermilps xmm7, xmm2, 0xff
0x1000e51b0: vmulps xmm7, xmm7, xmm4
0x1000e51b4: vaddps xmm6, xmm6, xmm7
0x1000e51b8: vpermilps xmm7, xmm4, 0xd2
0x1000e51be: vmulps xmm7, xmm2, xmm7
0x1000e51c2: vpermilps xmm0, xmm2, 0xd2
0x1000e51c8: vmulps xmm0, xmm0, xmm4
0x1000e51cc: vsubps xmm0, xmm7, xmm0
0x1000e51d0: vpermilps xmm0, xmm0, 0xd2
0x1000e51d6: vaddps xmm0, xmm6, xmm0
0x1000e51da: vpermilpd xmm6, xmm0, 1
0x1000e51e0: vmovshdup xmm7, xmm0
0x1000e51e4: vmulss xmm3, xmm3, xmm5
0x1000e51e8: vmulps xmm2, xmm2, xmm4
0x1000e51ec: vmovshdup xmm4, xmm2
0x1000e51f0: vaddss xmm4, xmm2, xmm4
0x1000e51f4: vpermilpd xmm2, xmm2, 1
0x1000e51fa: vaddss xmm2, xmm2, xmm4
0x1000e51fe: vsubss xmm2, xmm3, xmm2
0x1000e5202: vxorps xmm3, xmm7, xmm8
0x1000e5207: vinsertps xmm0, xmm0, xmm3, 0x10
0x1000e520d: vxorpd xmm3, xmm6, xmm8
0x1000e5212: vinsertps xmm0, xmm0, xmm3, 0x20
0x1000e5218: vinsertps xmm0, xmm0, xmm2, 0x30
0x1000e521e: vpermilps xmm3, xmm1, 0xe7
0x1000e5224: vpermilps xmm4, xmm1, 0xff
0x1000e522a: vmulps xmm4, xmm4, xmm0
0x1000e522e: vpermilps xmm5, xmm2, 0xc0
0x1000e5234: vmulps xmm5, xmm1, xmm5
0x1000e5238: vaddps xmm4, xmm4, xmm5
0x1000e523c: vpermilps xmm5, xmm1, 0xd2
0x1000e5242: vmulps xmm5, xmm5, xmm0
0x1000e5246: vpermilps xmm6, xmm0, 0xd2
0x1000e524c: vmulps xmm6, xmm1, xmm6
0x1000e5250: vsubps xmm5, xmm5, xmm6
0x1000e5254: vpermilps xmm5, xmm5, 0xd2
0x1000e525a: vaddps xmm4, xmm4, xmm5
0x1000e525e: vmulss xmm2, xmm3, xmm2
0x1000e5262: vmulps xmm0, xmm1, xmm0
0x1000e5266: vmovshdup xmm1, xmm0
0x1000e526a: vaddss xmm1, xmm0, xmm1
0x1000e526e: vpermilpd xmm0, xmm0, 1
0x1000e5274: vaddss xmm0, xmm0, xmm1
0x1000e5278: vsubss xmm0, xmm2, xmm0
0x1000e527c: vinsertps xmm1, xmm4, xmm0, 0x30
0x1000e5282: jmp 0x1000e52bf ; 0x1000e52bf
0x1000e5284: nop word ptr cs:[rax + rax]
0x1000e5290: mov eax, dword ptr [rdi + 0x54]
0x1000e5293: add eax, ebx
0x1000e5295: movzx r12d, byte ptr [r8 + rax]
0x1000e529a: jmp 0x1000e5330 ; 0x1000e5330
0x1000e529f: vmovshdup xmm0, xmm4
0x1000e52a3: vxorps xmm0, xmm0, xmm8
0x1000e52a8: vinsertps xmm0, xmm2, xmm0, 0x10
0x1000e52ae: vpermilpd xmm1, xmm4, 1
0x1000e52b4: vxorpd xmm1, xmm1, xmm8
0x1000e52b9: vinsertps xmm1, xmm0, xmm1, 0x20
0x1000e52bf: vpermilps xmm0, xmm1, 0xe7
0x1000e52c5: vpermilps xmm2, xmm1, 0xff
0x1000e52cb: vmovaps xmm3, xmmword ptr [r13 + r10 + 0x70]
0x1000e52d2: vmulps xmm2, xmm2, xmm3
0x1000e52d6: vpermilps xmm4, xmm3, 0xe7
0x1000e52dc: vpermilps xmm5, xmm3, 0xff
0x1000e52e2: vmulps xmm5, xmm1, xmm5
0x1000e52e6: vaddps xmm2, xmm2, xmm5
0x1000e52ea: vpermilps xmm5, xmm1, 0xd2
0x1000e52f0: vmulps xmm5, xmm5, xmm3
0x1000e52f4: vpermilps xmm6, xmm3, 0xd2
0x1000e52fa: vmulps xmm6, xmm1, xmm6
0x1000e52fe: vsubps xmm5, xmm5, xmm6
0x1000e5302: vpermilps xmm5, xmm5, 0xd2
0x1000e5308: vaddps xmm2, xmm2, xmm5
0x1000e530c: vmulss xmm0, xmm0, xmm4
0x1000e5310: vmulps xmm1, xmm1, xmm3
0x1000e5314: vmovshdup xmm3, xmm1
0x1000e5318: vaddss xmm3, xmm1, xmm3
0x1000e531c: vpermilpd xmm1, xmm1, 1
0x1000e5322: vaddss xmm1, xmm1, xmm3
0x1000e5326: vsubss xmm0, xmm0, xmm1
0x1000e532a: vinsertps xmm1, xmm2, xmm0, 0x30
0x1000e5330: lea rax, [r12 + r12*2]
0x1000e5334: shl rax, 4
0x1000e5338: vmovaps xmmword ptr [rsi + rax + 0x10], xmm1
0x1000e533e: inc ebx
0x1000e5340: add r14, 0x10
0x1000e5344: cmp ebx, dword ptr [rdi + 0x74]
0x1000e5347: jb 0x1000e50d0
0x1000e534d: cmp dword ptr [rdi + 0x78], 0
0x1000e5351: je 0x1000e5435
0x1000e5357: movsxd rax, dword ptr [rdi + 0x38]
0x1000e535b: cmp byte ptr [rbp - 0x2c], 0
0x1000e535f: je 0x1000e53ef
0x1000e5365: lea rax, [rax + rax*2]
0x1000e5369: lea r10, [r9 + rax*4]
0x1000e536d: xor r14d, r14d
0x1000e5370: vmovq xmm0, qword ptr [r10]
0x1000e5375: mov rax, qword ptr [rbp - 0x38]
0x1000e5379: mov rax, qword ptr [rax + 0xe0]
0x1000e5380: mov ebx, dword ptr [rdi + 0x5c]
0x1000e5383: add ebx, r14d
0x1000e5386: movzx ebx, byte ptr [r8 + rbx]
0x1000e538b: lea rbx, [rbx + rbx*8]
0x1000e538f: shl rbx, 4
0x1000e5393: movsxd r12, dword ptr [rax + rbx + 0x84]
0x1000e539b: lea rbx, [r12 + r12*8]
0x1000e539f: shl rbx, 4
0x1000e53a3: vpshufd xmm1, xmm0, 0
0x1000e53a8: vmulps xmm1, xmm1, xmmword ptr [rax + rbx]
0x1000e53ad: vpshufd xmm0, xmm0, 0x55
0x1000e53b2: vmulps xmm0, xmm0, xmmword ptr [rax + rbx + 0x10]
0x1000e53b8: vaddps xmm0, xmm1, xmm0
0x1000e53bc: vbroadcastss xmm1, dword ptr [r10 + 8]
0x1000e53c2: vmulps xmm1, xmm1, xmmword ptr [rax + rbx + 0x20]
0x1000e53c8: vaddps xmm0, xmm0, xmm1
0x1000e53cc: vaddps xmm0, xmm0, xmmword ptr [rax + rbx + 0x30]
0x1000e53d2: lea rax, [r12 + r12*2]
0x1000e53d6: shl rax, 4
0x1000e53da: vmovaps xmmword ptr [rsi + rax + 0x20], xmm0
0x1000e53e0: inc r14d
0x1000e53e3: add r10, 0xc
0x1000e53e7: cmp r14d, dword ptr [rdi + 0x78]
0x1000e53eb: jb 0x1000e5370
0x1000e53ed: jmp 0x1000e5435 ; 0x1000e5435
0x1000e53ef: lea rax, [rax + rax*2]
0x1000e53f3: lea r10, [r9 + rax*4]
0x1000e53f7: xor ebx, ebx
0x1000e53f9: nop dword ptr [rax]
0x1000e5400: vmovsd xmm1, qword ptr [r10]
0x1000e5405: vinsertps xmm1, xmm1, dword ptr [r10 + 8], 0x20
0x1000e540c: vblendps xmm0, xmm1, xmm0, 8
0x1000e5412: mov eax, dword ptr [rdi + 0x5c]
0x1000e5415: add eax, ebx
0x1000e5417: movzx eax, byte ptr [r8 + rax]
0x1000e541c: lea rax, [rax + rax*2]
0x1000e5420: shl rax, 4
0x1000e5424: vmovaps xmmword ptr [rsi + rax + 0x20], xmm0
0x1000e542a: inc ebx
0x1000e542c: add r10, 0xc
0x1000e5430: cmp ebx, dword ptr [rdi + 0x78]
0x1000e5433: jb 0x1000e5400
0x1000e5435: mov eax, dword ptr [rdi + 0x64]
0x1000e5438: mov r13d, dword ptr [rdx + 0x1c]
0x1000e543c: mov ebx, dword ptr [rdx + 0x20]
0x1000e543f: test eax, eax
0x1000e5441: je 0x1000e54d3
0x1000e5447: mov r10d, dword ptr [rdi + 0x40]
0x1000e544b: imul ebx, eax
0x1000e544e: add ebx, r10d
0x1000e5451: imul r13d, eax
0x1000e5455: add r13d, r10d
0x1000e5458: movsxd rax, ebx
0x1000e545b: movsxd rbx, r13d
0x1000e545e: lea rax, [rax + rax*2]
0x1000e5462: lea r10, [r15 + rax*4]
0x1000e5466: lea rax, [rbx + rbx*2]
0x1000e546a: lea r15, [r15 + rax*4]
0x1000e546e: xor eax, eax
0x1000e5470: mov r14d, dword ptr [rdi + 0x4c]
0x1000e5474: add r14d, eax
0x1000e5477: vmovsd xmm0, qword ptr [r15]
0x1000e547c: vinsertps xmm0, xmm0, dword ptr [r15 + 8], 0x20
0x1000e5483: vmovsd xmm1, qword ptr [r10]
0x1000e5488: vinsertps xmm1, xmm1, dword ptr [r10 + 8], 0x20
0x1000e548f: vbroadcastss xmm2, dword ptr [rdx + 0x14]
0x1000e5495: vmulps xmm0, xmm0, xmm2
0x1000e5499: vbroadcastss xmm2, dword ptr [rdx + 0x10]
0x1000e549f: vmulps xmm1, xmm1, xmm2
0x1000e54a3: vaddps xmm0, xmm0, xmm1
0x1000e54a7: movzx ebx, byte ptr [r8 + r14]
0x1000e54ac: lea rbx, [rbx + rbx*2]
0x1000e54b0: shl rbx, 4
0x1000e54b4: vmovaps xmmword ptr [rsi + rbx], xmm0
0x1000e54b9: inc rax
0x1000e54bc: mov ebx, dword ptr [rdi + 0x64]
0x1000e54bf: add r10, 0xc
0x1000e54c3: add r15, 0xc
0x1000e54c7: cmp rax, rbx
0x1000e54ca: jb 0x1000e5470
0x1000e54cc: mov r13d, dword ptr [rdx + 0x1c]
0x1000e54d0: mov ebx, dword ptr [rdx + 0x20]
0x1000e54d3: mov qword ptr [rbp - 0x40], r8
0x1000e54d7: mov eax, dword ptr [rdi + 0x68]
0x1000e54da: mov r10d, dword ptr [rdx + 0x18]
0x1000e54de: mov r14d, dword ptr [rdx + 0x24]
0x1000e54e2: test eax, eax
0x1000e54e4: je 0x1000e5954
0x1000e54ea: mov qword ptr [rbp - 0x48], r9
0x1000e54ee: mov r15d, dword ptr [rdi + 0x3c]
0x1000e54f2: imul r14d, eax
0x1000e54f6: add r14d, r15d
0x1000e54f9: imul ebx, eax
0x1000e54fc: add ebx, r15d
0x1000e54ff: imul r13d, eax
0x1000e5503: add r13d, r15d
0x1000e5506: imul r10d, eax
0x1000e550a: add r10d, r15d
0x1000e550d: movsxd r15, r14d
0x1000e5510: movsxd r12, ebx
0x1000e5513: movsxd r13, r13d
0x1000e5516: movsxd r8, r10d
0x1000e5519: shl r15, 4
0x1000e551d: add r15, r11
0x1000e5520: shl r12, 4
0x1000e5524: add r12, r11
0x1000e5527: shl r13, 4
0x1000e552b: add r13, r11
0x1000e552e: shl r8, 4
0x1000e5532: add r8, r11
0x1000e5535: xor r9d, r9d
0x1000e5538: vmovss xmm10, dword ptr [rip + 0x9c2384] ; 0x100aa78c4
0x1000e5540: vmovaps xmm9, xmmword ptr [rip + 0x9c23b8] ; 0x100aa7900
0x1000e5548: vxorps xmm11, xmm11, xmm11
0x1000e554d: vmovaps xmm8, xmmword ptr [rip + 0x9c23ab] ; 0x100aa7900
0x1000e5555: nop word ptr cs:[rax + rax]
0x1000e5560: mov eax, dword ptr [rdi + 0x48]
0x1000e5563: add eax, r9d
0x1000e5566: mov rbx, qword ptr [rbp - 0x40]
0x1000e556a: movzx r11d, byte ptr [rbx + rax]
0x1000e556f: vmovaps xmm5, xmmword ptr [r8]
0x1000e5574: vmovaps xmm7, xmmword ptr [r13]
0x1000e557a: vmovaps xmm6, xmmword ptr [r12]
0x1000e5580: vmovaps xmm4, xmmword ptr [r15]
0x1000e5585: cmp byte ptr [rdx + 0x28], 0
0x1000e5589: je 0x1000e5680
0x1000e558f: mov eax, r11d
0x1000e5592: shr eax, 3
0x1000e5595: movzx eax, byte ptr [rcx + rax]
0x1000e5599: mov ebx, r11d
0x1000e559c: and bl, 7
0x1000e559f: movzx ebx, bl
0x1000e55a2: bt eax, ebx
0x1000e55a5: jae 0x1000e5680
0x1000e55ab: vmulps xmm3, xmm7, xmm6
0x1000e55af: vpermilpd xmm1, xmm3, 1
0x1000e55b5: vaddps xmm1, xmm3, xmm1
0x1000e55b9: vmovshdup xmm3, xmm1
0x1000e55bd: vaddss xmm1, xmm1, xmm3
0x1000e55c1: vucomiss xmm11, xmm1
0x1000e55c5: vbroadcastss xmm1, dword ptr [rdx + 4]
0x1000e55cb: vmulps xmm7, xmm7, xmm1
0x1000e55cf: vbroadcastss xmm1, dword ptr [rdx + 8]
0x1000e55d5: vmulps xmm6, xmm6, xmm1
0x1000e55d9: jbe 0x1000e55e0
0x1000e55db: vxorps xmm6, xmm6, xmm8
0x1000e55e0: vaddps xmm6, xmm7, xmm6
0x1000e55e4: vmulps xmm1, xmm5, xmm6
0x1000e55e8: vpermilpd xmm3, xmm1, 1
0x1000e55ee: vaddps xmm1, xmm1, xmm3
0x1000e55f2: vmovshdup xmm3, xmm1
0x1000e55f6: vaddss xmm1, xmm1, xmm3
0x1000e55fa: vucomiss xmm11, xmm1
0x1000e55fe: vbroadcastss xmm1, dword ptr [rdx]
0x1000e5603: vmulps xmm5, xmm5, xmm1
0x1000e5607: jbe 0x1000e560e
0x1000e5609: vxorps xmm5, xmm5, xmm8
0x1000e560e: vaddps xmm5, xmm6, xmm5
0x1000e5612: vmulps xmm1, xmm4, xmm5
0x1000e5616: vpermilpd xmm3, xmm1, 1
0x1000e561c: vaddps xmm1, xmm1, xmm3
0x1000e5620: vmovshdup xmm3, xmm1
0x1000e5624: vaddss xmm1, xmm1, xmm3
0x1000e5628: vucomiss xmm11, xmm1
0x1000e562c: vbroadcastss xmm1, dword ptr [rdx + 0xc]
0x1000e5632: vmulps xmm4, xmm4, xmm1
0x1000e5636: jbe 0x1000e563d
0x1000e5638: vxorps xmm4, xmm4, xmm8
0x1000e563d: vaddps xmm4, xmm5, xmm4
0x1000e5641: vmulps xmm1, xmm4, xmm4
0x1000e5645: vpermilpd xmm3, xmm1, 1
0x1000e564b: vaddps xmm1, xmm1, xmm3
0x1000e564f: vmovshdup xmm3, xmm1
0x1000e5653: vaddss xmm1, xmm1, xmm3
0x1000e5657: vsqrtss xmm5, xmm1, xmm1
0x1000e565b: vucomiss xmm5, xmm10
0x1000e5660: jbe 0x1000e56de
0x1000e5662: vpermilps xmm1, xmm5, 0
0x1000e5668: vdivps xmm4, xmm4, xmm1
0x1000e566c: cmp byte ptr [rbp - 0x2c], 0
0x1000e5670: jne 0x1000e56e8
0x1000e5672: jmp 0x1000e5914 ; 0x1000e5914
0x1000e5677: nop word ptr [rax + rax]
0x1000e5680: vbroadcastss xmm3, dword ptr [rdx]
0x1000e5685: vmulps xmm3, xmm5, xmm3
0x1000e5689: vbroadcastss xmm5, dword ptr [rdx + 4]
0x1000e568f: vmulps xmm5, xmm7, xmm5
0x1000e5693: vaddps xmm3, xmm3, xmm5
0x1000e5697: vbroadcastss xmm5, dword ptr [rdx + 8]
0x1000e569d: vmulps xmm5, xmm6, xmm5
0x1000e56a1: vaddps xmm3, xmm3, xmm5
0x1000e56a5: vbroadcastss xmm5, dword ptr [rdx + 0xc]
0x1000e56ab: vmulps xmm4, xmm4, xmm5
0x1000e56af: vaddps xmm4, xmm3, xmm4
0x1000e56b3: vmulps xmm3, xmm4, xmm4
0x1000e56b7: vpermilpd xmm5, xmm3, 1
0x1000e56bd: vaddps xmm3, xmm3, xmm5
0x1000e56c1: vmovshdup xmm5, xmm3
0x1000e56c5: vaddss xmm3, xmm3, xmm5
0x1000e56c9: vsqrtss xmm5, xmm3, xmm3
0x1000e56cd: vucomiss xmm5, xmm10
0x1000e56d2: jbe 0x1000e56de
0x1000e56d4: vpermilps xmm3, xmm5, 0
0x1000e56da: vdivps xmm4, xmm4, xmm3
0x1000e56de: cmp byte ptr [rbp - 0x2c], 0
0x1000e56e2: je 0x1000e5914
0x1000e56e8: mov rax, qword ptr [rbp - 0x38]
0x1000e56ec: mov r10, qword ptr [rax + 0xe0]
0x1000e56f3: lea rax, [r11 + r11*8]
0x1000e56f7: shl rax, 4
0x1000e56fb: movsxd r11, dword ptr [r10 + rax + 0x84]
0x1000e5703: vpermilps xmm1, xmm4, 0xe7
0x1000e5709: vpermilps xmm3, xmm4, 0xff
0x1000e570f: lea r14, [r11 + r11*8]
0x1000e5713: shl r14, 4
0x1000e5717: vmovaps xmm5, xmmword ptr [r10 + r14 + 0x40]
0x1000e571e: vmulps xmm3, xmm3, xmm5
0x1000e5722: vpermilps xmm6, xmm5, 0xe7
0x1000e5728: vpermilps xmm7, xmm5, 0xff
0x1000e572e: vmulps xmm7, xmm4, xmm7
0x1000e5732: vaddps xmm3, xmm3, xmm7
0x1000e5736: vpermilps xmm7, xmm4, 0xd2
0x1000e573c: vmulps xmm7, xmm7, xmm5
0x1000e5740: vpermilps xmm0, xmm5, 0xd2
0x1000e5746: vmulps xmm0, xmm4, xmm0
0x1000e574a: vsubps xmm0, xmm7, xmm0
0x1000e574e: vpermilps xmm0, xmm0, 0xd2
0x1000e5754: vaddps xmm7, xmm3, xmm0
0x1000e5758: vmulss xmm0, xmm1, xmm6
0x1000e575c: vmulps xmm1, xmm4, xmm5
0x1000e5760: vmovshdup xmm3, xmm1
0x1000e5764: vaddss xmm3, xmm1, xmm3
0x1000e5768: vpermilpd xmm1, xmm1, 1
0x1000e576e: vaddss xmm1, xmm1, xmm3
0x1000e5772: vsubss xmm6, xmm0, xmm1
0x1000e5776: vinsertps xmm5, xmm7, xmm6, 0x30
0x1000e577c: cmp byte ptr [r10 + r14 + 0x88], 0
0x1000e5785: je 0x1000e5883
0x1000e578b: vmovaps xmm0, xmmword ptr [r10 + r14 + 0x50]
0x1000e5792: vmovaps xmm4, xmmword ptr [r10 + r14 + 0x60]
0x1000e5799: vpermilps xmm1, xmm0, 0xe7
0x1000e579f: vpermilps xmm3, xmm0, 0xff
0x1000e57a5: vmulps xmm3, xmm5, xmm3
0x1000e57a9: vpermilps xmm7, xmm5, 0xff
0x1000e57af: vmulps xmm7, xmm7, xmm0
0x1000e57b3: vaddps xmm3, xmm3, xmm7
0x1000e57b7: vpermilps xmm7, xmm0, 0xd2
0x1000e57bd: vmulps xmm7, xmm5, xmm7
0x1000e57c1: vpermilps xmm2, xmm5, 0xd2
0x1000e57c7: vmulps xmm2, xmm2, xmm0
0x1000e57cb: vsubps xmm2, xmm7, xmm2
0x1000e57cf: vpermilps xmm2, xmm2, 0xd2
0x1000e57d5: vaddps xmm2, xmm3, xmm2
0x1000e57d9: vpermilpd xmm3, xmm2, 1
0x1000e57df: vmovshdup xmm7, xmm2
0x1000e57e3: vmulss xmm1, xmm6, xmm1
0x1000e57e7: vmulps xmm0, xmm5, xmm0
0x1000e57eb: vmovshdup xmm5, xmm0
0x1000e57ef: vaddss xmm5, xmm0, xmm5
0x1000e57f3: vpermilpd xmm0, xmm0, 1
0x1000e57f9: vaddss xmm0, xmm0, xmm5
0x1000e57fd: vsubss xmm0, xmm1, xmm0
0x1000e5801: vxorps xmm1, xmm7, xmm9
0x1000e5806: vinsertps xmm1, xmm2, xmm1, 0x10
0x1000e580c: vxorpd xmm2, xmm3, xmm9
0x1000e5811: vinsertps xmm1, xmm1, xmm2, 0x20
0x1000e5817: vinsertps xmm1, xmm1, xmm0, 0x30
0x1000e581d: vpermilps xmm2, xmm4, 0xe7
0x1000e5823: vpermilps xmm3, xmm4, 0xff
0x1000e5829: vmulps xmm3, xmm3, xmm1
0x1000e582d: vpermilps xmm5, xmm0, 0xc0
0x1000e5833: vmulps xmm5, xmm4, xmm5
0x1000e5837: vaddps xmm3, xmm3, xmm5
0x1000e583b: vpermilps xmm5, xmm4, 0xd2
0x1000e5841: vmulps xmm5, xmm5, xmm1
0x1000e5845: vpermilps xmm6, xmm1, 0xd2
0x1000e584b: vmulps xmm6, xmm4, xmm6
0x1000e584f: vsubps xmm5, xmm5, xmm6
0x1000e5853: vpermilps xmm5, xmm5, 0xd2
0x1000e5859: vaddps xmm3, xmm3, xmm5
0x1000e585d: vmulss xmm0, xmm2, xmm0
0x1000e5861: vmulps xmm1, xmm4, xmm1
0x1000e5865: vmovshdup xmm2, xmm1
0x1000e5869: vaddss xmm2, xmm1, xmm2
0x1000e586d: vpermilpd xmm1, xmm1, 1
0x1000e5873: vaddss xmm1, xmm1, xmm2
0x1000e5877: vsubss xmm0, xmm0, xmm1
0x1000e587b: vinsertps xmm4, xmm3, xmm0, 0x30
0x1000e5881: jmp 0x1000e58a3 ; 0x1000e58a3
0x1000e5883: vmovshdup xmm0, xmm7
0x1000e5887: vxorps xmm0, xmm0, xmm9
0x1000e588c: vinsertps xmm0, xmm5, xmm0, 0x10
0x1000e5892: vpermilpd xmm1, xmm7, 1
0x1000e5898: vxorpd xmm1, xmm1, xmm9
0x1000e589d: vinsertps xmm4, xmm0, xmm1, 0x20
0x1000e58a3: vpermilps xmm0, xmm4, 0xe7
0x1000e58a9: vpermilps xmm1, xmm4, 0xff
0x1000e58af: vmovaps xmm2, xmmword ptr [r10 + r14 + 0x70]
0x1000e58b6: vmulps xmm1, xmm1, xmm2
0x1000e58ba: vpermilps xmm3, xmm2, 0xe7
0x1000e58c0: vpermilps xmm5, xmm2, 0xff
0x1000e58c6: vmulps xmm5, xmm4, xmm5
0x1000e58ca: vaddps xmm1, xmm1, xmm5
0x1000e58ce: vpermilps xmm5, xmm4, 0xd2
0x1000e58d4: vmulps xmm5, xmm5, xmm2
0x1000e58d8: vpermilps xmm6, xmm2, 0xd2
0x1000e58de: vmulps xmm6, xmm4, xmm6
0x1000e58e2: vsubps xmm5, xmm5, xmm6
0x1000e58e6: vpermilps xmm5, xmm5, 0xd2
0x1000e58ec: vaddps xmm1, xmm1, xmm5
0x1000e58f0: vmulss xmm0, xmm0, xmm3
0x1000e58f4: vmulps xmm2, xmm4, xmm2
0x1000e58f8: vmovshdup xmm3, xmm2
0x1000e58fc: vaddss xmm3, xmm2, xmm3
0x1000e5900: vpermilpd xmm2, xmm2, 1
0x1000e5906: vaddss xmm2, xmm2, xmm3
0x1000e590a: vsubss xmm0, xmm0, xmm2
0x1000e590e: vinsertps xmm4, xmm1, xmm0, 0x30
0x1000e5914: lea rax, [r11 + r11*2]
0x1000e5918: shl rax, 4
0x1000e591c: vmovaps xmmword ptr [rsi + rax + 0x10], xmm4
0x1000e5922: inc r9
0x1000e5925: mov eax, dword ptr [rdi + 0x68]
0x1000e5928: add r15, 0x10
0x1000e592c: add r12, 0x10
0x1000e5930: add r13, 0x10
0x1000e5934: add r8, 0x10
0x1000e5938: cmp r9, rax
0x1000e593b: jb 0x1000e5560
0x1000e5941: mov r10d, dword ptr [rdx + 0x18]
0x1000e5945: mov r13d, dword ptr [rdx + 0x1c]
0x1000e5949: mov ebx, dword ptr [rdx + 0x20]
0x1000e594c: mov r14d, dword ptr [rdx + 0x24]
0x1000e5950: mov r9, qword ptr [rbp - 0x48]
0x1000e5954: mov eax, dword ptr [rdi + 0x6c]
0x1000e5957: test eax, eax
0x1000e5959: je 0x1000e5aa8
0x1000e595f: mov ecx, dword ptr [rdi + 0x44]
0x1000e5962: imul r14d, eax
0x1000e5966: add r14d, ecx
0x1000e5969: imul ebx, eax
0x1000e596c: add ebx, ecx
0x1000e596e: imul r13d, eax
0x1000e5972: add r13d, ecx
0x1000e5975: imul r10d, eax
0x1000e5979: add r10d, ecx
0x1000e597c: movsxd rax, r14d
0x1000e597f: movsxd rcx, ebx
0x1000e5982: movsxd rbx, r13d
0x1000e5985: movsxd r14, r10d
0x1000e5988: lea rax, [rax + rax*2]
0x1000e598c: lea r10, [r9 + rax*4]
0x1000e5990: lea rax, [rcx + rcx*2]
0x1000e5994: lea r11, [r9 + rax*4]
0x1000e5998: lea rax, [rbx + rbx*2]
0x1000e599c: lea r8, [r9 + rax*4]
0x1000e59a0: lea rax, [r14 + r14*2]
0x1000e59a4: lea r9, [r9 + rax*4]
0x1000e59a8: xor ecx, ecx
0x1000e59aa: nop word ptr [rax + rax]
0x1000e59b0: mov ebx, dword ptr [rdi + 0x50]
0x1000e59b3: add ebx, ecx
0x1000e59b5: mov rax, qword ptr [rbp - 0x40]
0x1000e59b9: movzx r14d, byte ptr [rax + rbx]
0x1000e59be: vmovsd xmm0, qword ptr [r9]
0x1000e59c3: vinsertps xmm0, xmm0, dword ptr [r9 + 8], 0x20
0x1000e59ca: vmovsd xmm1, qword ptr [r8]
0x1000e59cf: vinsertps xmm1, xmm1, dword ptr [r8 + 8], 0x20
0x1000e59d6: vmovsd xmm2, qword ptr [r11]
0x1000e59db: vinsertps xmm2, xmm2, dword ptr [r11 + 8], 0x20
0x1000e59e2: vmovsd xmm3, qword ptr [r10]
0x1000e59e7: vinsertps xmm3, xmm3, dword ptr [r10 + 8], 0x20
0x1000e59ee: vbroadcastss xmm4, dword ptr [rdx]
0x1000e59f3: vmulps xmm0, xmm0, xmm4
0x1000e59f7: vbroadcastss xmm4, dword ptr [rdx + 4]
0x1000e59fd: vmulps xmm1, xmm1, xmm4
0x1000e5a01: vaddps xmm0, xmm0, xmm1
0x1000e5a05: vbroadcastss xmm1, dword ptr [rdx + 8]
0x1000e5a0b: vmulps xmm1, xmm2, xmm1
0x1000e5a0f: vaddps xmm0, xmm0, xmm1
0x1000e5a13: vbroadcastss xmm1, dword ptr [rdx + 0xc]
0x1000e5a19: vmulps xmm1, xmm3, xmm1
0x1000e5a1d: vaddps xmm0, xmm0, xmm1
0x1000e5a21: cmp byte ptr [rbp - 0x2c], 0
0x1000e5a25: je 0x1000e5a7b
0x1000e5a27: mov rax, qword ptr [rbp - 0x38]
0x1000e5a2b: mov rbx, qword ptr [rax + 0xe0]
0x1000e5a32: lea rax, [r14 + r14*8]
0x1000e5a36: shl rax, 4
0x1000e5a3a: movsxd r14, dword ptr [rbx + rax + 0x84]
0x1000e5a42: lea rax, [r14 + r14*8]
0x1000e5a46: shl rax, 4
0x1000e5a4a: vpermilps xmm1, xmm0, 0
0x1000e5a50: vmulps xmm1, xmm1, xmmword ptr [rbx + rax]
0x1000e5a55: vpermilps xmm2, xmm0, 0x55
0x1000e5a5b: vmulps xmm2, xmm2, xmmword ptr [rbx + rax + 0x10]
0x1000e5a61: vaddps xmm1, xmm1, xmm2
0x1000e5a65: vpermilps xmm0, xmm0, 0xaa
0x1000e5a6b: vmulps xmm0, xmm0, xmmword ptr [rbx + rax + 0x20]
0x1000e5a71: vaddps xmm0, xmm1, xmm0
0x1000e5a75: vaddps xmm0, xmm0, xmmword ptr [rbx + rax + 0x30]
0x1000e5a7b: lea rax, [r14 + r14*2]
0x1000e5a7f: shl rax, 4
0x1000e5a83: vmovaps xmmword ptr [rsi + rax + 0x20], xmm0
0x1000e5a89: inc rcx
0x1000e5a8c: mov eax, dword ptr [rdi + 0x6c]
0x1000e5a8f: add r10, 0xc
0x1000e5a93: add r11, 0xc
0x1000e5a97: add r8, 0xc
0x1000e5a9b: add r9, 0xc
0x1000e5a9f: cmp rcx, rax
0x1000e5aa2: jb 0x1000e59b0
0x1000e5aa8: pop rbx
0x1000e5aa9: pop r12
0x1000e5aab: pop r13
0x1000e5aad: pop r14
0x1000e5aaf: pop r15
0x1000e5ab1: pop rbp
0x1000e5ab2: ret 
0x1000e5ab3: nop word ptr cs:[rax + rax]
