0x1006a57c0: push rbp
0x1006a57c1: mov rbp, rsp
0x1006a57c4: push r15
0x1006a57c6: push r14
0x1006a57c8: push r13
0x1006a57ca: push r12
0x1006a57cc: push rbx
0x1006a57cd: and rsp, 0xffffffffffffffe0
0x1006a57d1: sub rsp, 0x140
0x1006a57d8: mov r13, rsi
0x1006a57db: mov r12, rdi
0x1006a57de: mov rax, qword ptr [rip + 0x5680f3] ; 0x100c0d8d8
0x1006a57e5: mov rax, qword ptr [rax]
0x1006a57e8: mov qword ptr [rsp + 0x120], rax
0x1006a57f0: cmp byte ptr [rip + 0x198de61], 0 ; 0x102033658
0x1006a57f7: je 0x1006a5e6c
0x1006a57fd: call 0x1002acd30 ; 0x1002acd30
0x1006a5802: test rax, rax
0x1006a5805: je 0x1006a5e6c
0x1006a580b: vxorps xmm0, xmm0, xmm0
0x1006a580f: vmovaps xmmword ptr [rsp + 0x100], xmm0
0x1006a5818: mov dword ptr [rsp + 0x110], 0
0x1006a5823: vxorps ymm0, ymm0, ymm0
0x1006a5827: vmovups ymmword ptr [rsp + 0xdc], ymm0
0x1006a5830: vmovaps ymmword ptr [rsp + 0xc0], ymm0
0x1006a5839: mov r8d, dword ptr [r12 + 0xe6c78]
0x1006a5841: test r8, r8
0x1006a5844: je 0x1006a596c
0x1006a584a: xor r9d, r9d
0x1006a584d: nop dword ptr [rax]
0x1006a5850: mov r10, qword ptr [r12 + r9*8 + 0xe6c80]
0x1006a5858: mov r11d, dword ptr [r10 + 0x1d8]
0x1006a585f: test r11, r11
0x1006a5862: je 0x1006a58f2
0x1006a5868: mov r14, qword ptr [r10 + 0x1a8]
0x1006a586f: mov ebx, 0x14
0x1006a5874: xor eax, eax
0x1006a5876: nop word ptr cs:[rax + rax]
0x1006a5880: movsx rdx, word ptr [r14 + rax*2]
0x1006a5885: test rdx, rdx
0x1006a5888: js 0x1006a58e3
0x1006a588a: inc dword ptr [rsp + rdx*4 + 0x100]
0x1006a5891: mov rcx, qword ptr [r10 + 0x1c8]
0x1006a5898: test rcx, rcx
0x1006a589b: je 0x1006a58e3
0x1006a589d: mov ecx, dword ptr [rcx + rbx*2]
0x1006a58a0: lea rdx, [rdx + rdx*2]
0x1006a58a4: lea rsi, [rsp + rdx*4 + 0xc0]
0x1006a58ac: mov edi, dword ptr [rsp + rdx*4 + 0xc0]
0x1006a58b3: test edi, edi
0x1006a58b5: jne 0x1006a58c2
0x1006a58b7: mov dword ptr [rsi], 0xffffffff
0x1006a58bd: mov edi, 0xffffffff
0x1006a58c2: cmp ecx, edi
0x1006a58c4: cmovb edi, ecx
0x1006a58c7: mov dword ptr [rsi], edi
0x1006a58c9: mov esi, dword ptr [rsp + rdx*4 + 0xc4]
0x1006a58d0: cmp esi, ecx
0x1006a58d2: cmovb esi, ecx
0x1006a58d5: mov dword ptr [rsp + rdx*4 + 0xc4], esi
0x1006a58dc: add dword ptr [rsp + rdx*4 + 0xc8], ecx
0x1006a58e3: inc rax
0x1006a58e6: add rbx, 0x1f0
0x1006a58ed: cmp rax, r11
0x1006a58f0: jb 0x1006a5880
0x1006a58f2: inc r9
0x1006a58f5: cmp r9, r8
0x1006a58f8: jb 0x1006a5850
0x1006a58fe: mov eax, dword ptr [rsp + 0x100]
0x1006a5905: mov qword ptr [rsp + 0x20], rax
0x1006a590a: mov eax, dword ptr [rsp + 0x104]
0x1006a5911: mov qword ptr [rsp + 0x18], rax
0x1006a5916: mov edi, dword ptr [rsp + 0xc0]
0x1006a591d: mov ebx, dword ptr [rsp + 0xc4]
0x1006a5924: mov eax, dword ptr [rsp + 0xc8]
0x1006a592b: mov dword ptr [rsp + 0xc], eax
0x1006a592f: mov esi, dword ptr [rsp + 0xcc]
0x1006a5936: mov edx, dword ptr [rsp + 0xd0]
0x1006a593d: mov r15d, dword ptr [rsp + 0xd4]
0x1006a5945: mov eax, dword ptr [rsp + 0x108]
0x1006a594c: mov dword ptr [rsp + 0x10], eax
0x1006a5950: mov ecx, dword ptr [rsp + 0xd8]
0x1006a5957: mov r8d, dword ptr [rsp + 0xdc]
0x1006a595f: mov eax, dword ptr [rsp + 0xe0]
0x1006a5966: mov dword ptr [rsp + 8], eax
0x1006a596a: jmp 0x1006a59a2 ; 0x1006a59a2
0x1006a596c: mov dword ptr [rsp + 8], 0
0x1006a5974: xor r8d, r8d
0x1006a5977: xor ecx, ecx
0x1006a5979: mov dword ptr [rsp + 0x10], 0
0x1006a5981: xor r15d, r15d
0x1006a5984: xor edx, edx
0x1006a5986: xor esi, esi
0x1006a5988: xor eax, eax
0x1006a598a: mov qword ptr [rsp + 0x18], rax
0x1006a598f: mov dword ptr [rsp + 0xc], 0
0x1006a5997: xor ebx, ebx
0x1006a5999: xor edi, edi
0x1006a599b: xor eax, eax
0x1006a599d: mov qword ptr [rsp + 0x20], rax
0x1006a59a2: cmp esi, edi
0x1006a59a4: cmovb edi, esi
0x1006a59a7: cmp ebx, edx
0x1006a59a9: cmovb ebx, edx
0x1006a59ac: cmp ecx, edi
0x1006a59ae: cmovb edi, ecx
0x1006a59b1: mov dword ptr [rsp + 0x2c], edi
0x1006a59b5: cmp ebx, r8d
0x1006a59b8: cmovb ebx, r8d
0x1006a59bc: mov dword ptr [rsp + 0x28], ebx
0x1006a59c0: vmovaps xmm0, xmmword ptr [rip + 0x431608] ; 0x100ad6fd0
0x1006a59c8: vmovaps xmmword ptr [rsp + 0x30], xmm0
0x1006a59ce: lea rdi, [rsp + 0x40]
0x1006a59d3: lea rsi, [rsp + 0x30]
0x1006a59d8: vmovss xmm0, dword ptr [rip + 0x402bd8] ; 0x100aa85b8
0x1006a59e0: vzeroupper 
0x1006a59e3: call 0x10077d310 ; 0x10077d310
0x1006a59e8: vmovdqa xmm0, xmmword ptr [rsp + 0x40]
0x1006a59ee: vmovdqa xmmword ptr [rsp + 0x30], xmm0
0x1006a59f4: call 0x1002acd30 ; 0x1002acd30
0x1006a59f9: mov rdi, rax
0x1006a59fc: call 0x1002b22c0 ; 0x1002b22c0
0x1006a5a01: lea rdx, [rip + 0x4f41b4] ; 0x100b99bbc
0x1006a5a08: mov dword ptr [rsp + 0x14], 0
0x1006a5a10: lea rbx, [rsp + 0x40]
0x1006a5a15: mov esi, 0x80
0x1006a5a1a: xor eax, eax
0x1006a5a1c: mov rdi, rbx
0x1006a5a1f: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x1006a5a24: call 0x1002acd30 ; 0x1002acd30
0x1006a5a29: lea rdx, [rsp + 0x30]
0x1006a5a2e: mov rdi, rax
0x1006a5a31: mov rsi, rbx
0x1006a5a34: call 0x1002b21b0 ; 0x1002b21b0
0x1006a5a39: mov r9d, dword ptr [r12 + 0xe6c78]
0x1006a5a41: mov r8d, 0
0x1006a5a47: mov ecx, 0
0x1006a5a4c: test r9, r9
0x1006a5a4f: je 0x1006a5b78
0x1006a5a55: xor ecx, ecx
0x1006a5a57: vmovdqa xmm8, xmmword ptr [rip + 0x431581] ; 0x100ad6fe0
0x1006a5a5f: vpcmpeqd xmm9, xmm9, xmm9
0x1006a5a64: xor r8d, r8d
0x1006a5a67: nop word ptr [rax + rax]
0x1006a5a70: mov rax, qword ptr [r12 + rcx*8 + 0xe6c80]
0x1006a5a78: mov edx, dword ptr [rax + 0x1d8]
0x1006a5a7e: test rdx, rdx
0x1006a5a81: je 0x1006a5b69
0x1006a5a87: mov rsi, qword ptr [rax + 0x1a8]
0x1006a5a8e: cmp edx, 0xf
0x1006a5a91: ja 0x1006a5aa0
0x1006a5a93: xor edi, edi
0x1006a5a95: jmp 0x1006a5b50 ; 0x1006a5b50
0x1006a5a9a: nop word ptr [rax + rax]
0x1006a5aa0: mov r10d, edx
0x1006a5aa3: and r10d, 0xf
0x1006a5aa7: mov rdi, rdx
0x1006a5aaa: sub rdi, r10
0x1006a5aad: vmovd xmm2, r8d
0x1006a5ab2: lea rax, [rsi + 0x18]
0x1006a5ab6: vpxor xmm3, xmm3, xmm3
0x1006a5aba: mov rbx, rdi
0x1006a5abd: vpxor xmm4, xmm4, xmm4
0x1006a5ac1: vpxor xmm5, xmm5, xmm5
0x1006a5ac5: nop word ptr cs:[rax + rax]
0x1006a5ad0: vpmovzxwd xmm6, qword ptr [rax - 0x18]
0x1006a5ad6: vpmovzxwd xmm7, qword ptr [rax - 0x10]
0x1006a5adc: vpmovzxwd xmm0, qword ptr [rax - 8]
0x1006a5ae2: vpmovzxwd xmm1, qword ptr [rax]
0x1006a5ae7: vpcmpeqd xmm6, xmm6, xmm8
0x1006a5aec: vpxor xmm6, xmm6, xmm9
0x1006a5af1: vpsubd xmm2, xmm2, xmm6
0x1006a5af5: vpcmpeqd xmm6, xmm7, xmm8
0x1006a5afa: vpxor xmm6, xmm6, xmm9
0x1006a5aff: vpsubd xmm3, xmm3, xmm6
0x1006a5b03: vpcmpeqd xmm0, xmm0, xmm8
0x1006a5b08: vpxor xmm0, xmm0, xmm9
0x1006a5b0d: vpsubd xmm4, xmm4, xmm0
0x1006a5b11: vpcmpeqd xmm0, xmm1, xmm8
0x1006a5b16: vpxor xmm0, xmm0, xmm9
0x1006a5b1b: vpsubd xmm5, xmm5, xmm0
0x1006a5b1f: add rax, 0x20
0x1006a5b23: add rbx, -0x10
0x1006a5b27: jne 0x1006a5ad0
0x1006a5b29: vpaddd xmm0, xmm3, xmm2
0x1006a5b2d: vpaddd xmm0, xmm4, xmm0
0x1006a5b31: vpaddd xmm0, xmm5, xmm0
0x1006a5b35: vpshufd xmm1, xmm0, 0x4e
0x1006a5b3a: vpaddd xmm0, xmm0, xmm1
0x1006a5b3e: vphaddd xmm0, xmm0, xmm0
0x1006a5b43: vmovd r8d, xmm0
0x1006a5b48: test r10d, r10d
0x1006a5b4b: je 0x1006a5b69
0x1006a5b4d: nop dword ptr [rax]
0x1006a5b50: movzx eax, word ptr [rsi + rdi*2]
0x1006a5b54: xor ebx, ebx
0x1006a5b56: cmp eax, 0xffff
0x1006a5b5b: setne bl
0x1006a5b5e: add r8d, ebx
0x1006a5b61: inc rdi
0x1006a5b64: cmp rdi, rdx
0x1006a5b67: jb 0x1006a5b50
0x1006a5b69: inc rcx
0x1006a5b6c: cmp rcx, r9
0x1006a5b6f: jb 0x1006a5a70
0x1006a5b75: mov ecx, r9d
0x1006a5b78: lea rdx, [rip + 0x4f4065] ; 0x100b99be4
0x1006a5b7f: lea r12, [rsp + 0x40]
0x1006a5b84: mov esi, 0x80
0x1006a5b89: xor eax, eax
0x1006a5b8b: mov rdi, r12
0x1006a5b8e: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x1006a5b93: call 0x1002acd30 ; 0x1002acd30
0x1006a5b98: lea r14, [rsp + 0x30]
0x1006a5b9d: mov rdi, rax
0x1006a5ba0: mov rsi, r12
0x1006a5ba3: mov rdx, r14
0x1006a5ba6: call 0x1002b21b0 ; 0x1002b21b0
0x1006a5bab: mov eax, dword ptr [r13 + 0x44]
0x1006a5baf: mov ecx, 0xcccccccd
0x1006a5bb4: imul rcx, rax
0x1006a5bb8: shr rcx, 0x25
0x1006a5bbc: vcvtsi2ss xmm0, xmm10, ecx
0x1006a5bc0: vdivss xmm0, xmm0, dword ptr [rip + 0x431448] ; 0x100ad7010
0x1006a5bc8: vmulss xmm0, xmm0, dword ptr [rip + 0x402aa0] ; 0x100aa8670
0x1006a5bd0: vcvtss2sd xmm0, xmm0, xmm0
0x1006a5bd4: lea rdx, [rip + 0x4f4029] ; 0x100b99c04 Tess Vert Count: %u (%.1f%%)
0x1006a5bdb: mov esi, 0x80
0x1006a5be0: mov al, 1
0x1006a5be2: mov rdi, r12
0x1006a5be5: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x1006a5bea: call 0x1002acd30 ; 0x1002acd30
0x1006a5bef: mov rdi, rax
0x1006a5bf2: mov rsi, r12
0x1006a5bf5: mov rdx, r14
0x1006a5bf8: call 0x1002b21b0 ; 0x1002b21b0
0x1006a5bfd: mov eax, dword ptr [rsp + 0x10c]
0x1006a5c04: mov dword ptr [rsp], eax
0x1006a5c07: lea rdx, [rip + 0x4f4013] ; 0x100b99c21 LOD Counts: %u %u %u %u
0x1006a5c0e: mov esi, 0x80
0x1006a5c13: xor eax, eax
0x1006a5c15: mov rdi, r12
0x1006a5c18: mov rbx, qword ptr [rsp + 0x20]
0x1006a5c1d: mov ecx, ebx
0x1006a5c1f: mov r8, qword ptr [rsp + 0x18]
0x1006a5c24: mov r13d, dword ptr [rsp + 0x10]
0x1006a5c29: mov r9d, r13d
0x1006a5c2c: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x1006a5c31: call 0x1002acd30 ; 0x1002acd30
0x1006a5c36: mov rdi, rax
0x1006a5c39: mov rsi, r12
0x1006a5c3c: mov rdx, r14
0x1006a5c3f: call 0x1002b21b0 ; 0x1002b21b0
0x1006a5c44: mov esi, r13d
0x1006a5c47: test esi, esi
0x1006a5c49: je 0x1006a5c5a
0x1006a5c4b: mov eax, dword ptr [rsp + 0xe0]
0x1006a5c52: xor edx, edx
0x1006a5c54: div esi
0x1006a5c56: mov dword ptr [rsp + 0x14], eax
0x1006a5c5a: mov rcx, qword ptr [rsp + 0x18]
0x1006a5c5f: lea r13d, [rcx + rbx]
0x1006a5c63: xor edi, edi
0x1006a5c65: mov r14d, 0
0x1006a5c6b: test ecx, ecx
0x1006a5c6d: je 0x1006a5c7d
0x1006a5c6f: mov eax, dword ptr [rsp + 0xd4]
0x1006a5c76: xor edx, edx
0x1006a5c78: div ecx
0x1006a5c7a: mov r14d, eax
0x1006a5c7d: add r15d, dword ptr [rsp + 0xc]
0x1006a5c82: add r13d, esi
0x1006a5c85: test ebx, ebx
0x1006a5c87: je 0x1006a5c96
0x1006a5c89: mov eax, dword ptr [rsp + 0xc8]
0x1006a5c90: xor edx, edx
0x1006a5c92: div ebx
0x1006a5c94: mov edi, eax
0x1006a5c96: mov r12d, dword ptr [rsp + 8]
0x1006a5c9b: add r12d, r15d
0x1006a5c9e: test r13d, r13d
0x1006a5ca1: mov dword ptr [rsp + 0xc], edi
0x1006a5ca5: je 0x1006a5cb5
0x1006a5ca7: xor edx, edx
0x1006a5ca9: mov eax, r12d
0x1006a5cac: div r13d
0x1006a5caf: mov dword ptr [rsp + 8], eax
0x1006a5cb3: jmp 0x1006a5cbd ; 0x1006a5cbd
0x1006a5cb5: mov dword ptr [rsp + 8], 0
0x1006a5cbd: lea rdx, [rip + 0x4f3f75] ; 0x100b99c39 VertCounts:  Min    Max   Ave   Total  Bins
0x1006a5cc4: lea rbx, [rsp + 0x40]
0x1006a5cc9: mov esi, 0x80
0x1006a5cce: xor eax, eax
0x1006a5cd0: mov rdi, rbx
0x1006a5cd3: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x1006a5cd8: call 0x1002acd30 ; 0x1002acd30
0x1006a5cdd: lea r15, [rsp + 0x30]
0x1006a5ce2: mov rdi, rax
0x1006a5ce5: mov rsi, rbx
0x1006a5ce8: mov rdx, r15
0x1006a5ceb: call 0x1002b21b0 ; 0x1002b21b0
0x1006a5cf0: mov ecx, dword ptr [rsp + 0xd8]
0x1006a5cf7: mov r8d, dword ptr [rsp + 0xdc]
0x1006a5cff: mov eax, dword ptr [rsp + 0xe0]
0x1006a5d06: vcvtsi2sd xmm0, xmm10, rax
0x1006a5d0b: vdivsd xmm0, xmm0, qword ptr [rip + 0x40c0c5] ; 0x100ab1dd8
0x1006a5d13: mov eax, dword ptr [rsp + 0x10]
0x1006a5d17: mov dword ptr [rsp], eax
0x1006a5d1a: lea rdx, [rip + 0x4f3f44] ; 0x100b99c65 LOD Tess2 : %4u   %4u  %4u  %5.1fK  %3u
0x1006a5d21: mov esi, 0x80
0x1006a5d26: mov al, 1
0x1006a5d28: mov rdi, rbx
0x1006a5d2b: mov r9d, dword ptr [rsp + 0x14]
0x1006a5d30: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x1006a5d35: call 0x1002acd30 ; 0x1002acd30
0x1006a5d3a: mov rdi, rax
0x1006a5d3d: mov rsi, rbx
0x1006a5d40: mov rdx, r15
0x1006a5d43: call 0x1002b21b0 ; 0x1002b21b0
0x1006a5d48: mov ecx, dword ptr [rsp + 0xcc]
0x1006a5d4f: mov r8d, dword ptr [rsp + 0xd0]
0x1006a5d57: mov eax, dword ptr [rsp + 0xd4]
0x1006a5d5e: vcvtsi2sd xmm0, xmm7, rax
0x1006a5d63: vdivsd xmm0, xmm0, qword ptr [rip + 0x40c06d] ; 0x100ab1dd8
0x1006a5d6b: mov rax, qword ptr [rsp + 0x18]
0x1006a5d70: mov dword ptr [rsp], eax
0x1006a5d73: lea rdx, [rip + 0x4f3f13] ; 0x100b99c8d LOD Tess1 : %4u   %4u  %4u  %5.1fK  %3u
0x1006a5d7a: mov esi, 0x80
0x1006a5d7f: mov al, 1
0x1006a5d81: mov rdi, rbx
0x1006a5d84: mov r9d, r14d
0x1006a5d87: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x1006a5d8c: call 0x1002acd30 ; 0x1002acd30
0x1006a5d91: mov rdi, rax
0x1006a5d94: mov rsi, rbx
0x1006a5d97: mov rdx, r15
0x1006a5d9a: call 0x1002b21b0 ; 0x1002b21b0
0x1006a5d9f: mov ecx, dword ptr [rsp + 0xc0]
0x1006a5da6: mov r8d, dword ptr [rsp + 0xc4]
0x1006a5dae: mov eax, dword ptr [rsp + 0xc8]
0x1006a5db5: vcvtsi2sd xmm0, xmm1, rax
0x1006a5dba: vdivsd xmm0, xmm0, qword ptr [rip + 0x40c016] ; 0x100ab1dd8
0x1006a5dc2: mov rax, qword ptr [rsp + 0x20]
0x1006a5dc7: mov dword ptr [rsp], eax
0x1006a5dca: lea rdx, [rip + 0x4f3ee4] ; 0x100b99cb5 LOD Tess0 : %4u   %4u  %4u  %5.1fK  %3u
0x1006a5dd1: mov esi, 0x80
0x1006a5dd6: mov al, 1
0x1006a5dd8: mov rdi, rbx
0x1006a5ddb: mov r9d, dword ptr [rsp + 0xc]
0x1006a5de0: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x1006a5de5: call 0x1002acd30 ; 0x1002acd30
0x1006a5dea: mov rdi, rax
0x1006a5ded: mov rsi, rbx
0x1006a5df0: mov rdx, r15
0x1006a5df3: call 0x1002b21b0 ; 0x1002b21b0
0x1006a5df8: mov eax, r12d
0x1006a5dfb: vcvtsi2sd xmm0, xmm1, rax
0x1006a5e00: vdivsd xmm0, xmm0, qword ptr [rip + 0x40bfd0] ; 0x100ab1dd8
0x1006a5e08: mov dword ptr [rsp], r13d
0x1006a5e0c: lea rdx, [rip + 0x4f3eca] ; 0x100b99cdd Total     : %4u   %4u  %4u  %5.1fK  %3u
0x1006a5e13: mov esi, 0x80
0x1006a5e18: mov al, 1
0x1006a5e1a: mov r8d, dword ptr [rsp + 0x28]
0x1006a5e1f: mov rdi, rbx
0x1006a5e22: mov ecx, dword ptr [rsp + 0x2c]
0x1006a5e26: mov r9d, dword ptr [rsp + 8]
0x1006a5e2b: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x1006a5e30: call 0x1002acd30 ; 0x1002acd30
0x1006a5e35: mov rdi, rax
0x1006a5e38: mov rsi, rbx
0x1006a5e3b: mov rdx, r15
0x1006a5e3e: call 0x1002b21b0 ; 0x1002b21b0
0x1006a5e43: lea rdx, [rip + 0x4fef8e] ; 0x100ba4dd8
0x1006a5e4a: mov esi, 0x80
0x1006a5e4f: xor eax, eax
0x1006a5e51: mov rdi, rbx
0x1006a5e54: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x1006a5e59: call 0x1002acd30 ; 0x1002acd30
0x1006a5e5e: mov rdi, rax
0x1006a5e61: mov rsi, rbx
0x1006a5e64: mov rdx, r15
0x1006a5e67: call 0x1002b21b0 ; 0x1002b21b0
0x1006a5e6c: mov rax, qword ptr [rip + 0x567a65] ; 0x100c0d8d8
0x1006a5e73: mov rax, qword ptr [rax]
0x1006a5e76: cmp rax, qword ptr [rsp + 0x120]
0x1006a5e7e: jne 0x1006a5e8f
0x1006a5e80: lea rsp, [rbp - 0x28]
0x1006a5e84: pop rbx
0x1006a5e85: pop r12
0x1006a5e87: pop r13
0x1006a5e89: pop r14
0x1006a5e8b: pop r15
0x1006a5e8d: pop rbp
0x1006a5e8e: ret 
0x1006a5e8f: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1006a5e94: nop word ptr cs:[rax + rax]
