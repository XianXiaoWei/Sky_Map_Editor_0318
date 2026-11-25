0x10055bd40: push rbp
0x10055bd41: mov rbp, rsp
0x10055bd44: push r14
0x10055bd46: push rbx
0x10055bd47: mov r14, rdi
0x10055bd4a: xor ebx, ebx
0x10055bd4c: nop dword ptr [rax]
0x10055bd50: cmp byte ptr [r14 + rbx + 0xf8], 0
0x10055bd59: je 0x10055bd6d
0x10055bd5b: cmp byte ptr [r14 + rbx + 0x50], 0
0x10055bd61: je 0x10055bd6d
0x10055bd63: lea rdi, [r14 + rbx + 0x10]
0x10055bd68: call 0x10055cf30 ; 0x10055cf30
0x10055bd6d: add rbx, 0x100
0x10055bd74: cmp rbx, 0xa000
0x10055bd7b: jne 0x10055bd50
0x10055bd7d: pop rbx
0x10055bd7e: pop r14
0x10055bd80: pop rbp
0x10055bd81: ret 
0x10055bd82: nop word ptr cs:[rax + rax]
