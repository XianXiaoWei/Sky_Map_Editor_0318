0x100148920: push rbp
0x100148921: mov rbp, rsp
0x100148924: test rsi, rsi
0x100148927: je 0x1001489e6
0x10014892d: test rdx, rdx
0x100148930: je 0x100148a05
0x100148936: mov eax, dword ptr [rdi + 0xb40]
0x10014893c: cmp eax, ecx
0x10014893e: cmova eax, ecx
0x100148941: test eax, eax
0x100148943: je 0x1001489e4
0x100148949: mov r9d, eax
0x10014894c: mov r8d, r9d
0x10014894f: and r8d, 1
0x100148953: cmp eax, 1
0x100148956: jne 0x100148965
0x100148958: xor r10d, r10d
0x10014895b: test r8, r8
0x10014895e: jne 0x1001489bc
0x100148960: jmp 0x1001489e4 ; 0x1001489e4
0x100148965: sub r9, r8
0x100148968: xor r11d, r11d
0x10014896b: xor r10d, r10d
0x10014896e: nop 
0x100148970: vmovaps xmm0, xmmword ptr [rdi + r11*4 + 0x740]
0x10014897a: vmovaps xmmword ptr [rsi + r11*2], xmm0
0x100148980: mov ecx, dword ptr [rdi + r11*4 + 0x750]
0x100148988: mov dword ptr [rdx + r10*4], ecx
0x10014898c: vmovaps xmm0, xmmword ptr [rdi + r11*4 + 0x760]
0x100148996: vmovaps xmmword ptr [rsi + r11*2 + 0x10], xmm0
0x10014899d: mov ecx, dword ptr [rdi + r11*4 + 0x770]
0x1001489a5: mov dword ptr [rdx + r10*4 + 4], ecx
0x1001489aa: add r10, 2
0x1001489ae: add r11, 0x10
0x1001489b2: cmp r9, r10
0x1001489b5: jne 0x100148970
0x1001489b7: test r8, r8
0x1001489ba: je 0x1001489e4
0x1001489bc: mov rcx, r10
0x1001489bf: shl rcx, 5
0x1001489c3: mov r8, r10
0x1001489c6: shl r8, 4
0x1001489ca: vmovaps xmm0, xmmword ptr [rdi + rcx + 0x740]
0x1001489d3: vmovaps xmmword ptr [rsi + r8], xmm0
0x1001489d9: mov ecx, dword ptr [rdi + rcx + 0x750]
0x1001489e0: mov dword ptr [rdx + r10*4], ecx
0x1001489e4: pop rbp
0x1001489e5: ret 
0x1001489e6: lea rdi, [rip + 0xa2c8bc] ; 0x100b752a9 out_forces
0x1001489ed: lea rsi, [rip + 0xa2c5e4] ; 0x100b74fd8 AvatarLoco.cpp
0x1001489f4: mov edx, 0x6ea
0x1001489f9: mov ecx, 3
0x1001489fe: call 0x1007e5f70 ; 0x1007e5f70
0x100148a03: ud2 
0x100148a05: lea rdi, [rip + 0xa2c8a8] ; 0x100b752b4 out_maxVels
0x100148a0c: lea rsi, [rip + 0xa2c5c5] ; 0x100b74fd8 AvatarLoco.cpp
0x100148a13: mov edx, 0x6eb
0x100148a18: mov ecx, 3
0x100148a1d: call 0x1007e5f70 ; 0x1007e5f70
0x100148a22: ud2 
0x100148a24: nop word ptr cs:[rax + rax]

