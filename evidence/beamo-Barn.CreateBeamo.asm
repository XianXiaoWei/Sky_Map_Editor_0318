0x1001973a0: push rbp
0x1001973a1: mov rbp, rsp
0x1001973a4: push r15
0x1001973a6: push r14
0x1001973a8: push rbx
0x1001973a9: push rax
0x1001973aa: mov r15, rdi
0x1001973ad: mov eax, dword ptr [r15 + 0x20010]
0x1001973b4: cmp rax, 0x200
0x1001973ba: jae 0x100197471
0x1001973c0: lea ecx, [rax + 1]
0x1001973c3: mov dword ptr [r15 + 0x20010], ecx
0x1001973ca: lea rbx, [rax + rax*2]
0x1001973ce: shl rbx, 6
0x1001973d2: lea r14, [r15 + rbx + 0x10]
0x1001973d7: call 0x1007abc10 ; 0x1007abc10
0x1001973dc: mov eax, dword ptr [rax + 0x38]
0x1001973df: mov dword ptr [r15 + rbx + 0x18], eax
0x1001973e4: call 0x10074a170 ; 0x10074a170
0x1001973e9: mov eax, dword ptr [rax + 0x38]
0x1001973ec: mov dword ptr [r15 + rbx + 0x18], eax
0x1001973f1: mov rax, qword ptr [rip + 0xa76278] ; 0x100c0d670
0x1001973f8: add rax, 0x10
0x1001973fc: mov qword ptr [r15 + rbx + 0x10], rax
0x100197401: call 0x100407ab0 ; 0x100407ab0
0x100197406: mov rax, qword ptr [rip + 0x1c41893] ; 0x101dd8ca0
0x10019740d: mov eax, dword ptr [rax + 0x38]
0x100197410: mov dword ptr [r15 + rbx + 0x18], eax
0x100197415: lea rax, [rip + 0xa7b2b4] ; 0x100c126d0
0x10019741c: mov qword ptr [r15 + rbx + 0x10], rax
0x100197421: vxorps xmm0, xmm0, xmm0
0x100197425: vmovups xmmword ptr [r15 + rbx + 0x68], xmm0
0x10019742c: mov qword ptr [r15 + rbx + 0x78], 0
0x100197435: mov word ptr [r15 + rbx + 0x94], 0
0x100197440: mov rax, qword ptr [rip + 0x914b19] ; 0x100aabf60
0x100197447: mov qword ptr [r15 + rbx + 0xa0], rax
0x10019744f: mov dword ptr [r15 + rbx + 0xa8], 0xbf800000
0x10019745b: mov qword ptr [r15 + rbx + 0xc0], r15
0x100197463: mov rax, r14
0x100197466: add rsp, 8
0x10019746a: pop rbx
0x10019746b: pop r14
0x10019746d: pop r15
0x10019746f: pop rbp
0x100197470: ret 
0x100197471: lea rdi, [rip + 0x9dff69] ; 0x100b773e1 m_beamoCount < kMaxBeamos
0x100197478: lea rsi, [rip + 0x9dfe12] ; 0x100b77291 Beamo.cpp
0x10019747f: lea r8, [rip + 0x9dff75] ; 0x100b773fb Ran out of Beamos
0x100197486: mov edx, 0x159
0x10019748b: mov ecx, 4
0x100197490: xor eax, eax
0x100197492: call 0x1007e6030 ; 0x1007e6030
0x100197497: ud2 
0x100197499: nop dword ptr [rax]
