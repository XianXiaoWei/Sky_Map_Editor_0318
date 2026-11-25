0x1006a65e0: push rbp
0x1006a65e1: mov rbp, rsp
0x1006a65e4: push r15
0x1006a65e6: push r14
0x1006a65e8: push r13
0x1006a65ea: push r12
0x1006a65ec: push rbx
0x1006a65ed: sub rsp, 0x1f8
0x1006a65f4: mov r14, rdi
0x1006a65f7: mov rax, qword ptr [rip + 0x5672da] ; 0x100c0d8d8
0x1006a65fe: mov rax, qword ptr [rax]
0x1006a6601: mov qword ptr [rbp - 0x30], rax
0x1006a6605: mov r8d, dword ptr [r14 + 0xe6c78]
0x1006a660c: test r8d, r8d
0x1006a660f: je 0x1006a6799
0x1006a6615: xor ecx, ecx
0x1006a6617: vmovss xmm0, dword ptr [rip + 0x41c605] ; 0x100ac2c24
0x1006a661f: jmp 0x1006a6690 ; 0x1006a6690
0x1006a6621: nop word ptr cs:[rax + rax]
0x1006a6630: mov edi, dword ptr [rdx + 0x1d8]
0x1006a6636: test edi, edi
0x1006a6638: je 0x1006a66ac
0x1006a663a: mov rax, qword ptr [rdx + 0x1a0]
0x1006a6641: vmovaps xmm1, xmmword ptr [rsi]
0x1006a6645: xor ebx, ebx
0x1006a6647: nop word ptr [rax + rax]
0x1006a6650: vsubps xmm2, xmm1, xmmword ptr [rax]
0x1006a6654: vmulps xmm2, xmm2, xmm2
0x1006a6658: vmovshdup xmm3, xmm2
0x1006a665c: vaddss xmm3, xmm2, xmm3
0x1006a6660: vpermilpd xmm2, xmm2, 1
0x1006a6666: vaddss xmm2, xmm2, xmm3
0x1006a666a: vsqrtss xmm2, xmm2, xmm2
0x1006a666e: vmulss xmm3, xmm0, dword ptr [rax + 0xc]
0x1006a6673: vucomiss xmm3, xmm2
0x1006a6677: ja 0x1006a66b8
0x1006a6679: inc ebx
0x1006a667b: add rax, 0x10
0x1006a667f: cmp ebx, edi
0x1006a6681: jb 0x1006a6650
0x1006a6683: jmp 0x1006a66ac ; 0x1006a66ac
0x1006a6685: nop word ptr cs:[rax + rax]
0x1006a6690: mov eax, ecx
0x1006a6692: mov rdx, qword ptr [r14 + rax*8 + 0xe6c80]
0x1006a669a: cmp byte ptr [rdx + 0x5e6], 0
0x1006a66a1: je 0x1006a66ac
0x1006a66a3: cmp byte ptr [rdx + 0x5e4], 0
0x1006a66aa: je 0x1006a6630
0x1006a66ac: inc ecx
0x1006a66ae: cmp ecx, r8d
0x1006a66b1: jb 0x1006a6690
0x1006a66b3: jmp 0x1006a6799 ; 0x1006a6799
0x1006a66b8: mov qword ptr [r14 + 0x588], rdx
0x1006a66bf: mov dword ptr [r14 + 0x590], ebx
0x1006a66c6: lea rbx, [rbp - 0xc8]
0x1006a66cd: lea r15, [rbp - 0x210]
0x1006a66d4: mov rax, qword ptr [rip + 0x563e45] ; 0x100c0a520
0x1006a66db: lea rcx, [rax + 0x18]
0x1006a66df: mov qword ptr [rbp - 0x218], rcx
0x1006a66e6: add rax, 0x40
0x1006a66ea: mov qword ptr [rbp - 0xc8], rax
0x1006a66f1: mov rdi, rbx
0x1006a66f4: mov rsi, r15
0x1006a66f7: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1006a66fc: mov qword ptr [rbp - 0x40], 0
0x1006a6704: mov dword ptr [rbp - 0x38], 0xffffffff
0x1006a670b: mov r12, qword ptr [rip + 0x566eb6] ; 0x100c0d5c8
0x1006a6712: lea r13, [r12 + 0x18]
0x1006a6717: mov qword ptr [rbp - 0x218], r13
0x1006a671e: add r12, 0x40
0x1006a6722: mov qword ptr [rbp - 0xc8], r12
0x1006a6729: lea rsi, [rip + 0x4d8b67] ; 0x100b7f297 Terrain
0x1006a6730: mov edx, 2
0x1006a6735: mov rdi, r15
0x1006a6738: call 0x1007a56a0 ; 0x1007a56a0
0x1006a673d: lea rsi, [rip + 0x4f35cd] ; 0x100b99d11 Placed debug pivot in bin 
0x1006a6744: lea rdi, [rbp - 0x218]
0x1006a674b: mov edx, 0x1a
0x1006a6750: call 0x100011930 ; 0x100011930
0x1006a6755: mov esi, dword ptr [r14 + 0x590]
0x1006a675c: mov rdi, rax
0x1006a675f: call 0x100aa23de ; 0x100aa23de __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
0x1006a6764: mov qword ptr [rbp - 0x218], r13
0x1006a676b: mov qword ptr [rbp - 0xc8], r12
0x1006a6772: mov rdi, r15
0x1006a6775: call 0x1007a58d0 ; 0x1007a58d0
0x1006a677a: mov rsi, qword ptr [rip + 0x563dff] ; 0x100c0a580
0x1006a6781: add rsi, 8
0x1006a6785: lea rdi, [rbp - 0x218]
0x1006a678c: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006a6791: mov rdi, rbx
0x1006a6794: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a6799: mov rax, qword ptr [rip + 0x567138] ; 0x100c0d8d8
0x1006a67a0: mov rax, qword ptr [rax]
0x1006a67a3: cmp rax, qword ptr [rbp - 0x30]
0x1006a67a7: jne 0x1006a67bb
0x1006a67a9: add rsp, 0x1f8
0x1006a67b0: pop rbx
0x1006a67b1: pop r12
0x1006a67b3: pop r13
0x1006a67b5: pop r14
0x1006a67b7: pop r15
0x1006a67b9: pop rbp
0x1006a67ba: ret 
0x1006a67bb: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1006a67c0: mov r14, rax
0x1006a67c3: jmp 0x1006a67e3 ; 0x1006a67e3
0x1006a67c5: mov r14, rax
0x1006a67c8: jmp 0x1006a67fa ; 0x1006a67fa
0x1006a67ca: mov r14, rax
0x1006a67cd: mov qword ptr [rbp - 0x218], r13
0x1006a67d4: mov qword ptr [rbp - 0xc8], r12
0x1006a67db: mov rdi, r15
0x1006a67de: call 0x1007a58d0 ; 0x1007a58d0
0x1006a67e3: mov rsi, qword ptr [rip + 0x563d96] ; 0x100c0a580
0x1006a67ea: add rsi, 8
0x1006a67ee: lea rdi, [rbp - 0x218]
0x1006a67f5: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006a67fa: mov rdi, rbx
0x1006a67fd: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a6802: mov rdi, r14
0x1006a6805: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006a680a: nop word ptr [rax + rax]
