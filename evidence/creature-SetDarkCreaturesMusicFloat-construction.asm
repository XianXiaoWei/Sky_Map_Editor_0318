0x100274370: push rbp
0x100274371: mov rbp, rsp
0x100274374: push rbx
0x100274375: push rax
0x100274376: mov rbx, rsi
0x100274379: mov rdi, rbx
0x10027437c: call 0x10032eea0 ; 0x10032eea0
0x100274381: mov rax, qword ptr [rip + 0x1b73578] ; 0x101de7900
0x100274388: mov eax, dword ptr [rax + 0x38]
0x10027438b: mov dword ptr [rbx + 8], eax
0x10027438e: mov rax, qword ptr [rip + 0x99907b] ; 0x100c0d410
0x100274395: add rax, 0x10
0x100274399: mov qword ptr [rbx], rax
0x10027439c: vxorps xmm0, xmm0, xmm0
0x1002743a0: vmovups xmmword ptr [rbx + 0x38], xmm0
0x1002743a5: vmovaps xmm0, xmmword ptr [rip + 0x8405d3] ; 0x100ab4980
0x1002743ad: vmovups xmmword ptr [rbx + 0x48], xmm0
0x1002743b2: movabs rax, 0x3ecccccd451c4000
0x1002743bc: mov qword ptr [rbx + 0x58], rax
0x1002743c0: mov rax, rbx
0x1002743c3: add rsp, 8
0x1002743c7: pop rbx
0x1002743c8: pop rbp
0x1002743c9: ret 
