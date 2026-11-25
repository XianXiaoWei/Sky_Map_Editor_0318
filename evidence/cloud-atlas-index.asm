0x100216480: push rbp
0x100216481: mov rbp, rsp
0x100216484: inc r8d
0x100216487: mov eax, dword ptr [rcx + 8]
0x10021648a: imul eax, edx
0x10021648d: add eax, esi
0x10021648f: imul eax, r8d
0x100216493: add eax, dword ptr [rcx + 4]
0x100216496: imul eax, edx
0x100216499: add eax, edi
0x10021649b: imul eax, r8d
0x10021649f: add eax, dword ptr [rcx]
0x1002164a1: pop rbp
0x1002164a2: ret 
0x1002164a3: nop word ptr cs:[rax + rax]
