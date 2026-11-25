0x10062e700: push rbp
0x10062e701: mov rbp, rsp
0x10062e704: push r14
0x10062e706: push rbx
0x10062e707: sub rsp, 0x20
0x10062e70b: mov rbx, rsi
0x10062e70e: mov r14, rdi
0x10062e711: cmp byte ptr [rbx + 0x10], 0
0x10062e715: je 0x10062e7de
0x10062e71b: mov byte ptr [rbx + 0x10], 0
0x10062e71f: vmovaps xmm0, xmmword ptr [rbx]
0x10062e723: vmovss xmm1, dword ptr [rbx + 0x84]
0x10062e72b: vmulps xmm2, xmm0, xmm0
0x10062e72f: vmovshdup xmm3, xmm2
0x10062e733: vaddss xmm3, xmm2, xmm3
0x10062e737: vpermilpd xmm2, xmm2, 1
0x10062e73d: vaddss xmm2, xmm2, xmm3
0x10062e741: vsqrtss xmm2, xmm2, xmm2
0x10062e745: vmovss xmm3, dword ptr [rip + 0x47834f] ; 0x100aa6a9c
0x10062e74d: vmaxss xmm4, xmm3, xmm2
0x10062e751: vcmpunordss xmm2, xmm2, xmm2
0x10062e756: vandnps xmm4, xmm2, xmm4
0x10062e75a: vandps xmm2, xmm2, xmm3
0x10062e75e: vorps xmm2, xmm4, xmm2
0x10062e762: vdivss xmm1, xmm1, xmm2
0x10062e766: vmovss xmm2, dword ptr [rip + 0x476952] ; 0x100aa50c0
0x10062e76e: vminss xmm3, xmm2, xmm1
0x10062e772: vcmpunordss xmm1, xmm1, xmm1
0x10062e777: vandnps xmm3, xmm1, xmm3
0x10062e77b: vandps xmm1, xmm1, xmm2
0x10062e77f: vorps xmm1, xmm3, xmm1
0x10062e783: vpermilps xmm1, xmm1, 0xc0
0x10062e789: vmulps xmm0, xmm0, xmm1
0x10062e78d: vmovaps xmmword ptr [rbx], xmm0
0x10062e791: test dl, dl
0x10062e793: je 0x10062e7cd
0x10062e795: mov byte ptr [rbp - 0x11], 0
0x10062e799: lea rsi, [rbx + 0x20]
0x10062e79d: vmovss xmm0, dword ptr [rbx + 0x80]
0x10062e7a5: vmulss xmm0, xmm0, dword ptr [rip + 0x4782fb] ; 0x100aa6aa8
0x10062e7ad: mov rcx, qword ptr [rbx + 0x1e0]
0x10062e7b4: lea rdi, [rbp - 0x30]
0x10062e7b8: lea r8, [rbp - 0x11]
0x10062e7bc: mov rdx, rbx
0x10062e7bf: call 0x10062d590 ; 0x10062d590
0x10062e7c4: vmovaps xmm0, xmmword ptr [rbp - 0x30]
0x10062e7c9: vmovaps xmmword ptr [rbx], xmm0
0x10062e7cd: vmovaps xmmword ptr [r14], xmm0
0x10062e7d2: mov rax, r14
0x10062e7d5: add rsp, 0x20
0x10062e7d9: pop rbx
0x10062e7da: pop r14
0x10062e7dc: pop rbp
0x10062e7dd: ret 
0x10062e7de: lea rdi, [rip + 0x568ebc] ; 0x100b976a1 m_accum
0x10062e7e5: lea rsi, [rip + 0x568ebd] ; 0x100b976a9 SteeringBehaviors.cpp
0x10062e7ec: mov edx, 0x18d
0x10062e7f1: mov ecx, 3
0x10062e7f6: call 0x1007e5f70 ; 0x1007e5f70
0x10062e7fb: ud2 
0x10062e7fd: nop dword ptr [rax]
