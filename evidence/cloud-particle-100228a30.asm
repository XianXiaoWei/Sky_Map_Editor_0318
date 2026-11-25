0x100228a30: push rbp
0x100228a31: mov rbp, rsp
0x100228a34: push r14
0x100228a36: push rbx
0x100228a37: mov rbx, rdi
0x100228a3a: mov eax, dword ptr [rbx + 0xc828]
0x100228a40: cmp eax, 0x400
0x100228a45: je 0x100228b54
0x100228a4b: mov edx, dword ptr [rbx + 0xc824]
0x100228a51: lea ecx, [rdx + rax]
0x100228a54: and ecx, 0x3ff
0x100228a5a: cmp eax, 0x400
0x100228a5f: jb 0x100228a77
0x100228a61: inc edx
0x100228a63: and edx, 0x3ff
0x100228a69: mov dword ptr [rbx + 0xc824], edx
0x100228a6f: dec eax
0x100228a71: mov dword ptr [rbx + 0xc828], eax
0x100228a77: inc eax
0x100228a79: mov dword ptr [rbx + 0xc828], eax
0x100228a7f: vmovss xmm0, dword ptr [rsi]
0x100228a83: mov eax, ecx
0x100228a85: vmovss dword ptr [rbx + rax*4 + 0x18], xmm0
0x100228a8b: vmovss xmm0, dword ptr [rsi + 4]
0x100228a90: vmovss dword ptr [rbx + rax*4 + 0x1018], xmm0
0x100228a99: vmovss xmm0, dword ptr [rsi + 8]
0x100228a9e: vmovss dword ptr [rbx + rax*4 + 0x2018], xmm0
0x100228aa7: vmovss xmm0, dword ptr [rip + 0x87fb1d] ; 0x100aa85cc
0x100228aaf: vmulss xmm1, xmm0, dword ptr [rsi + 0x10]
0x100228ab4: vmovss dword ptr [rbx + rax*4 + 0x4018], xmm1
0x100228abd: vbroadcastss xmm1, dword ptr [rsi + 0x14]
0x100228ac3: vmulss xmm1, xmm1, xmm0
0x100228ac7: vmovss dword ptr [rbx + rax*4 + 0x5018], xmm1
0x100228ad0: vmovddup xmm1, qword ptr [rsi + 0x18]
0x100228ad5: vmulss xmm0, xmm1, xmm0
0x100228ad9: vmovss dword ptr [rbx + rax*4 + 0x6018], xmm0
0x100228ae2: vmovaps xmm0, xmmword ptr [rsi + 0x10]
0x100228ae7: vmulps xmm0, xmm0, xmm0
0x100228aeb: vmovshdup xmm1, xmm0
0x100228aef: vaddss xmm1, xmm0, xmm1
0x100228af3: vpermilpd xmm0, xmm0, 1
0x100228af9: vaddss xmm0, xmm0, xmm1
0x100228afd: vsqrtss xmm0, xmm0, xmm0
0x100228b01: vmovss dword ptr [rbx + rax*4 + 0x7018], xmm0
0x100228b0a: mov ecx, dword ptr [rsi + 0x20]
0x100228b0d: mov dword ptr [rbx + rax*4 + 0x3018], ecx
0x100228b14: mov dword ptr [rbx + rax*4 + 0x8018], 0x3f800000
0x100228b1f: lea r14, [rax + rax*2]
0x100228b23: mov eax, dword ptr [rsi + 0x24]
0x100228b26: mov dword ptr [rbx + r14*4 + 0x901c], eax
0x100228b2e: mov eax, dword ptr [rsi + 0x20]
0x100228b31: mov dword ptr [rbx + r14*4 + 0x9018], eax
0x100228b39: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x100228b3e: vcvtsi2ss xmm0, xmm2, eax
0x100228b42: vmulss xmm0, xmm0, dword ptr [rip + 0x87e5a6] ; 0x100aa70f0
0x100228b4a: vmovss dword ptr [rbx + r14*4 + 0x9020], xmm0
0x100228b54: pop rbx
0x100228b55: pop r14
0x100228b57: pop rbp
0x100228b58: ret 
0x100228b59: nop dword ptr [rax]
