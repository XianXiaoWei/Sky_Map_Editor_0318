0x1007194a0: push rbp
0x1007194a1: mov rbp, rsp
0x1007194a4: mov rax, qword ptr [rdi + 0x38]
0x1007194a8: mov rcx, qword ptr [rdi + 0x40]
0x1007194ac: vmovss xmm0, dword ptr [rax + 0x10]
0x1007194b1: lea rax, [rdi + 0x50]
0x1007194b5: test rcx, rcx
0x1007194b8: lea rcx, [rcx + 0x10]
0x1007194bc: cmove rcx, rax
0x1007194c0: vaddss xmm0, xmm0, dword ptr [rcx]
0x1007194c4: cmp byte ptr [rdi + 0x5d], 0
0x1007194c8: je 0x1007194d9
0x1007194ca: vmovss xmm1, dword ptr [rdi + 0x58]
0x1007194cf: vucomiss xmm0, xmm1
0x1007194d3: jbe 0x1007194d9
0x1007194d5: vmovaps xmm0, xmm1
0x1007194d9: lea rax, [rdi + 0x38]
0x1007194dd: cmp byte ptr [rdi + 0x5c], 0
0x1007194e1: je 0x1007194f2
0x1007194e3: vmovss xmm1, dword ptr [rdi + 0x54]
0x1007194e8: vucomiss xmm1, xmm0
0x1007194ec: jbe 0x1007194f2
0x1007194ee: vmovaps xmm0, xmm1
0x1007194f2: lea rcx, [rdi + 0x48]
0x1007194f6: cmp qword ptr [rdi + 0x48], 0
0x1007194fb: cmove rcx, rax
0x1007194ff: mov rax, qword ptr [rcx]
0x100719502: vmovss dword ptr [rax + 0x10], xmm0
0x100719507: cmp byte ptr [rdi + 0x5e], 0
0x10071950b: je 0x10071950f
0x10071950d: pop rbp
0x10071950e: ret 
0x10071950f: pop rbp
0x100719510: jmp 0x10032ef60 ; 0x10032ef60
0x100719515: nop word ptr cs:[rax + rax]
