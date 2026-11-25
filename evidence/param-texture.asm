0x1007bb3f0: push rbp
0x1007bb3f1: mov rbp, rsp
0x1007bb3f4: push r15
0x1007bb3f6: push r14
0x1007bb3f8: push r13
0x1007bb3fa: push r12
0x1007bb3fc: push rbx
0x1007bb3fd: sub rsp, 0x38
0x1007bb401: mov r15d, ecx
0x1007bb404: mov r14d, edx
0x1007bb407: mov r12, rsi
0x1007bb40a: mov r13, rdi
0x1007bb40d: cmp dword ptr [r13 + 0x1c], 8
0x1007bb412: jae 0x1007bb539
0x1007bb418: vxorps xmm0, xmm0, xmm0
0x1007bb41c: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1007bb421: mov qword ptr [rbp - 0x50], 0
0x1007bb429: mov rdi, r12
0x1007bb42c: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1007bb431: mov rbx, rax
0x1007bb434: cmp rbx, 0xff1
0x1007bb43b: jae 0x1007bb558
0x1007bb441: mov dword ptr [rbp - 0x30], r14d
0x1007bb445: cmp rbx, 0x17
0x1007bb449: jae 0x1007bb45d
0x1007bb44b: mov eax, ebx
0x1007bb44d: add al, al
0x1007bb44f: mov byte ptr [rbp - 0x60], al
0x1007bb452: lea r14, [rbp - 0x5f]
0x1007bb456: test rbx, rbx
0x1007bb459: jne 0x1007bb493
0x1007bb45b: jmp 0x1007bb4a1 ; 0x1007bb4a1
0x1007bb45d: mov dword ptr [rbp - 0x2c], r15d
0x1007bb461: mov r15, rbx
0x1007bb464: add r15, 0x10
0x1007bb468: and r15, 0xfffffffffffffff0
0x1007bb46c: call 0x1007e50d0 ; 0x1007e50d0
0x1007bb471: mov rdi, rax
0x1007bb474: mov rsi, r15
0x1007bb477: call 0x1007e5790 ; 0x1007e5790
0x1007bb47c: mov r14, rax
0x1007bb47f: mov qword ptr [rbp - 0x50], r14
0x1007bb483: or r15, 1
0x1007bb487: mov qword ptr [rbp - 0x60], r15
0x1007bb48b: mov r15d, dword ptr [rbp - 0x2c]
0x1007bb48f: mov qword ptr [rbp - 0x58], rbx
0x1007bb493: mov rdi, r14
0x1007bb496: mov rsi, r12
0x1007bb499: mov rdx, rbx
0x1007bb49c: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1007bb4a1: mov byte ptr [r14 + rbx], 0
0x1007bb4a6: mov byte ptr [rbp - 0x48], 0
0x1007bb4aa: mov eax, dword ptr [rbp - 0x30]
0x1007bb4ad: mov dword ptr [rbp - 0x44], eax
0x1007bb4b0: mov dword ptr [rbp - 0x40], r15d
0x1007bb4b4: mov dword ptr [rbp - 0x3c], 0
0x1007bb4bb: mov eax, dword ptr [r13 + 0x1c]
0x1007bb4bf: lea ecx, [rax + 1]
0x1007bb4c2: mov dword ptr [r13 + 0x1c], ecx
0x1007bb4c6: lea r14, [rax + rax*4]
0x1007bb4ca: lea rbx, [r13 + r14*8 + 0x28]
0x1007bb4cf: test byte ptr [r13 + r14*8 + 0x28], 1
0x1007bb4d5: jne 0x1007bb4de
0x1007bb4d7: mov word ptr [rbx], 0
0x1007bb4dc: jmp 0x1007bb4ef ; 0x1007bb4ef
0x1007bb4de: mov rax, qword ptr [r13 + r14*8 + 0x38]
0x1007bb4e3: mov byte ptr [rax], 0
0x1007bb4e6: mov qword ptr [r13 + r14*8 + 0x30], 0
0x1007bb4ef: xor esi, esi
0x1007bb4f1: mov rdi, rbx
0x1007bb4f4: call 0x100018080 ; 0x100018080
0x1007bb4f9: lea rax, [rbp - 0x48]
0x1007bb4fd: mov rcx, qword ptr [rbp - 0x50]
0x1007bb501: mov qword ptr [rbx + 0x10], rcx
0x1007bb505: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x1007bb50a: vmovups xmmword ptr [rbx], xmm0
0x1007bb50e: vxorps xmm0, xmm0, xmm0
0x1007bb512: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1007bb517: mov qword ptr [rbp - 0x50], 0
0x1007bb51f: vmovups xmm0, xmmword ptr [rax]
0x1007bb523: vmovups xmmword ptr [r13 + r14*8 + 0x40], xmm0
0x1007bb52a: add rsp, 0x38
0x1007bb52e: pop rbx
0x1007bb52f: pop r12
0x1007bb531: pop r13
0x1007bb533: pop r14
0x1007bb535: pop r15
0x1007bb537: pop rbp
0x1007bb538: ret 
0x1007bb539: lea rdi, [rip + 0x3e83df] ; 0x100ba391f texCount < ( sizeof( textures ) / sizeof( textures[ 0 ] ) )
0x1007bb540: lea rsi, [rip + 0x3e8414] ; 0x100ba395b RenderOutline.cpp
0x1007bb547: mov edx, 0x1d
0x1007bb54c: mov ecx, 3
0x1007bb551: call 0x1007e5f70 ; 0x1007e5f70
0x1007bb556: ud2 
0x1007bb558: lea rdi, [rbp - 0x60]
0x1007bb55c: call 0x100aa230c ; 0x100aa230c __ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv
0x1007bb561: mov rdi, rax
0x1007bb564: call 0x100011bf0 ; 0x100011bf0
0x1007bb569: nop dword ptr [rax]
