0x100247060: push rbp
0x100247061: mov rbp, rsp
0x100247064: push r15
0x100247066: push r14
0x100247068: push r13
0x10024706a: push r12
0x10024706c: push rbx
0x10024706d: sub rsp, 0x88
0x100247074: mov qword ptr [rbp - 0x38], r9
0x100247078: mov rbx, rdx
0x10024707b: mov r14, rsi
0x10024707e: mov r13, rdi
0x100247081: cmp dword ptr [r13 + 0x18], 0
0x100247086: je 0x100247097
0x100247088: mov word ptr [r13 + 0xd], 1
0x10024708f: mov dword ptr [r13 + 0x10], 9
0x100247097: mov r15, qword ptr [rbp + 0x20]
0x10024709b: lea r12, [r13 + 0x19e50]
0x1002470a2: mov rdi, r12
0x1002470a5: call 0x100242940
0x1002470aa: mov rdi, r12
0x1002470ad: mov r12, r15
0x1002470b0: mov r15, rbx
0x1002470b3: mov rsi, r15
0x1002470b6: call 0x100242a50
0x1002470bb: lea rax, [r13 + 0x1d0]
0x1002470c2: mov qword ptr [rbp - 0xb0], rax
0x1002470c9: lea rax, [r13 + 0x1b800]
0x1002470d0: mov qword ptr [rbp - 0xa8], rax
0x1002470d7: lea rax, [r13 + 0x1f608]
0x1002470de: mov qword ptr [rbp - 0xa0], rax
0x1002470e5: lea rax, [r13 + 0x20100]
0x1002470ec: mov qword ptr [rbp - 0x98], rax
0x1002470f3: lea rax, [r13 + 0x38208]
0x1002470fa: mov qword ptr [rbp - 0x90], rax
0x100247101: lea rax, [r13 + 0x385d0]
0x100247108: mov qword ptr [rbp - 0x88], rax
0x10024710f: lea rax, [r13 + 0x387d4]
0x100247116: mov qword ptr [rbp - 0x78], rax
0x10024711a: lea rax, [r14 + 0x10]
0x10024711e: mov qword ptr [rbp - 0x70], rax
0x100247122: lea rax, [r13 + 0x17cf4]
0x100247129: mov qword ptr [rbp - 0x68], rax
0x10024712d: mov rbx, qword ptr [rbp + 0x10]
0x100247131: mov qword ptr [rbp - 0x80], rbx
0x100247135: lea rax, [r13 + 0x24]
0x100247139: mov qword ptr [rbp - 0x60], rax
0x10024713d: lea rax, [r13 + 0x30]
0x100247141: mov qword ptr [rbp - 0x58], rax
0x100247145: lea rax, [r13 + 0x34]
0x100247149: mov qword ptr [rbp - 0x50], rax
0x10024714d: lea rax, [r13 + 0x38814]
0x100247154: mov qword ptr [rbp - 0x48], rax
0x100247158: lea rax, [r13 + 0x38818]
0x10024715f: xor ecx, ecx
0x100247161: cmp byte ptr [r13 + 0xd], 0
0x100247166: cmove rcx, rax
0x10024716a: mov qword ptr [rbp - 0x40], rcx
0x10024716e: call 0x100aa2b22
0x100247173: vcvtsi2ss xmm0, xmm0, eax
0x100247177: vmulss xmm0, xmm0, dword ptr [rip + 0x85ff71]
0x10024717f: vmovss dword ptr [rbp - 0x30], xmm0
0x100247184: call 0x100aa2b22
0x100247189: vcvtsi2ss xmm0, xmm1, eax
0x10024718d: vmulss xmm0, xmm0, dword ptr [rip + 0x85ff5b]
0x100247195: vmovss dword ptr [rbp - 0x2c], xmm0
0x10024719a: call 0x100aa2b22
0x10024719f: vcvtsi2ss xmm0, xmm1, eax
0x1002471a3: vmulss xmm0, xmm0, dword ptr [rip + 0x85ff45]
0x1002471ab: vmovss xmm1, dword ptr [rbp - 0x30]
0x1002471b0: vmovss dword ptr [r13 + 0x50], xmm1
0x1002471b6: vmovss xmm1, dword ptr [rbp - 0x2c]
0x1002471bb: vmovss dword ptr [r13 + 0x54], xmm1
0x1002471c1: vmovss dword ptr [r13 + 0x58], xmm0
0x1002471c7: mov rsi, qword ptr [r13 + 0x68]
0x1002471cb: mov rdi, rbx
0x1002471ce: call 0x1005964e0
0x1002471d3: mov ecx, dword ptr [r13 + 0x5c]
0x1002471d7: mov dword ptr [rax + 0x10], ecx
0x1002471da: cmp byte ptr [r13 + 0xa8], 0
0x1002471e2: mov rbx, qword ptr [rbp - 0x38]
0x1002471e6: je 0x1002471f9
0x1002471e8: lea rdi, [r13 + 0x70]
0x1002471ec: xor ecx, ecx
0x1002471ee: mov rsi, rbx
0x1002471f1: mov rdx, r12
0x1002471f4: call 0x1007cca80
0x1002471f9: cmp byte ptr [r13 + 0xd], 0
0x1002471fe: je 0x10024720b
0x100247200: cmp byte ptr [r13 + 0x16], 1
0x100247205: jne 0x1002472e4
0x10024720b: mov dword ptr [r13 + 0x38814], 0
0x100247216: lea rsi, [rbp - 0xb0]
0x10024721d: xor ecx, ecx
0x10024721f: mov rdi, r13
0x100247222: mov rdx, rbx
0x100247225: call 0x100245b10
0x10024722a: vmovss xmm0, dword ptr [r13 + 0x5c]
0x100247230: vmovss xmm1, dword ptr [r13 + 0x19e38]
0x100247239: vmovss dword ptr [r13 + 0x5c], xmm1
0x10024723f: vdivss xmm0, xmm0, xmm1
0x100247243: call 0x100aa2852
0x100247248: vdivss xmm0, xmm0, dword ptr [rip + 0x86bf04]
0x100247250: vmovss dword ptr [r13 + 0x60], xmm0
0x100247256: mov eax, dword ptr [r13 + 0x15958]
0x10024725d: test eax, eax
0x10024725f: je 0x1002472c7
0x100247261: xor r15d, r15d
0x100247264: nop word ptr cs:[rax + rax]
0x100247270: mov ecx, r15d
0x100247273: imul rcx, rcx, 0x88
0x10024727a: mov ecx, dword ptr [r13 + rcx + 0x1595c]
0x100247282: imul rcx, rcx, 0xe8
0x100247289: cmp dword ptr [r14 + rcx + 0x18], 0
0x10024728f: je 0x1002472bf
0x100247291: lea r12, [r14 + rcx + 0x18]
0x100247296: xor ebx, ebx
0x100247298: nop dword ptr [rax + rax]
0x1002472a0: mov rax, qword ptr [r12 + 8]
0x1002472a5: mov ecx, ebx
0x1002472a7: mov rdi, qword ptr [rax + rcx*8]
0x1002472ab: call 0x1007f6770
0x1002472b0: inc ebx
0x1002472b2: cmp ebx, dword ptr [r12]
0x1002472b6: jb 0x1002472a0
0x1002472b8: mov eax, dword ptr [r13 + 0x15958]
0x1002472bf: inc r15d
0x1002472c2: cmp r15d, eax
0x1002472c5: jb 0x100247270
0x1002472c7: mov rdi, qword ptr [rbp - 0x80]
0x1002472cb: xor esi, esi
0x1002472cd: call 0x100596710
0x1002472d2: add rsp, 0x88
0x1002472d9: pop rbx
0x1002472da: pop r12
0x1002472dc: pop r13
0x1002472de: pop r14
0x1002472e0: pop r15
0x1002472e2: pop rbp
0x1002472e3: ret 
0x1002472e4: mov rcx, qword ptr [rbp + 0x18]
0x1002472e8: mov eax, dword ptr [r13 + 0x10]
0x1002472ec: movzx r10d, byte ptr [r13 + 0xe]
0x1002472f1: lea rsi, [rbp - 0xb0]
0x1002472f8: mov rdi, r13
0x1002472fb: mov rdx, rbx
0x1002472fe: mov r8, r15
0x100247301: mov r9, r12
0x100247304: push rax
0x100247305: push r10
0x100247307: call 0x100246760
0x10024730c: add rsp, 0x10
0x100247310: mov word ptr [r13 + 0xd], 0
0x100247317: mov dword ptr [r13 + 0x10], 0
0x10024731f: jmp 0x10024722a
0x100247324: nop word ptr cs:[rax + rax]
