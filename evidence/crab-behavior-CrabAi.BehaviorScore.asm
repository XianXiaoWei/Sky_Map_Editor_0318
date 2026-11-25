0x100258790: push rbp
0x100258791: mov rbp, rsp
0x100258794: push r15
0x100258796: push r14
0x100258798: push r13
0x10025879a: push r12
0x10025879c: push rbx
0x10025879d: sub rsp, 0xd8
0x1002587a4: mov rbx, rsi
0x1002587a7: mov r14, rdi
0x1002587aa: mov rax, qword ptr [r14 + 0x10]
0x1002587ae: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x1002587b3: vmovss xmm2, dword ptr [rax + 0x60]
0x1002587b8: vmovss xmm1, dword ptr [rax + 0x64]
0x1002587bd: mov r12, qword ptr [rax + 0x80]
0x1002587c4: lea r15, [rbx + 8]
0x1002587c8: cmp qword ptr [rbx + 8], 0
0x1002587cd: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1002587d2: vmovss dword ptr [rbp - 0x44], xmm1
0x1002587d7: vmovaps xmmword ptr [rbp - 0xc0], xmm2
0x1002587df: je 0x100258836
0x1002587e1: call 0x1007abc10 ; 0x1007abc10
0x1002587e6: mov qword ptr [rbp - 0xb0], 0
0x1002587f1: mov rdi, qword ptr [rip + 0x1b8d468] ; 0x101de5c60
0x1002587f8: mov r8, qword ptr [rdi]
0x1002587fb: lea rsi, [rbp - 0xb0]
0x100258802: mov rdx, r15
0x100258805: mov rcx, rax
0x100258808: call qword ptr [r8 + 0x40]
0x10025880c: mov r13, qword ptr [rbp - 0xb0]
0x100258813: mov rsi, qword ptr [r15]
0x100258816: lea rdi, [rbp - 0xb0]
0x10025881d: call 0x10062e430 ; 0x10062e430
0x100258822: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x10025882a: vmovaps xmm1, xmmword ptr [rbp - 0x70]
0x10025882f: vmovss xmm2, dword ptr [rbp - 0x60]
0x100258834: jmp 0x10025884a ; 0x10025884a
0x100258836: vmovaps xmm0, xmmword ptr [rbx + 0x20]
0x10025883b: vmovss xmm2, dword ptr [rip + 0x84c87d] ; 0x100aa50c0
0x100258843: vxorps xmm1, xmm1, xmm1
0x100258847: xor r13d, r13d
0x10025884a: mov ecx, dword ptr [rbx]
0x10025884c: mov eax, 0x3f800000
0x100258851: dec ecx
0x100258853: cmp ecx, 0xa
0x100258856: ja 0x100258ea4
0x10025885c: lea rdx, [rip + 0x66d] ; 0x100258ed0
0x100258863: movsxd rcx, dword ptr [rdx + rcx*4]
0x100258867: add rcx, rdx
0x10025886a: jmp rcx
0x10025886c: vmovaps xmm3, xmmword ptr [rbp - 0x40]
0x100258871: vsubps xmm1, xmm0, xmm3
0x100258875: vmulps xmm1, xmm1, xmm1
0x100258879: vmovshdup xmm2, xmm1
0x10025887d: vaddss xmm2, xmm1, xmm2
0x100258881: vpermilpd xmm1, xmm1, 1
0x100258887: vaddss xmm1, xmm1, xmm2
0x10025888b: vsqrtss xmm1, xmm1, xmm1
0x10025888f: vmovshdup xmm0, xmm0
0x100258893: vmovshdup xmm2, xmm3
0x100258897: vsubss xmm0, xmm0, xmm2
0x10025889b: lea rax, [rip + 0x868f96] ; 0x100ac1838
0x1002588a2: vcmpltss xmm0, xmm0, dword ptr [rax]
0x1002588a7: vmovss xmm2, dword ptr [rip + 0x84ef2d] ; 0x100aa77dc
0x1002588af: vandps xmm0, xmm0, xmm2
0x1002588b3: vsubss xmm0, xmm0, xmm1
0x1002588b7: vaddss xmm0, xmm0, dword ptr [rip + 0x84c805] ; 0x100aa50c4
0x1002588bf: vmulss xmm0, xmm0, dword ptr [rip + 0x84fd59] ; 0x100aa8620
0x1002588c7: vxorps xmm1, xmm1, xmm1
0x1002588cb: vmaxss xmm0, xmm1, xmm0
0x1002588cf: vmovss xmm1, dword ptr [rip + 0x84c7e9] ; 0x100aa50c0
0x1002588d7: vminss xmm0, xmm1, xmm0
0x1002588db: vmulss xmm3, xmm0, xmm0
0x1002588df: vmulss xmm3, xmm0, xmm3
0x1002588e3: vmulss xmm4, xmm0, dword ptr [rip + 0x84e1b9] ; 0x100aa6aa4
0x1002588eb: vaddss xmm4, xmm4, dword ptr [rip + 0x850d89] ; 0x100aa967c
0x1002588f3: vmulss xmm0, xmm0, xmm4
0x1002588f7: vaddss xmm0, xmm0, xmm2
0x1002588fb: vmulss xmm0, xmm3, xmm0
0x1002588ff: vsubss xmm0, xmm1, xmm0
0x100258903: jmp 0x100258ea0 ; 0x100258ea0
0x100258908: test r13, r13
0x10025890b: je 0x100258d25
0x100258911: cmp qword ptr [r13 + 0x80], r12
0x100258918: setne al
0x10025891b: jmp 0x100258d27 ; 0x100258d27
0x100258920: call 0x1007abc10 ; 0x1007abc10
0x100258925: mov r12, rax
0x100258928: mov qword ptr [rbp - 0xb0], 0
0x100258933: call 0x10043ccc0 ; 0x10043ccc0
0x100258938: mov rbx, qword ptr [rax]
0x10025893b: lea rsi, [rbp - 0xb0]
0x100258942: mov rdi, rax
0x100258945: mov rdx, r15
0x100258948: mov rcx, r12
0x10025894b: call qword ptr [rbx + 0x40]
0x10025894e: mov rbx, qword ptr [rbp - 0xb0]
0x100258955: mov r14d, dword ptr [r14 + 0x50]
0x100258959: test rbx, rbx
0x10025895c: je 0x100258eba
0x100258962: mov rax, qword ptr [rbx]
0x100258965: lea rdi, [rbp - 0xb0]
0x10025896c: mov rsi, rbx
0x10025896f: call qword ptr [rax + 0x18]
0x100258972: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x100258977: vsubps xmm0, xmm0, xmmword ptr [rbp - 0x40]
0x10025897c: vmulps xmm0, xmm0, xmm0
0x100258980: vmovshdup xmm1, xmm0
0x100258984: vaddss xmm1, xmm0, xmm1
0x100258988: vpermilpd xmm0, xmm0, 1
0x10025898e: vaddss xmm0, xmm0, xmm1
0x100258992: vsqrtss xmm0, xmm0, xmm0
0x100258996: vmovss dword ptr [rbp - 0x40], xmm0
0x10025899b: mov rax, qword ptr [rbx]
0x10025899e: lea rdi, [rbp - 0x100]
0x1002589a5: mov rsi, rbx
0x1002589a8: call qword ptr [rax + 0x18]
0x1002589ab: vmovaps xmm0, xmmword ptr [rbp - 0xe0]
0x1002589b3: vmulps xmm0, xmm0, xmm0
0x1002589b7: vpermilpd xmm1, xmm0, 1
0x1002589bd: vaddps xmm0, xmm0, xmm1
0x1002589c1: vmovshdup xmm1, xmm0
0x1002589c5: vaddss xmm0, xmm0, xmm1
0x1002589c9: vsqrtss xmm0, xmm0, xmm0
0x1002589cd: vaddss xmm0, xmm0, xmm0
0x1002589d1: vsubss xmm0, xmm0, dword ptr [rbp - 0x40]
0x1002589d6: vaddss xmm0, xmm0, dword ptr [rip + 0x84fc86] ; 0x100aa8664
0x1002589de: vdivss xmm0, xmm0, dword ptr [rip + 0x85080e] ; 0x100aa91f4
0x1002589e6: vxorps xmm1, xmm1, xmm1
0x1002589ea: vmaxss xmm0, xmm1, xmm0
0x1002589ee: vmovss xmm1, dword ptr [rip + 0x84c6ca] ; 0x100aa50c0
0x1002589f6: vminss xmm0, xmm1, xmm0
0x1002589fa: vmulss xmm2, xmm0, xmm0
0x1002589fe: vmulss xmm2, xmm0, xmm2
0x100258a02: vmulss xmm3, xmm0, dword ptr [rip + 0x84e09a] ; 0x100aa6aa4
0x100258a0a: vaddss xmm3, xmm3, dword ptr [rip + 0x850c6a] ; 0x100aa967c
0x100258a12: vmulss xmm0, xmm0, xmm3
0x100258a16: vaddss xmm0, xmm0, dword ptr [rip + 0x84edbe] ; 0x100aa77dc
0x100258a1e: vmulss xmm0, xmm2, xmm0
0x100258a22: vsubss xmm0, xmm1, xmm0
0x100258a26: vmovd ecx, xmm0
0x100258a2a: jmp 0x100258ebc ; 0x100258ebc
0x100258a2f: vmovaps xmm0, xmmword ptr [r14 + 0x30]
0x100258a35: vsubps xmm0, xmm0, xmmword ptr [rbp - 0x40]
0x100258a3a: vmulps xmm0, xmm0, xmm0
0x100258a3e: vmovshdup xmm1, xmm0
0x100258a42: vaddss xmm1, xmm0, xmm1
0x100258a46: vpermilpd xmm0, xmm0, 1
0x100258a4c: vaddss xmm0, xmm0, xmm1
0x100258a50: vsqrtss xmm0, xmm0, xmm0
0x100258a54: vaddss xmm0, xmm0, dword ptr [rip + 0x84fc04] ; 0x100aa8660
0x100258a5c: vaddss xmm0, xmm0, dword ptr [rip + 0x84fc00] ; 0x100aa8664
0x100258a64: vdivss xmm0, xmm0, dword ptr [rip + 0x850788] ; 0x100aa91f4
0x100258a6c: vxorps xmm1, xmm1, xmm1
0x100258a70: vmaxss xmm0, xmm1, xmm0
0x100258a74: vmovss xmm1, dword ptr [rip + 0x84c644] ; 0x100aa50c0
0x100258a7c: vminss xmm0, xmm1, xmm0
0x100258a80: vmulss xmm2, xmm0, xmm0
0x100258a84: vmulss xmm2, xmm0, xmm2
0x100258a88: vmulss xmm3, xmm0, dword ptr [rip + 0x84e014] ; 0x100aa6aa4
0x100258a90: vaddss xmm3, xmm3, dword ptr [rip + 0x850be4] ; 0x100aa967c
0x100258a98: vmulss xmm0, xmm0, xmm3
0x100258a9c: vaddss xmm0, xmm0, dword ptr [rip + 0x84ed38] ; 0x100aa77dc
0x100258aa4: vmulss xmm0, xmm2, xmm0
0x100258aa8: vsubss xmm0, xmm1, xmm0
0x100258aac: jmp 0x100258ea0 ; 0x100258ea0
0x100258ab1: cmp dword ptr [r14 + 0x50], 9
0x100258ab6: jne 0x100258b55
0x100258abc: mov eax, dword ptr [r14 + 0x60]
0x100258ac0: cmp eax, dword ptr [rbx + 0x10]
0x100258ac3: sete al
0x100258ac6: mov rcx, qword ptr [r14 + 0x18]
0x100258aca: test rcx, rcx
0x100258acd: je 0x100258b64
0x100258ad3: add rcx, 0x10
0x100258ad7: jmp 0x100258b78 ; 0x100258b78
0x100258adc: call 0x1007abc10 ; 0x1007abc10
0x100258ae1: mov qword ptr [rbp - 0xb0], 0
0x100258aec: mov rdi, qword ptr [rip + 0x1b8d16d] ; 0x101de5c60
0x100258af3: mov rbx, qword ptr [rdi]
0x100258af6: lea rsi, [rbp - 0xb0]
0x100258afd: mov rdx, r15
0x100258b00: mov rcx, rax
0x100258b03: call qword ptr [rbx + 0x40]
0x100258b06: mov r12, qword ptr [rbp - 0xb0]
0x100258b0d: cmp dword ptr [r14 + 0x50], 0xb
0x100258b12: jne 0x100258c29
0x100258b18: add r14, 0x58
0x100258b1c: call 0x1007abc10 ; 0x1007abc10
0x100258b21: mov qword ptr [rbp - 0xb0], 0
0x100258b2c: mov rdi, qword ptr [rip + 0x1b8d12d] ; 0x101de5c60
0x100258b33: mov rbx, qword ptr [rdi]
0x100258b36: lea rsi, [rbp - 0xb0]
0x100258b3d: mov rdx, r14
0x100258b40: mov rcx, rax
0x100258b43: call qword ptr [rbx + 0x40]
0x100258b46: cmp qword ptr [rbp - 0xb0], r12
0x100258b4d: sete bl
0x100258b50: jmp 0x100258c2b ; 0x100258c2b
0x100258b55: xor eax, eax
0x100258b57: mov rcx, qword ptr [r14 + 0x18]
0x100258b5b: test rcx, rcx
0x100258b5e: jne 0x100258ad3
0x100258b64: mov rcx, qword ptr [r14 + 0x20]
0x100258b68: test rcx, rcx
0x100258b6b: je 0x100258eca
0x100258b71: add rcx, 0xc0
0x100258b78: vmovaps xmm0, xmmword ptr [rcx]
0x100258b7c: vsubps xmm0, xmm0, xmmword ptr [rbp - 0x40]
0x100258b81: vmulps xmm0, xmm0, xmm0
0x100258b85: vmovshdup xmm1, xmm0
0x100258b89: vaddss xmm1, xmm0, xmm1
0x100258b8d: vpermilpd xmm0, xmm0, 1
0x100258b93: vaddss xmm0, xmm0, xmm1
0x100258b97: vsqrtss xmm0, xmm0, xmm0
0x100258b9b: vmovss xmm1, dword ptr [rip + 0x850acd] ; 0x100aa9670
0x100258ba3: vsubss xmm0, xmm1, xmm0
0x100258ba7: vaddss xmm0, xmm0, dword ptr [rip + 0x850ad5] ; 0x100aa9684
0x100258baf: vmulss xmm0, xmm0, dword ptr [rip + 0x84fae1] ; 0x100aa8698
0x100258bb7: vxorps xmm1, xmm1, xmm1
0x100258bbb: vmaxss xmm0, xmm1, xmm0
0x100258bbf: vmovss xmm2, dword ptr [rip + 0x84c4f9] ; 0x100aa50c0
0x100258bc7: vminss xmm0, xmm2, xmm0
0x100258bcb: vmulss xmm3, xmm0, xmm0
0x100258bcf: vmulss xmm3, xmm0, xmm3
0x100258bd3: vmulss xmm4, xmm0, dword ptr [rip + 0x84dec9] ; 0x100aa6aa4
0x100258bdb: vaddss xmm4, xmm4, dword ptr [rip + 0x850a99] ; 0x100aa967c
0x100258be3: vmulss xmm0, xmm0, xmm4
0x100258be7: vaddss xmm0, xmm0, dword ptr [rip + 0x84ebed] ; 0x100aa77dc
0x100258bef: vmulss xmm0, xmm3, xmm0
0x100258bf3: vsubss xmm0, xmm2, xmm0
0x100258bf7: test al, al
0x100258bf9: jne 0x100258d1c
0x100258bff: mov eax, dword ptr [r14 + 0x64]
0x100258c03: vcvtsi2ss xmm2, xmm5, rax
0x100258c08: vmovss xmm3, dword ptr [rip + 0x84de9c] ; 0x100aa6aac
0x100258c10: vsubss xmm2, xmm3, xmm2
0x100258c14: vaddss xmm2, xmm2, dword ptr [rip + 0x84c4a8] ; 0x100aa50c4
0x100258c1c: vmulss xmm2, xmm2, dword ptr [rip + 0x84f9fc] ; 0x100aa8620
0x100258c24: jmp 0x100258ce0 ; 0x100258ce0
0x100258c29: xor ebx, ebx
0x100258c2b: mov rsi, qword ptr [r15]
0x100258c2e: lea rdi, [rbp - 0xb0]
0x100258c35: call 0x10062e430 ; 0x10062e430
0x100258c3a: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x100258c42: vsubps xmm0, xmm0, xmmword ptr [rbp - 0x40]
0x100258c47: vmulps xmm0, xmm0, xmm0
0x100258c4b: vmovshdup xmm1, xmm0
0x100258c4f: vaddss xmm1, xmm0, xmm1
0x100258c53: vpermilpd xmm0, xmm0, 1
0x100258c59: vaddss xmm0, xmm0, xmm1
0x100258c5d: vsqrtss xmm0, xmm0, xmm0
0x100258c61: vaddss xmm0, xmm0, dword ptr [rip + 0x84fa27] ; 0x100aa8690
0x100258c69: vaddss xmm0, xmm0, dword ptr [rip + 0x850a13] ; 0x100aa9684
0x100258c71: vmulss xmm0, xmm0, dword ptr [rip + 0x84fa1f] ; 0x100aa8698
0x100258c79: vxorps xmm1, xmm1, xmm1
0x100258c7d: vmaxss xmm0, xmm1, xmm0
0x100258c81: vmovss xmm2, dword ptr [rip + 0x84c437] ; 0x100aa50c0
0x100258c89: vminss xmm0, xmm2, xmm0
0x100258c8d: vmulss xmm3, xmm0, xmm0
0x100258c91: vmulss xmm3, xmm0, xmm3
0x100258c95: vmulss xmm4, xmm0, dword ptr [rip + 0x84de07] ; 0x100aa6aa4
0x100258c9d: vaddss xmm4, xmm4, dword ptr [rip + 0x8509d7] ; 0x100aa967c
0x100258ca5: vmulss xmm0, xmm0, xmm4
0x100258ca9: vaddss xmm0, xmm0, dword ptr [rip + 0x84eb2b] ; 0x100aa77dc
0x100258cb1: vmulss xmm0, xmm3, xmm0
0x100258cb5: vsubss xmm0, xmm2, xmm0
0x100258cb9: test bl, bl
0x100258cbb: jne 0x100258d1c
0x100258cbd: vcvtsi2ss xmm2, xmm5, dword ptr [r12 + 0x78]
0x100258cc4: vmovss xmm3, dword ptr [rip + 0x851ef0] ; 0x100aaabbc
0x100258ccc: vsubss xmm2, xmm3, xmm2
0x100258cd0: vaddss xmm2, xmm2, dword ptr [rip + 0x84fce8] ; 0x100aa89c0
0x100258cd8: vdivss xmm2, xmm2, dword ptr [rip + 0x852b14] ; 0x100aab7f4
0x100258ce0: vmaxss xmm1, xmm1, xmm2
0x100258ce4: vmovss xmm2, dword ptr [rip + 0x84c3d4] ; 0x100aa50c0
0x100258cec: vminss xmm1, xmm2, xmm1
0x100258cf0: vmulss xmm3, xmm1, xmm1
0x100258cf4: vmulss xmm3, xmm1, xmm3
0x100258cf8: vmulss xmm4, xmm1, dword ptr [rip + 0x84dda4] ; 0x100aa6aa4
0x100258d00: vaddss xmm4, xmm4, dword ptr [rip + 0x850974] ; 0x100aa967c
0x100258d08: vmulss xmm1, xmm1, xmm4
0x100258d0c: vaddss xmm1, xmm1, dword ptr [rip + 0x84eac8] ; 0x100aa77dc
0x100258d14: vmulss xmm1, xmm3, xmm1
0x100258d18: vsubss xmm2, xmm2, xmm1
0x100258d1c: vmulss xmm0, xmm0, xmm2
0x100258d20: jmp 0x100258ea0 ; 0x100258ea0
0x100258d25: mov al, 1
0x100258d27: vmovaps xmm5, xmmword ptr [rbp - 0xc0]
0x100258d2f: vxorps xmm3, xmm3, xmm3
0x100258d33: vucomiss xmm3, xmm5
0x100258d37: jae 0x100258d98
0x100258d39: vsubss xmm2, xmm2, xmm5
0x100258d3d: vxorps xmm4, xmm5, xmmword ptr [rip + 0x84ebbb] ; 0x100aa7900
0x100258d45: vsubss xmm2, xmm2, xmm5
0x100258d49: vsubss xmm4, xmm4, xmm5
0x100258d4d: vdivss xmm2, xmm2, xmm4
0x100258d51: vmaxss xmm2, xmm3, xmm2
0x100258d55: vmovss xmm3, dword ptr [rip + 0x84c363] ; 0x100aa50c0
0x100258d5d: vminss xmm2, xmm3, xmm2
0x100258d61: vmulss xmm4, xmm2, xmm2
0x100258d65: vmulss xmm4, xmm2, xmm4
0x100258d69: vmulss xmm5, xmm2, dword ptr [rip + 0x84dd33] ; 0x100aa6aa4
0x100258d71: vaddss xmm5, xmm5, dword ptr [rip + 0x850903] ; 0x100aa967c
0x100258d79: vmulss xmm2, xmm2, xmm5
0x100258d7d: vaddss xmm2, xmm2, dword ptr [rip + 0x84ea57] ; 0x100aa77dc
0x100258d85: vmulss xmm2, xmm4, xmm2
0x100258d89: vsubss xmm3, xmm3, xmm2
0x100258d8d: vxorps xmm8, xmm8, xmm8
0x100258d92: test al, al
0x100258d94: je 0x100258db2
0x100258d96: jmp 0x100258db6 ; 0x100258db6
0x100258d98: vcmpless xmm2, xmm5, xmm2
0x100258d9d: vmovss xmm3, dword ptr [rip + 0x84c31b] ; 0x100aa50c0
0x100258da5: vandps xmm3, xmm2, xmm3
0x100258da9: vxorps xmm8, xmm8, xmm8
0x100258dae: test al, al
0x100258db0: jne 0x100258db6
0x100258db2: vxorps xmm3, xmm3, xmm3
0x100258db6: vmulps xmm1, xmm1, xmm1
0x100258dba: vmovshdup xmm4, xmm1
0x100258dbe: vaddss xmm4, xmm1, xmm4
0x100258dc2: vpermilpd xmm1, xmm1, 1
0x100258dc8: vaddss xmm1, xmm1, xmm4
0x100258dcc: vsqrtss xmm1, xmm1, xmm1
0x100258dd0: vsubss xmm1, xmm1, dword ptr [rbp - 0x44]
0x100258dd5: vaddss xmm1, xmm1, dword ptr [rip + 0x84c2e7] ; 0x100aa50c4
0x100258ddd: vmulss xmm1, xmm1, dword ptr [rip + 0x84f83b] ; 0x100aa8620
0x100258de5: vmaxss xmm4, xmm8, xmm1
0x100258de9: vmovss xmm1, dword ptr [rip + 0x84c2cf] ; 0x100aa50c0
0x100258df1: vminss xmm4, xmm1, xmm4
0x100258df5: vmulss xmm5, xmm4, xmm4
0x100258df9: vmulss xmm5, xmm4, xmm5
0x100258dfd: vmovss xmm6, dword ptr [rip + 0x84dc9f] ; 0x100aa6aa4
0x100258e05: vmulss xmm7, xmm4, xmm6
0x100258e09: vmovss xmm2, dword ptr [rip + 0x85086b] ; 0x100aa967c
0x100258e11: vaddss xmm7, xmm7, xmm2
0x100258e15: vmulss xmm4, xmm4, xmm7
0x100258e19: vmovss xmm7, dword ptr [rip + 0x84e9bb] ; 0x100aa77dc
0x100258e21: vaddss xmm4, xmm4, xmm7
0x100258e25: vmulss xmm4, xmm5, xmm4
0x100258e29: vmulss xmm4, xmm4, dword ptr [rip + 0x853107] ; 0x100aabf38
0x100258e31: vaddss xmm4, xmm4, xmm1
0x100258e35: vmulss xmm3, xmm3, xmm4
0x100258e39: vsubps xmm0, xmm0, xmmword ptr [rbp - 0x40]
0x100258e3e: vmulps xmm0, xmm0, xmm0
0x100258e42: vmovshdup xmm4, xmm0
0x100258e46: vaddss xmm4, xmm0, xmm4
0x100258e4a: vpermilpd xmm0, xmm0, 1
0x100258e50: vaddss xmm0, xmm0, xmm4
0x100258e54: vsqrtss xmm0, xmm0, xmm0
0x100258e58: vmovss xmm4, dword ptr [rip + 0x84ea5c] ; 0x100aa78bc
0x100258e60: vsubss xmm0, xmm4, xmm0
0x100258e64: vaddss xmm0, xmm0, dword ptr [rip + 0x8529ac] ; 0x100aab818
0x100258e6c: vdivss xmm0, xmm0, dword ptr [rip + 0x84f7ec] ; 0x100aa8660
0x100258e74: vmaxss xmm0, xmm8, xmm0
0x100258e78: vminss xmm0, xmm1, xmm0
0x100258e7c: vmulss xmm4, xmm0, xmm0
0x100258e80: vmulss xmm4, xmm0, xmm4
0x100258e84: vmulss xmm5, xmm0, xmm6
0x100258e88: vaddss xmm2, xmm5, xmm2
0x100258e8c: vmulss xmm0, xmm0, xmm2
0x100258e90: vaddss xmm0, xmm0, xmm7
0x100258e94: vmulss xmm0, xmm4, xmm0
0x100258e98: vsubss xmm0, xmm1, xmm0
0x100258e9c: vmulss xmm0, xmm0, xmm3
0x100258ea0: vmovd eax, xmm0
0x100258ea4: vmovd xmm0, eax
0x100258ea8: add rsp, 0xd8
0x100258eaf: pop rbx
0x100258eb0: pop r12
0x100258eb2: pop r13
0x100258eb4: pop r14
0x100258eb6: pop r15
0x100258eb8: pop rbp
0x100258eb9: ret 
0x100258eba: xor ecx, ecx
0x100258ebc: cmp r14d, 3
0x100258ec0: mov eax, 0x3f800000
0x100258ec5: cmovne eax, ecx
0x100258ec8: jmp 0x100258ea4 ; 0x100258ea4
0x100258eca: xor eax, eax
0x100258ecc: jmp 0x100258ea4 ; 0x100258ea4
0x100258ece: nop 
