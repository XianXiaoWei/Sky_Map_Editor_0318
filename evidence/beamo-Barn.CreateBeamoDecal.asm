0x1001974a0: push rbp
0x1001974a1: mov rbp, rsp
0x1001974a4: push r15
0x1001974a6: push r14
0x1001974a8: push rbx
0x1001974a9: push rax
0x1001974aa: mov r15, rdi
0x1001974ad: mov ebx, dword ptr [r15 + 0x20014]
0x1001974b4: cmp rbx, 0x100
0x1001974bb: jae 0x10019758f
0x1001974c1: lea eax, [rbx + 1]
0x1001974c4: mov dword ptr [r15 + 0x20014], eax
0x1001974cb: shl rbx, 7
0x1001974cf: lea r14, [r15 + rbx + 0x18010]
0x1001974d7: vxorps ymm0, ymm0, ymm0
0x1001974db: vmovups ymmword ptr [r15 + rbx + 0x18070], ymm0
0x1001974e5: vmovups ymmword ptr [r15 + rbx + 0x18050], ymm0
0x1001974ef: vmovups ymmword ptr [r15 + rbx + 0x18030], ymm0
0x1001974f9: vmovups ymmword ptr [r15 + rbx + 0x18010], ymm0
0x100197503: vzeroupper 
0x100197506: call 0x1007abc10 ; 0x1007abc10
0x10019750b: mov eax, dword ptr [rax + 0x38]
0x10019750e: mov dword ptr [r15 + rbx + 0x18018], eax
0x100197516: call 0x10074a170 ; 0x10074a170
0x10019751b: mov eax, dword ptr [rax + 0x38]
0x10019751e: mov dword ptr [r15 + rbx + 0x18018], eax
0x100197526: mov rax, qword ptr [rip + 0xa76143] ; 0x100c0d670
0x10019752d: add rax, 0x10
0x100197531: mov qword ptr [r15 + rbx + 0x18010], rax
0x100197539: call 0x100407ab0 ; 0x100407ab0
0x10019753e: mov rax, qword ptr [rip + 0x1c41abb] ; 0x101dd9000
0x100197545: mov eax, dword ptr [rax + 0x38]
0x100197548: mov dword ptr [r15 + rbx + 0x18018], eax
0x100197550: lea rax, [rip + 0xa7b201] ; 0x100c12758
0x100197557: mov qword ptr [r15 + rbx + 0x18010], rax
0x10019755f: vxorps xmm0, xmm0, xmm0
0x100197563: vmovups xmmword ptr [r15 + rbx + 0x18068], xmm0
0x10019756d: mov qword ptr [r15 + rbx + 0x18078], 0
0x100197579: mov qword ptr [r15 + rbx + 0x18088], r15
0x100197581: mov rax, r14
0x100197584: add rsp, 8
0x100197588: pop rbx
0x100197589: pop r14
0x10019758b: pop r15
0x10019758d: pop rbp
0x10019758e: ret 
0x10019758f: lea rdi, [rip + 0x9dfe77] ; 0x100b7740d m_decalCount < kMaxBeamoDecals
0x100197596: lea rsi, [rip + 0x9dfcf4] ; 0x100b77291 Beamo.cpp
0x10019759d: lea r8, [rip + 0x9dfe57] ; 0x100b773fb Ran out of Beamos
0x1001975a4: mov edx, 0x161
0x1001975a9: mov ecx, 4
0x1001975ae: xor eax, eax
0x1001975b0: call 0x1007e6030 ; 0x1007e6030
0x1001975b5: ud2 
0x1001975b7: nop word ptr [rax + rax]
