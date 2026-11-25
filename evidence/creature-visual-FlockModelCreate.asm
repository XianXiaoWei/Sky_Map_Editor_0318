0x10019dd60: push rbp
0x10019dd61: mov rbp, rsp
0x10019dd64: push r15
0x10019dd66: push r14
0x10019dd68: push r13
0x10019dd6a: push r12
0x10019dd6c: push rbx
0x10019dd6d: sub rsp, 0x68
0x10019dd71: mov qword ptr [rbp - 0x70], r9
0x10019dd75: mov dword ptr [rbp - 0x44], r8d
0x10019dd79: mov qword ptr [rbp - 0x78], rcx
0x10019dd7d: mov r15d, edx
0x10019dd80: mov r14, rsi
0x10019dd83: mov r13, rdi
0x10019dd86: call 0x1004744b0 ; 0x1004744b0
0x10019dd8b: test rax, rax
0x10019dd8e: jne 0x10019e00f
0x10019dd94: mov ebx, dword ptr [rbp + 0x20]
0x10019dd97: lea rdi, [r13 + 0x10]
0x10019dd9b: call 0x10019f130 ; 0x10019f130
0x10019dda0: mov r12, rax
0x10019dda3: lea rdx, [r13 + 0x4748]
0x10019ddaa: mov rdi, r12
0x10019ddad: mov rsi, r14
0x10019ddb0: mov ecx, ebx
0x10019ddb2: mov r8, r13
0x10019ddb5: call 0x1004742e0 ; 0x1004742e0
0x10019ddba: vxorps xmm0, xmm0, xmm0
0x10019ddbe: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x10019ddc3: mov qword ptr [rbp - 0x30], 0
0x10019ddcb: mov rdi, r14
0x10019ddce: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x10019ddd3: mov rbx, rax
0x10019ddd6: cmp rbx, 0xff1
0x10019dddd: jae 0x10019e03a
0x10019dde3: mov dword ptr [rbp - 0x48], r15d
0x10019dde7: cmp rbx, 0x17
0x10019ddeb: jae 0x10019ddff
0x10019dded: mov eax, ebx
0x10019ddef: add al, al
0x10019ddf1: mov byte ptr [rbp - 0x40], al
0x10019ddf4: lea r15, [rbp - 0x3f]
0x10019ddf8: test rbx, rbx
0x10019ddfb: jne 0x10019de3b
0x10019ddfd: jmp 0x10019de49 ; 0x10019de49
0x10019ddff: mov qword ptr [rbp - 0x68], r12
0x10019de03: mov r12, r14
0x10019de06: mov r14, rbx
0x10019de09: add r14, 0x10
0x10019de0d: and r14, 0xfffffffffffffff0
0x10019de11: call 0x1007e50d0 ; 0x1007e50d0
0x10019de16: mov rdi, rax
0x10019de19: mov rsi, r14
0x10019de1c: call 0x1007e5790 ; 0x1007e5790
0x10019de21: mov r15, rax
0x10019de24: mov qword ptr [rbp - 0x30], r15
0x10019de28: or r14, 1
0x10019de2c: mov qword ptr [rbp - 0x40], r14
0x10019de30: mov r14, r12
0x10019de33: mov r12, qword ptr [rbp - 0x68]
0x10019de37: mov qword ptr [rbp - 0x38], rbx
0x10019de3b: mov rdi, r15
0x10019de3e: mov rsi, r14
0x10019de41: mov rdx, rbx
0x10019de44: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x10019de49: mov byte ptr [r15 + rbx], 0
0x10019de4e: movzx eax, byte ptr [rbp - 0x40]
0x10019de52: test al, 1
0x10019de54: jne 0x10019de63
0x10019de56: mov rcx, rax
0x10019de59: shr rcx, 1
0x10019de5c: mov esi, 0x16
0x10019de61: jmp 0x10019de72 ; 0x10019de72
0x10019de63: mov rsi, qword ptr [rbp - 0x40]
0x10019de67: mov rcx, qword ptr [rbp - 0x38]
0x10019de6b: and rsi, 0xfffffffffffffffe
0x10019de6f: dec rsi
0x10019de72: mov rdx, rsi
0x10019de75: sub rdx, rcx
0x10019de78: cmp rdx, 0xa
0x10019de7c: jae 0x10019deb2
0x10019de7e: mov edx, 0xa
0x10019de83: sub rdx, rsi
0x10019de86: add rdx, rcx
0x10019de89: lea rax, [rip + 0x9d9997] ; 0x100b77827 VertexData
0x10019de90: mov qword ptr [rsp + 8], rax
0x10019de95: mov qword ptr [rsp], 0xa
0x10019de9d: lea rdi, [rbp - 0x40]
0x10019dea1: xor r9d, r9d
0x10019dea4: mov r8, rcx
0x10019dea7: call 0x1000198c0 ; 0x1000198c0
0x10019deac: lea rsi, [rbp - 0x3f]
0x10019deb0: jmp 0x10019def0 ; 0x10019def0
0x10019deb2: test al, 1
0x10019deb4: lea rsi, [rbp - 0x3f]
0x10019deb8: mov rax, qword ptr [rbp - 0x30]
0x10019debc: cmove rax, rsi
0x10019dec0: movabs rdx, 0x6144786574726556
0x10019deca: mov qword ptr [rax + rcx], rdx
0x10019dece: mov word ptr [rax + rcx + 8], 0x6174
0x10019ded5: add rcx, 0xa
0x10019ded9: test byte ptr [rbp - 0x40], 1
0x10019dedd: jne 0x10019dee8
0x10019dedf: mov edx, ecx
0x10019dee1: add dl, dl
0x10019dee3: mov byte ptr [rbp - 0x40], dl
0x10019dee6: jmp 0x10019deec ; 0x10019deec
0x10019dee8: mov qword ptr [rbp - 0x38], rcx
0x10019deec: mov byte ptr [rax + rcx], 0
0x10019def0: mov edx, dword ptr [rbp - 0x44]
0x10019def3: lea r15, [r12 + 0x18]
0x10019def8: test byte ptr [rbp - 0x40], 1
0x10019defc: cmovne rsi, qword ptr [rbp - 0x30]
0x10019df01: mov rdi, r15
0x10019df04: call 0x1007f53c0 ; 0x1007f53c0
0x10019df09: mov eax, dword ptr [rbp + 0x18]
0x10019df0c: mov dword ptr [r12 + 0x158], eax
0x10019df14: movabs rax, 0x10000001e
0x10019df1e: mov qword ptr [rbp - 0x60], rax
0x10019df22: lea rcx, [rbp - 0x5c]
0x10019df26: mov rax, qword ptr [rbp - 0x78]
0x10019df2a: mov qword ptr [rsp + 8], rax
0x10019df2f: mov dword ptr [rsp], 0
0x10019df36: lea rdx, [rbp - 0x60]
0x10019df3a: mov esi, 0
0x10019df3f: mov r8d, 1
0x10019df45: mov r9d, 1
0x10019df4b: mov rdi, r15
0x10019df4e: call 0x1007f5430 ; 0x1007f5430
0x10019df53: mov r8d, dword ptr [rbp + 0x10]
0x10019df57: mov esi, 0
0x10019df5c: mov edx, 0x11
0x10019df61: mov ecx, 1
0x10019df66: mov rdi, r15
0x10019df69: mov r9, qword ptr [rbp - 0x70]
0x10019df6d: call 0x1007f55d0 ; 0x1007f55d0
0x10019df72: cmp dword ptr [r12 + 0x158], 0
0x10019df7b: je 0x10019e043
0x10019df81: lea rcx, [rbp - 0x58]
0x10019df85: vmovaps xmm0, xmmword ptr [rip + 0x90f9a3] ; 0x100aad930
0x10019df8d: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x10019df92: mov qword ptr [rsp + 8], 0
0x10019df9b: mov dword ptr [rsp], 1
0x10019dfa2: lea rdx, [rbp - 0x60]
0x10019dfa6: mov esi, 1
0x10019dfab: mov r8d, 2
0x10019dfb1: mov r9d, 2
0x10019dfb7: mov rdi, r15
0x10019dfba: call 0x1007f5430 ; 0x1007f5430
0x10019dfbf: mov rdi, r15
0x10019dfc2: call 0x1007f5690 ; 0x1007f5690
0x10019dfc7: mov rcx, qword ptr [r13 + 0x4738]
0x10019dfce: mov r8, qword ptr [r13 + 0x4740]
0x10019dfd5: mov rdi, r12
0x10019dfd8: mov rsi, r14
0x10019dfdb: mov edx, dword ptr [rbp - 0x48]
0x10019dfde: call 0x100473dd0 ; 0x100473dd0
0x10019dfe3: test byte ptr [rbp - 0x40], 1
0x10019dfe7: je 0x10019dffd
0x10019dfe9: mov rbx, qword ptr [rbp - 0x30]
0x10019dfed: call 0x1007e50d0 ; 0x1007e50d0
0x10019dff2: mov rdi, rax
0x10019dff5: mov rsi, rbx
0x10019dff8: call 0x1007e5db0 ; 0x1007e5db0
0x10019dffd: mov rax, r12
0x10019e000: add rsp, 0x68
0x10019e004: pop rbx
0x10019e005: pop r12
0x10019e007: pop r13
0x10019e009: pop r14
0x10019e00b: pop r15
0x10019e00d: pop rbp
0x10019e00e: ret 
0x10019e00f: lea rdi, [rip + 0x9d97cc] ; 0x100b777e2 !instances
0x10019e016: lea rsi, [rip + 0x9d97d0] ; 0x100b777ed ./ModelInstances.h
0x10019e01d: lea r8, [rip + 0x9d97dc] ; 0x100b77800 Already created a vertex buffer for %s
0x10019e024: mov edx, 0x66
0x10019e029: mov ecx, 4
0x10019e02e: xor eax, eax
0x10019e030: mov r9, r14
0x10019e033: call 0x1007e6030 ; 0x1007e6030
0x10019e038: ud2 
0x10019e03a: lea rdi, [rbp - 0x40]
0x10019e03e: call 0x100aa230c ; 0x100aa230c __ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv
0x10019e043: lea rdi, [rip + 0x9d9821] ; 0x100b7786b m_instanceCapacity > 0
0x10019e04a: lea rsi, [rip + 0x9c422a] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x10019e051: lea r8, [rip + 0x9d982a] ; 0x100b77882 Must call VertexData::SetInstanceCapacity() before calling AddInstanceData()
0x10019e058: mov edx, 0xf5
0x10019e05d: mov ecx, 4
0x10019e062: xor eax, eax
0x10019e064: call 0x1007e6030 ; 0x1007e6030
0x10019e069: ud2 
0x10019e06b: mov rdi, rax
0x10019e06e: call 0x100011bf0 ; 0x100011bf0
0x10019e073: mov rbx, rax
0x10019e076: test byte ptr [rbp - 0x40], 1
0x10019e07a: je 0x10019e090
0x10019e07c: mov r14, qword ptr [rbp - 0x30]
0x10019e080: call 0x1007e50d0 ; 0x1007e50d0
0x10019e085: mov rdi, rax
0x10019e088: mov rsi, r14
0x10019e08b: call 0x1007e5db0 ; 0x1007e5db0
0x10019e090: mov rdi, rbx
0x10019e093: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10019e098: mov rdi, rax
0x10019e09b: call 0x100011bf0 ; 0x100011bf0
