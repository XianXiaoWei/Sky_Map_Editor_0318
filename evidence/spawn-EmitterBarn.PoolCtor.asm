0x1002de1b0: push rbp
0x1002de1b1: mov rbp, rsp
0x1002de1b4: mov qword ptr [rdi + 0x100028], rdx
0x1002de1bb: mov qword ptr [rdi + 0x100030], rcx
0x1002de1c2: mov dword ptr [rdi + 0x100020], 1
0x1002de1cc: lea rax, [rdi + 0x100010]
0x1002de1d3: lea rcx, [rdi + 0x210]
0x1002de1da: mov edx, 2
0x1002de1df: xor r8d, r8d
0x1002de1e2: nop word ptr cs:[rax + rax]
0x1002de1f0: mov qword ptr [rcx - 0x1f8], rcx
0x1002de1f7: mov qword ptr [rcx - 0x1f0], 0xffffffffffffffff
0x1002de202: mov qword ptr [rcx - 0x1e8], rax
0x1002de209: lea rsi, [rcx + 0x200]
0x1002de210: cmp rdx, 0x800
0x1002de217: cmovae rsi, r8
0x1002de21b: mov qword ptr [rcx + 8], rsi
0x1002de21f: mov qword ptr [rcx + 0x10], 0xffffffffffffffff
0x1002de227: mov qword ptr [rcx + 0x18], rax
0x1002de22b: add rcx, 0x400
0x1002de232: add rdx, 2
0x1002de236: cmp rdx, 0x802
0x1002de23d: jne 0x1002de1f0
0x1002de23f: lea rax, [rdi + 0x10]
0x1002de243: mov qword ptr [rdi + 0x100010], rax
0x1002de24a: mov qword ptr [rdi + 0x100018], 0
0x1002de255: pop rbp
0x1002de256: ret 
0x1002de257: nop word ptr [rax + rax]
