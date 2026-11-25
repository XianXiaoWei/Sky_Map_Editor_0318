0x10078c720: push rbp
0x10078c721: mov rbp, rsp
0x10078c724: vmovaps xmm2, xmmword ptr [rdi]
0x10078c728: vmovaps xmm3, xmmword ptr [rdi + 0x10]
0x10078c72d: vmovaps xmm4, xmmword ptr [rdi + 0x20]
0x10078c732: vmovaps xmm0, xmmword ptr [rdi + 0x30]
0x10078c737: vsubps xmm1, xmm2, xmm3
0x10078c73b: vsubps xmm5, xmm1, xmm4
0x10078c73f: vaddps xmm1, xmm1, xmm4
0x10078c743: vaddps xmm6, xmm2, xmm3
0x10078c747: vsubps xmm7, xmm6, xmm4
0x10078c74b: vaddps xmm11, xmm6, xmm4
0x10078c74f: vxorps xmm6, xmm2, xmmword ptr [rip + 0x31b1a9] ; 0x100aa7900
0x10078c757: vsubps xmm6, xmm6, xmm3
0x10078c75b: vsubps xmm10, xmm6, xmm4
0x10078c75f: vaddps xmm9, xmm4, xmm6
0x10078c763: vsubps xmm2, xmm3, xmm2
0x10078c767: vsubps xmm12, xmm2, xmm4
0x10078c76b: vaddps xmm8, xmm4, xmm2
0x10078c76f: vmovaps xmm2, xmmword ptr [rip + 0x328d09] ; 0x100ab5480 (knN(knN(knN
0x10078c777: vmovaps xmmword ptr [rsi], xmm2
0x10078c77b: vmovaps xmm2, xmmword ptr [rip + 0x34eccd] ; 0x100adb450
0x10078c783: vmovaps xmmword ptr [rdx], xmm2
0x10078c787: vsubps xmm4, xmm0, xmm5
0x10078c78b: vmovaps xmm6, xmmword ptr [rsi]
0x10078c78f: vminps xmm3, xmm6, xmm4
0x10078c793: vxorps xmm2, xmm2, xmm2
0x10078c797: vcmpunordps xmm4, xmm4, xmm2
0x10078c79c: vblendvps xmm3, xmm3, xmm6, xmm4
0x10078c7a2: vmovaps xmmword ptr [rsi], xmm3
0x10078c7a6: vaddps xmm3, xmm0, xmm5
0x10078c7aa: vmovaps xmm4, xmmword ptr [rdx]
0x10078c7ae: vmaxps xmm5, xmm4, xmm3
0x10078c7b2: vcmpunordps xmm3, xmm3, xmm2
0x10078c7b7: vblendvps xmm3, xmm5, xmm4, xmm3
0x10078c7bd: vmovaps xmmword ptr [rdx], xmm3
0x10078c7c1: vsubps xmm3, xmm0, xmm1
0x10078c7c5: vmovaps xmm4, xmmword ptr [rsi]
0x10078c7c9: vminps xmm5, xmm4, xmm3
0x10078c7cd: vcmpunordps xmm3, xmm3, xmm2
0x10078c7d2: vblendvps xmm3, xmm5, xmm4, xmm3
0x10078c7d8: vmovaps xmmword ptr [rsi], xmm3
0x10078c7dc: vaddps xmm1, xmm0, xmm1
0x10078c7e0: vmovaps xmm3, xmmword ptr [rdx]
0x10078c7e4: vmaxps xmm4, xmm3, xmm1
0x10078c7e8: vcmpunordps xmm1, xmm1, xmm2
0x10078c7ed: vblendvps xmm1, xmm4, xmm3, xmm1
0x10078c7f3: vmovaps xmmword ptr [rdx], xmm1
0x10078c7f7: vsubps xmm1, xmm0, xmm7
0x10078c7fb: vmovaps xmm3, xmmword ptr [rsi]
0x10078c7ff: vminps xmm4, xmm3, xmm1
0x10078c803: vcmpunordps xmm1, xmm1, xmm2
0x10078c808: vblendvps xmm1, xmm4, xmm3, xmm1
0x10078c80e: vmovaps xmmword ptr [rsi], xmm1
0x10078c812: vaddps xmm1, xmm0, xmm7
0x10078c816: vmovaps xmm3, xmmword ptr [rdx]
0x10078c81a: vmaxps xmm4, xmm3, xmm1
0x10078c81e: vcmpunordps xmm1, xmm1, xmm2
0x10078c823: vblendvps xmm1, xmm4, xmm3, xmm1
0x10078c829: vmovaps xmmword ptr [rdx], xmm1
0x10078c82d: vsubps xmm1, xmm0, xmm11
0x10078c832: vmovaps xmm3, xmmword ptr [rsi]
0x10078c836: vminps xmm4, xmm3, xmm1
0x10078c83a: vcmpunordps xmm1, xmm1, xmm2
0x10078c83f: vblendvps xmm1, xmm4, xmm3, xmm1
0x10078c845: vmovaps xmmword ptr [rsi], xmm1
0x10078c849: vaddps xmm1, xmm0, xmm11
0x10078c84e: vmovaps xmm3, xmmword ptr [rdx]
0x10078c852: vmaxps xmm4, xmm3, xmm1
0x10078c856: vcmpunordps xmm1, xmm1, xmm2
0x10078c85b: vblendvps xmm1, xmm4, xmm3, xmm1
0x10078c861: vmovaps xmmword ptr [rdx], xmm1
0x10078c865: vsubps xmm1, xmm0, xmm10
0x10078c86a: vmovaps xmm3, xmmword ptr [rsi]
0x10078c86e: vminps xmm4, xmm3, xmm1
0x10078c872: vcmpunordps xmm1, xmm1, xmm2
0x10078c877: vblendvps xmm1, xmm4, xmm3, xmm1
0x10078c87d: vmovaps xmmword ptr [rsi], xmm1
0x10078c881: vaddps xmm1, xmm0, xmm10
0x10078c886: vmovaps xmm3, xmmword ptr [rdx]
0x10078c88a: vmaxps xmm4, xmm3, xmm1
0x10078c88e: vcmpunordps xmm1, xmm1, xmm2
0x10078c893: vblendvps xmm1, xmm4, xmm3, xmm1
0x10078c899: vmovaps xmmword ptr [rdx], xmm1
0x10078c89d: vsubps xmm1, xmm0, xmm9
0x10078c8a2: vmovaps xmm3, xmmword ptr [rsi]
0x10078c8a6: vminps xmm4, xmm3, xmm1
0x10078c8aa: vcmpunordps xmm1, xmm1, xmm2
0x10078c8af: vblendvps xmm1, xmm4, xmm3, xmm1
0x10078c8b5: vmovaps xmmword ptr [rsi], xmm1
0x10078c8b9: vaddps xmm1, xmm0, xmm9
0x10078c8be: vmovaps xmm3, xmmword ptr [rdx]
0x10078c8c2: vmaxps xmm4, xmm3, xmm1
0x10078c8c6: vcmpunordps xmm1, xmm1, xmm2
0x10078c8cb: vblendvps xmm1, xmm4, xmm3, xmm1
0x10078c8d1: vmovaps xmmword ptr [rdx], xmm1
0x10078c8d5: vsubps xmm1, xmm0, xmm12
0x10078c8da: vmovaps xmm3, xmmword ptr [rsi]
0x10078c8de: vminps xmm4, xmm3, xmm1
0x10078c8e2: vcmpunordps xmm1, xmm1, xmm2
0x10078c8e7: vblendvps xmm1, xmm4, xmm3, xmm1
0x10078c8ed: vmovaps xmmword ptr [rsi], xmm1
0x10078c8f1: vaddps xmm1, xmm0, xmm12
0x10078c8f6: vmovaps xmm3, xmmword ptr [rdx]
0x10078c8fa: vmaxps xmm4, xmm3, xmm1
0x10078c8fe: vcmpunordps xmm1, xmm1, xmm2
0x10078c903: vblendvps xmm1, xmm4, xmm3, xmm1
0x10078c909: vmovaps xmmword ptr [rdx], xmm1
0x10078c90d: vsubps xmm1, xmm0, xmm8
0x10078c912: vmovaps xmm3, xmmword ptr [rsi]
0x10078c916: vminps xmm4, xmm3, xmm1
0x10078c91a: vcmpunordps xmm1, xmm1, xmm2
0x10078c91f: vblendvps xmm1, xmm4, xmm3, xmm1
0x10078c925: vmovaps xmmword ptr [rsi], xmm1
0x10078c929: vaddps xmm0, xmm0, xmm8
0x10078c92e: vmovaps xmm1, xmmword ptr [rdx]
0x10078c932: vmaxps xmm3, xmm1, xmm0
0x10078c936: vcmpunordps xmm0, xmm0, xmm2
0x10078c93b: vblendvps xmm0, xmm3, xmm1, xmm0
0x10078c941: vmovaps xmmword ptr [rdx], xmm0
0x10078c945: pop rbp
0x10078c946: ret 
0x10078c947: nop word ptr [rax + rax]
