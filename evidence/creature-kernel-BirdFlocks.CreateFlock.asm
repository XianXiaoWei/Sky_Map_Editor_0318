0x10019bb70: mov eax, dword ptr [rdi + 0x80cf0]
0x10019bb76: cmp rax, 0x10
0x10019bb7a: jae 0x10019bc47
0x10019bb80: lea ecx, [rax + 1]
0x10019bb83: mov dword ptr [rdi + 0x80cf0], ecx
0x10019bb89: imul rcx, rax, 0xc8
0x10019bb90: lea rax, [rdi + rcx + 0x80070]
0x10019bb98: mov word ptr [rdi + rcx + 0x8007c], 0x101
0x10019bba2: mov qword ptr [rdi + rcx + 0x80080], 0
0x10019bbae: movabs rdx, 0x40a00000000003e8
0x10019bbb8: mov qword ptr [rdi + rcx + 0x80088], rdx
0x10019bbc0: mov dword ptr [rdi + rcx + 0x80090], 0x40800000
0x10019bbcb: movabs rdx, 0x420c000040400000
0x10019bbd5: mov qword ptr [rdi + rcx + 0x800d0], rdx
0x10019bbdd: mov qword ptr [rdi + rcx + 0x800d8], 0
0x10019bbe9: mov dword ptr [rdi + rcx + 0x800e0], 0
0x10019bbf4: mov qword ptr [rdi + rcx + 0x800e8], 0
0x10019bc00: mov dword ptr [rdi + rcx + 0x800f0], 0
0x10019bc0b: mov qword ptr [rdi + rcx + 0x80128], 0
0x10019bc17: mov dword ptr [rdi + rcx + 0x80130], 0
0x10019bc22: vxorps xmm0, xmm0, xmm0
0x10019bc26: vmovups xmmword ptr [rdi + rcx + 0x800f8], xmm0
0x10019bc2f: mov dword ptr [rdi + rcx + 0x80108], 0
0x10019bc3a: lea rdx, [rdi + 0x10]
0x10019bc3e: mov qword ptr [rdi + rcx + 0x80110], rdx
0x10019bc46: ret 
0x10019bc47: push rbp
0x10019bc48: mov rbp, rsp
0x10019bc4b: lea rdi, [rip + 0x9dbb5c] ; 0x100b777ae m_FlockCount < kMaxBirdFlocks
0x10019bc52: lea rsi, [rip + 0x9dbb73] ; 0x100b777cc BirdFlocks.cpp
0x10019bc59: mov edx, 0x214
0x10019bc5e: mov ecx, 3
0x10019bc63: call 0x1007e5f70 ; 0x1007e5f70
0x10019bc68: ud2 
0x10019bc6a: nop word ptr [rax + rax]
