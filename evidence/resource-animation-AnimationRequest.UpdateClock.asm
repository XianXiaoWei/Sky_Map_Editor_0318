0x100097df0: push rbp
0x100097df1: mov rbp, rsp
0x100097df4: push r15
0x100097df6: push r14
0x100097df8: push r12
0x100097dfa: push rbx
0x100097dfb: sub rsp, 0x30
0x100097dff: mov r14, rsi
0x100097e02: vmovaps xmm2, xmm0
0x100097e06: mov rbx, rdi
0x100097e09: mov r15d, dword ptr [rbx + 0x28]
0x100097e0d: mov eax, dword ptr [rbx + 0x3c]
0x100097e10: mov dword ptr [rbx + 0x34], eax
0x100097e13: cmp r15d, 2
0x100097e17: jl 0x100097e62
0x100097e19: vmulss xmm0, xmm2, dword ptr [rbx + 0x20]
0x100097e1e: vcvtsi2ss xmm3, xmm1, r15d
0x100097e23: vdivss xmm0, xmm0, xmm3
0x100097e27: vaddss xmm0, xmm0, dword ptr [rbx + 0x1c]
0x100097e2c: vroundss xmm1, xmm0, xmm0, 9
0x100097e32: vsubss xmm4, xmm0, xmm1
0x100097e36: vmovss dword ptr [rbx + 0x1c], xmm4
0x100097e3b: mov eax, dword ptr [rbx + 0x2c]
0x100097e3e: test eax, eax
0x100097e40: je 0x100097e91
0x100097e42: vaddss xmm0, xmm3, dword ptr [rip + 0xa0d27a] ; 0x100aa50c4
0x100097e4a: vdivss xmm1, xmm0, xmm3
0x100097e4e: mov r12b, byte ptr [rbx + 0x4f]
0x100097e52: vcmpltss xmm5, xmm4, xmm1
0x100097e57: test r12b, r12b
0x100097e5a: jne 0x100097e9a
0x100097e5c: vmovaps xmm0, xmm4
0x100097e60: jmp 0x100097e9e ; 0x100097e9e
0x100097e62: mov dword ptr [rbx + 0x1c], 0
0x100097e69: vmovd xmm0, dword ptr [rbx + 0x24]
0x100097e6e: vpshufd xmm0, xmm0, 0
0x100097e73: vmovdqu xmmword ptr [rbx + 0x38], xmm0
0x100097e78: mov dword ptr [rbx + 0x48], 0
0x100097e7f: mov r12b, byte ptr [rbx + 0x4f]
0x100097e83: test r12b, r12b
0x100097e86: jne 0x100098068
0x100097e8c: jmp 0x100098125 ; 0x100098125
0x100097e91: mov r12b, byte ptr [rbx + 0x4f]
0x100097e95: jmp 0x100097fc9 ; 0x100097fc9
0x100097e9a: vdivss xmm0, xmm4, xmm1
0x100097e9e: vblendvps xmm4, xmm4, xmm0, xmm5
0x100097ea4: dec eax
0x100097ea6: cmp eax, 3
0x100097ea9: ja 0x100097fba
0x100097eaf: vmovaps xmmword ptr [rbp - 0x40], xmm5
0x100097eb4: vmovss dword ptr [rbp - 0x24], xmm1
0x100097eb9: vmovss dword ptr [rbp - 0x28], xmm3
0x100097ebe: vmovss dword ptr [rbp - 0x2c], xmm2
0x100097ec3: vmovss xmm1, dword ptr [rbx + 0x30]
0x100097ec8: lea rcx, [rip + 0x265] ; 0x100098134
0x100097ecf: movsxd rax, dword ptr [rcx + rax*4]
0x100097ed3: add rax, rcx
0x100097ed6: jmp rax
0x100097ed8: vmovaps xmm0, xmm4
0x100097edc: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x100097ee1: vmovaps xmm4, xmm0
0x100097ee5: jmp 0x100097fa6 ; 0x100097fa6
0x100097eea: vmovss xmm0, dword ptr [rip + 0xa0d1ce] ; 0x100aa50c0
0x100097ef2: vsubss xmm0, xmm0, xmm4
0x100097ef6: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x100097efb: vmovss xmm1, dword ptr [rip + 0xa0d1bd] ; 0x100aa50c0
0x100097f03: vsubss xmm4, xmm1, xmm0
0x100097f07: jmp 0x100097fa6 ; 0x100097fa6
0x100097f0c: vaddss xmm0, xmm4, xmm4
0x100097f10: vaddss xmm0, xmm0, dword ptr [rip + 0xa0d1ac] ; 0x100aa50c4
0x100097f18: vandps xmm0, xmm0, xmmword ptr [rip + 0xa0f9f0] ; 0x100aa7910
0x100097f20: vmovss xmm2, dword ptr [rip + 0xa0d198] ; 0x100aa50c0
0x100097f28: vsubss xmm0, xmm2, xmm0
0x100097f2c: vmovaps xmmword ptr [rbp - 0x50], xmm4
0x100097f31: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x100097f36: vmovss xmm1, dword ptr [rip + 0xa0c67a] ; 0x100aa45b8
0x100097f3e: vmulss xmm0, xmm0, xmm1
0x100097f42: vmovss xmm2, dword ptr [rip + 0xa0d176] ; 0x100aa50c0
0x100097f4a: vsubss xmm2, xmm2, xmm0
0x100097f4e: vmovaps xmm3, xmmword ptr [rbp - 0x50]
0x100097f53: vcmpltss xmm1, xmm3, xmm1
0x100097f58: vblendvps xmm4, xmm2, xmm0, xmm1
0x100097f5e: jmp 0x100097fa6 ; 0x100097fa6
0x100097f60: vaddss xmm0, xmm4, xmm4
0x100097f64: vaddss xmm0, xmm0, dword ptr [rip + 0xa0d158] ; 0x100aa50c4
0x100097f6c: vandps xmm0, xmm0, xmmword ptr [rip + 0xa0f99c] ; 0x100aa7910
0x100097f74: vmovaps xmmword ptr [rbp - 0x50], xmm4
0x100097f79: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x100097f7e: vmovss xmm1, dword ptr [rip + 0xa0c632] ; 0x100aa45b8
0x100097f86: vmulss xmm0, xmm0, xmm1
0x100097f8a: vxorps xmm2, xmm0, xmmword ptr [rip + 0xa0f96e] ; 0x100aa7900
0x100097f92: vmovaps xmm3, xmmword ptr [rbp - 0x50]
0x100097f97: vcmpltss xmm3, xmm3, xmm1
0x100097f9c: vblendvps xmm0, xmm0, xmm2, xmm3
0x100097fa2: vaddss xmm4, xmm0, xmm1
0x100097fa6: vmovss xmm2, dword ptr [rbp - 0x2c]
0x100097fab: vmovss xmm3, dword ptr [rbp - 0x28]
0x100097fb0: vmovss xmm1, dword ptr [rbp - 0x24]
0x100097fb5: vmovaps xmm5, xmmword ptr [rbp - 0x40]
0x100097fba: test r12b, r12b
0x100097fbd: je 0x100097fc9
0x100097fbf: vmulss xmm0, xmm1, xmm4
0x100097fc3: vblendvps xmm4, xmm4, xmm0, xmm5
0x100097fc9: vmulss xmm0, xmm4, xmm3
0x100097fcd: vcvttss2si ecx, xmm0
0x100097fd1: mov dword ptr [rbx + 0x3c], ecx
0x100097fd4: lea eax, [rcx + 1]
0x100097fd7: cdq 
0x100097fd8: idiv r15d
0x100097fdb: mov r8d, edx
0x100097fde: mov dword ptr [rbx + 0x40], r8d
0x100097fe2: lea esi, [rcx - 1]
0x100097fe5: mov dword ptr [rbx + 0x38], esi
0x100097fe8: lea edi, [r8 + 1]
0x100097fec: mov dword ptr [rbx + 0x44], edi
0x100097fef: test r12b, r12b
0x100097ff2: je 0x10009800b
0x100097ff4: test ecx, ecx
0x100097ff6: jg 0x100098001
0x100097ff8: mov dword ptr [rbx + 0x38], 0
0x100097fff: xor esi, esi
0x100098001: dec r15d
0x100098004: cmp edi, r15d
0x100098007: jge 0x100098022
0x100098009: jmp 0x100098029 ; 0x100098029
0x10009800b: add esi, r15d
0x10009800e: mov eax, esi
0x100098010: cdq 
0x100098011: idiv r15d
0x100098014: mov esi, edx
0x100098016: mov dword ptr [rbx + 0x38], esi
0x100098019: mov eax, edi
0x10009801b: cdq 
0x10009801c: idiv r15d
0x10009801f: mov r15d, edx
0x100098022: mov dword ptr [rbx + 0x44], r15d
0x100098026: mov edi, r15d
0x100098029: vcvtsi2ss xmm1, xmm6, ecx
0x10009802d: vsubss xmm0, xmm0, xmm1
0x100098031: vmovss dword ptr [rbx + 0x48], xmm0
0x100098036: vmovd xmm0, esi
0x10009803a: vpinsrd xmm0, xmm0, ecx, 1
0x100098040: vpinsrd xmm0, xmm0, r8d, 2
0x100098046: vpinsrd xmm0, xmm0, edi, 3
0x10009804c: vmovd xmm1, dword ptr [rbx + 0x24]
0x100098051: vpshufd xmm1, xmm1, 0
0x100098056: vpaddd xmm0, xmm0, xmm1
0x10009805a: vmovdqu xmmword ptr [rbx + 0x38], xmm0
0x10009805f: test r12b, r12b
0x100098062: je 0x100098125
0x100098068: vmovss xmm0, dword ptr [rbx + 0x54]
0x10009806d: vsubss xmm0, xmm0, xmm2
0x100098071: vmovss dword ptr [rbx + 0x54], xmm0
0x100098076: vmulss xmm0, xmm0, dword ptr [rbx + 0x58]
0x10009807b: vxorps xmm0, xmm0, xmmword ptr [rip + 0xa0f87d] ; 0x100aa7900
0x100098083: vpxor xmm1, xmm1, xmm1
0x100098087: vmaxss xmm1, xmm1, xmm0
0x10009808b: vmovss xmm0, dword ptr [rip + 0xa0d02d] ; 0x100aa50c0
0x100098093: vminss xmm1, xmm0, xmm1
0x100098097: vmulss xmm2, xmm1, xmm1
0x10009809b: vmulss xmm2, xmm1, xmm2
0x10009809f: vmulss xmm3, xmm1, dword ptr [rip + 0xa0e9fd] ; 0x100aa6aa4
0x1000980a7: vaddss xmm3, xmm3, dword ptr [rip + 0xa115cd] ; 0x100aa967c
0x1000980af: vmulss xmm1, xmm1, xmm3
0x1000980b3: vaddss xmm1, xmm1, dword ptr [rip + 0xa0f721] ; 0x100aa77dc
0x1000980bb: vmulss xmm1, xmm2, xmm1
0x1000980bf: vmovss dword ptr [rbx + 0x14], xmm1
0x1000980c4: vucomiss xmm1, xmm0
0x1000980c8: jb 0x1000980da
0x1000980ca: cmp dword ptr [rbx + 0xc], -1
0x1000980ce: jne 0x1000980da
0x1000980d0: mov byte ptr [rbx + 0x60], 0
0x1000980d4: mov dword ptr [rbx], 0
0x1000980da: vsubss xmm2, xmm0, dword ptr [r14]
0x1000980df: vmulss xmm1, xmm1, xmm2
0x1000980e3: vmovss dword ptr [rbx + 0x14], xmm1
0x1000980e8: vmovss xmm2, dword ptr [r14]
0x1000980ed: vucomiss xmm2, xmm0
0x1000980f1: jb 0x10009810d
0x1000980f3: mov dword ptr [rbx + 0x14], 0
0x1000980fa: mov byte ptr [rbx + 0x60], 0
0x1000980fe: mov dword ptr [rbx], 0
0x100098104: vmovss xmm2, dword ptr [r14]
0x100098109: vxorps xmm1, xmm1, xmm1
0x10009810d: vaddss xmm0, xmm1, xmm2
0x100098111: vmovss dword ptr [r14], xmm0
0x100098116: vmovss xmm0, dword ptr [rbx + 0x18]
0x10009811b: vmulss xmm0, xmm0, dword ptr [rbx + 0x14]
0x100098120: vmovss dword ptr [rbx + 0x14], xmm0
0x100098125: add rsp, 0x30
0x100098129: pop rbx
0x10009812a: pop r12
0x10009812c: pop r14
0x10009812e: pop r15
0x100098130: pop rbp
0x100098131: ret 
0x100098132: nop 
