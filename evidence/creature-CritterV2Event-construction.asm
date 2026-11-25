0x100266720: push rbp
0x100266721: mov rbp, rsp
0x100266724: push rbx
0x100266725: push rax
0x100266726: mov rbx, rsi
0x100266729: mov rdi, rbx
0x10026672c: call 0x10032eea0 ; 0x10032eea0
0x100266731: mov rax, qword ptr [rip + 0x1b800a8] ; 0x101de67e0
0x100266738: mov eax, dword ptr [rax + 0x38]
0x10026673b: mov dword ptr [rbx + 8], eax
0x10026673e: lea rax, [rip + 0x9ad50b] ; 0x100c13c50
0x100266745: mov qword ptr [rbx], rax
0x100266748: mov qword ptr [rbx + 0x38], 0
0x100266750: mov qword ptr [rbx + 0x50], 0
0x100266758: mov rax, rbx
0x10026675b: add rsp, 8
0x10026675f: pop rbx
0x100266760: pop rbp
0x100266761: ret 
