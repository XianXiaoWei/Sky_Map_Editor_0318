0x1004d2260: push rbp
0x1004d2261: mov rbp, rsp
0x1004d2264: push r15
0x1004d2266: push r14
0x1004d2268: push r12
0x1004d226a: push rbx
0x1004d226b: sub rsp, 0xc0
0x1004d2272: mov rbx, rsi
0x1004d2275: mov r14, rdi
0x1004d2278: lea r15, [rbp - 0xe0]
0x1004d227f: mov rdi, r15
0x1004d2282: call 0x1004d1e40 ; 0x1004d1e40
0x1004d2287: lea r12, [rbp - 0xa0]
0x1004d228e: mov rdi, r12
0x1004d2291: mov rsi, rbx
0x1004d2294: call 0x1004d2140 ; 0x1004d2140
0x1004d2299: lea rdi, [rbp - 0x60]
0x1004d229d: mov rsi, r15
0x1004d22a0: mov rdx, r12
0x1004d22a3: call 0x100076df0 ; 0x100076df0
0x1004d22a8: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x1004d22ad: vmovaps xmm1, xmmword ptr [rbp - 0x50]
0x1004d22b2: vmovaps xmm2, xmmword ptr [rbp - 0x40]
0x1004d22b7: vmulps xmm0, xmm0, xmm0
0x1004d22bb: vmovshdup xmm3, xmm0
0x1004d22bf: vaddss xmm3, xmm0, xmm3
0x1004d22c3: vpermilpd xmm0, xmm0, 1
0x1004d22c9: vaddss xmm0, xmm0, xmm3
0x1004d22cd: vsqrtss xmm0, xmm0, xmm0
0x1004d22d1: vmulps xmm1, xmm1, xmm1
0x1004d22d5: vmovshdup xmm3, xmm1
0x1004d22d9: vaddss xmm3, xmm1, xmm3
0x1004d22dd: vpermilpd xmm1, xmm1, 1
0x1004d22e3: vaddss xmm1, xmm1, xmm3
0x1004d22e7: vsqrtss xmm1, xmm1, xmm1
0x1004d22eb: vmulps xmm2, xmm2, xmm2
0x1004d22ef: vmovshdup xmm3, xmm2
0x1004d22f3: vaddss xmm3, xmm2, xmm3
0x1004d22f7: vpermilpd xmm2, xmm2, 1
0x1004d22fd: vaddss xmm2, xmm2, xmm3
0x1004d2301: vsqrtss xmm2, xmm2, xmm2
0x1004d2305: vinsertps xmm0, xmm0, xmm1, 0x10
0x1004d230b: vinsertps xmm0, xmm0, xmm2, 0x20
0x1004d2311: vmovss dword ptr [r14 + 8], xmm2
0x1004d2317: vmovlps qword ptr [r14], xmm0
0x1004d231c: mov rax, r14
0x1004d231f: add rsp, 0xc0
0x1004d2326: pop rbx
0x1004d2327: pop r12
0x1004d2329: pop r14
0x1004d232b: pop r15
0x1004d232d: pop rbp
0x1004d232e: ret 
0x1004d232f: nop 
