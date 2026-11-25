0x10071d9f0: push rbp
0x10071d9f1: mov rbp, rsp
0x10071d9f4: push r15
0x10071d9f6: push r14
0x10071d9f8: push r13
0x10071d9fa: push r12
0x10071d9fc: push rbx
0x10071d9fd: push rax
0x10071d9fe: mov r14, r8
0x10071da01: mov r15, rcx
0x10071da04: mov r12, rdx
0x10071da07: mov rbx, rdi
0x10071da0a: vcvttss2si rcx, dword ptr [r15 + 0x284]
0x10071da13: shr ecx, 2
0x10071da16: vcvttss2si rsi, dword ptr [r15 + 0x288]
0x10071da1f: shr esi, 2
0x10071da22: cmp ecx, dword ptr [rbx + 0x28]
0x10071da25: jne 0x10071da30
0x10071da27: cmp esi, dword ptr [rbx + 0x2c]
0x10071da2a: je 0x10071e008
0x10071da30: mov dword ptr [rbx + 0x28], ecx
0x10071da33: mov dword ptr [rbx + 0x2c], esi
0x10071da36: mov r9d, dword ptr [rbx + 0x218]
0x10071da3d: xor r13d, r13d
0x10071da40: mov edx, 0
0x10071da45: test r9, r9
0x10071da48: je 0x10071db19
0x10071da4e: cmp r9d, 0xf
0x10071da52: ja 0x10071da5d
0x10071da54: xor edi, edi
0x10071da56: xor edx, edx
0x10071da58: jmp 0x10071db00 ; 0x10071db00
0x10071da5d: mov r8d, r9d
0x10071da60: and r8d, 0xf
0x10071da64: mov rdi, r9
0x10071da67: sub rdi, r8
0x10071da6a: lea rdx, [rbx + 0x158]
0x10071da71: vpxor xmm0, xmm0, xmm0
0x10071da75: mov rax, rdi
0x10071da78: vpxor xmm1, xmm1, xmm1
0x10071da7c: vpxor xmm2, xmm2, xmm2
0x10071da80: vpxor xmm3, xmm3, xmm3
0x10071da84: nop word ptr cs:[rax + rax]
0x10071da90: vmovdqu xmm4, xmmword ptr [rdx - 0x30]
0x10071da95: vmovdqu xmm5, xmmword ptr [rdx - 0x20]
0x10071da9a: vmovdqu xmm6, xmmword ptr [rdx - 0x10]
0x10071da9f: vmovdqu xmm7, xmmword ptr [rdx]
0x10071daa3: vpmulld xmm4, xmm4, xmmword ptr [rdx - 0x80]
0x10071daa9: vpaddd xmm0, xmm4, xmm0
0x10071daad: vpmulld xmm4, xmm5, xmmword ptr [rdx - 0x70]
0x10071dab3: vpaddd xmm1, xmm4, xmm1
0x10071dab7: vpmulld xmm4, xmm6, xmmword ptr [rdx - 0x60]
0x10071dabd: vpaddd xmm2, xmm4, xmm2
0x10071dac1: vpmulld xmm4, xmm7, xmmword ptr [rdx - 0x50]
0x10071dac7: vpaddd xmm3, xmm4, xmm3
0x10071dacb: add rdx, 0x40
0x10071dacf: add rax, -0x10
0x10071dad3: jne 0x10071da90
0x10071dad5: vpaddd xmm0, xmm1, xmm0
0x10071dad9: vpaddd xmm0, xmm2, xmm0
0x10071dadd: vpaddd xmm0, xmm3, xmm0
0x10071dae1: vpshufd xmm1, xmm0, 0x4e
0x10071dae6: vpaddd xmm0, xmm0, xmm1
0x10071daea: vphaddd xmm0, xmm0, xmm0
0x10071daef: vmovd edx, xmm0
0x10071daf3: test r8d, r8d
0x10071daf6: je 0x10071db19
0x10071daf8: nop dword ptr [rax + rax]
0x10071db00: mov eax, dword ptr [rbx + rdi*4 + 0x128]
0x10071db07: imul eax, dword ptr [rbx + rdi*4 + 0xd8]
0x10071db0f: add edx, eax
0x10071db11: inc rdi
0x10071db14: cmp rdi, r9
0x10071db17: jb 0x10071db00
0x10071db19: mov eax, ecx
0x10071db1b: vcvtsi2ss xmm0, xmm8, rax
0x10071db20: mov eax, esi
0x10071db22: vcvtsi2ss xmm1, xmm8, rax
0x10071db27: mov dword ptr [rbx + 0x218], 0
0x10071db31: vmovss xmm2, dword ptr [rip + 0x386a7f] ; 0x100aa45b8
0x10071db39: xor eax, eax
0x10071db3b: nop dword ptr [rax + rax]
0x10071db40: mov edi, esi
0x10071db42: or edi, ecx
0x10071db44: test edi, 0x7ffffffe
0x10071db4a: je 0x10071dbae
0x10071db4c: mov edi, ecx
0x10071db4e: and edi, 1
0x10071db51: add edi, ecx
0x10071db53: mov ecx, esi
0x10071db55: and ecx, 1
0x10071db58: add ecx, esi
0x10071db5a: mov eax, eax
0x10071db5c: mov dword ptr [rbx + rax*4 + 0xd8], edi
0x10071db63: mov eax, dword ptr [rbx + 0x218]
0x10071db69: mov dword ptr [rbx + rax*4 + 0x128], ecx
0x10071db70: mov eax, dword ptr [rbx + 0x218]
0x10071db76: vmovss dword ptr [rbx + rax*4 + 0x178], xmm0
0x10071db7f: vmovss dword ptr [rbx + rax*4 + 0x1c8], xmm1
0x10071db88: mov esi, ecx
0x10071db8a: imul esi, edi
0x10071db8d: add r13d, esi
0x10071db90: shr edi, 1
0x10071db92: shr ecx, 1
0x10071db94: vmulss xmm0, xmm0, xmm2
0x10071db98: vmulss xmm1, xmm1, xmm2
0x10071db9c: lea eax, [rax + 1]
0x10071db9f: mov dword ptr [rbx + 0x218], eax
0x10071dba5: mov esi, ecx
0x10071dba7: mov ecx, edi
0x10071dba9: cmp eax, 0x14
0x10071dbac: jb 0x10071db40
0x10071dbae: mov rsi, qword ptr [rbx + 0x20]
0x10071dbb2: cmp edx, r13d
0x10071dbb5: jne 0x10071dbc3
0x10071dbb7: mov rdi, rsi
0x10071dbba: test eax, eax
0x10071dbbc: jne 0x10071dc03
0x10071dbbe: jmp 0x10071dcd0 ; 0x10071dcd0
0x10071dbc3: test rsi, rsi
0x10071dbc6: je 0x10071dbd0
0x10071dbc8: mov rdi, r12
0x10071dbcb: call 0x100795a70 ; 0x100795a70
0x10071dbd0: mov esi, r13d
0x10071dbd3: shl rsi, 2
0x10071dbd7: mov rdx, qword ptr [rip + 0x191e2aa] ; 0x10203be88
0x10071dbde: mov ecx, 0x10
0x10071dbe3: mov rdi, r12
0x10071dbe6: call 0x100795530 ; 0x100795530
0x10071dbeb: mov rdi, rax
0x10071dbee: mov qword ptr [rbx + 0x20], rdi
0x10071dbf2: mov eax, dword ptr [rbx + 0x218]
0x10071dbf8: mov rsi, rdi
0x10071dbfb: test eax, eax
0x10071dbfd: je 0x10071dcd0
0x10071dc03: mov r8d, eax
0x10071dc06: lea rcx, [r8 - 1]
0x10071dc0a: mov eax, r8d
0x10071dc0d: and eax, 3
0x10071dc10: cmp rcx, 3
0x10071dc14: jae 0x10071dc26
0x10071dc16: xor ecx, ecx
0x10071dc18: test rax, rax
0x10071dc1b: jne 0x10071dc9e
0x10071dc21: jmp 0x10071dcd0 ; 0x10071dcd0
0x10071dc26: sub r8, rax
0x10071dc29: xor ecx, ecx
0x10071dc2b: nop dword ptr [rax + rax]
0x10071dc30: mov qword ptr [rbx + rcx*8 + 0x38], rsi
0x10071dc35: mov edx, dword ptr [rbx + rcx*4 + 0x128]
0x10071dc3c: imul edx, dword ptr [rbx + rcx*4 + 0xd8]
0x10071dc44: lea rdx, [rsi + rdx*4]
0x10071dc48: mov qword ptr [rbx + rcx*8 + 0x40], rdx
0x10071dc4d: mov esi, dword ptr [rbx + rcx*4 + 0x12c]
0x10071dc54: imul esi, dword ptr [rbx + rcx*4 + 0xdc]
0x10071dc5c: lea rdx, [rdx + rsi*4]
0x10071dc60: mov qword ptr [rbx + rcx*8 + 0x48], rdx
0x10071dc65: mov esi, dword ptr [rbx + rcx*4 + 0x130]
0x10071dc6c: imul esi, dword ptr [rbx + rcx*4 + 0xe0]
0x10071dc74: lea rdx, [rdx + rsi*4]
0x10071dc78: mov qword ptr [rbx + rcx*8 + 0x50], rdx
0x10071dc7d: mov esi, dword ptr [rbx + rcx*4 + 0x134]
0x10071dc84: imul esi, dword ptr [rbx + rcx*4 + 0xe4]
0x10071dc8c: lea rsi, [rdx + rsi*4]
0x10071dc90: add rcx, 4
0x10071dc94: cmp r8, rcx
0x10071dc97: jne 0x10071dc30
0x10071dc99: test rax, rax
0x10071dc9c: je 0x10071dcd0
0x10071dc9e: neg rax
0x10071dca1: nop word ptr cs:[rax + rax]
0x10071dcb0: mov qword ptr [rbx + rcx*8 + 0x38], rsi
0x10071dcb5: mov edx, dword ptr [rbx + rcx*4 + 0x128]
0x10071dcbc: imul edx, dword ptr [rbx + rcx*4 + 0xd8]
0x10071dcc4: lea rsi, [rsi + rdx*4]
0x10071dcc8: inc rcx
0x10071dccb: inc rax
0x10071dcce: jne 0x10071dcb0
0x10071dcd0: test r13d, r13d
0x10071dcd3: je 0x10071dcec
0x10071dcd5: dec r13d
0x10071dcd8: lea rdx, [r13*4 + 4]
0x10071dce0: lea rsi, [rip + 0x389979] ; 0x100aa7660
0x10071dce7: call 0x100aa2906 ; 0x100aa2906 _memset_pattern16
0x10071dcec: vmovss xmm0, dword ptr [r15 + 0x244]
0x10071dcf5: vdivss xmm0, xmm0, dword ptr [r15 + 0x298]
0x10071dcfe: vmovss dword ptr [rbx + 0x30], xmm0
0x10071dd03: mov rax, qword ptr [rbx + 0x10]
0x10071dd07: mov ecx, dword ptr [r14]
0x10071dd0a: mov dword ptr [rax], ecx
0x10071dd0c: mov ecx, dword ptr [r14 + 0x14]
0x10071dd10: mov dword ptr [rax + 0x14], ecx
0x10071dd13: vmovups xmm0, xmmword ptr [r14 + 4]
0x10071dd19: vmovups xmmword ptr [rax + 4], xmm0
0x10071dd1e: vmovaps xmm0, xmmword ptr [r14 + 0x20]
0x10071dd24: vmovaps xmmword ptr [rax + 0x20], xmm0
0x10071dd29: vmovaps xmm0, xmmword ptr [r14 + 0x30]
0x10071dd2f: vmovaps xmmword ptr [rax + 0x30], xmm0
0x10071dd34: vmovaps xmm0, xmmword ptr [r14 + 0x40]
0x10071dd3a: vmovaps xmmword ptr [rax + 0x40], xmm0
0x10071dd3f: vmovaps xmm0, xmmword ptr [r14 + 0x50]
0x10071dd45: vmovaps xmmword ptr [rax + 0x50], xmm0
0x10071dd4a: vmovaps xmm0, xmmword ptr [r14 + 0x60]
0x10071dd50: vmovaps xmmword ptr [rax + 0x60], xmm0
0x10071dd55: vmovaps xmm0, xmmword ptr [r14 + 0x70]
0x10071dd5b: vmovaps xmmword ptr [rax + 0x70], xmm0
0x10071dd60: vmovaps xmm0, xmmword ptr [r14 + 0x80]
0x10071dd69: vmovaps xmmword ptr [rax + 0x80], xmm0
0x10071dd71: vmovaps xmm0, xmmword ptr [r14 + 0x90]
0x10071dd7a: vmovaps xmmword ptr [rax + 0x90], xmm0
0x10071dd82: vmovaps xmm0, xmmword ptr [r14 + 0xa0]
0x10071dd8b: vmovaps xmmword ptr [rax + 0xa0], xmm0
0x10071dd93: vmovaps xmm0, xmmword ptr [r14 + 0xb0]
0x10071dd9c: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x10071dda4: vmovaps xmm0, xmmword ptr [r14 + 0xc0]
0x10071ddad: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x10071ddb5: vmovaps xmm0, xmmword ptr [r14 + 0xd0]
0x10071ddbe: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x10071ddc6: vmovaps xmm0, xmmword ptr [r14 + 0xe0]
0x10071ddcf: vmovaps xmmword ptr [rax + 0xe0], xmm0
0x10071ddd7: vmovaps xmm0, xmmword ptr [r14 + 0xf0]
0x10071dde0: vmovaps xmmword ptr [rax + 0xf0], xmm0
0x10071dde8: vmovaps xmm0, xmmword ptr [r14 + 0x100]
0x10071ddf1: vmovaps xmmword ptr [rax + 0x100], xmm0
0x10071ddf9: vmovaps xmm0, xmmword ptr [r14 + 0x110]
0x10071de02: vmovaps xmmword ptr [rax + 0x110], xmm0
0x10071de0a: vmovaps xmm0, xmmword ptr [r14 + 0x120]
0x10071de13: vmovaps xmmword ptr [rax + 0x120], xmm0
0x10071de1b: vmovaps xmm0, xmmword ptr [r14 + 0x130]
0x10071de24: vmovaps xmmword ptr [rax + 0x130], xmm0
0x10071de2c: vmovaps xmm0, xmmword ptr [r14 + 0x140]
0x10071de35: vmovaps xmmword ptr [rax + 0x140], xmm0
0x10071de3d: vmovaps xmm0, xmmword ptr [r14 + 0x150]
0x10071de46: vmovaps xmmword ptr [rax + 0x150], xmm0
0x10071de4e: vmovaps xmm0, xmmword ptr [r14 + 0x160]
0x10071de57: vmovaps xmmword ptr [rax + 0x160], xmm0
0x10071de5f: vmovaps xmm0, xmmword ptr [r14 + 0x170]
0x10071de68: vmovaps xmmword ptr [rax + 0x170], xmm0
0x10071de70: vmovaps xmm0, xmmword ptr [r14 + 0x180]
0x10071de79: vmovaps xmmword ptr [rax + 0x180], xmm0
0x10071de81: vmovaps xmm0, xmmword ptr [r14 + 0x190]
0x10071de8a: vmovaps xmmword ptr [rax + 0x190], xmm0
0x10071de92: vmovaps xmm0, xmmword ptr [r14 + 0x1a0]
0x10071de9b: vmovaps xmmword ptr [rax + 0x1a0], xmm0
0x10071dea3: vmovaps xmm0, xmmword ptr [r14 + 0x1b0]
0x10071deac: vmovaps xmmword ptr [rax + 0x1b0], xmm0
0x10071deb4: vmovaps xmm0, xmmword ptr [r14 + 0x1c0]
0x10071debd: vmovaps xmmword ptr [rax + 0x1c0], xmm0
0x10071dec5: vmovaps xmm0, xmmword ptr [r14 + 0x1d0]
0x10071dece: vmovaps xmmword ptr [rax + 0x1d0], xmm0
0x10071ded6: vmovaps xmm0, xmmword ptr [r14 + 0x1e0]
0x10071dedf: vmovaps xmmword ptr [rax + 0x1e0], xmm0
0x10071dee7: vmovaps xmm0, xmmword ptr [r14 + 0x1f0]
0x10071def0: vmovaps xmmword ptr [rax + 0x1f0], xmm0
0x10071def8: vmovaps xmm0, xmmword ptr [r14 + 0x200]
0x10071df01: vmovaps xmmword ptr [rax + 0x200], xmm0
0x10071df09: vmovaps xmm0, xmmword ptr [r14 + 0x210]
0x10071df12: vmovaps xmmword ptr [rax + 0x210], xmm0
0x10071df1a: vmovaps xmm0, xmmword ptr [r14 + 0x220]
0x10071df23: vmovaps xmmword ptr [rax + 0x220], xmm0
0x10071df2b: vmovaps xmm0, xmmword ptr [r14 + 0x230]
0x10071df34: vmovaps xmmword ptr [rax + 0x230], xmm0
0x10071df3c: vmovaps xmm0, xmmword ptr [r14 + 0x240]
0x10071df45: vmovaps xmmword ptr [rax + 0x240], xmm0
0x10071df4d: vmovaps xmm0, xmmword ptr [r14 + 0x250]
0x10071df56: vmovaps xmmword ptr [rax + 0x250], xmm0
0x10071df5e: vmovaps xmm0, xmmword ptr [r14 + 0x260]
0x10071df67: vmovaps xmmword ptr [rax + 0x260], xmm0
0x10071df6f: vmovaps xmm0, xmmword ptr [r14 + 0x270]
0x10071df78: vmovaps xmmword ptr [rax + 0x270], xmm0
0x10071df80: vmovaps xmm0, xmmword ptr [r14 + 0x280]
0x10071df89: vmovaps xmmword ptr [rax + 0x280], xmm0
0x10071df91: vmovaps xmm0, xmmword ptr [r14 + 0x290]
0x10071df9a: vmovaps xmmword ptr [rax + 0x290], xmm0
0x10071dfa2: vmovaps xmm0, xmmword ptr [r14 + 0x2a0]
0x10071dfab: vmovaps xmmword ptr [rax + 0x2a0], xmm0
0x10071dfb3: vmovaps xmm0, xmmword ptr [r14 + 0x2b0]
0x10071dfbc: vmovaps xmmword ptr [rax + 0x2b0], xmm0
0x10071dfc4: vmovaps xmm0, xmmword ptr [r14 + 0x2c0]
0x10071dfcd: vmovaps xmmword ptr [rax + 0x2c0], xmm0
0x10071dfd5: vmovaps xmm0, xmmword ptr [r14 + 0x2d0]
0x10071dfde: vmovaps xmmword ptr [rax + 0x2d0], xmm0
0x10071dfe6: vmovaps xmm0, xmmword ptr [r14 + 0x2e0]
0x10071dfef: vmovaps xmmword ptr [rax + 0x2e0], xmm0
0x10071dff7: vmovaps xmm0, xmmword ptr [r14 + 0x2f0]
0x10071e000: vmovaps xmmword ptr [rax + 0x2f0], xmm0
0x10071e008: add rsp, 8
0x10071e00c: pop rbx
0x10071e00d: pop r12
0x10071e00f: pop r13
0x10071e011: pop r14
0x10071e013: pop r15
0x10071e015: pop rbp
0x10071e016: ret 
0x10071e017: nop word ptr [rax + rax]
