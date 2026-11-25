0x10073e320: push rbp
0x10073e321: mov rbp, rsp
0x10073e324: push r15
0x10073e326: push r14
0x10073e328: push r13
0x10073e32a: push r12
0x10073e32c: push rbx
0x10073e32d: sub rsp, 0x408
0x10073e334: mov r15, rsi
0x10073e337: mov r14, rdi
0x10073e33a: mov rax, qword ptr [rip + 0x4cf597] ; 0x100c0d8d8
0x10073e341: mov rax, qword ptr [rax]
0x10073e344: mov qword ptr [rbp - 0x30], rax
0x10073e348: cmp qword ptr [r15 + 0x270], 0
0x10073e350: je 0x10073e3ec
0x10073e356: mov rsi, qword ptr [r15 + 0x1b8]
0x10073e35d: lea rbx, [rbp - 0x428]
0x10073e364: xor edx, edx
0x10073e366: xor ecx, ecx
0x10073e368: mov rdi, rbx
0x10073e36b: call 0x1003b7c10 ; 0x1003b7c10
0x10073e370: mov rdi, rbx
0x10073e373: call 0x1003b7c20 ; 0x1003b7c20
0x10073e378: mov ebx, eax
0x10073e37a: cmp byte ptr [r14 + 0x350], 0
0x10073e382: jne 0x10073e3ad
0x10073e384: mov rdi, qword ptr [r15 + 0x280]
0x10073e38b: call 0x1000fe060 ; 0x1000fe060
0x10073e390: test al, al
0x10073e392: je 0x10073e39f
0x10073e394: mov rdi, r14
0x10073e397: mov rsi, r15
0x10073e39a: call 0x10073ab80 ; 0x10073ab80
0x10073e39f: cmp byte ptr [r14 + 0x350], 0
0x10073e3a7: je 0x10074108f
0x10073e3ad: mov rdi, r14
0x10073e3b0: mov rsi, r15
0x10073e3b3: call 0x1007413a0 ; 0x1007413a0
0x10073e3b8: mov rax, qword ptr [r15 + 0x160]
0x10073e3bf: mov rdi, qword ptr [r15 + 0x280]
0x10073e3c6: vmovss xmm0, dword ptr [rax + 0x14]
0x10073e3cb: vmovaps xmmword ptr [rbp - 0x110], xmm0
0x10073e3d3: lea rcx, [rip + 0x18bccf6] ; 0x101ffb0d0
0x10073e3da: cmp byte ptr [rcx], 0
0x10073e3dd: je 0x10073e3f9
0x10073e3df: lea rcx, [rip + 0x57a15a] ; 0x100cb8540
0x10073e3e6: vmovss xmm0, dword ptr [rcx]
0x10073e3ea: jmp 0x10073e401 ; 0x10073e401
0x10073e3ec: mov byte ptr [r14 + 0xe0], 0
0x10073e3f4: jmp 0x10074108f ; 0x10074108f
0x10073e3f9: vmovss xmm0, dword ptr [rip + 0x366cbf] ; 0x100aa50c0
0x10073e401: mov dword ptr [rbp - 0x124], ebx
0x10073e407: vmulss xmm0, xmm0, dword ptr [rax + 0x20]
0x10073e40c: vmovss dword ptr [rbp - 0x128], xmm0
0x10073e414: call 0x1000fc260 ; 0x1000fc260
0x10073e419: mov r12, rax
0x10073e41c: mov rax, qword ptr [r12 + 0x18]
0x10073e421: vbroadcastss xmm0, dword ptr [rax + 0xe4]
0x10073e42a: vmovaps xmmword ptr [rbp - 0xf0], xmm0
0x10073e432: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x10073e437: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x10073e43f: mov rax, qword ptr [r12 + 0x20]
0x10073e444: mov rsi, qword ptr [rax + 0x298]
0x10073e44b: lea rdi, [rbp - 0x1d0]
0x10073e452: call 0x1007f26b0 ; 0x1007f26b0
0x10073e457: mov rax, qword ptr [r12 + 0x18]
0x10073e45c: vmovaps xmm0, xmmword ptr [rax + 0x130]
0x10073e464: vmovaps xmmword ptr [rbp - 0x140], xmm0
0x10073e46c: cmp dword ptr [rax + 0xc70], 1
0x10073e473: ja 0x10073e480
0x10073e475: mov rdi, r14
0x10073e478: mov rsi, r15
0x10073e47b: call 0x10073ab80 ; 0x10073ab80
0x10073e480: vmovaps xmm0, xmmword ptr [rbp - 0xf0]
0x10073e488: vmulps xmm0, xmm0, xmmword ptr [rip + 0x381060] ; 0x100abf4f0
0x10073e490: vmovaps xmmword ptr [rbp - 0xf0], xmm0
0x10073e498: mov rsi, qword ptr [r12 + 0x50]
0x10073e49d: lea rbx, [rbp - 0xb0]
0x10073e4a4: mov rdi, rbx
0x10073e4a7: call 0x10035cef0 ; 0x10035cef0
0x10073e4ac: mov rdi, rbx
0x10073e4af: call 0x10035bac0 ; 0x10035bac0
0x10073e4b4: vxorps xmm0, xmm0, xmm0
0x10073e4b8: test rax, rax
0x10073e4bb: je 0x10073e4e6
0x10073e4bd: mov rax, qword ptr [rax]
0x10073e4c0: cmp rax, r12
0x10073e4c3: je 0x10073e4ea
0x10073e4c5: mov rcx, qword ptr [rax + 0x18]
0x10073e4c9: cmp byte ptr [rcx + 0xbb0], 0
0x10073e4d0: jne 0x10073e4fb
0x10073e4d2: mov rcx, qword ptr [r12 + 0x18]
0x10073e4d7: cmp byte ptr [rcx + 0xbb0], 0
0x10073e4de: jne 0x10073e4ef
0x10073e4e0: vxorps xmm0, xmm0, xmm0
0x10073e4e4: jmp 0x10073e4f7 ; 0x10073e4f7
0x10073e4e6: xor eax, eax
0x10073e4e8: jmp 0x10073e4fb ; 0x10073e4fb
0x10073e4ea: mov rax, r12
0x10073e4ed: jmp 0x10073e4fb ; 0x10073e4fb
0x10073e4ef: vmovss xmm0, dword ptr [rip + 0x366bc9] ; 0x100aa50c0
0x10073e4f7: cmovne r12, rax
0x10073e4fb: vmovaps xmm1, xmmword ptr [rbp - 0xd0]
0x10073e503: vsubps xmm5, xmm1, xmmword ptr [rbp - 0xf0]
0x10073e50b: vmovaps xmm4, xmmword ptr [rbp - 0x110]
0x10073e513: vaddss xmm1, xmm4, xmm4
0x10073e517: vaddss xmm1, xmm1, dword ptr [rip + 0x366ba1] ; 0x100aa50c0
0x10073e51f: vmulss xmm2, xmm4, dword ptr [rip + 0x369395] ; 0x100aa78bc
0x10073e527: vmovss xmm3, dword ptr [r14 + 0x3c0]
0x10073e530: vsubss xmm0, xmm0, xmm3
0x10073e534: vmulss xmm0, xmm2, xmm0
0x10073e538: vaddss xmm0, xmm0, dword ptr [r14 + 0x3c4]
0x10073e541: vmulss xmm1, xmm1, xmm1
0x10073e545: vdivss xmm0, xmm0, xmm1
0x10073e549: vmovss dword ptr [r14 + 0x3c4], xmm0
0x10073e552: vmulss xmm0, xmm4, xmm0
0x10073e556: vaddss xmm0, xmm3, xmm0
0x10073e55a: vmovss dword ptr [r14 + 0x3c0], xmm0
0x10073e563: test rax, rax
0x10073e566: je 0x10073e5fe
0x10073e56c: mov rcx, qword ptr [rax + 0x18]
0x10073e570: vxorps xmm1, xmm1, xmm1
0x10073e574: vmaxss xmm0, xmm1, xmm0
0x10073e578: vmovss xmm1, dword ptr [rip + 0x366b40] ; 0x100aa50c0
0x10073e580: vminss xmm0, xmm1, xmm0
0x10073e584: vsubss xmm1, xmm1, xmm0
0x10073e588: vpermilps xmm1, xmm1, 0xc0
0x10073e58e: vmovaps xmmword ptr [rbp - 0xd0], xmm1
0x10073e596: vmulps xmm1, xmm5, xmm1
0x10073e59a: vpermilps xmm0, xmm0, 0xc0
0x10073e5a0: vmovaps xmmword ptr [rbp - 0x180], xmm0
0x10073e5a8: vmulps xmm0, xmm0, xmmword ptr [rcx + 0x10]
0x10073e5ad: vaddps xmm0, xmm1, xmm0
0x10073e5b1: vmovaps xmmword ptr [rbp - 0xf0], xmm0
0x10073e5b9: mov rax, qword ptr [rax + 0x20]
0x10073e5bd: mov rsi, qword ptr [rax + 0x298]
0x10073e5c4: lea rdi, [rbp - 0xb0]
0x10073e5cb: call 0x1007f26b0 ; 0x1007f26b0
0x10073e5d0: vmovaps xmm0, xmmword ptr [rbp - 0xd0]
0x10073e5d8: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x1d0]
0x10073e5e0: vmovaps xmm1, xmmword ptr [rbp - 0x180]
0x10073e5e8: vmulps xmm1, xmm1, xmmword ptr [rbp - 0xb0]
0x10073e5f0: vaddps xmm0, xmm0, xmm1
0x10073e5f4: vmovaps xmmword ptr [rbp - 0x1d0], xmm0
0x10073e5fc: jmp 0x10073e606 ; 0x10073e606
0x10073e5fe: vmovaps xmmword ptr [rbp - 0xf0], xmm5
0x10073e606: mov r13, qword ptr [r12 + 0x18]
0x10073e60b: mov rax, qword ptr [r12 + 0x20]
0x10073e610: mov qword ptr [rbp - 0xf8], rax
0x10073e617: mov rax, qword ptr [r15 + 0x60]
0x10073e61b: vmovss xmm0, dword ptr [rax + 0x298]
0x10073e623: vmovss dword ptr [rbp - 0x144], xmm0
0x10073e62b: vmovss xmm0, dword ptr [r13 + 0xb48]
0x10073e634: cmp byte ptr [r13 + 0x100], 0
0x10073e63c: je 0x10073e656
0x10073e63e: cmp byte ptr [r13 + 0xb52], 0
0x10073e646: jne 0x10073e656
0x10073e648: cmp byte ptr [r13 + 0xbc1], 0
0x10073e650: je 0x10073e9f5
0x10073e656: mov dword ptr [rbp - 0xb4], 0
0x10073e660: mov bl, byte ptr [r14 + 0x114]
0x10073e667: test bl, bl
0x10073e669: vmovss dword ptr [rbp - 0xdc], xmm0
0x10073e671: je 0x10073e69d
0x10073e673: vmovss xmm0, dword ptr [rip + 0x366a45] ; 0x100aa50c0
0x10073e67b: cmp byte ptr [r14 + 0x1fc], 0
0x10073e683: jne 0x10073e6fa
0x10073e685: cmp byte ptr [r14 + 0x208], 0
0x10073e68d: jne 0x10073e6fa
0x10073e68f: vmovss xmm1, dword ptr [rip + 0x366a29] ; 0x100aa50c0
0x10073e697: vsubss xmm0, xmm1, xmm0
0x10073e69b: jmp 0x10073e702 ; 0x10073e702
0x10073e69d: cmp byte ptr [r14 + 0x101], 0
0x10073e6a5: je 0x10073e6ec
0x10073e6a7: vmovss xmm0, dword ptr [r14 + 0x160]
0x10073e6b0: vaddss xmm0, xmm0, dword ptr [rip + 0x379dcc] ; 0x100ab8484
0x10073e6b8: vdivss xmm0, xmm0, dword ptr [rip + 0x36912c] ; 0x100aa77ec
0x10073e6c0: vxorps xmm1, xmm1, xmm1
0x10073e6c4: vmaxss xmm0, xmm1, xmm0
0x10073e6c8: vmovss xmm2, dword ptr [rip + 0x3669f0] ; 0x100aa50c0
0x10073e6d0: vminss xmm0, xmm2, xmm0
0x10073e6d4: vsubss xmm2, xmm2, xmm0
0x10073e6d8: vmulss xmm0, xmm0, xmm1
0x10073e6dc: vaddss xmm0, xmm0, xmm2
0x10073e6e0: cmp byte ptr [r14 + 0x1fc], 0
0x10073e6e8: jne 0x10073e6fa
0x10073e6ea: jmp 0x10073e685 ; 0x10073e685
0x10073e6ec: vxorps xmm0, xmm0, xmm0
0x10073e6f0: cmp byte ptr [r14 + 0x1fc], 0
0x10073e6f8: je 0x10073e685
0x10073e6fa: vmovss xmm0, dword ptr [rip + 0x3669be] ; 0x100aa50c0
0x10073e702: vmovss dword ptr [rbp - 0x100], xmm0
0x10073e70a: vxorps xmm0, xmm0, xmm0
0x10073e70e: vmovaps xmm1, xmmword ptr [r14 + 0x2f0]
0x10073e717: vblendps xmm2, xmm0, xmmword ptr [r14 + 0x310], 7
0x10073e721: vblendps xmm3, xmm0, xmmword ptr [r14 + 0x320], 7
0x10073e72b: vblendps xmm0, xmm0, xmmword ptr [r14 + 0x330], 7
0x10073e735: vinsertps xmm1, xmm1, dword ptr [rip + 0x366981], 0x30 ; 0x100aa50c0
0x10073e73f: vmovaps xmmword ptr [r14 + 0x30], xmm2
0x10073e745: vmovaps xmmword ptr [r14 + 0x40], xmm3
0x10073e74b: vmovaps xmmword ptr [r14 + 0x50], xmm0
0x10073e751: vmovaps xmmword ptr [r14 + 0x60], xmm1
0x10073e757: vmovss xmm0, dword ptr [r13 + 0x38]
0x10073e75d: vmulss xmm4, xmm0, dword ptr [rip + 0x379ca3] ; 0x100ab8408
0x10073e765: cmp byte ptr [r13 + 0xbc1], 0
0x10073e76d: je 0x10073e849
0x10073e773: vmovaps xmm0, xmmword ptr [r13 + 0x60]
0x10073e779: vmovaps xmm1, xmmword ptr [r13 + 0x140]
0x10073e782: vmulps xmm2, xmm1, xmm0
0x10073e786: vmovshdup xmm3, xmm2
0x10073e78a: vaddss xmm3, xmm2, xmm3
0x10073e78e: vpermilpd xmm2, xmm2, 1
0x10073e794: vaddss xmm2, xmm2, xmm3
0x10073e798: vpermilps xmm2, xmm2, 0xc0
0x10073e79e: vmulps xmm0, xmm0, xmm2
0x10073e7a2: vsubps xmm0, xmm1, xmm0
0x10073e7a6: vmulps xmm1, xmm1, xmm1
0x10073e7aa: vmovshdup xmm2, xmm1
0x10073e7ae: vaddss xmm2, xmm1, xmm2
0x10073e7b2: vpermilpd xmm1, xmm1, 1
0x10073e7b8: vaddss xmm1, xmm1, xmm2
0x10073e7bc: vsqrtss xmm1, xmm1, xmm1
0x10073e7c0: vmulps xmm2, xmm0, xmm0
0x10073e7c4: vmovshdup xmm3, xmm2
0x10073e7c8: vaddss xmm3, xmm2, xmm3
0x10073e7cc: vpermilpd xmm2, xmm2, 1
0x10073e7d2: vaddss xmm2, xmm2, xmm3
0x10073e7d6: vsqrtss xmm2, xmm2, xmm2
0x10073e7da: vucomiss xmm2, dword ptr [rip + 0x3690e2] ; 0x100aa78c4
0x10073e7e2: vmovss dword ptr [rbp - 0xd0], xmm4
0x10073e7ea: jbe 0x10073e7f6
0x10073e7ec: vpermilps xmm2, xmm2, 0xc0
0x10073e7f2: vdivps xmm0, xmm0, xmm2
0x10073e7f6: vpermilps xmm1, xmm1, 0xc0
0x10073e7fc: vmulps xmm0, xmm1, xmm0
0x10073e800: vmulps xmm0, xmm0, xmmword ptr [r13 + 0x80]
0x10073e809: vmovshdup xmm1, xmm0
0x10073e80d: vaddss xmm1, xmm0, xmm1
0x10073e811: vpermilpd xmm0, xmm0, 1
0x10073e817: vaddss xmm0, xmm0, xmm1
0x10073e81b: call 0x100aa2576 ; 0x100aa2576 _acosf
0x10073e820: vaddss xmm0, xmm0, dword ptr [rip + 0x37a2f0] ; 0x100ab8b18
0x10073e828: vmovss xmm1, dword ptr [rip + 0x366890] ; 0x100aa50c0
0x10073e830: vsubss xmm1, xmm1, dword ptr [r13 + 0xba4]
0x10073e839: vmulss xmm0, xmm0, xmm1
0x10073e83d: vmovss xmm4, dword ptr [rbp - 0xd0]
0x10073e845: vaddss xmm4, xmm4, xmm0
0x10073e849: vmovss xmm5, dword ptr [r14 + 0x2c4]
0x10073e852: vmovaps xmm2, xmmword ptr [r13 + 0x50]
0x10073e858: lea rax, [rip + 0x382f41] ; 0x100ac17a0
0x10073e85f: vmovss xmm1, dword ptr [rax]
0x10073e863: lea rax, [rip + 0x382f7e] ; 0x100ac17e8 fff@
0x10073e86a: vmovss xmm0, dword ptr [rax]
0x10073e86e: vmovss dword ptr [rbp - 0x130], xmm1
0x10073e876: vsubss xmm1, xmm1, xmm0
0x10073e87a: vucomiss xmm1, dword ptr [rip + 0x369042] ; 0x100aa78c4
0x10073e882: vmovss dword ptr [rbp - 0xd0], xmm4
0x10073e88a: ja 0x10073e8a4
0x10073e88c: vmovss xmm3, dword ptr [rip + 0x36ad3c] ; 0x100aa95d0
0x10073e894: vucomiss xmm3, xmm1
0x10073e898: ja 0x10073e8a4
0x10073e89a: vmovss xmm0, dword ptr [rip + 0x36681e] ; 0x100aa50c0
0x10073e8a2: jmp 0x10073e8c6 ; 0x10073e8c6
0x10073e8a4: vmulps xmm2, xmm2, xmm2
0x10073e8a8: vpermilpd xmm3, xmm2, 1
0x10073e8ae: vmovshdup xmm4, xmm2
0x10073e8b2: vaddss xmm2, xmm2, xmm4
0x10073e8b6: vaddss xmm2, xmm3, xmm2
0x10073e8ba: vsqrtss xmm2, xmm2, xmm2
0x10073e8be: vsubss xmm0, xmm2, xmm0
0x10073e8c2: vdivss xmm0, xmm0, xmm1
0x10073e8c6: vxorps xmm3, xmm3, xmm3
0x10073e8ca: cmp byte ptr [r13 + 0x1b4], 0
0x10073e8d2: vmovss dword ptr [rbp - 0x120], xmm5
0x10073e8da: jne 0x10073e8ff
0x10073e8dc: mov rax, qword ptr [r15 + 0x270]
0x10073e8e3: vmovss xmm1, dword ptr [rax + 0xac90]
0x10073e8eb: vxorps xmm2, xmm2, xmm2
0x10073e8ef: vucomiss xmm1, xmm2
0x10073e8f3: jne 0x10073e9dc
0x10073e8f9: jp 0x10073e9dc
0x10073e8ff: vxorps xmm0, xmm0, xmm0
0x10073e903: vmovss dword ptr [rbp - 0x118], xmm0
0x10073e90b: vmovaps xmm0, xmmword ptr [rbp - 0x110]
0x10073e913: vmulss xmm0, xmm0, dword ptr [rip + 0x36bb71] ; 0x100aaa48c
0x10073e91b: call 0x100aa2708 ; 0x100aa2708 _expf
0x10073e920: vmovss xmm6, dword ptr [rip + 0x366798] ; 0x100aa50c0
0x10073e928: vsubss xmm0, xmm6, xmm0
0x10073e92c: lea rdx, [r14 + 0x388]
0x10073e933: vmovss xmm1, dword ptr [rbp - 0x118]
0x10073e93b: vmulss xmm1, xmm1, dword ptr [rbp - 0xd0]
0x10073e943: vmovss xmm2, dword ptr [r14 + 0x388]
0x10073e94c: vinsertps xmm1, xmm2, xmm1, 0x10
0x10073e952: vaddps xmm2, xmm1, xmmword ptr [rip + 0x36bf96] ; 0x100aaa8f0
0x10073e95a: vmovaps xmm3, xmmword ptr [rip + 0x36bf9e] ; 0x100aaa900
0x10073e962: vdivps xmm2, xmm2, xmm3
0x10073e966: vroundps xmm2, xmm2, 9
0x10073e96c: vmulps xmm2, xmm2, xmm3
0x10073e970: vsubps xmm1, xmm1, xmm2
0x10073e974: vmovshdup xmm2, xmm1
0x10073e978: vxorps xmm3, xmm3, xmm3
0x10073e97c: vcmpltps xmm4, xmm3, xmm1
0x10073e981: vpmovsxdq xmm4, xmm4
0x10073e986: vmovdqa xmm5, xmmword ptr [rip + 0x36bf82] ; 0x100aaa910
0x10073e98e: vpand xmm4, xmm4, xmm5
0x10073e992: vcmpltps xmm3, xmm1, xmm3
0x10073e997: vpmovsxdq xmm3, xmm3
0x10073e99c: vpand xmm3, xmm3, xmm5
0x10073e9a0: vpsubq xmm3, xmm4, xmm3
0x10073e9a4: vmovd eax, xmm3
0x10073e9a8: vpextrd ecx, xmm3, 2
0x10073e9ae: cmp eax, ecx
0x10073e9b0: je 0x10073ea13
0x10073e9b2: vsubss xmm3, xmm1, xmm2
0x10073e9b6: vandps xmm3, xmm3, xmmword ptr [rip + 0x368f52] ; 0x100aa7910
0x10073e9be: vucomiss xmm3, dword ptr [rip + 0x369c3a] ; 0x100aa8600
0x10073e9c6: jbe 0x10073ea13
0x10073e9c8: cmp eax, 1
0x10073e9cb: je 0x10073ea0b
0x10073e9cd: cmp eax, -1
0x10073e9d0: jne 0x10073ea13
0x10073e9d2: vaddss xmm2, xmm2, dword ptr [rip + 0x369fe2] ; 0x100aa89bc
0x10073e9da: jmp 0x10073ea13 ; 0x10073ea13
0x10073e9dc: vmaxss xmm0, xmm3, xmm0
0x10073e9e0: vmovss xmm1, dword ptr [rip + 0x3666d8] ; 0x100aa50c0
0x10073e9e8: vminss xmm0, xmm1, xmm0
0x10073e9ec: vmulss xmm0, xmm5, xmm0
0x10073e9f0: jmp 0x10073e903 ; 0x10073e903
0x10073e9f5: cmp byte ptr [r13 + 0xbb0], 0
0x10073e9fd: sete al
0x10073ea00: mov dword ptr [rbp - 0xb4], eax
0x10073ea06: jmp 0x10073e660 ; 0x10073e660
0x10073ea0b: vaddss xmm2, xmm2, dword ptr [rip + 0x369fa5] ; 0x100aa89b8
0x10073ea13: vsubss xmm3, xmm6, xmm0
0x10073ea17: vmulss xmm1, xmm3, xmm1
0x10073ea1b: vmulss xmm0, xmm0, xmm2
0x10073ea1f: vaddss xmm0, xmm1, xmm0
0x10073ea23: vmovss dword ptr [rdx], xmm0
0x10073ea27: cmp byte ptr [rip + 0x5d0e42], 0 ; 0x100d0f870
0x10073ea2e: je 0x10073ea5b
0x10073ea30: test bl, bl
0x10073ea32: je 0x10073ec52
0x10073ea38: vmovss xmm1, dword ptr [rip + 0x369c2c] ; 0x100aa866c
0x10073ea40: vmovaps xmm0, xmmword ptr [rbp - 0x110]
0x10073ea48: cmp byte ptr [r14 + 0x11c], 0
0x10073ea50: jne 0x10073ec98
0x10073ea56: jmp 0x10073eca0 ; 0x10073eca0
0x10073ea5b: mov dword ptr [r14 + 0x184], 0x41200000
0x10073ea66: vmovaps xmm5, xmmword ptr [rbp - 0xf0]
0x10073ea6e: cmp byte ptr [r14 + 0x1f0], 0
0x10073ea76: mov qword ptr [rbp - 0x280], rdx
0x10073ea7d: jne 0x10073ed2c
0x10073ea83: vmovss xmm0, dword ptr [r13 + 0x2dc]
0x10073ea8c: vmaxss xmm7, xmm0, dword ptr [r13 + 0xb48]
0x10073ea95: vmovss xmm6, dword ptr [rip + 0x366623] ; 0x100aa50c0
0x10073ea9d: vucomiss xmm6, xmm7
0x10073eaa1: jbe 0x10073eb31
0x10073eaa7: vmovaps xmmword ptr [rbp - 0xd0], xmm7
0x10073eaaf: mov byte ptr [rbp - 0x218], 1
0x10073eab6: vxorps xmm0, xmm0, xmm0
0x10073eaba: vmovups xmmword ptr [rbp - 0x210], xmm0
0x10073eac2: movabs rax, 0xffffff8f00000001
0x10073eacc: mov qword ptr [rbp - 0x220], rax
0x10073ead3: mov rsi, qword ptr [r12 + 0x18]
0x10073ead8: add rsi, 0x10
0x10073eadc: mov rdi, qword ptr [r15 + 0x138]
0x10073eae3: lea rdx, [rbp - 0x1d0]
0x10073eaea: vmovss xmm0, dword ptr [rip + 0x368d02] ; 0x100aa77f4
0x10073eaf2: lea rcx, [rbp - 0x220]
0x10073eaf9: lea r8, [rbp - 0xb0]
0x10073eb00: call 0x100777cf0 ; 0x100777cf0
0x10073eb05: test al, al
0x10073eb07: je 0x10073eb19
0x10073eb09: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x10073eb11: vmovaps xmmword ptr [rbp - 0x1d0], xmm0
0x10073eb19: vmovaps xmm5, xmmword ptr [rbp - 0xf0]
0x10073eb21: vmovss xmm6, dword ptr [rip + 0x366597] ; 0x100aa50c0
0x10073eb29: vmovaps xmm7, xmmword ptr [rbp - 0xd0]
0x10073eb31: mov rax, qword ptr [rbp - 0xf8]
0x10073eb38: vmovss xmm0, dword ptr [rax + 0x34]
0x10073eb3d: vmulss xmm1, xmm0, dword ptr [rip + 0x365a73] ; 0x100aa45b8
0x10073eb45: vmovss xmm2, dword ptr [rbp - 0x1cc]
0x10073eb4d: vmovshdup xmm3, xmmword ptr [rbp - 0x140]
0x10073eb55: vsubss xmm2, xmm2, xmm3
0x10073eb59: vminss xmm2, xmm0, xmm2
0x10073eb5d: vmovshdup xmm4, xmm5
0x10073eb61: vsubss xmm3, xmm3, xmm4
0x10073eb65: vaddss xmm2, xmm2, xmm3
0x10073eb69: vmaxss xmm1, xmm1, xmm2
0x10073eb6d: vpermilps xmm1, xmm1, 0xc0
0x10073eb73: vmovddup xmm2, qword ptr [rip + 0x368d5d] ; 0x100aa78d8
0x10073eb7b: vmulps xmm1, xmm1, xmm2
0x10073eb7f: vpermilps xmm0, xmm0, 0
0x10073eb85: vmulps xmm0, xmm0, xmm2
0x10073eb89: vmulps xmm0, xmm0, xmmword ptr [rip + 0x36cbff] ; 0x100aab790
0x10073eb91: vsubss xmm2, xmm6, xmm7
0x10073eb95: vpermilps xmm2, xmm2, 0xc0
0x10073eb9b: vmulps xmm1, xmm2, xmm1
0x10073eb9f: vpermilps xmm2, xmm7, 0xc0
0x10073eba5: vmulps xmm0, xmm2, xmm0
0x10073eba9: vaddps xmm0, xmm0, xmm1
0x10073ebad: vmovss xmm1, dword ptr [r14 + 0x3a0]
0x10073ebb6: vpermilps xmm2, xmm1, 0
0x10073ebbc: vmulps xmm2, xmm5, xmm2
0x10073ebc0: vmovaps xmm3, xmmword ptr [r14 + 0x270]
0x10073ebc9: vmovaps xmm4, xmmword ptr [r14 + 0x390]
0x10073ebd2: vsubps xmm2, xmm4, xmm2
0x10073ebd6: vaddps xmm0, xmm2, xmm0
0x10073ebda: vaddss xmm1, xmm1, xmm6
0x10073ebde: vpermilps xmm1, xmm1, 0xc0
0x10073ebe4: vdivps xmm0, xmm0, xmm1
0x10073ebe8: vmovaps xmm4, xmmword ptr [rbp - 0x110]
0x10073ebf0: vmulss xmm1, xmm4, dword ptr [rip + 0x3690bc] ; 0x100aa7cb4
0x10073ebf8: vaddss xmm1, xmm1, xmm6
0x10073ebfc: vmulss xmm2, xmm4, dword ptr [rip + 0x368cbc] ; 0x100aa78c0
0x10073ec04: vsubps xmm0, xmm0, xmm3
0x10073ec08: vpermilps xmm2, xmm2, 0xc0
0x10073ec0e: vmulps xmm0, xmm2, xmm0
0x10073ec12: vaddps xmm0, xmm0, xmmword ptr [r14 + 0x280]
0x10073ec1b: vmulss xmm1, xmm1, xmm1
0x10073ec1f: vpermilps xmm1, xmm1, 0xc0
0x10073ec25: vdivps xmm0, xmm0, xmm1
0x10073ec29: vmovaps xmmword ptr [r14 + 0x280], xmm0
0x10073ec32: vpermilps xmm1, xmm4, 0xc0
0x10073ec38: vmulps xmm0, xmm1, xmm0
0x10073ec3c: vaddps xmm0, xmm3, xmm0
0x10073ec40: vmovaps xmmword ptr [r14 + 0x270], xmm0
0x10073ec49: vaddps xmm0, xmm5, xmm0
0x10073ec4d: jmp 0x10073ed35 ; 0x10073ed35
0x10073ec52: vmovss xmm0, dword ptr [rbp - 0x120]
0x10073ec5a: vmulss xmm0, xmm0, dword ptr [rip + 0x36cbde] ; 0x100aab840
0x10073ec62: vxorps xmm1, xmm1, xmm1
0x10073ec66: vmaxss xmm0, xmm1, xmm0
0x10073ec6a: vminss xmm0, xmm6, xmm0
0x10073ec6e: vsubss xmm1, xmm6, xmm0
0x10073ec72: vmulss xmm1, xmm1, dword ptr [rip + 0x368b76] ; 0x100aa77f0
0x10073ec7a: vmulss xmm0, xmm0, dword ptr [rip + 0x367e22] ; 0x100aa6aa4
0x10073ec82: vaddss xmm1, xmm0, xmm1
0x10073ec86: vmovaps xmm0, xmmword ptr [rbp - 0x110]
0x10073ec8e: cmp byte ptr [r14 + 0x11c], 0
0x10073ec96: je 0x10073eca0
0x10073ec98: vmovss xmm1, dword ptr [rip + 0x36a528] ; 0x100aa91c8
0x10073eca0: vmovss xmm2, dword ptr [r14 + 0x184]
0x10073eca9: vucomiss xmm1, xmm2
0x10073ecad: ja 0x10073ed06
0x10073ecaf: vmulss xmm0, xmm0, dword ptr [rip + 0x39b5c5] ; 0x100ada27c
0x10073ecb7: mov rbx, rdx
0x10073ecba: vmovss dword ptr [rbp - 0xd0], xmm1
0x10073ecc2: vmovss dword ptr [rbp - 0x118], xmm2
0x10073ecca: call 0x100aa2708 ; 0x100aa2708 _expf
0x10073eccf: vmovss xmm1, dword ptr [rip + 0x3663e9] ; 0x100aa50c0
0x10073ecd7: vmovaps xmm2, xmm1
0x10073ecdb: mov rdx, rbx
0x10073ecde: vsubss xmm0, xmm2, xmm0
0x10073ece2: vxorps xmm1, xmm1, xmm1
0x10073ece6: vmaxss xmm0, xmm1, xmm0
0x10073ecea: vminss xmm0, xmm2, xmm0
0x10073ecee: vsubss xmm1, xmm2, xmm0
0x10073ecf2: vmulss xmm1, xmm1, dword ptr [rbp - 0x118]
0x10073ecfa: vmulss xmm0, xmm0, dword ptr [rbp - 0xd0]
0x10073ed02: vaddss xmm1, xmm0, xmm1
0x10073ed06: vmovaps xmm5, xmmword ptr [rbp - 0xf0]
0x10073ed0e: vmovss dword ptr [r14 + 0x184], xmm1
0x10073ed17: cmp byte ptr [r14 + 0x1f0], 0
0x10073ed1f: mov qword ptr [rbp - 0x280], rdx
0x10073ed26: je 0x10073ea83
0x10073ed2c: vmovaps xmm0, xmmword ptr [r14 + 0x1e0]
0x10073ed35: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x10073ed3d: vmovaps xmm0, xmmword ptr [r13 + 0xb60]
0x10073ed46: vmovaps xmmword ptr [rbp - 0x220], xmm0
0x10073ed4e: vmovaps xmm0, xmmword ptr [r13 + 0xb70]
0x10073ed57: vmovaps xmmword ptr [rbp - 0x210], xmm0
0x10073ed5f: vmovaps xmm0, xmmword ptr [r13 + 0xb80]
0x10073ed68: vmovaps xmmword ptr [rbp - 0x200], xmm0
0x10073ed70: vmovaps xmm0, xmmword ptr [r13 + 0xb90]
0x10073ed79: vmovaps xmmword ptr [rbp - 0x1f0], xmm0
0x10073ed81: lea rdi, [rbp - 0xb0]
0x10073ed88: lea rsi, [rbp - 0x220]
0x10073ed8f: call 0x100076940 ; 0x100076940
0x10073ed94: vmovaps xmm0, xmmword ptr [r14 + 0x260]
0x10073ed9d: vpermilps xmm1, xmm0, 0
0x10073eda3: vmulps xmm1, xmm1, xmmword ptr [rbp - 0xb0]
0x10073edab: vpermilps xmm2, xmm0, 0x55
0x10073edb1: vmulps xmm2, xmm2, xmmword ptr [rbp - 0xa0]
0x10073edb9: vaddps xmm1, xmm1, xmm2
0x10073edbd: vpermilps xmm2, xmm0, 0xaa
0x10073edc3: vmulps xmm2, xmm2, xmmword ptr [rbp - 0x90]
0x10073edcb: vaddps xmm1, xmm1, xmm2
0x10073edcf: vaddps xmm1, xmm1, xmmword ptr [rbp - 0x80]
0x10073edd4: vsubps xmm1, xmm0, xmm1
0x10073edd8: vaddps xmm2, xmm0, xmm1
0x10073eddc: vmovaps xmmword ptr [r14 + 0x260], xmm2
0x10073ede5: cmp byte ptr [rip + 0x5d0a84], 0 ; 0x100d0f870
0x10073edec: je 0x10073ee6c
0x10073edee: cmp byte ptr [r13 + 0xb52], 0
0x10073edf6: vmovaps xmmword ptr [rbp - 0xf0], xmm2
0x10073edfe: jne 0x10073ee21
0x10073ee00: cmp byte ptr [r13 + 0xbc1], 0
0x10073ee08: jne 0x10073ee21
0x10073ee0a: vmovss xmm0, dword ptr [r13 + 0xb48]
0x10073ee13: vxorps xmm1, xmm1, xmm1
0x10073ee17: vucomiss xmm0, xmm1
0x10073ee1b: jbe 0x10073f284
0x10073ee21: vmovss xmm0, dword ptr [rip + 0x36a847] ; 0x100aa9670
0x10073ee29: cmp byte ptr [r14 + 0x1f0], 0
0x10073ee31: vmovss xmm4, dword ptr [rip + 0x366287] ; 0x100aa50c0
0x10073ee39: je 0x10073ee43
0x10073ee3b: vmovss xmm0, dword ptr [rip + 0x369859] ; 0x100aa869c
0x10073ee43: vmovaps xmm1, xmmword ptr [rbp - 0x110]
0x10073ee4b: vmulss xmm1, xmm1, dword ptr [rip + 0x375ab5] ; 0x100ab4908
0x10073ee53: vmovss xmm2, dword ptr [r14 + 0x2cc]
0x10073ee5c: vsubss xmm3, xmm0, xmm1
0x10073ee60: vucomiss xmm3, xmm2
0x10073ee64: jbe 0x10073ee79
0x10073ee66: vaddss xmm0, xmm1, xmm2
0x10073ee6a: jmp 0x10073ee87 ; 0x10073ee87
0x10073ee6c: vmovaps xmm0, xmmword ptr [rbp - 0xd0]
0x10073ee74: jmp 0x10073ef06 ; 0x10073ef06
0x10073ee79: vaddss xmm3, xmm1, xmm0
0x10073ee7d: vucomiss xmm2, xmm3
0x10073ee81: jbe 0x10073ee87
0x10073ee83: vsubss xmm0, xmm2, xmm1
0x10073ee87: vmovss dword ptr [r14 + 0x2cc], xmm0
0x10073ee90: vdivss xmm0, xmm0, dword ptr [rip + 0x368e20] ; 0x100aa7cb8
0x10073ee98: vxorps xmm1, xmm1, xmm1
0x10073ee9c: vmaxss xmm0, xmm1, xmm0
0x10073eea0: vminss xmm0, xmm4, xmm0
0x10073eea4: vsubss xmm0, xmm4, xmm0
0x10073eea8: call 0x100aa2858 ; 0x100aa2858 _logf
0x10073eead: vcvtss2sd xmm0, xmm0, xmm0
0x10073eeb1: vdivsd xmm0, xmm0, qword ptr [rip + 0x369807] ; 0x100aa86c0
0x10073eeb9: vcvtsd2ss xmm0, xmm0, xmm0
0x10073eebd: vmulss xmm0, xmm0, dword ptr [rbp - 0x110]
0x10073eec5: call 0x100aa2708 ; 0x100aa2708 _expf
0x10073eeca: vmovss xmm2, dword ptr [rip + 0x3661ee] ; 0x100aa50c0
0x10073eed2: vsubss xmm0, xmm2, xmm0
0x10073eed6: vxorps xmm1, xmm1, xmm1
0x10073eeda: vmaxss xmm0, xmm1, xmm0
0x10073eede: vminss xmm0, xmm2, xmm0
0x10073eee2: vsubss xmm1, xmm2, xmm0
0x10073eee6: vpermilps xmm1, xmm1, 0xc0
0x10073eeec: vmulps xmm1, xmm1, xmmword ptr [rbp - 0xf0]
0x10073eef4: vpermilps xmm0, xmm0, 0xc0
0x10073eefa: vmulps xmm0, xmm0, xmmword ptr [rbp - 0xd0]
0x10073ef02: vaddps xmm0, xmm0, xmm1
0x10073ef06: lea rbx, [r14 + 0x114]
0x10073ef0d: lea rax, [r14 + 0x1fc]
0x10073ef14: mov qword ptr [rbp - 0x150], rax
0x10073ef1b: vmovaps xmmword ptr [r14 + 0x260], xmm0
0x10073ef24: vmovss xmm0, dword ptr [r14 + 0x1f8]
0x10073ef2d: vxorps xmm1, xmm1, xmm1
0x10073ef31: vucomiss xmm0, xmm1
0x10073ef35: jbe 0x10073f04e
0x10073ef3b: mov al, byte ptr [rbx]
0x10073ef3d: test al, al
0x10073ef3f: setne cl
0x10073ef42: or cl, byte ptr [rbp - 0xb4]
0x10073ef48: cmp cl, 1
0x10073ef4b: jne 0x10073ef7f
0x10073ef4d: test al, al
0x10073ef4f: sete al
0x10073ef52: vmovss xmm1, dword ptr [rbp - 0xdc]
0x10073ef5a: vucomiss xmm1, dword ptr [rip + 0x36615e] ; 0x100aa50c0
0x10073ef62: setnp cl
0x10073ef65: sete dl
0x10073ef68: and dl, cl
0x10073ef6a: test dl, al
0x10073ef6c: jne 0x10073ef7f
0x10073ef6e: mov rax, qword ptr [rbp - 0x150]
0x10073ef75: mov al, byte ptr [rax]
0x10073ef77: test al, al
0x10073ef79: je 0x10073f04e
0x10073ef7f: vmovss xmm1, dword ptr [r14 + 0x1f4]
0x10073ef88: vmovss xmm4, dword ptr [r14 + 0x2d4]
0x10073ef91: vmovss dword ptr [rbp - 0xf0], xmm4
0x10073ef99: vsubss xmm1, xmm1, xmm4
0x10073ef9d: vaddss xmm2, xmm1, dword ptr [rip + 0x36965b] ; 0x100aa8600
0x10073efa5: vmovss xmm3, dword ptr [rip + 0x369a0b] ; 0x100aa89b8
0x10073efad: vdivss xmm2, xmm2, xmm3
0x10073efb1: vroundss xmm2, xmm2, xmm2, 9
0x10073efb7: vmulss xmm2, xmm2, xmm3
0x10073efbb: vsubss xmm1, xmm1, xmm2
0x10073efbf: vmulss xmm0, xmm0, dword ptr [rbp - 0x100]
0x10073efc7: vaddss xmm1, xmm4, xmm1
0x10073efcb: vmovss dword ptr [rbp - 0xd0], xmm1
0x10073efd3: vdivss xmm0, xmm0, dword ptr [rip + 0x368cdd] ; 0x100aa7cb8
0x10073efdb: vxorps xmm1, xmm1, xmm1
0x10073efdf: vmaxss xmm0, xmm1, xmm0
0x10073efe3: vmovss xmm1, dword ptr [rip + 0x3660d5] ; 0x100aa50c0
0x10073efeb: vminss xmm0, xmm1, xmm0
0x10073efef: vsubss xmm0, xmm1, xmm0
0x10073eff3: call 0x100aa2858 ; 0x100aa2858 _logf
0x10073eff8: vcvtss2sd xmm0, xmm0, xmm0
0x10073effc: vdivsd xmm0, xmm0, qword ptr [rip + 0x3696bc] ; 0x100aa86c0
0x10073f004: vcvtsd2ss xmm0, xmm0, xmm0
0x10073f008: vmulss xmm0, xmm0, dword ptr [rbp - 0x110]
0x10073f010: call 0x100aa2708 ; 0x100aa2708 _expf
0x10073f015: vmovss xmm2, dword ptr [rip + 0x3660a3] ; 0x100aa50c0
0x10073f01d: vsubss xmm0, xmm2, xmm0
0x10073f021: vxorps xmm1, xmm1, xmm1
0x10073f025: vmaxss xmm0, xmm1, xmm0
0x10073f029: vminss xmm0, xmm2, xmm0
0x10073f02d: vsubss xmm1, xmm2, xmm0
0x10073f031: vmulss xmm1, xmm1, dword ptr [rbp - 0xf0]
0x10073f039: vmulss xmm0, xmm0, dword ptr [rbp - 0xd0]
0x10073f041: vaddss xmm0, xmm0, xmm1
0x10073f045: vmovss dword ptr [r14 + 0x2d4], xmm0
0x10073f04e: mov rdi, qword ptr [r15 + 0x58]
0x10073f052: mov rax, qword ptr [rdi]
0x10073f055: call qword ptr [rax + 0x30]
0x10073f058: test al, al
0x10073f05a: je 0x10073f083
0x10073f05c: vmovss xmm0, dword ptr [rip + 0x39b21c] ; 0x100ada280
0x10073f064: vminss xmm0, xmm0, dword ptr [r14 + 0x2d8]
0x10073f06d: vmovss dword ptr [r14 + 0x2d8], xmm0
0x10073f076: vmovss xmm9, dword ptr [rip + 0x366042] ; 0x100aa50c0
0x10073f07e: jmp 0x10073f17b ; 0x10073f17b
0x10073f083: vmovss xmm0, dword ptr [r14 + 0x204]
0x10073f08c: vxorps xmm1, xmm1, xmm1
0x10073f090: vucomiss xmm0, xmm1
0x10073f094: vmovss xmm9, dword ptr [rip + 0x366024] ; 0x100aa50c0
0x10073f09c: jbe 0x10073f17b
0x10073f0a2: cmp byte ptr [rbx], 0
0x10073f0a5: setne al
0x10073f0a8: or al, byte ptr [rbp - 0xb4]
0x10073f0ae: cmp al, 1
0x10073f0b0: jne 0x10073f0d5
0x10073f0b2: vmovss xmm1, dword ptr [rbp - 0xdc]
0x10073f0ba: vucomiss xmm1, dword ptr [rip + 0x365ffe] ; 0x100aa50c0
0x10073f0c2: jne 0x10073f0c6
0x10073f0c4: jnp 0x10073f0d5
0x10073f0c6: mov al, byte ptr [r14 + 0x208]
0x10073f0cd: test al, al
0x10073f0cf: je 0x10073f17b
0x10073f0d5: vmovss xmm1, dword ptr [r14 + 0x2c0]
0x10073f0de: vdivss xmm1, xmm1, dword ptr [rip + 0x36957a] ; 0x100aa8660
0x10073f0e6: vaddss xmm1, xmm1, dword ptr [r14 + 0x200]
0x10073f0ef: vmovss dword ptr [rbp - 0xd0], xmm1
0x10073f0f7: vmulss xmm0, xmm0, dword ptr [rip + 0x3654b9] ; 0x100aa45b8
0x10073f0ff: vmulss xmm0, xmm0, dword ptr [rbp - 0x100]
0x10073f107: vdivss xmm0, xmm0, dword ptr [rip + 0x368ba9] ; 0x100aa7cb8
0x10073f10f: vxorps xmm1, xmm1, xmm1
0x10073f113: vmaxss xmm0, xmm1, xmm0
0x10073f117: vminss xmm0, xmm9, xmm0
0x10073f11b: vsubss xmm0, xmm9, xmm0
0x10073f11f: call 0x100aa2858 ; 0x100aa2858 _logf
0x10073f124: vcvtss2sd xmm0, xmm0, xmm0
0x10073f128: vdivsd xmm0, xmm0, qword ptr [rip + 0x369590] ; 0x100aa86c0
0x10073f130: vcvtsd2ss xmm0, xmm0, xmm0
0x10073f134: vmulss xmm0, xmm0, dword ptr [rbp - 0x110]
0x10073f13c: call 0x100aa2708 ; 0x100aa2708 _expf
0x10073f141: vmovss xmm9, dword ptr [rip + 0x365f77] ; 0x100aa50c0
0x10073f149: vsubss xmm0, xmm9, xmm0
0x10073f14d: vxorps xmm1, xmm1, xmm1
0x10073f151: vmaxss xmm0, xmm1, xmm0
0x10073f155: vminss xmm0, xmm9, xmm0
0x10073f159: vsubss xmm1, xmm9, xmm0
0x10073f15d: vmulss xmm1, xmm1, dword ptr [r14 + 0x2d8]
0x10073f166: vmulss xmm0, xmm0, dword ptr [rbp - 0xd0]
0x10073f16e: vaddss xmm0, xmm0, xmm1
0x10073f172: vmovss dword ptr [r14 + 0x2d8], xmm0
0x10073f17b: lea rax, [r14 + 0x11c]
0x10073f182: mov qword ptr [rbp - 0x1d8], rax
0x10073f189: cmp byte ptr [r14 + 0x11c], 0
0x10073f191: je 0x10073f362
0x10073f197: mov rdi, qword ptr [r15 + 0x280]
0x10073f19e: mov eax, dword ptr [r14 + 0x130]
0x10073f1a5: mov dword ptr [rbp - 0xb0], eax
0x10073f1ab: lea rsi, [rbp - 0xb0]
0x10073f1b2: call 0x100101e20 ; 0x100101e20
0x10073f1b7: test rax, rax
0x10073f1ba: je 0x10073f1cc
0x10073f1bc: add rax, 8
0x10073f1c0: lea rdi, [rbp - 0xb0]
0x10073f1c7: mov rsi, rax
0x10073f1ca: jmp 0x10073f1df ; 0x10073f1df
0x10073f1cc: mov rsi, qword ptr [r14 + 0x128]
0x10073f1d3: test rsi, rsi
0x10073f1d6: je 0x10073f1f2
0x10073f1d8: lea rdi, [rbp - 0xb0]
0x10073f1df: call 0x1004d1e40 ; 0x1004d1e40
0x10073f1e4: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x10073f1e9: vmovaps xmmword ptr [r14 + 0x140], xmm0
0x10073f1f2: cmp byte ptr [r14 + 0x208], 0
0x10073f1fa: vmovss xmm9, dword ptr [rip + 0x365ebe] ; 0x100aa50c0
0x10073f202: jne 0x10073f362
0x10073f208: mov rax, qword ptr [rbp - 0x150]
0x10073f20f: cmp byte ptr [rax], 0
0x10073f212: jne 0x10073f362
0x10073f218: mov rsi, qword ptr [r15 + 0x70]
0x10073f21c: lea rdi, [rbp - 0xb0]
0x10073f223: call 0x10076be90 ; 0x10076be90
0x10073f228: vmovaps xmm0, xmmword ptr [r14 + 0x140]
0x10073f231: vsubps xmm0, xmm0, xmmword ptr [rbp - 0xb0]
0x10073f239: vmulps xmm2, xmm0, xmm0
0x10073f23d: vmovshdup xmm1, xmm2
0x10073f241: vaddss xmm1, xmm2, xmm1
0x10073f245: vpermilpd xmm2, xmm2, 1
0x10073f24b: vaddss xmm1, xmm2, xmm1
0x10073f24f: vsqrtss xmm2, xmm1, xmm1
0x10073f253: vucomiss xmm2, dword ptr [rip + 0x368669] ; 0x100aa78c4
0x10073f25b: jbe 0x10073f267
0x10073f25d: vpermilps xmm1, xmm2, 0xc0
0x10073f263: vdivps xmm0, xmm0, xmm1
0x10073f267: vmovss xmm1, dword ptr [rip + 0x36783d] ; 0x100aa6aac
0x10073f26f: vucomiss xmm1, xmm2
0x10073f273: jbe 0x10073f2a7
0x10073f275: mov rax, qword ptr [rbp - 0x1d8]
0x10073f27c: mov byte ptr [rax], 0
0x10073f27f: jmp 0x10073f35a ; 0x10073f35a
0x10073f284: vmovss xmm0, dword ptr [rip + 0x368a34] ; 0x100aa7cc0
0x10073f28c: cmp byte ptr [r14 + 0x1f0], 0
0x10073f294: vmovss xmm4, dword ptr [rip + 0x365e24] ; 0x100aa50c0
0x10073f29c: jne 0x10073ee3b
0x10073f2a2: jmp 0x10073ee43 ; 0x10073ee43
0x10073f2a7: vpermilpd xmm1, xmm0, 1
0x10073f2ad: vmovaps xmmword ptr [rbp - 0xf0], xmm0
0x10073f2b5: call 0x100aa25a0 ; 0x100aa25a0 _atan2f
0x10073f2ba: vmovss dword ptr [rbp - 0xd0], xmm0
0x10073f2c2: vmovaps xmm1, xmmword ptr [rbp - 0xf0]
0x10073f2ca: vmovshdup xmm0, xmm1
0x10073f2ce: vmulps xmm1, xmm1, xmm1
0x10073f2d2: vmovshdup xmm2, xmm1
0x10073f2d6: vaddss xmm2, xmm1, xmm2
0x10073f2da: vpermilpd xmm1, xmm1, 1
0x10073f2e0: vaddss xmm1, xmm1, xmm2
0x10073f2e4: vsqrtss xmm1, xmm1, xmm1
0x10073f2e8: vmovss xmm2, dword ptr [rip + 0x3677ac] ; 0x100aa6a9c
0x10073f2f0: vmovaps xmm3, xmm2
0x10073f2f4: vmaxss xmm2, xmm3, xmm1
0x10073f2f8: vcmpunordss xmm1, xmm1, xmm1
0x10073f2fd: vandnps xmm2, xmm1, xmm2
0x10073f301: vandps xmm1, xmm1, xmm3
0x10073f305: vorps xmm1, xmm2, xmm1
0x10073f309: vdivss xmm0, xmm0, xmm1
0x10073f30d: call 0x100aa2588 ; 0x100aa2588 _asinf
0x10073f312: vmovss xmm1, dword ptr [r14 + 0x2c0]
0x10073f31b: vdivss xmm2, xmm1, dword ptr [rip + 0x36f69d] ; 0x100aae9c0
0x10073f323: vaddss xmm0, xmm0, xmm2
0x10073f327: vmovss dword ptr [r14 + 0x2d8], xmm0
0x10073f330: vmulss xmm0, xmm1, dword ptr [rbp - 0x144]
0x10073f338: vmulss xmm0, xmm0, dword ptr [rip + 0x3692e0] ; 0x100aa8620
0x10073f340: vmulss xmm0, xmm0, dword ptr [r14 + 0x2d0]
0x10073f349: vaddss xmm0, xmm0, dword ptr [rbp - 0xd0]
0x10073f351: vmovss dword ptr [r14 + 0x2d4], xmm0
0x10073f35a: vmovss xmm9, dword ptr [rip + 0x365d5e] ; 0x100aa50c0
0x10073f362: vmovss xmm8, dword ptr [rbp - 0xdc]
0x10073f36a: vucomiss xmm8, xmm9
0x10073f36f: vmovss xmm1, dword ptr [r14 + 0x2d4]
0x10073f378: vmovss xmm2, dword ptr [r14 + 0x184]
0x10073f381: vmovss xmm0, dword ptr [r14 + 0x290]
0x10073f38a: vmulss xmm2, xmm2, dword ptr [rip + 0x36845a] ; 0x100aa77ec
0x10073f392: vmovss xmm3, dword ptr [r14 + 0x298]
0x10073f39b: vsubss xmm1, xmm1, xmm3
0x10073f39f: vmovss xmm4, dword ptr [rip + 0x369259] ; 0x100aa8600
0x10073f3a7: vaddss xmm5, xmm1, xmm4
0x10073f3ab: vmovss xmm6, dword ptr [rip + 0x369605] ; 0x100aa89b8
0x10073f3b3: vdivss xmm5, xmm5, xmm6
0x10073f3b7: vroundss xmm5, xmm5, xmm5, 9
0x10073f3bd: vmulss xmm5, xmm5, xmm6
0x10073f3c1: vsubss xmm1, xmm1, xmm5
0x10073f3c5: vaddss xmm1, xmm3, xmm1
0x10073f3c9: vmovaps xmm7, xmmword ptr [rbp - 0x110]
0x10073f3d1: vmulss xmm5, xmm7, xmm2
0x10073f3d5: vaddss xmm5, xmm5, xmm9
0x10073f3da: vmulss xmm2, xmm2, xmm2
0x10073f3de: vmulss xmm2, xmm7, xmm2
0x10073f3e2: vsubss xmm1, xmm1, xmm3
0x10073f3e6: vmulss xmm1, xmm2, xmm1
0x10073f3ea: vaddss xmm1, xmm1, dword ptr [r14 + 0x29c]
0x10073f3f3: vmulss xmm5, xmm5, xmm5
0x10073f3f7: vdivss xmm1, xmm1, xmm5
0x10073f3fb: vmovss dword ptr [r14 + 0x29c], xmm1
0x10073f404: vmulss xmm1, xmm7, xmm1
0x10073f408: vaddss xmm1, xmm3, xmm1
0x10073f40c: vaddss xmm3, xmm1, xmm4
0x10073f410: vdivss xmm3, xmm3, xmm6
0x10073f414: vroundss xmm3, xmm3, xmm3, 9
0x10073f41a: vmulss xmm3, xmm3, xmm6
0x10073f41e: vsubss xmm1, xmm1, xmm3
0x10073f422: vmovss dword ptr [r14 + 0x298], xmm1
0x10073f42b: vmovss xmm1, dword ptr [r14 + 0x2d8]
0x10073f434: vsubss xmm1, xmm1, xmm0
0x10073f438: vmulss xmm1, xmm2, xmm1
0x10073f43c: vaddss xmm1, xmm1, dword ptr [r14 + 0x294]
0x10073f445: vdivss xmm1, xmm1, xmm5
0x10073f449: vmovss dword ptr [r14 + 0x294], xmm1
0x10073f452: vmulss xmm1, xmm7, xmm1
0x10073f456: vaddss xmm0, xmm0, xmm1
0x10073f45a: vmovss dword ptr [r14 + 0x290], xmm0
0x10073f463: mov eax, dword ptr [rip + 0x5f29f7] ; 0x100d31e60
0x10073f469: mov edx, dword ptr [rip + 0x5f29ed] ; 0x100d31e5c
0x10073f46f: mov ecx, dword ptr [rip + 0x5f29ef] ; 0x100d31e64
0x10073f475: cmovne ecx, eax
0x10073f478: cmovp ecx, eax
0x10073f47b: cmovne eax, edx
0x10073f47e: cmovp eax, edx
0x10073f481: vmovaps xmm1, xmmword ptr [r13 + 0x50]
0x10073f487: vmulps xmm1, xmm1, xmm1
0x10073f48b: vmovshdup xmm2, xmm1
0x10073f48f: vaddss xmm2, xmm1, xmm2
0x10073f493: vpermilpd xmm1, xmm1, 1
0x10073f499: vaddss xmm1, xmm1, xmm2
0x10073f49d: vsqrtss xmm2, xmm1, xmm1
0x10073f4a1: lea rdx, [rip + 0x38231c] ; 0x100ac17c4
0x10073f4a8: vmovss xmm1, dword ptr [rdx]
0x10073f4ac: vucomiss xmm1, xmm2
0x10073f4b0: jbe 0x10073f4fb
0x10073f4b2: cmp byte ptr [r14 + 0x100], 0
0x10073f4ba: vmovss xmm8, dword ptr [r14 + 0x2e4]
0x10073f4c3: jne 0x10073f4d6
0x10073f4c5: vaddss xmm8, xmm8, dword ptr [rbp - 0x110]
0x10073f4cd: vmovss dword ptr [r14 + 0x2e4], xmm8
0x10073f4d6: vmovd xmm2, eax
0x10073f4da: vmovss xmm3, dword ptr [rip + 0x3682fa] ; 0x100aa77dc
0x10073f4e2: vcmpltss xmm3, xmm3, xmm8
0x10073f4e8: vmovss xmm4, dword ptr [rip + 0x5f2968] ; 0x100d31e58
0x10073f4f0: vblendvps xmm3, xmm2, xmm4, xmm3
0x10073f4f6: jmp 0x10073f598 ; 0x10073f598
0x10073f4fb: mov dword ptr [r14 + 0x2e4], 0
0x10073f506: vmovaps xmm2, xmmword ptr [r13 + 0x50]
0x10073f50c: lea rdx, [rip + 0x3822d1] ; 0x100ac17e4
0x10073f513: vmovss xmm3, dword ptr [rdx]
0x10073f517: vcmpeqss xmm4, xmm8, xmm9
0x10073f51d: vmovss xmm5, dword ptr [rip + 0x369147] ; 0x100aa866c
0x10073f525: vandps xmm5, xmm4, xmm5
0x10073f529: vandnps xmm3, xmm4, xmm3
0x10073f52d: vorps xmm3, xmm3, xmm5
0x10073f531: vsubss xmm3, xmm3, xmm1
0x10073f535: vucomiss xmm3, dword ptr [rip + 0x368387] ; 0x100aa78c4
0x10073f53d: ja 0x10073f551
0x10073f53f: vmovss xmm4, dword ptr [rip + 0x36a089] ; 0x100aa95d0
0x10073f547: vucomiss xmm4, xmm3
0x10073f54b: vmovaps xmm4, xmm9
0x10073f54f: jbe 0x10073f573
0x10073f551: vmulps xmm2, xmm2, xmm2
0x10073f555: vpermilpd xmm4, xmm2, 1
0x10073f55b: vmovshdup xmm5, xmm2
0x10073f55f: vaddss xmm2, xmm2, xmm5
0x10073f563: vaddss xmm2, xmm4, xmm2
0x10073f567: vsqrtss xmm2, xmm2, xmm2
0x10073f56b: vsubss xmm1, xmm2, xmm1
0x10073f56f: vdivss xmm4, xmm1, xmm3
0x10073f573: vxorps xmm8, xmm8, xmm8
0x10073f578: vmaxss xmm2, xmm8, xmm4
0x10073f57c: vminss xmm2, xmm9, xmm2
0x10073f580: vmovd xmm3, eax
0x10073f584: vsubss xmm4, xmm9, xmm2
0x10073f588: vmulss xmm3, xmm4, xmm3
0x10073f58c: vmovd xmm4, ecx
0x10073f590: vmulss xmm2, xmm2, xmm4
0x10073f594: vaddss xmm3, xmm2, xmm3
0x10073f598: vmovss dword ptr [r14 + 0x2e0], xmm3
0x10073f5a1: vxorps xmm2, xmm2, xmm2
0x10073f5a5: vmovss xmm4, dword ptr [rbp - 0x100]
0x10073f5ad: vucomiss xmm4, xmm2
0x10073f5b1: vmovss xmm4, dword ptr [rip + 0x368237] ; 0x100aa77f0
0x10073f5b9: jbe 0x10073f600
0x10073f5bb: vmovss xmm5, dword ptr [r14 + 0x210]
0x10073f5c4: vucomiss xmm5, xmm2
0x10073f5c8: jbe 0x10073f600
0x10073f5ca: vmovss xmm3, dword ptr [r14 + 0x20c]
0x10073f5d3: vmulss xmm3, xmm3, dword ptr [rip + 0x369025] ; 0x100aa8600
0x10073f5db: vdivss xmm3, xmm3, dword ptr [rip + 0x369021] ; 0x100aa8604
0x10073f5e3: vmovss xmm4, dword ptr [rip + 0x369bd9] ; 0x100aa91c4
0x10073f5eb: vcmpunordss xmm6, xmm5, xmm5
0x10073f5f0: vandps xmm7, xmm6, xmm4
0x10073f5f4: vmaxss xmm4, xmm4, xmm5
0x10073f5f8: vandnps xmm4, xmm6, xmm4
0x10073f5fc: vorps xmm4, xmm4, xmm7
0x10073f600: mov qword ptr [rbp - 0x1e0], rbx
0x10073f607: vmovss xmm5, dword ptr [rip + 0x378bf5] ; 0x100ab8204
0x10073f60f: vmaxss xmm3, xmm5, xmm3
0x10073f613: vmovss xmm5, dword ptr [rip + 0x378bed] ; 0x100ab8208
0x10073f61b: vminss xmm3, xmm5, xmm3
0x10073f61f: vmovaps xmm7, xmmword ptr [rbp - 0x110]
0x10073f627: vmulss xmm5, xmm7, xmm4
0x10073f62b: vmovss xmm1, dword ptr [rip + 0x365a8d] ; 0x100aa50c0
0x10073f633: vaddss xmm5, xmm5, xmm1
0x10073f637: vmulss xmm4, xmm4, xmm4
0x10073f63b: vmulss xmm4, xmm7, xmm4
0x10073f63f: vmovss xmm6, dword ptr [r14 + 0x2a8]
0x10073f648: vsubss xmm3, xmm3, xmm6
0x10073f64c: vmulss xmm3, xmm4, xmm3
0x10073f650: vaddss xmm3, xmm3, dword ptr [r14 + 0x2ac]
0x10073f659: vmulss xmm4, xmm5, xmm5
0x10073f65d: vdivss xmm3, xmm3, xmm4
0x10073f661: vmovss dword ptr [r14 + 0x2ac], xmm3
0x10073f66a: vmulss xmm3, xmm7, xmm3
0x10073f66e: vaddss xmm3, xmm6, xmm3
0x10073f672: vmovss dword ptr [r14 + 0x2a8], xmm3
0x10073f67b: vaddss xmm4, xmm0, dword ptr [rip + 0x37c18d] ; 0x100abb810
0x10073f683: vinsertps xmm0, xmm0, dword ptr [rip + 0x36adf3], 0x10 ; 0x100aaa480
0x10073f68d: vmovss xmm5, dword ptr [rip + 0x39abef] ; 0x100ada284
0x10073f695: vinsertps xmm4, xmm5, xmm4, 0x10
0x10073f69b: vaddps xmm5, xmm0, xmm4
0x10073f69f: vsubps xmm0, xmm0, xmm4
0x10073f6a3: vblendps xmm0, xmm5, xmm0, 2
0x10073f6a9: vdivps xmm0, xmm0, xmmword ptr [rip + 0x39ac5f] ; 0x100ada310
0x10073f6b1: vmovshdup xmm4, xmm0
0x10073f6b5: vcmpless xmm5, xmm4, xmm0
0x10073f6ba: vblendvps xmm0, xmm4, xmm0, xmm5
0x10073f6c0: vmaxss xmm0, xmm2, xmm0
0x10073f6c4: vminss xmm0, xmm1, xmm0
0x10073f6c8: vsubss xmm2, xmm1, xmm0
0x10073f6cc: vmulss xmm2, xmm2, xmm3
0x10073f6d0: vmulss xmm0, xmm0, dword ptr [rip + 0x5f2790] ; 0x100d31e68
0x10073f6d8: vaddss xmm0, xmm0, xmm2
0x10073f6dc: vmovss dword ptr [r14 + 0x2c0], xmm0
0x10073f6e5: vmovss xmm0, dword ptr [rbp - 0xdc]
0x10073f6ed: vucomiss xmm0, xmm1
0x10073f6f1: mov qword ptr [rbp - 0x120], r12
0x10073f6f8: mov qword ptr [rbp - 0x288], r14
0x10073f6ff: jne 0x10073f746
0x10073f701: jp 0x10073f746
0x10073f703: mov rsi, qword ptr [r12 + 0x50]
0x10073f708: lea rbx, [rbp - 0xb0]
0x10073f70f: mov rdi, rbx
0x10073f712: call 0x10035c9d0 ; 0x10035c9d0
0x10073f717: mov rdi, rbx
0x10073f71a: call 0x10035bac0 ; 0x10035bac0
0x10073f71f: test rax, rax
0x10073f722: je 0x10073f76c
0x10073f724: vmovss xmm0, dword ptr [rip + 0x368f08] ; 0x100aa8634
0x10073f72c: vmovaps xmmword ptr [rbp - 0x140], xmm0
0x10073f734: cmp byte ptr [rip + 0x5d0137], 0 ; 0x100d0f872
0x10073f73b: jne 0x10073f808
0x10073f741: jmp 0x10073f941 ; 0x10073f941
0x10073f746: xor eax, eax
0x10073f748: vucomiss xmm8, dword ptr [rip + 0x36808c] ; 0x100aa77dc
0x10073f750: seta al
0x10073f753: lea rcx, [rip + 0x39ab46] ; 0x100ada2a0
0x10073f75a: vmovss xmm0, dword ptr [rcx + rax*4]
0x10073f75f: vmovaps xmmword ptr [rbp - 0x140], xmm0
0x10073f767: jmp 0x10073f941 ; 0x10073f941
0x10073f76c: vmovaps xmm2, xmmword ptr [r13 + 0x50]
0x10073f772: lea rax, [rip + 0x382023] ; 0x100ac179c
0x10073f779: vmovss xmm0, dword ptr [rax]
0x10073f77d: vsubss xmm1, xmm0, dword ptr [rbp - 0x130]
0x10073f785: vucomiss xmm1, dword ptr [rip + 0x368137] ; 0x100aa78c4
0x10073f78d: vmovss xmm0, dword ptr [rip + 0x36592b] ; 0x100aa50c0
0x10073f795: ja 0x10073f7a9
0x10073f797: vmovss xmm3, dword ptr [rip + 0x369e31] ; 0x100aa95d0
0x10073f79f: vucomiss xmm3, xmm1
0x10073f7a3: vmovaps xmm3, xmm0
0x10073f7a7: jbe 0x10073f7cf
0x10073f7a9: vmulps xmm2, xmm2, xmm2
0x10073f7ad: vpermilpd xmm3, xmm2, 1
0x10073f7b3: vmovshdup xmm4, xmm2
0x10073f7b7: vaddss xmm2, xmm2, xmm4
0x10073f7bb: vaddss xmm2, xmm3, xmm2
0x10073f7bf: vsqrtss xmm2, xmm2, xmm2
0x10073f7c3: vsubss xmm2, xmm2, dword ptr [rbp - 0x130]
0x10073f7cb: vdivss xmm3, xmm2, xmm1
0x10073f7cf: vxorps xmm1, xmm1, xmm1
0x10073f7d3: vmaxss xmm1, xmm1, xmm3
0x10073f7d7: vminss xmm1, xmm0, xmm1
0x10073f7db: vsubss xmm0, xmm0, xmm1
0x10073f7df: vmulss xmm0, xmm0, dword ptr [rip + 0x368e4d] ; 0x100aa8634
0x10073f7e7: vmulss xmm1, xmm1, dword ptr [rip + 0x368ddd] ; 0x100aa85cc
0x10073f7ef: vaddss xmm0, xmm1, xmm0
0x10073f7f3: vmovaps xmmword ptr [rbp - 0x140], xmm0
0x10073f7fb: cmp byte ptr [rip + 0x5d0070], 0 ; 0x100d0f872
0x10073f802: je 0x10073f941
0x10073f808: mov rax, qword ptr [r12 + 0x98]
0x10073f810: vmovss xmm0, dword ptr [rax + 0x70]
0x10073f815: vmovss dword ptr [rbp - 0xd0], xmm0
0x10073f81d: mov rdi, qword ptr [r15 + 0x3b8]
0x10073f824: vmovaps xmm0, xmmword ptr [r13 + 0x50]
0x10073f82a: vmulps xmm0, xmm0, xmmword ptr [rip + 0x36878e] ; 0x100aa7fc0
0x10073f832: vaddps xmm0, xmm0, xmmword ptr [r13 + 0x10]
0x10073f838: vmovaps xmmword ptr [rbp - 0x220], xmm0
0x10073f840: xor r8d, r8d
0x10073f843: cmp qword ptr [r15 + 0x138], 0
0x10073f84b: setne r8b
0x10073f84f: lea rsi, [rbp - 0x220]
0x10073f856: lea rbx, [rbp - 0x1b0]
0x10073f85d: lea r12, [rbp - 0xb0]
0x10073f864: mov rdx, rbx
0x10073f867: mov rcx, r12
0x10073f86a: call 0x1002149c0 ; 0x1002149c0
0x10073f86f: vmovss xmm0, dword ptr [rbp - 0x1b0]
0x10073f877: vmovss xmm2, dword ptr [rbp - 0xd0]
0x10073f87f: vmaxss xmm1, xmm0, xmm2
0x10073f883: vcmpunordss xmm2, xmm2, xmm2
0x10073f888: vblendvps xmm0, xmm1, xmm0, xmm2
0x10073f88e: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x10073f896: mov rdi, qword ptr [r15 + 0x3b8]
0x10073f89d: vmovaps xmm0, xmmword ptr [r13 + 0x50]
0x10073f8a3: vmulps xmm0, xmm0, xmmword ptr [rip + 0x369195] ; 0x100aa8a40
0x10073f8ab: vaddps xmm0, xmm0, xmmword ptr [r13 + 0x10]
0x10073f8b1: vmovaps xmmword ptr [rbp - 0x220], xmm0
0x10073f8b9: xor r8d, r8d
0x10073f8bc: cmp qword ptr [r15 + 0x138], 0
0x10073f8c4: setne r8b
0x10073f8c8: lea rsi, [rbp - 0x220]
0x10073f8cf: mov rdx, rbx
0x10073f8d2: mov rcx, r12
0x10073f8d5: call 0x1002149c0 ; 0x1002149c0
0x10073f8da: vmovss xmm0, dword ptr [rbp - 0x1b0]
0x10073f8e2: vmovaps xmm2, xmmword ptr [rbp - 0xd0]
0x10073f8ea: vcmpunordss xmm1, xmm2, xmm2
0x10073f8ef: vmaxss xmm2, xmm0, xmm2
0x10073f8f3: vblendvps xmm0, xmm2, xmm0, xmm1
0x10073f8f9: vaddss xmm0, xmm0, dword ptr [rip + 0x367eef] ; 0x100aa77f0
0x10073f901: vdivss xmm0, xmm0, dword ptr [rip + 0x36719b] ; 0x100aa6aa4
0x10073f909: vxorps xmm1, xmm1, xmm1
0x10073f90d: vmaxss xmm0, xmm1, xmm0
0x10073f911: vmovss xmm1, dword ptr [rip + 0x3657a7] ; 0x100aa50c0
0x10073f919: vminss xmm0, xmm1, xmm0
0x10073f91d: vsubss xmm1, xmm1, xmm0
0x10073f921: vmulss xmm0, xmm0, dword ptr [rip + 0x364c8f] ; 0x100aa45b8
0x10073f929: vaddss xmm0, xmm0, xmm1
0x10073f92d: vmovaps xmm1, xmmword ptr [rbp - 0x140]
0x10073f935: vmulss xmm1, xmm1, xmm0
0x10073f939: vmovaps xmmword ptr [rbp - 0x140], xmm1
0x10073f941: mov qword ptr [rbp - 0x118], r15
0x10073f948: mov rdi, qword ptr [r15 + 0x280]
0x10073f94f: lea rbx, [rbp - 0xb0]
0x10073f956: xor edx, edx
0x10073f958: mov rsi, rbx
0x10073f95b: call 0x1001032a0 ; 0x1001032a0
0x10073f960: vxorps xmm0, xmm0, xmm0
0x10073f964: vmovaps xmmword ptr [rbp - 0xf0], xmm0
0x10073f96c: test eax, eax
0x10073f96e: mov qword ptr [rbp - 0x180], r13
0x10073f975: mov r12, qword ptr [rbp - 0xf8]
0x10073f97c: je 0x10073fc38
0x10073f982: mov r14d, eax
0x10073f985: lea r15, [rbp - 0x220]
0x10073f98c: vxorps xmm0, xmm0, xmm0
0x10073f990: vmovaps xmmword ptr [rbp - 0xf0], xmm0
0x10073f998: nop dword ptr [rax + rax]
0x10073f9a0: mov rdi, qword ptr [rbx]
0x10073f9a3: cmp byte ptr [rdi + 0x1ef8], 0
0x10073f9aa: je 0x10073f9c0
0x10073f9ac: add rbx, 8
0x10073f9b0: dec r14
0x10073f9b3: jne 0x10073f9a0
0x10073f9b5: jmp 0x10073fc38 ; 0x10073fc38
0x10073f9ba: nop word ptr [rax + rax]
0x10073f9c0: call 0x1000fe050 ; 0x1000fe050
0x10073f9c5: test al, al
0x10073f9c7: jne 0x10073f9d5
0x10073f9c9: mov rax, qword ptr [rbx]
0x10073f9cc: cmp byte ptr [rax + 0x21b3], 0
0x10073f9d3: je 0x10073f9ac
0x10073f9d5: mov rsi, qword ptr [r12 + 0x288]
0x10073f9dd: mov rdi, r15
0x10073f9e0: call 0x1007f26b0 ; 0x1007f26b0
0x10073f9e5: mov rsi, qword ptr [r12 + 0x298]
0x10073f9ed: lea r13, [rbp - 0x1b0]
0x10073f9f4: mov rdi, r13
0x10073f9f7: call 0x1007f26b0 ; 0x1007f26b0
0x10073f9fc: vmovaps xmm0, xmmword ptr [rbp - 0x220]
0x10073fa04: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x1b0]
0x10073fa0c: vmovaps xmm1, xmmword ptr [rip + 0x367c5c] ; 0x100aa7670
0x10073fa14: vmulps xmm0, xmm0, xmm1
0x10073fa18: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x10073fa20: mov rax, qword ptr [rbx]
0x10073fa23: mov rdi, r15
0x10073fa26: mov r15, qword ptr [rax + 0x20]
0x10073fa2a: mov rsi, qword ptr [r15 + 0x288]
0x10073fa31: mov r13, rdi
0x10073fa34: call 0x1007f26b0 ; 0x1007f26b0
0x10073fa39: mov rsi, qword ptr [r15 + 0x298]
0x10073fa40: lea r15, [rbp - 0x1b0]
0x10073fa47: mov rdi, r15
0x10073fa4a: call 0x1007f26b0 ; 0x1007f26b0
0x10073fa4f: vmovaps xmm0, xmmword ptr [rbp - 0x220]
0x10073fa57: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x1b0]
0x10073fa5f: vmulps xmm0, xmm0, xmmword ptr [rip + 0x367c09] ; 0x100aa7670
0x10073fa67: vmovaps xmm1, xmmword ptr [rbp - 0xd0]
0x10073fa6f: vsubps xmm0, xmm1, xmm0
0x10073fa73: vmulps xmm0, xmm0, xmm0
0x10073fa77: vmovshdup xmm1, xmm0
0x10073fa7b: vaddss xmm1, xmm0, xmm1
0x10073fa7f: vpermilpd xmm0, xmm0, 1
0x10073fa85: vaddss xmm0, xmm0, xmm1
0x10073fa89: vsqrtss xmm0, xmm0, xmm0
0x10073fa8d: vmovss xmm1, dword ptr [rip + 0x36562b] ; 0x100aa50c0
0x10073fa95: vmaxss xmm0, xmm1, xmm0
0x10073fa99: vmovss xmm2, dword ptr [rip + 0x367007] ; 0x100aa6aa8
0x10073faa1: vminss xmm0, xmm2, xmm0
0x10073faa5: vucomiss xmm2, xmm0
0x10073faa9: jbe 0x10073fc21
0x10073faaf: mov rsi, qword ptr [r12 + 0x288]
0x10073fab7: mov rdi, r13
0x10073faba: mov r13, r12
0x10073fabd: mov r12, rdi
0x10073fac0: vmovss dword ptr [rbp - 0xd0], xmm0
0x10073fac8: call 0x1007f26b0 ; 0x1007f26b0
0x10073facd: mov rsi, qword ptr [r13 + 0x298]
0x10073fad4: mov rdi, r15
0x10073fad7: call 0x1007f26b0 ; 0x1007f26b0
0x10073fadc: vmovaps xmm0, xmmword ptr [rbp - 0x220]
0x10073fae4: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x1b0]
0x10073faec: vmovaps xmm1, xmmword ptr [rip + 0x367b7c] ; 0x100aa7670
0x10073faf4: vmulps xmm0, xmm0, xmm1
0x10073faf8: vmovaps xmmword ptr [rbp - 0x1c0], xmm0
0x10073fb00: mov r13, qword ptr [rbp - 0x118]
0x10073fb07: mov rcx, qword ptr [r13 + 0x60]
0x10073fb0b: mov rdx, qword ptr [r13 + 0x70]
0x10073fb0f: mov byte ptr [rbp - 0xd8], 1
0x10073fb16: lea rdi, [rbp - 0x2d0]
0x10073fb1d: lea rsi, [rbp - 0x1c0]
0x10073fb24: lea r8, [rbp - 0xd8]
0x10073fb2b: call 0x10076c470 ; 0x10076c470
0x10073fb30: mov rax, qword ptr [rbx]
0x10073fb33: mov r15, qword ptr [rax + 0x20]
0x10073fb37: mov rsi, qword ptr [r15 + 0x288]
0x10073fb3e: mov rdi, r12
0x10073fb41: call 0x1007f26b0 ; 0x1007f26b0
0x10073fb46: mov rsi, qword ptr [r15 + 0x298]
0x10073fb4d: lea rdi, [rbp - 0x1b0]
0x10073fb54: call 0x1007f26b0 ; 0x1007f26b0
0x10073fb59: vmovaps xmm0, xmmword ptr [rbp - 0x220]
0x10073fb61: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x1b0]
0x10073fb69: vmulps xmm0, xmm0, xmmword ptr [rip + 0x367aff] ; 0x100aa7670
0x10073fb71: vmovaps xmmword ptr [rbp - 0x170], xmm0
0x10073fb79: mov rcx, qword ptr [r13 + 0x60]
0x10073fb7d: mov rdx, qword ptr [r13 + 0x70]
0x10073fb81: mov r13, qword ptr [rbp - 0x180]
0x10073fb88: mov byte ptr [rbp - 0x1b0], 1
0x10073fb8f: mov r15, r12
0x10073fb92: mov rdi, r15
0x10073fb95: lea rsi, [rbp - 0x170]
0x10073fb9c: lea r8, [rbp - 0x1b0]
0x10073fba3: call 0x10076c470 ; 0x10076c470
0x10073fba8: vmovss xmm0, dword ptr [rbp - 0xd0]
0x10073fbb0: vaddss xmm0, xmm0, dword ptr [rip + 0x368aa8] ; 0x100aa8660
0x10073fbb8: vmulss xmm0, xmm0, dword ptr [rip + 0x368ad8] ; 0x100aa8698
0x10073fbc0: vxorps xmm3, xmm3, xmm3
0x10073fbc4: vmaxss xmm0, xmm3, xmm0
0x10073fbc8: vmovss xmm1, dword ptr [rip + 0x3654f0] ; 0x100aa50c0
0x10073fbd0: vminss xmm0, xmm1, xmm0
0x10073fbd4: vsubss xmm1, xmm1, xmm0
0x10073fbd8: vmovaps xmm2, xmmword ptr [rbp - 0x140]
0x10073fbe0: vmulss xmm1, xmm2, xmm1
0x10073fbe4: vmulss xmm0, xmm2, xmm0
0x10073fbe8: vaddss xmm0, xmm0, xmm1
0x10073fbec: vmovaps xmm2, xmmword ptr [rbp - 0xf0]
0x10073fbf4: vminss xmm1, xmm0, xmm2
0x10073fbf8: vcmpeqss xmm2, xmm2, xmm3
0x10073fbfd: vblendvps xmm0, xmm1, xmm0, xmm2
0x10073fc03: vmovaps xmmword ptr [rbp - 0xf0], xmm0
0x10073fc0b: mov r12, qword ptr [rbp - 0xf8]
0x10073fc12: add rbx, 8
0x10073fc16: dec r14
0x10073fc19: jne 0x10073f9a0
0x10073fc1f: jmp 0x10073fc38 ; 0x10073fc38
0x10073fc21: mov r15, r13
0x10073fc24: mov r13, qword ptr [rbp - 0x180]
0x10073fc2b: add rbx, 8
0x10073fc2f: dec r14
0x10073fc32: jne 0x10073f9a0
0x10073fc38: vxorps xmm6, xmm6, xmm6
0x10073fc3c: vmovaps xmm2, xmmword ptr [rbp - 0xf0]
0x10073fc44: vcmpltss xmm0, xmm6, xmm2
0x10073fc49: vmovaps xmm1, xmmword ptr [rbp - 0x140]
0x10073fc51: vblendvps xmm1, xmm1, xmm2, xmm0
0x10073fc57: mov r14, qword ptr [rbp - 0x288]
0x10073fc5e: vmovss xmm0, dword ptr [r14 + 0x228]
0x10073fc67: vmovss xmm2, dword ptr [r14 + 0x290]
0x10073fc70: vaddss xmm3, xmm2, dword ptr [rip + 0x39a60c] ; 0x100ada284
0x10073fc78: vmovss xmm4, dword ptr [rip + 0x36cd1c] ; 0x100aac99c
0x10073fc80: vdivss xmm3, xmm3, xmm4
0x10073fc84: vaddss xmm2, xmm2, dword ptr [rip + 0x37bb84] ; 0x100abb810
0x10073fc8c: vxorps xmm2, xmm2, xmmword ptr [rip + 0x367c6c] ; 0x100aa7900
0x10073fc94: vdivss xmm2, xmm2, xmm4
0x10073fc98: vmaxss xmm3, xmm6, xmm3
0x10073fc9c: vmovss xmm4, dword ptr [rip + 0x36541c] ; 0x100aa50c0
0x10073fca4: vmovaps xmm5, xmm4
0x10073fca8: vminss xmm3, xmm5, xmm3
0x10073fcac: vsubss xmm4, xmm5, xmm3
0x10073fcb0: vmulss xmm1, xmm1, xmm4
0x10073fcb4: vmulss xmm3, xmm3, dword ptr [rip + 0x368914] ; 0x100aa85d0
0x10073fcbc: vaddss xmm1, xmm3, xmm1
0x10073fcc0: vmaxss xmm2, xmm6, xmm2
0x10073fcc4: vminss xmm2, xmm5, xmm2
0x10073fcc8: vsubss xmm3, xmm5, xmm2
0x10073fccc: vmulss xmm1, xmm3, xmm1
0x10073fcd0: vmulss xmm2, xmm2, dword ptr [rip + 0x36bb68] ; 0x100aab840
0x10073fcd8: vaddss xmm1, xmm2, xmm1
0x10073fcdc: vucomiss xmm0, xmm6
0x10073fce0: jbe 0x10073fd07
0x10073fce2: vmovss xmm2, dword ptr [rip + 0x3653d6] ; 0x100aa50c0
0x10073fcea: vmovss xmm3, dword ptr [rbp - 0x100]
0x10073fcf2: vsubss xmm2, xmm2, xmm3
0x10073fcf6: vmulss xmm1, xmm2, xmm1
0x10073fcfa: vmulss xmm2, xmm3, dword ptr [r14 + 0x224]
0x10073fd03: vaddss xmm1, xmm1, xmm2
0x10073fd07: lea rax, [r14 + 0x2f0]
0x10073fd0e: mov qword ptr [rbp - 0x140], rax
0x10073fd15: lea rax, [r14 + 0x2c4]
0x10073fd1c: mov qword ptr [rbp - 0x158], rax
0x10073fd23: lea r8, [r14 + 0x1f0]
0x10073fd2a: lea r9, [r14 + 0x260]
0x10073fd31: lea r10, [r14 + 0x1f8]
0x10073fd38: lea rax, [r14 + 0x298]
0x10073fd3f: mov qword ptr [rbp - 0x230], rax
0x10073fd46: lea r11, [r14 + 0x29c]
0x10073fd4d: lea rax, [r14 + 0x294]
0x10073fd54: mov qword ptr [rbp - 0x228], rax
0x10073fd5b: lea r12, [r14 + 0x290]
0x10073fd62: lea rsi, [r14 + 0x210]
0x10073fd69: lea rbx, [r14 + 0x2ac]
0x10073fd70: lea rcx, [r14 + 0x2a8]
0x10073fd77: vmovss xmm6, dword ptr [rip + 0x367a6d] ; 0x100aa77ec
0x10073fd7f: movzx eax, byte ptr [r14 + 0x114]
0x10073fd87: test rax, rax
0x10073fd8a: lea rdi, [r14 + 0x2c0]
0x10073fd91: lea rdx, [r14 + 0x228]
0x10073fd98: mov qword ptr [rbp - 0x278], r8
0x10073fd9f: mov qword ptr [rbp - 0x270], rdx
0x10073fda6: mov qword ptr [rbp - 0x268], rsi
0x10073fdad: mov qword ptr [rbp - 0x260], r10
0x10073fdb4: mov qword ptr [rbp - 0x258], rbx
0x10073fdbb: mov qword ptr [rbp - 0x250], rcx
0x10073fdc2: mov qword ptr [rbp - 0x248], r9
0x10073fdc9: mov qword ptr [rbp - 0x240], rdi
0x10073fdd0: mov qword ptr [rbp - 0x238], r11
0x10073fdd7: jne 0x10073fddf
0x10073fdd9: vmulss xmm3, xmm0, xmm6
0x10073fddd: jmp 0x10073fde7 ; 0x10073fde7
0x10073fddf: vmovss xmm3, dword ptr [rip + 0x368be5] ; 0x100aa89cc
0x10073fde7: mov r15, qword ptr [rbp - 0x118]
0x10073fdee: mov rbx, qword ptr [rbp - 0x120]
0x10073fdf5: vxorps xmm2, xmm2, xmm2
0x10073fdf9: vcmpltss xmm4, xmm2, xmm0
0x10073fdfe: lea rcx, [rip + 0x39a4a3] ; 0x100ada2a8
0x10073fe05: vmovss xmm5, dword ptr [rcx + rax*4]
0x10073fe0a: vblendvps xmm3, xmm5, xmm3, xmm4
0x10073fe10: vmovss xmm4, dword ptr [r14 + 0x2a0]
0x10073fe19: vmulss xmm5, xmm3, xmm6
0x10073fe1d: vcmpltss xmm6, xmm4, xmm1
0x10073fe22: vblendvps xmm3, xmm3, xmm5, xmm6
0x10073fe28: vmovaps xmm6, xmmword ptr [rbp - 0x110]
0x10073fe30: vmulss xmm5, xmm6, xmm3
0x10073fe34: vaddss xmm5, xmm5, dword ptr [rip + 0x365284] ; 0x100aa50c0
0x10073fe3c: vmulss xmm3, xmm3, xmm3
0x10073fe40: vmulss xmm3, xmm6, xmm3
0x10073fe44: vsubss xmm1, xmm1, xmm4
0x10073fe48: vmulss xmm1, xmm1, xmm3
0x10073fe4c: vaddss xmm1, xmm1, dword ptr [r14 + 0x2a4]
0x10073fe55: vmulss xmm3, xmm5, xmm5
0x10073fe59: vdivss xmm1, xmm1, xmm3
0x10073fe5d: vmovss dword ptr [r14 + 0x2a4], xmm1
0x10073fe66: vmulss xmm1, xmm6, xmm1
0x10073fe6a: vaddss xmm1, xmm4, xmm1
0x10073fe6e: vmovss dword ptr [rbp - 0xd0], xmm1
0x10073fe76: vmovss dword ptr [r14 + 0x2a0], xmm1
0x10073fe7f: jne 0x10073ff3d
0x10073fe85: vmovaps xmm1, xmmword ptr [r13 + 0x50]
0x10073fe8b: vmulps xmm1, xmm1, xmm1
0x10073fe8f: vmovshdup xmm3, xmm1
0x10073fe93: vaddss xmm3, xmm1, xmm3
0x10073fe97: vpermilpd xmm1, xmm1, 1
0x10073fe9d: vaddss xmm1, xmm1, xmm3
0x10073fea1: vsqrtss xmm1, xmm1, xmm1
0x10073fea5: vucomiss xmm1, xmm2
0x10073fea9: jbe 0x10073ff3d
0x10073feaf: vxorps xmm1, xmm1, xmm1
0x10073feb3: vucomiss xmm0, xmm1
0x10073feb7: jbe 0x10073fecf
0x10073feb9: mov rax, qword ptr [rbp - 0x150]
0x10073fec0: cmp byte ptr [rax], 0
0x10073fec3: jne 0x10073fef9
0x10073fec5: cmp byte ptr [r14 + 0x208], 0
0x10073fecd: jne 0x10073fef9
0x10073fecf: mov rax, qword ptr [rbp - 0x158]
0x10073fed6: vmovss xmm0, dword ptr [rax]
0x10073feda: vucomiss xmm0, dword ptr [rip + 0x3651de] ; 0x100aa50c0
0x10073fee2: jb 0x10073ff3d
0x10073fee4: vmovss xmm0, dword ptr [r13 + 0xb48]
0x10073feed: vxorps xmm1, xmm1, xmm1
0x10073fef1: vucomiss xmm0, xmm1
0x10073fef5: jne 0x10073ff3d
0x10073fef7: jp 0x10073ff3d
0x10073fef9: vmovaps xmm0, xmmword ptr [rbp - 0x110]
0x10073ff01: vmulss xmm0, xmm0, dword ptr [rip + 0x368aa7] ; 0x100aa89b0
0x10073ff09: call 0x100aa2708 ; 0x100aa2708 _expf
0x10073ff0e: vmovss xmm1, dword ptr [rip + 0x3651aa] ; 0x100aa50c0
0x10073ff16: vsubss xmm0, xmm1, xmm0
0x10073ff1a: vxorps xmm2, xmm2, xmm2
0x10073ff1e: vmaxss xmm0, xmm2, xmm0
0x10073ff22: vminss xmm0, xmm1, xmm0
0x10073ff26: vsubss xmm1, xmm1, xmm0
0x10073ff2a: mov rax, qword ptr [rbp - 0x158]
0x10073ff31: vmulss xmm1, xmm1, dword ptr [rax]
0x10073ff35: vaddss xmm0, xmm0, xmm1
0x10073ff39: vmovss dword ptr [rax], xmm0
0x10073ff3d: vmovss xmm0, dword ptr [r14 + 0x2c0]
0x10073ff46: vmulss xmm0, xmm0, dword ptr [rip + 0x36466a] ; 0x100aa45b8
0x10073ff4e: call 0x100aa2cfc ; 0x100aa2cfc _tanf
0x10073ff53: vmovss xmm5, dword ptr [rbp - 0xd0]
0x10073ff5b: vaddss xmm2, xmm5, xmm5
0x10073ff5f: vmovss xmm1, dword ptr [r14 + 0x2c4]
0x10073ff68: vmulss xmm2, xmm2, xmm1
0x10073ff6c: vmulss xmm0, xmm0, xmm2
0x10073ff70: vmovss xmm2, dword ptr [rip + 0x365148] ; 0x100aa50c0
0x10073ff78: vdivss xmm0, xmm2, xmm0
0x10073ff7c: vmovss dword ptr [r14 + 0x2c8], xmm0
0x10073ff85: cmp byte ptr [r14 + 0x220], 0
0x10073ff8d: je 0x10073ffad
0x10073ff8f: vmovss xmm0, dword ptr [r14 + 0x21c]
0x10073ff98: vxorps xmm0, xmm0, xmmword ptr [rip + 0x367960] ; 0x100aa7900
0x10073ffa0: vmovss xmm4, dword ptr [rip + 0x367844] ; 0x100aa77ec
0x10073ffa8: jmp 0x1007400f8 ; 0x1007400f8
0x10073ffad: vmovaps xmm0, xmmword ptr [r13 + 0x60]
0x10073ffb3: vmulps xmm2, xmm0, xmm0
0x10073ffb7: vmovshdup xmm3, xmm2
0x10073ffbb: vaddss xmm3, xmm2, xmm3
0x10073ffbf: vpermilpd xmm2, xmm2, 1
0x10073ffc5: vaddss xmm2, xmm2, xmm3
0x10073ffc9: vsqrtss xmm2, xmm2, xmm2
0x10073ffcd: vucomiss xmm2, dword ptr [rip + 0x3678ef] ; 0x100aa78c4
0x10073ffd5: jbe 0x10073ffe1
0x10073ffd7: vpermilps xmm2, xmm2, 0xc0
0x10073ffdd: vdivps xmm0, xmm0, xmm2
0x10073ffe1: vmovss xmm4, dword ptr [rip + 0x367803] ; 0x100aa77ec
0x10073ffe9: vmulps xmm0, xmm0, xmmword ptr [r14 + 0x310]
0x10073fff2: vmovshdup xmm2, xmm0
0x10073fff6: vaddss xmm2, xmm0, xmm2
0x10073fffa: vpermilpd xmm0, xmm0, 1
0x100740000: vaddss xmm3, xmm0, xmm2
0x100740004: vmovss xmm0, dword ptr [rbp - 0xdc]
0x10074000c: vucomiss xmm0, dword ptr [rip + 0x3650ac] ; 0x100aa50c0
0x100740014: jne 0x100740045
0x100740016: jp 0x100740045
0x100740018: vmovss xmm0, dword ptr [rip + 0x39a268] ; 0x100ada288
0x100740020: vmaxss xmm0, xmm0, xmm3
0x100740024: vmovss xmm2, dword ptr [rip + 0x36a450] ; 0x100aaa47c
0x10074002c: vminss xmm0, xmm2, xmm0
0x100740030: vmulss xmm1, xmm5, xmm1
0x100740034: vaddss xmm1, xmm1, dword ptr [rip + 0x365084] ; 0x100aa50c0
0x10074003c: vmulss xmm0, xmm1, xmm0
0x100740040: jmp 0x1007400f8 ; 0x1007400f8
0x100740045: vmovaps xmm2, xmmword ptr [r13 + 0x50]
0x10074004b: vxorps xmm0, xmm0, xmm0
0x10074004f: xor eax, eax
0x100740051: vucomiss xmm3, xmm0
0x100740055: seta al
0x100740058: lea rcx, [rip + 0x39a251] ; 0x100ada2b0
0x10074005f: vmovss xmm8, dword ptr [rcx + rax*4]
0x100740064: vmovss xmm1, dword ptr [rip + 0x36b790] ; 0x100aab7fc
0x10074006c: vmaxss xmm1, xmm1, xmm3
0x100740070: vmovss xmm3, dword ptr [rip + 0x36914c] ; 0x100aa91c4
0x100740078: vminss xmm1, xmm3, xmm1
0x10074007c: lea rax, [rip + 0x381751] ; 0x100ac17d4
0x100740083: vmovss xmm3, dword ptr [rax]
0x100740087: lea rax, [rip + 0x38173e] ; 0x100ac17cc
0x10074008e: vmovss xmm0, dword ptr [rax]
0x100740092: vsubss xmm5, xmm3, xmm0
0x100740096: vucomiss xmm5, dword ptr [rip + 0x367826] ; 0x100aa78c4
0x10074009e: vmovss xmm3, dword ptr [rip + 0x36501a] ; 0x100aa50c0
0x1007400a6: ja 0x1007400ba
0x1007400a8: vmovss xmm6, dword ptr [rip + 0x369520] ; 0x100aa95d0
0x1007400b0: vucomiss xmm6, xmm5
0x1007400b4: vmovaps xmm6, xmm3
0x1007400b8: jbe 0x1007400dc
0x1007400ba: vmulps xmm2, xmm2, xmm2
0x1007400be: vpermilpd xmm6, xmm2, 1
0x1007400c4: vmovshdup xmm7, xmm2
0x1007400c8: vaddss xmm2, xmm2, xmm7
0x1007400cc: vaddss xmm2, xmm6, xmm2
0x1007400d0: vsqrtss xmm2, xmm2, xmm2
0x1007400d4: vsubss xmm2, xmm2, xmm0
0x1007400d8: vdivss xmm6, xmm2, xmm5
0x1007400dc: vxorps xmm2, xmm2, xmm2
0x1007400e0: vmaxss xmm2, xmm2, xmm6
0x1007400e4: vminss xmm2, xmm3, xmm2
0x1007400e8: vsubss xmm3, xmm3, xmm2
0x1007400ec: vmulss xmm0, xmm8, xmm3
0x1007400f0: vmulss xmm1, xmm1, xmm2
0x1007400f4: vaddss xmm0, xmm1, xmm0
0x1007400f8: lea rax, [rip + 0x18ebea1] ; 0x10202bfa0
0x1007400ff: cmp byte ptr [rax], 0
0x100740102: vmovaps xmmword ptr [rbp - 0xf0], xmm0
0x10074010a: jne 0x100740160
0x10074010c: mov al, byte ptr [rip + 0x5cf762] ; 0x100d0f874
0x100740112: test al, al
0x100740114: je 0x100740160
0x100740116: mov qword ptr [rbp - 0xd0], r12
0x10074011d: cmp dword ptr [rbp - 0x124], 0
0x100740124: jle 0x10074013b
0x100740126: cmp byte ptr [r14 + 0x100], 0
0x10074012e: setne al
0x100740131: mov ecx, dword ptr [rbp - 0xb4]
0x100740137: or cl, al
0x100740139: je 0x10074016c
0x10074013b: mov dword ptr [r14 + 0x110], 0
0x100740146: lea rax, [r14 + 0x3f0]
0x10074014d: cmp byte ptr [r14 + 0x3f0], 0
0x100740155: jne 0x100740293
0x10074015b: jmp 0x1007402bc ; 0x1007402bc
0x100740160: lea rax, [r14 + 0x3f0]
0x100740167: jmp 0x1007402d2 ; 0x1007402d2
0x10074016c: lea rdi, [rbp - 0x428]
0x100740173: call 0x1003b50f0 ; 0x1003b50f0
0x100740178: test eax, eax
0x10074017a: je 0x100740282
0x100740180: xor ebx, ebx
0x100740182: lea r12, [rbp - 0x428]
0x100740189: nop dword ptr [rax]
0x100740190: mov rdi, r12
0x100740193: mov esi, ebx
0x100740195: call 0x1003b7c30 ; 0x1003b7c30
0x10074019a: vmovss xmm0, dword ptr [rax + 0x60]
0x10074019f: vucomiss xmm0, dword ptr [r14 + 0x110]
0x1007401a8: jbe 0x100740270
0x1007401ae: mov rax, qword ptr [r15 + 0x160]
0x1007401b5: vmovss xmm1, dword ptr [rax + 0x24]
0x1007401ba: vmovss xmm2, dword ptr [rip + 0x367626] ; 0x100aa77e8
0x1007401c2: vaddss xmm2, xmm2, dword ptr [r14 + 0x10c]
0x1007401cb: vucomiss xmm1, xmm2
0x1007401cf: jbe 0x100740270
0x1007401d5: vmovss dword ptr [r14 + 0x110], xmm0
0x1007401de: vmovss dword ptr [r14 + 0x10c], xmm1
0x1007401e7: mov rdi, r12
0x1007401ea: mov esi, ebx
0x1007401ec: call 0x1003b7c30 ; 0x1003b7c30
0x1007401f1: vmovss xmm0, dword ptr [rax + 0x40]
0x1007401f6: mov rax, qword ptr [r15 + 0x60]
0x1007401fa: vmovss xmm1, dword ptr [rip + 0x3643b6] ; 0x100aa45b8
0x100740202: vmulss xmm1, xmm1, dword ptr [rax + 0x260]
0x10074020a: vucomiss xmm0, xmm1
0x10074020e: jae 0x10074023b
0x100740210: mov eax, dword ptr [r14 + 0x104]
0x100740217: lea ecx, [rax + 1]
0x10074021a: mov dword ptr [r14 + 0x104], ecx
0x100740221: mov dword ptr [r14 + 0x108], 0
0x10074022c: cmp eax, 2
0x10074022f: jl 0x100740270
0x100740231: mov byte ptr [r14 + 0x102], 0
0x100740239: jmp 0x100740270 ; 0x100740270
0x10074023b: mov eax, dword ptr [r14 + 0x108]
0x100740242: lea ecx, [rax + 1]
0x100740245: mov dword ptr [r14 + 0x108], ecx
0x10074024c: mov dword ptr [r14 + 0x104], 0
0x100740257: cmp eax, 2
0x10074025a: jl 0x100740270
0x10074025c: mov byte ptr [r14 + 0x102], 1
0x100740264: nop word ptr cs:[rax + rax]
0x100740270: inc ebx
0x100740272: mov rdi, r12
0x100740275: call 0x1003b50f0 ; 0x1003b50f0
0x10074027a: cmp ebx, eax
0x10074027c: jb 0x100740190
0x100740282: lea rax, [r14 + 0x3f0]
0x100740289: cmp byte ptr [r14 + 0x3f0], 0
0x100740291: je 0x1007402bc
0x100740293: vmovss xmm0, dword ptr [r14 + 0x3e0]
0x10074029c: mov rcx, qword ptr [r15 + 0x60]
0x1007402a0: vmovss xmm1, dword ptr [rcx + 0x260]
0x1007402a8: vmulss xmm1, xmm1, dword ptr [rip + 0x364308] ; 0x100aa45b8
0x1007402b0: vucomiss xmm0, xmm1
0x1007402b4: setae byte ptr [r14 + 0x102]
0x1007402bc: mov rbx, qword ptr [rbp - 0x120]
0x1007402c3: mov r12, qword ptr [rbp - 0xd0]
0x1007402ca: vmovss xmm4, dword ptr [rip + 0x36751a] ; 0x100aa77ec
0x1007402d2: mov byte ptr [rax], 0
0x1007402d5: mov rax, qword ptr [r15 + 0x68]
0x1007402d9: cmp byte ptr [rax + 8], 0
0x1007402dd: vxorps xmm0, xmm0, xmm0
0x1007402e1: je 0x1007402e7
0x1007402e3: vmovaps xmm0, xmm4
0x1007402e7: mov rax, qword ptr [r15 + 0x518]
0x1007402ee: cmp byte ptr [rax + 0x2684], 0
0x1007402f5: je 0x100740341
0x1007402f7: vxorps xmm0, xmm0, xmm0
0x1007402fb: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x100740303: mov rdi, qword ptr [r15 + 0x58]
0x100740307: mov rax, qword ptr [rdi]
0x10074030a: lea rsi, [rbp - 0xb0]
0x100740311: call qword ptr [rax + 0xb0]
0x100740317: lea rax, [rip + 0x552b62] ; 0x100c92e80
0x10074031e: vmovss xmm0, dword ptr [rax]
0x100740322: vmovss dword ptr [rbp - 0xd0], xmm0
0x10074032a: vmovss xmm0, dword ptr [rbp - 0xb0]
0x100740332: xor edi, edi
0x100740334: call 0x10076d810 ; 0x10076d810
0x100740339: vaddss xmm0, xmm0, dword ptr [rbp - 0xd0]
0x100740341: vmovss dword ptr [rbp - 0xd0], xmm0
0x100740349: mov rax, qword ptr [r15 + 0x528]
0x100740350: mov rcx, qword ptr [rax + 0xd0]
0x100740357: test rcx, rcx
0x10074035a: je 0x100740362
0x10074035c: cmp byte ptr [rcx + 0x18], 0
0x100740360: jne 0x1007403a4
0x100740362: mov rcx, qword ptr [rax + 0xe0]
0x100740369: test rcx, rcx
0x10074036c: je 0x100740374
0x10074036e: cmp byte ptr [rcx + 0x18], 0
0x100740372: jne 0x1007403a4
0x100740374: mov rcx, qword ptr [rax + 0xd8]
0x10074037b: test rcx, rcx
0x10074037e: je 0x100740386
0x100740380: cmp byte ptr [rcx + 0x18], 0
0x100740384: jne 0x1007403a4
0x100740386: mov rax, qword ptr [rax + 0xe8]
0x10074038d: vxorps xmm0, xmm0, xmm0
0x100740391: test rax, rax
0x100740394: je 0x100740431
0x10074039a: cmp byte ptr [rax + 0x18], 0
0x10074039e: je 0x100740431
0x1007403a4: call 0x100781700 ; 0x100781700
0x1007403a9: mov ecx, dword ptr [rax + 0x25c]
0x1007403af: test ecx, ecx
0x1007403b1: je 0x100740405
0x1007403b3: cmp ecx, 2
0x1007403b6: je 0x1007403cb
0x1007403b8: vxorps xmm0, xmm0, xmm0
0x1007403bc: cmp ecx, 1
0x1007403bf: jne 0x100740429
0x1007403c1: vmovss xmm0, dword ptr [rax + 0x260]
0x1007403c9: jmp 0x100740429 ; 0x100740429
0x1007403cb: vmovss xmm0, dword ptr [rax + 0x260]
0x1007403d3: vmovss xmm1, dword ptr [rax + 0x278]
0x1007403db: vdivss xmm1, xmm1, dword ptr [rax + 0x27c]
0x1007403e3: vmulss xmm1, xmm1, dword ptr [rax + 0x26c]
0x1007403eb: vaddss xmm2, xmm0, dword ptr [rip + 0x364ccd] ; 0x100aa50c0
0x1007403f3: vmulss xmm0, xmm0, dword ptr [rip + 0x3641bd] ; 0x100aa45b8
0x1007403fb: vdivss xmm0, xmm0, xmm1
0x1007403ff: vmulss xmm0, xmm2, xmm0
0x100740403: jmp 0x100740429 ; 0x100740429
0x100740405: vmovss xmm0, dword ptr [rax + 0x260]
0x10074040d: vmovss xmm1, dword ptr [rax + 0x278]
0x100740415: vdivss xmm1, xmm1, dword ptr [rax + 0x27c]
0x10074041d: vmulss xmm1, xmm1, dword ptr [rax + 0x26c]
0x100740425: vdivss xmm0, xmm0, xmm1
0x100740429: vmulss xmm0, xmm0, dword ptr [rip + 0x364187] ; 0x100aa45b8
0x100740431: vmovss dword ptr [rbp - 0xf8], xmm0
0x100740439: call 0x100781700 ; 0x100781700
0x10074043e: mov ecx, dword ptr [rax + 0x25c]
0x100740444: test ecx, ecx
0x100740446: je 0x10074049a
0x100740448: cmp ecx, 2
0x10074044b: je 0x100740460
0x10074044d: vxorps xmm0, xmm0, xmm0
0x100740451: cmp ecx, 1
0x100740454: jne 0x1007404be
0x100740456: vmovss xmm0, dword ptr [rax + 0x260]
0x10074045e: jmp 0x1007404be ; 0x1007404be
0x100740460: vmovss xmm0, dword ptr [rax + 0x260]
0x100740468: vmovss xmm1, dword ptr [rax + 0x278]
0x100740470: vdivss xmm1, xmm1, dword ptr [rax + 0x27c]
0x100740478: vmulss xmm1, xmm1, dword ptr [rax + 0x26c]
0x100740480: vaddss xmm2, xmm0, dword ptr [rip + 0x364c38] ; 0x100aa50c0
0x100740488: vmulss xmm0, xmm0, dword ptr [rip + 0x364128] ; 0x100aa45b8
0x100740490: vdivss xmm0, xmm0, xmm1
0x100740494: vmulss xmm0, xmm2, xmm0
0x100740498: jmp 0x1007404be ; 0x1007404be
0x10074049a: vmovss xmm0, dword ptr [rax + 0x260]
0x1007404a2: vmovss xmm1, dword ptr [rax + 0x278]
0x1007404aa: vdivss xmm1, xmm1, dword ptr [rax + 0x27c]
0x1007404b2: vmulss xmm1, xmm1, dword ptr [rax + 0x26c]
0x1007404ba: vdivss xmm0, xmm0, xmm1
0x1007404be: vmovss xmm1, dword ptr [rbp - 0xd0]
0x1007404c6: vdivss xmm0, xmm1, xmm0
0x1007404ca: vmovss dword ptr [rbp - 0xd0], xmm0
0x1007404d2: call 0x100781700 ; 0x100781700
0x1007404d7: mov ecx, dword ptr [rax + 0x25c]
0x1007404dd: test ecx, ecx
0x1007404df: je 0x10074053b
0x1007404e1: cmp ecx, 2
0x1007404e4: vmovss xmm3, dword ptr [rbp - 0xf8]
0x1007404ec: je 0x100740501
0x1007404ee: vxorps xmm0, xmm0, xmm0
0x1007404f2: cmp ecx, 1
0x1007404f5: jne 0x100740567
0x1007404f7: vmovss xmm0, dword ptr [rax + 0x260]
0x1007404ff: jmp 0x100740567 ; 0x100740567
0x100740501: vmovss xmm0, dword ptr [rax + 0x260]
0x100740509: vmovss xmm1, dword ptr [rax + 0x278]
0x100740511: vdivss xmm1, xmm1, dword ptr [rax + 0x27c]
0x100740519: vmulss xmm1, xmm1, dword ptr [rax + 0x26c]
0x100740521: vaddss xmm2, xmm0, dword ptr [rip + 0x364b97] ; 0x100aa50c0
0x100740529: vmulss xmm0, xmm0, dword ptr [rip + 0x364087] ; 0x100aa45b8
0x100740531: vdivss xmm0, xmm0, xmm1
0x100740535: vmulss xmm0, xmm2, xmm0
0x100740539: jmp 0x100740567 ; 0x100740567
0x10074053b: vmovss xmm0, dword ptr [rax + 0x260]
0x100740543: vmovss xmm1, dword ptr [rax + 0x278]
0x10074054b: vdivss xmm1, xmm1, dword ptr [rax + 0x27c]
0x100740553: vmulss xmm1, xmm1, dword ptr [rax + 0x26c]
0x10074055b: vdivss xmm0, xmm0, xmm1
0x10074055f: vmovss xmm3, dword ptr [rbp - 0xf8]
0x100740567: vdivss xmm2, xmm3, xmm0
0x10074056b: vmovss xmm0, dword ptr [rip + 0x364b4d] ; 0x100aa50c0
0x100740573: vsubss xmm0, xmm0, xmm2
0x100740577: vmovss xmm1, dword ptr [rbp - 0xd0]
0x10074057f: vsubss xmm3, xmm0, xmm1
0x100740583: vxorps xmm0, xmm0, xmm0
0x100740587: vmovss dword ptr [rbp - 0x100], xmm3
0x10074058f: vmulss xmm0, xmm3, xmm0
0x100740593: vsubss xmm0, xmm0, xmm1
0x100740597: vmovss dword ptr [rbp - 0xf8], xmm2
0x10074059f: vaddss xmm0, xmm2, xmm0
0x1007405a3: vmovss dword ptr [r14 + 0x2d0], xmm0
0x1007405ac: vmovaps xmm1, xmmword ptr [r13 + 0x50]
0x1007405b2: lea rax, [rip + 0x38121b] ; 0x100ac17d4
0x1007405b9: vmovss xmm0, dword ptr [rax]
0x1007405bd: lea rax, [rip + 0x381208] ; 0x100ac17cc
0x1007405c4: vmovss xmm4, dword ptr [rax]
0x1007405c8: vmovss dword ptr [rbp - 0x124], xmm0
0x1007405d0: vsubss xmm0, xmm0, xmm4
0x1007405d4: vucomiss xmm0, dword ptr [rip + 0x3672e8] ; 0x100aa78c4
0x1007405dc: ja 0x1007405f4
0x1007405de: vmovss xmm2, dword ptr [rip + 0x368fea] ; 0x100aa95d0
0x1007405e6: vucomiss xmm2, xmm0
0x1007405ea: vmovss xmm2, dword ptr [rip + 0x364ace] ; 0x100aa50c0
0x1007405f2: jbe 0x100740616
0x1007405f4: vmulps xmm1, xmm1, xmm1
0x1007405f8: vpermilpd xmm2, xmm1, 1
0x1007405fe: vmovshdup xmm3, xmm1
0x100740602: vaddss xmm1, xmm1, xmm3
0x100740606: vaddss xmm1, xmm2, xmm1
0x10074060a: vsqrtss xmm1, xmm1, xmm1
0x10074060e: vsubss xmm1, xmm1, xmm4
0x100740612: vdivss xmm2, xmm1, xmm0
0x100740616: vmovss dword ptr [rbp - 0xb4], xmm2
0x10074061e: vmovss dword ptr [rbp - 0x15c], xmm4
0x100740626: mov rdi, qword ptr [r15 + 0x58]
0x10074062a: mov rax, qword ptr [rdi]
0x10074062d: call qword ptr [rax + 0x30]
0x100740630: test al, al
0x100740632: je 0x100740646
0x100740634: vmovss xmm6, dword ptr [rip + 0x366468] ; 0x100aa6aa4
0x10074063c: vmovss xmm3, dword ptr [rip + 0x36b1f4] ; 0x100aab838
0x100740644: jmp 0x100740695 ; 0x100740695
0x100740646: vxorps xmm0, xmm0, xmm0
0x10074064a: vmaxss xmm0, xmm0, dword ptr [rbp - 0xb4]
0x100740652: vmovss xmm1, dword ptr [rip + 0x364a66] ; 0x100aa50c0
0x10074065a: vminss xmm0, xmm1, xmm0
0x10074065e: vsubss xmm1, xmm1, xmm0
0x100740662: vmovss xmm2, dword ptr [rip + 0x363f4e] ; 0x100aa45b8
0x10074066a: vmulss xmm1, xmm1, xmm2
0x10074066e: vmulss xmm0, xmm0, xmm2
0x100740672: vaddss xmm6, xmm0, xmm1
0x100740676: cmp byte ptr [r14 + 0x218], 0
0x10074067e: je 0x1007410b5
0x100740684: vmovss xmm0, dword ptr [r14 + 0x214]
0x10074068d: vxorps xmm3, xmm0, xmmword ptr [rip + 0x36726b] ; 0x100aa7900
0x100740695: vmovaps xmm0, xmmword ptr [rbp - 0xf0]
0x10074069d: vmovss xmm1, dword ptr [rbp - 0xf8]
0x1007406a5: vmovss xmm2, dword ptr [rbp - 0x100]
0x1007406ad: mov rax, qword ptr [r15 + 0x520]
0x1007406b4: cmp dword ptr [rax + 0x18], 0
0x1007406b8: jle 0x1007406cf
0x1007406ba: mov rax, qword ptr [r15 + 0x60]
0x1007406be: cmp dword ptr [rax + 0x210], 0
0x1007406c5: jne 0x1007406cf
0x1007406c7: vaddss xmm3, xmm3, dword ptr [rip + 0x367fd1] ; 0x100aa86a0
0x1007406cf: vmulss xmm0, xmm0, xmm2
0x1007406d3: lea rdx, [r14 + 0x2c8]
0x1007406da: lea rcx, [r14 + 0x220]
0x1007406e1: mov rax, qword ptr [r15 + 0x528]
0x1007406e8: mov rax, qword ptr [rax + 0x30]
0x1007406ec: cmp byte ptr [rax + 0x18], 0
0x1007406f0: je 0x1007406fa
0x1007406f2: vaddss xmm3, xmm3, dword ptr [rip + 0x399b92] ; 0x100ada28c
0x1007406fa: vsubss xmm0, xmm0, dword ptr [rbp - 0xd0]
0x100740702: mov qword ptr [rbp - 0x100], rcx
0x100740709: mov qword ptr [rbp - 0x130], rdx
0x100740710: vmovaps xmmword ptr [rbp - 0xf0], xmm3
0x100740718: jne 0x100740724
0x10074071a: vmovss dword ptr [rbp - 0xb4], xmm6
0x100740722: jmp 0x100740734 ; 0x100740734
0x100740724: vmovss xmm2, dword ptr [rip + 0x366378] ; 0x100aa6aa4
0x10074072c: vmovss dword ptr [rbp - 0xb4], xmm2
0x100740734: vaddss xmm0, xmm1, xmm0
0x100740738: vmovss dword ptr [rbp - 0xd0], xmm0
0x100740740: vmovss xmm0, dword ptr [r12]
0x100740746: vaddss xmm0, xmm0, dword ptr [rip + 0x399b36] ; 0x100ada284
0x10074074e: vdivss xmm0, xmm0, dword ptr [rip + 0x36c246] ; 0x100aac99c
0x100740756: vmovss xmm1, dword ptr [rip + 0x367092] ; 0x100aa77f0
0x10074075e: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x100740763: vxorps xmm5, xmm5, xmm5
0x100740767: vucomiss xmm0, xmm5
0x10074076b: jbe 0x1007407fd
0x100740771: vmovaps xmm1, xmmword ptr [r13 + 0x50]
0x100740777: vmulps xmm1, xmm1, xmm1
0x10074077b: vmovshdup xmm2, xmm1
0x10074077f: vaddss xmm2, xmm1, xmm2
0x100740783: vpermilpd xmm1, xmm1, 1
0x100740789: vaddss xmm1, xmm1, xmm2
0x10074078d: vsqrtss xmm2, xmm1, xmm1
0x100740791: vmovss xmm1, dword ptr [rip + 0x364927] ; 0x100aa50c0
0x100740799: vucomiss xmm1, xmm2
0x10074079d: jbe 0x1007407fd
0x10074079f: vmovss xmm4, dword ptr [rbp - 0xd0]
0x1007407a7: vaddss xmm2, xmm4, xmm4
0x1007407ab: vxorps xmm3, xmm3, xmm3
0x1007407af: vmaxss xmm0, xmm3, xmm0
0x1007407b3: vminss xmm0, xmm1, xmm0
0x1007407b7: vsubss xmm1, xmm1, xmm0
0x1007407bb: vmulss xmm3, xmm4, xmm1
0x1007407bf: vmulss xmm2, xmm2, xmm0
0x1007407c3: vaddss xmm2, xmm2, xmm3
0x1007407c7: vmovss dword ptr [rbp - 0xd0], xmm2
0x1007407cf: vmulss xmm1, xmm1, dword ptr [rbp - 0xf0]
0x1007407d7: vmulss xmm0, xmm0, dword ptr [rip + 0x369c9d] ; 0x100aaa47c
0x1007407df: vaddss xmm0, xmm0, xmm1
0x1007407e3: vmovaps xmmword ptr [rbp - 0xf0], xmm0
0x1007407eb: vmovss xmm1, dword ptr [rip + 0x3674c1] ; 0x100aa7cb4
0x1007407f3: vmovss xmm0, dword ptr [rbp - 0x128]
0x1007407fb: jmp 0x10074080d ; 0x10074080d
0x1007407fd: vmovss xmm0, dword ptr [rbp - 0x128]
0x100740805: vmovss xmm1, dword ptr [rbp - 0xb4]
0x10074080d: vmulss xmm0, xmm0, dword ptr [rbp - 0x110]
0x100740815: vmovss dword ptr [rbp - 0xf8], xmm0
0x10074081d: vdivss xmm0, xmm1, dword ptr [rip + 0x367493] ; 0x100aa7cb8
0x100740825: vmaxss xmm0, xmm5, xmm0
0x100740829: vmovss xmm1, dword ptr [rip + 0x36488f] ; 0x100aa50c0
0x100740831: vminss xmm0, xmm1, xmm0
0x100740835: vsubss xmm0, xmm1, xmm0
0x100740839: call 0x100aa2858 ; 0x100aa2858 _logf
0x10074083e: vcvtss2sd xmm0, xmm0, xmm0
0x100740842: vdivsd xmm0, xmm0, qword ptr [rip + 0x367e76] ; 0x100aa86c0
0x10074084a: vcvtsd2ss xmm0, xmm0, xmm0
0x10074084e: vmulss xmm0, xmm0, dword ptr [rbp - 0x110]
0x100740856: call 0x100aa2708 ; 0x100aa2708 _expf
0x10074085b: vmovss xmm1, dword ptr [rip + 0x36485d] ; 0x100aa50c0
0x100740863: vsubss xmm0, xmm1, xmm0
0x100740867: vxorps xmm2, xmm2, xmm2
0x10074086b: vmaxss xmm0, xmm2, xmm0
0x10074086f: vminss xmm0, xmm1, xmm0
0x100740873: vsubss xmm1, xmm1, xmm0
0x100740877: vmulss xmm2, xmm1, dword ptr [r14 + 0x2b0]
0x100740880: vmulss xmm3, xmm0, dword ptr [rbp - 0xd0]
0x100740888: vaddss xmm2, xmm3, xmm2
0x10074088c: vmovss dword ptr [r14 + 0x2b0], xmm2
0x100740895: vmulss xmm1, xmm1, dword ptr [r14 + 0x2b8]
0x10074089e: vmulss xmm0, xmm0, dword ptr [rbp - 0xf0]
0x1007408a6: vaddss xmm0, xmm0, xmm1
0x1007408aa: vmovss dword ptr [r14 + 0x2b8], xmm0
0x1007408b3: mov rdi, qword ptr [r15 + 0x580]
0x1007408ba: lea rsi, [rip + 0x45cb76] ; 0x100b9d437 WhiskerCamera
0x1007408c1: call 0x100385200 ; 0x100385200
0x1007408c6: mov r13, rax
0x1007408c9: test r13, r13
0x1007408cc: je 0x100740cd5
0x1007408d2: mov rsi, r12
0x1007408d5: lea r12, [r14 + 0x2b0]
0x1007408dc: lea rax, [r14 + 0x2b8]
0x1007408e3: mov qword ptr [rbp - 0xd0], rax
0x1007408ea: mov rdi, r13
0x1007408ed: call 0x10076a2a0 ; 0x10076a2a0
0x1007408f2: mov rdi, r13
0x1007408f5: mov rsi, qword ptr [rbp - 0x228]
0x1007408fc: call 0x10076a2a0 ; 0x10076a2a0
0x100740901: mov rdi, r13
0x100740904: mov rsi, qword ptr [rbp - 0x230]
0x10074090b: call 0x10076a2a0 ; 0x10076a2a0
0x100740910: mov rdi, r13
0x100740913: mov rsi, qword ptr [rbp - 0x238]
0x10074091a: call 0x10076a2a0 ; 0x10076a2a0
0x10074091f: mov rdi, r13
0x100740922: mov rsi, qword ptr [rbp - 0x280]
0x100740929: call 0x10076a2a0 ; 0x10076a2a0
0x10074092e: lea rsi, [r14 + 0x384]
0x100740935: mov rdi, r13
0x100740938: call 0x10076a2a0 ; 0x10076a2a0
0x10074093d: lea rsi, [r14 + 0x2dc]
0x100740944: mov rdi, r13
0x100740947: call 0x10076a2a0 ; 0x10076a2a0
0x10074094c: mov rdi, r13
0x10074094f: mov rsi, qword ptr [rbp - 0x240]
0x100740956: call 0x10076a2a0 ; 0x10076a2a0
0x10074095b: mov rdi, r13
0x10074095e: mov rsi, qword ptr [rbp - 0x248]
0x100740965: call 0x10076a360 ; 0x10076a360
0x10074096a: lea rsi, [r14 + 0x270]
0x100740971: mov rdi, r13
0x100740974: call 0x10076a360 ; 0x10076a360
0x100740979: lea rsi, [r14 + 0x280]
0x100740980: mov rdi, r13
0x100740983: call 0x10076a360 ; 0x10076a360
0x100740988: mov rdi, r13
0x10074098b: mov r15, qword ptr [rbp - 0x250]
0x100740992: mov rsi, r15
0x100740995: call 0x10076a2a0 ; 0x10076a2a0
0x10074099a: mov rdi, r13
0x10074099d: mov rbx, qword ptr [rbp - 0x258]
0x1007409a4: mov rsi, rbx
0x1007409a7: call 0x10076a2a0 ; 0x10076a2a0
0x1007409ac: mov rdi, r13
0x1007409af: mov rsi, r12
0x1007409b2: call 0x10076a2a0 ; 0x10076a2a0
0x1007409b7: lea rsi, [r14 + 0x2b4]
0x1007409be: mov rdi, r13
0x1007409c1: call 0x10076a2a0 ; 0x10076a2a0
0x1007409c6: mov rdi, r13
0x1007409c9: mov rsi, qword ptr [rbp - 0xd0]
0x1007409d0: call 0x10076a2a0 ; 0x10076a2a0
0x1007409d5: lea rsi, [r14 + 0x2bc]
0x1007409dc: mov rdi, r13
0x1007409df: call 0x10076a2a0 ; 0x10076a2a0
0x1007409e4: mov rdi, r13
0x1007409e7: mov rsi, qword ptr [rbp - 0x158]
0x1007409ee: call 0x10076a2a0 ; 0x10076a2a0
0x1007409f3: mov rdi, r13
0x1007409f6: mov rsi, qword ptr [rbp - 0x130]
0x1007409fd: call 0x10076a2a0 ; 0x10076a2a0
0x100740a02: lea rsi, [r14 + 0x2cc]
0x100740a09: mov rdi, r13
0x100740a0c: call 0x10076a2a0 ; 0x10076a2a0
0x100740a11: mov rdi, r13
0x100740a14: mov rsi, r15
0x100740a17: call 0x10076a2a0 ; 0x10076a2a0
0x100740a1c: mov rdi, r13
0x100740a1f: mov rsi, rbx
0x100740a22: call 0x10076a2a0 ; 0x10076a2a0
0x100740a27: mov rdi, r13
0x100740a2a: mov rsi, qword ptr [rbp - 0x140]
0x100740a31: call 0x10076a360 ; 0x10076a360
0x100740a36: lea rsi, [r14 + 0x300]
0x100740a3d: mov rdi, r13
0x100740a40: call 0x10076a360 ; 0x10076a360
0x100740a45: lea rsi, [r14 + 0x340]
0x100740a4c: mov rdi, r13
0x100740a4f: call 0x10076a2a0 ; 0x10076a2a0
0x100740a54: lea rsi, [r14 + 0x344]
0x100740a5b: mov rdi, r13
0x100740a5e: call 0x10076a2a0 ; 0x10076a2a0
0x100740a63: lea rsi, [r14 + 0x348]
0x100740a6a: mov rdi, r13
0x100740a6d: call 0x10076a2a0 ; 0x10076a2a0
0x100740a72: lea rsi, [r14 + 0x360]
0x100740a79: mov rdi, r13
0x100740a7c: call 0x10076a360 ; 0x10076a360
0x100740a81: lea rsi, [r14 + 0x374]
0x100740a88: mov rdi, r13
0x100740a8b: call 0x10076a2a0 ; 0x10076a2a0
0x100740a90: lea rsi, [r14 + 0x370]
0x100740a97: mov rdi, r13
0x100740a9a: call 0x10076a2a0 ; 0x10076a2a0
0x100740a9f: lea rsi, [r14 + 0x378]
0x100740aa6: mov rdi, r13
0x100740aa9: call 0x10076a2a0 ; 0x10076a2a0
0x100740aae: lea rsi, [r14 + 0x37c]
0x100740ab5: mov rdi, r13
0x100740ab8: call 0x10076a2a0 ; 0x10076a2a0
0x100740abd: lea rsi, [r14 + 0x380]
0x100740ac4: mov rdi, r13
0x100740ac7: call 0x10076a2a0 ; 0x10076a2a0
0x100740acc: mov rdi, r13
0x100740acf: mov rsi, qword ptr [rbp - 0x1e0]
0x100740ad6: call 0x10076aae0 ; 0x10076aae0
0x100740adb: lea rbx, [r14 + 0x100]
0x100740ae2: mov rdi, r13
0x100740ae5: mov rsi, rbx
0x100740ae8: call 0x10076aae0 ; 0x10076aae0
0x100740aed: lea r12, [r14 + 0x102]
0x100740af4: mov rdi, r13
0x100740af7: mov rsi, r12
0x100740afa: call 0x10076aae0 ; 0x10076aae0
0x100740aff: lea rsi, [r14 + 0x115]
0x100740b06: mov qword ptr [rbp - 0xd0], rsi
0x100740b0d: mov rdi, r13
0x100740b10: call 0x10076aae0 ; 0x10076aae0
0x100740b15: mov rdi, r13
0x100740b18: mov r15, qword ptr [rbp - 0x1d8]
0x100740b1f: mov rsi, r15
0x100740b22: call 0x10076aae0 ; 0x10076aae0
0x100740b27: lea rsi, [r14 + 0x1e0]
0x100740b2e: mov rdi, r13
0x100740b31: call 0x10076a360 ; 0x10076a360
0x100740b36: lea rsi, [r14 + 0x1f4]
0x100740b3d: mov rdi, r13
0x100740b40: call 0x10076a2a0 ; 0x10076a2a0
0x100740b45: mov rdi, r13
0x100740b48: mov rsi, qword ptr [rbp - 0x260]
0x100740b4f: call 0x10076a2a0 ; 0x10076a2a0
0x100740b54: lea rsi, [r14 + 0x200]
0x100740b5b: mov rdi, r13
0x100740b5e: call 0x10076a2a0 ; 0x10076a2a0
0x100740b63: lea rsi, [r14 + 0x204]
0x100740b6a: mov rdi, r13
0x100740b6d: call 0x10076a2a0 ; 0x10076a2a0
0x100740b72: lea rsi, [r14 + 0x20c]
0x100740b79: mov rdi, r13
0x100740b7c: call 0x10076a2a0 ; 0x10076a2a0
0x100740b81: mov rdi, r13
0x100740b84: mov rsi, qword ptr [rbp - 0x268]
0x100740b8b: call 0x10076a2a0 ; 0x10076a2a0
0x100740b90: lea rsi, [r14 + 0x214]
0x100740b97: mov rdi, r13
0x100740b9a: call 0x10076a2a0 ; 0x10076a2a0
0x100740b9f: lea rsi, [r14 + 0x21c]
0x100740ba6: mov rdi, r13
0x100740ba9: call 0x10076a2a0 ; 0x10076a2a0
0x100740bae: lea rsi, [r14 + 0x224]
0x100740bb5: mov rdi, r13
0x100740bb8: call 0x10076a2a0 ; 0x10076a2a0
0x100740bbd: mov rdi, r13
0x100740bc0: mov rsi, qword ptr [rbp - 0x270]
0x100740bc7: call 0x10076a2a0 ; 0x10076a2a0
0x100740bcc: lea rsi, [r14 + 0x22c]
0x100740bd3: mov rdi, r13
0x100740bd6: call 0x10076a2a0 ; 0x10076a2a0
0x100740bdb: lea rsi, [r14 + 0x230]
0x100740be2: mov rdi, r13
0x100740be5: call 0x10076a2a0 ; 0x10076a2a0
0x100740bea: lea rsi, [r14 + 0x234]
0x100740bf1: mov rdi, r13
0x100740bf4: call 0x10076a2a0 ; 0x10076a2a0
0x100740bf9: lea rsi, [r14 + 0x238]
0x100740c00: mov rdi, r13
0x100740c03: call 0x10076a2a0 ; 0x10076a2a0
0x100740c08: mov rdi, r13
0x100740c0b: mov rsi, qword ptr [rbp - 0x278]
0x100740c12: call 0x10076aae0 ; 0x10076aae0
0x100740c17: mov rdi, r13
0x100740c1a: mov rsi, qword ptr [rbp - 0x150]
0x100740c21: call 0x10076aae0 ; 0x10076aae0
0x100740c26: lea rsi, [r14 + 0x1fd]
0x100740c2d: mov rdi, r13
0x100740c30: call 0x10076aae0 ; 0x10076aae0
0x100740c35: lea rsi, [r14 + 0x208]
0x100740c3c: mov rdi, r13
0x100740c3f: call 0x10076aae0 ; 0x10076aae0
0x100740c44: lea rsi, [r14 + 0x209]
0x100740c4b: mov rdi, r13
0x100740c4e: call 0x10076aae0 ; 0x10076aae0
0x100740c53: lea rsi, [r14 + 0x218]
0x100740c5a: mov rdi, r13
0x100740c5d: call 0x10076aae0 ; 0x10076aae0
0x100740c62: mov rdi, r13
0x100740c65: mov rsi, qword ptr [rbp - 0x100]
0x100740c6c: call 0x10076aae0 ; 0x10076aae0
0x100740c71: lea rsi, [r14 + 0x23c]
0x100740c78: mov rdi, r13
0x100740c7b: call 0x10076aae0 ; 0x10076aae0
0x100740c80: lea rsi, [r14 + 0x23d]
0x100740c87: mov rdi, r13
0x100740c8a: call 0x10076aae0 ; 0x10076aae0
0x100740c8f: mov rdi, r13
0x100740c92: mov rsi, rbx
0x100740c95: call 0x10076aae0 ; 0x10076aae0
0x100740c9a: mov rdi, r13
0x100740c9d: mov rsi, r12
0x100740ca0: mov rbx, qword ptr [rbp - 0x120]
0x100740ca7: call 0x10076aae0 ; 0x10076aae0
0x100740cac: mov rdi, r13
0x100740caf: mov rsi, qword ptr [rbp - 0x1e0]
0x100740cb6: call 0x10076aae0 ; 0x10076aae0
0x100740cbb: mov rdi, r13
0x100740cbe: mov rsi, qword ptr [rbp - 0xd0]
0x100740cc5: call 0x10076aae0 ; 0x10076aae0
0x100740cca: mov rdi, r13
0x100740ccd: mov rsi, r15
0x100740cd0: call 0x10076aae0 ; 0x10076aae0
0x100740cd5: vmovss xmm0, dword ptr [rip + 0x365dbf] ; 0x100aa6a9c
0x100740cdd: vmaxss xmm0, xmm0, dword ptr [rbp - 0xf8]
0x100740ce5: vmovss dword ptr [rbp - 0xd0], xmm0
0x100740ced: mov rdi, r14
0x100740cf0: vmovss xmm0, dword ptr [rbp - 0x144]
0x100740cf8: call 0x10073d510 ; 0x10073d510
0x100740cfd: mov r15, qword ptr [rbp - 0x118]
0x100740d04: mov rax, qword ptr [r15 + 0x70]
0x100740d08: mov qword ptr [r14 + 0x190], rax
0x100740d0f: mov rax, qword ptr [rbx]
0x100740d12: lea r12, [rbp - 0x310]
0x100740d19: mov rdi, r12
0x100740d1c: mov rsi, rbx
0x100740d1f: call qword ptr [rax + 0x18]
0x100740d22: mov rax, qword ptr [rbx]
0x100740d25: lea r13, [rbp - 0x220]
0x100740d2c: mov rdi, r13
0x100740d2f: mov rsi, rbx
0x100740d32: call qword ptr [rax + 0x20]
0x100740d35: lea rdi, [rbp - 0xb0]
0x100740d3c: mov rsi, r12
0x100740d3f: mov rdx, r13
0x100740d42: call 0x100076df0 ; 0x100076df0
0x100740d47: cmp byte ptr [rip + 0x18fd82a], 0 ; 0x10203e578
0x100740d4e: je 0x100740d70
0x100740d50: call 0x1002b9810 ; 0x1002b9810
0x100740d55: lea rdx, [rip + 0x18fe954] ; 0x10203f6b0
0x100740d5c: lea rsi, [rbp - 0xb0]
0x100740d63: mov ecx, 1
0x100740d68: mov rdi, rax
0x100740d6b: call 0x1002bc290 ; 0x1002bc290
0x100740d70: vmovss xmm0, dword ptr [rip + 0x365d28] ; 0x100aa6aa0
0x100740d78: vminss xmm0, xmm0, dword ptr [rbp - 0xd0]
0x100740d80: vmovss dword ptr [rbp - 0xd0], xmm0
0x100740d88: mov rsi, qword ptr [r14 + 0x190]
0x100740d8f: add rsi, 0x1c0
0x100740d96: lea rdi, [rbp - 0x220]
0x100740d9d: lea rdx, [rbp - 0xb0]
0x100740da4: call 0x100076df0 ; 0x100076df0
0x100740da9: vmovaps xmm0, xmmword ptr [rbp - 0x220]
0x100740db1: vmulps xmm0, xmm0, xmm0
0x100740db5: vpermilpd xmm1, xmm0, 1
0x100740dbb: vaddps xmm0, xmm0, xmm1
0x100740dbf: vmovshdup xmm1, xmm0
0x100740dc3: vaddss xmm0, xmm0, xmm1
0x100740dc7: vsqrtss xmm0, xmm0, xmm0
0x100740dcb: vaddss xmm0, xmm0, xmm0
0x100740dcf: vmovss xmm1, dword ptr [rbp - 0x1e4]
0x100740dd7: vmaxss xmm1, xmm1, dword ptr [rip + 0x3677d5] ; 0x100aa85b4
0x100740ddf: vdivss xmm0, xmm0, xmm1
0x100740de3: vmovss dword ptr [r14 + 0x188], xmm0
0x100740dec: cmp byte ptr [rip + 0x5cea80], 0 ; 0x100d0f873
0x100740df3: vmovaps xmm2, xmmword ptr [rbp - 0x110]
0x100740dfb: mov r12, qword ptr [rbp - 0x180]
0x100740e02: je 0x100740e22
0x100740e04: mov rdi, r14
0x100740e07: vmovaps xmm0, xmm2
0x100740e0b: mov rsi, qword ptr [rbp - 0x140]
0x100740e12: mov rdx, r15
0x100740e15: call 0x10073be20 ; 0x10073be20
0x100740e1a: vmovaps xmm2, xmmword ptr [rbp - 0x110]
0x100740e22: vmovss xmm0, dword ptr [rip + 0x364296] ; 0x100aa50c0
0x100740e2a: vcmpeqss xmm0, xmm0, dword ptr [rbp - 0xdc]
0x100740e33: vmovd ebx, xmm0
0x100740e37: and ebx, 1
0x100740e3a: vxorps xmm0, xmm0, xmm0
0x100740e3e: vmovlps qword ptr [rbp - 0x1c0], xmm0
0x100740e46: mov dword ptr [rbp - 0x1b8], 0
0x100740e50: mov rax, qword ptr [rip + 0x4cccb1] ; 0x100c0db08
0x100740e57: vmovups ymm0, ymmword ptr [rax]
0x100740e5b: vmovups ymm1, ymmword ptr [rax + 0x10]
0x100740e60: vmovups ymmword ptr [rbp - 0x1a0], ymm1
0x100740e68: vmovups ymmword ptr [rbp - 0x1b0], ymm0
0x100740e70: lea r8, [rbp - 0x1c0]
0x100740e77: lea r9, [rbp - 0x1b0]
0x100740e7e: mov rdi, r14
0x100740e81: mov rsi, qword ptr [rbp - 0x120]
0x100740e88: vmovaps xmm0, xmm2
0x100740e8c: mov rdx, r15
0x100740e8f: mov rcx, r12
0x100740e92: vmovss xmm1, dword ptr [rbp - 0xd0]
0x100740e9a: vzeroupper 
0x100740e9d: call 0x10073afd0 ; 0x10073afd0
0x100740ea2: vmovaps xmm0, xmmword ptr [r14 + 0x2f0]
0x100740eab: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x1c0]
0x100740eb3: vmovaps xmmword ptr [rbp - 0x170], xmm0
0x100740ebb: lea rsi, [rbp - 0x170]
0x100740ec2: mov rdi, r14
0x100740ec5: vmovaps xmm0, xmmword ptr [rbp - 0x110]
0x100740ecd: mov edx, ebx
0x100740ecf: mov rcx, r15
0x100740ed2: call 0x10073d880 ; 0x10073d880
0x100740ed7: vmovaps xmm0, xmmword ptr [r14 + 0x2f0]
0x100740ee0: vmovaps xmmword ptr [r14 + 0x300], xmm0
0x100740ee9: vmovaps xmm2, xmmword ptr [rbp - 0x1b0]
0x100740ef1: vmovaps xmm1, xmmword ptr [rbp - 0x1a0]
0x100740ef9: vmovaps xmm0, xmmword ptr [rbp - 0x190]
0x100740f01: vxorps xmm3, xmm3, xmm3
0x100740f05: vblendps xmm4, xmm2, xmm3, 8
0x100740f0b: vblendps xmm5, xmm1, xmm3, 8
0x100740f11: vblendps xmm6, xmm0, xmm3, 8
0x100740f17: vxorps xmm8, xmm8, xmm8
0x100740f1c: vmovaps xmm3, xmmword ptr [rbp - 0x170]
0x100740f24: vmovss xmm7, dword ptr [rip + 0x364194] ; 0x100aa50c0
0x100740f2c: vinsertps xmm7, xmm3, xmm7, 0x30
0x100740f32: vmovaps xmmword ptr [r14 + 0x30], xmm4
0x100740f38: vmovaps xmmword ptr [r14 + 0x40], xmm5
0x100740f3e: vmovaps xmmword ptr [r14 + 0x50], xmm6
0x100740f44: vmovaps xmmword ptr [r14 + 0x60], xmm7
0x100740f4a: mov eax, dword ptr [r14 + 0x2c0]
0x100740f51: mov dword ptr [r14 + 0x24], eax
0x100740f55: movabs rcx, 0x3f8000003f800000
0x100740f5f: mov qword ptr [r14 + 0x70], rcx
0x100740f63: mov dword ptr [r14 + 0x21c], 0
0x100740f6e: mov byte ptr [r14 + 0x220], 0
0x100740f76: mov word ptr [r14 + 0x1fc], 0
0x100740f80: mov qword ptr [r14 + 0x1f4], 0
0x100740f8b: mov word ptr [r14 + 0x208], 0
0x100740f95: mov qword ptr [r14 + 0x200], 0
0x100740fa0: mov qword ptr [r14 + 0x211], 0
0x100740fab: mov qword ptr [r14 + 0x20c], 0
0x100740fb6: vmovaps xmm4, xmmword ptr [rip + 0x399342] ; 0x100ada300
0x100740fbe: vmovups xmmword ptr [r14 + 0x224], xmm4
0x100740fc7: mov dword ptr [r14 + 0x234], 0x44fa0000
0x100740fd2: mov dword ptr [r14 + 0x238], 0x3f800000
0x100740fdd: mov byte ptr [r14 + 0x1f0], 0
0x100740fe5: mov byte ptr [r14 + 0x23c], 0
0x100740fed: vmovaps xmmword ptr [r14 + 0x390], xmm8
0x100740ff6: mov dword ptr [r14 + 0x3a0], 0
0x100741001: mov byte ptr [r14 + 0x23d], 0
0x100741009: vmovshdup xmm4, xmm3
0x10074100d: vucomiss xmm3, xmm4
0x100741011: jp 0x100741336
0x100741017: vpermilpd xmm4, xmm3, 1
0x10074101d: vucomiss xmm4, xmm4
0x100741021: jp 0x100741336
0x100741027: vmovshdup xmm3, xmm2
0x10074102b: vucomiss xmm2, xmm3
0x10074102f: jp 0x100741317
0x100741035: vpermilpd xmm2, xmm2, 1
0x10074103b: vucomiss xmm2, xmm2
0x10074103f: jp 0x100741317
0x100741045: vmovshdup xmm2, xmm1
0x100741049: vucomiss xmm1, xmm2
0x10074104d: jp 0x100741317
0x100741053: vpermilpd xmm1, xmm1, 1
0x100741059: vucomiss xmm1, xmm1
0x10074105d: jp 0x100741317
0x100741063: vmovshdup xmm1, xmm0
0x100741067: vucomiss xmm0, xmm1
0x10074106b: jp 0x100741317
0x100741071: vpermilpd xmm0, xmm0, 1
0x100741077: vucomiss xmm0, xmm0
0x10074107b: jp 0x100741317
0x100741081: vmovd xmm0, eax
0x100741085: vucomiss xmm0, xmm0
0x100741089: jp 0x10074137a
0x10074108f: mov rax, qword ptr [rip + 0x4cc842] ; 0x100c0d8d8
0x100741096: mov rax, qword ptr [rax]
0x100741099: cmp rax, qword ptr [rbp - 0x30]
0x10074109d: jne 0x100741312
0x1007410a3: add rsp, 0x408
0x1007410aa: pop rbx
0x1007410ab: pop r12
0x1007410ad: pop r13
0x1007410af: pop r14
0x1007410b1: pop r15
0x1007410b3: pop rbp
0x1007410b4: ret 
0x1007410b5: vmovss xmm0, dword ptr [rbp - 0xdc]
0x1007410bd: vucomiss xmm0, dword ptr [rip + 0x363ffb] ; 0x100aa50c0
0x1007410c5: jne 0x10074126f
0x1007410cb: jp 0x10074126f
0x1007410d1: vmovaps xmm0, xmmword ptr [r13 + 0x50]
0x1007410d7: vmovddup xmm1, qword ptr [rip + 0x3667f9] ; 0x100aa78d8
0x1007410df: vmulps xmm2, xmm0, xmm1
0x1007410e3: vmovshdup xmm3, xmm2
0x1007410e7: vaddss xmm3, xmm2, xmm3
0x1007410eb: vpermilpd xmm2, xmm2, 1
0x1007410f1: vaddss xmm2, xmm2, xmm3
0x1007410f5: vpermilps xmm2, xmm2, 0xc0
0x1007410fb: vmulps xmm1, xmm2, xmm1
0x1007410ff: vsubps xmm1, xmm0, xmm1
0x100741103: vmovaps xmmword ptr [rbp - 0x2a0], xmm1
0x10074110b: vmulps xmm2, xmm0, xmm0
0x10074110f: vmovshdup xmm3, xmm2
0x100741113: vaddss xmm3, xmm2, xmm3
0x100741117: vpermilpd xmm2, xmm2, 1
0x10074111d: vaddss xmm2, xmm2, xmm3
0x100741121: vsqrtss xmm2, xmm2, xmm2
0x100741125: vmulps xmm3, xmm1, xmm1
0x100741129: vmovshdup xmm4, xmm3
0x10074112d: vaddss xmm4, xmm3, xmm4
0x100741131: vpermilpd xmm3, xmm3, 1
0x100741137: vaddss xmm3, xmm3, xmm4
0x10074113b: vsqrtss xmm3, xmm3, xmm3
0x10074113f: vucomiss xmm3, dword ptr [rip + 0x36677d] ; 0x100aa78c4
0x100741147: vmovss dword ptr [rbp - 0xb4], xmm6
0x10074114f: jbe 0x10074115b
0x100741151: vpermilps xmm3, xmm3, 0xc0
0x100741157: vdivps xmm1, xmm1, xmm3
0x10074115b: vpermilps xmm2, xmm2, 0xc0
0x100741161: vmulps xmm1, xmm2, xmm1
0x100741165: vmovaps xmmword ptr [rbp - 0x2a0], xmm1
0x10074116d: vmovaps xmmword ptr [rbp - 0x2c0], xmm0
0x100741175: vmovaps xmm0, xmmword ptr [r13 + 0x80]
0x10074117e: vmovaps xmmword ptr [rbp - 0x2b0], xmm0
0x100741186: lea rdi, [rbp - 0x2a0]
0x10074118d: lea rsi, [rbp - 0x2c0]
0x100741194: lea rdx, [rbp - 0x2b0]
0x10074119b: call 0x100656090 ; 0x100656090
0x1007411a0: vaddss xmm0, xmm0, dword ptr [rip + 0x37a67c] ; 0x100abb824
0x1007411a8: vmovss xmm1, dword ptr [rip + 0x377258] ; 0x100ab8408
0x1007411b0: vmaxss xmm0, xmm1, xmm0
0x1007411b4: vmovss xmm1, dword ptr [rip + 0x36749c] ; 0x100aa8658
0x1007411bc: vminss xmm0, xmm1, xmm0
0x1007411c0: vmovaps xmm3, xmmword ptr [r13 + 0x50]
0x1007411c6: vmovss xmm2, dword ptr [rbp - 0x130]
0x1007411ce: vmulss xmm1, xmm2, dword ptr [rip + 0x366616] ; 0x100aa77ec
0x1007411d6: vsubss xmm2, xmm1, xmm2
0x1007411da: vucomiss xmm2, dword ptr [rip + 0x3666e2] ; 0x100aa78c4
0x1007411e2: vmovss xmm1, dword ptr [rip + 0x363ed6] ; 0x100aa50c0
0x1007411ea: ja 0x1007411fe
0x1007411ec: vmovss xmm4, dword ptr [rip + 0x3683dc] ; 0x100aa95d0
0x1007411f4: vucomiss xmm4, xmm2
0x1007411f8: vmovaps xmm4, xmm1
0x1007411fc: jbe 0x100741224
0x1007411fe: vmulps xmm3, xmm3, xmm3
0x100741202: vpermilpd xmm4, xmm3, 1
0x100741208: vmovshdup xmm5, xmm3
0x10074120c: vaddss xmm3, xmm3, xmm5
0x100741210: vaddss xmm3, xmm4, xmm3
0x100741214: vsqrtss xmm3, xmm3, xmm3
0x100741218: vsubss xmm3, xmm3, dword ptr [rbp - 0x130]
0x100741220: vdivss xmm4, xmm3, xmm2
0x100741224: vxorps xmm2, xmm2, xmm2
0x100741228: vmaxss xmm3, xmm2, xmm4
0x10074122c: vminss xmm3, xmm1, xmm3
0x100741230: vsubss xmm1, xmm1, xmm3
0x100741234: vmulss xmm1, xmm1, xmm2
0x100741238: vaddss xmm1, xmm3, xmm1
0x10074123c: vmulss xmm1, xmm1, dword ptr [r14 + 0x2a0]
0x100741245: vmulss xmm1, xmm1, dword ptr [r14 + 0x2c4]
0x10074124e: vaddss xmm3, xmm0, xmm1
0x100741252: vmovaps xmm0, xmmword ptr [rbp - 0xf0]
0x10074125a: vmovss xmm1, dword ptr [rbp - 0xf8]
0x100741262: vmovss xmm6, dword ptr [rbp - 0xb4]
0x10074126a: jmp 0x1007406a5 ; 0x1007406a5
0x10074126f: vmovss xmm0, dword ptr [r14 + 0x2a0]
0x100741278: vmulss xmm0, xmm0, dword ptr [r14 + 0x2c4]
0x100741281: vmulss xmm0, xmm0, dword ptr [rip + 0x36332f] ; 0x100aa45b8
0x100741289: vmovaps xmm3, xmmword ptr [r13 + 0x50]
0x10074128f: vmovss xmm7, dword ptr [rbp - 0x124]
0x100741297: vmovss xmm1, dword ptr [rbp - 0x15c]
0x10074129f: vsubss xmm2, xmm1, xmm7
0x1007412a3: vucomiss xmm2, dword ptr [rip + 0x366619] ; 0x100aa78c4
0x1007412ab: vmovss xmm1, dword ptr [rip + 0x363e0d] ; 0x100aa50c0
0x1007412b3: ja 0x1007412c7
0x1007412b5: vmovss xmm4, dword ptr [rip + 0x368313] ; 0x100aa95d0
0x1007412bd: vucomiss xmm4, xmm2
0x1007412c1: vmovaps xmm4, xmm1
0x1007412c5: jbe 0x1007412e9
0x1007412c7: vmulps xmm3, xmm3, xmm3
0x1007412cb: vpermilpd xmm4, xmm3, 1
0x1007412d1: vmovshdup xmm5, xmm3
0x1007412d5: vaddss xmm3, xmm3, xmm5
0x1007412d9: vaddss xmm3, xmm4, xmm3
0x1007412dd: vsqrtss xmm3, xmm3, xmm3
0x1007412e1: vsubss xmm3, xmm3, xmm7
0x1007412e5: vdivss xmm4, xmm3, xmm2
0x1007412e9: vxorps xmm2, xmm2, xmm2
0x1007412ed: vmaxss xmm3, xmm2, xmm4
0x1007412f1: vminss xmm3, xmm1, xmm3
0x1007412f5: vsubss xmm1, xmm1, xmm3
0x1007412f9: vmulss xmm1, xmm1, xmm2
0x1007412fd: vmulss xmm2, xmm3, dword ptr [rip + 0x3632b3] ; 0x100aa45b8
0x100741305: vaddss xmm1, xmm2, xmm1
0x100741309: vmulss xmm3, xmm0, xmm1
0x10074130d: jmp 0x100740695 ; 0x100740695
0x100741312: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100741317: lea rdi, [rip + 0x43cc10] ; 0x100b7df2e !isNan( m_state.mat )
0x10074131e: lea rsi, [rip + 0x45c049] ; 0x100b9d36e WhiskerCamera.cpp
0x100741325: mov edx, 0x561
0x10074132a: mov ecx, 3
0x10074132f: call 0x1007e5f70 ; 0x1007e5f70
0x100741334: ud2 
0x100741336: vcvtss2sd xmm0, xmm3, xmm3
0x10074133a: vmovss xmm1, dword ptr [rbp - 0x16c]
0x100741342: vmovss xmm2, dword ptr [rbp - 0x168]
0x10074134a: vcvtss2sd xmm1, xmm1, xmm1
0x10074134e: vcvtss2sd xmm2, xmm2, xmm2
0x100741352: lea rdi, [rip + 0x45c18b] ; 0x100b9d4e4 !isNan( eyeShakePos )
0x100741359: lea rsi, [rip + 0x45c00e] ; 0x100b9d36e WhiskerCamera.cpp
0x100741360: lea r8, [rip + 0x45c193] ; 0x100b9d4fa %f %f %f
0x100741367: mov edx, 0x560
0x10074136c: mov ecx, 4
0x100741371: mov al, 3
0x100741373: call 0x1007e6030 ; 0x1007e6030
0x100741378: ud2 
0x10074137a: lea rdi, [rip + 0x43cbc3] ; 0x100b7df44 !Math::isNan( m_state.fov )
0x100741381: lea rsi, [rip + 0x45bfe6] ; 0x100b9d36e WhiskerCamera.cpp
0x100741388: mov edx, 0x562
0x10074138d: mov ecx, 3
0x100741392: call 0x1007e5f70 ; 0x1007e5f70
0x100741397: ud2 
0x100741399: nop dword ptr [rax]
