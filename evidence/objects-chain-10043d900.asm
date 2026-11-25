0x10043d900: push rbp
0x10043d901: mov rbp, rsp
0x10043d904: vmovaps xmm0, xmmword ptr [rsi + 0x20]
0x10043d909: vmovshdup xmm1, xmm0
0x10043d90d: vpermilpd xmm2, xmm0, 1
0x10043d913: vpermilps xmm3, xmm0, 0xe7
0x10043d919: vaddss xmm4, xmm0, xmm0
0x10043d91d: vaddss xmm5, xmm1, xmm1
0x10043d921: vaddss xmm2, xmm2, xmm2
0x10043d925: vmulss xmm6, xmm0, xmm4
0x10043d929: vmulss xmm0, xmm0, xmm2
0x10043d92d: vmulss xmm4, xmm3, xmm4
0x10043d931: vmulss xmm7, xmm1, xmm5
0x10043d935: vmulss xmm1, xmm1, xmm2
0x10043d939: vmulss xmm2, xmm3, xmm5
0x10043d93d: vmovss xmm3, dword ptr [rip + 0x66777b] ; 0x100aa50c0
0x10043d945: vsubss xmm3, xmm3, xmm6
0x10043d949: vaddss xmm0, xmm0, xmm2
0x10043d94d: vsubss xmm1, xmm1, xmm4
0x10043d951: vsubss xmm2, xmm3, xmm7
0x10043d955: vinsertps xmm0, xmm0, xmm1, 0x10
0x10043d95b: vinsertps xmm1, xmm0, xmm2, 0x20
0x10043d961: vxorps xmm0, xmm1, xmmword ptr [rip + 0x669f97] ; 0x100aa7900
0x10043d969: vmulps xmm1, xmm1, xmm1
0x10043d96d: vmovshdup xmm2, xmm1
0x10043d971: vaddss xmm2, xmm1, xmm2
0x10043d975: vpermilpd xmm1, xmm1, 1
0x10043d97b: vaddss xmm1, xmm1, xmm2
0x10043d97f: vsqrtss xmm1, xmm1, xmm1
0x10043d983: vucomiss xmm1, dword ptr [rip + 0x669f39] ; 0x100aa78c4
0x10043d98b: jbe 0x10043d997
0x10043d98d: vpermilps xmm1, xmm1, 0xc0
0x10043d993: vdivps xmm0, xmm0, xmm1
0x10043d997: vmovaps xmmword ptr [rdi], xmm0
0x10043d99b: mov rax, rdi
0x10043d99e: pop rbp
0x10043d99f: ret 
