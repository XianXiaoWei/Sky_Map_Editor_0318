0x10032f110: push rbp
0x10032f111: mov rbp, rsp
0x10032f114: cmp dword ptr [rdi + 0x28], 1
0x10032f118: jne 0x10032f128
0x10032f11a: movzx eax, word ptr [rdi + 0x2c]
0x10032f11e: cmp eax, 0xffff
0x10032f123: setne al
0x10032f126: pop rbp
0x10032f127: ret 
0x10032f128: xor eax, eax
0x10032f12a: pop rbp
0x10032f12b: ret 
0x10032f12c: nop dword ptr [rax]
