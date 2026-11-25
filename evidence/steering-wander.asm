0x10062e8f0: push rbp
0x10062e8f1: mov rbp, rsp
0x10062e8f4: push rbx
0x10062e8f5: sub rsp, 0x28
0x10062e8f9: vmovaps xmmword ptr [rbp - 0x20], xmm0
0x10062e8fe: mov rbx, rdi
0x10062e901: cmp byte ptr [rbx + 0x10], 0
0x10062e905: je 0x10062e94b
0x10062e907: lea rsi, [rbx + 0x20]
0x10062e90b: lea rdx, [rbx + 0x90]
0x10062e912: vaddss xmm2, xmm2, dword ptr [rbx + 0x70]
0x10062e917: lea rdi, [rbp - 0x30]
0x10062e91b: vmovaps xmm0, xmm1
0x10062e91f: vmovaps xmm1, xmm2
0x10062e923: vmovaps xmm2, xmm3
0x10062e927: vmovaps xmm3, xmm4
0x10062e92b: call 0x10062d010 ; 0x10062d010
0x10062e930: vpermilps xmm0, xmmword ptr [rbp - 0x20], 0xc0
0x10062e937: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x30]
0x10062e93c: vaddps xmm0, xmm0, xmmword ptr [rbx]
0x10062e940: vmovaps xmmword ptr [rbx], xmm0
0x10062e944: add rsp, 0x28
0x10062e948: pop rbx
0x10062e949: pop rbp
0x10062e94a: ret 
0x10062e94b: lea rdi, [rip + 0x568d4f] ; 0x100b976a1 m_accum
0x10062e952: lea rsi, [rip + 0x568d50] ; 0x100b976a9 SteeringBehaviors.cpp
0x10062e959: mov edx, 0x1ae
0x10062e95e: mov ecx, 3
0x10062e963: call 0x1007e5f70 ; 0x1007e5f70
0x10062e968: ud2 
0x10062e96a: nop word ptr [rax + rax]
