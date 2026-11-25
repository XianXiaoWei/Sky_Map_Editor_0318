0x100324070: push rbp
0x100324071: mov rbp, rsp
0x100324074: push r15
0x100324076: push r14
0x100324078: push r13
0x10032407a: push r12
0x10032407c: push rbx
0x10032407d: sub rsp, 0x138
0x100324084: mov byte ptr [rdi + 0x51], 0
0x100324088: vmovaps xmm0, xmmword ptr [rip + 0xa07b00] ; 0x100d2bb90
0x100324090: vmovaps xmmword ptr [rdi + 0x40], xmm0
0x100324095: vmovaps xmm0, xmmword ptr [rip + 0xa07b03] ; 0x100d2bba0
0x10032409d: vmovaps xmmword ptr [rdi + 0x30], xmm0
0x1003240a2: vmovaps xmmword ptr [rdi + 0x20], xmm0
0x1003240a7: vxorps xmm0, xmm0, xmm0
0x1003240ab: vmovaps xmmword ptr [rdi + 0x10], xmm0
0x1003240b0: mov byte ptr [rdi + 0x50], 0
0x1003240b4: mov dword ptr [rdi + 0x54], 0
0x1003240bb: mov byte ptr [rdi + 0x5c], 0
0x1003240bf: mov qword ptr [rdi + 0x70], 0
0x1003240c7: mov eax, dword ptr [rdi + 0x62d0]
0x1003240cd: test eax, eax
0x1003240cf: je 0x10032428d
0x1003240d5: xor esi, esi
0x1003240d7: mov qword ptr [rbp - 0x38], rdi
0x1003240db: nop dword ptr [rax + rax]
0x1003240e0: mov edx, esi
0x1003240e2: shl rdx, 4
0x1003240e6: mov rcx, qword ptr [rdi + rdx + 0x62e0]
0x1003240ee: cmp dword ptr [rcx + 0x10], 0
0x1003240f2: je 0x100324283
0x1003240f8: mov dword ptr [rbp - 0x2c], esi
0x1003240fb: lea rax, [rdi + rdx + 0x62e0]
0x100324103: mov qword ptr [rbp - 0x40], rax
0x100324107: xor edx, edx
0x100324109: nop dword ptr [rax]
0x100324110: mov rax, qword ptr [rcx + 8]
0x100324114: mov dword ptr [rbp - 0x30], edx
0x100324117: mov ecx, edx
0x100324119: mov rax, qword ptr [rax + rcx*8]
0x10032411d: mov qword ptr [rbp - 0xd0], rax
0x100324124: call 0x1007abc10 ; 0x1007abc10
0x100324129: mov r14, rax
0x10032412c: mov qword ptr [rbp - 0x90], 0
0x100324137: call 0x10055b490 ; 0x10055b490
0x10032413c: mov r8, qword ptr [rax]
0x10032413f: mov rdi, rax
0x100324142: lea rsi, [rbp - 0x90]
0x100324149: lea rdx, [rbp - 0xd0]
0x100324150: mov rcx, r14
0x100324153: call qword ptr [r8 + 0x40]
0x100324157: mov r14, qword ptr [rbp - 0x90]
0x10032415e: test r14, r14
0x100324161: je 0x1003242ce
0x100324167: cmp dword ptr [r14 + 0x28], 1
0x10032416c: je 0x100324261
0x100324172: mov r13d, 2
0x100324178: nop dword ptr [rax + rax]
0x100324180: lea ebx, [r13 - 2]
0x100324184: mov rax, qword ptr [r14 + 0x20]
0x100324188: mov rsi, qword ptr [rax + rbx*8]
0x10032418c: lea r15, [rbp - 0x150]
0x100324193: mov rdi, r15
0x100324196: call 0x1004d1e40 ; 0x1004d1e40
0x10032419b: mov rax, qword ptr [r14 + 0x20]
0x10032419f: mov rsi, qword ptr [rax + rbx*8]
0x1003241a3: lea r12, [rbp - 0xd0]
0x1003241aa: mov rdi, r12
0x1003241ad: call 0x1004d2140 ; 0x1004d2140
0x1003241b2: lea rbx, [rbp - 0x90]
0x1003241b9: mov rdi, rbx
0x1003241bc: mov rsi, r15
0x1003241bf: mov rdx, r12
0x1003241c2: call 0x100076df0 ; 0x100076df0
0x1003241c7: vmovss xmm0, dword ptr [rbp - 0x7c]
0x1003241cc: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1003241d1: mov rax, qword ptr [r14 + 0x20]
0x1003241d5: lea ebx, [r13 - 1]
0x1003241d9: mov rsi, qword ptr [rax + rbx*8]
0x1003241dd: lea r15, [rbp - 0x110]
0x1003241e4: mov rdi, r15
0x1003241e7: call 0x1004d1e40 ; 0x1004d1e40
0x1003241ec: mov rax, qword ptr [r14 + 0x20]
0x1003241f0: mov rsi, qword ptr [rax + rbx*8]
0x1003241f4: mov rdi, r12
0x1003241f7: call 0x1004d2140 ; 0x1004d2140
0x1003241fc: lea rdi, [rbp - 0x90]
0x100324203: mov rsi, r15
0x100324206: mov rdx, r12
0x100324209: call 0x100076df0 ; 0x100076df0
0x10032420e: vmovss xmm0, dword ptr [rbp - 0x7c]
0x100324213: vpermilps xmm1, xmmword ptr [rbp - 0x50], 0
0x10032421a: xor eax, eax
0x10032421c: vxorps xmm2, xmm2, xmm2
0x100324220: vucomiss xmm1, xmm2
0x100324224: seta al
0x100324227: xor ecx, ecx
0x100324229: vucomiss xmm2, xmm1
0x10032422d: seta cl
0x100324230: sub eax, ecx
0x100324232: vpermilps xmm0, xmm0, 0
0x100324238: xor ecx, ecx
0x10032423a: vucomiss xmm0, xmm2
0x10032423e: seta cl
0x100324241: xor edx, edx
0x100324243: vucomiss xmm2, xmm0
0x100324247: seta dl
0x10032424a: sub ecx, edx
0x10032424c: cmp eax, ecx
0x10032424e: jne 0x10032429f
0x100324250: mov eax, dword ptr [r14 + 0x28]
0x100324254: dec eax
0x100324256: inc r13d
0x100324259: cmp ebx, eax
0x10032425b: jb 0x100324180
0x100324261: mov edx, dword ptr [rbp - 0x30]
0x100324264: inc edx
0x100324266: mov rax, qword ptr [rbp - 0x40]
0x10032426a: mov rcx, qword ptr [rax]
0x10032426d: cmp edx, dword ptr [rcx + 0x10]
0x100324270: jb 0x100324110
0x100324276: mov rdi, qword ptr [rbp - 0x38]
0x10032427a: mov eax, dword ptr [rdi + 0x62d0]
0x100324280: mov esi, dword ptr [rbp - 0x2c]
0x100324283: inc esi
0x100324285: cmp esi, eax
0x100324287: jb 0x1003240e0
0x10032428d: add rsp, 0x138
0x100324294: pop rbx
0x100324295: pop r12
0x100324297: pop r13
0x100324299: pop r14
0x10032429b: pop r15
0x10032429d: pop rbp
0x10032429e: ret 
0x10032429f: mov dword ptr [rsp], r13d
0x1003242a3: lea rdi, [rip + 0x85cc71] ; 0x100b80f1b Math::Sign( m0[ 1 ][ 1 ] ) == Math::Sign( m1[ 1 ][ 1 ] )
0x1003242aa: lea rsi, [rip + 0x85cb00] ; 0x100b80db1 EnvironmentForces.cpp
0x1003242b1: lea r8, [rip + 0x85cc9c] ; 0x100b80f54 Boundary Rail error - some Markers are facing left, some right. The red lines on your Markers should all be facing the desired "safe" direction of the boundary. %dth and %dth differ.
0x1003242b8: mov edx, 0x108
0x1003242bd: mov ecx, 4
0x1003242c2: xor eax, eax
0x1003242c4: mov r9d, ebx
0x1003242c7: call 0x1007e6030 ; 0x1007e6030
0x1003242cc: ud2 
0x1003242ce: lea rdi, [rip + 0x83d823] ; 0x100b61af8 ret
0x1003242d5: lea rsi, [rip + 0x83d687] ; 0x100b61963 ./Clump.h
0x1003242dc: mov edx, 0x47
0x1003242e1: mov ecx, 3
0x1003242e6: call 0x1007e5f70 ; 0x1007e5f70
0x1003242eb: ud2 
0x1003242ed: nop dword ptr [rax]
