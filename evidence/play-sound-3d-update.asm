0x100534840: push rbp
0x100534841: mov rbp, rsp
0x100534844: push r15
0x100534846: push r14
0x100534848: push rbx
0x100534849: and rsp, 0xffffffffffffffe0
0x10053484d: sub rsp, 0x260
0x100534854: mov r14, rsi
0x100534857: mov rbx, rdi
0x10053485a: mov rax, qword ptr [rip + 0x6d9077] ; 0x100c0d8d8
0x100534861: mov rax, qword ptr [rax]
0x100534864: mov qword ptr [rsp + 0x250], rax
0x10053486c: cmp byte ptr [rbx + 0x8c], 0
0x100534873: je 0x100534a52
0x100534879: vxorps ymm0, ymm0, ymm0
0x10053487d: vmovaps ymmword ptr [rsp + 0x60], ymm0
0x100534883: vmovaps ymmword ptr [rsp + 0x40], ymm0
0x100534889: vmovaps ymmword ptr [rsp + 0x20], ymm0
0x10053488f: vmovaps ymmword ptr [rsp], ymm0
0x100534894: mov rax, qword ptr [rbx + 0x58]
0x100534898: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x10053489d: vmovaps xmmword ptr [rsp + 0x10], xmm0
0x1005348a3: mov dword ptr [rsp + 0x70], 0x20
0x1005348ab: mov rdi, qword ptr [rbx + 0x78]
0x1005348af: test rdi, rdi
0x1005348b2: je 0x1005348da
0x1005348b4: mov r14, qword ptr [rbx + 0x80]
0x1005348bb: test r14, r14
0x1005348be: je 0x1005348da
0x1005348c0: mov rax, qword ptr [rdi]
0x1005348c3: vzeroupper 
0x1005348c6: call qword ptr [rax]
0x1005348c8: cmp r14, rax
0x1005348cb: jne 0x1005348da
0x1005348cd: mov rdi, qword ptr [rbx + 0x78]
0x1005348d1: mov rax, qword ptr [rdi]
0x1005348d4: mov rsi, rsp
0x1005348d7: call qword ptr [rax + 0x68]
0x1005348da: cmp qword ptr [rbx + 0x70], 0
0x1005348df: je 0x100534a0e
0x1005348e5: mov rdi, qword ptr [rbx + 0x78]
0x1005348e9: test rdi, rdi
0x1005348ec: je 0x100534a42
0x1005348f2: mov r14, qword ptr [rbx + 0x80]
0x1005348f9: test r14, r14
0x1005348fc: je 0x100534a0e
0x100534902: mov rax, qword ptr [rdi]
0x100534905: vzeroupper 
0x100534908: call qword ptr [rax]
0x10053490a: cmp r14, rax
0x10053490d: jne 0x100534a0e
0x100534913: mov rdi, qword ptr [rbx + 0x78]
0x100534917: mov rax, qword ptr [rdi]
0x10053491a: call qword ptr [rax + 8]
0x10053491d: mov rcx, qword ptr [rax]
0x100534920: mov rdi, rax
0x100534923: call qword ptr [rcx + 0x48]
0x100534926: test al, al
0x100534928: je 0x100534a0e
0x10053492e: mov rax, qword ptr [rbx + 0x70]
0x100534932: vmovss xmm0, dword ptr [rax + 0x108c]
0x10053493a: vdivss xmm1, xmm0, dword ptr [rax + 0x18]
0x10053493f: vxorps ymm2, ymm2, ymm2
0x100534943: vmovaps ymmword ptr [rsp], ymm2
0x100534948: vmovaps ymmword ptr [rsp + 0x20], ymm2
0x10053494e: vmovups ymmword ptr [rsp + 0x18c], ymm2
0x100534957: vmovaps ymmword ptr [rsp + 0x180], ymm2
0x100534960: vmovaps ymmword ptr [rsp + 0x160], ymm2
0x100534969: vmovaps ymmword ptr [rsp + 0x140], ymm2
0x100534972: vmovaps ymmword ptr [rsp + 0x120], ymm2
0x10053497b: vmovaps ymmword ptr [rsp + 0x100], ymm2
0x100534984: vmovaps ymmword ptr [rsp + 0xe0], ymm2
0x10053498d: vmovaps ymmword ptr [rsp + 0xc0], ymm2
0x100534996: vmovaps ymmword ptr [rsp + 0xa0], ymm2
0x10053499f: vmovaps ymmword ptr [rsp + 0x80], ymm2
0x1005349a8: vmovaps ymmword ptr [rsp + 0x60], ymm2
0x1005349ae: vmovaps ymmword ptr [rsp + 0x40], ymm2
0x1005349b4: mov word ptr [rsp], 0x7475
0x1005349ba: vmovss dword ptr [rsp + 0x20], xmm0
0x1005349c0: vmovss dword ptr [rsp + 0x24], xmm1
0x1005349c6: mov dword ptr [rsp + 0x1a0], 3
0x1005349d1: mov dword ptr [rsp + 0x1ac], 2
0x1005349dc: mov rdi, qword ptr [rbx + 0x78]
0x1005349e0: test rdi, rdi
0x1005349e3: je 0x100534a0e
0x1005349e5: mov r14, qword ptr [rbx + 0x80]
0x1005349ec: test r14, r14
0x1005349ef: je 0x100534a0e
0x1005349f1: mov rax, qword ptr [rdi]
0x1005349f4: vzeroupper 
0x1005349f7: call qword ptr [rax]
0x1005349f9: cmp r14, rax
0x1005349fc: jne 0x100534a0e
0x1005349fe: mov rdi, qword ptr [rbx + 0x78]
0x100534a02: mov rax, qword ptr [rdi]
0x100534a05: mov rsi, rsp
0x100534a08: call qword ptr [rax + 0x88]
0x100534a0e: mov rdi, qword ptr [rbx + 0x78]
0x100534a12: test rdi, rdi
0x100534a15: je 0x100534a42
0x100534a17: mov r14, qword ptr [rbx + 0x80]
0x100534a1e: test r14, r14
0x100534a21: je 0x100534a42
0x100534a23: mov rax, qword ptr [rdi]
0x100534a26: vzeroupper 
0x100534a29: call qword ptr [rax]
0x100534a2b: cmp r14, rax
0x100534a2e: jne 0x100534a42
0x100534a30: mov rdi, qword ptr [rbx + 0x78]
0x100534a34: mov rax, qword ptr [rdi]
0x100534a37: call qword ptr [rax + 0x10]
0x100534a3a: test al, al
0x100534a3c: jne 0x100534c1b
0x100534a42: mov rdi, rbx
0x100534a45: vzeroupper 
0x100534a48: call 0x10032ef60 ; 0x10032ef60
0x100534a4d: jmp 0x100534c1b ; 0x100534c1b
0x100534a52: mov r15, qword ptr [rbx + 0x58]
0x100534a56: mov rsi, qword ptr [r14 + 0x70]
0x100534a5a: mov rdi, rsp
0x100534a5d: call 0x10076be90 ; 0x10076be90
0x100534a62: vmovaps xmm0, xmmword ptr [r15 + 0x10]
0x100534a68: vsubps xmm0, xmm0, xmmword ptr [rsp]
0x100534a6d: vmulps xmm0, xmm0, xmm0
0x100534a71: vmovshdup xmm1, xmm0
0x100534a75: vaddss xmm1, xmm0, xmm1
0x100534a79: vpermilpd xmm0, xmm0, 1
0x100534a7f: vaddss xmm0, xmm0, xmm1
0x100534a83: vsqrtss xmm0, xmm0, xmm0
0x100534a87: vdivss xmm0, xmm0, dword ptr [rip + 0x595add] ; 0x100aca56c
0x100534a8f: mov rax, qword ptr [r14 + 0x160]
0x100534a96: lea rcx, [rip + 0x1ac6633] ; 0x101ffb0d0
0x100534a9d: cmp byte ptr [rcx], 0
0x100534aa0: je 0x100534aaf
0x100534aa2: lea rcx, [rip + 0x783a97] ; 0x100cb8540
0x100534aa9: vmovss xmm1, dword ptr [rcx]
0x100534aad: jmp 0x100534ab7 ; 0x100534ab7
0x100534aaf: vmovss xmm1, dword ptr [rip + 0x570609] ; 0x100aa50c0
0x100534ab7: vmulss xmm1, xmm1, dword ptr [rax + 0x20]
0x100534abc: vmulss xmm1, xmm1, dword ptr [rax + 0x14]
0x100534ac1: vmovss xmm2, dword ptr [rip + 0x571fd3] ; 0x100aa6a9c
0x100534ac9: vmaxss xmm1, xmm2, xmm1
0x100534acd: vmovss xmm2, dword ptr [rip + 0x571fcb] ; 0x100aa6aa0
0x100534ad5: vminss xmm1, xmm2, xmm1
0x100534ad9: vaddss xmm1, xmm1, dword ptr [rbx + 0x88]
0x100534ae1: vmovss dword ptr [rbx + 0x88], xmm1
0x100534ae9: vucomiss xmm1, xmm0
0x100534aed: jbe 0x100534c1b
0x100534af3: mov rdi, qword ptr [r14 + 0x5c8]
0x100534afa: test byte ptr [rbx + 0x38], 1
0x100534afe: jne 0x100534b09
0x100534b00: lea rsi, [rbx + 0x38]
0x100534b04: inc rsi
0x100534b07: jmp 0x100534b0d ; 0x100534b0d
0x100534b09: mov rsi, qword ptr [rbx + 0x48]
0x100534b0d: vxorps ymm0, ymm0, ymm0
0x100534b11: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x100534b1a: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x100534b23: vmovaps ymmword ptr [rsp + 0x1e0], ymm0
0x100534b2c: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x100534b35: mov eax, dword ptr [rbx + 0x50]
0x100534b38: mov rcx, qword ptr [rbx + 0x58]
0x100534b3c: mov rdx, qword ptr [rbx + 0x60]
0x100534b40: mov byte ptr [rsp + 0x1cd], 1
0x100534b48: mov dword ptr [rsp + 0x1c0], eax
0x100534b4f: mov dword ptr [rsp + 0x230], 0x11
0x100534b5a: vmovaps xmm1, xmmword ptr [rcx + 0x10]
0x100534b5f: vmovaps xmmword ptr [rsp + 0x1d0], xmm1
0x100534b68: mov qword ptr [rsp + 0x208], rdx
0x100534b70: mov eax, dword ptr [rbx + 0x68]
0x100534b73: mov dword ptr [rsp + 0x22c], eax
0x100534b7a: mov dword ptr [rsp + 0x230], 0x40c31
0x100534b85: vmovups ymmword ptr [rsp + 0x190], ymm0
0x100534b8e: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x100534b97: vmovaps ymmword ptr [rsp + 0x160], ymm0
0x100534ba0: vmovaps ymmword ptr [rsp + 0x140], ymm0
0x100534ba9: vmovaps ymmword ptr [rsp + 0x120], ymm0
0x100534bb2: vmovaps ymmword ptr [rsp + 0x100], ymm0
0x100534bbb: vmovaps ymmword ptr [rsp + 0xe0], ymm0
0x100534bc4: vmovaps ymmword ptr [rsp + 0xc0], ymm0
0x100534bcd: vmovaps ymmword ptr [rsp + 0xa0], ymm0
0x100534bd6: vmovaps ymmword ptr [rsp + 0x80], ymm0
0x100534bdf: vmovaps ymmword ptr [rsp + 0x60], ymm0
0x100534be5: vmovaps ymmword ptr [rsp + 0x40], ymm0
0x100534beb: vmovaps ymmword ptr [rsp + 0x20], ymm0
0x100534bf1: vmovaps ymmword ptr [rsp], ymm0
0x100534bf6: lea rdx, [rsp + 0x1c0]
0x100534bfe: mov rcx, rsp
0x100534c01: vzeroupper 
0x100534c04: call 0x1006018a0 ; 0x1006018a0
0x100534c09: mov qword ptr [rbx + 0x78], rax
0x100534c0d: mov qword ptr [rbx + 0x80], rdx
0x100534c14: mov byte ptr [rbx + 0x8c], 1
0x100534c1b: mov rax, qword ptr [rip + 0x6d8cb6] ; 0x100c0d8d8
0x100534c22: mov rax, qword ptr [rax]
0x100534c25: cmp rax, qword ptr [rsp + 0x250]
0x100534c2d: jne 0x100534c3a
0x100534c2f: lea rsp, [rbp - 0x18]
0x100534c33: pop rbx
0x100534c34: pop r14
0x100534c36: pop r15
0x100534c38: pop rbp
0x100534c39: ret 
0x100534c3a: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100534c3f: nop 
