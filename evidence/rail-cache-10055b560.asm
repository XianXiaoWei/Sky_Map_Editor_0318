0x10055b560: push rbp
0x10055b561: mov rbp, rsp
0x10055b564: push r15
0x10055b566: push r14
0x10055b568: push r13
0x10055b56a: push r12
0x10055b56c: push rbx
0x10055b56d: sub rsp, 0x28
0x10055b571: mov dword ptr [rbp - 0x2c], esi
0x10055b574: mov r15d, dword ptr [rdi + 0x14]
0x10055b578: cmp r15, 1
0x10055b57c: jbe 0x10055b66e
0x10055b582: vcvtsi2ss xmm0, xmm0, r15
0x10055b587: vmovss xmm1, dword ptr [rip + 0x549b31] ; 0x100aa50c0
0x10055b58f: vdivss xmm0, xmm1, xmm0
0x10055b593: mov r14, qword ptr [rdi + 8]
0x10055b597: vmovss dword ptr [r14], xmm0
0x10055b59c: vmovaps xmm1, xmm0
0x10055b5a0: vmovss dword ptr [rbp - 0x30], xmm1
0x10055b5a5: mov rax, qword ptr [rdi + 0x90]
0x10055b5ac: mov esi, dword ptr [rdi + 0x28]
0x10055b5af: mov qword ptr [rbp - 0x48], rdi
0x10055b5b3: movzx ecx, byte ptr [rdi + 0x2c]
0x10055b5b7: vxorps xmm0, xmm0, xmm0
0x10055b5bb: mov qword ptr [rbp - 0x50], rax
0x10055b5bf: mov rdi, rax
0x10055b5c2: mov ebx, esi
0x10055b5c4: mov edx, dword ptr [rbp - 0x2c]
0x10055b5c7: mov r13d, ecx
0x10055b5ca: call 0x10055c6a0 ; 0x10055c6a0
0x10055b5cf: vmovaps xmm1, xmm0
0x10055b5d3: vmovss dword ptr [r14 + 4], xmm1
0x10055b5d9: mov qword ptr [rbp - 0x40], r15
0x10055b5dd: dec r15
0x10055b5e0: xor r12d, r12d
0x10055b5e3: vmovss xmm0, dword ptr [rbp - 0x30]
0x10055b5e8: nop dword ptr [rax + rax]
0x10055b5f0: vmovss dword ptr [rbp - 0x38], xmm1
0x10055b5f5: xor ecx, ecx
0x10055b5f7: test r13b, r13b
0x10055b5fa: setne cl
0x10055b5fd: lea eax, [r12 + 2]
0x10055b602: vcvtsi2ss xmm1, xmm2, rax
0x10055b607: vmulss xmm1, xmm1, dword ptr [rbp - 0x30]
0x10055b60c: vmovss dword ptr [rbp - 0x34], xmm1
0x10055b611: vmovss dword ptr [r14 + r12*8 + 8], xmm1
0x10055b618: mov rdi, qword ptr [rbp - 0x50]
0x10055b61c: mov esi, ebx
0x10055b61e: mov edx, dword ptr [rbp - 0x2c]
0x10055b621: call 0x10055c6a0 ; 0x10055c6a0
0x10055b626: vmovss xmm1, dword ptr [rbp - 0x38]
0x10055b62b: vaddss xmm1, xmm1, xmm0
0x10055b62f: vmovss dword ptr [r14 + r12*8 + 0xc], xmm1
0x10055b636: inc r12
0x10055b639: vmovss xmm0, dword ptr [rbp - 0x34]
0x10055b63e: cmp r15, r12
0x10055b641: jne 0x10055b5f0
0x10055b643: mov rax, qword ptr [rbp - 0x40]
0x10055b647: dec eax
0x10055b649: mov eax, dword ptr [r14 + rax*8 + 4]
0x10055b64e: mov rcx, qword ptr [rbp - 0x48]
0x10055b652: mov dword ptr [rcx + 0x18], eax
0x10055b655: mov byte ptr [rcx + 0x1c], 0
0x10055b659: mov eax, dword ptr [rbp - 0x2c]
0x10055b65c: mov dword ptr [rcx + 0x10], eax
0x10055b65f: add rsp, 0x28
0x10055b663: pop rbx
0x10055b664: pop r12
0x10055b666: pop r13
0x10055b668: pop r14
0x10055b66a: pop r15
0x10055b66c: pop rbp
0x10055b66d: ret 
0x10055b66e: lea rdi, [rip + 0x636155] ; 0x100b917ca arcTableSize >= 2
0x10055b675: lea rsi, [rip + 0x6360b0] ; 0x100b9172c Rail.cpp
0x10055b67c: mov edx, 0x318
0x10055b681: mov ecx, 3
0x10055b686: call 0x1007e5f70 ; 0x1007e5f70
0x10055b68b: ud2 
0x10055b68d: nop dword ptr [rax]
