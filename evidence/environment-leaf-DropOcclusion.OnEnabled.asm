0x1002ce490: push rbp
0x1002ce491: mov rbp, rsp
0x1002ce494: push r15
0x1002ce496: push r14
0x1002ce498: push r13
0x1002ce49a: push r12
0x1002ce49c: push rbx
0x1002ce49d: sub rsp, 0x268
0x1002ce4a4: mov r13, rdi
0x1002ce4a7: mov rax, qword ptr [rip + 0x93f42a] ; 0x100c0d8d8
0x1002ce4ae: mov rax, qword ptr [rax]
0x1002ce4b1: mov qword ptr [rbp - 0x30], rax
0x1002ce4b5: mov rax, qword ptr [r13 + 0x38]
0x1002ce4b9: cmp dword ptr [rax + 0x10], 0
0x1002ce4bd: je 0x1002ce6e1
0x1002ce4c3: lea r14, [rbp - 0x210]
0x1002ce4ca: xor ecx, ecx
0x1002ce4cc: lea r12, [rbp - 0x290]
0x1002ce4d3: mov rdx, qword ptr [rip + 0x93c046] ; 0x100c0a520
0x1002ce4da: lea rsi, [rdx + 0x18]
0x1002ce4de: mov qword ptr [rbp - 0x240], rsi
0x1002ce4e5: add rdx, 0x40
0x1002ce4e9: mov qword ptr [rbp - 0x248], rdx
0x1002ce4f0: mov rdx, qword ptr [rip + 0x93f0d1] ; 0x100c0d5c8
0x1002ce4f7: lea rsi, [rdx + 0x18]
0x1002ce4fb: mov qword ptr [rbp - 0x228], rsi
0x1002ce502: add rdx, 0x40
0x1002ce506: mov qword ptr [rbp - 0x230], rdx
0x1002ce50d: mov rdx, qword ptr [rip + 0x93c06c] ; 0x100c0a580
0x1002ce514: add rdx, 8
0x1002ce518: mov qword ptr [rbp - 0x220], rdx
0x1002ce51f: nop 
0x1002ce520: mov rax, qword ptr [rax + 8]
0x1002ce524: mov ecx, ecx
0x1002ce526: mov qword ptr [rbp - 0x250], rcx
0x1002ce52d: mov rax, qword ptr [rax + rcx*8]
0x1002ce531: mov qword ptr [rbp - 0x290], rax
0x1002ce538: call 0x1007abc10 ; 0x1007abc10
0x1002ce53d: mov r15, rax
0x1002ce540: mov qword ptr [rbp - 0x218], 0
0x1002ce54b: call 0x1007abc10 ; 0x1007abc10
0x1002ce550: mov rbx, qword ptr [rax]
0x1002ce553: mov rdi, rax
0x1002ce556: lea rsi, [rbp - 0x218]
0x1002ce55d: mov rdx, r12
0x1002ce560: mov rcx, r15
0x1002ce563: call qword ptr [rbx + 0x40]
0x1002ce566: mov rsi, qword ptr [rbp - 0x218]
0x1002ce56d: test rsi, rsi
0x1002ce570: je 0x1002ce708
0x1002ce576: mov rdi, r12
0x1002ce579: call 0x1004d1e40 ; 0x1004d1e40
0x1002ce57e: vmovaps xmm0, xmmword ptr [rbp - 0x290]
0x1002ce586: vmulps xmm0, xmm0, xmm0
0x1002ce58a: vmovshdup xmm1, xmm0
0x1002ce58e: vaddss xmm1, xmm0, xmm1
0x1002ce592: vpermilpd xmm0, xmm0, 1
0x1002ce598: vaddss xmm0, xmm0, xmm1
0x1002ce59c: vsqrtss xmm0, xmm0, xmm0
0x1002ce5a0: vucomiss xmm0, dword ptr [r13 + 0x50]
0x1002ce5a6: jbe 0x1002ce6bf
0x1002ce5ac: vmovss dword ptr [rbp - 0x234], xmm0
0x1002ce5b4: mov rax, qword ptr [rbp - 0x240]
0x1002ce5bb: mov qword ptr [rbp - 0x218], rax
0x1002ce5c2: mov rax, qword ptr [rbp - 0x248]
0x1002ce5c9: mov qword ptr [rbp - 0xc8], rax
0x1002ce5d0: lea rdi, [rbp - 0xc8]
0x1002ce5d7: mov rsi, r14
0x1002ce5da: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1002ce5df: mov qword ptr [rbp - 0x40], 0
0x1002ce5e7: mov dword ptr [rbp - 0x38], 0xffffffff
0x1002ce5ee: mov rax, qword ptr [rbp - 0x228]
0x1002ce5f5: mov qword ptr [rbp - 0x218], rax
0x1002ce5fc: mov rax, qword ptr [rbp - 0x230]
0x1002ce603: mov qword ptr [rbp - 0xc8], rax
0x1002ce60a: mov edx, 1
0x1002ce60f: mov rdi, r14
0x1002ce612: lea rsi, [rip + 0x8b0da9] ; 0x100b7f3c2 DropOcclusion
0x1002ce619: call 0x1007a56a0 ; 0x1007a56a0
0x1002ce61e: mov edx, 9
0x1002ce623: lea rdi, [rbp - 0x218]
0x1002ce62a: lea rsi, [rip + 0x8b0e26] ; 0x100b7f457 maxSize '
0x1002ce631: call 0x100011930 ; 0x100011930
0x1002ce636: vmovss xmm0, dword ptr [r13 + 0x50]
0x1002ce63c: mov rdi, rax
0x1002ce63f: call 0x100aa23d2 ; 0x100aa23d2 __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEf
0x1002ce644: mov edx, 0x14
0x1002ce649: mov rdi, rax
0x1002ce64c: lea rsi, [rip + 0x8b0e0e] ; 0x100b7f461 ' is less than rad '
0x1002ce653: call 0x100011930 ; 0x100011930
0x1002ce658: mov rdi, rax
0x1002ce65b: vmovss xmm0, dword ptr [rbp - 0x234]
0x1002ce663: call 0x100aa23d2 ; 0x100aa23d2 __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEf
0x1002ce668: mov edx, 1
0x1002ce66d: mov rdi, rax
0x1002ce670: lea rsi, [rip + 0x890576] ; 0x100b5ebed '
0x1002ce677: call 0x100011930 ; 0x100011930
0x1002ce67c: mov rax, qword ptr [rbp - 0x228]
0x1002ce683: mov qword ptr [rbp - 0x218], rax
0x1002ce68a: mov rax, qword ptr [rbp - 0x230]
0x1002ce691: mov qword ptr [rbp - 0xc8], rax
0x1002ce698: mov rdi, r14
0x1002ce69b: call 0x1007a58d0 ; 0x1007a58d0
0x1002ce6a0: lea rdi, [rbp - 0x218]
0x1002ce6a7: mov rsi, qword ptr [rbp - 0x220]
0x1002ce6ae: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1002ce6b3: lea rdi, [rbp - 0xc8]
0x1002ce6ba: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1002ce6bf: mov rax, qword ptr [r13 + 0x78]
0x1002ce6c3: mov rcx, qword ptr [rbp - 0x250]
0x1002ce6ca: mov dword ptr [rax + rcx*4], 0
0x1002ce6d1: lea ecx, [rcx + 1]
0x1002ce6d4: mov rax, qword ptr [r13 + 0x38]
0x1002ce6d8: cmp ecx, dword ptr [rax + 0x10]
0x1002ce6db: jb 0x1002ce520
0x1002ce6e1: mov rax, qword ptr [rip + 0x93f1f0] ; 0x100c0d8d8
0x1002ce6e8: mov rax, qword ptr [rax]
0x1002ce6eb: cmp rax, qword ptr [rbp - 0x30]
0x1002ce6ef: jne 0x1002ce703
0x1002ce6f1: add rsp, 0x268
0x1002ce6f8: pop rbx
0x1002ce6f9: pop r12
0x1002ce6fb: pop r13
0x1002ce6fd: pop r14
0x1002ce6ff: pop r15
0x1002ce701: pop rbp
0x1002ce702: ret 
0x1002ce703: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1002ce708: lea rdi, [rip + 0x8933e9] ; 0x100b61af8 ret
0x1002ce70f: lea rsi, [rip + 0x89324d] ; 0x100b61963 ./Clump.h
0x1002ce716: mov edx, 0x47
0x1002ce71b: mov ecx, 3
0x1002ce720: call 0x1007e5f70 ; 0x1007e5f70
0x1002ce725: ud2 
0x1002ce727: mov r15, rax
0x1002ce72a: jmp 0x1002ce758 ; 0x1002ce758
0x1002ce72c: mov r15, rax
0x1002ce72f: jmp 0x1002ce76b ; 0x1002ce76b
0x1002ce731: mov r15, rax
0x1002ce734: mov rax, qword ptr [rbp - 0x228]
0x1002ce73b: mov qword ptr [rbp - 0x218], rax
0x1002ce742: mov rax, qword ptr [rbp - 0x230]
0x1002ce749: mov qword ptr [rbp - 0xc8], rax
0x1002ce750: mov rdi, r14
0x1002ce753: call 0x1007a58d0 ; 0x1007a58d0
0x1002ce758: lea rdi, [rbp - 0x218]
0x1002ce75f: mov rsi, qword ptr [rbp - 0x220]
0x1002ce766: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1002ce76b: lea rdi, [rbp - 0xc8]
0x1002ce772: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1002ce777: mov rdi, r15
0x1002ce77a: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1002ce77f: nop 
