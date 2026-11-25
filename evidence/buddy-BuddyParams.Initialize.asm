0x1001cf940: push rbp
0x1001cf941: mov rbp, rsp
0x1001cf944: push r15
0x1001cf946: push r14
0x1001cf948: push rbx
0x1001cf949: sub rsp, 0x108
0x1001cf950: mov rbx, rdi
0x1001cf953: mov rax, qword ptr [rip + 0xa3df7e] ; 0x100c0d8d8
0x1001cf95a: mov rax, qword ptr [rax]
0x1001cf95d: mov qword ptr [rbp - 0x20], rax
0x1001cf961: cmp byte ptr [rbx + 0x3c], 0
0x1001cf965: jne 0x1001cfacc
0x1001cf96b: test byte ptr [rbx + 0x10], 1
0x1001cf96f: jne 0x1001cf97a
0x1001cf971: lea r14, [rbx + 0x10]
0x1001cf975: inc r14
0x1001cf978: jmp 0x1001cf98c ; 0x1001cf98c
0x1001cf97a: mov rax, qword ptr [rbx + 0x20]
0x1001cf97e: test rax, rax
0x1001cf981: lea r14, [rip + 0x9d5450] ; 0x100ba4dd8
0x1001cf988: cmovne r14, rax
0x1001cf98c: lea rsi, [rip + 0x9a8f1e] ; 0x100b788b1 %sIdle
0x1001cf993: lea rdi, [rbp - 0x120]
0x1001cf99a: xor eax, eax
0x1001cf99c: mov rdx, r14
0x1001cf99f: call 0x100aa2be2 ; 0x100aa2be2 _sprintf
0x1001cf9a4: mov rdx, qword ptr [rbx + 8]
0x1001cf9a8: test byte ptr [rdx + 0x58], 1
0x1001cf9ac: jne 0x1001cf9b7
0x1001cf9ae: add rdx, 0x58
0x1001cf9b2: inc rdx
0x1001cf9b5: jmp 0x1001cf9bb ; 0x1001cf9bb
0x1001cf9b7: mov rdx, qword ptr [rdx + 0x68]
0x1001cf9bb: lea r15, [rbp - 0x120]
0x1001cf9c2: xor esi, esi
0x1001cf9c4: mov rdi, r15
0x1001cf9c7: call 0x1000962f0 ; 0x1000962f0
0x1001cf9cc: mov dword ptr [rbx + 0x40], eax
0x1001cf9cf: lea rsi, [rip + 0x9a8ee2] ; 0x100b788b8 %sWalk
0x1001cf9d6: xor eax, eax
0x1001cf9d8: mov rdi, r15
0x1001cf9db: mov rdx, r14
0x1001cf9de: call 0x100aa2be2 ; 0x100aa2be2 _sprintf
0x1001cf9e3: mov rdx, qword ptr [rbx + 8]
0x1001cf9e7: test byte ptr [rdx + 0x58], 1
0x1001cf9eb: jne 0x1001cf9f6
0x1001cf9ed: add rdx, 0x58
0x1001cf9f1: inc rdx
0x1001cf9f4: jmp 0x1001cf9fa ; 0x1001cf9fa
0x1001cf9f6: mov rdx, qword ptr [rdx + 0x68]
0x1001cf9fa: lea r15, [rbp - 0x120]
0x1001cfa01: xor esi, esi
0x1001cfa03: mov rdi, r15
0x1001cfa06: call 0x1000962f0 ; 0x1000962f0
0x1001cfa0b: mov dword ptr [rbx + 0x44], eax
0x1001cfa0e: lea rsi, [rip + 0x9a8eaa] ; 0x100b788bf %sRun
0x1001cfa15: xor eax, eax
0x1001cfa17: mov rdi, r15
0x1001cfa1a: mov rdx, r14
0x1001cfa1d: call 0x100aa2be2 ; 0x100aa2be2 _sprintf
0x1001cfa22: mov rdx, qword ptr [rbx + 8]
0x1001cfa26: test byte ptr [rdx + 0x58], 1
0x1001cfa2a: jne 0x1001cfa35
0x1001cfa2c: add rdx, 0x58
0x1001cfa30: inc rdx
0x1001cfa33: jmp 0x1001cfa39 ; 0x1001cfa39
0x1001cfa35: mov rdx, qword ptr [rdx + 0x68]
0x1001cfa39: lea r15, [rbp - 0x120]
0x1001cfa40: xor esi, esi
0x1001cfa42: mov rdi, r15
0x1001cfa45: call 0x1000962f0 ; 0x1000962f0
0x1001cfa4a: mov dword ptr [rbx + 0x48], eax
0x1001cfa4d: lea rsi, [rip + 0x9a8e71] ; 0x100b788c5 %sEnterBored
0x1001cfa54: xor eax, eax
0x1001cfa56: mov rdi, r15
0x1001cfa59: mov rdx, r14
0x1001cfa5c: call 0x100aa2be2 ; 0x100aa2be2 _sprintf
0x1001cfa61: mov rdx, qword ptr [rbx + 8]
0x1001cfa65: test byte ptr [rdx + 0x58], 1
0x1001cfa69: jne 0x1001cfa74
0x1001cfa6b: add rdx, 0x58
0x1001cfa6f: inc rdx
0x1001cfa72: jmp 0x1001cfa78 ; 0x1001cfa78
0x1001cfa74: mov rdx, qword ptr [rdx + 0x68]
0x1001cfa78: lea r15, [rbp - 0x120]
0x1001cfa7f: xor esi, esi
0x1001cfa81: mov rdi, r15
0x1001cfa84: call 0x1000962f0 ; 0x1000962f0
0x1001cfa89: mov dword ptr [rbx + 0x4c], eax
0x1001cfa8c: lea rsi, [rip + 0x9a8e3f] ; 0x100b788d2 %sExitBored
0x1001cfa93: xor eax, eax
0x1001cfa95: mov rdi, r15
0x1001cfa98: mov rdx, r14
0x1001cfa9b: call 0x100aa2be2 ; 0x100aa2be2 _sprintf
0x1001cfaa0: mov rdx, qword ptr [rbx + 8]
0x1001cfaa4: test byte ptr [rdx + 0x58], 1
0x1001cfaa8: jne 0x1001cfab3
0x1001cfaaa: add rdx, 0x58
0x1001cfaae: inc rdx
0x1001cfab1: jmp 0x1001cfab7 ; 0x1001cfab7
0x1001cfab3: mov rdx, qword ptr [rdx + 0x68]
0x1001cfab7: lea rdi, [rbp - 0x120]
0x1001cfabe: xor esi, esi
0x1001cfac0: call 0x1000962f0 ; 0x1000962f0
0x1001cfac5: mov dword ptr [rbx + 0x50], eax
0x1001cfac8: mov byte ptr [rbx + 0x3c], 1
0x1001cfacc: mov rax, qword ptr [rip + 0xa3de05] ; 0x100c0d8d8
0x1001cfad3: mov rax, qword ptr [rax]
0x1001cfad6: cmp rax, qword ptr [rbp - 0x20]
0x1001cfada: jne 0x1001cfaea
0x1001cfadc: add rsp, 0x108
0x1001cfae3: pop rbx
0x1001cfae4: pop r14
0x1001cfae6: pop r15
0x1001cfae8: pop rbp
0x1001cfae9: ret 
0x1001cfaea: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1001cfaef: nop 
