0x1007f5b20: push rbp
0x1007f5b21: mov rbp, rsp
0x1007f5b24: mov qword ptr [rdi], 0
0x1007f5b2b: vmovss xmm0, dword ptr [rip + 0x2af58d] ; 0x100aa50c0
0x1007f5b33: vmovaps xmmword ptr [rdi + 0x10], xmm0
0x1007f5b38: vmovaps xmm0, xmmword ptr [rip + 0x2b2560] ; 0x100aa80a0
0x1007f5b40: vmovaps xmmword ptr [rdi + 0x20], xmm0
0x1007f5b45: vmovaps xmm0, xmmword ptr [rip + 0x2b2ee3] ; 0x100aa8a30
0x1007f5b4d: vmovaps xmmword ptr [rdi + 0x30], xmm0
0x1007f5b52: vmovaps xmm1, xmmword ptr [rip + 0x2b2ea6] ; 0x100aa8a00
0x1007f5b5a: vmovaps xmmword ptr [rdi + 0x40], xmm1
0x1007f5b5f: mov rax, qword ptr [rip + 0x417fa2] ; 0x100c0db08
0x1007f5b66: vmovaps xmm0, xmmword ptr [rip + 0x2bf912] ; 0x100ab5480 (knN(knN(knN
0x1007f5b6e: vmulps xmm2, xmm0, xmmword ptr [rax]
0x1007f5b72: vmulps xmm3, xmm0, xmmword ptr [rax + 0x10]
0x1007f5b77: vmulps xmm4, xmm0, xmmword ptr [rax + 0x20]
0x1007f5b7c: vxorps xmm0, xmm0, xmm0
0x1007f5b80: vblendps xmm2, xmm2, xmm0, 8
0x1007f5b86: vmovaps xmmword ptr [rdi + 0x50], xmm2
0x1007f5b8b: vblendps xmm2, xmm3, xmm0, 8
0x1007f5b91: vmovaps xmmword ptr [rdi + 0x60], xmm2
0x1007f5b96: vblendps xmm2, xmm4, xmm0, 8
0x1007f5b9c: vmovaps xmmword ptr [rdi + 0x70], xmm2
0x1007f5ba1: vmovaps xmmword ptr [rdi + 0x80], xmm1
0x1007f5ba9: mov word ptr [rdi + 0x1ec], 0x101
0x1007f5bb2: mov byte ptr [rdi + 0x1ee], 0
0x1007f5bb9: vmovddup xmm1, qword ptr [rip + 0x2bd57f] ; 0x100ab3140
0x1007f5bc1: vmovupd xmmword ptr [rdi + 0x1f0], xmm1
0x1007f5bc9: mov qword ptr [rdi + 0x200], 0
0x1007f5bd4: mov word ptr [rdi + 0x208], 0x101
0x1007f5bdd: mov byte ptr [rdi + 0x20a], 0
0x1007f5be4: mov qword ptr [rdi + 0x20c], 1
0x1007f5bef: mov qword ptr [rdi + 0x214], 1
0x1007f5bfa: mov qword ptr [rdi + 0x21c], 0
0x1007f5c05: mov word ptr [rdi + 0x224], 0x101
0x1007f5c0e: mov byte ptr [rdi + 0x226], 0
0x1007f5c15: vmovupd xmmword ptr [rdi + 0x228], xmm1
0x1007f5c1d: mov dword ptr [rdi + 0x238], 0
0x1007f5c27: mov dword ptr [rdi + 0x23c], 0
0x1007f5c31: mov word ptr [rdi + 0x240], 0x101
0x1007f5c3a: mov byte ptr [rdi + 0x242], 0
0x1007f5c41: mov dword ptr [rdi + 0x244], 1
0x1007f5c4b: vmovaps xmm1, xmmword ptr [rip + 0x2bd32d] ; 0x100ab2f80 -> 0x100000000 __mh_execute_header
0x1007f5c53: vmovups xmmword ptr [rdi + 0x248], xmm1
0x1007f5c5b: mov dword ptr [rdi + 0x258], 0
0x1007f5c65: mov word ptr [rdi + 0x25c], 1
0x1007f5c6e: mov qword ptr [rdi + 0x260], 0
0x1007f5c79: mov dword ptr [rdi + 0x268], 0
0x1007f5c83: mov dword ptr [rdi + 0x3d4], 0xffffffff
0x1007f5c8d: mov qword ptr [rdi + 0x410], 0
0x1007f5c98: mov dword ptr [rdi + 0x420], 0
0x1007f5ca2: mov qword ptr [rdi + 0x438], 0
0x1007f5cad: mov dword ptr [rdi + 0x448], 0
0x1007f5cb7: mov qword ptr [rdi + 0x460], 0
0x1007f5cc2: mov dword ptr [rdi + 0x470], 0
0x1007f5ccc: mov dword ptr [rdi + 0x488], 0
0x1007f5cd6: mov dword ptr [rdi + 0x48c], 0
0x1007f5ce0: mov dword ptr [rdi + 0x498], 0
0x1007f5cea: mov qword ptr [rdi + 0x4b0], 0
0x1007f5cf5: mov dword ptr [rdi + 0x4c0], 0
0x1007f5cff: mov qword ptr [rdi + 0x4d8], 0
0x1007f5d0a: mov dword ptr [rdi + 0x4e8], 0
0x1007f5d14: vmovups xmmword ptr [rdi + 0x4f8], xmm0
0x1007f5d1c: mov dword ptr [rdi + 0x508], 0
0x1007f5d26: mov dword ptr [rdi + 0x50c], 0xffffffff
0x1007f5d30: mov dword ptr [rdi + 0x510], 0xffffffff
0x1007f5d3a: mov qword ptr [rdi + 0x51a], 0
0x1007f5d45: mov qword ptr [rdi + 0x514], 0
0x1007f5d50: mov dword ptr [rdi + 0x524], 4
0x1007f5d5a: mov byte ptr [rdi + 0x528], 0
0x1007f5d61: mov byte ptr [rdi + 0x529], 0
0x1007f5d68: mov byte ptr [rdi + 0x52a], 0
0x1007f5d6f: mov byte ptr [rdi + 0x538], 0
0x1007f5d76: pop rbp
0x1007f5d77: ret 
0x1007f5d78: nop dword ptr [rax + rax]
