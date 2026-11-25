0x100060ec0: push rbp
0x100060ec1: mov rbp, rsp
0x100060ec4: push r15
0x100060ec6: push r14
0x100060ec8: push r13
0x100060eca: push r12
0x100060ecc: push rbx
0x100060ecd: and rsp, 0xffffffffffffffe0
0x100060ed1: sub rsp, 0x120
0x100060ed8: mov r14, rdi
0x100060edb: mov rax, qword ptr [rip + 0xbac9f6] ; 0x100c0d8d8
0x100060ee2: mov rax, qword ptr [rax]
0x100060ee5: mov qword ptr [rsp + 0x100], rax
0x100060eed: movabs rax, 0xffffff9f00000001
0x100060ef7: mov qword ptr [rsp + 0x10], rax
0x100060efc: mov byte ptr [rsp + 0x18], 1
0x100060f01: vxorps xmm0, xmm0, xmm0
0x100060f05: vmovups xmmword ptr [rsp + 0x20], xmm0
0x100060f0b: mov rax, qword ptr [r14 + 0x10]
0x100060f0f: xor ebx, ebx
0x100060f11: lea r12, [rsp + 0x60]
0x100060f16: lea r15, [rsp + 0x10]
0x100060f1b: lea r13, [rsp + 0x30]
0x100060f20: mov rdi, qword ptr [rax + 8]
0x100060f24: mov rcx, qword ptr [r14 + 0x18]
0x100060f28: vmovaps xmm0, xmmword ptr [rax + 0x40]
0x100060f2d: vmovaps xmmword ptr [rsp + 0x60], xmm0
0x100060f33: vmovaps xmm0, xmmword ptr [rcx + rbx]
0x100060f38: vmovaps xmmword ptr [rsp + 0x70], xmm0
0x100060f3e: vandps xmm1, xmm0, xmmword ptr [rip + 0xa470ea] ; 0x100aa8030
0x100060f46: vmaxps xmm2, xmm1, xmmword ptr [rip + 0xa470f2] ; 0x100aa8040
0x100060f4e: vblendps xmm1, xmm2, xmm1, 8
0x100060f54: vxorps xmm5, xmm5, xmm5
0x100060f58: vcmpless xmm2, xmm5, xmm0
0x100060f5d: vmovss xmm3, dword ptr [rip + 0xa4415b] ; 0x100aa50c0
0x100060f65: vmovaps xmm6, xmm3
0x100060f69: vandps xmm3, xmm2, xmm6
0x100060f6d: vmovss xmm4, dword ptr [rip + 0xa4414f] ; 0x100aa50c4
0x100060f75: vmovaps xmm7, xmm4
0x100060f79: vandnps xmm2, xmm2, xmm7
0x100060f7d: vorps xmm2, xmm2, xmm3
0x100060f81: vmovshdup xmm3, xmm0
0x100060f85: vcmpless xmm3, xmm5, xmm3
0x100060f8a: vandps xmm4, xmm3, xmm6
0x100060f8e: vandnps xmm3, xmm3, xmm7
0x100060f92: vorps xmm3, xmm3, xmm4
0x100060f96: vpermilpd xmm0, xmm0, 1
0x100060f9c: vcmpless xmm0, xmm5, xmm0
0x100060fa1: vandps xmm4, xmm0, xmm6
0x100060fa5: vandnps xmm0, xmm0, xmm7
0x100060fa9: vorps xmm0, xmm0, xmm4
0x100060fad: vinsertps xmm2, xmm2, xmm3, 0x10
0x100060fb3: vinsertps xmm0, xmm2, xmm0, 0x20
0x100060fb9: vdivps xmm0, xmm0, xmm1
0x100060fbd: vmovaps xmmword ptr [rsp + 0x80], xmm0
0x100060fc6: movabs rax, 0x4500000000000000
0x100060fd0: mov qword ptr [rsp + 0x90], rax
0x100060fd8: mov rsi, r12
0x100060fdb: mov rdx, r15
0x100060fde: mov rcx, r13
0x100060fe1: call 0x100776c50 ; 0x100776c50
0x100060fe6: mov r8, qword ptr [r14 + 0x10]
0x100060fea: mov rsi, qword ptr [r8 + 0x10]
0x100060fee: add r8, 0x40
0x100060ff2: mov r9, qword ptr [r14 + 0x18]
0x100060ff6: add r9, rbx
0x100060ff9: movzx edx, al
0x100060ffc: mov rdi, r12
0x100060fff: mov rcx, r13
0x100061002: call 0x100061680 ; 0x100061680
0x100061007: mov rax, qword ptr [r14 + 0x20]
0x10006100b: vmovaps xmm0, xmmword ptr [rsp + 0x60]
0x100061011: vmovaps xmmword ptr [rax + rbx], xmm0
0x100061016: mov rax, qword ptr [r14 + 0x10]
0x10006101a: add rbx, 0x10
0x10006101e: cmp rbx, 0x200
0x100061025: jne 0x100060f20
0x10006102b: mov rdi, rax
0x10006102e: call 0x1007e8f10 ; 0x1007e8f10
0x100061033: test eax, eax
0x100061035: jne 0x100061653
0x10006103b: vxorps ymm0, ymm0, ymm0
0x10006103f: vmovups ymmword ptr [rsp + 0xd0], ymm0
0x100061048: vmovaps ymmword ptr [rsp + 0xc0], ymm0
0x100061051: vmovaps ymmword ptr [rsp + 0xa0], ymm0
0x10006105a: vmovaps ymmword ptr [rsp + 0x80], ymm0
0x100061063: vmovaps ymmword ptr [rsp + 0x60], ymm0
0x100061069: mov rax, qword ptr [r14 + 0x10]
0x10006106d: mov ecx, dword ptr [rax + 0x30]
0x100061070: test ecx, ecx
0x100061072: je 0x1000612de
0x100061078: vcvtsi2ss xmm0, xmm8, rcx
0x10006107d: vmovss xmm1, dword ptr [rip + 0xa475c7] ; 0x100aa864c
0x100061085: vdivss xmm0, xmm1, xmm0
0x100061089: vmovss dword ptr [rsp + 0xc], xmm0
0x10006108f: xor r15d, r15d
0x100061092: nop word ptr cs:[rax + rax]
0x1000610a0: mov r12, qword ptr [rax + 0x28]
0x1000610a4: mov r13d, r15d
0x1000610a7: shl r13, 4
0x1000610ab: mov rbx, qword ptr [rax + 0x20]
0x1000610af: add rbx, r13
0x1000610b2: xor edi, edi
0x1000610b4: mov rsi, rbx
0x1000610b7: vzeroupper 
0x1000610ba: call 0x100413f50 ; 0x100413f50
0x1000610bf: vmulss xmm0, xmm0, dword ptr [rsp + 0xc]
0x1000610c5: vpermilps xmm0, xmm0, 0xc0
0x1000610cb: vmulps xmm0, xmm0, xmmword ptr [r12 + r13]
0x1000610d1: vaddps xmm0, xmm0, xmmword ptr [rsp + 0x60]
0x1000610d7: vmovaps xmmword ptr [rsp + 0x60], xmm0
0x1000610dd: mov edi, 1
0x1000610e2: mov rsi, rbx
0x1000610e5: call 0x100413f50 ; 0x100413f50
0x1000610ea: vmulss xmm0, xmm0, dword ptr [rsp + 0xc]
0x1000610f0: vpermilps xmm0, xmm0, 0xc0
0x1000610f6: vmulps xmm0, xmm0, xmmword ptr [r12 + r13]
0x1000610fc: vaddps xmm0, xmm0, xmmword ptr [rsp + 0x70]
0x100061102: vmovaps xmmword ptr [rsp + 0x70], xmm0
0x100061108: mov edi, 2
0x10006110d: mov rsi, rbx
0x100061110: call 0x100413f50 ; 0x100413f50
0x100061115: vmulss xmm0, xmm0, dword ptr [rsp + 0xc]
0x10006111b: vpermilps xmm0, xmm0, 0xc0
0x100061121: vmulps xmm0, xmm0, xmmword ptr [r12 + r13]
0x100061127: vaddps xmm0, xmm0, xmmword ptr [rsp + 0x80]
0x100061130: vmovaps xmmword ptr [rsp + 0x80], xmm0
0x100061139: mov edi, 3
0x10006113e: mov rsi, rbx
0x100061141: call 0x100413f50 ; 0x100413f50
0x100061146: vmulss xmm0, xmm0, dword ptr [rsp + 0xc]
0x10006114c: vpermilps xmm0, xmm0, 0xc0
0x100061152: vmulps xmm0, xmm0, xmmword ptr [r12 + r13]
0x100061158: vaddps xmm0, xmm0, xmmword ptr [rsp + 0x90]
0x100061161: vmovaps xmmword ptr [rsp + 0x90], xmm0
0x10006116a: mov edi, 4
0x10006116f: mov rsi, rbx
0x100061172: call 0x100413f50 ; 0x100413f50
0x100061177: vmulss xmm0, xmm0, dword ptr [rsp + 0xc]
0x10006117d: vpermilps xmm0, xmm0, 0xc0
0x100061183: vmulps xmm0, xmm0, xmmword ptr [r12 + r13]
0x100061189: vaddps xmm0, xmm0, xmmword ptr [rsp + 0xa0]
0x100061192: vmovaps xmmword ptr [rsp + 0xa0], xmm0
0x10006119b: mov edi, 5
0x1000611a0: mov rsi, rbx
0x1000611a3: call 0x100413f50 ; 0x100413f50
0x1000611a8: vmulss xmm0, xmm0, dword ptr [rsp + 0xc]
0x1000611ae: vpermilps xmm0, xmm0, 0xc0
0x1000611b4: vmulps xmm0, xmm0, xmmword ptr [r12 + r13]
0x1000611ba: vaddps xmm0, xmm0, xmmword ptr [rsp + 0xb0]
0x1000611c3: vmovaps xmmword ptr [rsp + 0xb0], xmm0
0x1000611cc: mov edi, 6
0x1000611d1: mov rsi, rbx
0x1000611d4: call 0x100413f50 ; 0x100413f50
0x1000611d9: vmulss xmm0, xmm0, dword ptr [rsp + 0xc]
0x1000611df: vpermilps xmm0, xmm0, 0xc0
0x1000611e5: vmulps xmm0, xmm0, xmmword ptr [r12 + r13]
0x1000611eb: vaddps xmm0, xmm0, xmmword ptr [rsp + 0xc0]
0x1000611f4: vmovaps xmmword ptr [rsp + 0xc0], xmm0
0x1000611fd: mov edi, 7
0x100061202: mov rsi, rbx
0x100061205: call 0x100413f50 ; 0x100413f50
0x10006120a: vmulss xmm0, xmm0, dword ptr [rsp + 0xc]
0x100061210: vpermilps xmm0, xmm0, 0xc0
0x100061216: vmulps xmm0, xmm0, xmmword ptr [r12 + r13]
0x10006121c: vaddps xmm0, xmm0, xmmword ptr [rsp + 0xd0]
0x100061225: vmovaps xmmword ptr [rsp + 0xd0], xmm0
0x10006122e: mov edi, 8
0x100061233: mov rsi, rbx
0x100061236: call 0x100413f50 ; 0x100413f50
0x10006123b: vmulss xmm0, xmm0, dword ptr [rsp + 0xc]
0x100061241: vpermilps xmm0, xmm0, 0xc0
0x100061247: vmulps xmm0, xmm0, xmmword ptr [r12 + r13]
0x10006124d: vaddps xmm0, xmm0, xmmword ptr [rsp + 0xe0]
0x100061256: vmovaps xmmword ptr [rsp + 0xe0], xmm0
0x10006125f: inc r15d
0x100061262: mov rax, qword ptr [r14 + 0x10]
0x100061266: cmp r15d, dword ptr [rax + 0x30]
0x10006126a: jb 0x1000610a0
0x100061270: vmovsd xmm0, qword ptr [rsp + 0x60]
0x100061276: vmovsd xmm1, qword ptr [rsp + 0x74]
0x10006127c: vinsertps xmm0, xmm0, dword ptr [rsp + 0x68], 0x20
0x100061284: vinsertps xmm0, xmm0, dword ptr [rsp + 0x70], 0x30
0x10006128c: vinsertps xmm1, xmm1, dword ptr [rsp + 0x80], 0x20
0x100061297: vinsertps xmm1, xmm1, dword ptr [rsp + 0x84], 0x30
0x1000612a2: vinsertf128 ymm0, ymm0, xmm1, 1
0x1000612a8: vmulps ymm0, ymm0, ymmword ptr [rip + 0xa46f10] ; 0x100aa81c0
0x1000612b0: vmovss xmm1, dword ptr [rip + 0xa47350] ; 0x100aa8608
0x1000612b8: vmulss xmm4, xmm1, dword ptr [rsp + 0x88]
0x1000612c1: vmulss xmm3, xmm1, dword ptr [rsp + 0x90]
0x1000612ca: vmulss xmm10, xmm1, dword ptr [rsp + 0x94]
0x1000612d3: vmulss xmm8, xmm1, dword ptr [rsp + 0x98]
0x1000612dc: jmp 0x1000612f0 ; 0x1000612f0
0x1000612de: vxorps xmm8, xmm8, xmm8
0x1000612e3: vxorps xmm10, xmm10, xmm10
0x1000612e8: vxorps xmm3, xmm3, xmm3
0x1000612ec: vxorps xmm4, xmm4, xmm4
0x1000612f0: vmovaps ymm5, ymmword ptr [rip + 0xa46ee8] ; 0x100aa81e0
0x1000612f8: vmulps ymm6, ymm5, ymmword ptr [rax + 0x870]
0x100061300: vaddps ymm0, ymm6, ymm0
0x100061304: vmovups ymmword ptr [rax + 0x870], ymm0
0x10006130c: vmovss xmm0, dword ptr [rip + 0xa472f4] ; 0x100aa8608
0x100061314: vmulss xmm6, xmm0, dword ptr [rsp + 0xa0]
0x10006131d: vmulss xmm7, xmm0, dword ptr [rsp + 0xa4]
0x100061326: vmulss xmm1, xmm0, dword ptr [rsp + 0xa8]
0x10006132f: vmulps ymm9, ymm5, ymmword ptr [rax + 0x890]
0x100061337: vmulss xmm2, xmm0, dword ptr [rsp + 0xb0]
0x100061340: vinsertps xmm3, xmm4, xmm3, 0x10
0x100061346: vinsertps xmm3, xmm3, xmm10, 0x20
0x10006134c: vinsertps xmm3, xmm3, xmm8, 0x30
0x100061352: vinsertps xmm4, xmm6, xmm7, 0x10
0x100061358: vinsertps xmm1, xmm4, xmm1, 0x20
0x10006135e: vinsertps xmm1, xmm1, xmm2, 0x30
0x100061364: vinsertf128 ymm1, ymm3, xmm1, 1
0x10006136a: vaddps ymm1, ymm9, ymm1
0x10006136e: vmovups ymmword ptr [rax + 0x890], ymm1
0x100061376: vmulps ymm1, ymm5, ymmword ptr [rax + 0x8b0]
0x10006137e: vmovsd xmm2, qword ptr [rsp + 0xb4]
0x100061387: vinsertps xmm2, xmm2, dword ptr [rsp + 0xc0], 0x20
0x100061392: vinsertps xmm2, xmm2, dword ptr [rsp + 0xc4], 0x30
0x10006139d: vmovss xmm3, dword ptr [rsp + 0xc8]
0x1000613a6: vinsertps xmm3, xmm3, dword ptr [rsp + 0xd0], 0x10
0x1000613b1: vinsertps xmm3, xmm3, dword ptr [rsp + 0xd4], 0x20
0x1000613bc: vinsertps xmm3, xmm3, dword ptr [rsp + 0xd8], 0x30
0x1000613c7: vinsertf128 ymm2, ymm2, xmm3, 1
0x1000613cd: vmulps ymm2, ymm2, ymmword ptr [rip + 0xa46deb] ; 0x100aa81c0
0x1000613d5: vaddps ymm1, ymm1, ymm2
0x1000613d9: vmovups ymmword ptr [rax + 0x8b0], ymm1
0x1000613e1: vmovss xmm1, dword ptr [rip + 0xa47267] ; 0x100aa8650 33s?
0x1000613e9: vmulss xmm2, xmm1, dword ptr [rax + 0x8d0]
0x1000613f1: vmulss xmm3, xmm0, dword ptr [rsp + 0xe0]
0x1000613fa: vaddss xmm2, xmm2, xmm3
0x1000613fe: vmovss dword ptr [rax + 0x8d0], xmm2
0x100061406: vmulss xmm2, xmm1, dword ptr [rax + 0x8d4]
0x10006140e: vmulss xmm3, xmm0, dword ptr [rsp + 0xe4]
0x100061417: vaddss xmm2, xmm2, xmm3
0x10006141b: vmovss dword ptr [rax + 0x8d4], xmm2
0x100061423: vmulss xmm1, xmm1, dword ptr [rax + 0x8d8]
0x10006142b: vmulss xmm0, xmm0, dword ptr [rsp + 0xe8]
0x100061434: vaddss xmm0, xmm1, xmm0
0x100061438: vmovss dword ptr [rax + 0x8d8], xmm0
0x100061440: mov rsi, qword ptr [r14 + 0x10]
0x100061444: cmp dword ptr [rsi + 0x30], 0
0x100061448: je 0x1000614f6
0x10006144e: xor eax, eax
0x100061450: vmovss xmm0, dword ptr [rip + 0xa471fc] ; 0x100aa8654
0x100061458: vmovss xmm1, dword ptr [rip + 0xa4645c] ; 0x100aa78bc
0x100061460: vmovaps xmm2, xmmword ptr [rip + 0xa46be8] ; 0x100aa8050
0x100061468: vmovaps xmm3, xmmword ptr [rip + 0xa46bf0] ; 0x100aa8060
0x100061470: mov rcx, qword ptr [rsi + 0x18]
0x100061474: mov rdx, qword ptr [rsi + 0x28]
0x100061478: mov edi, eax
0x10006147a: shl rdi, 4
0x10006147e: vmovaps xmm4, xmmword ptr [rdx + rdi]
0x100061483: vmovaps xmm5, xmmword ptr [rcx + rdi]
0x100061488: vmovshdup xmm6, xmm5
0x10006148c: vmulss xmm6, xmm6, xmm0
0x100061490: vcvttss2si rcx, xmm6
0x100061495: vpermilpd xmm6, xmm5, 1
0x10006149b: vmulss xmm6, xmm6, xmm0
0x10006149f: vcvttss2si rdx, xmm6
0x1000614a4: shl edx, 5
0x1000614a7: add edx, ecx
0x1000614a9: vcvtsi2ss xmm6, xmm11, rdx
0x1000614ae: vmulss xmm5, xmm5, xmm0
0x1000614b2: vmulss xmm5, xmm5, xmm0
0x1000614b6: vaddss xmm5, xmm5, xmm6
0x1000614ba: vmulss xmm5, xmm5, xmm1
0x1000614be: vcvttss2si rcx, xmm5
0x1000614c3: mov ecx, ecx
0x1000614c5: vmovaps xmm5, xmmword ptr [rsi + rcx*4 + 0x8e0]
0x1000614ce: vsubps xmm4, xmm4, xmm5
0x1000614d2: vmulps xmm4, xmm4, xmm2
0x1000614d6: vaddps xmm4, xmm5, xmm4
0x1000614da: vmaxps xmm4, xmm4, xmm3
0x1000614de: vmovaps xmmword ptr [rsi + rcx*4 + 0x8e0], xmm4
0x1000614e7: inc eax
0x1000614e9: mov rsi, qword ptr [r14 + 0x10]
0x1000614ed: cmp eax, dword ptr [rsi + 0x30]
0x1000614f0: jb 0x100061470
0x1000614f6: xor eax, eax
0x1000614f8: vmovaps xmm0, xmmword ptr [rip + 0xa46b70] ; 0x100aa8070
0x100061500: mov rcx, qword ptr [rsi + 0x50]
0x100061504: mov edx, dword ptr [rcx + rax*4]
0x100061507: mov edi, dword ptr [rcx + rax*4 + 4]
0x10006150b: shl rdx, 4
0x10006150f: vmovaps xmm1, xmmword ptr [rsi + rdx + 0x8e0]
0x100061518: shl rdi, 4
0x10006151c: vaddps xmm1, xmm1, xmmword ptr [rsi + rdi + 0x8e0]
0x100061525: mov edx, dword ptr [rcx + rax*4 + 8]
0x100061529: shl rdx, 4
0x10006152d: vaddps xmm1, xmm1, xmmword ptr [rsi + rdx + 0x8e0]
0x100061536: mov edx, dword ptr [rcx + rax*4 + 0xc]
0x10006153a: shl rdx, 4
0x10006153e: vaddps xmm1, xmm1, xmmword ptr [rsi + rdx + 0x8e0]
0x100061547: mov edx, dword ptr [rcx + rax*4 + 0x10]
0x10006154b: shl rdx, 4
0x10006154f: vaddps xmm1, xmm1, xmmword ptr [rsi + rdx + 0x8e0]
0x100061558: mov edx, dword ptr [rcx + rax*4 + 0x14]
0x10006155c: shl rdx, 4
0x100061560: vaddps xmm1, xmm1, xmmword ptr [rsi + rdx + 0x8e0]
0x100061569: mov edx, dword ptr [rcx + rax*4 + 0x18]
0x10006156d: shl rdx, 4
0x100061571: vaddps xmm1, xmm1, xmmword ptr [rsi + rdx + 0x8e0]
0x10006157a: mov edx, dword ptr [rcx + rax*4 + 0x1c]
0x10006157e: shl rdx, 4
0x100061582: vaddps xmm1, xmm1, xmmword ptr [rsi + rdx + 0x8e0]
0x10006158b: mov edx, dword ptr [rcx + rax*4 + 0x20]
0x10006158f: shl rdx, 4
0x100061593: vaddps xmm1, xmm1, xmmword ptr [rsi + rdx + 0x8e0]
0x10006159c: mov edx, dword ptr [rcx + rax*4 + 0x24]
0x1000615a0: shl rdx, 4
0x1000615a4: vaddps xmm1, xmm1, xmmword ptr [rsi + rdx + 0x8e0]
0x1000615ad: mov edx, dword ptr [rcx + rax*4 + 0x28]
0x1000615b1: shl rdx, 4
0x1000615b5: vaddps xmm1, xmm1, xmmword ptr [rsi + rdx + 0x8e0]
0x1000615be: mov edx, dword ptr [rcx + rax*4 + 0x2c]
0x1000615c2: shl rdx, 4
0x1000615c6: vaddps xmm1, xmm1, xmmword ptr [rsi + rdx + 0x8e0]
0x1000615cf: mov edx, dword ptr [rcx + rax*4 + 0x30]
0x1000615d3: shl rdx, 4
0x1000615d7: vaddps xmm1, xmm1, xmmword ptr [rsi + rdx + 0x8e0]
0x1000615e0: mov edx, dword ptr [rcx + rax*4 + 0x34]
0x1000615e4: shl rdx, 4
0x1000615e8: vaddps xmm1, xmm1, xmmword ptr [rsi + rdx + 0x8e0]
0x1000615f1: mov edx, dword ptr [rcx + rax*4 + 0x38]
0x1000615f5: shl rdx, 4
0x1000615f9: vaddps xmm1, xmm1, xmmword ptr [rsi + rdx + 0x8e0]
0x100061602: mov ecx, dword ptr [rcx + rax*4 + 0x3c]
0x100061606: shl rcx, 4
0x10006160a: vaddps xmm1, xmm1, xmmword ptr [rsi + rcx + 0x8e0]
0x100061613: vmulps xmm1, xmm1, xmm0
0x100061617: mov rcx, qword ptr [r14 + 0x10]
0x10006161b: vmovaps xmmword ptr [rcx + rax + 0x188e0], xmm1
0x100061624: mov rsi, qword ptr [r14 + 0x10]
0x100061628: add rax, 0x10
0x10006162c: cmp rax, 0x7fe0
0x100061632: jne 0x100061500
0x100061638: lea rdi, [rsi + 0x208c0]
0x10006163f: add rsi, 0x8e0
0x100061646: mov edx, 0x7ff8
0x10006164b: vzeroupper 
0x10006164e: call 0x1007ec050 ; 0x1007ec050
0x100061653: mov rax, qword ptr [rip + 0xbac27e] ; 0x100c0d8d8
0x10006165a: mov rax, qword ptr [rax]
0x10006165d: cmp rax, qword ptr [rsp + 0x100]
0x100061665: jne 0x100061676
0x100061667: lea rsp, [rbp - 0x28]
0x10006166b: pop rbx
0x10006166c: pop r12
0x10006166e: pop r13
0x100061670: pop r14
0x100061672: pop r15
0x100061674: pop rbp
0x100061675: ret 
0x100061676: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10006167b: nop dword ptr [rax + rax]
