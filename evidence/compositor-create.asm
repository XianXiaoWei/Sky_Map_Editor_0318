0x10023d350: push rbp
0x10023d351: mov rbp, rsp
0x10023d354: push r15
0x10023d356: push r14
0x10023d358: push r13
0x10023d35a: push r12
0x10023d35c: push rbx
0x10023d35d: sub rsp, 0x68
0x10023d361: mov qword ptr [rbp - 0x38], r9
0x10023d365: mov qword ptr [rbp - 0x80], r8
0x10023d369: mov r15, rcx
0x10023d36c: mov qword ptr [rbp - 0x88], rdx
0x10023d373: mov rbx, rsi
0x10023d376: mov r12, rdi
0x10023d379: mov r14, qword ptr [rbp + 0x18]
0x10023d37d: mov word ptr [r12 + 0x15], 0
0x10023d385: mov dword ptr [r12 + 0x1f600], 0
0x10023d391: mov dword ptr [r12 + 0x1b7f8], 0
0x10023d39d: mov dword ptr [r12 + 0x200f8], 0
0x10023d3a9: mov dword ptr [r12 + 0x385c8], 0
0x10023d3b5: mov dword ptr [r12 + 0x387d0], 0
0x10023d3c1: mov qword ptr [r12 + 0x5c], 0x3f800000
0x10023d3ca: vmovaps xmm0, xmmword ptr [rip + 0x867cfe] ; 0x100aa50d0
0x10023d3d2: vmovups xmmword ptr [r12 + 0x28], xmm0
0x10023d3d9: mov byte ptr [r12 + 0xd], 0
0x10023d3df: vxorps xmm0, xmm0, xmm0
0x10023d3e3: vmovups xmmword ptr [r12 + 0x18], xmm0
0x10023d3ea: call 0x1007c1470 ; 0x1007c1470
0x10023d3ef: mov qword ptr [r12 + 0x1b0], rax
0x10023d3f7: mov qword ptr [rbp - 0x78], rbx
0x10023d3fb: mov qword ptr [r12 + 0x1b8], rbx
0x10023d403: mov qword ptr [rbp - 0x90], r15
0x10023d40a: mov qword ptr [r12 + 0x1c0], r15
0x10023d412: mov qword ptr [r12 + 0x1c8], r14
0x10023d41a: movabs rax, 0x1000003e8
0x10023d424: mov qword ptr [rbp - 0x54], rax
0x10023d428: vmovaps xmm0, xmmword ptr [rip + 0x875b00] ; 0x100ab2f30
0x10023d430: vmovups xmmword ptr [rbp - 0x64], xmm0
0x10023d435: movabs rax, 0x100000001
0x10023d43f: mov qword ptr [rbp - 0x70], rax
0x10023d443: mov r14, rax
0x10023d446: mov dword ptr [rbp - 0x68], 0
0x10023d44d: lea rdi, [r12 + 0x1b708]
0x10023d455: mov qword ptr [rbp - 0x30], rdi
0x10023d459: lea r13, [rbp - 0x70]
0x10023d45d: mov rsi, r13
0x10023d460: call 0x1007f04d0 ; 0x1007f04d0
0x10023d465: movabs r15, 0x200000002
0x10023d46f: mov qword ptr [rbp - 0x70], r15
0x10023d473: mov dword ptr [rbp - 0x68], 0
0x10023d47a: lea rdi, [r12 + 0x1b730]
0x10023d482: mov qword ptr [rbp - 0x40], rdi
0x10023d486: mov rsi, r13
0x10023d489: call 0x1007f04d0 ; 0x1007f04d0
0x10023d48e: mov qword ptr [rbp - 0x64], r15
0x10023d492: lea rbx, [r12 + 0x1b758]
0x10023d49a: mov rdi, rbx
0x10023d49d: mov rsi, r13
0x10023d4a0: call 0x1007f04d0 ; 0x1007f04d0
0x10023d4a5: mov qword ptr [rbp - 0x64], r14
0x10023d4a9: lea r15, [r12 + 0x1b780]
0x10023d4b1: mov rdi, r15
0x10023d4b4: mov rsi, r13
0x10023d4b7: mov r14, r13
0x10023d4ba: call 0x1007f04d0 ; 0x1007f04d0
0x10023d4bf: mov dword ptr [rbp - 0x60], 1
0x10023d4c6: movabs rax, 0x100000001
0x10023d4d0: mov qword ptr [rbp - 0x70], rax
0x10023d4d4: movabs rax, 0x100000000
0x10023d4de: mov qword ptr [rbp - 0x68], rax
0x10023d4e2: lea r13, [r12 + 0x1b7a8]
0x10023d4ea: mov rdi, r13
0x10023d4ed: mov rsi, r14
0x10023d4f0: call 0x1007f04d0 ; 0x1007f04d0
0x10023d4f5: mov dword ptr [rbp - 0x60], 2
0x10023d4fc: vmovaps xmm0, xmmword ptr [rip + 0x875a3c] ; 0x100ab2f40
0x10023d504: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x10023d509: lea r14, [r12 + 0x1b7d0]
0x10023d511: mov rdi, r14
0x10023d514: lea rsi, [rbp - 0x70]
0x10023d518: call 0x1007f04d0 ; 0x1007f04d0
0x10023d51d: mov qword ptr [r12 + 0x1b6d0], 0
0x10023d529: mov rax, qword ptr [rbp - 0x30]
0x10023d52d: mov qword ptr [r12 + 0x1b6d8], rax
0x10023d535: mov rax, qword ptr [rbp - 0x40]
0x10023d539: mov qword ptr [r12 + 0x1b6e0], rax
0x10023d541: mov qword ptr [rbp - 0x40], rbx
0x10023d545: mov qword ptr [r12 + 0x1b6e8], rbx
0x10023d54d: mov qword ptr [r12 + 0x1b6f0], r15
0x10023d555: mov qword ptr [r12 + 0x1b6f8], r13
0x10023d55d: mov qword ptr [r12 + 0x1b700], r14
0x10023d565: lea r15, [r12 + 0x1d0]
0x10023d56d: mov rdi, r12
0x10023d570: mov rsi, r15
0x10023d573: mov rdx, qword ptr [rbp - 0x80]
0x10023d577: call 0x10023de50 ; 0x10023de50
0x10023d57c: cmp dword ptr [r12 + 0x387d0], 0
0x10023d585: je 0x10023d5b7
0x10023d587: xor ebx, ebx
0x10023d589: nop dword ptr [rax]
0x10023d590: mov rdi, qword ptr [r12 + 0x1b0]
0x10023d598: mov rax, qword ptr [rdi]
0x10023d59b: mov ecx, ebx
0x10023d59d: mov esi, dword ptr [r12 + rcx*4 + 0x387d4]
0x10023d5a5: call qword ptr [rax + 0xa0]
0x10023d5ab: inc ebx
0x10023d5ad: cmp ebx, dword ptr [r12 + 0x387d0]
0x10023d5b5: jb 0x10023d590
0x10023d5b7: mov r13, qword ptr [rbp + 0x10]
0x10023d5bb: cmp dword ptr [r12 + 0x17660], 0
0x10023d5c4: je 0x10023d608
0x10023d5c6: xor ebx, ebx
0x10023d5c8: nop dword ptr [rax + rax]
0x10023d5d0: mov rdi, qword ptr [r12 + 0x1b0]
0x10023d5d8: mov rax, qword ptr [rdi]
0x10023d5db: mov r14d, ebx
0x10023d5de: lea rcx, [r14 + r14*8]
0x10023d5e2: lea rsi, [r12 + rcx*8 + 0x17680]
0x10023d5ea: call qword ptr [rax + 0x98]
0x10023d5f0: mov dword ptr [r12 + r14*4 + 0x387d4], eax
0x10023d5f8: inc ebx
0x10023d5fa: mov eax, dword ptr [r12 + 0x17660]
0x10023d602: cmp ebx, eax
0x10023d604: jb 0x10023d5d0
0x10023d606: jmp 0x10023d60a ; 0x10023d60a
0x10023d608: xor eax, eax
0x10023d60a: mov dword ptr [r12 + 0x387d0], eax
0x10023d612: mov rdx, qword ptr [rbp - 0x88]
0x10023d619: mov eax, dword ptr [rdx + 0x260]
0x10023d61f: mov dword ptr [r12 + 0x28], eax
0x10023d624: mov eax, dword ptr [rdx + 0x264]
0x10023d62a: mov dword ptr [r12 + 0x2c], eax
0x10023d62f: xor ecx, ecx
0x10023d631: xor r8d, r8d
0x10023d634: mov rdi, r12
0x10023d637: mov rsi, qword ptr [rbp - 0x38]
0x10023d63b: call 0x1002457c0 ; 0x1002457c0
0x10023d640: mov rdi, r13
0x10023d643: call 0x100596200 ; 0x100596200
0x10023d648: mov rdi, r12
0x10023d64b: mov rsi, r15
0x10023d64e: mov rbx, qword ptr [rbp - 0x78]
0x10023d652: mov rdx, rbx
0x10023d655: mov rcx, r13
0x10023d658: call 0x100244410 ; 0x100244410
0x10023d65d: mov rdi, r12
0x10023d660: mov rsi, r15
0x10023d663: mov rdx, rbx
0x10023d666: mov rcx, r13
0x10023d669: call 0x1002445a0 ; 0x1002445a0
0x10023d66e: mov dword ptr [r12 + 0x64], 0
0x10023d677: call 0x10079ac90 ; 0x10079ac90
0x10023d67c: lea rdx, [rip + 0x93e760] ; 0x100b7bde3 NoiseBlue3Ch
0x10023d683: mov rdi, rbx
0x10023d686: mov rsi, rax
0x10023d689: call 0x1007c4360 ; 0x1007c4360
0x10023d68e: test rax, rax
0x10023d691: mov qword ptr [rbp - 0x30], r15
0x10023d695: je 0x10023d6a9
0x10023d697: lea rsi, [r12 + 0x1b690]
0x10023d69f: mov rdi, rax
0x10023d6a2: call 0x1007c2310 ; 0x1007c2310
0x10023d6a7: jmp 0x10023d6c1 ; 0x10023d6c1
0x10023d6a9: call 0x10079ac90 ; 0x10079ac90
0x10023d6ae: mov rsi, qword ptr [rax + 8]
0x10023d6b2: lea rdx, [rip + 0x93e72a] ; 0x100b7bde3 NoiseBlue3Ch
0x10023d6b9: mov rdi, rbx
0x10023d6bc: call 0x1007c4640 ; 0x1007c4640
0x10023d6c1: lea r14, [r12 + 0x5c]
0x10023d6c6: lea rax, [r12 + 0x60]
0x10023d6cb: mov qword ptr [rbp - 0x38], rax
0x10023d6cf: lea r13, [r12 + 0x30]
0x10023d6d4: lea r15, [r12 + 0x1b6b0]
0x10023d6dc: call 0x10079ac90 ; 0x10079ac90
0x10023d6e1: lea rdx, [rip + 0x93e708] ; 0x100b7bdf0 HeatTex
0x10023d6e8: mov rdi, rbx
0x10023d6eb: mov rsi, rax
0x10023d6ee: call 0x1007c4360 ; 0x1007c4360
0x10023d6f3: test rax, rax
0x10023d6f6: je 0x10023d705
0x10023d6f8: mov rdi, rax
0x10023d6fb: mov rsi, r15
0x10023d6fe: call 0x1007c2310 ; 0x1007c2310
0x10023d703: jmp 0x10023d71d ; 0x10023d71d
0x10023d705: call 0x10079ac90 ; 0x10079ac90
0x10023d70a: mov rsi, qword ptr [rax + 8]
0x10023d70e: lea rdx, [rip + 0x93e6db] ; 0x100b7bdf0 HeatTex
0x10023d715: mov rdi, rbx
0x10023d718: call 0x1007c4640 ; 0x1007c4640
0x10023d71d: call 0x1007945e0 ; 0x1007945e0
0x10023d722: lea rsi, [rip + 0x93e6cf] ; 0x100b7bdf8 u_texSizeFull
0x10023d729: mov ecx, 2
0x10023d72e: mov rdi, rax
0x10023d731: mov rdx, r13
0x10023d734: call 0x100793f20 ; 0x100793f20
0x10023d739: call 0x1007945e0 ; 0x1007945e0
0x10023d73e: lea rdx, [r12 + 0x38]
0x10023d743: lea rsi, [rip + 0x93e6bc] ; 0x100b7be06 u_texSizeHalf
0x10023d74a: mov ecx, 2
0x10023d74f: mov rdi, rax
0x10023d752: call 0x100793f20 ; 0x100793f20
0x10023d757: call 0x1007945e0 ; 0x1007945e0
0x10023d75c: lea rdx, [r12 + 0x40]
0x10023d761: lea rsi, [rip + 0x93e6ac] ; 0x100b7be14 u_invTexSizeFull
0x10023d768: mov ecx, 2
0x10023d76d: mov rdi, rax
0x10023d770: call 0x100793f20 ; 0x100793f20
0x10023d775: call 0x1007945e0 ; 0x1007945e0
0x10023d77a: lea rdx, [r12 + 0x48]
0x10023d77f: lea rsi, [rip + 0x93e69f] ; 0x100b7be25 u_invTexSizeHalf
0x10023d786: mov ecx, 2
0x10023d78b: mov rdi, rax
0x10023d78e: call 0x100793f20 ; 0x100793f20
0x10023d793: call 0x1007945e0 ; 0x1007945e0
0x10023d798: lea rdx, [r12 + 0x50]
0x10023d79d: lea rsi, [rip + 0x93e692] ; 0x100b7be36 u_randomOffset
0x10023d7a4: mov ecx, 3
0x10023d7a9: mov rdi, rax
0x10023d7ac: call 0x100793f20 ; 0x100793f20
0x10023d7b1: call 0x1007945e0 ; 0x1007945e0
0x10023d7b6: lea rsi, [rip + 0x93e688] ; 0x100b7be45 u_averageLum
0x10023d7bd: mov ecx, 1
0x10023d7c2: mov rdi, rax
0x10023d7c5: mov rdx, r14
0x10023d7c8: call 0x100793f20 ; 0x100793f20
0x10023d7cd: call 0x1007945e0 ; 0x1007945e0
0x10023d7d2: lea rsi, [rip + 0x93e679] ; 0x100b7be52 u_averageLumChangeTm
0x10023d7d9: mov ecx, 1
0x10023d7de: mov rdi, rax
0x10023d7e1: mov rdx, qword ptr [rbp - 0x38]
0x10023d7e5: call 0x100793f20 ; 0x100793f20
0x10023d7ea: call 0x1007945e0 ; 0x1007945e0
0x10023d7ef: mov rcx, qword ptr [r12 + 0x1b690]
0x10023d7f7: test rcx, rcx
0x10023d7fa: je 0x10023d810
0x10023d7fc: mov rcx, qword ptr [rcx + 0x10]
0x10023d800: lea rdx, [rcx + 0xb0]
0x10023d807: test rcx, rcx
0x10023d80a: cmove rdx, rcx
0x10023d80e: jmp 0x10023d812 ; 0x10023d812
0x10023d810: xor edx, edx
0x10023d812: mov r13, qword ptr [rbp + 0x10]
0x10023d816: lea r14, [r12 + 0x64]
0x10023d81b: lea rsi, [rip + 0x93e645] ; 0x100b7be67 u_texBlueNoise
0x10023d822: mov rdi, rax
0x10023d825: mov rcx, qword ptr [rbp - 0x40]
0x10023d829: call 0x100794050 ; 0x100794050
0x10023d82e: call 0x1007945e0 ; 0x1007945e0
0x10023d833: mov rcx, qword ptr [r15]
0x10023d836: test rcx, rcx
0x10023d839: je 0x10023d84f
0x10023d83b: mov rcx, qword ptr [rcx + 0x10]
0x10023d83f: lea rdx, [rcx + 0xb0]
0x10023d846: test rcx, rcx
0x10023d849: cmove rdx, rcx
0x10023d84d: jmp 0x10023d851 ; 0x10023d851
0x10023d84f: xor edx, edx
0x10023d851: mov rbx, qword ptr [rbp - 0x30]
0x10023d855: lea rsi, [rip + 0x93e61a] ; 0x100b7be76 u_texPerturb
0x10023d85c: xor ecx, ecx
0x10023d85e: mov rdi, rax
0x10023d861: call 0x100794050 ; 0x100794050
0x10023d866: call 0x1007945e0 ; 0x1007945e0
0x10023d86b: lea rsi, [rip + 0x93e611] ; 0x100b7be83 u_disableMeshMotion
0x10023d872: mov ecx, 1
0x10023d877: mov rdi, rax
0x10023d87a: mov rdx, r14
0x10023d87d: call 0x100793f20 ; 0x100793f20
0x10023d882: lea rsi, [rip + 0x93e60e] ; 0x100b7be97 GSU::Compositor
0x10023d889: xor edx, edx
0x10023d88b: mov ecx, 0x20
0x10023d890: mov rdi, r13
0x10023d893: call 0x100596550 ; 0x100596550
0x10023d898: mov qword ptr [r12 + 0x68], rax
0x10023d89d: lea r14, [r12 + 0x19e50]
0x10023d8a5: lea rsi, [r12 + 0x1b800]
0x10023d8ad: lea rdx, [rip + 0x93deb8] ; 0x100b7b76c rtFullLdr
0x10023d8b4: xor ecx, ecx
0x10023d8b6: mov rdi, rbx
0x10023d8b9: call 0x100241f70 ; 0x100241f70
0x10023d8be: mov rdi, r14
0x10023d8c1: mov rsi, qword ptr [rbp - 0x90]
0x10023d8c8: mov rbx, qword ptr [rbp - 0x78]
0x10023d8cc: mov rdx, rbx
0x10023d8cf: mov rcx, rax
0x10023d8d2: call 0x1002427c0 ; 0x1002427c0
0x10023d8d7: add r12, 0x19a08
0x10023d8de: mov rdi, r12
0x10023d8e1: mov rsi, rbx
0x10023d8e4: call 0x10041b590 ; 0x10041b590
0x10023d8e9: add rsp, 0x68
0x10023d8ed: pop rbx
0x10023d8ee: pop r12
0x10023d8f0: pop r13
0x10023d8f2: pop r14
0x10023d8f4: pop r15
0x10023d8f6: pop rbp
0x10023d8f7: ret 
0x10023d8f8: nop dword ptr [rax + rax]
