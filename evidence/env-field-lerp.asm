0x10031a230: push rbp
0x10031a231: mov rbp, rsp
0x10031a234: mov eax, dword ptr [rdi]
0x10031a236: cmp rax, 0xb
0x10031a23a: ja 0x10031a41d
0x10031a240: mov r8d, dword ptr [rdi + 4]
0x10031a244: add rsi, r8
0x10031a247: add rdx, r8
0x10031a24a: lea rdi, [rip + 0x1cf] ; 0x10031a420
0x10031a251: movsxd rax, dword ptr [rdi + rax*4]
0x10031a255: add rax, rdi
0x10031a258: jmp rax
0x10031a25a: movsx eax, byte ptr [rsi]
0x10031a25d: vcvtsi2ss xmm1, xmm1, eax
0x10031a261: vmovss xmm2, dword ptr [rip + 0x78ae57] ; 0x100aa50c0
0x10031a269: vsubss xmm2, xmm2, xmm0
0x10031a26d: vmulss xmm1, xmm2, xmm1
0x10031a271: movsx eax, byte ptr [rdx]
0x10031a274: vcvtsi2ss xmm2, xmm3, eax
0x10031a278: vmulss xmm0, xmm2, xmm0
0x10031a27c: vaddss xmm0, xmm1, xmm0
0x10031a280: vcvttss2si eax, xmm0
0x10031a284: mov byte ptr [rcx + r8], al
0x10031a288: pop rbp
0x10031a289: ret 
0x10031a28a: movzx eax, byte ptr [rsi]
0x10031a28d: vcvtsi2ss xmm1, xmm1, eax
0x10031a291: vmovss xmm2, dword ptr [rip + 0x78ae27] ; 0x100aa50c0
0x10031a299: vsubss xmm2, xmm2, xmm0
0x10031a29d: vmulss xmm1, xmm2, xmm1
0x10031a2a1: movzx eax, byte ptr [rdx]
0x10031a2a4: vcvtsi2ss xmm2, xmm3, eax
0x10031a2a8: vmulss xmm0, xmm2, xmm0
0x10031a2ac: vaddss xmm0, xmm1, xmm0
0x10031a2b0: vcvttss2si rax, xmm0
0x10031a2b5: mov byte ptr [rcx + r8], al
0x10031a2b9: pop rbp
0x10031a2ba: ret 
0x10031a2bb: movsx eax, word ptr [rsi]
0x10031a2be: vcvtsi2ss xmm1, xmm1, eax
0x10031a2c2: vmovss xmm2, dword ptr [rip + 0x78adf6] ; 0x100aa50c0
0x10031a2ca: vsubss xmm2, xmm2, xmm0
0x10031a2ce: vmulss xmm1, xmm2, xmm1
0x10031a2d2: movsx eax, word ptr [rdx]
0x10031a2d5: vcvtsi2ss xmm2, xmm3, eax
0x10031a2d9: vmulss xmm0, xmm2, xmm0
0x10031a2dd: vaddss xmm0, xmm1, xmm0
0x10031a2e1: vcvttss2si eax, xmm0
0x10031a2e5: mov word ptr [rcx + r8], ax
0x10031a2ea: pop rbp
0x10031a2eb: ret 
0x10031a2ec: movzx eax, word ptr [rsi]
0x10031a2ef: vcvtsi2ss xmm1, xmm1, eax
0x10031a2f3: vmovss xmm2, dword ptr [rip + 0x78adc5] ; 0x100aa50c0
0x10031a2fb: vsubss xmm2, xmm2, xmm0
0x10031a2ff: vmulss xmm1, xmm2, xmm1
0x10031a303: movzx eax, word ptr [rdx]
0x10031a306: vcvtsi2ss xmm2, xmm3, eax
0x10031a30a: vmulss xmm0, xmm2, xmm0
0x10031a30e: vaddss xmm0, xmm1, xmm0
0x10031a312: vcvttss2si rax, xmm0
0x10031a317: mov word ptr [rcx + r8], ax
0x10031a31c: pop rbp
0x10031a31d: ret 
0x10031a31e: vcvtsi2ss xmm1, xmm1, dword ptr [rsi]
0x10031a322: vmovss xmm2, dword ptr [rip + 0x78ad96] ; 0x100aa50c0
0x10031a32a: vsubss xmm2, xmm2, xmm0
0x10031a32e: vmulss xmm1, xmm2, xmm1
0x10031a332: vcvtsi2ss xmm2, xmm3, dword ptr [rdx]
0x10031a336: vmulss xmm0, xmm2, xmm0
0x10031a33a: vaddss xmm0, xmm1, xmm0
0x10031a33e: vcvttss2si eax, xmm0
0x10031a342: mov dword ptr [rcx + r8], eax
0x10031a346: pop rbp
0x10031a347: ret 
0x10031a348: mov eax, dword ptr [rsi]
0x10031a34a: vcvtsi2ss xmm1, xmm1, rax
0x10031a34f: vmovss xmm2, dword ptr [rip + 0x78ad69] ; 0x100aa50c0
0x10031a357: vsubss xmm2, xmm2, xmm0
0x10031a35b: vmulss xmm1, xmm2, xmm1
0x10031a35f: mov eax, dword ptr [rdx]
0x10031a361: vcvtsi2ss xmm2, xmm3, rax
0x10031a366: vmulss xmm0, xmm2, xmm0
0x10031a36a: vaddss xmm0, xmm1, xmm0
0x10031a36e: vcvttss2si rax, xmm0
0x10031a373: mov dword ptr [rcx + r8], eax
0x10031a377: pop rbp
0x10031a378: ret 
0x10031a379: vmovss xmm1, dword ptr [rip + 0x78ad3f] ; 0x100aa50c0
0x10031a381: vsubss xmm1, xmm1, xmm0
0x10031a385: vmulss xmm1, xmm1, dword ptr [rsi]
0x10031a389: vmulss xmm0, xmm0, dword ptr [rdx]
0x10031a38d: vaddss xmm0, xmm1, xmm0
0x10031a391: vmovss dword ptr [rcx + r8], xmm0
0x10031a397: pop rbp
0x10031a398: ret 
0x10031a399: vmovss xmm1, dword ptr [rip + 0x78ad1f] ; 0x100aa50c0
0x10031a3a1: vsubss xmm1, xmm1, xmm0
0x10031a3a5: vcvtss2sd xmm1, xmm1, xmm1
0x10031a3a9: vmulsd xmm1, xmm1, qword ptr [rsi]
0x10031a3ad: vcvtss2sd xmm0, xmm0, xmm0
0x10031a3b1: vmulsd xmm0, xmm0, qword ptr [rdx]
0x10031a3b5: vaddsd xmm0, xmm1, xmm0
0x10031a3b9: vmovsd qword ptr [rcx + r8], xmm0
0x10031a3bf: pop rbp
0x10031a3c0: ret 
0x10031a3c1: vmovaps xmm1, xmmword ptr [rdx]
0x10031a3c5: vmovaps xmm2, xmmword ptr [rsi]
0x10031a3c9: vsubps xmm1, xmm1, xmm2
0x10031a3cd: vpermilps xmm0, xmm0, 0xc0
0x10031a3d3: jmp 0x10031a3fb ; 0x10031a3fb
0x10031a3d5: vxorps xmm1, xmm1, xmm1
0x10031a3d9: vmaxss xmm0, xmm1, xmm0
0x10031a3dd: vmovss xmm1, dword ptr [rip + 0x78acdb] ; 0x100aa50c0
0x10031a3e5: vminss xmm0, xmm1, xmm0
0x10031a3e9: vmovaps xmm1, xmmword ptr [rdx]
0x10031a3ed: vmovaps xmm2, xmmword ptr [rsi]
0x10031a3f1: vsubps xmm1, xmm1, xmm2
0x10031a3f5: vpermilps xmm0, xmm0, 0
0x10031a3fb: vmulps xmm0, xmm0, xmm1
0x10031a3ff: vaddps xmm0, xmm2, xmm0
0x10031a403: vmovaps xmmword ptr [rcx + r8], xmm0
0x10031a409: pop rbp
0x10031a40a: ret 
0x10031a40b: vucomiss xmm0, dword ptr [rip + 0x78a1a5] ; 0x100aa45b8
0x10031a413: cmovae rsi, rdx
0x10031a417: mov al, byte ptr [rsi]
0x10031a419: mov byte ptr [rcx + r8], al
0x10031a41d: pop rbp
0x10031a41e: ret 
0x10031a41f: nop 
