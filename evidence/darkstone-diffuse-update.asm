0x10027daeb: vmovaps xmm1, xmmword ptr [rip + 0xaad99d] ; 0x100d2b490
0x10027daf3: test r12b, 1
0x10027daf7: vmovss xmm0, dword ptr [rip + 0x830d81] ; 0x100aae880
0x10027daff: je 0x10027db67
0x10027db01: mov eax, dword ptr [r13 + 0x104]
0x10027db08: test eax, eax
0x10027db0a: je 0x10027db45
0x10027db0c: mov rcx, qword ptr [r13 + 0x18]
0x10027db10: mov edx, dword ptr [rcx + 0x1b220]
0x10027db16: xor esi, esi
0x10027db18: nop dword ptr [rax + rax]
0x10027db20: mov edi, dword ptr [r13 + rsi*4 + 0xe4]
0x10027db28: cmp edx, edi
0x10027db2a: jbe 0x10027db3e
0x10027db2c: imul rdi, rdi, 0x1a0
0x10027db33: vucomiss xmm0, dword ptr [rcx + rdi + 0x12f0]
0x10027db3c: jb 0x10027db67
0x10027db3e: inc rsi
0x10027db41: cmp eax, esi
0x10027db43: ja 0x10027db20
0x10027db45: cmp byte ptr [r13 + 0xdc], 0
0x10027db4d: je 0x10027db67
0x10027db4f: mov eax, dword ptr [rsp + 0xf0]
0x10027db56: cmp eax, dword ptr [r13 + 0x140]
0x10027db5d: jae 0x10027db7a
0x10027db5f: vmovaps xmm1, xmmword ptr [rip + 0xaad979] ; 0x100d2b4e0
0x10027db67: cmp qword ptr [r13 + 0x170], 0
0x10027db6f: je 0x10027dbab
0x10027db71: cmp byte ptr [rsp + 0x28], 0
0x10027db76: jne 0x10027dbcc
0x10027db78: jmp 0x10027dbc4 ; 0x10027dbc4
0x10027db7a: lea rax, [rip + 0x1d8676f] ; 0x1020042f0
0x10027db81: vmovaps xmm0, xmmword ptr [rax]
0x10027db85: vmulps xmm1, xmm0, xmmword ptr [rip + 0x82b763] ; 0x100aa92f0
0x10027db8d: vpermilps xmm0, xmm0, 0xe7
0x10027db93: vmulss xmm0, xmm0, dword ptr [rip + 0x830e71] ; 0x100aaea0c
0x10027db9b: vinsertps xmm1, xmm1, xmm0, 0x30
0x10027dba1: cmp qword ptr [r13 + 0x170], 0
0x10027dba9: jne 0x10027db71
0x10027dbab: cmp byte ptr [rsp + 0x5c], 0
0x10027dbb0: je 0x10027dbc4
0x10027dbb2: cmp qword ptr [rbp + 0x40], 0
0x10027dbb7: jne 0x10027dbcc
0x10027dbb9: mov eax, dword ptr [r13 + 0x188]
0x10027dbc0: test eax, eax
0x10027dbc2: jne 0x10027dbcc
0x10027dbc4: vmulps xmm1, xmm1, xmmword ptr [rip + 0x837524] ; 0x100ab50f0
0x10027dbcc: vmovsd xmm0, qword ptr [rsp + 0x68]
0x10027dbd2: vucomiss xmm0, dword ptr [rip + 0x829cea] ; 0x100aa78c4
0x10027dbda: jbe 0x10027dc4b
0x10027dbdc: mov eax, dword ptr [rsp + 0x2c]
0x10027dbe0: cmp eax, dword ptr [r13 + 0x140]
0x10027dbe7: jb 0x10027dc4b
0x10027dbe9: vmovsd xmm0, qword ptr [rsp + 0x68]
0x10027dbef: vmulss xmm0, xmm0, dword ptr [rip + 0x82aa49] ; 0x100aa8640
0x10027dbf7: vmulss xmm0, xmm0, dword ptr [rsp + 0xbc]
0x10027dc00: call 0x100aa2bca ; 0x100aa2bca _sinf
0x10027dc05: vmovss xmm1, dword ptr [rip + 0x8269ab] ; 0x100aa45b8
0x10027dc0d: vmulss xmm0, xmm0, xmm1
0x10027dc11: vaddss xmm0, xmm0, xmm1
0x10027dc15: vxorps xmm1, xmm1, xmm1
0x10027dc19: vmaxss xmm0, xmm1, xmm0
0x10027dc1d: vmovss xmm1, dword ptr [rip + 0x82749b] ; 0x100aa50c0
0x10027dc25: vminss xmm0, xmm1, xmm0
0x10027dc29: vmovaps xmm1, xmmword ptr [rip + 0xaad89f] ; 0x100d2b4d0
0x10027dc31: vmovaps xmm2, xmmword ptr [rip + 0xaad887] ; 0x100d2b4c0
0x10027dc39: vsubps xmm1, xmm1, xmm2
0x10027dc3d: vpermilps xmm0, xmm0, 0
0x10027dc43: vmulps xmm0, xmm1, xmm0
0x10027dc47: vaddps xmm1, xmm2, xmm0
0x10027dc4b: vmovaps xmmword ptr [rsp + 0x30], xmm1
0x10027dc51: vmovsd xmm0, qword ptr [rsp + 0x60]
0x10027dc57: vmulss xmm0, xmm0, dword ptr [rip + 0x82d0e1] ; 0x100aaad40
0x10027dc5f: call 0x100aa2708 ; 0x100aa2708 _expf
0x10027dc64: vmovss xmm2, dword ptr [rip + 0x827454] ; 0x100aa50c0
0x10027dc6c: vsubss xmm0, xmm2, xmm0
0x10027dc70: vxorps xmm1, xmm1, xmm1
0x10027dc74: vmaxss xmm0, xmm1, xmm0
0x10027dc78: vminss xmm0, xmm2, xmm0
0x10027dc7c: vsubss xmm1, xmm2, xmm0
0x10027dc80: vpermilps xmm1, xmm1, 0
0x10027dc86: vmovaps xmmword ptr [rsp + 0xf0], xmm1
0x10027dc8f: vmulps xmm1, xmm1, xmmword ptr [r13 + 0x150]
0x10027dc98: vpermilps xmm0, xmm0, 0
0x10027dc9e: vmovaps xmmword ptr [rsp + 0xe0], xmm0
0x10027dca7: vmulps xmm0, xmm0, xmmword ptr [rsp + 0x30]
0x10027dcad: vaddps xmm0, xmm0, xmm1
0x10027dcb1: vmovaps xmmword ptr [r13 + 0x150], xmm0
0x10027dcba: mov rdi, qword ptr [r13 + 0x28]
0x10027dcbe: mov qword ptr [rsp + 0x270], 0
0x10027dcca: mov byte ptr [rsp + 0x260], 0x1c
0x10027dcd2: movabs rax, 0x726f6c6f43657375
0x10027dcdc: mov qword ptr [rsp + 0x267], rax
0x10027dce4: movabs rax, 0x7375666669645f75
0x10027dcee: mov qword ptr [rsp + 0x261], rax
0x10027dcf6: mov byte ptr [rsp + 0x26f], 0
0x10027dcfe: vmovaps xmmword ptr [rsp + 0x190], xmm0
0x10027dd07: lea rdx, [rsp + 0x260]
0x10027dd0f: lea rcx, [rsp + 0x190]
0x10027dd17: xor esi, esi
0x10027dd19: vxorps xmm0, xmm0, xmm0
0x10027dd1d: call 0x1003fff20 ; 0x1003fff20
0x10027dd22: test byte ptr [rsp + 0x260], 1
0x10027dd2a: je 0x10027dd44
0x10027dd2c: mov rbx, qword ptr [rsp + 0x270]
0x10027dd34: call 0x1007e50d0 ; 0x1007e50d0
0x10027dd39: mov rdi, rax
0x10027dd3c: mov rsi, rbx
0x10027dd3f: call 0x1007e5db0 ; 0x1007e5db0
