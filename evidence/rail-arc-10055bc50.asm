0x10055bc50: push rbp
0x10055bc51: mov rbp, rsp
0x10055bc54: push r15
0x10055bc56: push r14
0x10055bc58: push rbx
0x10055bc59: push rax
0x10055bc5a: mov r14, rdi
0x10055bc5d: mov rbx, 0xffffffffffff6000
0x10055bc64: nop word ptr cs:[rax + rax]
0x10055bc70: cmp byte ptr [r14 + rbx + 0xa0f8], 0
0x10055bc79: je 0x10055bc98
0x10055bc7b: lea r15, [r14 + rbx + 0xa010]
0x10055bc83: mov rdi, r15
0x10055bc86: call 0x10055cc60 ; 0x10055cc60
0x10055bc8b: mov esi, 0x20
0x10055bc90: mov rdi, r15
0x10055bc93: call 0x10055b560 ; 0x10055b560
0x10055bc98: add rbx, 0x100
0x10055bc9f: jne 0x10055bc70
0x10055bca1: add rsp, 8
0x10055bca5: pop rbx
0x10055bca6: pop r14
0x10055bca8: pop r15
0x10055bcaa: pop rbp
0x10055bcab: ret 
0x10055bcac: nop dword ptr [rax]
