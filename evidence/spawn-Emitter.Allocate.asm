0x1002de850: push rbp
0x1002de851: mov rbp, rsp
0x1002de854: mov rax, qword ptr [rdi]
0x1002de857: test rax, rax
0x1002de85a: je 0x1002de8b1
0x1002de85c: cmp qword ptr [rax + 0x10], -1
0x1002de861: jne 0x1002de8d9
0x1002de863: mov rcx, qword ptr [rax + 8]
0x1002de867: mov qword ptr [rdi], rcx
0x1002de86a: cmp qword ptr [rax + 0x10], -1
0x1002de86f: jne 0x1002de8f8
0x1002de875: mov rcx, qword ptr [rax + 0x18]
0x1002de879: test rcx, rcx
0x1002de87c: je 0x1002de917
0x1002de882: lea rdx, [rax + 8]
0x1002de886: mov rsi, qword ptr [rcx + 8]
0x1002de88a: mov qword ptr [rax + 8], rsi
0x1002de88e: mov qword ptr [rax + 0x10], 0
0x1002de896: mov rsi, qword ptr [rcx + 8]
0x1002de89a: add rdx, -8
0x1002de89e: test rsi, rsi
0x1002de8a1: je 0x1002de8ab
0x1002de8a3: mov qword ptr [rsi + 0x10], rdx
0x1002de8a7: mov rcx, qword ptr [rax + 0x18]
0x1002de8ab: mov qword ptr [rcx + 8], rdx
0x1002de8af: pop rbp
0x1002de8b0: ret 
0x1002de8b1: lea rdi, [rip + 0x8a0f3d] ; 0x100b7f7f5 freeHead
0x1002de8b8: lea rsi, [rip + 0x8a0f13] ; 0x100b7f7d2 ../../../Code/Base/FreeListMixin.h
0x1002de8bf: lea r8, [rip + 0x8a0f38] ; 0x100b7f7fe Freelist empty
0x1002de8c6: mov edx, 0x8b
0x1002de8cb: mov ecx, 4
0x1002de8d0: xor eax, eax
0x1002de8d2: call 0x1007e6030 ; 0x1007e6030
0x1002de8d7: ud2 
0x1002de8d9: lea rdi, [rip + 0x8a0f2d] ; 0x100b7f80d freeHead->m_IsFree()
0x1002de8e0: lea rsi, [rip + 0x8a0eeb] ; 0x100b7f7d2 ../../../Code/Base/FreeListMixin.h
0x1002de8e7: mov edx, 0x8c
0x1002de8ec: mov ecx, 3
0x1002de8f1: call 0x1007e5f70 ; 0x1007e5f70
0x1002de8f6: ud2 
0x1002de8f8: lea rdi, [rip + 0x8a0f23] ; 0x100b7f822 m_IsFree()
0x1002de8ff: lea rsi, [rip + 0x8a0ecc] ; 0x100b7f7d2 ../../../Code/Base/FreeListMixin.h
0x1002de906: mov edx, 0x74
0x1002de90b: mov ecx, 3
0x1002de910: call 0x1007e5f70 ; 0x1007e5f70
0x1002de915: ud2 
0x1002de917: lea rdi, [rip + 0x8a0f0f] ; 0x100b7f82d head
0x1002de91e: lea rsi, [rip + 0x8a0ead] ; 0x100b7f7d2 ../../../Code/Base/FreeListMixin.h
0x1002de925: mov edx, 0x75
0x1002de92a: mov ecx, 3
0x1002de92f: call 0x1007e5f70 ; 0x1007e5f70
0x1002de934: ud2 
0x1002de936: nop word ptr cs:[rax + rax]
