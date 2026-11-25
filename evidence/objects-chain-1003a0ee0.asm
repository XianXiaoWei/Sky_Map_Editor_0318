0x1003a0ee0: push rbp
0x1003a0ee1: mov rbp, rsp
0x1003a0ee4: push r15
0x1003a0ee6: push r14
0x1003a0ee8: push r12
0x1003a0eea: push rbx
0x1003a0eeb: sub rsp, 0x40
0x1003a0eef: mov r14, rsi
0x1003a0ef2: mov r15, rdi
0x1003a0ef5: vmovss xmm0, dword ptr [r15 + 0x40]
0x1003a0efb: vmovss xmm1, dword ptr [r15 + 0x44]
0x1003a0f01: vmovss dword ptr [rbp - 0x24], xmm1
0x1003a0f06: vaddss xmm0, xmm0, dword ptr [r15 + 0x48]
0x1003a0f0c: vmovss dword ptr [rbp - 0x28], xmm0
0x1003a0f11: mov rsi, qword ptr [r14 + 0x298]
0x1003a0f18: lea rdi, [rbp - 0x50]
0x1003a0f1c: xor ebx, ebx
0x1003a0f1e: xor edx, edx
0x1003a0f20: call 0x1001e2ac0 ; 0x1001e2ac0
0x1003a0f25: mov rax, qword ptr [rbp - 0x50]
0x1003a0f29: test rax, rax
0x1003a0f2c: je 0x1003a0f73
0x1003a0f2e: mov rbx, qword ptr [rax + 0x10]
0x1003a0f32: mov rcx, qword ptr [rbp - 0x48]
0x1003a0f36: mov rdx, qword ptr [rbp - 0x40]
0x1003a0f3a: test rdx, rdx
0x1003a0f3d: lea rdx, [rdx + 8]
0x1003a0f41: cmove rdx, rax
0x1003a0f45: mov qword ptr [rdx], rcx
0x1003a0f48: mov rcx, qword ptr [rbp - 0x48]
0x1003a0f4c: mov rdx, qword ptr [rbp - 0x40]
0x1003a0f50: add rax, 8
0x1003a0f54: test rcx, rcx
0x1003a0f57: lea rcx, [rcx + 0x10]
0x1003a0f5b: cmove rcx, rax
0x1003a0f5f: mov qword ptr [rcx], rdx
0x1003a0f62: vxorps xmm0, xmm0, xmm0
0x1003a0f66: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1003a0f6b: mov qword ptr [rbp - 0x40], 0
0x1003a0f73: vmovss xmm0, dword ptr [rbp - 0x24]
0x1003a0f78: vmovss xmm1, dword ptr [rbp - 0x28]
0x1003a0f7d: vaddss xmm0, xmm1, xmm0
0x1003a0f81: vmovss dword ptr [rbp - 0x24], xmm0
0x1003a0f86: mov qword ptr [rbp - 0x58], rbx
0x1003a0f8a: call 0x1001ddff0 ; 0x1001ddff0
0x1003a0f8f: mov r12, rax
0x1003a0f92: mov qword ptr [rbp - 0x50], 0
0x1003a0f9a: call 0x10073aa80 ; 0x10073aa80
0x1003a0f9f: mov rbx, qword ptr [rax]
0x1003a0fa2: lea rsi, [rbp - 0x50]
0x1003a0fa6: lea rdx, [rbp - 0x58]
0x1003a0faa: mov rdi, rax
0x1003a0fad: mov rcx, r12
0x1003a0fb0: call qword ptr [rbx + 0x40]
0x1003a0fb3: mov rax, qword ptr [rbp - 0x50]
0x1003a0fb7: test rax, rax
0x1003a0fba: je 0x1003a1010
0x1003a0fbc: vmovss xmm1, dword ptr [r15 + 0x40]
0x1003a0fc2: vmovss xmm0, dword ptr [r15 + 0x4c]
0x1003a0fc8: vucomiss xmm1, xmm0
0x1003a0fcc: jbe 0x1003a102e
0x1003a0fce: vdivss xmm2, xmm0, xmm1
0x1003a0fd2: vcmpltss xmm3, xmm1, dword ptr [rip + 0x7085f5] ; 0x100aa95d0
0x1003a0fdb: vandps xmm4, xmm3, xmm2
0x1003a0fdf: vmovss xmm5, dword ptr [rip + 0x7040d9] ; 0x100aa50c0
0x1003a0fe7: vandnps xmm3, xmm3, xmm5
0x1003a0feb: vorps xmm3, xmm3, xmm4
0x1003a0fef: vmovss xmm4, dword ptr [rip + 0x7068cd] ; 0x100aa78c4
0x1003a0ff7: vcmpltss xmm1, xmm4, xmm1
0x1003a0ffc: vblendvps xmm1, xmm3, xmm2, xmm1
0x1003a1002: vxorps xmm2, xmm2, xmm2
0x1003a1006: vmaxss xmm1, xmm2, xmm1
0x1003a100a: vminss xmm1, xmm5, xmm1
0x1003a100e: jmp 0x1003a1089 ; 0x1003a1089
0x1003a1010: lea rbx, [r15 + 0x4c]
0x1003a1014: vmovss xmm0, dword ptr [r15 + 0x4c]
0x1003a101a: vmovss xmm5, dword ptr [rbp - 0x24]
0x1003a101f: vucomiss xmm0, xmm5
0x1003a1023: ja 0x1003a10ab
0x1003a1029: jmp 0x1003a10b9 ; 0x1003a10b9
0x1003a102e: vaddss xmm2, xmm1, dword ptr [r15 + 0x48]
0x1003a1034: vucomiss xmm0, xmm2
0x1003a1038: jbe 0x1003a1081
0x1003a103a: vmovss xmm5, dword ptr [rbp - 0x24]
0x1003a103f: vsubss xmm3, xmm5, xmm2
0x1003a1043: vucomiss xmm3, dword ptr [rip + 0x706879] ; 0x100aa78c4
0x1003a104b: vmovss xmm1, dword ptr [rip + 0x70406d] ; 0x100aa50c0
0x1003a1053: ja 0x1003a1067
0x1003a1055: vmovss xmm4, dword ptr [rip + 0x708573] ; 0x100aa95d0
0x1003a105d: vucomiss xmm4, xmm3
0x1003a1061: vmovaps xmm4, xmm1
0x1003a1065: jbe 0x1003a106f
0x1003a1067: vsubss xmm2, xmm0, xmm2
0x1003a106b: vdivss xmm4, xmm2, xmm3
0x1003a106f: vxorps xmm2, xmm2, xmm2
0x1003a1073: vmaxss xmm2, xmm2, xmm4
0x1003a1077: vminss xmm2, xmm1, xmm2
0x1003a107b: vsubss xmm1, xmm1, xmm2
0x1003a107f: jmp 0x1003a108e ; 0x1003a108e
0x1003a1081: vmovss xmm1, dword ptr [rip + 0x704037] ; 0x100aa50c0
0x1003a1089: vmovss xmm5, dword ptr [rbp - 0x24]
0x1003a108e: lea rbx, [r15 + 0x4c]
0x1003a1092: mov rcx, qword ptr [r15 + 0x38]
0x1003a1096: vmovss dword ptr [rax + 0x380], xmm1
0x1003a109e: mov qword ptr [rax + 0x378], rcx
0x1003a10a5: vucomiss xmm0, xmm5
0x1003a10a9: jbe 0x1003a10b9
0x1003a10ab: mov rdi, r15
0x1003a10ae: call 0x10032ef60 ; 0x10032ef60
0x1003a10b3: vmovss xmm0, dword ptr [r15 + 0x4c]
0x1003a10b9: mov rax, qword ptr [r14 + 0x160]
0x1003a10c0: lea rcx, [rip + 0x1c5a009] ; 0x101ffb0d0
0x1003a10c7: cmp byte ptr [rcx], 0
0x1003a10ca: je 0x1003a10d9
0x1003a10cc: lea rcx, [rip + 0x91746d] ; 0x100cb8540
0x1003a10d3: vmovss xmm1, dword ptr [rcx]
0x1003a10d7: jmp 0x1003a10e1 ; 0x1003a10e1
0x1003a10d9: vmovss xmm1, dword ptr [rip + 0x703fdf] ; 0x100aa50c0
0x1003a10e1: vmulss xmm1, xmm1, dword ptr [rax + 0x20]
0x1003a10e6: vmulss xmm1, xmm1, dword ptr [rax + 0x14]
0x1003a10eb: vmovss xmm2, dword ptr [rip + 0x7059a9] ; 0x100aa6a9c
0x1003a10f3: vmaxss xmm1, xmm2, xmm1
0x1003a10f7: vmovss xmm2, dword ptr [rip + 0x7059a1] ; 0x100aa6aa0
0x1003a10ff: vminss xmm1, xmm2, xmm1
0x1003a1103: vaddss xmm0, xmm0, xmm1
0x1003a1107: vmovss dword ptr [rbx], xmm0
0x1003a110b: add rsp, 0x40
0x1003a110f: pop rbx
0x1003a1110: pop r12
0x1003a1112: pop r14
0x1003a1114: pop r15
0x1003a1116: pop rbp
0x1003a1117: ret 
0x1003a1118: nop dword ptr [rax + rax]
