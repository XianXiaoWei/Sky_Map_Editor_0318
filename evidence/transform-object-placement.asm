0x1006d94c0: push rbp
0x1006d94c1: mov rbp, rsp
0x1006d94c4: push rbx
0x1006d94c5: push rax
0x1006d94c6: mov rbx, rsi
0x1006d94c9: mov rdi, rbx
0x1006d94cc: call 0x10032eea0 ; 0x10032eea0
0x1006d94d1: mov rax, qword ptr [rip + 0x195d798] ; 0x102036c70
0x1006d94d8: mov eax, dword ptr [rax + 0x38]
0x1006d94db: mov dword ptr [rbx + 8], eax
0x1006d94de: lea rax, [rip + 0x54bf0b] ; 0x100c253f0
0x1006d94e5: mov qword ptr [rbx], rax
0x1006d94e8: mov qword ptr [rbx + 0x38], 0
0x1006d94f0: mov qword ptr [rbx + 0x48], 0
0x1006d94f8: mov byte ptr [rbx + 0x74], 0
0x1006d94fc: vxorps xmm0, xmm0, xmm0
0x1006d9500: vmovups xmmword ptr [rbx + 0x80], xmm0
0x1006d9508: mov qword ptr [rbx + 0x90], 0
0x1006d9513: mov qword ptr [rbx + 0xa8], 0
0x1006d951e: mov qword ptr [rbx + 0xc0], 0
0x1006d9529: mov word ptr [rbx + 0xd1], 0
0x1006d9532: mov rax, rbx
0x1006d9535: add rsp, 8
0x1006d9539: pop rbx
0x1006d953a: pop rbp
0x1006d953b: ret 
0x1006d953c: nop dword ptr [rax]
