0x1001a0450: push rbp
0x1001a0451: mov rbp, rsp
0x1001a0454: push r15
0x1001a0456: push r14
0x1001a0458: push rbx
0x1001a0459: sub rsp, 0xc8
0x1001a0460: vmovaps xmm2, xmm0
0x1001a0464: mov r14, rdx
0x1001a0467: mov r15, rsi
0x1001a046a: mov rbx, rdi
0x1001a046d: mov rsi, qword ptr [rbx + 0x18]
0x1001a0471: test rsi, rsi
0x1001a0474: je 0x1001a0602
0x1001a047a: mov rax, qword ptr [rsi]
0x1001a047d: lea rdi, [rbp - 0x60]
0x1001a0481: vmovss dword ptr [rbp - 0x1c], xmm2
0x1001a0486: call qword ptr [rax + 0x18]
0x1001a0489: vmovss xmm2, dword ptr [rbp - 0x1c]
0x1001a048e: cmp byte ptr [rbx + 0x20], 0
0x1001a0492: je 0x1001a0640
0x1001a0498: mov al, 1
0x1001a049a: cmp byte ptr [rbx + 0x48], 0
0x1001a049e: jne 0x1001a0647
0x1001a04a4: vmovss dword ptr [rbp - 0x1c], xmm2
0x1001a04a9: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001a04ae: vcvtsi2ss xmm0, xmm1, eax
0x1001a04b2: vmulss xmm0, xmm0, dword ptr [rip + 0x906c36] ; 0x100aa70f0
0x1001a04ba: vaddss xmm0, xmm0, dword ptr [rip + 0x90815e] ; 0x100aa8620
0x1001a04c2: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x1001a04c7: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001a04cc: vcvtsi2ss xmm0, xmm1, eax
0x1001a04d0: vmulss xmm0, xmm0, dword ptr [rip + 0x906c18] ; 0x100aa70f0
0x1001a04d8: vaddss xmm0, xmm0, dword ptr [rip + 0x908140] ; 0x100aa8620
0x1001a04e0: vpermilps xmm1, xmmword ptr [rbp - 0x70], 0xc0
0x1001a04e7: vmovss xmm2, dword ptr [rip + 0x904bd1] ; 0x100aa50c0
0x1001a04ef: vmulps xmm1, xmm1, xmm2
0x1001a04f3: vpermilps xmm0, xmm0, 0xc0
0x1001a04f9: vmulps xmm0, xmm0, xmmword ptr [rip + 0x90852f] ; 0x100aa8a30
0x1001a0501: vaddps xmm0, xmm1, xmm0
0x1001a0505: vaddps xmm0, xmm0, xmmword ptr [rip + 0x9073e3] ; 0x100aa78f0
0x1001a050d: vmovaps xmm1, xmmword ptr [rbp - 0x50]
0x1001a0512: vpermilps xmm2, xmm0, 0
0x1001a0518: vmulps xmm2, xmm2, xmmword ptr [rbp - 0x60]
0x1001a051d: vpermilps xmm3, xmm0, 0x55
0x1001a0523: vmulps xmm3, xmm1, xmm3
0x1001a0527: vaddps xmm2, xmm2, xmm3
0x1001a052b: vpermilps xmm0, xmm0, 0xaa
0x1001a0531: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x40]
0x1001a0536: vaddps xmm0, xmm0, xmm2
0x1001a053a: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x30]
0x1001a053f: movabs rax, 0xffffffef00000001
0x1001a0549: mov qword ptr [rbp - 0xb0], rax
0x1001a0550: mov byte ptr [rbp - 0xa8], 1
0x1001a0557: vxorps xmm2, xmm2, xmm2
0x1001a055b: vmovups xmmword ptr [rbp - 0xa0], xmm2
0x1001a0563: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x1001a056b: vmovaps xmm0, xmmword ptr [rip + 0x908d6d] ; 0x100aa92e0
0x1001a0573: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x1001a0578: vmulps xmm0, xmm1, xmm1
0x1001a057c: vpermilpd xmm1, xmm0, 1
0x1001a0582: vaddps xmm0, xmm0, xmm1
0x1001a0586: vmovshdup xmm1, xmm0
0x1001a058a: vaddss xmm0, xmm0, xmm1
0x1001a058e: vsqrtss xmm0, xmm0, xmm0
0x1001a0592: lea rsi, [rbp - 0x90]
0x1001a0599: lea rdx, [rbp - 0x80]
0x1001a059d: lea rcx, [rbp - 0xb0]
0x1001a05a4: lea r8, [rbp - 0xe0]
0x1001a05ab: mov rdi, r15
0x1001a05ae: call 0x100776a90 ; 0x100776a90
0x1001a05b3: test al, al
0x1001a05b5: je 0x1001a05f4
0x1001a05b7: vmovaps xmm0, xmmword ptr [rbp - 0xd0]
0x1001a05bf: vmulps xmm0, xmm0, xmmword ptr [rip + 0x907ad9] ; 0x100aa80a0
0x1001a05c7: vmovshdup xmm1, xmm0
0x1001a05cb: vaddss xmm1, xmm0, xmm1
0x1001a05cf: vpermilpd xmm0, xmm0, 1
0x1001a05d5: vaddss xmm0, xmm0, xmm1
0x1001a05d9: vucomiss xmm0, dword ptr [rip + 0x903fd7] ; 0x100aa45b8
0x1001a05e1: jbe 0x1001a05f4
0x1001a05e3: vmovaps xmm0, xmmword ptr [rbp - 0xe0]
0x1001a05eb: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x1001a05f0: mov byte ptr [rbx + 0x48], 1
0x1001a05f4: vmovss xmm2, dword ptr [rbp - 0x1c]
0x1001a05f9: mov al, byte ptr [rbx + 0x48]
0x1001a05fc: test al, al
0x1001a05fe: jne 0x1001a0647
0x1001a0600: jmp 0x1001a064e ; 0x1001a064e
0x1001a0602: vmovss xmm0, dword ptr [rip + 0x904ab6] ; 0x100aa50c0
0x1001a060a: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1001a060f: vmovaps xmm0, xmmword ptr [rip + 0x907a89] ; 0x100aa80a0
0x1001a0617: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1001a061c: vmovaps xmm0, xmmword ptr [rip + 0x90840c] ; 0x100aa8a30
0x1001a0624: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1001a0629: vmovaps xmm0, xmmword ptr [rip + 0x9083cf] ; 0x100aa8a00
0x1001a0631: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x1001a0636: cmp byte ptr [rbx + 0x20], 0
0x1001a063a: jne 0x1001a0498
0x1001a0640: mov al, byte ptr [rbx + 0x48]
0x1001a0643: test al, al
0x1001a0645: je 0x1001a064e
0x1001a0647: vmovaps xmm0, xmmword ptr [rbx + 0x30]
0x1001a064c: jmp 0x1001a065a ; 0x1001a065a
0x1001a064e: vmovaps xmm0, xmmword ptr [rbp - 0x30]
0x1001a0653: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x1001a0658: xor eax, eax
0x1001a065a: vsubps xmm0, xmm0, xmmword ptr [r14]
0x1001a065f: vmulps xmm0, xmm0, xmm0
0x1001a0663: vmovshdup xmm1, xmm0
0x1001a0667: vaddss xmm1, xmm0, xmm1
0x1001a066b: vpermilpd xmm0, xmm0, 1
0x1001a0671: vaddss xmm0, xmm0, xmm1
0x1001a0675: vsqrtss xmm0, xmm0, xmm0
0x1001a0679: vmulss xmm1, xmm2, dword ptr [rip + 0x908327] ; 0x100aa89a8
0x1001a0681: vaddss xmm1, xmm1, dword ptr [r14 + 0x50]
0x1001a0687: vucomiss xmm1, xmm0
0x1001a068b: ja 0x1001a068f
0x1001a068d: xor eax, eax
0x1001a068f: mov byte ptr [rbx + 0x21], al
0x1001a0692: add rsp, 0xc8
0x1001a0699: pop rbx
0x1001a069a: pop r14
0x1001a069c: pop r15
0x1001a069e: pop rbp
0x1001a069f: ret 
