0x1007bc670: push rbp
0x1007bc671: mov rbp, rsp
0x1007bc674: push r15
0x1007bc676: push r14
0x1007bc678: push r13
0x1007bc67a: push r12
0x1007bc67c: push rbx
0x1007bc67d: sub rsp, 0x58
0x1007bc681: mov r14, rdx
0x1007bc684: mov r15, rsi
0x1007bc687: mov r12, rdi
0x1007bc68a: cmp dword ptr [r12 + 0x17490], 0x10
0x1007bc693: jae 0x1007bc7ed
0x1007bc699: vxorps xmm0, xmm0, xmm0
0x1007bc69d: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x1007bc6a2: mov qword ptr [rbp - 0x70], 0
0x1007bc6aa: mov rdi, r15
0x1007bc6ad: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1007bc6b2: mov rbx, rax
0x1007bc6b5: cmp rbx, 0xff1
0x1007bc6bc: jae 0x1007bc80c
0x1007bc6c2: cmp rbx, 0x17
0x1007bc6c6: jae 0x1007bc6da
0x1007bc6c8: mov eax, ebx
0x1007bc6ca: add al, al
0x1007bc6cc: mov byte ptr [rbp - 0x80], al
0x1007bc6cf: lea r13, [rbp - 0x7f]
0x1007bc6d3: test rbx, rbx
0x1007bc6d6: jne 0x1007bc710
0x1007bc6d8: jmp 0x1007bc71e ; 0x1007bc71e
0x1007bc6da: mov qword ptr [rbp - 0x30], r14
0x1007bc6de: mov r14, rbx
0x1007bc6e1: add r14, 0x10
0x1007bc6e5: and r14, 0xfffffffffffffff0
0x1007bc6e9: call 0x1007e50d0 ; 0x1007e50d0
0x1007bc6ee: mov rdi, rax
0x1007bc6f1: mov rsi, r14
0x1007bc6f4: call 0x1007e5790 ; 0x1007e5790
0x1007bc6f9: mov r13, rax
0x1007bc6fc: mov qword ptr [rbp - 0x70], r13
0x1007bc700: or r14, 1
0x1007bc704: mov qword ptr [rbp - 0x80], r14
0x1007bc708: mov r14, qword ptr [rbp - 0x30]
0x1007bc70c: mov qword ptr [rbp - 0x78], rbx
0x1007bc710: mov rdi, r13
0x1007bc713: mov rsi, r15
0x1007bc716: mov rdx, rbx
0x1007bc719: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1007bc71e: mov byte ptr [r13 + rbx], 0
0x1007bc724: vmovups ymm0, ymmword ptr [r14]
0x1007bc729: vmovups ymm1, ymmword ptr [r14 + 0xc]
0x1007bc72f: vmovups ymmword ptr [rbp - 0x5c], ymm1
0x1007bc734: vmovups ymmword ptr [rbp - 0x68], ymm0
0x1007bc739: mov eax, dword ptr [r12 + 0x17490]
0x1007bc741: lea rbx, [rax + rax*8]
0x1007bc745: lea r14, [r12 + rbx*8 + 0x17498]
0x1007bc74d: test byte ptr [r12 + rbx*8 + 0x17498], 1
0x1007bc756: jne 0x1007bc760
0x1007bc758: mov word ptr [r14], 0
0x1007bc75e: jmp 0x1007bc777 ; 0x1007bc777
0x1007bc760: mov rax, qword ptr [r12 + rbx*8 + 0x174a8]
0x1007bc768: mov byte ptr [rax], 0
0x1007bc76b: mov qword ptr [r12 + rbx*8 + 0x174a0], 0
0x1007bc777: xor esi, esi
0x1007bc779: mov rdi, r14
0x1007bc77c: vzeroupper 
0x1007bc77f: call 0x100018080 ; 0x100018080
0x1007bc784: lea rax, [rbp - 0x68]
0x1007bc788: mov rcx, qword ptr [rbp - 0x70]
0x1007bc78c: mov qword ptr [r14 + 0x10], rcx
0x1007bc790: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x1007bc795: vmovups xmmword ptr [r14], xmm0
0x1007bc79a: vxorps xmm0, xmm0, xmm0
0x1007bc79e: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x1007bc7a3: mov qword ptr [rbp - 0x70], 0
0x1007bc7ab: vmovups ymm0, ymmword ptr [rax]
0x1007bc7af: vmovups ymm1, ymmword ptr [rax + 0xc]
0x1007bc7b4: vmovups ymmword ptr [r12 + rbx*8 + 0x174b0], ymm0
0x1007bc7be: vmovups ymmword ptr [r12 + rbx*8 + 0x174bc], ymm1
0x1007bc7c8: mov eax, dword ptr [r12 + 0x17490]
0x1007bc7d0: lea ecx, [rax + 1]
0x1007bc7d3: mov dword ptr [r12 + 0x17490], ecx
0x1007bc7db: add rsp, 0x58
0x1007bc7df: pop rbx
0x1007bc7e0: pop r12
0x1007bc7e2: pop r13
0x1007bc7e4: pop r14
0x1007bc7e6: pop r15
0x1007bc7e8: pop rbp
0x1007bc7e9: vzeroupper 
0x1007bc7ec: ret 
0x1007bc7ed: lea rdi, [rip + 0x3e7215] ; 0x100ba3a09 depthStateCount < kMaxDepthStates
0x1007bc7f4: lea rsi, [rip + 0x3e7160] ; 0x100ba395b RenderOutline.cpp
0x1007bc7fb: mov edx, 0xad
0x1007bc800: mov ecx, 3
0x1007bc805: call 0x1007e5f70 ; 0x1007e5f70
0x1007bc80a: ud2 
0x1007bc80c: lea rdi, [rbp - 0x80]
0x1007bc810: call 0x100aa230c ; 0x100aa230c __ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv
0x1007bc815: mov rdi, rax
0x1007bc818: call 0x100011bf0 ; 0x100011bf0
0x1007bc81d: nop dword ptr [rax]
