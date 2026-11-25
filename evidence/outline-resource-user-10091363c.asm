0x10091363c: push rbp
0x10091363d: mov rbp, rsp
0x100913640: push r15
0x100913642: push r14
0x100913644: push r12
0x100913646: push rbx
0x100913647: sub rsp, 0x120
0x10091364e: mov r15, rsi
0x100913651: mov r14, rdi
0x100913654: mov rax, qword ptr [rip + 0x2fa27d] ; 0x100c0d8d8
0x10091365b: mov rax, qword ptr [rax]
0x10091365e: mov qword ptr [rbp - 0x28], rax
0x100913662: lea rdx, [rbp - 0x140]
0x100913669: mov qword ptr [rdx], 0
0x100913670: lea rsi, [rbp - 0x138]
0x100913677: call 0x100915768 ; 0x100915768
0x10091367c: mov ebx, eax
0x10091367e: test ebx, ebx
0x100913680: jne 0x1009136d5
0x100913682: mov rax, qword ptr [rbp - 0x138]
0x100913689: mov eax, dword ptr [rax + 0x110]
0x10091368f: test eax, eax
0x100913691: je 0x1009136bc
0x100913693: mov rax, qword ptr [rbp - 0x138]
0x10091369a: mov eax, dword ptr [rax + 0x110]
0x1009136a0: cmp eax, 7
0x1009136a3: je 0x1009136bc
0x1009136a5: mov rax, qword ptr [rbp - 0x138]
0x1009136ac: mov eax, dword ptr [rax + 0x110]
0x1009136b2: mov ebx, 0x2e
0x1009136b7: cmp eax, 5
0x1009136ba: jne 0x1009136d5
0x1009136bc: mov rdi, qword ptr [rbp - 0x138]
0x1009136c3: mov rax, qword ptr [rdi]
0x1009136c6: mov rsi, r15
0x1009136c9: call qword ptr [rax + 0x168]
0x1009136cf: mov ebx, eax
0x1009136d1: test ebx, ebx
0x1009136d3: je 0x100913717
0x1009136d5: lea rax, [rip + 0x408164] ; 0x100d1b840
0x1009136dc: mov rax, qword ptr [rax]
0x1009136df: cmp byte ptr [rax + 0x10], 0
0x1009136e3: jns 0x100913719
0x1009136e5: lea r12, [rbp - 0x130]
0x1009136ec: mov esi, 0x100
0x1009136f1: mov rdi, r12
0x1009136f4: mov rdx, r15
0x1009136f7: call 0x100889a1d ; 0x100889a1d
0x1009136fc: lea rcx, [rip + 0x2a632f] ; 0x100bb9a32 Sound::getMusicSpeed
0x100913703: mov esi, 5
0x100913708: mov edi, ebx
0x10091370a: mov rdx, r14
0x10091370d: mov r8, r12
0x100913710: call 0x1008d5195 ; 0x1008d5195
0x100913715: jmp 0x100913719 ; 0x100913719
0x100913717: xor ebx, ebx
0x100913719: mov rdi, qword ptr [rbp - 0x140]
0x100913720: test rdi, rdi
0x100913723: je 0x10091373e
0x100913725: mov esi, 0xa
0x10091372a: call 0x10089772e ; 0x10089772e
0x10091372f: test eax, eax
0x100913731: jne 0x10091373e
0x100913733: mov qword ptr [rbp - 0x140], 0
0x10091373e: mov rax, qword ptr [rip + 0x2fa193] ; 0x100c0d8d8
0x100913745: mov rax, qword ptr [rax]
0x100913748: cmp rax, qword ptr [rbp - 0x28]
0x10091374c: jne 0x100913760
0x10091374e: mov eax, ebx
0x100913750: add rsp, 0x120
0x100913757: pop rbx
0x100913758: pop r12
0x10091375a: pop r14
0x10091375c: pop r15
0x10091375e: pop rbp
0x10091375f: ret 
0x100913760: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100913765: nop 
