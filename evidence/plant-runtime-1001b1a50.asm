0x1001b1a50: push rbp
0x1001b1a51: mov rbp, rsp
0x1001b1a54: xor eax, eax
0x1001b1a56: mov ecx, 0x411
0x1001b1a5b: nop dword ptr [rax + rax]
0x1001b1a60: movzx edx, byte ptr [rdi + rcx - 0x360]
0x1001b1a68: add edx, eax
0x1001b1a6a: movzx eax, byte ptr [rdi + rcx - 0x240]
0x1001b1a72: add eax, edx
0x1001b1a74: movzx edx, byte ptr [rdi + rcx - 0x120]
0x1001b1a7c: add edx, eax
0x1001b1a7e: movzx eax, byte ptr [rdi + rcx]
0x1001b1a82: add eax, edx
0x1001b1a84: add rcx, 0x480
0x1001b1a8b: cmp rcx, 0x12411
0x1001b1a92: jne 0x1001b1a60
0x1001b1a94: pop rbp
0x1001b1a95: ret 
0x1001b1a96: nop word ptr cs:[rax + rax]
