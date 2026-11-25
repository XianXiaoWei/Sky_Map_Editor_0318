0x100228630: push rbp
0x100228631: mov rbp, rsp
0x100228634: push r15
0x100228636: push r14
0x100228638: push r13
0x10022863a: push r12
0x10022863c: push rbx
0x10022863d: and rsp, 0xffffffffffffffe0
0x100228641: sub rsp, 0xa0
0x100228648: mov qword ptr [rsp + 0x50], r9
0x10022864d: mov dword ptr [rsp + 0x40], r8d
0x100228652: mov qword ptr [rsp + 0x58], rcx
0x100228657: mov r15d, edx
0x10022865a: mov r14, rsi
0x10022865d: mov r13, rdi
0x100228660: call 0x1004744b0 ; 0x1004744b0
0x100228665: test rax, rax
0x100228668: jne 0x10022890e
0x10022866e: mov ebx, dword ptr [rbp + 0x20]
0x100228671: lea rdi, [r13 + 0x10]
0x100228675: call 0x10019f130 ; 0x10019f130
0x10022867a: mov r12, rax
0x10022867d: lea rdx, [r13 + 0x4748]
0x100228684: mov rdi, r12
0x100228687: mov rsi, r14
0x10022868a: mov ecx, ebx
0x10022868c: mov r8, r13
0x10022868f: call 0x1004742e0 ; 0x1004742e0
0x100228694: vxorps xmm0, xmm0, xmm0
0x100228698: vmovaps xmmword ptr [rsp + 0x20], xmm0
0x10022869e: mov qword ptr [rsp + 0x30], 0
0x1002286a7: mov rdi, r14
0x1002286aa: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1002286af: mov rbx, rax
0x1002286b2: cmp rbx, 0xff1
0x1002286b9: jae 0x100228939
0x1002286bf: mov dword ptr [rsp + 0x44], r15d
0x1002286c4: cmp rbx, 0x17
0x1002286c8: jae 0x1002286de
0x1002286ca: mov eax, ebx
0x1002286cc: add al, al
0x1002286ce: mov byte ptr [rsp + 0x20], al
0x1002286d2: lea r15, [rsp + 0x21]
0x1002286d7: test rbx, rbx
0x1002286da: jne 0x10022871f
0x1002286dc: jmp 0x10022872d ; 0x10022872d
0x1002286de: mov qword ptr [rsp + 0x48], r12
0x1002286e3: mov r12, r14
0x1002286e6: mov r14, rbx
0x1002286e9: add r14, 0x10
0x1002286ed: and r14, 0xfffffffffffffff0
0x1002286f1: call 0x1007e50d0 ; 0x1007e50d0
0x1002286f6: mov rdi, rax
0x1002286f9: mov rsi, r14
0x1002286fc: call 0x1007e5790 ; 0x1007e5790
0x100228701: mov r15, rax
0x100228704: mov qword ptr [rsp + 0x30], r15
0x100228709: or r14, 1
0x10022870d: mov qword ptr [rsp + 0x20], r14
0x100228712: mov r14, r12
0x100228715: mov r12, qword ptr [rsp + 0x48]
0x10022871a: mov qword ptr [rsp + 0x28], rbx
0x10022871f: mov rdi, r15
0x100228722: mov rsi, r14
0x100228725: mov rdx, rbx
0x100228728: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x10022872d: mov byte ptr [r15 + rbx], 0
0x100228732: movzx eax, byte ptr [rsp + 0x20]
0x100228737: test al, 1
0x100228739: jne 0x100228748
0x10022873b: mov rcx, rax
0x10022873e: shr rcx, 1
0x100228741: mov esi, 0x16
0x100228746: jmp 0x100228759 ; 0x100228759
0x100228748: mov rsi, qword ptr [rsp + 0x20]
0x10022874d: mov rcx, qword ptr [rsp + 0x28]
0x100228752: and rsi, 0xfffffffffffffffe
0x100228756: dec rsi
0x100228759: mov rdx, rsi
0x10022875c: sub rdx, rcx
0x10022875f: cmp rdx, 0xa
0x100228763: jae 0x10022879b
0x100228765: mov edx, 0xa
0x10022876a: sub rdx, rsi
0x10022876d: add rdx, rcx
0x100228770: lea rax, [rip + 0x94f0b0] ; 0x100b77827 VertexData
0x100228777: mov qword ptr [rsp + 8], rax
0x10022877c: mov qword ptr [rsp], 0xa
0x100228784: lea rdi, [rsp + 0x20]
0x100228789: xor r9d, r9d
0x10022878c: mov r8, rcx
0x10022878f: call 0x1000198c0 ; 0x1000198c0
0x100228794: lea rsi, [rsp + 0x21]
0x100228799: jmp 0x1002287de ; 0x1002287de
0x10022879b: test al, 1
0x10022879d: lea rsi, [rsp + 0x21]
0x1002287a2: mov rax, qword ptr [rsp + 0x30]
0x1002287a7: cmove rax, rsi
0x1002287ab: movabs rdx, 0x6144786574726556
0x1002287b5: mov qword ptr [rax + rcx], rdx
0x1002287b9: mov word ptr [rax + rcx + 8], 0x6174
0x1002287c0: add rcx, 0xa
0x1002287c4: test byte ptr [rsp + 0x20], 1
0x1002287c9: jne 0x1002287d5
0x1002287cb: mov edx, ecx
0x1002287cd: add dl, dl
0x1002287cf: mov byte ptr [rsp + 0x20], dl
0x1002287d3: jmp 0x1002287da ; 0x1002287da
0x1002287d5: mov qword ptr [rsp + 0x28], rcx
0x1002287da: mov byte ptr [rax + rcx], 0
0x1002287de: mov edx, dword ptr [rsp + 0x40]
0x1002287e2: lea r15, [r12 + 0x18]
0x1002287e7: test byte ptr [rsp + 0x20], 1
0x1002287ec: cmovne rsi, qword ptr [rsp + 0x30]
0x1002287f2: mov rdi, r15
0x1002287f5: call 0x1007f53c0 ; 0x1007f53c0
0x1002287fa: mov eax, dword ptr [rbp + 0x18]
0x1002287fd: mov dword ptr [r12 + 0x158], eax
0x100228805: movabs rax, 0x1b00000001
0x10022880f: mov qword ptr [rsp + 0x60], rax
0x100228814: lea rcx, [rsp + 0x64]
0x100228819: mov rax, qword ptr [rsp + 0x58]
0x10022881e: mov qword ptr [rsp + 8], rax
0x100228823: mov dword ptr [rsp], 0
0x10022882a: lea rdx, [rsp + 0x60]
0x10022882f: mov esi, 0
0x100228834: mov r8d, 1
0x10022883a: mov r9d, 1
0x100228840: mov rdi, r15
0x100228843: call 0x1007f5430 ; 0x1007f5430
0x100228848: mov r8d, dword ptr [rbp + 0x10]
0x10022884c: mov esi, 0
0x100228851: mov edx, 0x11
0x100228856: mov ecx, 1
0x10022885b: mov rdi, r15
0x10022885e: mov r9, qword ptr [rsp + 0x50]
0x100228863: call 0x1007f55d0 ; 0x1007f55d0
0x100228868: cmp dword ptr [r12 + 0x158], 0
0x100228871: je 0x100228943
0x100228877: lea rcx, [rsp + 0x70]
0x10022887c: vmovaps ymm0, ymmword ptr [rip + 0x88957c] ; 0x100ab1e00
0x100228884: vmovaps ymmword ptr [rsp + 0x60], ymm0
0x10022888a: mov qword ptr [rsp + 8], 0
0x100228893: mov dword ptr [rsp], 1
0x10022889a: lea rdx, [rsp + 0x60]
0x10022889f: mov esi, 1
0x1002288a4: mov r8d, 4
0x1002288aa: mov r9d, 2
0x1002288b0: mov rdi, r15
0x1002288b3: vzeroupper 
0x1002288b6: call 0x1007f5430 ; 0x1007f5430
0x1002288bb: mov rdi, r15
0x1002288be: call 0x1007f5690 ; 0x1007f5690
0x1002288c3: mov rcx, qword ptr [r13 + 0x4738]
0x1002288ca: mov r8, qword ptr [r13 + 0x4740]
0x1002288d1: mov rdi, r12
0x1002288d4: mov rsi, r14
0x1002288d7: mov edx, dword ptr [rsp + 0x44]
0x1002288db: call 0x100473dd0 ; 0x100473dd0
0x1002288e0: test byte ptr [rsp + 0x20], 1
0x1002288e5: je 0x1002288fc
0x1002288e7: mov rbx, qword ptr [rsp + 0x30]
0x1002288ec: call 0x1007e50d0 ; 0x1007e50d0
0x1002288f1: mov rdi, rax
0x1002288f4: mov rsi, rbx
0x1002288f7: call 0x1007e5db0 ; 0x1007e5db0
0x1002288fc: mov rax, r12
0x1002288ff: lea rsp, [rbp - 0x28]
0x100228903: pop rbx
0x100228904: pop r12
0x100228906: pop r13
0x100228908: pop r14
0x10022890a: pop r15
0x10022890c: pop rbp
0x10022890d: ret 
0x10022890e: lea rdi, [rip + 0x94eecd] ; 0x100b777e2 !instances
0x100228915: lea rsi, [rip + 0x94eed1] ; 0x100b777ed ./ModelInstances.h
0x10022891c: lea r8, [rip + 0x94eedd] ; 0x100b77800 Already created a vertex buffer for %s
0x100228923: mov edx, 0x66
0x100228928: mov ecx, 4
0x10022892d: xor eax, eax
0x10022892f: mov r9, r14
0x100228932: call 0x1007e6030 ; 0x1007e6030
0x100228937: ud2 
0x100228939: lea rdi, [rsp + 0x20]
0x10022893e: call 0x100aa230c ; 0x100aa230c __ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv
0x100228943: lea rdi, [rip + 0x94ef21] ; 0x100b7786b m_instanceCapacity > 0
0x10022894a: lea rsi, [rip + 0x93992a] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x100228951: lea r8, [rip + 0x94ef2a] ; 0x100b77882 Must call VertexData::SetInstanceCapacity() before calling AddInstanceData()
0x100228958: mov edx, 0xf5
0x10022895d: mov ecx, 4
0x100228962: xor eax, eax
0x100228964: call 0x1007e6030 ; 0x1007e6030
0x100228969: ud2 
0x10022896b: mov rdi, rax
0x10022896e: call 0x100011bf0 ; 0x100011bf0
0x100228973: mov rbx, rax
0x100228976: test byte ptr [rsp + 0x20], 1
0x10022897b: je 0x100228992
0x10022897d: mov r14, qword ptr [rsp + 0x30]
0x100228982: call 0x1007e50d0 ; 0x1007e50d0
0x100228987: mov rdi, rax
0x10022898a: mov rsi, r14
0x10022898d: call 0x1007e5db0 ; 0x1007e5db0
0x100228992: mov rdi, rbx
0x100228995: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10022899a: mov rdi, rax
0x10022899d: call 0x100011bf0 ; 0x100011bf0
0x1002289a2: nop word ptr cs:[rax + rax]
