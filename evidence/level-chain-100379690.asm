0x100379690: push rbp
0x100379691: mov rbp, rsp
0x100379694: push r14
0x100379696: push rbx
0x100379697: sub rsp, 0x110
0x10037969e: mov rcx, rsi
0x1003796a1: mov rbx, rdi
0x1003796a4: mov rax, qword ptr [rip + 0x89422d] ; 0x100c0d8d8
0x1003796ab: mov rax, qword ptr [rax]
0x1003796ae: mov qword ptr [rbp - 0x18], rax
0x1003796b2: lea rdx, [rip + 0x80a506] ; 0x100b83bbf Data/Levels/%s/Resources.lua
0x1003796b9: lea r14, [rbp - 0x120]
0x1003796c0: mov esi, 0x100
0x1003796c5: xor eax, eax
0x1003796c7: mov rdi, r14
0x1003796ca: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x1003796cf: mov rdi, qword ptr [rbx + 0xa8]
0x1003796d6: mov rsi, r14
0x1003796d9: call 0x1007f7ef0 ; 0x1007f7ef0
0x1003796de: mov rcx, qword ptr [rip + 0x8941f3] ; 0x100c0d8d8
0x1003796e5: mov rcx, qword ptr [rcx]
0x1003796e8: cmp rcx, qword ptr [rbp - 0x18]
0x1003796ec: jne 0x1003796fa
0x1003796ee: add rsp, 0x110
0x1003796f5: pop rbx
0x1003796f6: pop r14
0x1003796f8: pop rbp
0x1003796f9: ret 
0x1003796fa: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1003796ff: nop 
