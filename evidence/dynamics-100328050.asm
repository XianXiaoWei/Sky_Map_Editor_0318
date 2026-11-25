0x100328050: push rbp
0x100328051: mov rbp, rsp
0x100328054: push r15
0x100328056: push r14
0x100328058: push r12
0x10032805a: push rbx
0x10032805b: sub rsp, 0x20
0x10032805f: vmovss dword ptr [rbp - 0x24], xmm0
0x100328064: mov r14, r8
0x100328067: mov r15, rcx
0x10032806a: mov rbx, rdx
0x10032806d: mov rax, rsi
0x100328070: mov r12, rdi
0x100328073: lea rdi, [rbp - 0x40]
0x100328077: mov rsi, r12
0x10032807a: mov rdx, rax
0x10032807d: call 0x100328200 ; 0x100328200
0x100328082: vmovss xmm0, dword ptr [rbp - 0x24]
0x100328087: vmulss xmm0, xmm0, dword ptr [r12 + 0xc]
0x10032808e: vmovaps xmm1, xmmword ptr [rbp - 0x40]
0x100328093: vmulps xmm2, xmm1, xmmword ptr [rip + 0x77ff25] ; 0x100aa7fc0
0x10032809b: vmulps xmm2, xmm2, xmmword ptr [rip + 0x7940ed] ; 0x100abc190
0x1003280a3: vpermilps xmm0, xmm0, 0xc0
0x1003280a9: vmulps xmm2, xmm0, xmm2
0x1003280ad: vmovaps xmm3, xmmword ptr [rbx]
0x1003280b1: vsubps xmm2, xmm3, xmm2
0x1003280b5: vmovaps xmmword ptr [rbx], xmm2
0x1003280b9: vmulps xmm2, xmm1, xmmword ptr [rip + 0x78097f] ; 0x100aa8a40
0x1003280c1: vmulps xmm2, xmm2, xmmword ptr [rip + 0x7940d7] ; 0x100abc1a0
0x1003280c9: vmulps xmm2, xmm0, xmm2
0x1003280cd: vmovaps xmm3, xmmword ptr [r15]
0x1003280d2: vsubps xmm2, xmm3, xmm2
0x1003280d6: vmovaps xmmword ptr [r15], xmm2
0x1003280db: vmulps xmm1, xmm1, xmmword ptr [rip + 0x78588d] ; 0x100aad970
0x1003280e3: vmulps xmm1, xmm1, xmmword ptr [rip + 0x7940c5] ; 0x100abc1b0
0x1003280eb: vmulps xmm1, xmm0, xmm1
0x1003280ef: vmovaps xmm2, xmmword ptr [r14]
0x1003280f4: vsubps xmm1, xmm2, xmm1
0x1003280f8: vmovaps xmmword ptr [r14], xmm1
0x1003280fd: vmovss xmm1, dword ptr [rip + 0x794083] ; 0x100abc188 gfv<
0x100328105: vmulps xmm1, xmm0, xmm1
0x100328109: vaddps xmm1, xmm1, xmmword ptr [rbx]
0x10032810d: vmovaps xmmword ptr [rbx], xmm1
0x100328111: vmulps xmm1, xmm0, xmmword ptr [rip + 0x7940a7] ; 0x100abc1c0
0x100328119: vaddps xmm1, xmm1, xmmword ptr [r15]
0x10032811e: vmovaps xmmword ptr [r15], xmm1
0x100328123: vmulps xmm0, xmm0, xmmword ptr [rip + 0x7940a5] ; 0x100abc1d0
0x10032812b: vaddps xmm0, xmm0, xmmword ptr [r14]
0x100328130: vmovaps xmmword ptr [r14], xmm0
0x100328135: vmovss xmm0, dword ptr [rbx]
0x100328139: vmovss xmm1, dword ptr [rbx + 4]
0x10032813e: vroundss xmm2, xmm0, xmm0, 9
0x100328144: vsubss xmm0, xmm0, xmm2
0x100328148: vmovss dword ptr [rbx], xmm0
0x10032814c: vroundss xmm0, xmm1, xmm1, 9
0x100328152: vsubss xmm0, xmm1, xmm0
0x100328156: vmovss dword ptr [rbx + 4], xmm0
0x10032815b: vmovss xmm0, dword ptr [rbx + 8]
0x100328160: vroundss xmm1, xmm0, xmm0, 9
0x100328166: vsubss xmm0, xmm0, xmm1
0x10032816a: vmovss dword ptr [rbx + 8], xmm0
0x10032816f: vmovss xmm0, dword ptr [r15]
0x100328174: vmovss xmm1, dword ptr [r15 + 4]
0x10032817a: vroundss xmm2, xmm0, xmm0, 9
0x100328180: vsubss xmm0, xmm0, xmm2
0x100328184: vmovss dword ptr [r15], xmm0
0x100328189: vroundss xmm0, xmm1, xmm1, 9
0x10032818f: vsubss xmm0, xmm1, xmm0
0x100328193: vmovss dword ptr [r15 + 4], xmm0
0x100328199: vmovss xmm0, dword ptr [r15 + 8]
0x10032819f: vroundss xmm1, xmm0, xmm0, 9
0x1003281a5: vsubss xmm0, xmm0, xmm1
0x1003281a9: vmovss dword ptr [r15 + 8], xmm0
0x1003281af: vmovss xmm0, dword ptr [r14]
0x1003281b4: vmovss xmm1, dword ptr [r14 + 4]
0x1003281ba: vroundss xmm2, xmm0, xmm0, 9
0x1003281c0: vsubss xmm0, xmm0, xmm2
0x1003281c4: vmovss dword ptr [r14], xmm0
0x1003281c9: vroundss xmm0, xmm1, xmm1, 9
0x1003281cf: vsubss xmm0, xmm1, xmm0
0x1003281d3: vmovss dword ptr [r14 + 4], xmm0
0x1003281d9: vmovss xmm0, dword ptr [r14 + 8]
0x1003281df: vroundss xmm1, xmm0, xmm0, 9
0x1003281e5: vsubss xmm0, xmm0, xmm1
0x1003281e9: vmovss dword ptr [r14 + 8], xmm0
0x1003281ef: add rsp, 0x20
0x1003281f3: pop rbx
0x1003281f4: pop r12
0x1003281f6: pop r14
0x1003281f8: pop r15
0x1003281fa: pop rbp
0x1003281fb: ret 
0x1003281fc: nop dword ptr [rax]
