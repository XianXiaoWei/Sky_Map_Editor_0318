0x100199280: push rbp
0x100199281: mov rbp, rsp
0x100199284: push rbx
0x100199285: push rax
0x100199286: mov rbx, rsi
0x100199289: call 0x1007abc10 ; 0x1007abc10
0x10019928e: mov eax, dword ptr [rax + 0x38]
0x100199291: mov dword ptr [rbx + 8], eax
0x100199294: call 0x10074a170 ; 0x10074a170
0x100199299: mov eax, dword ptr [rax + 0x38]
0x10019929c: mov dword ptr [rbx + 8], eax
0x10019929f: mov rax, qword ptr [rip + 0xa743ca] ; 0x100c0d670
0x1001992a6: add rax, 0x10
0x1001992aa: mov qword ptr [rbx], rax
0x1001992ad: call 0x100407ab0 ; 0x100407ab0
0x1001992b2: mov rax, qword ptr [rip + 0x1c3fd47] ; 0x101dd9000
0x1001992b9: mov eax, dword ptr [rax + 0x38]
0x1001992bc: mov dword ptr [rbx + 8], eax
0x1001992bf: lea rax, [rip + 0xa79492] ; 0x100c12758
0x1001992c6: mov qword ptr [rbx], rax
0x1001992c9: vxorps xmm0, xmm0, xmm0
0x1001992cd: vmovups xmmword ptr [rbx + 0x58], xmm0
0x1001992d2: mov qword ptr [rbx + 0x68], 0
0x1001992da: mov rax, rbx
0x1001992dd: add rsp, 8
0x1001992e1: pop rbx
0x1001992e2: pop rbp
0x1001992e3: ret 
0x1001992e4: nop word ptr cs:[rax + rax]
