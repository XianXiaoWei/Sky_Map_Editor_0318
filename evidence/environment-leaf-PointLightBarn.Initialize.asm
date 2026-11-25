0x1005408d0: push rbp
0x1005408d1: mov rbp, rsp
0x1005408d4: push r14
0x1005408d6: push rbx
0x1005408d7: mov r14, rdi
0x1005408da: mov eax, 0x300
0x1005408df: nop 
0x1005408e0: mov byte ptr [r14 + rax - 0x2a0], 0
0x1005408e9: mov byte ptr [r14 + rax - 0x240], 0
0x1005408f2: mov byte ptr [r14 + rax - 0x1e0], 0
0x1005408fb: mov byte ptr [r14 + rax - 0x180], 0
0x100540904: mov byte ptr [r14 + rax - 0x120], 0
0x10054090d: mov byte ptr [r14 + rax - 0xc0], 0
0x100540916: mov byte ptr [r14 + rax - 0x60], 0
0x10054091c: mov byte ptr [r14 + rax], 0
0x100540921: add rax, 0x300
0x100540927: cmp rax, 0x6300
0x10054092d: jne 0x1005408e0
0x10054092f: xor ebx, ebx
0x100540931: xor eax, eax
0x100540933: call 0x100011c10 ; 0x100011c10
0x100540938: lea rax, [r14 + 0x5e90]
0x10054093f: xor ecx, ecx
0x100540941: nop word ptr cs:[rax + rax]
0x100540950: lea rdx, [rax + 0x120]
0x100540957: mov qword ptr [rax + 0x120], rcx
0x10054095e: lea ecx, [rbx + 0xfe]
0x100540964: and ecx, 0xfffffffe
0x100540967: lea rcx, [rcx + rcx*2]
0x10054096b: shl rcx, 5
0x10054096f: lea rsi, [r14 + rcx + 0x10]
0x100540974: mov qword ptr [r14 + rcx + 0x10], rdx
0x100540979: lea rcx, [rax + 0x60]
0x10054097d: mov qword ptr [rax + 0x60], rsi
0x100540981: mov qword ptr [rax], rcx
0x100540984: mov rcx, rax
0x100540987: add rbx, -4
0x10054098b: add rax, -0x180
0x100540991: cmp ebx, 0xffffff00
0x100540997: jne 0x100540950
0x100540999: lea rax, [r14 + 0x10]
0x10054099d: mov qword ptr [r14 + 0x6010], rax
0x1005409a4: pop rbx
0x1005409a5: pop r14
0x1005409a7: pop rbp
0x1005409a8: ret 
0x1005409a9: nop dword ptr [rax]
