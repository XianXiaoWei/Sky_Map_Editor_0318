0x10025b5d0: push rbp
0x10025b5d1: mov rbp, rsp
0x10025b5d4: push r15
0x10025b5d6: push r14
0x10025b5d8: push rbx
0x10025b5d9: sub rsp, 0x68
0x10025b5dd: mov r14, rdx
0x10025b5e0: mov rbx, rdi
0x10025b5e3: vmovaps xmm2, xmmword ptr [rbx + 0x90]
0x10025b5eb: vmovaps xmm1, xmmword ptr [rbx + 0xa0]
0x10025b5f3: vmovaps xmm0, xmmword ptr [rbx + 0xb0]
0x10025b5fb: vmovaps xmm3, xmmword ptr [rbx + 0xc0]
0x10025b603: vmovaps xmmword ptr [rbx + 0x10], xmm3
0x10025b608: vmovaps xmmword ptr [rbx + 0x20], xmm2
0x10025b60d: vmovaps xmmword ptr [rbx + 0x30], xmm1
0x10025b612: vmovaps xmmword ptr [rbx + 0x40], xmm0
0x10025b617: vmulps xmm3, xmm2, xmm2
0x10025b61b: vmovshdup xmm4, xmm3
0x10025b61f: vaddss xmm4, xmm3, xmm4
0x10025b623: vpermilpd xmm3, xmm3, 1
0x10025b629: vaddss xmm3, xmm3, xmm4
0x10025b62d: vsqrtss xmm3, xmm3, xmm3
0x10025b631: vucomiss xmm3, dword ptr [rip + 0x84c28b] ; 0x100aa78c4
0x10025b639: jbe 0x10025b645
0x10025b63b: vpermilps xmm3, xmm3, 0xc0
0x10025b641: vdivps xmm2, xmm2, xmm3
0x10025b645: vmovaps xmmword ptr [rbx + 0x20], xmm2
0x10025b64a: vmulps xmm2, xmm1, xmm1
0x10025b64e: vmovshdup xmm3, xmm2
0x10025b652: vaddss xmm3, xmm2, xmm3
0x10025b656: vpermilpd xmm2, xmm2, 1
0x10025b65c: vaddss xmm2, xmm2, xmm3
0x10025b660: vsqrtss xmm2, xmm2, xmm2
0x10025b664: vucomiss xmm2, dword ptr [rip + 0x84c258] ; 0x100aa78c4
0x10025b66c: jbe 0x10025b678
0x10025b66e: vpermilps xmm2, xmm2, 0xc0
0x10025b674: vdivps xmm1, xmm1, xmm2
0x10025b678: vmovaps xmmword ptr [rbx + 0x30], xmm1
0x10025b67d: vmulps xmm1, xmm0, xmm0
0x10025b681: vmovshdup xmm2, xmm1
0x10025b685: vaddss xmm2, xmm1, xmm2
0x10025b689: vpermilpd xmm1, xmm1, 1
0x10025b68f: vaddss xmm1, xmm1, xmm2
0x10025b693: vsqrtss xmm1, xmm1, xmm1
0x10025b697: vucomiss xmm1, dword ptr [rip + 0x84c225] ; 0x100aa78c4
0x10025b69f: vmovaps xmm2, xmm0
0x10025b6a3: jbe 0x10025b6af
0x10025b6a5: vpermilps xmm2, xmm1, 0xc0
0x10025b6ab: vdivps xmm2, xmm0, xmm2
0x10025b6af: vucomiss xmm1, dword ptr [rip + 0x84c20d] ; 0x100aa78c4
0x10025b6b7: vmovaps xmmword ptr [rbx + 0x40], xmm2
0x10025b6bc: vxorps xmm2, xmm2, xmm2
0x10025b6c0: vmovaps xmmword ptr [rbx + 0x50], xmm2
0x10025b6c5: mov r15, qword ptr [rbx + 0x80]
0x10025b6cc: mov eax, dword ptr [r15 + 0x10]
0x10025b6d0: mov dword ptr [rbx + 0x60], eax
0x10025b6d3: mov eax, dword ptr [r15 + 0x18]
0x10025b6d7: mov dword ptr [rbx + 0x64], eax
0x10025b6da: mov dword ptr [rbx + 0x68], 0x3f800000
0x10025b6e1: mov dword ptr [rbx + 0x4b0], 0xbf800000
0x10025b6eb: vxorps xmm0, xmm0, xmmword ptr [rip + 0x84c20d] ; 0x100aa7900
0x10025b6f3: jbe 0x10025b6ff
0x10025b6f5: vpermilps xmm1, xmm1, 0xc0
0x10025b6fb: vdivps xmm0, xmm0, xmm1
0x10025b6ff: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x10025b704: vpermilpd xmm1, xmm0, 1
0x10025b70a: call 0x100aa25a0 ; 0x100aa25a0 _atan2f
0x10025b70f: vmovss dword ptr [rbx + 0xd0], xmm0
0x10025b717: vmovshdup xmm0, xmmword ptr [rbp - 0x30]
0x10025b71c: call 0x100aa2588 ; 0x100aa2588 _asinf
0x10025b721: vmovss dword ptr [rbx + 0xd4], xmm0
0x10025b729: mov rdi, qword ptr [r14 + 0x5a8]
0x10025b730: mov rax, qword ptr [r15 + 8]
0x10025b734: mov rsi, qword ptr [rax + 0x228]
0x10025b73b: call 0x10046ccc0 ; 0x10046ccc0
0x10025b740: mov qword ptr [rbx + 0x4e0], rax
0x10025b747: test rax, rax
0x10025b74a: je 0x10025bb22
0x10025b750: vmovaps xmm0, xmmword ptr [rip + 0x84f168] ; 0x100aaa8c0
0x10025b758: vmovaps xmmword ptr [rbx + 0x4f0], xmm0
0x10025b760: mov rax, qword ptr [rbx + 0x80]
0x10025b767: mov rsi, qword ptr [rax + 8]
0x10025b76b: mov rax, qword ptr [rsi]
0x10025b76e: lea r15, [rbp - 0x70]
0x10025b772: mov rdi, r15
0x10025b775: call qword ptr [rax + 0x18]
0x10025b778: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x10025b77d: vmulps xmm0, xmm0, xmm0
0x10025b781: vmovshdup xmm1, xmm0
0x10025b785: vaddss xmm1, xmm0, xmm1
0x10025b789: vpermilpd xmm0, xmm0, 1
0x10025b78f: vaddss xmm0, xmm0, xmm1
0x10025b793: vsqrtss xmm0, xmm0, xmm0
0x10025b797: vmovss dword ptr [rbx + 0x4f0], xmm0
0x10025b79f: mov rax, qword ptr [rbx + 0x80]
0x10025b7a6: mov rsi, qword ptr [rax + 8]
0x10025b7aa: mov rax, qword ptr [rsi]
0x10025b7ad: mov rdi, r15
0x10025b7b0: call qword ptr [rax + 0x18]
0x10025b7b3: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x10025b7b8: vmulps xmm0, xmm0, xmm0
0x10025b7bc: vmovshdup xmm1, xmm0
0x10025b7c0: vaddss xmm1, xmm0, xmm1
0x10025b7c4: vpermilpd xmm0, xmm0, 1
0x10025b7ca: vaddss xmm0, xmm0, xmm1
0x10025b7ce: vsqrtss xmm0, xmm0, xmm0
0x10025b7d2: vmovss dword ptr [rbx + 0x4f4], xmm0
0x10025b7da: mov rax, qword ptr [rbx + 0x80]
0x10025b7e1: mov rsi, qword ptr [rax + 8]
0x10025b7e5: mov rax, qword ptr [rsi]
0x10025b7e8: mov rdi, r15
0x10025b7eb: call qword ptr [rax + 0x18]
0x10025b7ee: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x10025b7f3: vmulps xmm0, xmm0, xmm0
0x10025b7f7: vmovshdup xmm1, xmm0
0x10025b7fb: vaddss xmm1, xmm0, xmm1
0x10025b7ff: vpermilpd xmm0, xmm0, 1
0x10025b805: vaddss xmm0, xmm0, xmm1
0x10025b809: vsqrtss xmm0, xmm0, xmm0
0x10025b80d: vmovss dword ptr [rbx + 0x4f8], xmm0
0x10025b815: mov rax, qword ptr [rbx + 0x4e0]
0x10025b81c: mov rdi, qword ptr [rax + 0x68]
0x10025b820: test rdi, rdi
0x10025b823: je 0x10025b83f
0x10025b825: lea rsi, [rip + 0x90f6e4] ; 0x100b6af10 CrabIdle
0x10025b82c: vmovss xmm0, dword ptr [rip + 0x84988c] ; 0x100aa50c0
0x10025b834: xor edx, edx
0x10025b836: vmovaps xmm1, xmm0
0x10025b83a: call 0x1000967b0 ; 0x1000967b0
0x10025b83f: mov dword ptr [rbx + 0xe0], 0
0x10025b849: mov eax, dword ptr [rip + 0xacfb61] ; 0x100d2b3b0
0x10025b84f: mov dword ptr [rbx + 0x500], eax
0x10025b855: mov byte ptr [rbx + 0x504], 0
0x10025b85c: mov rax, qword ptr [r14 + 0x178]
0x10025b863: mov rcx, qword ptr [rax + 0x38]
0x10025b867: mov qword ptr [rbx + 0x508], rcx
0x10025b86e: mov byte ptr [rbx + 0x594], 0xff
0x10025b875: mov dword ptr [rbx + 0x590], 0x4e6e6b28
0x10025b87f: mov rax, qword ptr [rax + 0x40]
0x10025b883: mov eax, dword ptr [rax + 0x820]
0x10025b889: mov dword ptr [rbx + 0x598], eax
0x10025b88f: mov byte ptr [rbx + 0x59c], 0
0x10025b896: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10025b89b: vcvtsi2ss xmm0, xmm5, eax
0x10025b89f: vmulss xmm0, xmm0, dword ptr [rip + 0x84b849] ; 0x100aa70f0
0x10025b8a7: vmovss xmm1, dword ptr [rip + 0x849811] ; 0x100aa50c0
0x10025b8af: vsubss xmm1, xmm1, xmm0
0x10025b8b3: vxorps xmm2, xmm2, xmm2
0x10025b8b7: vmulss xmm1, xmm1, xmm2
0x10025b8bb: vaddss xmm0, xmm0, xmm1
0x10025b8bf: vmovss dword ptr [rbx + 0xdc], xmm0
0x10025b8c7: mov rcx, qword ptr [r14 + 0x370]
0x10025b8ce: mov eax, dword ptr [rcx + 0x410]
0x10025b8d4: cmp rax, 0x80
0x10025b8da: jae 0x10025bb41
0x10025b8e0: mov byte ptr [rbx + 0x594], al
0x10025b8e6: lea edx, [rax + 1]
0x10025b8e9: mov dword ptr [rcx + 0x410], edx
0x10025b8ef: mov qword ptr [rcx + rax*8 + 0x10], rbx
0x10025b8f4: mov rcx, qword ptr [rbx + 0x80]
0x10025b8fb: lea rdi, [rbx + 0xf0]
0x10025b902: mov qword ptr [rbx + 0xf8], rcx
0x10025b909: movzx eax, al
0x10025b90c: imul edx, eax, 0xec4bab
0x10025b912: mov rsi, rbx
0x10025b915: mov rcx, r14
0x10025b918: call 0x1002585e0 ; 0x1002585e0
0x10025b91d: mov qword ptr [rbx + 0x4d0], 0
0x10025b928: mov r15, qword ptr [r14 + 0x488]
0x10025b92f: call 0x1004e6e60 ; 0x1004e6e60
0x10025b934: mov rdi, r15
0x10025b937: mov rsi, rax
0x10025b93a: call 0x100039f40 ; 0x100039f40
0x10025b93f: mov qword ptr [rbx + 0x4d8], rax
0x10025b946: mov dword ptr [rax + 0x28], 0
0x10025b94d: mov rdi, qword ptr [r14 + 0x200]
0x10025b954: mov esi, 1
0x10025b959: call 0x10022c000 ; 0x10022c000
0x10025b95e: mov r15, rax
0x10025b961: mov rax, qword ptr [rbx + 0x4d8]
0x10025b968: mov qword ptr [rax + 0x38], r15
0x10025b96c: mov rdi, qword ptr [r14 + 0x300]
0x10025b973: xor esi, esi
0x10025b975: call 0x10043d6a0 ; 0x10043d6a0
0x10025b97a: cmp dword ptr [r15 + 0x10], 0
0x10025b97f: je 0x10025bb60
0x10025b985: lea rcx, [rax + 8]
0x10025b989: test rax, rax
0x10025b98c: cmove rcx, rax
0x10025b990: mov rax, qword ptr [r15 + 8]
0x10025b994: mov qword ptr [rax], rcx
0x10025b997: mov rax, qword ptr [rbx + 0x4d8]
0x10025b99e: mov rax, qword ptr [rax + 0x38]
0x10025b9a2: cmp dword ptr [rax + 0x10], 0
0x10025b9a6: je 0x10025bb7f
0x10025b9ac: mov rax, qword ptr [rax + 8]
0x10025b9b0: mov rax, qword ptr [rax]
0x10025b9b3: mov qword ptr [rbp - 0x20], rax
0x10025b9b7: call 0x1007abc10 ; 0x1007abc10
0x10025b9bc: mov r14, rax
0x10025b9bf: mov qword ptr [rbp - 0x70], 0
0x10025b9c7: call 0x10043ccc0 ; 0x10043ccc0
0x10025b9cc: mov r8, qword ptr [rax]
0x10025b9cf: lea rsi, [rbp - 0x70]
0x10025b9d3: lea rdx, [rbp - 0x20]
0x10025b9d7: mov rdi, rax
0x10025b9da: mov rcx, r14
0x10025b9dd: call qword ptr [r8 + 0x40]
0x10025b9e1: mov rax, qword ptr [rbp - 0x70]
0x10025b9e5: test rax, rax
0x10025b9e8: je 0x10025bb9e
0x10025b9ee: mov byte ptr [rax + 0x40], 0
0x10025b9f2: mov rax, qword ptr [rbx + 0x4d8]
0x10025b9f9: lea rdi, [rax + 0x48]
0x10025b9fd: test byte ptr [rax + 0x48], 1
0x10025ba01: jne 0x10025ba09
0x10025ba03: lea rcx, [rdi + 1]
0x10025ba07: jmp 0x10025ba4b ; 0x10025ba4b
0x10025ba09: mov r8, qword ptr [rdi]
0x10025ba0c: and r8, 0xfffffffffffffffe
0x10025ba10: lea rsi, [r8 - 1]
0x10025ba14: cmp rsi, 6
0x10025ba18: jae 0x10025ba47
0x10025ba1a: mov rcx, qword ptr [rax + 0x50]
0x10025ba1e: mov edx, 7
0x10025ba23: sub rdx, r8
0x10025ba26: lea rax, [rip + 0x90bdcd] ; 0x100b677fa GoSit2
0x10025ba2d: mov qword ptr [rsp + 8], rax
0x10025ba32: mov qword ptr [rsp], 6
0x10025ba3a: xor r8d, r8d
0x10025ba3d: mov r9, rcx
0x10025ba40: call 0x1000198c0 ; 0x1000198c0
0x10025ba45: jmp 0x10025ba6d ; 0x10025ba6d
0x10025ba47: mov rcx, qword ptr [rax + 0x58]
0x10025ba4b: mov word ptr [rcx + 4], 0x3274
0x10025ba51: mov dword ptr [rcx], 0x69536f47
0x10025ba57: mov byte ptr [rcx + 6], 0
0x10025ba5b: test byte ptr [rdi], 1
0x10025ba5e: jne 0x10025ba65
0x10025ba60: mov byte ptr [rdi], 0xc
0x10025ba63: jmp 0x10025ba6d ; 0x10025ba6d
0x10025ba65: mov qword ptr [rax + 0x50], 6
0x10025ba6d: mov rax, qword ptr [rbx + 0x4d8]
0x10025ba74: mov dword ptr [rax + 0xc0], 0x3f800000
0x10025ba7e: mov qword ptr [rax + 0x40], 0
0x10025ba86: lea rdi, [rax + 0x78]
0x10025ba8a: test byte ptr [rax + 0x78], 1
0x10025ba8e: jne 0x10025ba96
0x10025ba90: lea rcx, [rdi + 1]
0x10025ba94: jmp 0x10025bade ; 0x10025bade
0x10025ba96: mov r8, qword ptr [rdi]
0x10025ba99: and r8, 0xfffffffffffffffe
0x10025ba9d: lea rsi, [r8 - 1]
0x10025baa1: cmp rsi, 5
0x10025baa5: jae 0x10025bad7
0x10025baa7: mov rcx, qword ptr [rax + 0x80]
0x10025baae: mov edx, 6
0x10025bab3: sub rdx, r8
0x10025bab6: lea rax, [rip + 0x920b0f] ; 0x100b7c5cc UISit
0x10025babd: mov qword ptr [rsp + 8], rax
0x10025bac2: mov qword ptr [rsp], 5
0x10025baca: xor r8d, r8d
0x10025bacd: mov r9, rcx
0x10025bad0: call 0x1000198c0 ; 0x1000198c0
0x10025bad5: jmp 0x10025baff ; 0x10025baff
0x10025bad7: mov rcx, qword ptr [rax + 0x88]
0x10025bade: mov dword ptr [rcx], 0x69534955
0x10025bae4: mov word ptr [rcx + 4], 0x74
0x10025baea: test byte ptr [rdi], 1
0x10025baed: jne 0x10025baf4
0x10025baef: mov byte ptr [rdi], 0xa
0x10025baf2: jmp 0x10025baff ; 0x10025baff
0x10025baf4: mov qword ptr [rax + 0x80], 5
0x10025baff: mov rdi, qword ptr [rbx + 0x4d8]
0x10025bb06: call 0x10032e2f0 ; 0x10032e2f0
0x10025bb0b: vxorps xmm0, xmm0, xmm0
0x10025bb0f: vmovaps xmmword ptr [rbx + 0x5a0], xmm0
0x10025bb17: add rsp, 0x68
0x10025bb1b: pop rbx
0x10025bb1c: pop r14
0x10025bb1e: pop r15
0x10025bb20: pop rbp
0x10025bb21: ret 
0x10025bb22: lea rdi, [rip + 0x91c152] ; 0x100b77c7b m_model
0x10025bb29: lea rsi, [rip + 0x920a93] ; 0x100b7c5c3 Crab.cpp
0x10025bb30: mov edx, 0x287
0x10025bb35: mov ecx, 3
0x10025bb3a: call 0x1007e5f70 ; 0x1007e5f70
0x10025bb3f: ud2 
0x10025bb41: lea rdi, [rip + 0x920ac9] ; 0x100b7c611 m_numCrabs < kMaxCrabs
0x10025bb48: lea rsi, [rip + 0x920a74] ; 0x100b7c5c3 Crab.cpp
0x10025bb4f: mov edx, 0x5c7
0x10025bb54: mov ecx, 3
0x10025bb59: call 0x1007e5f70 ; 0x1007e5f70
0x10025bb5e: ud2 
0x10025bb60: lea rdi, [rip + 0x905df1] ; 0x100b61958 idx < size
0x10025bb67: lea rsi, [rip + 0x905df5] ; 0x100b61963 ./Clump.h
0x10025bb6e: mov edx, 0x30
0x10025bb73: mov ecx, 3
0x10025bb78: call 0x1007e5f70 ; 0x1007e5f70
0x10025bb7d: ud2 
0x10025bb7f: lea rdi, [rip + 0x905dd2] ; 0x100b61958 idx < size
0x10025bb86: lea rsi, [rip + 0x905dd6] ; 0x100b61963 ./Clump.h
0x10025bb8d: mov edx, 0x36
0x10025bb92: mov ecx, 3
0x10025bb97: call 0x1007e5f70 ; 0x1007e5f70
0x10025bb9c: ud2 
0x10025bb9e: lea rdi, [rip + 0x905f53] ; 0x100b61af8 ret
0x10025bba5: lea rsi, [rip + 0x905db7] ; 0x100b61963 ./Clump.h
0x10025bbac: mov edx, 0x47
0x10025bbb1: mov ecx, 3
0x10025bbb6: call 0x1007e5f70 ; 0x1007e5f70
0x10025bbbb: ud2 
0x10025bbbd: nop dword ptr [rax]
