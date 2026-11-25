0x1006d6380: push rbp
0x1006d6381: mov rbp, rsp
0x1006d6384: push r15
0x1006d6386: push r14
0x1006d6388: push r13
0x1006d638a: push r12
0x1006d638c: push rbx
0x1006d638d: and rsp, 0xffffffffffffffe0
0x1006d6391: sub rsp, 0x5e0
0x1006d6398: mov r15, rdi
0x1006d639b: mov rax, qword ptr [rip + 0x537536] ; 0x100c0d8d8
0x1006d63a2: mov rax, qword ptr [rax]
0x1006d63a5: mov qword ptr [rsp + 0x5c0], rax
0x1006d63ad: vmovss xmm0, dword ptr [r15 + 0xa4]
0x1006d63b6: vxorps xmm1, xmm1, xmm1
0x1006d63ba: vucomiss xmm0, xmm1
0x1006d63be: jne 0x1006d63c2
0x1006d63c0: jnp 0x1006d63d2
0x1006d63c2: mov dword ptr [r15 + 0xa4], 0
0x1006d63cd: jmp 0x1006d8ec4 ; 0x1006d8ec4
0x1006d63d2: vmovss xmm0, dword ptr [r15 + 0x68]
0x1006d63d8: vmovss xmm4, dword ptr [r15 + 0x6c]
0x1006d63de: mov rbx, qword ptr [r15 + 0x48]
0x1006d63e2: mov r8, qword ptr [r15 + 0x58]
0x1006d63e6: mov r14d, dword ptr [rbx + 0x10]
0x1006d63ea: lea ecx, [r14 - 1]
0x1006d63ee: vcvtsi2ss xmm1, xmm2, rcx
0x1006d63f3: vmulss xmm1, xmm4, xmm1
0x1006d63f7: vaddss xmm5, xmm0, xmm1
0x1006d63fb: test r8, r8
0x1006d63fe: je 0x1006d8845
0x1006d6404: mov ecx, dword ptr [r8 + 0x480]
0x1006d640b: test ecx, ecx
0x1006d640d: je 0x1006d8fd2
0x1006d6413: lea rdx, [r15 + 8]
0x1006d6417: xor eax, eax
0x1006d6419: nop dword ptr [rax]
0x1006d6420: mov rdi, qword ptr [r8 + rax*8 + 0x80]
0x1006d6428: cmp qword ptr [rdi + 8], rdx
0x1006d642c: je 0x1006d6437
0x1006d642e: inc rax
0x1006d6431: cmp eax, ecx
0x1006d6433: jb 0x1006d6420
0x1006d6435: xor edi, edi
0x1006d6437: test rdi, rdi
0x1006d643a: je 0x1006d8fd2
0x1006d6440: vmovss xmm1, dword ptr [r15 + 0x9c]
0x1006d6449: vmovss xmm2, dword ptr [r8 + 0x108c]
0x1006d6452: vsubss xmm2, xmm2, dword ptr [rdi + 0x10]
0x1006d6457: vxorps xmm3, xmm3, xmm3
0x1006d645b: vmaxss xmm2, xmm3, xmm2
0x1006d645f: vminss xmm0, xmm0, xmm2
0x1006d6463: vmovss dword ptr [r15 + 0x9c], xmm0
0x1006d646c: vsubss xmm1, xmm1, xmm0
0x1006d6470: vmaxss xmm1, xmm3, xmm1
0x1006d6474: vmovss dword ptr [rsp + 0x4c], xmm1
0x1006d647a: cmp byte ptr [r15 + 0x7d], 0
0x1006d647f: je 0x1006d6490
0x1006d6481: mov dword ptr [r15 + 0x9c], 0
0x1006d648c: vxorps xmm0, xmm0, xmm0
0x1006d6490: vxorps xmm1, xmm1, xmm1
0x1006d6494: vucomiss xmm5, xmm1
0x1006d6498: jbe 0x1006d64b9
0x1006d649a: vdivss xmm0, xmm0, xmm5
0x1006d649e: vmaxss xmm0, xmm1, xmm0
0x1006d64a2: vmovss xmm1, dword ptr [rip + 0x3cec16] ; 0x100aa50c0
0x1006d64aa: vminss xmm0, xmm1, xmm0
0x1006d64ae: mov rax, qword ptr [r15 + 0x60]
0x1006d64b2: test rax, rax
0x1006d64b5: jne 0x1006d64ca
0x1006d64b7: jmp 0x1006d64cf ; 0x1006d64cf
0x1006d64b9: vmovss xmm0, dword ptr [rip + 0x3cebff] ; 0x100aa50c0
0x1006d64c1: mov rax, qword ptr [r15 + 0x60]
0x1006d64c5: test rax, rax
0x1006d64c8: je 0x1006d64cf
0x1006d64ca: vmovss xmm0, dword ptr [rax + 0x10]
0x1006d64cf: mov qword ptr [rsp + 0x128], rsi
0x1006d64d7: cmp byte ptr [r15 + 0x79], 0
0x1006d64dc: je 0x1006d6519
0x1006d64de: vmulss xmm0, xmm0, dword ptr [rip + 0x3d211a] ; 0x100aa8600
0x1006d64e6: vmovss dword ptr [rsp + 0x70], xmm4
0x1006d64ec: vmovss dword ptr [rsp + 0x80], xmm5
0x1006d64f5: call 0x100aa260c ; 0x100aa260c _cosf
0x1006d64fa: vmovss xmm5, dword ptr [rsp + 0x80]
0x1006d6503: vmovss xmm4, dword ptr [rsp + 0x70]
0x1006d6509: vmovss xmm1, dword ptr [rip + 0x3ce0a7] ; 0x100aa45b8
0x1006d6511: vmulss xmm0, xmm0, xmm1
0x1006d6515: vsubss xmm0, xmm1, xmm0
0x1006d6519: cmp byte ptr [r15 + 0x74], 0
0x1006d651e: vmovss xmm11, dword ptr [rip + 0x3ceb9a] ; 0x100aa50c0
0x1006d6526: je 0x1006d652c
0x1006d6528: vsubss xmm0, xmm11, xmm0
0x1006d652c: vsubss xmm1, xmm0, dword ptr [r15 + 0xa0]
0x1006d6535: vmovss dword ptr [rsp + 0xd4], xmm1
0x1006d653e: test r14d, r14d
0x1006d6541: vmovss dword ptr [rsp + 0xc], xmm0
0x1006d6547: je 0x1006d886c
0x1006d654d: vmulss xmm1, xmm5, xmm0
0x1006d6551: vmovss dword ptr [rsp + 0xd8], xmm1
0x1006d655a: vsubss xmm0, xmm11, xmm0
0x1006d655e: vmulss xmm0, xmm5, xmm0
0x1006d6562: vmovss dword ptr [rsp + 0xdc], xmm0
0x1006d656b: xor r14d, r14d
0x1006d656e: vxorps xmm8, xmm8, xmm8
0x1006d6573: vmovss xmm12, dword ptr [rip + 0x3d1349] ; 0x100aa78c4
0x1006d657b: vmovaps xmm13, xmmword ptr [rip + 0x3d137d] ; 0x100aa7900
0x1006d6583: vucomiss xmm8, xmm4
0x1006d6587: mov rax, qword ptr [r15 + 0x40]
0x1006d658b: jb 0x1006d65cd
0x1006d658d: nop dword ptr [rax]
0x1006d6590: vmovss xmm0, dword ptr [rsp + 0xc]
0x1006d6596: jmp 0x1006d6690 ; 0x1006d6690
0x1006d659b: nop dword ptr [rax + rax]
0x1006d65a0: vmovss xmm4, dword ptr [r15 + 0x6c]
0x1006d65a6: vmovss xmm11, dword ptr [rip + 0x3ceb12] ; 0x100aa50c0
0x1006d65ae: vxorps xmm8, xmm8, xmm8
0x1006d65b3: vmovss xmm12, dword ptr [rip + 0x3d1309] ; 0x100aa78c4
0x1006d65bb: vmovaps xmm13, xmmword ptr [rip + 0x3d133d] ; 0x100aa7900
0x1006d65c3: vucomiss xmm8, xmm4
0x1006d65c7: mov rax, qword ptr [r15 + 0x40]
0x1006d65cb: jae 0x1006d6590
0x1006d65cd: test rax, rax
0x1006d65d0: je 0x1006d6610
0x1006d65d2: vmovss xmm0, dword ptr [r15 + 0x68]
0x1006d65d8: vucomiss xmm0, xmm8
0x1006d65dd: jbe 0x1006d6620
0x1006d65df: cmp byte ptr [r15 + 0x74], 0
0x1006d65e4: mov ecx, r14d
0x1006d65e7: vcvtsi2ss xmm1, xmm14, rcx
0x1006d65ec: vmulss xmm1, xmm4, xmm1
0x1006d65f0: je 0x1006d666e
0x1006d65f2: vsubss xmm1, xmm1, dword ptr [rsp + 0xdc]
0x1006d65fb: vdivss xmm0, xmm1, xmm0
0x1006d65ff: vaddss xmm0, xmm0, xmm11
0x1006d6604: jmp 0x1006d667f ; 0x1006d667f
0x1006d6606: nop word ptr cs:[rax + rax]
0x1006d6610: xor eax, eax
0x1006d6612: vmovss xmm0, dword ptr [rsp + 0xc]
0x1006d6618: jmp 0x1006d6690 ; 0x1006d6690
0x1006d661a: nop word ptr [rax + rax]
0x1006d6620: cmp byte ptr [r15 + 0x7d], 0
0x1006d6625: je 0x1006d663a
0x1006d6627: vxorps xmm0, xmm0, xmm0
0x1006d662b: vmovaps xmmword ptr [rsp + 0x50], xmm0
0x1006d6631: cmp byte ptr [r15 + 0x74], 0
0x1006d6636: jne 0x1006d6662
0x1006d6638: jmp 0x1006d6696 ; 0x1006d6696
0x1006d663a: mov ecx, r14d
0x1006d663d: vcvtsi2ss xmm0, xmm14, rcx
0x1006d6642: vmulss xmm0, xmm4, xmm0
0x1006d6646: vcmpnless xmm0, xmm0, dword ptr [r15 + 0x9c]
0x1006d6650: vandnps xmm0, xmm0, xmm11
0x1006d6655: vmovaps xmmword ptr [rsp + 0x50], xmm0
0x1006d665b: cmp byte ptr [r15 + 0x74], 0
0x1006d6660: je 0x1006d6696
0x1006d6662: vmovaps xmm0, xmmword ptr [rsp + 0x50]
0x1006d6668: vsubss xmm0, xmm11, xmm0
0x1006d666c: jmp 0x1006d6690 ; 0x1006d6690
0x1006d666e: vmovss xmm2, dword ptr [rsp + 0xd8]
0x1006d6677: vsubss xmm1, xmm2, xmm1
0x1006d667b: vdivss xmm0, xmm1, xmm0
0x1006d667f: vmaxss xmm0, xmm8, xmm0
0x1006d6683: vminss xmm0, xmm11, xmm0
0x1006d6687: nop word ptr [rax + rax]
0x1006d6690: vmovaps xmmword ptr [rsp + 0x50], xmm0
0x1006d6696: test rax, rax
0x1006d6699: mov r12d, r14d
0x1006d669c: mov rcx, r12
0x1006d669f: cmove rcx, rax
0x1006d66a3: shl rcx, 6
0x1006d66a7: mov rdx, qword ptr [r15 + 0xb0]
0x1006d66ae: vmovaps xmm6, xmmword ptr [rdx + rcx]
0x1006d66b3: vmovaps xmm7, xmmword ptr [rdx + rcx + 0x10]
0x1006d66b9: vmovaps xmm5, xmmword ptr [rdx + rcx + 0x20]
0x1006d66bf: vmovaps xmm0, xmmword ptr [rdx + rcx + 0x30]
0x1006d66c5: test rax, rax
0x1006d66c8: je 0x1006d67b0
0x1006d66ce: vmovaps xmmword ptr [rsp + 0xb0], xmm0
0x1006d66d7: vmovaps xmmword ptr [rsp + 0x20], xmm6
0x1006d66dd: vmovaps xmmword ptr [rsp + 0x60], xmm5
0x1006d66e3: vmovaps xmmword ptr [rsp + 0x30], xmm7
0x1006d66e9: cmp dword ptr [rax + 0x10], r14d
0x1006d66ed: jbe 0x1006d8f91
0x1006d66f3: mov rax, qword ptr [rax + 8]
0x1006d66f7: mov rax, qword ptr [rax + r12*8]
0x1006d66fb: mov qword ptr [rsp + 0x540], rax
0x1006d6703: call 0x1007abc10 ; 0x1007abc10
0x1006d6708: mov r13, rax
0x1006d670b: mov qword ptr [rsp + 0x380], 0
0x1006d6717: call 0x1007abc10 ; 0x1007abc10
0x1006d671c: mov rbx, qword ptr [rax]
0x1006d671f: mov rdi, rax
0x1006d6722: lea rsi, [rsp + 0x380]
0x1006d672a: lea rdx, [rsp + 0x540]
0x1006d6732: mov rcx, r13
0x1006d6735: call qword ptr [rbx + 0x40]
0x1006d6738: mov rsi, qword ptr [rsp + 0x380]
0x1006d6740: test rsi, rsi
0x1006d6743: vmovss xmm11, dword ptr [rip + 0x3ce975] ; 0x100aa50c0
0x1006d674b: vxorps xmm8, xmm8, xmm8
0x1006d6750: vmovss xmm12, dword ptr [rip + 0x3d116c] ; 0x100aa78c4
0x1006d6758: vmovaps xmm13, xmmword ptr [rip + 0x3d11a0] ; 0x100aa7900
0x1006d6760: vmovaps xmm7, xmmword ptr [rsp + 0x30]
0x1006d6766: vmovaps xmm5, xmmword ptr [rsp + 0x60]
0x1006d676c: vmovaps xmm6, xmmword ptr [rsp + 0x20]
0x1006d6772: vmovaps xmm0, xmmword ptr [rsp + 0xb0]
0x1006d677b: je 0x1006d8f72
0x1006d6781: cmp byte ptr [r15 + 0x7c], 0
0x1006d6786: je 0x1006d67bb
0x1006d6788: vmovaps xmmword ptr [rsp + 0x380], xmm6
0x1006d6791: vmovaps xmmword ptr [rsp + 0x390], xmm7
0x1006d679a: vmovaps xmmword ptr [rsp + 0x3a0], xmm5
0x1006d67a3: vmovaps xmmword ptr [rsp + 0x3b0], xmm0
0x1006d67ac: jmp 0x1006d6800 ; 0x1006d6800
0x1006d67ae: nop 
0x1006d67b0: mov rsi, qword ptr [r15 + 0x38]
0x1006d67b4: cmp byte ptr [r15 + 0x7c], 0
0x1006d67b9: jne 0x1006d6788
0x1006d67bb: lea rdi, [rsp + 0x380]
0x1006d67c3: call 0x1004d1e40 ; 0x1004d1e40
0x1006d67c8: vmovaps xmm13, xmmword ptr [rip + 0x3d1130] ; 0x100aa7900
0x1006d67d0: vmovss xmm12, dword ptr [rip + 0x3d10ec] ; 0x100aa78c4
0x1006d67d8: vxorps xmm8, xmm8, xmm8
0x1006d67dd: vmovss xmm11, dword ptr [rip + 0x3ce8db] ; 0x100aa50c0
0x1006d67e5: vmovaps xmm6, xmmword ptr [rsp + 0x380]
0x1006d67ee: vmovaps xmm7, xmmword ptr [rsp + 0x390]
0x1006d67f7: vmovaps xmm5, xmmword ptr [rsp + 0x3a0]
0x1006d6800: vmulps xmm0, xmm6, xmm6
0x1006d6804: vmovshdup xmm1, xmm0
0x1006d6808: vaddss xmm1, xmm0, xmm1
0x1006d680c: vpermilpd xmm0, xmm0, 1
0x1006d6812: vaddss xmm0, xmm0, xmm1
0x1006d6816: vsqrtss xmm9, xmm0, xmm0
0x1006d681a: vmulps xmm0, xmm7, xmm7
0x1006d681e: vmovshdup xmm1, xmm0
0x1006d6822: vaddss xmm1, xmm0, xmm1
0x1006d6826: vpermilpd xmm0, xmm0, 1
0x1006d682c: vaddss xmm0, xmm0, xmm1
0x1006d6830: vsqrtss xmm2, xmm0, xmm0
0x1006d6834: vmulps xmm0, xmm5, xmm5
0x1006d6838: vmovshdup xmm1, xmm0
0x1006d683c: vaddss xmm1, xmm0, xmm1
0x1006d6840: vpermilpd xmm0, xmm0, 1
0x1006d6846: vaddss xmm0, xmm0, xmm1
0x1006d684a: vucomiss xmm9, xmm12
0x1006d684f: jbe 0x1006d685b
0x1006d6851: vpermilps xmm1, xmm9, 0xc0
0x1006d6857: vdivps xmm6, xmm6, xmm1
0x1006d685b: vsqrtss xmm1, xmm0, xmm0
0x1006d685f: vucomiss xmm2, xmm12
0x1006d6864: jbe 0x1006d6870
0x1006d6866: vpermilps xmm0, xmm2, 0xc0
0x1006d686c: vdivps xmm7, xmm7, xmm0
0x1006d6870: vucomiss xmm1, xmm12
0x1006d6875: vmovaps xmmword ptr [rsp + 0xb0], xmm2
0x1006d687e: vmovaps xmmword ptr [rsp + 0x10], xmm1
0x1006d6884: jbe 0x1006d6890
0x1006d6886: vpermilps xmm0, xmm1, 0xc0
0x1006d688c: vdivps xmm5, xmm5, xmm0
0x1006d6890: vpermilpd xmm3, xmm6, 1
0x1006d6896: vmovshdup xmm1, xmm7
0x1006d689a: vmovshdup xmm0, xmm5
0x1006d689e: vpermilpd xmm2, xmm5, 1
0x1006d68a4: vaddss xmm4, xmm6, xmm1
0x1006d68a8: vaddss xmm4, xmm4, xmm2
0x1006d68ac: vucomiss xmm8, xmm4
0x1006d68b0: seta sil
0x1006d68b4: vucomiss xmm2, xmm6
0x1006d68b8: seta dl
0x1006d68bb: vucomiss xmm2, xmm1
0x1006d68bf: seta al
0x1006d68c2: vucomiss xmm1, xmm6
0x1006d68c6: setbe bl
0x1006d68c9: seta dil
0x1006d68cd: or dil, dl
0x1006d68d0: or bl, al
0x1006d68d2: mov ecx, edi
0x1006d68d4: and cl, sil
0x1006d68d7: jne 0x1006d68e0
0x1006d68d9: vmovaps xmm4, xmm6
0x1006d68dd: jmp 0x1006d68ea ; 0x1006d68ea
0x1006d68df: nop 
0x1006d68e0: vxorps xmm4, xmm6, xmm13
0x1006d68e5: vxorps xmm0, xmm0, xmm13
0x1006d68ea: and dl, al
0x1006d68ec: vxorpd xmm10, xmm3, xmm13
0x1006d68f1: and bl, sil
0x1006d68f4: je 0x1006d68fb
0x1006d68f6: vxorps xmm1, xmm1, xmm13
0x1006d68fb: xor dl, 1
0x1006d68fe: test bl, bl
0x1006d6900: jne 0x1006d6906
0x1006d6902: vmovapd xmm10, xmm3
0x1006d6906: vmovshdup xmm6, xmm6
0x1006d690a: vpermilpd xmm3, xmm7, 1
0x1006d6910: and dl, sil
0x1006d6913: je 0x1006d691f
0x1006d6915: vxorps xmm2, xmm2, xmm13
0x1006d691a: vxorps xmm7, xmm7, xmm13
0x1006d691f: vaddss xmm1, xmm4, xmm1
0x1006d6923: vaddss xmm1, xmm2, xmm1
0x1006d6927: vaddss xmm1, xmm1, xmm11
0x1006d692c: vsqrtss xmm2, xmm1, xmm1
0x1006d6930: vdivss xmm2, xmm11, xmm2
0x1006d6934: vmulss xmm4, xmm2, dword ptr [rip + 0x3cdc7c] ; 0x100aa45b8
0x1006d693c: vsubss xmm0, xmm3, xmm0
0x1006d6940: vmulss xmm3, xmm4, xmm0
0x1006d6944: vsubss xmm0, xmm5, xmm10
0x1006d6949: vmulss xmm2, xmm4, xmm0
0x1006d694d: vsubss xmm0, xmm6, xmm7
0x1006d6951: vmulss xmm5, xmm4, xmm0
0x1006d6955: vmulss xmm0, xmm4, xmm1
0x1006d6959: jne 0x1006d6980
0x1006d695b: vmovaps xmm1, xmm2
0x1006d695f: vmovaps xmm2, xmm0
0x1006d6963: mov eax, edi
0x1006d6965: and al, sil
0x1006d6968: je 0x1006d6993
0x1006d696a: vmovaps xmm4, xmm2
0x1006d696e: vmovaps xmm2, xmm5
0x1006d6972: test dl, dl
0x1006d6974: je 0x1006d699b
0x1006d6976: jmp 0x1006d699f ; 0x1006d699f
0x1006d6978: nop dword ptr [rax + rax]
0x1006d6980: vmovaps xmm1, xmm5
0x1006d6984: vmovaps xmm5, xmm2
0x1006d6988: vmovaps xmm2, xmm3
0x1006d698c: mov eax, edi
0x1006d698e: and al, sil
0x1006d6991: jne 0x1006d696a
0x1006d6993: vmovaps xmm4, xmm5
0x1006d6997: test dl, dl
0x1006d6999: jne 0x1006d699f
0x1006d699b: vmovaps xmm0, xmm3
0x1006d699f: vmovaps xmm3, xmm0
0x1006d69a3: and dil, sil
0x1006d69a6: jne 0x1006d69c0
0x1006d69a8: vmovaps xmm3, xmm1
0x1006d69ac: test dil, dil
0x1006d69af: je 0x1006d69c5
0x1006d69b1: jmp 0x1006d69c9 ; 0x1006d69c9
0x1006d69b3: nop word ptr cs:[rax + rax]
0x1006d69c0: test dil, dil
0x1006d69c3: jne 0x1006d69c9
0x1006d69c5: vmovaps xmm1, xmm0
0x1006d69c9: vinsertps xmm0, xmm1, xmm3, 0x10
0x1006d69cf: vinsertps xmm0, xmm0, xmm4, 0x20
0x1006d69d5: vinsertps xmm15, xmm0, xmm2, 0x30
0x1006d69db: vmulps xmm0, xmm15, xmm15
0x1006d69e0: vpermilpd xmm1, xmm0, 1
0x1006d69e6: vaddps xmm0, xmm0, xmm1
0x1006d69ea: vmovshdup xmm1, xmm0
0x1006d69ee: vaddss xmm0, xmm0, xmm1
0x1006d69f2: vsqrtss xmm0, xmm0, xmm0
0x1006d69f6: vucomiss xmm0, xmm12
0x1006d69fb: vmovaps xmmword ptr [rsp + 0x20], xmm9
0x1006d6a01: jbe 0x1006d6a0d
0x1006d6a03: vpermilps xmm0, xmm0, 0
0x1006d6a09: vdivps xmm15, xmm15, xmm0
0x1006d6a0d: mov rax, qword ptr [r15 + 0xa8]
0x1006d6a14: mov rcx, r12
0x1006d6a17: shl rcx, 6
0x1006d6a1b: vmovaps xmm11, xmmword ptr [rax + rcx]
0x1006d6a20: vmovaps xmm4, xmmword ptr [rax + rcx + 0x10]
0x1006d6a26: vmovaps xmm5, xmmword ptr [rax + rcx + 0x20]
0x1006d6a2c: mov qword ptr [rsp + 0xc8], rcx
0x1006d6a34: vmovaps xmm10, xmmword ptr [rax + rcx + 0x30]
0x1006d6a3a: vmulps xmm0, xmm11, xmm11
0x1006d6a3f: vmovshdup xmm1, xmm0
0x1006d6a43: vaddss xmm1, xmm0, xmm1
0x1006d6a47: vpermilpd xmm0, xmm0, 1
0x1006d6a4d: vaddss xmm0, xmm0, xmm1
0x1006d6a51: vsqrtss xmm6, xmm0, xmm0
0x1006d6a55: vmulps xmm0, xmm4, xmm4
0x1006d6a59: vmovshdup xmm1, xmm0
0x1006d6a5d: vaddss xmm1, xmm0, xmm1
0x1006d6a61: vpermilpd xmm0, xmm0, 1
0x1006d6a67: vaddss xmm0, xmm0, xmm1
0x1006d6a6b: vsqrtss xmm3, xmm0, xmm0
0x1006d6a6f: vmulps xmm0, xmm5, xmm5
0x1006d6a73: vmovshdup xmm1, xmm0
0x1006d6a77: vaddss xmm1, xmm0, xmm1
0x1006d6a7b: vpermilpd xmm0, xmm0, 1
0x1006d6a81: vaddss xmm0, xmm0, xmm1
0x1006d6a85: vucomiss xmm6, xmm12
0x1006d6a8a: vmovaps xmm2, xmm11
0x1006d6a8e: jbe 0x1006d6a9a
0x1006d6a90: vpermilps xmm1, xmm6, 0xc0
0x1006d6a96: vdivps xmm2, xmm11, xmm1
0x1006d6a9a: vsqrtss xmm7, xmm0, xmm0
0x1006d6a9e: vucomiss xmm3, xmm12
0x1006d6aa3: vmovaps xmm0, xmm4
0x1006d6aa7: jbe 0x1006d6ab3
0x1006d6aa9: vpermilps xmm0, xmm3, 0xc0
0x1006d6aaf: vdivps xmm0, xmm4, xmm0
0x1006d6ab3: vmovaps xmmword ptr [rsp + 0x90], xmm3
0x1006d6abc: vmovaps xmmword ptr [rsp + 0xa0], xmm6
0x1006d6ac5: vmovaps xmmword ptr [rsp + 0x60], xmm4
0x1006d6acb: vucomiss xmm7, xmm12
0x1006d6ad0: vmovaps xmm1, xmm5
0x1006d6ad4: jbe 0x1006d6ae0
0x1006d6ad6: vpermilps xmm1, xmm7, 0xc0
0x1006d6adc: vdivps xmm1, xmm5, xmm1
0x1006d6ae0: vmovaps xmmword ptr [rsp + 0x110], xmm7
0x1006d6ae9: vmovaps xmmword ptr [rsp + 0x190], xmm5
0x1006d6af2: vpermilpd xmm14, xmm2, 1
0x1006d6af8: vmovshdup xmm4, xmm0
0x1006d6afc: vmovshdup xmm9, xmm1
0x1006d6b00: vpermilpd xmm5, xmm1, 1
0x1006d6b06: vaddss xmm6, xmm2, xmm4
0x1006d6b0a: vaddss xmm6, xmm6, xmm5
0x1006d6b0e: vucomiss xmm8, xmm6
0x1006d6b12: seta sil
0x1006d6b16: vucomiss xmm5, xmm2
0x1006d6b1a: seta dl
0x1006d6b1d: vucomiss xmm5, xmm4
0x1006d6b21: seta al
0x1006d6b24: vucomiss xmm4, xmm2
0x1006d6b28: setbe bl
0x1006d6b2b: seta dil
0x1006d6b2f: or dil, dl
0x1006d6b32: or bl, al
0x1006d6b34: mov ecx, edi
0x1006d6b36: and cl, sil
0x1006d6b39: vmovaps xmmword ptr [rsp + 0xf0], xmm15
0x1006d6b42: vmovaps xmmword ptr [rsp + 0x180], xmm11
0x1006d6b4b: vmovaps xmmword ptr [rsp + 0x130], xmm10
0x1006d6b54: jne 0x1006d6b60
0x1006d6b56: vmovaps xmm8, xmm2
0x1006d6b5a: jmp 0x1006d6b6a ; 0x1006d6b6a
0x1006d6b5c: nop dword ptr [rax]
0x1006d6b60: vxorps xmm8, xmm2, xmm13
0x1006d6b65: vxorps xmm9, xmm9, xmm13
0x1006d6b6a: and dl, al
0x1006d6b6c: vxorpd xmm10, xmm14, xmm13
0x1006d6b71: and bl, sil
0x1006d6b74: je 0x1006d6b7b
0x1006d6b76: vxorps xmm4, xmm4, xmm13
0x1006d6b7b: xor dl, 1
0x1006d6b7e: test bl, bl
0x1006d6b80: jne 0x1006d6b87
0x1006d6b82: vmovapd xmm10, xmm14
0x1006d6b87: vmovshdup xmm2, xmm2
0x1006d6b8b: vpermilpd xmm7, xmm0, 1
0x1006d6b91: and dl, sil
0x1006d6b94: je 0x1006d6ba0
0x1006d6b96: vxorps xmm5, xmm5, xmm13
0x1006d6b9b: vxorps xmm0, xmm0, xmm13
0x1006d6ba0: vaddss xmm4, xmm8, xmm4
0x1006d6ba4: vaddss xmm4, xmm5, xmm4
0x1006d6ba8: vmovss xmm3, dword ptr [rip + 0x3ce510] ; 0x100aa50c0
0x1006d6bb0: vmovaps xmm5, xmm3
0x1006d6bb4: vaddss xmm3, xmm4, xmm5
0x1006d6bb8: vsqrtss xmm4, xmm3, xmm3
0x1006d6bbc: vdivss xmm4, xmm5, xmm4
0x1006d6bc0: vmulss xmm6, xmm4, dword ptr [rip + 0x3cd9f0] ; 0x100aa45b8
0x1006d6bc8: vsubss xmm4, xmm7, xmm9
0x1006d6bcd: vmulss xmm7, xmm6, xmm4
0x1006d6bd1: vsubss xmm1, xmm1, xmm10
0x1006d6bd6: vmulss xmm4, xmm6, xmm1
0x1006d6bda: vsubss xmm0, xmm2, xmm0
0x1006d6bde: vmulss xmm5, xmm6, xmm0
0x1006d6be2: vmulss xmm0, xmm6, xmm3
0x1006d6be6: jne 0x1006d6c10
0x1006d6be8: vmovaps xmm1, xmm4
0x1006d6bec: vmovaps xmm2, xmm0
0x1006d6bf0: mov eax, edi
0x1006d6bf2: and al, sil
0x1006d6bf5: je 0x1006d6c23
0x1006d6bf7: vmovaps xmm4, xmm2
0x1006d6bfb: vmovaps xmm2, xmm5
0x1006d6bff: test dl, dl
0x1006d6c01: je 0x1006d6c2b
0x1006d6c03: jmp 0x1006d6c2f ; 0x1006d6c2f
0x1006d6c05: nop word ptr cs:[rax + rax]
0x1006d6c10: vmovaps xmm1, xmm5
0x1006d6c14: vmovaps xmm5, xmm4
0x1006d6c18: vmovaps xmm2, xmm7
0x1006d6c1c: mov eax, edi
0x1006d6c1e: and al, sil
0x1006d6c21: jne 0x1006d6bf7
0x1006d6c23: vmovaps xmm4, xmm5
0x1006d6c27: test dl, dl
0x1006d6c29: jne 0x1006d6c2f
0x1006d6c2b: vmovaps xmm0, xmm7
0x1006d6c2f: vmovaps xmm3, xmm0
0x1006d6c33: and dil, sil
0x1006d6c36: jne 0x1006d6c50
0x1006d6c38: vmovaps xmm3, xmm1
0x1006d6c3c: test dil, dil
0x1006d6c3f: je 0x1006d6c55
0x1006d6c41: jmp 0x1006d6c59 ; 0x1006d6c59
0x1006d6c43: nop word ptr cs:[rax + rax]
0x1006d6c50: test dil, dil
0x1006d6c53: jne 0x1006d6c59
0x1006d6c55: vmovaps xmm1, xmm0
0x1006d6c59: vinsertps xmm0, xmm1, xmm3, 0x10
0x1006d6c5f: vinsertps xmm0, xmm0, xmm4, 0x20
0x1006d6c65: vinsertps xmm2, xmm0, xmm2, 0x30
0x1006d6c6b: vmulps xmm0, xmm2, xmm2
0x1006d6c6f: vpermilpd xmm1, xmm0, 1
0x1006d6c75: vaddps xmm0, xmm0, xmm1
0x1006d6c79: vmovshdup xmm1, xmm0
0x1006d6c7d: vaddss xmm0, xmm0, xmm1
0x1006d6c81: vsqrtss xmm0, xmm0, xmm0
0x1006d6c85: vucomiss xmm0, xmm12
0x1006d6c8a: jbe 0x1006d6c96
0x1006d6c8c: vpermilps xmm0, xmm0, 0
0x1006d6c92: vdivps xmm2, xmm2, xmm0
0x1006d6c96: vmovaps xmmword ptr [rsp + 0xe0], xmm2
0x1006d6c9f: mov r13, r15
0x1006d6ca2: mov rax, qword ptr [r15 + 0x48]
0x1006d6ca6: mov r15, r14
0x1006d6ca9: cmp dword ptr [rax + 0x10], r14d
0x1006d6cad: jbe 0x1006d8f91
0x1006d6cb3: mov rax, qword ptr [rax + 8]
0x1006d6cb7: mov qword ptr [rsp + 0x30], r12
0x1006d6cbc: mov rax, qword ptr [rax + r12*8]
0x1006d6cc0: mov qword ptr [rsp + 0x1e0], rax
0x1006d6cc8: call 0x1007abc10 ; 0x1007abc10
0x1006d6ccd: mov r12, rax
0x1006d6cd0: mov qword ptr [rsp + 0x540], 0
0x1006d6cdc: call 0x1007abc10 ; 0x1007abc10
0x1006d6ce1: mov rbx, qword ptr [rax]
0x1006d6ce4: mov rdi, rax
0x1006d6ce7: lea rsi, [rsp + 0x540]
0x1006d6cef: lea r14, [rsp + 0x1e0]
0x1006d6cf7: mov rdx, r14
0x1006d6cfa: mov rcx, r12
0x1006d6cfd: call qword ptr [rbx + 0x40]
0x1006d6d00: mov rsi, qword ptr [rsp + 0x540]
0x1006d6d08: test rsi, rsi
0x1006d6d0b: je 0x1006d8f72
0x1006d6d11: mov rdi, r14
0x1006d6d14: call 0x1004d1e40 ; 0x1004d1e40
0x1006d6d19: vmovaps xmm5, xmmword ptr [rsp + 0x1e0]
0x1006d6d22: vmovaps xmm3, xmmword ptr [rsp + 0x1f0]
0x1006d6d2b: vmovaps xmm4, xmmword ptr [rsp + 0x200]
0x1006d6d34: vmulps xmm0, xmm5, xmm5
0x1006d6d38: vmovshdup xmm1, xmm0
0x1006d6d3c: vaddss xmm1, xmm0, xmm1
0x1006d6d40: vpermilpd xmm0, xmm0, 1
0x1006d6d46: vaddss xmm0, xmm0, xmm1
0x1006d6d4a: vsqrtss xmm8, xmm0, xmm0
0x1006d6d4e: vmulps xmm0, xmm3, xmm3
0x1006d6d52: vmovshdup xmm1, xmm0
0x1006d6d56: vaddss xmm1, xmm0, xmm1
0x1006d6d5a: vpermilpd xmm0, xmm0, 1
0x1006d6d60: vaddss xmm0, xmm0, xmm1
0x1006d6d64: vsqrtss xmm9, xmm0, xmm0
0x1006d6d68: vmulps xmm0, xmm4, xmm4
0x1006d6d6c: vmovshdup xmm1, xmm0
0x1006d6d70: vaddss xmm1, xmm0, xmm1
0x1006d6d74: vpermilpd xmm0, xmm0, 1
0x1006d6d7a: vaddss xmm0, xmm0, xmm1
0x1006d6d7e: vmovss xmm13, dword ptr [rip + 0x3d0b3e] ; 0x100aa78c4
0x1006d6d86: vucomiss xmm8, xmm13
0x1006d6d8b: jbe 0x1006d6d97
0x1006d6d8d: vpermilps xmm1, xmm8, 0xc0
0x1006d6d93: vdivps xmm5, xmm5, xmm1
0x1006d6d97: vmovss xmm14, dword ptr [rip + 0x3ce321] ; 0x100aa50c0
0x1006d6d9f: vxorps xmm12, xmm12, xmm12
0x1006d6da4: vmovaps xmm15, xmmword ptr [rip + 0x3d0b54] ; 0x100aa7900
0x1006d6dac: mov r14, r15
0x1006d6daf: mov r12, qword ptr [rsp + 0x30]
0x1006d6db4: vsqrtss xmm10, xmm0, xmm0
0x1006d6db8: vucomiss xmm9, xmm13
0x1006d6dbd: mov r15, r13
0x1006d6dc0: jbe 0x1006d6dcc
0x1006d6dc2: vpermilps xmm0, xmm9, 0xc0
0x1006d6dc8: vdivps xmm3, xmm3, xmm0
0x1006d6dcc: vucomiss xmm10, xmm13
0x1006d6dd1: jbe 0x1006d6ddd
0x1006d6dd3: vpermilps xmm0, xmm10, 0xc0
0x1006d6dd9: vdivps xmm4, xmm4, xmm0
0x1006d6ddd: vpermilpd xmm2, xmm5, 1
0x1006d6de3: vmovshdup xmm7, xmm3
0x1006d6de7: vmovshdup xmm6, xmm4
0x1006d6deb: vpermilpd xmm0, xmm4, 1
0x1006d6df1: vaddss xmm1, xmm5, xmm7
0x1006d6df5: vaddss xmm1, xmm1, xmm0
0x1006d6df9: vucomiss xmm12, xmm1
0x1006d6dfd: seta sil
0x1006d6e01: vucomiss xmm0, xmm5
0x1006d6e05: seta dl
0x1006d6e08: vucomiss xmm0, xmm7
0x1006d6e0c: seta cl
0x1006d6e0f: vucomiss xmm7, xmm5
0x1006d6e13: setbe bl
0x1006d6e16: seta dil
0x1006d6e1a: or dil, dl
0x1006d6e1d: or bl, cl
0x1006d6e1f: mov eax, edi
0x1006d6e21: and al, sil
0x1006d6e24: jne 0x1006d6e30
0x1006d6e26: vmovaps xmm11, xmm5
0x1006d6e2a: jmp 0x1006d6e3a ; 0x1006d6e3a
0x1006d6e2c: nop dword ptr [rax]
0x1006d6e30: vxorps xmm11, xmm5, xmm15
0x1006d6e35: vxorps xmm6, xmm6, xmm15
0x1006d6e3a: and dl, cl
0x1006d6e3c: vxorpd xmm1, xmm2, xmm15
0x1006d6e41: and bl, sil
0x1006d6e44: je 0x1006d6e4b
0x1006d6e46: vxorps xmm7, xmm7, xmm15
0x1006d6e4b: xor dl, 1
0x1006d6e4e: test bl, bl
0x1006d6e50: jne 0x1006d6e56
0x1006d6e52: vmovapd xmm1, xmm2
0x1006d6e56: vmovshdup xmm2, xmm5
0x1006d6e5a: vpermilpd xmm5, xmm3, 1
0x1006d6e60: and dl, sil
0x1006d6e63: je 0x1006d6e6f
0x1006d6e65: vxorps xmm0, xmm0, xmm15
0x1006d6e6a: vxorps xmm3, xmm3, xmm15
0x1006d6e6f: vaddss xmm7, xmm11, xmm7
0x1006d6e73: vaddss xmm0, xmm0, xmm7
0x1006d6e77: vaddss xmm0, xmm0, xmm14
0x1006d6e7c: vsqrtss xmm7, xmm0, xmm0
0x1006d6e80: vdivss xmm7, xmm14, xmm7
0x1006d6e84: vmulss xmm7, xmm7, dword ptr [rip + 0x3cd72c] ; 0x100aa45b8
0x1006d6e8c: vsubss xmm5, xmm5, xmm6
0x1006d6e90: vmulss xmm5, xmm7, xmm5
0x1006d6e94: vsubss xmm1, xmm4, xmm1
0x1006d6e98: vmulss xmm4, xmm7, xmm1
0x1006d6e9c: vsubss xmm1, xmm2, xmm3
0x1006d6ea0: vmulss xmm1, xmm7, xmm1
0x1006d6ea4: vmulss xmm0, xmm7, xmm0
0x1006d6ea8: jne 0x1006d6ec0
0x1006d6eaa: vmovaps xmm2, xmm4
0x1006d6eae: vmovaps xmm3, xmm0
0x1006d6eb2: jmp 0x1006d6ecc ; 0x1006d6ecc
0x1006d6eb4: nop word ptr cs:[rax + rax]
0x1006d6ec0: vmovaps xmm2, xmm1
0x1006d6ec4: vmovaps xmm1, xmm4
0x1006d6ec8: vmovaps xmm3, xmm5
0x1006d6ecc: vmovaps xmm11, xmmword ptr [rip + 0x3d0a2c] ; 0x100aa7900
0x1006d6ed4: vmovaps xmm7, xmmword ptr [rsp + 0x20]
0x1006d6eda: mov eax, edi
0x1006d6edc: and al, sil
0x1006d6edf: jne 0x1006d6ef0
0x1006d6ee1: vmovaps xmm4, xmm1
0x1006d6ee5: test dl, dl
0x1006d6ee7: je 0x1006d6efc
0x1006d6ee9: jmp 0x1006d6f00 ; 0x1006d6f00
0x1006d6eeb: nop dword ptr [rax + rax]
0x1006d6ef0: vmovaps xmm4, xmm3
0x1006d6ef4: vmovaps xmm3, xmm1
0x1006d6ef8: test dl, dl
0x1006d6efa: jne 0x1006d6f00
0x1006d6efc: vmovaps xmm0, xmm5
0x1006d6f00: vmovaps xmm6, xmm0
0x1006d6f04: and dil, sil
0x1006d6f07: jne 0x1006d6f0d
0x1006d6f09: vmovaps xmm6, xmm2
0x1006d6f0d: vinsertps xmm1, xmm7, dword ptr [rsp + 0xb0], 0x10
0x1006d6f18: vmovaps xmm5, xmmword ptr [rsp + 0xa0]
0x1006d6f21: vinsertps xmm5, xmm5, dword ptr [rsp + 0x90], 0x10
0x1006d6f2c: vinsertps xmm7, xmm8, xmm9, 0x10
0x1006d6f32: test dil, dil
0x1006d6f35: jne 0x1006d6f3b
0x1006d6f37: vmovaps xmm2, xmm0
0x1006d6f3b: vinsertps xmm0, xmm1, dword ptr [rsp + 0x10], 0x20
0x1006d6f43: vinsertps xmm1, xmm5, dword ptr [rsp + 0x110], 0x20
0x1006d6f4e: vinsertps xmm5, xmm7, xmm10, 0x20
0x1006d6f54: vinsertps xmm2, xmm2, xmm6, 0x10
0x1006d6f5a: vinsertps xmm2, xmm2, xmm4, 0x20
0x1006d6f60: vinsertps xmm10, xmm2, xmm3, 0x30
0x1006d6f66: vmulps xmm2, xmm10, xmm10
0x1006d6f6b: vpermilpd xmm3, xmm2, 1
0x1006d6f71: vaddps xmm2, xmm2, xmm3
0x1006d6f75: vmovshdup xmm3, xmm2
0x1006d6f79: vaddss xmm2, xmm2, xmm3
0x1006d6f7d: vsqrtss xmm2, xmm2, xmm2
0x1006d6f81: vucomiss xmm2, xmm13
0x1006d6f86: vmovaps xmm8, xmmword ptr [rsp + 0x60]
0x1006d6f8c: jbe 0x1006d6f98
0x1006d6f8e: vpermilps xmm2, xmm2, 0
0x1006d6f94: vdivps xmm10, xmm10, xmm2
0x1006d6f98: vmovaps xmm2, xmmword ptr [rsp + 0x80]
0x1006d6fa1: vblendps xmm2, xmm0, xmm2, 8
0x1006d6fa7: vmovaps xmmword ptr [rsp + 0x80], xmm2
0x1006d6fb0: vmovaps xmm2, xmmword ptr [rsp + 0x100]
0x1006d6fb9: vblendps xmm2, xmm1, xmm2, 8
0x1006d6fbf: vmovaps xmmword ptr [rsp + 0x100], xmm2
0x1006d6fc8: vmovaps xmm2, xmmword ptr [rsp + 0x70]
0x1006d6fce: vblendps xmm2, xmm5, xmm2, 8
0x1006d6fd4: vmovaps xmmword ptr [rsp + 0x70], xmm2
0x1006d6fda: cmp byte ptr [r15 + 0x78], 0
0x1006d6fdf: je 0x1006d7200
0x1006d6fe5: vmovss xmm0, dword ptr [r15 + 0x68]
0x1006d6feb: vucomiss xmm0, xmm12
0x1006d6ff0: vmovaps xmm2, xmm14
0x1006d6ff4: vmovaps xmm5, xmmword ptr [rsp + 0x190]
0x1006d6ffd: jbe 0x1006d7009
0x1006d6fff: vdivss xmm0, xmm14, xmm0
0x1006d7003: vmulss xmm2, xmm0, dword ptr [rsp + 0x4c]
0x1006d7009: vmovaps xmm0, xmmword ptr [rsp + 0x3b0]
0x1006d7012: vsubps xmm0, xmm0, xmmword ptr [rsp + 0x130]
0x1006d701b: cmp byte ptr [r15 + 0x75], 0
0x1006d7020: vxorps xmm11, xmm11, xmm11
0x1006d7025: vxorps xmm1, xmm1, xmm1
0x1006d7029: je 0x1006d702f
0x1006d702b: vmovaps xmm1, xmm14
0x1006d702f: vpermilps xmm1, xmm1, 0xc0
0x1006d7035: vmulps xmm0, xmm0, xmm1
0x1006d7039: vpermilps xmm1, xmm2, 0xc0
0x1006d703f: vmulps xmm0, xmm1, xmm0
0x1006d7043: vaddps xmm9, xmm0, xmmword ptr [rsp + 0x210]
0x1006d704c: cmp byte ptr [r15 + 0x77], 0
0x1006d7051: je 0x1006d7058
0x1006d7053: vmovaps xmm11, xmm14
0x1006d7058: cmp byte ptr [r15 + 0x76], 0
0x1006d705d: je 0x1006d77d7
0x1006d7063: vmovaps xmmword ptr [rsp + 0x30], xmm2
0x1006d7069: vpermilps xmm1, xmm8, 0xd2
0x1006d706f: vmovaps xmm6, xmmword ptr [rsp + 0x180]
0x1006d7078: vpermilps xmm2, xmm6, 0xd2
0x1006d707e: vmulps xmm0, xmm2, xmm8
0x1006d7083: vmulps xmm3, xmm6, xmm1
0x1006d7087: vsubps xmm0, xmm0, xmm3
0x1006d708b: vpermilps xmm0, xmm0, 0xd2
0x1006d7091: vmulps xmm3, xmm5, xmm0
0x1006d7095: vmovshdup xmm4, xmm3
0x1006d7099: vaddss xmm4, xmm3, xmm4
0x1006d709d: vpermilpd xmm3, xmm3, 1
0x1006d70a3: vaddss xmm3, xmm3, xmm4
0x1006d70a7: vdivss xmm3, xmm14, xmm3
0x1006d70ab: vucomiss xmm3, xmm3
0x1006d70af: jp 0x1006d8fb3
0x1006d70b5: vpermilps xmm4, xmm5, 0xd2
0x1006d70bb: vmovaps xmm7, xmm5
0x1006d70bf: vmulps xmm5, xmm6, xmm4
0x1006d70c3: vmulps xmm2, xmm2, xmm7
0x1006d70c7: vsubps xmm2, xmm5, xmm2
0x1006d70cb: vpermilps xmm2, xmm2, 0xd2
0x1006d70d1: vmulps xmm1, xmm1, xmm7
0x1006d70d5: vmulps xmm4, xmm8, xmm4
0x1006d70d9: vsubps xmm1, xmm1, xmm4
0x1006d70dd: vpermilps xmm1, xmm1, 0xd2
0x1006d70e3: vpermilps xmm3, xmm3, 0xc0
0x1006d70e9: vmulps xmm4, xmm1, xmm3
0x1006d70ed: vmulps xmm2, xmm2, xmm3
0x1006d70f1: vmulps xmm1, xmm0, xmm3
0x1006d70f5: vunpcklps xmm0, xmm4, xmm2
0x1006d70f9: vunpckhps xmm3, xmm4, xmm2
0x1006d70fd: vunpcklpd xmm2, xmm0, xmm1
0x1006d7101: vshufps xmm0, xmm0, xmm1, 0xde
0x1006d7106: vmulps xmm4, xmm2, xmm2
0x1006d710a: vmovshdup xmm5, xmm4
0x1006d710e: vaddss xmm5, xmm4, xmm5
0x1006d7112: vpermilpd xmm4, xmm4, 1
0x1006d7118: vaddss xmm4, xmm4, xmm5
0x1006d711c: vsqrtss xmm4, xmm4, xmm4
0x1006d7120: vucomiss xmm4, xmm13
0x1006d7125: jbe 0x1006d7131
0x1006d7127: vpermilps xmm4, xmm4, 0xc0
0x1006d712d: vdivps xmm2, xmm2, xmm4
0x1006d7131: vblendpd xmm1, xmm1, xmm3, 1
0x1006d7137: vmulps xmm3, xmm0, xmm0
0x1006d713b: vmovshdup xmm4, xmm3
0x1006d713f: vaddss xmm4, xmm3, xmm4
0x1006d7143: vpermilpd xmm3, xmm3, 1
0x1006d7149: vaddss xmm3, xmm3, xmm4
0x1006d714d: vsqrtss xmm3, xmm3, xmm3
0x1006d7151: vucomiss xmm3, xmm13
0x1006d7156: jbe 0x1006d7162
0x1006d7158: vpermilps xmm3, xmm3, 0xc0
0x1006d715e: vdivps xmm0, xmm0, xmm3
0x1006d7162: vmulps xmm3, xmm1, xmm1
0x1006d7166: vmovshdup xmm4, xmm3
0x1006d716a: vaddss xmm4, xmm3, xmm4
0x1006d716e: vpermilpd xmm3, xmm3, 1
0x1006d7174: vaddss xmm3, xmm3, xmm4
0x1006d7178: vsqrtss xmm3, xmm3, xmm3
0x1006d717c: vucomiss xmm3, xmm13
0x1006d7181: vmovaps xmmword ptr [rsp + 0xb0], xmm9
0x1006d718a: jbe 0x1006d7196
0x1006d718c: vpermilps xmm3, xmm3, 0xc0
0x1006d7192: vdivps xmm1, xmm1, xmm3
0x1006d7196: vpermilpd xmm7, xmm2, 1
0x1006d719c: vmovshdup xmm4, xmm0
0x1006d71a0: vmovshdup xmm9, xmm1
0x1006d71a4: vpermilpd xmm5, xmm1, 1
0x1006d71aa: vaddss xmm6, xmm2, xmm4
0x1006d71ae: vaddss xmm6, xmm6, xmm5
0x1006d71b2: vucomiss xmm12, xmm6
0x1006d71b6: seta sil
0x1006d71ba: vucomiss xmm5, xmm2
0x1006d71be: seta dl
0x1006d71c1: vucomiss xmm5, xmm4
0x1006d71c5: seta al
0x1006d71c8: vucomiss xmm4, xmm2
0x1006d71cc: setbe bl
0x1006d71cf: seta dil
0x1006d71d3: or dil, dl
0x1006d71d6: or bl, al
0x1006d71d8: mov ecx, edi
0x1006d71da: and cl, sil
0x1006d71dd: vmovaps xmmword ptr [rsp + 0x20], xmm10
0x1006d71e3: jne 0x1006d7450
0x1006d71e9: vmovaps xmm8, xmm2
0x1006d71ed: jmp 0x1006d745a ; 0x1006d745a
0x1006d71f2: nop word ptr cs:[rax + rax]
0x1006d7200: mov al, byte ptr [r15 + 0x75]
0x1006d7204: test al, al
0x1006d7206: je 0x1006d7930
0x1006d720c: cmp byte ptr [r15 + 0x79], 0
0x1006d7211: vmovaps xmm5, xmmword ptr [rsp + 0x50]
0x1006d7217: vmovaps xmm2, xmm5
0x1006d721b: je 0x1006d724d
0x1006d721d: vmaxss xmm2, xmm12, xmm5
0x1006d7221: vminss xmm2, xmm14, xmm2
0x1006d7225: vmulss xmm3, xmm2, xmm2
0x1006d7229: vmulss xmm3, xmm2, xmm3
0x1006d722d: vmulss xmm4, xmm2, dword ptr [rip + 0x3cf86f] ; 0x100aa6aa4
0x1006d7235: vaddss xmm4, xmm4, dword ptr [rip + 0x3d243f] ; 0x100aa967c
0x1006d723d: vmulss xmm2, xmm2, xmm4
0x1006d7241: vaddss xmm2, xmm2, dword ptr [rip + 0x3d0593] ; 0x100aa77dc
0x1006d7249: vmulss xmm2, xmm3, xmm2
0x1006d724d: mov cl, byte ptr [r15 + 0x7a]
0x1006d7251: test cl, cl
0x1006d7253: sete bl
0x1006d7256: vsubss xmm3, xmm14, xmm2
0x1006d725a: vpermilps xmm3, xmm3, 0xc0
0x1006d7260: vmulps xmm3, xmm3, xmmword ptr [rsp + 0x130]
0x1006d7269: vpermilps xmm2, xmm2, 0xc0
0x1006d726f: vmulps xmm2, xmm2, xmmword ptr [rsp + 0x3b0]
0x1006d7278: vaddps xmm8, xmm2, xmm3
0x1006d727c: test al, al
0x1006d727e: je 0x1006d72aa
0x1006d7280: test cl, cl
0x1006d7282: je 0x1006d72aa
0x1006d7284: mov rax, qword ptr [r15 + 0xa8]
0x1006d728b: mov rcx, qword ptr [r15 + 0xb8]
0x1006d7292: mov rdx, qword ptr [rsp + 0xc8]
0x1006d729a: vmovaps xmm2, xmmword ptr [rcx + rdx + 0x30]
0x1006d72a0: vsubps xmm2, xmm2, xmmword ptr [rax + rdx + 0x30]
0x1006d72a6: vaddps xmm8, xmm8, xmm2
0x1006d72aa: mov al, byte ptr [r15 + 0x77]
0x1006d72ae: test al, al
0x1006d72b0: je 0x1006d7953
0x1006d72b6: cmp byte ptr [r15 + 0x79], 0
0x1006d72bb: vmovaps xmm2, xmm5
0x1006d72bf: je 0x1006d72f1
0x1006d72c1: vmaxss xmm2, xmm12, xmm5
0x1006d72c5: vminss xmm2, xmm14, xmm2
0x1006d72c9: vmulss xmm3, xmm2, xmm2
0x1006d72cd: vmulss xmm3, xmm2, xmm3
0x1006d72d1: vmulss xmm4, xmm2, dword ptr [rip + 0x3cf7cb] ; 0x100aa6aa4
0x1006d72d9: vaddss xmm4, xmm4, dword ptr [rip + 0x3d239b] ; 0x100aa967c
0x1006d72e1: vmulss xmm2, xmm2, xmm4
0x1006d72e5: vaddss xmm2, xmm2, dword ptr [rip + 0x3d04ef] ; 0x100aa77dc
0x1006d72ed: vmulss xmm2, xmm3, xmm2
0x1006d72f1: test al, al
0x1006d72f3: sete al
0x1006d72f6: vsubss xmm3, xmm14, xmm2
0x1006d72fa: vpermilps xmm3, xmm3, 0xc0
0x1006d7300: vmulps xmm1, xmm3, xmm1
0x1006d7304: vpermilps xmm2, xmm2, 0xc0
0x1006d730a: vmulps xmm0, xmm2, xmm0
0x1006d730e: vaddps xmm7, xmm0, xmm1
0x1006d7312: or al, bl
0x1006d7314: jne 0x1006d7959
0x1006d731a: mov rax, qword ptr [r15 + 0xa8]
0x1006d7321: mov rcx, qword ptr [r15 + 0xb8]
0x1006d7328: mov rdx, qword ptr [rsp + 0xc8]
0x1006d7330: vmovaps xmm0, xmmword ptr [rcx + rdx]
0x1006d7335: vmovaps xmm1, xmmword ptr [rcx + rdx + 0x10]
0x1006d733b: vmovaps xmm2, xmmword ptr [rcx + rdx + 0x20]
0x1006d7341: vmulps xmm0, xmm0, xmm0
0x1006d7345: vmovshdup xmm3, xmm0
0x1006d7349: vaddss xmm3, xmm0, xmm3
0x1006d734d: vpermilpd xmm0, xmm0, 1
0x1006d7353: vaddss xmm0, xmm0, xmm3
0x1006d7357: vsqrtss xmm0, xmm0, xmm0
0x1006d735b: vmulps xmm1, xmm1, xmm1
0x1006d735f: vmovshdup xmm3, xmm1
0x1006d7363: vaddss xmm3, xmm1, xmm3
0x1006d7367: vpermilpd xmm1, xmm1, 1
0x1006d736d: vaddss xmm1, xmm1, xmm3
0x1006d7371: vsqrtss xmm1, xmm1, xmm1
0x1006d7375: vmulps xmm2, xmm2, xmm2
0x1006d7379: vmovshdup xmm3, xmm2
0x1006d737d: vaddss xmm3, xmm2, xmm3
0x1006d7381: vpermilpd xmm2, xmm2, 1
0x1006d7387: vaddss xmm2, xmm2, xmm3
0x1006d738b: vsqrtss xmm2, xmm2, xmm2
0x1006d738f: vinsertps xmm0, xmm0, xmm1, 0x10
0x1006d7395: vinsertps xmm0, xmm0, xmm2, 0x20
0x1006d739b: vmovaps xmm4, xmmword ptr [rsp + 0x270]
0x1006d73a4: vblendps xmm4, xmm0, xmm4, 8
0x1006d73aa: vmovaps xmm0, xmmword ptr [rax + rdx]
0x1006d73af: vmovaps xmm1, xmmword ptr [rax + rdx + 0x10]
0x1006d73b5: vmovaps xmm2, xmmword ptr [rax + rdx + 0x20]
0x1006d73bb: vmulps xmm0, xmm0, xmm0
0x1006d73bf: vmovshdup xmm3, xmm0
0x1006d73c3: vaddss xmm3, xmm0, xmm3
0x1006d73c7: vpermilpd xmm0, xmm0, 1
0x1006d73cd: vaddss xmm0, xmm0, xmm3
0x1006d73d1: vsqrtss xmm0, xmm0, xmm0
0x1006d73d5: vmulps xmm1, xmm1, xmm1
0x1006d73d9: vmovshdup xmm3, xmm1
0x1006d73dd: vaddss xmm3, xmm1, xmm3
0x1006d73e1: vpermilpd xmm1, xmm1, 1
0x1006d73e7: vaddss xmm1, xmm1, xmm3
0x1006d73eb: vsqrtss xmm1, xmm1, xmm1
0x1006d73ef: vmulps xmm2, xmm2, xmm2
0x1006d73f3: vmovshdup xmm3, xmm2
0x1006d73f7: vaddss xmm3, xmm2, xmm3
0x1006d73fb: vpermilpd xmm2, xmm2, 1
0x1006d7401: vaddss xmm2, xmm2, xmm3
0x1006d7405: vsqrtss xmm2, xmm2, xmm2
0x1006d7409: vinsertps xmm0, xmm0, xmm1, 0x10
0x1006d740f: vinsertps xmm0, xmm0, xmm2, 0x20
0x1006d7415: vmovaps xmm1, xmmword ptr [rsp + 0x260]
0x1006d741e: vblendps xmm1, xmm0, xmm1, 8
0x1006d7424: vmovaps xmmword ptr [rsp + 0x270], xmm4
0x1006d742d: vmovaps xmmword ptr [rsp + 0x260], xmm1
0x1006d7436: vsubps xmm0, xmm4, xmm1
0x1006d743a: vaddps xmm7, xmm7, xmm0
0x1006d743e: jmp 0x1006d7959 ; 0x1006d7959
0x1006d7443: nop word ptr cs:[rax + rax]
0x1006d7450: vxorps xmm8, xmm2, xmm15
0x1006d7455: vxorps xmm9, xmm9, xmm15
0x1006d745a: and dl, al
0x1006d745c: vxorpd xmm10, xmm7, xmm15
0x1006d7461: and bl, sil
0x1006d7464: je 0x1006d746b
0x1006d7466: vxorps xmm4, xmm4, xmm15
0x1006d746b: xor dl, 1
0x1006d746e: test bl, bl
0x1006d7470: jne 0x1006d7476
0x1006d7472: vmovapd xmm10, xmm7
0x1006d7476: vmovshdup xmm2, xmm2
0x1006d747a: vpermilpd xmm7, xmm0, 1
0x1006d7480: and dl, sil
0x1006d7483: je 0x1006d748f
0x1006d7485: vxorps xmm5, xmm5, xmm15
0x1006d748a: vxorps xmm0, xmm0, xmm15
0x1006d748f: vaddss xmm4, xmm8, xmm4
0x1006d7493: vaddss xmm4, xmm5, xmm4
0x1006d7497: vaddss xmm3, xmm4, xmm14
0x1006d749c: vsqrtss xmm4, xmm3, xmm3
0x1006d74a0: vdivss xmm4, xmm14, xmm4
0x1006d74a4: vmulss xmm6, xmm4, dword ptr [rip + 0x3cd10c] ; 0x100aa45b8
0x1006d74ac: vsubss xmm4, xmm7, xmm9
0x1006d74b1: vmulss xmm7, xmm6, xmm4
0x1006d74b5: vsubss xmm1, xmm1, xmm10
0x1006d74ba: vmulss xmm4, xmm6, xmm1
0x1006d74be: vsubss xmm0, xmm2, xmm0
0x1006d74c2: vmulss xmm5, xmm6, xmm0
0x1006d74c6: vmulss xmm0, xmm6, xmm3
0x1006d74ca: jne 0x1006d74e0
0x1006d74cc: vmovaps xmm1, xmm4
0x1006d74d0: vmovaps xmm2, xmm0
0x1006d74d4: jmp 0x1006d74ec ; 0x1006d74ec
0x1006d74d6: nop word ptr cs:[rax + rax]
0x1006d74e0: vmovaps xmm1, xmm5
0x1006d74e4: vmovaps xmm5, xmm4
0x1006d74e8: vmovaps xmm2, xmm7
0x1006d74ec: vmovaps xmm6, xmmword ptr [rsp + 0xf0]
0x1006d74f5: mov eax, edi
0x1006d74f7: and al, sil
0x1006d74fa: jne 0x1006d7510
0x1006d74fc: vmovaps xmm4, xmm5
0x1006d7500: test dl, dl
0x1006d7502: je 0x1006d751c
0x1006d7504: jmp 0x1006d7520 ; 0x1006d7520
0x1006d7506: nop word ptr cs:[rax + rax]
0x1006d7510: vmovaps xmm4, xmm2
0x1006d7514: vmovaps xmm2, xmm5
0x1006d7518: test dl, dl
0x1006d751a: jne 0x1006d7520
0x1006d751c: vmovaps xmm0, xmm7
0x1006d7520: vmovaps xmm3, xmm0
0x1006d7524: and dil, sil
0x1006d7527: jne 0x1006d7540
0x1006d7529: vmovaps xmm3, xmm1
0x1006d752d: test dil, dil
0x1006d7530: je 0x1006d7545
0x1006d7532: jmp 0x1006d7549 ; 0x1006d7549
0x1006d7534: nop word ptr cs:[rax + rax]
0x1006d7540: test dil, dil
0x1006d7543: jne 0x1006d7549
0x1006d7545: vmovaps xmm1, xmm0
0x1006d7549: vinsertps xmm0, xmm1, xmm3, 0x10
0x1006d754f: vinsertps xmm0, xmm0, xmm4, 0x20
0x1006d7555: vinsertps xmm0, xmm0, xmm2, 0x30
0x1006d755b: vmulps xmm1, xmm0, xmm0
0x1006d755f: vpermilpd xmm2, xmm1, 1
0x1006d7565: vaddps xmm1, xmm1, xmm2
0x1006d7569: vmovshdup xmm2, xmm1
0x1006d756d: vaddss xmm1, xmm1, xmm2
0x1006d7571: vsqrtss xmm1, xmm1, xmm1
0x1006d7575: vucomiss xmm1, xmm13
0x1006d757a: jbe 0x1006d7586
0x1006d757c: vpermilps xmm1, xmm1, 0
0x1006d7582: vdivps xmm0, xmm0, xmm1
0x1006d7586: vpermilps xmm1, xmm6, 0xe7
0x1006d758c: vpermilps xmm2, xmm6, 0xff
0x1006d7592: vmulps xmm2, xmm2, xmm0
0x1006d7596: vpermilps xmm3, xmm0, 0xe7
0x1006d759c: vpermilps xmm4, xmm0, 0xff
0x1006d75a2: vmulps xmm4, xmm6, xmm4
0x1006d75a6: vaddps xmm2, xmm2, xmm4
0x1006d75aa: vpermilps xmm4, xmm6, 0xd2
0x1006d75b0: vmulps xmm4, xmm4, xmm0
0x1006d75b4: vpermilps xmm5, xmm0, 0xd2
0x1006d75ba: vmulps xmm5, xmm6, xmm5
0x1006d75be: vsubps xmm4, xmm4, xmm5
0x1006d75c2: vpermilps xmm4, xmm4, 0xd2
0x1006d75c8: vaddps xmm2, xmm2, xmm4
0x1006d75cc: vmulss xmm1, xmm1, xmm3
0x1006d75d0: vmulps xmm0, xmm6, xmm0
0x1006d75d4: vmovshdup xmm3, xmm0
0x1006d75d8: vaddss xmm3, xmm0, xmm3
0x1006d75dc: vpermilpd xmm0, xmm0, 1
0x1006d75e2: vaddss xmm0, xmm0, xmm3
0x1006d75e6: vsubss xmm0, xmm1, xmm0
0x1006d75ea: vinsertps xmm3, xmm2, xmm0, 0x30
0x1006d75f0: vmulps xmm0, xmm3, xmmword ptr [rip + 0x3d1408] ; 0x100aa8a00
0x1006d75f8: vpermilpd xmm1, xmm0, 1
0x1006d75fe: vaddps xmm0, xmm0, xmm1
0x1006d7602: vmovshdup xmm1, xmm0
0x1006d7606: vaddss xmm0, xmm0, xmm1
0x1006d760a: vucomiss xmm12, xmm0
0x1006d760e: vbroadcastss xmm1, dword ptr [rip + 0x3d2e69] ; 0x100aaa480
0x1006d7617: vxorps xmm1, xmm0, xmm1
0x1006d761b: vmovaps xmm2, xmmword ptr [rip + 0x3d48bd] ; 0x100aabee0
0x1006d7623: vmovaps xmm4, xmm2
0x1006d7627: ja 0x1006d7635
0x1006d7629: vmovaps xmm2, xmmword ptr [rip + 0x3d13cf] ; 0x100aa8a00
0x1006d7631: vmovaps xmm4, xmm2
0x1006d7635: vcmpltss xmm2, xmm0, xmm12
0x1006d763b: vblendvps xmm0, xmm0, xmm1, xmm2
0x1006d7641: vmovss xmm1, dword ptr [rip + 0x3d0283] ; 0x100aa78cc
0x1006d7649: vucomiss xmm1, xmm0
0x1006d764d: jbe 0x1006d7710
0x1006d7653: vmovaps xmmword ptr [rsp + 0xa0], xmm11
0x1006d765c: vmovaps xmmword ptr [rsp + 0x90], xmm3
0x1006d7665: vmovaps xmmword ptr [rsp + 0x110], xmm4
0x1006d766e: call 0x100aa2576 ; 0x100aa2576 _acosf
0x1006d7673: vmovss dword ptr [rsp + 0x10], xmm0
0x1006d7679: call 0x100aa2bca ; 0x100aa2bca _sinf
0x1006d767e: vmovss xmm1, dword ptr [rip + 0x3cda3a] ; 0x100aa50c0
0x1006d7686: vdivss xmm0, xmm1, xmm0
0x1006d768a: vmovss dword ptr [rsp + 0x60], xmm0
0x1006d7690: vmovss xmm0, dword ptr [rip + 0x3cda28] ; 0x100aa50c0
0x1006d7698: vsubss xmm0, xmm0, dword ptr [rsp + 0x30]
0x1006d769e: vmulss xmm0, xmm0, dword ptr [rsp + 0x10]
0x1006d76a4: call 0x100aa2bca ; 0x100aa2bca _sinf
0x1006d76a9: vmulss xmm0, xmm0, dword ptr [rsp + 0x60]
0x1006d76af: vmovaps xmmword ptr [rsp + 0x130], xmm0
0x1006d76b8: vmovaps xmm0, xmmword ptr [rsp + 0x30]
0x1006d76be: vmulss xmm0, xmm0, dword ptr [rsp + 0x10]
0x1006d76c4: call 0x100aa2bca ; 0x100aa2bca _sinf
0x1006d76c9: vmovaps xmm4, xmmword ptr [rsp + 0x110]
0x1006d76d2: vmovaps xmm3, xmmword ptr [rsp + 0x90]
0x1006d76db: vmovaps xmm11, xmmword ptr [rsp + 0xa0]
0x1006d76e4: vmovss xmm13, dword ptr [rip + 0x3d01d8] ; 0x100aa78c4
0x1006d76ec: vmovss xmm14, dword ptr [rip + 0x3cd9cc] ; 0x100aa50c0
0x1006d76f4: vmulss xmm1, xmm0, dword ptr [rsp + 0x60]
0x1006d76fa: vmovaps xmm0, xmmword ptr [rsp + 0x130]
0x1006d7703: jmp 0x1006d771a ; 0x1006d771a
0x1006d7705: nop word ptr cs:[rax + rax]
0x1006d7710: vmovaps xmm1, xmmword ptr [rsp + 0x30]
0x1006d7716: vsubss xmm0, xmm14, xmm1
0x1006d771a: vmovaps xmm6, xmmword ptr [rsp + 0x20]
0x1006d7720: vmovaps xmm9, xmmword ptr [rsp + 0xb0]
0x1006d7729: vpermilps xmm0, xmm0, 0
0x1006d772f: vmulps xmm0, xmm4, xmm0
0x1006d7733: vpermilps xmm1, xmm1, 0
0x1006d7739: vmulps xmm1, xmm3, xmm1
0x1006d773d: vaddps xmm0, xmm1, xmm0
0x1006d7741: vpermilps xmm1, xmm6, 0xe7
0x1006d7747: vpermilps xmm2, xmm6, 0xff
0x1006d774d: vmulps xmm2, xmm2, xmm0
0x1006d7751: vpermilps xmm3, xmm0, 0xe7
0x1006d7757: vpermilps xmm4, xmm0, 0xff
0x1006d775d: vmulps xmm4, xmm6, xmm4
0x1006d7761: vaddps xmm2, xmm2, xmm4
0x1006d7765: vpermilps xmm4, xmm6, 0xd2
0x1006d776b: vmulps xmm4, xmm4, xmm0
0x1006d776f: vpermilps xmm5, xmm0, 0xd2
0x1006d7775: vmulps xmm5, xmm6, xmm5
0x1006d7779: vsubps xmm4, xmm4, xmm5
0x1006d777d: vpermilps xmm4, xmm4, 0xd2
0x1006d7783: vaddps xmm2, xmm2, xmm4
0x1006d7787: vmulss xmm1, xmm1, xmm3
0x1006d778b: vmulps xmm0, xmm6, xmm0
0x1006d778f: vmovshdup xmm3, xmm0
0x1006d7793: vaddss xmm3, xmm0, xmm3
0x1006d7797: vpermilpd xmm0, xmm0, 1
0x1006d779d: vaddss xmm0, xmm0, xmm3
0x1006d77a1: vsubss xmm0, xmm1, xmm0
0x1006d77a5: vinsertps xmm10, xmm2, xmm0, 0x30
0x1006d77ab: vmulps xmm0, xmm10, xmm10
0x1006d77b0: vpermilpd xmm1, xmm0, 1
0x1006d77b6: vaddps xmm0, xmm0, xmm1
0x1006d77ba: vmovshdup xmm1, xmm0
0x1006d77be: vaddss xmm0, xmm0, xmm1
0x1006d77c2: vsqrtss xmm0, xmm0, xmm0
0x1006d77c6: vucomiss xmm0, xmm13
0x1006d77cb: jbe 0x1006d77d7
0x1006d77cd: vpermilps xmm0, xmm0, 0
0x1006d77d3: vdivps xmm10, xmm10, xmm0
0x1006d77d7: vmovaps xmm0, xmmword ptr [rsp + 0x80]
0x1006d77e0: vsubps xmm0, xmm0, xmmword ptr [rsp + 0x100]
0x1006d77e9: vpermilps xmm1, xmm11, 0xc0
0x1006d77ef: vmulps xmm8, xmm0, xmm1
0x1006d77f3: vinsertps xmm1, xmm9, xmm14, 0x30
0x1006d77f9: vmovaps xmmword ptr [rsp + 0x2c0], xmm14
0x1006d7802: vmovaps xmm0, xmmword ptr [rip + 0x3d0896] ; 0x100aa80a0
0x1006d780a: vmovaps xmmword ptr [rsp + 0x2d0], xmm0
0x1006d7813: vmovaps xmm0, xmmword ptr [rip + 0x3d1215] ; 0x100aa8a30
0x1006d781b: vmovaps xmmword ptr [rsp + 0x2e0], xmm0
0x1006d7824: vmovaps xmmword ptr [rsp + 0x2f0], xmm1
0x1006d782d: vmovshdup xmm1, xmm10
0x1006d7832: vpermilpd xmm2, xmm10, 1
0x1006d7838: vpermilps xmm3, xmm10, 0xe7
0x1006d783e: vaddss xmm4, xmm10, xmm10
0x1006d7843: vaddss xmm5, xmm1, xmm1
0x1006d7847: vaddss xmm6, xmm2, xmm2
0x1006d784b: vmulss xmm9, xmm10, xmm4
0x1006d784f: vmulss xmm0, xmm10, xmm5
0x1006d7853: vmulss xmm7, xmm10, xmm6
0x1006d7857: vmulss xmm4, xmm3, xmm4
0x1006d785b: vmulss xmm10, xmm1, xmm5
0x1006d785f: vmulss xmm1, xmm1, xmm6
0x1006d7863: vmulss xmm5, xmm3, xmm5
0x1006d7867: vmulss xmm2, xmm2, xmm6
0x1006d786b: vmulss xmm3, xmm3, xmm6
0x1006d786f: vaddss xmm6, xmm0, xmm3
0x1006d7873: vsubss xmm11, xmm0, xmm3
0x1006d7877: vsubss xmm3, xmm7, xmm5
0x1006d787b: vaddss xmm5, xmm7, xmm5
0x1006d787f: vaddss xmm7, xmm1, xmm4
0x1006d7883: vsubss xmm1, xmm1, xmm4
0x1006d7887: vsubss xmm4, xmm14, xmm10
0x1006d788c: vsubss xmm4, xmm4, xmm2
0x1006d7890: vsubss xmm0, xmm14, xmm9
0x1006d7895: vsubss xmm2, xmm0, xmm2
0x1006d7899: vsubss xmm0, xmm0, xmm10
0x1006d789e: vinsertps xmm4, xmm4, xmm6, 0x1c
0x1006d78a4: vinsertps xmm3, xmm4, xmm3, 0x20
0x1006d78aa: vmovaps xmmword ptr [rsp + 0x1a0], xmm3
0x1006d78b3: vinsertps xmm2, xmm11, xmm2, 0x1c
0x1006d78b9: vinsertps xmm2, xmm2, xmm7, 0x20
0x1006d78bf: vmovaps xmmword ptr [rsp + 0x1b0], xmm2
0x1006d78c8: vinsertps xmm1, xmm5, xmm1, 0x1c
0x1006d78ce: vinsertps xmm0, xmm1, xmm0, 0x20
0x1006d78d4: vmovaps xmmword ptr [rsp + 0x1c0], xmm0
0x1006d78dd: vaddps xmm0, xmm8, xmmword ptr [rsp + 0x70]
0x1006d78e3: vmovaps xmmword ptr [rsp + 0x30], xmm0
0x1006d78e9: vmovaps xmm0, xmmword ptr [rip + 0x3d110f] ; 0x100aa8a00
0x1006d78f1: vmovaps xmmword ptr [rsp + 0x1d0], xmm0
0x1006d78fa: lea rbx, [rsp + 0x340]
0x1006d7902: mov rdi, rbx
0x1006d7905: lea rsi, [rsp + 0x2c0]
0x1006d790d: lea rdx, [rsp + 0x1a0]
0x1006d7915: call 0x100076df0 ; 0x100076df0
0x1006d791a: vxorps xmm2, xmm2, xmm2
0x1006d791e: vmovaps xmm3, xmmword ptr [rsp + 0x30]
0x1006d7924: jmp 0x1006d8327 ; 0x1006d8327
0x1006d7929: nop dword ptr [rax]
0x1006d7930: vmovaps xmm8, xmmword ptr [rsp + 0x210]
0x1006d7939: cmp byte ptr [r15 + 0x7a], 0
0x1006d793e: sete bl
0x1006d7941: vmovaps xmm5, xmmword ptr [rsp + 0x50]
0x1006d7947: mov al, byte ptr [r15 + 0x77]
0x1006d794b: test al, al
0x1006d794d: jne 0x1006d72b6
0x1006d7953: vmovaps xmm7, xmmword ptr [rsp + 0x70]
0x1006d7959: mov r12b, byte ptr [r15 + 0x76]
0x1006d795d: test r12b, r12b
0x1006d7960: vmovaps xmmword ptr [rsp + 0xb0], xmm7
0x1006d7969: je 0x1006d7ad0
0x1006d796f: cmp byte ptr [r15 + 0x79], 0
0x1006d7974: vmovaps xmmword ptr [rsp + 0xa0], xmm8
0x1006d797d: je 0x1006d7b0a
0x1006d7983: vmaxss xmm0, xmm12, xmm5
0x1006d7987: vminss xmm1, xmm14, xmm0
0x1006d798b: vmulss xmm0, xmm1, xmm1
0x1006d798f: vmulss xmm0, xmm1, xmm0
0x1006d7993: vmulss xmm2, xmm1, dword ptr [rip + 0x3cf109] ; 0x100aa6aa4
0x1006d799b: vaddss xmm2, xmm2, dword ptr [rip + 0x3d1cd9] ; 0x100aa967c
0x1006d79a3: vmulss xmm1, xmm1, xmm2
0x1006d79a7: vaddss xmm1, xmm1, dword ptr [rip + 0x3cfe2d] ; 0x100aa77dc
0x1006d79af: vmovaps xmm4, xmmword ptr [rsp + 0xf0]
0x1006d79b8: vmovaps xmm5, xmmword ptr [rsp + 0xe0]
0x1006d79c1: vmulps xmm2, xmm4, xmm5
0x1006d79c5: vpermilpd xmm3, xmm2, 1
0x1006d79cb: vaddps xmm2, xmm2, xmm3
0x1006d79cf: vmovshdup xmm3, xmm2
0x1006d79d3: vaddss xmm2, xmm2, xmm3
0x1006d79d7: vucomiss xmm12, xmm2
0x1006d79db: vxorps xmm3, xmm2, xmm11
0x1006d79e0: jbe 0x1006d79e7
0x1006d79e2: vxorps xmm5, xmm5, xmm11
0x1006d79e7: vmulss xmm6, xmm0, xmm1
0x1006d79eb: vcmpltss xmm0, xmm2, xmm12
0x1006d79f1: vblendvps xmm0, xmm2, xmm3, xmm0
0x1006d79f7: vmovss xmm1, dword ptr [rip + 0x3cfecd] ; 0x100aa78cc
0x1006d79ff: vucomiss xmm1, xmm0
0x1006d7a03: jbe 0x1006d7c0e
0x1006d7a09: vmovaps xmmword ptr [rsp + 0xe0], xmm5
0x1006d7a12: vmovaps xmmword ptr [rsp + 0x20], xmm6
0x1006d7a18: call 0x100aa2576 ; 0x100aa2576 _acosf
0x1006d7a1d: vmovss dword ptr [rsp + 0x90], xmm0
0x1006d7a26: call 0x100aa2bca ; 0x100aa2bca _sinf
0x1006d7a2b: vmovss xmm1, dword ptr [rip + 0x3cd68d] ; 0x100aa50c0
0x1006d7a33: vdivss xmm0, xmm1, xmm0
0x1006d7a37: vmovss dword ptr [rsp + 0x10], xmm0
0x1006d7a3d: vmovss xmm0, dword ptr [rip + 0x3cd67b] ; 0x100aa50c0
0x1006d7a45: vsubss xmm0, xmm0, dword ptr [rsp + 0x20]
0x1006d7a4b: vmulss xmm0, xmm0, dword ptr [rsp + 0x90]
0x1006d7a54: call 0x100aa2bca ; 0x100aa2bca _sinf
0x1006d7a59: vmulss xmm0, xmm0, dword ptr [rsp + 0x10]
0x1006d7a5f: vmovaps xmmword ptr [rsp + 0x110], xmm0
0x1006d7a68: vmovss xmm0, dword ptr [rsp + 0x90]
0x1006d7a71: vmulss xmm0, xmm0, dword ptr [rsp + 0x20]
0x1006d7a77: call 0x100aa2bca ; 0x100aa2bca _sinf
0x1006d7a7c: vmovaps xmm5, xmmword ptr [rsp + 0xe0]
0x1006d7a85: vmovaps xmm8, xmmword ptr [rsp + 0xa0]
0x1006d7a8e: vmovaps xmm4, xmmword ptr [rsp + 0xf0]
0x1006d7a97: vmovaps xmm15, xmmword ptr [rip + 0x3cfe61] ; 0x100aa7900
0x1006d7a9f: vmovss xmm13, dword ptr [rip + 0x3cfe1d] ; 0x100aa78c4
0x1006d7aa7: vmovss xmm14, dword ptr [rip + 0x3cd611] ; 0x100aa50c0
0x1006d7aaf: vmulss xmm6, xmm0, dword ptr [rsp + 0x10]
0x1006d7ab5: vmovaps xmm0, xmmword ptr [rsp + 0x110]
0x1006d7abe: jmp 0x1006d7c12 ; 0x1006d7c12
0x1006d7ac3: nop word ptr cs:[rax + rax]
0x1006d7ad0: vmulps xmm0, xmm10, xmm10
0x1006d7ad5: vpermilpd xmm1, xmm0, 1
0x1006d7adb: vaddps xmm0, xmm0, xmm1
0x1006d7adf: vmovshdup xmm1, xmm0
0x1006d7ae3: vaddss xmm0, xmm0, xmm1
0x1006d7ae7: vsqrtss xmm0, xmm0, xmm0
0x1006d7aeb: vucomiss xmm0, xmm13
0x1006d7af0: jbe 0x1006d7c7a
0x1006d7af6: vpermilps xmm0, xmm0, 0
0x1006d7afc: vdivps xmm10, xmm10, xmm0
0x1006d7b00: mov r12, qword ptr [rsp + 0x30]
0x1006d7b05: jmp 0x1006d81ff ; 0x1006d81ff
0x1006d7b0a: vmovaps xmm3, xmmword ptr [rsp + 0xf0]
0x1006d7b13: vmovaps xmm4, xmmword ptr [rsp + 0xe0]
0x1006d7b1c: vmulps xmm0, xmm3, xmm4
0x1006d7b20: vpermilpd xmm1, xmm0, 1
0x1006d7b26: vaddps xmm0, xmm0, xmm1
0x1006d7b2a: vmovshdup xmm1, xmm0
0x1006d7b2e: vaddss xmm0, xmm0, xmm1
0x1006d7b32: vucomiss xmm12, xmm0
0x1006d7b36: vxorps xmm1, xmm0, xmm11
0x1006d7b3b: jbe 0x1006d7b42
0x1006d7b3d: vxorps xmm4, xmm4, xmm11
0x1006d7b42: vcmpltss xmm2, xmm0, xmm12
0x1006d7b48: vblendvps xmm0, xmm0, xmm1, xmm2
0x1006d7b4e: vmovss xmm1, dword ptr [rip + 0x3cfd76] ; 0x100aa78cc
0x1006d7b56: vucomiss xmm1, xmm0
0x1006d7b5a: jbe 0x1006d7c28
0x1006d7b60: vmovaps xmmword ptr [rsp + 0x50], xmm5
0x1006d7b66: vmovaps xmmword ptr [rsp + 0xe0], xmm4
0x1006d7b6f: call 0x100aa2576 ; 0x100aa2576 _acosf
0x1006d7b74: vmovss dword ptr [rsp + 0x10], xmm0
0x1006d7b7a: call 0x100aa2bca ; 0x100aa2bca _sinf
0x1006d7b7f: vmovss xmm1, dword ptr [rip + 0x3cd539] ; 0x100aa50c0
0x1006d7b87: vdivss xmm0, xmm1, xmm0
0x1006d7b8b: vmovss dword ptr [rsp + 0x20], xmm0
0x1006d7b91: vmovss xmm0, dword ptr [rip + 0x3cd527] ; 0x100aa50c0
0x1006d7b99: vsubss xmm0, xmm0, dword ptr [rsp + 0x50]
0x1006d7b9f: vmulss xmm0, xmm0, dword ptr [rsp + 0x10]
0x1006d7ba5: call 0x100aa2bca ; 0x100aa2bca _sinf
0x1006d7baa: vmulss xmm0, xmm0, dword ptr [rsp + 0x20]
0x1006d7bb0: vmovaps xmmword ptr [rsp + 0x90], xmm0
0x1006d7bb9: vmovss xmm0, dword ptr [rsp + 0x10]
0x1006d7bbf: vmulss xmm0, xmm0, dword ptr [rsp + 0x50]
0x1006d7bc5: call 0x100aa2bca ; 0x100aa2bca _sinf
0x1006d7bca: vmovaps xmm4, xmmword ptr [rsp + 0xe0]
0x1006d7bd3: vmovaps xmm8, xmmword ptr [rsp + 0xa0]
0x1006d7bdc: vmovaps xmm3, xmmword ptr [rsp + 0xf0]
0x1006d7be5: vmovaps xmm15, xmmword ptr [rip + 0x3cfd13] ; 0x100aa7900
0x1006d7bed: vmovss xmm13, dword ptr [rip + 0x3cfccf] ; 0x100aa78c4
0x1006d7bf5: vmovss xmm14, dword ptr [rip + 0x3cd4c3] ; 0x100aa50c0
0x1006d7bfd: vmulss xmm5, xmm0, dword ptr [rsp + 0x20]
0x1006d7c03: vmovaps xmm0, xmmword ptr [rsp + 0x90]
0x1006d7c0c: jmp 0x1006d7c2c ; 0x1006d7c2c
0x1006d7c0e: vsubss xmm0, xmm14, xmm6
0x1006d7c12: vpermilps xmm0, xmm0, 0
0x1006d7c18: vmulps xmm0, xmm5, xmm0
0x1006d7c1c: vpermilps xmm1, xmm6, 0
0x1006d7c22: vmulps xmm1, xmm4, xmm1
0x1006d7c26: jmp 0x1006d7c40 ; 0x1006d7c40
0x1006d7c28: vsubss xmm0, xmm14, xmm5
0x1006d7c2c: vpermilps xmm0, xmm0, 0
0x1006d7c32: vmulps xmm0, xmm4, xmm0
0x1006d7c36: vpermilps xmm1, xmm5, 0
0x1006d7c3c: vmulps xmm1, xmm3, xmm1
0x1006d7c40: vaddps xmm10, xmm1, xmm0
0x1006d7c44: vmulps xmm0, xmm10, xmm10
0x1006d7c49: vpermilpd xmm1, xmm0, 1
0x1006d7c4f: vaddps xmm0, xmm0, xmm1
0x1006d7c53: vmovshdup xmm1, xmm0
0x1006d7c57: vaddss xmm0, xmm0, xmm1
0x1006d7c5b: vsqrtss xmm0, xmm0, xmm0
0x1006d7c5f: vucomiss xmm0, xmm13
0x1006d7c64: jbe 0x1006d7c70
0x1006d7c66: vpermilps xmm0, xmm0, 0
0x1006d7c6c: vdivps xmm10, xmm10, xmm0
0x1006d7c70: test r12b, r12b
0x1006d7c73: sete al
0x1006d7c76: or bl, al
0x1006d7c78: je 0x1006d7c90
0x1006d7c7a: mov r12, qword ptr [rsp + 0x30]
0x1006d7c7f: jmp 0x1006d81ff ; 0x1006d81ff
0x1006d7c84: nop word ptr cs:[rax + rax]
0x1006d7c90: mov rax, qword ptr [r15 + 0xb8]
0x1006d7c97: mov rcx, qword ptr [rsp + 0xc8]
0x1006d7c9f: vmovaps xmm2, xmmword ptr [rax + rcx]
0x1006d7ca4: vmovaps xmm0, xmmword ptr [rax + rcx + 0x10]
0x1006d7caa: vmovaps xmm1, xmmword ptr [rax + rcx + 0x20]
0x1006d7cb0: vmulps xmm3, xmm2, xmm2
0x1006d7cb4: vmovshdup xmm4, xmm3
0x1006d7cb8: vaddss xmm4, xmm3, xmm4
0x1006d7cbc: vpermilpd xmm3, xmm3, 1
0x1006d7cc2: vaddss xmm3, xmm3, xmm4
0x1006d7cc6: vsqrtss xmm3, xmm3, xmm3
0x1006d7cca: vucomiss xmm3, xmm13
0x1006d7ccf: mov r12, qword ptr [rsp + 0x30]
0x1006d7cd4: jbe 0x1006d7ce0
0x1006d7cd6: vpermilps xmm3, xmm3, 0xc0
0x1006d7cdc: vdivps xmm2, xmm2, xmm3
0x1006d7ce0: vxorps xmm7, xmm7, xmm7
0x1006d7ce4: vmulps xmm3, xmm0, xmm0
0x1006d7ce8: vmovshdup xmm4, xmm3
0x1006d7cec: vaddss xmm4, xmm3, xmm4
0x1006d7cf0: vpermilpd xmm3, xmm3, 1
0x1006d7cf6: vaddss xmm3, xmm3, xmm4
0x1006d7cfa: vsqrtss xmm3, xmm3, xmm3
0x1006d7cfe: vucomiss xmm3, xmm13
0x1006d7d03: jbe 0x1006d7d0f
0x1006d7d05: vpermilps xmm3, xmm3, 0xc0
0x1006d7d0b: vdivps xmm0, xmm0, xmm3
0x1006d7d0f: vmulps xmm3, xmm1, xmm1
0x1006d7d13: vmovshdup xmm4, xmm3
0x1006d7d17: vaddss xmm4, xmm3, xmm4
0x1006d7d1b: vpermilpd xmm3, xmm3, 1
0x1006d7d21: vaddss xmm3, xmm3, xmm4
0x1006d7d25: vsqrtss xmm3, xmm3, xmm3
0x1006d7d29: vucomiss xmm3, xmm13
0x1006d7d2e: jbe 0x1006d7d3a
0x1006d7d30: vpermilps xmm3, xmm3, 0xc0
0x1006d7d36: vdivps xmm1, xmm1, xmm3
0x1006d7d3a: vpermilpd xmm3, xmm2, 1
0x1006d7d40: vmovshdup xmm4, xmm0
0x1006d7d44: vmovshdup xmm9, xmm1
0x1006d7d48: vpermilpd xmm5, xmm1, 1
0x1006d7d4e: vaddss xmm6, xmm2, xmm4
0x1006d7d52: vaddss xmm6, xmm6, xmm5
0x1006d7d56: vucomiss xmm7, xmm6
0x1006d7d5a: seta sil
0x1006d7d5e: vucomiss xmm5, xmm2
0x1006d7d62: seta dl
0x1006d7d65: vucomiss xmm5, xmm4
0x1006d7d69: seta al
0x1006d7d6c: vucomiss xmm4, xmm2
0x1006d7d70: setbe bl
0x1006d7d73: seta dil
0x1006d7d77: or dil, dl
0x1006d7d7a: or bl, al
0x1006d7d7c: mov ecx, edi
0x1006d7d7e: and cl, sil
0x1006d7d81: jne 0x1006d7d89
0x1006d7d83: vmovaps xmm8, xmm2
0x1006d7d87: jmp 0x1006d7d93 ; 0x1006d7d93
0x1006d7d89: vxorps xmm8, xmm2, xmm15
0x1006d7d8e: vxorps xmm9, xmm9, xmm15
0x1006d7d93: and dl, al
0x1006d7d95: vxorpd xmm6, xmm3, xmm15
0x1006d7d9a: and bl, sil
0x1006d7d9d: je 0x1006d7da4
0x1006d7d9f: vxorps xmm4, xmm4, xmm15
0x1006d7da4: xor dl, 1
0x1006d7da7: test bl, bl
0x1006d7da9: jne 0x1006d7daf
0x1006d7dab: vmovapd xmm6, xmm3
0x1006d7daf: vmovshdup xmm2, xmm2
0x1006d7db3: vpermilpd xmm7, xmm0, 1
0x1006d7db9: and dl, sil
0x1006d7dbc: je 0x1006d7dc8
0x1006d7dbe: vxorps xmm5, xmm5, xmm15
0x1006d7dc3: vxorps xmm0, xmm0, xmm15
0x1006d7dc8: vaddss xmm4, xmm8, xmm4
0x1006d7dcc: vaddss xmm4, xmm5, xmm4
0x1006d7dd0: vaddss xmm4, xmm4, xmm14
0x1006d7dd5: vsqrtss xmm5, xmm4, xmm4
0x1006d7dd9: vdivss xmm5, xmm14, xmm5
0x1006d7ddd: vmulss xmm3, xmm5, dword ptr [rip + 0x3cc7d3] ; 0x100aa45b8
0x1006d7de5: vsubss xmm5, xmm7, xmm9
0x1006d7dea: vmulss xmm7, xmm3, xmm5
0x1006d7dee: vsubss xmm1, xmm1, xmm6
0x1006d7df2: vmulss xmm5, xmm3, xmm1
0x1006d7df6: vsubss xmm0, xmm2, xmm0
0x1006d7dfa: vmulss xmm1, xmm3, xmm0
0x1006d7dfe: vmulss xmm0, xmm3, xmm4
0x1006d7e02: jne 0x1006d7e0e
0x1006d7e04: vmovaps xmm9, xmm5
0x1006d7e08: vmovaps xmm2, xmm0
0x1006d7e0c: jmp 0x1006d7e1a ; 0x1006d7e1a
0x1006d7e0e: vmovaps xmm9, xmm1
0x1006d7e12: vmovaps xmm1, xmm5
0x1006d7e16: vmovaps xmm2, xmm7
0x1006d7e1a: vmovaps xmmword ptr [rsp + 0x10], xmm2
0x1006d7e20: vmovaps xmm4, xmmword ptr [rsp + 0x60]
0x1006d7e26: mov eax, edi
0x1006d7e28: and al, sil
0x1006d7e2b: jne 0x1006d7e37
0x1006d7e2d: vmovaps xmm11, xmm1
0x1006d7e31: test dl, dl
0x1006d7e33: je 0x1006d7e47
0x1006d7e35: jmp 0x1006d7e4b ; 0x1006d7e4b
0x1006d7e37: vmovaps xmm11, xmmword ptr [rsp + 0x10]
0x1006d7e3d: vmovaps xmmword ptr [rsp + 0x10], xmm1
0x1006d7e43: test dl, dl
0x1006d7e45: jne 0x1006d7e4b
0x1006d7e47: vmovaps xmm0, xmm7
0x1006d7e4b: vmovaps xmm12, xmm0
0x1006d7e4f: and dil, sil
0x1006d7e52: jne 0x1006d7e60
0x1006d7e54: vmovaps xmm12, xmm9
0x1006d7e59: test dil, dil
0x1006d7e5c: je 0x1006d7e65
0x1006d7e5e: jmp 0x1006d7e69 ; 0x1006d7e69
0x1006d7e60: test dil, dil
0x1006d7e63: jne 0x1006d7e69
0x1006d7e65: vmovaps xmm9, xmm0
0x1006d7e69: vpermilps xmm1, xmm4, 0xd2
0x1006d7e6f: vmovaps xmm2, xmmword ptr [rsp + 0x180]
0x1006d7e78: vpermilps xmm3, xmm2, 0xd2
0x1006d7e7e: vmulps xmm0, xmm3, xmm4
0x1006d7e82: vmulps xmm5, xmm2, xmm1
0x1006d7e86: vsubps xmm0, xmm0, xmm5
0x1006d7e8a: vpermilps xmm0, xmm0, 0xd2
0x1006d7e90: vmovaps xmm6, xmmword ptr [rsp + 0x190]
0x1006d7e99: vmulps xmm5, xmm6, xmm0
0x1006d7e9d: vmovshdup xmm7, xmm5
0x1006d7ea1: vaddss xmm7, xmm5, xmm7
0x1006d7ea5: vpermilpd xmm5, xmm5, 1
0x1006d7eab: vaddss xmm5, xmm5, xmm7
0x1006d7eaf: vdivss xmm5, xmm14, xmm5
0x1006d7eb3: vucomiss xmm5, xmm5
0x1006d7eb7: jp 0x1006d8fb3
0x1006d7ebd: vpermilps xmm7, xmm6, 0xd2
0x1006d7ec3: vmulps xmm2, xmm2, xmm7
0x1006d7ec7: vmulps xmm3, xmm3, xmm6
0x1006d7ecb: vsubps xmm2, xmm2, xmm3
0x1006d7ecf: vpermilps xmm2, xmm2, 0xd2
0x1006d7ed5: vmulps xmm1, xmm1, xmm6
0x1006d7ed9: vmulps xmm3, xmm4, xmm7
0x1006d7edd: vsubps xmm1, xmm1, xmm3
0x1006d7ee1: vpermilps xmm1, xmm1, 0xd2
0x1006d7ee7: vpermilps xmm3, xmm5, 0xc0
0x1006d7eed: vmulps xmm1, xmm1, xmm3
0x1006d7ef1: vmulps xmm2, xmm2, xmm3
0x1006d7ef5: vmulps xmm0, xmm0, xmm3
0x1006d7ef9: vunpcklps xmm7, xmm1, xmm2
0x1006d7efd: vunpckhps xmm3, xmm1, xmm2
0x1006d7f01: vunpcklpd xmm5, xmm7, xmm0
0x1006d7f05: vshufps xmm8, xmm7, xmm0, 0xde
0x1006d7f0a: vmulps xmm2, xmm5, xmm5
0x1006d7f0e: vmovshdup xmm7, xmm2
0x1006d7f12: vaddss xmm7, xmm2, xmm7
0x1006d7f16: vpermilpd xmm2, xmm2, 1
0x1006d7f1c: vaddss xmm2, xmm2, xmm7
0x1006d7f20: vsqrtss xmm7, xmm2, xmm2
0x1006d7f24: vucomiss xmm7, xmm13
0x1006d7f29: jbe 0x1006d7f35
0x1006d7f2b: vpermilps xmm2, xmm7, 0xc0
0x1006d7f31: vdivps xmm5, xmm5, xmm2
0x1006d7f35: vblendpd xmm3, xmm0, xmm3, 1
0x1006d7f3b: vmulps xmm0, xmm8, xmm8
0x1006d7f40: vmovshdup xmm2, xmm0
0x1006d7f44: vaddss xmm2, xmm0, xmm2
0x1006d7f48: vpermilpd xmm0, xmm0, 1
0x1006d7f4e: vaddss xmm0, xmm0, xmm2
0x1006d7f52: vsqrtss xmm0, xmm0, xmm0
0x1006d7f56: vucomiss xmm0, xmm13
0x1006d7f5b: jbe 0x1006d7f67
0x1006d7f5d: vpermilps xmm0, xmm0, 0xc0
0x1006d7f63: vdivps xmm8, xmm8, xmm0
0x1006d7f67: vmulps xmm0, xmm3, xmm3
0x1006d7f6b: vmovshdup xmm2, xmm0
0x1006d7f6f: vaddss xmm2, xmm0, xmm2
0x1006d7f73: vpermilpd xmm0, xmm0, 1
0x1006d7f79: vaddss xmm0, xmm0, xmm2
0x1006d7f7d: vsqrtss xmm0, xmm0, xmm0
0x1006d7f81: vucomiss xmm0, xmm13
0x1006d7f86: vmovaps xmmword ptr [rsp + 0x20], xmm10
0x1006d7f8c: jbe 0x1006d7f98
0x1006d7f8e: vpermilps xmm0, xmm0, 0xc0
0x1006d7f94: vdivps xmm3, xmm3, xmm0
0x1006d7f98: vinsertps xmm0, xmm9, xmm12, 0x10
0x1006d7f9e: vpermilpd xmm4, xmm5, 1
0x1006d7fa4: vmovshdup xmm6, xmm8
0x1006d7fa9: vmovshdup xmm10, xmm3
0x1006d7fad: vpermilpd xmm7, xmm3, 1
0x1006d7fb3: vaddss xmm2, xmm5, xmm6
0x1006d7fb7: vaddss xmm2, xmm2, xmm7
0x1006d7fbb: vxorps xmm1, xmm1, xmm1
0x1006d7fbf: vucomiss xmm1, xmm2
0x1006d7fc3: seta sil
0x1006d7fc7: vucomiss xmm7, xmm5
0x1006d7fcb: seta dl
0x1006d7fce: vucomiss xmm7, xmm6
0x1006d7fd2: seta al
0x1006d7fd5: vucomiss xmm6, xmm5
0x1006d7fd9: setbe bl
0x1006d7fdc: seta dil
0x1006d7fe0: or dil, dl
0x1006d7fe3: or bl, al
0x1006d7fe5: mov ecx, edi
0x1006d7fe7: and cl, sil
0x1006d7fea: jne 0x1006d7ff2
0x1006d7fec: vmovaps xmm9, xmm5
0x1006d7ff0: jmp 0x1006d7ffc ; 0x1006d7ffc
0x1006d7ff2: vxorps xmm9, xmm5, xmm15
0x1006d7ff7: vxorps xmm10, xmm10, xmm15
0x1006d7ffc: vinsertps xmm0, xmm0, xmm11, 0x20
0x1006d8002: and dl, al
0x1006d8004: vxorpd xmm11, xmm4, xmm15
0x1006d8009: and bl, sil
0x1006d800c: je 0x1006d8013
0x1006d800e: vxorps xmm6, xmm6, xmm15
0x1006d8013: vinsertps xmm2, xmm0, dword ptr [rsp + 0x10], 0x30
0x1006d801b: xor dl, 1
0x1006d801e: test bl, bl
0x1006d8020: jne 0x1006d8026
0x1006d8022: vmovapd xmm11, xmm4
0x1006d8026: vmovaps xmm0, xmmword ptr [rsp + 0x20]
0x1006d802c: vpermilps xmm12, xmm0, 0xd2
0x1006d8032: vpermilps xmm13, xmm2, 0xd2
0x1006d8038: vmulps xmm4, xmm0, xmm2
0x1006d803c: vmovshdup xmm14, xmm5
0x1006d8040: vpermilpd xmm0, xmm8, 1
0x1006d8046: and dl, sil
0x1006d8049: je 0x1006d8055
0x1006d804b: vxorps xmm7, xmm7, xmm15
0x1006d8050: vxorps xmm8, xmm8, xmm15
0x1006d8055: vaddss xmm5, xmm9, xmm6
0x1006d8059: vaddss xmm6, xmm7, xmm5
0x1006d805d: vsubss xmm0, xmm0, xmm10
0x1006d8062: vmovaps xmm1, xmmword ptr [rsp + 0x20]
0x1006d8068: vpermilps xmm15, xmm1, 0xff
0x1006d806e: vsubss xmm3, xmm3, xmm11
0x1006d8073: vpermilps xmm7, xmmword ptr [rsp + 0x10], 0xc0
0x1006d807b: vmulps xmm11, xmm12, xmm2
0x1006d807f: vmulps xmm9, xmm1, xmm13
0x1006d8084: vmovss xmm1, dword ptr [rip + 0x3cd034] ; 0x100aa50c0
0x1006d808c: vmovaps xmm5, xmm1
0x1006d8090: vaddss xmm1, xmm6, xmm5
0x1006d8094: vsubss xmm6, xmm14, xmm8
0x1006d8099: vmovaps xmm14, xmm5
0x1006d809d: vsqrtss xmm5, xmm1, xmm1
0x1006d80a1: vdivss xmm5, xmm14, xmm5
0x1006d80a5: vmulss xmm5, xmm5, dword ptr [rip + 0x3cc50b] ; 0x100aa45b8
0x1006d80ad: vmulss xmm8, xmm5, xmm0
0x1006d80b1: vmulss xmm0, xmm5, xmm3
0x1006d80b5: vmulss xmm6, xmm5, xmm6
0x1006d80b9: vmulss xmm12, xmm5, xmm1
0x1006d80bd: vmovshdup xmm3, xmm4
0x1006d80c1: jne 0x1006d80cd
0x1006d80c3: vmovaps xmm10, xmm0
0x1006d80c7: vmovaps xmm0, xmm12
0x1006d80cb: jmp 0x1006d80d9 ; 0x1006d80d9
0x1006d80cd: vmovaps xmm10, xmm6
0x1006d80d1: vmovaps xmm6, xmm0
0x1006d80d5: vmovaps xmm0, xmm8
0x1006d80d9: vmovaps xmm1, xmmword ptr [rsp + 0x20]
0x1006d80df: vpermilps xmm13, xmm1, 0xe7
0x1006d80e5: vmulps xmm2, xmm15, xmm2
0x1006d80e9: vmulps xmm7, xmm1, xmm7
0x1006d80ed: vsubps xmm1, xmm11, xmm9
0x1006d80f2: vaddss xmm5, xmm4, xmm3
0x1006d80f6: vpermilpd xmm4, xmm4, 1
0x1006d80fc: mov eax, edi
0x1006d80fe: and al, sil
0x1006d8101: jne 0x1006d8109
0x1006d8103: vmovaps xmm11, xmm6
0x1006d8107: jmp 0x1006d8111 ; 0x1006d8111
0x1006d8109: vmovaps xmm11, xmm0
0x1006d810d: vmovaps xmm0, xmm6
0x1006d8111: vaddps xmm2, xmm2, xmm7
0x1006d8115: vpermilps xmm1, xmm1, 0xd2
0x1006d811b: vmulss xmm3, xmm13, dword ptr [rsp + 0x10]
0x1006d8121: vaddss xmm4, xmm4, xmm5
0x1006d8125: test dl, dl
0x1006d8127: jne 0x1006d812e
0x1006d8129: vmovaps xmm12, xmm8
0x1006d812e: vaddps xmm2, xmm2, xmm1
0x1006d8132: vsubss xmm4, xmm3, xmm4
0x1006d8136: vmovaps xmm1, xmm12
0x1006d813a: and dil, sil
0x1006d813d: vmovss xmm7, dword ptr [rip + 0x3cf77f] ; 0x100aa78c4
0x1006d8145: jne 0x1006d814b
0x1006d8147: vmovaps xmm1, xmm10
0x1006d814b: vinsertps xmm5, xmm2, xmm4, 0x30
0x1006d8151: test dil, dil
0x1006d8154: jne 0x1006d815b
0x1006d8156: vmovaps xmm10, xmm12
0x1006d815b: vinsertps xmm1, xmm10, xmm1, 0x10
0x1006d8161: vinsertps xmm1, xmm1, xmm11, 0x20
0x1006d8167: vinsertps xmm1, xmm1, xmm0, 0x30
0x1006d816d: vpermilps xmm2, xmm5, 0xff
0x1006d8173: vmulps xmm2, xmm2, xmm1
0x1006d8177: vpermilps xmm3, xmm0, 0xc0
0x1006d817d: vmulps xmm3, xmm5, xmm3
0x1006d8181: vaddps xmm2, xmm2, xmm3
0x1006d8185: vpermilps xmm3, xmm5, 0xd2
0x1006d818b: vmulps xmm3, xmm3, xmm1
0x1006d818f: vpermilps xmm6, xmm1, 0xd2
0x1006d8195: vmulps xmm6, xmm5, xmm6
0x1006d8199: vsubps xmm3, xmm3, xmm6
0x1006d819d: vpermilps xmm3, xmm3, 0xd2
0x1006d81a3: vaddps xmm2, xmm2, xmm3
0x1006d81a7: vmulss xmm0, xmm4, xmm0
0x1006d81ab: vmulps xmm1, xmm5, xmm1
0x1006d81af: vmovshdup xmm3, xmm1
0x1006d81b3: vaddss xmm3, xmm1, xmm3
0x1006d81b7: vpermilpd xmm1, xmm1, 1
0x1006d81bd: vaddss xmm1, xmm1, xmm3
0x1006d81c1: vsubss xmm0, xmm0, xmm1
0x1006d81c5: vinsertps xmm10, xmm2, xmm0, 0x30
0x1006d81cb: vmulps xmm0, xmm10, xmm10
0x1006d81d0: vpermilpd xmm1, xmm0, 1
0x1006d81d6: vaddps xmm0, xmm0, xmm1
0x1006d81da: vmovshdup xmm1, xmm0
0x1006d81de: vaddss xmm0, xmm0, xmm1
0x1006d81e2: vsqrtss xmm0, xmm0, xmm0
0x1006d81e6: vucomiss xmm0, xmm7
0x1006d81ea: jbe 0x1006d81f6
0x1006d81ec: vpermilps xmm0, xmm0, 0
0x1006d81f2: vdivps xmm10, xmm10, xmm0
0x1006d81f6: vmovaps xmm8, xmmword ptr [rsp + 0xa0]
0x1006d81ff: vinsertps xmm0, xmm8, xmm14, 0x30
0x1006d8205: vmovaps xmmword ptr [rsp + 0x280], xmm14
0x1006d820e: vmovaps xmm1, xmmword ptr [rip + 0x3cfe8a] ; 0x100aa80a0
0x1006d8216: vmovaps xmmword ptr [rsp + 0x290], xmm1
0x1006d821f: vmovaps xmm1, xmmword ptr [rip + 0x3d0809] ; 0x100aa8a30
0x1006d8227: vmovaps xmmword ptr [rsp + 0x2a0], xmm1
0x1006d8230: vmovaps xmmword ptr [rsp + 0x2b0], xmm0
0x1006d8239: vmovshdup xmm0, xmm10
0x1006d823e: vpermilpd xmm1, xmm10, 1
0x1006d8244: vpermilps xmm2, xmm10, 0xe7
0x1006d824a: vaddss xmm3, xmm10, xmm10
0x1006d824f: vaddss xmm4, xmm0, xmm0
0x1006d8253: vaddss xmm5, xmm1, xmm1
0x1006d8257: vmulss xmm8, xmm10, xmm3
0x1006d825b: vmulss xmm7, xmm10, xmm4
0x1006d825f: vmulss xmm6, xmm10, xmm5
0x1006d8263: vmulss xmm3, xmm2, xmm3
0x1006d8267: vmulss xmm9, xmm0, xmm4
0x1006d826b: vmulss xmm0, xmm0, xmm5
0x1006d826f: vmulss xmm4, xmm2, xmm4
0x1006d8273: vmulss xmm1, xmm1, xmm5
0x1006d8277: vmulss xmm2, xmm2, xmm5
0x1006d827b: vsubss xmm5, xmm14, xmm9
0x1006d8280: vsubss xmm10, xmm5, xmm1
0x1006d8284: vaddss xmm5, xmm7, xmm2
0x1006d8288: vsubss xmm11, xmm6, xmm4
0x1006d828c: vsubss xmm12, xmm7, xmm2
0x1006d8290: vsubss xmm7, xmm14, xmm8
0x1006d8295: vsubss xmm1, xmm7, xmm1
0x1006d8299: vaddss xmm2, xmm0, xmm3
0x1006d829d: vaddss xmm4, xmm6, xmm4
0x1006d82a1: vsubss xmm0, xmm0, xmm3
0x1006d82a5: vsubss xmm3, xmm7, xmm9
0x1006d82aa: vinsertps xmm5, xmm10, xmm5, 0x1c
0x1006d82b0: vinsertps xmm5, xmm5, xmm11, 0x20
0x1006d82b6: vmovaps xmmword ptr [rsp + 0x1a0], xmm5
0x1006d82bf: vinsertps xmm1, xmm12, xmm1, 0x1c
0x1006d82c5: vinsertps xmm1, xmm1, xmm2, 0x20
0x1006d82cb: vmovaps xmmword ptr [rsp + 0x1b0], xmm1
0x1006d82d4: vinsertps xmm0, xmm4, xmm0, 0x1c
0x1006d82da: vinsertps xmm0, xmm0, xmm3, 0x20
0x1006d82e0: vmovaps xmmword ptr [rsp + 0x1c0], xmm0
0x1006d82e9: vmovaps xmm0, xmmword ptr [rip + 0x3d070f] ; 0x100aa8a00
0x1006d82f1: vmovaps xmmword ptr [rsp + 0x1d0], xmm0
0x1006d82fa: lea rbx, [rsp + 0x300]
0x1006d8302: mov rdi, rbx
0x1006d8305: lea rsi, [rsp + 0x280]
0x1006d830d: lea rdx, [rsp + 0x1a0]
0x1006d8315: call 0x100076df0 ; 0x100076df0
0x1006d831a: vxorps xmm2, xmm2, xmm2
0x1006d831e: vmovaps xmm3, xmmword ptr [rsp + 0xb0]
0x1006d8327: vblendps xmm0, xmm2, xmm3, 1
0x1006d832d: vblendps xmm1, xmm2, xmm3, 2
0x1006d8333: vblendps xmm2, xmm2, xmm3, 4
0x1006d8339: vmovaps xmmword ptr [rsp + 0x220], xmm0
0x1006d8342: vmovaps xmmword ptr [rsp + 0x230], xmm1
0x1006d834b: vmovaps xmmword ptr [rsp + 0x240], xmm2
0x1006d8354: vmovaps xmm0, xmmword ptr [rip + 0x3d06a4] ; 0x100aa8a00
0x1006d835c: vmovaps xmmword ptr [rsp + 0x250], xmm0
0x1006d8365: lea rdi, [rsp + 0x140]
0x1006d836d: mov rsi, rbx
0x1006d8370: lea rdx, [rsp + 0x220]
0x1006d8378: call 0x100076df0 ; 0x100076df0
0x1006d837d: vmovaps xmm0, xmmword ptr [rsp + 0x140]
0x1006d8386: vmovaps xmm1, xmmword ptr [rsp + 0x150]
0x1006d838f: vmovaps xmm2, xmmword ptr [rsp + 0x160]
0x1006d8398: vmovaps xmm3, xmmword ptr [rsp + 0x170]
0x1006d83a1: vmovaps xmmword ptr [rsp + 0x540], xmm0
0x1006d83aa: vmovaps xmmword ptr [rsp + 0x550], xmm1
0x1006d83b3: vmovaps xmmword ptr [rsp + 0x560], xmm2
0x1006d83bc: vmovaps xmmword ptr [rsp + 0x570], xmm3
0x1006d83c5: mov rax, qword ptr [r15 + 0x48]
0x1006d83c9: cmp dword ptr [rax + 0x10], r14d
0x1006d83cd: jbe 0x1006d8f91
0x1006d83d3: mov rax, qword ptr [rax + 8]
0x1006d83d7: mov rax, qword ptr [rax + r12*8]
0x1006d83db: mov qword ptr [rsp + 0x1a0], rax
0x1006d83e3: call 0x1007abc10 ; 0x1007abc10
0x1006d83e8: mov r12, rax
0x1006d83eb: mov qword ptr [rsp + 0x140], 0
0x1006d83f7: call 0x1007abc10 ; 0x1007abc10
0x1006d83fc: mov rbx, qword ptr [rax]
0x1006d83ff: mov rdi, rax
0x1006d8402: lea rsi, [rsp + 0x140]
0x1006d840a: lea rdx, [rsp + 0x1a0]
0x1006d8412: mov rcx, r12
0x1006d8415: call qword ptr [rbx + 0x40]
0x1006d8418: mov rdi, qword ptr [rsp + 0x140]
0x1006d8420: test rdi, rdi
0x1006d8423: je 0x1006d8f72
0x1006d8429: lea rsi, [rsp + 0x540]
0x1006d8431: call 0x1004d1d50 ; 0x1004d1d50
0x1006d8436: inc r14d
0x1006d8439: mov rbx, qword ptr [r15 + 0x48]
0x1006d843d: mov eax, dword ptr [rbx + 0x10]
0x1006d8440: cmp r14d, eax
0x1006d8443: jb 0x1006d65a0
0x1006d8449: cmp byte ptr [r15 + 0x98], 0
0x1006d8451: vmovss xmm0, dword ptr [rsp + 0xc]
0x1006d8457: je 0x1006d8c6b
0x1006d845d: test eax, eax
0x1006d845f: je 0x1006d8f91
0x1006d8465: mov rax, qword ptr [rbx + 8]
0x1006d8469: mov rax, qword ptr [rax]
0x1006d846c: mov qword ptr [rsp + 0x540], rax
0x1006d8474: call 0x1007abc10 ; 0x1007abc10
0x1006d8479: mov r14, rax
0x1006d847c: mov qword ptr [rsp + 0x380], 0
0x1006d8488: call 0x1007abc10 ; 0x1007abc10
0x1006d848d: mov rbx, qword ptr [rax]
0x1006d8490: lea rsi, [rsp + 0x380]
0x1006d8498: lea rdx, [rsp + 0x540]
0x1006d84a0: mov rdi, rax
0x1006d84a3: mov rcx, r14
0x1006d84a6: call qword ptr [rbx + 0x40]
0x1006d84a9: cmp qword ptr [rsp + 0x380], 0
0x1006d84b2: je 0x1006d8f72
0x1006d84b8: mov rax, qword ptr [r15 + 0x48]
0x1006d84bc: cmp dword ptr [rax + 0x10], 0
0x1006d84c0: je 0x1006d8f91
0x1006d84c6: mov rax, qword ptr [rax + 8]
0x1006d84ca: mov rax, qword ptr [rax]
0x1006d84cd: mov qword ptr [rsp + 0x540], rax
0x1006d84d5: call 0x1007abc10 ; 0x1007abc10
0x1006d84da: mov r14, rax
0x1006d84dd: mov qword ptr [rsp + 0x380], 0
0x1006d84e9: call 0x1007abc10 ; 0x1007abc10
0x1006d84ee: mov rbx, qword ptr [rax]
0x1006d84f1: lea rsi, [rsp + 0x380]
0x1006d84f9: lea rdx, [rsp + 0x540]
0x1006d8501: mov rdi, rax
0x1006d8504: mov rcx, r14
0x1006d8507: call qword ptr [rbx + 0x40]
0x1006d850a: mov rsi, qword ptr [rsp + 0x380]
0x1006d8512: test rsi, rsi
0x1006d8515: je 0x1006d8f72
0x1006d851b: lea rdi, [rsp + 0x1e0]
0x1006d8523: call 0x1004d1e40 ; 0x1004d1e40
0x1006d8528: vmovaps xmm0, xmmword ptr [rsp + 0x1e0]
0x1006d8531: vmovaps xmm1, xmmword ptr [rsp + 0x1f0]
0x1006d853a: vmovaps xmm2, xmmword ptr [rsp + 0x200]
0x1006d8543: vmulps xmm0, xmm0, xmm0
0x1006d8547: vmovshdup xmm3, xmm0
0x1006d854b: vaddss xmm3, xmm0, xmm3
0x1006d854f: vpermilpd xmm0, xmm0, 1
0x1006d8555: vaddss xmm0, xmm0, xmm3
0x1006d8559: vsqrtss xmm0, xmm0, xmm0
0x1006d855d: vmulps xmm1, xmm1, xmm1
0x1006d8561: vmovshdup xmm3, xmm1
0x1006d8565: vaddss xmm3, xmm1, xmm3
0x1006d8569: vpermilpd xmm1, xmm1, 1
0x1006d856f: vaddss xmm1, xmm1, xmm3
0x1006d8573: vsqrtss xmm1, xmm1, xmm1
0x1006d8577: vmulss xmm0, xmm0, xmm1
0x1006d857b: vmulps xmm1, xmm2, xmm2
0x1006d857f: vmovshdup xmm2, xmm1
0x1006d8583: vaddss xmm2, xmm1, xmm2
0x1006d8587: vpermilpd xmm1, xmm1, 1
0x1006d858d: vaddss xmm1, xmm1, xmm2
0x1006d8591: vsqrtss xmm1, xmm1, xmm1
0x1006d8595: vmulss xmm0, xmm0, xmm1
0x1006d8599: vsqrtss xmm2, xmm0, xmm0
0x1006d859d: vmovss xmm1, dword ptr [r15 + 0x70]
0x1006d85a3: vmovss xmm0, dword ptr [r15 + 0xa0]
0x1006d85ac: vmovss dword ptr [rsp + 0x70], xmm0
0x1006d85b2: vmovss dword ptr [rsp + 0x80], xmm1
0x1006d85bb: vmovss dword ptr [rsp + 0x100], xmm2
0x1006d85c4: vmulss xmm0, xmm2, xmm1
0x1006d85c8: vmulss xmm1, xmm0, dword ptr [rip + 0x3d03fc] ; 0x100aa89cc
0x1006d85d0: vmovss xmm2, dword ptr [rip + 0x3ccae8] ; 0x100aa50c0
0x1006d85d8: vxorps ymm0, ymm0, ymm0
0x1006d85dc: vmovaps ymmword ptr [rsp + 0x580], ymm0
0x1006d85e5: vmovaps ymmword ptr [rsp + 0x5a0], ymm0
0x1006d85ee: vmovaps ymmword ptr [rsp + 0x560], ymm0
0x1006d85f7: vmovaps ymmword ptr [rsp + 0x540], ymm0
0x1006d8600: vmaxss xmm0, xmm2, xmm1
0x1006d8604: vmovss dword ptr [rsp + 0x30], xmm1
0x1006d860a: vcmpunordss xmm1, xmm1, xmm1
0x1006d860f: vandnps xmm0, xmm1, xmm0
0x1006d8613: vmovaps xmmword ptr [rsp + 0x60], xmm1
0x1006d8619: vandps xmm1, xmm1, xmm2
0x1006d861d: vorps xmm0, xmm0, xmm1
0x1006d8621: mov dword ptr [rsp + 0x588], 0x3f800000
0x1006d862c: vmovss dword ptr [rsp + 0x58c], xmm0
0x1006d8635: mov dword ptr [rsp + 0x5b0], 0xc00
0x1006d8640: mov rax, qword ptr [r15 + 0x48]
0x1006d8644: cmp dword ptr [rax + 0x10], 0
0x1006d8648: je 0x1006d8f91
0x1006d864e: mov rax, qword ptr [rax + 8]
0x1006d8652: mov rax, qword ptr [rax]
0x1006d8655: mov qword ptr [rsp + 0x140], rax
0x1006d865d: vzeroupper 
0x1006d8660: call 0x1007abc10 ; 0x1007abc10
0x1006d8665: mov r14, rax
0x1006d8668: mov qword ptr [rsp + 0x380], 0
0x1006d8674: call 0x1007abc10 ; 0x1007abc10
0x1006d8679: mov rbx, qword ptr [rax]
0x1006d867c: lea rsi, [rsp + 0x380]
0x1006d8684: lea rdx, [rsp + 0x140]
0x1006d868c: mov rdi, rax
0x1006d868f: mov rcx, r14
0x1006d8692: call qword ptr [rbx + 0x40]
0x1006d8695: mov rsi, qword ptr [rsp + 0x380]
0x1006d869d: test rsi, rsi
0x1006d86a0: je 0x1006d8f72
0x1006d86a6: vmovss xmm0, dword ptr [rsp + 0xd4]
0x1006d86af: vdivss xmm0, xmm0, dword ptr [rsp + 0x4c]
0x1006d86b5: vmovss xmm1, dword ptr [rsp + 0x100]
0x1006d86be: vmulss xmm1, xmm1, dword ptr [rip + 0x3cf12a] ; 0x100aa77f0
0x1006d86c6: vmovss dword ptr [rsp + 0x100], xmm1
0x1006d86cf: vandps xmm0, xmm0, xmmword ptr [rip + 0x3cf239] ; 0x100aa7910
0x1006d86d7: vmovss xmm1, dword ptr [rsp + 0x80]
0x1006d86e0: vaddss xmm1, xmm1, dword ptr [rip + 0x3cc9dc] ; 0x100aa50c4
0x1006d86e8: vdivss xmm1, xmm1, dword ptr [rip + 0x3ff530] ; 0x100ad7c20
0x1006d86f0: vxorps xmm2, xmm2, xmm2
0x1006d86f4: vmaxss xmm1, xmm2, xmm1
0x1006d86f8: vmovss xmm2, dword ptr [rip + 0x3cc9c0] ; 0x100aa50c0
0x1006d8700: vminss xmm1, xmm2, xmm1
0x1006d8704: vsubss xmm2, xmm2, xmm1
0x1006d8708: vmulss xmm1, xmm1, dword ptr [rip + 0x3cf1ac] ; 0x100aa78bc
0x1006d8710: vaddss xmm1, xmm1, xmm2
0x1006d8714: vmulss xmm0, xmm0, xmm1
0x1006d8718: vmovss dword ptr [rsp + 0x80], xmm0
0x1006d8721: lea rdi, [rsp + 0x380]
0x1006d8729: call 0x1004d1e40 ; 0x1004d1e40
0x1006d872e: vmovaps xmm0, xmmword ptr [rsp + 0x3b0]
0x1006d8737: vmovaps xmmword ptr [rsp + 0x550], xmm0
0x1006d8740: mov eax, dword ptr [rsp + 0x5b0]
0x1006d8747: mov ecx, eax
0x1006d8749: or ecx, 0x20
0x1006d874c: mov dword ptr [rsp + 0x5b0], ecx
0x1006d8753: vxorps ymm0, ymm0, ymm0
0x1006d8757: vmovaps ymmword ptr [rsp + 0x380], ymm0
0x1006d8760: vmovaps ymmword ptr [rsp + 0x3a0], ymm0
0x1006d8769: vmovups ymmword ptr [rsp + 0x50c], ymm0
0x1006d8772: vmovaps ymmword ptr [rsp + 0x500], ymm0
0x1006d877b: vmovaps ymmword ptr [rsp + 0x4e0], ymm0
0x1006d8784: vmovaps ymmword ptr [rsp + 0x4c0], ymm0
0x1006d878d: vmovaps ymmword ptr [rsp + 0x4a0], ymm0
0x1006d8796: vmovaps ymmword ptr [rsp + 0x480], ymm0
0x1006d879f: vmovaps ymmword ptr [rsp + 0x460], ymm0
0x1006d87a8: vmovaps ymmword ptr [rsp + 0x440], ymm0
0x1006d87b1: vmovaps ymmword ptr [rsp + 0x420], ymm0
0x1006d87ba: vmovaps ymmword ptr [rsp + 0x400], ymm0
0x1006d87c3: vmovaps ymmword ptr [rsp + 0x3e0], ymm0
0x1006d87cc: vmovaps ymmword ptr [rsp + 0x3c0], ymm0
0x1006d87d5: mov word ptr [rsp + 0x380], 0x375a
0x1006d87df: vmovss xmm0, dword ptr [rsp + 0x100]
0x1006d87e8: vmovss dword ptr [rsp + 0x3a0], xmm0
0x1006d87f1: vmovss xmm0, dword ptr [rsp + 0xc]
0x1006d87f7: vmovss dword ptr [rsp + 0x3a4], xmm0
0x1006d8800: mov dword ptr [rsp + 0x520], 3
0x1006d880b: mov dword ptr [rsp + 0x52c], 2
0x1006d8816: mov cl, 1
0x1006d8818: test cl, cl
0x1006d881a: jne 0x1006d8887
0x1006d881c: vmovss xmm1, dword ptr [rsp + 0x80]
0x1006d8825: vmovss dword ptr [rsp + 0x3a4], xmm1
0x1006d882e: mov edx, 3
0x1006d8833: mov dword ptr [rsp + 0x520], 3
0x1006d883e: mov ecx, 2
0x1006d8843: jmp 0x1006d88c1 ; 0x1006d88c1
0x1006d8845: mov rax, qword ptr [rsi + 0x160]
0x1006d884c: lea rcx, [rip + 0x192287d] ; 0x101ffb0d0
0x1006d8853: cmp byte ptr [rcx], 0
0x1006d8856: je 0x1006d8ac6
0x1006d885c: lea rcx, [rip + 0x5dfcdd] ; 0x100cb8540
0x1006d8863: vmovss xmm0, dword ptr [rcx]
0x1006d8867: jmp 0x1006d8ace ; 0x1006d8ace
0x1006d886c: xor eax, eax
0x1006d886e: cmp byte ptr [r15 + 0x98], 0
0x1006d8876: vmovss xmm0, dword ptr [rsp + 0xc]
0x1006d887c: jne 0x1006d845d
0x1006d8882: jmp 0x1006d8c6b ; 0x1006d8c6b
0x1006d8887: mov byte ptr [rsp + 0x382], 0x5d
0x1006d888f: vmovss xmm1, dword ptr [rsp + 0x80]
0x1006d8898: vmovss dword ptr [rsp + 0x3a8], xmm1
0x1006d88a1: mov dword ptr [rsp + 0x520], 7
0x1006d88ac: mov dword ptr [rsp + 0x52c], 3
0x1006d88b7: mov ecx, 3
0x1006d88bc: mov edx, 7
0x1006d88c1: mov r8, qword ptr [rsp + 0x128]
0x1006d88c9: vmovaps xmm2, xmm1
0x1006d88cd: vmovss xmm1, dword ptr [rsp + 0x70]
0x1006d88d3: vcmpltss xmm0, xmm1, xmm0
0x1006d88d8: vmovss xmm1, dword ptr [rip + 0x3cc7e0] ; 0x100aa50c0
0x1006d88e0: vandps xmm0, xmm0, xmm1
0x1006d88e4: cmp byte ptr [rsp + 0x380], 0x4e
0x1006d88ec: jne 0x1006d88f2
0x1006d88ee: xor ecx, ecx
0x1006d88f0: jmp 0x1006d8905 ; 0x1006d8905
0x1006d88f2: cmp byte ptr [rsp + 0x381], 0x4e
0x1006d88fa: jne 0x1006d8b24
0x1006d8900: mov ecx, 1
0x1006d8905: mov esi, 1
0x1006d890a: shl esi, cl
0x1006d890c: vmovss dword ptr [rsp + rcx*4 + 0x3a0], xmm0
0x1006d8915: or edx, esi
0x1006d8917: mov dword ptr [rsp + 0x520], edx
0x1006d891e: mov rsi, r15
0x1006d8921: sub rsi, -0x80
0x1006d8925: mov cl, byte ptr [r15 + 0x80]
0x1006d892c: test cl, 1
0x1006d892f: vmovss xmm0, dword ptr [rsp + 0xc]
0x1006d8935: jne 0x1006d898d
0x1006d8937: lea rdx, [rsi + 1]
0x1006d893b: cmp byte ptr [rdx], 0
0x1006d893e: je 0x1006d8999
0x1006d8940: cmp byte ptr [r15 + 0xd0], 0
0x1006d8948: jne 0x1006d8999
0x1006d894a: vucomiss xmm0, dword ptr [rsp + 0x70]
0x1006d8950: mov bl, byte ptr [r15 + 0x79]
0x1006d8954: jbe 0x1006d8b6e
0x1006d895a: xor edx, edx
0x1006d895c: test bl, bl
0x1006d895e: sete bl
0x1006d8961: vucomiss xmm2, dword ptr [rip + 0x3cfc47] ; 0x100aa85b0
0x1006d8969: jbe 0x1006d8999
0x1006d896b: mov dl, bl
0x1006d896d: lea rdi, [rip + 0x3ff2c4] ; 0x100ad7c38
0x1006d8974: vmovss xmm0, dword ptr [rdi + rdx*4]
0x1006d8979: vucomiss xmm0, dword ptr [rsp + 0xc]
0x1006d897f: vmovss xmm0, dword ptr [rsp + 0xc]
0x1006d8985: jae 0x1006d8b97
0x1006d898b: jmp 0x1006d8999 ; 0x1006d8999
0x1006d898d: mov rdx, qword ptr [r15 + 0x90]
0x1006d8994: cmp byte ptr [rdx], 0
0x1006d8997: jne 0x1006d8940
0x1006d8999: mov rdi, qword ptr [r15 + 0xc0]
0x1006d89a0: test rdi, rdi
0x1006d89a3: je 0x1006d8c5b
0x1006d89a9: lea r14, [r15 + 0xc0]
0x1006d89b0: mov rbx, qword ptr [r15 + 0xc8]
0x1006d89b7: test rbx, rbx
0x1006d89ba: je 0x1006d8a4e
0x1006d89c0: mov rax, qword ptr [rdi]
0x1006d89c3: vzeroupper 
0x1006d89c6: call qword ptr [rax]
0x1006d89c8: vmovss xmm0, dword ptr [rsp + 0xc]
0x1006d89ce: cmp rbx, rax
0x1006d89d1: jne 0x1006d8a4e
0x1006d89d3: mov rdi, qword ptr [r14]
0x1006d89d6: test rdi, rdi
0x1006d89d9: je 0x1006d8c5b
0x1006d89df: mov rbx, qword ptr [r15 + 0xc8]
0x1006d89e6: test rbx, rbx
0x1006d89e9: je 0x1006d8a4e
0x1006d89eb: mov rax, qword ptr [rdi]
0x1006d89ee: call qword ptr [rax]
0x1006d89f0: cmp rbx, rax
0x1006d89f3: jne 0x1006d8a06
0x1006d89f5: mov rdi, qword ptr [r14]
0x1006d89f8: mov rax, qword ptr [rdi]
0x1006d89fb: lea rsi, [rsp + 0x540]
0x1006d8a03: call qword ptr [rax + 0x68]
0x1006d8a06: mov rdi, qword ptr [r14]
0x1006d8a09: test rdi, rdi
0x1006d8a0c: vmovss xmm0, dword ptr [rsp + 0xc]
0x1006d8a12: je 0x1006d8c5b
0x1006d8a18: mov rbx, qword ptr [r15 + 0xc8]
0x1006d8a1f: test rbx, rbx
0x1006d8a22: je 0x1006d8a5a
0x1006d8a24: mov rax, qword ptr [rdi]
0x1006d8a27: call qword ptr [rax]
0x1006d8a29: vmovss xmm0, dword ptr [rsp + 0xc]
0x1006d8a2f: cmp rbx, rax
0x1006d8a32: jne 0x1006d8a4e
0x1006d8a34: mov rdi, qword ptr [r14]
0x1006d8a37: mov rax, qword ptr [rdi]
0x1006d8a3a: lea rsi, [rsp + 0x380]
0x1006d8a42: call qword ptr [rax + 0x88]
0x1006d8a48: vmovss xmm0, dword ptr [rsp + 0xc]
0x1006d8a4e: mov rdi, qword ptr [r14]
0x1006d8a51: test rdi, rdi
0x1006d8a54: je 0x1006d8c5b
0x1006d8a5a: mov rbx, qword ptr [r15 + 0xc8]
0x1006d8a61: test rbx, rbx
0x1006d8a64: je 0x1006d8c5b
0x1006d8a6a: mov rax, qword ptr [rdi]
0x1006d8a6d: vzeroupper 
0x1006d8a70: call qword ptr [rax]
0x1006d8a72: vmovss xmm0, dword ptr [rsp + 0xc]
0x1006d8a78: cmp rbx, rax
0x1006d8a7b: jne 0x1006d8c5b
0x1006d8a81: mov rdi, qword ptr [r14]
0x1006d8a84: mov rax, qword ptr [rdi]
0x1006d8a87: call qword ptr [rax + 0x10]
0x1006d8a8a: vmovss xmm0, dword ptr [rsp + 0xc]
0x1006d8a90: test al, al
0x1006d8a92: je 0x1006d8c5b
0x1006d8a98: vucomiss xmm0, dword ptr [rsp + 0x70]
0x1006d8a9e: mov al, byte ptr [r15 + 0x79]
0x1006d8aa2: jbe 0x1006d8eee
0x1006d8aa8: xor ecx, ecx
0x1006d8aaa: test al, al
0x1006d8aac: sete cl
0x1006d8aaf: lea rax, [rip + 0x3ff182] ; 0x100ad7c38
0x1006d8ab6: vucomiss xmm0, dword ptr [rax + rcx*4]
0x1006d8abb: jbe 0x1006d8f0f
0x1006d8ac1: jmp 0x1006d8f24 ; 0x1006d8f24
0x1006d8ac6: vmovss xmm0, dword ptr [rip + 0x3cc5f2] ; 0x100aa50c0
0x1006d8ace: vmulss xmm0, xmm0, dword ptr [rax + 0x20]
0x1006d8ad3: vmulss xmm0, xmm0, dword ptr [rax + 0x14]
0x1006d8ad8: vmovss xmm1, dword ptr [rip + 0x3cdfbc] ; 0x100aa6a9c
0x1006d8ae0: vmaxss xmm0, xmm1, xmm0
0x1006d8ae4: vmovss xmm1, dword ptr [rip + 0x3cdfb4] ; 0x100aa6aa0
0x1006d8aec: vminss xmm0, xmm1, xmm0
0x1006d8af0: vmovss dword ptr [rsp + 0x4c], xmm0
0x1006d8af6: vaddss xmm0, xmm0, dword ptr [r15 + 0x9c]
0x1006d8aff: vxorps xmm1, xmm1, xmm1
0x1006d8b03: vmaxss xmm0, xmm1, xmm0
0x1006d8b07: vminss xmm0, xmm5, xmm0
0x1006d8b0b: vmovss dword ptr [r15 + 0x9c], xmm0
0x1006d8b14: cmp byte ptr [r15 + 0x7d], 0
0x1006d8b19: jne 0x1006d6481
0x1006d8b1f: jmp 0x1006d6490 ; 0x1006d6490
0x1006d8b24: cmp ecx, 2
0x1006d8b27: je 0x1006d8b3d
0x1006d8b29: cmp byte ptr [rsp + 0x382], 0x4e
0x1006d8b31: jne 0x1006d8b3d
0x1006d8b33: mov ecx, 2
0x1006d8b38: jmp 0x1006d8905 ; 0x1006d8905
0x1006d8b3d: mov esi, ecx
0x1006d8b3f: mov byte ptr [rsp + rsi + 0x380], 0x4e
0x1006d8b47: vmovss dword ptr [rsp + rsi*4 + 0x3a0], xmm0
0x1006d8b50: mov esi, 1
0x1006d8b55: shl esi, cl
0x1006d8b57: or edx, esi
0x1006d8b59: mov dword ptr [rsp + 0x520], edx
0x1006d8b60: inc ecx
0x1006d8b62: mov dword ptr [rsp + 0x52c], ecx
0x1006d8b69: jmp 0x1006d891e ; 0x1006d891e
0x1006d8b6e: xor edx, edx
0x1006d8b70: test bl, bl
0x1006d8b72: sete bl
0x1006d8b75: vucomiss xmm2, dword ptr [rip + 0x3cfa33] ; 0x100aa85b0
0x1006d8b7d: jbe 0x1006d8999
0x1006d8b83: mov dl, bl
0x1006d8b85: lea rdi, [rip + 0x3ff0a4] ; 0x100ad7c30
0x1006d8b8c: vucomiss xmm0, dword ptr [rdi + rdx*4]
0x1006d8b91: jb 0x1006d8999
0x1006d8b97: mov rdi, qword ptr [r8 + 0x5c8]
0x1006d8b9e: test cl, 1
0x1006d8ba1: jne 0x1006d8ba8
0x1006d8ba3: inc rsi
0x1006d8ba6: jmp 0x1006d8baf ; 0x1006d8baf
0x1006d8ba8: mov rsi, qword ptr [r15 + 0x90]
0x1006d8baf: vmovaps xmm0, xmmword ptr [rsp + 0x210]
0x1006d8bb8: vmovss xmm1, dword ptr [rip + 0x3cec30] ; 0x100aa77f0
0x1006d8bc0: vmovaps xmm3, xmmword ptr [rsp + 0x60]
0x1006d8bc6: vandps xmm2, xmm3, xmm1
0x1006d8bca: vmaxss xmm1, xmm1, dword ptr [rsp + 0x30]
0x1006d8bd0: vandnps xmm1, xmm3, xmm1
0x1006d8bd4: vorps xmm1, xmm1, xmm2
0x1006d8bd8: mov byte ptr [rsp + 0x54d], 1
0x1006d8be0: mov dword ptr [rsp + 0x540], 0x3f800000
0x1006d8beb: vmovaps xmmword ptr [rsp + 0x550], xmm0
0x1006d8bf4: mov dword ptr [rsp + 0x588], 0x40400000
0x1006d8bff: vmovss dword ptr [rsp + 0x58c], xmm1
0x1006d8c08: or eax, 0xc31
0x1006d8c0d: mov dword ptr [rsp + 0x5b0], eax
0x1006d8c14: lea rdx, [rsp + 0x540]
0x1006d8c1c: lea rcx, [rsp + 0x380]
0x1006d8c24: vzeroupper 
0x1006d8c27: call 0x1006018a0 ; 0x1006018a0
0x1006d8c2c: mov rdi, rax
0x1006d8c2f: lea r14, [r15 + 0xc0]
0x1006d8c36: mov qword ptr [r15 + 0xc0], rdi
0x1006d8c3d: mov qword ptr [r15 + 0xc8], rdx
0x1006d8c44: mov byte ptr [r15 + 0xd0], 1
0x1006d8c4c: vmovss xmm0, dword ptr [rsp + 0xc]
0x1006d8c52: test rdi, rdi
0x1006d8c55: jne 0x1006d8a5a
0x1006d8c5b: vucomiss xmm0, dword ptr [rsp + 0x70]
0x1006d8c61: ja 0x1006d8c6b
0x1006d8c63: mov byte ptr [r15 + 0xd0], 0
0x1006d8c6b: vmovss dword ptr [r15 + 0xa0], xmm0
0x1006d8c74: cmp byte ptr [r15 + 0x74], 0
0x1006d8c79: je 0x1006d8c99
0x1006d8c7b: vmovss xmm0, dword ptr [rip + 0x3cc43d] ; 0x100aa50c0
0x1006d8c83: vmovss xmm1, dword ptr [rsp + 0xc]
0x1006d8c89: vsubss xmm1, xmm0, xmm1
0x1006d8c8d: vmovss dword ptr [rsp + 0xc], xmm1
0x1006d8c93: vmovss xmm0, dword ptr [rsp + 0xc]
0x1006d8c99: vaddss xmm0, xmm0, dword ptr [rip + 0x3cc423] ; 0x100aa50c4
0x1006d8ca1: vandps xmm0, xmm0, xmmword ptr [rip + 0x3cec67] ; 0x100aa7910
0x1006d8ca9: vmovss xmm1, dword ptr [rip + 0x3cec13] ; 0x100aa78c4
0x1006d8cb1: vucomiss xmm1, xmm0
0x1006d8cb5: jb 0x1006d8ec4
0x1006d8cbb: cmp byte ptr [r15 + 0x78], 0
0x1006d8cc0: jne 0x1006d8ec4
0x1006d8cc6: cmp byte ptr [r15 + 0x7b], 0
0x1006d8ccb: je 0x1006d8ec4
0x1006d8cd1: cmp byte ptr [r15 + 0x7a], 0
0x1006d8cd6: je 0x1006d8db3
0x1006d8cdc: mov rax, qword ptr [r15 + 0x48]
0x1006d8ce0: cmp dword ptr [rax + 0x10], 0
0x1006d8ce4: je 0x1006d8db3
0x1006d8cea: xor ecx, ecx
0x1006d8cec: lea r14, [rsp + 0x380]
0x1006d8cf4: lea r12, [rsp + 0x540]
0x1006d8cfc: nop dword ptr [rax]
0x1006d8d00: mov rax, qword ptr [rax + 8]
0x1006d8d04: mov ebx, ecx
0x1006d8d06: mov rax, qword ptr [rax + rbx*8]
0x1006d8d0a: mov qword ptr [rsp + 0x540], rax
0x1006d8d12: vzeroupper 
0x1006d8d15: call 0x1007abc10 ; 0x1007abc10
0x1006d8d1a: mov r13, rax
0x1006d8d1d: mov qword ptr [rsp + 0x380], 0
0x1006d8d29: call 0x1007abc10 ; 0x1007abc10
0x1006d8d2e: mov r8, qword ptr [rax]
0x1006d8d31: mov rdi, rax
0x1006d8d34: mov rsi, r14
0x1006d8d37: mov rdx, r12
0x1006d8d3a: mov rcx, r13
0x1006d8d3d: call qword ptr [r8 + 0x40]
0x1006d8d41: mov rsi, qword ptr [rsp + 0x380]
0x1006d8d49: test rsi, rsi
0x1006d8d4c: je 0x1006d8f72
0x1006d8d52: mov rdi, r14
0x1006d8d55: call 0x1004d1e40 ; 0x1004d1e40
0x1006d8d5a: mov rax, qword ptr [r15 + 0xb8]
0x1006d8d61: vmovaps xmm0, xmmword ptr [rsp + 0x380]
0x1006d8d6a: mov rcx, rbx
0x1006d8d6d: shl rcx, 6
0x1006d8d71: vmovaps xmmword ptr [rax + rcx], xmm0
0x1006d8d76: vmovaps xmm0, xmmword ptr [rsp + 0x390]
0x1006d8d7f: vmovaps xmmword ptr [rax + rcx + 0x10], xmm0
0x1006d8d85: vmovaps xmm0, xmmword ptr [rsp + 0x3a0]
0x1006d8d8e: vmovaps xmmword ptr [rax + rcx + 0x20], xmm0
0x1006d8d94: vmovaps xmm0, xmmword ptr [rsp + 0x3b0]
0x1006d8d9d: vmovaps xmmword ptr [rax + rcx + 0x30], xmm0
0x1006d8da3: lea ecx, [rbx + 1]
0x1006d8da6: mov rax, qword ptr [r15 + 0x48]
0x1006d8daa: cmp ecx, dword ptr [rax + 0x10]
0x1006d8dad: jb 0x1006d8d00
0x1006d8db3: mov rax, qword ptr [r15 + 0x50]
0x1006d8db7: test rax, rax
0x1006d8dba: je 0x1006d8e47
0x1006d8dc0: cmp dword ptr [rax + 0x10], 0
0x1006d8dc4: je 0x1006d8e47
0x1006d8dca: xor ebx, ebx
0x1006d8dcc: lea r14, [rsp + 0x380]
0x1006d8dd4: lea r12, [rsp + 0x540]
0x1006d8ddc: nop dword ptr [rax]
0x1006d8de0: mov rax, qword ptr [rax + 8]
0x1006d8de4: mov ecx, ebx
0x1006d8de6: mov rax, qword ptr [rax + rcx*8]
0x1006d8dea: mov qword ptr [rsp + 0x540], rax
0x1006d8df2: vzeroupper 
0x1006d8df5: call 0x1007abc10 ; 0x1007abc10
0x1006d8dfa: mov r13, rax
0x1006d8dfd: mov qword ptr [rsp + 0x380], 0
0x1006d8e09: call 0x1007abc10 ; 0x1007abc10
0x1006d8e0e: mov r8, qword ptr [rax]
0x1006d8e11: mov rdi, rax
0x1006d8e14: mov rsi, r14
0x1006d8e17: mov rdx, r12
0x1006d8e1a: mov rcx, r13
0x1006d8e1d: call qword ptr [r8 + 0x40]
0x1006d8e21: mov rdi, qword ptr [rsp + 0x380]
0x1006d8e29: test rdi, rdi
0x1006d8e2c: je 0x1006d8f72
0x1006d8e32: mov esi, 1
0x1006d8e37: call 0x1004d1f60 ; 0x1004d1f60
0x1006d8e3c: inc ebx
0x1006d8e3e: mov rax, qword ptr [r15 + 0x50]
0x1006d8e42: cmp ebx, dword ptr [rax + 0x10]
0x1006d8e45: jb 0x1006d8de0
0x1006d8e47: mov rdi, qword ptr [r15 + 0xc0]
0x1006d8e4e: test rdi, rdi
0x1006d8e51: je 0x1006d8eae
0x1006d8e53: mov rbx, qword ptr [r15 + 0xc8]
0x1006d8e5a: test rbx, rbx
0x1006d8e5d: je 0x1006d8eae
0x1006d8e5f: mov rax, qword ptr [rdi]
0x1006d8e62: vzeroupper 
0x1006d8e65: call qword ptr [rax]
0x1006d8e67: cmp rbx, rax
0x1006d8e6a: jne 0x1006d8eae
0x1006d8e6c: mov rdi, qword ptr [r15 + 0xc0]
0x1006d8e73: mov rax, qword ptr [rdi]
0x1006d8e76: call qword ptr [rax + 0x10]
0x1006d8e79: test al, al
0x1006d8e7b: je 0x1006d8eae
0x1006d8e7d: mov rdi, qword ptr [r15 + 0xc0]
0x1006d8e84: test rdi, rdi
0x1006d8e87: je 0x1006d8eae
0x1006d8e89: mov rbx, qword ptr [r15 + 0xc8]
0x1006d8e90: test rbx, rbx
0x1006d8e93: je 0x1006d8eae
0x1006d8e95: mov rax, qword ptr [rdi]
0x1006d8e98: call qword ptr [rax]
0x1006d8e9a: cmp rbx, rax
0x1006d8e9d: jne 0x1006d8eae
0x1006d8e9f: mov rdi, qword ptr [r15 + 0xc0]
0x1006d8ea6: mov rax, qword ptr [rdi]
0x1006d8ea9: xor esi, esi
0x1006d8eab: call qword ptr [rax + 0x30]
0x1006d8eae: mov dword ptr [r15 + 0x9c], 0
0x1006d8eb9: mov rdi, r15
0x1006d8ebc: vzeroupper 
0x1006d8ebf: call 0x10032ef60 ; 0x10032ef60
0x1006d8ec4: mov rax, qword ptr [rip + 0x534a0d] ; 0x100c0d8d8
0x1006d8ecb: mov rax, qword ptr [rax]
0x1006d8ece: cmp rax, qword ptr [rsp + 0x5c0]
0x1006d8ed6: jne 0x1006d8f6a
0x1006d8edc: lea rsp, [rbp - 0x28]
0x1006d8ee0: pop rbx
0x1006d8ee1: pop r12
0x1006d8ee3: pop r13
0x1006d8ee5: pop r14
0x1006d8ee7: pop r15
0x1006d8ee9: pop rbp
0x1006d8eea: vzeroupper 
0x1006d8eed: ret 
0x1006d8eee: xor ecx, ecx
0x1006d8ef0: test al, al
0x1006d8ef2: sete cl
0x1006d8ef5: lea rax, [rip + 0x3fed34] ; 0x100ad7c30
0x1006d8efc: vmovss xmm0, dword ptr [rax + rcx*4]
0x1006d8f01: vucomiss xmm0, dword ptr [rsp + 0xc]
0x1006d8f07: vmovss xmm0, dword ptr [rsp + 0xc]
0x1006d8f0d: ja 0x1006d8f24
0x1006d8f0f: vucomiss xmm0, dword ptr [r15 + 0xa0]
0x1006d8f18: jne 0x1006d8c6b
0x1006d8f1e: jp 0x1006d8c6b
0x1006d8f24: mov rdi, qword ptr [r14]
0x1006d8f27: test rdi, rdi
0x1006d8f2a: je 0x1006d8c63
0x1006d8f30: mov rbx, qword ptr [r15 + 0xc8]
0x1006d8f37: test rbx, rbx
0x1006d8f3a: je 0x1006d8c63
0x1006d8f40: mov rax, qword ptr [rdi]
0x1006d8f43: call qword ptr [rax]
0x1006d8f45: vmovss xmm0, dword ptr [rsp + 0xc]
0x1006d8f4b: cmp rbx, rax
0x1006d8f4e: jne 0x1006d8c63
0x1006d8f54: mov rdi, qword ptr [r14]
0x1006d8f57: mov rax, qword ptr [rdi]
0x1006d8f5a: xor esi, esi
0x1006d8f5c: call qword ptr [rax + 0x30]
0x1006d8f5f: vmovss xmm0, dword ptr [rsp + 0xc]
0x1006d8f65: jmp 0x1006d8c63 ; 0x1006d8c63
0x1006d8f6a: vzeroupper 
0x1006d8f6d: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1006d8f72: lea rdi, [rip + 0x488b7f] ; 0x100b61af8 ret
0x1006d8f79: lea rsi, [rip + 0x4889e3] ; 0x100b61963 ./Clump.h
0x1006d8f80: mov edx, 0x47
0x1006d8f85: mov ecx, 3
0x1006d8f8a: call 0x1007e5f70 ; 0x1007e5f70
0x1006d8f8f: ud2 
0x1006d8f91: lea rdi, [rip + 0x4889c0] ; 0x100b61958 idx < size
0x1006d8f98: lea rsi, [rip + 0x4889c4] ; 0x100b61963 ./Clump.h
0x1006d8f9f: mov edx, 0x36
0x1006d8fa4: mov ecx, 3
0x1006d8fa9: vzeroupper 
0x1006d8fac: call 0x1007e5f70 ; 0x1007e5f70
0x1006d8fb1: ud2 
0x1006d8fb3: lea rdi, [rip + 0x48bb50] ; 0x100b64b0a inverse
0x1006d8fba: lea rsi, [rip + 0x48bb51] ; 0x100b64b12 ../../../Code/3rdParty/Vectormath/simd/mat_aos.h
0x1006d8fc1: lea rcx, [rip + 0x49e23b] ; 0x100b77203 !isnan(detinv) && "Invalid matrix, cannot inverse it!"
0x1006d8fc8: mov edx, 0xa8
0x1006d8fcd: call 0x100aa24a4 ; 0x100aa24a4 ___assert_rtn
0x1006d8fd2: lea rdi, [rip + 0x4a8ab9] ; 0x100b81a92 node
0x1006d8fd9: lea rsi, [rip + 0x4c22d6] ; 0x100b9b2b6 TransformObject.cpp
0x1006d8fe0: mov edx, 0x99
0x1006d8fe5: mov ecx, 3
0x1006d8fea: call 0x1007e5f70 ; 0x1007e5f70
0x1006d8fef: ud2 
0x1006d8ff1: nop word ptr cs:[rax + rax]
