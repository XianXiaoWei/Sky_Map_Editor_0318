0x100630020: push rbp
0x100630021: mov rbp, rsp
0x100630024: push r15
0x100630026: push r14
0x100630028: push rbx
0x100630029: sub rsp, 0x38
0x10063002d: mov r15d, edx
0x100630030: mov r14, rsi
0x100630033: mov rbx, rdi
0x100630036: cmp byte ptr [rbx + 0x10], 0
0x10063003a: je 0x10063016d
0x100630040: vandps xmm3, xmm0, xmmword ptr [rip + 0x4778c8] ; 0x100aa7910
0x100630048: vmovss xmm4, dword ptr [rip + 0x477874] ; 0x100aa78c4
0x100630050: vucomiss xmm4, xmm3
0x100630054: jae 0x100630162
0x10063005a: vmovss dword ptr [rbp - 0x1c], xmm2
0x10063005f: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x100630064: vbroadcastss xmm0, dword ptr [rbx + 0x80]
0x10063006d: vmulps xmm0, xmm0, xmmword ptr [rbx + 0x60]
0x100630072: vaddps xmm0, xmm0, xmmword ptr [rbx + 0x20]
0x100630077: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x10063007c: lea rsi, [rbp - 0x30]
0x100630080: lea rdx, [rbp - 0x50]
0x100630084: mov rdi, r14
0x100630087: vmovss dword ptr [rbp - 0x20], xmm1
0x10063008c: call 0x10055d820 ; 0x10055d820
0x100630091: vmovaps xmm1, xmmword ptr [rbp - 0x50]
0x100630096: vsubps xmm1, xmm1, xmmword ptr [rbx + 0x20]
0x10063009b: vmulps xmm1, xmm1, xmm1
0x10063009f: vmovshdup xmm2, xmm1
0x1006300a3: vaddss xmm2, xmm1, xmm2
0x1006300a7: vpermilpd xmm1, xmm1, 1
0x1006300ad: vaddss xmm2, xmm1, xmm2
0x1006300b1: vmovss xmm1, dword ptr [rbp - 0x20]
0x1006300b6: vmulss xmm3, xmm1, xmm1
0x1006300ba: vxorps xmm1, xmm1, xmm1
0x1006300be: vucomiss xmm2, xmm3
0x1006300c2: jbe 0x10063014f
0x1006300c8: mov rdi, r14
0x1006300cb: call 0x10055d410 ; 0x10055d410
0x1006300d0: test r15b, r15b
0x1006300d3: jne 0x1006300df
0x1006300d5: vmovss xmm1, dword ptr [rip + 0x474fe7] ; 0x100aa50c4
0x1006300dd: jmp 0x1006300e7 ; 0x1006300e7
0x1006300df: vmovss xmm1, dword ptr [rip + 0x474fd9] ; 0x100aa50c0
0x1006300e7: vmovss xmm2, dword ptr [rbp - 0x1c]
0x1006300ec: vmulss xmm1, xmm1, xmm2
0x1006300f0: vaddss xmm0, xmm1, xmm0
0x1006300f4: mov rdi, r14
0x1006300f7: call 0x10055d4e0 ; 0x10055d4e0
0x1006300fc: lea rdi, [rbp - 0x30]
0x100630100: mov rsi, r14
0x100630103: call 0x10055e420 ; 0x10055e420
0x100630108: vmovaps xmm0, xmmword ptr [rbp - 0x30]
0x10063010d: vsubps xmm0, xmm0, xmmword ptr [rbx + 0x20]
0x100630112: vmulps xmm1, xmm0, xmm0
0x100630116: vmovshdup xmm2, xmm1
0x10063011a: vaddss xmm2, xmm1, xmm2
0x10063011e: vpermilpd xmm1, xmm1, 1
0x100630124: vaddss xmm1, xmm1, xmm2
0x100630128: vsqrtss xmm1, xmm1, xmm1
0x10063012c: vucomiss xmm1, dword ptr [rip + 0x477790] ; 0x100aa78c4
0x100630134: jbe 0x100630140
0x100630136: vpermilps xmm1, xmm1, 0xc0
0x10063013c: vdivps xmm0, xmm0, xmm1
0x100630140: vbroadcastss xmm1, dword ptr [rbx + 0x74]
0x100630146: vmulps xmm0, xmm0, xmm1
0x10063014a: vsubps xmm1, xmm0, xmmword ptr [rbx + 0x60]
0x10063014f: vpermilps xmm0, xmmword ptr [rbp - 0x40], 0xc0
0x100630156: vmulps xmm0, xmm0, xmm1
0x10063015a: vaddps xmm0, xmm0, xmmword ptr [rbx]
0x10063015e: vmovaps xmmword ptr [rbx], xmm0
0x100630162: add rsp, 0x38
0x100630166: pop rbx
0x100630167: pop r14
0x100630169: pop r15
0x10063016b: pop rbp
0x10063016c: ret 
0x10063016d: lea rdi, [rip + 0x56752d] ; 0x100b976a1 m_accum
0x100630174: lea rsi, [rip + 0x56752e] ; 0x100b976a9 SteeringBehaviors.cpp
0x10063017b: mov edx, 0x28d
0x100630180: mov ecx, 3
0x100630185: call 0x1007e5f70 ; 0x1007e5f70
0x10063018a: ud2 
0x10063018c: nop dword ptr [rax]
