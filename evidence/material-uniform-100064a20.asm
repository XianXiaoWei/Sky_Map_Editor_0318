0x100064a20: push rbp
0x100064a21: mov rbp, rsp
0x100064a24: push r14
0x100064a26: push rbx
0x100064a27: sub rsp, 0x70
0x100064a2b: vmovss dword ptr [rbp - 0x1c], xmm1
0x100064a30: vmovss dword ptr [rbp - 0x18], xmm0
0x100064a35: mov rbx, rsi
0x100064a38: mov r14, rdi
0x100064a3b: vaddss xmm3, xmm2, dword ptr [rip + 0xa42e79] ; 0x100aa78bc
0x100064a43: vmovss dword ptr [rbp - 0x14], xmm3
0x100064a48: vmovss xmm2, dword ptr [rip + 0xa40674] ; 0x100aa50c4
0x100064a50: vdivss xmm2, xmm2, xmm3
0x100064a54: vsubss xmm2, xmm2, xmm0
0x100064a58: vmulss xmm0, xmm2, xmm2
0x100064a5c: vmulss xmm0, xmm0, xmm1
0x100064a60: vxorps xmm0, xmm0, xmmword ptr [rip + 0xa42e98] ; 0x100aa7900
0x100064a68: call 0x100aa2708 ; 0x100aa2708 _expf
0x100064a6d: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x100064a72: vxorps xmm0, xmm0, xmm0
0x100064a76: vdivss xmm0, xmm0, dword ptr [rbp - 0x14]
0x100064a7b: vsubss xmm0, xmm0, dword ptr [rbp - 0x18]
0x100064a80: vmulss xmm0, xmm0, xmm0
0x100064a84: vmulss xmm0, xmm0, dword ptr [rbp - 0x1c]
0x100064a89: vxorps xmm0, xmm0, xmmword ptr [rip + 0xa42e6f] ; 0x100aa7900
0x100064a91: call 0x100aa2708 ; 0x100aa2708 _expf
0x100064a96: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x100064a9b: vmovss xmm0, dword ptr [rip + 0xa4061d] ; 0x100aa50c0
0x100064aa3: vdivss xmm0, xmm0, dword ptr [rbp - 0x14]
0x100064aa8: vsubss xmm0, xmm0, dword ptr [rbp - 0x18]
0x100064aad: vmulss xmm0, xmm0, xmm0
0x100064ab1: vmulss xmm0, xmm0, dword ptr [rbp - 0x1c]
0x100064ab6: vxorps xmm0, xmm0, xmmword ptr [rip + 0xa42e42] ; 0x100aa7900
0x100064abe: call 0x100aa2708 ; 0x100aa2708 _expf
0x100064ac3: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x100064ac8: vmovss xmm0, dword ptr [rip + 0xa41fdc] ; 0x100aa6aac
0x100064ad0: vdivss xmm0, xmm0, dword ptr [rbp - 0x14]
0x100064ad5: vsubss xmm0, xmm0, dword ptr [rbp - 0x18]
0x100064ada: vmulss xmm0, xmm0, xmm0
0x100064ade: vmulss xmm0, xmm0, dword ptr [rbp - 0x1c]
0x100064ae3: vxorps xmm0, xmm0, xmmword ptr [rip + 0xa42e15] ; 0x100aa7900
0x100064aeb: call 0x100aa2708 ; 0x100aa2708 _expf
0x100064af0: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x100064af5: vmovss xmm0, dword ptr [rip + 0xa42cf3] ; 0x100aa77f0
0x100064afd: vdivss xmm0, xmm0, dword ptr [rbp - 0x14]
0x100064b02: vsubss xmm0, xmm0, dword ptr [rbp - 0x18]
0x100064b07: vmulss xmm0, xmm0, xmm0
0x100064b0b: vmulss xmm0, xmm0, dword ptr [rbp - 0x1c]
0x100064b10: vxorps xmm0, xmm0, xmmword ptr [rip + 0xa42de8] ; 0x100aa7900
0x100064b18: call 0x100aa2708 ; 0x100aa2708 _expf
0x100064b1d: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x100064b22: vmovss xmm0, dword ptr [rip + 0xa42d92] ; 0x100aa78bc
0x100064b2a: vdivss xmm0, xmm0, dword ptr [rbp - 0x14]
0x100064b2f: vsubss xmm0, xmm0, dword ptr [rbp - 0x18]
0x100064b34: vmulss xmm0, xmm0, xmm0
0x100064b38: vmulss xmm0, xmm0, dword ptr [rbp - 0x1c]
0x100064b3d: vxorps xmm0, xmm0, xmmword ptr [rip + 0xa42dbb] ; 0x100aa7900
0x100064b45: call 0x100aa2708 ; 0x100aa2708 _expf
0x100064b4a: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x100064b4f: vmovss xmm0, dword ptr [rip + 0xa41f51] ; 0x100aa6aa8
0x100064b57: vdivss xmm0, xmm0, dword ptr [rbp - 0x14]
0x100064b5c: vsubss xmm0, xmm0, dword ptr [rbp - 0x18]
0x100064b61: vmulss xmm0, xmm0, xmm0
0x100064b65: vmulss xmm0, xmm0, dword ptr [rbp - 0x1c]
0x100064b6a: vxorps xmm0, xmm0, xmmword ptr [rip + 0xa42d8e] ; 0x100aa7900
0x100064b72: call 0x100aa2708 ; 0x100aa2708 _expf
0x100064b77: vmovaps xmm4, xmmword ptr [rbp - 0x80]
0x100064b7c: vmovaps xmm5, xmmword ptr [rbp - 0x70]
0x100064b81: vaddss xmm1, xmm4, xmm5
0x100064b85: vmovaps xmm6, xmmword ptr [rbp - 0x60]
0x100064b8a: vaddss xmm1, xmm1, xmm6
0x100064b8e: vmovaps xmm7, xmmword ptr [rbp - 0x50]
0x100064b93: vaddss xmm1, xmm1, xmm7
0x100064b97: vmovaps xmm2, xmmword ptr [rbp - 0x40]
0x100064b9c: vaddss xmm1, xmm1, xmm2
0x100064ba0: vmovaps xmm9, xmmword ptr [rbp - 0x30]
0x100064ba5: vaddss xmm1, xmm1, xmm9
0x100064baa: vaddss xmm8, xmm1, xmm0
0x100064bae: vmovaps xmm1, xmmword ptr [rbx + 0xc0]
0x100064bb6: vmovaps xmm3, xmmword ptr [rbx + 0x100]
0x100064bbe: vpermilps xmm4, xmm4, 0xc0
0x100064bc4: vmulps xmm4, xmm4, xmm3
0x100064bc8: vpermilps xmm5, xmm5, 0xc0
0x100064bce: vmulps xmm3, xmm5, xmm3
0x100064bd2: vaddps xmm3, xmm4, xmm3
0x100064bd6: vpermilps xmm4, xmm6, 0xc0
0x100064bdc: vmulps xmm4, xmm4, xmmword ptr [rbx + 0xf0]
0x100064be4: vaddps xmm3, xmm3, xmm4
0x100064be8: vpermilps xmm4, xmm7, 0xc0
0x100064bee: vmulps xmm4, xmm4, xmmword ptr [rbx + 0xe0]
0x100064bf6: vaddps xmm3, xmm3, xmm4
0x100064bfa: vpermilps xmm4, xmm2, 0xc0
0x100064c00: vmulps xmm4, xmm4, xmmword ptr [rbx + 0xd0]
0x100064c08: vaddps xmm3, xmm3, xmm4
0x100064c0c: vpermilps xmm4, xmm9, 0xc0
0x100064c12: vmulps xmm4, xmm4, xmm1
0x100064c16: vaddps xmm3, xmm3, xmm4
0x100064c1a: vpermilps xmm0, xmm0, 0xc0
0x100064c20: vmulps xmm0, xmm0, xmm1
0x100064c24: vaddps xmm0, xmm0, xmm3
0x100064c28: vpermilps xmm1, xmm8, 0xc0
0x100064c2e: vdivps xmm0, xmm0, xmm1
0x100064c32: vmovss xmm1, dword ptr [rip + 0xa40486] ; 0x100aa50c0
0x100064c3a: vinsertps xmm0, xmm0, xmm1, 0x30
0x100064c40: vmovaps xmmword ptr [r14], xmm0
0x100064c45: mov rax, r14
0x100064c48: add rsp, 0x70
0x100064c4c: pop rbx
0x100064c4d: pop r14
0x100064c4f: pop rbp
0x100064c50: ret 
0x100064c51: nop word ptr cs:[rax + rax]
