0x10022bdc0: push rbp
0x10022bdc1: mov rbp, rsp
0x10022bdc4: push r14
0x10022bdc6: push rbx
0x10022bdc7: mov r14, rdi
0x10022bdca: xor eax, eax
0x10022bdcc: nop dword ptr [rax]
0x10022bdd0: mov byte ptr [r14 + rax + 0x2007c], 0
0x10022bdd9: mov byte ptr [r14 + rax + 0x2009c], 0
0x10022bde2: mov byte ptr [r14 + rax + 0x200bc], 0
0x10022bdeb: mov byte ptr [r14 + rax + 0x200dc], 0
0x10022bdf4: mov byte ptr [r14 + rax + 0x200fc], 0
0x10022bdfd: mov byte ptr [r14 + rax + 0x2011c], 0
0x10022be06: mov byte ptr [r14 + rax + 0x2013c], 0
0x10022be0f: mov byte ptr [r14 + rax + 0x2015c], 0
0x10022be18: add rax, 0x100
0x10022be1e: cmp rax, 0xa000
0x10022be24: jne 0x10022bdd0
0x10022be26: xor ebx, ebx
0x10022be28: xor eax, eax
0x10022be2a: call 0x100011c10 ; 0x100011c10
0x10022be2f: xor eax, eax
0x10022be31: nop word ptr cs:[rax + rax]
0x10022be40: lea rcx, [r14 + rbx + 0x2a048]
0x10022be48: mov qword ptr [r14 + rbx + 0x2a048], rax
0x10022be50: lea rax, [r14 + rbx + 0x2a028]
0x10022be58: mov qword ptr [r14 + rbx + 0x2a028], rcx
0x10022be60: lea rcx, [r14 + rbx + 0x2a008]
0x10022be68: mov qword ptr [r14 + rbx + 0x2a008], rax
0x10022be70: lea rdx, [r14 + rbx + 0x29fe8]
0x10022be78: mov qword ptr [r14 + rbx + 0x29fe8], rcx
0x10022be80: lea rax, [r14 + rbx + 0x29fc8]
0x10022be88: mov qword ptr [r14 + rbx + 0x29fc8], rdx
0x10022be90: add rbx, -0xa0
0x10022be97: cmp ebx, 0xffff6000
0x10022be9d: jne 0x10022be40
0x10022be9f: lea rax, [r14 + 0x20068]
0x10022bea6: mov qword ptr [r14 + 0x2a068], rax
0x10022bead: pop rbx
0x10022beae: pop r14
0x10022beb0: pop rbp
0x10022beb1: ret 
0x10022beb2: nop word ptr cs:[rax + rax]
