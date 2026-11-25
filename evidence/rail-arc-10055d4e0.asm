0x10055d4e0: push rbp
0x10055d4e1: mov rbp, rsp
0x10055d4e4: push r15
0x10055d4e6: push r14
0x10055d4e8: push r13
0x10055d4ea: push r12
0x10055d4ec: push rbx
0x10055d4ed: sub rsp, 0x1f8
0x10055d4f4: mov r14, rdi
0x10055d4f7: mov rax, qword ptr [rip + 0x6b03da] ; 0x100c0d8d8
0x10055d4fe: mov rax, qword ptr [rax]
0x10055d501: mov qword ptr [rbp - 0x30], rax
0x10055d505: cmp byte ptr [r14 + 0x2c], 0
0x10055d50a: je 0x10055d776
0x10055d510: vmovss xmm1, dword ptr [r14 + 0x18]
0x10055d516: vmovss dword ptr [rbp - 0x21c], xmm1
0x10055d51e: call 0x100aa2744 ; 0x100aa2744 _fmodf
0x10055d523: vxorps xmm1, xmm1, xmm1
0x10055d527: vucomiss xmm1, xmm0
0x10055d52b: jbe 0x10055d535
0x10055d52d: vaddss xmm0, xmm0, dword ptr [rbp - 0x21c]
0x10055d535: cmp byte ptr [r14 + 0x1c], 0
0x10055d53a: vmovss dword ptr [rbp - 0x21c], xmm0
0x10055d542: je 0x10055d559
0x10055d544: mov esi, 0x10
0x10055d549: mov rdi, r14
0x10055d54c: call 0x10055b560 ; 0x10055b560
0x10055d551: vmovss xmm0, dword ptr [rbp - 0x21c]
0x10055d559: mov rax, qword ptr [r14 + 8]
0x10055d55d: mov ebx, 0xffffffff
0x10055d562: nop word ptr cs:[rax + rax]
0x10055d570: inc ebx
0x10055d572: vucomiss xmm0, dword ptr [rax + rbx*8 + 4]
0x10055d578: ja 0x10055d570
0x10055d57a: cmp ebx, dword ptr [r14 + 0x14]
0x10055d57e: jb 0x10055d6cc
0x10055d584: lea rdi, [rbp - 0xc8]
0x10055d58b: lea r12, [rbp - 0x210]
0x10055d592: mov rax, qword ptr [rip + 0x6acf87] ; 0x100c0a520
0x10055d599: lea rcx, [rax + 0x18]
0x10055d59d: mov qword ptr [rbp - 0x218], rcx
0x10055d5a4: add rax, 0x40
0x10055d5a8: mov qword ptr [rbp - 0xc8], rax
0x10055d5af: mov rsi, r12
0x10055d5b2: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x10055d5b7: mov qword ptr [rbp - 0x40], 0
0x10055d5bf: mov dword ptr [rbp - 0x38], 0xffffffff
0x10055d5c6: mov r13, qword ptr [rip + 0x6afffb] ; 0x100c0d5c8
0x10055d5cd: lea r15, [r13 + 0x18]
0x10055d5d1: mov qword ptr [rbp - 0x218], r15
0x10055d5d8: add r13, 0x40
0x10055d5dc: mov qword ptr [rbp - 0xc8], r13
0x10055d5e3: lea rsi, [rip + 0x61a4c4] ; 0x100b77aae Rail
0x10055d5ea: mov edx, 1
0x10055d5ef: mov rdi, r12
0x10055d5f2: call 0x1007a56a0 ; 0x1007a56a0
0x10055d5f7: lea rsi, [rip + 0x6341a8] ; 0x100b917a6 arcTable error! 
0x10055d5fe: lea rdi, [rbp - 0x218]
0x10055d605: mov edx, 0x10
0x10055d60a: call 0x100011930 ; 0x100011930
0x10055d60f: mov rdi, rax
0x10055d612: mov esi, ebx
0x10055d614: call 0x100aa23de ; 0x100aa23de __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
0x10055d619: lea rsi, [rip + 0x6033ef] ; 0x100b60a0f  
0x10055d620: mov edx, 1
0x10055d625: mov rdi, rax
0x10055d628: call 0x100011930 ; 0x100011930
0x10055d62d: mov esi, dword ptr [r14 + 0x14]
0x10055d631: dec esi
0x10055d633: mov rdi, rax
0x10055d636: call 0x100aa23de ; 0x100aa23de __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
0x10055d63b: lea rsi, [rip + 0x6033cd] ; 0x100b60a0f  
0x10055d642: mov edx, 1
0x10055d647: mov rdi, rax
0x10055d64a: call 0x100011930 ; 0x100011930
0x10055d64f: mov rdi, rax
0x10055d652: vmovss xmm0, dword ptr [rbp - 0x21c]
0x10055d65a: call 0x100aa23d2 ; 0x100aa23d2 __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEf
0x10055d65f: lea rsi, [rip + 0x6033a9] ; 0x100b60a0f  
0x10055d666: mov edx, 1
0x10055d66b: mov rdi, rax
0x10055d66e: call 0x100011930 ; 0x100011930
0x10055d673: vmovss xmm0, dword ptr [r14 + 0x18]
0x10055d679: mov rdi, rax
0x10055d67c: call 0x100aa23d2 ; 0x100aa23d2 __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEf
0x10055d681: mov qword ptr [rbp - 0x218], r15
0x10055d688: mov qword ptr [rbp - 0xc8], r13
0x10055d68f: mov rdi, r12
0x10055d692: call 0x1007a58d0 ; 0x1007a58d0
0x10055d697: mov rsi, qword ptr [rip + 0x6acee2] ; 0x100c0a580
0x10055d69e: add rsi, 8
0x10055d6a2: lea rdi, [rbp - 0x218]
0x10055d6a9: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10055d6ae: lea rdi, [rbp - 0xc8]
0x10055d6b5: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10055d6ba: cmp ebx, dword ptr [r14 + 0x14]
0x10055d6be: vmovss xmm0, dword ptr [rbp - 0x21c]
0x10055d6c6: jae 0x10055d7a5
0x10055d6cc: mov rax, qword ptr [r14 + 8]
0x10055d6d0: test ebx, ebx
0x10055d6d2: je 0x10055d707
0x10055d6d4: vmovss xmm1, dword ptr [rax + rbx*8 + 4]
0x10055d6da: lea ecx, [rbx - 1]
0x10055d6dd: vmovss xmm4, dword ptr [rax + rcx*8 + 4]
0x10055d6e3: vsubss xmm1, xmm1, xmm4
0x10055d6e7: vandps xmm2, xmm1, xmmword ptr [rip + 0x54a221] ; 0x100aa7910
0x10055d6ef: vmovss xmm3, dword ptr [rip + 0x54a1cd] ; 0x100aa78c4
0x10055d6f7: vucomiss xmm3, xmm2
0x10055d6fb: jae 0x10055d707
0x10055d6fd: vsubss xmm0, xmm0, xmm4
0x10055d701: vdivss xmm4, xmm0, xmm1
0x10055d705: jmp 0x10055d736 ; 0x10055d736
0x10055d707: vmovss xmm2, dword ptr [rax + 4]
0x10055d70c: vandps xmm4, xmm2, xmmword ptr [rip + 0x54a1fc] ; 0x100aa7910
0x10055d714: vxorps xmm1, xmm1, xmm1
0x10055d718: vmovss xmm3, dword ptr [rip + 0x54a1a4] ; 0x100aa78c4
0x10055d720: vucomiss xmm3, xmm4
0x10055d724: vxorps xmm4, xmm4, xmm4
0x10055d728: jae 0x10055d72e
0x10055d72a: vdivss xmm4, xmm0, xmm2
0x10055d72e: test ebx, ebx
0x10055d730: je 0x10055d73b
0x10055d732: mov ecx, ebx
0x10055d734: dec ecx
0x10055d736: vmovss xmm1, dword ptr [rax + rcx*8]
0x10055d73b: vmulss xmm2, xmm4, dword ptr [rax + rbx*8]
0x10055d740: mov rax, qword ptr [rip + 0x6b0191] ; 0x100c0d8d8
0x10055d747: mov rax, qword ptr [rax]
0x10055d74a: cmp rax, qword ptr [rbp - 0x30]
0x10055d74e: jne 0x10055d7a0
0x10055d750: vmovss xmm3, dword ptr [rip + 0x547968] ; 0x100aa50c0
0x10055d758: vsubss xmm0, xmm3, xmm4
0x10055d75c: vmulss xmm0, xmm0, xmm1
0x10055d760: vaddss xmm0, xmm0, xmm2
0x10055d764: add rsp, 0x1f8
0x10055d76b: pop rbx
0x10055d76c: pop r12
0x10055d76e: pop r13
0x10055d770: pop r14
0x10055d772: pop r15
0x10055d774: pop rbp
0x10055d775: ret 
0x10055d776: vxorps xmm1, xmm1, xmm1
0x10055d77a: vmaxss xmm0, xmm1, xmm0
0x10055d77e: vmovss xmm1, dword ptr [r14 + 0x18]
0x10055d784: vminss xmm0, xmm1, xmm0
0x10055d788: cmp byte ptr [r14 + 0x1c], 0
0x10055d78d: vmovss dword ptr [rbp - 0x21c], xmm0
0x10055d795: jne 0x10055d544
0x10055d79b: jmp 0x10055d559 ; 0x10055d559
0x10055d7a0: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10055d7a5: lea rdi, [rip + 0x63400b] ; 0x100b917b7 ind < arcTableSize
0x10055d7ac: lea rsi, [rip + 0x633f79] ; 0x100b9172c Rail.cpp
0x10055d7b3: mov edx, 0x1a9
0x10055d7b8: mov ecx, 3
0x10055d7bd: call 0x1007e5f70 ; 0x1007e5f70
0x10055d7c2: ud2 
0x10055d7c4: mov rbx, rax
0x10055d7c7: jmp 0x10055d7e7 ; 0x10055d7e7
0x10055d7c9: mov rbx, rax
0x10055d7cc: jmp 0x10055d7fe ; 0x10055d7fe
0x10055d7ce: mov rbx, rax
0x10055d7d1: mov qword ptr [rbp - 0x218], r15
0x10055d7d8: mov qword ptr [rbp - 0xc8], r13
0x10055d7df: mov rdi, r12
0x10055d7e2: call 0x1007a58d0 ; 0x1007a58d0
0x10055d7e7: mov rsi, qword ptr [rip + 0x6acd92] ; 0x100c0a580
0x10055d7ee: add rsi, 8
0x10055d7f2: lea rdi, [rbp - 0x218]
0x10055d7f9: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10055d7fe: lea rdi, [rbp - 0xc8]
0x10055d805: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10055d80a: mov rdi, rbx
0x10055d80d: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10055d812: nop word ptr cs:[rax + rax]
