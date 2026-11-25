0x100216510: push rbp
0x100216511: mov rbp, rsp
0x100216514: mov eax, dword ptr [rdx + 4]
0x100216517: imul eax, dword ptr [rsi + 8]
0x10021651b: add eax, dword ptr [rsi + 4]
0x10021651e: imul eax, dword ptr [rdx]
0x100216521: add eax, dword ptr [rsi]
0x100216523: cmp dword ptr [rdi + rax*4], -1
0x100216527: setne al
0x10021652a: pop rbp
0x10021652b: ret 
0x10021652c: nop dword ptr [rax]
