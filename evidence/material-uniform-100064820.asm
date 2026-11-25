0x100064820: push rbp
0x100064821: mov rbp, rsp
0x100064824: push r14
0x100064826: push rbx
0x100064827: sub rsp, 0x70
0x10006482b: vmovss dword ptr [rbp - 0x18], xmm1
0x100064830: vmovss dword ptr [rbp - 0x14], xmm0
0x100064835: mov rbx, rsi
0x100064838: mov r14, rdi
0x10006483b: vmovss xmm2, dword ptr [rip + 0xa43e55] ; 0x100aa8698
0x100064843: vsubss xmm2, xmm2, xmm0
0x100064847: vmulss xmm0, xmm2, xmm2
0x10006484b: vmulss xmm0, xmm0, xmm1
0x10006484f: vxorps xmm0, xmm0, xmmword ptr [rip + 0xa430a9] ; 0x100aa7900
0x100064857: call 0x100aa2708 ; 0x100aa2708 _expf
0x10006485c: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x100064861: vmovss xmm0, dword ptr [rbp - 0x14]
0x100064866: vmulss xmm0, xmm0, xmm0
0x10006486a: vmulss xmm0, xmm0, dword ptr [rbp - 0x18]
0x10006486f: vxorps xmm0, xmm0, xmmword ptr [rip + 0xa43089] ; 0x100aa7900
0x100064877: call 0x100aa2708 ; 0x100aa2708 _expf
0x10006487c: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x100064881: vmovss xmm0, dword ptr [rip + 0xa4286b] ; 0x100aa70f4
0x100064889: vsubss xmm0, xmm0, dword ptr [rbp - 0x14]
0x10006488e: vmulss xmm0, xmm0, xmm0
0x100064892: vmulss xmm0, xmm0, dword ptr [rbp - 0x18]
0x100064897: vxorps xmm0, xmm0, xmmword ptr [rip + 0xa43061] ; 0x100aa7900
0x10006489f: call 0x100aa2708 ; 0x100aa2708 _expf
0x1000648a4: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1000648a9: vmovss xmm0, dword ptr [rip + 0xa3fd07] ; 0x100aa45b8
0x1000648b1: vsubss xmm0, xmm0, dword ptr [rbp - 0x14]
0x1000648b6: vmulss xmm0, xmm0, xmm0
0x1000648ba: vmulss xmm0, xmm0, dword ptr [rbp - 0x18]
0x1000648bf: vxorps xmm0, xmm0, xmmword ptr [rip + 0xa43039] ; 0x100aa7900
0x1000648c7: call 0x100aa2708 ; 0x100aa2708 _expf
0x1000648cc: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1000648d1: vmovss xmm0, dword ptr [rip + 0xa43d1b] ; 0x100aa85f4
0x1000648d9: vsubss xmm0, xmm0, dword ptr [rbp - 0x14]
0x1000648de: vmulss xmm0, xmm0, xmm0
0x1000648e2: vmulss xmm0, xmm0, dword ptr [rbp - 0x18]
0x1000648e7: vxorps xmm0, xmm0, xmmword ptr [rip + 0xa43011] ; 0x100aa7900
0x1000648ef: call 0x100aa2708 ; 0x100aa2708 _expf
0x1000648f4: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1000648f9: vmovss xmm0, dword ptr [rip + 0xa407bf] ; 0x100aa50c0
0x100064901: vsubss xmm0, xmm0, dword ptr [rbp - 0x14]
0x100064906: vmulss xmm0, xmm0, xmm0
0x10006490a: vmulss xmm0, xmm0, dword ptr [rbp - 0x18]
0x10006490f: vxorps xmm0, xmm0, xmmword ptr [rip + 0xa42fe9] ; 0x100aa7900
0x100064917: call 0x100aa2708 ; 0x100aa2708 _expf
0x10006491c: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x100064921: vmovss xmm0, dword ptr [rip + 0xa43d73] ; 0x100aa869c
0x100064929: vsubss xmm0, xmm0, dword ptr [rbp - 0x14]
0x10006492e: vmulss xmm0, xmm0, xmm0
0x100064932: vmulss xmm0, xmm0, dword ptr [rbp - 0x18]
0x100064937: vxorps xmm0, xmm0, xmmword ptr [rip + 0xa42fc1] ; 0x100aa7900
0x10006493f: call 0x100aa2708 ; 0x100aa2708 _expf
0x100064944: vmovaps xmm4, xmmword ptr [rbp - 0x80]
0x100064949: vmovaps xmm5, xmmword ptr [rbp - 0x70]
0x10006494e: vaddss xmm1, xmm4, xmm5
0x100064952: vmovaps xmm6, xmmword ptr [rbp - 0x60]
0x100064957: vaddss xmm1, xmm1, xmm6
0x10006495b: vmovaps xmm7, xmmword ptr [rbp - 0x50]
0x100064960: vaddss xmm1, xmm1, xmm7
0x100064964: vmovaps xmm2, xmmword ptr [rbp - 0x40]
0x100064969: vaddss xmm1, xmm1, xmm2
0x10006496d: vmovaps xmm9, xmmword ptr [rbp - 0x30]
0x100064972: vaddss xmm1, xmm1, xmm9
0x100064977: vaddss xmm8, xmm1, xmm0
0x10006497b: vmovaps xmm1, xmmword ptr [rbx + 0x60]
0x100064980: vmovaps xmm3, xmmword ptr [rbx + 0xa0]
0x100064988: vpermilps xmm4, xmm4, 0xc0
0x10006498e: vmulps xmm4, xmm4, xmm3
0x100064992: vpermilps xmm5, xmm5, 0xc0
0x100064998: vmulps xmm3, xmm5, xmm3
0x10006499c: vaddps xmm3, xmm4, xmm3
0x1000649a0: vpermilps xmm4, xmm6, 0xc0
0x1000649a6: vmulps xmm4, xmm4, xmmword ptr [rbx + 0x90]
0x1000649ae: vaddps xmm3, xmm3, xmm4
0x1000649b2: vpermilps xmm4, xmm7, 0xc0
0x1000649b8: vmulps xmm4, xmm4, xmmword ptr [rbx + 0x80]
0x1000649c0: vaddps xmm3, xmm3, xmm4
0x1000649c4: vpermilps xmm4, xmm2, 0xc0
0x1000649ca: vmulps xmm4, xmm4, xmmword ptr [rbx + 0x70]
0x1000649cf: vaddps xmm3, xmm3, xmm4
0x1000649d3: vpermilps xmm4, xmm9, 0xc0
0x1000649d9: vmulps xmm4, xmm4, xmm1
0x1000649dd: vaddps xmm3, xmm3, xmm4
0x1000649e1: vpermilps xmm0, xmm0, 0xc0
0x1000649e7: vmulps xmm0, xmm0, xmm1
0x1000649eb: vaddps xmm0, xmm0, xmm3
0x1000649ef: vpermilps xmm1, xmm8, 0xc0
0x1000649f5: vdivps xmm0, xmm0, xmm1
0x1000649f9: vmovss xmm1, dword ptr [rip + 0xa406bf] ; 0x100aa50c0
0x100064a01: vinsertps xmm0, xmm0, xmm1, 0x30
0x100064a07: vmovaps xmmword ptr [r14], xmm0
0x100064a0c: mov rax, r14
0x100064a0f: add rsp, 0x70
0x100064a13: pop rbx
0x100064a14: pop r14
0x100064a16: pop rbp
0x100064a17: ret 
0x100064a18: nop dword ptr [rax + rax]
