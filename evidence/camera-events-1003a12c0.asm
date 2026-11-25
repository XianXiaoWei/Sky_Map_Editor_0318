0x1003a12c0: push rbp
0x1003a12c1: mov rbp, rsp
0x1003a12c4: push r14
0x1003a12c6: push rbx
0x1003a12c7: mov edi, 0xa8
0x1003a12cc: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1003a12d1: mov rbx, rax
0x1003a12d4: mov rdi, rbx
0x1003a12d7: call 0x10032eea0 ; 0x10032eea0
0x1003a12dc: mov rax, qword ptr [rip + 0x1c5b52d] ; 0x101ffc810
0x1003a12e3: mov eax, dword ptr [rax + 0x38]
0x1003a12e6: mov dword ptr [rbx + 8], eax
0x1003a12e9: lea rax, [rip + 0x874660] ; 0x100c15950
0x1003a12f0: mov qword ptr [rbx], rax
0x1003a12f3: vxorps xmm0, xmm0, xmm0
0x1003a12f7: vmovups xmmword ptr [rbx + 0x38], xmm0
0x1003a12fc: mov word ptr [rbx + 0x48], 0
0x1003a1302: movabs rax, 0x3f8000003f800000
0x1003a130c: mov qword ptr [rbx + 0x4c], rax
0x1003a1310: mov byte ptr [rbx + 0x54], 0
0x1003a1314: vmovaps xmm0, xmmword ptr [rip + 0x71dc44] ; 0x100abef60
0x1003a131c: vmovups xmmword ptr [rbx + 0x58], xmm0
0x1003a1321: movabs rax, 0x3e80000000000000
0x1003a132b: mov qword ptr [rbx + 0x68], rax
0x1003a132f: mov qword ptr [rbx + 0x70], 0
0x1003a1337: mov dword ptr [rbx + 0x78], 0x3f800000
0x1003a133e: mov dword ptr [rbx + 0x90], 0
0x1003a1348: mov byte ptr [rbx + 0xa4], 0
0x1003a134f: mov rax, rbx
0x1003a1352: pop rbx
0x1003a1353: pop r14
0x1003a1355: pop rbp
0x1003a1356: ret 
0x1003a1357: mov r14, rax
0x1003a135a: mov rdi, rbx
0x1003a135d: call 0x100aa248c ; 0x100aa248c __ZdlPv
0x1003a1362: mov rdi, r14
0x1003a1365: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1003a136a: nop word ptr [rax + rax]
