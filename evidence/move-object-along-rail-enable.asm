0x100484640: push rbp
0x100484641: mov rbp, rsp
0x100484644: push r15
0x100484646: push r14
0x100484648: push r13
0x10048464a: push r12
0x10048464c: push rbx
0x10048464d: sub rsp, 0xe8
0x100484654: mov qword ptr [rbp - 0x48], rsi
0x100484658: mov r14, rdi
0x10048465b: vmovss xmm0, dword ptr [r14 + 0x50]
0x100484661: vmaxss xmm0, xmm0, dword ptr [rip + 0x622433] ; 0x100aa6a9c
0x100484669: vmovss dword ptr [r14 + 0x50], xmm0
0x10048466f: cmp byte ptr [r14 + 0x58], 0
0x100484674: je 0x10048469d
0x100484676: vmovss xmm0, dword ptr [r14 + 0x54]
0x10048467c: vmaxss xmm0, xmm0, dword ptr [rip + 0x622418] ; 0x100aa6a9c
0x100484684: vmovss dword ptr [r14 + 0x54], xmm0
0x10048468a: mov rax, qword ptr [r14 + 0x38]
0x10048468e: vmovss xmm1, dword ptr [rax + 0x18]
0x100484693: vdivss xmm0, xmm1, xmm0
0x100484697: vmovss dword ptr [r14 + 0x50], xmm0
0x10048469d: mov dword ptr [r14 + 0xd4], 0
0x1004846a8: mov dword ptr [r14 + 0xb8], 0
0x1004846b3: mov byte ptr [r14 + 0xd0], 0
0x1004846bb: mov qword ptr [r14 + 0xc8], 0
0x1004846c6: mov rax, qword ptr [r14 + 0x40]
0x1004846ca: cmp dword ptr [rax + 0x10], 0
0x1004846ce: je 0x100484a08
0x1004846d4: xor ecx, ecx
0x1004846d6: lea r15, [rbp - 0x90]
0x1004846dd: mov qword ptr [rbp - 0x30], r14
0x1004846e1: nop word ptr cs:[rax + rax]
0x1004846f0: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x1004846f8: mov rax, qword ptr [rax + 8]
0x1004846fc: mov r12d, ecx
0x1004846ff: mov rax, qword ptr [rax + r12*8]
0x100484703: mov qword ptr [rbp - 0x100], rax
0x10048470a: call 0x1007abc10 ; 0x1007abc10
0x10048470f: mov r13, rax
0x100484712: mov qword ptr [rbp - 0x90], 0
0x10048471d: call 0x1007abc10 ; 0x1007abc10
0x100484722: mov rbx, qword ptr [rax]
0x100484725: mov rdi, rax
0x100484728: mov rsi, r15
0x10048472b: lea rdx, [rbp - 0x100]
0x100484732: mov rcx, r13
0x100484735: call qword ptr [rbx + 0x40]
0x100484738: mov r13, qword ptr [rbp - 0x90]
0x10048473f: test r13, r13
0x100484742: je 0x100484a49
0x100484748: mov rdi, r15
0x10048474b: mov rsi, r13
0x10048474e: call 0x1004d1e40 ; 0x1004d1e40
0x100484753: mov rax, r14
0x100484756: mov rbx, qword ptr [rax + 0xb0]
0x10048475d: mov qword ptr [rbp - 0x40], r12
0x100484761: lea r14, [r12 + r12*2]
0x100484765: shl r14, 5
0x100484769: mov dword ptr [rbx + r14 + 0x30], 0
0x100484772: cmp byte ptr [rax + 0x5a], 0
0x100484776: je 0x1004847fc
0x10048477c: lea rax, [rbx + r14 + 0x30]
0x100484781: mov qword ptr [rbp - 0x50], rax
0x100484785: mov r12, qword ptr [rbp - 0x30]
0x100484789: mov r15, qword ptr [r12 + 0x38]
0x10048478e: lea rdi, [rbp - 0x100]
0x100484795: mov rsi, r13
0x100484798: call 0x1004d1e40 ; 0x1004d1e40
0x10048479d: vmovaps xmm0, xmmword ptr [rbp - 0xd0]
0x1004847a5: vmovaps xmmword ptr [rbp - 0xc0], xmm0
0x1004847ad: mov rdi, r15
0x1004847b0: lea rsi, [rbp - 0xc0]
0x1004847b7: lea rdx, [rbp - 0x110]
0x1004847be: call 0x10055d820 ; 0x10055d820
0x1004847c3: mov rdi, r15
0x1004847c6: call 0x10055d410 ; 0x10055d410
0x1004847cb: mov rax, qword ptr [r12 + 0x38]
0x1004847d0: vdivss xmm0, xmm0, dword ptr [rax + 0x18]
0x1004847d5: mov rax, qword ptr [rbp - 0x50]
0x1004847d9: vmovss dword ptr [rax], xmm0
0x1004847dd: vucomiss xmm0, dword ptr [r12 + 0xb8]
0x1004847e7: jbe 0x1004847f5
0x1004847e9: mov rax, qword ptr [rbp - 0x30]
0x1004847ed: vmovss dword ptr [rax + 0xb8], xmm0
0x1004847f5: lea r15, [rbp - 0x90]
0x1004847fc: vmovaps xmm0, xmmword ptr [rbp - 0x90]
0x100484804: vmovaps xmm1, xmmword ptr [rbp - 0x80]
0x100484809: vmovaps xmm2, xmmword ptr [rbp - 0x70]
0x10048480e: vmulps xmm0, xmm0, xmm0
0x100484812: vpermilpd xmm3, xmm0, 1
0x100484818: vaddps xmm0, xmm0, xmm3
0x10048481c: vmovshdup xmm3, xmm0
0x100484820: vaddss xmm0, xmm0, xmm3
0x100484824: vsqrtss xmm0, xmm0, xmm0
0x100484828: vmulps xmm1, xmm1, xmm1
0x10048482c: vpermilpd xmm3, xmm1, 1
0x100484832: vaddps xmm1, xmm1, xmm3
0x100484836: vmovshdup xmm3, xmm1
0x10048483a: vaddss xmm1, xmm1, xmm3
0x10048483e: vsqrtss xmm1, xmm1, xmm1
0x100484842: vmulps xmm2, xmm2, xmm2
0x100484846: vpermilpd xmm3, xmm2, 1
0x10048484c: vaddps xmm2, xmm2, xmm3
0x100484850: vmovshdup xmm3, xmm2
0x100484854: vaddss xmm2, xmm2, xmm3
0x100484858: vsqrtss xmm2, xmm2, xmm2
0x10048485c: vinsertps xmm0, xmm0, xmm1, 0x10
0x100484862: vinsertps xmm0, xmm0, xmm2, 0x20
0x100484868: vmovaps xmm1, xmmword ptr [rbp - 0xa0]
0x100484870: vblendps xmm1, xmm0, xmm1, 8
0x100484876: vmovaps xmmword ptr [rbp - 0xa0], xmm1
0x10048487e: vmovaps xmmword ptr [rbx + r14], xmm1
0x100484884: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x100484889: vmovaps xmmword ptr [rbx + r14 + 0x10], xmm0
0x100484890: vmovaps xmm1, xmmword ptr [rbp - 0x70]
0x100484895: vxorps xmm0, xmm1, xmmword ptr [rip + 0x623063] ; 0x100aa7900
0x10048489d: vmulps xmm1, xmm1, xmm1
0x1004848a1: vmovshdup xmm2, xmm1
0x1004848a5: vaddss xmm2, xmm1, xmm2
0x1004848a9: vpermilpd xmm1, xmm1, 1
0x1004848af: vaddss xmm1, xmm1, xmm2
0x1004848b3: vsqrtss xmm1, xmm1, xmm1
0x1004848b7: vucomiss xmm1, dword ptr [rip + 0x623005] ; 0x100aa78c4
0x1004848bf: jbe 0x1004848cb
0x1004848c1: vpermilps xmm1, xmm1, 0xc0
0x1004848c7: vdivps xmm0, xmm0, xmm1
0x1004848cb: mov r13, qword ptr [rbp - 0x40]
0x1004848cf: vmovaps xmmword ptr [rbx + r14 + 0x20], xmm0
0x1004848d6: mov dword ptr [rbx + r14 + 0x34], 0
0x1004848df: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x1004848e4: vmulps xmm1, xmm0, xmm0
0x1004848e8: vmovshdup xmm2, xmm1
0x1004848ec: vaddss xmm2, xmm1, xmm2
0x1004848f0: vpermilpd xmm1, xmm1, 1
0x1004848f6: vaddss xmm1, xmm1, xmm2
0x1004848fa: vsqrtss xmm1, xmm1, xmm1
0x1004848fe: vucomiss xmm1, dword ptr [rip + 0x622fbe] ; 0x100aa78c4
0x100484906: jbe 0x100484912
0x100484908: vpermilps xmm1, xmm1, 0xc0
0x10048490e: vdivps xmm0, xmm0, xmm1
0x100484912: vmovaps xmmword ptr [rbx + r14 + 0x40], xmm0
0x100484919: mov dword ptr [rbx + r14 + 0x50], 0
0x100484922: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x100484927: vcvtsi2ss xmm0, xmm4, eax
0x10048492b: vmovss xmm1, dword ptr [rip + 0x6227bd] ; 0x100aa70f0
0x100484933: vmulss xmm0, xmm0, xmm1
0x100484937: vmovss xmm1, dword ptr [rip + 0x620781] ; 0x100aa50c0
0x10048493f: vsubss xmm1, xmm0, xmm1
0x100484943: vmovss xmm2, dword ptr [rip + 0x622ea5] ; 0x100aa77f0
0x10048494b: vmulss xmm1, xmm1, xmm2
0x10048494f: vmulss xmm0, xmm0, xmm2
0x100484953: vaddss xmm0, xmm0, xmm1
0x100484957: mov r14, qword ptr [rbp - 0x30]
0x10048495b: mov rax, qword ptr [r14 + 0xc0]
0x100484962: mov rbx, r13
0x100484965: shl rbx, 5
0x100484969: vmovss dword ptr [rax + rbx], xmm0
0x10048496e: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x100484973: vcvtsi2ss xmm0, xmm4, eax
0x100484977: vmulss xmm0, xmm0, dword ptr [rip + 0x622771] ; 0x100aa70f0
0x10048497f: vsubss xmm1, xmm0, dword ptr [rip + 0x620739] ; 0x100aa50c0
0x100484987: vmovss xmm2, dword ptr [rip + 0x63f089] ; 0x100ac3a18
0x10048498f: vmulss xmm1, xmm1, xmm2
0x100484993: vmulss xmm0, xmm0, xmm2
0x100484997: vaddss xmm0, xmm0, xmm1
0x10048499b: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1004849a0: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1004849a5: vcvtsi2ss xmm0, xmm4, eax
0x1004849a9: vmulss xmm0, xmm0, dword ptr [rip + 0x62273f] ; 0x100aa70f0
0x1004849b1: vsubss xmm1, xmm0, dword ptr [rip + 0x620707] ; 0x100aa50c0
0x1004849b9: vmovss xmm2, dword ptr [rip + 0x63f057] ; 0x100ac3a18
0x1004849c1: vmulss xmm1, xmm1, xmm2
0x1004849c5: vmulss xmm0, xmm0, xmm2
0x1004849c9: vaddss xmm0, xmm0, xmm1
0x1004849cd: vmovaps xmm1, xmmword ptr [rbp - 0x40]
0x1004849d2: vinsertps xmm0, xmm1, xmm0, 0x1c
0x1004849d8: vmovaps xmm1, xmmword ptr [rbp - 0xb0]
0x1004849e0: vinsertps xmm1, xmm0, xmm1, 0xf4
0x1004849e6: vmovaps xmm0, xmm1
0x1004849ea: mov rax, qword ptr [r14 + 0xc0]
0x1004849f1: vmovaps xmmword ptr [rax + rbx + 0x10], xmm0
0x1004849f7: lea ecx, [r13 + 1]
0x1004849fb: mov rax, qword ptr [r14 + 0x40]
0x1004849ff: cmp ecx, dword ptr [rax + 0x10]
0x100484a02: jb 0x1004846f0
0x100484a08: cmp byte ptr [r14 + 0xa0], 0
0x100484a10: jne 0x100484a37
0x100484a12: mov byte ptr [r14 + 0xe0], 1
0x100484a1a: mov rax, qword ptr [rbp - 0x48]
0x100484a1e: mov rax, qword ptr [rax + 0x160]
0x100484a25: vmovss xmm0, dword ptr [rax + 0x24]
0x100484a2a: vcvtss2sd xmm0, xmm0, xmm0
0x100484a2e: vmovsd qword ptr [r14 + 0xe8], xmm0
0x100484a37: add rsp, 0xe8
0x100484a3e: pop rbx
0x100484a3f: pop r12
0x100484a41: pop r13
0x100484a43: pop r14
0x100484a45: pop r15
0x100484a47: pop rbp
0x100484a48: ret 
0x100484a49: lea rdi, [rip + 0x6dd0a8] ; 0x100b61af8 ret
0x100484a50: lea rsi, [rip + 0x6dcf0c] ; 0x100b61963 ./Clump.h
0x100484a57: mov edx, 0x47
0x100484a5c: mov ecx, 3
0x100484a61: call 0x1007e5f70 ; 0x1007e5f70
0x100484a66: ud2 
0x100484a68: nop dword ptr [rax + rax]
