0x10052e070: push rbp
0x10052e071: mov rbp, rsp
0x10052e074: push r14
0x10052e076: push rbx
0x10052e077: mov edi, 0x110
0x10052e07c: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x10052e081: mov rbx, rax
0x10052e084: mov rdi, rbx
0x10052e087: call 0x10032eea0 ; 0x10032eea0
0x10052e08c: mov rax, qword ptr [rip + 0x1aeaca5] ; 0x102018d38
0x10052e093: mov eax, dword ptr [rax + 0x38]
0x10052e096: mov dword ptr [rbx + 8], eax
0x10052e099: mov rax, qword ptr [rip + 0x6df020] ; 0x100c0d0c0
0x10052e0a0: add rax, 0x10
0x10052e0a4: mov qword ptr [rbx], rax
0x10052e0a7: movabs rax, 0x40a000003f800000
0x10052e0b1: mov qword ptr [rbx + 0x40], rax
0x10052e0b5: mov dword ptr [rbx + 0x48], 0x41200000
0x10052e0bc: mov word ptr [rbx + 0x4c], 0
0x10052e0c2: vxorps xmm0, xmm0, xmm0
0x10052e0c6: vmovups xmmword ptr [rbx + 0xe8], xmm0
0x10052e0ce: mov qword ptr [rbx + 0xf8], 0
0x10052e0d9: mov rax, rbx
0x10052e0dc: pop rbx
0x10052e0dd: pop r14
0x10052e0df: pop rbp
0x10052e0e0: ret 
0x10052e0e1: mov r14, rax
0x10052e0e4: mov rdi, rbx
0x10052e0e7: call 0x100aa248c ; 0x100aa248c __ZdlPv
0x10052e0ec: mov rdi, r14
0x10052e0ef: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10052e0f4: nop word ptr cs:[rax + rax]
