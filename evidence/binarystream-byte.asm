0x10076ae50: push rbp
0x10076ae51: mov rbp, rsp
0x10076ae54: push rbx
0x10076ae55: push rax
0x10076ae56: mov rbx, rsi
0x10076ae59: movzx eax, byte ptr [rbx]
0x10076ae5c: mov dword ptr [rbp - 0xc], eax
0x10076ae5f: lea rsi, [rbp - 0xc]
0x10076ae63: call 0x10076ad40 ; 0x10076ad40
0x10076ae68: mov al, byte ptr [rbp - 0xc]
0x10076ae6b: mov byte ptr [rbx], al
0x10076ae6d: add rsp, 8
0x10076ae71: pop rbx
0x10076ae72: pop rbp
0x10076ae73: ret 
0x10076ae74: nop word ptr cs:[rax + rax]
