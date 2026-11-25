0x10076ddb0: push rbp
0x10076ddb1: mov rbp, rsp
0x10076ddb4: push rbx
0x10076ddb5: push rax
0x10076ddb6: mov rbx, rdi
0x10076ddb9: vmovss xmm0, dword ptr [rsi + 4]
0x10076ddbe: vmovss xmm1, dword ptr [rsi + 8]
0x10076ddc3: vmovss dword ptr [rbp - 0xc], xmm1
0x10076ddc8: vmovss xmm1, dword ptr [rsi + 0xc]
0x10076ddcd: vmovss dword ptr [rbp - 0x10], xmm1
0x10076ddd2: vmulss xmm0, xmm0, dword ptr [rip + 0x3367de] ; 0x100aa45b8
0x10076ddda: call 0x100aa2cfc ; 0x100aa2cfc _tanf
0x10076dddf: vmovss xmm1, dword ptr [rip + 0x3372d9] ; 0x100aa50c0
0x10076dde7: vdivss xmm0, xmm1, xmm0
0x10076ddeb: vdivss xmm1, xmm0, dword ptr [rbp - 0xc]
0x10076ddf0: vxorps xmm2, xmm2, xmm2
0x10076ddf4: vblendps xmm1, xmm2, xmm1, 1
0x10076ddfa: vinsertps xmm0, xmm0, xmm0, 0x1d
0x10076de00: vmovss xmm2, dword ptr [rbp - 0x10]
0x10076de05: vmulss xmm2, xmm2, dword ptr [rip + 0x33b877] ; 0x100aa9684
0x10076de0d: vinsertps xmm2, xmm0, xmm2, 0x2b
0x10076de13: vmovaps xmmword ptr [rbx], xmm1
0x10076de17: vmovaps xmmword ptr [rbx + 0x10], xmm0
0x10076de1c: vmovaps xmm0, xmmword ptr [rip + 0x36cc9c] ; 0x100adaac0
0x10076de24: vmovaps xmmword ptr [rbx + 0x20], xmm0
0x10076de29: vmovaps xmmword ptr [rbx + 0x30], xmm2
0x10076de2e: mov rax, rbx
0x10076de31: add rsp, 8
0x10076de35: pop rbx
0x10076de36: pop rbp
0x10076de37: ret 
0x10076de38: nop dword ptr [rax + rax]
