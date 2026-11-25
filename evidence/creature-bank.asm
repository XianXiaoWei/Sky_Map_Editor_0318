0x100192550: push rbp
0x100192551: mov rbp, rsp
0x100192554: push rbx
0x100192555: sub rsp, 0x48
0x100192559: vmovaps xmmword ptr [rbp - 0x50], xmm3
0x10019255e: vmovss dword ptr [rbp - 0x10], xmm0
0x100192563: mov rbx, rdi
0x100192566: vmovaps xmm0, xmmword ptr [rsi]
0x10019256a: vsubps xmm0, xmm0, xmmword ptr [rbx + 0x10]
0x10019256f: vmovaps xmm3, xmmword ptr [rbx]
0x100192573: vmovaps xmm5, xmmword ptr [rbx + 0x20]
0x100192578: vmovaps xmmword ptr [rbx + 0x10], xmm3
0x10019257d: vmovaps xmm3, xmmword ptr [rsi]
0x100192581: vmovaps xmmword ptr [rbx], xmm3
0x100192585: vxorps xmm7, xmm7, xmm7
0x100192589: vblendps xmm6, xmm0, xmm7, 2
0x10019258f: vxorps ymm3, ymm3, ymm3
0x100192593: vblendps xmm4, xmm0, xmm3, 2
0x100192599: vblendps xmm7, xmm5, xmm7, 2
0x10019259f: vblendps xmm5, xmm5, xmm3, 2
0x1001925a5: vmovaps xmmword ptr [rbx + 0x20], xmm0
0x1001925aa: vmulps xmm0, xmm4, xmm4
0x1001925ae: vmovshdup xmm3, xmm0
0x1001925b2: vaddss xmm3, xmm0, xmm3
0x1001925b6: vpermilpd xmm0, xmm0, 1
0x1001925bc: vaddss xmm0, xmm0, xmm3
0x1001925c0: vsqrtss xmm4, xmm0, xmm0
0x1001925c4: vmulps xmm0, xmm5, xmm5
0x1001925c8: vmovshdup xmm3, xmm0
0x1001925cc: vaddss xmm3, xmm0, xmm3
0x1001925d0: vpermilpd xmm0, xmm0, 1
0x1001925d6: vaddss xmm0, xmm0, xmm3
0x1001925da: vsqrtss xmm3, xmm0, xmm0
0x1001925de: vmulss xmm0, xmm4, xmm3
0x1001925e2: vandps xmm0, xmm0, xmmword ptr [rip + 0x915326] ; 0x100aa7910
0x1001925ea: vucomiss xmm0, dword ptr [rip + 0x917086] ; 0x100aa9678
0x1001925f2: vxorps xmm0, xmm0, xmm0
0x1001925f6: jbe 0x100192669
0x1001925f8: vmovss xmm0, dword ptr [rbp - 0x10]
0x1001925fd: vmulss xmm0, xmm0, dword ptr [rip + 0x917e87] ; 0x100aaa48c
0x100192605: vmovss dword ptr [rbp - 0xc], xmm2
0x10019260a: vmovaps xmmword ptr [rbp - 0x40], xmm6
0x10019260f: vmovss dword ptr [rbp - 0x18], xmm1
0x100192614: vmovaps xmmword ptr [rbp - 0x30], xmm7
0x100192619: vmovss dword ptr [rbp - 0x1c], xmm4
0x10019261e: vmovss dword ptr [rbp - 0x14], xmm3
0x100192623: vzeroupper 
0x100192626: call 0x100aa2708 ; 0x100aa2708 _expf
0x10019262b: vmovaps xmm7, xmmword ptr [rbp - 0x30]
0x100192630: vmovaps xmm6, xmmword ptr [rbp - 0x40]
0x100192635: vmovss xmm2, dword ptr [rbp - 0xc]
0x10019263a: vmovss xmm1, dword ptr [rip + 0x912a7e] ; 0x100aa50c0
0x100192642: vsubss xmm0, xmm1, xmm0
0x100192646: vmulss xmm0, xmm0, dword ptr [rbp - 0x18]
0x10019264b: vmovss xmm3, dword ptr [rbp - 0x14]
0x100192650: vmovss xmm4, dword ptr [rbp - 0x1c]
0x100192655: vaddss xmm1, xmm4, xmm3
0x100192659: vmulss xmm0, xmm1, xmm0
0x10019265d: vaddss xmm1, xmm4, xmm4
0x100192661: vmulss xmm1, xmm1, xmm3
0x100192665: vdivss xmm0, xmm0, xmm1
0x100192669: vpermilps xmm1, xmm6, 0xd2
0x10019266f: vmulps xmm1, xmm1, xmm7
0x100192673: vpermilps xmm3, xmm7, 0xd2
0x100192679: vmulps xmm3, xmm6, xmm3
0x10019267d: vsubps xmm1, xmm1, xmm3
0x100192681: vpermilps xmm1, xmm1, 0xd2
0x100192687: vmulps xmm1, xmm1, xmmword ptr [rip + 0x915a11] ; 0x100aa80a0
0x10019268f: vmovshdup xmm3, xmm1
0x100192693: vaddss xmm3, xmm1, xmm3
0x100192697: vpermilpd xmm1, xmm1, 1
0x10019269d: vaddss xmm1, xmm1, xmm3
0x1001926a1: vmulss xmm0, xmm1, xmm0
0x1001926a5: vmovss dword ptr [rbp - 0xc], xmm0
0x1001926aa: vdivss xmm0, xmm2, dword ptr [rip + 0x915606] ; 0x100aa7cb8
0x1001926b2: vxorps xmm1, xmm1, xmm1
0x1001926b6: vmaxss xmm0, xmm1, xmm0
0x1001926ba: vmovss xmm1, dword ptr [rip + 0x9129fe] ; 0x100aa50c0
0x1001926c2: vminss xmm0, xmm1, xmm0
0x1001926c6: vsubss xmm0, xmm1, xmm0
0x1001926ca: vzeroupper 
0x1001926cd: call 0x100aa2858 ; 0x100aa2858 _logf
0x1001926d2: vcvtss2sd xmm0, xmm0, xmm0
0x1001926d6: vdivsd xmm0, xmm0, qword ptr [rip + 0x915fe2] ; 0x100aa86c0
0x1001926de: vcvtsd2ss xmm0, xmm0, xmm0
0x1001926e2: vmulss xmm0, xmm0, dword ptr [rbp - 0x10]
0x1001926e7: call 0x100aa2708 ; 0x100aa2708 _expf
0x1001926ec: vmovss xmm1, dword ptr [rip + 0x9129cc] ; 0x100aa50c0
0x1001926f4: vsubss xmm0, xmm1, xmm0
0x1001926f8: vxorps xmm2, xmm2, xmm2
0x1001926fc: vmaxss xmm0, xmm2, xmm0
0x100192700: vminss xmm0, xmm1, xmm0
0x100192704: vsubss xmm1, xmm1, xmm0
0x100192708: vmulss xmm1, xmm1, dword ptr [rbx + 0x30]
0x10019270d: vmulss xmm0, xmm0, xmm2
0x100192711: vaddss xmm0, xmm0, xmm1
0x100192715: vaddss xmm0, xmm0, dword ptr [rbp - 0xc]
0x10019271a: vmovaps xmm2, xmmword ptr [rbp - 0x50]
0x10019271f: vxorps xmm1, xmm2, xmmword ptr [rip + 0x9151d9] ; 0x100aa7900
0x100192727: vmaxss xmm0, xmm1, xmm0
0x10019272b: vminss xmm0, xmm2, xmm0
0x10019272f: vaddss xmm1, xmm0, dword ptr [rip + 0x915ecd] ; 0x100aa8604
0x100192737: vmovss xmm2, dword ptr [rip + 0x916e9d] ; 0x100aa95dc
0x10019273f: vdivss xmm1, xmm1, xmm2
0x100192743: vroundss xmm1, xmm1, xmm1, 9
0x100192749: vmulss xmm1, xmm1, xmm2
0x10019274d: vsubss xmm0, xmm0, xmm1
0x100192751: vmovss dword ptr [rbx + 0x30], xmm0
0x100192756: add rsp, 0x48
0x10019275a: pop rbx
0x10019275b: pop rbp
0x10019275c: ret 
0x10019275d: nop 
0x10019275e: nop 
0x10019275f: nop 
