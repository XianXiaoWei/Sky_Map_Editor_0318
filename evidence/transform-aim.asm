0x1007f3180: push rbp
0x1007f3181: mov rbp, rsp
0x1007f3184: push r15
0x1007f3186: push r14
0x1007f3188: push rbx
0x1007f3189: sub rsp, 0x58
0x1007f318d: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x1007f3192: mov r15, rdx
0x1007f3195: mov rbx, rsi
0x1007f3198: mov r14, rdi
0x1007f319b: call 0x1007f2c20 ; 0x1007f2c20
0x1007f31a0: mov rsi, r14
0x1007f31a3: sub rsi, -0x80
0x1007f31a7: lea rdi, [rbp - 0x70]
0x1007f31ab: call 0x100076940 ; 0x100076940
0x1007f31b0: vmovaps xmm0, xmmword ptr [rbx]
0x1007f31b4: vpermilps xmm1, xmm0, 0
0x1007f31ba: vmulps xmm1, xmm1, xmmword ptr [rbp - 0x70]
0x1007f31bf: vpermilps xmm2, xmm0, 0x55
0x1007f31c5: vmulps xmm2, xmm2, xmmword ptr [rbp - 0x60]
0x1007f31ca: vaddps xmm1, xmm1, xmm2
0x1007f31ce: vpermilps xmm0, xmm0, 0xaa
0x1007f31d4: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x50]
0x1007f31d9: vaddps xmm0, xmm1, xmm0
0x1007f31dd: vaddps xmm1, xmm0, xmmword ptr [rbp - 0x40]
0x1007f31e2: vmulps xmm0, xmm1, xmm1
0x1007f31e6: vmovshdup xmm2, xmm0
0x1007f31ea: vaddss xmm2, xmm0, xmm2
0x1007f31ee: vpermilpd xmm0, xmm0, 1
0x1007f31f4: vaddss xmm0, xmm0, xmm2
0x1007f31f8: vsqrtss xmm0, xmm0, xmm0
0x1007f31fc: vucomiss xmm0, dword ptr [rip + 0x2b46c0] ; 0x100aa78c4
0x1007f3204: jbe 0x1007f3210
0x1007f3206: vpermilps xmm0, xmm0, 0xc0
0x1007f320c: vdivps xmm1, xmm1, xmm0
0x1007f3210: vmovaps xmm0, xmmword ptr [r15]
0x1007f3215: vmulps xmm2, xmm1, xmm0
0x1007f3219: vmovshdup xmm3, xmm2
0x1007f321d: vaddss xmm3, xmm2, xmm3
0x1007f3221: vpermilpd xmm2, xmm2, 1
0x1007f3227: vaddss xmm2, xmm2, xmm3
0x1007f322b: vucomiss xmm2, dword ptr [rip + 0x2db199] ; 0x100ace3cc
0x1007f3233: jbe 0x1007f3288
0x1007f3235: vmovss xmm3, dword ptr [rip + 0x2b1e83] ; 0x100aa50c0
0x1007f323d: vaddss xmm2, xmm2, xmm3
0x1007f3241: vaddss xmm2, xmm2, xmm2
0x1007f3245: vsqrtss xmm2, xmm2, xmm2
0x1007f3249: vdivss xmm3, xmm3, xmm2
0x1007f324d: vpermilps xmm4, xmm0, 0xd2
0x1007f3253: vmulps xmm4, xmm1, xmm4
0x1007f3257: vpermilps xmm1, xmm1, 0xd2
0x1007f325d: vmulps xmm0, xmm1, xmm0
0x1007f3261: vsubps xmm0, xmm4, xmm0
0x1007f3265: vpermilps xmm0, xmm0, 0xd2
0x1007f326b: vpermilps xmm1, xmm3, 0xc0
0x1007f3271: vmulps xmm0, xmm0, xmm1
0x1007f3275: vmulss xmm1, xmm2, dword ptr [rip + 0x2b133b] ; 0x100aa45b8
0x1007f327d: vinsertps xmm0, xmm0, xmm1, 0x30
0x1007f3283: jmp 0x1007f332e ; 0x1007f332e
0x1007f3288: vmovddup xmm1, qword ptr [rip + 0x2b4648] ; 0x100aa78d8
0x1007f3290: vmulps xmm2, xmm0, xmm1
0x1007f3294: vmovshdup xmm3, xmm2
0x1007f3298: vaddss xmm3, xmm2, xmm3
0x1007f329c: vpermilpd xmm2, xmm2, 1
0x1007f32a2: vaddss xmm2, xmm2, xmm3
0x1007f32a6: vandps xmm2, xmm2, xmmword ptr [rip + 0x2b4662] ; 0x100aa7910
0x1007f32ae: vucomiss xmm2, dword ptr [rip + 0x2b56e6] ; 0x100aa899c
0x1007f32b6: jbe 0x1007f32c0
0x1007f32b8: vmovss xmm1, dword ptr [rip + 0x2b1e00] ; 0x100aa50c0
0x1007f32c0: vpermilps xmm2, xmm1, 0xd2
0x1007f32c6: vmulps xmm2, xmm0, xmm2
0x1007f32ca: vpermilps xmm3, xmm0, 0xd2
0x1007f32d0: vmulps xmm1, xmm3, xmm1
0x1007f32d4: vsubps xmm1, xmm2, xmm1
0x1007f32d8: vpermilps xmm1, xmm1, 0xd2
0x1007f32de: vmulps xmm2, xmm3, xmm1
0x1007f32e2: vpermilps xmm1, xmm1, 0xd2
0x1007f32e8: vmulps xmm0, xmm0, xmm1
0x1007f32ec: vsubps xmm1, xmm2, xmm0
0x1007f32f0: vpermilps xmm0, xmm1, 0xd2
0x1007f32f6: vmulps xmm1, xmm1, xmm1
0x1007f32fa: vpermilpd xmm2, xmm1, 1
0x1007f3300: vaddss xmm2, xmm2, xmm1
0x1007f3304: vmovshdup xmm1, xmm1
0x1007f3308: vaddss xmm1, xmm1, xmm2
0x1007f330c: vsqrtss xmm1, xmm1, xmm1
0x1007f3310: vucomiss xmm1, dword ptr [rip + 0x2b45ac] ; 0x100aa78c4
0x1007f3318: jbe 0x1007f3324
0x1007f331a: vpermilps xmm1, xmm1, 0xc0
0x1007f3320: vdivps xmm0, xmm0, xmm1
0x1007f3324: vinsertps xmm0, xmm0, dword ptr [rip + 0x2ba216], 0x30 ; 0x100aad544
0x1007f332e: vmovaps xmm1, xmmword ptr [rip + 0x2b56ca] ; 0x100aa8a00
0x1007f3336: vmulps xmm2, xmm0, xmm1
0x1007f333a: vpermilpd xmm3, xmm2, 1
0x1007f3340: vaddps xmm2, xmm2, xmm3
0x1007f3344: vmovshdup xmm3, xmm2
0x1007f3348: vaddss xmm2, xmm2, xmm3
0x1007f334c: vxorps xmm3, xmm3, xmm3
0x1007f3350: vucomiss xmm3, xmm2
0x1007f3354: vmovss xmm2, dword ptr [rip + 0x2b1d64] ; 0x100aa50c0
0x1007f335c: vmovaps xmm3, xmmword ptr [rbp - 0x30]
0x1007f3361: vsubss xmm2, xmm2, xmm3
0x1007f3365: vpermilps xmm2, xmm2, 0
0x1007f336b: vmulps xmm1, xmm2, xmm1
0x1007f336f: vpermilps xmm2, xmm3, 0
0x1007f3375: vmulps xmm0, xmm2, xmm0
0x1007f3379: jbe 0x1007f3381
0x1007f337b: vsubps xmm0, xmm1, xmm0
0x1007f337f: jmp 0x1007f3385 ; 0x1007f3385
0x1007f3381: vaddps xmm0, xmm1, xmm0
0x1007f3385: vmulps xmm1, xmm0, xmm0
0x1007f3389: vpermilpd xmm2, xmm1, 1
0x1007f338f: vaddps xmm1, xmm1, xmm2
0x1007f3393: vmovshdup xmm2, xmm1
0x1007f3397: vaddss xmm1, xmm1, xmm2
0x1007f339b: vsqrtss xmm1, xmm1, xmm1
0x1007f339f: vucomiss xmm1, dword ptr [rip + 0x2b451d] ; 0x100aa78c4
0x1007f33a7: jbe 0x1007f33b3
0x1007f33a9: vpermilps xmm1, xmm1, 0
0x1007f33af: vdivps xmm0, xmm0, xmm1
0x1007f33b3: vmovaps xmm1, xmmword ptr [r14 + 0x30]
0x1007f33b9: vpermilps xmm2, xmm1, 0xe7
0x1007f33bf: vpermilps xmm3, xmm1, 0xff
0x1007f33c5: vmulps xmm3, xmm0, xmm3
0x1007f33c9: vpermilps xmm4, xmm0, 0xe7
0x1007f33cf: vpermilps xmm5, xmm0, 0xff
0x1007f33d5: vmulps xmm5, xmm5, xmm1
0x1007f33d9: vaddps xmm3, xmm3, xmm5
0x1007f33dd: vpermilps xmm5, xmm1, 0xd2
0x1007f33e3: vmulps xmm5, xmm0, xmm5
0x1007f33e7: vpermilps xmm6, xmm0, 0xd2
0x1007f33ed: vmulps xmm6, xmm6, xmm1
0x1007f33f1: vsubps xmm5, xmm5, xmm6
0x1007f33f5: vpermilps xmm5, xmm5, 0xd2
0x1007f33fb: vaddps xmm3, xmm3, xmm5
0x1007f33ff: vmulss xmm2, xmm4, xmm2
0x1007f3403: vmulps xmm0, xmm0, xmm1
0x1007f3407: vmovshdup xmm1, xmm0
0x1007f340b: vaddss xmm1, xmm0, xmm1
0x1007f340f: vpermilpd xmm0, xmm0, 1
0x1007f3415: vaddss xmm0, xmm0, xmm1
0x1007f3419: vsubss xmm0, xmm2, xmm0
0x1007f341d: vinsertps xmm0, xmm3, xmm0, 0x30
0x1007f3423: vmovaps xmmword ptr [r14 + 0x30], xmm0
0x1007f3429: mov rdi, r14
0x1007f342c: call 0x1007f2740 ; 0x1007f2740
0x1007f3431: add rsp, 0x58
0x1007f3435: pop rbx
0x1007f3436: pop r14
0x1007f3438: pop r15
0x1007f343a: pop rbp
0x1007f343b: ret 
0x1007f343c: nop dword ptr [rax]
