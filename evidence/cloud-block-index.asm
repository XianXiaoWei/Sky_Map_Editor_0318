0x1002164b0: push rbp
0x1002164b1: mov rbp, rsp
0x1002164b4: mov eax, dword ptr [rdx + 4]
0x1002164b7: imul eax, dword ptr [rsi + 8]
0x1002164bb: add eax, dword ptr [rsi + 4]
0x1002164be: imul eax, dword ptr [rdx]
0x1002164c1: add eax, dword ptr [rsi]
0x1002164c3: mov eax, dword ptr [rdi + rax*4]
0x1002164c6: imul eax, r8d
0x1002164ca: add eax, dword ptr [rcx + 8]
0x1002164cd: imul eax, r8d
0x1002164d1: add eax, dword ptr [rcx + 4]
0x1002164d4: imul eax, r8d
0x1002164d8: add eax, dword ptr [rcx]
0x1002164da: pop rbp
0x1002164db: ret 
0x1002164dc: nop dword ptr [rax]
