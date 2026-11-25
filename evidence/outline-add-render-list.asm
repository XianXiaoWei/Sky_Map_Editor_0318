0x1007bcc00: cmp dword ptr [rdi + 0x19830], 1
0x1007bcc07: jne 0x1007bcdaa
0x1007bcc0d: mov r8d, dword ptr [rdi + 0x17b20]
0x1007bcc14: mov ecx, dword ptr [rsi]
0x1007bcc16: lea rax, [r8 + r8*2]
0x1007bcc1a: mov dword ptr [rdi + rax*8 + 0x17b24], ecx
0x1007bcc21: mov ecx, dword ptr [rsi + 0x74]
0x1007bcc24: mov dword ptr [rdi + rax*8 + 0x17b28], ecx
0x1007bcc2b: mov cl, byte ptr [rsi + 0x85]
0x1007bcc31: mov byte ptr [rdi + rax*8 + 0x17b39], cl
0x1007bcc38: mov cl, byte ptr [rsi + 0x84]
0x1007bcc3e: mov byte ptr [rdi + rax*8 + 0x17b38], cl
0x1007bcc45: mov cl, byte ptr [rsi + 0x86]
0x1007bcc4b: mov byte ptr [rdi + rax*8 + 0x17b3a], cl
0x1007bcc52: mov cl, byte ptr [rsi + 0x87]
0x1007bcc58: mov byte ptr [rdi + rax*8 + 0x17b3b], cl
0x1007bcc5f: mov ecx, dword ptr [rsi + 0x80]
0x1007bcc65: mov dword ptr [rdi + rax*8 + 0x17b34], ecx
0x1007bcc6c: mov rcx, qword ptr [rsi + 0x78]
0x1007bcc70: mov qword ptr [rdi + rax*8 + 0x17b2c], rcx
0x1007bcc78: mov eax, dword ptr [rdi + 0x18724]
0x1007bcc7e: lea r10d, [rax + 1]
0x1007bcc82: lea r9d, [rax + 2]
0x1007bcc86: shl rax, 4
0x1007bcc8a: mov dword ptr [rdi + rax + 0x18728], 4
0x1007bcc95: lea ecx, [r8 + 1]
0x1007bcc99: mov dword ptr [rdi + 0x17b20], ecx
0x1007bcc9f: mov dword ptr [rdi + rax + 0x1872c], r8d
0x1007bcca7: mov qword ptr [rdi + rax + 0x18730], 0
0x1007bccb3: mov dword ptr [rdi + 0x18724], r9d
0x1007bccba: shl r10, 4
0x1007bccbe: mov dword ptr [rdi + r10 + 0x18728], 5
0x1007bccca: mov dword ptr [rdi + r10 + 0x1872c], edx
0x1007bccd2: mov qword ptr [rdi + r10 + 0x18730], 0
0x1007bccde: mov eax, dword ptr [rdi + 0x15788]
0x1007bcce4: lea ecx, [rax + 1]
0x1007bcce7: mov dword ptr [rdi + 0x15788], ecx
0x1007bcced: imul rax, rax, 0x88
0x1007bccf4: mov dword ptr [rdi + rax + 0x1578c], edx
0x1007bccfb: mov ecx, dword ptr [rdi]
0x1007bccfd: dec ecx
0x1007bccff: mov dword ptr [rdi + rax + 0x15790], ecx
0x1007bcd06: mov cl, byte ptr [rsi + 0x86]
0x1007bcd0c: mov byte ptr [rdi + rax + 0x15804], cl
0x1007bcd13: mov cl, byte ptr [rsi + 0x87]
0x1007bcd19: mov byte ptr [rdi + rax + 0x15805], cl
0x1007bcd20: mov ecx, dword ptr [rsi + 0x80]
0x1007bcd26: mov dword ptr [rdi + rax + 0x15810], ecx
0x1007bcd2d: mov rcx, qword ptr [rsi + 0x78]
0x1007bcd31: mov qword ptr [rdi + rax + 0x15808], rcx
0x1007bcd39: vmovups xmm0, xmmword ptr [rsi + 4]
0x1007bcd3e: vmovups xmm1, xmmword ptr [rsi + 0x10]
0x1007bcd43: vmovups xmmword ptr [rdi + rax + 0x157a0], xmm1
0x1007bcd4c: vmovups xmmword ptr [rdi + rax + 0x15794], xmm0
0x1007bcd55: vmovups xmm0, xmmword ptr [rsi + 0x20]
0x1007bcd5a: vmovups xmm1, xmmword ptr [rsi + 0x2c]
0x1007bcd5f: vmovups xmmword ptr [rdi + rax + 0x157bc], xmm1
0x1007bcd68: vmovups xmmword ptr [rdi + rax + 0x157b0], xmm0
0x1007bcd71: vmovups xmm0, xmmword ptr [rsi + 0x3c]
0x1007bcd76: vmovups xmm1, xmmword ptr [rsi + 0x48]
0x1007bcd7b: vmovups xmmword ptr [rdi + rax + 0x157d8], xmm1
0x1007bcd84: vmovups xmmword ptr [rdi + rax + 0x157cc], xmm0
0x1007bcd8d: vmovups xmm0, xmmword ptr [rsi + 0x58]
0x1007bcd92: vmovups xmm1, xmmword ptr [rsi + 0x64]
0x1007bcd97: vmovups xmmword ptr [rdi + rax + 0x157e8], xmm0
0x1007bcda0: vmovups xmmword ptr [rdi + rax + 0x157f4], xmm1
0x1007bcda9: ret 
0x1007bcdaa: push rbp
0x1007bcdab: mov rbp, rsp
0x1007bcdae: lea rdi, [rip + 0x3e6e65] ; 0x100ba3c1a m_activePassType == kGpuPassType_Render
0x1007bcdb5: lea rsi, [rip + 0x3e6b9f] ; 0x100ba395b RenderOutline.cpp
0x1007bcdbc: lea r8, [rip + 0x3e6e7f] ; 0x100ba3c42 AddRenderList can only be called added during a RenderPass. Call AddRenderPass() first.
0x1007bcdc3: mov edx, 0xee
0x1007bcdc8: mov ecx, 4
0x1007bcdcd: xor eax, eax
0x1007bcdcf: call 0x1007e6030 ; 0x1007e6030
0x1007bcdd4: ud2 
0x1007bcdd6: nop word ptr cs:[rax + rax]
