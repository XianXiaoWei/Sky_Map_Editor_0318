0x100198cf0: push rbp
0x100198cf1: mov rbp, rsp
0x100198cf4: push rbx
0x100198cf5: push rax
0x100198cf6: mov rbx, rsi
0x100198cf9: call 0x1007abc10 ; 0x1007abc10
0x100198cfe: mov eax, dword ptr [rax + 0x38]
0x100198d01: mov dword ptr [rbx + 8], eax
0x100198d04: call 0x10074a170 ; 0x10074a170
0x100198d09: mov eax, dword ptr [rax + 0x38]
0x100198d0c: mov dword ptr [rbx + 8], eax
0x100198d0f: mov rax, qword ptr [rip + 0xa7495a] ; 0x100c0d670
0x100198d16: add rax, 0x10
0x100198d1a: mov qword ptr [rbx], rax
0x100198d1d: call 0x100407ab0 ; 0x100407ab0
0x100198d22: mov rax, qword ptr [rip + 0x1c3ff77] ; 0x101dd8ca0
0x100198d29: mov eax, dword ptr [rax + 0x38]
0x100198d2c: mov dword ptr [rbx + 8], eax
0x100198d2f: lea rax, [rip + 0xa7999a] ; 0x100c126d0
0x100198d36: mov qword ptr [rbx], rax
0x100198d39: vxorps xmm0, xmm0, xmm0
0x100198d3d: vmovups xmmword ptr [rbx + 0x58], xmm0
0x100198d42: mov qword ptr [rbx + 0x68], 0
0x100198d4a: mov word ptr [rbx + 0x84], 0
0x100198d53: mov rax, qword ptr [rip + 0x913206] ; 0x100aabf60
0x100198d5a: mov qword ptr [rbx + 0x90], rax
0x100198d61: mov dword ptr [rbx + 0x98], 0xbf800000
0x100198d6b: mov rax, rbx
0x100198d6e: add rsp, 8
0x100198d72: pop rbx
0x100198d73: pop rbp
0x100198d74: ret 
0x100198d75: nop word ptr cs:[rax + rax]
