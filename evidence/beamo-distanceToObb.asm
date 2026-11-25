0x10078ce10: push rbp
0x10078ce11: mov rbp, rsp
0x10078ce14: vmovaps xmm0, xmmword ptr [rdi]
0x10078ce18: vsubps xmm0, xmm0, xmmword ptr [rsi + 0x30]
0x10078ce1d: vmovaps xmm3, xmmword ptr [rsi]
0x10078ce21: vmovaps xmm4, xmmword ptr [rsi + 0x10]
0x10078ce26: vmovaps xmm2, xmmword ptr [rsi + 0x20]
0x10078ce2b: vmulps xmm1, xmm3, xmm3
0x10078ce2f: vmovshdup xmm5, xmm1
0x10078ce33: vaddss xmm5, xmm1, xmm5
0x10078ce37: vpermilpd xmm1, xmm1, 1
0x10078ce3d: vaddss xmm1, xmm1, xmm5
0x10078ce41: vsqrtss xmm9, xmm1, xmm1
0x10078ce45: vmulps xmm5, xmm4, xmm4
0x10078ce49: vmovshdup xmm6, xmm5
0x10078ce4d: vaddss xmm6, xmm5, xmm6
0x10078ce51: vpermilpd xmm5, xmm5, 1
0x10078ce57: vaddss xmm5, xmm5, xmm6
0x10078ce5b: vsqrtss xmm5, xmm5, xmm5
0x10078ce5f: vmulps xmm6, xmm2, xmm2
0x10078ce63: vmovshdup xmm7, xmm6
0x10078ce67: vaddss xmm7, xmm6, xmm7
0x10078ce6b: vpermilpd xmm6, xmm6, 1
0x10078ce71: vaddss xmm6, xmm6, xmm7
0x10078ce75: vucomiss xmm9, dword ptr [rip + 0x31aa47] ; 0x100aa78c4
0x10078ce7d: ja 0x10078cf49
0x10078ce83: vsqrtss xmm6, xmm6, xmm6
0x10078ce87: vucomiss xmm5, dword ptr [rip + 0x31aa35] ; 0x100aa78c4
0x10078ce8f: ja 0x10078cf65
0x10078ce95: vucomiss xmm6, dword ptr [rip + 0x31aa27] ; 0x100aa78c4
0x10078ce9d: jbe 0x10078cea9
0x10078ce9f: vpermilps xmm7, xmm6, 0xc0
0x10078cea5: vdivps xmm2, xmm2, xmm7
0x10078cea9: vmulps xmm3, xmm0, xmm3
0x10078cead: vmulps xmm4, xmm0, xmm4
0x10078ceb1: vmovshdup xmm7, xmm4
0x10078ceb5: vaddss xmm7, xmm4, xmm7
0x10078ceb9: vpermilpd xmm4, xmm4, 1
0x10078cebf: vaddss xmm4, xmm4, xmm7
0x10078cec3: vmovaps xmm8, xmmword ptr [rip + 0x31aa35] ; 0x100aa7900
0x10078cecb: vxorps xmm7, xmm5, xmm8
0x10078ced0: vaddss xmm1, xmm5, xmm4
0x10078ced4: vcmpltss xmm7, xmm4, xmm7
0x10078ced9: vandps xmm1, xmm7, xmm1
0x10078cedd: vsubss xmm7, xmm4, xmm5
0x10078cee1: vcmpltss xmm4, xmm5, xmm4
0x10078cee6: vblendvps xmm1, xmm1, xmm7, xmm4
0x10078ceec: vmulss xmm1, xmm1, xmm1
0x10078cef0: vmulps xmm0, xmm0, xmm2
0x10078cef4: vinsertps xmm2, xmm3, xmm0, 0x1c
0x10078cefa: vinsertps xmm4, xmm0, xmm3, 0x4c
0x10078cf00: vaddps xmm2, xmm2, xmm4
0x10078cf04: vunpckhps xmm0, xmm3, xmm0
0x10078cf08: vaddps xmm0, xmm0, xmm2
0x10078cf0c: vinsertps xmm2, xmm9, xmm6, 0x10
0x10078cf12: vxorps xmm3, xmm2, xmm8
0x10078cf17: vcmpltps xmm3, xmm0, xmm3
0x10078cf1c: vaddps xmm4, xmm0, xmm2
0x10078cf20: vandps xmm3, xmm3, xmm4
0x10078cf24: vcmpltps xmm4, xmm2, xmm0
0x10078cf29: vsubps xmm0, xmm0, xmm2
0x10078cf2d: vblendvps xmm0, xmm3, xmm0, xmm4
0x10078cf33: vmulps xmm0, xmm0, xmm0
0x10078cf37: vaddss xmm1, xmm0, xmm1
0x10078cf3b: vmovshdup xmm0, xmm0
0x10078cf3f: vaddss xmm0, xmm1, xmm0
0x10078cf43: vsqrtss xmm0, xmm0, xmm0
0x10078cf47: pop rbp
0x10078cf48: ret 
0x10078cf49: vpermilps xmm7, xmm9, 0xc0
0x10078cf4f: vdivps xmm3, xmm3, xmm7
0x10078cf53: vsqrtss xmm6, xmm6, xmm6
0x10078cf57: vucomiss xmm5, dword ptr [rip + 0x31a965] ; 0x100aa78c4
0x10078cf5f: jbe 0x10078ce95
0x10078cf65: vpermilps xmm7, xmm5, 0xc0
0x10078cf6b: vdivps xmm4, xmm4, xmm7
0x10078cf6f: vucomiss xmm6, dword ptr [rip + 0x31a94d] ; 0x100aa78c4
0x10078cf77: ja 0x10078ce9f
0x10078cf7d: jmp 0x10078cea9 ; 0x10078cea9
0x10078cf82: nop word ptr cs:[rax + rax]
