0x10076a360: push rbp
0x10076a361: mov rbp, rsp
0x10076a364: push r14
0x10076a366: push rbx
0x10076a367: mov rbx, rsi
0x10076a36a: mov r14, rdi
0x10076a36d: mov edx, 4
0x10076a372: call 0x10076a0a0 ; 0x10076a0a0
0x10076a377: vmovss xmm0, dword ptr [rbx]
0x10076a37b: vucomiss xmm0, xmm0
0x10076a37f: jnp 0x10076a38d
0x10076a381: cmp byte ptr [r14 + 0x30], 1
0x10076a386: je 0x10076a3e2
0x10076a388: mov byte ptr [r14 + 8], 0
0x10076a38d: lea rsi, [rbx + 4]
0x10076a391: mov edx, 4
0x10076a396: mov rdi, r14
0x10076a399: call 0x10076a0a0 ; 0x10076a0a0
0x10076a39e: vmovss xmm0, dword ptr [rbx + 4]
0x10076a3a3: vucomiss xmm0, xmm0
0x10076a3a7: jnp 0x10076a3b5
0x10076a3a9: cmp byte ptr [r14 + 0x30], 1
0x10076a3ae: je 0x10076a3e2
0x10076a3b0: mov byte ptr [r14 + 8], 0
0x10076a3b5: lea rsi, [rbx + 8]
0x10076a3b9: mov edx, 4
0x10076a3be: mov rdi, r14
0x10076a3c1: call 0x10076a0a0 ; 0x10076a0a0
0x10076a3c6: vmovss xmm0, dword ptr [rbx + 8]
0x10076a3cb: vucomiss xmm0, xmm0
0x10076a3cf: jnp 0x10076a3dd
0x10076a3d1: cmp byte ptr [r14 + 0x30], 1
0x10076a3d6: je 0x10076a3e2
0x10076a3d8: mov byte ptr [r14 + 8], 0
0x10076a3dd: pop rbx
0x10076a3de: pop r14
0x10076a3e0: pop rbp
0x10076a3e1: ret 
0x10076a3e2: lea rdi, [rip + 0x433be9] ; 0x100b9dfd2 !m_assert
0x10076a3e9: lea rsi, [rip + 0x433bd1] ; 0x100b9dfc1 BinaryStream.cpp
0x10076a3f0: lea r8, [rip + 0x433ce1] ; 0x100b9e0d8 Serialized nan
0x10076a3f7: mov edx, 0x138
0x10076a3fc: mov ecx, 4
0x10076a401: xor eax, eax
0x10076a403: call 0x1007e6030 ; 0x1007e6030
0x10076a408: ud2 
0x10076a40a: nop word ptr [rax + rax]
