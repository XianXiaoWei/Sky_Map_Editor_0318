0x1001e2de0: push rbp
0x1001e2de1: mov rbp, rsp
0x1001e2de4: push r14
0x1001e2de6: push rbx
0x1001e2de7: mov edi, 0x90
0x1001e2dec: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001e2df1: mov rbx, rax
0x1001e2df4: call 0x1007abc10 ; 0x1007abc10
0x1001e2df9: mov rax, qword ptr [rip + 0x1bfad58] ; 0x101dddb58
0x1001e2e00: mov eax, dword ptr [rax + 0x38]
0x1001e2e03: mov dword ptr [rbx], eax
0x1001e2e05: vmovss xmm0, dword ptr [rip + 0x8c22b3] ; 0x100aa50c0
0x1001e2e0d: vmovaps xmmword ptr [rbx + 0x10], xmm0
0x1001e2e12: vmovaps xmm0, xmmword ptr [rip + 0x8c5286] ; 0x100aa80a0
0x1001e2e1a: vmovaps xmmword ptr [rbx + 0x20], xmm0
0x1001e2e1f: vmovaps xmm0, xmmword ptr [rip + 0x8c5c09] ; 0x100aa8a30
0x1001e2e27: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x1001e2e2c: vmovaps xmm0, xmmword ptr [rip + 0x8c5bcc] ; 0x100aa8a00
0x1001e2e34: vmovaps xmmword ptr [rbx + 0x40], xmm0
0x1001e2e39: movabs rax, 0x4270000000000000
0x1001e2e43: mov qword ptr [rbx + 0x50], rax
0x1001e2e47: mov rax, qword ptr [rip + 0x8c5be2] ; 0x100aa8a30
0x1001e2e4e: mov qword ptr [rbx + 0x60], rax
0x1001e2e52: mov dword ptr [rbx + 0x68], 0x3f800000
0x1001e2e59: vxorps xmm0, xmm0, xmm0
0x1001e2e5d: vmovaps xmmword ptr [rbx + 0x70], xmm0
0x1001e2e62: mov qword ptr [rbx + 0x7d], 0
0x1001e2e6a: mov rax, rbx
0x1001e2e6d: pop rbx
0x1001e2e6e: pop r14
0x1001e2e70: pop rbp
0x1001e2e71: ret 
0x1001e2e72: mov r14, rax
0x1001e2e75: mov rdi, rbx
0x1001e2e78: call 0x100aa248c ; 0x100aa248c __ZdlPv
0x1001e2e7d: mov rdi, r14
0x1001e2e80: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1001e2e85: nop word ptr cs:[rax + rax]
