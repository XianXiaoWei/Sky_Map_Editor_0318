0x100244030: push rbp
0x100244031: mov rbp, rsp
0x100244034: push r15
0x100244036: push r14
0x100244038: push r13
0x10024403a: push r12
0x10024403c: push rbx
0x10024403d: and rsp, 0xffffffffffffffe0
0x100244041: sub rsp, 0x80
0x100244048: mov qword ptr [rsp + 0x30], rdx
0x10024404d: mov r15, rsi
0x100244050: mov rbx, rdi
0x100244053: cmp dword ptr [rbx + 0x200f8], 0
0x10024405a: je 0x100244083
0x10024405c: xor r14d, r14d
0x10024405f: nop 
0x100244060: mov eax, r14d
0x100244063: imul rax, rax, 0x9a0
0x10024406a: lea rdi, [rbx + rax + 0x20100]
0x100244072: call 0x100544f10 ; 0x100544f10
0x100244077: inc r14d
0x10024407a: cmp r14d, dword ptr [rbx + 0x200f8]
0x100244081: jb 0x100244060
0x100244083: cmp dword ptr [r15 + 0x3070], 0
0x10024408b: je 0x10024438f
0x100244091: xor ecx, ecx
0x100244093: nop word ptr cs:[rax + rax]
0x1002440a0: mov ecx, ecx
0x1002440a2: mov r12, r15
0x1002440a5: imul r15, rcx, 0x9a0
0x1002440ac: lea r13, [rbx + r15 + 0x20100]
0x1002440b4: vxorps ymm0, ymm0, ymm0
0x1002440b8: vmovaps ymmword ptr [rsp + 0x40], ymm0
0x1002440be: mov qword ptr [rsp + 0x38], rcx
0x1002440c3: imul r14, rcx, 0x3b0
0x1002440ca: mov eax, dword ptr [r12 + r14 + 0x3420]
0x1002440d2: imul rax, rax, 0xf0
0x1002440d9: lea rsi, [r12 + rax + 0x28]
0x1002440de: mov rdi, rbx
0x1002440e1: lea rdx, [rsp + 0x40]
0x1002440e6: vzeroupper 
0x1002440e9: call 0x100241e30 ; 0x100241e30
0x1002440ee: mov r9d, dword ptr [r12 + r14 + 0x3090]
0x1002440f6: cmp r9d, -1
0x1002440fa: mov eax, 0xb
0x1002440ff: cmove r9d, eax
0x100244103: test byte ptr [r12 + r14 + 0x3078], 1
0x10024410c: jne 0x100244120
0x10024410e: lea rdx, [r12 + r14 + 0x3078]
0x100244116: inc rdx
0x100244119: jmp 0x100244128 ; 0x100244128
0x10024411b: nop dword ptr [rax + rax]
0x100244120: mov rdx, qword ptr [r12 + r14 + 0x3088]
0x100244128: lea r8, [r12 + r14 + 0x33a0]
0x100244130: mov dword ptr [rsp], 0
0x100244137: mov rdi, r13
0x10024413a: mov rsi, qword ptr [rsp + 0x30]
0x10024413f: lea rcx, [rsp + 0x40]
0x100244144: call 0x100544e20 ; 0x100544e20
0x100244149: cmp byte ptr [rbx + r15 + 0x20a98], 0
0x100244152: je 0x1002443ef
0x100244158: lea rax, [rbx + r15 + 0x207d0]
0x100244160: mov qword ptr [rsp + 0x18], rax
0x100244165: mov r13, r12
0x100244168: cmp dword ptr [r12 + r14 + 0x3094], 0
0x100244171: mov rax, r14
0x100244174: je 0x10024421e
0x10024417a: lea r12, [r13 + rax + 0x3094]
0x100244182: xor r15d, r15d
0x100244185: nop word ptr cs:[rax + rax]
0x100244190: mov r15d, r15d
0x100244193: lea rcx, [r13 + rax]
0x100244198: lea rdx, [r15 + r15*4]
0x10024419c: mov eax, dword ptr [rcx + rdx*8 + 0x30c0]
0x1002441a3: cmp rax, 7
0x1002441a7: jae 0x1002443c7
0x1002441ad: test byte ptr [rcx + rdx*8 + 0x30a0], 1
0x1002441b5: jne 0x1002441d0
0x1002441b7: lea rsi, [rcx + rdx*8 + 0x30a0]
0x1002441bf: inc rsi
0x1002441c2: jmp 0x1002441d8 ; 0x1002441d8
0x1002441c4: nop word ptr cs:[rax + rax]
0x1002441d0: mov rsi, qword ptr [rcx + rdx*8 + 0x30b0]
0x1002441d8: mov ecx, dword ptr [rcx + rdx*8 + 0x30bc]
0x1002441df: imul rcx, rcx, 0xf8
0x1002441e6: cmp dword ptr [rbx + rcx + 0x1b800], 0
0x1002441ee: je 0x1002443a8
0x1002441f4: lea rdx, [rbx + rcx + 0x1b808]
0x1002441fc: mov rcx, qword ptr [rbx + rax*8 + 0x1b6d0]
0x100244204: mov rdi, qword ptr [rsp + 0x18]
0x100244209: call 0x1007be8b0 ; 0x1007be8b0
0x10024420e: inc r15d
0x100244211: cmp r15d, dword ptr [r12]
0x100244215: mov rax, r14
0x100244218: jb 0x100244190
0x10024421e: mov r15, r13
0x100244221: cmp dword ptr [r15 + rax + 0x3098], 0
0x10024422a: je 0x10024434f
0x100244230: lea r13, [r15 + rax + 0x3098]
0x100244238: xor r12d, r12d
0x10024423b: nop dword ptr [rax + rax]
0x100244240: mov r12d, r12d
0x100244243: lea rax, [r15 + rax]
0x100244247: imul rcx, r12, 0x38
0x10024424b: lea rsi, [rcx + rax + 0x31e0]
0x100244253: mov edx, dword ptr [rcx + rax + 0x31f8]
0x10024425a: cmp edx, 2
0x10024425d: je 0x100244270
0x10024425f: test edx, edx
0x100244261: jne 0x1002442a0
0x100244263: test byte ptr [rsi], 1
0x100244266: jne 0x1002442c9
0x100244268: inc rsi
0x10024426b: jmp 0x1002442d1 ; 0x1002442d1
0x10024426d: nop dword ptr [rax]
0x100244270: mov edx, dword ptr [rcx + rax + 0x3200]
0x100244277: imul rdx, rdx, 0xf8
0x10024427e: cmp dword ptr [rbx + rdx + 0x1b800], 0
0x100244286: je 0x1002443a8
0x10024428c: test byte ptr [rsi], 1
0x10024428f: jne 0x1002442ec
0x100244291: inc rsi
0x100244294: jmp 0x1002442f4 ; 0x1002442f4
0x100244296: nop word ptr cs:[rax + rax]
0x1002442a0: mov edx, dword ptr [rcx + rax + 0x3210]
0x1002442a7: test byte ptr [rsi], 1
0x1002442aa: jne 0x100244314
0x1002442ac: inc rsi
0x1002442af: cmp edx, 4
0x1002442b2: je 0x100244321
0x1002442b4: vmovss xmm0, dword ptr [rcx + rax + 0x3200]
0x1002442bd: mov rdi, qword ptr [rsp + 0x18]
0x1002442c2: call 0x1007be530 ; 0x1007be530
0x1002442c7: jmp 0x10024433f ; 0x10024433f
0x1002442c9: mov rsi, qword ptr [rcx + rax + 0x31f0]
0x1002442d1: mov rdx, qword ptr [rcx + rax + 0x3200]
0x1002442d9: mov ecx, dword ptr [rcx + rax + 0x3210]
0x1002442e0: mov rdi, qword ptr [rsp + 0x18]
0x1002442e5: call 0x1007be7f0 ; 0x1007be7f0
0x1002442ea: jmp 0x10024433f ; 0x10024433f
0x1002442ec: mov rsi, qword ptr [rcx + rax + 0x31f0]
0x1002442f4: mov eax, dword ptr [rbx + rdx + 0x1b818]
0x1002442fb: mov ecx, dword ptr [rbx + rdx + 0x1b81c]
0x100244302: vcvtsi2ss xmm0, xmm2, rax
0x100244307: vcvtsi2ss xmm1, xmm2, rcx
0x10024430c: vinsertps xmm0, xmm0, xmm1, 0x1c
0x100244312: jmp 0x10024432a ; 0x10024432a
0x100244314: mov rsi, qword ptr [rcx + rax + 0x31f0]
0x10024431c: cmp edx, 4
0x10024431f: jne 0x1002442b4
0x100244321: vmovups xmm0, xmmword ptr [rcx + rax + 0x3200]
0x10024432a: vmovaps xmmword ptr [rsp + 0x20], xmm0
0x100244330: mov rdi, qword ptr [rsp + 0x18]
0x100244335: lea rdx, [rsp + 0x20]
0x10024433a: call 0x1007be690 ; 0x1007be690
0x10024433f: inc r12d
0x100244342: cmp r12d, dword ptr [r13]
0x100244346: mov rax, r14
0x100244349: jb 0x100244240
0x10024434f: mov rcx, qword ptr [rsp + 0x38]
0x100244354: inc ecx
0x100244356: mov eax, dword ptr [r15 + 0x3070]
0x10024435d: cmp ecx, eax
0x10024435f: jb 0x1002440a0
0x100244365: mov dword ptr [rbx + 0x200f8], eax
0x10024436b: cmp eax, 0x29
0x10024436e: jb 0x100244399
0x100244370: lea rdi, [rip + 0x937a17] ; 0x100b7bd8e m_quadCount <= kMaxQuads
0x100244377: lea rsi, [rip + 0x9371da] ; 0x100b7b558 Compositor.cpp
0x10024437e: mov edx, 0x5a6
0x100244383: mov ecx, 3
0x100244388: call 0x1007e5f70 ; 0x1007e5f70
0x10024438d: ud2 
0x10024438f: mov dword ptr [rbx + 0x200f8], 0
0x100244399: lea rsp, [rbp - 0x28]
0x10024439d: pop rbx
0x10024439e: pop r12
0x1002443a0: pop r13
0x1002443a2: pop r14
0x1002443a4: pop r15
0x1002443a6: pop rbp
0x1002443a7: ret 
0x1002443a8: lea rdi, [rip + 0x937bdd] ; 0x100b7bf8c i < m_texCount
0x1002443af: lea rsi, [rip + 0x937be5] ; 0x100b7bf9b ./Compositor.h
0x1002443b6: mov edx, 0x3d
0x1002443bb: mov ecx, 3
0x1002443c0: call 0x1007e5f70 ; 0x1007e5f70
0x1002443c5: ud2 
0x1002443c7: lea rdi, [rip + 0x937975] ; 0x100b7bd43 (uint32_t)tex.samplerIdx < Sampler_MAX
0x1002443ce: lea rsi, [rip + 0x937183] ; 0x100b7b558 Compositor.cpp
0x1002443d5: lea r8, [rip + 0x93798e] ; 0x100b7bd6a Invalid sampler assigned to texture
0x1002443dc: mov edx, 0x591
0x1002443e1: mov ecx, 4
0x1002443e6: xor eax, eax
0x1002443e8: call 0x1007e6030 ; 0x1007e6030
0x1002443ed: ud2 
0x1002443ef: lea rdi, [rip + 0x9328f4] ; 0x100b76cea IsInitialized()
0x1002443f6: lea rsi, [rip + 0x91de7e] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1002443fd: mov edx, 0xa8
0x100244402: mov ecx, 3
0x100244407: call 0x1007e5f70 ; 0x1007e5f70
0x10024440c: ud2 
0x10024440e: nop 
