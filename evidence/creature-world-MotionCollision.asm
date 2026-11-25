0x10062d590: push rbp
0x10062d591: mov rbp, rsp
0x10062d594: push r15
0x10062d596: push r14
0x10062d598: push r13
0x10062d59a: push r12
0x10062d59c: push rbx
0x10062d59d: sub rsp, 0xa8
0x10062d5a4: mov r14, r8
0x10062d5a7: mov r15, rcx
0x10062d5aa: mov r13, rdx
0x10062d5ad: mov rbx, rsi
0x10062d5b0: mov r12, rdi
0x10062d5b3: mov byte ptr [r14], 0
0x10062d5b7: vmovaps xmm1, xmmword ptr [r13]
0x10062d5bd: vmovaps xmmword ptr [r12], xmm1
0x10062d5c3: vmulps xmm2, xmm1, xmm1
0x10062d5c7: vmovshdup xmm1, xmm2
0x10062d5cb: vaddss xmm1, xmm2, xmm1
0x10062d5cf: vpermilpd xmm2, xmm2, 1
0x10062d5d5: vaddss xmm1, xmm2, xmm1
0x10062d5d9: vucomiss xmm1, dword ptr [rip + 0x4794bb] ; 0x100aa6a9c
0x10062d5e1: jbe 0x10062d97a
0x10062d5e7: vmovss dword ptr [rbp - 0x50], xmm1
0x10062d5ec: vmovss dword ptr [rbp - 0x2c], xmm0
0x10062d5f1: vmovaps xmm0, xmmword ptr [rbx + 0x40]
0x10062d5f6: vmulps xmm1, xmm0, xmm0
0x10062d5fa: vmovshdup xmm2, xmm1
0x10062d5fe: vaddss xmm2, xmm1, xmm2
0x10062d602: vpermilpd xmm1, xmm1, 1
0x10062d608: vaddss xmm1, xmm1, xmm2
0x10062d60c: vsqrtss xmm1, xmm1, xmm1
0x10062d610: vucomiss xmm1, dword ptr [rip + 0x47a2ac] ; 0x100aa78c4
0x10062d618: jbe 0x10062d624
0x10062d61a: vpermilps xmm1, xmm1, 0xc0
0x10062d620: vdivps xmm0, xmm0, xmm1
0x10062d624: vmulps xmm1, xmm0, xmm0
0x10062d628: vmovshdup xmm2, xmm1
0x10062d62c: vaddss xmm2, xmm1, xmm2
0x10062d630: vpermilpd xmm1, xmm1, 1
0x10062d636: vaddss xmm2, xmm1, xmm2
0x10062d63a: vmovaps xmm1, xmmword ptr [rip + 0x47a2ce] ; 0x100aa7910
0x10062d642: vandps xmm2, xmm2, xmm1
0x10062d646: vmovss xmm5, dword ptr [rip + 0x47a276] ; 0x100aa78c4
0x10062d64e: vucomiss xmm5, xmm2
0x10062d652: jb 0x10062d65c
0x10062d654: vmovaps xmm0, xmmword ptr [rip + 0x47b3d4] ; 0x100aa8a30
0x10062d65c: vmovddup xmm2, qword ptr [rip + 0x47a274] ; 0x100aa78d8
0x10062d664: vmulps xmm3, xmm0, xmm2
0x10062d668: vmovshdup xmm4, xmm3
0x10062d66c: vaddss xmm4, xmm3, xmm4
0x10062d670: vpermilpd xmm3, xmm3, 1
0x10062d676: vaddss xmm3, xmm3, xmm4
0x10062d67a: vandps xmm3, xmm3, xmm1
0x10062d67e: vaddss xmm3, xmm3, dword ptr [rip + 0x477a3e] ; 0x100aa50c4
0x10062d686: vandps xmm1, xmm3, xmm1
0x10062d68a: vucomiss xmm5, xmm1
0x10062d68e: vmovss xmm3, dword ptr [rip + 0x477a2a] ; 0x100aa50c0
0x10062d696: jae 0x10062d69c
0x10062d698: vmovaps xmm3, xmm2
0x10062d69c: vpermilps xmm1, xmm0, 0xd2
0x10062d6a2: vmulps xmm2, xmm1, xmm3
0x10062d6a6: vpermilps xmm3, xmm3, 0xd2
0x10062d6ac: vmulps xmm3, xmm0, xmm3
0x10062d6b0: vsubps xmm2, xmm2, xmm3
0x10062d6b4: vpermilps xmm4, xmm2, 0xd2
0x10062d6ba: vmulps xmm2, xmm2, xmm2
0x10062d6be: vpermilpd xmm3, xmm2, 1
0x10062d6c4: vaddss xmm3, xmm3, xmm2
0x10062d6c8: vmovshdup xmm2, xmm2
0x10062d6cc: vaddss xmm2, xmm2, xmm3
0x10062d6d0: vsqrtss xmm2, xmm2, xmm2
0x10062d6d4: vucomiss xmm2, xmm5
0x10062d6d8: jbe 0x10062d6e4
0x10062d6da: vpermilps xmm2, xmm2, 0xc0
0x10062d6e0: vdivps xmm4, xmm4, xmm2
0x10062d6e4: vpermilps xmm2, xmm4, 0xd2
0x10062d6ea: vmulps xmm0, xmm0, xmm2
0x10062d6ee: vmulps xmm1, xmm1, xmm4
0x10062d6f2: vsubps xmm0, xmm0, xmm1
0x10062d6f6: vpermilps xmm2, xmm0, 0xd2
0x10062d6fc: vmulps xmm0, xmm0, xmm0
0x10062d700: vpermilpd xmm1, xmm0, 1
0x10062d706: vaddss xmm1, xmm1, xmm0
0x10062d70a: vmovshdup xmm0, xmm0
0x10062d70e: vaddss xmm0, xmm0, xmm1
0x10062d712: vsqrtss xmm0, xmm0, xmm0
0x10062d716: vucomiss xmm0, dword ptr [rip + 0x47a1a6] ; 0x100aa78c4
0x10062d71e: vmovaps xmmword ptr [rbp - 0x40], xmm4
0x10062d723: jbe 0x10062d72f
0x10062d725: vpermilps xmm0, xmm0, 0xc0
0x10062d72b: vdivps xmm2, xmm2, xmm0
0x10062d72f: vmovaps xmmword ptr [rbp - 0x60], xmm2
0x10062d734: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10062d739: vcvtsi2ss xmm0, xmm6, eax
0x10062d73d: vmulss xmm0, xmm0, dword ptr [rip + 0x4799ab] ; 0x100aa70f0
0x10062d745: vmovss xmm1, dword ptr [rip + 0x477973] ; 0x100aa50c0
0x10062d74d: vsubss xmm1, xmm0, xmm1
0x10062d751: vaddss xmm0, xmm0, xmm1
0x10062d755: vpermilps xmm0, xmm0, 0xc0
0x10062d75b: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x40]
0x10062d760: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x10062d765: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10062d76a: vcvtsi2ss xmm0, xmm6, eax
0x10062d76e: vmulss xmm0, xmm0, dword ptr [rip + 0x47997a] ; 0x100aa70f0
0x10062d776: vmovss xmm1, dword ptr [rip + 0x477942] ; 0x100aa50c0
0x10062d77e: vsubss xmm1, xmm0, xmm1
0x10062d782: vaddss xmm0, xmm0, xmm1
0x10062d786: vpermilps xmm0, xmm0, 0xc0
0x10062d78c: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x60]
0x10062d791: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x40]
0x10062d796: vmulps xmm1, xmm0, xmm0
0x10062d79a: vmovshdup xmm2, xmm1
0x10062d79e: vaddss xmm2, xmm1, xmm2
0x10062d7a2: vpermilpd xmm1, xmm1, 1
0x10062d7a8: vaddss xmm1, xmm1, xmm2
0x10062d7ac: vsqrtss xmm1, xmm1, xmm1
0x10062d7b0: vucomiss xmm1, dword ptr [rip + 0x47a10c] ; 0x100aa78c4
0x10062d7b8: jbe 0x10062d7c4
0x10062d7ba: vpermilps xmm1, xmm1, 0xc0
0x10062d7c0: vdivps xmm0, xmm0, xmm1
0x10062d7c4: vbroadcastss xmm1, dword ptr [rbx + 0x50]
0x10062d7ca: vmulps xmm0, xmm0, xmm1
0x10062d7ce: vaddps xmm4, xmm0, xmmword ptr [rbx]
0x10062d7d2: vsqrtss xmm1, xmm6, dword ptr [rbp - 0x50]
0x10062d7d7: vmovaps xmm2, xmmword ptr [r13]
0x10062d7dd: vpermilps xmm3, xmm1, 0xc0
0x10062d7e3: vmovaps xmmword ptr [rbp - 0x50], xmm3
0x10062d7e8: vdivps xmm2, xmm2, xmm3
0x10062d7ec: vmulss xmm0, xmm1, dword ptr [rbp - 0x2c]
0x10062d7f1: vmovaps xmmword ptr [rbp - 0x70], xmm4
0x10062d7f6: vmovaps xmmword ptr [rbp - 0x80], xmm2
0x10062d7fb: movabs rax, 0xffffff9f00000001
0x10062d805: mov qword ptr [rbp - 0xa0], rax
0x10062d80c: mov byte ptr [rbp - 0x98], 1
0x10062d813: vxorps xmm1, xmm1, xmm1
0x10062d817: vmovups xmmword ptr [rbp - 0x90], xmm1
0x10062d81f: lea rsi, [rbp - 0x70]
0x10062d823: lea rdx, [rbp - 0x80]
0x10062d827: lea rcx, [rbp - 0xa0]
0x10062d82e: lea r8, [rbp - 0xd0]
0x10062d835: mov rdi, r15
0x10062d838: vmovss dword ptr [rbp - 0x2c], xmm0
0x10062d83d: call 0x100776a90 ; 0x100776a90
0x10062d842: test al, al
0x10062d844: je 0x10062d97a
0x10062d84a: cmp byte ptr [rbp - 0xac], 0
0x10062d851: je 0x10062d97a
0x10062d857: vmovaps xmm3, xmmword ptr [rbp - 0xd0]
0x10062d85f: vmovaps xmm0, xmmword ptr [rbp - 0xc0]
0x10062d867: vmovaps xmm4, xmmword ptr [rbp - 0x70]
0x10062d86c: vsubps xmm1, xmm3, xmm4
0x10062d870: vmulps xmm1, xmm1, xmm0
0x10062d874: vmovshdup xmm2, xmm1
0x10062d878: vaddss xmm2, xmm1, xmm2
0x10062d87c: vpermilpd xmm1, xmm1, 1
0x10062d882: vaddss xmm5, xmm1, xmm2
0x10062d886: vpermilps xmm1, xmm5, 0xc0
0x10062d88c: vmulps xmm1, xmm0, xmm1
0x10062d890: vmovss xmm2, dword ptr [rbp - 0x2c]
0x10062d895: vmulss xmm2, xmm2, xmm2
0x10062d899: vmulss xmm6, xmm5, xmm5
0x10062d89d: vsubss xmm2, xmm2, xmm6
0x10062d8a1: vsqrtss xmm2, xmm2, xmm2
0x10062d8a5: vaddss xmm5, xmm5, dword ptr [rip + 0x477813] ; 0x100aa50c0
0x10062d8ad: vandps xmm5, xmm5, xmmword ptr [rip + 0x47a05b] ; 0x100aa7910
0x10062d8b5: vmovss xmm6, dword ptr [rip + 0x47a007] ; 0x100aa78c4
0x10062d8bd: vucomiss xmm6, xmm5
0x10062d8c1: jae 0x10062d8f9
0x10062d8c3: vaddps xmm0, xmm4, xmm1
0x10062d8c7: vsubps xmm0, xmm3, xmm0
0x10062d8cb: vmulps xmm3, xmm0, xmm0
0x10062d8cf: vmovshdup xmm4, xmm3
0x10062d8d3: vaddss xmm4, xmm3, xmm4
0x10062d8d7: vpermilpd xmm3, xmm3, 1
0x10062d8dd: vaddss xmm3, xmm3, xmm4
0x10062d8e1: vsqrtss xmm3, xmm3, xmm3
0x10062d8e5: vucomiss xmm3, dword ptr [rip + 0x479fd7] ; 0x100aa78c4
0x10062d8ed: jbe 0x10062d8f9
0x10062d8ef: vpermilps xmm3, xmm3, 0xc0
0x10062d8f5: vdivps xmm0, xmm0, xmm3
0x10062d8f9: vpermilps xmm2, xmm2, 0xc0
0x10062d8ff: vmulps xmm0, xmm2, xmm0
0x10062d903: vaddps xmm0, xmm1, xmm0
0x10062d907: vmulps xmm1, xmm0, xmm0
0x10062d90b: vmovshdup xmm2, xmm1
0x10062d90f: vaddss xmm2, xmm1, xmm2
0x10062d913: vpermilpd xmm1, xmm1, 1
0x10062d919: vaddss xmm1, xmm1, xmm2
0x10062d91d: vsqrtss xmm1, xmm1, xmm1
0x10062d921: vucomiss xmm1, dword ptr [rip + 0x479f9b] ; 0x100aa78c4
0x10062d929: jbe 0x10062d935
0x10062d92b: vpermilps xmm1, xmm1, 0xc0
0x10062d931: vdivps xmm0, xmm0, xmm1
0x10062d935: vxorps xmm1, xmm1, xmm1
0x10062d939: vaddps xmm0, xmm0, xmm1
0x10062d93d: vmulps xmm1, xmm0, xmm0
0x10062d941: vmovshdup xmm2, xmm1
0x10062d945: vaddss xmm2, xmm1, xmm2
0x10062d949: vpermilpd xmm1, xmm1, 1
0x10062d94f: vaddss xmm1, xmm1, xmm2
0x10062d953: vsqrtss xmm1, xmm1, xmm1
0x10062d957: vucomiss xmm1, dword ptr [rip + 0x479f65] ; 0x100aa78c4
0x10062d95f: jbe 0x10062d96b
0x10062d961: vpermilps xmm1, xmm1, 0xc0
0x10062d967: vdivps xmm0, xmm0, xmm1
0x10062d96b: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x50]
0x10062d970: vmovaps xmmword ptr [r12], xmm0
0x10062d976: mov byte ptr [r14], 1
0x10062d97a: mov rax, r12
0x10062d97d: add rsp, 0xa8
0x10062d984: pop rbx
0x10062d985: pop r12
0x10062d987: pop r13
0x10062d989: pop r14
0x10062d98b: pop r15
0x10062d98d: pop rbp
0x10062d98e: ret 
0x10062d98f: nop 
