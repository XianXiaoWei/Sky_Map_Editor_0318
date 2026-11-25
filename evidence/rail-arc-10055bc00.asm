0x10055bb60: push rbp
0x10055bb61: mov rbp, rsp
0x10055bb64: push r14
0x10055bb66: push rbx
0x10055bb67: mov r14, rdi
0x10055bb6a: mov eax, 0x7f8
0x10055bb6f: nop 
0x10055bb70: mov byte ptr [r14 + rax - 0x700], 0
0x10055bb79: mov byte ptr [r14 + rax - 0x600], 0
0x10055bb82: mov byte ptr [r14 + rax - 0x500], 0
0x10055bb8b: mov byte ptr [r14 + rax - 0x400], 0
0x10055bb94: mov byte ptr [r14 + rax - 0x300], 0
0x10055bb9d: mov byte ptr [r14 + rax - 0x200], 0
0x10055bba6: mov byte ptr [r14 + rax - 0x100], 0
0x10055bbaf: mov byte ptr [r14 + rax], 0
0x10055bbb4: add rax, 0x800
0x10055bbba: cmp rax, 0xa7f8
0x10055bbc0: jne 0x10055bb70
0x10055bbc2: xor ebx, ebx
0x10055bbc4: xor eax, eax
0x10055bbc6: call 0x100011c10 ; 0x100011c10
0x10055bbcb: xor eax, eax
0x10055bbcd: nop dword ptr [rax]
0x10055bbd0: lea rcx, [r14 + rbx + 0x9f10]
0x10055bbd8: mov qword ptr [r14 + rbx + 0x9f10], rax
0x10055bbe0: lea rax, [r14 + rbx + 0x9e10]
0x10055bbe8: mov qword ptr [r14 + rbx + 0x9e10], rcx
0x10055bbf0: lea rcx, [r14 + rbx + 0x9d10]
0x10055bbf8: mov qword ptr [r14 + rbx + 0x9d10], rax
0x10055bc00: lea rdx, [r14 + rbx + 0x9c10]
0x10055bc08: mov qword ptr [r14 + rbx + 0x9c10], rcx
0x10055bc10: lea rax, [r14 + rbx + 0x9b10]
0x10055bc18: mov qword ptr [r14 + rbx + 0x9b10], rdx
0x10055bc20: add rbx, -0x500
0x10055bc27: cmp ebx, 0xffff6000
0x10055bc2d: jne 0x10055bbd0
0x10055bc2f: lea rax, [r14 + 0x10]
0x10055bc33: mov qword ptr [r14 + 0xa010], rax
0x10055bc3a: pop rbx
0x10055bc3b: pop r14
0x10055bc3d: pop rbp
0x10055bc3e: ret 
0x10055bc3f: nop 
