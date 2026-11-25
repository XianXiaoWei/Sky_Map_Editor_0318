0x100214810: push rbp
0x100214811: mov rbp, rsp
0x100214814: push r14
0x100214816: push rbx
0x100214817: vmovaps xmm0, xmmword ptr [rsi]
0x10021481b: vmulps xmm0, xmm0, xmmword ptr [rip + 0x8976fd] ; 0x100aabf20
0x100214823: vroundss xmm1, xmm0, xmm0, 9
0x100214829: vcvttss2si edx, xmm1
0x10021482d: vmovshdup xmm1, xmm0
0x100214831: vroundss xmm2, xmm1, xmm1, 9
0x100214837: vcvttss2si ecx, xmm2
0x10021483b: vpermilpd xmm3, xmm0, 1
0x100214841: vroundss xmm2, xmm3, xmm3, 9
0x100214847: vcvttss2si eax, xmm2
0x10021484b: lea r9d, [rdx + 1]
0x10021484f: vcvtsi2ss xmm2, xmm4, edx
0x100214853: vsubss xmm2, xmm0, xmm2
0x100214857: vcvtsi2ss xmm0, xmm4, ecx
0x10021485b: vsubss xmm1, xmm1, xmm0
0x10021485f: vcvtsi2ss xmm0, xmm4, eax
0x100214863: vsubss xmm9, xmm3, xmm0
0x100214867: and edx, 0x3f
0x10021486a: shl eax, 0xc
0x10021486d: mov r8d, eax
0x100214870: and r8d, 0x3f000
0x100214877: shl ecx, 6
0x10021487a: mov esi, ecx
0x10021487c: and esi, 0xfc0
0x100214882: lea r10d, [rsi + rdx]
0x100214886: lea ebx, [r10 + r8]
0x10021488a: and r9d, 0x3f
0x10021488e: or esi, r9d
0x100214891: lea r14d, [rsi + r8]
0x100214895: vmovss xmm8, dword ptr [rip + 0x890823] ; 0x100aa50c0
0x10021489d: vsubss xmm5, xmm8, xmm2
0x1002148a1: add ecx, 0x40
0x1002148a4: and ecx, 0xfc0
0x1002148aa: or edx, ecx
0x1002148ac: lea r11d, [rdx + r8]
0x1002148b0: or ecx, r9d
0x1002148b3: or r8d, ecx
0x1002148b6: vsubss xmm4, xmm8, xmm1
0x1002148ba: add eax, 0x1000
0x1002148bf: and eax, 0x3f000
0x1002148c4: or r10d, eax
0x1002148c7: movzx ebx, byte ptr [rdi + rbx + 0x358]
0x1002148cf: vmovd xmm6, ebx
0x1002148d3: vpinsrb xmm6, xmm6, byte ptr [rdi + r10 + 0x358], 1
0x1002148de: vpmovzxbd xmm6, xmm6
0x1002148e3: vcvtdq2ps xmm7, xmm6
0x1002148e7: vmovaps xmm6, xmmword ptr [rip + 0x89cd01] ; 0x100ab15f0
0x1002148ef: vdivps xmm7, xmm7, xmm6
0x1002148f3: or esi, eax
0x1002148f5: movzx ebx, byte ptr [rdi + r14 + 0x358]
0x1002148fe: vmovd xmm3, ebx
0x100214902: vpinsrb xmm3, xmm3, byte ptr [rdi + rsi + 0x358], 1
0x10021490d: vpmovzxbd xmm3, xmm3
0x100214912: vcvtdq2ps xmm3, xmm3
0x100214916: vdivps xmm3, xmm3, xmm6
0x10021491a: vmovsldup xmm5, xmm5
0x10021491e: vmulps xmm7, xmm5, xmm7
0x100214922: vmovsldup xmm2, xmm2
0x100214926: vmulps xmm3, xmm2, xmm3
0x10021492a: vaddps xmm3, xmm7, xmm3
0x10021492e: or edx, eax
0x100214930: movzx esi, byte ptr [rdi + r11 + 0x358]
0x100214939: vmovd xmm7, esi
0x10021493d: vpinsrb xmm7, xmm7, byte ptr [rdi + rdx + 0x358], 1
0x100214948: vpmovzxbd xmm7, xmm7
0x10021494d: vcvtdq2ps xmm7, xmm7
0x100214951: vdivps xmm7, xmm7, xmm6
0x100214955: or eax, ecx
0x100214957: movzx ecx, byte ptr [rdi + r8 + 0x358]
0x100214960: vmovd xmm0, ecx
0x100214964: vpinsrb xmm0, xmm0, byte ptr [rdi + rax + 0x358], 1
0x10021496f: vpmovzxbd xmm0, xmm0
0x100214974: vcvtdq2ps xmm0, xmm0
0x100214978: vdivps xmm0, xmm0, xmm6
0x10021497c: vmulps xmm5, xmm5, xmm7
0x100214980: vmulps xmm0, xmm2, xmm0
0x100214984: vaddps xmm0, xmm5, xmm0
0x100214988: vmovsldup xmm2, xmm4
0x10021498c: vmulps xmm2, xmm2, xmm3
0x100214990: vmovsldup xmm1, xmm1
0x100214994: vmulps xmm0, xmm1, xmm0
0x100214998: vaddps xmm0, xmm2, xmm0
0x10021499c: vsubss xmm1, xmm8, xmm9
0x1002149a1: vinsertps xmm1, xmm1, xmm9, 0x10
0x1002149a7: vmulps xmm0, xmm1, xmm0
0x1002149ab: vmovshdup xmm1, xmm0
0x1002149af: vaddss xmm0, xmm0, xmm1
0x1002149b3: pop rbx
0x1002149b4: pop r14
0x1002149b6: pop rbp
0x1002149b7: ret 
0x1002149b8: nop dword ptr [rax + rax]
