0x1007bcde0: push rbp
0x1007bcde1: mov rbp, rsp
0x1007bcde4: push r14
0x1007bcde6: push rbx
0x1007bcde7: mov r14, rsi
0x1007bcdea: mov rbx, rdi
0x1007bcded: cmp dword ptr [rbx + 0x19830], 1
0x1007bcdf4: jne 0x1007bcfca
0x1007bcdfa: mov r8d, dword ptr [rbx + 0x3070]
0x1007bce01: cmp r8, 0x28
0x1007bce05: jae 0x1007bcff2
0x1007bce0b: mov r9d, dword ptr [rbx + 0x17b20]
0x1007bce12: mov esi, dword ptr [r14]
0x1007bce15: lea rdi, [r9 + r9*2]
0x1007bce19: mov dword ptr [rbx + rdi*8 + 0x17b24], esi
0x1007bce20: mov esi, dword ptr [r14 + 0x74]
0x1007bce24: mov dword ptr [rbx + rdi*8 + 0x17b28], esi
0x1007bce2b: mov al, byte ptr [r14 + 0x85]
0x1007bce32: mov byte ptr [rbx + rdi*8 + 0x17b39], al
0x1007bce39: mov al, byte ptr [r14 + 0x84]
0x1007bce40: mov byte ptr [rbx + rdi*8 + 0x17b38], al
0x1007bce47: mov al, byte ptr [r14 + 0x86]
0x1007bce4e: mov byte ptr [rbx + rdi*8 + 0x17b3a], al
0x1007bce55: mov al, byte ptr [r14 + 0x87]
0x1007bce5c: mov byte ptr [rbx + rdi*8 + 0x17b3b], al
0x1007bce63: mov eax, dword ptr [r14 + 0x80]
0x1007bce6a: mov dword ptr [rbx + rdi*8 + 0x17b34], eax
0x1007bce71: mov rax, qword ptr [r14 + 0x78]
0x1007bce75: mov qword ptr [rbx + rdi*8 + 0x17b2c], rax
0x1007bce7d: mov eax, dword ptr [rbx + 0x18724]
0x1007bce83: lea esi, [rax + 1]
0x1007bce86: lea edi, [rax + 2]
0x1007bce89: shl rax, 4
0x1007bce8d: mov dword ptr [rbx + rax + 0x18728], 4
0x1007bce98: lea ecx, [r9 + 1]
0x1007bce9c: mov dword ptr [rbx + 0x17b20], ecx
0x1007bcea2: mov dword ptr [rbx + rax + 0x1872c], r9d
0x1007bceaa: mov qword ptr [rbx + rax + 0x18730], 0
0x1007bceb6: mov dword ptr [rbx + 0x18724], edi
0x1007bcebc: shl rsi, 4
0x1007bcec0: mov dword ptr [rbx + rsi + 0x18728], 6
0x1007bcecb: mov dword ptr [rbx + rsi + 0x1872c], r8d
0x1007bced3: mov qword ptr [rbx + rsi + 0x18730], 0
0x1007bcedf: imul rax, r8, 0x3b0
0x1007bcee6: lea rdi, [rbx + rax + 0x3078]
0x1007bceee: mov rsi, rdx
0x1007bcef1: call 0x100249280 ; 0x100249280
0x1007bcef6: mov eax, dword ptr [rbx]
0x1007bcef8: dec eax
0x1007bcefa: mov ecx, dword ptr [rbx + 0x3070]
0x1007bcf00: imul rdx, rcx, 0x3b0
0x1007bcf07: mov dword ptr [rbx + rdx + 0x3420], eax
0x1007bcf0e: mov al, byte ptr [r14 + 0x86]
0x1007bcf15: mov byte ptr [rbx + rdx + 0x3410], al
0x1007bcf1c: mov al, byte ptr [r14 + 0x87]
0x1007bcf23: mov byte ptr [rbx + rdx + 0x3411], al
0x1007bcf2a: mov eax, dword ptr [r14 + 0x80]
0x1007bcf31: mov dword ptr [rbx + rdx + 0x341c], eax
0x1007bcf38: mov rax, qword ptr [r14 + 0x78]
0x1007bcf3c: mov qword ptr [rbx + rdx + 0x3414], rax
0x1007bcf44: vmovups xmm0, xmmword ptr [r14 + 4]
0x1007bcf4a: vmovups xmm1, xmmword ptr [r14 + 0x10]
0x1007bcf50: vmovups xmmword ptr [rbx + rdx + 0x33ac], xmm1
0x1007bcf59: vmovups xmmword ptr [rbx + rdx + 0x33a0], xmm0
0x1007bcf62: vmovups xmm0, xmmword ptr [r14 + 0x20]
0x1007bcf68: vmovups xmm1, xmmword ptr [r14 + 0x2c]
0x1007bcf6e: vmovups xmmword ptr [rbx + rdx + 0x33c8], xmm1
0x1007bcf77: vmovups xmmword ptr [rbx + rdx + 0x33bc], xmm0
0x1007bcf80: vmovups xmm0, xmmword ptr [r14 + 0x3c]
0x1007bcf86: vmovups xmm1, xmmword ptr [r14 + 0x48]
0x1007bcf8c: vmovups xmmword ptr [rbx + rdx + 0x33e4], xmm1
0x1007bcf95: vmovups xmmword ptr [rbx + rdx + 0x33d8], xmm0
0x1007bcf9e: vmovups xmm0, xmmword ptr [r14 + 0x58]
0x1007bcfa4: vmovups xmm1, xmmword ptr [r14 + 0x64]
0x1007bcfaa: vmovups xmmword ptr [rbx + rdx + 0x33f4], xmm0
0x1007bcfb3: vmovups xmmword ptr [rbx + rdx + 0x3400], xmm1
0x1007bcfbc: lea eax, [rcx + 1]
0x1007bcfbf: mov dword ptr [rbx + 0x3070], eax
0x1007bcfc5: pop rbx
0x1007bcfc6: pop r14
0x1007bcfc8: pop rbp
0x1007bcfc9: ret 
0x1007bcfca: lea rdi, [rip + 0x3e6c49] ; 0x100ba3c1a m_activePassType == kGpuPassType_Render
0x1007bcfd1: lea rsi, [rip + 0x3e6983] ; 0x100ba395b RenderOutline.cpp
0x1007bcfd8: lea r8, [rip + 0x3e6cbb] ; 0x100ba3c9a AddRender can only be called added during a RenderPass. Call AddRenderPass() first.
0x1007bcfdf: mov edx, 0x10b
0x1007bcfe4: mov ecx, 4
0x1007bcfe9: xor eax, eax
0x1007bcfeb: call 0x1007e6030 ; 0x1007e6030
0x1007bcff0: ud2 
0x1007bcff2: lea rdi, [rip + 0x3e6cf5] ; 0x100ba3cee quadCount < kMaxQuads
0x1007bcff9: lea rsi, [rip + 0x3e695b] ; 0x100ba395b RenderOutline.cpp
0x1007bd000: mov edx, 0x10c
0x1007bd005: mov ecx, 3
0x1007bd00a: call 0x1007e5f70 ; 0x1007e5f70
0x1007bd00f: ud2 
0x1007bd011: nop word ptr cs:[rax + rax]
