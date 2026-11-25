0x100478610: push rbp
0x100478611: mov rbp, rsp
0x100478614: push r15
0x100478616: push r14
0x100478618: push r13
0x10047861a: push r12
0x10047861c: push rbx
0x10047861d: and rsp, 0xffffffffffffffe0
0x100478621: sub rsp, 0x2a0
0x100478628: mov r15, rcx
0x10047862b: mov r13, rdx
0x10047862e: mov r12, rsi
0x100478631: mov r14, rdi
0x100478634: mov rax, qword ptr [rip + 0x79529d] ; 0x100c0d8d8
0x10047863b: mov rax, qword ptr [rax]
0x10047863e: mov qword ptr [rsp + 0x280], rax
0x100478646: mov rdi, qword ptr [r14 + 0x398]
0x10047864d: mov rsi, qword ptr [rip + 0x1b9027c] ; 0x1020088d0
0x100478654: call 0x1002631a0 ; 0x1002631a0
0x100478659: mov qword ptr [rsp + 0x200], rax
0x100478661: call 0x100262d70 ; 0x100262d70
0x100478666: mov qword ptr [rsp + 0x40], 0
0x10047866f: mov rdi, qword ptr [rip + 0x1b9025a] ; 0x1020088d0
0x100478676: mov rbx, qword ptr [rdi]
0x100478679: lea rsi, [rsp + 0x40]
0x10047867e: lea rdx, [rsp + 0x200]
0x100478686: mov rcx, rax
0x100478689: call qword ptr [rbx + 0x40]
0x10047868c: mov rbx, qword ptr [rsp + 0x40]
0x100478691: test rbx, rbx
0x100478694: je 0x100478994
0x10047869a: mov qword ptr [rbx + 0x78], r13
0x10047869e: vmovaps xmm0, xmmword ptr [r12]
0x1004786a4: vinsertps xmm0, xmm0, dword ptr [rip + 0x62ca12], 0x30 ; 0x100aa50c0
0x1004786ae: vmovss xmm1, dword ptr [rip + 0x62ca0a] ; 0x100aa50c0
0x1004786b6: vmovaps xmmword ptr [rbx + 0x80], xmm1
0x1004786be: vmovaps xmm1, xmmword ptr [rip + 0x62f9da] ; 0x100aa80a0
0x1004786c6: vmovaps xmmword ptr [rbx + 0x90], xmm1
0x1004786ce: vmovaps xmm1, xmmword ptr [rip + 0x63035a] ; 0x100aa8a30
0x1004786d6: vmovaps xmmword ptr [rbx + 0xa0], xmm1
0x1004786de: vmovaps xmmword ptr [rbx + 0xb0], xmm0
0x1004786e6: mov byte ptr [rbx + 0xd0], 0
0x1004786ed: mov rax, qword ptr [rbx]
0x1004786f0: mov rsi, qword ptr [r14 + 0xe8]
0x1004786f7: mov rdi, rbx
0x1004786fa: mov rdx, r14
0x1004786fd: call qword ptr [rax + 0x30]
0x100478700: vmovaps xmm0, xmmword ptr [r15]
0x100478705: vmovaps xmmword ptr [rbx + 0x50], xmm0
0x10047870a: mov rax, qword ptr [rbx + 0x2e0]
0x100478711: mov byte ptr [rax + 0x99], 1
0x100478718: vmovaps xmm0, xmmword ptr [r12]
0x10047871e: vmovaps xmmword ptr [rbx + 0x10], xmm0
0x100478723: mov rdi, qword ptr [r14 + 0x220]
0x10047872a: mov edx, 1
0x10047872f: mov rsi, rbx
0x100478732: call 0x1004ce8c0 ; 0x1004ce8c0
0x100478737: mov rdi, qword ptr [r14 + 0x5c8]
0x10047873e: vxorps ymm0, ymm0, ymm0
0x100478742: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x10047874b: vmovaps ymmword ptr [rsp + 0x260], ymm0
0x100478754: vmovaps ymmword ptr [rsp + 0x240], ymm0
0x10047875d: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x100478766: mov byte ptr [rsp + 0x20d], 1
0x10047876e: mov dword ptr [rsp + 0x200], 0x3f800000
0x100478779: vmovaps xmm1, xmmword ptr [r12]
0x10047877f: vmovaps xmmword ptr [rsp + 0x210], xmm1
0x100478788: movabs rax, 0x420c000040400000
0x100478792: mov qword ptr [rsp + 0x248], rax
0x10047879a: mov dword ptr [rsp + 0x270], 0xc31
0x1004787a5: vmovups ymmword ptr [rsp + 0x1d0], ymm0
0x1004787ae: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x1004787b7: vmovaps ymmword ptr [rsp + 0x1a0], ymm0
0x1004787c0: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x1004787c9: vmovaps ymmword ptr [rsp + 0x160], ymm0
0x1004787d2: vmovaps ymmword ptr [rsp + 0x140], ymm0
0x1004787db: vmovaps ymmword ptr [rsp + 0x120], ymm0
0x1004787e4: vmovaps ymmword ptr [rsp + 0x100], ymm0
0x1004787ed: vmovaps ymmword ptr [rsp + 0xe0], ymm0
0x1004787f6: vmovaps ymmword ptr [rsp + 0xc0], ymm0
0x1004787ff: vmovaps ymmword ptr [rsp + 0xa0], ymm0
0x100478808: vmovaps ymmword ptr [rsp + 0x80], ymm0
0x100478811: vmovaps ymmword ptr [rsp + 0x60], ymm0
0x100478817: vmovaps ymmword ptr [rsp + 0x40], ymm0
0x10047881d: lea rsi, [rip + 0x711c1a] ; 0x100b8a43e EmberSpawn
0x100478824: lea rdx, [rsp + 0x200]
0x10047882c: lea rcx, [rsp + 0x40]
0x100478831: vzeroupper 
0x100478834: call 0x1006018a0 ; 0x1006018a0
0x100478839: mov rdi, qword ptr [r14 + 0x438]
0x100478840: vmovaps xmm0, xmmword ptr [r12]
0x100478846: vmovaps xmmword ptr [rsp + 0x30], xmm0
0x10047884c: vmovaps xmm0, xmmword ptr [r15]
0x100478851: vmulps xmm1, xmm0, xmm0
0x100478855: vmovshdup xmm2, xmm1
0x100478859: vaddss xmm2, xmm1, xmm2
0x10047885d: vpermilpd xmm1, xmm1, 1
0x100478863: vaddss xmm1, xmm1, xmm2
0x100478867: vsqrtss xmm1, xmm1, xmm1
0x10047886b: vucomiss xmm1, dword ptr [rip + 0x62f051] ; 0x100aa78c4
0x100478873: jbe 0x100478881
0x100478875: vpermilps xmm1, xmm1, 0xc0
0x10047887b: vdivps xmm0, xmm0, xmm1
0x10047887f: jmp 0x100478889 ; 0x100478889
0x100478881: vmovaps xmm0, xmmword ptr [rip + 0x62f817] ; 0x100aa80a0
0x100478889: vmovaps xmmword ptr [rsp + 0x20], xmm0
0x10047888f: lea rax, [rip + 0x1976e6a] ; 0x101def700
0x100478896: mov rcx, qword ptr [rax]
0x100478899: vmovss xmm0, dword ptr [rip + 0x62ef53] ; 0x100aa77f4
0x1004788a1: lea rsi, [rsp + 0x30]
0x1004788a6: lea rdx, [rsp + 0x20]
0x1004788ab: xor r8d, r8d
0x1004788ae: call 0x1002de9e0 ; 0x1002de9e0
0x1004788b3: mov qword ptr [rsp + 0x40], rax
0x1004788b8: mov dword ptr [rsp + 0x48], edx
0x1004788bc: lea rdi, [rsp + 0x40]
0x1004788c1: call 0x100316270 ; 0x100316270
0x1004788c6: test rax, rax
0x1004788c9: je 0x1004788fa
0x1004788cb: vmovaps xmm0, xmmword ptr [r15]
0x1004788d0: vmulps xmm0, xmm0, xmm0
0x1004788d4: vmovshdup xmm1, xmm0
0x1004788d8: vaddss xmm1, xmm0, xmm1
0x1004788dc: vpermilpd xmm0, xmm0, 1
0x1004788e2: vaddss xmm0, xmm0, xmm1
0x1004788e6: vsqrtss xmm0, xmm0, xmm0
0x1004788ea: vmulss xmm0, xmm0, dword ptr [rip + 0x631b8a] ; 0x100aaa47c
0x1004788f2: vmovss dword ptr [rax + 0x84], xmm0
0x1004788fa: mov rsi, qword ptr [r14 + 0x70]
0x1004788fe: lea rdi, [rsp + 0x40]
0x100478903: call 0x10076be90 ; 0x10076be90
0x100478908: vmovaps xmm0, xmmword ptr [rbx + 0x10]
0x10047890d: vsubps xmm0, xmm0, xmmword ptr [rsp + 0x40]
0x100478913: vmulps xmm0, xmm0, xmm0
0x100478917: vmovshdup xmm1, xmm0
0x10047891b: vaddss xmm1, xmm0, xmm1
0x10047891f: vpermilpd xmm0, xmm0, 1
0x100478925: vaddss xmm0, xmm0, xmm1
0x100478929: mov rsi, qword ptr [r14 + 0x2f0]
0x100478930: mov rdx, qword ptr [r14 + 0x2b0]
0x100478937: mov rcx, qword ptr [r14 + 0x4d0]
0x10047893e: mov r8, qword ptr [r14 + 0x138]
0x100478945: mov rax, qword ptr [r14 + 0x160]
0x10047894c: vmovss xmm1, dword ptr [rax + 0x24]
0x100478951: vxorps xmm2, xmm2, xmm2
0x100478955: vmovups xmmword ptr [rsp], xmm2
0x10047895a: xor r9d, r9d
0x10047895d: vxorps xmm2, xmm2, xmm2
0x100478961: mov rdi, rbx
0x100478964: call 0x1004771b0 ; 0x1004771b0
0x100478969: mov rax, qword ptr [rip + 0x794f68] ; 0x100c0d8d8
0x100478970: mov rax, qword ptr [rax]
0x100478973: cmp rax, qword ptr [rsp + 0x280]
0x10047897b: jne 0x10047898f
0x10047897d: mov rax, rbx
0x100478980: lea rsp, [rbp - 0x28]
0x100478984: pop rbx
0x100478985: pop r12
0x100478987: pop r13
0x100478989: pop r14
0x10047898b: pop r15
0x10047898d: pop rbp
0x10047898e: ret 
0x10047898f: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100478994: lea rdi, [rip + 0x703bcb] ; 0x100b7c566 mote
0x10047899b: lea rsi, [rip + 0x711a87] ; 0x100b8a429 Mote.cpp
0x1004789a2: mov edx, 0x6a1
0x1004789a7: mov ecx, 3
0x1004789ac: call 0x1007e5f70 ; 0x1007e5f70
0x1004789b1: ud2 
0x1004789b3: nop word ptr cs:[rax + rax]
