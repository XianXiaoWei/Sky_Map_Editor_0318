0x100743980: push rbp
0x100743981: mov rbp, rsp
0x100743984: vmovss xmm4, dword ptr [rsi]
0x100743988: vxorps xmm8, xmm8, xmm8
0x10074398d: vucomiss xmm8, xmm4
0x100743991: je 0x100743acd
0x100743997: vmovss xmm5, dword ptr [rdi + 0x1f8]
0x10074399f: vucomiss xmm5, xmm8
0x1007439a4: jbe 0x100743acd
0x1007439aa: vmovss xmm6, dword ptr [rdi + 0x1f4]
0x1007439b2: vsubss xmm5, xmm6, xmm0
0x1007439b6: vmovss xmm9, dword ptr [rip + 0x364c42] ; 0x100aa8600
0x1007439be: vaddss xmm3, xmm5, xmm9
0x1007439c3: vmovss xmm7, dword ptr [rip + 0x364fed] ; 0x100aa89b8
0x1007439cb: vdivss xmm3, xmm3, xmm7
0x1007439cf: vroundss xmm3, xmm3, xmm3, 9
0x1007439d5: vmulss xmm3, xmm3, xmm7
0x1007439d9: vsubss xmm5, xmm5, xmm3
0x1007439dd: vaddss xmm0, xmm4, xmm0
0x1007439e1: vsubss xmm0, xmm6, xmm0
0x1007439e5: vaddss xmm3, xmm0, xmm9
0x1007439ea: vdivss xmm3, xmm3, xmm7
0x1007439ee: vroundss xmm3, xmm3, xmm3, 9
0x1007439f4: vmulss xmm3, xmm3, xmm7
0x1007439f8: vsubss xmm0, xmm0, xmm3
0x1007439fc: vandps xmm0, xmm0, xmmword ptr [rip + 0x363f0c] ; 0x100aa7910
0x100743a04: vmulss xmm0, xmm0, dword ptr [rip + 0x364bf8] ; 0x100aa8604
0x100743a0c: vdivss xmm0, xmm0, xmm9
0x100743a11: vxorps xmm6, xmm6, xmm6
0x100743a15: vucomiss xmm4, xmm6
0x100743a19: jbe 0x100743a21
0x100743a1b: vucomiss xmm5, xmm6
0x100743a1f: ja 0x100743a39
0x100743a21: vucomiss xmm6, xmm4
0x100743a25: jbe 0x100743bd9
0x100743a2b: vxorps xmm3, xmm3, xmm3
0x100743a2f: vucomiss xmm3, xmm5
0x100743a33: jbe 0x100743bd9
0x100743a39: vmovss xmm5, dword ptr [rip + 0x36167f] ; 0x100aa50c0
0x100743a41: vmovss xmm3, dword ptr [rip + 0x363d93] ; 0x100aa77dc
0x100743a49: vucomiss xmm3, xmm0
0x100743a4d: jae 0x100743a79
0x100743a4f: vaddss xmm0, xmm0, dword ptr [rip + 0x367505] ; 0x100aaaf5c
0x100743a57: vdivss xmm0, xmm0, dword ptr [rip + 0x364c0d] ; 0x100aa866c
0x100743a5f: vxorps xmm3, xmm3, xmm3
0x100743a63: vmaxss xmm0, xmm3, xmm0
0x100743a67: vminss xmm0, xmm5, xmm0
0x100743a6b: vsubss xmm3, xmm5, xmm0
0x100743a6f: vmulss xmm0, xmm0, dword ptr [rip + 0x36af61] ; 0x100aae9d8
0x100743a77: jmp 0x100743a91 ; 0x100743a91
0x100743a79: vdivss xmm0, xmm0, dword ptr [rip + 0x363d5b] ; 0x100aa77dc
0x100743a81: vminss xmm0, xmm5, xmm0
0x100743a85: vsubss xmm3, xmm5, xmm0
0x100743a89: vmulss xmm3, xmm3, dword ptr [rip + 0x364b9f] ; 0x100aa8630
0x100743a91: vaddss xmm0, xmm0, xmm3
0x100743a95: mov byte ptr [rdi + 0x101], 0
0x100743a9c: cmp byte ptr [rip + 0x5cbdd2], 0 ; 0x100d0f875
0x100743aa3: je 0x100743acd
0x100743aa5: vxorps xmm3, xmm3, xmm3
0x100743aa9: vmaxss xmm3, xmm3, xmm2
0x100743aad: vmovss xmm5, dword ptr [rip + 0x36160b] ; 0x100aa50c0
0x100743ab5: vminss xmm3, xmm5, xmm3
0x100743ab9: vsubss xmm5, xmm5, xmm3
0x100743abd: vmulss xmm0, xmm3, xmm0
0x100743ac1: vaddss xmm0, xmm5, xmm0
0x100743ac5: vmulss xmm0, xmm4, xmm0
0x100743ac9: vmovss dword ptr [rsi], xmm0
0x100743acd: vmovss xmm0, dword ptr [rdx]
0x100743ad1: vucomiss xmm8, xmm0
0x100743ad5: je 0x100743bd7
0x100743adb: vmovss xmm3, dword ptr [rdi + 0x204]
0x100743ae3: vxorps xmm5, xmm5, xmm5
0x100743ae7: vucomiss xmm3, xmm5
0x100743aeb: jbe 0x100743bd7
0x100743af1: vmovss xmm4, dword ptr [rdi + 0x200]
0x100743af9: vaddss xmm3, xmm0, xmm1
0x100743afd: vsubss xmm3, xmm4, xmm3
0x100743b01: vandps xmm3, xmm3, xmmword ptr [rip + 0x363e07] ; 0x100aa7910
0x100743b09: vmulss xmm3, xmm3, dword ptr [rip + 0x364af3] ; 0x100aa8604
0x100743b11: vdivss xmm3, xmm3, dword ptr [rip + 0x364ae7] ; 0x100aa8600
0x100743b19: vucomiss xmm0, xmm5
0x100743b1d: jbe 0x100743b25
0x100743b1f: vucomiss xmm4, xmm1
0x100743b23: ja 0x100743b3d
0x100743b25: vxorps xmm5, xmm5, xmm5
0x100743b29: vucomiss xmm5, xmm0
0x100743b2d: jbe 0x100743c20
0x100743b33: vucomiss xmm1, xmm4
0x100743b37: jbe 0x100743c20
0x100743b3d: vmovss xmm1, dword ptr [rip + 0x36157b] ; 0x100aa50c0
0x100743b45: vmovss xmm4, dword ptr [rip + 0x365b23] ; 0x100aa9670
0x100743b4d: vucomiss xmm4, xmm3
0x100743b51: jae 0x100743b8a
0x100743b53: vaddss xmm3, xmm3, dword ptr [rip + 0x371b1d] ; 0x100ab5678
0x100743b5b: vdivss xmm3, xmm3, dword ptr [rip + 0x363595] ; 0x100aa70f8
0x100743b63: vxorps xmm4, xmm4, xmm4
0x100743b67: vmaxss xmm3, xmm4, xmm3
0x100743b6b: vminss xmm3, xmm1, xmm3
0x100743b6f: vsubss xmm1, xmm1, xmm3
0x100743b73: vmulss xmm3, xmm3, dword ptr [rip + 0x36ae5d] ; 0x100aae9d8
0x100743b7b: vaddss xmm1, xmm3, xmm1
0x100743b7f: cmp byte ptr [rip + 0x5cbcef], 0 ; 0x100d0f875
0x100743b86: jne 0x100743baf
0x100743b88: jmp 0x100743bd7 ; 0x100743bd7
0x100743b8a: vmulss xmm3, xmm3, dword ptr [rip + 0x367cae] ; 0x100aab840
0x100743b92: vminss xmm3, xmm1, xmm3
0x100743b96: vsubss xmm1, xmm1, xmm3
0x100743b9a: vmulss xmm1, xmm1, dword ptr [rip + 0x364a8e] ; 0x100aa8630
0x100743ba2: vaddss xmm1, xmm3, xmm1
0x100743ba6: cmp byte ptr [rip + 0x5cbcc8], 0 ; 0x100d0f875
0x100743bad: je 0x100743bd7
0x100743baf: vxorps xmm3, xmm3, xmm3
0x100743bb3: vmaxss xmm2, xmm3, xmm2
0x100743bb7: vmovss xmm3, dword ptr [rip + 0x361501] ; 0x100aa50c0
0x100743bbf: vminss xmm2, xmm3, xmm2
0x100743bc3: vsubss xmm3, xmm3, xmm2
0x100743bc7: vmulss xmm1, xmm2, xmm1
0x100743bcb: vaddss xmm1, xmm3, xmm1
0x100743bcf: vmulss xmm0, xmm0, xmm1
0x100743bd3: vmovss dword ptr [rdx], xmm0
0x100743bd7: pop rbp
0x100743bd8: ret 
0x100743bd9: vucomiss xmm0, dword ptr [rip + 0x363bfb] ; 0x100aa77dc
0x100743be1: jbe 0x100743bea
0x100743be3: mov byte ptr [rdi + 0x101], 1
0x100743bea: vdivss xmm0, xmm0, dword ptr [rip + 0x364a7a] ; 0x100aa866c
0x100743bf2: vmovss xmm3, dword ptr [rip + 0x3614c6] ; 0x100aa50c0
0x100743bfa: vminss xmm0, xmm3, xmm0
0x100743bfe: vsubss xmm3, xmm3, xmm0
0x100743c02: vmulss xmm3, xmm3, dword ptr [rip + 0x364a26] ; 0x100aa8630
0x100743c0a: vaddss xmm0, xmm0, xmm3
0x100743c0e: cmp byte ptr [rip + 0x5cbc60], 0 ; 0x100d0f875
0x100743c15: jne 0x100743aa5
0x100743c1b: jmp 0x100743acd ; 0x100743acd
0x100743c20: vdivss xmm1, xmm3, dword ptr [rip + 0x3915e8] ; 0x100ad5210
0x100743c28: vmovss xmm3, dword ptr [rip + 0x361490] ; 0x100aa50c0
0x100743c30: vminss xmm1, xmm3, xmm1
0x100743c34: vsubss xmm3, xmm3, xmm1
0x100743c38: vmulss xmm3, xmm3, dword ptr [rip + 0x3649f0] ; 0x100aa8630
0x100743c40: vaddss xmm1, xmm1, xmm3
0x100743c44: cmp byte ptr [rip + 0x5cbc2a], 0 ; 0x100d0f875
0x100743c4b: jne 0x100743baf
0x100743c51: jmp 0x100743bd7 ; 0x100743bd7
0x100743c53: nop word ptr cs:[rax + rax]
