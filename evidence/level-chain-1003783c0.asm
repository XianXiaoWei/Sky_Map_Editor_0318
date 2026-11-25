0x1003783c0: push rbp
0x1003783c1: mov rbp, rsp
0x1003783c4: push r14
0x1003783c6: push rbx
0x1003783c7: sub rsp, 0x110
0x1003783ce: mov rbx, rdi
0x1003783d1: mov rax, qword ptr [rip + 0x895500] ; 0x100c0d8d8
0x1003783d8: mov rax, qword ptr [rax]
0x1003783db: mov qword ptr [rbp - 0x18], rax
0x1003783df: mov rdi, qword ptr [rbx + 0x1068]
0x1003783e6: mov edx, dword ptr [rbx + 0x1560]
0x1003783ec: lea rsi, [rip + 0x7e8668] ; 0x100b60a5b OnLevelUnload
0x1003783f3: mov ecx, 1
0x1003783f8: call 0x1007b1b40 ; 0x1007b1b40
0x1003783fd: mov rdi, qword ptr [rbx + 0x1068]
0x100378404: mov edx, dword ptr [rbx + 0x1560]
0x10037840a: lea rsi, [rip + 0x80b445] ; 0x100b83856 OnLevelUnloadLate
0x100378411: mov ecx, 1
0x100378416: call 0x1007b1b40 ; 0x1007b1b40
0x10037841b: mov rcx, qword ptr [rbx + 0x610]
0x100378422: lea rdx, [rip + 0x80b796] ; 0x100b83bbf Data/Levels/%s/Resources.lua
0x100378429: lea r14, [rbp - 0x120]
0x100378430: mov esi, 0x100
0x100378435: xor eax, eax
0x100378437: mov rdi, r14
0x10037843a: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x10037843f: mov rsi, qword ptr [rbx + 0x18]
0x100378443: mov rdi, qword ptr [rbx + 0x140]
0x10037844a: mov rdx, r14
0x10037844d: call 0x1007c2bd0 ; 0x1007c2bd0
0x100378452: mov rdi, qword ptr [rbx + 0x140]
0x100378459: call 0x1007c3010 ; 0x1007c3010
0x10037845e: vxorps ymm0, ymm0, ymm0
0x100378462: vmovups ymmword ptr [rbx + 0x1378], ymm0
0x10037846a: mov rax, qword ptr [rip + 0x895467] ; 0x100c0d8d8
0x100378471: mov rax, qword ptr [rax]
0x100378474: cmp rax, qword ptr [rbp - 0x18]
0x100378478: jne 0x100378489
0x10037847a: add rsp, 0x110
0x100378481: pop rbx
0x100378482: pop r14
0x100378484: pop rbp
0x100378485: vzeroupper 
0x100378488: ret 
0x100378489: vzeroupper 
0x10037848c: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100378491: nop word ptr cs:[rax + rax]
