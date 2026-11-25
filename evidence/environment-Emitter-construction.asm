0x1002dcf80: push rbp
0x1002dcf81: mov rbp, rsp
0x1002dcf84: push rbx
0x1002dcf85: push rax
0x1002dcf86: mov rbx, rsi
0x1002dcf89: call 0x1007abc10 ; 0x1007abc10
0x1002dcf8e: mov rax, qword ptr [rip + 0x1b11dfb] ; 0x101deed90
0x1002dcf95: mov eax, dword ptr [rax + 0x38]
0x1002dcf98: mov dword ptr [rbx], eax
0x1002dcf9a: vxorps xmm0, xmm0, xmm0
0x1002dcf9e: vmovups xmmword ptr [rbx + 0x60], xmm0
0x1002dcfa3: vmovups xmmword ptr [rbx + 0x70], xmm0
0x1002dcfa8: mov byte ptr [rbx + 0xb2], 0
0x1002dcfaf: mov byte ptr [rbx + 0x18a], 0
0x1002dcfb6: vmovaps xmmword ptr [rbx + 0xd0], xmm0
0x1002dcfbe: movabs rax, 0x3f8000003f800000
0x1002dcfc8: mov qword ptr [rbx + 0x170], rax
0x1002dcfcf: vmovaps ymm1, ymmword ptr [rip + 0x7dc649] ; 0x100ab9620
0x1002dcfd7: vmovups ymmword ptr [rbx + 0x80], ymm1
0x1002dcfdf: mov word ptr [rbx + 0x188], 0
0x1002dcfe8: vmovaps xmmword ptr [rbx + 0x160], xmm0
0x1002dcff0: mov qword ptr [rbx + 0x190], 0
0x1002dcffb: mov byte ptr [rbx + 0xae], 0
0x1002dd002: vmovaps xmmword ptr [rbx + 0xe0], xmm0
0x1002dd00a: vmovaps xmm1, xmmword ptr [rip + 0x7cb08e] ; 0x100aa80a0
0x1002dd012: vmovaps xmmword ptr [rbx + 0xf0], xmm1
0x1002dd01a: mov byte ptr [rbx + 0x100], 0
0x1002dd021: lea rax, [rip + 0x1d62688] ; 0x10203f6b0
0x1002dd028: vmovaps xmm1, xmmword ptr [rax]
0x1002dd02c: vmovaps xmmword ptr [rbx + 0x110], xmm1
0x1002dd034: vmovaps xmmword ptr [rbx + 0x120], xmm1
0x1002dd03c: vmovaps xmm1, xmmword ptr [rip + 0x7ca61c] ; 0x100aa7660
0x1002dd044: vmovups xmmword ptr [rbx + 0x178], xmm1
0x1002dd04c: mov qword ptr [rbx + 0xa4], 0x3f800000
0x1002dd057: vmovaps xmmword ptr [rbx + 0x50], xmm0
0x1002dd05c: mov qword ptr [rbx + 0x1d4], 0
0x1002dd067: mov dword ptr [rbx + 0x1dc], 0
0x1002dd071: mov byte ptr [rbx + 0xb1], 0
0x1002dd078: mov byte ptr [rbx + 0xad], 0
0x1002dd07f: vxorps ymm1, ymm1, ymm1
0x1002dd083: vmovups ymmword ptr [rbx + 0x198], ymm1
0x1002dd08b: vmovaps xmmword ptr [rbx + 0xc0], xmm0
0x1002dd093: vmovaps xmm1, xmmword ptr [rip + 0x7cd825] ; 0x100aaa8c0
0x1002dd09b: vmovaps xmmword ptr [rbx + 0x40], xmm1
0x1002dd0a0: mov word ptr [rbx + 0xaf], 0
0x1002dd0a9: vmovups xmmword ptr [rbx + 0x1e4], xmm0
0x1002dd0b1: mov rax, rbx
0x1002dd0b4: add rsp, 8
0x1002dd0b8: pop rbx
0x1002dd0b9: pop rbp
0x1002dd0ba: vzeroupper 
0x1002dd0bd: ret 
