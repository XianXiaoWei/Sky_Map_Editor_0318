0x1001a3980: push rbp
0x1001a3981: mov rbp, rsp
0x1001a3984: push r15
0x1001a3986: push r14
0x1001a3988: push r12
0x1001a398a: push rbx
0x1001a398b: mov r14, rdx
0x1001a398e: mov rbx, rdi
0x1001a3991: cmp byte ptr [rsi + 0x84], 0
0x1001a3998: jne 0x1001a3ab8
0x1001a399e: vmovss xmm1, dword ptr [rsi + 0x24]
0x1001a39a3: vmovss xmm0, dword ptr [rsi + 0x28]
0x1001a39a8: cmp byte ptr [rsi + 0x21], 0
0x1001a39ac: je 0x1001a39cc
0x1001a39ae: vmovss xmm2, dword ptr [rip + 0x900c02] ; 0x100aa45b8
0x1001a39b6: vucomiss xmm2, xmm1
0x1001a39ba: jbe 0x1001a39c3
0x1001a39bc: cmp dword ptr [r14 + 0xc], 0
0x1001a39c1: jle 0x1001a3a17
0x1001a39c3: cmp byte ptr [rbx + 0x3c8], 0
0x1001a39ca: je 0x1001a3a17
0x1001a39cc: vmovss xmm2, dword ptr [rip + 0x9016ec] ; 0x100aa50c0
0x1001a39d4: vucomiss xmm2, xmm1
0x1001a39d8: jbe 0x1001a3ab8
0x1001a39de: vaddss xmm0, xmm0, dword ptr [rip + 0x9016de] ; 0x100aa50c4
0x1001a39e6: vandps xmm0, xmm0, xmmword ptr [rip + 0x903f22] ; 0x100aa7910
0x1001a39ee: vmovss xmm1, dword ptr [rip + 0x903ece] ; 0x100aa78c4
0x1001a39f6: vucomiss xmm1, xmm0
0x1001a39fa: jb 0x1001a3ab8
0x1001a3a00: mov rax, qword ptr [rbx + 0x78]
0x1001a3a04: mov rdx, qword ptr [rax + 0x10]
0x1001a3a08: test byte ptr [rdx + 0x58], 1
0x1001a3a0c: jne 0x1001a3a2e
0x1001a3a0e: add rdx, 0x58
0x1001a3a12: inc rdx
0x1001a3a15: jmp 0x1001a3a32 ; 0x1001a3a32
0x1001a3a17: mov rax, qword ptr [rbx + 0x78]
0x1001a3a1b: mov rdx, qword ptr [rax + 0x10]
0x1001a3a1f: test byte ptr [rdx + 0x58], 1
0x1001a3a23: jne 0x1001a3a67
0x1001a3a25: add rdx, 0x58
0x1001a3a29: inc rdx
0x1001a3a2c: jmp 0x1001a3a6b ; 0x1001a3a6b
0x1001a3a2e: mov rdx, qword ptr [rdx + 0x68]
0x1001a3a32: lea rdi, [rip + 0x9c7351] ; 0x100b6ad8a TakeoffShort
0x1001a3a39: xor r12d, r12d
0x1001a3a3c: xor esi, esi
0x1001a3a3e: call 0x1000962f0 ; 0x1000962f0
0x1001a3a43: mov r15d, eax
0x1001a3a46: test r15d, r15d
0x1001a3a49: js 0x1001a3ab1
0x1001a3a4b: mov rdi, r14
0x1001a3a4e: mov esi, r15d
0x1001a3a51: call 0x100096410 ; 0x100096410
0x1001a3a56: test al, al
0x1001a3a58: je 0x1001a3aae
0x1001a3a5a: vmovss xmm0, dword ptr [rip + 0x90165e] ; 0x100aa50c0
0x1001a3a62: xor r12d, r12d
0x1001a3a65: jmp 0x1001a3a9b ; 0x1001a3a9b
0x1001a3a67: mov rdx, qword ptr [rdx + 0x68]
0x1001a3a6b: lea rdi, [rip + 0x9c7308] ; 0x100b6ad7a Takeoff
0x1001a3a72: xor esi, esi
0x1001a3a74: call 0x1000962f0 ; 0x1000962f0
0x1001a3a79: mov r15d, eax
0x1001a3a7c: mov r12b, 1
0x1001a3a7f: test r15d, r15d
0x1001a3a82: js 0x1001a3ab1
0x1001a3a84: mov rdi, r14
0x1001a3a87: mov esi, r15d
0x1001a3a8a: call 0x100096410 ; 0x100096410
0x1001a3a8f: test al, al
0x1001a3a91: je 0x1001a3ab1
0x1001a3a93: vmovss xmm0, dword ptr [rip + 0x901625] ; 0x100aa50c0
0x1001a3a9b: xor edx, edx
0x1001a3a9d: mov rdi, r14
0x1001a3aa0: mov esi, r15d
0x1001a3aa3: vmovaps xmm1, xmm0
0x1001a3aa7: call 0x1000968e0 ; 0x1000968e0
0x1001a3aac: jmp 0x1001a3ab1 ; 0x1001a3ab1
0x1001a3aae: xor r12d, r12d
0x1001a3ab1: mov byte ptr [rbx + 0x3c8], r12b
0x1001a3ab8: pop rbx
0x1001a3ab9: pop r12
0x1001a3abb: pop r14
0x1001a3abd: pop r15
0x1001a3abf: pop rbp
0x1001a3ac0: ret 
0x1001a3ac1: nop word ptr cs:[rax + rax]
