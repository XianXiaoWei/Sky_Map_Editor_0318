0x1002da610: push rbp
0x1002da611: mov rbp, rsp
0x1002da614: mov r8, qword ptr [rdi + 0x198]
0x1002da61b: vmovaps xmm0, xmmword ptr [rip + 0x7d2f4d] ; 0x100aad570
0x1002da623: vmulps xmm1, xmm0, xmmword ptr [r8]
0x1002da628: vxorps xmm2, xmm2, xmm2
0x1002da62c: vmaxps xmm1, xmm1, xmm2
0x1002da630: vminps xmm0, xmm1, xmm0
0x1002da634: vcvttps2dq xmm0, xmm0
0x1002da638: vpextrb ecx, xmm0, 0
0x1002da63e: vpextrb edx, xmm0, 4
0x1002da644: vpextrb esi, xmm0, 8
0x1002da64a: vpextrd eax, xmm0, 3
0x1002da650: shl eax, 0x18
0x1002da653: shl esi, 0x10
0x1002da656: or esi, ecx
0x1002da658: or esi, eax
0x1002da65a: shl edx, 8
0x1002da65d: or edx, esi
0x1002da65f: mov dword ptr [rdi + 0x18c], edx
0x1002da665: cmp byte ptr [rdi + 0x189], 0
0x1002da66c: je 0x1002da679
0x1002da66e: cmp byte ptr [rdi + 0x188], 0
0x1002da675: je 0x1002da68c
0x1002da677: pop rbp
0x1002da678: ret 
0x1002da679: mov al, byte ptr [r8 + 0x11]
0x1002da67d: mov byte ptr [rdi + 0xaf], al
0x1002da683: cmp byte ptr [rdi + 0x188], 0
0x1002da68a: jne 0x1002da677
0x1002da68c: mov al, byte ptr [r8 + 0x10]
0x1002da690: mov byte ptr [rdi + 0xae], al
0x1002da696: pop rbp
0x1002da697: ret 
0x1002da698: nop dword ptr [rax + rax]
