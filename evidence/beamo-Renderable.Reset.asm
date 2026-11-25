0x1007f6b80: push rbp
0x1007f6b81: mov rbp, rsp
0x1007f6b84: push rbx
0x1007f6b85: push rax
0x1007f6b86: mov rbx, rdi
0x1007f6b89: cmp byte ptr [rbx + 0x538], 0
0x1007f6b90: je 0x1007f6bc9
0x1007f6b92: mov rdi, qword ptr [rbx + 0x500]
0x1007f6b99: test rdi, rdi
0x1007f6b9c: je 0x1007f6ba6
0x1007f6b9e: mov rsi, rbx
0x1007f6ba1: call 0x1007b9820 ; 0x1007b9820
0x1007f6ba6: lea rdi, [rbx + 0x270]
0x1007f6bad: call 0x1007c0cc0 ; 0x1007c0cc0
0x1007f6bb2: call 0x1007c1470 ; 0x1007c1470
0x1007f6bb7: mov rcx, qword ptr [rax]
0x1007f6bba: mov esi, dword ptr [rbx + 0x90]
0x1007f6bc0: mov rdi, rax
0x1007f6bc3: call qword ptr [rcx + 0xc0]
0x1007f6bc9: vmovss xmm0, dword ptr [rip + 0x2ae4ef] ; 0x100aa50c0
0x1007f6bd1: vmovaps xmmword ptr [rbx + 0x10], xmm0
0x1007f6bd6: vmovaps xmm0, xmmword ptr [rip + 0x2b14c2] ; 0x100aa80a0
0x1007f6bde: vmovaps xmmword ptr [rbx + 0x20], xmm0
0x1007f6be3: vmovaps xmm0, xmmword ptr [rip + 0x2b1e45] ; 0x100aa8a30
0x1007f6beb: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x1007f6bf0: vmovaps xmm0, xmmword ptr [rip + 0x2b1e08] ; 0x100aa8a00
0x1007f6bf8: vmovaps xmmword ptr [rbx + 0x40], xmm0
0x1007f6bfd: mov rax, qword ptr [rip + 0x416f04] ; 0x100c0db08
0x1007f6c04: vmovaps xmm1, xmmword ptr [rip + 0x2be874] ; 0x100ab5480 (knN(knN(knN
0x1007f6c0c: vmulps xmm2, xmm1, xmmword ptr [rax]
0x1007f6c10: vmulps xmm3, xmm1, xmmword ptr [rax + 0x10]
0x1007f6c15: vmulps xmm1, xmm1, xmmword ptr [rax + 0x20]
0x1007f6c1a: vxorps xmm4, xmm4, xmm4
0x1007f6c1e: vblendps xmm2, xmm2, xmm4, 8
0x1007f6c24: vblendps xmm3, xmm3, xmm4, 8
0x1007f6c2a: vblendps xmm1, xmm1, xmm4, 8
0x1007f6c30: vmovaps xmmword ptr [rbx + 0x50], xmm2
0x1007f6c35: vmovaps xmmword ptr [rbx + 0x60], xmm3
0x1007f6c3a: vmovaps xmmword ptr [rbx + 0x70], xmm1
0x1007f6c3f: vmovaps xmmword ptr [rbx + 0x80], xmm0
0x1007f6c47: mov qword ptr [rbx + 0x4f8], 0
0x1007f6c52: vmovaps xmm0, xmmword ptr [rip + 0x2ecde6] ; 0x100ae3a40
0x1007f6c5a: vmovups xmmword ptr [rbx + 0x508], xmm0
0x1007f6c62: mov dword ptr [rbx + 0x518], 0
0x1007f6c6c: mov dword ptr [rbx + 0x524], 4
0x1007f6c76: mov byte ptr [rbx + 0x529], 0
0x1007f6c7d: mov qword ptr [rbx], 0
0x1007f6c84: mov byte ptr [rbx + 0x538], 0
0x1007f6c8b: mov dword ptr [rbx + 0x53c], 0
0x1007f6c95: add rsp, 8
0x1007f6c99: pop rbx
0x1007f6c9a: pop rbp
0x1007f6c9b: ret 
0x1007f6c9c: nop dword ptr [rax]
