0x100267210: push rbp
0x100267211: mov rbp, rsp
0x100267214: push rbx
0x100267215: push rax
0x100267216: mov rbx, rsi
0x100267219: mov rdi, rbx
0x10026721c: call 0x10032eea0 ; 0x10032eea0
0x100267221: mov rax, qword ptr [rip + 0x1b7fb58] ; 0x101de6d80
0x100267228: mov eax, dword ptr [rax + 0x38]
0x10026722b: mov dword ptr [rbx + 8], eax
0x10026722e: lea rax, [rip + 0x9aca93] ; 0x100c13cc8
0x100267235: mov qword ptr [rbx], rax
0x100267238: vxorps xmm0, xmm0, xmm0
0x10026723c: vmovups xmmword ptr [rbx + 0x38], xmm0
0x100267241: mov rax, rbx
0x100267244: add rsp, 8
0x100267248: pop rbx
0x100267249: pop rbp
0x10026724a: ret 
