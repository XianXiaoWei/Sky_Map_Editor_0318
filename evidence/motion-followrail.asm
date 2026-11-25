0x10062e300: push rbp
0x10062e301: mov rbp, rsp
0x10062e304: push r15
0x10062e306: push r14
0x10062e308: push r12
0x10062e30a: push rbx
0x10062e30b: sub rsp, 0x20
0x10062e30f: vmovaps xmm2, xmm0
0x10062e313: mov r15, rcx
0x10062e316: mov rbx, rdx
0x10062e319: mov r12, rsi
0x10062e31c: mov r14, rdi
0x10062e31f: vmovss xmm0, dword ptr [r12 + 0x54]
0x10062e326: vdivss xmm0, xmm0, dword ptr [rbx + 0x18]
0x10062e32b: vmulss xmm0, xmm0, xmm1
0x10062e32f: test r8b, r8b
0x10062e332: jne 0x10062e33c
0x10062e334: vxorps xmm0, xmm0, xmmword ptr [rip + 0x4795c4] ; 0x100aa7900
0x10062e33c: vaddss xmm0, xmm0, dword ptr [r15]
0x10062e341: cmp byte ptr [rbx + 0x2c], 0
0x10062e345: vmovss dword ptr [rbp - 0x28], xmm2
0x10062e34a: je 0x10062e35b
0x10062e34c: vmovss xmm1, dword ptr [rip + 0x476d6c] ; 0x100aa50c0
0x10062e354: call 0x100aa2744 ; 0x100aa2744 _fmodf
0x10062e359: jmp 0x10062e36f ; 0x10062e36f
0x10062e35b: vxorps xmm1, xmm1, xmm1
0x10062e35f: vmaxss xmm0, xmm1, xmm0
0x10062e363: vmovss xmm1, dword ptr [rip + 0x476d55] ; 0x100aa50c0
0x10062e36b: vminss xmm0, xmm1, xmm0
0x10062e36f: lea rdi, [rbp - 0x40]
0x10062e373: mov rsi, rbx
0x10062e376: vmovss dword ptr [rbp - 0x24], xmm0
0x10062e37b: call 0x10055e420 ; 0x10055e420
0x10062e380: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10062e385: vsubps xmm1, xmm0, xmmword ptr [r12]
0x10062e38b: vmulps xmm1, xmm1, xmm1
0x10062e38f: vmovshdup xmm2, xmm1
0x10062e393: vaddss xmm2, xmm1, xmm2
0x10062e397: vpermilpd xmm1, xmm1, 1
0x10062e39d: vaddss xmm1, xmm1, xmm2
0x10062e3a1: vmovss xmm2, dword ptr [rbp - 0x28]
0x10062e3a6: vmulss xmm2, xmm2, xmm2
0x10062e3aa: vucomiss xmm1, xmm2
0x10062e3ae: jbe 0x10062e407
0x10062e3b0: vmovss xmm1, dword ptr [rbp - 0x24]
0x10062e3b5: vmovss dword ptr [r15], xmm1
0x10062e3ba: vsubps xmm0, xmm0, xmmword ptr [r12]
0x10062e3c0: vmulps xmm1, xmm0, xmm0
0x10062e3c4: vmovshdup xmm2, xmm1
0x10062e3c8: vaddss xmm2, xmm1, xmm2
0x10062e3cc: vpermilpd xmm1, xmm1, 1
0x10062e3d2: vaddss xmm1, xmm1, xmm2
0x10062e3d6: vsqrtss xmm1, xmm1, xmm1
0x10062e3da: vucomiss xmm1, dword ptr [rip + 0x4794e2] ; 0x100aa78c4
0x10062e3e2: jbe 0x10062e3ee
0x10062e3e4: vpermilps xmm1, xmm1, 0xc0
0x10062e3ea: vdivps xmm0, xmm0, xmm1
0x10062e3ee: vbroadcastss xmm1, dword ptr [r12 + 0x54]
0x10062e3f5: vmulps xmm0, xmm0, xmm1
0x10062e3f9: vsubps xmm0, xmm0, xmmword ptr [r12 + 0x40]
0x10062e400: vmovaps xmmword ptr [r14], xmm0
0x10062e405: jmp 0x10062e418 ; 0x10062e418
0x10062e407: vxorps xmm0, xmm0, xmm0
0x10062e40b: vmovlps qword ptr [r14], xmm0
0x10062e410: mov dword ptr [r14 + 8], 0
0x10062e418: mov rax, r14
0x10062e41b: add rsp, 0x20
0x10062e41f: pop rbx
0x10062e420: pop r12
0x10062e422: pop r14
0x10062e424: pop r15
0x10062e426: pop rbp
0x10062e427: ret 
0x10062e428: nop dword ptr [rax + rax]
