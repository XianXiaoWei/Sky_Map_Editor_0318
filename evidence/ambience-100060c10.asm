0x100060c10: push rbp
0x100060c11: mov rbp, rsp
0x100060c14: vmovaps xmm2, xmmword ptr [rdi]
0x100060c18: vmovshdup xmm0, xmm2
0x100060c1c: vpermilpd xmm1, xmm2, 1
0x100060c22: vmovaps xmm4, xmmword ptr [rip + 0xa46ce6] ; 0x100aa7910
0x100060c2a: vandps xmm5, xmm2, xmm4
0x100060c2e: vandps xmm3, xmm0, xmm4
0x100060c32: vandpd xmm4, xmm1, xmm4
0x100060c36: vucomiss xmm5, xmm4
0x100060c3a: jb 0x100060c6f
0x100060c3c: vucomiss xmm5, xmm3
0x100060c40: jb 0x100060c6f
0x100060c42: vxorps xmm3, xmm3, xmm3
0x100060c46: vucomiss xmm2, xmm3
0x100060c4a: jbe 0x100060cdf
0x100060c50: mov dword ptr [rsi], 0
0x100060c56: vmovss xmm2, dword ptr [rip + 0xa4395a] ; 0x100aa45b8
0x100060c5e: vmulss xmm1, xmm1, xmm2
0x100060c62: vdivss xmm1, xmm1, xmm5
0x100060c66: vsubss xmm1, xmm2, xmm1
0x100060c6a: jmp 0x100060cf9 ; 0x100060cf9
0x100060c6f: vucomiss xmm3, xmm5
0x100060c73: jbe 0x100060cb9
0x100060c75: vucomiss xmm3, xmm4
0x100060c79: jb 0x100060cb9
0x100060c7b: vxorps xmm4, xmm4, xmm4
0x100060c7f: vucomiss xmm0, xmm4
0x100060c83: jbe 0x100060d0f
0x100060c89: mov dword ptr [rsi], 2
0x100060c8f: vmovss xmm0, dword ptr [rip + 0xa43921] ; 0x100aa45b8
0x100060c97: vmulss xmm2, xmm2, xmm0
0x100060c9b: vdivss xmm2, xmm2, xmm3
0x100060c9f: vaddss xmm2, xmm2, xmm0
0x100060ca3: vmovss dword ptr [rdx], xmm2
0x100060ca7: vmulss xmm1, xmm1, xmm0
0x100060cab: vdivss xmm1, xmm1, xmm3
0x100060caf: vaddss xmm0, xmm1, xmm0
0x100060cb3: vmovss dword ptr [rcx], xmm0
0x100060cb7: pop rbp
0x100060cb8: ret 
0x100060cb9: vxorps xmm3, xmm3, xmm3
0x100060cbd: vucomiss xmm1, xmm3
0x100060cc1: jbe 0x100060d3f
0x100060cc3: mov dword ptr [rsi], 4
0x100060cc9: vmovss xmm1, dword ptr [rip + 0xa438e7] ; 0x100aa45b8
0x100060cd1: vmulss xmm2, xmm2, xmm1
0x100060cd5: vdivss xmm2, xmm2, xmm4
0x100060cd9: vaddss xmm2, xmm2, xmm1
0x100060cdd: jmp 0x100060d59 ; 0x100060d59
0x100060cdf: mov dword ptr [rsi], 1
0x100060ce5: vmovss xmm2, dword ptr [rip + 0xa438cb] ; 0x100aa45b8
0x100060ced: vmulss xmm1, xmm1, xmm2
0x100060cf1: vdivss xmm1, xmm1, xmm5
0x100060cf5: vaddss xmm1, xmm1, xmm2
0x100060cf9: vmovss dword ptr [rdx], xmm1
0x100060cfd: vmulss xmm0, xmm0, xmm2
0x100060d01: vdivss xmm0, xmm0, xmm5
0x100060d05: vsubss xmm0, xmm2, xmm0
0x100060d09: vmovss dword ptr [rcx], xmm0
0x100060d0d: pop rbp
0x100060d0e: ret 
0x100060d0f: mov dword ptr [rsi], 3
0x100060d15: vmovss xmm0, dword ptr [rip + 0xa4389b] ; 0x100aa45b8
0x100060d1d: vmulss xmm2, xmm2, xmm0
0x100060d21: vdivss xmm2, xmm2, xmm3
0x100060d25: vaddss xmm2, xmm2, xmm0
0x100060d29: vmovss dword ptr [rdx], xmm2
0x100060d2d: vmulss xmm1, xmm1, xmm0
0x100060d31: vdivss xmm1, xmm1, xmm3
0x100060d35: vsubss xmm0, xmm0, xmm1
0x100060d39: vmovss dword ptr [rcx], xmm0
0x100060d3d: pop rbp
0x100060d3e: ret 
0x100060d3f: mov dword ptr [rsi], 5
0x100060d45: vmovss xmm1, dword ptr [rip + 0xa4386b] ; 0x100aa45b8
0x100060d4d: vmulss xmm2, xmm2, xmm1
0x100060d51: vdivss xmm2, xmm2, xmm4
0x100060d55: vsubss xmm2, xmm1, xmm2
0x100060d59: vmovss dword ptr [rdx], xmm2
0x100060d5d: vmulss xmm0, xmm0, xmm1
0x100060d61: vdivss xmm0, xmm0, xmm4
0x100060d65: vsubss xmm0, xmm1, xmm0
0x100060d69: vmovss dword ptr [rcx], xmm0
0x100060d6d: pop rbp
0x100060d6e: ret 
0x100060d6f: nop 
