0x1007bc2d0: push rbp
0x1007bc2d1: mov rbp, rsp
0x1007bc2d4: push r15
0x1007bc2d6: push r14
0x1007bc2d8: push r13
0x1007bc2da: push r12
0x1007bc2dc: push rbx
0x1007bc2dd: sub rsp, 0x48
0x1007bc2e1: mov r13d, r9d
0x1007bc2e4: mov ebx, r8d
0x1007bc2e7: mov dword ptr [rbp - 0x34], ecx
0x1007bc2ea: mov dword ptr [rbp - 0x30], edx
0x1007bc2ed: mov r14, rsi
0x1007bc2f0: mov r12, rdi
0x1007bc2f3: cmp dword ptr [r12 + 0x1688c], 0x40
0x1007bc2fc: jae 0x1007bc464
0x1007bc302: vxorps xmm0, xmm0, xmm0
0x1007bc306: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x1007bc30b: mov qword ptr [rbp - 0x60], 0
0x1007bc313: mov rdi, r14
0x1007bc316: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1007bc31b: mov r15, rax
0x1007bc31e: cmp r15, 0xff1
0x1007bc325: jae 0x1007bc483
0x1007bc32b: mov dword ptr [rbp - 0x38], ebx
0x1007bc32e: cmp r15, 0x17
0x1007bc332: jae 0x1007bc347
0x1007bc334: mov eax, r15d
0x1007bc337: add al, al
0x1007bc339: mov byte ptr [rbp - 0x70], al
0x1007bc33c: lea rbx, [rbp - 0x6f]
0x1007bc340: test r15, r15
0x1007bc343: jne 0x1007bc37d
0x1007bc345: jmp 0x1007bc38b ; 0x1007bc38b
0x1007bc347: mov dword ptr [rbp - 0x2c], r13d
0x1007bc34b: mov r13, r15
0x1007bc34e: add r13, 0x10
0x1007bc352: and r13, 0xfffffffffffffff0
0x1007bc356: call 0x1007e50d0 ; 0x1007e50d0
0x1007bc35b: mov rdi, rax
0x1007bc35e: mov rsi, r13
0x1007bc361: call 0x1007e5790 ; 0x1007e5790
0x1007bc366: mov rbx, rax
0x1007bc369: mov qword ptr [rbp - 0x60], rbx
0x1007bc36d: or r13, 1
0x1007bc371: mov qword ptr [rbp - 0x70], r13
0x1007bc375: mov r13d, dword ptr [rbp - 0x2c]
0x1007bc379: mov qword ptr [rbp - 0x68], r15
0x1007bc37d: mov rdi, rbx
0x1007bc380: mov rsi, r14
0x1007bc383: mov rdx, r15
0x1007bc386: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1007bc38b: mov byte ptr [rbx + r15], 0
0x1007bc390: mov eax, dword ptr [rbp - 0x30]
0x1007bc393: mov dword ptr [rbp - 0x58], eax
0x1007bc396: mov eax, dword ptr [rbp - 0x34]
0x1007bc399: mov dword ptr [rbp - 0x54], eax
0x1007bc39c: mov eax, dword ptr [rbp - 0x38]
0x1007bc39f: mov dword ptr [rbp - 0x50], eax
0x1007bc3a2: mov dword ptr [rbp - 0x4c], r13d
0x1007bc3a6: mov word ptr [rbp - 0x48], 0x101
0x1007bc3ac: mov al, byte ptr [rbp + 0x10]
0x1007bc3af: mov byte ptr [rbp - 0x46], al
0x1007bc3b2: mov byte ptr [rbp - 0x45], 0
0x1007bc3b6: mov eax, dword ptr [r12 + 0x1688c]
0x1007bc3be: lea rbx, [rax + rax*2]
0x1007bc3c2: shl rbx, 4
0x1007bc3c6: lea r14, [r12 + rbx + 0x16890]
0x1007bc3ce: test byte ptr [r12 + rbx + 0x16890], 1
0x1007bc3d7: jne 0x1007bc3e1
0x1007bc3d9: mov word ptr [r14], 0
0x1007bc3df: jmp 0x1007bc3f8 ; 0x1007bc3f8
0x1007bc3e1: mov rax, qword ptr [r12 + rbx + 0x168a0]
0x1007bc3e9: mov byte ptr [rax], 0
0x1007bc3ec: mov qword ptr [r12 + rbx + 0x16898], 0
0x1007bc3f8: xor esi, esi
0x1007bc3fa: mov rdi, r14
0x1007bc3fd: call 0x100018080 ; 0x100018080
0x1007bc402: lea rax, [rbp - 0x58]
0x1007bc406: mov rcx, qword ptr [rbp - 0x60]
0x1007bc40a: mov qword ptr [r14 + 0x10], rcx
0x1007bc40e: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x1007bc413: vmovups xmmword ptr [r14], xmm0
0x1007bc418: vxorps xmm0, xmm0, xmm0
0x1007bc41c: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x1007bc421: mov qword ptr [rbp - 0x60], 0
0x1007bc429: mov ecx, dword ptr [rax + 0x10]
0x1007bc42c: mov dword ptr [r12 + rbx + 0x168b8], ecx
0x1007bc434: vmovups xmm0, xmmword ptr [rax]
0x1007bc438: vmovups xmmword ptr [r12 + rbx + 0x168a8], xmm0
0x1007bc442: mov eax, dword ptr [r12 + 0x1688c]
0x1007bc44a: lea ecx, [rax + 1]
0x1007bc44d: mov dword ptr [r12 + 0x1688c], ecx
0x1007bc455: add rsp, 0x48
0x1007bc459: pop rbx
0x1007bc45a: pop r12
0x1007bc45c: pop r13
0x1007bc45e: pop r14
0x1007bc460: pop r15
0x1007bc462: pop rbp
0x1007bc463: ret 
0x1007bc464: lea rdi, [rip + 0x3e7578] ; 0x100ba39e3 renderTargetCount < kMaxRenderTargets
0x1007bc46b: lea rsi, [rip + 0x3e74e9] ; 0x100ba395b RenderOutline.cpp
0x1007bc472: mov edx, 0x99
0x1007bc477: mov ecx, 3
0x1007bc47c: call 0x1007e5f70 ; 0x1007e5f70
0x1007bc481: ud2 
0x1007bc483: lea rdi, [rbp - 0x70]
0x1007bc487: call 0x100aa230c ; 0x100aa230c __ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv
0x1007bc48c: mov rdi, rax
0x1007bc48f: call 0x100011bf0 ; 0x100011bf0
0x1007bc494: nop word ptr cs:[rax + rax]
