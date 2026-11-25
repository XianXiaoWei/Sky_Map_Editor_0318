0x1002289b0: mov r8d, dword ptr [rdi + 0xc820]
0x1002289b7: cmp r8, 0x20
0x1002289bb: jae 0x100228a00
0x1002289bd: lea eax, [r8 + 1]
0x1002289c1: mov dword ptr [rdi + 0xc820], eax
0x1002289c7: shl r8, 6
0x1002289cb: vmovaps xmm1, xmmword ptr [rsi]
0x1002289cf: vmovaps xmmword ptr [rdi + r8 + 0xc020], xmm1
0x1002289d9: vmovaps xmm1, xmmword ptr [rdx]
0x1002289dd: vmovaps xmmword ptr [rdi + r8 + 0xc030], xmm1
0x1002289e7: vmovss dword ptr [rdi + r8 + 0xc040], xmm0
0x1002289f1: vmovaps xmm0, xmmword ptr [rcx]
0x1002289f5: vmovaps xmmword ptr [rdi + r8 + 0xc050], xmm0
0x1002289ff: ret 
0x100228a00: push rbp
0x100228a01: mov rbp, rsp
0x100228a04: lea rdi, [rip + 0x9521a8] ; 0x100b7abb3 m_physicsSphereCount < kMaxPhysicsSpheres
0x100228a0b: lea rsi, [rip + 0x9520f5] ; 0x100b7ab07 CloudParticleBarn.cpp
0x100228a12: mov edx, 0xe1
0x100228a17: mov ecx, 3
0x100228a1c: call 0x1007e5f70 ; 0x1007e5f70
0x100228a21: ud2 
0x100228a23: nop word ptr cs:[rax + rax]
