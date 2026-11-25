0x100096b60: push rbp
0x100096b61: mov rbp, rsp
0x100096b64: push r14
0x100096b66: push rbx
0x100096b67: cmp esi, 2
0x100096b6a: je 0x100096ba2
0x100096b6c: cmp esi, 1
0x100096b6f: je 0x100096b8a
0x100096b71: test esi, esi
0x100096b73: jne 0x100096bd7
0x100096b75: lea r10, [rdi + 0x18]
0x100096b79: add rdi, 8
0x100096b7d: mov r9d, 0x97
0x100096b83: cmp r9d, edx
0x100096b86: jge 0x100096bd7
0x100096b88: jmp 0x100096bb8 ; 0x100096bb8
0x100096b8a: lea r10, [rdi + 0x4298]
0x100096b91: add rdi, 0xc
0x100096b95: mov r9d, 0xf
0x100096b9b: cmp r9d, edx
0x100096b9e: jge 0x100096bd7
0x100096ba0: jmp 0x100096bb8 ; 0x100096bb8
0x100096ba2: lea r10, [rdi + 0x4998]
0x100096ba9: add rdi, 0x10
0x100096bad: mov r9d, 0x18
0x100096bb3: cmp r9d, edx
0x100096bb6: jge 0x100096bd7
0x100096bb8: lea rdi, [rip + 0xacf10e] ; 0x100b65ccd referenceCount <= max - 1
0x100096bbf: lea rsi, [rip + 0xacea2e] ; 0x100b655f4 AnimationInstance.cpp
0x100096bc6: mov edx, 0x929
0x100096bcb: mov ecx, 3
0x100096bd0: call 0x1007e5f70 ; 0x1007e5f70
0x100096bd5: ud2 
0x100096bd7: mov esi, dword ptr [rdi]
0x100096bd9: lea eax, [rsi + rdx]
0x100096bdc: cmp eax, r9d
0x100096bdf: jle 0x100096d1b
0x100096be5: lea r8, [r10 + 0xbf]
0x100096bec: vmovss xmm0, dword ptr [rip + 0xa12a80] ; 0x100aa9674
0x100096bf4: nop word ptr cs:[rax + rax]
0x100096c00: test esi, esi
0x100096c02: jle 0x100096d23
0x100096c08: mov ebx, esi
0x100096c0a: mov r11d, ebx
0x100096c0d: and r11d, 1
0x100096c11: cmp esi, 1
0x100096c14: jne 0x100096c30
0x100096c16: mov r14d, 0xffffffff
0x100096c1c: xor eax, eax
0x100096c1e: vmovaps xmm1, xmm0
0x100096c22: test r11, r11
0x100096c25: jne 0x100096c98
0x100096c27: jmp 0x100096cb0 ; 0x100096cb0
0x100096c2c: nop dword ptr [rax]
0x100096c30: sub rbx, r11
0x100096c33: mov r14d, 0xffffffff
0x100096c39: mov rcx, r8
0x100096c3c: xor eax, eax
0x100096c3e: vmovaps xmm1, xmm0
0x100096c42: nop word ptr cs:[rax + rax]
0x100096c50: cmp byte ptr [rcx - 0x70], 0
0x100096c54: je 0x100096c6b
0x100096c56: vmovss xmm2, dword ptr [rcx - 0xab]
0x100096c5e: vucomiss xmm1, xmm2
0x100096c62: jbe 0x100096c6b
0x100096c64: mov r14d, eax
0x100096c67: vmovaps xmm1, xmm2
0x100096c6b: cmp byte ptr [rcx], 0
0x100096c6e: je 0x100096c83
0x100096c70: vmovss xmm2, dword ptr [rcx - 0x3b]
0x100096c75: vucomiss xmm1, xmm2
0x100096c79: jbe 0x100096c83
0x100096c7b: lea r14d, [rax + 1]
0x100096c7f: vmovaps xmm1, xmm2
0x100096c83: add rax, 2
0x100096c87: add rcx, 0xe0
0x100096c8e: cmp rbx, rax
0x100096c91: jne 0x100096c50
0x100096c93: test r11, r11
0x100096c96: je 0x100096cb0
0x100096c98: imul rcx, rax, 0x70
0x100096c9c: cmp byte ptr [r10 + rcx + 0x4f], 0
0x100096ca2: je 0x100096cb0
0x100096ca4: vucomiss xmm1, dword ptr [r10 + rcx + 0x14]
0x100096cab: jbe 0x100096cb0
0x100096cad: mov r14d, eax
0x100096cb0: cmp r14d, -1
0x100096cb4: je 0x100096d23
0x100096cb6: dec esi
0x100096cb8: mov dword ptr [rdi], esi
0x100096cba: cmp r14d, esi
0x100096cbd: jge 0x100096d0f
0x100096cbf: movsxd rax, r14d
0x100096cc2: imul rcx, rax, 0x70
0x100096cc6: add rcx, r10
0x100096cc9: nop dword ptr [rax]
0x100096cd0: inc rax
0x100096cd3: vmovups ymm1, ymmword ptr [rcx + 0x70]
0x100096cd8: vmovups ymm2, ymmword ptr [rcx + 0x90]
0x100096ce0: vmovups ymm3, ymmword ptr [rcx + 0xb0]
0x100096ce8: vmovups ymm4, ymmword ptr [rcx + 0xc0]
0x100096cf0: vmovups ymmword ptr [rcx + 0x50], ymm4
0x100096cf5: vmovups ymmword ptr [rcx + 0x40], ymm3
0x100096cfa: vmovups ymmword ptr [rcx + 0x20], ymm2
0x100096cff: vmovups ymmword ptr [rcx], ymm1
0x100096d03: lea rcx, [rcx + 0x70]
0x100096d07: movsxd rsi, dword ptr [rdi]
0x100096d0a: cmp rax, rsi
0x100096d0d: jl 0x100096cd0
0x100096d0f: lea eax, [rsi + rdx]
0x100096d12: cmp eax, r9d
0x100096d15: jg 0x100096c00
0x100096d1b: pop rbx
0x100096d1c: pop r14
0x100096d1e: pop rbp
0x100096d1f: vzeroupper 
0x100096d22: ret 
0x100096d23: lea rdi, [rip + 0xacefbd] ; 0x100b65ce7 bestIndex != -1
0x100096d2a: lea rsi, [rip + 0xace8c3] ; 0x100b655f4 AnimationInstance.cpp
0x100096d31: mov edx, 0x936
0x100096d36: mov ecx, 3
0x100096d3b: vzeroupper 
0x100096d3e: call 0x1007e5f70 ; 0x1007e5f70
0x100096d43: ud2 
0x100096d45: nop word ptr cs:[rax + rax]
