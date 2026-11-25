0x1007bc100: push rbp
0x1007bc101: mov rbp, rsp
0x1007bc104: push r15
0x1007bc106: push r14
0x1007bc108: push r13
0x1007bc10a: push r12
0x1007bc10c: push rbx
0x1007bc10d: sub rsp, 0x48
0x1007bc111: mov r13d, r9d
0x1007bc114: mov ebx, r8d
0x1007bc117: mov dword ptr [rbp - 0x34], ecx
0x1007bc11a: mov dword ptr [rbp - 0x30], edx
0x1007bc11d: mov r14, rsi
0x1007bc120: mov r12, rdi
0x1007bc123: cmp dword ptr [r12 + 0x1688c], 0x40
0x1007bc12c: jae 0x1007bc294
0x1007bc132: vxorps xmm0, xmm0, xmm0
0x1007bc136: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x1007bc13b: mov qword ptr [rbp - 0x60], 0
0x1007bc143: mov rdi, r14
0x1007bc146: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1007bc14b: mov r15, rax
0x1007bc14e: cmp r15, 0xff1
0x1007bc155: jae 0x1007bc2b3
0x1007bc15b: mov dword ptr [rbp - 0x38], ebx
0x1007bc15e: cmp r15, 0x17
0x1007bc162: jae 0x1007bc177
0x1007bc164: mov eax, r15d
0x1007bc167: add al, al
0x1007bc169: mov byte ptr [rbp - 0x70], al
0x1007bc16c: lea rbx, [rbp - 0x6f]
0x1007bc170: test r15, r15
0x1007bc173: jne 0x1007bc1ad
0x1007bc175: jmp 0x1007bc1bb ; 0x1007bc1bb
0x1007bc177: mov dword ptr [rbp - 0x2c], r13d
0x1007bc17b: mov r13, r15
0x1007bc17e: add r13, 0x10
0x1007bc182: and r13, 0xfffffffffffffff0
0x1007bc186: call 0x1007e50d0 ; 0x1007e50d0
0x1007bc18b: mov rdi, rax
0x1007bc18e: mov rsi, r13
0x1007bc191: call 0x1007e5790 ; 0x1007e5790
0x1007bc196: mov rbx, rax
0x1007bc199: mov qword ptr [rbp - 0x60], rbx
0x1007bc19d: or r13, 1
0x1007bc1a1: mov qword ptr [rbp - 0x70], r13
0x1007bc1a5: mov r13d, dword ptr [rbp - 0x2c]
0x1007bc1a9: mov qword ptr [rbp - 0x68], r15
0x1007bc1ad: mov rdi, rbx
0x1007bc1b0: mov rsi, r14
0x1007bc1b3: mov rdx, r15
0x1007bc1b6: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1007bc1bb: mov byte ptr [rbx + r15], 0
0x1007bc1c0: mov eax, dword ptr [rbp - 0x30]
0x1007bc1c3: mov dword ptr [rbp - 0x58], eax
0x1007bc1c6: mov eax, dword ptr [rbp - 0x34]
0x1007bc1c9: mov dword ptr [rbp - 0x54], eax
0x1007bc1cc: mov eax, dword ptr [rbp - 0x38]
0x1007bc1cf: mov dword ptr [rbp - 0x50], eax
0x1007bc1d2: mov dword ptr [rbp - 0x4c], r13d
0x1007bc1d6: mov word ptr [rbp - 0x48], 1
0x1007bc1dc: mov al, byte ptr [rbp + 0x10]
0x1007bc1df: mov byte ptr [rbp - 0x46], al
0x1007bc1e2: mov byte ptr [rbp - 0x45], 0
0x1007bc1e6: mov eax, dword ptr [r12 + 0x1688c]
0x1007bc1ee: lea rbx, [rax + rax*2]
0x1007bc1f2: shl rbx, 4
0x1007bc1f6: lea r14, [r12 + rbx + 0x16890]
0x1007bc1fe: test byte ptr [r12 + rbx + 0x16890], 1
0x1007bc207: jne 0x1007bc211
0x1007bc209: mov word ptr [r14], 0
0x1007bc20f: jmp 0x1007bc228 ; 0x1007bc228
0x1007bc211: mov rax, qword ptr [r12 + rbx + 0x168a0]
0x1007bc219: mov byte ptr [rax], 0
0x1007bc21c: mov qword ptr [r12 + rbx + 0x16898], 0
0x1007bc228: xor esi, esi
0x1007bc22a: mov rdi, r14
0x1007bc22d: call 0x100018080 ; 0x100018080
0x1007bc232: lea rax, [rbp - 0x58]
0x1007bc236: mov rcx, qword ptr [rbp - 0x60]
0x1007bc23a: mov qword ptr [r14 + 0x10], rcx
0x1007bc23e: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x1007bc243: vmovups xmmword ptr [r14], xmm0
0x1007bc248: vxorps xmm0, xmm0, xmm0
0x1007bc24c: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x1007bc251: mov qword ptr [rbp - 0x60], 0
0x1007bc259: mov ecx, dword ptr [rax + 0x10]
0x1007bc25c: mov dword ptr [r12 + rbx + 0x168b8], ecx
0x1007bc264: vmovups xmm0, xmmword ptr [rax]
0x1007bc268: vmovups xmmword ptr [r12 + rbx + 0x168a8], xmm0
0x1007bc272: mov eax, dword ptr [r12 + 0x1688c]
0x1007bc27a: lea ecx, [rax + 1]
0x1007bc27d: mov dword ptr [r12 + 0x1688c], ecx
0x1007bc285: add rsp, 0x48
0x1007bc289: pop rbx
0x1007bc28a: pop r12
0x1007bc28c: pop r13
0x1007bc28e: pop r14
0x1007bc290: pop r15
0x1007bc292: pop rbp
0x1007bc293: ret 
0x1007bc294: lea rdi, [rip + 0x3e7748] ; 0x100ba39e3 renderTargetCount < kMaxRenderTargets
0x1007bc29b: lea rsi, [rip + 0x3e76b9] ; 0x100ba395b RenderOutline.cpp
0x1007bc2a2: mov edx, 0x8c
0x1007bc2a7: mov ecx, 3
0x1007bc2ac: call 0x1007e5f70 ; 0x1007e5f70
0x1007bc2b1: ud2 
0x1007bc2b3: lea rdi, [rbp - 0x70]
0x1007bc2b7: call 0x100aa230c ; 0x100aa230c __ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv
0x1007bc2bc: mov rdi, rax
0x1007bc2bf: call 0x100011bf0 ; 0x100011bf0
0x1007bc2c4: nop word ptr cs:[rax + rax]
