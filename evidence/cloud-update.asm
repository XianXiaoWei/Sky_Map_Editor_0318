0x100212510: push rbp
0x100212511: mov rbp, rsp
0x100212514: push r15
0x100212516: push r14
0x100212518: push r13
0x10021251a: push r12
0x10021251c: push rbx
0x10021251d: sub rsp, 0x68
0x100212521: mov r12, r8
0x100212524: mov r15, rcx
0x100212527: mov r14, rsi
0x10021252a: mov rbx, rdi
0x10021252d: mov eax, dword ptr [r15 + 0x24]
0x100212531: mov dword ptr [rbx + 0x40dd0], eax
0x100212537: cmp byte ptr [rbx + 0x40d48], 0
0x10021253e: je 0x10021254c
0x100212540: lea rdi, [rbx + 0x40810]
0x100212547: call 0x1007f6540 ; 0x1007f6540
0x10021254c: cmp byte ptr [rip + 0xa832bd], 0 ; 0x100c95810
0x100212553: je 0x10021265c
0x100212559: cmp dword ptr [rbx + 0x2c0], 0
0x100212560: je 0x10021265c
0x100212566: mov eax, dword ptr [rbx + 0x2a0]
0x10021256c: mov ecx, dword ptr [rbx + 0x2a4]
0x100212572: vcvtsi2sd xmm0, xmm0, eax
0x100212576: vmovsd xmm1, qword ptr [rip + 0x89edea] ; 0x100ab1368
0x10021257e: vmulsd xmm0, xmm0, xmm1
0x100212582: vcvtsd2ss xmm0, xmm0, xmm0
0x100212586: vmovss dword ptr [rbx + 0x270], xmm0
0x10021258e: vcvtsi2sd xmm0, xmm2, ecx
0x100212592: vmulsd xmm0, xmm0, xmm1
0x100212596: vcvtsd2ss xmm0, xmm0, xmm0
0x10021259a: vmovss dword ptr [rbx + 0x274], xmm0
0x1002125a2: mov edx, dword ptr [rbx + 0x2a8]
0x1002125a8: vcvtsi2sd xmm0, xmm2, edx
0x1002125ac: vmulsd xmm0, xmm0, xmm1
0x1002125b0: vcvtsd2ss xmm0, xmm0, xmm0
0x1002125b4: vmovss dword ptr [rbx + 0x278], xmm0
0x1002125bc: add eax, dword ptr [rbx + 0x2ac]
0x1002125c2: vcvtsi2sd xmm0, xmm2, eax
0x1002125c6: vmulsd xmm0, xmm0, xmm1
0x1002125ca: vcvtsd2ss xmm0, xmm0, xmm0
0x1002125ce: vmovss dword ptr [rbx + 0x280], xmm0
0x1002125d6: add ecx, dword ptr [rbx + 0x2b0]
0x1002125dc: vcvtsi2sd xmm0, xmm2, ecx
0x1002125e0: vmulsd xmm0, xmm0, xmm1
0x1002125e4: vcvtsd2ss xmm0, xmm0, xmm0
0x1002125e8: vmovss dword ptr [rbx + 0x284], xmm0
0x1002125f0: add edx, dword ptr [rbx + 0x2b4]
0x1002125f6: vcvtsi2sd xmm0, xmm2, edx
0x1002125fa: vmulsd xmm0, xmm0, xmm1
0x1002125fe: vcvtsd2ss xmm0, xmm0, xmm0
0x100212602: vmovss dword ptr [rbx + 0x288], xmm0
0x10021260a: vmovaps xmm0, xmmword ptr [rbx + 0x280]
0x100212612: vsubps xmm0, xmm0, xmmword ptr [rbx + 0x270]
0x10021261a: vmovaps xmmword ptr [rbx + 0x290], xmm0
0x100212622: lea r13, [rbp - 0x80]
0x100212626: mov rdi, r13
0x100212629: mov rsi, r14
0x10021262c: call 0x10076be90 ; 0x10076be90
0x100212631: lea rdi, [rbp - 0x90]
0x100212638: mov rsi, r12
0x10021263b: mov rdx, r13
0x10021263e: call 0x100328200 ; 0x100328200
0x100212643: lea rax, [rip + 0x1de8a86] ; 0x101ffb0d0
0x10021264a: cmp byte ptr [rax], 0
0x10021264d: je 0x100212675
0x10021264f: lea rax, [rip + 0xaa5eea] ; 0x100cb8540
0x100212656: vmovss xmm0, dword ptr [rax]
0x10021265a: jmp 0x10021267d ; 0x10021267d
0x10021265c: vxorps xmm0, xmm0, xmm0
0x100212660: vmovaps xmmword ptr [rbx + 0x290], xmm0
0x100212668: vmovaps xmmword ptr [rbx + 0x270], xmm0
0x100212670: jmp 0x1002128c7 ; 0x1002128c7
0x100212675: vmovss xmm0, dword ptr [rip + 0x892a43] ; 0x100aa50c0
0x10021267d: vmulss xmm0, xmm0, dword ptr [r15 + 0x20]
0x100212683: vmulss xmm0, xmm0, dword ptr [r15 + 0x14]
0x100212689: vmovss xmm1, dword ptr [rip + 0x89440b] ; 0x100aa6a9c
0x100212691: vmaxss xmm0, xmm1, xmm0
0x100212695: vmovss xmm1, dword ptr [rip + 0x894403] ; 0x100aa6aa0
0x10021269d: vminss xmm0, xmm1, xmm0
0x1002126a1: vmulss xmm0, xmm0, dword ptr [rip + 0xa8317b] ; 0x100c95824
0x1002126a9: vmovaps xmm1, xmmword ptr [rbp - 0x90]
0x1002126b1: vmulps xmm2, xmm1, xmm1
0x1002126b5: vmovshdup xmm3, xmm2
0x1002126b9: vaddss xmm3, xmm2, xmm3
0x1002126bd: vpermilpd xmm2, xmm2, 1
0x1002126c3: vaddss xmm2, xmm2, xmm3
0x1002126c7: vsqrtss xmm2, xmm2, xmm2
0x1002126cb: vmovss xmm3, dword ptr [rip + 0x895109] ; 0x100aa77dc
0x1002126d3: vinsertps xmm2, xmm3, xmm2, 0x1c
0x1002126d9: vaddps xmm1, xmm1, xmm2
0x1002126dd: vpermilps xmm0, xmm0, 0xc0
0x1002126e3: vmulps xmm0, xmm1, xmm0
0x1002126e7: vmovaps xmmword ptr [rbx + 0x40d90], xmm0
0x1002126ef: vaddps xmm0, xmm0, xmmword ptr [rbx + 0x40d80]
0x1002126f7: vmovaps xmmword ptr [rbx + 0x40d80], xmm0
0x1002126ff: lea r15, [rbp - 0x40]
0x100212703: mov rdi, r15
0x100212706: mov rsi, r14
0x100212709: call 0x10076be90 ; 0x10076be90
0x10021270e: lea rdx, [rbp - 0x2c]
0x100212712: lea rcx, [rbp - 0x80]
0x100212716: mov r8d, 1
0x10021271c: mov rdi, rbx
0x10021271f: mov rsi, r15
0x100212722: call 0x1002149c0 ; 0x1002149c0
0x100212727: vmovss xmm0, dword ptr [rbp - 0x2c]
0x10021272c: vxorps xmm1, xmm0, xmmword ptr [rip + 0x8951cc] ; 0x100aa7900
0x100212734: vmovss dword ptr [rbp - 0x2c], xmm1
0x100212739: vmovss xmm1, dword ptr [rip + 0xa830d3] ; 0x100c95814
0x100212741: vmovss xmm2, dword ptr [rip + 0x895e6b] ; 0x100aa85b4
0x100212749: vcmpunordss xmm3, xmm1, xmm1
0x10021274e: vandps xmm4, xmm3, xmm2
0x100212752: vmaxss xmm1, xmm2, xmm1
0x100212756: vandnps xmm1, xmm3, xmm1
0x10021275a: vorps xmm1, xmm1, xmm4
0x10021275e: vaddss xmm0, xmm0, xmm1
0x100212762: vinsertps xmm0, xmm1, xmm0, 0x10
0x100212768: vinsertps xmm0, xmm0, dword ptr [rip + 0xa830aa], 0x20 ; 0x100c9581c
0x100212772: vinsertps xmm0, xmm0, dword ptr [rip + 0xa8309c], 0x30 ; 0x100c95818
0x10021277c: vmovaps xmmword ptr [rbx + 0x40db0], xmm0
0x100212784: cmp byte ptr [rip + 0x1bcf5dd], 0 ; 0x101de1d68
0x10021278b: je 0x1002128c7
0x100212791: lea rax, [rbx + 0x270]
0x100212798: mov qword ptr [rbp - 0x50], rax
0x10021279c: lea rax, [rbx + 0x280]
0x1002127a3: mov qword ptr [rbp - 0x48], rax
0x1002127a7: cmp dword ptr [rbx + 0x2c4], 0
0x1002127ae: vmovsd xmm0, qword ptr [rip + 0x89ebb2] ; 0x100ab1368
0x1002127b6: vmovapd xmm1, xmm0
0x1002127ba: je 0x100212884
0x1002127c0: xor r14d, r14d
0x1002127c3: lea r13, [rbp - 0x40]
0x1002127c7: lea r15, [rbp - 0x70]
0x1002127cb: xor r12d, r12d
0x1002127ce: nop 
0x1002127d0: vblendps xmm2, xmm2, xmmword ptr [rip + 0x89ede6], 7 ; 0x100ab15c0
0x1002127da: vmovaps xmmword ptr [rbp - 0x60], xmm2
0x1002127df: mov rax, qword ptr [rbx + 0x2c8]
0x1002127e6: mov ecx, r14d
0x1002127e9: movsx edx, word ptr [rax + rcx*2]
0x1002127ed: add edx, dword ptr [rbx + 0x2a0]
0x1002127f3: vcvtsi2sd xmm0, xmm5, edx
0x1002127f7: vmulsd xmm0, xmm0, xmm1
0x1002127fb: vcvtsd2ss xmm0, xmm0, xmm0
0x1002127ff: vmovss dword ptr [rbp - 0x40], xmm0
0x100212804: movsx edx, word ptr [rax + rcx*2 + 2]
0x100212809: add edx, dword ptr [rbx + 0x2a4]
0x10021280f: vcvtsi2sd xmm0, xmm5, edx
0x100212813: vmulsd xmm0, xmm0, xmm1
0x100212817: vcvtsd2ss xmm0, xmm0, xmm0
0x10021281b: vmovss dword ptr [rbp - 0x3c], xmm0
0x100212820: movsx eax, word ptr [rax + rcx*2 + 4]
0x100212825: add eax, dword ptr [rbx + 0x2a8]
0x10021282b: vcvtsi2sd xmm0, xmm5, eax
0x10021282f: vmulsd xmm0, xmm0, xmm1
0x100212833: vcvtsd2ss xmm0, xmm0, xmm0
0x100212837: vmovss dword ptr [rbp - 0x38], xmm0
0x10021283c: vaddps xmm0, xmm2, xmmword ptr [rbp - 0x40]
0x100212841: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x100212846: call 0x1002b9810 ; 0x1002b9810
0x10021284b: xor r8d, r8d
0x10021284e: mov rdi, rax
0x100212851: mov rsi, r13
0x100212854: mov rdx, r15
0x100212857: lea rcx, [rip + 0x1e2cdc2] ; 0x10203f620
0x10021285e: call 0x1002bbea0 ; 0x1002bbea0
0x100212863: vmovaps xmm2, xmmword ptr [rbp - 0x60]
0x100212868: vmovsd xmm1, qword ptr [rip + 0x89eaf8] ; 0x100ab1368
0x100212870: inc r12d
0x100212873: add r14d, 3
0x100212877: cmp r12d, dword ptr [rbx + 0x2c4]
0x10021287e: jb 0x1002127d0
0x100212884: call 0x1002b9810 ; 0x1002b9810
0x100212889: lea rcx, [rip + 0x1e2cda0] ; 0x10203f630
0x100212890: xor r8d, r8d
0x100212893: mov rdi, rax
0x100212896: mov rbx, qword ptr [rbp - 0x50]
0x10021289a: mov rsi, rbx
0x10021289d: mov rdx, qword ptr [rbp - 0x48]
0x1002128a1: call 0x1002bbea0 ; 0x1002bbea0
0x1002128a6: call 0x1002b9810 ; 0x1002b9810
0x1002128ab: lea rdx, [rip + 0x1e2cdfe] ; 0x10203f6b0
0x1002128b2: vmovss xmm0, dword ptr [rip + 0x896db6] ; 0x100aa9670
0x1002128ba: xor ecx, ecx
0x1002128bc: mov rdi, rax
0x1002128bf: mov rsi, rbx
0x1002128c2: call 0x1002bb510 ; 0x1002bb510
0x1002128c7: add rsp, 0x68
0x1002128cb: pop rbx
0x1002128cc: pop r12
0x1002128ce: pop r13
0x1002128d0: pop r14
0x1002128d2: pop r15
0x1002128d4: pop rbp
0x1002128d5: ret 
0x1002128d6: nop word ptr cs:[rax + rax]
