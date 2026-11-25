0x1007c4640: push rbp
0x1007c4641: mov rbp, rsp
0x1007c4644: push r15
0x1007c4646: push r14
0x1007c4648: push r13
0x1007c464a: push r12
0x1007c464c: push rbx
0x1007c464d: sub rsp, 0x228
0x1007c4654: mov r13, rsi
0x1007c4657: mov r14, rdi
0x1007c465a: mov rax, qword ptr [rip + 0x449277] ; 0x100c0d8d8
0x1007c4661: mov rax, qword ptr [rax]
0x1007c4664: mov qword ptr [rbp - 0x30], rax
0x1007c4668: mov qword ptr [rbp - 0x230], rdx
0x1007c466f: lea rdi, [rbp - 0xc8]
0x1007c4676: lea r15, [rbp - 0x210]
0x1007c467d: mov rax, qword ptr [rip + 0x445e9c] ; 0x100c0a520
0x1007c4684: lea rcx, [rax + 0x18]
0x1007c4688: mov qword ptr [rbp - 0x240], rcx
0x1007c468f: mov qword ptr [rbp - 0x218], rcx
0x1007c4696: add rax, 0x40
0x1007c469a: mov qword ptr [rbp - 0x248], rax
0x1007c46a1: mov qword ptr [rbp - 0xc8], rax
0x1007c46a8: mov rsi, r15
0x1007c46ab: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1007c46b0: mov qword ptr [rbp - 0x40], 0
0x1007c46b8: mov dword ptr [rbp - 0x38], 0xffffffff
0x1007c46bf: mov r12, qword ptr [rip + 0x448f02] ; 0x100c0d5c8
0x1007c46c6: lea rax, [r12 + 0x18]
0x1007c46cb: mov qword ptr [rbp - 0x220], rax
0x1007c46d2: mov qword ptr [rbp - 0x218], rax
0x1007c46d9: add r12, 0x40
0x1007c46dd: mov qword ptr [rbp - 0xc8], r12
0x1007c46e4: lea rsi, [rip + 0x3bf0b6] ; 0x100b837a1 Resources
0x1007c46eb: mov edx, 1
0x1007c46f0: mov rdi, r15
0x1007c46f3: call 0x1007a56a0 ; 0x1007a56a0
0x1007c46f8: lea rsi, [rip + 0x3e02d4] ; 0x100ba49d3 ResourceManager::Observe< 
0x1007c46ff: lea rdi, [rbp - 0x218]
0x1007c4706: mov edx, 0x1a
0x1007c470b: call 0x100011930 ; 0x100011930
0x1007c4710: mov rbx, rax
0x1007c4713: mov rdi, r13
0x1007c4716: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1007c471b: mov rdi, rbx
0x1007c471e: mov rsi, r13
0x1007c4721: mov rdx, rax
0x1007c4724: call 0x100011930 ; 0x100011930
0x1007c4729: lea rsi, [rip + 0x3e02be] ; 0x100ba49ee  >: No resource named 
0x1007c4730: mov edx, 0x16
0x1007c4735: mov rdi, rax
0x1007c4738: call 0x100011930 ; 0x100011930
0x1007c473d: mov r13, rax
0x1007c4740: mov rbx, qword ptr [rbp - 0x230]
0x1007c4747: mov rdi, rbx
0x1007c474a: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1007c474f: mov rdi, r13
0x1007c4752: mov rsi, rbx
0x1007c4755: mov rdx, rax
0x1007c4758: call 0x100011930 ; 0x100011930
0x1007c475d: lea rsi, [rip + 0x3e02a1] ; 0x100ba4a05  of given type.
0x1007c4764: mov edx, 0xf
0x1007c4769: mov rdi, rax
0x1007c476c: call 0x100011930 ; 0x100011930
0x1007c4771: mov r13, qword ptr [rbp - 0x220]
0x1007c4778: mov qword ptr [rbp - 0x218], r13
0x1007c477f: mov qword ptr [rbp - 0xc8], r12
0x1007c4786: mov rdi, r15
0x1007c4789: call 0x1007a58d0 ; 0x1007a58d0
0x1007c478e: mov rsi, qword ptr [rip + 0x445deb] ; 0x100c0a580
0x1007c4795: add rsi, 8
0x1007c4799: lea rdi, [rbp - 0x218]
0x1007c47a0: mov qword ptr [rbp - 0x228], rsi
0x1007c47a7: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1007c47ac: lea rdi, [rbp - 0xc8]
0x1007c47b3: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1007c47b8: add r14, 0x428
0x1007c47bf: lea rsi, [rbp - 0x230]
0x1007c47c6: mov rdi, r14
0x1007c47c9: call 0x1007c5970 ; 0x1007c5970
0x1007c47ce: mov r14, rax
0x1007c47d1: mov qword ptr [rbp - 0x238], rdx
0x1007c47d8: cmp r14, rdx
0x1007c47db: je 0x1007c4990
0x1007c47e1: lea r15, [rbp - 0x210]
0x1007c47e8: lea rbx, [rbp - 0x218]
0x1007c47ef: mov rax, qword ptr [rbp - 0x240]
0x1007c47f6: mov qword ptr [rbp - 0x218], rax
0x1007c47fd: mov rax, qword ptr [rbp - 0x248]
0x1007c4804: mov qword ptr [rbp - 0xc8], rax
0x1007c480b: lea rdi, [rbp - 0xc8]
0x1007c4812: mov rsi, r15
0x1007c4815: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1007c481a: mov qword ptr [rbp - 0x40], 0
0x1007c4822: mov dword ptr [rbp - 0x38], 0xffffffff
0x1007c4829: mov qword ptr [rbp - 0x218], r13
0x1007c4830: mov qword ptr [rbp - 0xc8], r12
0x1007c4837: mov edx, 2
0x1007c483c: mov rdi, r15
0x1007c483f: lea rsi, [rip + 0x3bef5b] ; 0x100b837a1 Resources
0x1007c4846: call 0x1007a56a0 ; 0x1007a56a0
0x1007c484b: mov edx, 0x15
0x1007c4850: mov rdi, rbx
0x1007c4853: lea rsi, [rip + 0x3e01bb] ; 0x100ba4a15   A resource of type 
0x1007c485a: call 0x100011930 ; 0x100011930
0x1007c485f: mov rbx, rax
0x1007c4862: mov rax, qword ptr [r14 + 0x28]
0x1007c4866: test rax, rax
0x1007c4869: je 0x1007c4880
0x1007c486b: mov edi, dword ptr [rax + 8]
0x1007c486e: call 0x1007abd30 ; 0x1007abd30
0x1007c4873: jmp 0x1007c4885 ; 0x1007c4885
0x1007c4875: nop word ptr cs:[rax + rax]
0x1007c4880: call 0x1007abbf0 ; 0x1007abbf0
0x1007c4885: mov rcx, qword ptr [rax]
0x1007c4888: mov rdi, rax
0x1007c488b: call qword ptr [rcx + 0x68]
0x1007c488e: test rax, rax
0x1007c4891: jne 0x1007c4898
0x1007c4893: call 0x1007abc60 ; 0x1007abc60
0x1007c4898: mov r13, r15
0x1007c489b: mov r15, qword ptr [rax + 8]
0x1007c489f: mov rdi, r15
0x1007c48a2: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1007c48a7: mov rdi, rbx
0x1007c48aa: mov rsi, r15
0x1007c48ad: mov r15, r13
0x1007c48b0: mov rdx, rax
0x1007c48b3: call 0x100011930 ; 0x100011930
0x1007c48b8: mov edx, 0xa
0x1007c48bd: mov rdi, rax
0x1007c48c0: lea rsi, [rip + 0x3e0164] ; 0x100ba4a2b  is named 
0x1007c48c7: call 0x100011930 ; 0x100011930
0x1007c48cc: mov rbx, rax
0x1007c48cf: mov r15, qword ptr [rbp - 0x230]
0x1007c48d6: mov rdi, r15
0x1007c48d9: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1007c48de: mov rdi, rbx
0x1007c48e1: mov rsi, r15
0x1007c48e4: mov r15, r13
0x1007c48e7: mov rdx, rax
0x1007c48ea: call 0x100011930 ; 0x100011930
0x1007c48ef: mov edx, 1
0x1007c48f4: mov rdi, rax
0x1007c48f7: lea rsi, [rip + 0x3aee9c] ; 0x100b7379a .
0x1007c48fe: call 0x100011930 ; 0x100011930
0x1007c4903: mov r13, qword ptr [rbp - 0x220]
0x1007c490a: mov qword ptr [rbp - 0x218], r13
0x1007c4911: mov qword ptr [rbp - 0xc8], r12
0x1007c4918: mov rdi, r15
0x1007c491b: call 0x1007a58d0 ; 0x1007a58d0
0x1007c4920: lea rbx, [rbp - 0x218]
0x1007c4927: mov rdi, rbx
0x1007c492a: mov rsi, qword ptr [rbp - 0x228]
0x1007c4931: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1007c4936: lea rdi, [rbp - 0xc8]
0x1007c493d: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1007c4942: mov rcx, qword ptr [r14 + 8]
0x1007c4946: test rcx, rcx
0x1007c4949: je 0x1007c4960
0x1007c494b: nop dword ptr [rax + rax]
0x1007c4950: mov rax, rcx
0x1007c4953: mov rcx, qword ptr [rax]
0x1007c4956: test rcx, rcx
0x1007c4959: jne 0x1007c4950
0x1007c495b: jmp 0x1007c4980 ; 0x1007c4980
0x1007c495d: nop dword ptr [rax]
0x1007c4960: mov rax, qword ptr [r14 + 0x10]
0x1007c4964: cmp qword ptr [rax], r14
0x1007c4967: je 0x1007c4980
0x1007c4969: add r14, 0x10
0x1007c496d: nop dword ptr [rax]
0x1007c4970: mov rcx, qword ptr [r14]
0x1007c4973: mov rax, qword ptr [rcx + 0x10]
0x1007c4977: cmp qword ptr [rax], rcx
0x1007c497a: lea r14, [rcx + 0x10]
0x1007c497e: jne 0x1007c4970
0x1007c4980: mov r14, rax
0x1007c4983: cmp rax, qword ptr [rbp - 0x238]
0x1007c498a: jne 0x1007c47ef
0x1007c4990: mov rax, qword ptr [rip + 0x448f41] ; 0x100c0d8d8
0x1007c4997: mov rax, qword ptr [rax]
0x1007c499a: cmp rax, qword ptr [rbp - 0x30]
0x1007c499e: jne 0x1007c49b2
0x1007c49a0: add rsp, 0x228
0x1007c49a7: pop rbx
0x1007c49a8: pop r12
0x1007c49aa: pop r13
0x1007c49ac: pop r14
0x1007c49ae: pop r15
0x1007c49b0: pop rbp
0x1007c49b1: ret 
0x1007c49b2: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1007c49b7: mov rbx, rax
0x1007c49ba: jmp 0x1007c49e1 ; 0x1007c49e1
0x1007c49bc: mov rbx, rax
0x1007c49bf: jmp 0x1007c4a34 ; 0x1007c4a34
0x1007c49c1: mov rbx, rax
0x1007c49c4: mov rax, qword ptr [rbp - 0x220]
0x1007c49cb: mov qword ptr [rbp - 0x218], rax
0x1007c49d2: mov qword ptr [rbp - 0xc8], r12
0x1007c49d9: mov rdi, r15
0x1007c49dc: call 0x1007a58d0 ; 0x1007a58d0
0x1007c49e1: mov rsi, qword ptr [rip + 0x445b98] ; 0x100c0a580
0x1007c49e8: add rsi, 8
0x1007c49ec: lea rdi, [rbp - 0x218]
0x1007c49f3: jmp 0x1007c4a2f ; 0x1007c4a2f
0x1007c49f5: jmp 0x1007c4a01 ; 0x1007c4a01
0x1007c49f7: mov rbx, rax
0x1007c49fa: jmp 0x1007c4a21 ; 0x1007c4a21
0x1007c49fc: mov rbx, rax
0x1007c49ff: jmp 0x1007c4a34 ; 0x1007c4a34
0x1007c4a01: mov rbx, rax
0x1007c4a04: mov rax, qword ptr [rbp - 0x220]
0x1007c4a0b: mov qword ptr [rbp - 0x218], rax
0x1007c4a12: mov qword ptr [rbp - 0xc8], r12
0x1007c4a19: mov rdi, r15
0x1007c4a1c: call 0x1007a58d0 ; 0x1007a58d0
0x1007c4a21: lea rdi, [rbp - 0x218]
0x1007c4a28: mov rsi, qword ptr [rbp - 0x228]
0x1007c4a2f: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1007c4a34: lea rdi, [rbp - 0xc8]
0x1007c4a3b: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1007c4a40: mov rdi, rbx
0x1007c4a43: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1007c4a48: nop dword ptr [rax + rax]
