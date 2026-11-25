0x10034f1c0: push rbp
0x10034f1c1: mov rbp, rsp
0x10034f1c4: push r15
0x10034f1c6: push r14
0x10034f1c8: push r13
0x10034f1ca: push r12
0x10034f1cc: push rbx
0x10034f1cd: sub rsp, 0x78
0x10034f1d1: mov qword ptr [rbp - 0x30], rdx
0x10034f1d5: mov r15, rsi
0x10034f1d8: mov r14, rdi
0x10034f1db: lea rdi, [rbp - 0x90]
0x10034f1e2: call 0x1007c2530 ; 0x1007c2530
0x10034f1e7: call 0x10079ac90 ; 0x10079ac90
0x10034f1ec: lea rdx, [rip + 0x832ab0] ; 0x100b81ca3 GrassNorTex1
0x10034f1f3: mov rdi, r15
0x10034f1f6: mov rsi, rax
0x10034f1f9: call 0x1007c4360 ; 0x1007c4360
0x10034f1fe: test rax, rax
0x10034f201: je 0x10034f214
0x10034f203: lea rsi, [rbp - 0x90]
0x10034f20a: mov rdi, rax
0x10034f20d: call 0x1007c2310 ; 0x1007c2310
0x10034f212: jmp 0x10034f22c ; 0x10034f22c
0x10034f214: call 0x10079ac90 ; 0x10079ac90
0x10034f219: mov rsi, qword ptr [rax + 8]
0x10034f21d: lea rdx, [rip + 0x832a7f] ; 0x100b81ca3 GrassNorTex1
0x10034f224: mov rdi, r15
0x10034f227: call 0x1007c4640 ; 0x1007c4640
0x10034f22c: call 0x1007c6c20 ; 0x1007c6c20
0x10034f231: lea rcx, [rip + 0x1cf9918] ; 0x102048b50
0x10034f238: mov rdx, qword ptr [rcx]
0x10034f23b: mov esi, 0x1fffe
0x10034f240: mov ecx, 2
0x10034f245: mov rdi, rax
0x10034f248: call 0x100795530 ; 0x100795530
0x10034f24d: mov rbx, rax
0x10034f250: vmovdqa ymm0, ymmword ptr [rip + 0x76dac8] ; 0x100abcd20
0x10034f258: mov ecx, 0x70
0x10034f25d: vmovdqa xmm8, xmmword ptr [rip + 0x762b3b] ; 0x100ab1da0
0x10034f265: vmovdqa xmm10, xmmword ptr [rip + 0x766433] ; 0x100ab56a0  
0x10034f26d: vmovdqa xmm13, xmmword ptr [rip + 0x76643b] ; 0x100ab56b0 0
0x10034f275: vmovdqa xmm9, xmmword ptr [rip + 0x766443] ; 0x100ab56c0 @
0x10034f27d: vmovdqa xmm12, xmmword ptr [rip + 0x76644b] ; 0x100ab56d0 P
0x10034f285: vmovdqa xmm14, xmmword ptr [rip + 0x766453] ; 0x100ab56e0 `
0x10034f28d: vmovdqa xmm7, xmmword ptr [rip + 0x76645b] ; 0x100ab56f0 p
0x10034f295: vmovdqa xmm1, xmmword ptr [rip + 0x766463] ; 0x100ab5700
0x10034f29d: jmp 0x10034f307 ; 0x10034f307
0x10034f29f: nop 
0x10034f2a0: vpaddw xmm2, xmm4, xmm9
0x10034f2a5: vpaddw xmm3, xmm0, xmm9
0x10034f2aa: vinsertf128 ymm2, ymm3, xmm2, 1
0x10034f2b0: vpaddw xmm3, xmm4, xmm12
0x10034f2b5: vpaddw xmm5, xmm0, xmm12
0x10034f2ba: vinsertf128 ymm3, ymm5, xmm3, 1
0x10034f2c0: vpaddw xmm5, xmm4, xmm14
0x10034f2c5: vpaddw xmm11, xmm0, xmm14
0x10034f2ca: vinsertf128 ymm5, ymm11, xmm5, 1
0x10034f2d0: vpaddw xmm6, xmm4, xmm7
0x10034f2d4: vpaddw xmm11, xmm0, xmm7
0x10034f2d8: vinsertf128 ymm6, ymm11, xmm6, 1
0x10034f2de: vmovups ymmword ptr [rbx + rcx*2 - 0x60], ymm2
0x10034f2e4: vmovups ymmword ptr [rbx + rcx*2 - 0x40], ymm3
0x10034f2ea: vmovups ymmword ptr [rbx + rcx*2 - 0x20], ymm5
0x10034f2f0: vmovups ymmword ptr [rbx + rcx*2], ymm6
0x10034f2f5: vpaddw xmm2, xmm4, xmm1
0x10034f2f9: vpaddw xmm0, xmm0, xmm1
0x10034f2fd: vinsertf128 ymm0, ymm0, xmm2, 1
0x10034f303: sub rcx, -0x80
0x10034f307: vextractf128 xmm4, ymm0, 1
0x10034f30d: vpaddw xmm2, xmm4, xmm8
0x10034f312: vpaddw xmm11, xmm0, xmm8
0x10034f317: vinsertf128 ymm2, ymm11, xmm2, 1
0x10034f31d: vpaddw xmm5, xmm4, xmm10
0x10034f322: vpaddw xmm11, xmm0, xmm10
0x10034f327: vinsertf128 ymm5, ymm11, xmm5, 1
0x10034f32d: vpaddw xmm3, xmm4, xmm13
0x10034f332: vpaddw xmm11, xmm0, xmm13
0x10034f337: vinsertf128 ymm3, ymm11, xmm3, 1
0x10034f33d: vmovdqu ymmword ptr [rbx + rcx*2 - 0xe0], ymm0
0x10034f346: vmovups ymmword ptr [rbx + rcx*2 - 0xc0], ymm2
0x10034f34f: vmovups ymmword ptr [rbx + rcx*2 - 0xa0], ymm5
0x10034f358: vmovups ymmword ptr [rbx + rcx*2 - 0x80], ymm3
0x10034f35e: cmp rcx, 0xfff0
0x10034f365: jne 0x10034f2a0
0x10034f36b: movabs rax, 0xffc3ffc2ffc1ffc0
0x10034f375: mov qword ptr [rbx + 0x1ff80], rax
0x10034f37c: movabs rax, 0xffc7ffc6ffc5ffc4
0x10034f386: mov qword ptr [rbx + 0x1ff88], rax
0x10034f38d: movabs rax, 0xffcbffcaffc9ffc8
0x10034f397: mov qword ptr [rbx + 0x1ff90], rax
0x10034f39e: movabs rax, 0xffcfffceffcdffcc
0x10034f3a8: mov qword ptr [rbx + 0x1ff98], rax
0x10034f3af: mov dword ptr [rbx + 0x1ffa0], 0xffd1ffd0
0x10034f3b9: movabs rax, 0xffd5ffd4ffd3ffd2
0x10034f3c3: mov qword ptr [rbx + 0x1ffa4], rax
0x10034f3ca: movabs rax, 0xffd9ffd8ffd7ffd6
0x10034f3d4: mov qword ptr [rbx + 0x1ffac], rax
0x10034f3db: movabs rax, 0xffddffdcffdbffda
0x10034f3e5: mov qword ptr [rbx + 0x1ffb4], rax
0x10034f3ec: movabs rax, 0xffe1ffe0ffdfffde
0x10034f3f6: mov qword ptr [rbx + 0x1ffbc], rax
0x10034f3fd: movabs rax, 0xffe5ffe4ffe3ffe2
0x10034f407: mov qword ptr [rbx + 0x1ffc4], rax
0x10034f40e: mov dword ptr [rbx + 0x1ffcc], 0xffe7ffe6
0x10034f418: movabs rax, 0xffebffeaffe9ffe8
0x10034f422: mov qword ptr [rbx + 0x1ffd0], rax
0x10034f429: mov dword ptr [rbx + 0x1ffd8], 0xffedffec
0x10034f433: movabs rax, 0xfff1fff0ffefffee
0x10034f43d: mov qword ptr [rbx + 0x1ffdc], rax
0x10034f444: movabs rax, 0xfff5fff4fff3fff2
0x10034f44e: mov qword ptr [rbx + 0x1ffe4], rax
0x10034f455: mov dword ptr [rbx + 0x1ffec], 0xfff7fff6
0x10034f45f: mov word ptr [rbx + 0x1fff0], 0xfff8
0x10034f468: mov word ptr [rbx + 0x1fff2], 0xfff9
0x10034f471: mov word ptr [rbx + 0x1fff4], 0xfffa
0x10034f47a: mov word ptr [rbx + 0x1fff6], 0xfffb
0x10034f483: mov word ptr [rbx + 0x1fff8], 0xfffc
0x10034f48c: mov word ptr [rbx + 0x1fffa], 0xfffd
0x10034f495: mov word ptr [rbx + 0x1fffc], 0xfffe
0x10034f49e: lea r13, [r14 + 0x10]
0x10034f4a2: lea rsi, [rip + 0x8277b6] ; 0x100b76c5f Flowers
0x10034f4a9: mov edx, 0xffff
0x10034f4ae: mov rdi, r13
0x10034f4b1: vzeroupper 
0x10034f4b4: call 0x1007f53c0 ; 0x1007f53c0
0x10034f4b9: lea rcx, [rbp - 0x48]
0x10034f4bd: vmovdqa ymm0, ymmword ptr [rip + 0x76d87b] ; 0x100abcd40
0x10034f4c5: vmovdqu ymmword ptr [rbp - 0x60], ymm0
0x10034f4ca: movabs rax, 0x1800000002
0x10034f4d4: mov qword ptr [rbp - 0x40], rax
0x10034f4d8: movabs rax, 0xe0000000d
0x10034f4e2: mov qword ptr [rbp - 0x38], rax
0x10034f4e6: mov qword ptr [rsp + 8], 0
0x10034f4ef: mov dword ptr [rsp], 0
0x10034f4f6: lea rdx, [rbp - 0x60]
0x10034f4fa: mov esi, 0
0x10034f4ff: mov r8d, 6
0x10034f505: mov r9d, 2
0x10034f50b: mov rdi, r13
0x10034f50e: vzeroupper 
0x10034f511: call 0x1007f5430 ; 0x1007f5430
0x10034f516: mov esi, 0
0x10034f51b: mov edx, 0x11
0x10034f520: mov ecx, 1
0x10034f525: mov r8d, 0xffff
0x10034f52b: mov rdi, r13
0x10034f52e: mov r9, rbx
0x10034f531: call 0x1007f55d0 ; 0x1007f55d0
0x10034f536: mov rdi, r13
0x10034f539: call 0x1007f5690 ; 0x1007f5690
0x10034f53e: lea rdi, [rbp - 0x60]
0x10034f542: call 0x1007c2530 ; 0x1007c2530
0x10034f547: call 0x1007d1100 ; 0x1007d1100
0x10034f54c: lea rdx, [rip + 0x83275d] ; 0x100b81cb0 Flower
0x10034f553: mov rdi, r15
0x10034f556: mov rsi, rax
0x10034f559: call 0x1007c4360 ; 0x1007c4360
0x10034f55e: mov r12, rax
0x10034f561: test r12, r12
0x10034f564: mov qword ptr [rbp - 0x70], r15
0x10034f568: je 0x10034f599
0x10034f56a: lea rsi, [rbp - 0x60]
0x10034f56e: mov rdi, r12
0x10034f571: call 0x1007c2310 ; 0x1007c2310
0x10034f576: mov rax, qword ptr [rbp - 0x60]
0x10034f57a: test rax, rax
0x10034f57d: je 0x10034f59e
0x10034f57f: mov r15, qword ptr [rax + 0x10]
0x10034f583: test byte ptr [r15 + 0xe8], 1
0x10034f58b: jne 0x10034f5ab
0x10034f58d: add r15, 0xe8
0x10034f594: inc r15
0x10034f597: jmp 0x10034f5b2 ; 0x10034f5b2
0x10034f599: xor r15d, r15d
0x10034f59c: jmp 0x10034f5b2 ; 0x10034f5b2
0x10034f59e: xor r15d, r15d
0x10034f5a1: test byte ptr [r15 + 0xe8], 1
0x10034f5a9: je 0x10034f58d
0x10034f5ab: mov r15, qword ptr [r15 + 0xf8]
0x10034f5b2: mov rdi, qword ptr [rbp - 0x30]
0x10034f5b6: mov rsi, r15
0x10034f5b9: call 0x10017e8d0 ; 0x10017e8d0
0x10034f5be: test r12, r12
0x10034f5c1: je 0x10034f89c
0x10034f5c7: test r15, r15
0x10034f5ca: je 0x10034f838
0x10034f5d0: cmp byte ptr [r15], 0
0x10034f5d4: je 0x10034f838
0x10034f5da: test rax, rax
0x10034f5dd: je 0x10034f8ce
0x10034f5e3: lea rdi, [r14 + 0x450]
0x10034f5ea: mov rcx, qword ptr [rbp - 0x60]
0x10034f5ee: test rcx, rcx
0x10034f5f1: je 0x10034f5f9
0x10034f5f3: mov rdx, qword ptr [rcx + 0x10]
0x10034f5f7: jmp 0x10034f5fb ; 0x10034f5fb
0x10034f5f9: xor edx, edx
0x10034f5fb: add rdx, 0x100
0x10034f602: mov r8d, 5
0x10034f608: mov rsi, r13
0x10034f60b: mov rcx, rax
0x10034f60e: call 0x1007f5e90 ; 0x1007f5e90
0x10034f613: cmp byte ptr [r14 + 0x97a], 1
0x10034f61b: je 0x10034f8fc
0x10034f621: mov dword ptr [r14 + 0x974], 0
0x10034f62c: cmp byte ptr [r14 + 0x988], 0
0x10034f634: je 0x10034f927
0x10034f63a: lea r15, [r14 + 0x6c0]
0x10034f641: mov rax, qword ptr [rbp - 0x90]
0x10034f648: test rax, rax
0x10034f64b: je 0x10034f661
0x10034f64d: mov rax, qword ptr [rax + 0x10]
0x10034f651: lea rdx, [rax + 0xb0]
0x10034f658: test rax, rax
0x10034f65b: cmove rdx, rax
0x10034f65f: jmp 0x10034f663 ; 0x10034f663
0x10034f661: xor edx, edx
0x10034f663: lea rsi, [rip + 0x83264d] ; 0x100b81cb7 u_windPattern
0x10034f66a: xor ecx, ecx
0x10034f66c: mov rdi, r15
0x10034f66f: call 0x1007be8b0 ; 0x1007be8b0
0x10034f674: cmp byte ptr [r14 + 0x988], 0
0x10034f67c: je 0x10034f949
0x10034f682: lea r12, [r14 + 0x455de8]
0x10034f689: lea rsi, [rip + 0x815819] ; 0x100b64ea9 u_texture
0x10034f690: xor ecx, ecx
0x10034f692: mov rdi, r15
0x10034f695: mov rdx, r12
0x10034f698: call 0x1007be8b0 ; 0x1007be8b0
0x10034f69d: lea rdi, [rbp - 0x60]
0x10034f6a1: call 0x1007c2570 ; 0x1007c2570
0x10034f6a6: lea rdi, [rbp - 0x60]
0x10034f6aa: call 0x1007c2530 ; 0x1007c2530
0x10034f6af: call 0x1007d1100 ; 0x1007d1100
0x10034f6b4: mov rdi, qword ptr [rbp - 0x70]
0x10034f6b8: lea rdx, [rip + 0x832606] ; 0x100b81cc5 FlowerShadow
0x10034f6bf: mov rsi, rax
0x10034f6c2: call 0x1007c4360 ; 0x1007c4360
0x10034f6c7: mov r15, rax
0x10034f6ca: test r15, r15
0x10034f6cd: mov qword ptr [rbp - 0x68], r12
0x10034f6d1: je 0x10034f703
0x10034f6d3: lea rsi, [rbp - 0x60]
0x10034f6d7: mov rdi, r15
0x10034f6da: call 0x1007c2310 ; 0x1007c2310
0x10034f6df: mov rax, qword ptr [rbp - 0x60]
0x10034f6e3: test rax, rax
0x10034f6e6: je 0x10034f708
0x10034f6e8: mov r12, qword ptr [rax + 0x10]
0x10034f6ec: test byte ptr [r12 + 0xe8], 1
0x10034f6f5: jne 0x10034f716
0x10034f6f7: add r12, 0xe8
0x10034f6fe: inc r12
0x10034f701: jmp 0x10034f71e ; 0x10034f71e
0x10034f703: xor r12d, r12d
0x10034f706: jmp 0x10034f71e ; 0x10034f71e
0x10034f708: xor r12d, r12d
0x10034f70b: test byte ptr [r12 + 0xe8], 1
0x10034f714: je 0x10034f6f7
0x10034f716: mov r12, qword ptr [r12 + 0xf8]
0x10034f71e: mov rdi, qword ptr [rbp - 0x30]
0x10034f722: mov rsi, r12
0x10034f725: call 0x10017e8d0 ; 0x10017e8d0
0x10034f72a: test r15, r15
0x10034f72d: je 0x10034f96b
0x10034f733: test r12, r12
0x10034f736: je 0x10034f86a
0x10034f73c: cmp byte ptr [r12], 0
0x10034f741: je 0x10034f86a
0x10034f747: test rax, rax
0x10034f74a: je 0x10034f99d
0x10034f750: lea rdi, [r14 + 0x990]
0x10034f757: mov rcx, qword ptr [rbp - 0x60]
0x10034f75b: test rcx, rcx
0x10034f75e: je 0x10034f766
0x10034f760: mov rdx, qword ptr [rcx + 0x10]
0x10034f764: jmp 0x10034f768 ; 0x10034f768
0x10034f766: xor edx, edx
0x10034f768: add rdx, 0x100
0x10034f76f: mov r8d, 5
0x10034f775: mov rsi, r13
0x10034f778: mov rcx, rax
0x10034f77b: call 0x1007f5e90 ; 0x1007f5e90
0x10034f780: cmp byte ptr [r14 + 0xeba], 1
0x10034f788: je 0x10034f9c8
0x10034f78e: mov dword ptr [r14 + 0xeb4], 0
0x10034f799: cmp byte ptr [r14 + 0xec8], 0
0x10034f7a1: je 0x10034f9f0
0x10034f7a7: lea r15, [r14 + 0xc00]
0x10034f7ae: mov rax, qword ptr [rbp - 0x90]
0x10034f7b5: test rax, rax
0x10034f7b8: je 0x10034f7ce
0x10034f7ba: mov rax, qword ptr [rax + 0x10]
0x10034f7be: lea rdx, [rax + 0xb0]
0x10034f7c5: test rax, rax
0x10034f7c8: cmove rdx, rax
0x10034f7cc: jmp 0x10034f7d0 ; 0x10034f7d0
0x10034f7ce: xor edx, edx
0x10034f7d0: lea rsi, [rip + 0x8324e0] ; 0x100b81cb7 u_windPattern
0x10034f7d7: xor ecx, ecx
0x10034f7d9: mov rdi, r15
0x10034f7dc: call 0x1007be8b0 ; 0x1007be8b0
0x10034f7e1: cmp byte ptr [r14 + 0xec8], 0
0x10034f7e9: je 0x10034fa0f
0x10034f7ef: lea rsi, [rip + 0x8156b3] ; 0x100b64ea9 u_texture
0x10034f7f6: xor ecx, ecx
0x10034f7f8: mov rdi, r15
0x10034f7fb: mov rdx, qword ptr [rbp - 0x68]
0x10034f7ff: call 0x1007be8b0 ; 0x1007be8b0
0x10034f804: lea rdi, [rbp - 0x60]
0x10034f808: call 0x1007c2570 ; 0x1007c2570
0x10034f80d: call 0x1007c6c20 ; 0x1007c6c20
0x10034f812: mov rdi, rax
0x10034f815: mov rsi, rbx
0x10034f818: call 0x100795a70 ; 0x100795a70
0x10034f81d: lea rdi, [rbp - 0x90]
0x10034f824: call 0x1007c2570 ; 0x1007c2570
0x10034f829: add rsp, 0x78
0x10034f82d: pop rbx
0x10034f82e: pop r12
0x10034f830: pop r13
0x10034f832: pop r14
0x10034f834: pop r15
0x10034f836: pop rbp
0x10034f837: ret 
0x10034f838: lea rdi, [rip + 0x8271f5] ; 0x100b76a34 renderlistName && renderlistName[0]
0x10034f83f: lea rsi, [rip + 0x8323f4] ; 0x100b81c3a FlowerBarn.cpp
0x10034f846: lea r8, [rip + 0x82720b] ; 0x100b76a58 Shader %s is missing a RenderList group
0x10034f84d: lea r9, [rip + 0x83245c] ; 0x100b81cb0 Flower
0x10034f854: mov edx, 0xbc
0x10034f859: mov ecx, 4
0x10034f85e: xor eax, eax
0x10034f860: call 0x1007e6030 ; 0x1007e6030
0x10034f865: jmp 0x10034fa2c ; 0x10034fa2c
0x10034f86a: lea rdi, [rip + 0x8271c3] ; 0x100b76a34 renderlistName && renderlistName[0]
0x10034f871: lea rsi, [rip + 0x8323c2] ; 0x100b81c3a FlowerBarn.cpp
0x10034f878: lea r8, [rip + 0x8271d9] ; 0x100b76a58 Shader %s is missing a RenderList group
0x10034f87f: lea r9, [rip + 0x83243f] ; 0x100b81cc5 FlowerShadow
0x10034f886: mov edx, 0xcd
0x10034f88b: mov ecx, 4
0x10034f890: xor eax, eax
0x10034f892: call 0x1007e6030 ; 0x1007e6030
0x10034f897: jmp 0x10034fa2c ; 0x10034fa2c
0x10034f89c: lea rdi, [rip + 0x827171] ; 0x100b76a14 foundShader
0x10034f8a3: lea rsi, [rip + 0x832390] ; 0x100b81c3a FlowerBarn.cpp
0x10034f8aa: lea r8, [rip + 0x82716f] ; 0x100b76a20 No shader called %s
0x10034f8b1: lea r9, [rip + 0x8323f8] ; 0x100b81cb0 Flower
0x10034f8b8: mov edx, 0xbb
0x10034f8bd: mov ecx, 4
0x10034f8c2: xor eax, eax
0x10034f8c4: call 0x1007e6030 ; 0x1007e6030
0x10034f8c9: jmp 0x10034fa2c ; 0x10034fa2c
0x10034f8ce: lea rdi, [rip + 0x8271ab] ; 0x100b76a80 renderList
0x10034f8d5: lea rsi, [rip + 0x83235e] ; 0x100b81c3a FlowerBarn.cpp
0x10034f8dc: lea r8, [rip + 0x8271a8] ; 0x100b76a8b No RenderList called %s
0x10034f8e3: mov edx, 0xbd
0x10034f8e8: mov ecx, 4
0x10034f8ed: xor eax, eax
0x10034f8ef: mov r9, r15
0x10034f8f2: call 0x1007e6030 ; 0x1007e6030
0x10034f8f7: jmp 0x10034fa2c ; 0x10034fa2c
0x10034f8fc: lea rdi, [rip + 0x81296e] ; 0x100b62271 !m_queued
0x10034f903: lea rsi, [rip + 0x812971] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x10034f90a: lea r8, [rip + 0x812986] ; 0x100b62297 VertexRender has already been committed!
0x10034f911: mov edx, 0x8b
0x10034f916: mov ecx, 4
0x10034f91b: xor eax, eax
0x10034f91d: call 0x1007e6030 ; 0x1007e6030
0x10034f922: jmp 0x10034fa2c ; 0x10034fa2c
0x10034f927: lea rdi, [rip + 0x8273bc] ; 0x100b76cea IsInitialized()
0x10034f92e: lea rsi, [rip + 0x812946] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x10034f935: mov edx, 0xa8
0x10034f93a: mov ecx, 3
0x10034f93f: call 0x1007e5f70 ; 0x1007e5f70
0x10034f944: jmp 0x10034fa2c ; 0x10034fa2c
0x10034f949: lea rdi, [rip + 0x82739a] ; 0x100b76cea IsInitialized()
0x10034f950: lea rsi, [rip + 0x812924] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x10034f957: mov edx, 0xa8
0x10034f95c: mov ecx, 3
0x10034f961: call 0x1007e5f70 ; 0x1007e5f70
0x10034f966: jmp 0x10034fa2c ; 0x10034fa2c
0x10034f96b: lea rdi, [rip + 0x8270a2] ; 0x100b76a14 foundShader
0x10034f972: lea rsi, [rip + 0x8322c1] ; 0x100b81c3a FlowerBarn.cpp
0x10034f979: lea r8, [rip + 0x8270a0] ; 0x100b76a20 No shader called %s
0x10034f980: lea r9, [rip + 0x83233e] ; 0x100b81cc5 FlowerShadow
0x10034f987: mov edx, 0xcc
0x10034f98c: mov ecx, 4
0x10034f991: xor eax, eax
0x10034f993: call 0x1007e6030 ; 0x1007e6030
0x10034f998: jmp 0x10034fa2c ; 0x10034fa2c
0x10034f99d: lea rdi, [rip + 0x8270dc] ; 0x100b76a80 renderList
0x10034f9a4: lea rsi, [rip + 0x83228f] ; 0x100b81c3a FlowerBarn.cpp
0x10034f9ab: lea r8, [rip + 0x8270d9] ; 0x100b76a8b No RenderList called %s
0x10034f9b2: mov edx, 0xce
0x10034f9b7: mov ecx, 4
0x10034f9bc: xor eax, eax
0x10034f9be: mov r9, r12
0x10034f9c1: call 0x1007e6030 ; 0x1007e6030
0x10034f9c6: jmp 0x10034fa2c ; 0x10034fa2c
0x10034f9c8: lea rdi, [rip + 0x8128a2] ; 0x100b62271 !m_queued
0x10034f9cf: lea rsi, [rip + 0x8128a5] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x10034f9d6: lea r8, [rip + 0x8128ba] ; 0x100b62297 VertexRender has already been committed!
0x10034f9dd: mov edx, 0x8b
0x10034f9e2: mov ecx, 4
0x10034f9e7: xor eax, eax
0x10034f9e9: call 0x1007e6030 ; 0x1007e6030
0x10034f9ee: jmp 0x10034fa2c ; 0x10034fa2c
0x10034f9f0: lea rdi, [rip + 0x8272f3] ; 0x100b76cea IsInitialized()
0x10034f9f7: lea rsi, [rip + 0x81287d] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x10034f9fe: mov edx, 0xa8
0x10034fa03: mov ecx, 3
0x10034fa08: call 0x1007e5f70 ; 0x1007e5f70
0x10034fa0d: jmp 0x10034fa2c ; 0x10034fa2c
0x10034fa0f: lea rdi, [rip + 0x8272d4] ; 0x100b76cea IsInitialized()
0x10034fa16: lea rsi, [rip + 0x81285e] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x10034fa1d: mov edx, 0xa8
0x10034fa22: mov ecx, 3
0x10034fa27: call 0x1007e5f70 ; 0x1007e5f70
0x10034fa2c: ud2 
0x10034fa2e: jmp 0x10034fa55 ; 0x10034fa55
0x10034fa30: jmp 0x10034fa55 ; 0x10034fa55
0x10034fa32: mov rdi, rax
0x10034fa35: call 0x100011bf0 ; 0x100011bf0
0x10034fa3a: jmp 0x10034fa40 ; 0x10034fa40
0x10034fa3c: jmp 0x10034fa47 ; 0x10034fa47
0x10034fa3e: jmp 0x10034fa47 ; 0x10034fa47
0x10034fa40: mov r14, rax
0x10034fa43: jmp 0x10034fa68 ; 0x10034fa68
0x10034fa45: jmp 0x10034fa47 ; 0x10034fa47
0x10034fa47: mov r14, rax
0x10034fa4a: lea rdi, [rbp - 0x60]
0x10034fa4e: call 0x1007c2570 ; 0x1007c2570
0x10034fa53: jmp 0x10034fa58 ; 0x10034fa58
0x10034fa55: mov r14, rax
0x10034fa58: call 0x1007c6c20 ; 0x1007c6c20
0x10034fa5d: mov rdi, rax
0x10034fa60: mov rsi, rbx
0x10034fa63: call 0x100795a70 ; 0x100795a70
0x10034fa68: lea rdi, [rbp - 0x90]
0x10034fa6f: call 0x1007c2570 ; 0x1007c2570
0x10034fa74: mov rdi, r14
0x10034fa77: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10034fa7c: mov rdi, rax
0x10034fa7f: call 0x100011bf0 ; 0x100011bf0
0x10034fa84: nop word ptr cs:[rax + rax]
