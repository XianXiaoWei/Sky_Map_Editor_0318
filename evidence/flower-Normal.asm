0x100776100: push rbp
0x100776101: mov rbp, rsp
0x100776104: mov rax, qword ptr [rsi + 0x190]
0x10077610b: test rax, rax
0x10077610e: je 0x100776227
0x100776114: cmp dword ptr [rax + 0x44], edx
0x100776117: jbe 0x100776246
0x10077611d: mov rcx, qword ptr [rax + 0x20]
0x100776121: mov r8, qword ptr [rax + 0x28]
0x100776125: add r8, rcx
0x100776128: add rcx, qword ptr [rax + 0x30]
0x10077612c: lea eax, [rdx + rdx*2]
0x10077612f: mov r9d, dword ptr [rcx + rax*4]
0x100776133: shl r9, 4
0x100776137: lea eax, [rdx + rdx*2 + 1]
0x10077613b: mov eax, dword ptr [rcx + rax*4]
0x10077613e: shl rax, 4
0x100776142: lea edx, [rdx + rdx*2 + 2]
0x100776146: mov ecx, dword ptr [rcx + rdx*4]
0x100776149: shl rcx, 4
0x10077614d: vmovaps xmm0, xmmword ptr [rcx + r8]
0x100776153: vsubps xmm1, xmm0, xmmword ptr [r9 + r8]
0x100776159: vsubps xmm0, xmm0, xmmword ptr [rax + r8]
0x10077615f: vpermilps xmm2, xmm1, 0xd2
0x100776165: vmulps xmm2, xmm2, xmm0
0x100776169: vpermilps xmm0, xmm0, 0xd2
0x10077616f: vmulps xmm0, xmm1, xmm0
0x100776173: vsubps xmm1, xmm2, xmm0
0x100776177: vpermilps xmm0, xmm1, 0xd2
0x10077617d: vmulps xmm1, xmm1, xmm1
0x100776181: vpermilpd xmm2, xmm1, 1
0x100776187: vaddss xmm2, xmm2, xmm1
0x10077618b: vmovshdup xmm1, xmm1
0x10077618f: vaddss xmm1, xmm1, xmm2
0x100776193: vsqrtss xmm1, xmm1, xmm1
0x100776197: vucomiss xmm1, dword ptr [rip + 0x331725] ; 0x100aa78c4
0x10077619f: jbe 0x1007761ab
0x1007761a1: vpermilps xmm1, xmm1, 0xc0
0x1007761a7: vdivps xmm0, xmm0, xmm1
0x1007761ab: cmp byte ptr [rsi + 0x18d], 0
0x1007761b2: je 0x10077621e
0x1007761b4: vpermilps xmm1, xmm0, 0xc0
0x1007761ba: vmulps xmm1, xmm1, xmmword ptr [rsi + 0x130]
0x1007761c2: vpermilps xmm2, xmm0, 0xd5
0x1007761c8: vmulps xmm2, xmm2, xmmword ptr [rsi + 0x140]
0x1007761d0: vaddps xmm1, xmm2, xmm1
0x1007761d4: vpermilps xmm0, xmm0, 0xea
0x1007761da: vmulps xmm0, xmm0, xmmword ptr [rsi + 0x150]
0x1007761e2: vaddps xmm0, xmm0, xmm1
0x1007761e6: vmulps xmm1, xmm0, xmm0
0x1007761ea: vmovshdup xmm2, xmm1
0x1007761ee: vaddss xmm2, xmm1, xmm2
0x1007761f2: vpermilpd xmm1, xmm1, 1
0x1007761f8: vaddss xmm1, xmm1, xmm2
0x1007761fc: vsqrtss xmm1, xmm1, xmm1
0x100776200: vucomiss xmm1, dword ptr [rip + 0x3316bc] ; 0x100aa78c4
0x100776208: jbe 0x100776216
0x10077620a: vpermilps xmm1, xmm1, 0xc0
0x100776210: vdivps xmm0, xmm0, xmm1
0x100776214: jmp 0x10077621e ; 0x10077621e
0x100776216: vmovaps xmm0, xmmword ptr [rip + 0x333032] ; 0x100aa9250
0x10077621e: vmovaps xmmword ptr [rdi], xmm0
0x100776222: mov rax, rdi
0x100776225: pop rbp
0x100776226: ret 
0x100776227: lea rdi, [rip + 0x4282c9] ; 0x100b9e4f7 m_geo
0x10077622e: lea rsi, [rip + 0x42811a] ; 0x100b9e34f CollisionGeo.cpp
0x100776235: mov edx, 0x6cf
0x10077623a: mov ecx, 3
0x10077623f: call 0x1007e5f70 ; 0x1007e5f70
0x100776244: ud2 
0x100776246: lea rdi, [rip + 0x428198] ; 0x100b9e3e5 triIdx < m_triCount
0x10077624d: lea rsi, [rip + 0x4280fb] ; 0x100b9e34f CollisionGeo.cpp
0x100776254: mov edx, 0x4db
0x100776259: mov ecx, 3
0x10077625e: call 0x1007e5f70 ; 0x1007e5f70
0x100776263: ud2 
0x100776265: nop word ptr cs:[rax + rax]
