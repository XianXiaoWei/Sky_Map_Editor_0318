0x1007bc4a0: push rbp
0x1007bc4a1: mov rbp, rsp
0x1007bc4a4: push r15
0x1007bc4a6: push r14
0x1007bc4a8: push r13
0x1007bc4aa: push r12
0x1007bc4ac: push rbx
0x1007bc4ad: sub rsp, 0x48
0x1007bc4b1: mov r13d, r9d
0x1007bc4b4: mov ebx, r8d
0x1007bc4b7: mov dword ptr [rbp - 0x34], ecx
0x1007bc4ba: mov dword ptr [rbp - 0x30], edx
0x1007bc4bd: mov r14, rsi
0x1007bc4c0: mov r12, rdi
0x1007bc4c3: cmp dword ptr [r12 + 0x1688c], 0x40
0x1007bc4cc: jae 0x1007bc638
0x1007bc4d2: vxorps xmm0, xmm0, xmm0
0x1007bc4d6: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x1007bc4db: mov qword ptr [rbp - 0x60], 0
0x1007bc4e3: mov rdi, r14
0x1007bc4e6: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1007bc4eb: mov r15, rax
0x1007bc4ee: cmp r15, 0xff1
0x1007bc4f5: jae 0x1007bc657
0x1007bc4fb: mov dword ptr [rbp - 0x38], ebx
0x1007bc4fe: cmp r15, 0x17
0x1007bc502: jae 0x1007bc517
0x1007bc504: mov eax, r15d
0x1007bc507: add al, al
0x1007bc509: mov byte ptr [rbp - 0x70], al
0x1007bc50c: lea rbx, [rbp - 0x6f]
0x1007bc510: test r15, r15
0x1007bc513: jne 0x1007bc54d
0x1007bc515: jmp 0x1007bc55b ; 0x1007bc55b
0x1007bc517: mov dword ptr [rbp - 0x2c], r13d
0x1007bc51b: mov r13, r15
0x1007bc51e: add r13, 0x10
0x1007bc522: and r13, 0xfffffffffffffff0
0x1007bc526: call 0x1007e50d0 ; 0x1007e50d0
0x1007bc52b: mov rdi, rax
0x1007bc52e: mov rsi, r13
0x1007bc531: call 0x1007e5790 ; 0x1007e5790
0x1007bc536: mov rbx, rax
0x1007bc539: mov qword ptr [rbp - 0x60], rbx
0x1007bc53d: or r13, 1
0x1007bc541: mov qword ptr [rbp - 0x70], r13
0x1007bc545: mov r13d, dword ptr [rbp - 0x2c]
0x1007bc549: mov qword ptr [rbp - 0x68], r15
0x1007bc54d: mov rdi, rbx
0x1007bc550: mov rsi, r14
0x1007bc553: mov rdx, r15
0x1007bc556: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1007bc55b: mov byte ptr [rbx + r15], 0
0x1007bc560: mov eax, dword ptr [rbp - 0x30]
0x1007bc563: mov dword ptr [rbp - 0x58], eax
0x1007bc566: mov eax, dword ptr [rbp - 0x34]
0x1007bc569: mov dword ptr [rbp - 0x54], eax
0x1007bc56c: mov eax, dword ptr [rbp - 0x38]
0x1007bc56f: mov dword ptr [rbp - 0x50], eax
0x1007bc572: mov dword ptr [rbp - 0x4c], r13d
0x1007bc576: mov al, byte ptr [rbp + 0x18]
0x1007bc579: mov byte ptr [rbp - 0x48], al
0x1007bc57c: mov byte ptr [rbp - 0x47], 0
0x1007bc580: mov al, byte ptr [rbp + 0x10]
0x1007bc583: mov byte ptr [rbp - 0x46], al
0x1007bc586: mov byte ptr [rbp - 0x45], 0
0x1007bc58a: mov eax, dword ptr [r12 + 0x1688c]
0x1007bc592: lea rbx, [rax + rax*2]
0x1007bc596: shl rbx, 4
0x1007bc59a: lea r14, [r12 + rbx + 0x16890]
0x1007bc5a2: test byte ptr [r12 + rbx + 0x16890], 1
0x1007bc5ab: jne 0x1007bc5b5
0x1007bc5ad: mov word ptr [r14], 0
0x1007bc5b3: jmp 0x1007bc5cc ; 0x1007bc5cc
0x1007bc5b5: mov rax, qword ptr [r12 + rbx + 0x168a0]
0x1007bc5bd: mov byte ptr [rax], 0
0x1007bc5c0: mov qword ptr [r12 + rbx + 0x16898], 0
0x1007bc5cc: xor esi, esi
0x1007bc5ce: mov rdi, r14
0x1007bc5d1: call 0x100018080 ; 0x100018080
0x1007bc5d6: lea rax, [rbp - 0x58]
0x1007bc5da: mov rcx, qword ptr [rbp - 0x60]
0x1007bc5de: mov qword ptr [r14 + 0x10], rcx
0x1007bc5e2: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x1007bc5e7: vmovups xmmword ptr [r14], xmm0
0x1007bc5ec: vxorps xmm0, xmm0, xmm0
0x1007bc5f0: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x1007bc5f5: mov qword ptr [rbp - 0x60], 0
0x1007bc5fd: mov ecx, dword ptr [rax + 0x10]
0x1007bc600: mov dword ptr [r12 + rbx + 0x168b8], ecx
0x1007bc608: vmovups xmm0, xmmword ptr [rax]
0x1007bc60c: vmovups xmmword ptr [r12 + rbx + 0x168a8], xmm0
0x1007bc616: mov eax, dword ptr [r12 + 0x1688c]
0x1007bc61e: lea ecx, [rax + 1]
0x1007bc621: mov dword ptr [r12 + 0x1688c], ecx
0x1007bc629: add rsp, 0x48
0x1007bc62d: pop rbx
0x1007bc62e: pop r12
0x1007bc630: pop r13
0x1007bc632: pop r14
0x1007bc634: pop r15
0x1007bc636: pop rbp
0x1007bc637: ret 
0x1007bc638: lea rdi, [rip + 0x3e73a4] ; 0x100ba39e3 renderTargetCount < kMaxRenderTargets
0x1007bc63f: lea rsi, [rip + 0x3e7315] ; 0x100ba395b RenderOutline.cpp
0x1007bc646: mov edx, 0xa0
0x1007bc64b: mov ecx, 3
0x1007bc650: call 0x1007e5f70 ; 0x1007e5f70
0x1007bc655: ud2 
0x1007bc657: lea rdi, [rbp - 0x70]
0x1007bc65b: call 0x100aa230c ; 0x100aa230c __ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv
0x1007bc660: mov rdi, rax
0x1007bc663: call 0x100011bf0 ; 0x100011bf0
0x1007bc668: nop dword ptr [rax + rax]
