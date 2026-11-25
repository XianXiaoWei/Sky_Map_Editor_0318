0x1002149c0: push rbp
0x1002149c1: mov rbp, rsp
0x1002149c4: push r15
0x1002149c6: push r14
0x1002149c8: push r12
0x1002149ca: push rbx
0x1002149cb: sub rsp, 0x80
0x1002149d2: mov r15d, r8d
0x1002149d5: mov r12, rcx
0x1002149d8: mov r14, rdx
0x1002149db: mov rbx, rdi
0x1002149de: vmovaps xmm2, xmmword ptr [rsi]
0x1002149e2: vmovaps xmmword ptr [rbp - 0x90], xmm2
0x1002149ea: vmovaps xmmword ptr [rbp - 0x50], xmm2
0x1002149ef: vmovss xmm0, dword ptr [rbx + 0x40dd0]
0x1002149f7: vcvtss2sd xmm0, xmm0, xmm0
0x1002149fb: vmovsd qword ptr [rbp - 0x70], xmm0
0x100214a00: vmulsd xmm0, xmm0, qword ptr [rip + 0x89c990] ; 0x100ab1398
0x100214a08: vmovshdup xmm1, xmm2
0x100214a0c: vmovaps xmmword ptr [rbp - 0xa0], xmm1
0x100214a14: vcvtss2sd xmm3, xmm1, xmm1
0x100214a18: vmovsd qword ptr [rbp - 0x78], xmm3
0x100214a1d: vcvtss2sd xmm1, xmm2, xmm2
0x100214a21: vmovsd qword ptr [rbp - 0x58], xmm1
0x100214a26: vmulsd xmm1, xmm1, qword ptr [rip + 0x89721a] ; 0x100aabc48
0x100214a2e: vaddsd xmm1, xmm1, xmm3
0x100214a32: vmulsd xmm1, xmm1, qword ptr [rip + 0x89c966] ; 0x100ab13a0
0x100214a3a: vaddsd xmm0, xmm0, xmm1
0x100214a3e: vcvtsd2ss xmm0, xmm0, xmm0
0x100214a42: call 0x100aa2bca ; 0x100aa2bca _sinf
0x100214a47: vcvtss2sd xmm0, xmm0, xmm0
0x100214a4b: vmulsd xmm0, xmm0, qword ptr [rip + 0x896e45] ; 0x100aab898
0x100214a53: vmovsd qword ptr [rbp - 0x38], xmm0
0x100214a58: vmovsd xmm0, qword ptr [rbp - 0x70]
0x100214a5d: vmulsd xmm0, xmm0, qword ptr [rip + 0x89c943] ; 0x100ab13a8
0x100214a65: vpermilpd xmm1, xmmword ptr [rbp - 0x90], 1
0x100214a6f: vmovsd xmm2, qword ptr [rbp - 0x78]
0x100214a74: vmulsd xmm2, xmm2, qword ptr [rip + 0x8971cc] ; 0x100aabc48
0x100214a7c: vcvtss2sd xmm1, xmm1, xmm1
0x100214a80: vmovsd qword ptr [rbp - 0x90], xmm1
0x100214a88: vsubsd xmm1, xmm2, xmm1
0x100214a8c: vmulsd xmm1, xmm1, qword ptr [rip + 0x89c91c] ; 0x100ab13b0
0x100214a94: vaddsd xmm0, xmm0, xmm1
0x100214a98: vcvtsd2ss xmm0, xmm0, xmm0
0x100214a9c: call 0x100aa2bca ; 0x100aa2bca _sinf
0x100214aa1: vcvtss2sd xmm0, xmm0, xmm0
0x100214aa5: vmulsd xmm0, xmm0, qword ptr [rip + 0x895ae3] ; 0x100aaa590
0x100214aad: vaddsd xmm0, xmm0, qword ptr [rbp - 0x38]
0x100214ab2: vmovsd qword ptr [rbp - 0x38], xmm0
0x100214ab7: vmovsd xmm0, qword ptr [rbp - 0x70]
0x100214abc: vmulsd xmm0, xmm0, qword ptr [rip + 0x89c8f4] ; 0x100ab13b8
0x100214ac4: vmovsd xmm1, qword ptr [rbp - 0x90]
0x100214acc: vmulsd xmm1, xmm1, qword ptr [rip + 0x897174] ; 0x100aabc48
0x100214ad4: vsubsd xmm1, xmm1, qword ptr [rbp - 0x58]
0x100214ad9: vmulsd xmm1, xmm1, qword ptr [rip + 0x89c8df] ; 0x100ab13c0
0x100214ae1: vaddsd xmm0, xmm0, xmm1
0x100214ae5: vcvtsd2ss xmm0, xmm0, xmm0
0x100214ae9: call 0x100aa2bca ; 0x100aa2bca _sinf
0x100214aee: vcvtss2sd xmm0, xmm0, xmm0
0x100214af2: vaddsd xmm0, xmm0, qword ptr [rbp - 0x38]
0x100214af7: vcvtsd2ss xmm0, xmm0, xmm0
0x100214afb: vaddss xmm0, xmm0, dword ptr [rip + 0x8905c1] ; 0x100aa50c4
0x100214b03: vmulss xmm0, xmm0, dword ptr [rbx + 0x40d74]
0x100214b0b: vaddss xmm0, xmm0, xmm0
0x100214b0f: vaddss xmm0, xmm0, dword ptr [rbp - 0xa0]
0x100214b17: vmovss dword ptr [rbp - 0x4c], xmm0
0x100214b1c: vmovaps xmm0, xmmword ptr [rip + 0x8947bc] ; 0x100aa92e0
0x100214b24: vmovaps xmmword ptr [r12], xmm0
0x100214b2a: vmovss xmm0, dword ptr [rip + 0xa80ce2] ; 0x100c95814
0x100214b32: vmulss xmm0, xmm0, dword ptr [rip + 0x893a92] ; 0x100aa85cc
0x100214b3a: vaddss xmm0, xmm0, dword ptr [rip + 0x893b4e] ; 0x100aa8690
0x100214b42: vmovss dword ptr [r14], xmm0
0x100214b47: cmp byte ptr [rip + 0xa80cc2], 0 ; 0x100c95810
0x100214b4e: je 0x100214d17
0x100214b54: cmp dword ptr [rbx + 0x2c0], 0
0x100214b5b: je 0x100214d17
0x100214b61: lea rsi, [rbp - 0x50]
0x100214b65: mov rdi, rbx
0x100214b68: call 0x100213dd0 ; 0x100213dd0
0x100214b6d: vmovss xmm1, dword ptr [rip + 0x892d47] ; 0x100aa78bc
0x100214b75: vucomiss xmm1, xmm0
0x100214b79: jbe 0x100214d09
0x100214b7f: vucomiss xmm0, dword ptr [rip + 0x89466d] ; 0x100aa91f4
0x100214b87: jbe 0x100214d09
0x100214b8d: vmovss dword ptr [rbp - 0x58], xmm0
0x100214b92: mov eax, dword ptr [rbx + 0x2c0]
0x100214b98: vcvtsi2sd xmm0, xmm4, rax
0x100214b9d: vmovsd xmm1, qword ptr [rip + 0x89c7c3] ; 0x100ab1368
0x100214ba5: vdivsd xmm0, xmm1, xmm0
0x100214ba9: vcvtsd2ss xmm1, xmm0, xmm0
0x100214bad: vmovaps xmmword ptr [rbp - 0x70], xmm1
0x100214bb2: vxorpd xmm0, xmm0, xmm0
0x100214bb6: vblendps xmm0, xmm0, xmm1, 1
0x100214bbc: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x50]
0x100214bc1: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x100214bc6: lea rsi, [rbp - 0x30]
0x100214bca: mov rdi, rbx
0x100214bcd: call 0x100213dd0 ; 0x100213dd0
0x100214bd2: vmovss dword ptr [rbp - 0x38], xmm0
0x100214bd7: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x100214bdc: vxorps xmm0, xmm0, xmmword ptr [rip + 0x892d1c] ; 0x100aa7900
0x100214be4: vmovaps xmmword ptr [rbp - 0xa0], xmm0
0x100214bec: vblendps xmm0, xmm0, xmmword ptr [rip + 0x88f9aa], 0xe ; 0x100aa45a0
0x100214bf6: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x50]
0x100214bfb: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x100214c00: lea rsi, [rbp - 0x30]
0x100214c04: mov rdi, rbx
0x100214c07: call 0x100213dd0 ; 0x100213dd0
0x100214c0c: vmovss dword ptr [rbp - 0x90], xmm0
0x100214c14: vxorps xmm0, xmm0, xmm0
0x100214c18: vinsertps xmm0, xmm0, dword ptr [rbp - 0x70], 0x10
0x100214c1f: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x50]
0x100214c24: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x100214c29: lea rsi, [rbp - 0x30]
0x100214c2d: mov rdi, rbx
0x100214c30: call 0x100213dd0 ; 0x100213dd0
0x100214c35: vmovss dword ptr [rbp - 0x78], xmm0
0x100214c3a: vxorps xmm0, xmm0, xmm0
0x100214c3e: vinsertps xmm0, xmm0, dword ptr [rbp - 0xa0], 0x10
0x100214c48: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x50]
0x100214c4d: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x100214c52: lea rsi, [rbp - 0x30]
0x100214c56: mov rdi, rbx
0x100214c59: call 0x100213dd0 ; 0x100213dd0
0x100214c5e: vmovss dword ptr [rbp - 0x7c], xmm0
0x100214c63: vxorps xmm0, xmm0, xmm0
0x100214c67: vinsertps xmm0, xmm0, dword ptr [rbp - 0x70], 0x20
0x100214c6e: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x50]
0x100214c73: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x100214c78: lea rsi, [rbp - 0x30]
0x100214c7c: mov rdi, rbx
0x100214c7f: call 0x100213dd0 ; 0x100213dd0
0x100214c84: vmovss dword ptr [rbp - 0x70], xmm0
0x100214c89: vxorps xmm0, xmm0, xmm0
0x100214c8d: vinsertps xmm0, xmm0, dword ptr [rbp - 0xa0], 0x20
0x100214c97: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x50]
0x100214c9c: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x100214ca1: lea rsi, [rbp - 0x30]
0x100214ca5: mov rdi, rbx
0x100214ca8: call 0x100213dd0 ; 0x100213dd0
0x100214cad: vmovss xmm1, dword ptr [rbp - 0x38]
0x100214cb2: vsubss xmm1, xmm1, dword ptr [rbp - 0x90]
0x100214cba: vmovss xmm2, dword ptr [rbp - 0x78]
0x100214cbf: vsubss xmm2, xmm2, dword ptr [rbp - 0x7c]
0x100214cc4: vmovss xmm3, dword ptr [rbp - 0x70]
0x100214cc9: vsubss xmm0, xmm3, xmm0
0x100214ccd: vinsertps xmm1, xmm1, xmm2, 0x10
0x100214cd3: vinsertps xmm0, xmm1, xmm0, 0x20
0x100214cd9: vmulps xmm1, xmm0, xmm0
0x100214cdd: vmovshdup xmm2, xmm1
0x100214ce1: vaddss xmm2, xmm1, xmm2
0x100214ce5: vpermilpd xmm1, xmm1, 1
0x100214ceb: vaddss xmm1, xmm1, xmm2
0x100214cef: vsqrtss xmm1, xmm1, xmm1
0x100214cf3: vucomiss xmm1, dword ptr [rip + 0x892bc9] ; 0x100aa78c4
0x100214cfb: jbe 0x100214d1b
0x100214cfd: vpermilps xmm1, xmm1, 0xc0
0x100214d03: vdivps xmm0, xmm0, xmm1
0x100214d07: jmp 0x100214d23 ; 0x100214d23
0x100214d09: vmovss xmm1, dword ptr [rip + 0x8944e3] ; 0x100aa91f4
0x100214d11: vucomiss xmm1, xmm0
0x100214d15: jae 0x100214d56
0x100214d17: xor eax, eax
0x100214d19: jmp 0x100214d92 ; 0x100214d92
0x100214d1b: vmovaps xmm0, xmmword ptr [rip + 0x89337d] ; 0x100aa80a0
0x100214d23: vxorps xmm0, xmm0, xmmword ptr [rip + 0x892bd5] ; 0x100aa7900
0x100214d2b: vmovaps xmmword ptr [r12], xmm0
0x100214d31: test r15b, r15b
0x100214d34: je 0x100214d72
0x100214d36: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x100214d3b: vsubps xmm0, xmm0, xmmword ptr [rbx + 0x40d80]
0x100214d43: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x100214d48: lea rsi, [rbp - 0x30]
0x100214d4c: mov rdi, rbx
0x100214d4f: call 0x100214810 ; 0x100214810
0x100214d54: jmp 0x100214d7a ; 0x100214d7a
0x100214d56: vmovss xmm0, dword ptr [rip + 0xa80ab6] ; 0x100c95814
0x100214d5e: vmulss xmm0, xmm0, dword ptr [rip + 0x893866] ; 0x100aa85cc
0x100214d66: vaddss xmm0, xmm0, dword ptr [rip + 0x891d36] ; 0x100aa6aa4
0x100214d6e: xor eax, eax
0x100214d70: jmp 0x100214d8d ; 0x100214d8d
0x100214d72: vmovss xmm0, dword ptr [rip + 0x893852] ; 0x100aa85cc
0x100214d7a: vmovss xmm1, dword ptr [rbp - 0x58]
0x100214d7f: vmulss xmm0, xmm0, dword ptr [rip + 0xa80a8d] ; 0x100c95814
0x100214d87: vsubss xmm0, xmm0, xmm1
0x100214d8b: mov al, 1
0x100214d8d: vmovss dword ptr [r14], xmm0
0x100214d92: add rsp, 0x80
0x100214d99: pop rbx
0x100214d9a: pop r12
0x100214d9c: pop r14
0x100214d9e: pop r15
0x100214da0: pop rbp
0x100214da1: ret 
0x100214da2: nop word ptr cs:[rax + rax]
