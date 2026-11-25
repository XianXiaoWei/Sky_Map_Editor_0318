0x10062e860: push rbp
0x10062e861: mov rbp, rsp
0x10062e864: push rbx
0x10062e865: sub rsp, 0x28
0x10062e869: vmovaps xmm3, xmm0
0x10062e86d: mov rbx, rdi
0x10062e870: cmp byte ptr [rbx + 0x10], 0
0x10062e874: je 0x10062e8cb
0x10062e876: vandps xmm0, xmm3, xmmword ptr [rip + 0x479092] ; 0x100aa7910
0x10062e87e: vmovss xmm2, dword ptr [rip + 0x47903e] ; 0x100aa78c4
0x10062e886: vucomiss xmm2, xmm0
0x10062e88a: jae 0x10062e8c4
0x10062e88c: lea rax, [rbx + 0x20]
0x10062e890: mov rdx, qword ptr [rbx + 0x1e0]
0x10062e897: movzx ecx, sil
0x10062e89b: lea rdi, [rbp - 0x30]
0x10062e89f: mov rsi, rax
0x10062e8a2: vmovaps xmm0, xmm1
0x10062e8a6: vmovaps xmmword ptr [rbp - 0x20], xmm3
0x10062e8ab: call 0x10062d380 ; 0x10062d380
0x10062e8b0: vpermilps xmm0, xmmword ptr [rbp - 0x20], 0xc0
0x10062e8b7: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x30]
0x10062e8bc: vaddps xmm0, xmm0, xmmword ptr [rbx]
0x10062e8c0: vmovaps xmmword ptr [rbx], xmm0
0x10062e8c4: add rsp, 0x28
0x10062e8c8: pop rbx
0x10062e8c9: pop rbp
0x10062e8ca: ret 
0x10062e8cb: lea rdi, [rip + 0x568dcf] ; 0x100b976a1 m_accum
0x10062e8d2: lea rsi, [rip + 0x568dd0] ; 0x100b976a9 SteeringBehaviors.cpp
0x10062e8d9: mov edx, 0x1a5
0x10062e8de: mov ecx, 3
0x10062e8e3: call 0x1007e5f70 ; 0x1007e5f70
0x10062e8e8: ud2 
0x10062e8ea: nop word ptr [rax + rax]
